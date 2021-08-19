Content-Type: multipart/mixed; boundary="===============2624182661029080967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded-v10 12/14] fs/btrfs/send.c:7546 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7319)
Date: Fri, 20 Aug 2021 01:54:14 +0800
Message-ID: <202108200102.gGIk5Xco-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2624182661029080967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Omar Sandoval <osandov@osandov.com>
CC: linux-kernel(a)vger.kernel.org
TO: Omar Sandoval <osandov@fb.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded-v10
head:   a87f8dd5b9e777c136ab986baa9b751f9c1909a6
commit: 5ea052d103ec66ef1f782839c5e21d4f6574fcc1 [12/14] btrfs: send: alloc=
ate send buffer with alloc_page() and vmap() for v2
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nds32-randconfig-m031-20210818 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/send.c:7546 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7319)

vim +7546 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  7225  =

2351f431f72722 Josef Bacik               2017-09-27  7226  long btrfs_ioctl=
_send(struct file *mnt_file, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  7227  {
31db9f7c23fbf7 Alexander Block           2012-07-25  7228  	int ret =3D 0;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7229  	struct btrfs_ro=
ot *send_root =3D BTRFS_I(file_inode(mnt_file))->root;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7230  	struct btrfs_fs=
_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  7231  	struct btrfs_ro=
ot *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  7232  	struct send_ctx=
 *sctx =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7233  	u32 i;
5ea052d103ec66 Omar Sandoval             2020-05-01  7234  	u32 send_buf_nu=
m_pages =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7235  	u64 *clone_sour=
ces_tmp =3D NULL;
2c68653787f91c David Sterba              2013-12-16  7236  	int clone_sourc=
es_to_rollback =3D 0;
bae12df966f0e1 Denis Efremov             2020-09-21  7237  	size_t alloc_si=
ze;
896c14f97f700a Wang Shilong              2014-01-07  7238  	int sort_clone_=
roots =3D 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  7239  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7240  	if (!capable(CA=
P_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  7241  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7242  =

2c68653787f91c David Sterba              2013-12-16  7243  	/*
2c68653787f91c David Sterba              2013-12-16  7244  	 * The subvolum=
e must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  7245  	 * making it RW=
. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  7246  	 */
2c68653787f91c David Sterba              2013-12-16  7247  	spin_lock(&send=
_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7248  	if (btrfs_root_=
readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7249  		dedupe_in_prog=
ress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7250  		spin_unlock(&s=
end_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7251  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7252  	}
2c68653787f91c David Sterba              2013-12-16  7253  	send_root->send=
_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7254  	spin_unlock(&se=
nd_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7255  =

2c68653787f91c David Sterba              2013-12-16  7256  	/*
2c68653787f91c David Sterba              2013-12-16  7257  	 * Userspace to=
ols do the checks and warn the user if it's
2c68653787f91c David Sterba              2013-12-16  7258  	 * not RO.
2c68653787f91c David Sterba              2013-12-16  7259  	 */
2c68653787f91c David Sterba              2013-12-16  7260  	if (!btrfs_root=
_readonly(send_root)) {
2c68653787f91c David Sterba              2013-12-16  7261  		ret =3D -EPERM;
2c68653787f91c David Sterba              2013-12-16  7262  		goto out;
2c68653787f91c David Sterba              2013-12-16  7263  	}
2c68653787f91c David Sterba              2013-12-16  7264  =

457ae7268b29c3 Dan Carpenter             2017-03-17  7265  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  7266  	 * Check that w=
e don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  7267  	 * clone_source=
s_count + 1 items, and compare to unsigned long inside
457ae7268b29c3 Dan Carpenter             2017-03-17  7268  	 * access_ok.
457ae7268b29c3 Dan Carpenter             2017-03-17  7269  	 */
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7270  	if (arg->clone_=
sources_count >
457ae7268b29c3 Dan Carpenter             2017-03-17  7271  	    ULONG_MAX /=
 sizeof(struct clone_root) - 1) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7272  		ret =3D -EINVA=
L;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7273  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7274  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  7275  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7276  	if (arg->flags =
& ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7277  		ret =3D -EINVA=
L;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7278  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7279  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7280  =

e780b0d1c1523e David Sterba              2016-01-18  7281  	sctx =3D kzallo=
c(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7282  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7283  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7284  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7285  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7286  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7287  	INIT_LIST_HEAD(=
&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  7288  	INIT_LIST_HEAD(=
&sctx->deleted_refs);
e780b0d1c1523e David Sterba              2016-01-18  7289  	INIT_RADIX_TREE=
(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7290  	INIT_LIST_HEAD(=
&sctx->name_cache_list);
31db9f7c23fbf7 Alexander Block           2012-07-25  7291  =

cb95e7bf7ba481 Mark Fasheh               2013-02-04  7292  	sctx->flags =3D=
 arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  7293  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7294  	sctx->send_filp=
 =3D fget(arg->send_fd);
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7295  	if (!sctx->send=
_filp) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  7296  		ret =3D -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  7297  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7298  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7299  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7300  	sctx->send_root=
 =3D send_root;
521e0546c970c3 David Sterba              2014-04-15  7301  	/*
521e0546c970c3 David Sterba              2014-04-15  7302  	 * Unlikely but=
 possible, if the subvolume is marked for deletion but
521e0546c970c3 David Sterba              2014-04-15  7303  	 * is slow to r=
emove the directory entry, send can still be started
521e0546c970c3 David Sterba              2014-04-15  7304  	 */
521e0546c970c3 David Sterba              2014-04-15  7305  	if (btrfs_root_=
dead(sctx->send_root)) {
521e0546c970c3 David Sterba              2014-04-15  7306  		ret =3D -EPERM;
521e0546c970c3 David Sterba              2014-04-15  7307  		goto out;
521e0546c970c3 David Sterba              2014-04-15  7308  	}
521e0546c970c3 David Sterba              2014-04-15  7309  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7310  	sctx->clone_roo=
ts_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  7311  =

7d186d9f0bbc03 Omar Sandoval             2020-05-13  7312  	if (sctx->flags=
 & BTRFS_SEND_FLAG_STREAM_V2) {
7d186d9f0bbc03 Omar Sandoval             2020-05-13  7313  		sctx->send_max=
_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
7d186d9f0bbc03 Omar Sandoval             2020-05-13  7314  					    PAGE_SI=
ZE);
5ea052d103ec66 Omar Sandoval             2020-05-01  7315  		send_buf_num_p=
ages =3D sctx->send_max_size >> PAGE_SHIFT;
5ea052d103ec66 Omar Sandoval             2020-05-01  7316  		sctx->send_buf=
_pages =3D kcalloc(send_buf_num_pages,
5ea052d103ec66 Omar Sandoval             2020-05-01  7317  					       size=
of(*sctx->send_buf_pages),
5ea052d103ec66 Omar Sandoval             2020-05-01  7318  					       GFP_=
KERNEL);
5ea052d103ec66 Omar Sandoval             2020-05-01  7319  		if (!sctx->sen=
d_buf_pages) {
5ea052d103ec66 Omar Sandoval             2020-05-01  7320  			send_buf_num_=
pages =3D 0;
5ea052d103ec66 Omar Sandoval             2020-05-01  7321  			ret =3D -ENOM=
EM;
5ea052d103ec66 Omar Sandoval             2020-05-01  7322  			goto out;
5ea052d103ec66 Omar Sandoval             2020-05-01  7323  		}
5ea052d103ec66 Omar Sandoval             2020-05-01  7324  		for (i =3D 0; =
i < send_buf_num_pages; i++) {
5ea052d103ec66 Omar Sandoval             2020-05-01  7325  			sctx->send_bu=
f_pages[i] =3D alloc_page(GFP_KERNEL);
5ea052d103ec66 Omar Sandoval             2020-05-01  7326  			if (!sctx->se=
nd_buf_pages[i]) {
5ea052d103ec66 Omar Sandoval             2020-05-01  7327  				ret =3D -ENO=
MEM;
5ea052d103ec66 Omar Sandoval             2020-05-01  7328  				goto out;
5ea052d103ec66 Omar Sandoval             2020-05-01  7329  			}
5ea052d103ec66 Omar Sandoval             2020-05-01  7330  		}
5ea052d103ec66 Omar Sandoval             2020-05-01  7331  		sctx->send_buf=
 =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
5ea052d103ec66 Omar Sandoval             2020-05-01  7332  				      VM_MAP=
, PAGE_KERNEL);
7d186d9f0bbc03 Omar Sandoval             2020-05-13  7333  	} else {
d60216724a767a Omar Sandoval             2020-05-12  7334  		sctx->send_max=
_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  7335  		sctx->send_buf=
 =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
5ea052d103ec66 Omar Sandoval             2020-05-01  7336  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7337  	if (!sctx->send=
_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7338  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7339  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7340  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7341  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7342  	sctx->pending_d=
ir_moves =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7343  	sctx->waiting_d=
ir_moves =3D RB_ROOT;
9dc442143b9874 Filipe Manana             2014-02-19  7344  	sctx->orphan_di=
rs =3D RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7345  =

bae12df966f0e1 Denis Efremov             2020-09-21  7346  	sctx->clone_roo=
ts =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1 Denis Efremov             2020-09-21  7347  				     arg->cl=
one_sources_count + 1,
bae12df966f0e1 Denis Efremov             2020-09-21  7348  				     GFP_KER=
NEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7349  	if (!sctx->clon=
e_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7350  		ret =3D -ENOME=
M;
31db9f7c23fbf7 Alexander Block           2012-07-25  7351  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7352  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7353  =

bae12df966f0e1 Denis Efremov             2020-09-21  7354  	alloc_size =3D =
array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  7355  				arg->clone_s=
ources_count);
e55d1153dbf484 David Sterba              2016-04-11  7356  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7357  	if (arg->clone_=
sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  7358  		clone_sources_=
tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  7359  		if (!clone_sou=
rces_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7360  			ret =3D -ENOM=
EM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7361  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7362  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7363  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7364  		ret =3D copy_f=
rom_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  7365  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  7366  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7367  			ret =3D -EFAU=
LT;
31db9f7c23fbf7 Alexander Block           2012-07-25  7368  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7369  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  7370  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7371  		for (i =3D 0; =
i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  7372  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  7373  						clone_sour=
ces_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  7374  			if (IS_ERR(cl=
one_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7375  				ret =3D PTR_=
ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7376  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7377  			}
2c68653787f91c David Sterba              2013-12-16  7378  			spin_lock(&cl=
one_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  7379  			if (!btrfs_ro=
ot_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  7380  			    btrfs_roo=
t_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  7381  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7382  				btrfs_put_ro=
ot(clone_root);
2c68653787f91c David Sterba              2013-12-16  7383  				ret =3D -EPE=
RM;
2c68653787f91c David Sterba              2013-12-16  7384  				goto out;
2c68653787f91c David Sterba              2013-12-16  7385  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  7386  			if (clone_roo=
t->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7387  				dedupe_in_pr=
ogress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7388  				spin_unlock(=
&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  7389  				btrfs_put_ro=
ot(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7390  				ret =3D -EAG=
AIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7391  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7392  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  7393  			clone_root->s=
end_in_progress++;
2c68653787f91c David Sterba              2013-12-16  7394  			spin_unlock(&=
clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  7395  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7396  			sctx->clone_r=
oots[i].root =3D clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  7397  			clone_sources=
_to_rollback =3D i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7398  		}
2f91306a378099 David Sterba              2016-04-11  7399  		kvfree(clone_s=
ources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7400  		clone_sources_=
tmp =3D NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7401  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7402  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7403  	if (arg->parent=
_root) {
56e9357a1e8167 David Sterba              2020-05-15  7404  		sctx->parent_r=
oot =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  7405  						      true=
);
b1b195969fe6d9 Stefan Behrens            2013-05-13  7406  		if (IS_ERR(sct=
x->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  7407  			ret =3D PTR_E=
RR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7408  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7409  		}
18f687d5384493 Wang Shilong              2014-01-07  7410  =

2c68653787f91c David Sterba              2013-12-16  7411  		spin_lock(&sct=
x->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7412  		sctx->parent_r=
oot->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  7413  		if (!btrfs_roo=
t_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  7414  				btrfs_root_d=
ead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  7415  			spin_unlock(&=
sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  7416  			ret =3D -EPER=
M;
2c68653787f91c David Sterba              2013-12-16  7417  			goto out;
2c68653787f91c David Sterba              2013-12-16  7418  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  7419  		if (sctx->pare=
nt_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  7420  			dedupe_in_pro=
gress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  7421  			spin_unlock(&=
sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  7422  			ret =3D -EAGA=
IN;
62d54f3a7fa27e Filipe Manana             2019-04-22  7423  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  7424  		}
2c68653787f91c David Sterba              2013-12-16  7425  		spin_unlock(&s=
ctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7426  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7427  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7428  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  7429  	 * Clones from =
send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  7430  	 * is behind th=
e current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  7431  	 * for possible=
 clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  7432  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  7433  	sctx->clone_roo=
ts[sctx->clone_roots_cnt++].root =3D
0024652895e347 Josef Bacik               2020-01-24  7434  		btrfs_grab_roo=
t(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  7435  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7436  	/* We do a bsea=
rch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  7437  	sort(sctx->clon=
e_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  7438  			sizeof(*sctx-=
>clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  7439  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  7440  	sort_clone_root=
s =3D 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  7441  =

9f89d5de8631c7 Filipe Manana             2019-04-15  7442  	ret =3D flush_d=
elalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  7443  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  7444  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  7445  =

e5fa8f865b3324 Filipe Manana             2014-10-21  7446  	ret =3D ensure_=
commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  7447  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  7448  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  7449  =

1cea5cf0e66429 Filipe Manana             2021-06-21  7450  	spin_lock(&fs_i=
nfo->send_reloc_lock);
1cea5cf0e66429 Filipe Manana             2021-06-21  7451  	if (test_bit(BT=
RFS_FS_RELOC_RUNNING, &fs_info->flags)) {
1cea5cf0e66429 Filipe Manana             2021-06-21  7452  		spin_unlock(&f=
s_info->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7453  		btrfs_warn_rl(=
fs_info,
1cea5cf0e66429 Filipe Manana             2021-06-21  7454  		"cannot run se=
nd because a relocation operation is in progress");
9e967495e0e0ae Filipe Manana             2019-04-22  7455  		ret =3D -EAGAI=
N;
9e967495e0e0ae Filipe Manana             2019-04-22  7456  		goto out;
9e967495e0e0ae Filipe Manana             2019-04-22  7457  	}
9e967495e0e0ae Filipe Manana             2019-04-22  7458  	fs_info->send_i=
n_progress++;
1cea5cf0e66429 Filipe Manana             2021-06-21  7459  	spin_unlock(&fs=
_info->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7460  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7461  	ret =3D send_su=
bvol(sctx);
1cea5cf0e66429 Filipe Manana             2021-06-21  7462  	spin_lock(&fs_i=
nfo->send_reloc_lock);
9e967495e0e0ae Filipe Manana             2019-04-22  7463  	fs_info->send_i=
n_progress--;
1cea5cf0e66429 Filipe Manana             2021-06-21  7464  	spin_unlock(&fs=
_info->send_reloc_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  7465  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7466  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7467  =

c2c71324ecb471 Stefan Behrens            2013-04-10  7468  	if (!(sctx->fla=
gs & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7469  		ret =3D begin_=
cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  7470  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7471  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  7472  		ret =3D send_c=
md(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  7473  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  7474  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  7475  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  7476  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7477  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7478  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7479  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7480  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7481  		struct pending=
_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7482  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7483  		n =3D rb_first=
(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7484  		pm =3D rb_entr=
y(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7485  		while (!list_e=
mpty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7486  			struct pendin=
g_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7487  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7488  			pm2 =3D list_=
first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7489  					       stru=
ct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7490  			free_pending_=
move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7491  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7492  		free_pending_m=
ove(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7493  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7494  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7495  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7496  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7497  		struct rb_node=
 *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7498  		struct waiting=
_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7499  =

9f03740a956d7a Filipe David Borba Manana 2014-01-22  7500  		n =3D rb_first=
(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7501  		dm =3D rb_entr=
y(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7502  		rb_erase(&dm->=
node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7503  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7504  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  7505  =

9dc442143b9874 Filipe Manana             2014-02-19  7506  	WARN_ON(sctx &&=
 !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19  7507  	while (sctx && =
!RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  7508  		struct rb_node=
 *n;
9dc442143b9874 Filipe Manana             2014-02-19  7509  		struct orphan_=
dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  7510  =

9dc442143b9874 Filipe Manana             2014-02-19  7511  		n =3D rb_first=
(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  7512  		odi =3D rb_ent=
ry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  7513  		free_orphan_di=
r_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  7514  	}
9dc442143b9874 Filipe Manana             2014-02-19  7515  =

896c14f97f700a Wang Shilong              2014-01-07  7516  	if (sort_clone_=
roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7517  		for (i =3D 0; =
i < sctx->clone_roots_cnt; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7518  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7519  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7520  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7521  		}
896c14f97f700a Wang Shilong              2014-01-07  7522  	} else {
6f9a3da5da9e7e Josef Bacik               2020-01-24  7523  		for (i =3D 0; =
sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700a Wang Shilong              2014-01-07  7524  			btrfs_root_de=
c_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  7525  					sctx->clone=
_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  7526  			btrfs_put_roo=
t(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7527  		}
896c14f97f700a Wang Shilong              2014-01-07  7528  =

896c14f97f700a Wang Shilong              2014-01-07  7529  		btrfs_root_dec=
_send_in_progress(send_root);
896c14f97f700a Wang Shilong              2014-01-07  7530  	}
6f9a3da5da9e7e Josef Bacik               2020-01-24  7531  	if (sctx && !IS=
_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e David Sterba              2013-12-17  7532  		btrfs_root_dec=
_send_in_progress(sctx->parent_root);
0024652895e347 Josef Bacik               2020-01-24  7533  		btrfs_put_root=
(sctx->parent_root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  7534  	}
2c68653787f91c David Sterba              2013-12-16  7535  =

2f91306a378099 David Sterba              2016-04-11  7536  	kvfree(clone_so=
urces_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7537  =

31db9f7c23fbf7 Alexander Block           2012-07-25  7538  	if (sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  7539  		if (sctx->send=
_filp)
31db9f7c23fbf7 Alexander Block           2012-07-25  7540  			fput(sctx->se=
nd_filp);
31db9f7c23fbf7 Alexander Block           2012-07-25  7541  =

c03d01f3404282 David Sterba              2016-04-11  7542  		kvfree(sctx->c=
lone_roots);
5ea052d103ec66 Omar Sandoval             2020-05-01  7543  		if (sctx->flag=
s & BTRFS_SEND_FLAG_STREAM_V2) {
5ea052d103ec66 Omar Sandoval             2020-05-01  7544  			vunmap(sctx->=
send_buf);
5ea052d103ec66 Omar Sandoval             2020-05-01  7545  			for (i =3D 0;=
 i < send_buf_num_pages; i++) {
5ea052d103ec66 Omar Sandoval             2020-05-01 @7546  				if (sctx->se=
nd_buf_pages[i])

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2624182661029080967==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
knMRLnECAA==
--===============2624182661029080967==--

