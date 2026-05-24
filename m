Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF553B6C09
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779665375; cv=none; b=WRQhydj3Ik9xfgmGultlTVHX4BKi4BMDIQ4DxdK1qriQDd8kTZo215QEHt0BqXasEw6daDmqnhYp1MqFFXF9k3BpWUrDt5gwoSZH4oHh/SDbqSAJD/79KWenxZm95BDC7L76MPGtj19DYGDXGHY0nsUXAEGgFRjt42/VV7Gh97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779665375; c=relaxed/simple;
	bh=9Arky1EnxMKnDXDzCT+1ofq7ztkc5HZO8NinIdw0mWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fVbqW4Xf/pprsr3EXcpK10QcATOoYRr9qNblEdoMWFs+j96BbAXRpvefO0WLFVh3cs8VaHgM1bVqxgVRpgvuTloAc8af2dIZo+JzqnZ7iCOqEch48tQuN2GUqUJPcaheyf6/ADi5C4VS5DTZ2zUY1cYGxB0fpmBz7/TJaC4+GLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3PlbEbk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3PlbEbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779665372; x=1811201372;
  h=date:from:to:cc:subject:message-id;
  bh=9Arky1EnxMKnDXDzCT+1ofq7ztkc5HZO8NinIdw0mWI=;
  b=f3PlbEbkx4xiDee0ZDHElU1GJ6Z2wWSJp8DX7Tsp4AAVQxsRz/R0ZPip
   pMaQuHm0FNKdwgmAQUVEpf0sAlMcdmMsKaVNudzlL+Pi2njQRJZCzW/lX
   m87EiuTOBJcNTtJXLBqD4orgwYUOmToiJ42CftxY/Hq39MP3QbbV/Zu0L
   b8xCdA2ZQQacdtpdGBF03/BLTqNraAHrguPWdBiNIbptP7ZXgS+7/jMeH
   PBEhguWQSpjOQon4JbMgKJPJxCXcUgwrvYrz3h3qKMj28KPd8HL9MgKfb
   WaZPzf3cze5Sh6AV6axEiHq0A+BGqtl3iaIc9O3lQ4lAoksQb1i3ODiNt
   A==;
X-CSE-ConnectionGUID: a8HAJwWtSQWjPUgchTI31A==
X-CSE-MsgGUID: 7w9UGC+OTEqbK+3TAU8NnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91963339"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="91963339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 16:29:32 -0700
X-CSE-ConnectionGUID: npx8eRV+T4q+nyuzHzBpbg==
X-CSE-MsgGUID: BnX6jJTKSHKGUNXabFyPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="265289560"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2026 16:29:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRIG7-000000000gj-3pm8;
	Sun, 24 May 2026 23:29:27 +0000
Date: Mon, 25 May 2026 07:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/rmap.c:2350 try_to_migrate_one() error: we previously
 assumed 'pvmw.pte' could be null (see line 2320)
Message-ID: <202605250728.QLpEV3p8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gavin Guo <gavinguo@igalia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Zi Yan <ziy@nvidia.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 60fbb14396d5ee1f430c55883d8e603d3229163c mm/huge_memory: adjust try_to_migrate_one() and split_huge_pmd_locked()
date:   1 year ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20260523 (https://download.01.org/0day-ci/archive/20260525/202605250728.QLpEV3p8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 60fbb14396d5 ("mm/huge_memory: adjust try_to_migrate_one() and split_huge_pmd_locked()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605250728.QLpEV3p8-lkp@intel.com/

smatch warnings:
mm/rmap.c:2350 try_to_migrate_one() error: we previously assumed 'pvmw.pte' could be null (see line 2320)

vim +2350 mm/rmap.c

a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2265  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2266  /*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2267   * @arg: enum ttu_flags will be passed to this argument.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2268   *
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2269   * If TTU_SPLIT_HUGE_PMD is specified any PMD mappings will be split into PTEs
64b586d1922384 Hugh Dickins            2021-07-07  2270   * containing migration entries.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2271   */
2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  2272) static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2273  		     unsigned long address, void *arg)
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2274  {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2275  	struct mm_struct *mm = vma->vm_mm;
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2276) 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
bf983108be0ef6 David Hildenbrand       2025-02-10  2277  	bool anon_exclusive, writable, ret = true;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2278  	pte_t pteval;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2279  	struct page *subpage;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2280  	struct mmu_notifier_range range;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2281  	enum ttu_flags flags = (enum ttu_flags)(long)arg;
c33c794828f212 Ryan Roberts            2023-06-12  2282  	unsigned long pfn;
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2283  	unsigned long hsz = 0;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2284  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2285  	/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2286  	 * When racing against e.g. zap_pte_range() on another cpu,
ca1a0746182c3c David Hildenbrand       2023-12-20  2287  	 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2288  	 * try_to_migrate() may return before page_mapped() has become false,
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2289  	 * if page table locking is skipped: use TTU_SYNC to wait for that.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2290  	 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2291  	if (flags & TTU_SYNC)
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2292  		pvmw.flags = PVMW_SYNC;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2293  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2294  	/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2295  	 * For THP, we have to assume the worse case ie pmd for invalidation.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2296  	 * For hugetlb, it could be much worse if we need to do pud
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2297  	 * invalidation in the case of pmd sharing.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2298  	 *
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2299  	 * Note that the page can not be free in this function as call of
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2300  	 * try_to_unmap() must hold a reference on the page.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2301  	 */
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  2302) 	range.end = vma_address_end(&pvmw);
7d4a8be0c4b2b7 Alistair Popple         2023-01-10  2303  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2304  				address, range.end);
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2305) 	if (folio_test_hugetlb(folio)) {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2306  		/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2307  		 * If sharing is possible, start and end will be adjusted
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2308  		 * accordingly.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2309  		 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2310  		adjust_range_if_pmd_sharing_possible(vma, &range.start,
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2311  						     &range.end);
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2312  
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2313  		/* We need the huge page size for set_huge_pte_at() */
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2314  		hsz = huge_page_size(hstate_vma(vma));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2315  	}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2316  	mmu_notifier_invalidate_range_start(&range);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2317  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2318  	while (page_vma_mapped_walk(&pvmw)) {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2319  		/* PMD-mapped THP migration entry */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30 @2320  		if (!pvmw.pte) {
60fbb14396d5ee Gavin Guo               2025-04-25  2321  			if (flags & TTU_SPLIT_HUGE_PMD) {
60fbb14396d5ee Gavin Guo               2025-04-25  2322  				split_huge_pmd_locked(vma, pvmw.address,
60fbb14396d5ee Gavin Guo               2025-04-25  2323  						      pvmw.pmd, true, NULL);
60fbb14396d5ee Gavin Guo               2025-04-25  2324  				ret = false;
60fbb14396d5ee Gavin Guo               2025-04-25  2325  				page_vma_mapped_walk_done(&pvmw);
60fbb14396d5ee Gavin Guo               2025-04-25  2326  				break;
60fbb14396d5ee Gavin Guo               2025-04-25  2327  			}
60fbb14396d5ee Gavin Guo               2025-04-25  2328  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2329) 			subpage = folio_page(folio,
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2330) 				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2331) 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2332) 					!folio_test_pmd_mappable(folio), folio);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2333  
7f5abe609b3dcb David Hildenbrand       2022-05-09  2334  			if (set_pmd_migration_entry(&pvmw, subpage)) {
7f5abe609b3dcb David Hildenbrand       2022-05-09  2335  				ret = false;
7f5abe609b3dcb David Hildenbrand       2022-05-09  2336  				page_vma_mapped_walk_done(&pvmw);
7f5abe609b3dcb David Hildenbrand       2022-05-09  2337  				break;
7f5abe609b3dcb David Hildenbrand       2022-05-09  2338  			}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2339  			continue;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2340  #endif
60fbb14396d5ee Gavin Guo               2025-04-25  2341  		}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2342  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2343  		/* Unexpected PMD-mapped THP? */
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2344) 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2345  
1118234e4bc22f David Hildenbrand       2022-06-23  2346  		/*
bf983108be0ef6 David Hildenbrand       2025-02-10  2347  		 * Handle PFN swap PTEs, such as device-exclusive ones, that
bf983108be0ef6 David Hildenbrand       2025-02-10  2348  		 * actually map pages.
1118234e4bc22f David Hildenbrand       2022-06-23  2349  		 */
bf983108be0ef6 David Hildenbrand       2025-02-10 @2350  		pteval = ptep_get(pvmw.pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2351  		if (likely(pte_present(pteval))) {
bf983108be0ef6 David Hildenbrand       2025-02-10  2352  			pfn = pte_pfn(pteval);
1118234e4bc22f David Hildenbrand       2022-06-23  2353  		} else {
bf983108be0ef6 David Hildenbrand       2025-02-10  2354  			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
bf983108be0ef6 David Hildenbrand       2025-02-10  2355  			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
1118234e4bc22f David Hildenbrand       2022-06-23  2356  		}
bf983108be0ef6 David Hildenbrand       2025-02-10  2357  
bf983108be0ef6 David Hildenbrand       2025-02-10  2358  		subpage = folio_page(folio, pfn - folio_pfn(folio));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2359  		address = pvmw.address;
6c287605fd5646 David Hildenbrand       2022-05-09  2360  		anon_exclusive = folio_test_anon(folio) &&
6c287605fd5646 David Hildenbrand       2022-05-09  2361  				 PageAnonExclusive(subpage);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2362  
dfc7ab57560da3 Baolin Wang             2022-05-09  2363  		if (folio_test_hugetlb(folio)) {
0506c31d0a8443 Baolin Wang             2022-06-20  2364  			bool anon = folio_test_anon(folio);
0506c31d0a8443 Baolin Wang             2022-06-20  2365  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2366  			/*
54205e9c542504 Baolin Wang             2022-05-09  2367  			 * huge_pmd_unshare may unmap an entire PMD page.
54205e9c542504 Baolin Wang             2022-05-09  2368  			 * There is no way of knowing exactly which PMDs may
54205e9c542504 Baolin Wang             2022-05-09  2369  			 * be cached for this mm, so we must flush them all.
54205e9c542504 Baolin Wang             2022-05-09  2370  			 * start/end were already adjusted above to cover this
54205e9c542504 Baolin Wang             2022-05-09  2371  			 * range.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2372  			 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2373  			flush_cache_range(vma, range.start, range.end);
54205e9c542504 Baolin Wang             2022-05-09  2374  
dfc7ab57560da3 Baolin Wang             2022-05-09  2375  			/*
dfc7ab57560da3 Baolin Wang             2022-05-09  2376  			 * To call huge_pmd_unshare, i_mmap_rwsem must be
dfc7ab57560da3 Baolin Wang             2022-05-09  2377  			 * held in write mode.  Caller needs to explicitly
dfc7ab57560da3 Baolin Wang             2022-05-09  2378  			 * do this outside rmap routines.
40549ba8f8e0ed Mike Kravetz            2022-09-14  2379  			 *
40549ba8f8e0ed Mike Kravetz            2022-09-14  2380  			 * We also must hold hugetlb vma_lock in write mode.
40549ba8f8e0ed Mike Kravetz            2022-09-14  2381  			 * Lock order dictates acquiring vma_lock BEFORE
40549ba8f8e0ed Mike Kravetz            2022-09-14  2382  			 * i_mmap_rwsem.  We can only try lock here and
40549ba8f8e0ed Mike Kravetz            2022-09-14  2383  			 * fail if unsuccessful.
40549ba8f8e0ed Mike Kravetz            2022-09-14  2384  			 */
40549ba8f8e0ed Mike Kravetz            2022-09-14  2385  			if (!anon) {
40549ba8f8e0ed Mike Kravetz            2022-09-14  2386  				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
40549ba8f8e0ed Mike Kravetz            2022-09-14  2387  				if (!hugetlb_vma_trylock_write(vma)) {
40549ba8f8e0ed Mike Kravetz            2022-09-14  2388  					page_vma_mapped_walk_done(&pvmw);
40549ba8f8e0ed Mike Kravetz            2022-09-14  2389  					ret = false;
40549ba8f8e0ed Mike Kravetz            2022-09-14  2390  					break;
40549ba8f8e0ed Mike Kravetz            2022-09-14  2391  				}
40549ba8f8e0ed Mike Kravetz            2022-09-14  2392  				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
40549ba8f8e0ed Mike Kravetz            2022-09-14  2393  					hugetlb_vma_unlock_write(vma);
40549ba8f8e0ed Mike Kravetz            2022-09-14  2394  					flush_tlb_range(vma,
40549ba8f8e0ed Mike Kravetz            2022-09-14  2395  						range.start, range.end);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2396  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2397  					/*
40549ba8f8e0ed Mike Kravetz            2022-09-14  2398  					 * The ref count of the PMD page was
40549ba8f8e0ed Mike Kravetz            2022-09-14  2399  					 * dropped which is part of the way map
40549ba8f8e0ed Mike Kravetz            2022-09-14  2400  					 * counting is done for shared PMDs.
40549ba8f8e0ed Mike Kravetz            2022-09-14  2401  					 * Return 'true' here.  When there is
40549ba8f8e0ed Mike Kravetz            2022-09-14  2402  					 * no other sharing, huge_pmd_unshare
40549ba8f8e0ed Mike Kravetz            2022-09-14  2403  					 * returns false and we will unmap the
40549ba8f8e0ed Mike Kravetz            2022-09-14  2404  					 * actual page and drop map count
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2405  					 * to zero.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2406  					 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2407  					page_vma_mapped_walk_done(&pvmw);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2408  					break;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2409  				}
40549ba8f8e0ed Mike Kravetz            2022-09-14  2410  				hugetlb_vma_unlock_write(vma);
40549ba8f8e0ed Mike Kravetz            2022-09-14  2411  			}
5d4af6195c87c6 Baolin Wang             2022-05-13  2412  			/* Nuke the hugetlb page table entry */
5d4af6195c87c6 Baolin Wang             2022-05-13  2413  			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2414  			if (pte_dirty(pteval))
bf983108be0ef6 David Hildenbrand       2025-02-10  2415  				folio_mark_dirty(folio);
bf983108be0ef6 David Hildenbrand       2025-02-10  2416  			writable = pte_write(pteval);
bf983108be0ef6 David Hildenbrand       2025-02-10  2417  		} else if (likely(pte_present(pteval))) {
c33c794828f212 Ryan Roberts            2023-06-12  2418  			flush_cache_page(vma, address, pfn);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2419  			/* Nuke the page table entry. */
7e12beb8ca2ac9 Ying Huang              2023-02-13  2420  			if (should_defer_flush(mm, flags)) {
7e12beb8ca2ac9 Ying Huang              2023-02-13  2421  				/*
7e12beb8ca2ac9 Ying Huang              2023-02-13  2422  				 * We clear the PTE but do not flush so potentially
7e12beb8ca2ac9 Ying Huang              2023-02-13  2423  				 * a remote CPU could still be writing to the folio.
7e12beb8ca2ac9 Ying Huang              2023-02-13  2424  				 * If the entry was previously clean then the
7e12beb8ca2ac9 Ying Huang              2023-02-13  2425  				 * architecture must guarantee that a clear->dirty
7e12beb8ca2ac9 Ying Huang              2023-02-13  2426  				 * transition on a cached TLB entry is written through
7e12beb8ca2ac9 Ying Huang              2023-02-13  2427  				 * and traps if the PTE is unmapped.
7e12beb8ca2ac9 Ying Huang              2023-02-13  2428  				 */
7e12beb8ca2ac9 Ying Huang              2023-02-13  2429  				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
7e12beb8ca2ac9 Ying Huang              2023-02-13  2430  
2f4ab3ac10e147 Barry Song              2025-02-14  2431  				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
7e12beb8ca2ac9 Ying Huang              2023-02-13  2432  			} else {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2433  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
5d4af6195c87c6 Baolin Wang             2022-05-13  2434  			}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2435  			if (pte_dirty(pteval))
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2436) 				folio_mark_dirty(folio);
bf983108be0ef6 David Hildenbrand       2025-02-10  2437  			writable = pte_write(pteval);
bf983108be0ef6 David Hildenbrand       2025-02-10  2438  		} else {
bf983108be0ef6 David Hildenbrand       2025-02-10  2439  			pte_clear(mm, address, pvmw.pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2440  			writable = is_writable_device_private_entry(pte_to_swp_entry(pteval));
bf983108be0ef6 David Hildenbrand       2025-02-10  2441  		}
bf983108be0ef6 David Hildenbrand       2025-02-10  2442  
bf983108be0ef6 David Hildenbrand       2025-02-10  2443  		VM_WARN_ON_FOLIO(writable && folio_test_anon(folio) &&
bf983108be0ef6 David Hildenbrand       2025-02-10  2444  				!anon_exclusive, folio);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2445  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2446  		/* Update high watermark before we lower rss */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2447  		update_hiwater_rss(mm);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2448  
bf983108be0ef6 David Hildenbrand       2025-02-10  2449  		if (PageHWPoison(subpage)) {
bf983108be0ef6 David Hildenbrand       2025-02-10  2450  			VM_WARN_ON_FOLIO(folio_is_device_private(folio), folio);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2451  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2452  			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2453) 			if (folio_test_hugetlb(folio)) {
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2454) 				hugetlb_count_sub(folio_nr_pages(folio), mm);
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2455  				set_huge_pte_at(mm, address, pvmw.pte, pteval,
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2456  						hsz);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2457  			} else {
a23f517b0e1554 Kefeng Wang             2024-01-11  2458  				dec_mm_counter(mm, mm_counter(folio));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2459  				set_pte_at(mm, address, pvmw.pte, pteval);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2460  			}
bf983108be0ef6 David Hildenbrand       2025-02-10  2461  		} else if (likely(pte_present(pteval)) && pte_unused(pteval) &&
bf983108be0ef6 David Hildenbrand       2025-02-10  2462  			   !userfaultfd_armed(vma)) {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2463  			/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2464  			 * The guest indicated that the page content is of no
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2465  			 * interest anymore. Simply discard the pte, vmscan
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2466  			 * will take care of the rest.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2467  			 * A future reference will then fault in a new zero
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2468  			 * page. When userfaultfd is active, we must not drop
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2469  			 * this page though, as its main user (postcopy
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2470  			 * migration) will not expect userfaults on already
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2471  			 * copied pages.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2472  			 */
a23f517b0e1554 Kefeng Wang             2024-01-11  2473  			dec_mm_counter(mm, mm_counter(folio));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2474  		} else {
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2475  			swp_entry_t entry;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2476  			pte_t swp_pte;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2477  
bf983108be0ef6 David Hildenbrand       2025-02-10  2478  			/*
bf983108be0ef6 David Hildenbrand       2025-02-10  2479  			 * arch_unmap_one() is expected to be a NOP on
bf983108be0ef6 David Hildenbrand       2025-02-10  2480  			 * architectures where we could have PFN swap PTEs,
bf983108be0ef6 David Hildenbrand       2025-02-10  2481  			 * so we'll not check/care.
bf983108be0ef6 David Hildenbrand       2025-02-10  2482  			 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2483  			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
5d4af6195c87c6 Baolin Wang             2022-05-13  2484  				if (folio_test_hugetlb(folio))
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2485  					set_huge_pte_at(mm, address, pvmw.pte,
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2486  							pteval, hsz);
5d4af6195c87c6 Baolin Wang             2022-05-13  2487  				else
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2488  					set_pte_at(mm, address, pvmw.pte, pteval);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2489  				ret = false;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2490  				page_vma_mapped_walk_done(&pvmw);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2491  				break;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2492  			}
088b8aa537c2c7 David Hildenbrand       2022-09-01  2493  
e3b4b1374f87c7 David Hildenbrand       2023-12-20  2494  			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2495  			if (folio_test_hugetlb(folio)) {
6c287605fd5646 David Hildenbrand       2022-05-09  2496  				if (anon_exclusive &&
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2497  				    hugetlb_try_share_anon_rmap(folio)) {
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2498  					set_huge_pte_at(mm, address, pvmw.pte,
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2499  							pteval, hsz);
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2500  					ret = false;
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2501  					page_vma_mapped_walk_done(&pvmw);
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2502  					break;
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2503  				}
0c2ec32bf0b2f0 David Hildenbrand       2023-12-20  2504  			} else if (anon_exclusive &&
e3b4b1374f87c7 David Hildenbrand       2023-12-20  2505  				   folio_try_share_anon_rmap_pte(folio, subpage)) {
6c287605fd5646 David Hildenbrand       2022-05-09  2506  				set_pte_at(mm, address, pvmw.pte, pteval);
6c287605fd5646 David Hildenbrand       2022-05-09  2507  				ret = false;
6c287605fd5646 David Hildenbrand       2022-05-09  2508  				page_vma_mapped_walk_done(&pvmw);
6c287605fd5646 David Hildenbrand       2022-05-09  2509  				break;
6c287605fd5646 David Hildenbrand       2022-05-09  2510  			}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2511  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2512  			/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2513  			 * Store the pfn of the page in a special migration
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2514  			 * pte. do_swap_page() will wait until the migration
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2515  			 * pte is removed and then restart fault handling.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2516  			 */
bf983108be0ef6 David Hildenbrand       2025-02-10  2517  			if (writable)
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2518  				entry = make_writable_migration_entry(
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2519  							page_to_pfn(subpage));
6c287605fd5646 David Hildenbrand       2022-05-09  2520  			else if (anon_exclusive)
6c287605fd5646 David Hildenbrand       2022-05-09  2521  				entry = make_readable_exclusive_migration_entry(
6c287605fd5646 David Hildenbrand       2022-05-09  2522  							page_to_pfn(subpage));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2523  			else
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2524  				entry = make_readable_migration_entry(
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2525  							page_to_pfn(subpage));
bf983108be0ef6 David Hildenbrand       2025-02-10  2526  			if (likely(pte_present(pteval))) {
2e3468778dbe3e Peter Xu                2022-08-11  2527  				if (pte_young(pteval))
2e3468778dbe3e Peter Xu                2022-08-11  2528  					entry = make_migration_entry_young(entry);
2e3468778dbe3e Peter Xu                2022-08-11  2529  				if (pte_dirty(pteval))
2e3468778dbe3e Peter Xu                2022-08-11  2530  					entry = make_migration_entry_dirty(entry);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2531  				swp_pte = swp_entry_to_pte(entry);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2532  				if (pte_soft_dirty(pteval))
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2533  					swp_pte = pte_swp_mksoft_dirty(swp_pte);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2534  				if (pte_uffd_wp(pteval))
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2535  					swp_pte = pte_swp_mkuffd_wp(swp_pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2536  			} else {
bf983108be0ef6 David Hildenbrand       2025-02-10  2537  				swp_pte = swp_entry_to_pte(entry);
bf983108be0ef6 David Hildenbrand       2025-02-10  2538  				if (pte_swp_soft_dirty(pteval))
bf983108be0ef6 David Hildenbrand       2025-02-10  2539  					swp_pte = pte_swp_mksoft_dirty(swp_pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2540  				if (pte_swp_uffd_wp(pteval))
bf983108be0ef6 David Hildenbrand       2025-02-10  2541  					swp_pte = pte_swp_mkuffd_wp(swp_pte);
bf983108be0ef6 David Hildenbrand       2025-02-10  2542  			}
5d4af6195c87c6 Baolin Wang             2022-05-13  2543  			if (folio_test_hugetlb(folio))
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2544  				set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
935d4f0c6dc8b3 Ryan Roberts            2023-09-22  2545  						hsz);
5d4af6195c87c6 Baolin Wang             2022-05-13  2546  			else
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2547  				set_pte_at(mm, address, pvmw.pte, swp_pte);
4cc79b3303f224 Anshuman Khandual       2022-03-24  2548  			trace_set_migration_pte(address, pte_val(swp_pte),
059ab7be09d4ff Matthew Wilcox (Oracle  2024-02-15  2549) 						folio_order(folio));
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2550  			/*
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2551  			 * No need to invalidate here it will synchronize on
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2552  			 * against the special swap migration pte.
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2553  			 */
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2554  		}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2555  
e135826b2da0cf David Hildenbrand       2023-12-20  2556  		if (unlikely(folio_test_hugetlb(folio)))
e135826b2da0cf David Hildenbrand       2023-12-20  2557  			hugetlb_remove_rmap(folio);
e135826b2da0cf David Hildenbrand       2023-12-20  2558  		else
ca1a0746182c3c David Hildenbrand       2023-12-20  2559  			folio_remove_rmap_pte(folio, subpage, vma);
b74355078b6554 Hugh Dickins            2022-02-14  2560  		if (vma->vm_flags & VM_LOCKED)
96f97c438f61dd Lorenzo Stoakes         2023-01-12  2561  			mlock_drain_local();
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  2562) 		folio_put(folio);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2563  	}
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2564  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2565  	mmu_notifier_invalidate_range_end(&range);
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2566  
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2567  	return ret;
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2568  }
a98a2f0c8ce1b2 Alistair Popple         2021-06-30  2569  

:::::: The code at line 2350 was first introduced by commit
:::::: bf983108be0ef6cc8e96ccc0458f926dc96e6ba2 mm/rmap: handle device-exclusive entries correctly in try_to_migrate_one()

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
