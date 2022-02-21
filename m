Content-Type: multipart/mixed; boundary="===============4972246701866073406=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:axboe/linux-block/perf-wip 5/17] drivers/md/bcache/util.c:256 bch_bio_map() error: uninitialized symbol 'page'.
Date: Mon, 21 Feb 2022 23:10:40 +0800
Message-ID: <202202212347.2BTScWAC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4972246701866073406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/perf-w=
ip
head:   653193284c45da1c727d45de716d9b48b1019e66
commit: 97f573494a3c088d6e249ddccdbb238b3ea267e0 [5/17] block: add bvec_set=
_page() helper
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-m031-20220220 (https://download.01.org/0day-ci/archi=
ve/20220221/202202212347.2BTScWAC-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/bcache/util.c:256 bch_bio_map() error: uninitialized symbol 'pag=
e'.

vim +/page +256 drivers/md/bcache/util.c

cafe563591446c Kent Overstreet 2013-03-23  223  =

c2421edf5f9151 Ming Lei        2017-12-18  224  /*
c2421edf5f9151 Ming Lei        2017-12-18  225   * Generally it isn't good =
to access .bi_io_vec and .bi_vcnt directly,
c2421edf5f9151 Ming Lei        2017-12-18  226   * the preferred way is bio=
_add_page, but in this case, bch_bio_map()
c2421edf5f9151 Ming Lei        2017-12-18  227   * supposes that the bvec t=
able is empty, so it is safe to access
c2421edf5f9151 Ming Lei        2017-12-18  228   * .bi_vcnt & .bi_io_vec in=
 this way even after multipage bvec is
c2421edf5f9151 Ming Lei        2017-12-18  229   * supported.
c2421edf5f9151 Ming Lei        2017-12-18  230   */
169ef1cf6171d3 Kent Overstreet 2013-03-28  231  void bch_bio_map(struct bio=
 *bio, void *base)
cafe563591446c Kent Overstreet 2013-03-23  232  {
4f024f3797c43c Kent Overstreet 2013-10-11  233  	size_t size =3D bio->bi_it=
er.bi_size;
cafe563591446c Kent Overstreet 2013-03-23  234  	struct bio_vec *bv =3D bio=
->bi_io_vec;
97f573494a3c08 Jens Axboe      2021-10-12  235  	unsigned int len, offset;
97f573494a3c08 Jens Axboe      2021-10-12  236  	struct page *page;
cafe563591446c Kent Overstreet 2013-03-23  237  =

4f024f3797c43c Kent Overstreet 2013-10-11  238  	BUG_ON(!bio->bi_iter.bi_si=
ze);
cafe563591446c Kent Overstreet 2013-03-23  239  	BUG_ON(bio->bi_vcnt);
cafe563591446c Kent Overstreet 2013-03-23  240  =

97f573494a3c08 Jens Axboe      2021-10-12  241  	offset =3D base ? offset_i=
n_page(base) : 0;
cafe563591446c Kent Overstreet 2013-03-23  242  	goto start;
cafe563591446c Kent Overstreet 2013-03-23  243  =

cafe563591446c Kent Overstreet 2013-03-23  244  	for (; size; bio->bi_vcnt+=
+, bv++) {
97f573494a3c08 Jens Axboe      2021-10-12  245  		offset		=3D 0;
97f573494a3c08 Jens Axboe      2021-10-12  246  start:
97f573494a3c08 Jens Axboe      2021-10-12  247  		len		=3D min_t(size_t, PA=
GE_SIZE - offset, size);
cafe563591446c Kent Overstreet 2013-03-23  248  		if (base) {
97f573494a3c08 Jens Axboe      2021-10-12  249  			page =3D is_vmalloc_addr=
(base)
cafe563591446c Kent Overstreet 2013-03-23  250  				? vmalloc_to_page(base)
cafe563591446c Kent Overstreet 2013-03-23  251  				: virt_to_page(base);
cafe563591446c Kent Overstreet 2013-03-23  252  =

97f573494a3c08 Jens Axboe      2021-10-12  253  			base +=3D len;
cafe563591446c Kent Overstreet 2013-03-23  254  		}
cafe563591446c Kent Overstreet 2013-03-23  255  =

97f573494a3c08 Jens Axboe      2021-10-12 @256  		bvec_set_page(bv, page, l=
en, offset);
97f573494a3c08 Jens Axboe      2021-10-12  257  		size -=3D len;
cafe563591446c Kent Overstreet 2013-03-23  258  	}
cafe563591446c Kent Overstreet 2013-03-23  259  }
cafe563591446c Kent Overstreet 2013-03-23  260  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4972246701866073406==--

