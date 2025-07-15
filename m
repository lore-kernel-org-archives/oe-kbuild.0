Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2017F4F6
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752594733; cv=none; b=cWTwBXUjeu9v1tvg5GRO4g/kdGWsgi2AjoxolKVTQlZPcfOqL2CsCrq3grrKkSs9XbD7Imqd61Fj/Bx4zy7BsriVDhmGl/i+I/LwZWSP95fJsAOAuaYdt552TFpFhpNGRoNMzkqvpk6GKw4NFB3OQKsAIPB5LZPn2sDWhB3W004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752594733; c=relaxed/simple;
	bh=w6JlGdr2eny/uwmdxP1SggzPBXqRcFwAh+aVI7Tc5qU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=peK02CXR4bUFGYWi6FthhYVFoFlVsDNitMrXK/DnaYbM0X4I6hzoE2o7cFhCi0eXjz2kCwODpy3BoK91CRhx+5Qn3NuZu7xTY0m4UaGOSRx1MgYXFnnmhNNoGNLJz6dibGQKw03pd15avy1KCdH7RFrv+e+98ou6cGttXvjjyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4sGsXmC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4sGsXmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752594731; x=1784130731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6JlGdr2eny/uwmdxP1SggzPBXqRcFwAh+aVI7Tc5qU=;
  b=a4sGsXmCEQO8qAUHy7Pw3StcyOIgdH6NTrgOpfdUSyFqgyeIeNLc3dop
   lL1VKtpXygAdkElwWQk/fvmVtxiQKonU9g29Gx3awiix+yHQL99dWJo7F
   IBLqlwbgE6IFqooYgB97siAHq9a3IXffU6/2pQ/Rn1CfPWmi7B2Z3yhXI
   0NVe1wSIAw/2tTriLQBe26HONzMzJlJq7xDW95y0TYEA+puPj1ucsEc/M
   GQIZi9elLTxFj09ORKZ7t9wh80WfOmt4e+ab9x5QFyNNBgeMqAPeTVJOs
   lnT7MjS0UKm3EKFjgL62/KuK4JYcHCTA1gOb0uJ47QmvgeSevPog1Z2LI
   g==;
X-CSE-ConnectionGUID: p/0REnzCT3Op0gG2d1y1hw==
X-CSE-MsgGUID: 56b5HooNSamSOauYDcPyog==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54676219"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54676219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:52:10 -0700
X-CSE-ConnectionGUID: MIm8z2nXRTaGh+0vbrdRLg==
X-CSE-MsgGUID: t7AvBJWwSh6AK0mKfqzbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188240976"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jul 2025 08:52:09 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubhwt-000BHK-0v;
	Tue, 15 Jul 2025 15:52:07 +0000
Date: Tue, 15 Jul 2025 23:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 1568/1568]
 block/blk-throttle.c:2306:1-7: preceding lock on line 2212
Message-ID: <202507152319.7qVm9PxC-lkp@intel.com>
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
head:   eabd480503b5c662a59778c9fa8c1a8f611d724e
commit: e1c15e207d153cafb3f3aa1cbc8000134fae1d40 [1568/1568] blk-throttle: Set BIO_THROTTLED when bio has been throttled
:::::: branch date: 7 hours ago
:::::: commit date: 3 years, 4 months ago
config: x86_64-randconfig-102-20250408 (https://download.01.org/0day-ci/archive/20250715/202507152319.7qVm9PxC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507152319.7qVm9PxC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-throttle.c:2306:1-7: preceding lock on line 2212

vim +2306 block/blk-throttle.c

2bc19cd5fdb5ff2 Jens Axboe    2017-04-20  2192  
ae1188963611119 Tejun Heo     2015-08-18  2193  bool blk_throtl_bio(struct request_queue *q, struct blkcg_gq *blkg,
ae1188963611119 Tejun Heo     2015-08-18  2194  		    struct bio *bio)
e43473b7f223ec8 Vivek Goyal   2010-09-15  2195  {
c5cc2070b45333f Tejun Heo     2013-05-14  2196  	struct throtl_qnode *qn = NULL;
ae1188963611119 Tejun Heo     2015-08-18  2197  	struct throtl_grp *tg = blkg_to_tg(blkg ?: q->root_blkg);
73f0d49a9637a7e Tejun Heo     2013-05-14  2198  	struct throtl_service_queue *sq;
0e9f4164ba91505 Tejun Heo     2013-05-14  2199  	bool rw = bio_data_dir(bio);
bc16a4f933bc5ed Tejun Heo     2011-10-19  2200  	bool throttled = false;
e1c15e207d153ca Laibin Qiu    2022-03-08  2201  	bool locked = true;
b9147dd1bae2b15 Shaohua Li    2017-03-27  2202  	struct throtl_data *td = tg->td;
e43473b7f223ec8 Vivek Goyal   2010-09-15  2203  
ae1188963611119 Tejun Heo     2015-08-18  2204  	WARN_ON_ONCE(!rcu_read_lock_held());
ae1188963611119 Tejun Heo     2015-08-18  2205  
2a0f61e6ecd08d2 Tejun Heo     2013-05-14  2206  	/* see throtl_charge_bio() */
e1c15e207d153ca Laibin Qiu    2022-03-08  2207  	if (bio_flagged(bio, BIO_THROTTLED) || !tg->has_rules[rw]) {
e1c15e207d153ca Laibin Qiu    2022-03-08  2208  		locked = false;
bc16a4f933bc5ed Tejun Heo     2011-10-19  2209  		goto out;
e1c15e207d153ca Laibin Qiu    2022-03-08  2210  	}
e43473b7f223ec8 Vivek Goyal   2010-09-15  2211  
e43473b7f223ec8 Vivek Goyal   2010-09-15 @2212  	spin_lock_irq(q->queue_lock);
c9589f03e490956 Tejun Heo     2015-08-18  2213  
b9147dd1bae2b15 Shaohua Li    2017-03-27  2214  	throtl_update_latency_buckets(td);
b9147dd1bae2b15 Shaohua Li    2017-03-27  2215  
c9589f03e490956 Tejun Heo     2015-08-18  2216  	if (unlikely(blk_queue_bypass(q)))
e1c15e207d153ca Laibin Qiu    2022-03-08  2217  		goto out;
f469a7b4d5b1d1d Vivek Goyal   2011-05-19  2218  
2bc19cd5fdb5ff2 Jens Axboe    2017-04-20  2219  	blk_throtl_assoc_bio(tg, bio);
9e234eeafbe17e8 Shaohua Li    2017-03-27  2220  	blk_throtl_update_idletime(tg);
9e234eeafbe17e8 Shaohua Li    2017-03-27  2221  
73f0d49a9637a7e Tejun Heo     2013-05-14  2222  	sq = &tg->service_queue;
73f0d49a9637a7e Tejun Heo     2013-05-14  2223  
c79892c5576163b Shaohua Li    2017-03-27  2224  again:
9e660acffcd1b5a Tejun Heo     2013-05-14  2225  	while (true) {
3f0abd806651df5 Shaohua Li    2017-03-27  2226  		if (tg->last_low_overflow_time[rw] == 0)
3f0abd806651df5 Shaohua Li    2017-03-27  2227  			tg->last_low_overflow_time[rw] = jiffies;
3f0abd806651df5 Shaohua Li    2017-03-27  2228  		throtl_downgrade_check(tg);
fa6fb5aab85f3e2 Shaohua Li    2017-03-27  2229  		throtl_upgrade_check(tg);
9e660acffcd1b5a Tejun Heo     2013-05-14  2230  		/* throtl is FIFO - if bios are already queued, should queue */
0e9f4164ba91505 Tejun Heo     2013-05-14  2231  		if (sq->nr_queued[rw])
9e660acffcd1b5a Tejun Heo     2013-05-14  2232  			break;
9e660acffcd1b5a Tejun Heo     2013-05-14  2233  
9e660acffcd1b5a Tejun Heo     2013-05-14  2234  		/* if above limits, break to queue */
c79892c5576163b Shaohua Li    2017-03-27  2235  		if (!tg_may_dispatch(tg, bio, NULL)) {
3f0abd806651df5 Shaohua Li    2017-03-27  2236  			tg->last_low_overflow_time[rw] = jiffies;
b9147dd1bae2b15 Shaohua Li    2017-03-27  2237  			if (throtl_can_upgrade(td, tg)) {
b9147dd1bae2b15 Shaohua Li    2017-03-27  2238  				throtl_upgrade_state(td);
c79892c5576163b Shaohua Li    2017-03-27  2239  				goto again;
c79892c5576163b Shaohua Li    2017-03-27  2240  			}
9e660acffcd1b5a Tejun Heo     2013-05-14  2241  			break;
c79892c5576163b Shaohua Li    2017-03-27  2242  		}
de701c74a34005e Vivek Goyal   2011-03-07  2243  
9e660acffcd1b5a Tejun Heo     2013-05-14  2244  		/* within limits, let's charge and dispatch directly */
e43473b7f223ec8 Vivek Goyal   2010-09-15  2245  		throtl_charge_bio(tg, bio);
04521db04e9a11e Vivek Goyal   2011-03-22  2246  
04521db04e9a11e Vivek Goyal   2011-03-22  2247  		/*
04521db04e9a11e Vivek Goyal   2011-03-22  2248  		 * We need to trim slice even when bios are not being queued
04521db04e9a11e Vivek Goyal   2011-03-22  2249  		 * otherwise it might happen that a bio is not queued for
04521db04e9a11e Vivek Goyal   2011-03-22  2250  		 * a long time and slice keeps on extending and trim is not
04521db04e9a11e Vivek Goyal   2011-03-22  2251  		 * called for a long time. Now if limits are reduced suddenly
04521db04e9a11e Vivek Goyal   2011-03-22  2252  		 * we take into account all the IO dispatched so far at new
04521db04e9a11e Vivek Goyal   2011-03-22  2253  		 * low rate and * newly queued IO gets a really long dispatch
04521db04e9a11e Vivek Goyal   2011-03-22  2254  		 * time.
04521db04e9a11e Vivek Goyal   2011-03-22  2255  		 *
04521db04e9a11e Vivek Goyal   2011-03-22  2256  		 * So keep on trimming slice even if bio is not queued.
04521db04e9a11e Vivek Goyal   2011-03-22  2257  		 */
0f3457f60edc573 Tejun Heo     2013-05-14  2258  		throtl_trim_slice(tg, rw);
9e660acffcd1b5a Tejun Heo     2013-05-14  2259  
9e660acffcd1b5a Tejun Heo     2013-05-14  2260  		/*
9e660acffcd1b5a Tejun Heo     2013-05-14  2261  		 * @bio passed through this layer without being throttled.
9e660acffcd1b5a Tejun Heo     2013-05-14  2262  		 * Climb up the ladder.  If we''re already at the top, it
9e660acffcd1b5a Tejun Heo     2013-05-14  2263  		 * can be executed directly.
9e660acffcd1b5a Tejun Heo     2013-05-14  2264  		 */
c5cc2070b45333f Tejun Heo     2013-05-14  2265  		qn = &tg->qnode_on_parent[rw];
9e660acffcd1b5a Tejun Heo     2013-05-14  2266  		sq = sq->parent_sq;
9e660acffcd1b5a Tejun Heo     2013-05-14  2267  		tg = sq_to_tg(sq);
9e660acffcd1b5a Tejun Heo     2013-05-14  2268  		if (!tg)
e1c15e207d153ca Laibin Qiu    2022-03-08  2269  			goto out;
e43473b7f223ec8 Vivek Goyal   2010-09-15  2270  	}
e43473b7f223ec8 Vivek Goyal   2010-09-15  2271  
9e660acffcd1b5a Tejun Heo     2013-05-14  2272  	/* out-of-limit, queue to @tg */
fda6f272c77a7ac Tejun Heo     2013-05-14  2273  	throtl_log(sq, "[%c] bio. bdisp=%llu sz=%u bps=%llu iodisp=%u iops=%u queued=%d/%d",
8e89d13f4ede246 Vivek Goyal   2010-09-15  2274  		   rw == READ ? 'R' : 'W',
9f626e372a60248 Shaohua Li    2017-03-27  2275  		   tg->bytes_disp[rw], bio->bi_iter.bi_size,
9f626e372a60248 Shaohua Li    2017-03-27  2276  		   tg_bps_limit(tg, rw),
9f626e372a60248 Shaohua Li    2017-03-27  2277  		   tg->io_disp[rw], tg_iops_limit(tg, rw),
73f0d49a9637a7e Tejun Heo     2013-05-14  2278  		   sq->nr_queued[READ], sq->nr_queued[WRITE]);
e43473b7f223ec8 Vivek Goyal   2010-09-15  2279  
3f0abd806651df5 Shaohua Li    2017-03-27  2280  	tg->last_low_overflow_time[rw] = jiffies;
3f0abd806651df5 Shaohua Li    2017-03-27  2281  
b9147dd1bae2b15 Shaohua Li    2017-03-27  2282  	td->nr_queued[rw]++;
c5cc2070b45333f Tejun Heo     2013-05-14  2283  	throtl_add_bio_tg(bio, qn, tg);
bc16a4f933bc5ed Tejun Heo     2011-10-19  2284  	throttled = true;
e43473b7f223ec8 Vivek Goyal   2010-09-15  2285  
7f52f98c2a83339 Tejun Heo     2013-05-14  2286  	/*
7f52f98c2a83339 Tejun Heo     2013-05-14  2287  	 * Update @tg's dispatch time and force schedule dispatch if @tg
7f52f98c2a83339 Tejun Heo     2013-05-14  2288  	 * was empty before @bio.  The forced scheduling isn't likely to
7f52f98c2a83339 Tejun Heo     2013-05-14  2289  	 * cause undue delay as @bio is likely to be dispatched directly if
7f52f98c2a83339 Tejun Heo     2013-05-14  2290  	 * its @tg's disptime is not in the future.
7f52f98c2a83339 Tejun Heo     2013-05-14  2291  	 */
0e9f4164ba91505 Tejun Heo     2013-05-14  2292  	if (tg->flags & THROTL_TG_WAS_EMPTY) {
77216b048481781 Tejun Heo     2013-05-14  2293  		tg_update_disptime(tg);
7f52f98c2a83339 Tejun Heo     2013-05-14  2294  		throtl_schedule_next_dispatch(tg->service_queue.parent_sq, true);
e43473b7f223ec8 Vivek Goyal   2010-09-15  2295  	}
e43473b7f223ec8 Vivek Goyal   2010-09-15  2296  
bc16a4f933bc5ed Tejun Heo     2011-10-19  2297  out:
111be883981748a Shaohua Li    2017-12-20  2298  	bio_set_flag(bio, BIO_THROTTLED);
b9147dd1bae2b15 Shaohua Li    2017-03-27  2299  
b9147dd1bae2b15 Shaohua Li    2017-03-27  2300  #ifdef CONFIG_BLK_DEV_THROTTLING_LOW
b9147dd1bae2b15 Shaohua Li    2017-03-27  2301  	if (throttled || !td->track_bio_latency)
5238dcf4136fd72 Omar Sandoval 2018-05-09  2302  		bio->bi_issue.value |= BIO_ISSUE_THROTL_SKIP_LATENCY;
b9147dd1bae2b15 Shaohua Li    2017-03-27  2303  #endif
e1c15e207d153ca Laibin Qiu    2022-03-08  2304  	if (locked)
e1c15e207d153ca Laibin Qiu    2022-03-08  2305  		spin_unlock_irq(q->queue_lock);
bc16a4f933bc5ed Tejun Heo     2011-10-19 @2306  	return throttled;
e43473b7f223ec8 Vivek Goyal   2010-09-15  2307  }
e43473b7f223ec8 Vivek Goyal   2010-09-15  2308  

:::::: The code at line 2306 was first introduced by commit
:::::: bc16a4f933bc5ed50826b20561e4c3515061998b block: reorganize throtl_get_tg() and blk_throtl_bio()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
