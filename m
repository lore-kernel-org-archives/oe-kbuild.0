Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6C38D40F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974920; cv=none; b=I40cDZstfdaAGraU2M4agxMEtldZc4y2gOqwtN8T9R1gBQjBtYjipPSkx9CsObP7/QqkdvEtZuLtPsPlIRM1QgyA0B3YeHbzF1X7MOIPYadpOweNzI4dMzhrQ4U4478iYkGcyQ9h/BR8MV0lYolID1D3/ov0d0SOwmOmwe4ZbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974920; c=relaxed/simple;
	bh=pATkDa2+MPiVqp4PtyFNdyLkNnpxO/YpAcYH3Qz5xaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G9atL4qy6uEODJUPkDSzHaa7Y3VoabHX/XL4G23ylhVvKt17KRNmsfMf1sGLsEeBSPbzC7xyMRKMTqAft/8o0RsSsIBefeEheHhAHS96Dwi1E2fy2rpYbOafqtyF4MAvmyocBoPs2CrHgtAA6sE+qsPUHLuvStt3M3S9IkcDV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+R4NdhD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+R4NdhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782974918; x=1814510918;
  h=date:from:to:cc:subject:message-id;
  bh=pATkDa2+MPiVqp4PtyFNdyLkNnpxO/YpAcYH3Qz5xaQ=;
  b=h+R4NdhDzKbSpLq9xHxpiq+xHT6Ur8HAX6MTNa0X09/PjOSb+rXKEX//
   Acc6znpyR91bLIHG+ZGyTnVQ+IBjReJdrHzFyNBPU9o8pOKmy4wsgpRnA
   M6cqlF78Wo5JLgOdyotoFx/A9fEF/97nrQHcJYNfvdTnPaUkouZTIXPwl
   YXTI5PT1C4S6K9JbzC0weMs6Opuibg9e2XWqYknhNyP7ZfWOtl5CK/UN3
   JY4Xc5i0GkN7LCOcl/QmtBd+10Te3z6jn8p7qIsb7X+lFV8Kykel3hS3N
   XYl7a4vIKY6VqYhRjultG5Au+gpUIO5Afh1Spz3EFwifziRyB/4aWs/69
   Q==;
X-CSE-ConnectionGUID: 1l5LcIozSL+iDxSz68Nnuw==
X-CSE-MsgGUID: Bbi0ZjfXTGuAk1uiyfjCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83909607"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83909607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:48:38 -0700
X-CSE-ConnectionGUID: 5QuEPS9pTYyITRi5QdeVQg==
X-CSE-MsgGUID: BYFsQ0vVQVeCVOWrCxV2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257663596"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2026 23:48:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBDt-00000000A6d-2bWT;
	Thu, 02 Jul 2026 06:48:33 +0000
Date: Thu, 02 Jul 2026 14:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 216/260] mm/vmpressure.c:254 vmpressure()
 warn: check likely/unlikely parentheses
Message-ID: <202607021433.DYT5fDqE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Usama Arif <usama.arif@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   f4b4fac1867633ac17c35842f03933f6a7a4425f
commit: c4f88f218f28b96222f381cb57336ca4b9573b11 [216/260] mm-vmpressure-skip-tree=true-accounting-on-cgroup-v2-fix
:::::: branch date: 4 hours ago
:::::: commit date: 6 hours ago
config: microblaze-randconfig-r071-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021433.DYT5fDqE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021433.DYT5fDqE-lkp@intel.com/

smatch warnings:
mm/vmpressure.c:254 vmpressure() warn: check likely/unlikely parentheses

vim +254 mm/vmpressure.c

70ddf637eebe47 Anton Vorontsov    2013-04-29  217  
70ddf637eebe47 Anton Vorontsov    2013-04-29  218  /**
70ddf637eebe47 Anton Vorontsov    2013-04-29  219   * vmpressure() - Account memory pressure through scanned/reclaimed ratio
70ddf637eebe47 Anton Vorontsov    2013-04-29  220   * @gfp:	reclaimer's gfp mask
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  221)  * @order:	allocation order being reclaimed for
70ddf637eebe47 Anton Vorontsov    2013-04-29  222   * @memcg:	cgroup memory controller handle
8e8ae645249b85 Johannes Weiner    2016-01-14  223   * @tree:	legacy subtree mode
70ddf637eebe47 Anton Vorontsov    2013-04-29  224   * @scanned:	number of pages scanned
70ddf637eebe47 Anton Vorontsov    2013-04-29  225   * @reclaimed:	number of pages reclaimed
70ddf637eebe47 Anton Vorontsov    2013-04-29  226   *
70ddf637eebe47 Anton Vorontsov    2013-04-29  227   * This function should be called from the vmscan reclaim path to account
70ddf637eebe47 Anton Vorontsov    2013-04-29  228   * "instantaneous" memory pressure (scanned/reclaimed ratio). The raw
70ddf637eebe47 Anton Vorontsov    2013-04-29  229   * pressure index is then further refined and averaged over time.
70ddf637eebe47 Anton Vorontsov    2013-04-29  230   *
8e8ae645249b85 Johannes Weiner    2016-01-14  231   * If @tree is set, vmpressure is in traditional userspace reporting
8e8ae645249b85 Johannes Weiner    2016-01-14  232   * mode: @memcg is considered the pressure root and userspace is
8e8ae645249b85 Johannes Weiner    2016-01-14  233   * notified of the entire subtree's reclaim efficiency.
8e8ae645249b85 Johannes Weiner    2016-01-14  234   *
8e8ae645249b85 Johannes Weiner    2016-01-14  235   * If @tree is not set, reclaim efficiency is recorded for @memcg, and
8e8ae645249b85 Johannes Weiner    2016-01-14  236   * only in-kernel users are notified.
8e8ae645249b85 Johannes Weiner    2016-01-14  237   *
70ddf637eebe47 Anton Vorontsov    2013-04-29  238   * This function does not return any value.
70ddf637eebe47 Anton Vorontsov    2013-04-29  239   */
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  240) void vmpressure(gfp_t gfp, int order, struct mem_cgroup *memcg, bool tree,
70ddf637eebe47 Anton Vorontsov    2013-04-29  241  		unsigned long scanned, unsigned long reclaimed)
70ddf637eebe47 Anton Vorontsov    2013-04-29  242  {
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  243  	struct vmpressure *vmpr;
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  244  
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  245  	if (mem_cgroup_disabled())
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  246  		return;
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  247  
ac8a52962164a5 Abel Wu            2023-08-14  248  	/*
8615f926cc7407 Usama Arif         2026-06-30  249  	 * Only two combinations have a consumer:
8615f926cc7407 Usama Arif         2026-06-30  250  	 *   cgroup v2 + tree=false -> in-kernel socket pressure
8615f926cc7407 Usama Arif         2026-06-30  251  	 *   cgroup v1 + tree=true  -> userspace eventfds (memory.pressure_level)
8615f926cc7407 Usama Arif         2026-06-30  252  	 * Skip the other two: nothing consumes the result.
ac8a52962164a5 Abel Wu            2023-08-14  253  	 */
c4f88f218f28b9 Usama Arif         2026-06-30 @254  	if (cgroup_subsys_on_dfl(memory_cgrp_subsys) == tree)
ac8a52962164a5 Abel Wu            2023-08-14  255  		return;
ac8a52962164a5 Abel Wu            2023-08-14  256  
56cab2859fbe08 Suren Baghdasaryan 2021-09-02  257  	vmpr = memcg_to_vmpressure(memcg);
70ddf637eebe47 Anton Vorontsov    2013-04-29  258  
70ddf637eebe47 Anton Vorontsov    2013-04-29  259  	/*
70ddf637eebe47 Anton Vorontsov    2013-04-29  260  	 * Here we only want to account pressure that userland is able to
70ddf637eebe47 Anton Vorontsov    2013-04-29  261  	 * help us with. For example, suppose that DMA zone is under
70ddf637eebe47 Anton Vorontsov    2013-04-29  262  	 * pressure; if we notify userland about that kind of pressure,
70ddf637eebe47 Anton Vorontsov    2013-04-29  263  	 * then it will be mostly a waste as it will trigger unnecessary
70ddf637eebe47 Anton Vorontsov    2013-04-29  264  	 * freeing of memory by userland (since userland is more likely to
70ddf637eebe47 Anton Vorontsov    2013-04-29  265  	 * have HIGHMEM/MOVABLE pages instead of the DMA fallback). That
70ddf637eebe47 Anton Vorontsov    2013-04-29  266  	 * is why we include only movable, highmem and FS/IO pages.
70ddf637eebe47 Anton Vorontsov    2013-04-29  267  	 * Indirect reclaim (kswapd) sets sc->gfp_mask to GFP_KERNEL, so
70ddf637eebe47 Anton Vorontsov    2013-04-29  268  	 * we account it too.
70ddf637eebe47 Anton Vorontsov    2013-04-29  269  	 */
70ddf637eebe47 Anton Vorontsov    2013-04-29  270  	if (!(gfp & (__GFP_HIGHMEM | __GFP_MOVABLE | __GFP_IO | __GFP_FS)))
70ddf637eebe47 Anton Vorontsov    2013-04-29  271  		return;
70ddf637eebe47 Anton Vorontsov    2013-04-29  272  
70ddf637eebe47 Anton Vorontsov    2013-04-29  273  	/*
70ddf637eebe47 Anton Vorontsov    2013-04-29  274  	 * If we got here with no pages scanned, then that is an indicator
70ddf637eebe47 Anton Vorontsov    2013-04-29  275  	 * that reclaimer was unable to find any shrinkable LRUs at the
70ddf637eebe47 Anton Vorontsov    2013-04-29  276  	 * current scanning depth. But it does not mean that we should
70ddf637eebe47 Anton Vorontsov    2013-04-29  277  	 * report the critical pressure, yet. If the scanning priority
70ddf637eebe47 Anton Vorontsov    2013-04-29  278  	 * (scanning depth) goes too high (deep), we will be notified
70ddf637eebe47 Anton Vorontsov    2013-04-29  279  	 * through vmpressure_prio(). But so far, keep calm.
70ddf637eebe47 Anton Vorontsov    2013-04-29  280  	 */
70ddf637eebe47 Anton Vorontsov    2013-04-29  281  	if (!scanned)
70ddf637eebe47 Anton Vorontsov    2013-04-29  282  		return;
70ddf637eebe47 Anton Vorontsov    2013-04-29  283  
8e8ae645249b85 Johannes Weiner    2016-01-14  284  	if (tree) {
22f2020f84c6da Michal Hocko       2013-07-31  285  		spin_lock(&vmpr->sr_lock);
3c1da7beeee025 Vladimir Davydov   2016-02-02  286  		scanned = vmpr->tree_scanned += scanned;
8e8ae645249b85 Johannes Weiner    2016-01-14  287  		vmpr->tree_reclaimed += reclaimed;
22f2020f84c6da Michal Hocko       2013-07-31  288  		spin_unlock(&vmpr->sr_lock);
70ddf637eebe47 Anton Vorontsov    2013-04-29  289  
8e0ed445b34784 Michal Hocko       2013-07-31  290  		if (scanned < vmpressure_win)
70ddf637eebe47 Anton Vorontsov    2013-04-29  291  			return;
70ddf637eebe47 Anton Vorontsov    2013-04-29  292  		schedule_work(&vmpr->work);
8e8ae645249b85 Johannes Weiner    2016-01-14  293  	} else {
8e8ae645249b85 Johannes Weiner    2016-01-14  294  		enum vmpressure_levels level;
8e8ae645249b85 Johannes Weiner    2016-01-14  295  
8e8ae645249b85 Johannes Weiner    2016-01-14  296  		/* For now, no users for root-level efficiency */
d8a1c03ff79705 Yang Shi           2020-04-01  297  		if (!memcg || mem_cgroup_is_root(memcg))
8e8ae645249b85 Johannes Weiner    2016-01-14  298  			return;
8e8ae645249b85 Johannes Weiner    2016-01-14  299  
8e8ae645249b85 Johannes Weiner    2016-01-14  300  		spin_lock(&vmpr->sr_lock);
8e8ae645249b85 Johannes Weiner    2016-01-14  301  		scanned = vmpr->scanned += scanned;
8e8ae645249b85 Johannes Weiner    2016-01-14  302  		reclaimed = vmpr->reclaimed += reclaimed;
8e8ae645249b85 Johannes Weiner    2016-01-14  303  		if (scanned < vmpressure_win) {
8e8ae645249b85 Johannes Weiner    2016-01-14  304  			spin_unlock(&vmpr->sr_lock);
8e8ae645249b85 Johannes Weiner    2016-01-14  305  			return;
8e8ae645249b85 Johannes Weiner    2016-01-14  306  		}
8e8ae645249b85 Johannes Weiner    2016-01-14  307  		vmpr->scanned = vmpr->reclaimed = 0;
8e8ae645249b85 Johannes Weiner    2016-01-14  308  		spin_unlock(&vmpr->sr_lock);
8e8ae645249b85 Johannes Weiner    2016-01-14  309  
8e8ae645249b85 Johannes Weiner    2016-01-14  310  		level = vmpressure_calc_level(scanned, reclaimed);
8e8ae645249b85 Johannes Weiner    2016-01-14  311  
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  312) 		/*
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  313) 		 * Once we go above COSTLY_ORDER, reclaim relies heavily on
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  314) 		 * compaction to make progress. Reclaim efficiency was never a
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  315) 		 * great proxy for pressure to begin with, but it's outright
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  316) 		 * misleading with these high orders. Don't throttle sockets
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  317) 		 * because somebody is attempting something crazy like an order-7
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  318) 		 * and predictably struggling.
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  319) 		 */
f2a950170f7a78 JP Kobryn (Meta    2026-04-06  320) 		if (level > VMPRESSURE_LOW && order <= PAGE_ALLOC_COSTLY_ORDER) {
8e8ae645249b85 Johannes Weiner    2016-01-14  321  			/*
8e8ae645249b85 Johannes Weiner    2016-01-14  322  			 * Let the socket buffer allocator know that
8e8ae645249b85 Johannes Weiner    2016-01-14  323  			 * we are having trouble reclaiming LRU pages.
8e8ae645249b85 Johannes Weiner    2016-01-14  324  			 *
8e8ae645249b85 Johannes Weiner    2016-01-14  325  			 * For hysteresis keep the pressure state
8e8ae645249b85 Johannes Weiner    2016-01-14  326  			 * asserted for a second in which subsequent
8e8ae645249b85 Johannes Weiner    2016-01-14  327  			 * pressure events can occur.
8e8ae645249b85 Johannes Weiner    2016-01-14  328  			 */
378bdb97405a00 Kuniyuki Iwashima  2025-07-17  329  			mem_cgroup_set_socket_pressure(memcg);
8e8ae645249b85 Johannes Weiner    2016-01-14  330  		}
8e8ae645249b85 Johannes Weiner    2016-01-14  331  	}
70ddf637eebe47 Anton Vorontsov    2013-04-29  332  }
70ddf637eebe47 Anton Vorontsov    2013-04-29  333  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
