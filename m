Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA15262FDE
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795774; cv=none; b=cHqNathmtHjexEeH0wgrMp6+1mSeu9mXPYA6NE1DDp9cIOY7/b6Y1HX8nqozyfxMWC46ej1mWiJV+nryoh6EMoVQo6PVNtKi7yvLsYYqy0fF3LW1NxITDI+mbrXOsPlMi7yP8oNj2Xe+zi4LmS7gTb2fTFWbyl4h9oWa9vMXhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795774; c=relaxed/simple;
	bh=laRKEoMVEo374pLjhCkjjGZmmGajlIeZuM25NRUZPCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcMTEEAPRWqfEM05Ljm9qIMRfdeHF5D9hiuCzvr+SpVTXJHabZGuLPTVfVgepBuP3EGFmBQYzrCSLdJZrWRUpgi0roQGRLuIVx8zkmVAYC1A+aVX4IDib6LIZXesE5+hDU4+9ScTIm4vF1cGOYG34PPxVV7VtjCShBlR9O5iNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfAmtZAE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfAmtZAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753795774; x=1785331774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laRKEoMVEo374pLjhCkjjGZmmGajlIeZuM25NRUZPCA=;
  b=NfAmtZAEOwQOUi3DF4GlKqlUq2qQ/p/Day3cJRzq79r+kmSqWpsTDVcE
   5PPMq16nJS1r+KnHGSUJbZJWo4pJeBs9mgIynhXEikMEnMGhJ1fHwc91G
   9mhP6VMobIcmyXsB1puctCKMTUAY6i59aDLBntlv7uDxqRpj+smKnzx0O
   oC+ynp61bIxoQMti4ha8d8k0n2naHAx8TBZ17VRB7oAqx5yIj1cBI1d6o
   eU9OzzfVbeSs2ykpV5GjRE7VXHrBrI+OdJbAUEPFtDrghn2ytx5OFSow9
   oYPwPmZMQcTX18QwtXUZlktfq1HF863Xp43nFo1lfDtvm377klMwjbOs0
   w==;
X-CSE-ConnectionGUID: YOWmS6XLT52psuYdYamybA==
X-CSE-MsgGUID: lp28bgr7SNW8wiVT+EZpCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59869510"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="59869510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 06:29:30 -0700
X-CSE-ConnectionGUID: neXr7LyySaGrIvI7PGVv/Q==
X-CSE-MsgGUID: z2xO0KkTTW2vfgUhYAyR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="193691329"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 06:29:25 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugkON-0001Jd-1f;
	Tue, 29 Jul 2025 13:29:19 +0000
Date: Tue, 29 Jul 2025 21:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 1568/1568]
 block/blk-throttle.c:2306:1-7: preceding lock on line 2212
Message-ID: <202507292155.4p73oKoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Yang Yingliang <yangyingliang@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   859de5033e15abefcf19935429e6478be97d889a
commit: e1c15e207d153cafb3f3aa1cbc8000134fae1d40 [1568/1568] blk-throttle: Set BIO_THROTTLED when bio has been throttled
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-102-20250408 (https://download.01.org/0day-ci/archive/20250729/202507292155.4p73oKoA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507292155.4p73oKoA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-throttle.c:2306:1-7: preceding lock on line 2212

vim +2306 block/blk-throttle.c

2bc19cd5fdb5ff Jens Axboe    2017-04-20  2192  
ae118896361111 Tejun Heo     2015-08-18  2193  bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
ae118896361111 Tejun Heo     2015-08-18  2194  		    struct bio *bio)
e43473b7f223ec Vivek Goyal   2010-09-15  2195  {
c5cc2070b45333 Tejun Heo     2013-05-14  2196  	struct throtl_qnode *qn = NULL;
ae118896361111 Tejun Heo     2015-08-18  2197  	struct throtl_grp *tg = blkg_to_tg(blkg ?: q->root_blkg);
73f0d49a9637a7 Tejun Heo     2013-05-14  2198  	struct throtl_service_queue *sq;
0e9f4164ba9150 Tejun Heo     2013-05-14  2199  	bool rw = bio_data_dir(bio);
bc16a4f933bc5e Tejun Heo     2011-10-19  2200  	bool throttled = false;
e1c15e207d153c Laibin Qiu    2022-03-08  2201  	bool locked = true;
b9147dd1bae2b1 Shaohua Li    2017-03-27  2202  	struct throtl_data *td = tg->td;
e43473b7f223ec Vivek Goyal   2010-09-15  2203  
ae118896361111 Tejun Heo     2015-08-18  2204  	WARN_ON_ONCE(!rcu_read_lock_held());
ae118896361111 Tejun Heo     2015-08-18  2205  
2a0f61e6ecd08d Tejun Heo     2013-05-14  2206  	/* see throtl_charge_bio() */
e1c15e207d153c Laibin Qiu    2022-03-08  2207  	if (bio_flagged(bio, BIO_THROTTLED) || !tg->has_rules[rw]) {
e1c15e207d153c Laibin Qiu    2022-03-08  2208  		locked = false;
bc16a4f933bc5e Tejun Heo     2011-10-19  2209  		goto out;
e1c15e207d153c Laibin Qiu    2022-03-08  2210  	}
e43473b7f223ec Vivek Goyal   2010-09-15  2211  
e43473b7f223ec Vivek Goyal   2010-09-15 @2212  	spin_lock_irq(q->queue_lock);
c9589f03e49095 Tejun Heo     2015-08-18  2213  
b9147dd1bae2b1 Shaohua Li    2017-03-27  2214  	throtl_update_latency_buckets(td);
b9147dd1bae2b1 Shaohua Li    2017-03-27  2215  
c9589f03e49095 Tejun Heo     2015-08-18  2216  	if (unlikely(blk_queue_bypass(q)))
e1c15e207d153c Laibin Qiu    2022-03-08  2217  		goto out;
f469a7b4d5b1d1 Vivek Goyal   2011-05-19  2218  
2bc19cd5fdb5ff Jens Axboe    2017-04-20  2219  	blk_throtl_assoc_bio(tg, bio);
9e234eeafbe17e Shaohua Li    2017-03-27  2220  	blk_throtl_update_idletime(tg);
9e234eeafbe17e Shaohua Li    2017-03-27  2221  
73f0d49a9637a7 Tejun Heo     2013-05-14  2222  	sq = &tg->service_queue;
73f0d49a9637a7 Tejun Heo     2013-05-14  2223  
c79892c5576163 Shaohua Li    2017-03-27  2224  again:
9e660acffcd1b5 Tejun Heo     2013-05-14  2225  	while (true) {
3f0abd806651df Shaohua Li    2017-03-27  2226  		if (tg->last_low_overflow_time[rw] == 0)
3f0abd806651df Shaohua Li    2017-03-27  2227  			tg->last_low_overflow_time[rw] = jiffies;
3f0abd806651df Shaohua Li    2017-03-27  2228  		throtl_downgrade_check(tg);
fa6fb5aab85f3e Shaohua Li    2017-03-27  2229  		throtl_upgrade_check(tg);
9e660acffcd1b5 Tejun Heo     2013-05-14  2230  		/* throtl is FIFO - if bios are already queued, should queue */
0e9f4164ba9150 Tejun Heo     2013-05-14  2231  		if (sq->nr_queued[rw])
9e660acffcd1b5 Tejun Heo     2013-05-14  2232  			break;
9e660acffcd1b5 Tejun Heo     2013-05-14  2233  
9e660acffcd1b5 Tejun Heo     2013-05-14  2234  		/* if above limits, break to queue */
c79892c5576163 Shaohua Li    2017-03-27  2235  		if (!tg_may_dispatch(tg, bio, NULL)) {
3f0abd806651df Shaohua Li    2017-03-27  2236  			tg->last_low_overflow_time[rw] = jiffies;
b9147dd1bae2b1 Shaohua Li    2017-03-27  2237  			if (throtl_can_upgrade(td, tg)) {
b9147dd1bae2b1 Shaohua Li    2017-03-27  2238  				throtl_upgrade_state(td);
c79892c5576163 Shaohua Li    2017-03-27  2239  				goto again;
c79892c5576163 Shaohua Li    2017-03-27  2240  			}
9e660acffcd1b5 Tejun Heo     2013-05-14  2241  			break;
c79892c5576163 Shaohua Li    2017-03-27  2242  		}
de701c74a34005 Vivek Goyal   2011-03-07  2243  
9e660acffcd1b5 Tejun Heo     2013-05-14  2244  		/* within limits, let's charge and dispatch directly */
e43473b7f223ec Vivek Goyal   2010-09-15  2245  		throtl_charge_bio(tg, bio);
04521db04e9a11 Vivek Goyal   2011-03-22  2246  
04521db04e9a11 Vivek Goyal   2011-03-22  2247  		/*
04521db04e9a11 Vivek Goyal   2011-03-22  2248  		 * We need to trim slice even when bios are not being queued
04521db04e9a11 Vivek Goyal   2011-03-22  2249  		 * otherwise it might happen that a bio is not queued for
04521db04e9a11 Vivek Goyal   2011-03-22  2250  		 * a long time and slice keeps on extending and trim is not
04521db04e9a11 Vivek Goyal   2011-03-22  2251  		 * called for a long time. Now if limits are reduced suddenly
04521db04e9a11 Vivek Goyal   2011-03-22  2252  		 * we take into account all the IO dispatched so far at new
04521db04e9a11 Vivek Goyal   2011-03-22  2253  		 * low rate and * newly queued IO gets a really long dispatch
04521db04e9a11 Vivek Goyal   2011-03-22  2254  		 * time.
04521db04e9a11 Vivek Goyal   2011-03-22  2255  		 *
04521db04e9a11 Vivek Goyal   2011-03-22  2256  		 * So keep on trimming slice even if bio is not queued.
04521db04e9a11 Vivek Goyal   2011-03-22  2257  		 */
0f3457f60edc57 Tejun Heo     2013-05-14  2258  		throtl_trim_slice(tg, rw);
9e660acffcd1b5 Tejun Heo     2013-05-14  2259  
9e660acffcd1b5 Tejun Heo     2013-05-14  2260  		/*
9e660acffcd1b5 Tejun Heo     2013-05-14  2261  		 * @bio passed through this layer without being throttled.
9e660acffcd1b5 Tejun Heo     2013-05-14  2262  		 * Climb up the ladder.  If we''re already at the top, it
9e660acffcd1b5 Tejun Heo     2013-05-14  2263  		 * can be executed directly.
9e660acffcd1b5 Tejun Heo     2013-05-14  2264  		 */
c5cc2070b45333 Tejun Heo     2013-05-14  2265  		qn = &tg->qnode_on_parent[rw];
9e660acffcd1b5 Tejun Heo     2013-05-14  2266  		sq = sq->parent_sq;
9e660acffcd1b5 Tejun Heo     2013-05-14  2267  		tg = sq_to_tg(sq);
9e660acffcd1b5 Tejun Heo     2013-05-14  2268  		if (!tg)
e1c15e207d153c Laibin Qiu    2022-03-08  2269  			goto out;
e43473b7f223ec Vivek Goyal   2010-09-15  2270  	}
e43473b7f223ec Vivek Goyal   2010-09-15  2271  
9e660acffcd1b5 Tejun Heo     2013-05-14  2272  	/* out-of-limit, queue to @tg */
fda6f272c77a7a Tejun Heo     2013-05-14  2273  	throtl_log(sq, "[%c] bio. bdisp=%llu sz=%u bps=%llu iodisp=%u iops=%u queued=%d/%d",
8e89d13f4ede24 Vivek Goyal   2010-09-15  2274  		   rw == READ ? 'R' : 'W',
9f626e372a6024 Shaohua Li    2017-03-27  2275  		   tg->bytes_disp[rw], bio->bi_iter.bi_size,
9f626e372a6024 Shaohua Li    2017-03-27  2276  		   tg_bps_limit(tg, rw),
9f626e372a6024 Shaohua Li    2017-03-27  2277  		   tg->io_disp[rw], tg_iops_limit(tg, rw),
73f0d49a9637a7 Tejun Heo     2013-05-14  2278  		   sq->nr_queued[READ], sq->nr_queued[WRITE]);
e43473b7f223ec Vivek Goyal   2010-09-15  2279  
3f0abd806651df Shaohua Li    2017-03-27  2280  	tg->last_low_overflow_time[rw] = jiffies;
3f0abd806651df Shaohua Li    2017-03-27  2281  
b9147dd1bae2b1 Shaohua Li    2017-03-27  2282  	td->nr_queued[rw]++;
c5cc2070b45333 Tejun Heo     2013-05-14  2283  	throtl_add_bio_tg(bio, qn, tg);
bc16a4f933bc5e Tejun Heo     2011-10-19  2284  	throttled = true;
e43473b7f223ec Vivek Goyal   2010-09-15  2285  
7f52f98c2a8333 Tejun Heo     2013-05-14  2286  	/*
7f52f98c2a8333 Tejun Heo     2013-05-14  2287  	 * Update @tg's dispatch time and force schedule dispatch if @tg
7f52f98c2a8333 Tejun Heo     2013-05-14  2288  	 * was empty before @bio.  The forced scheduling isn't likely to
7f52f98c2a8333 Tejun Heo     2013-05-14  2289  	 * cause undue delay as @bio is likely to be dispatched directly if
7f52f98c2a8333 Tejun Heo     2013-05-14  2290  	 * its @tg's disptime is not in the future.
7f52f98c2a8333 Tejun Heo     2013-05-14  2291  	 */
0e9f4164ba9150 Tejun Heo     2013-05-14  2292  	if (tg->flags & THROTL_TG_WAS_EMPTY) {
77216b04848178 Tejun Heo     2013-05-14  2293  		tg_update_disptime(tg);
7f52f98c2a8333 Tejun Heo     2013-05-14  2294  		throtl_schedule_next_dispatch(tg->service_queue.parent_sq, true);
e43473b7f223ec Vivek Goyal   2010-09-15  2295  	}
e43473b7f223ec Vivek Goyal   2010-09-15  2296  
bc16a4f933bc5e Tejun Heo     2011-10-19  2297  out:
111be883981748 Shaohua Li    2017-12-20  2298  	bio_set_flag(bio, BIO_THROTTLED);
b9147dd1bae2b1 Shaohua Li    2017-03-27  2299  
b9147dd1bae2b1 Shaohua Li    2017-03-27  2300  #ifdef CONFIG_BLK_DEV_THROTTLING_LOW
b9147dd1bae2b1 Shaohua Li    2017-03-27  2301  	if (throttled || !td->track_bio_latency)
5238dcf4136fd7 Omar Sandoval 2018-05-09  2302  		bio->bi_issue.value |= BIO_ISSUE_THROTL_SKIP_LATENCY;
b9147dd1bae2b1 Shaohua Li    2017-03-27  2303  #endif
e1c15e207d153c Laibin Qiu    2022-03-08  2304  	if (locked)
e1c15e207d153c Laibin Qiu    2022-03-08  2305  		spin_unlock_irq(q->queue_lock);
bc16a4f933bc5e Tejun Heo     2011-10-19 @2306  	return throttled;
e43473b7f223ec Vivek Goyal   2010-09-15  2307  }
e43473b7f223ec Vivek Goyal   2010-09-15  2308  

:::::: The code at line 2306 was first introduced by commit
:::::: bc16a4f933bc5ed50826b20561e4c3515061998b block: reorganize throtl_get_tg() and blk_throtl_bio()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
