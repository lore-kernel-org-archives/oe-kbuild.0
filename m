Content-Type: multipart/mixed; boundary="===============4063541170178955836=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded 5/7] fs/btrfs/send.c:7705 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7492)
Date: Wed, 16 Mar 2022 19:53:45 +0800
Message-ID: <202203161918.YLLxVWCm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4063541170178955836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Omar Sandoval <osandov@osandov.com>
CC: linux-kernel(a)vger.kernel.org
TO: Omar Sandoval <osandov@fb.com>
CC: Nikolay Borisov <nborisov@suse.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded
head:   5b9ba5f160f0ee412cf4d94f8e15b54b1ba04758
commit: e11574dd48a2e1674f9d65592595283a9284115e [5/7] btrfs: send: allocat=
e send buffer with alloc_page() and vmap() for v2
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001-20220314 (https://download.01.org/0day-ci/ar=
chive/20220316/202203161918.YLLxVWCm-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/send.c:7705 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7492)

vim +7705 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  7387  =

9ad1230533efb6 Sahil Kang                2022-01-15  7388  long btrfs_ioctl=
_send(struct inode *inode, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  7389  {
31db9f7c23fbf7 Alexander Block           2012-07-25  7390  	int ret =3D 0;
9ad1230533efb6 Sahil Kang                2022-01-15  7391  	struct btrfs_ro=
ot *send_root =3D BTRFS_I(inode)->root;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7392  	struct btrfs_fs=
_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  7393  	struct btrfs_ro=
ot *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  7394  	struct send_ctx=
 *sctx =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7395  	u32 i;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7396  	u32 send_buf_nu=
m_pages =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7397  	u64 *clone_sour=
ces_tmp =3D NULL;
2c68653787f91c David Sterba              2013-12-16  7398  	int clone_sourc=
es_to_rollback =3D 0;
bae12df966f0e1 Denis Efremov             2020-09-21  7399  	size_t alloc_si=
ze;
896c14f97f700a Wang Shilong              2014-01-07  7400  	int sort_clone_=
roots =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7401  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7402  	if (!capable(CA=
P_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  7403  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7404  =

2c68653787f91c David Sterba              2013-12-16  7405  	/*
2c68653787f91c David Sterba              2013-12-16  7406  	 * The subvolum=
e must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  7407  	 * making it RW=
. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  7408  	 */
2c68653787f91c David Sterba              2013-12-16  7409  	spin_lock(&send=
_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7410  	if (btrfs_root_=
readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7411  		dedupe_in_prog=
ress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7412  		spin_unlock(&s=
end_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7413  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7414  	}
2c68653787f91c David Sterba              2013-12-16  7415  	send_root->send=
_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7416  	spin_unlock(&se=
nd_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7417  =

2c68653787f91c David Sterba              2013-12-16  7418  	/*
2c68653787f91c David Sterba              2013-12-16  7419  	 * Userspace to=
ols do the checks and warn the user if it's
2c68653787f91c David Sterba              2013-12-16  7420  	 * not RO.
2c68653787f91c David Sterba              2013-12-16  7421  	 */
2c68653787f91c David Sterba              2013-12-16  7422  	if (!btrfs_root=
_readonly(send_root)) {
2c68653787f91c David Sterba              2013-12-16  7423  		ret =3D -EPERM;
2c68653787f91c David Sterba              2013-12-16  7424  		goto out;
2c68653787f91c David Sterba              2013-12-16  7425  	}
2c68653787f91c David Sterba              2013-12-16  7426  =

457ae7268b29c3 Dan Carpenter             2017-03-17  7427  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  7428  	 * Check that w=
e don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  7429  	 * clone_source=
s_count + 1 items, and compare to unsigned long inside
457ae7268b29c3 Dan Carpenter             2017-03-17  7430  	 * access_ok.
457ae7268b29c3 Dan Carpenter             2017-03-17  7431  	 */
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7432  	if (arg->clone_=
sources_count >
457ae7268b29c3 Dan Carpenter             2017-03-17  7433  	    ULONG_MAX /=
 sizeof(struct clone_root) - 1) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7434  		ret =3D -EINVA=
L;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7435  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7436  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7437  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7438  	if (arg->flags =
& ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7439  		ret =3D -EINVA=
L;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7440  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7441  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7442  =

e780b0d1c1523e David Sterba              2016-01-18  7443  	sctx =3D kzallo=
c(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7444  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7445  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7446  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7447  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7448  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7449  	INIT_LIST_HEAD(=
&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  7450  	INIT_LIST_HEAD(=
&sctx->deleted_refs);
e780b0d1c1523e David Sterba              2016-01-18  7451  	INIT_RADIX_TREE=
(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7452  	INIT_LIST_HEAD(=
&sctx->name_cache_list);
31db9f7c23fbf7 Alexander Block           2012-07-25  7453  =

cb95e7bf7ba481 Mark Fasheh               2013-02-04  7454  	sctx->flags =3D=
 arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7455  =

e77fbf990316d4 David Sterba              2021-10-22  7456  	if (arg->flags =
& BTRFS_SEND_FLAG_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  7457  		if (arg->versi=
on > BTRFS_SEND_STREAM_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  7458  			ret =3D -EPRO=
TO;
e77fbf990316d4 David Sterba              2021-10-22  7459  			goto out;
e77fbf990316d4 David Sterba              2021-10-22  7460  		}
e77fbf990316d4 David Sterba              2021-10-22  7461  		/* Zero means =
"use the highest version" */
e77fbf990316d4 David Sterba              2021-10-22  7462  		sctx->proto =
=3D arg->version ?: BTRFS_SEND_STREAM_VERSION;
e77fbf990316d4 David Sterba              2021-10-22  7463  	} else {
e77fbf990316d4 David Sterba              2021-10-22  7464  		sctx->proto =
=3D 1;
e77fbf990316d4 David Sterba              2021-10-22  7465  	}
e77fbf990316d4 David Sterba              2021-10-22  7466  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7467  	sctx->send_filp=
 =3D fget(arg->send_fd);
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7468  	if (!sctx->send=
_filp) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7469  		ret =3D -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  7470  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7471  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7472  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7473  	sctx->send_root=
 =3D send_root;
521e0546c970c3 David Sterba              2014-04-15  7474  	/*
521e0546c970c3 David Sterba              2014-04-15  7475  	 * Unlikely but=
 possible, if the subvolume is marked for deletion but
521e0546c970c3 David Sterba              2014-04-15  7476  	 * is slow to r=
emove the directory entry, send can still be started
521e0546c970c3 David Sterba              2014-04-15  7477  	 */
521e0546c970c3 David Sterba              2014-04-15  7478  	if (btrfs_root_=
dead(sctx->send_root)) {
521e0546c970c3 David Sterba              2014-04-15  7479  		ret =3D -EPERM;
521e0546c970c3 David Sterba              2014-04-15  7480  		goto out;
521e0546c970c3 David Sterba              2014-04-15  7481  	}
521e0546c970c3 David Sterba              2014-04-15  7482  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7483  	sctx->clone_roo=
ts_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  7484  =

bed783710857f5 Omar Sandoval             2020-05-13  7485  	if (sctx->proto=
 >=3D 2) {
bed783710857f5 Omar Sandoval             2020-05-13  7486  		sctx->send_max=
_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
bed783710857f5 Omar Sandoval             2020-05-13  7487  					    PAGE_SI=
ZE);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7488  		send_buf_num_p=
ages =3D sctx->send_max_size >> PAGE_SHIFT;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7489  		sctx->send_buf=
_pages =3D kcalloc(send_buf_num_pages,
e11574dd48a2e1 Omar Sandoval             2020-05-01  7490  					       size=
of(*sctx->send_buf_pages),
e11574dd48a2e1 Omar Sandoval             2020-05-01  7491  					       GFP_=
KERNEL);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7492  		if (!sctx->sen=
d_buf_pages) {
e11574dd48a2e1 Omar Sandoval             2020-05-01  7493  			send_buf_num_=
pages =3D 0;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7494  			ret =3D -ENOM=
EM;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7495  			goto out;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7496  		}
e11574dd48a2e1 Omar Sandoval             2020-05-01  7497  		for (i =3D 0; =
i < send_buf_num_pages; i++) {
e11574dd48a2e1 Omar Sandoval             2020-05-01  7498  			sctx->send_bu=
f_pages[i] =3D alloc_page(GFP_KERNEL);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7499  			if (!sctx->se=
nd_buf_pages[i]) {
e11574dd48a2e1 Omar Sandoval             2020-05-01  7500  				ret =3D -ENO=
MEM;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7501  				goto out;
e11574dd48a2e1 Omar Sandoval             2020-05-01  7502  			}
e11574dd48a2e1 Omar Sandoval             2020-05-01  7503  		}
e11574dd48a2e1 Omar Sandoval             2020-05-01  7504  		sctx->send_buf=
 =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
e11574dd48a2e1 Omar Sandoval             2020-05-01  7505  				      VM_MAP=
, PAGE_KERNEL);
bed783710857f5 Omar Sandoval             2020-05-13  7506  	} else {
6136b03819c025 Omar Sandoval             2020-05-12  7507  		sctx->send_max=
_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  7508  		sctx->send_buf=
 =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7509  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7510  	if (!sctx->send=
_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7511  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7512  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7513  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7514  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7515  	sctx->pending_d=
ir_moves =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7516  	sctx->waiting_d=
ir_moves =3D RB_ROOT;
9dc442143b9874 Filipe Manana             2014-02-19  7517  	sctx->orphan_di=
rs =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7518  =

bae12df966f0e1 Denis Efremov             2020-09-21  7519  	sctx->clone_roo=
ts =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1 Denis Efremov             2020-09-21  7520  				     arg->cl=
one_sources_count + 1,
bae12df966f0e1 Denis Efremov             2020-09-21  7521  				     GFP_KER=
NEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7522  	if (!sctx->clon=
e_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7523  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7524  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7525  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7526  =

bae12df966f0e1 Denis Efremov             2020-09-21  7527  	alloc_size =3D =
array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  7528  				arg->clone_s=
ources_count);
e55d1153dbf484 David Sterba              2016-04-11  7529  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7530  	if (arg->clone_=
sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  7531  		clone_sources_=
tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7532  		if (!clone_sou=
rces_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7533  			ret =3D -ENOM=
EM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7534  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7535  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7536  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7537  		ret =3D copy_f=
rom_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  7538  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  7539  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7540  			ret =3D -EFAU=
LT;
31db9f7c23fbf7 Alexander Block           2012-07-25  7541  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7542  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7543  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7544  		for (i =3D 0; =
i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  7545  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  7546  						clone_sour=
ces_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  7547  			if (IS_ERR(cl=
one_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7548  				ret =3D PTR_=
ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7549  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7550  			}
2c68653787f91c David Sterba              2013-12-16  7551  			spin_lock(&cl=
one_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  7552  			if (!btrfs_ro=
ot_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  7553  			    btrfs_roo=
t_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  7554  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7555  				btrfs_put_ro=
ot(clone_root);
2c68653787f91c David Sterba              2013-12-16  7556  				ret =3D -EPE=
RM;
2c68653787f91c David Sterba              2013-12-16  7557  				goto out;
2c68653787f91c David Sterba              2013-12-16  7558  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  7559  			if (clone_roo=
t->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7560  				dedupe_in_pr=
ogress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7561  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7562  				btrfs_put_ro=
ot(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7563  				ret =3D -EAG=
AIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7564  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7565  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  7566  			clone_root->s=
end_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7567  			spin_unlock(&=
clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  7568  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7569  			sctx->clone_r=
oots[i].root =3D clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  7570  			clone_sources=
_to_rollback =3D i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7571  		}
2f91306a378099 David Sterba              2016-04-11  7572  		kvfree(clone_s=
ources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7573  		clone_sources_=
tmp =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7574  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7575  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7576  	if (arg->parent=
_root) {
56e9357a1e8167 David Sterba              2020-05-15  7577  		sctx->parent_r=
oot =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  7578  						      true=
);
b1b195969fe6d9 Stefan Behrens            2013-05-13  7579  		if (IS_ERR(sct=
x->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  7580  			ret =3D PTR_E=
RR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7581  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7582  		}
18f687d5384493 Wang Shilong              2014-01-07  7583  =

2c68653787f91c David Sterba              2013-12-16  7584  		spin_lock(&sct=
x->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7585  		sctx->parent_r=
oot->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  7586  		if (!btrfs_roo=
t_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  7587  				btrfs_root_d=
ead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  7588  			spin_unlock(&=
sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7589  			ret =3D -EPER=
M;
2c68653787f91c David Sterba              2013-12-16  7590  			goto out;
2c68653787f91c David Sterba              2013-12-16  7591  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  7592  		if (sctx->pare=
nt_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7593  			dedupe_in_pro=
gress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7594  			spin_unlock(&=
sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7595  			ret =3D -EAGA=
IN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7596  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7597  		}
2c68653787f91c David Sterba              2013-12-16  7598  		spin_unlock(&s=
ctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7599  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7600  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7601  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  7602  	 * Clones from =
send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  7603  	 * is behind th=
e current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  7604  	 * for possible=
 clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  7605  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  7606  	sctx->clone_roo=
ts[sctx->clone_roots_cnt++].root =3D
0024652895e347 Josef Bacik               2020-01-24  7607  		btrfs_grab_roo=
t(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7608  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7609  	/* We do a bsea=
rch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  7610  	sort(sctx->clon=
e_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  7611  			sizeof(*sctx-=
>clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  7612  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  7613  	sort_clone_root=
s =3D 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7614  =

9f89d5de8631c7 Filipe Manana             2019-04-15  7615  	ret =3D flush_d=
elalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  7616  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  7617  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  7618  =

e5fa8f865b3324 Filipe Manana             2014-10-21  7619  	ret =3D ensure_=
commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  7620  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  7621  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  7622  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7623  	ret =3D send_su=
bvol(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7624  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7625  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7626  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7627  	if (!(sctx->fla=
gs & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7628  		ret =3D begin_=
cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  7629  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7630  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7631  		ret =3D send_c=
md(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7632  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7633  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  7634  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7635  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7636  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7637  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7638  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7639  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7640  		struct pending=
_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7641  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7642  		n =3D rb_first=
(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7643  		pm =3D rb_entr=
y(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7644  		while (!list_e=
mpty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7645  			struct pendin=
g_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7646  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7647  			pm2 =3D list_=
first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7648  					       stru=
ct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7649  			free_pending_=
move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7650  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7651  		free_pending_m=
ove(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7652  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7653  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7654  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7655  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7656  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7657  		struct waiting=
_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7658  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7659  		n =3D rb_first=
(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7660  		dm =3D rb_entr=
y(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7661  		rb_erase(&dm->=
node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7662  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7663  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7664  =

9dc442143b9874 Filipe Manana             2014-02-19  7665  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19  7666  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  7667  		struct rb_node=
 *n;
9dc442143b9874 Filipe Manana             2014-02-19  7668  		struct orphan_=
dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  7669  =

9dc442143b9874 Filipe Manana             2014-02-19  7670  		n =3D rb_first=
(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  7671  		odi =3D rb_ent=
ry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  7672  		free_orphan_di=
r_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  7673  	}
9dc442143b9874 Filipe Manana             2014-02-19  7674  =

896c14f97f700a Wang Shilong              2014-01-07  7675  	if (sort_clone_=
roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7676  		for (i =3D 0; =
i < sctx->clone_roots_cnt; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7677  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7678  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7679  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7680  		}
896c14f97f700a Wang Shilong              2014-01-07  7681  	} else {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7682  		for (i =3D 0; =
sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7683  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7684  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7685  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7686  		}
896c14f97f700a Wang Shilong              2014-01-07  7687  =

896c14f97f700a Wang Shilong              2014-01-07  7688  		btrfs_root_dec=
_send_in_progress(send_root);
896c14f97f700a Wang Shilong              2014-01-07  7689  	}
6f9a3da5da9e7e Josef Bacik               2020-01-24  7690  	if (sctx && !IS=
_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e David Sterba              2013-12-17  7691  		btrfs_root_dec=
_send_in_progress(sctx->parent_root);
0024652895e347 Josef Bacik               2020-01-24  7692  		btrfs_put_root=
(sctx->parent_root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7693  	}
2c68653787f91c David Sterba              2013-12-16  7694  =

2f91306a378099 David Sterba              2016-04-11  7695  	kvfree(clone_so=
urces_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7696  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7697  	if (sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7698  		if (sctx->send=
_filp)
31db9f7c23fbf7 Alexander Block           2012-07-25  7699  			fput(sctx->se=
nd_filp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7700  =

c03d01f3404282 David Sterba              2016-04-11  7701  		kvfree(sctx->c=
lone_roots);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7702  		if (sctx->prot=
o >=3D 2) {
e11574dd48a2e1 Omar Sandoval             2020-05-01  7703  			vunmap(sctx->=
send_buf);
e11574dd48a2e1 Omar Sandoval             2020-05-01  7704  			for (i =3D 0;=
 i < send_buf_num_pages; i++) {
e11574dd48a2e1 Omar Sandoval             2020-05-01 @7705  				if (sctx->se=
nd_buf_pages[i])

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4063541170178955836==--

