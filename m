Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21272E8B64
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818031; cv=none; b=fBlYoTf6ET1xf6GZmfeiZ0GWg29Tw3K3+QOLCTHC3qG8LiukP+9e3407jT1regd+vtK0edgCJttBPGGpPi2yKk6AQzt24CmntZaZ8vjGx9R1Syu2pqNX4lTcs+Rn0H63kGqeoqYHXjQ51mCeCR/huDNTPFwlwkSxC6kqAOf7QMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818031; c=relaxed/simple;
	bh=vmwpMLI98yt3HwZtphRhUZoHnACxARx9HZXCNNer338=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n7NE7Au8BE4Zvl5eMnl06g1oxhw9YHsmcCKeYAJIuVGQhdl/l4W9Uo+vmI+ykR1kdN44mu6+X1/O53oN5Z7xgJp549ZG5q+DW+UIMRo5+ywr5YtzCHxvHJ5FC9mpX5Qk+BM7JTH4nLG1w4zN+sZ6RQ6q/RJ65ihxi071YZazplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ND/vIObt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ND/vIObt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785818030; x=1817354030;
  h=date:from:to:cc:subject:message-id;
  bh=vmwpMLI98yt3HwZtphRhUZoHnACxARx9HZXCNNer338=;
  b=ND/vIObtwZp8tB1cqGWjeV0qPYqL4KjcelLnORlqXovABagqXHGQcfIw
   x46X9i8SO5Kxq7KvSFagMfgJJfwCihqvg0UfQPuxC5hkNx4cOWMy7tvGN
   9oML5L/wXRhtNZjY9rfx2dHIYbWsWfR1+osPxJelEPh5KhMqokON7vz+l
   x7m6e454KIIuv5eSEL9a92SbW4VYxEWvLYjfGBcUDx9bukyTArPap7gFy
   cpatT4fchnxyLqA9GVHYdEXy/VnAcCITiVvTDrld4kr287dD/IC3PBYnk
   V45gHKmGmD5qqioozaQcSRijMjZZKhNdOjhVFVqaWKHzDbE6mkWkx/K4k
   g==;
X-CSE-ConnectionGUID: 78Hal7zqQRSmT2l5fg3GfQ==
X-CSE-MsgGUID: klKXLSKqQcKYdQswxP0bBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90249109"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="90249109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:33:49 -0700
X-CSE-ConnectionGUID: STxdAuhrSwmV29SmiaoqsA==
X-CSE-MsgGUID: jRzunZYbQqyYNKpmyw2r1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="264893297"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2026 21:33:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6qY-000000008wj-0VHw;
	Tue, 04 Aug 2026 04:33:46 +0000
Date: Tue, 04 Aug 2026 12:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/bcm2712-iommu.c:151:24: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202608041236.1JgQmtPX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Daniel-Drake/generic_pt-allow-missing-sw-bit-in-DMA_INCOHERENT-case/20260728-104924, commit: 0ee3a30c51b6df9d40444e59dde79947e9be7e09"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Drake <dan@reactivated.net>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Drake/generic_pt-allow-missing-sw-bit-in-DMA_INCOHERENT-case/20260728-104924
head:   dfd34af1fe7ce4108ac5744c4953720d46fad45e
commit: 0ee3a30c51b6df9d40444e59dde79947e9be7e09 iommu: Add Broadcom BCM2712 IOMMU driver
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041236.1JgQmtPX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041236.1JgQmtPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041236.1JgQmtPX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/iommu/bcm2712-iommu.c: In function 'bcm2712_iommu_init':
>> drivers/iommu/bcm2712-iommu.c:151:24: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     151 |         u32 pa_width = FIELD_GET(MMMU_DEBUG_INFO_PA_WIDTH_MASK, u);
         |                        ^~~~~~~~~
   In file included from drivers/iommu/bcm2712-iommu.c:42:
   drivers/iommu/bcm2712-iommu.c: In function 'bcm2712_iommu_domain_alloc':
>> drivers/iommu/bcm2712-iommu.h:18:34: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '42949672960' to '0' [-Woverflow]
      18 | #define BCM2712_APERTURE_BASE    (40ULL << 30)
         |                                  ^
   drivers/iommu/bcm2712-iommu.c:437:48: note: in expansion of macro 'BCM2712_APERTURE_BASE'
     437 |         domain->base.geometry.aperture_start = BCM2712_APERTURE_BASE;
         |                                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/bcm2712-iommu.h:20:34: warning: conversion from 'long long unsigned int' to 'dma_addr_t' {aka 'unsigned int'} changes value from '47244640255' to '4294967295' [-Woverflow]
      20 | #define BCM2712_APERTURE_END     (BCM2712_APERTURE_BASE + BCM2712_APERTURE_SIZE)
         |                                  ^
   drivers/iommu/bcm2712-iommu.c:438:46: note: in expansion of macro 'BCM2712_APERTURE_END'
     438 |         domain->base.geometry.aperture_end = BCM2712_APERTURE_END - 1;
         |                                              ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +151 drivers/iommu/bcm2712-iommu.c

0ee3a30c51b6df Daniel Drake 2026-07-27  146  
0ee3a30c51b6df Daniel Drake 2026-07-27  147  static void bcm2712_iommu_init(struct bcm2712_iommu *mmu)
0ee3a30c51b6df Daniel Drake 2026-07-27  148  {
0ee3a30c51b6df Daniel Drake 2026-07-27  149  	unsigned int bigpage_width, superpage_width;
0ee3a30c51b6df Daniel Drake 2026-07-27  150  	u32 u = MMU_RD(MMMU_DEBUG_INFO_OFFSET);
0ee3a30c51b6df Daniel Drake 2026-07-27 @151  	u32 pa_width = FIELD_GET(MMMU_DEBUG_INFO_PA_WIDTH_MASK, u);
0ee3a30c51b6df Daniel Drake 2026-07-27  152  
0ee3a30c51b6df Daniel Drake 2026-07-27  153  	dev_dbg(mmu->dev, "DEBUG_INFO = 0x%08x\n", u);
0ee3a30c51b6df Daniel Drake 2026-07-27  154  	WARN_ON(FIELD_GET(MMMU_DEBUG_INFO_VERSION_MASK, u) < 4 ||
0ee3a30c51b6df Daniel Drake 2026-07-27  155  		FIELD_GET(MMMU_DEBUG_INFO_VA_WIDTH_MASK, u) < 6 ||
0ee3a30c51b6df Daniel Drake 2026-07-27  156  		pa_width < 6 || !(u & MMMU_DEBUG_INFO_BYPASS));
0ee3a30c51b6df Daniel Drake 2026-07-27  157  
0ee3a30c51b6df Daniel Drake 2026-07-27  158  	dma_set_mask_and_coherent(mmu->dev, DMA_BIT_MASK(pa_width + 30u));
0ee3a30c51b6df Daniel Drake 2026-07-27  159  
0ee3a30c51b6df Daniel Drake 2026-07-27  160  	bigpage_width = FIELD_GET(MMMU_DEBUG_INFO_BIGPAGE_WIDTH_MASK, u);
0ee3a30c51b6df Daniel Drake 2026-07-27  161  	if (bigpage_width)
0ee3a30c51b6df Daniel Drake 2026-07-27  162  		mmu->bigpage_size = IOMMU_PAGE_SIZE << bigpage_width;
0ee3a30c51b6df Daniel Drake 2026-07-27  163  
0ee3a30c51b6df Daniel Drake 2026-07-27  164  	superpage_width = FIELD_GET(MMMU_DEBUG_INFO_SUPERPAGE_WIDTH_MASK, u);
0ee3a30c51b6df Daniel Drake 2026-07-27  165  	if (superpage_width)
0ee3a30c51b6df Daniel Drake 2026-07-27  166  		mmu->superpage_size = IOMMU_PAGE_SIZE << superpage_width;
0ee3a30c51b6df Daniel Drake 2026-07-27  167  
0ee3a30c51b6df Daniel Drake 2026-07-27  168  	/* Disable MMU and clear sticky flags; meanwhile flush the TLB */
0ee3a30c51b6df Daniel Drake 2026-07-27  169  	MMU_WR(MMMU_CTRL_OFFSET, MMMU_CTRL_CAP_EXCEEDED | MMMU_CTRL_PT_INVALID |
0ee3a30c51b6df Daniel Drake 2026-07-27  170  					 MMMU_CTRL_WRITE_VIOLATION |
0ee3a30c51b6df Daniel Drake 2026-07-27  171  					 MMMU_CTRL_STATS_CLEAR |
0ee3a30c51b6df Daniel Drake 2026-07-27  172  					 MMMU_CTRL_TLB_CLEAR);
0ee3a30c51b6df Daniel Drake 2026-07-27  173  
0ee3a30c51b6df Daniel Drake 2026-07-27  174  	/* Put MMU into 2-level mode */
0ee3a30c51b6df Daniel Drake 2026-07-27  175  	MMU_WR(MMMU_MISC_OFFSET,
0ee3a30c51b6df Daniel Drake 2026-07-27  176  	       MMU_RD(MMMU_MISC_OFFSET) & ~MMMU_MISC_SINGLE_TABLE);
0ee3a30c51b6df Daniel Drake 2026-07-27  177  }
0ee3a30c51b6df Daniel Drake 2026-07-27  178  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
