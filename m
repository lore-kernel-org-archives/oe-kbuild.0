Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161B202963
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751716315; cv=none; b=SKE1kpMRZkghO5mPuts0uVX1ggszls3j54Y9KkuCMWnKWUB0tkQYMkq6+/MkXBTeBUMlR9LY0sXcJMgH2oH7LOJJynv/8ITg9ACubaR0O002sLS7Q9RT1oYuBtGwcPUYwkTas4mLK1MfiIrbVe6v5W0Aen/fWM1d/Ym0tIUgZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751716315; c=relaxed/simple;
	bh=AOgvXTHz39bu+KWFnQ6IUFuVaB88+L6bq+mxzXn8ZMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEuT4uvRErEOe4IpSSBZ7NpamCHzMhi9Is/7q4bpR9BALsjpN3oFwDJ7rpLzAD886E8HcpXUIVWkaIoKK+LumVndeah12h3pYQ08l7ayVnOdjZ08gbiKYMxcRu31lBve91R5SaMBLvvVM/Y4vKNIR8EjyBHLwnvla8c620sbc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Geic6+c5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geic6+c5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751716312; x=1783252312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOgvXTHz39bu+KWFnQ6IUFuVaB88+L6bq+mxzXn8ZMc=;
  b=Geic6+c5YqkKKV7eTXr21HABszUi3/v9JNNVdZFmDW4XHnqx6T9pwP+m
   IXP56RozZlLAo4hRpMwumWIF+GRTP4cVWCTJVBrsELvpV0xNE/UumiTL8
   0DpcEIfvGZbbZU/S813PsAjNLW38+nwt4gmsmceP95Zu1IciT3eHToF91
   LLE+ugBVqEhRQvz3icIzkdN3NBN7gdCIwXCeKOuiKoQf//J7owvEihrr7
   hahpoV40/7SduHq5n4QKM8K0FnPbTXatEaJNpOeM5XiiLUC5Nu+olQiWc
   H5J8n6lNzaVv6GHg3SdJM+2VZu4CbG9e8Fpg+pWii5ZbyfX+KSP5gPbGh
   Q==;
X-CSE-ConnectionGUID: /dDs8KCNRP6nwBMJqUDPlA==
X-CSE-MsgGUID: 9GXKXzT3TgGVJBH2HkPNMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53936270"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="53936270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 04:51:52 -0700
X-CSE-ConnectionGUID: BP2/SDTiSTye/prDIeoD9Q==
X-CSE-MsgGUID: blw+czJeRMqUEUzm9iqmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="155292292"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2025 04:51:51 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY1Qq-0004Tc-21;
	Sat, 05 Jul 2025 11:51:48 +0000
Date: Sat, 5 Jul 2025 19:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_vma_mapped.c:316 page_vma_mapped_walk() error: uninitialized
 symbol 'pmde'.
Message-ID: <202507051905.g7Y0y59Z-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: 03544866df1bc78fe740fc9d17816874ba7bde5a s390/mm: Add configurable STRICT_MM_TYPECHECKS
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051905.g7Y0y59Z-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507051905.g7Y0y59Z-lkp@intel.com/

smatch warnings:
mm/page_vma_mapped.c:316 page_vma_mapped_walk() error: uninitialized symbol 'pmde'.

vim +/pmde +316 mm/page_vma_mapped.c

a9a7504d9beaf39 Hugh Dickins            2021-06-24  155  
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  156  /**
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  157)  * page_vma_mapped_walk - check if @pvmw->pfn is mapped in @pvmw->vma at
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  158   * @pvmw->address
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  159   * @pvmw: pointer to struct page_vma_mapped_walk. page, vma, address and flags
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  160   * must be set. pmd, pte and ptl must be NULL.
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  161   *
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  162   * Returns true if the page is mapped in the vma. @pvmw->pmd and @pvmw->pte point
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  163   * to relevant page table entries. @pvmw->ptl is locked. @pvmw->address is
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  164   * adjusted if needed (for PTE-mapped THPs).
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  165   *
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  166   * If @pvmw->pmd is set but @pvmw->pte is not, you have found PMD-mapped page
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  167   * (usually THP). For PTE-mapped THP, you should run page_vma_mapped_walk() in
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  168   * a loop to find all PTEs that map the THP.
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  169   *
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  170   * For HugeTLB pages, @pvmw->pte is set to the relevant page table entry
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  171   * regardless of which page table level the page is mapped at. @pvmw->pmd is
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  172   * NULL.
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  173   *
baf2f90ba416cd8 Lu Jialin               2021-05-06  174   * Returns false if there are no more page table entries for the page in
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  175   * the vma. @pvmw->ptl is unlocked and @pvmw->pte is unmapped.
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  176   *
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  177   * If you need to stop the walk before page_vma_mapped_walk() returned false,
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  178   * use page_vma_mapped_walk_done(). It will do the housekeeping.
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  179   */
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  180  bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  181  {
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  182) 	struct vm_area_struct *vma = pvmw->vma;
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  183) 	struct mm_struct *mm = vma->vm_mm;
474466301dfd8b3 Hugh Dickins            2021-06-24  184  	unsigned long end;
2798bbe75b9c275 Hugh Dickins            2023-06-08  185  	spinlock_t *ptl;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  186  	pgd_t *pgd;
c2febafc67734a6 Kirill A. Shutemov      2017-03-09  187  	p4d_t *p4d;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  188  	pud_t *pud;
a7b100953aa33a5 Will Deacon             2017-10-13  189  	pmd_t pmde;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  190  
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  191  	/* The only possible pmd mapping has been handled on last iteration */
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  192  	if (pvmw->pmd && !pvmw->pte)
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  193  		return not_found(pvmw);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  194  
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  195) 	if (unlikely(is_vm_hugetlb_page(vma))) {
98ea02597b9967c zhenwei pi              2022-04-07  196  		struct hstate *hstate = hstate_vma(vma);
98ea02597b9967c zhenwei pi              2022-04-07  197  		unsigned long size = huge_page_size(hstate);
6d0fd5987657cb0 Hugh Dickins            2021-06-24  198  		/* The only possible mapping was handled on last iteration */
d75450ff40df019 Hugh Dickins            2017-04-07  199  		if (pvmw->pte)
6d0fd5987657cb0 Hugh Dickins            2021-06-24  200  			return not_found(pvmw);
9c67a20704e763f Peter Xu                2022-12-16  201  		/*
9c67a20704e763f Peter Xu                2022-12-16  202  		 * All callers that get here will already hold the
9c67a20704e763f Peter Xu                2022-12-16  203  		 * i_mmap_rwsem.  Therefore, no additional locks need to be
9c67a20704e763f Peter Xu                2022-12-16  204  		 * taken before calling hugetlb_walk().
9c67a20704e763f Peter Xu                2022-12-16  205  		 */
9c67a20704e763f Peter Xu                2022-12-16  206  		pvmw->pte = hugetlb_walk(vma, pvmw->address, size);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  207  		if (!pvmw->pte)
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  208  			return false;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  209  
8f0b747d7dde47e Miaohe Lin              2022-07-09  210  		pvmw->ptl = huge_pte_lock(hstate, mm, pvmw->pte);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  211  		if (!check_pte(pvmw))
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  212  			return not_found(pvmw);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  213  		return true;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  214  	}
6d0fd5987657cb0 Hugh Dickins            2021-06-24  215  
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  216) 	end = vma_address_end(pvmw);
6d0fd5987657cb0 Hugh Dickins            2021-06-24  217  	if (pvmw->pte)
6d0fd5987657cb0 Hugh Dickins            2021-06-24  218  		goto next_pte;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  219  restart:
a9a7504d9beaf39 Hugh Dickins            2021-06-24  220  	do {
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  221  		pgd = pgd_offset(mm, pvmw->address);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  222  		if (!pgd_present(*pgd)) {
a9a7504d9beaf39 Hugh Dickins            2021-06-24  223  			step_forward(pvmw, PGDIR_SIZE);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  224  			continue;
a9a7504d9beaf39 Hugh Dickins            2021-06-24  225  		}
c2febafc67734a6 Kirill A. Shutemov      2017-03-09  226  		p4d = p4d_offset(pgd, pvmw->address);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  227  		if (!p4d_present(*p4d)) {
a9a7504d9beaf39 Hugh Dickins            2021-06-24  228  			step_forward(pvmw, P4D_SIZE);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  229  			continue;
a9a7504d9beaf39 Hugh Dickins            2021-06-24  230  		}
c2febafc67734a6 Kirill A. Shutemov      2017-03-09  231  		pud = pud_offset(p4d, pvmw->address);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  232  		if (!pud_present(*pud)) {
a9a7504d9beaf39 Hugh Dickins            2021-06-24  233  			step_forward(pvmw, PUD_SIZE);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  234  			continue;
a9a7504d9beaf39 Hugh Dickins            2021-06-24  235  		}
b3807a91aca7d21 Hugh Dickins            2021-06-24  236  
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  237  		pvmw->pmd = pmd_offset(pud, pvmw->address);
a7b100953aa33a5 Will Deacon             2017-10-13  238  		/*
a7b100953aa33a5 Will Deacon             2017-10-13  239  		 * Make sure the pmd value isn't cached in a register by the
a7b100953aa33a5 Will Deacon             2017-10-13  240  		 * compiler and used as a stale value after we've observed a
a7b100953aa33a5 Will Deacon             2017-10-13  241  		 * subsequent update.
a7b100953aa33a5 Will Deacon             2017-10-13  242  		 */
26e1a0c3277d7f4 Hugh Dickins            2023-06-08  243  		pmde = pmdp_get_lockless(pvmw->pmd);
b3807a91aca7d21 Hugh Dickins            2021-06-24  244  
6472f6d2f7d90c0 Muchun Song             2022-04-28  245  		if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde) ||
6472f6d2f7d90c0 Muchun Song             2022-04-28  246  		    (pmd_present(pmde) && pmd_devmap(pmde))) {
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  247  			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
3306d3119ceacc4 Hugh Dickins            2021-06-24  248  			pmde = *pvmw->pmd;
e2e1d4076c77b36 Hugh Dickins            2021-06-24  249  			if (!pmd_present(pmde)) {
e2e1d4076c77b36 Hugh Dickins            2021-06-24  250  				swp_entry_t entry;
616b8371539a6c4 Zi Yan                  2017-09-08  251  
e2e1d4076c77b36 Hugh Dickins            2021-06-24  252  				if (!thp_migration_supported() ||
e2e1d4076c77b36 Hugh Dickins            2021-06-24  253  				    !(pvmw->flags & PVMW_MIGRATION))
e2e1d4076c77b36 Hugh Dickins            2021-06-24  254  					return not_found(pvmw);
e2e1d4076c77b36 Hugh Dickins            2021-06-24  255  				entry = pmd_to_swp_entry(pmde);
e2e1d4076c77b36 Hugh Dickins            2021-06-24  256  				if (!is_migration_entry(entry) ||
0d206b5d2e0d7d7 Peter Xu                2022-08-11  257  				    !check_pmd(swp_offset_pfn(entry), pvmw))
616b8371539a6c4 Zi Yan                  2017-09-08  258  					return not_found(pvmw);
616b8371539a6c4 Zi Yan                  2017-09-08  259  				return true;
616b8371539a6c4 Zi Yan                  2017-09-08  260  			}
6472f6d2f7d90c0 Muchun Song             2022-04-28  261  			if (likely(pmd_trans_huge(pmde) || pmd_devmap(pmde))) {
6472f6d2f7d90c0 Muchun Song             2022-04-28  262  				if (pvmw->flags & PVMW_MIGRATION)
6472f6d2f7d90c0 Muchun Song             2022-04-28  263  					return not_found(pvmw);
6472f6d2f7d90c0 Muchun Song             2022-04-28  264  				if (!check_pmd(pmd_pfn(pmde), pvmw))
6472f6d2f7d90c0 Muchun Song             2022-04-28  265  					return not_found(pvmw);
6472f6d2f7d90c0 Muchun Song             2022-04-28  266  				return true;
6472f6d2f7d90c0 Muchun Song             2022-04-28  267  			}
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  268  			/* THP pmd was split under us: handle on pte level */
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  269  			spin_unlock(pvmw->ptl);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  270  			pvmw->ptl = NULL;
a7b100953aa33a5 Will Deacon             2017-10-13  271  		} else if (!pmd_present(pmde)) {
732ed55823fc3ad Hugh Dickins            2021-06-15  272  			/*
732ed55823fc3ad Hugh Dickins            2021-06-15  273  			 * If PVMW_SYNC, take and drop THP pmd lock so that we
732ed55823fc3ad Hugh Dickins            2021-06-15  274  			 * cannot return prematurely, while zap_huge_pmd() has
732ed55823fc3ad Hugh Dickins            2021-06-15  275  			 * cleared *pmd but not decremented compound_mapcount().
732ed55823fc3ad Hugh Dickins            2021-06-15  276  			 */
b3807a91aca7d21 Hugh Dickins            2021-06-24  277  			if ((pvmw->flags & PVMW_SYNC) &&
3485b88390b0af9 Ryan Roberts            2023-12-07  278  			    thp_vma_suitable_order(vma, pvmw->address,
3485b88390b0af9 Ryan Roberts            2023-12-07  279  						   PMD_ORDER) &&
2aff7a4755bed28 Matthew Wilcox (Oracle  2022-02-03  280) 			    (pvmw->nr_pages >= HPAGE_PMD_NR)) {
732ed55823fc3ad Hugh Dickins            2021-06-15  281  				spinlock_t *ptl = pmd_lock(mm, pvmw->pmd);
732ed55823fc3ad Hugh Dickins            2021-06-15  282  
732ed55823fc3ad Hugh Dickins            2021-06-15  283  				spin_unlock(ptl);
732ed55823fc3ad Hugh Dickins            2021-06-15  284  			}
a9a7504d9beaf39 Hugh Dickins            2021-06-24  285  			step_forward(pvmw, PMD_SIZE);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  286  			continue;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  287  		}
04965da7a4af790 Qi Zheng                2024-09-26  288  		if (!map_pte(pvmw, &pmde, &ptl)) {
2798bbe75b9c275 Hugh Dickins            2023-06-08  289  			if (!pvmw->pte)
2798bbe75b9c275 Hugh Dickins            2023-06-08  290  				goto restart;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  291  			goto next_pte;
2798bbe75b9c275 Hugh Dickins            2023-06-08  292  		}
474466301dfd8b3 Hugh Dickins            2021-06-24  293  this_pte:
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  294  		if (check_pte(pvmw))
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  295  			return true;
d75450ff40df019 Hugh Dickins            2017-04-07  296  next_pte:
d75450ff40df019 Hugh Dickins            2017-04-07  297  		do {
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  298  			pvmw->address += PAGE_SIZE;
494334e43c16d63 Hugh Dickins            2021-06-15  299  			if (pvmw->address >= end)
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  300  				return not_found(pvmw);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  301  			/* Did we cross page table boundary? */
448282487483d6f Hugh Dickins            2021-06-24  302  			if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  303  				if (pvmw->ptl) {
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  304  					spin_unlock(pvmw->ptl);
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  305  					pvmw->ptl = NULL;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  306  				}
448282487483d6f Hugh Dickins            2021-06-24  307  				pte_unmap(pvmw->pte);
448282487483d6f Hugh Dickins            2021-06-24  308  				pvmw->pte = NULL;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  309  				goto restart;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  310  			}
448282487483d6f Hugh Dickins            2021-06-24  311  			pvmw->pte++;
c33c794828f2121 Ryan Roberts            2023-06-12  312  		} while (pte_none(ptep_get(pvmw->pte)));
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  313  
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  314  		if (!pvmw->ptl) {
04965da7a4af790 Qi Zheng                2024-09-26  315  			spin_lock(ptl);
04965da7a4af790 Qi Zheng                2024-09-26 @316  			if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
04965da7a4af790 Qi Zheng                2024-09-26  317  				pte_unmap_unlock(pvmw->pte, ptl);
04965da7a4af790 Qi Zheng                2024-09-26  318  				pvmw->pte = NULL;
04965da7a4af790 Qi Zheng                2024-09-26  319  				goto restart;
04965da7a4af790 Qi Zheng                2024-09-26  320  			}
2798bbe75b9c275 Hugh Dickins            2023-06-08  321  			pvmw->ptl = ptl;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  322  		}
474466301dfd8b3 Hugh Dickins            2021-06-24  323  		goto this_pte;
a9a7504d9beaf39 Hugh Dickins            2021-06-24  324  	} while (pvmw->address < end);
a9a7504d9beaf39 Hugh Dickins            2021-06-24  325  
a9a7504d9beaf39 Hugh Dickins            2021-06-24  326  	return false;
ace71a19cec5eb4 Kirill A. Shutemov      2017-02-24  327  }
6a328a626f98bb8 Kirill A. Shutemov      2017-02-24  328  

:::::: The code at line 316 was first introduced by commit
:::::: 04965da7a4af790d99c360e79b00bd1f93f80eb1 mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
