Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7782173338
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445348; cv=none; b=hZCtdd6wvvdkPZtVkfRwNRIatM6AkKzBvbzg+4EVyBC+wNeNVQv3/ulb8N/GObtAi4ibru/ytGkBHGo9RGOh1M0djsRLQgtHPP7oWAFmea6vXAcB+gjDbOVgvLtnMeFRGAF2va1X0yorkzFd6RjM6SdxU0jI6xeG39zOL8cVhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445348; c=relaxed/simple;
	bh=JXoB/YMmcIabU9WJNufaMLFUHUQzMRh/PHiXIAKsuLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A1WBcx7ni+FLxWxN105qbOXq6TWJo5+/PB4jSm76MUHftTG5Lrgima28lx3X/nQJKXVBdph5ykGrHRTZagD+6QiQh4/sLpXNJZf6K7mlSe1+SlbzU0jyWthi5GAW1cA51AgZzMxXcKLikr7CeoAGCGzi25a5hIhUs7p62ct+5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apUzdxU/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apUzdxU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719445347; x=1750981347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXoB/YMmcIabU9WJNufaMLFUHUQzMRh/PHiXIAKsuLY=;
  b=apUzdxU/PpqCjF2zMROmIUcEEswrfR0Bcqcwq0rF6dYUHMylBlJNd9ws
   OGHwCtP5QiBXsUGHSeIF0DKlkcadYbPNvdLRGdZ29J7+6kJ+egFlJgg4j
   7yk8a+jL1kC3AEyY0N3dO5QDLMA1M4+yPOXx7h9nT4+r7ko1X/ZZqEUZF
   y0fm2p1qBHE5xTMKcLH5yAq4gGyz3jCY9hAb8jHqOGUgT3enbebyZLr4r
   Pgy7l/Gt9EzYHXFwVsTa3/cb2Su04NBGqkIcHtU0Rs5jxJb+tYNFaOK81
   NYHM8gep51l8bgfn08xV+eowZcSITjFrYYI87WOq/dfTqcLCE2rrbqydl
   A==;
X-CSE-ConnectionGUID: b9anGAieSJKJTHkY7W4TNg==
X-CSE-MsgGUID: BB0VGrUmTRmZJo8oKMakdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16385680"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="16385680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 16:42:25 -0700
X-CSE-ConnectionGUID: ZN/xEnd+S2ynJwGkj54JJg==
X-CSE-MsgGUID: osoaWx9PQg+hheV/I1snrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44301867"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2024 16:42:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMcHN-000Ffm-2p;
	Wed, 26 Jun 2024 23:42:21 +0000
Date: Thu, 27 Jun 2024 07:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7944/8232] mm/hugetlb.c:2677
 gather_surplus_pages() error: uninitialized symbol 'folio'.
Message-ID: <202406270727.F4yNrBsh-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aristeu Rozanski <aris@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: 1cb6271d927cdb448a6a2794291c5405f1effa76 [7944/8232] hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270727.F4yNrBsh-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406270727.F4yNrBsh-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:2677 gather_surplus_pages() error: uninitialized symbol 'folio'.

vim +/folio +2677 mm/hugetlb.c

1cb6271d927cdb Aristeu Rozanski        2024-06-21  2639  
e4e574b767ba63 Adam Litke              2007-10-16  2640  /*
25985edcedea63 Lucas De Marchi         2011-03-30  2641   * Increase the hugetlb pool such that it can accommodate a reservation
e4e574b767ba63 Adam Litke              2007-10-16  2642   * of size 'delta'.
e4e574b767ba63 Adam Litke              2007-10-16  2643   */
0a4f3d1bb91cac Liu Xiang               2020-12-14  2644  static int gather_surplus_pages(struct hstate *h, long delta)
1b2a1e7bb9ce99 Jules Irenge            2020-04-06  2645  	__must_hold(&hugetlb_lock)
e4e574b767ba63 Adam Litke              2007-10-16  2646  {
3466534131b28e Miaohe Lin              2022-09-01  2647  	LIST_HEAD(surplus_list);
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2648) 	struct folio *folio, *tmp;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2649  	int ret;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2650  	long i;
0a4f3d1bb91cac Liu Xiang               2020-12-14  2651  	long needed, allocated;
28073b02bfaaed Hillf Danton            2012-03-21  2652  	bool alloc_ok = true;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2653  	int node;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2654  	nodemask_t *mbind_nodemask = policy_mbind_nodemask(htlb_alloc_mask(h));
e4e574b767ba63 Adam Litke              2007-10-16  2655  
9487ca60fd7fa2 Mike Kravetz            2021-05-04  2656  	lockdep_assert_held(&hugetlb_lock);
a5516438959d90 Andi Kleen              2008-07-23  2657  	needed = (h->resv_huge_pages + delta) - h->free_huge_pages;
ac09b3a15154af Adam Litke              2008-03-04  2658  	if (needed <= 0) {
a5516438959d90 Andi Kleen              2008-07-23  2659  		h->resv_huge_pages += delta;
e4e574b767ba63 Adam Litke              2007-10-16  2660  		return 0;
ac09b3a15154af Adam Litke              2008-03-04  2661  	}
e4e574b767ba63 Adam Litke              2007-10-16  2662  
e4e574b767ba63 Adam Litke              2007-10-16  2663  	allocated = 0;
e4e574b767ba63 Adam Litke              2007-10-16  2664  
e4e574b767ba63 Adam Litke              2007-10-16  2665  	ret = -ENOMEM;
e4e574b767ba63 Adam Litke              2007-10-16  2666  retry:
db71ef79b59bb2 Mike Kravetz            2021-05-04  2667  	spin_unlock_irq(&hugetlb_lock);
e4e574b767ba63 Adam Litke              2007-10-16  2668  	for (i = 0; i < needed; i++) {
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2669  		for_each_node_mask(node, cpuset_current_mems_allowed) {
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2670  			if (!mbind_nodemask || node_isset(node, *mbind_nodemask)) {
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2671  				folio = alloc_surplus_hugetlb_folio(h, htlb_alloc_mask(h),
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2672  						node, NULL);
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2673  				if (folio)
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2674  					break;
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2675  			}
1cb6271d927cdb Aristeu Rozanski        2024-06-21  2676  		}
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13 @2677  		if (!folio) {
28073b02bfaaed Hillf Danton            2012-03-21  2678  			alloc_ok = false;
28073b02bfaaed Hillf Danton            2012-03-21  2679  			break;
28073b02bfaaed Hillf Danton            2012-03-21  2680  		}
3a740e8bb56ef7 Sidhartha Kumar         2023-01-13  2681  		list_add(&folio->lru, &surplus_list);
69ed779a1454d9 David Rientjes          2017-07-10  2682  		cond_resched();
e4e574b767ba63 Adam Litke              2007-10-16  2683  	}
28073b02bfaaed Hillf Danton            2012-03-21  2684  	allocated += i;
e4e574b767ba63 Adam Litke              2007-10-16  2685  
e4e574b767ba63 Adam Litke              2007-10-16  2686  	/*
e4e574b767ba63 Adam Litke              2007-10-16  2687  	 * After retaking hugetlb_lock, we need to recalculate 'needed'
e4e574b767ba63 Adam Litke              2007-10-16  2688  	 * because either resv_huge_pages or free_huge_pages may have changed.
e4e574b767ba63 Adam Litke              2007-10-16  2689  	 */
db71ef79b59bb2 Mike Kravetz            2021-05-04  2690  	spin_lock_irq(&hugetlb_lock);
a5516438959d90 Andi Kleen              2008-07-23  2691  	needed = (h->resv_huge_pages + delta) -
a5516438959d90 Andi Kleen              2008-07-23  2692  			(h->free_huge_pages + allocated);
28073b02bfaaed Hillf Danton            2012-03-21  2693  	if (needed > 0) {
28073b02bfaaed Hillf Danton            2012-03-21  2694  		if (alloc_ok)
e4e574b767ba63 Adam Litke              2007-10-16  2695  			goto retry;
28073b02bfaaed Hillf Danton            2012-03-21  2696  		/*
28073b02bfaaed Hillf Danton            2012-03-21  2697  		 * We were not able to allocate enough pages to
28073b02bfaaed Hillf Danton            2012-03-21  2698  		 * satisfy the entire reservation so we free what
28073b02bfaaed Hillf Danton            2012-03-21  2699  		 * we've allocated so far.
28073b02bfaaed Hillf Danton            2012-03-21  2700  		 */
28073b02bfaaed Hillf Danton            2012-03-21  2701  		goto free;
28073b02bfaaed Hillf Danton            2012-03-21  2702  	}
e4e574b767ba63 Adam Litke              2007-10-16  2703  	/*
e4e574b767ba63 Adam Litke              2007-10-16  2704  	 * The surplus_list now contains _at_least_ the number of extra pages
25985edcedea63 Lucas De Marchi         2011-03-30  2705  	 * needed to accommodate the reservation.  Add the appropriate number
e4e574b767ba63 Adam Litke              2007-10-16  2706  	 * of pages to the hugetlb pool and free the extras back to the buddy
ac09b3a15154af Adam Litke              2008-03-04  2707  	 * allocator.  Commit the entire reservation here to prevent another
ac09b3a15154af Adam Litke              2008-03-04  2708  	 * process from stealing the pages as they are added to the pool but
ac09b3a15154af Adam Litke              2008-03-04  2709  	 * before they are reserved.
e4e574b767ba63 Adam Litke              2007-10-16  2710  	 */
e4e574b767ba63 Adam Litke              2007-10-16  2711  	needed += allocated;
a5516438959d90 Andi Kleen              2008-07-23  2712  	h->resv_huge_pages += delta;
e4e574b767ba63 Adam Litke              2007-10-16  2713  	ret = 0;
a9869b837c0987 Naoya Horiguchi         2010-09-08  2714  
19fc3f0acde326 Adam Litke              2008-04-28  2715  	/* Free the needed pages to the hugetlb pool */
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2716) 	list_for_each_entry_safe(folio, tmp, &surplus_list, lru) {
19fc3f0acde326 Adam Litke              2008-04-28  2717  		if ((--needed) < 0)
19fc3f0acde326 Adam Litke              2008-04-28  2718  			break;
b65a4edae11ecd Mike Kravetz            2021-09-02  2719  		/* Add the page to the hugetlb allocator */
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2720) 		enqueue_hugetlb_folio(h, folio);
19fc3f0acde326 Adam Litke              2008-04-28  2721  	}
28073b02bfaaed Hillf Danton            2012-03-21  2722  free:
db71ef79b59bb2 Mike Kravetz            2021-05-04  2723  	spin_unlock_irq(&hugetlb_lock);
19fc3f0acde326 Adam Litke              2008-04-28  2724  
b65a4edae11ecd Mike Kravetz            2021-09-02  2725  	/*
b65a4edae11ecd Mike Kravetz            2021-09-02  2726  	 * Free unnecessary surplus pages to the buddy allocator.
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2727) 	 * Pages have no ref count, call free_huge_folio directly.
b65a4edae11ecd Mike Kravetz            2021-09-02  2728  	 */
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2729) 	list_for_each_entry_safe(folio, tmp, &surplus_list, lru)
454a00c40a21c5 Matthew Wilcox (Oracle  2023-08-16  2730) 		free_huge_folio(folio);
db71ef79b59bb2 Mike Kravetz            2021-05-04  2731  	spin_lock_irq(&hugetlb_lock);
e4e574b767ba63 Adam Litke              2007-10-16  2732  
e4e574b767ba63 Adam Litke              2007-10-16  2733  	return ret;
e4e574b767ba63 Adam Litke              2007-10-16  2734  }
e4e574b767ba63 Adam Litke              2007-10-16  2735  

:::::: The code at line 2677 was first introduced by commit
:::::: 3a740e8bb56ef7ee6b9098b694caabab843be067 mm/hugetlb: convert alloc_surplus_huge_page() to folios

:::::: TO: Sidhartha Kumar <sidhartha.kumar@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
