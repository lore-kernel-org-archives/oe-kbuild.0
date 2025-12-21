Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83323D7F0
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766355383; cv=none; b=qqe0J3voHLDlbXGhg6ZNXy4MAHW8whq/JSuuLXS3qPQi5S2iECa7CMOZrwKVYvsnRKovBQZ33CB2RjNgF+IVMTicj+gLA+/sT+o4Z8Nj282XHOCTvwCU+3zrplbhjJdsCu1ekbVmD0a/VvF1orV4+Wus+jjRpAFt32Ccn7ZPQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766355383; c=relaxed/simple;
	bh=lBC3ECVjLBLo5LQOokGva0jPLBxr4/7GBBCZDrY70QM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJBOMHDL+PAzGau7lBJviQip59kyyUfptrdMUmnwbf6010bu3xIuY7vryU8DuSaiMEjG7dxUIUgDvVuuXFk7IOuv6XiM5zjWJCQ9fu5ozdkuDLYG5Q7kWEQCMp3Kmik2DrvIYx+EWwyXVngxFutLZ1Zn5ZlvweXGn7PSOWj+Rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jW8y2PkX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jW8y2PkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766355381; x=1797891381;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lBC3ECVjLBLo5LQOokGva0jPLBxr4/7GBBCZDrY70QM=;
  b=jW8y2PkXgiWhewVmXIAFf2MeQBacb/H9SonLq3X1Pb7o6W/DDaA/ZHse
   lEyrTMZGDJpEocdDBGHnoer3AqfZ4bnBIdS7SWdkh6StWmOLhHMxFe+Eq
   ofjWLMiqXfc9nEoJEOmqBYDbVtqgzMMNR3OWjxjlhZ06CDFzebxx1y/Ei
   RuorL4xjJG4Jv0FtFPOdOtWeQfObZRyXCGCFjDspIrS9WVhlBh/1ggWxp
   yo6wIOY5+XzlAWdSha4//V3jylOL8ev1uZu+NNSBJGjZ82CxA2UDsb8Nc
   6mX/YMksyyelkicDnpKCBlRqWzZaQWhGekz++KA1csTo6OMCZCMkS6/26
   g==;
X-CSE-ConnectionGUID: 4W7652dSTM2DUegR7PaLRw==
X-CSE-MsgGUID: CfYcTzTCREGe7fUBjQTDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93694880"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93694880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:16:18 -0800
X-CSE-ConnectionGUID: 52M83hUqTUyZ3qo5gys7wA==
X-CSE-MsgGUID: KbIJkb7ETC2b7Zt/alQKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199018410"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 14:16:18 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRip-000000000En-3GhL;
	Sun, 21 Dec 2025 22:16:15 +0000
Date: Mon, 22 Dec 2025 06:15:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <202512220620.usjimf3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251216201206.1660899-5-francois.dugast@intel.com>
References: <20251216201206.1660899-5-francois.dugast@intel.com>
TO: Francois Dugast <francois.dugast@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Francois Dugast <francois.dugast@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Michal Mrozek <michal.mrozek@intel.com>

Hi Francois,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on akpm-mm/mm-everything drm-xe/drm-xe-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc1 next-20251219]
[cannot apply to daeinki-drm-exynos/exynos-drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francois-Dugast/mm-migrate-Add-migrate_device_split_page/20251217-041401
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251216201206.1660899-5-francois.dugast%40intel.com
patch subject: [PATCH 4/4] drm/pagemap: Enable THP support for GPU memory migration
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc64-randconfig-002-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220620.usjimf3J-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220620.usjimf3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220620.usjimf3J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:438:12: error: call to '__compiletime_assert_602' declared with 'error' attribute: BUILD_BUG failed
     438 |                         order = HPAGE_PMD_ORDER;
         |                                 ^
   include/linux/huge_mm.h:117:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:165:1: note: expanded from here
     165 | __compiletime_assert_602
         | ^
   1 error generated.


vim +438 drivers/gpu/drm/drm_pagemap.c

f86ad0ed620cb3c Matthew Brost   2025-06-19  318  
f86ad0ed620cb3c Matthew Brost   2025-06-19  319  /**
f86ad0ed620cb3c Matthew Brost   2025-06-19  320   * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
f86ad0ed620cb3c Matthew Brost   2025-06-19  321   * @devmem_allocation: The device memory allocation to migrate to.
f86ad0ed620cb3c Matthew Brost   2025-06-19  322   * The caller should hold a reference to the device memory allocation,
f86ad0ed620cb3c Matthew Brost   2025-06-19  323   * and the reference is consumed by this function unless it returns with
f86ad0ed620cb3c Matthew Brost   2025-06-19  324   * an error.
f86ad0ed620cb3c Matthew Brost   2025-06-19  325   * @mm: Pointer to the struct mm_struct.
f86ad0ed620cb3c Matthew Brost   2025-06-19  326   * @start: Start of the virtual address range to migrate.
f86ad0ed620cb3c Matthew Brost   2025-06-19  327   * @end: End of the virtual address range to migrate.
f86ad0ed620cb3c Matthew Brost   2025-06-19  328   * @timeslice_ms: The time requested for the migrated pagemap pages to
f86ad0ed620cb3c Matthew Brost   2025-06-19  329   * be present in @mm before being allowed to be migrated back.
f86ad0ed620cb3c Matthew Brost   2025-06-19  330   * @pgmap_owner: Not used currently, since only system memory is considered.
f86ad0ed620cb3c Matthew Brost   2025-06-19  331   *
f86ad0ed620cb3c Matthew Brost   2025-06-19  332   * This function migrates the specified virtual address range to device memory.
f86ad0ed620cb3c Matthew Brost   2025-06-19  333   * It performs the necessary setup and invokes the driver-specific operations for
f86ad0ed620cb3c Matthew Brost   2025-06-19  334   * migration to device memory. Expected to be called while holding the mmap lock in
f86ad0ed620cb3c Matthew Brost   2025-06-19  335   * at least read mode.
f86ad0ed620cb3c Matthew Brost   2025-06-19  336   *
f86ad0ed620cb3c Matthew Brost   2025-06-19  337   * Note: The @timeslice_ms parameter can typically be used to force data to
f86ad0ed620cb3c Matthew Brost   2025-06-19  338   * remain in pagemap pages long enough for a GPU to perform a task and to prevent
f86ad0ed620cb3c Matthew Brost   2025-06-19  339   * a migration livelock. One alternative would be for the GPU driver to block
f86ad0ed620cb3c Matthew Brost   2025-06-19  340   * in a mmu_notifier for the specified amount of time, but adding the
f86ad0ed620cb3c Matthew Brost   2025-06-19  341   * functionality to the pagemap is likely nicer to the system as a whole.
f86ad0ed620cb3c Matthew Brost   2025-06-19  342   *
f86ad0ed620cb3c Matthew Brost   2025-06-19  343   * Return: %0 on success, negative error code on failure.
f86ad0ed620cb3c Matthew Brost   2025-06-19  344   */
f86ad0ed620cb3c Matthew Brost   2025-06-19  345  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
f86ad0ed620cb3c Matthew Brost   2025-06-19  346  				  struct mm_struct *mm,
f86ad0ed620cb3c Matthew Brost   2025-06-19  347  				  unsigned long start, unsigned long end,
f86ad0ed620cb3c Matthew Brost   2025-06-19  348  				  unsigned long timeslice_ms,
f86ad0ed620cb3c Matthew Brost   2025-06-19  349  				  void *pgmap_owner)
f86ad0ed620cb3c Matthew Brost   2025-06-19  350  {
f86ad0ed620cb3c Matthew Brost   2025-06-19  351  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
240e6a97e9220d6 Francois Dugast 2025-12-16  352  	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
f86ad0ed620cb3c Matthew Brost   2025-06-19  353  	struct migrate_vma migrate = {
f86ad0ed620cb3c Matthew Brost   2025-06-19  354  		.start		= start,
f86ad0ed620cb3c Matthew Brost   2025-06-19  355  		.end		= end,
f86ad0ed620cb3c Matthew Brost   2025-06-19  356  		.pgmap_owner	= pgmap_owner,
240e6a97e9220d6 Francois Dugast 2025-12-16  357  		.flags		= MIGRATE_VMA_SELECT_SYSTEM
240e6a97e9220d6 Francois Dugast 2025-12-16  358  				| MIGRATE_VMA_SELECT_COMPOUND,
f86ad0ed620cb3c Matthew Brost   2025-06-19  359  	};
f86ad0ed620cb3c Matthew Brost   2025-06-19  360  	unsigned long i, npages = npages_in_range(start, end);
f86ad0ed620cb3c Matthew Brost   2025-06-19  361  	struct vm_area_struct *vas;
f86ad0ed620cb3c Matthew Brost   2025-06-19  362  	struct drm_pagemap_zdd *zdd = NULL;
f86ad0ed620cb3c Matthew Brost   2025-06-19  363  	struct page **pages;
f35a6cdf8a6d69f Francois Dugast 2025-08-05  364  	struct drm_pagemap_addr *pagemap_addr;
f86ad0ed620cb3c Matthew Brost   2025-06-19  365  	void *buf;
f86ad0ed620cb3c Matthew Brost   2025-06-19  366  	int err;
f86ad0ed620cb3c Matthew Brost   2025-06-19  367  
f86ad0ed620cb3c Matthew Brost   2025-06-19  368  	mmap_assert_locked(mm);
f86ad0ed620cb3c Matthew Brost   2025-06-19  369  
f86ad0ed620cb3c Matthew Brost   2025-06-19  370  	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
f86ad0ed620cb3c Matthew Brost   2025-06-19  371  	    !ops->copy_to_ram)
f86ad0ed620cb3c Matthew Brost   2025-06-19  372  		return -EOPNOTSUPP;
f86ad0ed620cb3c Matthew Brost   2025-06-19  373  
f86ad0ed620cb3c Matthew Brost   2025-06-19  374  	vas = vma_lookup(mm, start);
f86ad0ed620cb3c Matthew Brost   2025-06-19  375  	if (!vas) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  376  		err = -ENOENT;
f86ad0ed620cb3c Matthew Brost   2025-06-19  377  		goto err_out;
f86ad0ed620cb3c Matthew Brost   2025-06-19  378  	}
f86ad0ed620cb3c Matthew Brost   2025-06-19  379  
f86ad0ed620cb3c Matthew Brost   2025-06-19  380  	if (end > vas->vm_end || start < vas->vm_start) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  381  		err = -EINVAL;
f86ad0ed620cb3c Matthew Brost   2025-06-19  382  		goto err_out;
f86ad0ed620cb3c Matthew Brost   2025-06-19  383  	}
f86ad0ed620cb3c Matthew Brost   2025-06-19  384  
f86ad0ed620cb3c Matthew Brost   2025-06-19  385  	if (!vma_is_anonymous(vas)) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  386  		err = -EBUSY;
f86ad0ed620cb3c Matthew Brost   2025-06-19  387  		goto err_out;
f86ad0ed620cb3c Matthew Brost   2025-06-19  388  	}
f86ad0ed620cb3c Matthew Brost   2025-06-19  389  
f35a6cdf8a6d69f Francois Dugast 2025-08-05  390  	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*pagemap_addr) +
f86ad0ed620cb3c Matthew Brost   2025-06-19  391  		       sizeof(*pages), GFP_KERNEL);
f86ad0ed620cb3c Matthew Brost   2025-06-19  392  	if (!buf) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  393  		err = -ENOMEM;
f86ad0ed620cb3c Matthew Brost   2025-06-19  394  		goto err_out;
f86ad0ed620cb3c Matthew Brost   2025-06-19  395  	}
f35a6cdf8a6d69f Francois Dugast 2025-08-05  396  	pagemap_addr = buf + (2 * sizeof(*migrate.src) * npages);
f35a6cdf8a6d69f Francois Dugast 2025-08-05  397  	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*pagemap_addr)) * npages;
f86ad0ed620cb3c Matthew Brost   2025-06-19  398  
f86ad0ed620cb3c Matthew Brost   2025-06-19  399  	zdd = drm_pagemap_zdd_alloc(pgmap_owner);
f86ad0ed620cb3c Matthew Brost   2025-06-19  400  	if (!zdd) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  401  		err = -ENOMEM;
f86ad0ed620cb3c Matthew Brost   2025-06-19  402  		goto err_free;
f86ad0ed620cb3c Matthew Brost   2025-06-19  403  	}
f86ad0ed620cb3c Matthew Brost   2025-06-19  404  
f86ad0ed620cb3c Matthew Brost   2025-06-19  405  	migrate.vma = vas;
f86ad0ed620cb3c Matthew Brost   2025-06-19  406  	migrate.src = buf;
f86ad0ed620cb3c Matthew Brost   2025-06-19  407  	migrate.dst = migrate.src + npages;
f86ad0ed620cb3c Matthew Brost   2025-06-19  408  
f86ad0ed620cb3c Matthew Brost   2025-06-19  409  	err = migrate_vma_setup(&migrate);
f86ad0ed620cb3c Matthew Brost   2025-06-19  410  	if (err)
f86ad0ed620cb3c Matthew Brost   2025-06-19  411  		goto err_free;
f86ad0ed620cb3c Matthew Brost   2025-06-19  412  
f86ad0ed620cb3c Matthew Brost   2025-06-19  413  	if (!migrate.cpages) {
f86ad0ed620cb3c Matthew Brost   2025-06-19  414  		err = -EFAULT;
f86ad0ed620cb3c Matthew Brost   2025-06-19  415  		goto err_free;
f86ad0ed620cb3c Matthew Brost   2025-06-19  416  	}
f86ad0ed620cb3c Matthew Brost   2025-06-19  417  
f86ad0ed620cb3c Matthew Brost   2025-06-19  418  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
f86ad0ed620cb3c Matthew Brost   2025-06-19  419  	if (err)
f86ad0ed620cb3c Matthew Brost   2025-06-19  420  		goto err_finalize;
f86ad0ed620cb3c Matthew Brost   2025-06-19  421  
f35a6cdf8a6d69f Francois Dugast 2025-08-05  422  	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
f86ad0ed620cb3c Matthew Brost   2025-06-19  423  					    migrate.src, npages, DMA_TO_DEVICE);
f35a6cdf8a6d69f Francois Dugast 2025-08-05  424  
f86ad0ed620cb3c Matthew Brost   2025-06-19  425  	if (err)
f86ad0ed620cb3c Matthew Brost   2025-06-19  426  		goto err_finalize;
f86ad0ed620cb3c Matthew Brost   2025-06-19  427  
240e6a97e9220d6 Francois Dugast 2025-12-16  428  	mutex_lock(&dpagemap->folio_split_lock);
240e6a97e9220d6 Francois Dugast 2025-12-16  429  	for (i = 0; i < npages;) {
240e6a97e9220d6 Francois Dugast 2025-12-16  430  		unsigned long j;
f86ad0ed620cb3c Matthew Brost   2025-06-19  431  		struct page *page = pfn_to_page(migrate.dst[i]);
240e6a97e9220d6 Francois Dugast 2025-12-16  432  		unsigned int order;
f86ad0ed620cb3c Matthew Brost   2025-06-19  433  
f86ad0ed620cb3c Matthew Brost   2025-06-19  434  		pages[i] = page;
f86ad0ed620cb3c Matthew Brost   2025-06-19  435  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
240e6a97e9220d6 Francois Dugast 2025-12-16  436  
240e6a97e9220d6 Francois Dugast 2025-12-16  437  		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
240e6a97e9220d6 Francois Dugast 2025-12-16 @438  			order = HPAGE_PMD_ORDER;
240e6a97e9220d6 Francois Dugast 2025-12-16  439  
240e6a97e9220d6 Francois Dugast 2025-12-16  440  			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
240e6a97e9220d6 Francois Dugast 2025-12-16  441  
240e6a97e9220d6 Francois Dugast 2025-12-16  442  			drm_pagemap_get_devmem_page(page, order, zdd);
240e6a97e9220d6 Francois Dugast 2025-12-16  443  
240e6a97e9220d6 Francois Dugast 2025-12-16  444  			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
240e6a97e9220d6 Francois Dugast 2025-12-16  445  				migrate.dst[i + j] = 0;
240e6a97e9220d6 Francois Dugast 2025-12-16  446  
240e6a97e9220d6 Francois Dugast 2025-12-16  447  		} else {
240e6a97e9220d6 Francois Dugast 2025-12-16  448  			order = 0;
240e6a97e9220d6 Francois Dugast 2025-12-16  449  
240e6a97e9220d6 Francois Dugast 2025-12-16  450  			if (folio_order(page_folio(page)))
240e6a97e9220d6 Francois Dugast 2025-12-16  451  				migrate_device_split_page(page);
240e6a97e9220d6 Francois Dugast 2025-12-16  452  
240e6a97e9220d6 Francois Dugast 2025-12-16  453  			zone_device_page_init(page, 0);
240e6a97e9220d6 Francois Dugast 2025-12-16  454  			page->zone_device_data = drm_pagemap_zdd_get(zdd);
f86ad0ed620cb3c Matthew Brost   2025-06-19  455  		}
f86ad0ed620cb3c Matthew Brost   2025-06-19  456  
240e6a97e9220d6 Francois Dugast 2025-12-16  457  		i += NR_PAGES(order);
240e6a97e9220d6 Francois Dugast 2025-12-16  458  	}
240e6a97e9220d6 Francois Dugast 2025-12-16  459  	mutex_unlock(&dpagemap->folio_split_lock);
240e6a97e9220d6 Francois Dugast 2025-12-16  460  
f35a6cdf8a6d69f Francois Dugast 2025-08-05  461  	err = ops->copy_to_devmem(pages, pagemap_addr, npages);
f86ad0ed620cb3c Matthew Brost   2025-06-19  462  	if (err)
f86ad0ed620cb3c Matthew Brost   2025-06-19  463  		goto err_finalize;
f86ad0ed620cb3c Matthew Brost   2025-06-19  464  
f86ad0ed620cb3c Matthew Brost   2025-06-19  465  	/* Upon success bind devmem allocation to range and zdd */
f86ad0ed620cb3c Matthew Brost   2025-06-19  466  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
f86ad0ed620cb3c Matthew Brost   2025-06-19  467  		msecs_to_jiffies(timeslice_ms);
f86ad0ed620cb3c Matthew Brost   2025-06-19  468  	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
f86ad0ed620cb3c Matthew Brost   2025-06-19  469  
f86ad0ed620cb3c Matthew Brost   2025-06-19  470  err_finalize:
f86ad0ed620cb3c Matthew Brost   2025-06-19  471  	if (err)
f86ad0ed620cb3c Matthew Brost   2025-06-19  472  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
f86ad0ed620cb3c Matthew Brost   2025-06-19  473  	migrate_vma_pages(&migrate);
f86ad0ed620cb3c Matthew Brost   2025-06-19  474  	migrate_vma_finalize(&migrate);
f35a6cdf8a6d69f Francois Dugast 2025-08-05  475  	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
f86ad0ed620cb3c Matthew Brost   2025-06-19  476  					DMA_TO_DEVICE);
f86ad0ed620cb3c Matthew Brost   2025-06-19  477  err_free:
f86ad0ed620cb3c Matthew Brost   2025-06-19  478  	if (zdd)
f86ad0ed620cb3c Matthew Brost   2025-06-19  479  		drm_pagemap_zdd_put(zdd);
f86ad0ed620cb3c Matthew Brost   2025-06-19  480  	kvfree(buf);
f86ad0ed620cb3c Matthew Brost   2025-06-19  481  err_out:
f86ad0ed620cb3c Matthew Brost   2025-06-19  482  	return err;
f86ad0ed620cb3c Matthew Brost   2025-06-19  483  }
f86ad0ed620cb3c Matthew Brost   2025-06-19  484  EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
f86ad0ed620cb3c Matthew Brost   2025-06-19  485  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
