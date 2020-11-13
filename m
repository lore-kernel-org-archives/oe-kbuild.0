Content-Type: multipart/mixed; boundary="===============5618890757974362868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:generic_file_buffered_read 5/9] mm/filemap.c:2314:3: warning: Either the condition '!page' is redundant or there is possible null pointer dereference: page.
Date: Fri, 13 Nov 2020 18:25:26 +0800
Message-ID: <202011131820.9RwEkaDb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5618890757974362868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git generic_file_buffered_r=
ead
head:   ea3a598ae53985db7981636484dce1cdacb49135
commit: f14fa6693827f7fccfb1cf4f0ca660d229d58b53 [5/9] mm: simplify generic=
_file_buffered_read_no_cached_page
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/filemap.c:2314:3: warning: Either the condition '!page' is redundant =
or there is possible null pointer dereference: page. [nullPointerRedundantC=
heck]
    *page =3D page_cache_alloc(mapping);
     ^
   mm/filemap.c:2315:6: note: Assuming that condition '!page' is not redund=
ant
    if (!page)
        ^
   mm/filemap.c:2314:3: note: Null pointer dereference
    *page =3D page_cache_alloc(mapping);
     ^

vim +2314 mm/filemap.c

84ebe7df438b44c Kent Overstreet   2020-10-29  2302  =

f14fa6693827f7f Christoph Hellwig 2020-10-30  2303  static int filemap_new_=
page(struct kiocb *iocb, struct iov_iter *iter,
f14fa6693827f7f Christoph Hellwig 2020-10-30  2304  		struct page **page)
84ebe7df438b44c Kent Overstreet   2020-10-29  2305  {
f14fa6693827f7f Christoph Hellwig 2020-10-30  2306  	struct address_space *=
mapping =3D iocb->ki_filp->f_mapping;
f14fa6693827f7f Christoph Hellwig 2020-10-30  2307  	gfp_t gfp =3D mapping_=
gfp_constraint(mapping, GFP_KERNEL);
84ebe7df438b44c Kent Overstreet   2020-10-29  2308  	pgoff_t index =3D iocb=
->ki_pos >> PAGE_SHIFT;
84ebe7df438b44c Kent Overstreet   2020-10-29  2309  	int error;
84ebe7df438b44c Kent Overstreet   2020-10-29  2310  =

84ebe7df438b44c Kent Overstreet   2020-10-29  2311  	if (iocb->ki_flags & I=
OCB_NOIO)
f14fa6693827f7f Christoph Hellwig 2020-10-30  2312  		return -EAGAIN;
84ebe7df438b44c Kent Overstreet   2020-10-29  2313  =

f14fa6693827f7f Christoph Hellwig 2020-10-30 @2314  	*page =3D page_cache_a=
lloc(mapping);
84ebe7df438b44c Kent Overstreet   2020-10-29  2315  	if (!page)
f14fa6693827f7f Christoph Hellwig 2020-10-30  2316  		return -ENOMEM;
f14fa6693827f7f Christoph Hellwig 2020-10-30  2317  	error =3D add_to_page_=
cache_lru(*page, mapping, index, gfp);
84ebe7df438b44c Kent Overstreet   2020-10-29  2318  	if (error) {
f14fa6693827f7f Christoph Hellwig 2020-10-30  2319  		put_page(*page);
f14fa6693827f7f Christoph Hellwig 2020-10-30  2320  		return error;
994fc28c7b1e697 Zach Brown        2005-12-15  2321  	}
84ebe7df438b44c Kent Overstreet   2020-10-29  2322  =

f14fa6693827f7f Christoph Hellwig 2020-10-30  2323  	return filemap_readpag=
e(iocb, *page);
994fc28c7b1e697 Zach Brown        2005-12-15  2324  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  2325  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5618890757974362868==--

