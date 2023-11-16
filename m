Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205917E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqMkfsqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095329; x=1731631329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v69D9C9VqBjPEn6O+9r71IuxDvN53wwWUMapcf1q86g=;
  b=OqMkfsqvffchlx5bXbTXVUxF6uznZ3quyUSaQr43B9ysGPJZf2Kjei9s
   S3Fo43JnPdL7rRU/nu9OZVD5ug8kbmK9UbJ4YR1vyoQ62jvHS48fHldJA
   r5u2wuAUwtpswljnXvJWPIE/zj+Pa8uAF9QG5mB4T0hocjAVXI/xnwg8I
   PUYU96HGHUVVoI+3ztOU3aKMLqfLofUNHnzI0Cf0gNSs9sO7IkdrTO8rG
   jFI1syLD9yl+C66jK0FiRb6ZPmZvem5re63XHQ+B8nKfoFI4pDzlV1iW5
   s4JGfdUhiSq8+NhfM1oQj+kIIPqC1cFqYbKN9EGE8VQyCDhkj6L+YMyqK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376031813"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="376031813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908942137"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="908942137"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 16:42:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QSK-00013i-28;
	Thu, 16 Nov 2023 00:42:04 +0000
Date: Thu, 16 Nov 2023 08:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/internal.h:616:21: sparse: sparse: self-comparison always
 evaluates to false
Message-ID: <202311160854.9zNkSimE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/internal.h:616:21: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yin Fengwei <fengwei.yin@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 1acbc3f936146d1b34987294803ac131bc298ce8 mm: handle large folio when large folio in VM_LOCKED VMA range
date:   6 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 weeks ago
config: sparc64-randconfig-r025-20230806 (https://download.01.org/0day-ci/archive/20231116/202311160854.9zNkSimE-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160854.9zNkSimE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160854.9zNkSimE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/rmap.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/rmap.c: note: in included file:
>> mm/internal.h:616:21: sparse: sparse: self-comparison always evaluates to false
   mm/internal.h:619:19: sparse: sparse: self-comparison always evaluates to false
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:419:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   include/linux/rmap.h:419:26: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   include/linux/rmap.h:419:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +616 mm/internal.h

6038def0d11b32 Namhyung Kim            2011-05-24  579  
af8e3354b4bbd1 Hugh Dickins            2009-12-14  580  #ifdef CONFIG_MMU
3506659e18a61a Matthew Wilcox (Oracle  2021-11-28  581) void unmap_mapping_folio(struct folio *folio);
fc05f566210fa5 Kirill A. Shutemov      2015-04-14  582  extern long populate_vma_page_range(struct vm_area_struct *vma,
a78f1ccd37fbcd David Hildenbrand       2021-06-30  583  		unsigned long start, unsigned long end, int *locked);
4ca9b3859dac14 David Hildenbrand       2021-06-30  584  extern long faultin_vma_page_range(struct vm_area_struct *vma,
4ca9b3859dac14 David Hildenbrand       2021-06-30  585  				   unsigned long start, unsigned long end,
4ca9b3859dac14 David Hildenbrand       2021-06-30  586  				   bool write, int *locked);
b0cc5e89caadc2 Andrew Morton           2023-05-22  587  extern bool mlock_future_ok(struct mm_struct *mm, unsigned long flags,
3c54a298db4c6b Lorenzo Stoakes         2023-05-22  588  			       unsigned long bytes);
28e566572aacdc Yin Fengwei             2023-09-18  589  
28e566572aacdc Yin Fengwei             2023-09-18  590  /*
28e566572aacdc Yin Fengwei             2023-09-18  591   * NOTE: This function can't tell whether the folio is "fully mapped" in the
28e566572aacdc Yin Fengwei             2023-09-18  592   * range.
28e566572aacdc Yin Fengwei             2023-09-18  593   * "fully mapped" means all the pages of folio is associated with the page
28e566572aacdc Yin Fengwei             2023-09-18  594   * table of range while this function just check whether the folio range is
28e566572aacdc Yin Fengwei             2023-09-18  595   * within the range [start, end). Funcation caller nees to do page table
28e566572aacdc Yin Fengwei             2023-09-18  596   * check if it cares about the page table association.
28e566572aacdc Yin Fengwei             2023-09-18  597   *
28e566572aacdc Yin Fengwei             2023-09-18  598   * Typical usage (like mlock or madvise) is:
28e566572aacdc Yin Fengwei             2023-09-18  599   * Caller knows at least 1 page of folio is associated with page table of VMA
28e566572aacdc Yin Fengwei             2023-09-18  600   * and the range [start, end) is intersect with the VMA range. Caller wants
28e566572aacdc Yin Fengwei             2023-09-18  601   * to know whether the folio is fully associated with the range. It calls
28e566572aacdc Yin Fengwei             2023-09-18  602   * this function to check whether the folio is in the range first. Then checks
28e566572aacdc Yin Fengwei             2023-09-18  603   * the page table to know whether the folio is fully mapped to the range.
28e566572aacdc Yin Fengwei             2023-09-18  604   */
28e566572aacdc Yin Fengwei             2023-09-18  605  static inline bool
28e566572aacdc Yin Fengwei             2023-09-18  606  folio_within_range(struct folio *folio, struct vm_area_struct *vma,
28e566572aacdc Yin Fengwei             2023-09-18  607  		unsigned long start, unsigned long end)
28e566572aacdc Yin Fengwei             2023-09-18  608  {
28e566572aacdc Yin Fengwei             2023-09-18  609  	pgoff_t pgoff, addr;
28e566572aacdc Yin Fengwei             2023-09-18  610  	unsigned long vma_pglen = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
28e566572aacdc Yin Fengwei             2023-09-18  611  
28e566572aacdc Yin Fengwei             2023-09-18  612  	VM_WARN_ON_FOLIO(folio_test_ksm(folio), folio);
28e566572aacdc Yin Fengwei             2023-09-18  613  	if (start > end)
28e566572aacdc Yin Fengwei             2023-09-18  614  		return false;
28e566572aacdc Yin Fengwei             2023-09-18  615  
28e566572aacdc Yin Fengwei             2023-09-18 @616  	if (start < vma->vm_start)
28e566572aacdc Yin Fengwei             2023-09-18  617  		start = vma->vm_start;
28e566572aacdc Yin Fengwei             2023-09-18  618  
28e566572aacdc Yin Fengwei             2023-09-18  619  	if (end > vma->vm_end)
28e566572aacdc Yin Fengwei             2023-09-18  620  		end = vma->vm_end;
28e566572aacdc Yin Fengwei             2023-09-18  621  
28e566572aacdc Yin Fengwei             2023-09-18  622  	pgoff = folio_pgoff(folio);
28e566572aacdc Yin Fengwei             2023-09-18  623  
28e566572aacdc Yin Fengwei             2023-09-18  624  	/* if folio start address is not in vma range */
28e566572aacdc Yin Fengwei             2023-09-18  625  	if (!in_range(pgoff, vma->vm_pgoff, vma_pglen))
28e566572aacdc Yin Fengwei             2023-09-18  626  		return false;
28e566572aacdc Yin Fengwei             2023-09-18  627  
28e566572aacdc Yin Fengwei             2023-09-18  628  	addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
28e566572aacdc Yin Fengwei             2023-09-18  629  
28e566572aacdc Yin Fengwei             2023-09-18  630  	return !(addr < start || end - addr < folio_size(folio));
28e566572aacdc Yin Fengwei             2023-09-18  631  }
28e566572aacdc Yin Fengwei             2023-09-18  632  

:::::: The code at line 616 was first introduced by commit
:::::: 28e566572aacdc551e24649e57cc9f04ba880cd2 mm: add functions folio_in_range() and folio_within_vma()

:::::: TO: Yin Fengwei <fengwei.yin@intel.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
