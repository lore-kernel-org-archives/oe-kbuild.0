Content-Type: multipart/mixed; boundary="===============1824714103047081221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4657/5128] block/blk-mq.c:2796 blk_mq_submit_bio() warn: variable dereferenced before check 'bio' (see line 2777)
Date: Sat, 04 Dec 2021 06:26:37 +0800
Message-ID: <202112040656.USL56oYt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1824714103047081221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: f9786e04d49fd5c492152a4daf6b95a5da9973a2 [4657/5128] block: fix dou=
ble bio queue when merging in cached request path
:::::: branch date: 14 hours ago
:::::: commit date: 27 hours ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211204/202112040656.USL56oYt-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
block/blk-mq.c:2796 blk_mq_submit_bio() warn: variable dereferenced before =
check 'bio' (see line 2777)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.
block/blk-mq.c:2997 blk_rq_prep_clone() error: uninitialized symbol 'bio'.

vim +/bio +2796 block/blk-mq.c

71539717c10521 Jens Axboe        2021-11-03  2761  =

105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2762  /**
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  2763   * blk_mq_submit_bio - C=
reate and send a request to block device.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2764   * @bio: Bio pointe=
r.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2765   *
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2766   * Builds up a requ=
est structure from @q and @bio and send to the device. The
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2767   * request may not =
be queued directly to hardware if:
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2768   * * This request c=
an be merged with another one
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2769   * * We want to pla=
ce request at plug queue for possible future merging
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2770   * * There is an IO=
 scheduler active at this queue
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2771   *
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2772   * It will not queu=
e the request if there is an error with the bio, or at the
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2773   * request creation.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2774   */
3e08773c3841e9 Christoph Hellwig 2021-10-12  2775  void blk_mq_submit_bio(s=
truct bio *bio)
07068d5b8ed8fa Jens Axboe        2014-05-22  2776  {
ed6cddefdfd361 Pavel Begunkov    2021-10-14 @2777  	struct request_queue *q=
 =3D bdev_get_queue(bio->bi_bdev);
5b13bc8a3fd519 Christoph Hellwig 2021-11-24  2778  	struct blk_plug *plug =
=3D blk_mq_plug(q, bio);
ef295ecf090d3e Christoph Hellwig 2016-10-28  2779  	const int is_sync =3D o=
p_is_sync(bio->bi_opf);
07068d5b8ed8fa Jens Axboe        2014-05-22  2780  	struct request *rq;
abd45c159df5fc Jens Axboe        2021-10-13  2781  	unsigned int nr_segs =
=3D 1;
a892c8d52c0228 Satya Tangirala   2020-05-14  2782  	blk_status_t ret;
07068d5b8ed8fa Jens Axboe        2014-05-22  2783  =

900e080752025f Jens Axboe        2021-11-03  2784  	if (unlikely(!blk_crypt=
o_bio_prep(&bio)))
900e080752025f Jens Axboe        2021-11-03  2785  		return;
900e080752025f Jens Axboe        2021-11-03  2786  =

07068d5b8ed8fa Jens Axboe        2014-05-22  2787  	blk_queue_bounce(q, &bi=
o);
abd45c159df5fc Jens Axboe        2021-10-13  2788  	if (blk_may_split(q, bi=
o))
abd45c159df5fc Jens Axboe        2021-10-13  2789  		__blk_queue_split(q, &=
bio, &nr_segs);
f36ea50ca0043e Wen Xiong         2017-05-10  2790  =

e23947bd76f007 Dmitry Monakhov   2017-06-29  2791  	if (!bio_integrity_prep=
(bio))
900e080752025f Jens Axboe        2021-11-03  2792  		return;
87760e5eef3597 Jens Axboe        2016-11-09  2793  =

f9786e04d49fd5 Jens Axboe        2021-12-02  2794  	rq =3D blk_mq_get_cache=
d_request(q, plug, &bio, nr_segs);
5b13bc8a3fd519 Christoph Hellwig 2021-11-24  2795  	if (!rq) {
f9786e04d49fd5 Jens Axboe        2021-12-02 @2796  		if (!bio)
f9786e04d49fd5 Jens Axboe        2021-12-02  2797  			return;
5b13bc8a3fd519 Christoph Hellwig 2021-11-24  2798  		rq =3D blk_mq_get_new_=
requests(q, plug, bio, nr_segs);
71539717c10521 Jens Axboe        2021-11-03  2799  		if (unlikely(!rq))
900e080752025f Jens Axboe        2021-11-03  2800  			return;
5b13bc8a3fd519 Christoph Hellwig 2021-11-24  2801  	}
87760e5eef3597 Jens Axboe        2016-11-09  2802  =

e8a676d61c07ec Christoph Hellwig 2020-12-03  2803  	trace_block_getrq(bio);
d6f1dda2725190 Xiaoguang Wang    2018-10-23  2804  =

c1c80384c8f470 Josef Bacik       2018-07-03  2805  	rq_qos_track(q, rq, bio=
);
320ae51feed5c2 Jens Axboe        2013-10-24  2806  =

14ccb66b3f585b Christoph Hellwig 2019-06-06  2807  	blk_mq_bio_to_request(r=
q, bio, nr_segs);
923218f6166a84 Ming Lei          2017-11-02  2808  =

a892c8d52c0228 Satya Tangirala   2020-05-14  2809  	ret =3D blk_crypto_init=
_request(rq);
a892c8d52c0228 Satya Tangirala   2020-05-14  2810  	if (ret !=3D BLK_STS_OK=
) {
a892c8d52c0228 Satya Tangirala   2020-05-14  2811  		bio->bi_status =3D ret;
a892c8d52c0228 Satya Tangirala   2020-05-14  2812  		bio_endio(bio);
a892c8d52c0228 Satya Tangirala   2020-05-14  2813  		blk_mq_free_request(rq=
);
3e08773c3841e9 Christoph Hellwig 2021-10-12  2814  		return;
a892c8d52c0228 Satya Tangirala   2020-05-14  2815  	}
a892c8d52c0228 Satya Tangirala   2020-05-14  2816  =

2b504bd4841bcc Ming Lei          2021-11-18  2817  	if (op_is_flush(bio->bi=
_opf)) {
2b504bd4841bcc Ming Lei          2021-11-18  2818  		blk_insert_flush(rq);
d92ca9d8348fb1 Christoph Hellwig 2021-10-19  2819  		return;
2b504bd4841bcc Ming Lei          2021-11-18  2820  	}
d92ca9d8348fb1 Christoph Hellwig 2021-10-19  2821  =

1e9c23034d7b21 Christoph Hellwig 2021-11-23  2822  	if (plug)
ce5b009cff1961 Jens Axboe        2018-11-27  2823  		blk_add_rq_to_plug(plu=
g, rq);
1e9c23034d7b21 Christoph Hellwig 2021-11-23  2824  	else if ((rq->rq_flags =
& RQF_ELV) ||
0c5bcc92d94a8f Christoph Hellwig 2021-11-23  2825  		 (rq->mq_hctx->dispatc=
h_busy &&
1e9c23034d7b21 Christoph Hellwig 2021-11-23  2826  		  (q->nr_hw_queues =3D=
=3D 1 || !is_sync)))
a12de1d42d74ef Ming Lei          2019-09-27  2827  		blk_mq_sched_insert_re=
quest(rq, false, true, true);
1e9c23034d7b21 Christoph Hellwig 2021-11-23  2828  	else
0c5bcc92d94a8f Christoph Hellwig 2021-11-23  2829  		blk_mq_try_issue_direc=
tly(rq->mq_hctx, rq);
ab42f35d9cb5ac Ming Lei          2017-05-26  2830  }
320ae51feed5c2 Jens Axboe        2013-10-24  2831  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1824714103047081221==--

