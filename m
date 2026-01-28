Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1328642D
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634165; cv=none; b=SAYsovBUdBsxn99LHEh4ATbgO954c1WvQmxjOlqsHhk16A256AAQc259rh5SqRfOeqblHuSgRVSI8Q1opx592GFvjq/RlGxCBDPmd0eGKEp+IwsC3GPF/BXOQSRzVdHqwteWbxU0smyCKlBPYdDuZyDkZx1kLiRlCeFJ8wnswJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634165; c=relaxed/simple;
	bh=ASPslEhgieGvJO632qy9QhX0gRMH93YDHczDFLaObU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dczjlCezZhW1Bm4Y0RKocsjkc9mS3rOJiw2ggUq4TAhVZZgf1IHy0To5J1KrE3PK46dwQezZhs+EiAcFBSjELVBYmAUndpCq39Z22JLf9X/5bTeohK5+Fk74DJYdC4J9qVbC9QX3GbFFAFUQ0RlnAm95KGpm59OGERqpobaaS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzHL2IdD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzHL2IdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769634163; x=1801170163;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ASPslEhgieGvJO632qy9QhX0gRMH93YDHczDFLaObU0=;
  b=SzHL2IdD5r73SkqJc91GR6ibkYLFGwnmNOWWtjScdqNOPaQkDATZ7DuO
   XuoFS4C2Klp5k+MQlvAkD69FKZNTXug9cuzhFyXdIcDcnYw13j5/+QbUH
   1GHmXritMXVuGXFLkPAb1apKFj5D7+sJsu+H/l2pooUW7gLv2sxJ+PUxW
   M1ATwTX4BlXEat6EGy8DWT8yu8iu5f82QNRIxQ7RdD/g2QhPChVMPWFsb
   ixYlNdrvvP5ymSECMWEJKEqymOqwwyWc9CB7clQjp7EGuPApxComNSu3r
   JoAuULPgl6xcpdLaO/uxVpuBd8zLdl/zMlq0Dsc5KPcvge5+EH9UZtI9X
   w==;
X-CSE-ConnectionGUID: NdGNtl+7TVedsHZNE1lHHA==
X-CSE-MsgGUID: V21BgUKcQ+GayWhynaoptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81588789"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81588789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:02:43 -0800
X-CSE-ConnectionGUID: yk0B1md1RfOZdDOJttWz0w==
X-CSE-MsgGUID: GTXbr60iSl2UDW1K/ll+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208270241"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 13:02:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlCgR-00000000anw-0mgC;
	Wed, 28 Jan 2026 21:02:39 +0000
Date: Thu, 29 Jan 2026 05:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link,
 and sync API in GPU SVM
Message-ID: <202601290502.B5smBHPk-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260128004841.2436896-3-matthew.brost@intel.com>
References: <20260128004841.2436896-3-matthew.brost@intel.com>
TO: Matthew Brost <matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next drm-tip/drm-tip next-20260128]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-pagemap-Add-helper-to-access-zone_device_data/20260128-085843
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260128004841.2436896-3-matthew.brost%40intel.com
patch subject: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: sparc64-randconfig-r052-20260128 (https://download.01.org/0day-ci/archive/20260129/202601290502.B5smBHPk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290502.B5smBHPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601290502.B5smBHPk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gpusvm.c:1566:10: error: call to '__compiletime_assert_340' declared with 'error' attribute: BUILD_BUG failed
    1566 |                                                    HPAGE_PMD_SIZE ?
         |                                                    ^
   include/linux/huge_mm.h:120:34: note: expanded from macro 'HPAGE_PMD_SIZE'
     120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHIFT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:619:2: note: expanded from macro '_compiletime_assert'
     619 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:612:4: note: expanded from macro '__compiletime_assert'
     612 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:117:1: note: expanded from here
     117 | __compiletime_assert_340
         | ^
   1 error generated.


vim +1566 drivers/gpu/drm/drm_gpusvm.c

99624bdff867079 Matthew Brost         2025-03-05  1374  
99624bdff867079 Matthew Brost         2025-03-05  1375  /**
6364afd532bcabf Matthew Auld          2025-08-28  1376   * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
99624bdff867079 Matthew Brost         2025-03-05  1377   * @gpusvm: Pointer to the GPU SVM structure
6364afd532bcabf Matthew Auld          2025-08-28  1378   * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
6364afd532bcabf Matthew Auld          2025-08-28  1379   * @mm: The mm corresponding to the CPU range
6364afd532bcabf Matthew Auld          2025-08-28  1380   * @notifier: The corresponding notifier for the given CPU range
6364afd532bcabf Matthew Auld          2025-08-28  1381   * @pages_start: Start CPU address for the pages
6364afd532bcabf Matthew Auld          2025-08-28  1382   * @pages_end: End CPU address for the pages (exclusive)
99624bdff867079 Matthew Brost         2025-03-05  1383   * @ctx: GPU SVM context
99624bdff867079 Matthew Brost         2025-03-05  1384   *
6364afd532bcabf Matthew Auld          2025-08-28  1385   * This function gets and maps pages for CPU range and ensures they are
6364afd532bcabf Matthew Auld          2025-08-28  1386   * mapped for DMA access.
99624bdff867079 Matthew Brost         2025-03-05  1387   *
99624bdff867079 Matthew Brost         2025-03-05  1388   * Return: 0 on success, negative error code on failure.
99624bdff867079 Matthew Brost         2025-03-05  1389   */
83f706ecbde1dfd Matthew Auld          2025-08-28  1390  int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
6364afd532bcabf Matthew Auld          2025-08-28  1391  			 struct drm_gpusvm_pages *svm_pages,
6364afd532bcabf Matthew Auld          2025-08-28  1392  			 struct mm_struct *mm,
6364afd532bcabf Matthew Auld          2025-08-28  1393  			 struct mmu_interval_notifier *notifier,
83f706ecbde1dfd Matthew Auld          2025-08-28  1394  			 unsigned long pages_start, unsigned long pages_end,
99624bdff867079 Matthew Brost         2025-03-05  1395  			 const struct drm_gpusvm_ctx *ctx)
99624bdff867079 Matthew Brost         2025-03-05  1396  {
99624bdff867079 Matthew Brost         2025-03-05  1397  	struct hmm_range hmm_range = {
99624bdff867079 Matthew Brost         2025-03-05  1398  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
99624bdff867079 Matthew Brost         2025-03-05  1399  			HMM_PFN_REQ_WRITE),
99624bdff867079 Matthew Brost         2025-03-05  1400  		.notifier = notifier,
6364afd532bcabf Matthew Auld          2025-08-28  1401  		.start = pages_start,
6364afd532bcabf Matthew Auld          2025-08-28  1402  		.end = pages_end,
ad298d9ec957414 Thomas Hellström      2025-09-30  1403  		.dev_private_owner = ctx->device_private_page_owner,
99624bdff867079 Matthew Brost         2025-03-05  1404  	};
f86ad0ed620cb3c Matthew Brost         2025-06-19  1405  	void *zdd;
99624bdff867079 Matthew Brost         2025-03-05  1406  	unsigned long timeout =
99624bdff867079 Matthew Brost         2025-03-05  1407  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
99624bdff867079 Matthew Brost         2025-03-05  1408  	unsigned long i, j;
6364afd532bcabf Matthew Auld          2025-08-28  1409  	unsigned long npages = npages_in_range(pages_start, pages_end);
99624bdff867079 Matthew Brost         2025-03-05  1410  	unsigned long num_dma_mapped;
99624bdff867079 Matthew Brost         2025-03-05  1411  	unsigned int order = 0;
99624bdff867079 Matthew Brost         2025-03-05  1412  	unsigned long *pfns;
70ea69ceed7db91 Matthew Brost         2026-01-27  1413  	phys_addr_t last_phys;
99624bdff867079 Matthew Brost         2025-03-05  1414  	int err = 0;
99624bdff867079 Matthew Brost         2025-03-05  1415  	struct dev_pagemap *pagemap;
99624bdff867079 Matthew Brost         2025-03-05  1416  	struct drm_pagemap *dpagemap;
f70da6f99d4f40c Matthew Auld          2025-08-28  1417  	struct drm_gpusvm_pages_flags flags;
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1418  	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1419  							   DMA_BIDIRECTIONAL;
70ea69ceed7db91 Matthew Brost         2026-01-27  1420  	struct dma_iova_state *state = &svm_pages->state;
99624bdff867079 Matthew Brost         2025-03-05  1421  
99624bdff867079 Matthew Brost         2025-03-05  1422  retry:
9fb1f1256e419fc Matthew Brost         2025-11-21  1423  	if (time_after(jiffies, timeout))
9fb1f1256e419fc Matthew Brost         2025-11-21  1424  		return -EBUSY;
9fb1f1256e419fc Matthew Brost         2025-11-21  1425  
99624bdff867079 Matthew Brost         2025-03-05  1426  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
6364afd532bcabf Matthew Auld          2025-08-28  1427  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
99624bdff867079 Matthew Brost         2025-03-05  1428  		goto set_seqno;
99624bdff867079 Matthew Brost         2025-03-05  1429  
99624bdff867079 Matthew Brost         2025-03-05  1430  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
99624bdff867079 Matthew Brost         2025-03-05  1431  	if (!pfns)
99624bdff867079 Matthew Brost         2025-03-05  1432  		return -ENOMEM;
99624bdff867079 Matthew Brost         2025-03-05  1433  
99624bdff867079 Matthew Brost         2025-03-05  1434  	if (!mmget_not_zero(mm)) {
99624bdff867079 Matthew Brost         2025-03-05  1435  		err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1436  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1437  	}
99624bdff867079 Matthew Brost         2025-03-05  1438  
99624bdff867079 Matthew Brost         2025-03-05  1439  	hmm_range.hmm_pfns = pfns;
99624bdff867079 Matthew Brost         2025-03-05  1440  	while (true) {
99624bdff867079 Matthew Brost         2025-03-05  1441  		mmap_read_lock(mm);
99624bdff867079 Matthew Brost         2025-03-05  1442  		err = hmm_range_fault(&hmm_range);
99624bdff867079 Matthew Brost         2025-03-05  1443  		mmap_read_unlock(mm);
99624bdff867079 Matthew Brost         2025-03-05  1444  
99624bdff867079 Matthew Brost         2025-03-05  1445  		if (err == -EBUSY) {
99624bdff867079 Matthew Brost         2025-03-05  1446  			if (time_after(jiffies, timeout))
99624bdff867079 Matthew Brost         2025-03-05  1447  				break;
99624bdff867079 Matthew Brost         2025-03-05  1448  
99624bdff867079 Matthew Brost         2025-03-05  1449  			hmm_range.notifier_seq =
99624bdff867079 Matthew Brost         2025-03-05  1450  				mmu_interval_read_begin(notifier);
99624bdff867079 Matthew Brost         2025-03-05  1451  			continue;
99624bdff867079 Matthew Brost         2025-03-05  1452  		}
99624bdff867079 Matthew Brost         2025-03-05  1453  		break;
99624bdff867079 Matthew Brost         2025-03-05  1454  	}
99624bdff867079 Matthew Brost         2025-03-05  1455  	mmput(mm);
99624bdff867079 Matthew Brost         2025-03-05  1456  	if (err)
99624bdff867079 Matthew Brost         2025-03-05  1457  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1458  
99624bdff867079 Matthew Brost         2025-03-05  1459  map_pages:
99624bdff867079 Matthew Brost         2025-03-05  1460  	/*
99624bdff867079 Matthew Brost         2025-03-05  1461  	 * Perform all dma mappings under the notifier lock to not
99624bdff867079 Matthew Brost         2025-03-05  1462  	 * access freed pages. A notifier will either block on
99624bdff867079 Matthew Brost         2025-03-05  1463  	 * the notifier lock or unmap dma.
99624bdff867079 Matthew Brost         2025-03-05  1464  	 */
99624bdff867079 Matthew Brost         2025-03-05  1465  	drm_gpusvm_notifier_lock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1466  
f70da6f99d4f40c Matthew Auld          2025-08-28  1467  	flags.__flags = svm_pages->flags.__flags;
a9ac0fa455b050d Matthew Brost         2025-05-12  1468  	if (flags.unmapped) {
99624bdff867079 Matthew Brost         2025-03-05  1469  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1470  		err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1471  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1472  	}
99624bdff867079 Matthew Brost         2025-03-05  1473  
99624bdff867079 Matthew Brost         2025-03-05  1474  	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
99624bdff867079 Matthew Brost         2025-03-05  1475  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1476  		kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1477  		goto retry;
99624bdff867079 Matthew Brost         2025-03-05  1478  	}
99624bdff867079 Matthew Brost         2025-03-05  1479  
f70da6f99d4f40c Matthew Auld          2025-08-28  1480  	if (!svm_pages->dma_addr) {
99624bdff867079 Matthew Brost         2025-03-05  1481  		/* Unlock and restart mapping to allocate memory. */
99624bdff867079 Matthew Brost         2025-03-05  1482  		drm_gpusvm_notifier_unlock(gpusvm);
f70da6f99d4f40c Matthew Auld          2025-08-28  1483  		svm_pages->dma_addr =
f70da6f99d4f40c Matthew Auld          2025-08-28  1484  			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
f70da6f99d4f40c Matthew Auld          2025-08-28  1485  		if (!svm_pages->dma_addr) {
99624bdff867079 Matthew Brost         2025-03-05  1486  			err = -ENOMEM;
99624bdff867079 Matthew Brost         2025-03-05  1487  			goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1488  		}
99624bdff867079 Matthew Brost         2025-03-05  1489  		goto map_pages;
99624bdff867079 Matthew Brost         2025-03-05  1490  	}
99624bdff867079 Matthew Brost         2025-03-05  1491  
99624bdff867079 Matthew Brost         2025-03-05  1492  	zdd = NULL;
f86ad0ed620cb3c Matthew Brost         2025-06-19  1493  	pagemap = NULL;
99624bdff867079 Matthew Brost         2025-03-05  1494  	num_dma_mapped = 0;
99624bdff867079 Matthew Brost         2025-03-05  1495  	for (i = 0, j = 0; i < npages; ++j) {
99624bdff867079 Matthew Brost         2025-03-05  1496  		struct page *page = hmm_pfn_to_page(pfns[i]);
99624bdff867079 Matthew Brost         2025-03-05  1497  
c50729c68aaf936 Matthew Auld          2025-08-28  1498  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
99624bdff867079 Matthew Brost         2025-03-05  1499  		if (is_device_private_page(page) ||
99624bdff867079 Matthew Brost         2025-03-05  1500  		    is_device_coherent_page(page)) {
cfc101ad69846fc Francois Dugast       2026-01-27  1501  			struct drm_pagemap_zdd *__zdd =
cfc101ad69846fc Francois Dugast       2026-01-27  1502  				drm_pagemap_page_zone_device_data(page);
cfc101ad69846fc Francois Dugast       2026-01-27  1503  
bce13d6ecd6c0e6 Matthew Brost         2025-10-15  1504  			if (!ctx->allow_mixed &&
cfc101ad69846fc Francois Dugast       2026-01-27  1505  			    zdd != __zdd && i > 0) {
99624bdff867079 Matthew Brost         2025-03-05  1506  				err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1507  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1508  			}
70ea69ceed7db91 Matthew Brost         2026-01-27  1509  
70ea69ceed7db91 Matthew Brost         2026-01-27  1510  			if (dma_use_iova(state)) {
70ea69ceed7db91 Matthew Brost         2026-01-27  1511  				err = dma_iova_link(gpusvm->drm->dev, state,
70ea69ceed7db91 Matthew Brost         2026-01-27  1512  						    last_phys,
70ea69ceed7db91 Matthew Brost         2026-01-27  1513  						    i * PAGE_SIZE,
70ea69ceed7db91 Matthew Brost         2026-01-27  1514  						    PAGE_SIZE << order,
70ea69ceed7db91 Matthew Brost         2026-01-27  1515  						    dma_dir, 0);
70ea69ceed7db91 Matthew Brost         2026-01-27  1516  				if (err)
70ea69ceed7db91 Matthew Brost         2026-01-27  1517  					goto err_unmap;
70ea69ceed7db91 Matthew Brost         2026-01-27  1518  			}
70ea69ceed7db91 Matthew Brost         2026-01-27  1519  
cfc101ad69846fc Francois Dugast       2026-01-27  1520  			zdd = __zdd;
eb0ece16027f822 Linus Torvalds        2025-04-01  1521  			if (pagemap != page_pgmap(page)) {
99624bdff867079 Matthew Brost         2025-03-05  1522  				if (i > 0) {
99624bdff867079 Matthew Brost         2025-03-05  1523  					err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1524  					goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1525  				}
99624bdff867079 Matthew Brost         2025-03-05  1526  
eb0ece16027f822 Linus Torvalds        2025-04-01  1527  				pagemap = page_pgmap(page);
f86ad0ed620cb3c Matthew Brost         2025-06-19  1528  				dpagemap = drm_pagemap_page_to_dpagemap(page);
99624bdff867079 Matthew Brost         2025-03-05  1529  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
99624bdff867079 Matthew Brost         2025-03-05  1530  					/*
99624bdff867079 Matthew Brost         2025-03-05  1531  					 * Raced. This is not supposed to happen
99624bdff867079 Matthew Brost         2025-03-05  1532  					 * since hmm_range_fault() should've migrated
99624bdff867079 Matthew Brost         2025-03-05  1533  					 * this page to system.
99624bdff867079 Matthew Brost         2025-03-05  1534  					 */
99624bdff867079 Matthew Brost         2025-03-05  1535  					err = -EAGAIN;
99624bdff867079 Matthew Brost         2025-03-05  1536  					goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1537  				}
99624bdff867079 Matthew Brost         2025-03-05  1538  			}
f70da6f99d4f40c Matthew Auld          2025-08-28  1539  			svm_pages->dma_addr[j] =
99624bdff867079 Matthew Brost         2025-03-05  1540  				dpagemap->ops->device_map(dpagemap,
99624bdff867079 Matthew Brost         2025-03-05  1541  							  gpusvm->drm->dev,
99624bdff867079 Matthew Brost         2025-03-05  1542  							  page, order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1543  							  dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1544  			if (dma_mapping_error(gpusvm->drm->dev,
f70da6f99d4f40c Matthew Auld          2025-08-28  1545  					      svm_pages->dma_addr[j].addr)) {
99624bdff867079 Matthew Brost         2025-03-05  1546  				err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1547  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1548  			}
99624bdff867079 Matthew Brost         2025-03-05  1549  		} else {
99624bdff867079 Matthew Brost         2025-03-05  1550  			dma_addr_t addr;
99624bdff867079 Matthew Brost         2025-03-05  1551  
bce13d6ecd6c0e6 Matthew Brost         2025-10-15  1552  			if (is_zone_device_page(page) ||
bce13d6ecd6c0e6 Matthew Brost         2025-10-15  1553  			    (pagemap && !ctx->allow_mixed)) {
99624bdff867079 Matthew Brost         2025-03-05  1554  				err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1555  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1556  			}
99624bdff867079 Matthew Brost         2025-03-05  1557  
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1558  			if (ctx->devmem_only) {
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1559  				err = -EFAULT;
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1560  				goto err_unmap;
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1561  			}
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1562  
70ea69ceed7db91 Matthew Brost         2026-01-27  1563  			if (!i)
70ea69ceed7db91 Matthew Brost         2026-01-27  1564  				dma_iova_try_alloc(gpusvm->drm->dev, state,
70ea69ceed7db91 Matthew Brost         2026-01-27  1565  						   npages * PAGE_SIZE >=
70ea69ceed7db91 Matthew Brost         2026-01-27 @1566  						   HPAGE_PMD_SIZE ?
70ea69ceed7db91 Matthew Brost         2026-01-27  1567  						   HPAGE_PMD_SIZE : 0,
70ea69ceed7db91 Matthew Brost         2026-01-27  1568  						   npages * PAGE_SIZE);
70ea69ceed7db91 Matthew Brost         2026-01-27  1569  
70ea69ceed7db91 Matthew Brost         2026-01-27  1570  			if (dma_use_iova(state)) {
70ea69ceed7db91 Matthew Brost         2026-01-27  1571  				last_phys = page_to_phys(page);
70ea69ceed7db91 Matthew Brost         2026-01-27  1572  
70ea69ceed7db91 Matthew Brost         2026-01-27  1573  				err = dma_iova_link(gpusvm->drm->dev, state,
70ea69ceed7db91 Matthew Brost         2026-01-27  1574  						    page_to_phys(page),
70ea69ceed7db91 Matthew Brost         2026-01-27  1575  						    i * PAGE_SIZE,
70ea69ceed7db91 Matthew Brost         2026-01-27  1576  						    PAGE_SIZE << order,
70ea69ceed7db91 Matthew Brost         2026-01-27  1577  						    dma_dir, 0);
70ea69ceed7db91 Matthew Brost         2026-01-27  1578  				if (err)
70ea69ceed7db91 Matthew Brost         2026-01-27  1579  					goto err_unmap;
70ea69ceed7db91 Matthew Brost         2026-01-27  1580  
70ea69ceed7db91 Matthew Brost         2026-01-27  1581  				addr = state->addr + i * PAGE_SIZE;
70ea69ceed7db91 Matthew Brost         2026-01-27  1582  			} else {
99624bdff867079 Matthew Brost         2025-03-05  1583  				addr = dma_map_page(gpusvm->drm->dev,
99624bdff867079 Matthew Brost         2025-03-05  1584  						    page, 0,
99624bdff867079 Matthew Brost         2025-03-05  1585  						    PAGE_SIZE << order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1586  						    dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1587  				if (dma_mapping_error(gpusvm->drm->dev, addr)) {
99624bdff867079 Matthew Brost         2025-03-05  1588  					err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1589  					goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1590  				}
70ea69ceed7db91 Matthew Brost         2026-01-27  1591  			}
99624bdff867079 Matthew Brost         2025-03-05  1592  
f70da6f99d4f40c Matthew Auld          2025-08-28  1593  			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
99624bdff867079 Matthew Brost         2025-03-05  1594  				(addr, DRM_INTERCONNECT_SYSTEM, order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1595  				 dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1596  		}
99624bdff867079 Matthew Brost         2025-03-05  1597  		i += 1 << order;
99624bdff867079 Matthew Brost         2025-03-05  1598  		num_dma_mapped = i;
a9ac0fa455b050d Matthew Brost         2025-05-12  1599  		flags.has_dma_mapping = true;
99624bdff867079 Matthew Brost         2025-03-05  1600  	}
99624bdff867079 Matthew Brost         2025-03-05  1601  
70ea69ceed7db91 Matthew Brost         2026-01-27  1602  	if (dma_use_iova(state)) {
70ea69ceed7db91 Matthew Brost         2026-01-27  1603  		err = dma_iova_sync(gpusvm->drm->dev, state, 0,
70ea69ceed7db91 Matthew Brost         2026-01-27  1604  				    npages * PAGE_SIZE);
70ea69ceed7db91 Matthew Brost         2026-01-27  1605  		if (err)
70ea69ceed7db91 Matthew Brost         2026-01-27  1606  			goto err_unmap;
70ea69ceed7db91 Matthew Brost         2026-01-27  1607  	}
70ea69ceed7db91 Matthew Brost         2026-01-27  1608  
f86ad0ed620cb3c Matthew Brost         2025-06-19  1609  	if (pagemap) {
a9ac0fa455b050d Matthew Brost         2025-05-12  1610  		flags.has_devmem_pages = true;
a599b98607decdc Thomas Hellström      2025-12-19  1611  		drm_pagemap_get(dpagemap);
a599b98607decdc Thomas Hellström      2025-12-19  1612  		drm_pagemap_put(svm_pages->dpagemap);
f70da6f99d4f40c Matthew Auld          2025-08-28  1613  		svm_pages->dpagemap = dpagemap;
99624bdff867079 Matthew Brost         2025-03-05  1614  	}
99624bdff867079 Matthew Brost         2025-03-05  1615  
a9ac0fa455b050d Matthew Brost         2025-05-12  1616  	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
f70da6f99d4f40c Matthew Auld          2025-08-28  1617  	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
a9ac0fa455b050d Matthew Brost         2025-05-12  1618  
99624bdff867079 Matthew Brost         2025-03-05  1619  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1620  	kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1621  set_seqno:
f70da6f99d4f40c Matthew Auld          2025-08-28  1622  	svm_pages->notifier_seq = hmm_range.notifier_seq;
99624bdff867079 Matthew Brost         2025-03-05  1623  
99624bdff867079 Matthew Brost         2025-03-05  1624  	return 0;
99624bdff867079 Matthew Brost         2025-03-05  1625  
99624bdff867079 Matthew Brost         2025-03-05  1626  err_unmap:
6364afd532bcabf Matthew Auld          2025-08-28  1627  	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
99624bdff867079 Matthew Brost         2025-03-05  1628  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1629  err_free:
99624bdff867079 Matthew Brost         2025-03-05  1630  	kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1631  	if (err == -EAGAIN)
99624bdff867079 Matthew Brost         2025-03-05  1632  		goto retry;
99624bdff867079 Matthew Brost         2025-03-05  1633  	return err;
99624bdff867079 Matthew Brost         2025-03-05  1634  }
83f706ecbde1dfd Matthew Auld          2025-08-28  1635  EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
6364afd532bcabf Matthew Auld          2025-08-28  1636  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
