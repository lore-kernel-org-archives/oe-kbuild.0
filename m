Content-Type: multipart/mixed; boundary="===============2535260300280409960=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [fuse:submounts 12/24] fs/fuse/dax.c:399:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Fri, 18 Sep 2020 23:07:48 +0800
Message-ID: <202009182344.X3QA9BMJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2535260300280409960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: fuse-devel(a)lists.sourceforge.net
TO: Vivek Goyal <vgoyal@redhat.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Liu Bo <bo.liu@linux.alibaba.com>
CC: Peng Tao <tao.peng@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git s=
ubmounts
head:   b67fbd48cdf38c6bcc83b2a0e94b32ebeff3c918
commit: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc [12/24] virtiofs: implemen=
t dax read/write operations
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/fuse/dax.c:399:6: warning: Variable 'ret' is reassigned a value befor=
e the old one has been used. [redundantAssignment]
    ret =3D fuse_setup_one_mapping(inode, pos >> FUSE_DAX_SHIFT, dmap, true,
        ^
   fs/fuse/dax.c:385:6: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
    ret =3D -EIO;
        ^
   fs/fuse/dax.c:399:6: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
    ret =3D fuse_setup_one_mapping(inode, pos >> FUSE_DAX_SHIFT, dmap, true,
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/commit/=
?id=3Dc2d0ad00d948de73c78f05d2b3e5bdfa605035cc
git remote add fuse https://git.kernel.org/pub/scm/linux/kernel/git/mszered=
i/fuse.git
git fetch --no-tags fuse submounts
git checkout c2d0ad00d948de73c78f05d2b3e5bdfa605035cc
vim +/ret +399 fs/fuse/dax.c

c2d0ad00d948de7 Vivek Goyal 2020-08-19  362  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19  363  static int fuse_upgrade_dax_ma=
pping(struct inode *inode, loff_t pos,
c2d0ad00d948de7 Vivek Goyal 2020-08-19  364  				    loff_t length, unsigne=
d int flags,
c2d0ad00d948de7 Vivek Goyal 2020-08-19  365  				    struct iomap *iomap)
c2d0ad00d948de7 Vivek Goyal 2020-08-19  366  {
c2d0ad00d948de7 Vivek Goyal 2020-08-19  367  	struct fuse_inode *fi =3D get=
_fuse_inode(inode);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  368  	struct fuse_dax_mapping *dmap;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  369  	int ret;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  370  	unsigned long idx =3D pos >> =
FUSE_DAX_SHIFT;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  371  	struct interval_tree_node *no=
de;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  372  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19  373  	/*
c2d0ad00d948de7 Vivek Goyal 2020-08-19  374  	 * Take exclusive lock so tha=
t only one caller can try to setup
c2d0ad00d948de7 Vivek Goyal 2020-08-19  375  	 * mapping and others wait.
c2d0ad00d948de7 Vivek Goyal 2020-08-19  376  	 */
c2d0ad00d948de7 Vivek Goyal 2020-08-19  377  	down_write(&fi->dax->sem);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  378  	node =3D interval_tree_iter_f=
irst(&fi->dax->tree, idx, idx);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  379  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19  380  	/* We are holding either inod=
e lock or i_mmap_sem, and that should
c2d0ad00d948de7 Vivek Goyal 2020-08-19  381  	 * ensure that dmap can't rec=
laimed or truncated and it should still
c2d0ad00d948de7 Vivek Goyal 2020-08-19  382  	 * be there in tree despite t=
he fact we dropped and re-acquired the
c2d0ad00d948de7 Vivek Goyal 2020-08-19  383  	 * lock.
c2d0ad00d948de7 Vivek Goyal 2020-08-19  384  	 */
c2d0ad00d948de7 Vivek Goyal 2020-08-19  385  	ret =3D -EIO;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  386  	if (WARN_ON(!node))
c2d0ad00d948de7 Vivek Goyal 2020-08-19  387  		goto out_err;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  388  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19  389  	dmap =3D node_to_dmap(node);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  390  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19  391  	/* Maybe another thread alrea=
dy upgraded mapping while we were not
c2d0ad00d948de7 Vivek Goyal 2020-08-19  392  	 * holding lock.
c2d0ad00d948de7 Vivek Goyal 2020-08-19  393  	 */
c2d0ad00d948de7 Vivek Goyal 2020-08-19  394  	if (dmap->writable) {
c2d0ad00d948de7 Vivek Goyal 2020-08-19  395  		ret =3D 0;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  396  		goto out_fill_iomap;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  397  	}
c2d0ad00d948de7 Vivek Goyal 2020-08-19  398  =

c2d0ad00d948de7 Vivek Goyal 2020-08-19 @399  	ret =3D fuse_setup_one_mappin=
g(inode, pos >> FUSE_DAX_SHIFT, dmap, true,
c2d0ad00d948de7 Vivek Goyal 2020-08-19  400  				     true);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  401  	if (ret < 0)
c2d0ad00d948de7 Vivek Goyal 2020-08-19  402  		goto out_err;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  403  out_fill_iomap:
c2d0ad00d948de7 Vivek Goyal 2020-08-19  404  	fuse_fill_iomap(inode, pos, l=
ength, iomap, dmap, flags);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  405  out_err:
c2d0ad00d948de7 Vivek Goyal 2020-08-19  406  	up_write(&fi->dax->sem);
c2d0ad00d948de7 Vivek Goyal 2020-08-19  407  	return ret;
c2d0ad00d948de7 Vivek Goyal 2020-08-19  408  }
c2d0ad00d948de7 Vivek Goyal 2020-08-19  409  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2535260300280409960==--

