Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB02E64D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 23:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgAiP0Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699311828; x=1730847828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=az8tkFE2+VKK4RpXqHAsA3CUTszAVwgq5BZn+hxM3js=;
  b=KgAiP0PnSJHhkuQREVOMjIM08lPaZQlznrsbNpr44IFXxnABnCiq6A0i
   qhBwos/tzjwH8qrSP020DpcDIeekR22QfEza6hzbQckG7QyQ52tFNf3tE
   sstx1QTxGl72brJOUYcrTip3teB0ZsLPexlz2VKP5r+PRSsgucSMsZqx3
   yq9UVLu2UpNEa7Xr+UuFeDGSx1cvfRIMxTSXSd648OP26KaUOkpO28Ln+
   TbU7E7ob8r/NCY/JdonXYDkMWKKRa/b1lXDhGdwqzbvsLcprjLnBgg8SN
   BbJkLdULclUy/+usvi0mwgCMsjPUqgXn9w8ZVsWCuaL5jzCQ7KAyPeX0f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420494999"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="420494999"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 15:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="755990820"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="755990820"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2023 15:03:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r08dD-0006nT-05;
	Mon, 06 Nov 2023 23:03:43 +0000
Date: Tue, 7 Nov 2023 07:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10 2/3] mm/page_alloc.c:5037
 __alloc_pages_slowpath() error: uninitialized symbol 'vh_record'.
Message-ID: <202311070618.MMlpzTTs-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   ba88bbf1bb7e22d7b18ad233afd948c4e98923be
commit: 4536de1b708cd4cccf9d47ba8e368b2df67ba10c [2/3] ANDROID: vendor_hooks: add hooks in __alloc_pages_slowpath
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231107/202311070618.MMlpzTTs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070618.MMlpzTTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070618.MMlpzTTs-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:5037 __alloc_pages_slowpath() error: uninitialized symbol 'vh_record'.

vim +/vh_record +5037 mm/page_alloc.c

902b62810a57ba Vlastimil Babka    2017-07-06  4777  
11e33f6a55ed78 Mel Gorman         2009-06-16  4778  static inline struct page *
11e33f6a55ed78 Mel Gorman         2009-06-16  4779  __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
a9263751e11a07 Vlastimil Babka    2015-02-11  4780  						struct alloc_context *ac)
11e33f6a55ed78 Mel Gorman         2009-06-16  4781  {
d0164adc89f6bb Mel Gorman         2015-11-06  4782  	bool can_direct_reclaim = gfp_mask & __GFP_DIRECT_RECLAIM;
282722b0d258ec Vlastimil Babka    2017-05-08  4783  	const bool costly_order = order > PAGE_ALLOC_COSTLY_ORDER;
11e33f6a55ed78 Mel Gorman         2009-06-16  4784  	struct page *page = NULL;
c603844bdcb523 Mel Gorman         2016-05-19  4785  	unsigned int alloc_flags;
11e33f6a55ed78 Mel Gorman         2009-06-16  4786  	unsigned long did_some_progress;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4787  	enum compact_priority compact_priority;
c5d01d0d18e2ab Michal Hocko       2016-05-20  4788  	enum compact_result compact_result;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4789  	int compaction_retries;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4790  	int no_progress_loops;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4791  	unsigned int cpuset_mems_cookie;
cd04ae1e2dc8e3 Michal Hocko       2017-09-06  4792  	int reserve_flags;
4536de1b708cd4 liuhailong         2022-07-21  4793  	unsigned long vh_record;
e09000ee1915ee Greg Kroah-Hartman 2021-10-22  4794  
4536de1b708cd4 liuhailong         2022-07-21  4795  	trace_android_vh_alloc_pages_slowpath_begin(gfp_mask, order, &vh_record);
d0164adc89f6bb Mel Gorman         2015-11-06  4796  	/*
d0164adc89f6bb Mel Gorman         2015-11-06  4797  	 * We also sanity check to catch abuse of atomic reserves being used by
d0164adc89f6bb Mel Gorman         2015-11-06  4798  	 * callers that are not in atomic context.
d0164adc89f6bb Mel Gorman         2015-11-06  4799  	 */
d0164adc89f6bb Mel Gorman         2015-11-06  4800  	if (WARN_ON_ONCE((gfp_mask & (__GFP_ATOMIC|__GFP_DIRECT_RECLAIM)) ==
d0164adc89f6bb Mel Gorman         2015-11-06  4801  				(__GFP_ATOMIC|__GFP_DIRECT_RECLAIM)))
d0164adc89f6bb Mel Gorman         2015-11-06  4802  		gfp_mask &= ~__GFP_ATOMIC;
d0164adc89f6bb Mel Gorman         2015-11-06  4803  
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4804  retry_cpuset:
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4805  	compaction_retries = 0;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4806  	no_progress_loops = 0;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4807  	compact_priority = DEF_COMPACT_PRIORITY;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4808  	cpuset_mems_cookie = read_mems_allowed_begin();
9a67f6488eca92 Michal Hocko       2017-02-22  4809  
9a67f6488eca92 Michal Hocko       2017-02-22  4810  	/*
9a67f6488eca92 Michal Hocko       2017-02-22  4811  	 * The fast path uses conservative alloc_flags to succeed only until
9a67f6488eca92 Michal Hocko       2017-02-22  4812  	 * kswapd needs to be woken up, and to avoid the cost of setting up
9a67f6488eca92 Michal Hocko       2017-02-22  4813  	 * alloc_flags precisely. So we do that now.
9a67f6488eca92 Michal Hocko       2017-02-22  4814  	 */
9a67f6488eca92 Michal Hocko       2017-02-22  4815  	alloc_flags = gfp_to_alloc_flags(gfp_mask);
9a67f6488eca92 Michal Hocko       2017-02-22  4816  
e47483bca2cc59 Vlastimil Babka    2017-01-24  4817  	/*
e47483bca2cc59 Vlastimil Babka    2017-01-24  4818  	 * We need to recalculate the starting point for the zonelist iterator
e47483bca2cc59 Vlastimil Babka    2017-01-24  4819  	 * because we might have used different nodemask in the fast path, or
e47483bca2cc59 Vlastimil Babka    2017-01-24  4820  	 * there was a cpuset modification and we are retrying - otherwise we
e47483bca2cc59 Vlastimil Babka    2017-01-24  4821  	 * could end up iterating over non-eligible zones endlessly.
e47483bca2cc59 Vlastimil Babka    2017-01-24  4822  	 */
e47483bca2cc59 Vlastimil Babka    2017-01-24  4823  	ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
97a225e69a1f88 Joonsoo Kim        2020-06-03  4824  					ac->highest_zoneidx, ac->nodemask);
e47483bca2cc59 Vlastimil Babka    2017-01-24  4825  	if (!ac->preferred_zoneref->zone)
e47483bca2cc59 Vlastimil Babka    2017-01-24  4826  		goto nopage;
e47483bca2cc59 Vlastimil Babka    2017-01-24  4827  
0a79cdad5eb213 Mel Gorman         2018-12-28  4828  	if (alloc_flags & ALLOC_KSWAPD)
5ecd9d403ad081 David Rientjes     2018-04-05  4829  		wake_all_kswapds(order, gfp_mask, ac);
23771235bb569c Vlastimil Babka    2016-07-28  4830  
23771235bb569c Vlastimil Babka    2016-07-28  4831  	/*
23771235bb569c Vlastimil Babka    2016-07-28  4832  	 * The adjusted alloc_flags might result in immediate success, so try
23771235bb569c Vlastimil Babka    2016-07-28  4833  	 * that first
23771235bb569c Vlastimil Babka    2016-07-28  4834  	 */
23771235bb569c Vlastimil Babka    2016-07-28  4835  	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
23771235bb569c Vlastimil Babka    2016-07-28  4836  	if (page)
23771235bb569c Vlastimil Babka    2016-07-28  4837  		goto got_pg;
23771235bb569c Vlastimil Babka    2016-07-28  4838  
a8161d1ed60985 Vlastimil Babka    2016-07-28  4839  	/*
a8161d1ed60985 Vlastimil Babka    2016-07-28  4840  	 * For costly allocations, try direct compaction first, as it's likely
282722b0d258ec Vlastimil Babka    2017-05-08  4841  	 * that we have enough base pages and don't need to reclaim. For non-
282722b0d258ec Vlastimil Babka    2017-05-08  4842  	 * movable high-order allocations, do that as well, as compaction will
282722b0d258ec Vlastimil Babka    2017-05-08  4843  	 * try prevent permanent fragmentation by migrating from blocks of the
282722b0d258ec Vlastimil Babka    2017-05-08  4844  	 * same migratetype.
282722b0d258ec Vlastimil Babka    2017-05-08  4845  	 * Don't try this for allocations that are allowed to ignore
282722b0d258ec Vlastimil Babka    2017-05-08  4846  	 * watermarks, as the ALLOC_NO_WATERMARKS attempt didn't yet happen.
282722b0d258ec Vlastimil Babka    2017-05-08  4847  	 */
282722b0d258ec Vlastimil Babka    2017-05-08  4848  	if (can_direct_reclaim &&
282722b0d258ec Vlastimil Babka    2017-05-08  4849  			(costly_order ||
282722b0d258ec Vlastimil Babka    2017-05-08  4850  			   (order > 0 && ac->migratetype != MIGRATE_MOVABLE))
282722b0d258ec Vlastimil Babka    2017-05-08  4851  			&& !gfp_pfmemalloc_allowed(gfp_mask)) {
a8161d1ed60985 Vlastimil Babka    2016-07-28  4852  		page = __alloc_pages_direct_compact(gfp_mask, order,
a8161d1ed60985 Vlastimil Babka    2016-07-28  4853  						alloc_flags, ac,
a5508cd83f10f6 Vlastimil Babka    2016-07-28  4854  						INIT_COMPACT_PRIORITY,
a8161d1ed60985 Vlastimil Babka    2016-07-28  4855  						&compact_result);
a8161d1ed60985 Vlastimil Babka    2016-07-28  4856  		if (page)
a8161d1ed60985 Vlastimil Babka    2016-07-28  4857  			goto got_pg;
a8161d1ed60985 Vlastimil Babka    2016-07-28  4858  
cc638f329ef605 Vlastimil Babka    2020-01-13  4859  		/*
cc638f329ef605 Vlastimil Babka    2020-01-13  4860  		 * Checks for costly allocations with __GFP_NORETRY, which
cc638f329ef605 Vlastimil Babka    2020-01-13  4861  		 * includes some THP page fault allocations
cc638f329ef605 Vlastimil Babka    2020-01-13  4862  		 */
cc638f329ef605 Vlastimil Babka    2020-01-13  4863  		if (costly_order && (gfp_mask & __GFP_NORETRY)) {
b39d0ee2632d2f David Rientjes     2019-09-04  4864  			/*
b39d0ee2632d2f David Rientjes     2019-09-04  4865  			 * If allocating entire pageblock(s) and compaction
b39d0ee2632d2f David Rientjes     2019-09-04  4866  			 * failed because all zones are below low watermarks
b39d0ee2632d2f David Rientjes     2019-09-04  4867  			 * or is prohibited because it recently failed at this
3f36d866945760 David Rientjes     2019-10-14  4868  			 * order, fail immediately unless the allocator has
3f36d866945760 David Rientjes     2019-10-14  4869  			 * requested compaction and reclaim retry.
b39d0ee2632d2f David Rientjes     2019-09-04  4870  			 *
b39d0ee2632d2f David Rientjes     2019-09-04  4871  			 * Reclaim is
b39d0ee2632d2f David Rientjes     2019-09-04  4872  			 *  - potentially very expensive because zones are far
b39d0ee2632d2f David Rientjes     2019-09-04  4873  			 *    below their low watermarks or this is part of very
b39d0ee2632d2f David Rientjes     2019-09-04  4874  			 *    bursty high order allocations,
b39d0ee2632d2f David Rientjes     2019-09-04  4875  			 *  - not guaranteed to help because isolate_freepages()
b39d0ee2632d2f David Rientjes     2019-09-04  4876  			 *    may not iterate over freed pages as part of its
b39d0ee2632d2f David Rientjes     2019-09-04  4877  			 *    linear scan, and
b39d0ee2632d2f David Rientjes     2019-09-04  4878  			 *  - unlikely to make entire pageblocks free on its
b39d0ee2632d2f David Rientjes     2019-09-04  4879  			 *    own.
b39d0ee2632d2f David Rientjes     2019-09-04  4880  			 */
b39d0ee2632d2f David Rientjes     2019-09-04  4881  			if (compact_result == COMPACT_SKIPPED ||
b39d0ee2632d2f David Rientjes     2019-09-04  4882  			    compact_result == COMPACT_DEFERRED)
b39d0ee2632d2f David Rientjes     2019-09-04  4883  				goto nopage;
a8161d1ed60985 Vlastimil Babka    2016-07-28  4884  
a8161d1ed60985 Vlastimil Babka    2016-07-28  4885  			/*
3eb2771b06d8e2 Vlastimil Babka    2016-07-28  4886  			 * Looks like reclaim/compaction is worth trying, but
3eb2771b06d8e2 Vlastimil Babka    2016-07-28  4887  			 * sync compaction could be very expensive, so keep
2516035499b955 Vlastimil Babka    2016-07-28  4888  			 * using async compaction.
a8161d1ed60985 Vlastimil Babka    2016-07-28  4889  			 */
a5508cd83f10f6 Vlastimil Babka    2016-07-28  4890  			compact_priority = INIT_COMPACT_PRIORITY;
a8161d1ed60985 Vlastimil Babka    2016-07-28  4891  		}
a8161d1ed60985 Vlastimil Babka    2016-07-28  4892  	}
23771235bb569c Vlastimil Babka    2016-07-28  4893  
31a6c1909f51db Vlastimil Babka    2016-07-28  4894  retry:
23771235bb569c Vlastimil Babka    2016-07-28  4895  	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
0a79cdad5eb213 Mel Gorman         2018-12-28  4896  	if (alloc_flags & ALLOC_KSWAPD)
5ecd9d403ad081 David Rientjes     2018-04-05  4897  		wake_all_kswapds(order, gfp_mask, ac);
31a6c1909f51db Vlastimil Babka    2016-07-28  4898  
cd04ae1e2dc8e3 Michal Hocko       2017-09-06  4899  	reserve_flags = __gfp_pfmemalloc_flags(gfp_mask);
cd04ae1e2dc8e3 Michal Hocko       2017-09-06  4900  	if (reserve_flags)
8510e69c8efef8 Joonsoo Kim        2020-08-06  4901  		alloc_flags = current_alloc_flags(gfp_mask, reserve_flags);
23771235bb569c Vlastimil Babka    2016-07-28  4902  
e46e7b77c9096e Mel Gorman         2016-06-03  4903  	/*
d6a24df00638a0 Vlastimil Babka    2018-08-17  4904  	 * Reset the nodemask and zonelist iterators if memory policies can be
d6a24df00638a0 Vlastimil Babka    2018-08-17  4905  	 * ignored. These allocations are high priority and system rather than
d6a24df00638a0 Vlastimil Babka    2018-08-17  4906  	 * user oriented.
e46e7b77c9096e Mel Gorman         2016-06-03  4907  	 */
cd04ae1e2dc8e3 Michal Hocko       2017-09-06  4908  	if (!(alloc_flags & ALLOC_CPUSET) || reserve_flags) {
d6a24df00638a0 Vlastimil Babka    2018-08-17  4909  		ac->nodemask = NULL;
e46e7b77c9096e Mel Gorman         2016-06-03  4910  		ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
97a225e69a1f88 Joonsoo Kim        2020-06-03  4911  					ac->highest_zoneidx, ac->nodemask);
e46e7b77c9096e Mel Gorman         2016-06-03  4912  	}
e46e7b77c9096e Mel Gorman         2016-06-03  4913  
23771235bb569c Vlastimil Babka    2016-07-28  4914  	/* Attempt with potentially adjusted zonelist and alloc_flags */
31a6c1909f51db Vlastimil Babka    2016-07-28  4915  	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4916  	if (page)
^1da177e4c3f41 Linus Torvalds     2005-04-16  4917  		goto got_pg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4918  
d0164adc89f6bb Mel Gorman         2015-11-06  4919  	/* Caller is not willing to reclaim, we can't balance anything */
9a67f6488eca92 Michal Hocko       2017-02-22  4920  	if (!can_direct_reclaim)
^1da177e4c3f41 Linus Torvalds     2005-04-16  4921  		goto nopage;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4922  
9a67f6488eca92 Michal Hocko       2017-02-22  4923  	/* Avoid recursion of direct reclaim */
9a67f6488eca92 Michal Hocko       2017-02-22  4924  	if (current->flags & PF_MEMALLOC)
6583bb64fc3708 David Rientjes     2009-07-29  4925  		goto nopage;
6583bb64fc3708 David Rientjes     2009-07-29  4926  
a8161d1ed60985 Vlastimil Babka    2016-07-28  4927  	/* Try direct reclaim and then allocating */
a8161d1ed60985 Vlastimil Babka    2016-07-28  4928  	page = __alloc_pages_direct_reclaim(gfp_mask, order, alloc_flags, ac,
a8161d1ed60985 Vlastimil Babka    2016-07-28  4929  							&did_some_progress);
a8161d1ed60985 Vlastimil Babka    2016-07-28  4930  	if (page)
a8161d1ed60985 Vlastimil Babka    2016-07-28  4931  		goto got_pg;
a8161d1ed60985 Vlastimil Babka    2016-07-28  4932  
a8161d1ed60985 Vlastimil Babka    2016-07-28  4933  	/* Try direct compaction and then allocating */
a9263751e11a07 Vlastimil Babka    2015-02-11  4934  	page = __alloc_pages_direct_compact(gfp_mask, order, alloc_flags, ac,
a5508cd83f10f6 Vlastimil Babka    2016-07-28  4935  					compact_priority, &compact_result);
56de7263fcf3eb Mel Gorman         2010-05-24  4936  	if (page)
56de7263fcf3eb Mel Gorman         2010-05-24  4937  		goto got_pg;
75f30861a12a6b David Rientjes     2014-06-04  4938  
9083905a2a13de Johannes Weiner    2015-06-24  4939  	/* Do not loop if specifically requested */
9083905a2a13de Johannes Weiner    2015-06-24  4940  	if (gfp_mask & __GFP_NORETRY)
a8161d1ed60985 Vlastimil Babka    2016-07-28  4941  		goto nopage;
9083905a2a13de Johannes Weiner    2015-06-24  4942  
0a0337e0d1d134 Michal Hocko       2016-05-20  4943  	/*
0a0337e0d1d134 Michal Hocko       2016-05-20  4944  	 * Do not retry costly high order allocations unless they are
dcda9b04713c3f Michal Hocko       2017-07-12  4945  	 * __GFP_RETRY_MAYFAIL
0a0337e0d1d134 Michal Hocko       2016-05-20  4946  	 */
dcda9b04713c3f Michal Hocko       2017-07-12  4947  	if (costly_order && !(gfp_mask & __GFP_RETRY_MAYFAIL))
a8161d1ed60985 Vlastimil Babka    2016-07-28  4948  		goto nopage;
0a0337e0d1d134 Michal Hocko       2016-05-20  4949  
0a0337e0d1d134 Michal Hocko       2016-05-20  4950  	if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
423b452e1553e3 Vlastimil Babka    2016-10-07  4951  				 did_some_progress > 0, &no_progress_loops))
0a0337e0d1d134 Michal Hocko       2016-05-20  4952  		goto retry;
0a0337e0d1d134 Michal Hocko       2016-05-20  4953  
33c2d21438daea Michal Hocko       2016-05-20  4954  	/*
33c2d21438daea Michal Hocko       2016-05-20  4955  	 * It doesn't make any sense to retry for the compaction if the order-0
33c2d21438daea Michal Hocko       2016-05-20  4956  	 * reclaim is not able to make any progress because the current
33c2d21438daea Michal Hocko       2016-05-20  4957  	 * implementation of the compaction depends on the sufficient amount
33c2d21438daea Michal Hocko       2016-05-20  4958  	 * of free memory (see __compaction_suitable)
33c2d21438daea Michal Hocko       2016-05-20  4959  	 */
33c2d21438daea Michal Hocko       2016-05-20  4960  	if (did_some_progress > 0 &&
86a294a81f93d6 Michal Hocko       2016-05-20  4961  			should_compact_retry(ac, order, alloc_flags,
a5508cd83f10f6 Vlastimil Babka    2016-07-28  4962  				compact_result, &compact_priority,
d943649831aba0 Vlastimil Babka    2016-10-07  4963  				&compaction_retries))
33c2d21438daea Michal Hocko       2016-05-20  4964  		goto retry;
33c2d21438daea Michal Hocko       2016-05-20  4965  
902b62810a57ba Vlastimil Babka    2017-07-06  4966  
902b62810a57ba Vlastimil Babka    2017-07-06  4967  	/* Deal with possible cpuset update races before we start OOM killing */
902b62810a57ba Vlastimil Babka    2017-07-06  4968  	if (check_retry_cpuset(cpuset_mems_cookie, ac))
e47483bca2cc59 Vlastimil Babka    2017-01-24  4969  		goto retry_cpuset;
e47483bca2cc59 Vlastimil Babka    2017-01-24  4970  
9083905a2a13de Johannes Weiner    2015-06-24  4971  	/* Reclaim has failed us, start killing things */
9083905a2a13de Johannes Weiner    2015-06-24  4972  	page = __alloc_pages_may_oom(gfp_mask, order, ac, &did_some_progress);
9083905a2a13de Johannes Weiner    2015-06-24  4973  	if (page)
9083905a2a13de Johannes Weiner    2015-06-24  4974  		goto got_pg;
9083905a2a13de Johannes Weiner    2015-06-24  4975  
9a67f6488eca92 Michal Hocko       2017-02-22  4976  	/* Avoid allocations with no watermarks from looping endlessly */
cd04ae1e2dc8e3 Michal Hocko       2017-09-06  4977  	if (tsk_is_oom_victim(current) &&
8510e69c8efef8 Joonsoo Kim        2020-08-06  4978  	    (alloc_flags & ALLOC_OOM ||
c288983dddf714 Tetsuo Handa       2017-06-02  4979  	     (gfp_mask & __GFP_NOMEMALLOC)))
9a67f6488eca92 Michal Hocko       2017-02-22  4980  		goto nopage;
9a67f6488eca92 Michal Hocko       2017-02-22  4981  
9083905a2a13de Johannes Weiner    2015-06-24  4982  	/* Retry as long as the OOM killer is making progress */
0a0337e0d1d134 Michal Hocko       2016-05-20  4983  	if (did_some_progress) {
0a0337e0d1d134 Michal Hocko       2016-05-20  4984  		no_progress_loops = 0;
9083905a2a13de Johannes Weiner    2015-06-24  4985  		goto retry;
0a0337e0d1d134 Michal Hocko       2016-05-20  4986  	}
9083905a2a13de Johannes Weiner    2015-06-24  4987  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4988  nopage:
902b62810a57ba Vlastimil Babka    2017-07-06  4989  	/* Deal with possible cpuset update races before we fail */
902b62810a57ba Vlastimil Babka    2017-07-06  4990  	if (check_retry_cpuset(cpuset_mems_cookie, ac))
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4991  		goto retry_cpuset;
5ce9bfef1d2794 Vlastimil Babka    2017-01-24  4992  
9a67f6488eca92 Michal Hocko       2017-02-22  4993  	/*
9a67f6488eca92 Michal Hocko       2017-02-22  4994  	 * Make sure that __GFP_NOFAIL request doesn't leak out and make sure
9a67f6488eca92 Michal Hocko       2017-02-22  4995  	 * we always retry
9a67f6488eca92 Michal Hocko       2017-02-22  4996  	 */
9a67f6488eca92 Michal Hocko       2017-02-22  4997  	if (gfp_mask & __GFP_NOFAIL) {
9a67f6488eca92 Michal Hocko       2017-02-22  4998  		/*
9a67f6488eca92 Michal Hocko       2017-02-22  4999  		 * All existing users of the __GFP_NOFAIL are blockable, so warn
9a67f6488eca92 Michal Hocko       2017-02-22  5000  		 * of any new users that actually require GFP_NOWAIT
9a67f6488eca92 Michal Hocko       2017-02-22  5001  		 */
9a67f6488eca92 Michal Hocko       2017-02-22  5002  		if (WARN_ON_ONCE(!can_direct_reclaim))
9a67f6488eca92 Michal Hocko       2017-02-22  5003  			goto fail;
9a67f6488eca92 Michal Hocko       2017-02-22  5004  
9a67f6488eca92 Michal Hocko       2017-02-22  5005  		/*
9a67f6488eca92 Michal Hocko       2017-02-22  5006  		 * PF_MEMALLOC request from this context is rather bizarre
9a67f6488eca92 Michal Hocko       2017-02-22  5007  		 * because we cannot reclaim anything and only can loop waiting
9a67f6488eca92 Michal Hocko       2017-02-22  5008  		 * for somebody to do a work for us
9a67f6488eca92 Michal Hocko       2017-02-22  5009  		 */
9a67f6488eca92 Michal Hocko       2017-02-22  5010  		WARN_ON_ONCE(current->flags & PF_MEMALLOC);
9a67f6488eca92 Michal Hocko       2017-02-22  5011  
9a67f6488eca92 Michal Hocko       2017-02-22  5012  		/*
9a67f6488eca92 Michal Hocko       2017-02-22  5013  		 * non failing costly orders are a hard requirement which we
9a67f6488eca92 Michal Hocko       2017-02-22  5014  		 * are not prepared for much so let's warn about these users
9a67f6488eca92 Michal Hocko       2017-02-22  5015  		 * so that we can identify them and convert them to something
9a67f6488eca92 Michal Hocko       2017-02-22  5016  		 * else.
9a67f6488eca92 Michal Hocko       2017-02-22  5017  		 */
9a67f6488eca92 Michal Hocko       2017-02-22  5018  		WARN_ON_ONCE(order > PAGE_ALLOC_COSTLY_ORDER);
9a67f6488eca92 Michal Hocko       2017-02-22  5019  
6c18ba7a18997d Michal Hocko       2017-02-22  5020  		/*
6c18ba7a18997d Michal Hocko       2017-02-22  5021  		 * Help non-failing allocations by giving them access to memory
6c18ba7a18997d Michal Hocko       2017-02-22  5022  		 * reserves but do not use ALLOC_NO_WATERMARKS because this
6c18ba7a18997d Michal Hocko       2017-02-22  5023  		 * could deplete whole memory reserves which would just make
6c18ba7a18997d Michal Hocko       2017-02-22  5024  		 * the situation worse
6c18ba7a18997d Michal Hocko       2017-02-22  5025  		 */
6c18ba7a18997d Michal Hocko       2017-02-22  5026  		page = __alloc_pages_cpuset_fallback(gfp_mask, order, ALLOC_HARDER, ac);
6c18ba7a18997d Michal Hocko       2017-02-22  5027  		if (page)
6c18ba7a18997d Michal Hocko       2017-02-22  5028  			goto got_pg;
6c18ba7a18997d Michal Hocko       2017-02-22  5029  
9a67f6488eca92 Michal Hocko       2017-02-22  5030  		cond_resched();
9a67f6488eca92 Michal Hocko       2017-02-22  5031  		goto retry;
9a67f6488eca92 Michal Hocko       2017-02-22  5032  	}
9a67f6488eca92 Michal Hocko       2017-02-22  5033  fail:
a8e99259e7e32b Michal Hocko       2017-02-22  5034  	warn_alloc(gfp_mask, ac->nodemask,
7877cdcc3893c1 Michal Hocko       2016-10-07  5035  			"page allocation failure: order:%u", order);
^1da177e4c3f41 Linus Torvalds     2005-04-16  5036  got_pg:
4536de1b708cd4 liuhailong         2022-07-21 @5037  	trace_android_vh_alloc_pages_slowpath_end(gfp_mask, order, vh_record);
072bb0aa5e0629 Mel Gorman         2012-07-31  5038  	return page;
^1da177e4c3f41 Linus Torvalds     2005-04-16  5039  }
11e33f6a55ed78 Mel Gorman         2009-06-16  5040  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
