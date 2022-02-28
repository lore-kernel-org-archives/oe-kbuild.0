Content-Type: multipart/mixed; boundary="===============1268058107397338935=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trondmy-nfs:testing 48/49] fs/nfs/dir.c:319 nfs_readdir_page_array_append() warn: potential spectre issue 'array->array' [r]
Date: Mon, 28 Feb 2022 08:34:50 +0800
Message-ID: <202202280850.EvOmX9ep-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1268058107397338935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-nfs(a)vger.kernel.org
TO: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   fcfa8460f356ba4174b43afdfa8ef83fcc2a2839
commit: 69e9fca6b8e59745438856462e8f1b9255d5198f [48/49] NFS: Optimise away=
 the previous cookie field
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20228/202202280850.EvOmX9ep-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/nfs/dir.c:319 nfs_readdir_page_array_append() warn: potential spectre is=
sue 'array->array' [r]

vim +319 fs/nfs/dir.c

d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  298  =

69e9fca6b8e597 Trond Myklebust 2022-02-27  299  static int nfs_readdir_page=
_array_append(struct page *page,
69e9fca6b8e597 Trond Myklebust 2022-02-27  300  					 const struct nfs_entr=
y *entry,
69e9fca6b8e597 Trond Myklebust 2022-02-27  301  					 u64 *cookie)
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  302  {
a52a8a6adad99e Trond Myklebust 2020-11-01  303  	struct nfs_cache_array *ar=
ray;
4a201d6e3f4253 Trond Myklebust 2010-10-23  304  	struct nfs_cache_array_ent=
ry *cache_entry;
a52a8a6adad99e Trond Myklebust 2020-11-01  305  	const char *name;
69e9fca6b8e597 Trond Myklebust 2022-02-27  306  	int ret =3D -ENOMEM;
4a201d6e3f4253 Trond Myklebust 2010-10-23  307  =

a52a8a6adad99e Trond Myklebust 2020-11-01  308  	name =3D nfs_readdir_copy_=
name(entry->name, entry->len);
3020093f578fb6 Trond Myklebust 2010-11-20  309  =

a52a8a6adad99e Trond Myklebust 2020-11-01  310  	array =3D kmap_atomic(page=
);
69e9fca6b8e597 Trond Myklebust 2022-02-27  311  	if (!name)
69e9fca6b8e597 Trond Myklebust 2022-02-27  312  		goto out;
b1e21c97437f64 Trond Myklebust 2020-11-01  313  	ret =3D nfs_readdir_array_=
can_expand(array);
a52a8a6adad99e Trond Myklebust 2020-11-01  314  	if (ret) {
a52a8a6adad99e Trond Myklebust 2020-11-01  315  		kfree(name);
4a201d6e3f4253 Trond Myklebust 2010-10-23  316  		goto out;
a52a8a6adad99e Trond Myklebust 2020-11-01  317  	}
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  318  =

b1e21c97437f64 Trond Myklebust 2020-11-01 @319  	cache_entry =3D &array->ar=
ray[array->size];
69e9fca6b8e597 Trond Myklebust 2022-02-27  320  	cache_entry->cookie =3D ar=
ray->last_cookie;
4a201d6e3f4253 Trond Myklebust 2010-10-23  321  	cache_entry->ino =3D entry=
->ino;
0b26a0bf6ff398 Trond Myklebust 2010-11-20  322  	cache_entry->d_type =3D en=
try->d_type;
a52a8a6adad99e Trond Myklebust 2020-11-01  323  	cache_entry->name_len =3D =
entry->len;
a52a8a6adad99e Trond Myklebust 2020-11-01  324  	cache_entry->name =3D name;
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  325  	array->last_cookie =3D ent=
ry->cookie;
762567b7c798af Trond Myklebust 2020-11-04  326  	if (array->last_cookie <=
=3D cache_entry->cookie)
762567b7c798af Trond Myklebust 2020-11-04  327  		array->cookies_are_ordere=
d =3D 0;
8cd51a0ccd1bed Trond Myklebust 2010-11-15  328  	array->size++;
47c716cbf638a1 Trond Myklebust 2010-12-07  329  	if (entry->eof !=3D 0)
b1e21c97437f64 Trond Myklebust 2020-11-01  330  		nfs_readdir_array_set_eof=
(array);
4a201d6e3f4253 Trond Myklebust 2010-10-23  331  out:
69e9fca6b8e597 Trond Myklebust 2022-02-27  332  	*cookie =3D array->last_co=
okie;
a52a8a6adad99e Trond Myklebust 2020-11-01  333  	kunmap_atomic(array);
4a201d6e3f4253 Trond Myklebust 2010-10-23  334  	return ret;
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  335  }
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  336  =


:::::: The code at line 319 was first introduced by commit
:::::: b1e21c97437f64d0a00f8fea1f9e64e77e0e4242 NFS: Clean up readdir struc=
t nfs_cache_array

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1268058107397338935==--

