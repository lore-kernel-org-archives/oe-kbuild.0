Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B0DDA8
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729474056; cv=none; b=An1nX1QwwbBVfc8rgpCBi0n959I46tTuf32Ww3VudaOSDx70Vp8qY1dIrGPagRqqQQUdp7xtZX4yset7YgFYYhn0Mn4GIQ3fYr3uhSTaN3iWfHw0gkkErWybOWKlU4hGUeYe2PiDnvvprBiisP+j5+oMXiC59C9rUWNwqb6+NDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729474056; c=relaxed/simple;
	bh=4koPdQ76mxD4MmzzOEifjNSzypUl7C8N0tvgkxsHcY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/3k21M4N9lh5JH4Kw4vtoRNOQttbtYZV/VfHdeNCK6m3JiXwOcR3MfgsZsxKyrRSHbON0BsjbHYBBX+7XJ1LGQSwN6hKaFOH6SzBkkA1D0nUC2iqUrBAeLtOLxnXUS6UGraZDDrl/O2Aqgy+/6cqaYnOUpRcOVSObIDQZouHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaId4HWb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaId4HWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729474054; x=1761010054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4koPdQ76mxD4MmzzOEifjNSzypUl7C8N0tvgkxsHcY8=;
  b=aaId4HWb+26IsaJHD+zZwOU4doSolKpH/nqhpeBf3+jn+9Ne47P826JN
   tDEs6nDbB+Eeq8RyWrkDEwAIX8UfaG9pxORSwJmWJt/csJjmK1ay7PUYO
   GjvVLx5MqIgeIGm0k78S+Q2SE3C3FqV7K+Sh6eQESPDJNu4BZ3l2Jlnaj
   xwVlojRIG6UTSq1jQwPf6E2YeY93qxoKqJZfatOA8cPbW5SKsCparMQ5d
   3jhyYybymZiLoIWaztgpTn459Nl497Wk5DXhuO3UfqTXVC0vXjHJi4C/M
   20F3aNtyQybeWVuHW2to92Ush2gL4ZONe8TvbhshdbpRPZdIW/NS90LmY
   w==;
X-CSE-ConnectionGUID: 9mC9wZzKR1aETkV9YgJQYg==
X-CSE-MsgGUID: pUo2lrhvTbmJJkSJtRFmLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40332412"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="40332412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:27:30 -0700
X-CSE-ConnectionGUID: JPihFCN8Tve+llSi+qT44A==
X-CSE-MsgGUID: eaSXE2GtRWyjSToZrsN0cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="102687917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2024 18:27:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2hCg-000Qzb-1R;
	Mon, 21 Oct 2024 01:27:26 +0000
Date: Mon, 21 Oct 2024 09:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 77/150] mm/page_vma_mapped.c:316
 page_vma_mapped_walk() error: uninitialized symbol 'pmde'.
Message-ID: <202410211155.VwbfaA7F-lkp@intel.com>
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
TO: Qi Zheng <zhengqi.arch@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Muchun Song <muchun.song@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b5d43fad926a3f542cd06f3c9d286f6f489f7129
commit: f121328767d40cabbb4424ede68a0987aa6c0a87 [77/150] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410211155.VwbfaA7F-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410211155.VwbfaA7F-lkp@intel.com/

smatch warnings:
mm/page_vma_mapped.c:316 page_vma_mapped_walk() error: uninitialized symbol 'pmde'.

vim +/pmde +316 mm/page_vma_mapped.c

a9a7504d9beaf3 Hugh Dickins            2021-06-24  155  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  156  /**
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  157)  * page_vma_mapped_walk - check if @pvmw->pfn is mapped in @pvmw->vma at
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  158   * @pvmw->address
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  159   * @pvmw: pointer to struct page_vma_mapped_walk. page, vma, address and flags
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  160   * must be set. pmd, pte and ptl must be NULL.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  161   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  162   * Returns true if the page is mapped in the vma. @pvmw->pmd and @pvmw->pte point
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  163   * to relevant page table entries. @pvmw->ptl is locked. @pvmw->address is
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  164   * adjusted if needed (for PTE-mapped THPs).
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  165   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  166   * If @pvmw->pmd is set but @pvmw->pte is not, you have found PMD-mapped page
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  167   * (usually THP). For PTE-mapped THP, you should run page_vma_mapped_walk() in
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  168   * a loop to find all PTEs that map the THP.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  169   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  170   * For HugeTLB pages, @pvmw->pte is set to the relevant page table entry
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  171   * regardless of which page table level the page is mapped at. @pvmw->pmd is
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  172   * NULL.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  173   *
baf2f90ba416cd Lu Jialin               2021-05-06  174   * Returns false if there are no more page table entries for the page in
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  175   * the vma. @pvmw->ptl is unlocked and @pvmw->pte is unmapped.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  176   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  177   * If you need to stop the walk before page_vma_mapped_walk() returned false,
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  178   * use page_vma_mapped_walk_done(). It will do the housekeeping.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  179   */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  180  bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  181  {
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  182) 	struct vm_area_struct *vma = pvmw->vma;
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  183) 	struct mm_struct *mm = vma->vm_mm;
474466301dfd8b Hugh Dickins            2021-06-24  184  	unsigned long end;
2798bbe75b9c27 Hugh Dickins            2023-06-08  185  	spinlock_t *ptl;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  186  	pgd_t *pgd;
c2febafc67734a Kirill A. Shutemov      2017-03-09  187  	p4d_t *p4d;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  188  	pud_t *pud;
a7b100953aa33a Will Deacon             2017-10-13  189  	pmd_t pmde;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  190  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  191  	/* The only possible pmd mapping has been handled on last iteration */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  192  	if (pvmw->pmd && !pvmw->pte)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  193  		return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  194  
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  195) 	if (unlikely(is_vm_hugetlb_page(vma))) {
98ea02597b9967 zhenwei pi              2022-04-07  196  		struct hstate *hstate = hstate_vma(vma);
98ea02597b9967 zhenwei pi              2022-04-07  197  		unsigned long size = huge_page_size(hstate);
6d0fd5987657cb Hugh Dickins            2021-06-24  198  		/* The only possible mapping was handled on last iteration */
d75450ff40df01 Hugh Dickins            2017-04-07  199  		if (pvmw->pte)
6d0fd5987657cb Hugh Dickins            2021-06-24  200  			return not_found(pvmw);
9c67a20704e763 Peter Xu                2022-12-16  201  		/*
9c67a20704e763 Peter Xu                2022-12-16  202  		 * All callers that get here will already hold the
9c67a20704e763 Peter Xu                2022-12-16  203  		 * i_mmap_rwsem.  Therefore, no additional locks need to be
9c67a20704e763 Peter Xu                2022-12-16  204  		 * taken before calling hugetlb_walk().
9c67a20704e763 Peter Xu                2022-12-16  205  		 */
9c67a20704e763 Peter Xu                2022-12-16  206  		pvmw->pte = hugetlb_walk(vma, pvmw->address, size);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  207  		if (!pvmw->pte)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  208  			return false;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  209  
8f0b747d7dde47 Miaohe Lin              2022-07-09  210  		pvmw->ptl = huge_pte_lock(hstate, mm, pvmw->pte);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  211  		if (!check_pte(pvmw))
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  212  			return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  213  		return true;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  214  	}
6d0fd5987657cb Hugh Dickins            2021-06-24  215  
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  216) 	end = vma_address_end(pvmw);
6d0fd5987657cb Hugh Dickins            2021-06-24  217  	if (pvmw->pte)
6d0fd5987657cb Hugh Dickins            2021-06-24  218  		goto next_pte;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  219  restart:
a9a7504d9beaf3 Hugh Dickins            2021-06-24  220  	do {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  221  		pgd = pgd_offset(mm, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  222  		if (!pgd_present(*pgd)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  223  			step_forward(pvmw, PGDIR_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  224  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  225  		}
c2febafc67734a Kirill A. Shutemov      2017-03-09  226  		p4d = p4d_offset(pgd, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  227  		if (!p4d_present(*p4d)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  228  			step_forward(pvmw, P4D_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  229  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  230  		}
c2febafc67734a Kirill A. Shutemov      2017-03-09  231  		pud = pud_offset(p4d, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  232  		if (!pud_present(*pud)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  233  			step_forward(pvmw, PUD_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  234  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  235  		}
b3807a91aca7d2 Hugh Dickins            2021-06-24  236  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  237  		pvmw->pmd = pmd_offset(pud, pvmw->address);
a7b100953aa33a Will Deacon             2017-10-13  238  		/*
a7b100953aa33a Will Deacon             2017-10-13  239  		 * Make sure the pmd value isn't cached in a register by the
a7b100953aa33a Will Deacon             2017-10-13  240  		 * compiler and used as a stale value after we've observed a
a7b100953aa33a Will Deacon             2017-10-13  241  		 * subsequent update.
a7b100953aa33a Will Deacon             2017-10-13  242  		 */
26e1a0c3277d7f Hugh Dickins            2023-06-08  243  		pmde = pmdp_get_lockless(pvmw->pmd);
b3807a91aca7d2 Hugh Dickins            2021-06-24  244  
6472f6d2f7d90c Muchun Song             2022-04-28  245  		if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde) ||
6472f6d2f7d90c Muchun Song             2022-04-28  246  		    (pmd_present(pmde) && pmd_devmap(pmde))) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  247  			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
3306d3119ceacc Hugh Dickins            2021-06-24  248  			pmde = *pvmw->pmd;
e2e1d4076c77b3 Hugh Dickins            2021-06-24  249  			if (!pmd_present(pmde)) {
e2e1d4076c77b3 Hugh Dickins            2021-06-24  250  				swp_entry_t entry;
616b8371539a6c Zi Yan                  2017-09-08  251  
e2e1d4076c77b3 Hugh Dickins            2021-06-24  252  				if (!thp_migration_supported() ||
e2e1d4076c77b3 Hugh Dickins            2021-06-24  253  				    !(pvmw->flags & PVMW_MIGRATION))
e2e1d4076c77b3 Hugh Dickins            2021-06-24  254  					return not_found(pvmw);
e2e1d4076c77b3 Hugh Dickins            2021-06-24  255  				entry = pmd_to_swp_entry(pmde);
e2e1d4076c77b3 Hugh Dickins            2021-06-24  256  				if (!is_migration_entry(entry) ||
0d206b5d2e0d7d Peter Xu                2022-08-11  257  				    !check_pmd(swp_offset_pfn(entry), pvmw))
616b8371539a6c Zi Yan                  2017-09-08  258  					return not_found(pvmw);
616b8371539a6c Zi Yan                  2017-09-08  259  				return true;
616b8371539a6c Zi Yan                  2017-09-08  260  			}
6472f6d2f7d90c Muchun Song             2022-04-28  261  			if (likely(pmd_trans_huge(pmde) || pmd_devmap(pmde))) {
6472f6d2f7d90c Muchun Song             2022-04-28  262  				if (pvmw->flags & PVMW_MIGRATION)
6472f6d2f7d90c Muchun Song             2022-04-28  263  					return not_found(pvmw);
6472f6d2f7d90c Muchun Song             2022-04-28  264  				if (!check_pmd(pmd_pfn(pmde), pvmw))
6472f6d2f7d90c Muchun Song             2022-04-28  265  					return not_found(pvmw);
6472f6d2f7d90c Muchun Song             2022-04-28  266  				return true;
6472f6d2f7d90c Muchun Song             2022-04-28  267  			}
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  268  			/* THP pmd was split under us: handle on pte level */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  269  			spin_unlock(pvmw->ptl);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  270  			pvmw->ptl = NULL;
a7b100953aa33a Will Deacon             2017-10-13  271  		} else if (!pmd_present(pmde)) {
732ed55823fc3a Hugh Dickins            2021-06-15  272  			/*
732ed55823fc3a Hugh Dickins            2021-06-15  273  			 * If PVMW_SYNC, take and drop THP pmd lock so that we
732ed55823fc3a Hugh Dickins            2021-06-15  274  			 * cannot return prematurely, while zap_huge_pmd() has
732ed55823fc3a Hugh Dickins            2021-06-15  275  			 * cleared *pmd but not decremented compound_mapcount().
732ed55823fc3a Hugh Dickins            2021-06-15  276  			 */
b3807a91aca7d2 Hugh Dickins            2021-06-24  277  			if ((pvmw->flags & PVMW_SYNC) &&
3485b88390b0af Ryan Roberts            2023-12-07  278  			    thp_vma_suitable_order(vma, pvmw->address,
3485b88390b0af Ryan Roberts            2023-12-07  279  						   PMD_ORDER) &&
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  280) 			    (pvmw->nr_pages >= HPAGE_PMD_NR)) {
732ed55823fc3a Hugh Dickins            2021-06-15  281  				spinlock_t *ptl = pmd_lock(mm, pvmw->pmd);
732ed55823fc3a Hugh Dickins            2021-06-15  282  
732ed55823fc3a Hugh Dickins            2021-06-15  283  				spin_unlock(ptl);
732ed55823fc3a Hugh Dickins            2021-06-15  284  			}
a9a7504d9beaf3 Hugh Dickins            2021-06-24  285  			step_forward(pvmw, PMD_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  286  			continue;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  287  		}
f121328767d40c Qi Zheng                2024-09-26  288  		if (!map_pte(pvmw, &pmde, &ptl)) {
2798bbe75b9c27 Hugh Dickins            2023-06-08  289  			if (!pvmw->pte)
2798bbe75b9c27 Hugh Dickins            2023-06-08  290  				goto restart;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  291  			goto next_pte;
2798bbe75b9c27 Hugh Dickins            2023-06-08  292  		}
474466301dfd8b Hugh Dickins            2021-06-24  293  this_pte:
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  294  		if (check_pte(pvmw))
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  295  			return true;
d75450ff40df01 Hugh Dickins            2017-04-07  296  next_pte:
d75450ff40df01 Hugh Dickins            2017-04-07  297  		do {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  298  			pvmw->address += PAGE_SIZE;
494334e43c16d6 Hugh Dickins            2021-06-15  299  			if (pvmw->address >= end)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  300  				return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  301  			/* Did we cross page table boundary? */
448282487483d6 Hugh Dickins            2021-06-24  302  			if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  303  				if (pvmw->ptl) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  304  					spin_unlock(pvmw->ptl);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  305  					pvmw->ptl = NULL;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  306  				}
448282487483d6 Hugh Dickins            2021-06-24  307  				pte_unmap(pvmw->pte);
448282487483d6 Hugh Dickins            2021-06-24  308  				pvmw->pte = NULL;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  309  				goto restart;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  310  			}
448282487483d6 Hugh Dickins            2021-06-24  311  			pvmw->pte++;
c33c794828f212 Ryan Roberts            2023-06-12  312  		} while (pte_none(ptep_get(pvmw->pte)));
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  313  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  314  		if (!pvmw->ptl) {
f121328767d40c Qi Zheng                2024-09-26  315  			spin_lock(ptl);
f121328767d40c Qi Zheng                2024-09-26 @316  			if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
f121328767d40c Qi Zheng                2024-09-26  317  				pte_unmap_unlock(pvmw->pte, ptl);
f121328767d40c Qi Zheng                2024-09-26  318  				pvmw->pte = NULL;
f121328767d40c Qi Zheng                2024-09-26  319  				goto restart;
f121328767d40c Qi Zheng                2024-09-26  320  			}
2798bbe75b9c27 Hugh Dickins            2023-06-08  321  			pvmw->ptl = ptl;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  322  		}
474466301dfd8b Hugh Dickins            2021-06-24  323  		goto this_pte;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  324  	} while (pvmw->address < end);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  325  
a9a7504d9beaf3 Hugh Dickins            2021-06-24  326  	return false;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  327  }
6a328a626f98bb Kirill A. Shutemov      2017-02-24  328  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
