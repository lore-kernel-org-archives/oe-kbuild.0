Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA72918C32
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 21:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bxz1oL/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702244651; x=1733780651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+NkyKPi3tAZK4PWpBTX+VU/GZgdjJuRfESVfy2ELt4=;
  b=Bxz1oL/hb+U14IWInBYY6hQY8dP7pP5CTH8MT/GssxRAGKL4LKXbMRHf
   zoLpts+Egp5jZ718KcSxU7W7uTw7sp7L4y/A8o+d7apPScoed2Vz7l6+g
   3aOBZ4z72LjPP/zeJImhklECc8bSC0JYGLqnTjqUGHUbRdDGnvIciSXVf
   of58sQvjGR53Yu+ZUfS28TNnFPAWBHB2Ss1oHQPc03IFXX/AoVOwiMDh+
   8N9FfMohSwqZ6X6yT2OzesTlkBjBfaRlFgI6mYE+34GQ5Qbh6JUENAEH2
   MRnMsOeu2aL3WrtDKufZBrZY83Lo/ETlDPMKLqFLutx5VezTeKe+OLq5+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="397362713"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="397362713"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 13:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890856178"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890856178"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 13:44:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCRap-000HIM-1s;
	Sun, 10 Dec 2023 21:44:07 +0000
Date: Mon, 11 Dec 2023 05:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memory.c:709:25: sparse: sparse: cast to non-scalar
Message-ID: <202312110527.2ixYcotR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/memory.c:709:25: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alistair Popple <apopple@nvidia.com>
CC: Dan Carpenter <error27@gmail.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a87498869d6d1e7347cd01f337a77984604eb5e
commit: b756a3b5e7ead8f6f4b03cea8ac22478ce04c8a8 mm: device exclusive memory access
date:   2 years, 5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 years, 5 months ago
config: alpha-randconfig-r131-20231116 (https://download.01.org/0day-ci/archive/20231211/202312110527.2ixYcotR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110527.2ixYcotR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312110527.2ixYcotR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memory.c:709:25: sparse: sparse: cast to non-scalar
>> mm/memory.c:709:25: sparse: sparse: cast from non-scalar
   mm/memory.c:284:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:318:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1023:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1196:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1220:61: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:1736:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1785:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2287:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2344:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2366:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2543:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2616:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2652:46: sparse: sparse: self-comparison always evaluates to false
   mm/memory.c:2831:17: sparse: sparse: context imbalance in 'wp_page_copy' - unexpected unlock
   mm/memory.c:3180:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3243:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:275:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:275:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4874:5: sparse: sparse: context imbalance in 'follow_invalidate_pte' - different lock contexts for basic block
   mm/memory.c:4995:9: sparse: sparse: context imbalance in 'follow_pfn' - unexpected unlock

vim +709 mm/memory.c

28093f9f34cede Gerald Schaefer 2016-04-28  701  
b756a3b5e7ead8 Alistair Popple 2021-06-30  702  static void restore_exclusive_pte(struct vm_area_struct *vma,
b756a3b5e7ead8 Alistair Popple 2021-06-30  703  				  struct page *page, unsigned long address,
b756a3b5e7ead8 Alistair Popple 2021-06-30  704  				  pte_t *ptep)
b756a3b5e7ead8 Alistair Popple 2021-06-30  705  {
b756a3b5e7ead8 Alistair Popple 2021-06-30  706  	pte_t pte;
b756a3b5e7ead8 Alistair Popple 2021-06-30  707  	swp_entry_t entry;
b756a3b5e7ead8 Alistair Popple 2021-06-30  708  
b756a3b5e7ead8 Alistair Popple 2021-06-30 @709  	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
b756a3b5e7ead8 Alistair Popple 2021-06-30  710  	if (pte_swp_soft_dirty(*ptep))
b756a3b5e7ead8 Alistair Popple 2021-06-30  711  		pte = pte_mksoft_dirty(pte);
b756a3b5e7ead8 Alistair Popple 2021-06-30  712  
b756a3b5e7ead8 Alistair Popple 2021-06-30  713  	entry = pte_to_swp_entry(*ptep);
b756a3b5e7ead8 Alistair Popple 2021-06-30  714  	if (pte_swp_uffd_wp(*ptep))
b756a3b5e7ead8 Alistair Popple 2021-06-30  715  		pte = pte_mkuffd_wp(pte);
b756a3b5e7ead8 Alistair Popple 2021-06-30  716  	else if (is_writable_device_exclusive_entry(entry))
b756a3b5e7ead8 Alistair Popple 2021-06-30  717  		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
b756a3b5e7ead8 Alistair Popple 2021-06-30  718  
b756a3b5e7ead8 Alistair Popple 2021-06-30  719  	set_pte_at(vma->vm_mm, address, ptep, pte);
b756a3b5e7ead8 Alistair Popple 2021-06-30  720  
b756a3b5e7ead8 Alistair Popple 2021-06-30  721  	/*
b756a3b5e7ead8 Alistair Popple 2021-06-30  722  	 * No need to take a page reference as one was already
b756a3b5e7ead8 Alistair Popple 2021-06-30  723  	 * created when the swap entry was made.
b756a3b5e7ead8 Alistair Popple 2021-06-30  724  	 */
b756a3b5e7ead8 Alistair Popple 2021-06-30  725  	if (PageAnon(page))
b756a3b5e7ead8 Alistair Popple 2021-06-30  726  		page_add_anon_rmap(page, vma, address, false);
b756a3b5e7ead8 Alistair Popple 2021-06-30  727  	else
b756a3b5e7ead8 Alistair Popple 2021-06-30  728  		/*
b756a3b5e7ead8 Alistair Popple 2021-06-30  729  		 * Currently device exclusive access only supports anonymous
b756a3b5e7ead8 Alistair Popple 2021-06-30  730  		 * memory so the entry shouldn't point to a filebacked page.
b756a3b5e7ead8 Alistair Popple 2021-06-30  731  		 */
b756a3b5e7ead8 Alistair Popple 2021-06-30  732  		WARN_ON_ONCE(!PageAnon(page));
b756a3b5e7ead8 Alistair Popple 2021-06-30  733  
b756a3b5e7ead8 Alistair Popple 2021-06-30  734  	if (vma->vm_flags & VM_LOCKED)
b756a3b5e7ead8 Alistair Popple 2021-06-30  735  		mlock_vma_page(page);
b756a3b5e7ead8 Alistair Popple 2021-06-30  736  
b756a3b5e7ead8 Alistair Popple 2021-06-30  737  	/*
b756a3b5e7ead8 Alistair Popple 2021-06-30  738  	 * No need to invalidate - it was non-present before. However
b756a3b5e7ead8 Alistair Popple 2021-06-30  739  	 * secondary CPUs may have mappings that need invalidating.
b756a3b5e7ead8 Alistair Popple 2021-06-30  740  	 */
b756a3b5e7ead8 Alistair Popple 2021-06-30  741  	update_mmu_cache(vma, address, ptep);
b756a3b5e7ead8 Alistair Popple 2021-06-30  742  }
b756a3b5e7ead8 Alistair Popple 2021-06-30  743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
