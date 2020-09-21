Content-Type: multipart/mixed; boundary="===============1814885181798281332=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [fuse:submounts 12/24] fs/fuse/dax.c:399:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Mon, 21 Sep 2020 11:51:39 +0300
Message-ID: <20200921085139.GT18329@kadam>
In-Reply-To: <202009182344.X3QA9BMJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1814885181798281332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These "reassigned a value before the old one has been used" warnings
are not useful at all because it ignores gotos so it's just false
positives.

regards,
dan carpenter

On Fri, Sep 18, 2020 at 11:07:48PM +0800, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> CC: fuse-devel(a)lists.sourceforge.net
> TO: Vivek Goyal <vgoyal@redhat.com>
> CC: Miklos Szeredi <mszeredi@redhat.com>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Liu Bo <bo.liu@linux.alibaba.com>
> CC: Peng Tao <tao.peng@linux.alibaba.com>
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
  submounts
> head:   b67fbd48cdf38c6bcc83b2a0e94b32ebeff3c918
> commit: c2d0ad00d948de73c78f05d2b3e5bdfa605035cc [12/24] virtiofs: implem=
ent dax read/write operations
> :::::: branch date: 2 hours ago
> :::::: commit date: 8 days ago
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> cppcheck warnings: (new ones prefixed by >>)
> =

> >> fs/fuse/dax.c:399:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
>     ret =3D fuse_setup_one_mapping(inode, pos >> FUSE_DAX_SHIFT, dmap, tr=
ue,
>         ^
>    fs/fuse/dax.c:385:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
>     ret =3D -EIO;
>         ^
>    fs/fuse/dax.c:399:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
>     ret =3D fuse_setup_one_mapping(inode, pos >> FUSE_DAX_SHIFT, dmap, tr=
ue,
>         ^
> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/commi=
t/?id=3Dc2d0ad00d948de73c78f05d2b3e5bdfa605035cc =

> git remote add fuse https://git.kernel.org/pub/scm/linux/kernel/git/mszer=
edi/fuse.git =

> git fetch --no-tags fuse submounts
> git checkout c2d0ad00d948de73c78f05d2b3e5bdfa605035cc
> vim +/ret +399 fs/fuse/dax.c
> =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  362  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  363  static int fuse_upgrade_dax_=
mapping(struct inode *inode, loff_t pos,
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  364  				    loff_t length, unsig=
ned int flags,
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  365  				    struct iomap *iomap)
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  366  {
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  367  	struct fuse_inode *fi =3D g=
et_fuse_inode(inode);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  368  	struct fuse_dax_mapping *dm=
ap;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  369  	int ret;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  370  	unsigned long idx =3D pos >=
> FUSE_DAX_SHIFT;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  371  	struct interval_tree_node *=
node;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  372  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  373  	/*
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  374  	 * Take exclusive lock so t=
hat only one caller can try to setup
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  375  	 * mapping and others wait.
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  376  	 */
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  377  	down_write(&fi->dax->sem);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  378  	node =3D interval_tree_iter=
_first(&fi->dax->tree, idx, idx);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  379  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  380  	/* We are holding either in=
ode lock or i_mmap_sem, and that should
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  381  	 * ensure that dmap can't r=
eclaimed or truncated and it should still
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  382  	 * be there in tree despite=
 the fact we dropped and re-acquired the
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  383  	 * lock.
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  384  	 */
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  385  	ret =3D -EIO;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  386  	if (WARN_ON(!node))
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  387  		goto out_err;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  388  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  389  	dmap =3D node_to_dmap(node);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  390  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19  391  	/* Maybe another thread alr=
eady upgraded mapping while we were not
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  392  	 * holding lock.
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  393  	 */
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  394  	if (dmap->writable) {
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  395  		ret =3D 0;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  396  		goto out_fill_iomap;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  397  	}
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  398  =

> c2d0ad00d948de7 Vivek Goyal 2020-08-19 @399  	ret =3D fuse_setup_one_mapp=
ing(inode, pos >> FUSE_DAX_SHIFT, dmap, true,
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  400  				     true);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  401  	if (ret < 0)
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  402  		goto out_err;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  403  out_fill_iomap:
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  404  	fuse_fill_iomap(inode, pos,=
 length, iomap, dmap, flags);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  405  out_err:
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  406  	up_write(&fi->dax->sem);
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  407  	return ret;
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  408  }
> c2d0ad00d948de7 Vivek Goyal 2020-08-19  409  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============1814885181798281332==--

