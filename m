Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092605;
	b=aOlCHD7qWXpwvYHMZqcZQQB0PtN0WaWb3Nydx7qbu8UP+lcLOCc95tMWB7WuX9vNEdt/
	 9qNSmYuSjLDQmU90CApyCsY23FxAXr8LBeBHQLI4Bsee8LfRDUVBTtKv57MlK8H8Lm607
	 3XpxYvSdpNAVc0spiQAioZ8B5tyEClFlEE+NRA8pfyA4fnVri8KhZlz5VEjRWs1jS+6/U
	 uOYYcvugM5c62FMraYFIwVxTQW3ew0H5Xlxdos1B1oU7fxABPqhlRXJn+wNVah4Bil2vH
	 ITpXLZ3e0FrmDVP35cUZ01wgXEryVLgnOJTxsLTR3up9OePvpigt8Gzbu5c519+Ytcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092605;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TugcSeFCc7aqq4eqzco2zlTnrKX1uO2twwrtZ/grsy0=;
	b=UrnSZd+KHBK4d8nveu6fX3pC99WZrs3RSxGSeT1C64eBWOQ7ysEupBXrhJtpx2ntCaHX
	 OX05z3aAfc2qR4Yj7w08cMT/+i+od/ari97Y8APHcTuaosPhbvCCjiJIbhPI8j7oxeMho
	 G7THJdtac7tSnCyPmgUwqyihiU39XbYNxaCse9t7RwZ4n+DpmZHEOduvetEldARRLGaZV
	 g/X++3CHqN2WOeMw4Ij059khncKXAwZ7Bh2nQYPk+y9UDCFdgA/8YOUdangVsM7W7o9ww
	 OJmcWVOuFRbTLrhARRgOCLu0Jhudlt9ukSlnS4NbjZGcKFux+bmc1f0t0LwkV3cJaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=(null) smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SfzVZC7F;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9A606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 23:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SfzVZC7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794092595; x=1825628595;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7biHlwIRzfK6R8JRWk95oIBAH0cV01g6g1YpZ/c4/qg=;
  b=SfzVZC7FL9HsFWhmNtlqs3MUviPeqjS0+KeIhxjDWn4mLtN/NjooAzVG
   aVuaIeD9M3Y80g0FZGuk0h5AJNUH8sNuiVaM6pywDmp4LsdadHUaSeC/X
   NZD0FlPjPQtHzXempadYhz1PQeaVOc088+H2+rTbkjg6TxnPBDZi5+EiT
   T2ruorhe5g8gnSSv3CBnbYYdkQj41IIvoKw4xEKOGTN2eaeo0m6Erw3Q+
   UmumXgCh+ObCPFmfK+2YPm6J8V+jFrL1NL8l84ZyFEgbMN/4vR71q5HHT
   MBYfxr/78vdI0qZB7/bigkVTV8Mw6ckT9oYeINAkvzFPl+tqFhE4pYeTx
   w==;
X-CSE-ConnectionGUID: zUkjpqP6StCLNp16Bw7J+A==
X-CSE-MsgGUID: CobXDv5KSNy4A7YZ8doPWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2895181"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2895181"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 15:03:15 -0800
X-CSE-ConnectionGUID: WUh4EPY6T8i9FubCTI++Ew==
X-CSE-MsgGUID: GV2Ht50rRNSa905sC8Rm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9310013"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 15:03:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPpRF-00000000Aod-1Sve;
	Sat, 07 Nov 2026 23:03:09 +0000
Date: Sun, 08 Nov 2026 00:02:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 54/54] block/blk-mq.c:2196
 blk_mq_submit_bio() warn: variable dereferenced before check 'bio' (see line
 2180)
Message-ID: <202611072329.uQaU4P0d-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: 7ec9a45fc4ee7fc1054c2cabf8b09a6bc708472e [54/54] block: handle bio_=
split_to_limits() NULL return
:::::: branch date: 22 hours ago
:::::: commit date: 3 years, 10 months ago
config: arm-randconfig-2200-20261107 (https://download.01.org/0day-ci/archi=
ve/20261107/202611072329.uQaU4P0d-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa=
861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611072329.uQaU4P0d-lkp@intel.com/

smatch warnings:
block/blk-mq.c:2196 blk_mq_submit_bio() warn: variable dereferenced before =
check 'bio' (see line 2180)

vim +/bio +2196 block/blk-mq.c

7f2a6a69f7ced6 Song Liu          2021-09-07  2162 =20
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2163  /**
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  2164   * blk_mq_submit_bio - C=
reate and send a request to block device.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2165   * @bio: Bio pointe=
r.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2166   *
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2167   * Builds up a requ=
est structure from @q and @bio and send to the device. The
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2168   * request may not =
be queued directly to hardware if:
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2169   * * This request c=
an be merged with another one
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2170   * * We want to pla=
ce request at plug queue for possible future merging
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2171   * * There is an IO=
 scheduler active at this queue
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2172   *
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2173   * It will not queu=
e the request if there is an error with the bio, or at the
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2174   * request creation.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2175   *
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2176   * Returns: Request=
 queue cookie.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2177   */
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  2178  blk_qc_t blk_mq_submit_b=
io(struct bio *bio)
07068d5b8ed8fa Jens Axboe        2014-05-22  2179  {
309dca309fc39a Christoph Hellwig 2021-01-24 @2180  	struct request_queue *q=
 =3D bio->bi_bdev->bd_disk->queue;
ef295ecf090d3e Christoph Hellwig 2016-10-28  2181  	const int is_sync =3D o=
p_is_sync(bio->bi_opf);
f73f44eb00cb13 Christoph Hellwig 2017-01-27  2182  	const int is_flush_fua =
=3D op_is_flush(bio->bi_opf);
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2183  	struct blk_mq_alloc_dat=
a data =3D {
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2184  		.q		=3D q,
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2185  	};
07068d5b8ed8fa Jens Axboe        2014-05-22  2186  	struct request *rq;
f984df1f0f71ef Shaohua Li        2015-05-08  2187  	struct blk_plug *plug;
5b3f341f098d60 Shaohua Li        2015-05-08  2188  	struct request *same_qu=
eue_rq =3D NULL;
14ccb66b3f585b Christoph Hellwig 2019-06-06  2189  	unsigned int nr_segs;
7b371636fb6d18 Jens Axboe        2015-11-05  2190  	blk_qc_t cookie;
a892c8d52c0228 Satya Tangirala   2020-05-14  2191  	blk_status_t ret;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2192  	bool hipri;
07068d5b8ed8fa Jens Axboe        2014-05-22  2193 =20
07068d5b8ed8fa Jens Axboe        2014-05-22  2194  	blk_queue_bounce(q, &bi=
o);
f695ca3886ce72 Christoph Hellwig 2020-07-01  2195  	__blk_queue_split(&bio,=
 &nr_segs);
7ec9a45fc4ee7f Jens Axboe        2023-01-04 @2196  	if (!bio)
7ec9a45fc4ee7f Jens Axboe        2023-01-04  2197  		goto queue_exit;
f36ea50ca0043e Wen Xiong         2017-05-10  2198 =20
e23947bd76f007 Dmitry Monakhov   2017-06-29  2199  	if (!bio_integrity_prep=
(bio))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2200  		goto queue_exit;
07068d5b8ed8fa Jens Axboe        2014-05-22  2201 =20
87c279e613f848 Omar Sandoval     2016-06-01  2202  	if (!is_flush_fua && !b=
lk_queue_nomerges(q) &&
14ccb66b3f585b Christoph Hellwig 2019-06-06  2203  	    blk_attempt_plug_me=
rge(q, bio, nr_segs, &same_queue_rq))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2204  		goto queue_exit;
07068d5b8ed8fa Jens Axboe        2014-05-22  2205 =20
14ccb66b3f585b Christoph Hellwig 2019-06-06  2206  	if (blk_mq_sched_bio_me=
rge(q, bio, nr_segs))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2207  		goto queue_exit;
bd166ef183c263 Jens Axboe        2017-01-17  2208 =20
d53375608ebf13 Christoph Hellwig 2018-11-14  2209  	rq_qos_throttle(q, bio);
87760e5eef3597 Jens Axboe        2016-11-09  2210 =20
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2211  	hipri =3D bio->bi_opf &=
 REQ_HIPRI;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2212 =20
7809167da5c86f Ming Lei          2019-01-16  2213  	data.cmd_flags =3D bio-=
>bi_opf;
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2214  	rq =3D __blk_mq_alloc_r=
equest(&data);
87760e5eef3597 Jens Axboe        2016-11-09  2215  	if (unlikely(!rq)) {
c1c80384c8f470 Josef Bacik       2018-07-03  2216  		rq_qos_cleanup(q, bio);
7b6620d7db566a Jens Axboe        2019-08-15  2217  		if (bio->bi_opf & REQ_=
NOWAIT)
03a07c92a9ed99 Goldwyn Rodrigues 2017-06-20  2218  			bio_wouldblock_error(=
bio);
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2219  		goto queue_exit;
87760e5eef3597 Jens Axboe        2016-11-09  2220  	}
87760e5eef3597 Jens Axboe        2016-11-09  2221 =20
e8a676d61c07ec Christoph Hellwig 2020-12-03  2222  	trace_block_getrq(bio);
d6f1dda2725190 Xiaoguang Wang    2018-10-23  2223 =20
c1c80384c8f470 Josef Bacik       2018-07-03  2224  	rq_qos_track(q, rq, bio=
);
320ae51feed5c2 Jens Axboe        2013-10-24  2225 =20
fd2d332677c687 Jens Axboe        2017-01-12  2226  	cookie =3D request_to_q=
c_t(data.hctx, rq);
320ae51feed5c2 Jens Axboe        2013-10-24  2227 =20
14ccb66b3f585b Christoph Hellwig 2019-06-06  2228  	blk_mq_bio_to_request(r=
q, bio, nr_segs);
923218f6166a84 Ming Lei          2017-11-02  2229 =20
a892c8d52c0228 Satya Tangirala   2020-05-14  2230  	ret =3D blk_crypto_init=
_request(rq);
a892c8d52c0228 Satya Tangirala   2020-05-14  2231  	if (ret !=3D BLK_STS_OK=
) {
a892c8d52c0228 Satya Tangirala   2020-05-14  2232  		bio->bi_status =3D ret;
a892c8d52c0228 Satya Tangirala   2020-05-14  2233  		bio_endio(bio);
a892c8d52c0228 Satya Tangirala   2020-05-14  2234  		blk_mq_free_request(rq=
);
a892c8d52c0228 Satya Tangirala   2020-05-14  2235  		return BLK_QC_T_NONE;
a892c8d52c0228 Satya Tangirala   2020-05-14  2236  	}
a892c8d52c0228 Satya Tangirala   2020-05-14  2237 =20
b49773e7bcf316 Damien Le Moal    2019-07-11  2238  	plug =3D blk_mq_plug(q,=
 bio);
970d168de636dd Bart Van Assche   2019-07-01  2239  	if (unlikely(is_flush_f=
ua)) {
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2240  		/* Bypass schedul=
er for flush requests */
320ae51feed5c2 Jens Axboe        2013-10-24  2241  		blk_insert_flush(rq);
a4d907b6a33ba2 Christoph Hellwig 2017-03-22  2242  		blk_mq_run_hw_queue(da=
ta.hctx, true);
03f26d8f114032 Ming Lei          2021-05-14  2243  	} else if (plug && (q->=
nr_hw_queues =3D=3D 1 ||
03f26d8f114032 Ming Lei          2021-05-14  2244  		   blk_mq_is_sbitmap_s=
hared(rq->mq_hctx->flags) ||
03f26d8f114032 Ming Lei          2021-05-14  2245  		   q->mq_ops->commit_r=
qs || !blk_queue_nonrot(q))) {
b2c5d16b72df11 Jens Axboe        2018-11-29  2246  		/*
b2c5d16b72df11 Jens Axboe        2018-11-29  2247  		 * Use plugging if we =
have a ->commit_rqs() hook as well, as
b2c5d16b72df11 Jens Axboe        2018-11-29  2248  		 * we know the driver =
uses bd->last in a smart fashion.
3154df262db52f Ming Lei          2019-09-27  2249  		 *
3154df262db52f Ming Lei          2019-09-27  2250  		 * Use normal plugging=
 if this disk is slow HDD, as sequential
3154df262db52f Ming Lei          2019-09-27  2251  		 * IO may benefit a lo=
t from plug merging.
b2c5d16b72df11 Jens Axboe        2018-11-29  2252  		 */
5f0ed774ed2914 Jens Axboe        2018-11-23  2253  		unsigned int request_c=
ount =3D plug->rq_count;
600271d9000027 Shaohua Li        2016-11-03  2254  		struct request *last =
=3D NULL;
600271d9000027 Shaohua Li        2016-11-03  2255 =20
676d06077f964f Ming Lei          2015-10-20  2256  		if (!request_count)
320ae51feed5c2 Jens Axboe        2013-10-24  2257  			trace_block_plug(q);
600271d9000027 Shaohua Li        2016-11-03  2258  		else
600271d9000027 Shaohua Li        2016-11-03  2259  			last =3D list_entry_r=
q(plug->mq_list.prev);
b094f89ca42fbb Jens Axboe        2015-11-20  2260 =20
7f2a6a69f7ced6 Song Liu          2021-09-07  2261  		if (request_count >=3D =
blk_plug_max_rq_count(plug) || (last &&
600271d9000027 Shaohua Li        2016-11-03  2262  		    blk_rq_bytes(last)=
 >=3D BLK_PLUG_FLUSH_SIZE)) {
320ae51feed5c2 Jens Axboe        2013-10-24  2263  			blk_flush_plug_list(p=
lug, false);
320ae51feed5c2 Jens Axboe        2013-10-24  2264  			trace_block_plug(q);
320ae51feed5c2 Jens Axboe        2013-10-24  2265  		}
b094f89ca42fbb Jens Axboe        2015-11-20  2266 =20
ce5b009cff1961 Jens Axboe        2018-11-27  2267  		blk_add_rq_to_plug(plu=
g, rq);
a12de1d42d74ef Ming Lei          2019-09-27  2268  	} else if (q->elevator)=
 {
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2269  		/* Insert the req=
uest at the IO scheduler queue */
a12de1d42d74ef Ming Lei          2019-09-27  2270  		blk_mq_sched_insert_re=
quest(rq, false, true, true);
2299722c4b117a Christoph Hellwig 2017-03-22  2271  	} else if (plug && !blk=
_queue_nomerges(q)) {
320ae51feed5c2 Jens Axboe        2013-10-24  2272  		/*
6a83e74d214a47 Bart Van Assche   2016-11-02  2273  		 * We do limited plugg=
ing. If the bio can be merged, do that.
f984df1f0f71ef Shaohua Li        2015-05-08  2274  		 * Otherwise the exist=
ing request in the plug list will be
f984df1f0f71ef Shaohua Li        2015-05-08  2275  		 * issued. So the plug=
 list will have one request at most
2299722c4b117a Christoph Hellwig 2017-03-22  2276  		 * The plug list might=
 get flushed before this. If that happens,
2299722c4b117a Christoph Hellwig 2017-03-22  2277  		 * the plug list is em=
pty, and same_queue_rq is invalid.
320ae51feed5c2 Jens Axboe        2013-10-24  2278  		 */
2299722c4b117a Christoph Hellwig 2017-03-22  2279  		if (list_empty(&plug->=
mq_list))
2299722c4b117a Christoph Hellwig 2017-03-22  2280  			same_queue_rq =3D NUL=
L;
4711b57317f0ff Jens Axboe        2018-11-27  2281  		if (same_queue_rq) {
2299722c4b117a Christoph Hellwig 2017-03-22  2282  			list_del_init(&same_q=
ueue_rq->queuelist);
4711b57317f0ff Jens Axboe        2018-11-27  2283  			plug->rq_count--;
4711b57317f0ff Jens Axboe        2018-11-27  2284  		}
ce5b009cff1961 Jens Axboe        2018-11-27  2285  		blk_add_rq_to_plug(plu=
g, rq);
ff3b74b8e1675c Yufen Yu          2019-03-26  2286  		trace_block_plug(q);
07068d5b8ed8fa Jens Axboe        2014-05-22  2287 =20
dad7a3be4960e5 Ming Lei          2017-06-06  2288  		if (same_queue_rq) {
ea4f995ee8b8f0 Jens Axboe        2018-10-29  2289  			data.hctx =3D same_qu=
eue_rq->mq_hctx;
ff3b74b8e1675c Yufen Yu          2019-03-26  2290  			trace_block_unplug(q,=
 1, true);
2299722c4b117a Christoph Hellwig 2017-03-22  2291  			blk_mq_try_issue_dire=
ctly(data.hctx, same_queue_rq,
fd9c40f64c514b Bart Van Assche   2019-04-04  2292  					&cookie);
dad7a3be4960e5 Ming Lei          2017-06-06  2293  		}
a12de1d42d74ef Ming Lei          2019-09-27  2294  	} else if ((q->nr_hw_qu=
eues > 1 && is_sync) ||
a12de1d42d74ef Ming Lei          2019-09-27  2295  			!data.hctx->dispatch_=
busy) {
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2296  		/*
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2297  		 * There is no sc=
heduler and we can try to send directly
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2298  		 * to the hardwar=
e.
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2299  		 */
fd9c40f64c514b Bart Van Assche   2019-04-04  2300  		blk_mq_try_issue_direc=
tly(data.hctx, rq, &cookie);
ab42f35d9cb5ac Ming Lei          2017-05-26  2301  	} else {
105663f73e71b5 Andr=C3=A9 Almeida     2020-01-06  2302  		/* Default case. =
*/
8fa9f556451a67 huhai             2018-05-16  2303  		blk_mq_sched_insert_re=
quest(rq, false, true, true);
ab42f35d9cb5ac Ming Lei          2017-05-26  2304  	}
a4d907b6a33ba2 Christoph Hellwig 2017-03-22  2305 =20
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2306  	if (!hipri)
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2307  		return BLK_QC_T_NONE;
7b371636fb6d18 Jens Axboe        2015-11-05  2308  	return cookie;
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2309  queue_exit:
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2310  	blk_queue_exit(q);
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2311  	return BLK_QC_T_NONE;
320ae51feed5c2 Jens Axboe        2013-10-24  2312  }
320ae51feed5c2 Jens Axboe        2013-10-24  2313 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
