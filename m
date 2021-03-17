Content-Type: multipart/mixed; boundary="===============1899299569584083796=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [osandov:btrfs-send-encoded 13/15] fs/btrfs/send.c:7548 btrfs_ioctl_send() error: we previously assumed 'sctx->send_buf_pages' could be null (see line 7319)
Date: Thu, 18 Mar 2021 01:14:46 +0800
Message-ID: <202103180139.OQAg691z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1899299569584083796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Omar Sandoval <osandov@osandov.com>
TO: Omar Sandoval <osandov@fb.com>

tree:   https://github.com/osandov/linux.git btrfs-send-encoded
head:   e0cd3910d8cb650fed229e4df7eca97d29c95639
commit: c26e115488f26c8c41a769f164252ce941369fdc [13/15] btrfs: send: alloc=
ate send buffer with alloc_page() and vmap() for v2
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-m001-20210317 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/send.c:7548 btrfs_ioctl_send() error: we previously assumed 'sctx-=
>send_buf_pages' could be null (see line 7319)

vim +7548 fs/btrfs/send.c

62d54f3a7fa27ef Filipe Manana             2019-04-22  7225  =

2351f431f727223 Josef Bacik               2017-09-27  7226  long btrfs_ioct=
l_send(struct file *mnt_file, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7e Alexander Block           2012-07-25  7227  {
31db9f7c23fbf7e Alexander Block           2012-07-25  7228  	int ret =3D 0;
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  7229  	struct btrfs_r=
oot *send_root =3D BTRFS_I(file_inode(mnt_file))->root;
0b246afa62b0cf5 Jeff Mahoney              2016-06-22  7230  	struct btrfs_f=
s_info *fs_info =3D send_root->fs_info;
31db9f7c23fbf7e Alexander Block           2012-07-25  7231  	struct btrfs_r=
oot *clone_root;
31db9f7c23fbf7e Alexander Block           2012-07-25  7232  	struct send_ct=
x *sctx =3D NULL;
31db9f7c23fbf7e Alexander Block           2012-07-25  7233  	u32 i;
c26e115488f26c8 Omar Sandoval             2020-05-01  7234  	u32 send_buf_n=
um_pages =3D 0;
31db9f7c23fbf7e Alexander Block           2012-07-25  7235  	u64 *clone_sou=
rces_tmp =3D NULL;
2c68653787f91c6 David Sterba              2013-12-16  7236  	int clone_sour=
ces_to_rollback =3D 0;
bae12df966f0e1a Denis Efremov             2020-09-21  7237  	size_t alloc_s=
ize;
896c14f97f700ae Wang Shilong              2014-01-07  7238  	int sort_clone=
_roots =3D 0;
31db9f7c23fbf7e Alexander Block           2012-07-25  7239  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7240  	if (!capable(C=
AP_SYS_ADMIN))
31db9f7c23fbf7e Alexander Block           2012-07-25  7241  		return -EPERM;
31db9f7c23fbf7e Alexander Block           2012-07-25  7242  =

2c68653787f91c6 David Sterba              2013-12-16  7243  	/*
2c68653787f91c6 David Sterba              2013-12-16  7244  	 * The subvolu=
me must remain read-only during send, protect against
521e0546c970c3d David Sterba              2014-04-15  7245  	 * making it R=
W. This also protects against deletion.
2c68653787f91c6 David Sterba              2013-12-16  7246  	 */
2c68653787f91c6 David Sterba              2013-12-16  7247  	spin_lock(&sen=
d_root->root_item_lock);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7248  	if (btrfs_root=
_readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27ef Filipe Manana             2019-04-22  7249  		dedupe_in_pro=
gress_warn(send_root);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7250  		spin_unlock(&=
send_root->root_item_lock);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7251  		return -EAGAI=
N;
62d54f3a7fa27ef Filipe Manana             2019-04-22  7252  	}
2c68653787f91c6 David Sterba              2013-12-16  7253  	send_root->sen=
d_in_progress++;
2c68653787f91c6 David Sterba              2013-12-16  7254  	spin_unlock(&s=
end_root->root_item_lock);
2c68653787f91c6 David Sterba              2013-12-16  7255  =

2c68653787f91c6 David Sterba              2013-12-16  7256  	/*
2c68653787f91c6 David Sterba              2013-12-16  7257  	 * Userspace t=
ools do the checks and warn the user if it's
2c68653787f91c6 David Sterba              2013-12-16  7258  	 * not RO.
2c68653787f91c6 David Sterba              2013-12-16  7259  	 */
2c68653787f91c6 David Sterba              2013-12-16  7260  	if (!btrfs_roo=
t_readonly(send_root)) {
2c68653787f91c6 David Sterba              2013-12-16  7261  		ret =3D -EPER=
M;
2c68653787f91c6 David Sterba              2013-12-16  7262  		goto out;
2c68653787f91c6 David Sterba              2013-12-16  7263  	}
2c68653787f91c6 David Sterba              2013-12-16  7264  =

457ae7268b29c33 Dan Carpenter             2017-03-17  7265  	/*
457ae7268b29c33 Dan Carpenter             2017-03-17  7266  	 * Check that =
we don't overflow at later allocations, we request
457ae7268b29c33 Dan Carpenter             2017-03-17  7267  	 * clone_sourc=
es_count + 1 items, and compare to unsigned long inside
457ae7268b29c33 Dan Carpenter             2017-03-17  7268  	 * access_ok.
457ae7268b29c33 Dan Carpenter             2017-03-17  7269  	 */
f5ecec3ce21f706 Dan Carpenter             2016-04-13  7270  	if (arg->clone=
_sources_count >
457ae7268b29c33 Dan Carpenter             2017-03-17  7271  	    ULONG_MAX =
/ sizeof(struct clone_root) - 1) {
f5ecec3ce21f706 Dan Carpenter             2016-04-13  7272  		ret =3D -EINV=
AL;
f5ecec3ce21f706 Dan Carpenter             2016-04-13  7273  		goto out;
f5ecec3ce21f706 Dan Carpenter             2016-04-13  7274  	}
f5ecec3ce21f706 Dan Carpenter             2016-04-13  7275  =

c2c71324ecb471c Stefan Behrens            2013-04-10  7276  	if (arg->flags=
 & ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481c Mark Fasheh               2013-02-04  7277  		ret =3D -EINV=
AL;
cb95e7bf7ba481c Mark Fasheh               2013-02-04  7278  		goto out;
cb95e7bf7ba481c Mark Fasheh               2013-02-04  7279  	}
cb95e7bf7ba481c Mark Fasheh               2013-02-04  7280  =

e780b0d1c1523ec David Sterba              2016-01-18  7281  	sctx =3D kzall=
oc(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7e Alexander Block           2012-07-25  7282  	if (!sctx) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7283  		ret =3D -ENOM=
EM;
31db9f7c23fbf7e Alexander Block           2012-07-25  7284  		goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7285  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7286  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7287  	INIT_LIST_HEAD=
(&sctx->new_refs);
31db9f7c23fbf7e Alexander Block           2012-07-25  7288  	INIT_LIST_HEAD=
(&sctx->deleted_refs);
e780b0d1c1523ec David Sterba              2016-01-18  7289  	INIT_RADIX_TRE=
E(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7e Alexander Block           2012-07-25  7290  	INIT_LIST_HEAD=
(&sctx->name_cache_list);
31db9f7c23fbf7e Alexander Block           2012-07-25  7291  =

cb95e7bf7ba481c Mark Fasheh               2013-02-04  7292  	sctx->flags =
=3D arg->flags;
cb95e7bf7ba481c Mark Fasheh               2013-02-04  7293  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7294  	sctx->send_fil=
p =3D fget(arg->send_fd);
ecc7ada77b5cd1a Tsutomu Itoh              2013-04-19  7295  	if (!sctx->sen=
d_filp) {
ecc7ada77b5cd1a Tsutomu Itoh              2013-04-19  7296  		ret =3D -EBAD=
F;
31db9f7c23fbf7e Alexander Block           2012-07-25  7297  		goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7298  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7299  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7300  	sctx->send_roo=
t =3D send_root;
521e0546c970c3d David Sterba              2014-04-15  7301  	/*
521e0546c970c3d David Sterba              2014-04-15  7302  	 * Unlikely bu=
t possible, if the subvolume is marked for deletion but
521e0546c970c3d David Sterba              2014-04-15  7303  	 * is slow to =
remove the directory entry, send can still be started
521e0546c970c3d David Sterba              2014-04-15  7304  	 */
521e0546c970c3d David Sterba              2014-04-15  7305  	if (btrfs_root=
_dead(sctx->send_root)) {
521e0546c970c3d David Sterba              2014-04-15  7306  		ret =3D -EPER=
M;
521e0546c970c3d David Sterba              2014-04-15  7307  		goto out;
521e0546c970c3d David Sterba              2014-04-15  7308  	}
521e0546c970c3d David Sterba              2014-04-15  7309  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7310  	sctx->clone_ro=
ots_cnt =3D arg->clone_sources_count;
31db9f7c23fbf7e Alexander Block           2012-07-25  7311  =

9f56f9901144d0b Omar Sandoval             2020-05-13  7312  	if (sctx->flag=
s & BTRFS_SEND_FLAG_STREAM_V2) {
9f56f9901144d0b Omar Sandoval             2020-05-13  7313  		sctx->send_ma=
x_size =3D ALIGN(SZ_16K + BTRFS_MAX_COMPRESSED,
9f56f9901144d0b Omar Sandoval             2020-05-13  7314  					    PAGE_S=
IZE);
c26e115488f26c8 Omar Sandoval             2020-05-01  7315  		send_buf_num_=
pages =3D sctx->send_max_size >> PAGE_SHIFT;
c26e115488f26c8 Omar Sandoval             2020-05-01  7316  		sctx->send_bu=
f_pages =3D kcalloc(send_buf_num_pages,
c26e115488f26c8 Omar Sandoval             2020-05-01  7317  					       siz=
eof(*sctx->send_buf_pages),
c26e115488f26c8 Omar Sandoval             2020-05-01  7318  					       GFP=
_KERNEL);
c26e115488f26c8 Omar Sandoval             2020-05-01  7319  		if (!sctx->se=
nd_buf_pages) {
c26e115488f26c8 Omar Sandoval             2020-05-01  7320  			send_buf_num=
_pages =3D 0;
c26e115488f26c8 Omar Sandoval             2020-05-01  7321  			ret =3D -ENO=
MEM;
c26e115488f26c8 Omar Sandoval             2020-05-01  7322  			goto out;
c26e115488f26c8 Omar Sandoval             2020-05-01  7323  		}
c26e115488f26c8 Omar Sandoval             2020-05-01  7324  		for (i =3D 0;=
 i < send_buf_num_pages; i++) {
c26e115488f26c8 Omar Sandoval             2020-05-01  7325  			sctx->send_b=
uf_pages[i] =3D alloc_page(GFP_KERNEL);
c26e115488f26c8 Omar Sandoval             2020-05-01  7326  			if (!sctx->s=
end_buf_pages[i]) {
c26e115488f26c8 Omar Sandoval             2020-05-01  7327  				ret =3D -EN=
OMEM;
c26e115488f26c8 Omar Sandoval             2020-05-01  7328  				goto out;
c26e115488f26c8 Omar Sandoval             2020-05-01  7329  			}
c26e115488f26c8 Omar Sandoval             2020-05-01  7330  		}
c26e115488f26c8 Omar Sandoval             2020-05-01  7331  		sctx->send_bu=
f =3D vmap(sctx->send_buf_pages, send_buf_num_pages,
c26e115488f26c8 Omar Sandoval             2020-05-01  7332  				      VM_MA=
P, PAGE_KERNEL);
9f56f9901144d0b Omar Sandoval             2020-05-13  7333  	} else {
e2cd011b1f061a1 Omar Sandoval             2020-05-12  7334  		sctx->send_ma=
x_size =3D BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d0 Michal Hocko              2017-05-08  7335  		sctx->send_bu=
f =3D kvmalloc(sctx->send_max_size, GFP_KERNEL);
c26e115488f26c8 Omar Sandoval             2020-05-01  7336  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7337  	if (!sctx->sen=
d_buf) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7338  		ret =3D -ENOM=
EM;
31db9f7c23fbf7e Alexander Block           2012-07-25  7339  		goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7340  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7341  =

9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7342  	sctx->pending_=
dir_moves =3D RB_ROOT;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7343  	sctx->waiting_=
dir_moves =3D RB_ROOT;
9dc442143b9874b Filipe Manana             2014-02-19  7344  	sctx->orphan_d=
irs =3D RB_ROOT;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7345  =

bae12df966f0e1a Denis Efremov             2020-09-21  7346  	sctx->clone_ro=
ots =3D kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1a Denis Efremov             2020-09-21  7347  				     arg->c=
lone_sources_count + 1,
bae12df966f0e1a Denis Efremov             2020-09-21  7348  				     GFP_KE=
RNEL);
31db9f7c23fbf7e Alexander Block           2012-07-25  7349  	if (!sctx->clo=
ne_roots) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7350  		ret =3D -ENOM=
EM;
31db9f7c23fbf7e Alexander Block           2012-07-25  7351  		goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7352  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7353  =

bae12df966f0e1a Denis Efremov             2020-09-21  7354  	alloc_size =3D=
 array_size(sizeof(*arg->clone_sources),
bae12df966f0e1a Denis Efremov             2020-09-21  7355  				arg->clone_=
sources_count);
e55d1153dbf4848 David Sterba              2016-04-11  7356  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7357  	if (arg->clone=
_sources_count) {
752ade68cbd81d0 Michal Hocko              2017-05-08  7358  		clone_sources=
_tmp =3D kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7e Alexander Block           2012-07-25  7359  		if (!clone_so=
urces_tmp) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7360  			ret =3D -ENO=
MEM;
31db9f7c23fbf7e Alexander Block           2012-07-25  7361  			goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7362  		}
31db9f7c23fbf7e Alexander Block           2012-07-25  7363  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7364  		ret =3D copy_=
from_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf4848 David Sterba              2016-04-11  7365  				alloc_size);
31db9f7c23fbf7e Alexander Block           2012-07-25  7366  		if (ret) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7367  			ret =3D -EFA=
ULT;
31db9f7c23fbf7e Alexander Block           2012-07-25  7368  			goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7369  		}
31db9f7c23fbf7e Alexander Block           2012-07-25  7370  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7371  		for (i =3D 0;=
 i < arg->clone_sources_count; i++) {
56e9357a1e81671 David Sterba              2020-05-15  7372  			clone_root =
=3D btrfs_get_fs_root(fs_info,
56e9357a1e81671 David Sterba              2020-05-15  7373  						clone_sou=
rces_tmp[i], true);
31db9f7c23fbf7e Alexander Block           2012-07-25  7374  			if (IS_ERR(c=
lone_root)) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7375  				ret =3D PTR=
_ERR(clone_root);
31db9f7c23fbf7e Alexander Block           2012-07-25  7376  				goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7377  			}
2c68653787f91c6 David Sterba              2013-12-16  7378  			spin_lock(&c=
lone_root->root_item_lock);
5cc2b17e80cf577 Filipe Manana             2015-03-02  7379  			if (!btrfs_r=
oot_readonly(clone_root) ||
5cc2b17e80cf577 Filipe Manana             2015-03-02  7380  			    btrfs_ro=
ot_dead(clone_root)) {
2c68653787f91c6 David Sterba              2013-12-16  7381  				spin_unlock=
(&clone_root->root_item_lock);
0024652895e3479 Josef Bacik               2020-01-24  7382  				btrfs_put_r=
oot(clone_root);
2c68653787f91c6 David Sterba              2013-12-16  7383  				ret =3D -EP=
ERM;
2c68653787f91c6 David Sterba              2013-12-16  7384  				goto out;
2c68653787f91c6 David Sterba              2013-12-16  7385  			}
62d54f3a7fa27ef Filipe Manana             2019-04-22  7386  			if (clone_ro=
ot->dedupe_in_progress) {
62d54f3a7fa27ef Filipe Manana             2019-04-22  7387  				dedupe_in_p=
rogress_warn(clone_root);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7388  				spin_unlock=
(&clone_root->root_item_lock);
0024652895e3479 Josef Bacik               2020-01-24  7389  				btrfs_put_r=
oot(clone_root);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7390  				ret =3D -EA=
GAIN;
62d54f3a7fa27ef Filipe Manana             2019-04-22  7391  				goto out;
62d54f3a7fa27ef Filipe Manana             2019-04-22  7392  			}
2f1f465ae6da244 Filipe Manana             2015-03-02  7393  			clone_root->=
send_in_progress++;
2c68653787f91c6 David Sterba              2013-12-16  7394  			spin_unlock(=
&clone_root->root_item_lock);
18f687d53844937 Wang Shilong              2014-01-07  7395  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7396  			sctx->clone_=
roots[i].root =3D clone_root;
2f1f465ae6da244 Filipe Manana             2015-03-02  7397  			clone_source=
s_to_rollback =3D i + 1;
31db9f7c23fbf7e Alexander Block           2012-07-25  7398  		}
2f91306a3780990 David Sterba              2016-04-11  7399  		kvfree(clone_=
sources_tmp);
31db9f7c23fbf7e Alexander Block           2012-07-25  7400  		clone_sources=
_tmp =3D NULL;
31db9f7c23fbf7e Alexander Block           2012-07-25  7401  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7402  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7403  	if (arg->paren=
t_root) {
56e9357a1e81671 David Sterba              2020-05-15  7404  		sctx->parent_=
root =3D btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e81671 David Sterba              2020-05-15  7405  						      tru=
e);
b1b195969fe6d93 Stefan Behrens            2013-05-13  7406  		if (IS_ERR(sc=
tx->parent_root)) {
b1b195969fe6d93 Stefan Behrens            2013-05-13  7407  			ret =3D PTR_=
ERR(sctx->parent_root);
31db9f7c23fbf7e Alexander Block           2012-07-25  7408  			goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7409  		}
18f687d53844937 Wang Shilong              2014-01-07  7410  =

2c68653787f91c6 David Sterba              2013-12-16  7411  		spin_lock(&sc=
tx->parent_root->root_item_lock);
2c68653787f91c6 David Sterba              2013-12-16  7412  		sctx->parent_=
root->send_in_progress++;
521e0546c970c3d David Sterba              2014-04-15  7413  		if (!btrfs_ro=
ot_readonly(sctx->parent_root) ||
521e0546c970c3d David Sterba              2014-04-15  7414  				btrfs_root_=
dead(sctx->parent_root)) {
2c68653787f91c6 David Sterba              2013-12-16  7415  			spin_unlock(=
&sctx->parent_root->root_item_lock);
2c68653787f91c6 David Sterba              2013-12-16  7416  			ret =3D -EPE=
RM;
2c68653787f91c6 David Sterba              2013-12-16  7417  			goto out;
2c68653787f91c6 David Sterba              2013-12-16  7418  		}
62d54f3a7fa27ef Filipe Manana             2019-04-22  7419  		if (sctx->par=
ent_root->dedupe_in_progress) {
62d54f3a7fa27ef Filipe Manana             2019-04-22  7420  			dedupe_in_pr=
ogress_warn(sctx->parent_root);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7421  			spin_unlock(=
&sctx->parent_root->root_item_lock);
62d54f3a7fa27ef Filipe Manana             2019-04-22  7422  			ret =3D -EAG=
AIN;
62d54f3a7fa27ef Filipe Manana             2019-04-22  7423  			goto out;
62d54f3a7fa27ef Filipe Manana             2019-04-22  7424  		}
2c68653787f91c6 David Sterba              2013-12-16  7425  		spin_unlock(&=
sctx->parent_root->root_item_lock);
31db9f7c23fbf7e Alexander Block           2012-07-25  7426  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7427  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7428  	/*
31db9f7c23fbf7e Alexander Block           2012-07-25  7429  	 * Clones from=
 send_root are allowed, but only if the clone source
31db9f7c23fbf7e Alexander Block           2012-07-25  7430  	 * is behind t=
he current send position. This is checked while searching
31db9f7c23fbf7e Alexander Block           2012-07-25  7431  	 * for possibl=
e clone sources.
31db9f7c23fbf7e Alexander Block           2012-07-25  7432  	 */
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7433  	sctx->clone_ro=
ots[sctx->clone_roots_cnt++].root =3D
0024652895e3479 Josef Bacik               2020-01-24  7434  		btrfs_grab_ro=
ot(sctx->send_root);
31db9f7c23fbf7e Alexander Block           2012-07-25  7435  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7436  	/* We do a bse=
arch later */
31db9f7c23fbf7e Alexander Block           2012-07-25  7437  	sort(sctx->clo=
ne_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7e Alexander Block           2012-07-25  7438  			sizeof(*sctx=
->clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7e Alexander Block           2012-07-25  7439  			NULL);
896c14f97f700ae Wang Shilong              2014-01-07  7440  	sort_clone_roo=
ts =3D 1;
31db9f7c23fbf7e Alexander Block           2012-07-25  7441  =

9f89d5de8631c79 Filipe Manana             2019-04-15  7442  	ret =3D flush_=
delalloc_roots(sctx);
9f89d5de8631c79 Filipe Manana             2019-04-15  7443  	if (ret)
9f89d5de8631c79 Filipe Manana             2019-04-15  7444  		goto out;
9f89d5de8631c79 Filipe Manana             2019-04-15  7445  =

e5fa8f865b3324a Filipe Manana             2014-10-21  7446  	ret =3D ensure=
_commit_roots_uptodate(sctx);
e5fa8f865b3324a Filipe Manana             2014-10-21  7447  	if (ret)
e5fa8f865b3324a Filipe Manana             2014-10-21  7448  		goto out;
e5fa8f865b3324a Filipe Manana             2014-10-21  7449  =

9e967495e0e0ae8 Filipe Manana             2019-04-22  7450  	mutex_lock(&fs=
_info->balance_mutex);
9e967495e0e0ae8 Filipe Manana             2019-04-22  7451  	if (test_bit(B=
TRFS_FS_BALANCE_RUNNING, &fs_info->flags)) {
9e967495e0e0ae8 Filipe Manana             2019-04-22  7452  		mutex_unlock(=
&fs_info->balance_mutex);
9e967495e0e0ae8 Filipe Manana             2019-04-22  7453  		btrfs_warn_rl=
(fs_info,
9e967495e0e0ae8 Filipe Manana             2019-04-22  7454  		"cannot run s=
end because a balance operation is in progress");
9e967495e0e0ae8 Filipe Manana             2019-04-22  7455  		ret =3D -EAGA=
IN;
9e967495e0e0ae8 Filipe Manana             2019-04-22  7456  		goto out;
9e967495e0e0ae8 Filipe Manana             2019-04-22  7457  	}
9e967495e0e0ae8 Filipe Manana             2019-04-22  7458  	fs_info->send_=
in_progress++;
9e967495e0e0ae8 Filipe Manana             2019-04-22  7459  	mutex_unlock(&=
fs_info->balance_mutex);
9e967495e0e0ae8 Filipe Manana             2019-04-22  7460  =

2755a0de6469350 David Sterba              2014-07-31  7461  	current->journ=
al_info =3D BTRFS_SEND_TRANS_STUB;
31db9f7c23fbf7e Alexander Block           2012-07-25  7462  	ret =3D send_s=
ubvol(sctx);
a26e8c9f75b0bfd Josef Bacik               2014-03-28  7463  	current->journ=
al_info =3D NULL;
9e967495e0e0ae8 Filipe Manana             2019-04-22  7464  	mutex_lock(&fs=
_info->balance_mutex);
9e967495e0e0ae8 Filipe Manana             2019-04-22  7465  	fs_info->send_=
in_progress--;
9e967495e0e0ae8 Filipe Manana             2019-04-22  7466  	mutex_unlock(&=
fs_info->balance_mutex);
31db9f7c23fbf7e Alexander Block           2012-07-25  7467  	if (ret < 0)
31db9f7c23fbf7e Alexander Block           2012-07-25  7468  		goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7469  =

c2c71324ecb471c Stefan Behrens            2013-04-10  7470  	if (!(sctx->fl=
ags & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7471  		ret =3D begin=
_cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7e Alexander Block           2012-07-25  7472  		if (ret < 0)
31db9f7c23fbf7e Alexander Block           2012-07-25  7473  			goto out;
31db9f7c23fbf7e Alexander Block           2012-07-25  7474  		ret =3D send_=
cmd(sctx);
31db9f7c23fbf7e Alexander Block           2012-07-25  7475  		if (ret < 0)
31db9f7c23fbf7e Alexander Block           2012-07-25  7476  			goto out;
c2c71324ecb471c Stefan Behrens            2013-04-10  7477  	}
31db9f7c23fbf7e Alexander Block           2012-07-25  7478  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7479  out:
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7480  	WARN_ON(sctx &=
& !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7481  	while (sctx &&=
 !RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7482  		struct rb_nod=
e *n;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7483  		struct pendin=
g_dir_move *pm;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7484  =

9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7485  		n =3D rb_firs=
t(&sctx->pending_dir_moves);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7486  		pm =3D rb_ent=
ry(n, struct pending_dir_move, node);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7487  		while (!list_=
empty(&pm->list)) {
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7488  			struct pendi=
ng_dir_move *pm2;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7489  =

9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7490  			pm2 =3D list=
_first_entry(&pm->list,
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7491  					       str=
uct pending_dir_move, list);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7492  			free_pending=
_move(sctx, pm2);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7493  		}
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7494  		free_pending_=
move(sctx, pm);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7495  	}
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7496  =

9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7497  	WARN_ON(sctx &=
& !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7498  	while (sctx &&=
 !RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7499  		struct rb_nod=
e *n;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7500  		struct waitin=
g_dir_move *dm;
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7501  =

9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7502  		n =3D rb_firs=
t(&sctx->waiting_dir_moves);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7503  		dm =3D rb_ent=
ry(n, struct waiting_dir_move, node);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7504  		rb_erase(&dm-=
>node, &sctx->waiting_dir_moves);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7505  		kfree(dm);
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7506  	}
9f03740a956d7ac Filipe David Borba Manana 2014-01-22  7507  =

9dc442143b9874b Filipe Manana             2014-02-19  7508  	WARN_ON(sctx &=
& !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874b Filipe Manana             2014-02-19  7509  	while (sctx &&=
 !RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874b Filipe Manana             2014-02-19  7510  		struct rb_nod=
e *n;
9dc442143b9874b Filipe Manana             2014-02-19  7511  		struct orphan=
_dir_info *odi;
9dc442143b9874b Filipe Manana             2014-02-19  7512  =

9dc442143b9874b Filipe Manana             2014-02-19  7513  		n =3D rb_firs=
t(&sctx->orphan_dirs);
9dc442143b9874b Filipe Manana             2014-02-19  7514  		odi =3D rb_en=
try(n, struct orphan_dir_info, node);
9dc442143b9874b Filipe Manana             2014-02-19  7515  		free_orphan_d=
ir_info(sctx, odi);
9dc442143b9874b Filipe Manana             2014-02-19  7516  	}
9dc442143b9874b Filipe Manana             2014-02-19  7517  =

896c14f97f700ae Wang Shilong              2014-01-07  7518  	if (sort_clone=
_roots) {
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7519  		for (i =3D 0;=
 i < sctx->clone_roots_cnt; i++) {
896c14f97f700ae Wang Shilong              2014-01-07  7520  			btrfs_root_d=
ec_send_in_progress(
896c14f97f700ae Wang Shilong              2014-01-07  7521  					sctx->clon=
e_roots[i].root);
0024652895e3479 Josef Bacik               2020-01-24  7522  			btrfs_put_ro=
ot(sctx->clone_roots[i].root);
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7523  		}
896c14f97f700ae Wang Shilong              2014-01-07  7524  	} else {
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7525  		for (i =3D 0;=
 sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700ae Wang Shilong              2014-01-07  7526  			btrfs_root_d=
ec_send_in_progress(
896c14f97f700ae Wang Shilong              2014-01-07  7527  					sctx->clon=
e_roots[i].root);
0024652895e3479 Josef Bacik               2020-01-24  7528  			btrfs_put_ro=
ot(sctx->clone_roots[i].root);
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7529  		}
896c14f97f700ae Wang Shilong              2014-01-07  7530  =

896c14f97f700ae Wang Shilong              2014-01-07  7531  		btrfs_root_de=
c_send_in_progress(send_root);
896c14f97f700ae Wang Shilong              2014-01-07  7532  	}
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7533  	if (sctx && !I=
S_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e5 David Sterba              2013-12-17  7534  		btrfs_root_de=
c_send_in_progress(sctx->parent_root);
0024652895e3479 Josef Bacik               2020-01-24  7535  		btrfs_put_roo=
t(sctx->parent_root);
6f9a3da5da9e7e5 Josef Bacik               2020-01-24  7536  	}
2c68653787f91c6 David Sterba              2013-12-16  7537  =

2f91306a3780990 David Sterba              2016-04-11  7538  	kvfree(clone_s=
ources_tmp);
31db9f7c23fbf7e Alexander Block           2012-07-25  7539  =

31db9f7c23fbf7e Alexander Block           2012-07-25  7540  	if (sctx) {
31db9f7c23fbf7e Alexander Block           2012-07-25  7541  		if (sctx->sen=
d_filp)
31db9f7c23fbf7e Alexander Block           2012-07-25  7542  			fput(sctx->s=
end_filp);
31db9f7c23fbf7e Alexander Block           2012-07-25  7543  =

c03d01f34042827 David Sterba              2016-04-11  7544  		kvfree(sctx->=
clone_roots);
c26e115488f26c8 Omar Sandoval             2020-05-01  7545  		if (sctx->fla=
gs & BTRFS_SEND_FLAG_STREAM_V2) {
c26e115488f26c8 Omar Sandoval             2020-05-01  7546  			vunmap(sctx-=
>send_buf);
c26e115488f26c8 Omar Sandoval             2020-05-01  7547  			for (i =3D 0=
; i < send_buf_num_pages; i++) {
c26e115488f26c8 Omar Sandoval             2020-05-01 @7548  				if (sctx->s=
end_buf_pages[i])

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1899299569584083796==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1899299569584083796==--

