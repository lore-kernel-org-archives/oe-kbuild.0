Content-Type: multipart/mixed; boundary="===============2582866800569532919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/nfs/dir.c:324 nfs_readdir_page_array_append() warn: potential spectre issue 'array->array' [r]
Date: Mon, 04 Apr 2022 00:20:31 +0800
Message-ID: <202204040033.RYIj3Knx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2582866800569532919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 0adf85b445c7fbc5d2df1f8c1bc54d62c4340237 NFS: Optimise away the pre=
vious cookie field
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20404/202204040033.RYIj3Knx-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/nfs/dir.c:324 nfs_readdir_page_array_append() warn: potential spectre is=
sue 'array->array' [r]

vim +324 fs/nfs/dir.c

d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  303  =

0adf85b445c7fb Trond Myklebust 2022-02-27  304  static int nfs_readdir_page=
_array_append(struct page *page,
0adf85b445c7fb Trond Myklebust 2022-02-27  305  					 const struct nfs_entr=
y *entry,
0adf85b445c7fb Trond Myklebust 2022-02-27  306  					 u64 *cookie)
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  307  {
a52a8a6adad99e Trond Myklebust 2020-11-01  308  	struct nfs_cache_array *ar=
ray;
4a201d6e3f4253 Trond Myklebust 2010-10-23  309  	struct nfs_cache_array_ent=
ry *cache_entry;
a52a8a6adad99e Trond Myklebust 2020-11-01  310  	const char *name;
0adf85b445c7fb Trond Myklebust 2022-02-27  311  	int ret =3D -ENOMEM;
4a201d6e3f4253 Trond Myklebust 2010-10-23  312  =

a52a8a6adad99e Trond Myklebust 2020-11-01  313  	name =3D nfs_readdir_copy_=
name(entry->name, entry->len);
3020093f578fb6 Trond Myklebust 2010-11-20  314  =

a52a8a6adad99e Trond Myklebust 2020-11-01  315  	array =3D kmap_atomic(page=
);
0adf85b445c7fb Trond Myklebust 2022-02-27  316  	if (!name)
0adf85b445c7fb Trond Myklebust 2022-02-27  317  		goto out;
b1e21c97437f64 Trond Myklebust 2020-11-01  318  	ret =3D nfs_readdir_array_=
can_expand(array);
a52a8a6adad99e Trond Myklebust 2020-11-01  319  	if (ret) {
a52a8a6adad99e Trond Myklebust 2020-11-01  320  		kfree(name);
4a201d6e3f4253 Trond Myklebust 2010-10-23  321  		goto out;
a52a8a6adad99e Trond Myklebust 2020-11-01  322  	}
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  323  =

b1e21c97437f64 Trond Myklebust 2020-11-01 @324  	cache_entry =3D &array->ar=
ray[array->size];
0adf85b445c7fb Trond Myklebust 2022-02-27  325  	cache_entry->cookie =3D ar=
ray->last_cookie;
4a201d6e3f4253 Trond Myklebust 2010-10-23  326  	cache_entry->ino =3D entry=
->ino;
0b26a0bf6ff398 Trond Myklebust 2010-11-20  327  	cache_entry->d_type =3D en=
try->d_type;
a52a8a6adad99e Trond Myklebust 2020-11-01  328  	cache_entry->name_len =3D =
entry->len;
a52a8a6adad99e Trond Myklebust 2020-11-01  329  	cache_entry->name =3D name;
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  330  	array->last_cookie =3D ent=
ry->cookie;
762567b7c798af Trond Myklebust 2020-11-04  331  	if (array->last_cookie <=
=3D cache_entry->cookie)
762567b7c798af Trond Myklebust 2020-11-04  332  		array->cookies_are_ordere=
d =3D 0;
8cd51a0ccd1bed Trond Myklebust 2010-11-15  333  	array->size++;
47c716cbf638a1 Trond Myklebust 2010-12-07  334  	if (entry->eof !=3D 0)
b1e21c97437f64 Trond Myklebust 2020-11-01  335  		nfs_readdir_array_set_eof=
(array);
4a201d6e3f4253 Trond Myklebust 2010-10-23  336  out:
0adf85b445c7fb Trond Myklebust 2022-02-27  337  	*cookie =3D array->last_co=
okie;
a52a8a6adad99e Trond Myklebust 2020-11-01  338  	kunmap_atomic(array);
4a201d6e3f4253 Trond Myklebust 2010-10-23  339  	return ret;
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  340  }
d1bacf9eb2fd0e Bryan Schumaker 2010-09-24  341  =


:::::: The code at line 324 was first introduced by commit
:::::: b1e21c97437f64d0a00f8fea1f9e64e77e0e4242 NFS: Clean up readdir struc=
t nfs_cache_array

:::::: TO: Trond Myklebust <trond.myklebust@hammerspace.com>
:::::: CC: Trond Myklebust <trond.myklebust@hammerspace.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2582866800569532919==--

