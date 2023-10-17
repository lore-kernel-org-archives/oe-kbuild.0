Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9AEBE69
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lf38Wn8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697540305; x=1729076305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rVx2poS3fMPVhHsM7U6qtsdPivQRspUFp+0WTr1tK6I=;
  b=lf38Wn8x9HkfMIWhJtP8Uvrm6Xo7ffiv4bn1wCgCAuKRWz0HTdl70v2m
   BnH9rdCKVwd/inyGKX1W/ARFC7CZPFPkgKLNzoIlzdOOhwbuuscMi8z9w
   QNu9k/tACGNCFPvp6qZ/2ZBDxlihxZlxp7czWGQ2RkoztsP0CkLqjqrK/
   GuHvirv8yTEzHGXvAh6yjJ8B/faXd0yRBQzIdEd3sTwNRv8ZEcYo+7q5L
   +82GCkFQB14c/Y3GWtY1EJXM46okqR5JbY6O8jmB5PtAuga5gjWKONRg1
   Z5Q/tuHEZkot4beMngPfCpm/DVy7q+gqws7P6kr4NJngsDUPOSEJm4CLh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452232045"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452232045"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 03:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="899880360"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="899880360"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 03:56:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qshmG-0009Tz-0j;
	Tue, 17 Oct 2023 10:58:20 +0000
Date: Tue, 17 Oct 2023 18:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_vma_mapped.c:300 page_vma_mapped_walk() error: uninitialized
 symbol 'ptl'.
Message-ID: <202310171811.LCQqdJ3J-lkp@intel.com>
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
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 2798bbe75b9c2752b46d292e5c2a49f49da36418 mm/page_vma_mapped: pte_offset_map_nolock() not pte_lockptr()
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171811.LCQqdJ3J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171811.LCQqdJ3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310171811.LCQqdJ3J-lkp@intel.com/

smatch warnings:
mm/page_vma_mapped.c:300 page_vma_mapped_walk() error: uninitialized symbol 'ptl'.

vim +/ptl +300 mm/page_vma_mapped.c

a9a7504d9beaf3 Hugh Dickins            2021-06-24  141  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  142  /**
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  143)  * page_vma_mapped_walk - check if @pvmw->pfn is mapped in @pvmw->vma at
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  144   * @pvmw->address
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  145   * @pvmw: pointer to struct page_vma_mapped_walk. page, vma, address and flags
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  146   * must be set. pmd, pte and ptl must be NULL.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  147   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  148   * Returns true if the page is mapped in the vma. @pvmw->pmd and @pvmw->pte point
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  149   * to relevant page table entries. @pvmw->ptl is locked. @pvmw->address is
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  150   * adjusted if needed (for PTE-mapped THPs).
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  151   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  152   * If @pvmw->pmd is set but @pvmw->pte is not, you have found PMD-mapped page
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  153   * (usually THP). For PTE-mapped THP, you should run page_vma_mapped_walk() in
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  154   * a loop to find all PTEs that map the THP.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  155   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  156   * For HugeTLB pages, @pvmw->pte is set to the relevant page table entry
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  157   * regardless of which page table level the page is mapped at. @pvmw->pmd is
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  158   * NULL.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  159   *
baf2f90ba416cd Lu Jialin               2021-05-06  160   * Returns false if there are no more page table entries for the page in
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  161   * the vma. @pvmw->ptl is unlocked and @pvmw->pte is unmapped.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  162   *
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  163   * If you need to stop the walk before page_vma_mapped_walk() returned false,
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  164   * use page_vma_mapped_walk_done(). It will do the housekeeping.
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  165   */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  166  bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  167  {
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  168) 	struct vm_area_struct *vma = pvmw->vma;
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  169) 	struct mm_struct *mm = vma->vm_mm;
474466301dfd8b Hugh Dickins            2021-06-24  170  	unsigned long end;
2798bbe75b9c27 Hugh Dickins            2023-06-08  171  	spinlock_t *ptl;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  172  	pgd_t *pgd;
c2febafc67734a Kirill A. Shutemov      2017-03-09  173  	p4d_t *p4d;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  174  	pud_t *pud;
a7b100953aa33a Will Deacon             2017-10-13  175  	pmd_t pmde;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  176  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  177  	/* The only possible pmd mapping has been handled on last iteration */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  178  	if (pvmw->pmd && !pvmw->pte)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  179  		return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  180  
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  181) 	if (unlikely(is_vm_hugetlb_page(vma))) {
98ea02597b9967 zhenwei pi              2022-04-07  182  		struct hstate *hstate = hstate_vma(vma);
98ea02597b9967 zhenwei pi              2022-04-07  183  		unsigned long size = huge_page_size(hstate);
6d0fd5987657cb Hugh Dickins            2021-06-24  184  		/* The only possible mapping was handled on last iteration */
d75450ff40df01 Hugh Dickins            2017-04-07  185  		if (pvmw->pte)
6d0fd5987657cb Hugh Dickins            2021-06-24  186  			return not_found(pvmw);
9c67a20704e763 Peter Xu                2022-12-16  187  		/*
9c67a20704e763 Peter Xu                2022-12-16  188  		 * All callers that get here will already hold the
9c67a20704e763 Peter Xu                2022-12-16  189  		 * i_mmap_rwsem.  Therefore, no additional locks need to be
9c67a20704e763 Peter Xu                2022-12-16  190  		 * taken before calling hugetlb_walk().
9c67a20704e763 Peter Xu                2022-12-16  191  		 */
9c67a20704e763 Peter Xu                2022-12-16  192  		pvmw->pte = hugetlb_walk(vma, pvmw->address, size);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  193  		if (!pvmw->pte)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  194  			return false;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  195  
8f0b747d7dde47 Miaohe Lin              2022-07-09  196  		pvmw->ptl = huge_pte_lock(hstate, mm, pvmw->pte);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  197  		if (!check_pte(pvmw))
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  198  			return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  199  		return true;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  200  	}
6d0fd5987657cb Hugh Dickins            2021-06-24  201  
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  202) 	end = vma_address_end(pvmw);
6d0fd5987657cb Hugh Dickins            2021-06-24  203  	if (pvmw->pte)
6d0fd5987657cb Hugh Dickins            2021-06-24  204  		goto next_pte;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  205  restart:
a9a7504d9beaf3 Hugh Dickins            2021-06-24  206  	do {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  207  		pgd = pgd_offset(mm, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  208  		if (!pgd_present(*pgd)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  209  			step_forward(pvmw, PGDIR_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  210  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  211  		}
c2febafc67734a Kirill A. Shutemov      2017-03-09  212  		p4d = p4d_offset(pgd, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  213  		if (!p4d_present(*p4d)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  214  			step_forward(pvmw, P4D_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  215  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  216  		}
c2febafc67734a Kirill A. Shutemov      2017-03-09  217  		pud = pud_offset(p4d, pvmw->address);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  218  		if (!pud_present(*pud)) {
a9a7504d9beaf3 Hugh Dickins            2021-06-24  219  			step_forward(pvmw, PUD_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  220  			continue;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  221  		}
b3807a91aca7d2 Hugh Dickins            2021-06-24  222  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  223  		pvmw->pmd = pmd_offset(pud, pvmw->address);
a7b100953aa33a Will Deacon             2017-10-13  224  		/*
a7b100953aa33a Will Deacon             2017-10-13  225  		 * Make sure the pmd value isn't cached in a register by the
a7b100953aa33a Will Deacon             2017-10-13  226  		 * compiler and used as a stale value after we've observed a
a7b100953aa33a Will Deacon             2017-10-13  227  		 * subsequent update.
a7b100953aa33a Will Deacon             2017-10-13  228  		 */
26e1a0c3277d7f Hugh Dickins            2023-06-08  229  		pmde = pmdp_get_lockless(pvmw->pmd);
b3807a91aca7d2 Hugh Dickins            2021-06-24  230  
6472f6d2f7d90c Muchun Song             2022-04-28  231  		if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde) ||
6472f6d2f7d90c Muchun Song             2022-04-28  232  		    (pmd_present(pmde) && pmd_devmap(pmde))) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  233  			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
3306d3119ceacc Hugh Dickins            2021-06-24  234  			pmde = *pvmw->pmd;
e2e1d4076c77b3 Hugh Dickins            2021-06-24  235  			if (!pmd_present(pmde)) {
e2e1d4076c77b3 Hugh Dickins            2021-06-24  236  				swp_entry_t entry;
616b8371539a6c Zi Yan                  2017-09-08  237  
e2e1d4076c77b3 Hugh Dickins            2021-06-24  238  				if (!thp_migration_supported() ||
e2e1d4076c77b3 Hugh Dickins            2021-06-24  239  				    !(pvmw->flags & PVMW_MIGRATION))
e2e1d4076c77b3 Hugh Dickins            2021-06-24  240  					return not_found(pvmw);
e2e1d4076c77b3 Hugh Dickins            2021-06-24  241  				entry = pmd_to_swp_entry(pmde);
e2e1d4076c77b3 Hugh Dickins            2021-06-24  242  				if (!is_migration_entry(entry) ||
0d206b5d2e0d7d Peter Xu                2022-08-11  243  				    !check_pmd(swp_offset_pfn(entry), pvmw))
616b8371539a6c Zi Yan                  2017-09-08  244  					return not_found(pvmw);
616b8371539a6c Zi Yan                  2017-09-08  245  				return true;
616b8371539a6c Zi Yan                  2017-09-08  246  			}
6472f6d2f7d90c Muchun Song             2022-04-28  247  			if (likely(pmd_trans_huge(pmde) || pmd_devmap(pmde))) {
6472f6d2f7d90c Muchun Song             2022-04-28  248  				if (pvmw->flags & PVMW_MIGRATION)
6472f6d2f7d90c Muchun Song             2022-04-28  249  					return not_found(pvmw);
6472f6d2f7d90c Muchun Song             2022-04-28  250  				if (!check_pmd(pmd_pfn(pmde), pvmw))
6472f6d2f7d90c Muchun Song             2022-04-28  251  					return not_found(pvmw);
6472f6d2f7d90c Muchun Song             2022-04-28  252  				return true;
6472f6d2f7d90c Muchun Song             2022-04-28  253  			}
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  254  			/* THP pmd was split under us: handle on pte level */
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  255  			spin_unlock(pvmw->ptl);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  256  			pvmw->ptl = NULL;
a7b100953aa33a Will Deacon             2017-10-13  257  		} else if (!pmd_present(pmde)) {
732ed55823fc3a Hugh Dickins            2021-06-15  258  			/*
732ed55823fc3a Hugh Dickins            2021-06-15  259  			 * If PVMW_SYNC, take and drop THP pmd lock so that we
732ed55823fc3a Hugh Dickins            2021-06-15  260  			 * cannot return prematurely, while zap_huge_pmd() has
732ed55823fc3a Hugh Dickins            2021-06-15  261  			 * cleared *pmd but not decremented compound_mapcount().
732ed55823fc3a Hugh Dickins            2021-06-15  262  			 */
b3807a91aca7d2 Hugh Dickins            2021-06-24  263  			if ((pvmw->flags & PVMW_SYNC) &&
c453d8c7d1384d Yang Shi                2022-05-13  264  			    transhuge_vma_suitable(vma, pvmw->address) &&
2aff7a4755bed2 Matthew Wilcox (Oracle  2022-02-03  265) 			    (pvmw->nr_pages >= HPAGE_PMD_NR)) {
732ed55823fc3a Hugh Dickins            2021-06-15  266  				spinlock_t *ptl = pmd_lock(mm, pvmw->pmd);
732ed55823fc3a Hugh Dickins            2021-06-15  267  
732ed55823fc3a Hugh Dickins            2021-06-15  268  				spin_unlock(ptl);
732ed55823fc3a Hugh Dickins            2021-06-15  269  			}
a9a7504d9beaf3 Hugh Dickins            2021-06-24  270  			step_forward(pvmw, PMD_SIZE);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  271  			continue;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  272  		}
2798bbe75b9c27 Hugh Dickins            2023-06-08  273  		if (!map_pte(pvmw, &ptl)) {
2798bbe75b9c27 Hugh Dickins            2023-06-08  274  			if (!pvmw->pte)
2798bbe75b9c27 Hugh Dickins            2023-06-08  275  				goto restart;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  276  			goto next_pte;
2798bbe75b9c27 Hugh Dickins            2023-06-08  277  		}
474466301dfd8b Hugh Dickins            2021-06-24  278  this_pte:
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  279  		if (check_pte(pvmw))
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  280  			return true;
d75450ff40df01 Hugh Dickins            2017-04-07  281  next_pte:
d75450ff40df01 Hugh Dickins            2017-04-07  282  		do {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  283  			pvmw->address += PAGE_SIZE;
494334e43c16d6 Hugh Dickins            2021-06-15  284  			if (pvmw->address >= end)
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  285  				return not_found(pvmw);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  286  			/* Did we cross page table boundary? */
448282487483d6 Hugh Dickins            2021-06-24  287  			if ((pvmw->address & (PMD_SIZE - PAGE_SIZE)) == 0) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  288  				if (pvmw->ptl) {
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  289  					spin_unlock(pvmw->ptl);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  290  					pvmw->ptl = NULL;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  291  				}
448282487483d6 Hugh Dickins            2021-06-24  292  				pte_unmap(pvmw->pte);
448282487483d6 Hugh Dickins            2021-06-24  293  				pvmw->pte = NULL;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  294  				goto restart;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  295  			}
448282487483d6 Hugh Dickins            2021-06-24  296  			pvmw->pte++;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  297  		} while (pte_none(*pvmw->pte));
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  298  
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  299  		if (!pvmw->ptl) {
2798bbe75b9c27 Hugh Dickins            2023-06-08 @300  			pvmw->ptl = ptl;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  301  			spin_lock(pvmw->ptl);
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  302  		}
474466301dfd8b Hugh Dickins            2021-06-24  303  		goto this_pte;
a9a7504d9beaf3 Hugh Dickins            2021-06-24  304  	} while (pvmw->address < end);
a9a7504d9beaf3 Hugh Dickins            2021-06-24  305  
a9a7504d9beaf3 Hugh Dickins            2021-06-24  306  	return false;
ace71a19cec5eb Kirill A. Shutemov      2017-02-24  307  }
6a328a626f98bb Kirill A. Shutemov      2017-02-24  308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
