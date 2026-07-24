Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162A2749DF
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873358; cv=none; b=KjGruEve2OXa7K0zI49KJB2gajs3wo6cQ+j1/ldbMTWef4UPCPa0HqHZ+EdPg2Rv2o5J5R0ThCFHXqGcgGJY+59FRnBrzDaDQ4WvaawJBiFhAf4/kpwchaQOz2e2cLhijaSixUNVzXVhk+Mv0DtOrvHsmH895bPy26Sxc0iltvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873358; c=relaxed/simple;
	bh=mrsk2PwcM+shTKvPgQ1+KwRJjnWdzME0Nmp4a2HDi7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=US4k40AahuWuFHpB95So3juAk/c+dFLYMq3VtyAty2qwp1L2jY8B8Y/qwD1PcQGoeeKMl+UFXvLkzys7RpwOiUofLV6G95kL20Sib3BraxBdgDJilBSD5LzhvNTAhbK9gzLMoiKuHQodwPVlQppajOGMuDy5Cz00A0g2B0PVRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEstXWAv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEstXWAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784873356; x=1816409356;
  h=date:from:to:cc:subject:message-id;
  bh=mrsk2PwcM+shTKvPgQ1+KwRJjnWdzME0Nmp4a2HDi7E=;
  b=hEstXWAvtkTYBqmlpux1Lksc79mYnUBuSKA8xcChwbe07mxa8m4mR89Q
   /QSuWhzvhKKnvrXQMqyXvGlr4eVKrAC4j9Xi7Z2fM375rN/K3C6+kPalR
   obWMKM+ENbufDK3tbVQVT5K2L+j+ZrTOhivYHXWcVWRclSUT/HToELpdu
   0095nUV+uFYxbs7HvvHkVaGgoF0GLEen8PTiHgtgp7OTQzAmyHDRfQVT6
   jKhrYcVJg2VVa4GVKBXNSGU8OoL7zU10t+gAyNlVMCHjHu9Y/rGQBN5NR
   QHdu9u1gW1w9OxmPnTqxHJojEo8cxBL6RD9TTkaYjOELOdySFdfn4AW+h
   w==;
X-CSE-ConnectionGUID: 6zxSj+5FT3WmV66oZkc5Qw==
X-CSE-MsgGUID: OKnU4OEsTlOR7RZWlc4Q3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103077390"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="103077390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 23:09:15 -0700
X-CSE-ConnectionGUID: Kpp/3ByMSnyCE8ndC12m6A==
X-CSE-MsgGUID: 4yM9vhGrSu+LLqRwMIwwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="262934478"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2026 23:09:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn95j-00000000aXg-2Y2C;
	Fri, 24 Jul 2026 06:09:05 +0000
Date: Fri, 24 Jul 2026 14:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gourryinverse:scratch/gourry/cramtest/cram_72 332/661]
 mm/huge_memory.c:2874:35: error: call to '__compiletime_assert_612' declared
 with 'error' attribute: BUILD_BUG failed
Message-ID: <202607241350.mdgJqX1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cramtest/cram_72
head:   22cb35457d24fb35765ef124f9c74c08a5f546a9
commit: 7c4eebb3672eaa77e583b557b808ffcc78d74f5d [332/661] mm: preserve RWP marker across PTE rewrites
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-002-20260724 (https://download.01.org/0day-ci/archive/20260724/202607241350.mdgJqX1z-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241350.mdgJqX1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607241350.mdgJqX1z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:2874:35: error: call to '__compiletime_assert_612' declared with 'error' attribute: BUILD_BUG failed
    2874 |                 _dst_pmd = pmd_modify(_dst_pmd, PAGE_NONE);
         |                                                 ^
   include/linux/pgtable.h:2145:22: note: expanded from macro 'PAGE_NONE'
    2145 | #define PAGE_NONE ({ BUILD_BUG(); (pgprot_t){0}; })
         |                      ^
   include/linux/build_bug.h:60:21: note: expanded from macro 'BUILD_BUG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:157:1: note: expanded from here
     157 | __compiletime_assert_612
         | ^
   1 error generated.


vim +2874 mm/huge_memory.c

cb0f01beb16669 Peter Xu                2024-08-12  2765  
adef440691bab8 Andrea Arcangeli        2023-12-06  2766  #ifdef CONFIG_USERFAULTFD
adef440691bab8 Andrea Arcangeli        2023-12-06  2767  /*
867a43a34ff8a3 Lokesh Gidra            2024-02-15  2768   * The PT lock for src_pmd and dst_vma/src_vma (for reading) are locked by
adef440691bab8 Andrea Arcangeli        2023-12-06  2769   * the caller, but it must return after releasing the page_table_lock.
adef440691bab8 Andrea Arcangeli        2023-12-06  2770   * Just move the page from src_pmd to dst_pmd if possible.
adef440691bab8 Andrea Arcangeli        2023-12-06  2771   * Return zero if succeeded in moving the page, -EAGAIN if it needs to be
adef440691bab8 Andrea Arcangeli        2023-12-06  2772   * repeated by the caller, or other errors in case of failure.
adef440691bab8 Andrea Arcangeli        2023-12-06  2773   */
adef440691bab8 Andrea Arcangeli        2023-12-06  2774  int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pmd_t dst_pmdval,
adef440691bab8 Andrea Arcangeli        2023-12-06  2775  			struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
adef440691bab8 Andrea Arcangeli        2023-12-06  2776  			unsigned long dst_addr, unsigned long src_addr)
adef440691bab8 Andrea Arcangeli        2023-12-06  2777  {
adef440691bab8 Andrea Arcangeli        2023-12-06  2778  	pmd_t _dst_pmd, src_pmdval;
adef440691bab8 Andrea Arcangeli        2023-12-06  2779  	struct page *src_page;
adef440691bab8 Andrea Arcangeli        2023-12-06  2780  	struct folio *src_folio;
adef440691bab8 Andrea Arcangeli        2023-12-06  2781  	spinlock_t *src_ptl, *dst_ptl;
adef440691bab8 Andrea Arcangeli        2023-12-06  2782  	pgtable_t src_pgtable;
adef440691bab8 Andrea Arcangeli        2023-12-06  2783  	struct mmu_notifier_range range;
adef440691bab8 Andrea Arcangeli        2023-12-06  2784  	int err = 0;
adef440691bab8 Andrea Arcangeli        2023-12-06  2785  
adef440691bab8 Andrea Arcangeli        2023-12-06  2786  	src_pmdval = *src_pmd;
adef440691bab8 Andrea Arcangeli        2023-12-06  2787  	src_ptl = pmd_lockptr(mm, src_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2788  
adef440691bab8 Andrea Arcangeli        2023-12-06  2789  	lockdep_assert_held(src_ptl);
867a43a34ff8a3 Lokesh Gidra            2024-02-15  2790  	vma_assert_locked(src_vma);
867a43a34ff8a3 Lokesh Gidra            2024-02-15  2791  	vma_assert_locked(dst_vma);
adef440691bab8 Andrea Arcangeli        2023-12-06  2792  
adef440691bab8 Andrea Arcangeli        2023-12-06  2793  	/* Sanity checks before the operation */
adef440691bab8 Andrea Arcangeli        2023-12-06  2794  	if (WARN_ON_ONCE(!pmd_none(dst_pmdval)) || WARN_ON_ONCE(src_addr & ~HPAGE_PMD_MASK) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  2795  	    WARN_ON_ONCE(dst_addr & ~HPAGE_PMD_MASK)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2796  		spin_unlock(src_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  2797  		return -EINVAL;
adef440691bab8 Andrea Arcangeli        2023-12-06  2798  	}
adef440691bab8 Andrea Arcangeli        2023-12-06  2799  
adef440691bab8 Andrea Arcangeli        2023-12-06  2800  	if (!pmd_trans_huge(src_pmdval)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2801  		spin_unlock(src_ptl);
0ac881efe16468 Lorenzo Stoakes         2025-11-10  2802  		if (pmd_is_migration_entry(src_pmdval)) {
0a7ef0a99c1b37 Usama Arif              2026-07-05  2803  			pmd_migration_entry_wait(mm, src_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2804  			return -EAGAIN;
adef440691bab8 Andrea Arcangeli        2023-12-06  2805  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  2806  		return -ENOENT;
adef440691bab8 Andrea Arcangeli        2023-12-06  2807  	}
adef440691bab8 Andrea Arcangeli        2023-12-06  2808  
adef440691bab8 Andrea Arcangeli        2023-12-06  2809  	src_page = pmd_page(src_pmdval);
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2810  
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2811  	if (!is_huge_zero_pmd(src_pmdval)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2812  		if (unlikely(!PageAnonExclusive(src_page))) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2813  			spin_unlock(src_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  2814  			return -EBUSY;
adef440691bab8 Andrea Arcangeli        2023-12-06  2815  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  2816  
adef440691bab8 Andrea Arcangeli        2023-12-06  2817  		src_folio = page_folio(src_page);
adef440691bab8 Andrea Arcangeli        2023-12-06  2818  		folio_get(src_folio);
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2819  	} else
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2820  		src_folio = NULL;
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2821  
adef440691bab8 Andrea Arcangeli        2023-12-06  2822  	spin_unlock(src_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  2823  
adef440691bab8 Andrea Arcangeli        2023-12-06  2824  	flush_cache_range(src_vma, src_addr, src_addr + HPAGE_PMD_SIZE);
adef440691bab8 Andrea Arcangeli        2023-12-06  2825  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, src_addr,
adef440691bab8 Andrea Arcangeli        2023-12-06  2826  				src_addr + HPAGE_PMD_SIZE);
adef440691bab8 Andrea Arcangeli        2023-12-06  2827  	mmu_notifier_invalidate_range_start(&range);
adef440691bab8 Andrea Arcangeli        2023-12-06  2828  
cc22b9978509ec Lokesh Gidra            2025-09-23  2829  	if (src_folio)
adef440691bab8 Andrea Arcangeli        2023-12-06  2830  		folio_lock(src_folio);
adef440691bab8 Andrea Arcangeli        2023-12-06  2831  
adef440691bab8 Andrea Arcangeli        2023-12-06  2832  	dst_ptl = pmd_lockptr(mm, dst_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2833  	double_pt_lock(src_ptl, dst_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  2834  	if (unlikely(!pmd_same(*src_pmd, src_pmdval) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  2835  		     !pmd_same(*dst_pmd, dst_pmdval))) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2836  		err = -EAGAIN;
adef440691bab8 Andrea Arcangeli        2023-12-06  2837  		goto unlock_ptls;
adef440691bab8 Andrea Arcangeli        2023-12-06  2838  	}
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2839  	if (src_folio) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2840  		if (folio_maybe_dma_pinned(src_folio) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  2841  		    !PageAnonExclusive(&src_folio->page)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2842  			err = -EBUSY;
adef440691bab8 Andrea Arcangeli        2023-12-06  2843  			goto unlock_ptls;
adef440691bab8 Andrea Arcangeli        2023-12-06  2844  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  2845  
adef440691bab8 Andrea Arcangeli        2023-12-06  2846  		if (WARN_ON_ONCE(!folio_test_head(src_folio)) ||
adef440691bab8 Andrea Arcangeli        2023-12-06  2847  		    WARN_ON_ONCE(!folio_test_anon(src_folio))) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2848  			err = -EBUSY;
adef440691bab8 Andrea Arcangeli        2023-12-06  2849  			goto unlock_ptls;
adef440691bab8 Andrea Arcangeli        2023-12-06  2850  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  2851  
adef440691bab8 Andrea Arcangeli        2023-12-06  2852  		src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2853  		/* Folio got pinned from under us. Put it back and fail the move. */
adef440691bab8 Andrea Arcangeli        2023-12-06  2854  		if (folio_maybe_dma_pinned(src_folio)) {
adef440691bab8 Andrea Arcangeli        2023-12-06  2855  			set_pmd_at(mm, src_addr, src_pmd, src_pmdval);
adef440691bab8 Andrea Arcangeli        2023-12-06  2856  			err = -EBUSY;
adef440691bab8 Andrea Arcangeli        2023-12-06  2857  			goto unlock_ptls;
adef440691bab8 Andrea Arcangeli        2023-12-06  2858  		}
adef440691bab8 Andrea Arcangeli        2023-12-06  2859  
c0205eaf3af9f5 Lokesh Gidra            2024-04-04  2860  		folio_move_anon_rmap(src_folio, dst_vma);
b5ba3a64279355 Suren Baghdasaryan      2024-04-14  2861  		src_folio->index = linear_page_index(dst_vma, dst_addr);
c0205eaf3af9f5 Lokesh Gidra            2024-04-04  2862  
e3981db444a0a1 Matthew Wilcox (Oracle  2025-04-02  2863) 		_dst_pmd = folio_mk_pmd(src_folio, dst_vma->vm_page_prot);
adef440691bab8 Andrea Arcangeli        2023-12-06  2864  		/* Follow mremap() behavior and treat the entry dirty after the move */
adef440691bab8 Andrea Arcangeli        2023-12-06  2865  		_dst_pmd = pmd_mkwrite(pmd_mkdirty(_dst_pmd), dst_vma);
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2866  	} else {
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2867  		src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
fae654083bfa40 Chris Down              2026-03-03  2868  		_dst_pmd = move_soft_dirty_pmd(src_pmdval);
fae654083bfa40 Chris Down              2026-03-03  2869  		_dst_pmd = clear_uffd_wp_pmd(_dst_pmd);
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2870  	}
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2871) 
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2872) 	/* Re-arm RWP on the moved PMD if dst_vma is RWP-registered. */
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2873) 	if (userfaultfd_rwp(dst_vma)) {
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08 @2874) 		_dst_pmd = pmd_modify(_dst_pmd, PAGE_NONE);
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2875) 		_dst_pmd = pmd_mkuffd(_dst_pmd);
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2876) 	}
7c4eebb3672eaa Kiryl Shutsemau (Meta   2026-07-08  2877) 
adef440691bab8 Andrea Arcangeli        2023-12-06  2878  	set_pmd_at(mm, dst_addr, dst_pmd, _dst_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2879  
adef440691bab8 Andrea Arcangeli        2023-12-06  2880  	src_pgtable = pgtable_trans_huge_withdraw(mm, src_pmd);
adef440691bab8 Andrea Arcangeli        2023-12-06  2881  	pgtable_trans_huge_deposit(mm, dst_pmd, src_pgtable);
adef440691bab8 Andrea Arcangeli        2023-12-06  2882  unlock_ptls:
adef440691bab8 Andrea Arcangeli        2023-12-06  2883  	double_pt_unlock(src_ptl, dst_ptl);
adef440691bab8 Andrea Arcangeli        2023-12-06  2884  	/* unblock rmap walks */
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2885  	if (src_folio)
adef440691bab8 Andrea Arcangeli        2023-12-06  2886  		folio_unlock(src_folio);
adef440691bab8 Andrea Arcangeli        2023-12-06  2887  	mmu_notifier_invalidate_range_end(&range);
eb1521dad8f391 Suren Baghdasaryan      2024-01-31  2888  	if (src_folio)
adef440691bab8 Andrea Arcangeli        2023-12-06  2889  		folio_put(src_folio);
adef440691bab8 Andrea Arcangeli        2023-12-06  2890  	return err;
adef440691bab8 Andrea Arcangeli        2023-12-06  2891  }
adef440691bab8 Andrea Arcangeli        2023-12-06  2892  #endif /* CONFIG_USERFAULTFD */
adef440691bab8 Andrea Arcangeli        2023-12-06  2893  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
