Content-Type: multipart/mixed; boundary="===============7315311003675604059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nvdimm:libnvdimm-for-next 30/32] fs/fuse/dax.c:190 fuse_setup_one_mapping() warn: should 'start_idx << 21' be a 64 bit type?
Date: Sun, 12 Dec 2021 13:04:55 +0800
Message-ID: <202112121216.PwFSSS4i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7315311003675604059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-nvdimm(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git l=
ibnvdimm-for-next
head:   de291b5902860d18d6e02000808aeb833ec1feb6
commit: b842f1d14a190e217a8ee3f6dae9e1dff1817d87 [30/32] fsdax: don't requi=
re CONFIG_BLOCK
:::::: branch date: 4 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m031-20211211 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121216.PwFSSS4i-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/fuse/dax.c:190 fuse_setup_one_mapping() warn: should 'start_idx << 21' b=
e a 64 bit type?
fs/fuse/dax.c:871 dmap_writeback_invalidate() warn: should 'dmap->itn.start=
 << 21' be a 64 bit type?
fs/fuse/dax.c:965 inode_inline_reclaim_one_dmap() warn: should 'start_idx <=
< 21' be a 64 bit type?
fs/fuse/dax.c:1117 lookup_and_reclaim_dmap() warn: should 'start_idx << 21'=
 be a 64 bit type?

Old smatch warnings:
fs/fuse/dax.c:284 dmap_removemapping_list() error: uninitialized symbol 're=
t'.
fs/fuse/dax.c:716 fuse_dax_read_iter() warn: inconsistent returns '&inode->=
i_rwsem'.
fs/fuse/dax.c:774 fuse_dax_write_iter() warn: inconsistent returns '&inode-=
>i_rwsem'.

vim +190 fs/fuse/dax.c

c2d0ad00d948de Vivek Goyal   2020-08-19  181  =

c2d0ad00d948de Vivek Goyal   2020-08-19  182  static int fuse_setup_one_map=
ping(struct inode *inode, unsigned long start_idx,
c2d0ad00d948de Vivek Goyal   2020-08-19  183  				  struct fuse_dax_mapping=
 *dmap, bool writable,
c2d0ad00d948de Vivek Goyal   2020-08-19  184  				  bool upgrade)
c2d0ad00d948de Vivek Goyal   2020-08-19  185  {
fcee216beb9c15 Max Reitz     2020-05-06  186  	struct fuse_mount *fm =3D ge=
t_fuse_mount(inode);
fcee216beb9c15 Max Reitz     2020-05-06  187  	struct fuse_conn_dax *fcd =
=3D fm->fc->dax;
c2d0ad00d948de Vivek Goyal   2020-08-19  188  	struct fuse_inode *fi =3D ge=
t_fuse_inode(inode);
c2d0ad00d948de Vivek Goyal   2020-08-19  189  	struct fuse_setupmapping_in =
inarg;
c2d0ad00d948de Vivek Goyal   2020-08-19 @190  	loff_t offset =3D start_idx =
<< FUSE_DAX_SHIFT;
c2d0ad00d948de Vivek Goyal   2020-08-19  191  	FUSE_ARGS(args);
c2d0ad00d948de Vivek Goyal   2020-08-19  192  	ssize_t err;
c2d0ad00d948de Vivek Goyal   2020-08-19  193  =

c2d0ad00d948de Vivek Goyal   2020-08-19  194  	WARN_ON(fcd->nr_free_ranges =
< 0);
c2d0ad00d948de Vivek Goyal   2020-08-19  195  =

c2d0ad00d948de Vivek Goyal   2020-08-19  196  	/* Ask fuse daemon to setup =
mapping */
c2d0ad00d948de Vivek Goyal   2020-08-19  197  	memset(&inarg, 0, sizeof(ina=
rg));
c2d0ad00d948de Vivek Goyal   2020-08-19  198  	inarg.foffset =3D offset;
c2d0ad00d948de Vivek Goyal   2020-08-19  199  	inarg.fh =3D -1;
c2d0ad00d948de Vivek Goyal   2020-08-19  200  	inarg.moffset =3D dmap->wind=
ow_offset;
c2d0ad00d948de Vivek Goyal   2020-08-19  201  	inarg.len =3D FUSE_DAX_SZ;
c2d0ad00d948de Vivek Goyal   2020-08-19  202  	inarg.flags |=3D FUSE_SETUPM=
APPING_FLAG_READ;
c2d0ad00d948de Vivek Goyal   2020-08-19  203  	if (writable)
c2d0ad00d948de Vivek Goyal   2020-08-19  204  		inarg.flags |=3D FUSE_SETUP=
MAPPING_FLAG_WRITE;
c2d0ad00d948de Vivek Goyal   2020-08-19  205  	args.opcode =3D FUSE_SETUPMA=
PPING;
c2d0ad00d948de Vivek Goyal   2020-08-19  206  	args.nodeid =3D fi->nodeid;
c2d0ad00d948de Vivek Goyal   2020-08-19  207  	args.in_numargs =3D 1;
c2d0ad00d948de Vivek Goyal   2020-08-19  208  	args.in_args[0].size =3D siz=
eof(inarg);
c2d0ad00d948de Vivek Goyal   2020-08-19  209  	args.in_args[0].value =3D &i=
narg;
fcee216beb9c15 Max Reitz     2020-05-06  210  	err =3D fuse_simple_request(=
fm, &args);
c2d0ad00d948de Vivek Goyal   2020-08-19  211  	if (err < 0)
c2d0ad00d948de Vivek Goyal   2020-08-19  212  		return err;
c2d0ad00d948de Vivek Goyal   2020-08-19  213  	dmap->writable =3D writable;
c2d0ad00d948de Vivek Goyal   2020-08-19  214  	if (!upgrade) {
9a752d18c85ae5 Vivek Goyal   2020-08-19  215  		/*
c4e0cd4e0c1654 Zheng Yongjun 2021-06-04  216  		 * We don't take a referenc=
e on inode. inode is valid right now
9a752d18c85ae5 Vivek Goyal   2020-08-19  217  		 * and when inode is going =
away, cleanup logic should first
9a752d18c85ae5 Vivek Goyal   2020-08-19  218  		 * cleanup dmap entries.
9a752d18c85ae5 Vivek Goyal   2020-08-19  219  		 */
9a752d18c85ae5 Vivek Goyal   2020-08-19  220  		dmap->inode =3D inode;
c2d0ad00d948de Vivek Goyal   2020-08-19  221  		dmap->itn.start =3D dmap->i=
tn.last =3D start_idx;
c2d0ad00d948de Vivek Goyal   2020-08-19  222  		/* Protected by fi->dax->se=
m */
c2d0ad00d948de Vivek Goyal   2020-08-19  223  		interval_tree_insert(&dmap-=
>itn, &fi->dax->tree);
c2d0ad00d948de Vivek Goyal   2020-08-19  224  		fi->dax->nr++;
d0cfb9dcbca6eb Vivek Goyal   2020-08-19  225  		spin_lock(&fcd->lock);
d0cfb9dcbca6eb Vivek Goyal   2020-08-19  226  		list_add_tail(&dmap->busy_l=
ist, &fcd->busy_ranges);
d0cfb9dcbca6eb Vivek Goyal   2020-08-19  227  		fcd->nr_busy_ranges++;
d0cfb9dcbca6eb Vivek Goyal   2020-08-19  228  		spin_unlock(&fcd->lock);
c2d0ad00d948de Vivek Goyal   2020-08-19  229  	}
c2d0ad00d948de Vivek Goyal   2020-08-19  230  	return 0;
c2d0ad00d948de Vivek Goyal   2020-08-19  231  }
c2d0ad00d948de Vivek Goyal   2020-08-19  232  =


:::::: The code at line 190 was first introduced by commit
:::::: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc virtiofs: implement dax rea=
d/write operations

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7315311003675604059==--

