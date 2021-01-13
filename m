Content-Type: multipart/mixed; boundary="===============7062220538813881747=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded 13/15] fs/btrfs/send.c:7506 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7277)
Date: Wed, 13 Jan 2021 08:06:30 +0800
Message-ID: <202101130821.PhuxqUlw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7062220538813881747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Omar Sandoval <osandov@osandov.com>
TO: Omar Sandoval <osandov@fb.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded
head:   13342ab655c1ecc88634938f716739afe532e018
commit: fceda93fdf5c2d004144fea8d9a6e74ca287bc81 [13/15] btrfs: send: alloc=
ate send buffer with alloc_page() and vmap() for v2
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-m021-20210112 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/send.c:7506 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7277)

Old smatch warnings:
fs/btrfs/send.c:7479 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>clone_roots' could be null (see line 7307)

vim +7506 fs/btrfs/send.c

62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7183  =

2351f431f727223b Josef Bacik               2017-09-27  7184  long btrfs_ioc=
tl_send(struct file *mnt_file, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7185  {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7186  	int ret =3D 0;
0b246afa62b0cf5b Jeff Mahoney              2016-06-22  7187  	struct btrfs_=
root *send_root =3D BTRFS_I(file_inode(mnt_file))->root;
0b246afa62b0cf5b Jeff Mahoney              2016-06-22  7188  	struct btrfs_=
fs_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7189  	struct btrfs_=
root *clone_root;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7190  	struct send_c=
tx *sctx =3D NULL;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7191  	u32 i;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7192  	u32 send_buf_=
num_pages =3D 0;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7193  	u64 *clone_so=
urces_tmp =3D NULL;
2c68653787f91c62 David Sterba              2013-12-16  7194  	int clone_sou=
rces_to_rollback =3D 0;
bae12df966f0e1a9 Denis Efremov             2020-09-21  7195  	size_t alloc_=
size;
896c14f97f700aec Wang Shilong              2014-01-07  7196  	int sort_clon=
e_roots =3D 0;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7197  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7198  	if (!capable(=
CAP_SYS_ADMIN))
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7199  		return -EPER=
M;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7200  =

2c68653787f91c62 David Sterba              2013-12-16  7201  	/*
2c68653787f91c62 David Sterba              2013-12-16  7202  	 * The subvol=
ume must remain read-only during send, protect against
521e0546c970c3d8 David Sterba              2014-04-15  7203  	 * making it =
RW. This also protects against deletion.
2c68653787f91c62 David Sterba              2013-12-16  7204  	 */
2c68653787f91c62 David Sterba              2013-12-16  7205  	spin_lock(&se=
nd_root->root_item_lock);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7206  	if (btrfs_roo=
t_readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7207  		dedupe_in_pr=
ogress_warn(send_root);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7208  		spin_unlock(=
&send_root->root_item_lock);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7209  		return -EAGA=
IN;
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7210  	}
2c68653787f91c62 David Sterba              2013-12-16  7211  	send_root->se=
nd_in_progress++;
2c68653787f91c62 David Sterba              2013-12-16  7212  	spin_unlock(&=
send_root->root_item_lock);
2c68653787f91c62 David Sterba              2013-12-16  7213  =

2c68653787f91c62 David Sterba              2013-12-16  7214  	/*
2c68653787f91c62 David Sterba              2013-12-16  7215  	 * Userspace =
tools do the checks and warn the user if it's
2c68653787f91c62 David Sterba              2013-12-16  7216  	 * not RO.
2c68653787f91c62 David Sterba              2013-12-16  7217  	 */
2c68653787f91c62 David Sterba              2013-12-16  7218  	if (!btrfs_ro=
ot_readonly(send_root)) {
2c68653787f91c62 David Sterba              2013-12-16  7219  		ret =3D -EPE=
RM;
2c68653787f91c62 David Sterba              2013-12-16  7220  		goto out;
2c68653787f91c62 David Sterba              2013-12-16  7221  	}
2c68653787f91c62 David Sterba              2013-12-16  7222  =

457ae7268b29c33d Dan Carpenter             2017-03-17  7223  	/*
457ae7268b29c33d Dan Carpenter             2017-03-17  7224  	 * Check that=
 we don't overflow at later allocations, we request
457ae7268b29c33d Dan Carpenter             2017-03-17  7225  	 * clone_sour=
ces_count + 1 items, and compare to unsigned long inside
457ae7268b29c33d Dan Carpenter             2017-03-17  7226  	 * access_ok.
457ae7268b29c33d Dan Carpenter             2017-03-17  7227  	 */
f5ecec3ce21f706e Dan Carpenter             2016-04-13  7228  	if (arg->clon=
e_sources_count >
457ae7268b29c33d Dan Carpenter             2017-03-17  7229  	    ULONG_MAX=
 / sizeof(struct clone_root) - 1) {
f5ecec3ce21f706e Dan Carpenter             2016-04-13  7230  		ret =3D -EIN=
VAL;
f5ecec3ce21f706e Dan Carpenter             2016-04-13  7231  		goto out;
f5ecec3ce21f706e Dan Carpenter             2016-04-13  7232  	}
f5ecec3ce21f706e Dan Carpenter             2016-04-13  7233  =

c2c71324ecb471c9 Stefan Behrens            2013-04-10  7234  	if (arg->flag=
s & ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7235  		ret =3D -EIN=
VAL;
cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7236  		goto out;
cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7237  	}
cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7238  =

e780b0d1c1523ec8 David Sterba              2016-01-18  7239  	sctx =3D kzal=
loc(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7240  	if (!sctx) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7241  		ret =3D -ENO=
MEM;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7242  		goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7243  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7244  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7245  	INIT_LIST_HEA=
D(&sctx->new_refs);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7246  	INIT_LIST_HEA=
D(&sctx->deleted_refs);
e780b0d1c1523ec8 David Sterba              2016-01-18  7247  	INIT_RADIX_TR=
EE(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7248  	INIT_LIST_HEA=
D(&sctx->name_cache_list);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7249  =

cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7250  	sctx->flags =
=3D arg->flags;
cb95e7bf7ba481c3 Mark Fasheh               2013-02-04  7251  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7252  	sctx->send_fi=
lp =3D fget(arg->send_fd);
ecc7ada77b5cd1ac Tsutomu Itoh              2013-04-19  7253  	if (!sctx->se=
nd_filp) {
ecc7ada77b5cd1ac Tsutomu Itoh              2013-04-19  7254  		ret =3D -EBA=
DF;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7255  		goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7256  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7257  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7258  	sctx->send_ro=
ot =3D send_root;
521e0546c970c3d8 David Sterba              2014-04-15  7259  	/*
521e0546c970c3d8 David Sterba              2014-04-15  7260  	 * Unlikely b=
ut possible, if the subvolume is marked for deletion but
521e0546c970c3d8 David Sterba              2014-04-15  7261  	 * is slow to=
 remove the directory entry, send can still be started
521e0546c970c3d8 David Sterba              2014-04-15  7262  	 */
521e0546c970c3d8 David Sterba              2014-04-15  7263  	if (btrfs_roo=
t_dead(sctx->send_root)) {
521e0546c970c3d8 David Sterba              2014-04-15  7264  		ret =3D -EPE=
RM;
521e0546c970c3d8 David Sterba              2014-04-15  7265  		goto out;
521e0546c970c3d8 David Sterba              2014-04-15  7266  	}
521e0546c970c3d8 David Sterba              2014-04-15  7267  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7268  	sctx->clone_r=
oots_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7269  =

527e1b901ebf681f Omar Sandoval             2020-05-13  7270  	if (sctx->fla=
gs & BTRFS_SEND_FLAG_STREAM_V2) {
527e1b901ebf681f Omar Sandoval             2020-05-13  7271  		sctx->send_m=
ax_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
527e1b901ebf681f Omar Sandoval             2020-05-13  7272  					    PAGE_=
SIZE);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7273  		send_buf_num=
_pages =3D sctx->send_max_size >> PAGE_SHIFT;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7274  		sctx->send_b=
uf_pages =3D kcalloc(send_buf_num_pages,
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7275  					       si=
zeof(*sctx->send_buf_pages),
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7276  					       GF=
P_KERNEL);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7277  		if (!sctx->s=
end_buf_pages) {
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7278  			send_buf_nu=
m_pages =3D 0;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7279  			ret =3D -EN=
OMEM;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7280  			goto out;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7281  		}
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7282  		for (i =3D 0=
; i < send_buf_num_pages; i++) {
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7283  			sctx->send_=
buf_pages[i] =3D alloc_page(GFP_KERNEL);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7284  			if (!sctx->=
send_buf_pages[i]) {
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7285  				ret =3D -E=
NOMEM;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7286  				goto out;
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7287  			}
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7288  		}
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7289  		sctx->send_b=
uf =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7290  				      VM_M=
AP, PAGE_KERNEL);
527e1b901ebf681f Omar Sandoval             2020-05-13  7291  	} else {
0e6394e07a53f9aa Omar Sandoval             2020-05-12  7292  		sctx->send_m=
ax_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d03 Michal Hocko              2017-05-08  7293  		sctx->send_b=
uf =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7294  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7295  	if (!sctx->se=
nd_buf) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7296  		ret =3D -ENO=
MEM;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7297  		goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7298  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7299  =

9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7300  	sctx->pending=
_dir_moves =3D RB_ROOT;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7301  	sctx->waiting=
_dir_moves =3D RB_ROOT;
9dc442143b9874ba Filipe Manana             2014-02-19  7302  	sctx->orphan_=
dirs =3D RB_ROOT;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7303  =

bae12df966f0e1a9 Denis Efremov             2020-09-21  7304  	sctx->clone_r=
oots =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1a9 Denis Efremov             2020-09-21  7305  				     arg->=
clone_sources_count + 1,
bae12df966f0e1a9 Denis Efremov             2020-09-21  7306  				     GFP_K=
ERNEL);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7307  	if (!sctx->cl=
one_roots) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7308  		ret =3D -ENO=
MEM;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7309  		goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7310  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7311  =

bae12df966f0e1a9 Denis Efremov             2020-09-21  7312  	alloc_size =
=3D array_size(sizeof(*arg->clone_sources),
bae12df966f0e1a9 Denis Efremov             2020-09-21  7313  				arg->clone=
_sources_count);
e55d1153dbf48485 David Sterba              2016-04-11  7314  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7315  	if (arg->clon=
e_sources_count) {
752ade68cbd81d03 Michal Hocko              2017-05-08  7316  		clone_source=
s_tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7317  		if (!clone_s=
ources_tmp) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7318  			ret =3D -EN=
OMEM;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7319  			goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7320  		}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7321  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7322  		ret =3D copy=
_from_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf48485 David Sterba              2016-04-11  7323  				alloc_size=
);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7324  		if (ret) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7325  			ret =3D -EF=
AULT;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7326  			goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7327  		}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7328  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7329  		for (i =3D 0=
; i < arg->clone_sources_count; i++) {
56e9357a1e816713 David Sterba              2020-05-15  7330  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e816713 David Sterba              2020-05-15  7331  						clone_so=
urces_tmp[i], true);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7332  			if (IS_ERR(=
clone_root)) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7333  				ret =3D PT=
R_ERR(clone_root);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7334  				goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7335  			}
2c68653787f91c62 David Sterba              2013-12-16  7336  			spin_lock(&=
clone_root->root_item_lock);
5cc2b17e80cf5770 Filipe Manana             2015-03-02  7337  			if (!btrfs_=
root_readonly(clone_root) ||
5cc2b17e80cf5770 Filipe Manana             2015-03-02  7338  			    btrfs_r=
oot_dead(clone_root)) {
2c68653787f91c62 David Sterba              2013-12-16  7339  				spin_unloc=
k(&clone_root->root_item_lock);
0024652895e3479c Josef Bacik               2020-01-24  7340  				btrfs_put_=
root(clone_root);
2c68653787f91c62 David Sterba              2013-12-16  7341  				ret =3D -E=
PERM;
2c68653787f91c62 David Sterba              2013-12-16  7342  				goto out;
2c68653787f91c62 David Sterba              2013-12-16  7343  			}
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7344  			if (clone_r=
oot->dedupe_in_progress) {
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7345  				dedupe_in_=
progress_warn(clone_root);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7346  				spin_unloc=
k(&clone_root->root_item_lock);
0024652895e3479c Josef Bacik               2020-01-24  7347  				btrfs_put_=
root(clone_root);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7348  				ret =3D -E=
AGAIN;
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7349  				goto out;
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7350  			}
2f1f465ae6da2440 Filipe Manana             2015-03-02  7351  			clone_root-=
>send_in_progress++;
2c68653787f91c62 David Sterba              2013-12-16  7352  			spin_unlock=
(&clone_root->root_item_lock);
18f687d538449373 Wang Shilong              2014-01-07  7353  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7354  			sctx->clone=
_roots[i].root =3D clone_root;
2f1f465ae6da2440 Filipe Manana             2015-03-02  7355  			clone_sourc=
es_to_rollback =3D i + 1;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7356  		}
2f91306a37809907 David Sterba              2016-04-11  7357  		kvfree(clone=
_sources_tmp);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7358  		clone_source=
s_tmp =3D NULL;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7359  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7360  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7361  	if (arg->pare=
nt_root) {
56e9357a1e816713 David Sterba              2020-05-15  7362  		sctx->parent=
_root =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e816713 David Sterba              2020-05-15  7363  						      tr=
ue);
b1b195969fe6d936 Stefan Behrens            2013-05-13  7364  		if (IS_ERR(s=
ctx->parent_root)) {
b1b195969fe6d936 Stefan Behrens            2013-05-13  7365  			ret =3D PTR=
_ERR(sctx->parent_root);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7366  			goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7367  		}
18f687d538449373 Wang Shilong              2014-01-07  7368  =

2c68653787f91c62 David Sterba              2013-12-16  7369  		spin_lock(&s=
ctx->parent_root->root_item_lock);
2c68653787f91c62 David Sterba              2013-12-16  7370  		sctx->parent=
_root->send_in_progress++;
521e0546c970c3d8 David Sterba              2014-04-15  7371  		if (!btrfs_r=
oot_readonly(sctx->parent_root) ||
521e0546c970c3d8 David Sterba              2014-04-15  7372  				btrfs_root=
_dead(sctx->parent_root)) {
2c68653787f91c62 David Sterba              2013-12-16  7373  			spin_unlock=
(&sctx->parent_root->root_item_lock);
2c68653787f91c62 David Sterba              2013-12-16  7374  			ret =3D -EP=
ERM;
2c68653787f91c62 David Sterba              2013-12-16  7375  			goto out;
2c68653787f91c62 David Sterba              2013-12-16  7376  		}
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7377  		if (sctx->pa=
rent_root->dedupe_in_progress) {
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7378  			dedupe_in_p=
rogress_warn(sctx->parent_root);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7379  			spin_unlock=
(&sctx->parent_root->root_item_lock);
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7380  			ret =3D -EA=
GAIN;
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7381  			goto out;
62d54f3a7fa27ef6 Filipe Manana             2019-04-22  7382  		}
2c68653787f91c62 David Sterba              2013-12-16  7383  		spin_unlock(=
&sctx->parent_root->root_item_lock);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7384  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7385  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7386  	/*
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7387  	 * Clones fro=
m send_root are allowed, but only if the clone source
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7388  	 * is behind =
the current send position. This is checked while searching
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7389  	 * for possib=
le clone sources.
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7390  	 */
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7391  	sctx->clone_r=
oots[sctx->clone_roots_cnt++].root =3D
0024652895e3479c Josef Bacik               2020-01-24  7392  		btrfs_grab_r=
oot(sctx->send_root);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7393  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7394  	/* We do a bs=
earch later */
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7395  	sort(sctx->cl=
one_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7396  			sizeof(*sct=
x->clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7397  			NULL);
896c14f97f700aec Wang Shilong              2014-01-07  7398  	sort_clone_ro=
ots =3D 1;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7399  =

9f89d5de8631c793 Filipe Manana             2019-04-15  7400  	ret =3D flush=
_delalloc_roots(sctx);
9f89d5de8631c793 Filipe Manana             2019-04-15  7401  	if (ret)
9f89d5de8631c793 Filipe Manana             2019-04-15  7402  		goto out;
9f89d5de8631c793 Filipe Manana             2019-04-15  7403  =

e5fa8f865b3324ae Filipe Manana             2014-10-21  7404  	ret =3D ensur=
e_commit_roots_uptodate(sctx);
e5fa8f865b3324ae Filipe Manana             2014-10-21  7405  	if (ret)
e5fa8f865b3324ae Filipe Manana             2014-10-21  7406  		goto out;
e5fa8f865b3324ae Filipe Manana             2014-10-21  7407  =

9e967495e0e0ae8b Filipe Manana             2019-04-22  7408  	mutex_lock(&f=
s_info->balance_mutex);
9e967495e0e0ae8b Filipe Manana             2019-04-22  7409  	if (test_bit(=
BTRFS_FS_BALANCE_RUNNING, &fs_info->flags)) {
9e967495e0e0ae8b Filipe Manana             2019-04-22  7410  		mutex_unlock=
(&fs_info->balance_mutex);
9e967495e0e0ae8b Filipe Manana             2019-04-22  7411  		btrfs_warn_r=
l(fs_info,
9e967495e0e0ae8b Filipe Manana             2019-04-22  7412  		"cannot run =
send because a balance operation is in progress");
9e967495e0e0ae8b Filipe Manana             2019-04-22  7413  		ret =3D -EAG=
AIN;
9e967495e0e0ae8b Filipe Manana             2019-04-22  7414  		goto out;
9e967495e0e0ae8b Filipe Manana             2019-04-22  7415  	}
9e967495e0e0ae8b Filipe Manana             2019-04-22  7416  	fs_info->send=
_in_progress++;
9e967495e0e0ae8b Filipe Manana             2019-04-22  7417  	mutex_unlock(=
&fs_info->balance_mutex);
9e967495e0e0ae8b Filipe Manana             2019-04-22  7418  =

2755a0de64693501 David Sterba              2014-07-31  7419  	current->jour=
nal_info =3D BTRFS_SEND_TRANS_STUB;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7420  	ret =3D send_=
subvol(sctx);
a26e8c9f75b0bfd8 Josef Bacik               2014-03-28  7421  	current->jour=
nal_info =3D NULL;
9e967495e0e0ae8b Filipe Manana             2019-04-22  7422  	mutex_lock(&f=
s_info->balance_mutex);
9e967495e0e0ae8b Filipe Manana             2019-04-22  7423  	fs_info->send=
_in_progress--;
9e967495e0e0ae8b Filipe Manana             2019-04-22  7424  	mutex_unlock(=
&fs_info->balance_mutex);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7425  	if (ret < 0)
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7426  		goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7427  =

c2c71324ecb471c9 Stefan Behrens            2013-04-10  7428  	if (!(sctx->f=
lags & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7429  		ret =3D begi=
n_cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7430  		if (ret < 0)
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7431  			goto out;
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7432  		ret =3D send=
_cmd(sctx);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7433  		if (ret < 0)
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7434  			goto out;
c2c71324ecb471c9 Stefan Behrens            2013-04-10  7435  	}
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7436  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7437  out:
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7438  	WARN_ON(sctx =
&& !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7439  	while (sctx &=
& !RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7440  		struct rb_no=
de *n;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7441  		struct pendi=
ng_dir_move *pm;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7442  =

9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7443  		n =3D rb_fir=
st(&sctx->pending_dir_moves);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7444  		pm =3D rb_en=
try(n, struct pending_dir_move, node);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7445  		while (!list=
_empty(&pm->list)) {
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7446  			struct pend=
ing_dir_move *pm2;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7447  =

9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7448  			pm2 =3D lis=
t_first_entry(&pm->list,
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7449  					       st=
ruct pending_dir_move, list);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7450  			free_pendin=
g_move(sctx, pm2);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7451  		}
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7452  		free_pending=
_move(sctx, pm);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7453  	}
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7454  =

9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7455  	WARN_ON(sctx =
&& !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7456  	while (sctx &=
& !RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7457  		struct rb_no=
de *n;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7458  		struct waiti=
ng_dir_move *dm;
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7459  =

9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7460  		n =3D rb_fir=
st(&sctx->waiting_dir_moves);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7461  		dm =3D rb_en=
try(n, struct waiting_dir_move, node);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7462  		rb_erase(&dm=
->node, &sctx->waiting_dir_moves);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7463  		kfree(dm);
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7464  	}
9f03740a956d7ac6 Filipe David Borba Manana 2014-01-22  7465  =

9dc442143b9874ba Filipe Manana             2014-02-19  7466  	WARN_ON(sctx =
&& !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874ba Filipe Manana             2014-02-19  7467  	while (sctx &=
& !RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874ba Filipe Manana             2014-02-19  7468  		struct rb_no=
de *n;
9dc442143b9874ba Filipe Manana             2014-02-19  7469  		struct orpha=
n_dir_info *odi;
9dc442143b9874ba Filipe Manana             2014-02-19  7470  =

9dc442143b9874ba Filipe Manana             2014-02-19  7471  		n =3D rb_fir=
st(&sctx->orphan_dirs);
9dc442143b9874ba Filipe Manana             2014-02-19  7472  		odi =3D rb_e=
ntry(n, struct orphan_dir_info, node);
9dc442143b9874ba Filipe Manana             2014-02-19  7473  		free_orphan_=
dir_info(sctx, odi);
9dc442143b9874ba Filipe Manana             2014-02-19  7474  	}
9dc442143b9874ba Filipe Manana             2014-02-19  7475  =

896c14f97f700aec Wang Shilong              2014-01-07  7476  	if (sort_clon=
e_roots) {
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7477  		for (i =3D 0=
; i < sctx->clone_roots_cnt; i++) {
896c14f97f700aec Wang Shilong              2014-01-07  7478  			btrfs_root_=
dec_send_in_progress(
896c14f97f700aec Wang Shilong              2014-01-07  7479  					sctx->clo=
ne_roots[i].root);
0024652895e3479c Josef Bacik               2020-01-24  7480  			btrfs_put_r=
oot(sctx->clone_roots[i].root);
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7481  		}
896c14f97f700aec Wang Shilong              2014-01-07  7482  	} else {
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7483  		for (i =3D 0=
; sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700aec Wang Shilong              2014-01-07  7484  			btrfs_root_=
dec_send_in_progress(
896c14f97f700aec Wang Shilong              2014-01-07  7485  					sctx->clo=
ne_roots[i].root);
0024652895e3479c Josef Bacik               2020-01-24  7486  			btrfs_put_r=
oot(sctx->clone_roots[i].root);
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7487  		}
896c14f97f700aec Wang Shilong              2014-01-07  7488  =

896c14f97f700aec Wang Shilong              2014-01-07  7489  		btrfs_root_d=
ec_send_in_progress(send_root);
896c14f97f700aec Wang Shilong              2014-01-07  7490  	}
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7491  	if (sctx && !=
IS_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e53 David Sterba              2013-12-17  7492  		btrfs_root_d=
ec_send_in_progress(sctx->parent_root);
0024652895e3479c Josef Bacik               2020-01-24  7493  		btrfs_put_ro=
ot(sctx->parent_root);
6f9a3da5da9e7e59 Josef Bacik               2020-01-24  7494  	}
2c68653787f91c62 David Sterba              2013-12-16  7495  =

2f91306a37809907 David Sterba              2016-04-11  7496  	kvfree(clone_=
sources_tmp);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7497  =

31db9f7c23fbf7e9 Alexander Block           2012-07-25  7498  	if (sctx) {
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7499  		if (sctx->se=
nd_filp)
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7500  			fput(sctx->=
send_filp);
31db9f7c23fbf7e9 Alexander Block           2012-07-25  7501  =

c03d01f340428271 David Sterba              2016-04-11  7502  		kvfree(sctx-=
>clone_roots);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7503  		if (sctx->fl=
ags & BTRFS_SEND_FLAG_STREAM_V2) {
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7504  			vunmap(sctx=
->send_buf);
fceda93fdf5c2d00 Omar Sandoval             2020-05-01  7505  			for (i =3D =
0; i < send_buf_num_pages; i++) {
fceda93fdf5c2d00 Omar Sandoval             2020-05-01 @7506  				if (sctx->=
send_buf_pages[i])

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7062220538813881747==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
t5fKjAkXAgA=
--===============7062220538813881747==--

