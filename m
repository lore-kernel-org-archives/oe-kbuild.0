Content-Type: multipart/mixed; boundary="===============1856696537632261589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alibaba-cloud:linux-next 433/526] block/blk-merge.c:291:8: warning: Variable 'prev' is reassigned a value before the old one has been used.
Date: Thu, 03 Sep 2020 00:40:24 +0800
Message-ID: <202009030017.mBrTqgcM%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1856696537632261589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: alikernel-developer(a)linux.alibaba.com

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   f1885e3acf28c210490d5e53ec707beb261b1d5c
commit: e6e31258c75fab182501d58fca427529c2019e75 [433/526] alinux: block: d=
on't decrement nr_phys_segments for physically contigous segments
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> block/blk-merge.c:291:8: warning: Variable 'prev' is reassigned a value =
before the old one has been used. [redundantAssignment]
     prev =3D 0;
          ^
   block/blk-merge.c:287:9: note: Variable 'prev' is reassigned a value bef=
ore the old one has been used.
      prev =3D 1;
           ^
   block/blk-merge.c:291:8: note: Variable 'prev' is reassigned a value bef=
ore the old one has been used.
     prev =3D 0;
          ^

# https://github.com/alibaba/cloud-kernel/commit/e6e31258c75fab182501d58fca=
427529c2019e75
git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
git fetch --no-tags alibaba-cloud linux-next
git checkout e6e31258c75fab182501d58fca427529c2019e75
vim +/prev +291 block/blk-merge.c

54efd50bfd873e Kent Overstreet    2015-04-23  231  =

1e42807918d17e Jens Axboe         2009-02-23  232  static unsigned int __bl=
k_recalc_rq_segments(struct request_queue *q,
0738854939e6ec Ming Lei           2014-09-02  233  					     struct bio *bi=
o,
0738854939e6ec Ming Lei           2014-09-02  234  					     bool no_sg_mer=
ge)
d6d48196961729 Jens Axboe         2008-01-29  235  {
7988613b0e5b26 Kent Overstreet    2013-11-23  236  	struct bio_vec bv, bvpr=
v =3D { NULL };
54efd50bfd873e Kent Overstreet    2015-04-23  237  	int cluster, prev =3D 0;
1e42807918d17e Jens Axboe         2009-02-23  238  	unsigned int seg_size, =
nr_phys_segs;
59247eaea50cc6 Jens Axboe         2009-03-06  239  	struct bio *fbio, *bbio;
7988613b0e5b26 Kent Overstreet    2013-11-23  240  	struct bvec_iter iter;
d6d48196961729 Jens Axboe         2008-01-29  241  =

1e42807918d17e Jens Axboe         2009-02-23  242  	if (!bio)
1e42807918d17e Jens Axboe         2009-02-23  243  		return 0;
d6d48196961729 Jens Axboe         2008-01-29  244  =

a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  245  	switch (bio_op(bio)) {
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  246  	case REQ_OP_DISCARD:
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  247  	case REQ_OP_SECURE_ERAS=
E:
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  248  	case REQ_OP_WRITE_ZEROE=
S:
f9d03f96b98800 Christoph Hellwig  2016-12-08  249  		return 0;
f9d03f96b98800 Christoph Hellwig  2016-12-08  250  	case REQ_OP_WRITE_SAME:
5cb8850c9c4a76 Kent Overstreet    2014-02-07  251  		return 1;
a6f0788ec2881a Chaitanya Kulkarni 2016-11-30  252  	}
5cb8850c9c4a76 Kent Overstreet    2014-02-07  253  =

1e42807918d17e Jens Axboe         2009-02-23  254  	fbio =3D bio;
e692cb668fdd5a Martin K. Petersen 2010-12-01  255  	cluster =3D blk_queue_c=
luster(q);
5df97b91b5d7ed Mikulas Patocka    2008-08-15  256  	seg_size =3D 0;
2c8919dee65992 Andi Kleen         2010-06-21  257  	nr_phys_segs =3D 0;
1e42807918d17e Jens Axboe         2009-02-23  258  	for_each_bio(bio) {
7988613b0e5b26 Kent Overstreet    2013-11-23  259  		bio_for_each_segment(b=
v, bio, iter) {
05f1dd53152173 Jens Axboe         2014-05-29  260  			/*
05f1dd53152173 Jens Axboe         2014-05-29  261  			 * If SG merging is d=
isabled, each bio vector is
05f1dd53152173 Jens Axboe         2014-05-29  262  			 * a segment
05f1dd53152173 Jens Axboe         2014-05-29  263  			 */
05f1dd53152173 Jens Axboe         2014-05-29  264  			if (no_sg_merge)
05f1dd53152173 Jens Axboe         2014-05-29  265  				goto new_segment;
05f1dd53152173 Jens Axboe         2014-05-29  266  =

54efd50bfd873e Kent Overstreet    2015-04-23  267  			if (prev && cluster) {
7988613b0e5b26 Kent Overstreet    2013-11-23  268  				if (seg_size + bv.bv=
_len
ae03bf639a5027 Martin K. Petersen 2009-05-22  269  				    > queue_max_segm=
ent_size(q))
d6d48196961729 Jens Axboe         2008-01-29  270  					goto new_segment;
7988613b0e5b26 Kent Overstreet    2013-11-23  271  				if (!BIOVEC_PHYS_MER=
GEABLE(&bvprv, &bv))
d6d48196961729 Jens Axboe         2008-01-29  272  					goto new_segment;
7988613b0e5b26 Kent Overstreet    2013-11-23  273  				if (!BIOVEC_SEG_BOUN=
DARY(q, &bvprv, &bv))
d6d48196961729 Jens Axboe         2008-01-29  274  					goto new_segment;
d6d48196961729 Jens Axboe         2008-01-29  275  =

7988613b0e5b26 Kent Overstreet    2013-11-23  276  				seg_size +=3D bv.bv_=
len;
d6d48196961729 Jens Axboe         2008-01-29  277  				bvprv =3D bv;
d6d48196961729 Jens Axboe         2008-01-29  278  				continue;
d6d48196961729 Jens Axboe         2008-01-29  279  			}
d6d48196961729 Jens Axboe         2008-01-29  280  new_segment:
1e42807918d17e Jens Axboe         2009-02-23  281  			if (nr_phys_segs =3D=
=3D 1 && seg_size >
1e42807918d17e Jens Axboe         2009-02-23  282  			    fbio->bi_seg_fron=
t_size)
1e42807918d17e Jens Axboe         2009-02-23  283  				fbio->bi_seg_front_s=
ize =3D seg_size;
8677142710516d FUJITA Tomonori    2008-10-13  284  =

d6d48196961729 Jens Axboe         2008-01-29  285  			nr_phys_segs++;
d6d48196961729 Jens Axboe         2008-01-29  286  			bvprv =3D bv;
54efd50bfd873e Kent Overstreet    2015-04-23  287  			prev =3D 1;
7988613b0e5b26 Kent Overstreet    2013-11-23  288  			seg_size =3D bv.bv_le=
n;
d6d48196961729 Jens Axboe         2008-01-29  289  		}
59247eaea50cc6 Jens Axboe         2009-03-06  290  		bbio =3D bio;
e6e31258c75fab Baolin Wang        2019-05-21 @291  		prev =3D 0;
1e42807918d17e Jens Axboe         2009-02-23  292  	}
1e42807918d17e Jens Axboe         2009-02-23  293  =

59247eaea50cc6 Jens Axboe         2009-03-06  294  	if (nr_phys_segs =3D=3D=
 1 && seg_size > fbio->bi_seg_front_size)
59247eaea50cc6 Jens Axboe         2009-03-06  295  		fbio->bi_seg_front_siz=
e =3D seg_size;
59247eaea50cc6 Jens Axboe         2009-03-06  296  	if (seg_size > bbio->bi=
_seg_back_size)
59247eaea50cc6 Jens Axboe         2009-03-06  297  		bbio->bi_seg_back_size=
 =3D seg_size;
1e42807918d17e Jens Axboe         2009-02-23  298  =

1e42807918d17e Jens Axboe         2009-02-23  299  	return nr_phys_segs;
1e42807918d17e Jens Axboe         2009-02-23  300  }
1e42807918d17e Jens Axboe         2009-02-23  301  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1856696537632261589==--

