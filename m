Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994D4CF490
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 02:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792377217; cv=none; b=ZuudacE100R762A+hWDKn2AKkWIJ05sAQCrtKGAdV5zmqsEKqFlrT/aP/mWJ3z+ojAAXk5YXMU+F0IIOhLG6atGCQJhKFDOxa3i1luCf3nSVOV0vj7WlkGTTJpKF8r/CD2CCPibIL7XINrFfUUIUnTNBF5fVBL2RcJw602DuvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792377217; c=relaxed/simple;
	bh=yEBwZ0hYmc3CXX1tUmYJz9fiai+DQdPn29z2vCwWBvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oeHR+IreLKDVoZFDvx+zzLQUbVAk8KmLGn3u7Mn3yeCFUsJkAyVRMTVVMFNVCpecj99HYI2d6+WJP9oqrxAX+jq+q0I07fES2hiNCGN91ZosBc+9Berx3urDWAsM/c8A0M0YFVnSO3X9mZW4Gr7dSgffozn1naauaCY+UsfOaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ov5Zy+4p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov5Zy+4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792377215; x=1823913215;
  h=date:from:to:cc:subject:message-id;
  bh=yEBwZ0hYmc3CXX1tUmYJz9fiai+DQdPn29z2vCwWBvI=;
  b=Ov5Zy+4pA4kihyghtWDbd/hnd3oBH9qiUkI5DuhiG8w1+rh4b8NNM9ZA
   xGyX4y9onxm59Jhk247PRdeMsPBirSxklxm7X+/pXuK4jB4+U6H139aLD
   3INOfig98rHvZlC4fTl28plsMZWZv1nqHs0UsIK4aQzJZuH9nzI7mFzN4
   Iuk/MPOaCaz/GupcYzFOOAqYMYWEnkx7iFvpe17n2w2vLqJKTlzAl7dwZ
   YTay7Rz3ER2Gna0W6Cnwc3wrDvTHRrn8OK6HkP6xKym0WZB4K7zVa3rG2
   d8Njhlna0F6Gj02p4mg7rJHEW3mEld+IvapbSzYRzfKmqI/KU8tshY/hv
   A==;
X-CSE-ConnectionGUID: halfec1EQjyjDUMBffPoOQ==
X-CSE-MsgGUID: EiFpt7eRSKKbgWpvbiLThA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="940051"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="940051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:33:34 -0700
X-CSE-ConnectionGUID: PA+HYF+9TYCPQ9iRFiGcnA==
X-CSE-MsgGUID: Q00rLQztQK6MPRBDEHc3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2419820"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2026 19:33:32 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIdBq-000000005RH-0aiI;
	Mon, 19 Oct 2026 02:33:30 +0000
Date: Mon, 19 Oct 2026 04:32:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6-numa 35/47]
 mm/page_alloc.c:4980 __alloc_pages_slowpath() warn: bitwise AND condition is
 false here
Message-ID: <202610190433.LHa3WuWV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: "Gregory Price (Meta)" <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6-numa
head:   ad25e75667a4391ac566927c41f6e88f60ecff50
commit: 0345bc0f314a0e30bc000362e32cb066fd350b9e [35/47] mm/page_alloc: return to common zonelists when relaxing a mask
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-2200-20261019 (https://download.01.org/0day-ci/archive/20261019/202610190433.LHa3WuWV-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610190433.LHa3WuWV-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4980 __alloc_pages_slowpath() warn: bitwise AND condition is false here

vim +4980 mm/page_alloc.c

94e0bcde055ee1 David Rientjes         2026-03-30  4857  
11e33f6a55ed78 Mel Gorman             2009-06-16  4858  static inline struct page *
11e33f6a55ed78 Mel Gorman             2009-06-16  4859  __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
a9263751e11a07 Vlastimil Babka        2015-02-11  4860  						struct alloc_context *ac)
11e33f6a55ed78 Mel Gorman             2009-06-16  4861  {
282722b0d258ec Vlastimil Babka        2017-05-08  4862  	const bool costly_order = order > PAGE_ALLOC_COSTLY_ORDER;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4863  	bool can_direct_reclaim;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4864  	bool can_compact;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4865  	bool nofail;
11e33f6a55ed78 Mel Gorman             2009-06-16  4866  	struct page *page = NULL;
c603844bdcb523 Mel Gorman             2016-05-19  4867  	unsigned int alloc_flags;
11e33f6a55ed78 Mel Gorman             2009-06-16  4868  	unsigned long did_some_progress;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4869  	enum compact_priority compact_priority;
c5d01d0d18e2ab Michal Hocko           2016-05-20  4870  	enum compact_result compact_result;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4871  	int compaction_retries;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4872  	int no_progress_loops;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4873  	unsigned int cpuset_mems_cookie;
3d36424b3b5850 Mel Gorman             2022-08-24  4874  	unsigned int zonelist_iter_cookie;
cd04ae1e2dc8e3 Michal Hocko           2017-09-06  4875  	int reserve_flags;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4876  	bool compact_first = false;
2c4c3e29897d43 Vlastimil Babka        2026-01-06  4877  	bool can_retry_reserves = true;
94e0bcde055ee1 David Rientjes         2026-03-30  4878  	unsigned long alloc_start_time = jiffies;
^1da177e4c3f41 Linus Torvalds         2005-04-16  4879  
923be74ae013d4 Salvatore Dipietro     2026-10-01  4880  	/*
923be74ae013d4 Salvatore Dipietro     2026-10-01  4881  	 * Costly __GFP_NORETRY callers have a cheap fallback, so don't stall
923be74ae013d4 Salvatore Dipietro     2026-10-01  4882  	 * them in reclaim or compaction. __GFP_THISNODE callers are exempt.
923be74ae013d4 Salvatore Dipietro     2026-10-01  4883  	 */
923be74ae013d4 Salvatore Dipietro     2026-10-01  4884  	if (costly_order && (gfp_mask & __GFP_NORETRY) &&
923be74ae013d4 Salvatore Dipietro     2026-10-01  4885  	    !(gfp_mask & __GFP_THISNODE))
923be74ae013d4 Salvatore Dipietro     2026-10-01  4886  		gfp_mask &= ~__GFP_DIRECT_RECLAIM;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4887  
923be74ae013d4 Salvatore Dipietro     2026-10-01  4888  	can_direct_reclaim = gfp_mask & __GFP_DIRECT_RECLAIM;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4889  	can_compact = can_direct_reclaim && gfp_compaction_allowed(gfp_mask);
923be74ae013d4 Salvatore Dipietro     2026-10-01  4890  	nofail = gfp_mask & __GFP_NOFAIL;
923be74ae013d4 Salvatore Dipietro     2026-10-01  4891  
903edea6c53f09 Barry Song             2024-08-31  4892  	if (unlikely(nofail)) {
903edea6c53f09 Barry Song             2024-08-31  4893  		/*
cbbed3c303f9ea Wei Yang               2026-08-29  4894  		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
903edea6c53f09 Barry Song             2024-08-31  4895  		 * otherwise, we may result in lockup.
903edea6c53f09 Barry Song             2024-08-31  4896  		 */
903edea6c53f09 Barry Song             2024-08-31  4897  		WARN_ON_ONCE(!can_direct_reclaim);
903edea6c53f09 Barry Song             2024-08-31  4898  		/*
903edea6c53f09 Barry Song             2024-08-31  4899  		 * PF_MEMALLOC request from this context is rather bizarre
903edea6c53f09 Barry Song             2024-08-31  4900  		 * because we cannot reclaim anything and only can loop waiting
903edea6c53f09 Barry Song             2024-08-31  4901  		 * for somebody to do a work for us.
903edea6c53f09 Barry Song             2024-08-31  4902  		 */
903edea6c53f09 Barry Song             2024-08-31  4903  		WARN_ON_ONCE(current->flags & PF_MEMALLOC);
903edea6c53f09 Barry Song             2024-08-31  4904  	}
903edea6c53f09 Barry Song             2024-08-31  4905  
3d36424b3b5850 Mel Gorman             2022-08-24  4906  restart:
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4907  	compaction_retries = 0;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4908  	no_progress_loops = 0;
8fe9ed44dc29fb Hao Zhang              2025-02-27  4909  	compact_result = COMPACT_SKIPPED;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4910  	compact_priority = DEF_COMPACT_PRIORITY;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  4911  	cpuset_mems_cookie = read_mems_allowed_begin();
3d36424b3b5850 Mel Gorman             2022-08-24  4912  	zonelist_iter_cookie = zonelist_iter_begin();
9a67f6488eca92 Michal Hocko           2017-02-22  4913  
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4914  	/*
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4915  	 * For costly allocations, try direct compaction first, as it's likely
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4916  	 * that we have enough base pages and don't need to reclaim. For non-
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4917  	 * movable high-order allocations, do that as well, as compaction will
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4918  	 * try prevent permanent fragmentation by migrating from blocks of the
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4919  	 * same migratetype.
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4920  	 */
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4921  	if (can_compact && (costly_order || (order > 0 &&
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4922  					ac->migratetype != MIGRATE_MOVABLE))) {
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4923  		compact_first = true;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4924  		compact_priority = INIT_COMPACT_PRIORITY;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4925  	}
53a9b4646f67c9 Vlastimil Babka        2026-01-06  4926  
9a67f6488eca92 Michal Hocko           2017-02-22  4927  	/*
9a67f6488eca92 Michal Hocko           2017-02-22  4928  	 * The fast path uses conservative alloc_flags to succeed only until
9a67f6488eca92 Michal Hocko           2017-02-22  4929  	 * kswapd needs to be woken up, and to avoid the cost of setting up
9a67f6488eca92 Michal Hocko           2017-02-22  4930  	 * alloc_flags precisely. So we do that now.
6372aac4d41fcd Brendan Jackman        2026-07-03  4931  	 *
6372aac4d41fcd Brendan Jackman        2026-07-03  4932  	 * Can't just or alloc_flags if it contains WMARK bits, but those flags
6372aac4d41fcd Brendan Jackman        2026-07-03  4933  	 * shouldn't be set in ac->alloc_flags.
9a67f6488eca92 Michal Hocko           2017-02-22  4934  	 */
6372aac4d41fcd Brendan Jackman        2026-07-03  4935  	VM_WARN_ON(ac->alloc_flags & ALLOC_WMARK_MASK);
6372aac4d41fcd Brendan Jackman        2026-07-03  4936  	alloc_flags = ac->alloc_flags | alloc_flags_slowpath(gfp_mask, order);
9a67f6488eca92 Michal Hocko           2017-02-22  4937  
e47483bca2cc59 Vlastimil Babka        2017-01-24  4938  	/*
e47483bca2cc59 Vlastimil Babka        2017-01-24  4939  	 * We need to recalculate the starting point for the zonelist iterator
e47483bca2cc59 Vlastimil Babka        2017-01-24  4940  	 * because we might have used different nodemask in the fast path, or
e47483bca2cc59 Vlastimil Babka        2017-01-24  4941  	 * there was a cpuset modification and we are retrying - otherwise we
e47483bca2cc59 Vlastimil Babka        2017-01-24  4942  	 * could end up iterating over non-eligible zones endlessly.
e47483bca2cc59 Vlastimil Babka        2017-01-24  4943  	 */
e47483bca2cc59 Vlastimil Babka        2017-01-24  4944  	ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
97a225e69a1f88 Joonsoo Kim            2020-06-03  4945  					ac->highest_zoneidx, ac->nodemask);
29943248af0a8a Wei Yang               2024-07-29  4946  	if (!zonelist_zone(ac->preferred_zoneref))
e47483bca2cc59 Vlastimil Babka        2017-01-24  4947  		goto nopage;
e47483bca2cc59 Vlastimil Babka        2017-01-24  4948  
8ca1b5a49885f0 Feng Tang              2021-11-05  4949  	/*
8ca1b5a49885f0 Feng Tang              2021-11-05  4950  	 * Check for insane configurations where the cpuset doesn't contain
8ca1b5a49885f0 Feng Tang              2021-11-05  4951  	 * any suitable zone to satisfy the request - e.g. non-movable
8ca1b5a49885f0 Feng Tang              2021-11-05  4952  	 * GFP_HIGHUSER allocations from MOVABLE nodes only.
8ca1b5a49885f0 Feng Tang              2021-11-05  4953  	 */
8ca1b5a49885f0 Feng Tang              2021-11-05  4954  	if (cpusets_insane_config() && (gfp_mask & __GFP_HARDWALL)) {
8ca1b5a49885f0 Feng Tang              2021-11-05  4955  		struct zoneref *z = first_zones_zonelist(ac->zonelist,
8ca1b5a49885f0 Feng Tang              2021-11-05  4956  					ac->highest_zoneidx,
8ca1b5a49885f0 Feng Tang              2021-11-05  4957  					&cpuset_current_mems_allowed);
29943248af0a8a Wei Yang               2024-07-29  4958  		if (!zonelist_zone(z))
8ca1b5a49885f0 Feng Tang              2021-11-05  4959  			goto nopage;
8ca1b5a49885f0 Feng Tang              2021-11-05  4960  	}
8ca1b5a49885f0 Feng Tang              2021-11-05  4961  
2c4c3e29897d43 Vlastimil Babka        2026-01-06  4962  retry:
2c4c3e29897d43 Vlastimil Babka        2026-01-06  4963  	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
0a79cdad5eb213 Mel Gorman             2018-12-28  4964  	if (alloc_flags & ALLOC_KSWAPD)
5ecd9d403ad081 David Rientjes         2018-04-05  4965  		wake_all_kswapds(order, gfp_mask, ac);
23771235bb569c Vlastimil Babka        2016-07-28  4966  
23771235bb569c Vlastimil Babka        2016-07-28  4967  	/*
23771235bb569c Vlastimil Babka        2016-07-28  4968  	 * The adjusted alloc_flags might result in immediate success, so try
23771235bb569c Vlastimil Babka        2016-07-28  4969  	 * that first
23771235bb569c Vlastimil Babka        2016-07-28  4970  	 */
23771235bb569c Vlastimil Babka        2016-07-28  4971  	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
23771235bb569c Vlastimil Babka        2016-07-28  4972  	if (page)
23771235bb569c Vlastimil Babka        2016-07-28  4973  		goto got_pg;
23771235bb569c Vlastimil Babka        2016-07-28  4974  
cd04ae1e2dc8e3 Michal Hocko           2017-09-06  4975  	reserve_flags = __gfp_pfmemalloc_flags(gfp_mask);
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4976) 	if (reserve_flags) {
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4977) 		unsigned int keep = ALLOC_KSWAPD;
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4978) 
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4979) 		/* The cpuset still grants a private binding's node. */
0345bc0f314a0e Gregory Price (Meta    2026-10-13 @4980) 		if (ac->alloc_flags & ALLOC_ZONELIST_PRIVATE)
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4981) 			keep |= ALLOC_CPUSET;
5df11ba0eb5ae3 Brendan Jackman        2026-07-03  4982  		alloc_flags = alloc_flags_cma(gfp_mask) | reserve_flags |
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4983) 				ac->alloc_flags | (alloc_flags & keep);
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4984) 	}
23771235bb569c Vlastimil Babka        2016-07-28  4985  
e46e7b77c9096e Mel Gorman             2016-06-03  4986  	/*
d6a24df00638a0 Vlastimil Babka        2018-08-17  4987  	 * Reset the nodemask and zonelist iterators if memory policies can be
d6a24df00638a0 Vlastimil Babka        2018-08-17  4988  	 * ignored. These allocations are high priority and system rather than
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4989) 	 * user oriented. A private binding keeps its node: private memory has
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4990) 	 * no reserves to grant.
e46e7b77c9096e Mel Gorman             2016-06-03  4991  	 */
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4992) 	if ((!(alloc_flags & ALLOC_CPUSET) || reserve_flags) &&
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4993) 	    !(ac->alloc_flags & ALLOC_ZONELIST_PRIVATE)) {
0345bc0f314a0e Gregory Price (Meta    2026-10-13  4994) 		reset_alloc_policy(gfp_mask, ac);
e46e7b77c9096e Mel Gorman             2016-06-03  4995  		ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
97a225e69a1f88 Joonsoo Kim            2020-06-03  4996  					ac->highest_zoneidx, ac->nodemask);
e46e7b77c9096e Mel Gorman             2016-06-03  4997  
2c4c3e29897d43 Vlastimil Babka        2026-01-06  4998  		/*
2c4c3e29897d43 Vlastimil Babka        2026-01-06  4999  		 * The first time we adjust anything due to being allowed to
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5000  		 * ignore memory policies or watermarks, retry immediately. This
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5001  		 * allows us to keep the first allocation attempt optimistic so
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5002  		 * it can succeed in a zone that is still above watermarks.
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5003  		 */
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5004  		if (can_retry_reserves) {
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5005  			can_retry_reserves = false;
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5006  			goto retry;
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5007  		}
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5008  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  5009  
d0164adc89f6bb Mel Gorman             2015-11-06  5010  	/* Caller is not willing to reclaim, we can't balance anything */
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5011  	if (!can_direct_reclaim) {
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5012  		/*
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5013  		 * Reclaim/compaction cannot run, so defrag_mode's strategy
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5014  		 * of enforcing ALLOC_NOFRAGMENT cannot be fulfilled. Allow
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5015  		 * fallbacks rather than failing the allocation outright.
923be74ae013d4 Salvatore Dipietro     2026-10-01  5016  		 * Not for __GFP_NORETRY: those have a cheap lower order
923be74ae013d4 Salvatore Dipietro     2026-10-01  5017  		 * fallback, so failing beats fragmenting.
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5018  		 */
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5019  		if (defrag_mode && (alloc_flags & ALLOC_NOFRAGMENT) &&
923be74ae013d4 Salvatore Dipietro     2026-10-01  5020  		    !(gfp_mask & __GFP_NORETRY) &&
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5021  		    (gfp_mask & __GFP_KSWAPD_RECLAIM)) {
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5022  			alloc_flags &= ~ALLOC_NOFRAGMENT;
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5023  			goto retry;
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5024  		}
^1da177e4c3f41 Linus Torvalds         2005-04-16  5025  		goto nopage;
4c0ed883e0516a Dmitry Ilvokhin        2026-05-20  5026  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  5027  
9a67f6488eca92 Michal Hocko           2017-02-22  5028  	/* Avoid recursion of direct reclaim */
9a67f6488eca92 Michal Hocko           2017-02-22  5029  	if (current->flags & PF_MEMALLOC)
6583bb64fc3708 David Rientjes         2009-07-29  5030  		goto nopage;
6583bb64fc3708 David Rientjes         2009-07-29  5031  
94e0bcde055ee1 David Rientjes         2026-03-30  5032  	/* If allocation has taken excessively long, warn about it */
94e0bcde055ee1 David Rientjes         2026-03-30  5033  	check_alloc_stall_warn(gfp_mask, ac->nodemask, order, alloc_start_time);
94e0bcde055ee1 David Rientjes         2026-03-30  5034  
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5035) 	/*
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5036) 	 * If fallbacks are not permitted (defrag_mode), we either
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5037) 	 * need to reclaim space in a block of matching type, or clear
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5038) 	 * out an entire block to allow __rmqueue_claim() to convert.
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5039) 	 *
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5040) 	 * Reclaim by itself is primarily freeing space in movable
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5041) 	 * blocks, since that's where the LRU pages live. So this
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5042) 	 * works for movable requests, but not for others.
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5043) 	 *
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5044) 	 * For those, promote the order to help make blocks, instead
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5045) 	 * of spinning in reclaim alone unproductively.
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5046) 	 */
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5047) 	ac->reclaim_compact_order = order;
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5048) 	if ((alloc_flags & ALLOC_NOFRAGMENT) && ac->migratetype != MIGRATE_MOVABLE)
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5049) 		ac->reclaim_compact_order = max(order, pageblock_order);
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5050) 
a8161d1ed60985 Vlastimil Babka        2016-07-28  5051  	/* Try direct reclaim and then allocating */
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5052  	if (!compact_first) {
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5053  		page = __alloc_pages_direct_reclaim(gfp_mask, order, alloc_flags,
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5054  							ac, &did_some_progress);
a8161d1ed60985 Vlastimil Babka        2016-07-28  5055  		if (page)
a8161d1ed60985 Vlastimil Babka        2016-07-28  5056  			goto got_pg;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5057  	}
a8161d1ed60985 Vlastimil Babka        2016-07-28  5058  
a8161d1ed60985 Vlastimil Babka        2016-07-28  5059  	/* Try direct compaction and then allocating */
a9263751e11a07 Vlastimil Babka        2015-02-11  5060  	page = __alloc_pages_direct_compact(gfp_mask, order, alloc_flags, ac,
a5508cd83f10f6 Vlastimil Babka        2016-07-28  5061  					compact_priority, &compact_result);
56de7263fcf3eb Mel Gorman             2010-05-24  5062  	if (page)
56de7263fcf3eb Mel Gorman             2010-05-24  5063  		goto got_pg;
75f30861a12a6b David Rientjes         2014-06-04  5064  
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5065  	if (compact_first) {
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5066  		/*
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5067  		 * THP page faults may attempt local node only first, but are
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5068  		 * then allowed to only compact, not reclaim, see
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5069  		 * alloc_pages_mpol().
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5070  		 *
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5071  		 * Compaction has failed above and we don't want such THP
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5072  		 * allocations to put reclaim pressure on a single node in a
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5073  		 * situation where other nodes might have plenty of available
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5074  		 * memory.
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5075  		 */
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5076  		if (gfp_has_flags(gfp_mask, __GFP_NORETRY | __GFP_THISNODE))
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5077  			goto nopage;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5078  
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5079  		/*
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5080  		 * For the initial compaction attempt we have lowered its
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5081  		 * priority. Restore it for further retries, if those are
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5082  		 * allowed. With __GFP_NORETRY there will be a single round of
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5083  		 * reclaim and compaction with the lowered priority.
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5084  		 */
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5085  		if (!(gfp_mask & __GFP_NORETRY))
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5086  			compact_priority = DEF_COMPACT_PRIORITY;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5087  
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5088  		compact_first = false;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5089  		goto retry;
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5090  	}
53a9b4646f67c9 Vlastimil Babka        2026-01-06  5091  
9083905a2a13de Johannes Weiner        2015-06-24  5092  	/* Do not loop if specifically requested */
9083905a2a13de Johannes Weiner        2015-06-24  5093  	if (gfp_mask & __GFP_NORETRY)
a8161d1ed60985 Vlastimil Babka        2016-07-28  5094  		goto nopage;
9083905a2a13de Johannes Weiner        2015-06-24  5095  
0a0337e0d1d134 Michal Hocko           2016-05-20  5096  	/*
0a0337e0d1d134 Michal Hocko           2016-05-20  5097  	 * Do not retry costly high order allocations unless they are
803de9000f334b Vlastimil Babka        2024-02-21  5098  	 * __GFP_RETRY_MAYFAIL and we can compact
0a0337e0d1d134 Michal Hocko           2016-05-20  5099  	 */
803de9000f334b Vlastimil Babka        2024-02-21  5100  	if (costly_order && (!can_compact ||
803de9000f334b Vlastimil Babka        2024-02-21  5101  			     !(gfp_mask & __GFP_RETRY_MAYFAIL)))
a8161d1ed60985 Vlastimil Babka        2016-07-28  5102  		goto nopage;
0a0337e0d1d134 Michal Hocko           2016-05-20  5103  
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5104  	/*
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5105  	 * Deal with possible cpuset update races or zonelist updates to avoid
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5106  	 * infinite retries. No "goto retry;" can be placed above this check
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5107  	 * unless it can execute just once.
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5108  	 */
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5109) 	if (check_retry_alloc(gfp_mask, cpuset_mems_cookie,
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5110) 			      zonelist_iter_cookie, ac))
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5111  		goto restart;
2c4c3e29897d43 Vlastimil Babka        2026-01-06  5112  
0a0337e0d1d134 Michal Hocko           2016-05-20  5113  	if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
423b452e1553e3 Vlastimil Babka        2016-10-07  5114  				 did_some_progress > 0, &no_progress_loops))
0a0337e0d1d134 Michal Hocko           2016-05-20  5115  		goto retry;
0a0337e0d1d134 Michal Hocko           2016-05-20  5116  
33c2d21438daea Michal Hocko           2016-05-20  5117  	/*
33c2d21438daea Michal Hocko           2016-05-20  5118  	 * It doesn't make any sense to retry for the compaction if the order-0
33c2d21438daea Michal Hocko           2016-05-20  5119  	 * reclaim is not able to make any progress because the current
33c2d21438daea Michal Hocko           2016-05-20  5120  	 * implementation of the compaction depends on the sufficient amount
33c2d21438daea Michal Hocko           2016-05-20  5121  	 * of free memory (see __compaction_suitable)
33c2d21438daea Michal Hocko           2016-05-20  5122  	 */
803de9000f334b Vlastimil Babka        2024-02-21  5123  	if (did_some_progress > 0 && can_compact &&
ed384eb3a3e121 fujunjie               2026-05-26  5124  	    should_compact_retry(gfp_mask, ac, order, alloc_flags,
a5508cd83f10f6 Vlastimil Babka        2016-07-28  5125  				 compact_result, &compact_priority,
d943649831aba0 Vlastimil Babka        2016-10-07  5126  				 &compaction_retries))
33c2d21438daea Michal Hocko           2016-05-20  5127  		goto retry;
33c2d21438daea Michal Hocko           2016-05-20  5128  
e3aa7df331bca0 Johannes Weiner        2025-03-13  5129  	/* Reclaim/compaction failed to prevent the fallback */
7a95a05f15d570 Johannes Weiner        2025-03-22  5130  	if (defrag_mode && (alloc_flags & ALLOC_NOFRAGMENT)) {
7a95a05f15d570 Johannes Weiner        2025-03-22  5131  		alloc_flags &= ~ALLOC_NOFRAGMENT;
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5132) 		/* Retries went into making blocks, start the fallback afresh */
0043c816649132 Kiryl Shutsemau        2026-10-15  5133  		if (order_defrag_promoted(order, ac)) {
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5134) 			no_progress_loops = 0;
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5135) 			compaction_retries = 0;
67acb3c0518ca6 Kiryl Shutsemau (Meta  2026-10-13  5136) 		}
e3aa7df331bca0 Johannes Weiner        2025-03-13  5137  		goto retry;
e3aa7df331bca0 Johannes Weiner        2025-03-13  5138  	}
902b62810a57ba Vlastimil Babka        2017-07-06  5139  
3d36424b3b5850 Mel Gorman             2022-08-24  5140  	/*
3d36424b3b5850 Mel Gorman             2022-08-24  5141  	 * Deal with possible cpuset update races or zonelist updates to avoid
3d36424b3b5850 Mel Gorman             2022-08-24  5142  	 * a unnecessary OOM kill.
3d36424b3b5850 Mel Gorman             2022-08-24  5143  	 */
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5144) 	if (check_retry_alloc(gfp_mask, cpuset_mems_cookie,
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5145) 			      zonelist_iter_cookie, ac))
3d36424b3b5850 Mel Gorman             2022-08-24  5146  		goto restart;
e47483bca2cc59 Vlastimil Babka        2017-01-24  5147  
9083905a2a13de Johannes Weiner        2015-06-24  5148  	/* Reclaim has failed us, start killing things */
9083905a2a13de Johannes Weiner        2015-06-24  5149  	page = __alloc_pages_may_oom(gfp_mask, order, ac, &did_some_progress);
9083905a2a13de Johannes Weiner        2015-06-24  5150  	if (page)
9083905a2a13de Johannes Weiner        2015-06-24  5151  		goto got_pg;
9083905a2a13de Johannes Weiner        2015-06-24  5152  
9a67f6488eca92 Michal Hocko           2017-02-22  5153  	/* Avoid allocations with no watermarks from looping endlessly */
cd04ae1e2dc8e3 Michal Hocko           2017-09-06  5154  	if (tsk_is_oom_victim(current) &&
8510e69c8efef8 Joonsoo Kim            2020-08-06  5155  	    (alloc_flags & ALLOC_OOM ||
c288983dddf714 Tetsuo Handa           2017-06-02  5156  	     (gfp_mask & __GFP_NOMEMALLOC)))
9a67f6488eca92 Michal Hocko           2017-02-22  5157  		goto nopage;
9a67f6488eca92 Michal Hocko           2017-02-22  5158  
9083905a2a13de Johannes Weiner        2015-06-24  5159  	/* Retry as long as the OOM killer is making progress */
0a0337e0d1d134 Michal Hocko           2016-05-20  5160  	if (did_some_progress) {
0a0337e0d1d134 Michal Hocko           2016-05-20  5161  		no_progress_loops = 0;
9083905a2a13de Johannes Weiner        2015-06-24  5162  		goto retry;
0a0337e0d1d134 Michal Hocko           2016-05-20  5163  	}
9083905a2a13de Johannes Weiner        2015-06-24  5164  
^1da177e4c3f41 Linus Torvalds         2005-04-16  5165  nopage:
3d36424b3b5850 Mel Gorman             2022-08-24  5166  	/*
3d36424b3b5850 Mel Gorman             2022-08-24  5167  	 * Deal with possible cpuset update races or zonelist updates to avoid
3d36424b3b5850 Mel Gorman             2022-08-24  5168  	 * a unnecessary OOM kill.
3d36424b3b5850 Mel Gorman             2022-08-24  5169  	 */
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5170) 	if (check_retry_alloc(gfp_mask, cpuset_mems_cookie,
0345bc0f314a0e Gregory Price (Meta    2026-10-13  5171) 			      zonelist_iter_cookie, ac))
3d36424b3b5850 Mel Gorman             2022-08-24  5172  		goto restart;
5ce9bfef1d2794 Vlastimil Babka        2017-01-24  5173  
9a67f6488eca92 Michal Hocko           2017-02-22  5174  	/*
9a67f6488eca92 Michal Hocko           2017-02-22  5175  	 * Make sure that __GFP_NOFAIL request doesn't leak out and make sure
9a67f6488eca92 Michal Hocko           2017-02-22  5176  	 * we always retry
9a67f6488eca92 Michal Hocko           2017-02-22  5177  	 */
903edea6c53f09 Barry Song             2024-08-31  5178  	if (unlikely(nofail)) {
6372aac4d41fcd Brendan Jackman        2026-07-03  5179  		unsigned int alloc_flags = ac->alloc_flags | ALLOC_MIN_RESERVE;
6372aac4d41fcd Brendan Jackman        2026-07-03  5180  
9a67f6488eca92 Michal Hocko           2017-02-22  5181  		/*
903edea6c53f09 Barry Song             2024-08-31  5182  		 * Lacking direct_reclaim we can't do anything to reclaim memory,
903edea6c53f09 Barry Song             2024-08-31  5183  		 * we disregard these unreasonable nofail requests and still
903edea6c53f09 Barry Song             2024-08-31  5184  		 * return NULL
9a67f6488eca92 Michal Hocko           2017-02-22  5185  		 */
903edea6c53f09 Barry Song             2024-08-31  5186  		if (!can_direct_reclaim)
9a67f6488eca92 Michal Hocko           2017-02-22  5187  			goto fail;
9a67f6488eca92 Michal Hocko           2017-02-22  5188  
6c18ba7a18997d Michal Hocko           2017-02-22  5189  		/*
1ebbb21811b76c Mel Gorman             2023-01-13  5190  		 * Help non-failing allocations by giving some access to memory
1ebbb21811b76c Mel Gorman             2023-01-13  5191  		 * reserves normally used for high priority non-blocking
1ebbb21811b76c Mel Gorman             2023-01-13  5192  		 * allocations but do not use ALLOC_NO_WATERMARKS because this
6c18ba7a18997d Michal Hocko           2017-02-22  5193  		 * could deplete whole memory reserves which would just make
1ebbb21811b76c Mel Gorman             2023-01-13  5194  		 * the situation worse.
6c18ba7a18997d Michal Hocko           2017-02-22  5195  		 */
6372aac4d41fcd Brendan Jackman        2026-07-03  5196  		page = __alloc_pages_cpuset_fallback(gfp_mask, order, alloc_flags, ac);
6c18ba7a18997d Michal Hocko           2017-02-22  5197  		if (page)
6c18ba7a18997d Michal Hocko           2017-02-22  5198  			goto got_pg;
6c18ba7a18997d Michal Hocko           2017-02-22  5199  
9a67f6488eca92 Michal Hocko           2017-02-22  5200  		cond_resched();
9a67f6488eca92 Michal Hocko           2017-02-22  5201  		goto retry;
9a67f6488eca92 Michal Hocko           2017-02-22  5202  	}
9a67f6488eca92 Michal Hocko           2017-02-22  5203  fail:
a8e99259e7e32b Michal Hocko           2017-02-22  5204  	warn_alloc(gfp_mask, ac->nodemask,
7877cdcc3893c1 Michal Hocko           2016-10-07  5205  			"page allocation failure: order:%u", order);
^1da177e4c3f41 Linus Torvalds         2005-04-16  5206  got_pg:
072bb0aa5e0629 Mel Gorman             2012-07-31  5207  	return page;
^1da177e4c3f41 Linus Torvalds         2005-04-16  5208  }
11e33f6a55ed78 Mel Gorman             2009-06-16  5209  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
