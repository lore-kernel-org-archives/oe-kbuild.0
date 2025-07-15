Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EB52A1B2
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752539567; cv=none; b=aGkoF/294yQS7VUnW0xXXVAL0dnpHw8pzR2z5rVuHXOkE3p11fn/XLXPjaFBCRDkk5PJAJk+p/BXXw/uAtrW4E7r/cNPzVr9TQyHeq2ybUb0UocnXMO/8FhKj3S//FEHFoVav0hh0khDCKLXFm7E0J5yqmIQVYWiBr/0etnGujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752539567; c=relaxed/simple;
	bh=M+kulXl5aOpNygYMA6aBEI6M4ZzyqzcNRfBSJPlrwGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLjwYiA7VAh3PaZMweTwyGxfhw0rlYJWL5GLv/WsaoHCr4YSQ48fZbh6waI0Wl4sDWyndItl3X6AfGrQ+ds76Zd6l14TrDS5ECw3YoNrPHzoq3ZUxo6owPgSknXd638VgJEcJiOwdbN1CgKbuBI6BacpzNUevzObNtsgC1rlK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCtFKu3W; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCtFKu3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752539564; x=1784075564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M+kulXl5aOpNygYMA6aBEI6M4ZzyqzcNRfBSJPlrwGM=;
  b=NCtFKu3WXEN53FxaXdV+Bs1owVCz7IjPU5m1h6Fw3ZMoL/qLAQX+qlNr
   bb7gVZhlsIIZRidDClOE9U6X9/qd/T/orBTDlxVY7st1iK5MSx5hKvE08
   rUpBQHz0iyVmF9TDZzZTc8o1G3q0niBWySV1dN9w3pTqWu1zowTFvoxxn
   PJT+b6RdczuXLcvHE+7isvrjx1SimTuzTtaa8UMnkq5I8UFcHOatWWHgS
   HlP0ops9AZzb8xvfoCKYqGmvcVBvnrCVLMrzxIT9DzLyn6ZSRC+SYElSe
   1LFyOQopFn9nLRoSM3ATp3CoVgDvnY5e624T4s1wd4zcGzBF5qgpKQCRo
   A==;
X-CSE-ConnectionGUID: L1k5e/hiQNW8OGS+w6zoAg==
X-CSE-MsgGUID: ixeqP3DPSxaPzUJWPuTe2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77283804"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="77283804"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 17:32:44 -0700
X-CSE-ConnectionGUID: fbiUC9A2TmyVTlc0mpavSg==
X-CSE-MsgGUID: 2X/N6flpRY+9jJQQ0Pl4OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="156716625"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 17:32:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubTb5-0009Tv-31;
	Tue, 15 Jul 2025 00:32:39 +0000
Date: Tue, 15 Jul 2025 08:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/rmap.c:1696 try_to_unmap_one() error: we previously assumed
 'pvmw.pte' could be null (see line 1681)
Message-ID: <202507150812.6uA6pcHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lance Yang <ioworker0@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 29e847d2ade3cdff36afe095fdbeb9b5f71a197a mm/rmap: integrate PMD-mapped folio splitting into pagewalk loop
date:   1 year ago
:::::: branch date: 27 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150812.6uA6pcHE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150812.6uA6pcHE-lkp@intel.com/

smatch warnings:
mm/rmap.c:1696 try_to_unmap_one() error: we previously assumed 'pvmw.pte' could be null (see line 1681)

vim +1696 mm/rmap.c

b06dc281aa99010 David Hildenbrand          2023-12-20  1619  
^1da177e4c3f415 Linus Torvalds             2005-04-16  1620  /*
52629506420ce32 Joonsoo Kim                2014-01-21  1621   * @arg: enum ttu_flags will be passed to this argument
^1da177e4c3f415 Linus Torvalds             2005-04-16  1622   */
2f031c6f042cb8a Matthew Wilcox (Oracle     2022-01-29  1623) static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
52629506420ce32 Joonsoo Kim                2014-01-21  1624  		     unsigned long address, void *arg)
^1da177e4c3f415 Linus Torvalds             2005-04-16  1625  {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1626  	struct mm_struct *mm = vma->vm_mm;
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1627) 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1628  	pte_t pteval;
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1629  	struct page *subpage;
6c287605fd56466 David Hildenbrand          2022-05-09  1630  	bool anon_exclusive, ret = true;
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1631  	struct mmu_notifier_range range;
4708f31885a0d3e Palmer Dabbelt             2020-04-06  1632  	enum ttu_flags flags = (enum ttu_flags)(long)arg;
c33c794828f2121 Ryan Roberts               2023-06-12  1633  	unsigned long pfn;
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1634  	unsigned long hsz = 0;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1635  
732ed55823fc3ad Hugh Dickins               2021-06-15  1636  	/*
732ed55823fc3ad Hugh Dickins               2021-06-15  1637  	 * When racing against e.g. zap_pte_range() on another cpu,
ca1a0746182c3c0 David Hildenbrand          2023-12-20  1638  	 * in between its ptep_get_and_clear_full() and folio_remove_rmap_*(),
1fb08ac63beedf5 Yang Shi                   2021-06-30  1639  	 * try_to_unmap() may return before page_mapped() has become false,
732ed55823fc3ad Hugh Dickins               2021-06-15  1640  	 * if page table locking is skipped: use TTU_SYNC to wait for that.
732ed55823fc3ad Hugh Dickins               2021-06-15  1641  	 */
732ed55823fc3ad Hugh Dickins               2021-06-15  1642  	if (flags & TTU_SYNC)
732ed55823fc3ad Hugh Dickins               2021-06-15  1643  		pvmw.flags = PVMW_SYNC;
732ed55823fc3ad Hugh Dickins               2021-06-15  1644  
369ea8242c0fb52 Jérôme Glisse              2017-08-31  1645  	/*
017b1660df89f5f Mike Kravetz               2018-10-05  1646  	 * For THP, we have to assume the worse case ie pmd for invalidation.
017b1660df89f5f Mike Kravetz               2018-10-05  1647  	 * For hugetlb, it could be much worse if we need to do pud
017b1660df89f5f Mike Kravetz               2018-10-05  1648  	 * invalidation in the case of pmd sharing.
017b1660df89f5f Mike Kravetz               2018-10-05  1649  	 *
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1650) 	 * Note that the folio can not be freed in this function as call of
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1651) 	 * try_to_unmap() must hold a reference on the folio.
369ea8242c0fb52 Jérôme Glisse              2017-08-31  1652  	 */
2aff7a4755bed28 Matthew Wilcox (Oracle     2022-02-03  1653) 	range.end = vma_address_end(&pvmw);
7d4a8be0c4b2b7f Alistair Popple            2023-01-10  1654  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
494334e43c16d63 Hugh Dickins               2021-06-15  1655  				address, range.end);
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1656) 	if (folio_test_hugetlb(folio)) {
017b1660df89f5f Mike Kravetz               2018-10-05  1657  		/*
017b1660df89f5f Mike Kravetz               2018-10-05  1658  		 * If sharing is possible, start and end will be adjusted
017b1660df89f5f Mike Kravetz               2018-10-05  1659  		 * accordingly.
017b1660df89f5f Mike Kravetz               2018-10-05  1660  		 */
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1661  		adjust_range_if_pmd_sharing_possible(vma, &range.start,
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1662  						     &range.end);
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1663  
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1664  		/* We need the huge page size for set_huge_pte_at() */
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1665  		hsz = huge_page_size(hstate_vma(vma));
017b1660df89f5f Mike Kravetz               2018-10-05  1666  	}
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1667  	mmu_notifier_invalidate_range_start(&range);
369ea8242c0fb52 Jérôme Glisse              2017-08-31  1668  
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1669  	while (page_vma_mapped_walk(&pvmw)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1670  		/*
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1671) 		 * If the folio is in an mlock()d vma, we must not swap it out.
^1da177e4c3f415 Linus Torvalds             2005-04-16  1672  		 */
efdb6720b44b2f0 Hugh Dickins               2021-07-11  1673  		if (!(flags & TTU_IGNORE_MLOCK) &&
efdb6720b44b2f0 Hugh Dickins               2021-07-11  1674  		    (vma->vm_flags & VM_LOCKED)) {
cea86fe246b694a Hugh Dickins               2022-02-14  1675  			/* Restore the mlock which got missed */
1acbc3f936146d1 Yin Fengwei                2023-09-18  1676  			if (!folio_test_large(folio))
1acbc3f936146d1 Yin Fengwei                2023-09-18  1677  				mlock_vma_folio(folio, vma);
26d21b18d971c8b Lance Yang                 2024-06-14  1678  			goto walk_abort;
b87537d9e2feb30 Hugh Dickins               2015-11-05  1679  		}
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1680  
29e847d2ade3cdf Lance Yang                 2024-06-14 @1681  		if (!pvmw.pte && (flags & TTU_SPLIT_HUGE_PMD)) {
29e847d2ade3cdf Lance Yang                 2024-06-14  1682  			/*
29e847d2ade3cdf Lance Yang                 2024-06-14  1683  			 * We temporarily have to drop the PTL and start once
29e847d2ade3cdf Lance Yang                 2024-06-14  1684  			 * again from that now-PTE-mapped page table.
29e847d2ade3cdf Lance Yang                 2024-06-14  1685  			 */
29e847d2ade3cdf Lance Yang                 2024-06-14  1686  			split_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
29e847d2ade3cdf Lance Yang                 2024-06-14  1687  					      false, folio);
29e847d2ade3cdf Lance Yang                 2024-06-14  1688  			flags &= ~TTU_SPLIT_HUGE_PMD;
29e847d2ade3cdf Lance Yang                 2024-06-14  1689  			page_vma_mapped_walk_restart(&pvmw);
29e847d2ade3cdf Lance Yang                 2024-06-14  1690  			continue;
29e847d2ade3cdf Lance Yang                 2024-06-14  1691  		}
29e847d2ade3cdf Lance Yang                 2024-06-14  1692  
29e847d2ade3cdf Lance Yang                 2024-06-14  1693  		/* Unexpected PMD-mapped THP? */
29e847d2ade3cdf Lance Yang                 2024-06-14  1694  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
29e847d2ade3cdf Lance Yang                 2024-06-14  1695  
c33c794828f2121 Ryan Roberts               2023-06-12 @1696  		pfn = pte_pfn(ptep_get(pvmw.pte));
c33c794828f2121 Ryan Roberts               2023-06-12  1697  		subpage = folio_page(folio, pfn - folio_pfn(folio));
785373b4c38719f Linus Torvalds             2017-08-29  1698  		address = pvmw.address;
6c287605fd56466 David Hildenbrand          2022-05-09  1699  		anon_exclusive = folio_test_anon(folio) &&
6c287605fd56466 David Hildenbrand          2022-05-09  1700  				 PageAnonExclusive(subpage);
785373b4c38719f Linus Torvalds             2017-08-29  1701  
dfc7ab57560da38 Baolin Wang                2022-05-09  1702  		if (folio_test_hugetlb(folio)) {
0506c31d0a8443a Baolin Wang                2022-06-20  1703  			bool anon = folio_test_anon(folio);
0506c31d0a8443a Baolin Wang                2022-06-20  1704  
a00a875925a418b Baolin Wang                2022-05-13  1705  			/*
a00a875925a418b Baolin Wang                2022-05-13  1706  			 * The try_to_unmap() is only passed a hugetlb page
a00a875925a418b Baolin Wang                2022-05-13  1707  			 * in the case where the hugetlb page is poisoned.
a00a875925a418b Baolin Wang                2022-05-13  1708  			 */
a00a875925a418b Baolin Wang                2022-05-13  1709  			VM_BUG_ON_PAGE(!PageHWPoison(subpage), subpage);
017b1660df89f5f Mike Kravetz               2018-10-05  1710  			/*
54205e9c5425049 Baolin Wang                2022-05-09  1711  			 * huge_pmd_unshare may unmap an entire PMD page.
54205e9c5425049 Baolin Wang                2022-05-09  1712  			 * There is no way of knowing exactly which PMDs may
54205e9c5425049 Baolin Wang                2022-05-09  1713  			 * be cached for this mm, so we must flush them all.
54205e9c5425049 Baolin Wang                2022-05-09  1714  			 * start/end were already adjusted above to cover this
54205e9c5425049 Baolin Wang                2022-05-09  1715  			 * range.
017b1660df89f5f Mike Kravetz               2018-10-05  1716  			 */
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1717  			flush_cache_range(vma, range.start, range.end);
54205e9c5425049 Baolin Wang                2022-05-09  1718  
dfc7ab57560da38 Baolin Wang                2022-05-09  1719  			/*
dfc7ab57560da38 Baolin Wang                2022-05-09  1720  			 * To call huge_pmd_unshare, i_mmap_rwsem must be
dfc7ab57560da38 Baolin Wang                2022-05-09  1721  			 * held in write mode.  Caller needs to explicitly
dfc7ab57560da38 Baolin Wang                2022-05-09  1722  			 * do this outside rmap routines.
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1723  			 *
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1724  			 * We also must hold hugetlb vma_lock in write mode.
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1725  			 * Lock order dictates acquiring vma_lock BEFORE
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1726  			 * i_mmap_rwsem.  We can only try lock here and fail
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1727  			 * if unsuccessful.
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1728  			 */
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1729  			if (!anon) {
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1730  				VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
26d21b18d971c8b Lance Yang                 2024-06-14  1731  				if (!hugetlb_vma_trylock_write(vma))
26d21b18d971c8b Lance Yang                 2024-06-14  1732  					goto walk_abort;
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1733  				if (huge_pmd_unshare(mm, vma, address, pvmw.pte)) {
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1734  					hugetlb_vma_unlock_write(vma);
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1735  					flush_tlb_range(vma,
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1736  						range.start, range.end);
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1737  					/*
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1738  					 * The ref count of the PMD page was
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1739  					 * dropped which is part of the way map
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1740  					 * counting is done for shared PMDs.
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1741  					 * Return 'true' here.  When there is
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1742  					 * no other sharing, huge_pmd_unshare
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1743  					 * returns false and we will unmap the
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1744  					 * actual page and drop map count
017b1660df89f5f Mike Kravetz               2018-10-05  1745  					 * to zero.
017b1660df89f5f Mike Kravetz               2018-10-05  1746  					 */
26d21b18d971c8b Lance Yang                 2024-06-14  1747  					goto walk_done;
017b1660df89f5f Mike Kravetz               2018-10-05  1748  				}
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1749  				hugetlb_vma_unlock_write(vma);
40549ba8f8e0ed1 Mike Kravetz               2022-09-14  1750  			}
a00a875925a418b Baolin Wang                2022-05-13  1751  			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
54205e9c5425049 Baolin Wang                2022-05-09  1752  		} else {
c33c794828f2121 Ryan Roberts               2023-06-12  1753  			flush_cache_page(vma, address, pfn);
088b8aa537c2c76 David Hildenbrand          2022-09-01  1754  			/* Nuke the page table entry. */
088b8aa537c2c76 David Hildenbrand          2022-09-01  1755  			if (should_defer_flush(mm, flags)) {
72b252aed506b8f Mel Gorman                 2015-09-04  1756  				/*
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1757  				 * We clear the PTE but do not flush so potentially
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1758) 				 * a remote CPU could still be writing to the folio.
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1759  				 * If the entry was previously clean then the
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1760  				 * architecture must guarantee that a clear->dirty
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1761  				 * transition on a cached TLB entry is written through
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1762  				 * and traps if the PTE is unmapped.
72b252aed506b8f Mel Gorman                 2015-09-04  1763  				 */
785373b4c38719f Linus Torvalds             2017-08-29  1764  				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
72b252aed506b8f Mel Gorman                 2015-09-04  1765  
f73419bb89d606d Barry Song                 2023-07-17  1766  				set_tlb_ubc_flush_pending(mm, pteval, address);
72b252aed506b8f Mel Gorman                 2015-09-04  1767  			} else {
785373b4c38719f Linus Torvalds             2017-08-29  1768  				pteval = ptep_clear_flush(vma, address, pvmw.pte);
72b252aed506b8f Mel Gorman                 2015-09-04  1769  			}
a00a875925a418b Baolin Wang                2022-05-13  1770  		}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1771  
999dad824c39ed1 Peter Xu                   2022-05-12  1772  		/*
999dad824c39ed1 Peter Xu                   2022-05-12  1773  		 * Now the pte is cleared. If this pte was uffd-wp armed,
999dad824c39ed1 Peter Xu                   2022-05-12  1774  		 * we may want to replace a none pte with a marker pte if
999dad824c39ed1 Peter Xu                   2022-05-12  1775  		 * it's file-backed, so we don't lose the tracking info.
999dad824c39ed1 Peter Xu                   2022-05-12  1776  		 */
999dad824c39ed1 Peter Xu                   2022-05-12  1777  		pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
999dad824c39ed1 Peter Xu                   2022-05-12  1778  
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1779) 		/* Set the dirty flag on the folio now the pte is gone. */
^1da177e4c3f415 Linus Torvalds             2005-04-16  1780  		if (pte_dirty(pteval))
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1781) 			folio_mark_dirty(folio);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1782  
365e9c87a982c03 Hugh Dickins               2005-10-29  1783  		/* Update high watermark before we lower rss */
365e9c87a982c03 Hugh Dickins               2005-10-29  1784  		update_hiwater_rss(mm);
365e9c87a982c03 Hugh Dickins               2005-10-29  1785  
6da6b1d4a7df8c3 Naoya Horiguchi            2023-02-21  1786  		if (PageHWPoison(subpage) && (flags & TTU_HWPOISON)) {
5fd27b8e7dbcab0 Punit Agrawal              2017-07-06  1787  			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1788) 			if (folio_test_hugetlb(folio)) {
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1789) 				hugetlb_count_sub(folio_nr_pages(folio), mm);
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1790  				set_huge_pte_at(mm, address, pvmw.pte, pteval,
935d4f0c6dc8b35 Ryan Roberts               2023-09-22  1791  						hsz);
5d317b2b6536592 Naoya Horiguchi            2015-11-05  1792  			} else {
a23f517b0e15544 Kefeng Wang                2024-01-11  1793  				dec_mm_counter(mm, mm_counter(folio));
785373b4c38719f Linus Torvalds             2017-08-29  1794  				set_pte_at(mm, address, pvmw.pte, pteval);
5f24ae585be9856 Naoya Horiguchi            2012-12-12  1795  			}
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1796  
bce73e4842390f7 Christian Borntraeger      2018-07-13  1797  		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
45961722f8e30ce Konstantin Weitz           2013-04-17  1798  			/*
45961722f8e30ce Konstantin Weitz           2013-04-17  1799  			 * The guest indicated that the page content is of no
45961722f8e30ce Konstantin Weitz           2013-04-17  1800  			 * interest anymore. Simply discard the pte, vmscan
45961722f8e30ce Konstantin Weitz           2013-04-17  1801  			 * will take care of the rest.
bce73e4842390f7 Christian Borntraeger      2018-07-13  1802  			 * A future reference will then fault in a new zero
bce73e4842390f7 Christian Borntraeger      2018-07-13  1803  			 * page. When userfaultfd is active, we must not drop
bce73e4842390f7 Christian Borntraeger      2018-07-13  1804  			 * this page though, as its main user (postcopy
bce73e4842390f7 Christian Borntraeger      2018-07-13  1805  			 * migration) will not expect userfaults on already
bce73e4842390f7 Christian Borntraeger      2018-07-13  1806  			 * copied pages.
45961722f8e30ce Konstantin Weitz           2013-04-17  1807  			 */
a23f517b0e15544 Kefeng Wang                2024-01-11  1808  			dec_mm_counter(mm, mm_counter(folio));
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1809) 		} else if (folio_test_anon(folio)) {
cfeed8ffe55b37f David Hildenbrand          2023-08-21  1810  			swp_entry_t entry = page_swap_entry(subpage);
179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1811  			pte_t swp_pte;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1812  			/*
^1da177e4c3f415 Linus Torvalds             2005-04-16  1813  			 * Store the swap location in the pte.
^1da177e4c3f415 Linus Torvalds             2005-04-16  1814  			 * See handle_pte_fault() ...
^1da177e4c3f415 Linus Torvalds             2005-04-16  1815  			 */
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1816) 			if (unlikely(folio_test_swapbacked(folio) !=
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1817) 					folio_test_swapcache(folio))) {
eb94a8784427b28 Minchan Kim                2017-05-03  1818  				WARN_ON_ONCE(1);
26d21b18d971c8b Lance Yang                 2024-06-14  1819  				goto walk_abort;
eb94a8784427b28 Minchan Kim                2017-05-03  1820  			}
854e9ed09dedf0c Minchan Kim                2016-01-15  1821  
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1822  			/* MADV_FREE page check */
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1823) 			if (!folio_test_swapbacked(folio)) {
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1824  				int ref_count, map_count;
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1825  
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1826  				/*
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1827  				 * Synchronize with gup_pte_range():
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1828  				 * - clear PTE; barrier; read refcount
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1829  				 * - inc refcount; barrier; read PTE
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1830  				 */
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1831  				smp_mb();
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1832  
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1833  				ref_count = folio_ref_count(folio);
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1834  				map_count = folio_mapcount(folio);
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1835  
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1836  				/*
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1837  				 * Order reads for page refcount and dirty flag
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1838  				 * (see comments in __remove_mapping()).
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1839  				 */
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1840  				smp_rmb();
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1841  
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1842  				/*
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1843  				 * The only page refs must be one from isolation
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1844  				 * plus the rmap(s) (dropped by discard:).
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1845  				 */
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1846  				if (ref_count == 1 + map_count &&
6c8e2a256915a22 Mauricio Faria de Oliveira 2022-03-24  1847  				    !folio_test_dirty(folio)) {
854e9ed09dedf0c Minchan Kim                2016-01-15  1848  					dec_mm_counter(mm, MM_ANONPAGES);
854e9ed09dedf0c Minchan Kim                2016-01-15  1849  					goto discard;
854e9ed09dedf0c Minchan Kim                2016-01-15  1850  				}
854e9ed09dedf0c Minchan Kim                2016-01-15  1851  
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1852  				/*
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1853) 				 * If the folio was redirtied, it cannot be
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1854  				 * discarded. Remap the page to page table.
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1855  				 */
785373b4c38719f Linus Torvalds             2017-08-29  1856  				set_pte_at(mm, address, pvmw.pte, pteval);
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1857) 				folio_set_swapbacked(folio);
26d21b18d971c8b Lance Yang                 2024-06-14  1858  				goto walk_abort;
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1859  			}
802a3a92ad7ac0b Shaohua Li                 2017-05-03  1860  
570a335b8e22579 Hugh Dickins               2009-12-14  1861  			if (swap_duplicate(entry) < 0) {
785373b4c38719f Linus Torvalds             2017-08-29  1862  				set_pte_at(mm, address, pvmw.pte, pteval);
26d21b18d971c8b Lance Yang                 2024-06-14  1863  				goto walk_abort;
570a335b8e22579 Hugh Dickins               2009-12-14  1864  			}
ca827d55ebaa24d Khalid Aziz                2018-02-21  1865  			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
322842ea3c72649 David Hildenbrand          2022-05-09  1866  				swap_free(entry);
ca827d55ebaa24d Khalid Aziz                2018-02-21  1867  				set_pte_at(mm, address, pvmw.pte, pteval);
26d21b18d971c8b Lance Yang                 2024-06-14  1868  				goto walk_abort;
ca827d55ebaa24d Khalid Aziz                2018-02-21  1869  			}
088b8aa537c2c76 David Hildenbrand          2022-09-01  1870  
e3b4b1374f87c71 David Hildenbrand          2023-12-20  1871  			/* See folio_try_share_anon_rmap(): clear PTE first. */
6c287605fd56466 David Hildenbrand          2022-05-09  1872  			if (anon_exclusive &&
e3b4b1374f87c71 David Hildenbrand          2023-12-20  1873  			    folio_try_share_anon_rmap_pte(folio, subpage)) {
6c287605fd56466 David Hildenbrand          2022-05-09  1874  				swap_free(entry);
6c287605fd56466 David Hildenbrand          2022-05-09  1875  				set_pte_at(mm, address, pvmw.pte, pteval);
26d21b18d971c8b Lance Yang                 2024-06-14  1876  				goto walk_abort;
6c287605fd56466 David Hildenbrand          2022-05-09  1877  			}
^1da177e4c3f415 Linus Torvalds             2005-04-16  1878  			if (list_empty(&mm->mmlist)) {
^1da177e4c3f415 Linus Torvalds             2005-04-16  1879  				spin_lock(&mmlist_lock);
f412ac08c9861b4 Hugh Dickins               2005-10-29  1880  				if (list_empty(&mm->mmlist))
^1da177e4c3f415 Linus Torvalds             2005-04-16  1881  					list_add(&mm->mmlist, &init_mm.mmlist);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1882  				spin_unlock(&mmlist_lock);
^1da177e4c3f415 Linus Torvalds             2005-04-16  1883  			}
d559db086ff5be9 KAMEZAWA Hiroyuki          2010-03-05  1884  			dec_mm_counter(mm, MM_ANONPAGES);
b084d4353ff99d8 KAMEZAWA Hiroyuki          2010-03-05  1885  			inc_mm_counter(mm, MM_SWAPENTS);
179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1886  			swp_pte = swp_entry_to_pte(entry);
1493a1913e34b0a David Hildenbrand          2022-05-09  1887  			if (anon_exclusive)
1493a1913e34b0a David Hildenbrand          2022-05-09  1888  				swp_pte = pte_swp_mkexclusive(swp_pte);
179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1889  			if (pte_soft_dirty(pteval))
179ef71cbc08525 Cyrill Gorcunov            2013-08-13  1890  				swp_pte = pte_swp_mksoft_dirty(swp_pte);
f45ec5ff16a75f9 Peter Xu                   2020-04-06  1891  			if (pte_uffd_wp(pteval))
f45ec5ff16a75f9 Peter Xu                   2020-04-06  1892  				swp_pte = pte_swp_mkuffd_wp(swp_pte);
785373b4c38719f Linus Torvalds             2017-08-29  1893  			set_pte_at(mm, address, pvmw.pte, swp_pte);
0f10851ea475e08 Jérôme Glisse              2017-11-15  1894  		} else {
0f10851ea475e08 Jérôme Glisse              2017-11-15  1895  			/*
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1896) 			 * This is a locked file-backed folio,
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1897) 			 * so it cannot be removed from the page
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1898) 			 * cache and replaced by a new folio before
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1899) 			 * mmu_notifier_invalidate_range_end, so no
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1900) 			 * concurrent thread might update its page table
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1901) 			 * to point at a new folio while a device is
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1902) 			 * still using this folio.
0f10851ea475e08 Jérôme Glisse              2017-11-15  1903  			 *
ee65728e103bb7d Mike Rapoport              2022-06-27  1904  			 * See Documentation/mm/mmu_notifier.rst
0f10851ea475e08 Jérôme Glisse              2017-11-15  1905  			 */
6b27cc6c66abf0f Kefeng Wang                2024-01-11  1906  			dec_mm_counter(mm, mm_counter_file(folio));
0f10851ea475e08 Jérôme Glisse              2017-11-15  1907  		}
854e9ed09dedf0c Minchan Kim                2016-01-15  1908  discard:
e135826b2da0cf2 David Hildenbrand          2023-12-20  1909  		if (unlikely(folio_test_hugetlb(folio)))
e135826b2da0cf2 David Hildenbrand          2023-12-20  1910  			hugetlb_remove_rmap(folio);
e135826b2da0cf2 David Hildenbrand          2023-12-20  1911  		else
ca1a0746182c3c0 David Hildenbrand          2023-12-20  1912  			folio_remove_rmap_pte(folio, subpage, vma);
b74355078b65542 Hugh Dickins               2022-02-14  1913  		if (vma->vm_flags & VM_LOCKED)
96f97c438f61ddb Lorenzo Stoakes            2023-01-12  1914  			mlock_drain_local();
869f7ee6f647734 Matthew Wilcox (Oracle     2022-02-15  1915) 		folio_put(folio);
26d21b18d971c8b Lance Yang                 2024-06-14  1916  		continue;
26d21b18d971c8b Lance Yang                 2024-06-14  1917  walk_abort:
26d21b18d971c8b Lance Yang                 2024-06-14  1918  		ret = false;
26d21b18d971c8b Lance Yang                 2024-06-14  1919  walk_done:
26d21b18d971c8b Lance Yang                 2024-06-14  1920  		page_vma_mapped_walk_done(&pvmw);
26d21b18d971c8b Lance Yang                 2024-06-14  1921  		break;
c7ab0d2fdc84026 Kirill A. Shutemov         2017-02-24  1922  	}
369ea8242c0fb52 Jérôme Glisse              2017-08-31  1923  
ac46d4f3c43241f Jérôme Glisse              2018-12-28  1924  	mmu_notifier_invalidate_range_end(&range);
369ea8242c0fb52 Jérôme Glisse              2017-08-31  1925  
caed0f486e582ee KOSAKI Motohiro            2009-12-14  1926  	return ret;
^1da177e4c3f415 Linus Torvalds             2005-04-16  1927  }
^1da177e4c3f415 Linus Torvalds             2005-04-16  1928  

:::::: The code at line 1696 was first introduced by commit
:::::: c33c794828f21217f72ce6fc140e0d34e0d56bff mm: ptep_get() conversion

:::::: TO: Ryan Roberts <ryan.roberts@arm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
