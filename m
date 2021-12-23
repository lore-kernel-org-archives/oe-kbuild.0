Content-Type: multipart/mixed; boundary="===============4070038779809385302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4331/9257] fs/fuse/dax.c:190 fuse_setup_one_mapping() warn: should 'start_idx << 21' be a 64 bit type?
Date: Thu, 23 Dec 2021 08:57:10 +0800
Message-ID: <202112230828.lE5ZoCbA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4070038779809385302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Dan Williams <dan.j.williams@intel.com>

Hi Christoph,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2bd48302750c652889a2604b3df8b591c1d3af08
commit: afd586f0d06ce3d81b7c474499630fec88833828 [4331/9257] dax: remove CO=
NFIG_DAX_DRIVER
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: microblaze-randconfig-m031-20211222 (https://download.01.org/0day-c=
i/archive/20211223/202112230828.lE5ZoCbA-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/fuse/dax.c:190 fuse_setup_one_mapping() warn: should 'start_idx << 21' b=
e a 64 bit type?
fs/fuse/dax.c:284 dmap_removemapping_list() error: uninitialized symbol 're=
t'.
fs/fuse/dax.c:871 dmap_writeback_invalidate() warn: should 'dmap->itn.start=
 << 21' be a 64 bit type?
fs/fuse/dax.c:965 inode_inline_reclaim_one_dmap() warn: should 'start_idx <=
< 21' be a 64 bit type?
fs/fuse/dax.c:1117 lookup_and_reclaim_dmap() warn: should 'start_idx << 21'=
 be a 64 bit type?

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

c2d0ad00d948de Vivek Goyal   2020-08-19  233  static int fuse_send_removema=
pping(struct inode *inode,
c2d0ad00d948de Vivek Goyal   2020-08-19  234  				   struct fuse_removemapp=
ing_in *inargp,
c2d0ad00d948de Vivek Goyal   2020-08-19  235  				   struct fuse_removemapp=
ing_one *remove_one)
c2d0ad00d948de Vivek Goyal   2020-08-19  236  {
c2d0ad00d948de Vivek Goyal   2020-08-19  237  	struct fuse_inode *fi =3D ge=
t_fuse_inode(inode);
fcee216beb9c15 Max Reitz     2020-05-06  238  	struct fuse_mount *fm =3D ge=
t_fuse_mount(inode);
c2d0ad00d948de Vivek Goyal   2020-08-19  239  	FUSE_ARGS(args);
c2d0ad00d948de Vivek Goyal   2020-08-19  240  =

c2d0ad00d948de Vivek Goyal   2020-08-19  241  	args.opcode =3D FUSE_REMOVEM=
APPING;
c2d0ad00d948de Vivek Goyal   2020-08-19  242  	args.nodeid =3D fi->nodeid;
c2d0ad00d948de Vivek Goyal   2020-08-19  243  	args.in_numargs =3D 2;
c2d0ad00d948de Vivek Goyal   2020-08-19  244  	args.in_args[0].size =3D siz=
eof(*inargp);
c2d0ad00d948de Vivek Goyal   2020-08-19  245  	args.in_args[0].value =3D in=
argp;
c2d0ad00d948de Vivek Goyal   2020-08-19  246  	args.in_args[1].size =3D ina=
rgp->count * sizeof(*remove_one);
c2d0ad00d948de Vivek Goyal   2020-08-19  247  	args.in_args[1].value =3D re=
move_one;
fcee216beb9c15 Max Reitz     2020-05-06  248  	return fuse_simple_request(f=
m, &args);
c2d0ad00d948de Vivek Goyal   2020-08-19  249  }
c2d0ad00d948de Vivek Goyal   2020-08-19  250  =

c2d0ad00d948de Vivek Goyal   2020-08-19  251  static int dmap_removemapping=
_list(struct inode *inode, unsigned int num,
c2d0ad00d948de Vivek Goyal   2020-08-19  252  				   struct list_head *to_r=
emove)
c2d0ad00d948de Vivek Goyal   2020-08-19  253  {
c2d0ad00d948de Vivek Goyal   2020-08-19  254  	struct fuse_removemapping_on=
e *remove_one, *ptr;
c2d0ad00d948de Vivek Goyal   2020-08-19  255  	struct fuse_removemapping_in=
 inarg;
c2d0ad00d948de Vivek Goyal   2020-08-19  256  	struct fuse_dax_mapping *dma=
p;
c2d0ad00d948de Vivek Goyal   2020-08-19  257  	int ret, i =3D 0, nr_alloc;
c2d0ad00d948de Vivek Goyal   2020-08-19  258  =

c2d0ad00d948de Vivek Goyal   2020-08-19  259  	nr_alloc =3D min_t(unsigned =
int, num, FUSE_REMOVEMAPPING_MAX_ENTRY);
c2d0ad00d948de Vivek Goyal   2020-08-19  260  	remove_one =3D kmalloc_array=
(nr_alloc, sizeof(*remove_one), GFP_NOFS);
c2d0ad00d948de Vivek Goyal   2020-08-19  261  	if (!remove_one)
c2d0ad00d948de Vivek Goyal   2020-08-19  262  		return -ENOMEM;
c2d0ad00d948de Vivek Goyal   2020-08-19  263  =

c2d0ad00d948de Vivek Goyal   2020-08-19  264  	ptr =3D remove_one;
c2d0ad00d948de Vivek Goyal   2020-08-19  265  	list_for_each_entry(dmap, to=
_remove, list) {
c2d0ad00d948de Vivek Goyal   2020-08-19  266  		ptr->moffset =3D dmap->wind=
ow_offset;
c2d0ad00d948de Vivek Goyal   2020-08-19  267  		ptr->len =3D dmap->length;
c2d0ad00d948de Vivek Goyal   2020-08-19  268  		ptr++;
c2d0ad00d948de Vivek Goyal   2020-08-19  269  		i++;
c2d0ad00d948de Vivek Goyal   2020-08-19  270  		num--;
c2d0ad00d948de Vivek Goyal   2020-08-19  271  		if (i >=3D nr_alloc || num =
=3D=3D 0) {
c2d0ad00d948de Vivek Goyal   2020-08-19  272  			memset(&inarg, 0, sizeof(i=
narg));
c2d0ad00d948de Vivek Goyal   2020-08-19  273  			inarg.count =3D i;
c2d0ad00d948de Vivek Goyal   2020-08-19  274  			ret =3D fuse_send_removema=
pping(inode, &inarg,
c2d0ad00d948de Vivek Goyal   2020-08-19  275  						      remove_one);
c2d0ad00d948de Vivek Goyal   2020-08-19  276  			if (ret)
c2d0ad00d948de Vivek Goyal   2020-08-19  277  				goto out;
c2d0ad00d948de Vivek Goyal   2020-08-19  278  			ptr =3D remove_one;
c2d0ad00d948de Vivek Goyal   2020-08-19  279  			i =3D 0;
c2d0ad00d948de Vivek Goyal   2020-08-19  280  		}
c2d0ad00d948de Vivek Goyal   2020-08-19  281  	}
c2d0ad00d948de Vivek Goyal   2020-08-19  282  out:
c2d0ad00d948de Vivek Goyal   2020-08-19  283  	kfree(remove_one);
c2d0ad00d948de Vivek Goyal   2020-08-19 @284  	return ret;
c2d0ad00d948de Vivek Goyal   2020-08-19  285  }
c2d0ad00d948de Vivek Goyal   2020-08-19  286  =


:::::: The code at line 190 was first introduced by commit
:::::: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc virtiofs: implement dax rea=
d/write operations

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4070038779809385302==--

