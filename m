Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46878667
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Mar 2024 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239311; cv=none; b=UUJx1pxCk0VIprJTpY/hrtSryRJLVIjhm3A4Hsqg9uVgS9BVJ9BlUWzsOovlJ7XSfowvrdUXoet6H3F+kvCCSLFJ/CcUigOOSOd9NMxu//zVPcv3Wkxy2XrJ1QmKa4R3J83gpD1Kmgq5FQG9828y/UChAXRtl4vHLQbHWhf27Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239311; c=relaxed/simple;
	bh=JvI7V0EwMLdt4K3BRJM2XfaqoLvOmyIK7n2DB62NnN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCWx28/GlxMTA3lb48AINAu5RHaH03S2yV5aeUGIOKig3izMfJKIwsOtfQYo7Qvu7TnWqOsi0VsBQ+utODuTQp0xwRvWcEdQ/c1IBUqQAm2CvIbOox7GhSN2Viz65438Tf3HsC6lDECho9GDjSRtOHOWNKytDowcY4hcxQIcUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kP+ovThn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kP+ovThn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239309; x=1741775309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JvI7V0EwMLdt4K3BRJM2XfaqoLvOmyIK7n2DB62NnN0=;
  b=kP+ovThnF+t+i+35clMEWEOpzymERMd8tY+qTi2bKG56XP5g48Mzstue
   AZZwOymqcqdFUq0Pxsjv/8+e/NSMS3Ma43OtAebdoq/+QT1c6qrWHaT/E
   rKYpZEPaHXlVCwJENDDngqL7cEukHQxWflcIPT+3frkGOqXW/dkwGMKwo
   u5/MXZ8sBA9Ny4imv+l7AN9s/KZ9NCM3iK0PTN0gCHLc/X3dqEnDrcdo+
   UpabxHGJmDVkXgtNg2IEQ5duSjBVkO/v97vcFIyrHHevmTb0ZBqSHDENA
   EBhVSOGo0/dhXY17UlKlfzYfR1Flr83OWgB5EJt2MCeNZ9rJ1tD5IsS4x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22396167"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22396167"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11925088"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2024 03:28:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjzMv-000A2x-0C;
	Tue, 12 Mar 2024 10:28:25 +0000
Date: Tue, 12 Mar 2024 18:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many arguments
 for function swiotlb_tbl_unmap_single
Message-ID: <202403121813.HXKPRQZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many arguments for function swiotlb_tbl_unmap_single"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e07182766e467ad9f34911579d25d705e0647e76
commit: ae108dba4c541c0ff557cd6a0e2b93f0aff0b136 swiotlb: remove the alloc_size parameter to swiotlb_tbl_unmap_single
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240312/202403121813.HXKPRQZp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121813.HXKPRQZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403121813.HXKPRQZp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/xen/swiotlb-xen.c:406:41: sparse: sparse: too many arguments for function swiotlb_tbl_unmap_single
   drivers/xen/swiotlb-xen.c:437:41: sparse: sparse: too many arguments for function swiotlb_tbl_unmap_single

vim +406 drivers/xen/swiotlb-xen.c

^590eaf1fec755 Kaixu Xia         2021-03-16  362  
^590eaf1fec755 Kaixu Xia         2021-03-16  363  /*
^590eaf1fec755 Kaixu Xia         2021-03-16  364   * Map a single buffer of the indicated size for DMA in streaming mode.  The
^590eaf1fec755 Kaixu Xia         2021-03-16  365   * physical address to use is returned.
^590eaf1fec755 Kaixu Xia         2021-03-16  366   *
^590eaf1fec755 Kaixu Xia         2021-03-16  367   * Once the device is given the dma address, the device owns this memory until
^590eaf1fec755 Kaixu Xia         2021-03-16  368   * either xen_swiotlb_unmap_page or xen_swiotlb_dma_sync_single is performed.
^590eaf1fec755 Kaixu Xia         2021-03-16  369   */
^590eaf1fec755 Kaixu Xia         2021-03-16  370  static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
^590eaf1fec755 Kaixu Xia         2021-03-16  371  				unsigned long offset, size_t size,
^590eaf1fec755 Kaixu Xia         2021-03-16  372  				enum dma_data_direction dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  373  				unsigned long attrs)
^590eaf1fec755 Kaixu Xia         2021-03-16  374  {
^590eaf1fec755 Kaixu Xia         2021-03-16  375  	phys_addr_t map, phys = page_to_phys(page) + offset;
^590eaf1fec755 Kaixu Xia         2021-03-16  376  	dma_addr_t dev_addr = xen_phys_to_bus(phys);
^590eaf1fec755 Kaixu Xia         2021-03-16  377  
^590eaf1fec755 Kaixu Xia         2021-03-16  378  	BUG_ON(dir == DMA_NONE);
^590eaf1fec755 Kaixu Xia         2021-03-16  379  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  380  	 * If the address happens to be in the device's DMA window,
^590eaf1fec755 Kaixu Xia         2021-03-16  381  	 * we can safely return the device addr and not worry about bounce
^590eaf1fec755 Kaixu Xia         2021-03-16  382  	 * buffering it.
^590eaf1fec755 Kaixu Xia         2021-03-16  383  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  384  	if (dma_capable(dev, dev_addr, size, true) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  385  	    !range_straddles_page_boundary(phys, size) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  386  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
^590eaf1fec755 Kaixu Xia         2021-03-16  387  		swiotlb_force != SWIOTLB_FORCE)
^590eaf1fec755 Kaixu Xia         2021-03-16  388  		goto done;
^590eaf1fec755 Kaixu Xia         2021-03-16  389  
^590eaf1fec755 Kaixu Xia         2021-03-16  390  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  391  	 * Oh well, have to allocate and map a bounce buffer.
^590eaf1fec755 Kaixu Xia         2021-03-16  392  	 */
^590eaf1fec755 Kaixu Xia         2021-03-16  393  	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
^590eaf1fec755 Kaixu Xia         2021-03-16  394  
f7ed14d49d8c7b Christoph Hellwig 2020-02-03  395  	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
^590eaf1fec755 Kaixu Xia         2021-03-16  396  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
^590eaf1fec755 Kaixu Xia         2021-03-16  397  		return DMA_MAPPING_ERROR;
^590eaf1fec755 Kaixu Xia         2021-03-16  398  
^590eaf1fec755 Kaixu Xia         2021-03-16  399  	phys = map;
^590eaf1fec755 Kaixu Xia         2021-03-16  400  	dev_addr = xen_phys_to_bus(map);
^590eaf1fec755 Kaixu Xia         2021-03-16  401  
^590eaf1fec755 Kaixu Xia         2021-03-16  402  	/*
^590eaf1fec755 Kaixu Xia         2021-03-16  403  	 * Ensure that the address returned is DMA'ble
^590eaf1fec755 Kaixu Xia         2021-03-16  404  	 */
e52d4b5480cb99 Christoph Hellwig 2019-11-19  405  	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
^590eaf1fec755 Kaixu Xia         2021-03-16 @406  		swiotlb_tbl_unmap_single(dev, map, size, size, dir,
^590eaf1fec755 Kaixu Xia         2021-03-16  407  				attrs | DMA_ATTR_SKIP_CPU_SYNC);
^590eaf1fec755 Kaixu Xia         2021-03-16  408  		return DMA_MAPPING_ERROR;
^590eaf1fec755 Kaixu Xia         2021-03-16  409  	}
^590eaf1fec755 Kaixu Xia         2021-03-16  410  
^590eaf1fec755 Kaixu Xia         2021-03-16  411  done:
^590eaf1fec755 Kaixu Xia         2021-03-16  412  	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
c3fd7ea8b7a5d9 Christoph Hellwig 2019-11-07  413  		xen_dma_sync_for_device(dev_addr, phys, size, dir);
^590eaf1fec755 Kaixu Xia         2021-03-16  414  	return dev_addr;
^590eaf1fec755 Kaixu Xia         2021-03-16  415  }
^590eaf1fec755 Kaixu Xia         2021-03-16  416  

:::::: The code at line 406 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
