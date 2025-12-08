Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87CB2C029A
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765219742; cv=none; b=OcleN0ZPTz18auhfAt9BaFFSeo+m69W8yc1nGPJxizWm8F/w3yZ8DhWKDcWZOb155bdpwjWCdmbLHJKbaTkqw5VsixMqww7SiEIjMdsHVCjJBgUpb0MWTlAxq1/BBPq/uO8LQoGre1aEUScgdkrP/ldtQEqo3eDwhGEMwKXYF44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765219742; c=relaxed/simple;
	bh=U3CpnBMHH9gzUvbwHvK2AyRxMx/DWgvu2LQm7Nj5VXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ttu8KE76YACD78KrJFoR4JFq6dKF/XNsoyZFG0wHBrxhYoRRDrXqJ0HHsT+qunracUVBgx8hRVooCJFMZGZ3YoG1vW8+sinm+tsUEO8OpDK/i9yLowMmL/u8wkh7HolIv0isInJlm6z1NGmnnGSVlC7CTqCAJkdVnBxqj9hm8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc8LR2oQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc8LR2oQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765219739; x=1796755739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3CpnBMHH9gzUvbwHvK2AyRxMx/DWgvu2LQm7Nj5VXs=;
  b=Bc8LR2oQwjNfGLtMtOKRdSwnh6Ya0rv4Dy94V5CTZ//3HdxgXG4qtRYO
   BTWpZuk5/t5wNzV0fjM58AU1qn10qvmmrKaNQ0SghsuzhWrlCq77tylJC
   qMd2aQLQE1Z4XZ+BnL4s9T/n7dXLi5xoYAEdLvZK8ptG4wo7zPsajUVA7
   HDk3jGE0iQ+SUTcP8+HHqhgJRbI7bS7Wi0GOXCkfCn/r0ZjK0zlmDJJvS
   /8vr44CVh/J1IAGTP+KzRhLrnCrWhnuPEpQp6ki72d0LP3kySquO2X17v
   7N+lmZMkw2J8jYDqzRccItjVre3TA+fI5qx3MHhbVKHIDC4S8hla8KGQr
   Q==;
X-CSE-ConnectionGUID: 3E52SoKwQZWARWLhLPQE+A==
X-CSE-MsgGUID: fc4RG8yyQKifdRpTx4QlfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67247777"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67247777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 10:48:58 -0800
X-CSE-ConnectionGUID: 9aImuqz/Qj+F5lCTBla1oA==
X-CSE-MsgGUID: hwHWJ/fwQOmVYVTnt4GWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="201128976"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2025 10:48:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgI1-000000000jP-3lf1;
	Mon, 08 Dec 2025 18:48:53 +0000
Date: Tue, 9 Dec 2025 02:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v13 mm-new 07/16] khugepaged: introduce
 collapse_max_ptes_none helper function
Message-ID: <202512090239.PI28RhRo-lkp@intel.com>
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
In-Reply-To: <20251201174627.23295-8-npache@redhat.com>
References: <20251201174627.23295-8-npache@redhat.com>
TO: Nico Pache <npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20251208]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-collapse_/20251202-015150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251201174627.23295-8-npache%40redhat.com
patch subject: [PATCH v13 mm-new 07/16] khugepaged: introduce collapse_max_ptes_none helper function
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090239.PI28RhRo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512090239.PI28RhRo-lkp@intel.com/

smatch warnings:
mm/khugepaged.c:724 __collapse_huge_page_isolate() error: uninitialized symbol '_pte'.

vim +/_pte +724 mm/khugepaged.c

b46e756f5e4703 Kirill A. Shutemov    2016-07-26  580  
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  581  static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
ffd26dcc465d32 Nico Pache            2025-12-01  582  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
ffd26dcc465d32 Nico Pache            2025-12-01  583  		unsigned int order, struct list_head *compound_pagelist)
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  584  {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  585  	struct page *page = NULL;
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  586) 	struct folio *folio = NULL;
1acc369373008b Wei Yang              2025-09-22  587  	unsigned long addr = start_addr;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  588  	pte_t *_pte;
50ad2f24b3b48c Zach O'Keefe          2022-07-06  589  	int none_or_zero = 0, shared = 0, result = SCAN_FAIL, referenced = 0;
ffd26dcc465d32 Nico Pache            2025-12-01  590  	const unsigned long nr_pages = 1UL << order;
04313aec37d2ac Nico Pache            2025-12-01  591  	int max_ptes_none = collapse_max_ptes_none(order, !cc->is_khugepaged);
04313aec37d2ac Nico Pache            2025-12-01  592  
04313aec37d2ac Nico Pache            2025-12-01  593  	if (max_ptes_none == -EINVAL)
04313aec37d2ac Nico Pache            2025-12-01  594  		goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  595  
ffd26dcc465d32 Nico Pache            2025-12-01  596  	for (_pte = pte; _pte < pte + nr_pages;
1acc369373008b Wei Yang              2025-09-22  597  	     _pte++, addr += PAGE_SIZE) {
c33c794828f212 Ryan Roberts          2023-06-12  598  		pte_t pteval = ptep_get(_pte);
074f027d15c10c Lance Yang            2025-10-20  599  		if (pte_none_or_zero(pteval)) {
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  600  			++none_or_zero;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  601  			if (!userfaultfd_armed(vma) &&
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  602  			    (!cc->is_khugepaged ||
ffd26dcc465d32 Nico Pache            2025-12-01  603  			     none_or_zero <= max_ptes_none)) {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  604  				continue;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  605  			} else {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  606  				result = SCAN_EXCEED_NONE_PTE;
e9ea874a8ffb0f Yang Yang             2022-01-14  607  				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  608  				goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  609  			}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  610  		}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  611  		if (!pte_present(pteval)) {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  612  			result = SCAN_PTE_NON_PRESENT;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  613  			goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  614  		}
dd47ac428c3f5f Peter Xu              2023-04-05  615  		if (pte_uffd_wp(pteval)) {
dd47ac428c3f5f Peter Xu              2023-04-05  616  			result = SCAN_PTE_UFFD_WP;
dd47ac428c3f5f Peter Xu              2023-04-05  617  			goto out;
dd47ac428c3f5f Peter Xu              2023-04-05  618  		}
1acc369373008b Wei Yang              2025-09-22  619  		page = vm_normal_page(vma, addr, pteval);
3218f8712d6bba Alex Sierra           2022-07-15  620  		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  621  			result = SCAN_PAGE_NULL;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  622  			goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  623  		}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  624  
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  625) 		folio = page_folio(page);
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  626) 		VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  627  
3f7fc2c6e09310 Nico Pache            2025-12-01  628  		/* See collapse_scan_pmd(). */
003fde4492c88a David Hildenbrand     2025-03-03  629  		if (folio_maybe_mapped_shared(folio)) {
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  630  			++shared;
ffd26dcc465d32 Nico Pache            2025-12-01  631  			/*
ffd26dcc465d32 Nico Pache            2025-12-01  632  			 * TODO: Support shared pages without leading to further
ffd26dcc465d32 Nico Pache            2025-12-01  633  			 * mTHP collapses. Currently bringing in new pages via
ffd26dcc465d32 Nico Pache            2025-12-01  634  			 * shared may cause a future higher order collapse on a
ffd26dcc465d32 Nico Pache            2025-12-01  635  			 * rescan of the same range.
ffd26dcc465d32 Nico Pache            2025-12-01  636  			 */
ffd26dcc465d32 Nico Pache            2025-12-01  637  			if (is_mthp_order(order) || (cc->is_khugepaged &&
ffd26dcc465d32 Nico Pache            2025-12-01  638  			    shared > khugepaged_max_ptes_shared)) {
71a2c112a0f6da Kirill A. Shutemov    2020-06-03  639  				result = SCAN_EXCEED_SHARED_PTE;
e9ea874a8ffb0f Yang Yang             2022-01-14  640  				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
71a2c112a0f6da Kirill A. Shutemov    2020-06-03  641  				goto out;
71a2c112a0f6da Kirill A. Shutemov    2020-06-03  642  			}
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  643  		}
71a2c112a0f6da Kirill A. Shutemov    2020-06-03  644  
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  645) 		if (folio_test_large(folio)) {
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  646) 			struct folio *f;
fece2029a9e65b Kirill A. Shutemov    2018-03-22  647  
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  648  			/*
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  649  			 * Check if we have dealt with the compound page
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  650  			 * already
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  651  			 */
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  652) 			list_for_each_entry(f, compound_pagelist, lru) {
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  653) 				if (folio == f)
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  654  					goto next;
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  655  			}
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  656  		}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  657  
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  658  		/*
775d28fd45a2f5 Kefeng Wang           2024-08-26  659  		 * We can do it before folio_isolate_lru because the
775d28fd45a2f5 Kefeng Wang           2024-08-26  660  		 * folio can't be freed from under us. NOTE: PG_lock
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  661  		 * is needed to serialize against split_huge_page
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  662  		 * when invoked from the VM.
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  663  		 */
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  664) 		if (!folio_trylock(folio)) {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  665  			result = SCAN_PAGE_LOCK;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  666  			goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  667  		}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  668  
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  669  		/*
9445689f3b6170 Kirill A. Shutemov    2020-06-03  670  		 * Check if the page has any GUP (or other external) pins.
9445689f3b6170 Kirill A. Shutemov    2020-06-03  671  		 *
9445689f3b6170 Kirill A. Shutemov    2020-06-03  672  		 * The page table that maps the page has been already unlinked
9445689f3b6170 Kirill A. Shutemov    2020-06-03  673  		 * from the page table tree and this process cannot get
f0953a1bbaca71 Ingo Molnar           2021-05-06  674  		 * an additional pin on the page.
9445689f3b6170 Kirill A. Shutemov    2020-06-03  675  		 *
9445689f3b6170 Kirill A. Shutemov    2020-06-03  676  		 * New pins can come later if the page is shared across fork,
9445689f3b6170 Kirill A. Shutemov    2020-06-03  677  		 * but not from this process. The other process cannot write to
9445689f3b6170 Kirill A. Shutemov    2020-06-03  678  		 * the page, only trigger CoW.
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  679  		 */
0b43b8bc8ef88b Shivank Garg          2025-05-26  680  		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  681) 			folio_unlock(folio);
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  682  			result = SCAN_PAGE_COUNT;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  683  			goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  684  		}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  685  
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  686  		/*
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  687  		 * Isolate the page to avoid collapsing an hugepage
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  688  		 * currently in use by the VM.
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  689  		 */
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  690) 		if (!folio_isolate_lru(folio)) {
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  691) 			folio_unlock(folio);
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  692  			result = SCAN_DEL_PAGE_LRU;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  693  			goto out;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  694  		}
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  695) 		node_stat_mod_folio(folio,
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  696) 				NR_ISOLATED_ANON + folio_is_file_lru(folio),
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  697) 				folio_nr_pages(folio));
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  698) 		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  699) 		VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  700  
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  701) 		if (folio_test_large(folio))
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  702) 			list_add_tail(&folio->lru, compound_pagelist);
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03  703  next:
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  704  		/*
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  705  		 * If collapse was initiated by khugepaged, check that there is
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  706  		 * enough young pte to justify collapsing the page
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  707  		 */
d8ea7cc8547ca3 Zach O'Keefe          2022-07-06  708  		if (cc->is_khugepaged &&
8dd1e896735f6e Vishal Moola (Oracle  2023-10-20  709) 		    (pte_young(pteval) || folio_test_young(folio) ||
1acc369373008b Wei Yang              2025-09-22  710  		     folio_test_referenced(folio) ||
1acc369373008b Wei Yang              2025-09-22  711  		     mmu_notifier_test_young(vma->vm_mm, addr)))
0db501f7a34c11 Ebru Akagunduz        2016-07-26  712  			referenced++;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  713  	}
74e579bf231a33 Miaohe Lin            2021-05-04  714  
62b98015d98815 Dev Jain              2025-09-08  715  	if (unlikely(cc->is_khugepaged && !referenced)) {
74e579bf231a33 Miaohe Lin            2021-05-04  716  		result = SCAN_LACK_REFERENCED_PAGE;
74e579bf231a33 Miaohe Lin            2021-05-04  717  	} else {
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  718  		result = SCAN_SUCCEED;
50dbe531291abf Fan Ni                2025-04-24  719  		trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
473b73222f3d8c Dev Jain              2025-09-08  720  						    referenced, result);
50ad2f24b3b48c Zach O'Keefe          2022-07-06  721  		return result;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  722  	}
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  723  out:
5503fbf2b0b80c Kirill A. Shutemov    2020-06-03 @724  	release_pte_pages(pte, _pte, compound_pagelist);
50dbe531291abf Fan Ni                2025-04-24  725  	trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
473b73222f3d8c Dev Jain              2025-09-08  726  					    referenced, result);
50ad2f24b3b48c Zach O'Keefe          2022-07-06  727  	return result;
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  728  }
b46e756f5e4703 Kirill A. Shutemov    2016-07-26  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
