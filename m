Content-Type: multipart/mixed; boundary="===============4851992602545671777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] btrfs: Use btrfs_try_lock_balance in btrfs_ioctl_balance
Date: Wed, 04 May 2022 14:20:48 +0800
Message-ID: <202205041423.NVVJIHSj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4851992602545671777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220503083637.1051023-3-nborisov@suse.com>
References: <20220503083637.1051023-3-nborisov@suse.com>
TO: Nikolay Borisov <nborisov@suse.com>
TO: linux-btrfs(a)vger.kernel.org
CC: Nikolay Borisov <nborisov@suse.com>

Hi Nikolay,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20220503]
[cannot apply to v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikolay-Borisov/Refa=
ctor-btrfs_ioctl_balance/20220503-163837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-m021-20220502 (https://download.01.org/0day-ci/arch=
ive/20220504/202205041423.NVVJIHSj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/ioctl.c:4493 btrfs_ioctl_balance() error: double free of 'bargs'

vim +/bargs +4493 fs/btrfs/ioctl.c

d383145190e87f Nikolay Borisov      2022-05-03  4402  =

9ba1f6e44ed7a1 Liu Bo               2012-05-11  4403  static long btrfs_ioc=
tl_balance(struct file *file, void __user *arg)
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4404  {
496ad9aa8ef448 Al Viro              2013-01-23  4405  	struct btrfs_root *r=
oot =3D BTRFS_I(file_inode(file))->root;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4406  	struct btrfs_fs_info=
 *fs_info =3D root->fs_info;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4407  	struct btrfs_ioctl_b=
alance_args *bargs;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4408  	struct btrfs_balance=
_control *bctl;
c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4409  	bool need_unlock =3D=
 true; /* for mut. excl. ops lock */
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4410  	int ret;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4411  =

c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4412  	if (!capable(CAP_SYS=
_ADMIN))
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4413  		return -EPERM;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4414  =

e54bfa31044d60 Liu Bo               2012-06-29  4415  	ret =3D mnt_want_wri=
te_file(file);
9ba1f6e44ed7a1 Liu Bo               2012-05-11  4416  	if (ret)
9ba1f6e44ed7a1 Liu Bo               2012-05-11  4417  		return ret;
9ba1f6e44ed7a1 Liu Bo               2012-05-11  4418  =

c746db1b6ed99f Nikolay Borisov      2022-03-30  4419  	bargs =3D memdup_use=
r(arg, sizeof(*bargs));
c746db1b6ed99f Nikolay Borisov      2022-03-30  4420  	if (IS_ERR(bargs)) {
c746db1b6ed99f Nikolay Borisov      2022-03-30  4421  		ret =3D PTR_ERR(bar=
gs);
c746db1b6ed99f Nikolay Borisov      2022-03-30  4422  		bargs =3D NULL;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4423  		goto out;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4424  	}
c746db1b6ed99f Nikolay Borisov      2022-03-30  4425  =

c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4426  	ret =3D btrfs_try_lo=
ck_balance(fs_info, &need_unlock);
c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4427  	if (ret)
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4428  		goto out;
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4429  =

c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4430  	lockdep_assert_held(=
&fs_info->balance_mutex);
c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4431  =

de322263d3a6d4 Ilya Dryomov         2012-01-16  4432  	if (bargs->flags & B=
TRFS_BALANCE_RESUME) {
de322263d3a6d4 Ilya Dryomov         2012-01-16  4433  		if (!fs_info->balan=
ce_ctl) {
de322263d3a6d4 Ilya Dryomov         2012-01-16  4434  			ret =3D -ENOTCONN;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4435  			goto out_unlock;
de322263d3a6d4 Ilya Dryomov         2012-01-16  4436  		}
de322263d3a6d4 Ilya Dryomov         2012-01-16  4437  =

de322263d3a6d4 Ilya Dryomov         2012-01-16  4438  		bctl =3D fs_info->b=
alance_ctl;
de322263d3a6d4 Ilya Dryomov         2012-01-16  4439  		spin_lock(&fs_info-=
>balance_lock);
de322263d3a6d4 Ilya Dryomov         2012-01-16  4440  		bctl->flags |=3D BT=
RFS_BALANCE_RESUME;
de322263d3a6d4 Ilya Dryomov         2012-01-16  4441  		spin_unlock(&fs_inf=
o->balance_lock);
efc0e69c2feab8 Nikolay Borisov      2021-11-25  4442  		btrfs_exclop_balanc=
e(fs_info, BTRFS_EXCLOP_BALANCE);
de322263d3a6d4 Ilya Dryomov         2012-01-16  4443  =

de322263d3a6d4 Ilya Dryomov         2012-01-16  4444  		goto do_balance;
de322263d3a6d4 Ilya Dryomov         2012-01-16  4445  	}
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4446  =

c746db1b6ed99f Nikolay Borisov      2022-03-30  4447  	if (bargs->flags & ~=
(BTRFS_BALANCE_ARGS_MASK | BTRFS_BALANCE_TYPE_MASK)) {
c746db1b6ed99f Nikolay Borisov      2022-03-30  4448  		ret =3D -EINVAL;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4449  		goto out_unlock;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4450  	}
c746db1b6ed99f Nikolay Borisov      2022-03-30  4451  =

ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4452  	if (fs_info->balance=
_ctl) {
837d5b6e46d1a4 Ilya Dryomov         2012-01-16  4453  		ret =3D -EINPROGRES=
S;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4454  		goto out_unlock;
837d5b6e46d1a4 Ilya Dryomov         2012-01-16  4455  	}
837d5b6e46d1a4 Ilya Dryomov         2012-01-16  4456  =

8d2db7855e7b65 David Sterba         2015-11-04  4457  	bctl =3D kzalloc(siz=
eof(*bctl), GFP_KERNEL);
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4458  	if (!bctl) {
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4459  		ret =3D -ENOMEM;
c746db1b6ed99f Nikolay Borisov      2022-03-30  4460  		goto out_unlock;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4461  	}
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4462  =

c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4463  	memcpy(&bctl->data, =
&bargs->data, sizeof(bctl->data));
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4464  	memcpy(&bctl->meta, =
&bargs->meta, sizeof(bctl->meta));
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4465  	memcpy(&bctl->sys, &=
bargs->sys, sizeof(bctl->sys));
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4466  =

c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4467  	bctl->flags =3D barg=
s->flags;
de322263d3a6d4 Ilya Dryomov         2012-01-16  4468  do_balance:
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4469  	/*
c3e1f96c37d0f8 Goldwyn Rodrigues    2020-08-25  4470  	 * Ownership of bctl=
 and exclusive operation goes to btrfs_balance.
c3e1f96c37d0f8 Goldwyn Rodrigues    2020-08-25  4471  	 * bctl is freed in =
reset_balance_state, or, if restriper was paused
c3e1f96c37d0f8 Goldwyn Rodrigues    2020-08-25  4472  	 * all the way until=
 unmount, in free_fs_info.  The flag should be
c3e1f96c37d0f8 Goldwyn Rodrigues    2020-08-25  4473  	 * cleared after res=
et_balance_state.
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4474  	 */
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4475  	need_unlock =3D fals=
e;
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4476  =

6fcf6e2bffb6cf David Sterba         2018-05-07  4477  	ret =3D btrfs_balanc=
e(fs_info, bctl, bargs);
0f89abf56abbd0 Christian Engelmayer 2015-10-21  4478  	bctl =3D NULL;
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4479  =

70430fe3604144 Nikolay Borisov      2022-03-30  4480  	if (ret =3D=3D 0 || =
ret =3D=3D -ECANCELED) {
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4481  		if (copy_to_user(ar=
g, bargs, sizeof(*bargs)))
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4482  			ret =3D -EFAULT;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4483  	}
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4484  =

0f89abf56abbd0 Christian Engelmayer 2015-10-21  4485  	kfree(bctl);
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4486  out_unlock:
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4487  	mutex_unlock(&fs_inf=
o->balance_mutex);
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4488  	if (need_unlock)
c3e1f96c37d0f8 Goldwyn Rodrigues    2020-08-25  4489  		btrfs_exclop_finish=
(fs_info);
ed0fb78fb6aa29 Ilya Dryomov         2013-01-20  4490  out:
c696e46e6ec2b3 Nikolay Borisov      2022-05-03  4491  	kfree(bargs);
e54bfa31044d60 Liu Bo               2012-06-29  4492  	mnt_drop_write_file(=
file);
c746db1b6ed99f Nikolay Borisov      2022-03-30 @4493  	kfree(bargs);
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4494  	return ret;
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4495  }
c9e9f97bdfb64d Ilya Dryomov         2012-01-16  4496  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4851992602545671777==--

