Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF81F12F8
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787343130; cv=none; b=SeOTZVocQCAnLuihIJZ/n+jAVWrWu5pRyv4XncoflncmlzULvKlmt/hJ6uwYPGXubt3PEA3t3r6GEbPl1CY0pFdP/DFdx4YiMlh/wLt9hefpLDz7MeNoYJrCNgCZ7caMaYErFJvxX2ANZ+2oILqDsWUD76T5xhr2MFLIHZABPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787343130; c=relaxed/simple;
	bh=vFM4vzbMxf4CbyUaaP5hgOHb59atjJL90tQB8cYCMRA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NCY6yok1iRABax485YVJBZ9ez1jaPthFm7x8U1ZcX6r/L0M9JfaxYd56av798bRatKmnuH26ViVy7NeKUnY7/7ldVwG9MVYtAG+HilqNlVK7vektOG87StzLjj/7m0d3PxItKXiOL2V8divZBJBkGGyVMGoovhvQ/oXLIdqryk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V49G9Ibm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V49G9Ibm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787343128; x=1818879128;
  h=date:from:to:cc:subject:message-id;
  bh=vFM4vzbMxf4CbyUaaP5hgOHb59atjJL90tQB8cYCMRA=;
  b=V49G9IbmVxf4bntGAP9OC0SLDYXw68Pmb4rhhsRrKzSZ1WkRRewjhmxs
   +1CUObiBfmqL11g6W3o48J2SNFqUcOCZasEEIxd/cXek4k1d3X+uaz7kP
   zKWvaI+CEqHF5C2bAz/uxQCEqL4qEiRE4OWHCqnLGL+rXUKA6HzzfvsoJ
   eehYkn5Et9e7pMtsVklRW50n4yGR6Wc23+R87P/bV1pCx9vV8tUgpRfOS
   3GJe80Y3p3XmIX/iGbL5846leG0yTzcGJU1skhFAvPhw7Z1WSCf+Qh3tx
   Btv7vtHfsBUb00+TdtBWKYXJdFCvNscuZx0KxxTaRU1QkyFyR7FPM23qx
   g==;
X-CSE-ConnectionGUID: eKVP1yAqRratQQrktr9Fzg==
X-CSE-MsgGUID: LCe5sq7TQ+uWgl4c2gXkxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="90413482"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="90413482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 13:12:07 -0700
X-CSE-ConnectionGUID: w5ux1aTZR5eQGliX9w+v9w==
X-CSE-MsgGUID: UDeOV2QnQSmixQOGYpeBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="265923535"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Aug 2026 13:12:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxVau-00000000qR7-0Gum;
	Fri, 21 Aug 2026 20:12:04 +0000
Date: Sat, 22 Aug 2026 04:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 26/44] mm/page_alloc.c:5121 prepare_alloc_pages() warn: bitwise AND condition
 is false here
Message-ID: <202608220426.ZQx2dDq4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: 7c721abf0da4daad0f380440d2dbcf4d3c5bc307 [26/44] mm/page_alloc: add a private-node zonelist family
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r073-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220426.ZQx2dDq4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608220426.ZQx2dDq4-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:5121 prepare_alloc_pages() warn: bitwise AND condition is false here

vim +5121 mm/page_alloc.c

11e33f6a55ed78 Mel Gorman              2009-06-16  5100  
9cd7555875bb09 Mel Gorman              2017-02-24  5101  static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
04ec6264f28793 Vlastimil Babka         2017-07-06  5102  		int preferred_nid, nodemask_t *nodemask,
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5103) 		struct alloc_context *ac, gfp_t *alloc_gfp,
9cd7555875bb09 Mel Gorman              2017-02-24  5104  		unsigned int *alloc_flags)
11e33f6a55ed78 Mel Gorman              2009-06-16  5105  {
97a225e69a1f88 Joonsoo Kim             2020-06-03  5106  	ac->highest_zoneidx = gfp_zone(gfp_mask);
7c721abf0da4da Gregory Price           2026-07-29  5107  	ac->zonelist = select_zonelist(preferred_nid, gfp_mask, *alloc_flags);
9cd7555875bb09 Mel Gorman              2017-02-24  5108  	ac->nodemask = nodemask;
01c0bfe061f309 Wei Yang                2020-06-03  5109  	ac->migratetype = gfp_migratetype(gfp_mask);
11e33f6a55ed78 Mel Gorman              2009-06-16  5110  
7c721abf0da4da Gregory Price           2026-07-29  5111  	/*
7c721abf0da4da Gregory Price           2026-07-29  5112  	 * The private *fallback* zonelist lists every private node and public
7c721abf0da4da Gregory Price           2026-07-29  5113  	 * memory, so it grants access without confining -- the nodemask is the
7c721abf0da4da Gregory Price           2026-07-29  5114  	 * confinement.  Refuse it without a nodemask rather than fall through to
7c721abf0da4da Gregory Price           2026-07-29  5115  	 * the cpuset_current_mems_allowed default below, which spans every granted
7c721abf0da4da Gregory Price           2026-07-29  5116  	 * private node and would let the allocation spill onto one the caller
7c721abf0da4da Gregory Price           2026-07-29  5117  	 * never named (an isolation break); fail safe to the public zonelist.
7c721abf0da4da Gregory Price           2026-07-29  5118  	 * __GFP_THISNODE selects ZONELIST_PRIVATE_NOFALLBACK (the target node's own
7c721abf0da4da Gregory Price           2026-07-29  5119  	 * zones only), which is self-confining, so no nodemask is required there.
7c721abf0da4da Gregory Price           2026-07-29  5120  	 */
7c721abf0da4da Gregory Price           2026-07-29 @5121  	if ((*alloc_flags & ALLOC_ZONELIST_PRIVATE) && !nodemask &&
7c721abf0da4da Gregory Price           2026-07-29  5122  	    !(gfp_mask & __GFP_THISNODE)) {
7c721abf0da4da Gregory Price           2026-07-29  5123  		WARN_ON_ONCE(1);
7c721abf0da4da Gregory Price           2026-07-29  5124  		*alloc_flags &= ~ALLOC_ZONELIST_PRIVATE;
7c721abf0da4da Gregory Price           2026-07-29  5125  		ac->zonelist = select_zonelist(preferred_nid, gfp_mask, *alloc_flags);
7c721abf0da4da Gregory Price           2026-07-29  5126  	}
7c721abf0da4da Gregory Price           2026-07-29  5127  
682a3385e7734f Mel Gorman              2016-05-19  5128  	if (cpusets_enabled()) {
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5129) 		*alloc_gfp |= __GFP_HARDWALL;
182f3d7a02fddd Muchun Song             2020-08-06  5130  		/*
182f3d7a02fddd Muchun Song             2020-08-06  5131  		 * When we are in the interrupt context, it is irrelevant
182f3d7a02fddd Muchun Song             2020-08-06  5132  		 * to the current task context. It means that any node ok.
182f3d7a02fddd Muchun Song             2020-08-06  5133  		 */
88dc6f208829cf Vasily Averin           2021-09-02  5134  		if (in_task() && !ac->nodemask)
9cd7555875bb09 Mel Gorman              2017-02-24  5135  			ac->nodemask = &cpuset_current_mems_allowed;
5104782011a12b Vlastimil Babka         2017-02-24  5136  		else
5104782011a12b Vlastimil Babka         2017-02-24  5137  			*alloc_flags |= ALLOC_CPUSET;
682a3385e7734f Mel Gorman              2016-05-19  5138  	}
682a3385e7734f Mel Gorman              2016-05-19  5139  
446ec83805ddaa Simona Vetter           2022-06-05  5140  	might_alloc(gfp_mask);
11e33f6a55ed78 Mel Gorman              2009-06-16  5141  
97769a53f117e2 Alexei Starovoitov      2025-02-21  5142  	/*
97769a53f117e2 Alexei Starovoitov      2025-02-21  5143  	 * Don't invoke should_fail logic, since it may call
97769a53f117e2 Alexei Starovoitov      2025-02-21  5144  	 * get_random_u32() and printk() which need to spin_lock.
97769a53f117e2 Alexei Starovoitov      2025-02-21  5145  	 */
03eaf4c4451229 Brendan Jackman         2026-07-03  5146  	if (!(*alloc_flags & ALLOC_NOLOCK) &&
97769a53f117e2 Alexei Starovoitov      2025-02-21  5147  	    should_fail_alloc_page(gfp_mask, order))
9cd7555875bb09 Mel Gorman              2017-02-24  5148  		return false;
11e33f6a55ed78 Mel Gorman              2009-06-16  5149  
5df11ba0eb5ae3 Brendan Jackman         2026-07-03  5150  	*alloc_flags |= alloc_flags_cma(gfp_mask);
d883c6cf3b39f1 Joonsoo Kim             2018-05-23  5151  
c9ab0c4fbeb020 Mel Gorman              2015-11-06  5152  	/* Dirty zone balancing only done in the fast path */
9cd7555875bb09 Mel Gorman              2017-02-24  5153  	ac->spread_dirty_pages = (gfp_mask & __GFP_WRITE);
c9ab0c4fbeb020 Mel Gorman              2015-11-06  5154  
e46e7b77c9096e Mel Gorman              2016-06-03  5155  	/*
e46e7b77c9096e Mel Gorman              2016-06-03  5156  	 * The preferred zone is used for statistics but crucially it is
e46e7b77c9096e Mel Gorman              2016-06-03  5157  	 * also used as the starting point for the zonelist iterator. It
e46e7b77c9096e Mel Gorman              2016-06-03  5158  	 * may get reset for allocations that ignore memory policies.
e46e7b77c9096e Mel Gorman              2016-06-03  5159  	 */
9cd7555875bb09 Mel Gorman              2017-02-24  5160  	ac->preferred_zoneref = first_zones_zonelist(ac->zonelist,
97a225e69a1f88 Joonsoo Kim             2020-06-03  5161  					ac->highest_zoneidx, ac->nodemask);
a0622d05374b61 Mateusz Nosek           2020-10-13  5162  
a0622d05374b61 Mateusz Nosek           2020-10-13  5163  	return true;
9cd7555875bb09 Mel Gorman              2017-02-24  5164  }
9cd7555875bb09 Mel Gorman              2017-02-24  5165  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
