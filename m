Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F75C8FE
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Apr 2025 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744507289; cv=none; b=eMWUYMB0T6mirBWSvDEaU/uYSoJ/1ksFAk3CLRRBx+XA9widgJUyalpvRYk3VnfltRO1Sbvzbit8dv4u/uWuEXqVLS2Jut909XW762NMKjMJ11cmScrbNcoZhN4YlHd6xx2AjyWms4ELgbR9mDUUdK34UjXkXiCyZNUo3CKUC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744507289; c=relaxed/simple;
	bh=kxO5GE9PH2BKsE4eJXwyMaAhkOc/0mmR23R1is9LKag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAZz5DPJbTEHZfKOTbR1a94xU+oPjJVmuGdHd5UC6Yj7jO+hTibb/KrnYjaNQFUTY/m01OxJsgmn3aoYbJ/U42sbUh7aOLpcOBYWHxUGkSvHn1x7eSTw+YJnH43DZzpMk4alM4pYCI0PR9yGjHnIziaMgjJ7cGw2/Jkp7VizvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLqwkDSe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLqwkDSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744507287; x=1776043287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kxO5GE9PH2BKsE4eJXwyMaAhkOc/0mmR23R1is9LKag=;
  b=WLqwkDSewTSjpfBeQX8cwFvQavKguhSiAKrcGcJwP4LID9sp5FJunjYY
   SIkY7XMPmNlQUl54LFo8hDAAeD7ND8PCetVmg7E6WgcNO0E8jlVg1m9jk
   5qX8f3wzUzJsSpIapc18QvMh6ek9GUEYHR8R5SitboUrzyfxUFcEixafI
   gWI6MxzUzxR3K2jtbo5bcPkYmkz0UyQ9tAA6TI7BaMuZS0O8l1ykzcSpv
   JUuHNuhIPaNdKRzDYC9nkoR31IZuOq4V4XG5M6g53L1PzAa3WTmDmgM9o
   PxMDDLjlXBFExSfiw7WTgQeCcmTyjOGbRqwOglvkrZjivpw6/a/hiYe6g
   w==;
X-CSE-ConnectionGUID: G5WyzbwnQ8itpOpTytSb7w==
X-CSE-MsgGUID: VKPedr85Sku5UQOhaeH3/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45723575"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="45723575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 18:21:26 -0700
X-CSE-ConnectionGUID: vEl4ac2gT0aDAHEykRahEg==
X-CSE-MsgGUID: 9lqZ5RHKRZydK2o49Fi2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="130062729"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Apr 2025 18:21:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3m2E-000CIE-26;
	Sun, 13 Apr 2025 01:21:22 +0000
Date: Sun, 13 Apr 2025 09:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 1/1] block/blk-mq.c:2196
 blk_mq_submit_bio() warn: variable dereferenced before check 'bio' (see line
 2180)
Message-ID: <202504130911.5TL6xIQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b9c7089e27cc61054769a30b1cdcc3976e386be1
commit: 7ec9a45fc4ee7fc1054c2cabf8b09a6bc708472e [1/1] block: handle bio_split_to_limits() NULL return
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-161-20250412 (https://download.01.org/0day-ci/archive/20250413/202504130911.5TL6xIQ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504130911.5TL6xIQ2-lkp@intel.com/

smatch warnings:
block/blk-mq.c:2196 blk_mq_submit_bio() warn: variable dereferenced before check 'bio' (see line 2180)

vim +/bio +2196 block/blk-mq.c

7f2a6a69f7ced6 Song Liu          2021-09-07  2162  
105663f73e71b5 André Almeida     2020-01-06  2163  /**
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  2164   * blk_mq_submit_bio - Create and send a request to block device.
105663f73e71b5 André Almeida     2020-01-06  2165   * @bio: Bio pointer.
105663f73e71b5 André Almeida     2020-01-06  2166   *
105663f73e71b5 André Almeida     2020-01-06  2167   * Builds up a request structure from @q and @bio and send to the device. The
105663f73e71b5 André Almeida     2020-01-06  2168   * request may not be queued directly to hardware if:
105663f73e71b5 André Almeida     2020-01-06  2169   * * This request can be merged with another one
105663f73e71b5 André Almeida     2020-01-06  2170   * * We want to place request at plug queue for possible future merging
105663f73e71b5 André Almeida     2020-01-06  2171   * * There is an IO scheduler active at this queue
105663f73e71b5 André Almeida     2020-01-06  2172   *
105663f73e71b5 André Almeida     2020-01-06  2173   * It will not queue the request if there is an error with the bio, or at the
105663f73e71b5 André Almeida     2020-01-06  2174   * request creation.
105663f73e71b5 André Almeida     2020-01-06  2175   *
105663f73e71b5 André Almeida     2020-01-06  2176   * Returns: Request queue cookie.
105663f73e71b5 André Almeida     2020-01-06  2177   */
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  2178  blk_qc_t blk_mq_submit_bio(struct bio *bio)
07068d5b8ed8fa Jens Axboe        2014-05-22  2179  {
309dca309fc39a Christoph Hellwig 2021-01-24 @2180  	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
ef295ecf090d3e Christoph Hellwig 2016-10-28  2181  	const int is_sync = op_is_sync(bio->bi_opf);
f73f44eb00cb13 Christoph Hellwig 2017-01-27  2182  	const int is_flush_fua = op_is_flush(bio->bi_opf);
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2183  	struct blk_mq_alloc_data data = {
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2184  		.q		= q,
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2185  	};
07068d5b8ed8fa Jens Axboe        2014-05-22  2186  	struct request *rq;
f984df1f0f71ef Shaohua Li        2015-05-08  2187  	struct blk_plug *plug;
5b3f341f098d60 Shaohua Li        2015-05-08  2188  	struct request *same_queue_rq = NULL;
14ccb66b3f585b Christoph Hellwig 2019-06-06  2189  	unsigned int nr_segs;
7b371636fb6d18 Jens Axboe        2015-11-05  2190  	blk_qc_t cookie;
a892c8d52c0228 Satya Tangirala   2020-05-14  2191  	blk_status_t ret;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2192  	bool hipri;
07068d5b8ed8fa Jens Axboe        2014-05-22  2193  
07068d5b8ed8fa Jens Axboe        2014-05-22  2194  	blk_queue_bounce(q, &bio);
f695ca3886ce72 Christoph Hellwig 2020-07-01  2195  	__blk_queue_split(&bio, &nr_segs);
7ec9a45fc4ee7f Jens Axboe        2023-01-04 @2196  	if (!bio)
7ec9a45fc4ee7f Jens Axboe        2023-01-04  2197  		goto queue_exit;
f36ea50ca0043e Wen Xiong         2017-05-10  2198  
e23947bd76f007 Dmitry Monakhov   2017-06-29  2199  	if (!bio_integrity_prep(bio))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2200  		goto queue_exit;
07068d5b8ed8fa Jens Axboe        2014-05-22  2201  
87c279e613f848 Omar Sandoval     2016-06-01  2202  	if (!is_flush_fua && !blk_queue_nomerges(q) &&
14ccb66b3f585b Christoph Hellwig 2019-06-06  2203  	    blk_attempt_plug_merge(q, bio, nr_segs, &same_queue_rq))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2204  		goto queue_exit;
07068d5b8ed8fa Jens Axboe        2014-05-22  2205  
14ccb66b3f585b Christoph Hellwig 2019-06-06  2206  	if (blk_mq_sched_bio_merge(q, bio, nr_segs))
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2207  		goto queue_exit;
bd166ef183c263 Jens Axboe        2017-01-17  2208  
d53375608ebf13 Christoph Hellwig 2018-11-14  2209  	rq_qos_throttle(q, bio);
87760e5eef3597 Jens Axboe        2016-11-09  2210  
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2211  	hipri = bio->bi_opf & REQ_HIPRI;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2212  
7809167da5c86f Ming Lei          2019-01-16  2213  	data.cmd_flags = bio->bi_opf;
e6e7abffe386b6 Christoph Hellwig 2020-05-29  2214  	rq = __blk_mq_alloc_request(&data);
87760e5eef3597 Jens Axboe        2016-11-09  2215  	if (unlikely(!rq)) {
c1c80384c8f470 Josef Bacik       2018-07-03  2216  		rq_qos_cleanup(q, bio);
7b6620d7db566a Jens Axboe        2019-08-15  2217  		if (bio->bi_opf & REQ_NOWAIT)
03a07c92a9ed99 Goldwyn Rodrigues 2017-06-20  2218  			bio_wouldblock_error(bio);
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2219  		goto queue_exit;
87760e5eef3597 Jens Axboe        2016-11-09  2220  	}
87760e5eef3597 Jens Axboe        2016-11-09  2221  
e8a676d61c07ec Christoph Hellwig 2020-12-03  2222  	trace_block_getrq(bio);
d6f1dda2725190 Xiaoguang Wang    2018-10-23  2223  
c1c80384c8f470 Josef Bacik       2018-07-03  2224  	rq_qos_track(q, rq, bio);
320ae51feed5c2 Jens Axboe        2013-10-24  2225  
fd2d332677c687 Jens Axboe        2017-01-12  2226  	cookie = request_to_qc_t(data.hctx, rq);
320ae51feed5c2 Jens Axboe        2013-10-24  2227  
14ccb66b3f585b Christoph Hellwig 2019-06-06  2228  	blk_mq_bio_to_request(rq, bio, nr_segs);
923218f6166a84 Ming Lei          2017-11-02  2229  
a892c8d52c0228 Satya Tangirala   2020-05-14  2230  	ret = blk_crypto_init_request(rq);
a892c8d52c0228 Satya Tangirala   2020-05-14  2231  	if (ret != BLK_STS_OK) {
a892c8d52c0228 Satya Tangirala   2020-05-14  2232  		bio->bi_status = ret;
a892c8d52c0228 Satya Tangirala   2020-05-14  2233  		bio_endio(bio);
a892c8d52c0228 Satya Tangirala   2020-05-14  2234  		blk_mq_free_request(rq);
a892c8d52c0228 Satya Tangirala   2020-05-14  2235  		return BLK_QC_T_NONE;
a892c8d52c0228 Satya Tangirala   2020-05-14  2236  	}
a892c8d52c0228 Satya Tangirala   2020-05-14  2237  
b49773e7bcf316 Damien Le Moal    2019-07-11  2238  	plug = blk_mq_plug(q, bio);
970d168de636dd Bart Van Assche   2019-07-01  2239  	if (unlikely(is_flush_fua)) {
105663f73e71b5 André Almeida     2020-01-06  2240  		/* Bypass scheduler for flush requests */
320ae51feed5c2 Jens Axboe        2013-10-24  2241  		blk_insert_flush(rq);
a4d907b6a33ba2 Christoph Hellwig 2017-03-22  2242  		blk_mq_run_hw_queue(data.hctx, true);
03f26d8f114032 Ming Lei          2021-05-14  2243  	} else if (plug && (q->nr_hw_queues == 1 ||
03f26d8f114032 Ming Lei          2021-05-14  2244  		   blk_mq_is_sbitmap_shared(rq->mq_hctx->flags) ||
03f26d8f114032 Ming Lei          2021-05-14  2245  		   q->mq_ops->commit_rqs || !blk_queue_nonrot(q))) {
b2c5d16b72df11 Jens Axboe        2018-11-29  2246  		/*
b2c5d16b72df11 Jens Axboe        2018-11-29  2247  		 * Use plugging if we have a ->commit_rqs() hook as well, as
b2c5d16b72df11 Jens Axboe        2018-11-29  2248  		 * we know the driver uses bd->last in a smart fashion.
3154df262db52f Ming Lei          2019-09-27  2249  		 *
3154df262db52f Ming Lei          2019-09-27  2250  		 * Use normal plugging if this disk is slow HDD, as sequential
3154df262db52f Ming Lei          2019-09-27  2251  		 * IO may benefit a lot from plug merging.
b2c5d16b72df11 Jens Axboe        2018-11-29  2252  		 */
5f0ed774ed2914 Jens Axboe        2018-11-23  2253  		unsigned int request_count = plug->rq_count;
600271d9000027 Shaohua Li        2016-11-03  2254  		struct request *last = NULL;
600271d9000027 Shaohua Li        2016-11-03  2255  
676d06077f964f Ming Lei          2015-10-20  2256  		if (!request_count)
320ae51feed5c2 Jens Axboe        2013-10-24  2257  			trace_block_plug(q);
600271d9000027 Shaohua Li        2016-11-03  2258  		else
600271d9000027 Shaohua Li        2016-11-03  2259  			last = list_entry_rq(plug->mq_list.prev);
b094f89ca42fbb Jens Axboe        2015-11-20  2260  
7f2a6a69f7ced6 Song Liu          2021-09-07  2261  		if (request_count >= blk_plug_max_rq_count(plug) || (last &&
600271d9000027 Shaohua Li        2016-11-03  2262  		    blk_rq_bytes(last) >= BLK_PLUG_FLUSH_SIZE)) {
320ae51feed5c2 Jens Axboe        2013-10-24  2263  			blk_flush_plug_list(plug, false);
320ae51feed5c2 Jens Axboe        2013-10-24  2264  			trace_block_plug(q);
320ae51feed5c2 Jens Axboe        2013-10-24  2265  		}
b094f89ca42fbb Jens Axboe        2015-11-20  2266  
ce5b009cff1961 Jens Axboe        2018-11-27  2267  		blk_add_rq_to_plug(plug, rq);
a12de1d42d74ef Ming Lei          2019-09-27  2268  	} else if (q->elevator) {
105663f73e71b5 André Almeida     2020-01-06  2269  		/* Insert the request at the IO scheduler queue */
a12de1d42d74ef Ming Lei          2019-09-27  2270  		blk_mq_sched_insert_request(rq, false, true, true);
2299722c4b117a Christoph Hellwig 2017-03-22  2271  	} else if (plug && !blk_queue_nomerges(q)) {
320ae51feed5c2 Jens Axboe        2013-10-24  2272  		/*
6a83e74d214a47 Bart Van Assche   2016-11-02  2273  		 * We do limited plugging. If the bio can be merged, do that.
f984df1f0f71ef Shaohua Li        2015-05-08  2274  		 * Otherwise the existing request in the plug list will be
f984df1f0f71ef Shaohua Li        2015-05-08  2275  		 * issued. So the plug list will have one request at most
2299722c4b117a Christoph Hellwig 2017-03-22  2276  		 * The plug list might get flushed before this. If that happens,
2299722c4b117a Christoph Hellwig 2017-03-22  2277  		 * the plug list is empty, and same_queue_rq is invalid.
320ae51feed5c2 Jens Axboe        2013-10-24  2278  		 */
2299722c4b117a Christoph Hellwig 2017-03-22  2279  		if (list_empty(&plug->mq_list))
2299722c4b117a Christoph Hellwig 2017-03-22  2280  			same_queue_rq = NULL;
4711b57317f0ff Jens Axboe        2018-11-27  2281  		if (same_queue_rq) {
2299722c4b117a Christoph Hellwig 2017-03-22  2282  			list_del_init(&same_queue_rq->queuelist);
4711b57317f0ff Jens Axboe        2018-11-27  2283  			plug->rq_count--;
4711b57317f0ff Jens Axboe        2018-11-27  2284  		}
ce5b009cff1961 Jens Axboe        2018-11-27  2285  		blk_add_rq_to_plug(plug, rq);
ff3b74b8e1675c Yufen Yu          2019-03-26  2286  		trace_block_plug(q);
07068d5b8ed8fa Jens Axboe        2014-05-22  2287  
dad7a3be4960e5 Ming Lei          2017-06-06  2288  		if (same_queue_rq) {
ea4f995ee8b8f0 Jens Axboe        2018-10-29  2289  			data.hctx = same_queue_rq->mq_hctx;
ff3b74b8e1675c Yufen Yu          2019-03-26  2290  			trace_block_unplug(q, 1, true);
2299722c4b117a Christoph Hellwig 2017-03-22  2291  			blk_mq_try_issue_directly(data.hctx, same_queue_rq,
fd9c40f64c514b Bart Van Assche   2019-04-04  2292  					&cookie);
dad7a3be4960e5 Ming Lei          2017-06-06  2293  		}
a12de1d42d74ef Ming Lei          2019-09-27  2294  	} else if ((q->nr_hw_queues > 1 && is_sync) ||
a12de1d42d74ef Ming Lei          2019-09-27  2295  			!data.hctx->dispatch_busy) {
105663f73e71b5 André Almeida     2020-01-06  2296  		/*
105663f73e71b5 André Almeida     2020-01-06  2297  		 * There is no scheduler and we can try to send directly
105663f73e71b5 André Almeida     2020-01-06  2298  		 * to the hardware.
105663f73e71b5 André Almeida     2020-01-06  2299  		 */
fd9c40f64c514b Bart Van Assche   2019-04-04  2300  		blk_mq_try_issue_directly(data.hctx, rq, &cookie);
ab42f35d9cb5ac Ming Lei          2017-05-26  2301  	} else {
105663f73e71b5 André Almeida     2020-01-06  2302  		/* Default case. */
8fa9f556451a67 huhai             2018-05-16  2303  		blk_mq_sched_insert_request(rq, false, true, true);
ab42f35d9cb5ac Ming Lei          2017-05-26  2304  	}
a4d907b6a33ba2 Christoph Hellwig 2017-03-22  2305  
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2306  	if (!hipri)
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  2307  		return BLK_QC_T_NONE;
7b371636fb6d18 Jens Axboe        2015-11-05  2308  	return cookie;
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2309  queue_exit:
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2310  	blk_queue_exit(q);
ac7c5675fa45a3 Christoph Hellwig 2020-05-16  2311  	return BLK_QC_T_NONE;
320ae51feed5c2 Jens Axboe        2013-10-24  2312  }
320ae51feed5c2 Jens Axboe        2013-10-24  2313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
