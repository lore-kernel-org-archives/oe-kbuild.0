Content-Type: multipart/mixed; boundary="===============2977602902871188656=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded 15/17] fs/btrfs/send.c:7806 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7593)
Date: Thu, 27 Jan 2022 08:29:31 +0800
Message-ID: <202201270814.2gId9LNj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2977602902871188656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Omar Sandoval <osandov@osandov.com>
CC: linux-kernel(a)vger.kernel.org
TO: Omar Sandoval <osandov@fb.com>
CC: Nikolay Borisov <nborisov@suse.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded
head:   ec062ce505d22f204218f91a940b55fb38d66b07
commit: 57cd63d9f970d529c3cc9b80612cffd71b3186b9 [15/17] btrfs: send: alloc=
ate send buffer with alloc_page() and vmap() for v2
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: nios2-randconfig-m031-20220124 (https://download.01.org/0day-ci/arc=
hive/20220127/202201270814.2gId9LNj-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/send.c:7806 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7593)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +7806 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  7488  =

786e6838d278ed Sahil Kang                2022-01-15  7489  long btrfs_ioctl=
_send(struct inode *inode, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  7490  {
31db9f7c23fbf7 Alexander Block           2012-07-25  7491  	int ret =3D 0;
786e6838d278ed Sahil Kang                2022-01-15  7492  	struct btrfs_ro=
ot *send_root =3D BTRFS_I(inode)->root;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7493  	struct btrfs_fs=
_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  7494  	struct btrfs_ro=
ot *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  7495  	struct send_ctx=
 *sctx =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7496  	u32 i;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7497  	u32 send_buf_nu=
m_pages =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7498  	u64 *clone_sour=
ces_tmp =3D NULL;
2c68653787f91c David Sterba              2013-12-16  7499  	int clone_sourc=
es_to_rollback =3D 0;
bae12df966f0e1 Denis Efremov             2020-09-21  7500  	size_t alloc_si=
ze;
896c14f97f700a Wang Shilong              2014-01-07  7501  	int sort_clone_=
roots =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7502  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7503  	if (!capable(CA=
P_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  7504  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7505  =

2c68653787f91c David Sterba              2013-12-16  7506  	/*
2c68653787f91c David Sterba              2013-12-16  7507  	 * The subvolum=
e must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  7508  	 * making it RW=
. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  7509  	 */
2c68653787f91c David Sterba              2013-12-16  7510  	spin_lock(&send=
_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7511  	if (btrfs_root_=
readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7512  		dedupe_in_prog=
ress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7513  		spin_unlock(&s=
end_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7514  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7515  	}
2c68653787f91c David Sterba              2013-12-16  7516  	send_root->send=
_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7517  	spin_unlock(&se=
nd_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7518  =

2c68653787f91c David Sterba              2013-12-16  7519  	/*
2c68653787f91c David Sterba              2013-12-16  7520  	 * Userspace to=
ols do the checks and warn the user if it's
2c68653787f91c David Sterba              2013-12-16  7521  	 * not RO.
2c68653787f91c David Sterba              2013-12-16  7522  	 */
2c68653787f91c David Sterba              2013-12-16  7523  	if (!btrfs_root=
_readonly(send_root)) {
2c68653787f91c David Sterba              2013-12-16  7524  		ret =3D -EPERM;
2c68653787f91c David Sterba              2013-12-16  7525  		goto out;
2c68653787f91c David Sterba              2013-12-16  7526  	}
2c68653787f91c David Sterba              2013-12-16  7527  =

457ae7268b29c3 Dan Carpenter             2017-03-17  7528  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  7529  	 * Check that w=
e don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  7530  	 * clone_source=
s_count + 1 items, and compare to unsigned long inside
457ae7268b29c3 Dan Carpenter             2017-03-17  7531  	 * access_ok.
457ae7268b29c3 Dan Carpenter             2017-03-17  7532  	 */
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7533  	if (arg->clone_=
sources_count >
457ae7268b29c3 Dan Carpenter             2017-03-17  7534  	    ULONG_MAX /=
 sizeof(struct clone_root) - 1) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7535  		ret =3D -EINVA=
L;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7536  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7537  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7538  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7539  	if (arg->flags =
& ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7540  		ret =3D -EINVA=
L;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7541  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7542  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7543  =

e780b0d1c1523e David Sterba              2016-01-18  7544  	sctx =3D kzallo=
c(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7545  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7546  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7547  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7548  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7549  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7550  	INIT_LIST_HEAD(=
&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  7551  	INIT_LIST_HEAD(=
&sctx->deleted_refs);
e780b0d1c1523e David Sterba              2016-01-18  7552  	INIT_RADIX_TREE=
(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7553  	INIT_LIST_HEAD(=
&sctx->name_cache_list);
31db9f7c23fbf7 Alexander Block           2012-07-25  7554  =

cb95e7bf7ba481 Mark Fasheh               2013-02-04  7555  	sctx->flags =3D=
 arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7556  =

e77fbf990316d4 David Sterba              2021-10-22  7557  	if (arg->flags =
& BTRFS_SEND_FLAG_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  7558  		if (arg->versi=
on > BTRFS_SEND_STREAM_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  7559  			ret =3D -EPRO=
TO;
e77fbf990316d4 David Sterba              2021-10-22  7560  			goto out;
e77fbf990316d4 David Sterba              2021-10-22  7561  		}
e77fbf990316d4 David Sterba              2021-10-22  7562  		/* Zero means =
"use the highest version" */
e77fbf990316d4 David Sterba              2021-10-22  7563  		sctx->proto =
=3D arg->version ?: BTRFS_SEND_STREAM_VERSION;
e77fbf990316d4 David Sterba              2021-10-22  7564  	} else {
e77fbf990316d4 David Sterba              2021-10-22  7565  		sctx->proto =
=3D 1;
e77fbf990316d4 David Sterba              2021-10-22  7566  	}
e77fbf990316d4 David Sterba              2021-10-22  7567  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7568  	sctx->send_filp=
 =3D fget(arg->send_fd);
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7569  	if (!sctx->send=
_filp) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7570  		ret =3D -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  7571  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7572  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7573  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7574  	sctx->send_root=
 =3D send_root;
521e0546c970c3 David Sterba              2014-04-15  7575  	/*
521e0546c970c3 David Sterba              2014-04-15  7576  	 * Unlikely but=
 possible, if the subvolume is marked for deletion but
521e0546c970c3 David Sterba              2014-04-15  7577  	 * is slow to r=
emove the directory entry, send can still be started
521e0546c970c3 David Sterba              2014-04-15  7578  	 */
521e0546c970c3 David Sterba              2014-04-15  7579  	if (btrfs_root_=
dead(sctx->send_root)) {
521e0546c970c3 David Sterba              2014-04-15  7580  		ret =3D -EPERM;
521e0546c970c3 David Sterba              2014-04-15  7581  		goto out;
521e0546c970c3 David Sterba              2014-04-15  7582  	}
521e0546c970c3 David Sterba              2014-04-15  7583  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7584  	sctx->clone_roo=
ts_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  7585  =

1d067d274b5d5c Omar Sandoval             2020-05-13  7586  	if (sctx->proto=
 >=3D 2) {
1d067d274b5d5c Omar Sandoval             2020-05-13  7587  		sctx->send_max=
_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
1d067d274b5d5c Omar Sandoval             2020-05-13  7588  					    PAGE_SI=
ZE);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7589  		send_buf_num_p=
ages =3D sctx->send_max_size >> PAGE_SHIFT;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7590  		sctx->send_buf=
_pages =3D kcalloc(send_buf_num_pages,
57cd63d9f970d5 Omar Sandoval             2020-05-01  7591  					       size=
of(*sctx->send_buf_pages),
57cd63d9f970d5 Omar Sandoval             2020-05-01  7592  					       GFP_=
KERNEL);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7593  		if (!sctx->sen=
d_buf_pages) {
57cd63d9f970d5 Omar Sandoval             2020-05-01  7594  			send_buf_num_=
pages =3D 0;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7595  			ret =3D -ENOM=
EM;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7596  			goto out;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7597  		}
57cd63d9f970d5 Omar Sandoval             2020-05-01  7598  		for (i =3D 0; =
i < send_buf_num_pages; i++) {
57cd63d9f970d5 Omar Sandoval             2020-05-01  7599  			sctx->send_bu=
f_pages[i] =3D alloc_page(GFP_KERNEL);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7600  			if (!sctx->se=
nd_buf_pages[i]) {
57cd63d9f970d5 Omar Sandoval             2020-05-01  7601  				ret =3D -ENO=
MEM;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7602  				goto out;
57cd63d9f970d5 Omar Sandoval             2020-05-01  7603  			}
57cd63d9f970d5 Omar Sandoval             2020-05-01  7604  		}
57cd63d9f970d5 Omar Sandoval             2020-05-01  7605  		sctx->send_buf=
 =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
57cd63d9f970d5 Omar Sandoval             2020-05-01  7606  				      VM_MAP=
, PAGE_KERNEL);
1d067d274b5d5c Omar Sandoval             2020-05-13  7607  	} else {
ddb13e7a6baea8 Omar Sandoval             2020-05-12  7608  		sctx->send_max=
_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  7609  		sctx->send_buf=
 =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7610  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7611  	if (!sctx->send=
_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7612  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7613  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7614  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7615  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7616  	sctx->pending_d=
ir_moves =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7617  	sctx->waiting_d=
ir_moves =3D RB_ROOT;
9dc442143b9874 Filipe Manana             2014-02-19  7618  	sctx->orphan_di=
rs =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7619  =

bae12df966f0e1 Denis Efremov             2020-09-21  7620  	sctx->clone_roo=
ts =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1 Denis Efremov             2020-09-21  7621  				     arg->cl=
one_sources_count + 1,
bae12df966f0e1 Denis Efremov             2020-09-21  7622  				     GFP_KER=
NEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7623  	if (!sctx->clon=
e_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7624  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7625  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7626  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7627  =

bae12df966f0e1 Denis Efremov             2020-09-21  7628  	alloc_size =3D =
array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  7629  				arg->clone_s=
ources_count);
e55d1153dbf484 David Sterba              2016-04-11  7630  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7631  	if (arg->clone_=
sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  7632  		clone_sources_=
tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7633  		if (!clone_sou=
rces_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7634  			ret =3D -ENOM=
EM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7635  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7636  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7637  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7638  		ret =3D copy_f=
rom_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  7639  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  7640  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7641  			ret =3D -EFAU=
LT;
31db9f7c23fbf7 Alexander Block           2012-07-25  7642  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7643  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7644  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7645  		for (i =3D 0; =
i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  7646  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  7647  						clone_sour=
ces_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  7648  			if (IS_ERR(cl=
one_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7649  				ret =3D PTR_=
ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7650  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7651  			}
2c68653787f91c David Sterba              2013-12-16  7652  			spin_lock(&cl=
one_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  7653  			if (!btrfs_ro=
ot_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  7654  			    btrfs_roo=
t_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  7655  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7656  				btrfs_put_ro=
ot(clone_root);
2c68653787f91c David Sterba              2013-12-16  7657  				ret =3D -EPE=
RM;
2c68653787f91c David Sterba              2013-12-16  7658  				goto out;
2c68653787f91c David Sterba              2013-12-16  7659  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  7660  			if (clone_roo=
t->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7661  				dedupe_in_pr=
ogress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7662  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7663  				btrfs_put_ro=
ot(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7664  				ret =3D -EAG=
AIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7665  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7666  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  7667  			clone_root->s=
end_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7668  			spin_unlock(&=
clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  7669  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7670  			sctx->clone_r=
oots[i].root =3D clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  7671  			clone_sources=
_to_rollback =3D i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7672  		}
2f91306a378099 David Sterba              2016-04-11  7673  		kvfree(clone_s=
ources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7674  		clone_sources_=
tmp =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7675  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7676  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7677  	if (arg->parent=
_root) {
56e9357a1e8167 David Sterba              2020-05-15  7678  		sctx->parent_r=
oot =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  7679  						      true=
);
b1b195969fe6d9 Stefan Behrens            2013-05-13  7680  		if (IS_ERR(sct=
x->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  7681  			ret =3D PTR_E=
RR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7682  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7683  		}
18f687d5384493 Wang Shilong              2014-01-07  7684  =

2c68653787f91c David Sterba              2013-12-16  7685  		spin_lock(&sct=
x->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7686  		sctx->parent_r=
oot->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  7687  		if (!btrfs_roo=
t_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  7688  				btrfs_root_d=
ead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  7689  			spin_unlock(&=
sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7690  			ret =3D -EPER=
M;
2c68653787f91c David Sterba              2013-12-16  7691  			goto out;
2c68653787f91c David Sterba              2013-12-16  7692  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  7693  		if (sctx->pare=
nt_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7694  			dedupe_in_pro=
gress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7695  			spin_unlock(&=
sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7696  			ret =3D -EAGA=
IN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7697  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7698  		}
2c68653787f91c David Sterba              2013-12-16  7699  		spin_unlock(&s=
ctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7700  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7701  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7702  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  7703  	 * Clones from =
send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  7704  	 * is behind th=
e current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  7705  	 * for possible=
 clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  7706  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  7707  	sctx->clone_roo=
ts[sctx->clone_roots_cnt++].root =3D
0024652895e347 Josef Bacik               2020-01-24  7708  		btrfs_grab_roo=
t(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7709  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7710  	/* We do a bsea=
rch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  7711  	sort(sctx->clon=
e_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  7712  			sizeof(*sctx-=
>clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  7713  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  7714  	sort_clone_root=
s =3D 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7715  =

9f89d5de8631c7 Filipe Manana             2019-04-15  7716  	ret =3D flush_d=
elalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  7717  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  7718  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  7719  =

e5fa8f865b3324 Filipe Manana             2014-10-21  7720  	ret =3D ensure_=
commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  7721  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  7722  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  7723  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7724  	ret =3D send_su=
bvol(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7725  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7726  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7727  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7728  	if (!(sctx->fla=
gs & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7729  		ret =3D begin_=
cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  7730  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7731  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7732  		ret =3D send_c=
md(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7733  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7734  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  7735  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7736  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7737  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7738  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7739  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7740  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7741  		struct pending=
_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7742  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7743  		n =3D rb_first=
(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7744  		pm =3D rb_entr=
y(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7745  		while (!list_e=
mpty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7746  			struct pendin=
g_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7747  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7748  			pm2 =3D list_=
first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7749  					       stru=
ct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7750  			free_pending_=
move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7751  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7752  		free_pending_m=
ove(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7753  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7754  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7755  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7756  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7757  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7758  		struct waiting=
_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7759  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7760  		n =3D rb_first=
(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7761  		dm =3D rb_entr=
y(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7762  		rb_erase(&dm->=
node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7763  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7764  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7765  =

9dc442143b9874 Filipe Manana             2014-02-19  7766  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19  7767  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  7768  		struct rb_node=
 *n;
9dc442143b9874 Filipe Manana             2014-02-19  7769  		struct orphan_=
dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  7770  =

9dc442143b9874 Filipe Manana             2014-02-19  7771  		n =3D rb_first=
(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  7772  		odi =3D rb_ent=
ry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  7773  		free_orphan_di=
r_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  7774  	}
9dc442143b9874 Filipe Manana             2014-02-19  7775  =

896c14f97f700a Wang Shilong              2014-01-07  7776  	if (sort_clone_=
roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7777  		for (i =3D 0; =
i < sctx->clone_roots_cnt; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7778  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7779  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7780  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7781  		}
896c14f97f700a Wang Shilong              2014-01-07  7782  	} else {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7783  		for (i =3D 0; =
sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7784  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7785  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7786  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7787  		}
896c14f97f700a Wang Shilong              2014-01-07  7788  =

896c14f97f700a Wang Shilong              2014-01-07  7789  		btrfs_root_dec=
_send_in_progress(send_root);
896c14f97f700a Wang Shilong              2014-01-07  7790  	}
6f9a3da5da9e7e Josef Bacik               2020-01-24  7791  	if (sctx && !IS=
_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e David Sterba              2013-12-17  7792  		btrfs_root_dec=
_send_in_progress(sctx->parent_root);
0024652895e347 Josef Bacik               2020-01-24  7793  		btrfs_put_root=
(sctx->parent_root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7794  	}
2c68653787f91c David Sterba              2013-12-16  7795  =

2f91306a378099 David Sterba              2016-04-11  7796  	kvfree(clone_so=
urces_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7797  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7798  	if (sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7799  		if (sctx->send=
_filp)
31db9f7c23fbf7 Alexander Block           2012-07-25  7800  			fput(sctx->se=
nd_filp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7801  =

c03d01f3404282 David Sterba              2016-04-11  7802  		kvfree(sctx->c=
lone_roots);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7803  		if (sctx->prot=
o >=3D 2) {
57cd63d9f970d5 Omar Sandoval             2020-05-01  7804  			vunmap(sctx->=
send_buf);
57cd63d9f970d5 Omar Sandoval             2020-05-01  7805  			for (i =3D 0;=
 i < send_buf_num_pages; i++) {
57cd63d9f970d5 Omar Sandoval             2020-05-01 @7806  				if (sctx->se=
nd_buf_pages[i])

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2977602902871188656==--

