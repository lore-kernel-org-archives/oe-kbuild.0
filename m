Content-Type: multipart/mixed; boundary="===============5454056802403857791=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded 12/14] fs/btrfs/send.c:7539 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7312)
Date: Fri, 12 Nov 2021 21:45:36 +0800
Message-ID: <202111122126.YmtoCMh1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5454056802403857791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Omar Sandoval <osandov@osandov.com>
CC: linux-kernel(a)vger.kernel.org
TO: Omar Sandoval <osandov@fb.com>
CC: Nikolay Borisov <nborisov@suse.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded
head:   b460af84b8ddd4fd78e02fec6272b70326b87861
commit: 7fc49b82d8d6e143a20b6a2243a520ec34e7cdd6 [12/14] btrfs: send: alloc=
ate send buffer with alloc_page() and vmap() for v2
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20211025 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/send.c:7539 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7312)

vim +7539 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  7218  =

2351f431f72722 Josef Bacik               2017-09-27  7219  long btrfs_ioctl=
_send(struct file *mnt_file, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  7220  {
31db9f7c23fbf7 Alexander Block           2012-07-25  7221  	int ret =3D 0;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7222  	struct btrfs_ro=
ot *send_root =3D BTRFS_I(file_inode(mnt_file))->root;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7223  	struct btrfs_fs=
_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  7224  	struct btrfs_ro=
ot *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  7225  	struct send_ctx=
 *sctx =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7226  	u32 i;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7227  	u32 send_buf_nu=
m_pages =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7228  	u64 *clone_sour=
ces_tmp =3D NULL;
2c68653787f91c David Sterba              2013-12-16  7229  	int clone_sourc=
es_to_rollback =3D 0;
bae12df966f0e1 Denis Efremov             2020-09-21  7230  	size_t alloc_si=
ze;
896c14f97f700a Wang Shilong              2014-01-07  7231  	int sort_clone_=
roots =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7232  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7233  	if (!capable(CA=
P_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  7234  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7235  =

2c68653787f91c David Sterba              2013-12-16  7236  	/*
2c68653787f91c David Sterba              2013-12-16  7237  	 * The subvolum=
e must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  7238  	 * making it RW=
. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  7239  	 */
2c68653787f91c David Sterba              2013-12-16  7240  	spin_lock(&send=
_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7241  	if (btrfs_root_=
readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7242  		dedupe_in_prog=
ress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7243  		spin_unlock(&s=
end_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7244  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7245  	}
2c68653787f91c David Sterba              2013-12-16  7246  	send_root->send=
_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7247  	spin_unlock(&se=
nd_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7248  =

2c68653787f91c David Sterba              2013-12-16  7249  	/*
2c68653787f91c David Sterba              2013-12-16  7250  	 * Userspace to=
ols do the checks and warn the user if it's
2c68653787f91c David Sterba              2013-12-16  7251  	 * not RO.
2c68653787f91c David Sterba              2013-12-16  7252  	 */
2c68653787f91c David Sterba              2013-12-16  7253  	if (!btrfs_root=
_readonly(send_root)) {
2c68653787f91c David Sterba              2013-12-16  7254  		ret =3D -EPERM;
2c68653787f91c David Sterba              2013-12-16  7255  		goto out;
2c68653787f91c David Sterba              2013-12-16  7256  	}
2c68653787f91c David Sterba              2013-12-16  7257  =

457ae7268b29c3 Dan Carpenter             2017-03-17  7258  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  7259  	 * Check that w=
e don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  7260  	 * clone_source=
s_count + 1 items, and compare to unsigned long inside
457ae7268b29c3 Dan Carpenter             2017-03-17  7261  	 * access_ok.
457ae7268b29c3 Dan Carpenter             2017-03-17  7262  	 */
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7263  	if (arg->clone_=
sources_count >
457ae7268b29c3 Dan Carpenter             2017-03-17  7264  	    ULONG_MAX /=
 sizeof(struct clone_root) - 1) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7265  		ret =3D -EINVA=
L;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7266  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7267  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7268  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7269  	if (arg->flags =
& ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7270  		ret =3D -EINVA=
L;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7271  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7272  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7273  =

e780b0d1c1523e David Sterba              2016-01-18  7274  	sctx =3D kzallo=
c(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7275  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7276  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7277  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7278  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7279  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7280  	INIT_LIST_HEAD(=
&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  7281  	INIT_LIST_HEAD(=
&sctx->deleted_refs);
e780b0d1c1523e David Sterba              2016-01-18  7282  	INIT_RADIX_TREE=
(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7283  	INIT_LIST_HEAD(=
&sctx->name_cache_list);
31db9f7c23fbf7 Alexander Block           2012-07-25  7284  =

cb95e7bf7ba481 Mark Fasheh               2013-02-04  7285  	sctx->flags =3D=
 arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7286  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7287  	sctx->send_filp=
 =3D fget(arg->send_fd);
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7288  	if (!sctx->send=
_filp) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7289  		ret =3D -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  7290  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7291  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7292  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7293  	sctx->send_root=
 =3D send_root;
521e0546c970c3 David Sterba              2014-04-15  7294  	/*
521e0546c970c3 David Sterba              2014-04-15  7295  	 * Unlikely but=
 possible, if the subvolume is marked for deletion but
521e0546c970c3 David Sterba              2014-04-15  7296  	 * is slow to r=
emove the directory entry, send can still be started
521e0546c970c3 David Sterba              2014-04-15  7297  	 */
521e0546c970c3 David Sterba              2014-04-15  7298  	if (btrfs_root_=
dead(sctx->send_root)) {
521e0546c970c3 David Sterba              2014-04-15  7299  		ret =3D -EPERM;
521e0546c970c3 David Sterba              2014-04-15  7300  		goto out;
521e0546c970c3 David Sterba              2014-04-15  7301  	}
521e0546c970c3 David Sterba              2014-04-15  7302  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7303  	sctx->clone_roo=
ts_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  7304  =

4732c37b0f5233 Omar Sandoval             2020-05-13  7305  	if (sctx->flags=
 & BTRFS_SEND_FLAG_STREAM_V2) {
4732c37b0f5233 Omar Sandoval             2020-05-13  7306  		sctx->send_max=
_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
4732c37b0f5233 Omar Sandoval             2020-05-13  7307  					    PAGE_SI=
ZE);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7308  		send_buf_num_p=
ages =3D sctx->send_max_size >> PAGE_SHIFT;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7309  		sctx->send_buf=
_pages =3D kcalloc(send_buf_num_pages,
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7310  					       size=
of(*sctx->send_buf_pages),
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7311  					       GFP_=
KERNEL);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7312  		if (!sctx->sen=
d_buf_pages) {
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7313  			send_buf_num_=
pages =3D 0;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7314  			ret =3D -ENOM=
EM;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7315  			goto out;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7316  		}
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7317  		for (i =3D 0; =
i < send_buf_num_pages; i++) {
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7318  			sctx->send_bu=
f_pages[i] =3D alloc_page(GFP_KERNEL);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7319  			if (!sctx->se=
nd_buf_pages[i]) {
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7320  				ret =3D -ENO=
MEM;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7321  				goto out;
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7322  			}
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7323  		}
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7324  		sctx->send_buf=
 =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7325  				      VM_MAP=
, PAGE_KERNEL);
4732c37b0f5233 Omar Sandoval             2020-05-13  7326  	} else {
7dd79a590b49b8 Omar Sandoval             2020-05-12  7327  		sctx->send_max=
_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  7328  		sctx->send_buf=
 =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7329  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7330  	if (!sctx->send=
_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7331  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7332  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7333  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7334  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7335  	sctx->pending_d=
ir_moves =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7336  	sctx->waiting_d=
ir_moves =3D RB_ROOT;
9dc442143b9874 Filipe Manana             2014-02-19  7337  	sctx->orphan_di=
rs =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7338  =

bae12df966f0e1 Denis Efremov             2020-09-21  7339  	sctx->clone_roo=
ts =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1 Denis Efremov             2020-09-21  7340  				     arg->cl=
one_sources_count + 1,
bae12df966f0e1 Denis Efremov             2020-09-21  7341  				     GFP_KER=
NEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7342  	if (!sctx->clon=
e_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7343  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7344  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7345  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7346  =

bae12df966f0e1 Denis Efremov             2020-09-21  7347  	alloc_size =3D =
array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  7348  				arg->clone_s=
ources_count);
e55d1153dbf484 David Sterba              2016-04-11  7349  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7350  	if (arg->clone_=
sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  7351  		clone_sources_=
tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7352  		if (!clone_sou=
rces_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7353  			ret =3D -ENOM=
EM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7354  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7355  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7356  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7357  		ret =3D copy_f=
rom_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  7358  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  7359  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7360  			ret =3D -EFAU=
LT;
31db9f7c23fbf7 Alexander Block           2012-07-25  7361  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7362  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7363  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7364  		for (i =3D 0; =
i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  7365  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  7366  						clone_sour=
ces_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  7367  			if (IS_ERR(cl=
one_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7368  				ret =3D PTR_=
ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7369  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7370  			}
2c68653787f91c David Sterba              2013-12-16  7371  			spin_lock(&cl=
one_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  7372  			if (!btrfs_ro=
ot_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  7373  			    btrfs_roo=
t_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  7374  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7375  				btrfs_put_ro=
ot(clone_root);
2c68653787f91c David Sterba              2013-12-16  7376  				ret =3D -EPE=
RM;
2c68653787f91c David Sterba              2013-12-16  7377  				goto out;
2c68653787f91c David Sterba              2013-12-16  7378  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  7379  			if (clone_roo=
t->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7380  				dedupe_in_pr=
ogress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7381  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7382  				btrfs_put_ro=
ot(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7383  				ret =3D -EAG=
AIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7384  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7385  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  7386  			clone_root->s=
end_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7387  			spin_unlock(&=
clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  7388  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7389  			sctx->clone_r=
oots[i].root =3D clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  7390  			clone_sources=
_to_rollback =3D i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7391  		}
2f91306a378099 David Sterba              2016-04-11  7392  		kvfree(clone_s=
ources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7393  		clone_sources_=
tmp =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7394  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7395  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7396  	if (arg->parent=
_root) {
56e9357a1e8167 David Sterba              2020-05-15  7397  		sctx->parent_r=
oot =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  7398  						      true=
);
b1b195969fe6d9 Stefan Behrens            2013-05-13  7399  		if (IS_ERR(sct=
x->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  7400  			ret =3D PTR_E=
RR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7401  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7402  		}
18f687d5384493 Wang Shilong              2014-01-07  7403  =

2c68653787f91c David Sterba              2013-12-16  7404  		spin_lock(&sct=
x->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7405  		sctx->parent_r=
oot->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  7406  		if (!btrfs_roo=
t_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  7407  				btrfs_root_d=
ead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  7408  			spin_unlock(&=
sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7409  			ret =3D -EPER=
M;
2c68653787f91c David Sterba              2013-12-16  7410  			goto out;
2c68653787f91c David Sterba              2013-12-16  7411  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  7412  		if (sctx->pare=
nt_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7413  			dedupe_in_pro=
gress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7414  			spin_unlock(&=
sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7415  			ret =3D -EAGA=
IN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7416  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7417  		}
2c68653787f91c David Sterba              2013-12-16  7418  		spin_unlock(&s=
ctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7419  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7420  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7421  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  7422  	 * Clones from =
send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  7423  	 * is behind th=
e current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  7424  	 * for possible=
 clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  7425  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  7426  	sctx->clone_roo=
ts[sctx->clone_roots_cnt++].root =3D
0024652895e347 Josef Bacik               2020-01-24  7427  		btrfs_grab_roo=
t(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7428  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7429  	/* We do a bsea=
rch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  7430  	sort(sctx->clon=
e_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  7431  			sizeof(*sctx-=
>clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  7432  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  7433  	sort_clone_root=
s =3D 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7434  =

9f89d5de8631c7 Filipe Manana             2019-04-15  7435  	ret =3D flush_d=
elalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  7436  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  7437  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  7438  =

e5fa8f865b3324 Filipe Manana             2014-10-21  7439  	ret =3D ensure_=
commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  7440  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  7441  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  7442  =

1cea5cf0e66429 Filipe Manana             2021-06-21  7443  	spin_lock(&fs_i=
nfo->send_reloc_lock);
1cea5cf0e66429 Filipe Manana             2021-06-21  7444  	if (test_bit(BT=
RFS_FS_RELOC_RUNNING, &fs_info->flags)) {
1cea5cf0e66429 Filipe Manana             2021-06-21  7445  		spin_unlock(&f=
s_info->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7446  		btrfs_warn_rl(=
fs_info,
1cea5cf0e66429 Filipe Manana             2021-06-21  7447  		"cannot run se=
nd because a relocation operation is in progress");
9e967495e0e0ae Filipe Manana             2019-04-22  7448  		ret =3D -EAGAI=
N;
9e967495e0e0ae Filipe Manana             2019-04-22  7449  		goto out;
9e967495e0e0ae Filipe Manana             2019-04-22  7450  	}
9e967495e0e0ae Filipe Manana             2019-04-22  7451  	fs_info->send_i=
n_progress++;
1cea5cf0e66429 Filipe Manana             2021-06-21  7452  	spin_unlock(&fs=
_info->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7453  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7454  	ret =3D send_su=
bvol(sctx);
1cea5cf0e66429 Filipe Manana             2021-06-21  7455  	spin_lock(&fs_i=
nfo->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7456  	fs_info->send_i=
n_progress--;
1cea5cf0e66429 Filipe Manana             2021-06-21  7457  	spin_unlock(&fs=
_info->send_reloc_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7458  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7459  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7460  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7461  	if (!(sctx->fla=
gs & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7462  		ret =3D begin_=
cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  7463  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7464  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7465  		ret =3D send_c=
md(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7466  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7467  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  7468  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7469  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7470  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7471  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7472  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7473  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7474  		struct pending=
_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7475  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7476  		n =3D rb_first=
(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7477  		pm =3D rb_entr=
y(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7478  		while (!list_e=
mpty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7479  			struct pendin=
g_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7480  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7481  			pm2 =3D list_=
first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7482  					       stru=
ct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7483  			free_pending_=
move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7484  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7485  		free_pending_m=
ove(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7486  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7487  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7488  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7489  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7490  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7491  		struct waiting=
_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7492  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7493  		n =3D rb_first=
(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7494  		dm =3D rb_entr=
y(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7495  		rb_erase(&dm->=
node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7496  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7497  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7498  =

9dc442143b9874 Filipe Manana             2014-02-19  7499  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19  7500  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  7501  		struct rb_node=
 *n;
9dc442143b9874 Filipe Manana             2014-02-19  7502  		struct orphan_=
dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  7503  =

9dc442143b9874 Filipe Manana             2014-02-19  7504  		n =3D rb_first=
(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  7505  		odi =3D rb_ent=
ry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  7506  		free_orphan_di=
r_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  7507  	}
9dc442143b9874 Filipe Manana             2014-02-19  7508  =

896c14f97f700a Wang Shilong              2014-01-07  7509  	if (sort_clone_=
roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7510  		for (i =3D 0; =
i < sctx->clone_roots_cnt; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7511  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7512  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7513  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7514  		}
896c14f97f700a Wang Shilong              2014-01-07  7515  	} else {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7516  		for (i =3D 0; =
sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7517  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7518  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7519  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7520  		}
896c14f97f700a Wang Shilong              2014-01-07  7521  =

896c14f97f700a Wang Shilong              2014-01-07  7522  		btrfs_root_dec=
_send_in_progress(send_root);
896c14f97f700a Wang Shilong              2014-01-07  7523  	}
6f9a3da5da9e7e Josef Bacik               2020-01-24  7524  	if (sctx && !IS=
_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e David Sterba              2013-12-17  7525  		btrfs_root_dec=
_send_in_progress(sctx->parent_root);
0024652895e347 Josef Bacik               2020-01-24  7526  		btrfs_put_root=
(sctx->parent_root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7527  	}
2c68653787f91c David Sterba              2013-12-16  7528  =

2f91306a378099 David Sterba              2016-04-11  7529  	kvfree(clone_so=
urces_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7530  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7531  	if (sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7532  		if (sctx->send=
_filp)
31db9f7c23fbf7 Alexander Block           2012-07-25  7533  			fput(sctx->se=
nd_filp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7534  =

c03d01f3404282 David Sterba              2016-04-11  7535  		kvfree(sctx->c=
lone_roots);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7536  		if (sctx->flag=
s & BTRFS_SEND_FLAG_STREAM_V2) {
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7537  			vunmap(sctx->=
send_buf);
7fc49b82d8d6e1 Omar Sandoval             2020-05-01  7538  			for (i =3D 0;=
 i < send_buf_num_pages; i++) {
7fc49b82d8d6e1 Omar Sandoval             2020-05-01 @7539  				if (sctx->se=
nd_buf_pages[i])

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5454056802403857791==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5454056802403857791==--

