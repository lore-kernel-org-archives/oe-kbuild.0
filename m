Content-Type: multipart/mixed; boundary="===============2329745494540168596=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [rhvgoyal:virtiofs-dax-5.5 13/27] fs/fuse/file.c:340 dmap_removemapping_list() error: uninitialized symbol 'ret'.
Date: Fri, 10 Jan 2020 08:42:58 +0300
Message-ID: <20200110054258.GE1770@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2329745494540168596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/rhvgoyal/linux virtiofs-dax-5.5
head:   1e5ce59e58194ee5ad14fa26fb617a2c54ab8bf1
commit: 294ba78007c7bdd196f37c85a82e57eecc1918ae [13/27] fuse, dax: Impleme=
nt dax read/write operations

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/fuse/file.c:340 dmap_removemapping_list() error: uninitialized symbol 'r=
et'.

# https://github.com/rhvgoyal/linux/commit/294ba78007c7bdd196f37c85a82e57ee=
cc1918ae
git remote add rhvgoyal https://github.com/rhvgoyal/linux
git remote update rhvgoyal
git checkout 294ba78007c7bdd196f37c85a82e57eecc1918ae
vim +/ret +340 fs/fuse/file.c

294ba78007c7bd Vivek Goyal 2018-11-19  307  static int dmap_removemapping_l=
ist(struct inode *inode, unsigned num,
294ba78007c7bd Vivek Goyal 2018-11-19  308  				   struct list_head *to_rem=
ove)
294ba78007c7bd Vivek Goyal 2018-11-19  309  {
294ba78007c7bd Vivek Goyal 2018-11-19  310  	struct fuse_removemapping_one =
*remove_one, *ptr;
294ba78007c7bd Vivek Goyal 2018-11-19  311  	struct fuse_removemapping_in i=
narg;
294ba78007c7bd Vivek Goyal 2018-11-19  312  	struct fuse_dax_mapping *dmap;
294ba78007c7bd Vivek Goyal 2018-11-19  313  	int ret, i =3D 0, nr_alloc;
294ba78007c7bd Vivek Goyal 2018-11-19  314  =

294ba78007c7bd Vivek Goyal 2018-11-19  315  	nr_alloc =3D min_t(unsigned in=
t, num, FUSE_REMOVEMAPPING_MAX_ENTRY);
294ba78007c7bd Vivek Goyal 2018-11-19  316  	remove_one =3D kmalloc_array(n=
r_alloc, sizeof(*remove_one), GFP_NOFS);
294ba78007c7bd Vivek Goyal 2018-11-19  317  	if (!remove_one)
294ba78007c7bd Vivek Goyal 2018-11-19  318  		return -ENOMEM;
294ba78007c7bd Vivek Goyal 2018-11-19  319  =

294ba78007c7bd Vivek Goyal 2018-11-19  320  	ptr =3D remove_one;
294ba78007c7bd Vivek Goyal 2018-11-19  321  	list_for_each_entry(dmap, to_r=
emove, list) {
                                                                          ^=
^^^^^^^^
Can this list be empty?

294ba78007c7bd Vivek Goyal 2018-11-19  322  		ptr->moffset =3D dmap->window=
_offset;
294ba78007c7bd Vivek Goyal 2018-11-19  323  		ptr->len =3D dmap->length;
294ba78007c7bd Vivek Goyal 2018-11-19  324  		ptr++;
294ba78007c7bd Vivek Goyal 2018-11-19  325  		i++;
294ba78007c7bd Vivek Goyal 2018-11-19  326  		num--;
294ba78007c7bd Vivek Goyal 2018-11-19  327  		if (i >=3D nr_alloc || num =
=3D=3D 0) {
294ba78007c7bd Vivek Goyal 2018-11-19  328  			memset(&inarg, 0, sizeof(ina=
rg));
294ba78007c7bd Vivek Goyal 2018-11-19  329  			inarg.count =3D i;
294ba78007c7bd Vivek Goyal 2018-11-19  330  			ret =3D fuse_send_removemapp=
ing(inode, &inarg,
294ba78007c7bd Vivek Goyal 2018-11-19  331  						      remove_one);
294ba78007c7bd Vivek Goyal 2018-11-19  332  			if (ret)
294ba78007c7bd Vivek Goyal 2018-11-19  333  				goto out;
294ba78007c7bd Vivek Goyal 2018-11-19  334  			ptr =3D remove_one;
294ba78007c7bd Vivek Goyal 2018-11-19  335  			i =3D 0;
294ba78007c7bd Vivek Goyal 2018-11-19  336  		}
294ba78007c7bd Vivek Goyal 2018-11-19  337  	}
294ba78007c7bd Vivek Goyal 2018-11-19  338  out:
294ba78007c7bd Vivek Goyal 2018-11-19  339  	kfree(remove_one);
294ba78007c7bd Vivek Goyal 2018-11-19 @340  	return ret;
294ba78007c7bd Vivek Goyal 2018-11-19  341  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2329745494540168596==--

