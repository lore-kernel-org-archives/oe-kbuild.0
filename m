Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F417DE2D
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jan 2025 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853364; cv=none; b=OG4OaxYEOJoWt4EgNgQQCHO8vkGm26E0Gtwc22fsk2duAKJt5xCv6te7r+pHfI9flI2QhjpocxHzLhlLUs6/P+Q9vGkCrQNnkjdWIyzSrwk0uk5BXoikmlMYUBpZn8UntMBeFOhrmRlvJ5LvGOKhZ+11lcoQzPnIZq9BgL3GU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853364; c=relaxed/simple;
	bh=NLVv+9mniQ1QIP3rNmNq0i2n3S3ZkwC+Zoffr1zwkA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPoEO/2j7GYUsBM8Q0P02NWa/tyLyJhQjlQfgRu/NzCk+m2QEyHsFMm/QLHTzZDsN8goIJDHEPrRoaRrrM3+fjf8DpqOf0obBLaV3A0pw3STAttkbgv8ggBIGRp5hvnOZ0Qk4yFTA7fGFujPoVgRdV42Q23+DtgE5w+lGudYJHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVALT0vD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVALT0vD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735853362; x=1767389362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLVv+9mniQ1QIP3rNmNq0i2n3S3ZkwC+Zoffr1zwkA0=;
  b=UVALT0vD6v4n81uNFfWKVhvH0NKZ027xGOLgOWkCo0qesqcF7qia+Ke7
   QHkvMQK3PoSL/c0q4I5QxIyMGGqbbAIk3XGY+Kow/ngGz+MHsL28nxWfm
   f//Zhg2lVLdad8Od7g8r3KEj7RmKwD8irFmkLEHfZgNxVd7EcftyMpcOC
   xPgdyWLrrJj6NJtNd7kDtn8F4mcWP45Loo58noQxYpQHjvkcnJM6fQorO
   qDrJ5g5S9/Ux6dnnujvtSfiUWlr9y4L6lte6ZR4tIOr7DCq6IvofdF2DS
   Anl7D4HdK2HYNfl7i5/qUGmS93Gvq8mWpQ7nXfDMJnTNR7ITmSoqlNS1T
   A==;
X-CSE-ConnectionGUID: gtnCClhjSW+DHBPmkZ/mKg==
X-CSE-MsgGUID: v4+u9e0mQLiSIclnduWtFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35983114"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35983114"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 13:29:22 -0800
X-CSE-ConnectionGUID: H2qtNs9BQ3q87ahUkZyigg==
X-CSE-MsgGUID: W1nHqbK1TlS1/QeDtztKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102081840"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2025 13:29:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTSko-0008st-1p;
	Thu, 02 Jan 2025 21:29:18 +0000
Date: Fri, 3 Jan 2025 05:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH mm-unstable v4 7/7] mm/mglru: fix PTE-mapped large folios
Message-ID: <202501030543.uiCCyZDb-lkp@intel.com>
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
In-Reply-To: <20241231043538.4075764-8-yuzhao@google.com>
References: <20241231043538.4075764-8-yuzhao@google.com>
TO: Yu Zhao <yuzhao@google.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: Yu Zhao <yuzhao@google.com>
CC: Barry Song <v-songbaohua@oppo.com>
CC: Kalesh Singh <kaleshsingh@google.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.13-rc5]
[also build test WARNING on linus/master]
[cannot apply to akpm-mm/mm-everything next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-mglru-clean-up-workingset/20241231-123817
base:   v6.13-rc5
patch link:    https://lore.kernel.org/r/20241231043538.4075764-8-yuzhao%40google.com
patch subject: [PATCH mm-unstable v4 7/7] mm/mglru: fix PTE-mapped large folios
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r071-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030543.uiCCyZDb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501030543.uiCCyZDb-lkp@intel.com/

New smatch warnings:
mm/vmscan.c:3497 walk_pte_range() error: uninitialized symbol 'dirty'.
mm/vmscan.c:3602 walk_pmd_range_locked() error: uninitialized symbol 'dirty'.
mm/vmscan.c:4208 lru_gen_look_around() error: uninitialized symbol 'dirty'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/dirty +3497 mm/vmscan.c

4696bbc0fae193 Yu Zhao        2024-12-30  3442  
bd74fdaea14602 Yu Zhao        2022-09-18  3443  static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
bd74fdaea14602 Yu Zhao        2022-09-18  3444  			   struct mm_walk *args)
bd74fdaea14602 Yu Zhao        2022-09-18  3445  {
bd74fdaea14602 Yu Zhao        2022-09-18  3446  	int i;
4696bbc0fae193 Yu Zhao        2024-12-30  3447  	bool dirty;
bd74fdaea14602 Yu Zhao        2022-09-18  3448  	pte_t *pte;
bd74fdaea14602 Yu Zhao        2022-09-18  3449  	spinlock_t *ptl;
bd74fdaea14602 Yu Zhao        2022-09-18  3450  	unsigned long addr;
bd74fdaea14602 Yu Zhao        2022-09-18  3451  	int total = 0;
bd74fdaea14602 Yu Zhao        2022-09-18  3452  	int young = 0;
4696bbc0fae193 Yu Zhao        2024-12-30  3453  	struct folio *last = NULL;
bd74fdaea14602 Yu Zhao        2022-09-18  3454  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea14602 Yu Zhao        2022-09-18  3455  	struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
bd74fdaea14602 Yu Zhao        2022-09-18  3456  	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
cc25bbe10a86a7 Kinsey Ho      2024-02-14  3457  	DEFINE_MAX_SEQ(walk->lruvec);
4696bbc0fae193 Yu Zhao        2024-12-30  3458  	int gen = lru_gen_from_seq(max_seq);
2441774f2d2890 Qi Zheng       2024-09-26  3459  	pmd_t pmdval;
bd74fdaea14602 Yu Zhao        2022-09-18  3460  
4696bbc0fae193 Yu Zhao        2024-12-30  3461  	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval, &ptl);
52fc048320adf1 Hugh Dickins   2023-06-08  3462  	if (!pte)
52fc048320adf1 Hugh Dickins   2023-06-08  3463  		return false;
4696bbc0fae193 Yu Zhao        2024-12-30  3464  
52fc048320adf1 Hugh Dickins   2023-06-08  3465  	if (!spin_trylock(ptl)) {
52fc048320adf1 Hugh Dickins   2023-06-08  3466  		pte_unmap(pte);
4696bbc0fae193 Yu Zhao        2024-12-30  3467  		return true;
52fc048320adf1 Hugh Dickins   2023-06-08  3468  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3469  
2441774f2d2890 Qi Zheng       2024-09-26  3470  	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
2441774f2d2890 Qi Zheng       2024-09-26  3471  		pte_unmap_unlock(pte, ptl);
2441774f2d2890 Qi Zheng       2024-09-26  3472  		return false;
2441774f2d2890 Qi Zheng       2024-09-26  3473  	}
2441774f2d2890 Qi Zheng       2024-09-26  3474  
bd74fdaea14602 Yu Zhao        2022-09-18  3475  	arch_enter_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3476  restart:
bd74fdaea14602 Yu Zhao        2022-09-18  3477  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
bd74fdaea14602 Yu Zhao        2022-09-18  3478  		unsigned long pfn;
bd74fdaea14602 Yu Zhao        2022-09-18  3479  		struct folio *folio;
c33c794828f212 Ryan Roberts   2023-06-12  3480  		pte_t ptent = ptep_get(pte + i);
bd74fdaea14602 Yu Zhao        2022-09-18  3481  
bd74fdaea14602 Yu Zhao        2022-09-18  3482  		total++;
bd74fdaea14602 Yu Zhao        2022-09-18  3483  		walk->mm_stats[MM_LEAF_TOTAL]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3484  
1d4832becdc2cd Yu Zhao        2024-10-19  3485  		pfn = get_pte_pfn(ptent, args->vma, addr, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3486  		if (pfn == -1)
bd74fdaea14602 Yu Zhao        2022-09-18  3487  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3488  
2ee51957f63133 Yu Zhao        2024-12-30  3489  		folio = get_pfn_folio(pfn, memcg, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3490  		if (!folio)
bd74fdaea14602 Yu Zhao        2022-09-18  3491  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3492  
1d4832becdc2cd Yu Zhao        2024-10-19  3493  		if (!ptep_clear_young_notify(args->vma, addr, pte + i))
1d4832becdc2cd Yu Zhao        2024-10-19  3494  			continue;
bd74fdaea14602 Yu Zhao        2022-09-18  3495  
4696bbc0fae193 Yu Zhao        2024-12-30  3496  		if (last != folio) {
4696bbc0fae193 Yu Zhao        2024-12-30 @3497  			walk_update_folio(walk, last, gen, dirty);
bd74fdaea14602 Yu Zhao        2022-09-18  3498  
4696bbc0fae193 Yu Zhao        2024-12-30  3499  			last = folio;
4696bbc0fae193 Yu Zhao        2024-12-30  3500  			dirty = false;
4696bbc0fae193 Yu Zhao        2024-12-30  3501  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3502  
4696bbc0fae193 Yu Zhao        2024-12-30  3503  		if (pte_dirty(ptent))
4696bbc0fae193 Yu Zhao        2024-12-30  3504  			dirty = true;
4696bbc0fae193 Yu Zhao        2024-12-30  3505  
4696bbc0fae193 Yu Zhao        2024-12-30  3506  		young++;
4696bbc0fae193 Yu Zhao        2024-12-30  3507  		walk->mm_stats[MM_LEAF_YOUNG]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3508  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3509  
4696bbc0fae193 Yu Zhao        2024-12-30  3510  	walk_update_folio(walk, last, gen, dirty);
4696bbc0fae193 Yu Zhao        2024-12-30  3511  	last = NULL;
4696bbc0fae193 Yu Zhao        2024-12-30  3512  
bd74fdaea14602 Yu Zhao        2022-09-18  3513  	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
bd74fdaea14602 Yu Zhao        2022-09-18  3514  		goto restart;
bd74fdaea14602 Yu Zhao        2022-09-18  3515  
bd74fdaea14602 Yu Zhao        2022-09-18  3516  	arch_leave_lazy_mmu_mode();
52fc048320adf1 Hugh Dickins   2023-06-08  3517  	pte_unmap_unlock(pte, ptl);
bd74fdaea14602 Yu Zhao        2022-09-18  3518  
bd74fdaea14602 Yu Zhao        2022-09-18  3519  	return suitable_to_scan(total, young);
bd74fdaea14602 Yu Zhao        2022-09-18  3520  }
bd74fdaea14602 Yu Zhao        2022-09-18  3521  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3522  static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3523  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
bd74fdaea14602 Yu Zhao        2022-09-18  3524  {
bd74fdaea14602 Yu Zhao        2022-09-18  3525  	int i;
4696bbc0fae193 Yu Zhao        2024-12-30  3526  	bool dirty;
bd74fdaea14602 Yu Zhao        2022-09-18  3527  	pmd_t *pmd;
bd74fdaea14602 Yu Zhao        2022-09-18  3528  	spinlock_t *ptl;
4696bbc0fae193 Yu Zhao        2024-12-30  3529  	struct folio *last = NULL;
bd74fdaea14602 Yu Zhao        2022-09-18  3530  	struct lru_gen_mm_walk *walk = args->private;
bd74fdaea14602 Yu Zhao        2022-09-18  3531  	struct mem_cgroup *memcg = lruvec_memcg(walk->lruvec);
bd74fdaea14602 Yu Zhao        2022-09-18  3532  	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
cc25bbe10a86a7 Kinsey Ho      2024-02-14  3533  	DEFINE_MAX_SEQ(walk->lruvec);
4696bbc0fae193 Yu Zhao        2024-12-30  3534  	int gen = lru_gen_from_seq(max_seq);
bd74fdaea14602 Yu Zhao        2022-09-18  3535  
bd74fdaea14602 Yu Zhao        2022-09-18  3536  	VM_WARN_ON_ONCE(pud_leaf(*pud));
bd74fdaea14602 Yu Zhao        2022-09-18  3537  
bd74fdaea14602 Yu Zhao        2022-09-18  3538  	/* try to batch at most 1+MIN_LRU_BATCH+1 entries */
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3539  	if (*first == -1) {
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3540  		*first = addr;
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3541  		bitmap_zero(bitmap, MIN_LRU_BATCH);
bd74fdaea14602 Yu Zhao        2022-09-18  3542  		return;
bd74fdaea14602 Yu Zhao        2022-09-18  3543  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3544  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3545  	i = addr == -1 ? 0 : pmd_index(addr) - pmd_index(*first);
bd74fdaea14602 Yu Zhao        2022-09-18  3546  	if (i && i <= MIN_LRU_BATCH) {
bd74fdaea14602 Yu Zhao        2022-09-18  3547  		__set_bit(i - 1, bitmap);
bd74fdaea14602 Yu Zhao        2022-09-18  3548  		return;
bd74fdaea14602 Yu Zhao        2022-09-18  3549  	}
bd74fdaea14602 Yu Zhao        2022-09-18  3550  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3551  	pmd = pmd_offset(pud, *first);
bd74fdaea14602 Yu Zhao        2022-09-18  3552  
bd74fdaea14602 Yu Zhao        2022-09-18  3553  	ptl = pmd_lockptr(args->mm, pmd);
bd74fdaea14602 Yu Zhao        2022-09-18  3554  	if (!spin_trylock(ptl))
bd74fdaea14602 Yu Zhao        2022-09-18  3555  		goto done;
bd74fdaea14602 Yu Zhao        2022-09-18  3556  
bd74fdaea14602 Yu Zhao        2022-09-18  3557  	arch_enter_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3558  
bd74fdaea14602 Yu Zhao        2022-09-18  3559  	do {
bd74fdaea14602 Yu Zhao        2022-09-18  3560  		unsigned long pfn;
bd74fdaea14602 Yu Zhao        2022-09-18  3561  		struct folio *folio;
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3562  
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3563  		/* don't round down the first address */
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3564  		addr = i ? (*first & PMD_MASK) + i * PMD_SIZE : *first;
bd74fdaea14602 Yu Zhao        2022-09-18  3565  
1d4832becdc2cd Yu Zhao        2024-10-19  3566  		if (!pmd_present(pmd[i]))
bd74fdaea14602 Yu Zhao        2022-09-18  3567  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3568  
bd74fdaea14602 Yu Zhao        2022-09-18  3569  		if (!pmd_trans_huge(pmd[i])) {
1d4832becdc2cd Yu Zhao        2024-10-19  3570  			if (!walk->force_scan && should_clear_pmd_young() &&
1d4832becdc2cd Yu Zhao        2024-10-19  3571  			    !mm_has_notifiers(args->mm))
bd74fdaea14602 Yu Zhao        2022-09-18  3572  				pmdp_test_and_clear_young(vma, addr, pmd + i);
bd74fdaea14602 Yu Zhao        2022-09-18  3573  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3574  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3575  
1d4832becdc2cd Yu Zhao        2024-10-19  3576  		pfn = get_pmd_pfn(pmd[i], vma, addr, pgdat);
1d4832becdc2cd Yu Zhao        2024-10-19  3577  		if (pfn == -1)
1d4832becdc2cd Yu Zhao        2024-10-19  3578  			goto next;
1d4832becdc2cd Yu Zhao        2024-10-19  3579  
2ee51957f63133 Yu Zhao        2024-12-30  3580  		folio = get_pfn_folio(pfn, memcg, pgdat);
bd74fdaea14602 Yu Zhao        2022-09-18  3581  		if (!folio)
bd74fdaea14602 Yu Zhao        2022-09-18  3582  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3583  
1d4832becdc2cd Yu Zhao        2024-10-19  3584  		if (!pmdp_clear_young_notify(vma, addr, pmd + i))
bd74fdaea14602 Yu Zhao        2022-09-18  3585  			goto next;
bd74fdaea14602 Yu Zhao        2022-09-18  3586  
4696bbc0fae193 Yu Zhao        2024-12-30  3587  		if (last != folio) {
4696bbc0fae193 Yu Zhao        2024-12-30  3588  			walk_update_folio(walk, last, gen, dirty);
bd74fdaea14602 Yu Zhao        2022-09-18  3589  
4696bbc0fae193 Yu Zhao        2024-12-30  3590  			last = folio;
4696bbc0fae193 Yu Zhao        2024-12-30  3591  			dirty = false;
4696bbc0fae193 Yu Zhao        2024-12-30  3592  		}
bd74fdaea14602 Yu Zhao        2022-09-18  3593  
4696bbc0fae193 Yu Zhao        2024-12-30  3594  		if (pmd_dirty(pmd[i]))
4696bbc0fae193 Yu Zhao        2024-12-30  3595  			dirty = true;
4696bbc0fae193 Yu Zhao        2024-12-30  3596  
4696bbc0fae193 Yu Zhao        2024-12-30  3597  		walk->mm_stats[MM_LEAF_YOUNG]++;
bd74fdaea14602 Yu Zhao        2022-09-18  3598  next:
bd74fdaea14602 Yu Zhao        2022-09-18  3599  		i = i > MIN_LRU_BATCH ? 0 : find_next_bit(bitmap, MIN_LRU_BATCH, i) + 1;
bd74fdaea14602 Yu Zhao        2022-09-18  3600  	} while (i <= MIN_LRU_BATCH);
bd74fdaea14602 Yu Zhao        2022-09-18  3601  
4696bbc0fae193 Yu Zhao        2024-12-30 @3602  	walk_update_folio(walk, last, gen, dirty);
4696bbc0fae193 Yu Zhao        2024-12-30  3603  
bd74fdaea14602 Yu Zhao        2022-09-18  3604  	arch_leave_lazy_mmu_mode();
bd74fdaea14602 Yu Zhao        2022-09-18  3605  	spin_unlock(ptl);
bd74fdaea14602 Yu Zhao        2022-09-18  3606  done:
b5ff4133617d0e T.J. Alumbaugh 2023-01-18  3607  	*first = -1;
bd74fdaea14602 Yu Zhao        2022-09-18  3608  }
bd74fdaea14602 Yu Zhao        2022-09-18  3609  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
