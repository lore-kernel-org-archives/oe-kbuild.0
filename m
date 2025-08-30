Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ED51DDA18
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756544272; cv=none; b=NyW4bKi2evwXosUrN1JnIDl2RR2EByZWCXx/Q+TB2eTdmEY/g+aFEVfiKpImZb4fwVM+HThMQoRC5wrmqqtS7U6PM8wGakOPIhvpiTYXC53UQwGg7wx8UMJ28xO+NSxy8fhWNalZvNjM5NVWekRsEJZwcK9wgSVrYrnNUPycCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756544272; c=relaxed/simple;
	bh=HTlVxe0izERCJVhnjJF/OnkTM7x/aavLCdsEVdADEh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkaifjTN00QYZbRdsSAapiPISp4sFA6gFdJoX/XVc6ZWxDowyV7e0Pg9LIfTcmNwaOyDW7/yqHwVc1JYArdDB3stoWWh2ELD94FUVVx6A4QvLnxidSwOOd7aKEUTEyU3poh3muvDTebuNzecQu0HMp/QfrgRkF+FW+TlknLtYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFEvpQnz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFEvpQnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756544269; x=1788080269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTlVxe0izERCJVhnjJF/OnkTM7x/aavLCdsEVdADEh0=;
  b=HFEvpQnzog7s2IpjMXm1rWLEG9jIACawxjDaVvKdjDblGXKGp5bIMOC7
   HfO/QflfT3TxPhpHWFkTBiE/Fd8juYA7wPCnsMv85d/gSAn5bEMhpgyMS
   SYsrwSa/QAER6zvrpYKZBvbY1jXr4QdBgX4Gchean0I5BnjZjrMPk358u
   sO/biJ3+A7hK0L004vDaOkjZbZpiflIvCJ09sx4tK39f7JlgijCxL6fQS
   MVNOteaInSjBihMj4SiAEtcKBcZRxs8P4KQ/WcnBJDTrpaL+WNtl1f8bq
   6vcupCzHIfGRtDqgdH2q3VeJLkDb6bO+WtSc86rAphKVPyA/oiRZvixtU
   A==;
X-CSE-ConnectionGUID: sB0l9nexRRqZJgCnnI2Aaw==
X-CSE-MsgGUID: K3AcBUN5T2O9P9CyJUZf9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58751868"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58751868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 01:57:47 -0700
X-CSE-ConnectionGUID: dp9+6dSnR9+UMZElJC1OeA==
X-CSE-MsgGUID: VlXmjoCURliBpW++TnR1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="174908767"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Aug 2025 01:57:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usHOf-000VGt-0A;
	Sat, 30 Aug 2025 08:57:28 +0000
Date: Sat, 30 Aug 2025 16:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [daveh-devel:kpte 2/6] include/asm-generic/pgalloc.h:235
 __p4d_alloc_one_noprof() error: uninitialized symbol 'ptdesc'.
Message-ID: <202508301620.pDFlQMRB-lkp@intel.com>
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
TO: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kpte
head:   d5eaa925a3150c716e8ec564c51069fbdd303fbc
commit: ccbd04de39826d130b67374e68599e128b53acab [2/6] mm: Actually mark kernel page table pages
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250829 (https://download.01.org/0day-ci/archive/20250830/202508301620.pDFlQMRB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301620.pDFlQMRB-lkp@intel.com/

smatch warnings:
include/asm-generic/pgalloc.h:235 __p4d_alloc_one_noprof() error: uninitialized symbol 'ptdesc'.
include/asm-generic/pgalloc.h:179 __pud_alloc_one_noprof() error: uninitialized symbol 'ptdesc'.
include/asm-generic/pgalloc.h:144 pmd_alloc_one_noprof() error: uninitialized symbol 'ptdesc'.

vim +/ptdesc +235 include/asm-generic/pgalloc.h

1355c31eeb7ea6 Mike Rapoport         2020-08-06  124  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  125  #ifndef __HAVE_ARCH_PMD_ALLOC_ONE
1355c31eeb7ea6 Mike Rapoport         2020-08-06  126  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  127)  * pmd_alloc_one - allocate memory for a PMD-level page table
1355c31eeb7ea6 Mike Rapoport         2020-08-06  128   * @mm: the mm_struct of the current context
1355c31eeb7ea6 Mike Rapoport         2020-08-06  129   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  130)  * Allocate memory for a page table and ptdesc and runs pagetable_pmd_ctor().
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  131)  *
1355c31eeb7ea6 Mike Rapoport         2020-08-06  132   * Allocations use %GFP_PGTABLE_USER in user context and
1355c31eeb7ea6 Mike Rapoport         2020-08-06  133   * %GFP_PGTABLE_KERNEL in kernel context.
1355c31eeb7ea6 Mike Rapoport         2020-08-06  134   *
1355c31eeb7ea6 Mike Rapoport         2020-08-06  135   * Return: pointer to the allocated memory or %NULL on error
1355c31eeb7ea6 Mike Rapoport         2020-08-06  136   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  137  static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  138  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  139) 	struct ptdesc *ptdesc;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  140  	gfp_t gfp = GFP_PGTABLE_USER;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  141  
ccbd04de39826d Dave Hansen           2025-08-28  142  	if (mm == &init_mm) {
1355c31eeb7ea6 Mike Rapoport         2020-08-06  143  		gfp = GFP_PGTABLE_KERNEL;
ccbd04de39826d Dave Hansen           2025-08-28 @144  		ptdesc_set_kernel(ptdesc);
ccbd04de39826d Dave Hansen           2025-08-28  145  	}
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  146  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  147) 	if (!ptdesc)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  148  		return NULL;
d82d3bf4115217 Kevin Brodsky         2025-04-08  149  	if (!pagetable_pmd_ctor(mm, ptdesc)) {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  150) 		pagetable_free(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  151  		return NULL;
1355c31eeb7ea6 Mike Rapoport         2020-08-06  152  	}
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  153) 	return ptdesc_address(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  154  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  155  #define pmd_alloc_one(...)	alloc_hooks(pmd_alloc_one_noprof(__VA_ARGS__))
1355c31eeb7ea6 Mike Rapoport         2020-08-06  156  #endif
1355c31eeb7ea6 Mike Rapoport         2020-08-06  157  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  158  #ifndef __HAVE_ARCH_PMD_FREE
1355c31eeb7ea6 Mike Rapoport         2020-08-06  159  static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
1355c31eeb7ea6 Mike Rapoport         2020-08-06  160  {
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  161) 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  162) 
1355c31eeb7ea6 Mike Rapoport         2020-08-06  163  	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
553e77529fb61e Qi Zheng              2025-01-08  164  	pagetable_dtor_free(ptdesc);
1355c31eeb7ea6 Mike Rapoport         2020-08-06  165  }
1355c31eeb7ea6 Mike Rapoport         2020-08-06  166  #endif
1355c31eeb7ea6 Mike Rapoport         2020-08-06  167  
1355c31eeb7ea6 Mike Rapoport         2020-08-06  168  #endif /* CONFIG_PGTABLE_LEVELS > 2 */
1355c31eeb7ea6 Mike Rapoport         2020-08-06  169  
d9e8b929670b4f Mike Rapoport         2020-08-06  170  #if CONFIG_PGTABLE_LEVELS > 3
d9e8b929670b4f Mike Rapoport         2020-08-06  171  
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  172  static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
60639f74c2f4fc Alexandre Ghiti       2021-12-06  173  {
60639f74c2f4fc Alexandre Ghiti       2021-12-06  174  	gfp_t gfp = GFP_PGTABLE_USER;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  175) 	struct ptdesc *ptdesc;
60639f74c2f4fc Alexandre Ghiti       2021-12-06  176  
ccbd04de39826d Dave Hansen           2025-08-28  177  	if (mm == &init_mm) {
60639f74c2f4fc Alexandre Ghiti       2021-12-06  178  		gfp = GFP_PGTABLE_KERNEL;
ccbd04de39826d Dave Hansen           2025-08-28 @179  		ptdesc_set_kernel(ptdesc);
ccbd04de39826d Dave Hansen           2025-08-28  180  	}
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  181) 	gfp &= ~__GFP_HIGHMEM;
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  182) 
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  183  	ptdesc = pagetable_alloc_noprof(gfp, 0);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  184) 	if (!ptdesc)
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  185) 		return NULL;
55d2a0bd5eadaa Baolin Wang           2023-09-18  186  
55d2a0bd5eadaa Baolin Wang           2023-09-18  187  	pagetable_pud_ctor(ptdesc);
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  188) 	return ptdesc_address(ptdesc);
60639f74c2f4fc Alexandre Ghiti       2021-12-06  189  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  190  #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
60639f74c2f4fc Alexandre Ghiti       2021-12-06  191  
9922c1deff915c Mike Rapoport         2020-08-14  192  #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
d9e8b929670b4f Mike Rapoport         2020-08-06  193  /**
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  194)  * pud_alloc_one - allocate memory for a PUD-level page table
d9e8b929670b4f Mike Rapoport         2020-08-06  195   * @mm: the mm_struct of the current context
d9e8b929670b4f Mike Rapoport         2020-08-06  196   *
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  197)  * Allocate memory for a page table using %GFP_PGTABLE_USER for user context
c787ae5b391496 Vishal Moola (Oracle  2023-08-07  198)  * and %GFP_PGTABLE_KERNEL for kernel context.
d9e8b929670b4f Mike Rapoport         2020-08-06  199   *
d9e8b929670b4f Mike Rapoport         2020-08-06  200   * Return: pointer to the allocated memory or %NULL on error
d9e8b929670b4f Mike Rapoport         2020-08-06  201   */
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  202  static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
d9e8b929670b4f Mike Rapoport         2020-08-06  203  {
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  204  	return __pud_alloc_one_noprof(mm, addr);
d9e8b929670b4f Mike Rapoport         2020-08-06  205  }
2c321f3f70bc28 Suren Baghdasaryan    2024-04-14  206  #define pud_alloc_one(...)	alloc_hooks(pud_alloc_one_noprof(__VA_ARGS__))
d9e8b929670b4f Mike Rapoport         2020-08-06  207  #endif
d9e8b929670b4f Mike Rapoport         2020-08-06  208  
60639f74c2f4fc Alexandre Ghiti       2021-12-06  209  static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
d9e8b929670b4f Mike Rapoport         2020-08-06  210  {
55d2a0bd5eadaa Baolin Wang           2023-09-18  211  	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
55d2a0bd5eadaa Baolin Wang           2023-09-18  212  
d9e8b929670b4f Mike Rapoport         2020-08-06  213  	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
553e77529fb61e Qi Zheng              2025-01-08  214  	pagetable_dtor_free(ptdesc);
d9e8b929670b4f Mike Rapoport         2020-08-06  215  }
d9e8b929670b4f Mike Rapoport         2020-08-06  216  
60639f74c2f4fc Alexandre Ghiti       2021-12-06  217  #ifndef __HAVE_ARCH_PUD_FREE
60639f74c2f4fc Alexandre Ghiti       2021-12-06  218  static inline void pud_free(struct mm_struct *mm, pud_t *pud)
60639f74c2f4fc Alexandre Ghiti       2021-12-06  219  {
60639f74c2f4fc Alexandre Ghiti       2021-12-06  220  	__pud_free(mm, pud);
60639f74c2f4fc Alexandre Ghiti       2021-12-06  221  }
60639f74c2f4fc Alexandre Ghiti       2021-12-06  222  #endif
60639f74c2f4fc Alexandre Ghiti       2021-12-06  223  
d9e8b929670b4f Mike Rapoport         2020-08-06  224  #endif /* CONFIG_PGTABLE_LEVELS > 3 */
d9e8b929670b4f Mike Rapoport         2020-08-06  225  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  226  #if CONFIG_PGTABLE_LEVELS > 4
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  227  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  228  static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  229  {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  230  	gfp_t gfp = GFP_PGTABLE_USER;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  231  	struct ptdesc *ptdesc;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  232  
ccbd04de39826d Dave Hansen           2025-08-28  233  	if (mm == &init_mm) {
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  234  		gfp = GFP_PGTABLE_KERNEL;
ccbd04de39826d Dave Hansen           2025-08-28 @235  		ptdesc_set_kernel(ptdesc);
ccbd04de39826d Dave Hansen           2025-08-28  236  	}
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  237  	gfp &= ~__GFP_HIGHMEM;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  238  
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  239  	ptdesc = pagetable_alloc_noprof(gfp, 0);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  240  	if (!ptdesc)
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  241  		return NULL;
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  242  
5fcf5fa6121817 Qi Zheng              2025-01-08  243  	pagetable_p4d_ctor(ptdesc);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  244  	return ptdesc_address(ptdesc);
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  245  }
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  246  #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
98a7e47faa3ec3 Kevin Brodsky         2025-01-08  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
