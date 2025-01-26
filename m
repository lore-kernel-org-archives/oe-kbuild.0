Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9BB18DF62
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904247; cv=none; b=Bj82jMmU2xq0nGI5D8eJmIJfjrr11OqvtidFvNrDNi0H8GhJH2pQrHR3EHHGn48E8IW5faUbWjXYwARLDg40ZZdhLCznl6TFTKfnPOawyDBtc/3ffE3wfeTH4brIkj4CK4yjh3PeYISR2vLLCtck0YSSteRqfvXOi5juy67u2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904247; c=relaxed/simple;
	bh=OcWOJtFFOkTKZLVp1iVCBFokjJpHDrB6rE5bwntkits=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ay2GsmhgUa/hS2lc4beO3jfNqQRLfSqegBoHCi9FS2SxpmqoOX/AekdT2Fukv/O/KJ0eyPCo+qRdm4CvWu1+IQdjIJY2U23nnuJ2U38DwiangrmMnB3Z2ZvgrAgpU65CbTS5KqsMqs1RT03aprN7Hg0JoVJfEKdwcQC4wxXjJzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaMQW/42; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaMQW/42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737904246; x=1769440246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcWOJtFFOkTKZLVp1iVCBFokjJpHDrB6rE5bwntkits=;
  b=FaMQW/42mLXxYPFI27FE0YVF3hfR89j9bU5TqoMYAkPYehUy8Bcgbc1/
   5OmPFf64hc+IHZTasDqdNeA69cAoI9VcYZCr4GJwNzQ4qmBi5vPRiGZ5j
   xgF5aMCUyDvZ499v5q9bgKAK9UUCWs0VMfDwTxo6DZaoAzmerq7qM4bsf
   AhB24a6A8w6v2NXTLrmt0figvSvsrtPoEfrnbRBRWgPxMPD1TfPg7q6T7
   Z3jcePsTh5p1GvHX+/M17clU9K7a9sIHHpLH7XDBIvTj5/RfWUVcnV0rC
   lgODp5UMGcfz9x2Y08MiPcGGFir1HKcMi4udyBlRZU6G2kNKHfdlXJw89
   w==;
X-CSE-ConnectionGUID: FzN490hWQXObRT9N1eWGcw==
X-CSE-MsgGUID: y+yp94tfT92EUaNFgq8cTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="55795816"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="55795816"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 07:10:45 -0800
X-CSE-ConnectionGUID: F1K2DlwtRi2CVLRu2Eb7mw==
X-CSE-MsgGUID: DQAGXC1TSISTHsYZm3B+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113361744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2025 07:10:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc4HY-000fRz-2W;
	Sun, 26 Jan 2025 15:10:40 +0000
Date: Sun, 26 Jan 2025 23:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 2/2] mm/compaction.c:2542
 compact_zone() error: uninitialized symbol 'vendor_ret'.
Message-ID: <202501262359.i0NhGpOd-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   49bd830ea5e30f59495e703aae18331882b76760
commit: 1eeadb47e0d294701a191de4df074b797646a430 [2/2] ANDROID: mm: vh for compaction begin/end
:::::: branch date: 21 hours ago
:::::: commit date: 2 years ago
config: i386-randconfig-141-20250126 (https://download.01.org/0day-ci/archive/20250126/202501262359.i0NhGpOd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501262359.i0NhGpOd-lkp@intel.com/

smatch warnings:
mm/compaction.c:2542 compact_zone() error: uninitialized symbol 'vendor_ret'.

vim +/vendor_ret +2542 mm/compaction.c

86a294a81f93d6f Michal Hocko    2016-05-20  2333  
5e1f0f098b4649f Mel Gorman      2019-03-05  2334  static enum compact_result
5e1f0f098b4649f Mel Gorman      2019-03-05  2335  compact_zone(struct compact_control *cc, struct capture_control *capc)
748446bb6b5a939 Mel Gorman      2010-05-24  2336  {
ea7ab982b6bdb7c Michal Hocko    2016-05-20  2337  	enum compact_result ret;
40cacbcb3240362 Mel Gorman      2019-03-05  2338  	unsigned long start_pfn = cc->zone->zone_start_pfn;
40cacbcb3240362 Mel Gorman      2019-03-05  2339  	unsigned long end_pfn = zone_end_pfn(cc->zone);
566e54e113eb2b6 Mel Gorman      2019-03-05  2340  	unsigned long last_migrated_pfn;
e0b9daeb453e602 David Rientjes  2014-06-04  2341  	const bool sync = cc->mode != MIGRATE_ASYNC;
8854c55f54bcc10 Mel Gorman      2019-03-05  2342  	bool update_cached;
1eeadb47e0d2947 Robin Hsu       2022-05-13  2343  	long vendor_ret;
748446bb6b5a939 Mel Gorman      2010-05-24  2344  
a94b525241c0fff Yafang Shao     2019-09-23  2345  	/*
a94b525241c0fff Yafang Shao     2019-09-23  2346  	 * These counters track activities during zone compaction.  Initialize
a94b525241c0fff Yafang Shao     2019-09-23  2347  	 * them before compacting a new zone.
a94b525241c0fff Yafang Shao     2019-09-23  2348  	 */
a94b525241c0fff Yafang Shao     2019-09-23  2349  	cc->total_migrate_scanned = 0;
a94b525241c0fff Yafang Shao     2019-09-23  2350  	cc->total_free_scanned = 0;
a94b525241c0fff Yafang Shao     2019-09-23  2351  	cc->nr_migratepages = 0;
a94b525241c0fff Yafang Shao     2019-09-23  2352  	cc->nr_freepages = 0;
a94b525241c0fff Yafang Shao     2019-09-23  2353  	INIT_LIST_HEAD(&cc->freepages);
a94b525241c0fff Yafang Shao     2019-09-23  2354  	INIT_LIST_HEAD(&cc->migratepages);
a94b525241c0fff Yafang Shao     2019-09-23  2355  
01c0bfe061f309b Wei Yang        2020-06-03  2356  	cc->migratetype = gfp_migratetype(cc->gfp_mask);
40cacbcb3240362 Mel Gorman      2019-03-05  2357  	ret = compaction_suitable(cc->zone, cc->order, cc->alloc_flags,
97a225e69a1f880 Joonsoo Kim     2020-06-03  2358  							cc->highest_zoneidx);
3e7d344970673c5 Mel Gorman      2011-01-13  2359  	/* Compaction is likely to fail */
cf378319d335663 Vlastimil Babka 2016-10-07  2360  	if (ret == COMPACT_SUCCESS || ret == COMPACT_SKIPPED)
3e7d344970673c5 Mel Gorman      2011-01-13  2361  		return ret;
c46649deae3f00a Michal Hocko    2016-05-20  2362  
c46649deae3f00a Michal Hocko    2016-05-20  2363  	/* huh, compaction_suitable is returning something unexpected */
c46649deae3f00a Michal Hocko    2016-05-20  2364  	VM_BUG_ON(ret != COMPACT_CONTINUE);
3e7d344970673c5 Mel Gorman      2011-01-13  2365  
d3132e4b83e6bd3 Vlastimil Babka 2014-01-21  2366  	/*
d3132e4b83e6bd3 Vlastimil Babka 2014-01-21  2367  	 * Clear pageblock skip if there were failures recently and compaction
accf62422b3a67f Vlastimil Babka 2016-03-17  2368  	 * is about to be retried after being deferred.
d3132e4b83e6bd3 Vlastimil Babka 2014-01-21  2369  	 */
40cacbcb3240362 Mel Gorman      2019-03-05  2370  	if (compaction_restarting(cc->zone, cc->order))
40cacbcb3240362 Mel Gorman      2019-03-05  2371  		__reset_isolation_suitable(cc->zone);
d3132e4b83e6bd3 Vlastimil Babka 2014-01-21  2372  
c89511ab2f8fe2b Mel Gorman      2012-10-08  2373  	/*
c89511ab2f8fe2b Mel Gorman      2012-10-08  2374  	 * Setup to move all movable pages to the end of the zone. Used cached
06ed29989f39f51 Vlastimil Babka 2016-10-07  2375  	 * information on where the scanners should start (unless we explicitly
06ed29989f39f51 Vlastimil Babka 2016-10-07  2376  	 * want to compact the whole zone), but check that it is initialised
06ed29989f39f51 Vlastimil Babka 2016-10-07  2377  	 * by ensuring the values are within zone boundaries.
c89511ab2f8fe2b Mel Gorman      2012-10-08  2378  	 */
70b44595eafe9c7 Mel Gorman      2019-03-05  2379  	cc->fast_start_pfn = 0;
06ed29989f39f51 Vlastimil Babka 2016-10-07  2380  	if (cc->whole_zone) {
06ed29989f39f51 Vlastimil Babka 2016-10-07  2381  		cc->migrate_pfn = start_pfn;
06ed29989f39f51 Vlastimil Babka 2016-10-07  2382  		cc->free_pfn = pageblock_start_pfn(end_pfn - 1);
06ed29989f39f51 Vlastimil Babka 2016-10-07  2383  	} else {
40cacbcb3240362 Mel Gorman      2019-03-05  2384  		cc->migrate_pfn = cc->zone->compact_cached_migrate_pfn[sync];
40cacbcb3240362 Mel Gorman      2019-03-05  2385  		cc->free_pfn = cc->zone->compact_cached_free_pfn;
623446e4dc45b37 Joonsoo Kim     2016-03-15  2386  		if (cc->free_pfn < start_pfn || cc->free_pfn >= end_pfn) {
06b6640a3902d6d Vlastimil Babka 2016-05-19  2387  			cc->free_pfn = pageblock_start_pfn(end_pfn - 1);
40cacbcb3240362 Mel Gorman      2019-03-05  2388  			cc->zone->compact_cached_free_pfn = cc->free_pfn;
c89511ab2f8fe2b Mel Gorman      2012-10-08  2389  		}
623446e4dc45b37 Joonsoo Kim     2016-03-15  2390  		if (cc->migrate_pfn < start_pfn || cc->migrate_pfn >= end_pfn) {
c89511ab2f8fe2b Mel Gorman      2012-10-08  2391  			cc->migrate_pfn = start_pfn;
40cacbcb3240362 Mel Gorman      2019-03-05  2392  			cc->zone->compact_cached_migrate_pfn[0] = cc->migrate_pfn;
40cacbcb3240362 Mel Gorman      2019-03-05  2393  			cc->zone->compact_cached_migrate_pfn[1] = cc->migrate_pfn;
c89511ab2f8fe2b Mel Gorman      2012-10-08  2394  		}
c8f7de0bfae36e8 Michal Hocko    2016-05-20  2395  
e332f741a8dd1ec Mel Gorman      2019-03-05  2396  		if (cc->migrate_pfn <= cc->zone->compact_init_migrate_pfn)
c8f7de0bfae36e8 Michal Hocko    2016-05-20  2397  			cc->whole_zone = true;
06ed29989f39f51 Vlastimil Babka 2016-10-07  2398  	}
c8f7de0bfae36e8 Michal Hocko    2016-05-20  2399  
566e54e113eb2b6 Mel Gorman      2019-03-05  2400  	last_migrated_pfn = 0;
748446bb6b5a939 Mel Gorman      2010-05-24  2401  
8854c55f54bcc10 Mel Gorman      2019-03-05  2402  	/*
8854c55f54bcc10 Mel Gorman      2019-03-05  2403  	 * Migrate has separate cached PFNs for ASYNC and SYNC* migration on
8854c55f54bcc10 Mel Gorman      2019-03-05  2404  	 * the basis that some migrations will fail in ASYNC mode. However,
8854c55f54bcc10 Mel Gorman      2019-03-05  2405  	 * if the cached PFNs match and pageblocks are skipped due to having
8854c55f54bcc10 Mel Gorman      2019-03-05  2406  	 * no isolation candidates, then the sync state does not matter.
8854c55f54bcc10 Mel Gorman      2019-03-05  2407  	 * Until a pageblock with isolation candidates is found, keep the
8854c55f54bcc10 Mel Gorman      2019-03-05  2408  	 * cached PFNs in sync to avoid revisiting the same blocks.
8854c55f54bcc10 Mel Gorman      2019-03-05  2409  	 */
8854c55f54bcc10 Mel Gorman      2019-03-05  2410  	update_cached = !sync &&
8854c55f54bcc10 Mel Gorman      2019-03-05  2411  		cc->zone->compact_cached_migrate_pfn[0] == cc->zone->compact_cached_migrate_pfn[1];
8854c55f54bcc10 Mel Gorman      2019-03-05  2412  
16c4a097a035c01 Joonsoo Kim     2015-02-11  2413  	trace_mm_compaction_begin(start_pfn, cc->migrate_pfn,
16c4a097a035c01 Joonsoo Kim     2015-02-11  2414  				cc->free_pfn, end_pfn, sync);
1eeadb47e0d2947 Robin Hsu       2022-05-13  2415  	trace_android_vh_mm_compaction_begin(cc, &vendor_ret);
0eb927c0ab789d3 Mel Gorman      2014-01-21  2416  
361a2a229fa31ab Minchan Kim     2021-05-04  2417  	/* lru_add_drain_all could be expensive with involving other CPUs */
361a2a229fa31ab Minchan Kim     2021-05-04  2418  	lru_add_drain();
748446bb6b5a939 Mel Gorman      2010-05-24  2419  
40cacbcb3240362 Mel Gorman      2019-03-05  2420  	while ((ret = compact_finished(cc)) == COMPACT_CONTINUE) {
9d502c1c8d47b33 Minchan Kim     2011-03-22  2421  		int err;
19d3cf9de1c72fd Yanfei Xu       2020-12-14  2422  		unsigned long iteration_start_pfn = cc->migrate_pfn;
748446bb6b5a939 Mel Gorman      2010-05-24  2423  
804d3121ba5f03a Mel Gorman      2019-03-05  2424  		/*
804d3121ba5f03a Mel Gorman      2019-03-05  2425  		 * Avoid multiple rescans which can happen if a page cannot be
804d3121ba5f03a Mel Gorman      2019-03-05  2426  		 * isolated (dirty/writeback in async mode) or if the migrated
804d3121ba5f03a Mel Gorman      2019-03-05  2427  		 * pages are being allocated before the pageblock is cleared.
804d3121ba5f03a Mel Gorman      2019-03-05  2428  		 * The first rescan will capture the entire pageblock for
804d3121ba5f03a Mel Gorman      2019-03-05  2429  		 * migration. If it fails, it'll be marked skip and scanning
804d3121ba5f03a Mel Gorman      2019-03-05  2430  		 * will proceed as normal.
804d3121ba5f03a Mel Gorman      2019-03-05  2431  		 */
804d3121ba5f03a Mel Gorman      2019-03-05  2432  		cc->rescan = false;
804d3121ba5f03a Mel Gorman      2019-03-05  2433  		if (pageblock_start_pfn(last_migrated_pfn) ==
19d3cf9de1c72fd Yanfei Xu       2020-12-14  2434  		    pageblock_start_pfn(iteration_start_pfn)) {
804d3121ba5f03a Mel Gorman      2019-03-05  2435  			cc->rescan = true;
804d3121ba5f03a Mel Gorman      2019-03-05  2436  		}
804d3121ba5f03a Mel Gorman      2019-03-05  2437  
32aaf0553df99cc Pengfei Li      2019-09-23  2438  		switch (isolate_migratepages(cc)) {
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2439  		case ISOLATE_ABORT:
2d1e10412c2388f Vlastimil Babka 2015-11-05  2440  			ret = COMPACT_CONTENDED;
5733c7d11dff44e Rafael Aquini   2012-12-11  2441  			putback_movable_pages(&cc->migratepages);
e64c5237cf6ff47 Shaohua Li      2012-10-08  2442  			cc->nr_migratepages = 0;
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2443  			goto out;
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2444  		case ISOLATE_NONE:
8854c55f54bcc10 Mel Gorman      2019-03-05  2445  			if (update_cached) {
8854c55f54bcc10 Mel Gorman      2019-03-05  2446  				cc->zone->compact_cached_migrate_pfn[1] =
8854c55f54bcc10 Mel Gorman      2019-03-05  2447  					cc->zone->compact_cached_migrate_pfn[0];
8854c55f54bcc10 Mel Gorman      2019-03-05  2448  			}
8854c55f54bcc10 Mel Gorman      2019-03-05  2449  
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2450  			/*
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2451  			 * We haven't isolated and migrated anything, but
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2452  			 * there might still be unflushed migrations from
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2453  			 * previous cc->order aligned block.
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2454  			 */
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2455  			goto check_drain;
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2456  		case ISOLATE_SUCCESS:
8854c55f54bcc10 Mel Gorman      2019-03-05  2457  			update_cached = false;
19d3cf9de1c72fd Yanfei Xu       2020-12-14  2458  			last_migrated_pfn = iteration_start_pfn;
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2459  		}
748446bb6b5a939 Mel Gorman      2010-05-24  2460  
d53aea3d46d64e9 David Rientjes  2014-06-04  2461  		err = migrate_pages(&cc->migratepages, compaction_alloc,
e0b9daeb453e602 David Rientjes  2014-06-04  2462  				compaction_free, (unsigned long)cc, cc->mode,
5ac95884a784e82 Yang Shi        2021-09-02  2463  				MR_COMPACTION, NULL);
748446bb6b5a939 Mel Gorman      2010-05-24  2464  
f8c9301fa5a2a8b Vlastimil Babka 2014-06-04  2465  		trace_mm_compaction_migratepages(cc->nr_migratepages, err,
f8c9301fa5a2a8b Vlastimil Babka 2014-06-04  2466  							&cc->migratepages);
748446bb6b5a939 Mel Gorman      2010-05-24  2467  
f8c9301fa5a2a8b Vlastimil Babka 2014-06-04  2468  		/* All pages were either migrated or will be released */
f8c9301fa5a2a8b Vlastimil Babka 2014-06-04  2469  		cc->nr_migratepages = 0;
9d502c1c8d47b33 Minchan Kim     2011-03-22  2470  		if (err) {
5733c7d11dff44e Rafael Aquini   2012-12-11  2471  			putback_movable_pages(&cc->migratepages);
7ed695e069c3cbe Vlastimil Babka 2014-01-21  2472  			/*
7ed695e069c3cbe Vlastimil Babka 2014-01-21  2473  			 * migrate_pages() may return -ENOMEM when scanners meet
7ed695e069c3cbe Vlastimil Babka 2014-01-21  2474  			 * and we want compact_finished() to detect it
7ed695e069c3cbe Vlastimil Babka 2014-01-21  2475  			 */
f2849aa09d4fbc4 Vlastimil Babka 2015-09-08  2476  			if (err == -ENOMEM && !compact_scanners_met(cc)) {
2d1e10412c2388f Vlastimil Babka 2015-11-05  2477  				ret = COMPACT_CONTENDED;
4bf2bba3750f10a David Rientjes  2012-07-11  2478  				goto out;
4bf2bba3750f10a David Rientjes  2012-07-11  2479  			}
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2480  			/*
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2481  			 * We failed to migrate at least one page in the current
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2482  			 * order-aligned block, so skip the rest of it.
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2483  			 */
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2484  			if (cc->direct_compaction &&
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2485  						(cc->mode == MIGRATE_ASYNC)) {
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2486  				cc->migrate_pfn = block_end_pfn(
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2487  						cc->migrate_pfn - 1, cc->order);
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2488  				/* Draining pcplists is useless in this case */
566e54e113eb2b6 Mel Gorman      2019-03-05  2489  				last_migrated_pfn = 0;
fdd048e12c9a46d Vlastimil Babka 2016-05-19  2490  			}
748446bb6b5a939 Mel Gorman      2010-05-24  2491  		}
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2492  
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2493  check_drain:
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2494  		/*
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2495  		 * Has the migration scanner moved away from the previous
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2496  		 * cc->order aligned block where we migrated from? If yes,
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2497  		 * flush the pages that were freed, so that they can merge and
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2498  		 * compact_finished() can detect immediately if allocation
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2499  		 * would succeed.
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2500  		 */
566e54e113eb2b6 Mel Gorman      2019-03-05  2501  		if (cc->order > 0 && last_migrated_pfn) {
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2502  			unsigned long current_block_start =
06b6640a3902d6d Vlastimil Babka 2016-05-19  2503  				block_start_pfn(cc->migrate_pfn, cc->order);
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2504  
566e54e113eb2b6 Mel Gorman      2019-03-05  2505  			if (last_migrated_pfn < current_block_start) {
b01b2141999936a Ingo Molnar     2020-05-27  2506  				lru_add_drain_cpu_zone(cc->zone);
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2507  				/* No more flushing until we migrate again */
566e54e113eb2b6 Mel Gorman      2019-03-05  2508  				last_migrated_pfn = 0;
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2509  			}
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2510  		}
fdaf7f5c40f3d20 Vlastimil Babka 2014-12-10  2511  
5e1f0f098b4649f Mel Gorman      2019-03-05  2512  		/* Stop if a page has been captured */
5e1f0f098b4649f Mel Gorman      2019-03-05  2513  		if (capc && capc->page) {
5e1f0f098b4649f Mel Gorman      2019-03-05  2514  			ret = COMPACT_SUCCESS;
5e1f0f098b4649f Mel Gorman      2019-03-05  2515  			break;
5e1f0f098b4649f Mel Gorman      2019-03-05  2516  		}
748446bb6b5a939 Mel Gorman      2010-05-24  2517  	}
748446bb6b5a939 Mel Gorman      2010-05-24  2518  
f9e35b3b41f47c4 Mel Gorman      2011-06-15  2519  out:
6bace090a25455c Vlastimil Babka 2014-12-10  2520  	/*
6bace090a25455c Vlastimil Babka 2014-12-10  2521  	 * Release free pages and update where the free scanner should restart,
6bace090a25455c Vlastimil Babka 2014-12-10  2522  	 * so we don't leave any returned pages behind in the next attempt.
6bace090a25455c Vlastimil Babka 2014-12-10  2523  	 */
6bace090a25455c Vlastimil Babka 2014-12-10  2524  	if (cc->nr_freepages > 0) {
6bace090a25455c Vlastimil Babka 2014-12-10  2525  		unsigned long free_pfn = release_freepages(&cc->freepages);
6bace090a25455c Vlastimil Babka 2014-12-10  2526  
6bace090a25455c Vlastimil Babka 2014-12-10  2527  		cc->nr_freepages = 0;
6bace090a25455c Vlastimil Babka 2014-12-10  2528  		VM_BUG_ON(free_pfn == 0);
6bace090a25455c Vlastimil Babka 2014-12-10  2529  		/* The cached pfn is always the first in a pageblock */
06b6640a3902d6d Vlastimil Babka 2016-05-19  2530  		free_pfn = pageblock_start_pfn(free_pfn);
6bace090a25455c Vlastimil Babka 2014-12-10  2531  		/*
6bace090a25455c Vlastimil Babka 2014-12-10  2532  		 * Only go back, not forward. The cached pfn might have been
6bace090a25455c Vlastimil Babka 2014-12-10  2533  		 * already reset to zone end in compact_finished()
6bace090a25455c Vlastimil Babka 2014-12-10  2534  		 */
40cacbcb3240362 Mel Gorman      2019-03-05  2535  		if (free_pfn > cc->zone->compact_cached_free_pfn)
40cacbcb3240362 Mel Gorman      2019-03-05  2536  			cc->zone->compact_cached_free_pfn = free_pfn;
6bace090a25455c Vlastimil Babka 2014-12-10  2537  	}
748446bb6b5a939 Mel Gorman      2010-05-24  2538  
7f354a548d1cb6b David Rientjes  2017-02-22  2539  	count_compact_events(COMPACTMIGRATE_SCANNED, cc->total_migrate_scanned);
7f354a548d1cb6b David Rientjes  2017-02-22  2540  	count_compact_events(COMPACTFREE_SCANNED, cc->total_free_scanned);
7f354a548d1cb6b David Rientjes  2017-02-22  2541  
1eeadb47e0d2947 Robin Hsu       2022-05-13 @2542  	trace_android_vh_mm_compaction_end(cc, vendor_ret);
16c4a097a035c01 Joonsoo Kim     2015-02-11  2543  	trace_mm_compaction_end(start_pfn, cc->migrate_pfn,
16c4a097a035c01 Joonsoo Kim     2015-02-11  2544  				cc->free_pfn, end_pfn, sync, ret);
0eb927c0ab789d3 Mel Gorman      2014-01-21  2545  
748446bb6b5a939 Mel Gorman      2010-05-24  2546  	return ret;
748446bb6b5a939 Mel Gorman      2010-05-24  2547  }
76ab0f530e4a01d Mel Gorman      2010-05-24  2548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
