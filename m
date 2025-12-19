Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE00F1C3C1F
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766117210; cv=none; b=s5BhAeAKlomLy/D+jvqpDTurFRNj4O7kRKkl6owCqK4yi+L08paN2PQutI/Sm/t78TmBotXsoaPDUajJPhltNacrKKqsiF4+eh8R0sSLyIhwWfbJ7lCrnFf3E0PF6JfCFJgBuZ6YqXOCH6lC4xH9g5h0zOgbqjuAM1+YyoC2qbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766117210; c=relaxed/simple;
	bh=BIjRKi5OoaFKOI8aLwKPmdci2ODPORAh0AgZAoGptnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxnCCD5Q7TzoGj28pV+mjve2ZInb9ZgvDlpEANy9ItbSka9cCJui3F8jlqCpmpggHYTApIeGGhO3TUPONP6XgP1s4zFfo9yjP9amBKqv5fIN3BZRk6uacSYjL2itx+wJ9KZT1MIJIe2lrhQELBDX9CnxDByYciOB6NsQiA4B1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebBdtOzD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebBdtOzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766117209; x=1797653209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BIjRKi5OoaFKOI8aLwKPmdci2ODPORAh0AgZAoGptnM=;
  b=ebBdtOzDVR4zqB6ysPqgz6NGJ/CayRQteVR7FIcSzD9ZTf3ScsrTODsX
   dJihoOcnyGKXczmfiHRpFbW0rrRAuBfIaS+6PTYqhbUL+x5h00FWiVb4g
   EDB0j8JGn0pCGV6ldlj0EAS7pMmynJdkQJHBHF5Dwa8gwb62pxRV/KHIA
   BxnBYwPnm3UFqFNKwJJ18y/7OM0CTVAa34dgtKmg6vZtWWAcY3UBTbRNR
   lUM4LmXDo5jqwa11D+m914nTUmFBB9Lu2zTXOx3qmufOkfBJAlOzlu3gm
   n0AiBhMfxWDMa1MWnBLVd5UxKsnkTjNVt5IoC+JKzhMKrHEPFn7hq+K65
   A==;
X-CSE-ConnectionGUID: jUc0fpNhQ62sbp5TfYt9Kg==
X-CSE-MsgGUID: iNF23TcmQnWOJBM7nqbNig==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79537448"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79537448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:06:49 -0800
X-CSE-ConnectionGUID: MS1qlQNiRNSEqm8Z77JVsQ==
X-CSE-MsgGUID: oCci187zRSmJJiQct1RQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203273467"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2025 20:06:47 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWRlM-000000002yN-35ge;
	Fri, 19 Dec 2025 04:06:44 +0000
Date: Fri, 19 Dec 2025 12:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 114/119] mm/memory.c:1904 zap_pte_range() error:
 uninitialized symbol 'pmdval'.
Message-ID: <202512191251.NTsumcZE-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Qi Zheng <zhengqi.arch@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   67a1f192fe6d4c1ee84e296e7d518bb881d03c94
commit: fedd010fe36837d4b0ebc7db5e57e6cb7fb3a433 [114/119] mm: make PT_RECLAIM depends on MMU_GATHER_RCU_TABLE_FREE
:::::: branch date: 3 hours ago
:::::: commit date: 29 hours ago
config: s390-randconfig-r073-20251218 (https://download.01.org/0day-ci/archive/20251219/202512191251.NTsumcZE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191251.NTsumcZE-lkp@intel.com/

smatch warnings:
mm/memory.c:1904 zap_pte_range() error: uninitialized symbol 'pmdval'.

vim +/pmdval +1904 mm/memory.c

117cdb05e32dc6 Qi Zheng          2024-12-04  1819  
fabc0e8dac5bad Qi Zheng          2024-12-04  1820  static unsigned long zap_pte_range(struct mmu_gather *tlb,
fabc0e8dac5bad Qi Zheng          2024-12-04  1821  				struct vm_area_struct *vma, pmd_t *pmd,
fabc0e8dac5bad Qi Zheng          2024-12-04  1822  				unsigned long addr, unsigned long end,
fabc0e8dac5bad Qi Zheng          2024-12-04  1823  				struct zap_details *details)
fabc0e8dac5bad Qi Zheng          2024-12-04  1824  {
fabc0e8dac5bad Qi Zheng          2024-12-04  1825  	bool force_flush = false, force_break = false;
fabc0e8dac5bad Qi Zheng          2024-12-04  1826  	struct mm_struct *mm = tlb->mm;
fabc0e8dac5bad Qi Zheng          2024-12-04  1827  	int rss[NR_MM_COUNTERS];
fabc0e8dac5bad Qi Zheng          2024-12-04  1828  	spinlock_t *ptl;
fabc0e8dac5bad Qi Zheng          2024-12-04  1829  	pte_t *start_pte;
fabc0e8dac5bad Qi Zheng          2024-12-04  1830  	pte_t *pte;
6375e95f381e3d Qi Zheng          2024-12-04  1831  	pmd_t pmdval;
6375e95f381e3d Qi Zheng          2024-12-04  1832  	unsigned long start = addr;
6375e95f381e3d Qi Zheng          2024-12-04  1833  	bool can_reclaim_pt = reclaim_pt_is_enabled(start, end, details);
f39edcf6349abb Qi Zheng          2025-02-11  1834  	bool direct_reclaim = true;
fabc0e8dac5bad Qi Zheng          2024-12-04  1835  	int nr;
fabc0e8dac5bad Qi Zheng          2024-12-04  1836  
2686d514c34524 Qi Zheng          2024-12-04  1837  retry:
fabc0e8dac5bad Qi Zheng          2024-12-04  1838  	tlb_change_page_size(tlb, PAGE_SIZE);
fabc0e8dac5bad Qi Zheng          2024-12-04  1839  	init_rss_vec(rss);
fabc0e8dac5bad Qi Zheng          2024-12-04  1840  	start_pte = pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
fabc0e8dac5bad Qi Zheng          2024-12-04  1841  	if (!pte)
fabc0e8dac5bad Qi Zheng          2024-12-04  1842  		return addr;
fabc0e8dac5bad Qi Zheng          2024-12-04  1843  
fabc0e8dac5bad Qi Zheng          2024-12-04  1844  	flush_tlb_batched_pending(mm);
15d6aa0452681b Kevin Brodsky     2025-12-15  1845  	lazy_mmu_mode_enable();
fabc0e8dac5bad Qi Zheng          2024-12-04  1846  	do {
6375e95f381e3d Qi Zheng          2024-12-04  1847  		bool any_skipped = false;
6375e95f381e3d Qi Zheng          2024-12-04  1848  
f39edcf6349abb Qi Zheng          2025-02-11  1849  		if (need_resched()) {
f39edcf6349abb Qi Zheng          2025-02-11  1850  			direct_reclaim = false;
fabc0e8dac5bad Qi Zheng          2024-12-04  1851  			break;
f39edcf6349abb Qi Zheng          2025-02-11  1852  		}
fabc0e8dac5bad Qi Zheng          2024-12-04  1853  
117cdb05e32dc6 Qi Zheng          2024-12-04  1854  		nr = do_zap_pte_range(tlb, vma, pte, addr, end, details, rss,
4059971c79fc47 Qi Zheng          2024-12-04  1855  				      &force_flush, &force_break, &any_skipped);
6375e95f381e3d Qi Zheng          2024-12-04  1856  		if (any_skipped)
6375e95f381e3d Qi Zheng          2024-12-04  1857  			can_reclaim_pt = false;
fabc0e8dac5bad Qi Zheng          2024-12-04  1858  		if (unlikely(force_break)) {
fabc0e8dac5bad Qi Zheng          2024-12-04  1859  			addr += nr * PAGE_SIZE;
f39edcf6349abb Qi Zheng          2025-02-11  1860  			direct_reclaim = false;
fabc0e8dac5bad Qi Zheng          2024-12-04  1861  			break;
fabc0e8dac5bad Qi Zheng          2024-12-04  1862  		}
10ebac4f95e7a9 David Hildenbrand 2024-02-14  1863  	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
ae859762332f19 Hugh Dickins      2005-10-29  1864  
f39edcf6349abb Qi Zheng          2025-02-11  1865  	/*
f39edcf6349abb Qi Zheng          2025-02-11  1866  	 * Fast path: try to hold the pmd lock and unmap the PTE page.
f39edcf6349abb Qi Zheng          2025-02-11  1867  	 *
f39edcf6349abb Qi Zheng          2025-02-11  1868  	 * If the pte lock was released midway (retry case), or if the attempt
f39edcf6349abb Qi Zheng          2025-02-11  1869  	 * to hold the pmd lock failed, then we need to recheck all pte entries
f39edcf6349abb Qi Zheng          2025-02-11  1870  	 * to ensure they are still none, thereby preventing the pte entries
f39edcf6349abb Qi Zheng          2025-02-11  1871  	 * from being repopulated by another thread.
f39edcf6349abb Qi Zheng          2025-02-11  1872  	 */
f39edcf6349abb Qi Zheng          2025-02-11  1873  	if (can_reclaim_pt && direct_reclaim && addr == end)
6375e95f381e3d Qi Zheng          2024-12-04  1874  		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
6375e95f381e3d Qi Zheng          2024-12-04  1875  
d559db086ff5be KAMEZAWA Hiroyuki 2010-03-05  1876  	add_mm_rss_vec(mm, rss);
15d6aa0452681b Kevin Brodsky     2025-12-15  1877  	lazy_mmu_mode_disable();
51c6f666fceb31 Robin Holt        2005-11-13  1878  
1cf35d47712dd5 Linus Torvalds    2014-04-25  1879  	/* Do the actual TLB flush before dropping ptl */
5df397dec7c4c0 Linus Torvalds    2022-11-09  1880  	if (force_flush) {
1cf35d47712dd5 Linus Torvalds    2014-04-25  1881  		tlb_flush_mmu_tlbonly(tlb);
5df397dec7c4c0 Linus Torvalds    2022-11-09  1882  		tlb_flush_rmaps(tlb, vma);
5df397dec7c4c0 Linus Torvalds    2022-11-09  1883  	}
1cf35d47712dd5 Linus Torvalds    2014-04-25  1884  	pte_unmap_unlock(start_pte, ptl);
1cf35d47712dd5 Linus Torvalds    2014-04-25  1885  
1cf35d47712dd5 Linus Torvalds    2014-04-25  1886  	/*
1cf35d47712dd5 Linus Torvalds    2014-04-25  1887  	 * If we forced a TLB flush (either due to running out of
1cf35d47712dd5 Linus Torvalds    2014-04-25  1888  	 * batch buffers or because we needed to flush dirty TLB
1cf35d47712dd5 Linus Torvalds    2014-04-25  1889  	 * entries before releasing the ptl), free the batched
3db82b9374ca92 Hugh Dickins      2023-06-08  1890  	 * memory too. Come back again if we didn't do everything.
1cf35d47712dd5 Linus Torvalds    2014-04-25  1891  	 */
3db82b9374ca92 Hugh Dickins      2023-06-08  1892  	if (force_flush)
fa0aafb8acb684 Peter Zijlstra    2018-09-20  1893  		tlb_flush_mmu(tlb);
d16dfc550f5326 Peter Zijlstra    2011-05-24  1894  
2686d514c34524 Qi Zheng          2024-12-04  1895  	if (addr != end) {
2686d514c34524 Qi Zheng          2024-12-04  1896  		cond_resched();
2686d514c34524 Qi Zheng          2024-12-04  1897  		force_flush = false;
2686d514c34524 Qi Zheng          2024-12-04  1898  		force_break = false;
2686d514c34524 Qi Zheng          2024-12-04  1899  		goto retry;
2686d514c34524 Qi Zheng          2024-12-04  1900  	}
2686d514c34524 Qi Zheng          2024-12-04  1901  
6375e95f381e3d Qi Zheng          2024-12-04  1902  	if (can_reclaim_pt) {
6375e95f381e3d Qi Zheng          2024-12-04  1903  		if (direct_reclaim)
6375e95f381e3d Qi Zheng          2024-12-04 @1904  			free_pte(mm, start, tlb, pmdval);
6375e95f381e3d Qi Zheng          2024-12-04  1905  		else
6375e95f381e3d Qi Zheng          2024-12-04  1906  			try_to_free_pte(mm, pmd, start, tlb);
6375e95f381e3d Qi Zheng          2024-12-04  1907  	}
6375e95f381e3d Qi Zheng          2024-12-04  1908  
51c6f666fceb31 Robin Holt        2005-11-13  1909  	return addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1910  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1911  

:::::: The code at line 1904 was first introduced by commit
:::::: 6375e95f381e3dc85065b6f74263a61522736203 mm: pgtable: reclaim empty PTE page in madvise(MADV_DONTNEED)

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
