Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1D1864D
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC0eTrXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700053386; x=1731589386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTIQ5TiLopj9JRjoUhPoUeUMmgYcVBNznIsgH3hffXs=;
  b=lC0eTrXb9Y88O8fC/EWTA74p133l6NPDv7DcLY/EqQUhDB962709oT9l
   yLDEOLcmYeCDsbfwVeqd6AAWmLEaYkWcC7SZoBYbUL++gexgwJgNMtMZk
   cCISyWyq8Zv5bBbpFwaIIM+FiRNo2tdTwEuF2euoSIfhedSzGqIPnz3jL
   xUZ3WqGtBZIokyKlq6VcxzyxAc9qkNdF+FHYwHiayPiDdM547n4R0Ui+9
   rhJ3Vm3qkJCt6KlGU5W1J00ctgH/SxMthg6OCb+RpHxu5r+A8UdEAOabc
   PBk8pGKFVGPXq8CYVMqyX5MMf1CNVEVugIRMKqF5pkHwXM2tuJK6uHPNU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393727954"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="393727954"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938480433"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938480433"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 05:03:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3FXp-0000L2-0H;
	Wed, 15 Nov 2023 13:03:01 +0000
Date: Wed, 15 Nov 2023 21:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/khugepaged.c:1802:28: sparse: sparse: self-comparison always
 evaluates to false
Message-ID: <202311152040.felTdxoR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/khugepaged.c:1802:28: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 1d65b771bc08cd054cf6d3766a72e113dc46d62f mm/khugepaged: retract_page_tables() without mmap or vma lock
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-061-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152040.felTdxoR-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152040.felTdxoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152040.felTdxoR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/khugepaged.c:834:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?
   mm/khugepaged.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   mm/khugepaged.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in '__collapse_huge_page_swapin' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'collapse_huge_page' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'hpage_collapse_scan_pmd' - unexpected unlock
   mm/khugepaged.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   mm/khugepaged.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'collapse_pte_mapped_thp' - unexpected unlock
>> mm/khugepaged.c:1802:28: sparse: sparse: self-comparison always evaluates to false
   mm/khugepaged.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +1802 mm/khugepaged.c

27e1f8273113ad Song Liu           2019-09-23  1751  
1d65b771bc08cd Hugh Dickins       2023-07-11  1752  static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1753  {
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1754  	struct vm_area_struct *vma;
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1755  
1d65b771bc08cd Hugh Dickins       2023-07-11  1756  	i_mmap_lock_read(mapping);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1757  	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
1d65b771bc08cd Hugh Dickins       2023-07-11  1758  		struct mmu_notifier_range range;
1d65b771bc08cd Hugh Dickins       2023-07-11  1759  		struct mm_struct *mm;
1d65b771bc08cd Hugh Dickins       2023-07-11  1760  		unsigned long addr;
1d65b771bc08cd Hugh Dickins       2023-07-11  1761  		pmd_t *pmd, pgt_pmd;
1d65b771bc08cd Hugh Dickins       2023-07-11  1762  		spinlock_t *pml;
1d65b771bc08cd Hugh Dickins       2023-07-11  1763  		spinlock_t *ptl;
1d65b771bc08cd Hugh Dickins       2023-07-11  1764  		bool skipped_uffd = false;
34488399fa08fa Zach O'Keefe       2022-09-22  1765  
27e1f8273113ad Song Liu           2019-09-23  1766  		/*
27e1f8273113ad Song Liu           2019-09-23  1767  		 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
1d65b771bc08cd Hugh Dickins       2023-07-11  1768  		 * got written to. These VMAs are likely not worth removing
1d65b771bc08cd Hugh Dickins       2023-07-11  1769  		 * page tables from, as PMD-mapping is likely to be split later.
27e1f8273113ad Song Liu           2019-09-23  1770  		 */
1d65b771bc08cd Hugh Dickins       2023-07-11  1771  		if (READ_ONCE(vma->anon_vma))
1d65b771bc08cd Hugh Dickins       2023-07-11  1772  			continue;
1d65b771bc08cd Hugh Dickins       2023-07-11  1773  
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1774  		addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
34488399fa08fa Zach O'Keefe       2022-09-22  1775  		if (addr & ~HPAGE_PMD_MASK ||
1d65b771bc08cd Hugh Dickins       2023-07-11  1776  		    vma->vm_end < addr + HPAGE_PMD_SIZE)
1d65b771bc08cd Hugh Dickins       2023-07-11  1777  			continue;
1d65b771bc08cd Hugh Dickins       2023-07-11  1778  
18e77600f7a1ed Hugh Dickins       2020-08-06  1779  		mm = vma->vm_mm;
1d65b771bc08cd Hugh Dickins       2023-07-11  1780  		if (find_pmd_or_thp_or_none(mm, addr, &pmd) != SCAN_SUCCEED)
1d65b771bc08cd Hugh Dickins       2023-07-11  1781  			continue;
55fd6fccad3172 Suren Baghdasaryan 2023-02-27  1782  
1d65b771bc08cd Hugh Dickins       2023-07-11  1783  		if (hpage_collapse_test_exit(mm))
1d65b771bc08cd Hugh Dickins       2023-07-11  1784  			continue;
023f47a8250c6b Jann Horn          2023-01-11  1785  		/*
1d65b771bc08cd Hugh Dickins       2023-07-11  1786  		 * When a vma is registered with uffd-wp, we cannot recycle
1d65b771bc08cd Hugh Dickins       2023-07-11  1787  		 * the page table because there may be pte markers installed.
1d65b771bc08cd Hugh Dickins       2023-07-11  1788  		 * Other vmas can still have the same file mapped hugely, but
1d65b771bc08cd Hugh Dickins       2023-07-11  1789  		 * skip this one: it will always be mapped in small page size
1d65b771bc08cd Hugh Dickins       2023-07-11  1790  		 * for uffd-wp registered ranges.
023f47a8250c6b Jann Horn          2023-01-11  1791  		 */
1d65b771bc08cd Hugh Dickins       2023-07-11  1792  		if (userfaultfd_wp(vma))
1d65b771bc08cd Hugh Dickins       2023-07-11  1793  			continue;
1d65b771bc08cd Hugh Dickins       2023-07-11  1794  
1d65b771bc08cd Hugh Dickins       2023-07-11  1795  		/* PTEs were notified when unmapped; but now for the PMD? */
1d65b771bc08cd Hugh Dickins       2023-07-11  1796  		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm,
1d65b771bc08cd Hugh Dickins       2023-07-11  1797  					addr, addr + HPAGE_PMD_SIZE);
1d65b771bc08cd Hugh Dickins       2023-07-11  1798  		mmu_notifier_invalidate_range_start(&range);
1d65b771bc08cd Hugh Dickins       2023-07-11  1799  
1d65b771bc08cd Hugh Dickins       2023-07-11  1800  		pml = pmd_lock(mm, pmd);
1d65b771bc08cd Hugh Dickins       2023-07-11  1801  		ptl = pte_lockptr(mm, pmd);
1d65b771bc08cd Hugh Dickins       2023-07-11 @1802  		if (ptl != pml)
1d65b771bc08cd Hugh Dickins       2023-07-11  1803  			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
1d65b771bc08cd Hugh Dickins       2023-07-11  1804  
deb4c93a987108 Peter Xu           2022-05-12  1805  		/*
1d65b771bc08cd Hugh Dickins       2023-07-11  1806  		 * Huge page lock is still held, so normally the page table
1d65b771bc08cd Hugh Dickins       2023-07-11  1807  		 * must remain empty; and we have already skipped anon_vma
1d65b771bc08cd Hugh Dickins       2023-07-11  1808  		 * and userfaultfd_wp() vmas.  But since the mmap_lock is not
1d65b771bc08cd Hugh Dickins       2023-07-11  1809  		 * held, it is still possible for a racing userfaultfd_ioctl()
1d65b771bc08cd Hugh Dickins       2023-07-11  1810  		 * to have inserted ptes or markers.  Now that we hold ptlock,
1d65b771bc08cd Hugh Dickins       2023-07-11  1811  		 * repeating the anon_vma check protects from one category,
1d65b771bc08cd Hugh Dickins       2023-07-11  1812  		 * and repeating the userfaultfd_wp() check from another.
deb4c93a987108 Peter Xu           2022-05-12  1813  		 */
1d65b771bc08cd Hugh Dickins       2023-07-11  1814  		if (unlikely(vma->anon_vma || userfaultfd_wp(vma))) {
1d65b771bc08cd Hugh Dickins       2023-07-11  1815  			skipped_uffd = true;
1d65b771bc08cd Hugh Dickins       2023-07-11  1816  		} else {
1d65b771bc08cd Hugh Dickins       2023-07-11  1817  			pgt_pmd = pmdp_collapse_flush(vma, addr, pmd);
1d65b771bc08cd Hugh Dickins       2023-07-11  1818  			pmdp_get_lockless_sync();
34488399fa08fa Zach O'Keefe       2022-09-22  1819  		}
34488399fa08fa Zach O'Keefe       2022-09-22  1820  
1d65b771bc08cd Hugh Dickins       2023-07-11  1821  		if (ptl != pml)
1d65b771bc08cd Hugh Dickins       2023-07-11  1822  			spin_unlock(ptl);
1d65b771bc08cd Hugh Dickins       2023-07-11  1823  		spin_unlock(pml);
1d65b771bc08cd Hugh Dickins       2023-07-11  1824  
1d65b771bc08cd Hugh Dickins       2023-07-11  1825  		mmu_notifier_invalidate_range_end(&range);
1d65b771bc08cd Hugh Dickins       2023-07-11  1826  
1d65b771bc08cd Hugh Dickins       2023-07-11  1827  		if (!skipped_uffd) {
1d65b771bc08cd Hugh Dickins       2023-07-11  1828  			mm_dec_nr_ptes(mm);
1d65b771bc08cd Hugh Dickins       2023-07-11  1829  			page_table_check_pte_clear_range(mm, addr, pgt_pmd);
1d65b771bc08cd Hugh Dickins       2023-07-11  1830  			pte_free_defer(mm, pmd_pgtable(pgt_pmd));
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1831  		}
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1832  	}
1d65b771bc08cd Hugh Dickins       2023-07-11  1833  	i_mmap_unlock_read(mapping);
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1834  }
f3f0e1d2150b2b Kirill A. Shutemov 2016-07-26  1835  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
