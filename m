Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE304A23
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Aug 2026 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859528; cv=none; b=aUz4CX3c8UHjwAIILaFF2zK7pz0OmE++uh157H1ZUEunJxRIT7d7MSU6lOzrRL6w9PqhmrGqiFb0JfOWqLxy/B//SC485wXSWVfb06ZARKmnBaF8wRnvwDYuMKQqA7ilTG92Wa6pqldDCI72pUJmDKoWUldNDaydNubKLwMMpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859528; c=relaxed/simple;
	bh=8sv5I0p02d1maaMTkj6FtuGpQhoBn6rpBsnhLjUXQxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KMcuWZFA5AMxteCkAmZbgu9yPmjF3THgQksPoxTzSuz8aGxXgRLK7lWPPSFxV50Ak4cr3yofjY/tn5BWEHnDMfliHDoUQFaGsGDcCqQPGLNaJUs/dbdzMtj4R6mF1Hz7WfCIFWEL+tQsB5zJVYCepc2QlHgBq1qOsD1eLZUCsj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSWnH8lz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSWnH8lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787859526; x=1819395526;
  h=date:from:to:cc:subject:message-id;
  bh=8sv5I0p02d1maaMTkj6FtuGpQhoBn6rpBsnhLjUXQxw=;
  b=ZSWnH8lzgGtZ5k7R4jP5nGISDlDlqkhOh4OOJ7vIvjgeXrZyorlAJucn
   Dsdh08RkvEfgaAROAxPidrLzavkjga3XjZwK3Bcv61Q+uiiz5qlp2UPZT
   L6VrNKPEr8mSkkKaL1InJ57Eu4YHVTSIuuJXCeWE4VoKfe/k89FA33UKm
   MsHxYKqGj1G+coE317JakwoMBglh/2z+o6VHDxQkisJoIUEdNe7dx2W50
   wdar0mpgrxu61Vp1cd5/2VNCz2pLIOFIey35hQ895Cd2mWMIMJS5M2+/g
   AfMuC2kxFVbZ6WAoqA2ntDuWsQDn11uiay6SZB7bdK8ojk5QrwB7Srv0O
   Q==;
X-CSE-ConnectionGUID: qZrFBdwaQx6e+cQVXiCnsg==
X-CSE-MsgGUID: F9nvmZ/zQf2I2F9zkkmaNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105890416"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="105890416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:38:45 -0700
X-CSE-ConnectionGUID: 254tgy2kRQ6m0vpavF5/1A==
X-CSE-MsgGUID: 7nsymMbaS+G9lzmeaecObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="264724311"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 12:38:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzfvr-000000009xh-0Lhh;
	Thu, 27 Aug 2026 19:38:39 +0000
Date: Fri, 28 Aug 2026 03:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_arm64 20/38]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 armv8_map_range() warn:
 impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
Message-ID: <202608280314.x2g9pIgx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   c8e2bfb14a9e9ecdcccf303888f6b388a5fee9b1
commit: 27b050d135df207da32c5c1c476b206cc5fb7053 [20/38] iommupt/armv8: Implement the iommu specific components
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r072-20260827 (https://download.01.org/0day-ci/archive/20260828/202608280314.x2g9pIgx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608280314.x2g9pIgx-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 armv8_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'

vim +952 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523a Jason Gunthorpe 2025-11-04   929  
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   930  static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   931  			 phys_addr_t paddr, dma_addr_t len, unsigned int prot,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   932  			 gfp_t gfp, size_t *mapped)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   933  {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   934  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   935  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   936  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   937  	struct pt_iommu_map_args map = {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   938  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   939  		.oa = paddr,
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   940  	};
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   941  	bool single_page = false;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   942  	struct pt_range range;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   943  	int ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   944  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   945  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   946  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   947  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   948  		return -EINVAL;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   949  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   950  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   951  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  @952  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   953  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   954  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   955  		return -ERANGE;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   956  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   957  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   958  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   959  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   960  	map.attrs.gfp = gfp;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   961  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   962  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   963  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   964  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   965  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   966  	/* Calculate target page size and level for the leaves */
8ef3f77c440005c Jason Gunthorpe 2026-05-12   967  	if (pt_has_system_page_size(common) && len == PAGE_SIZE &&
8ef3f77c440005c Jason Gunthorpe 2026-05-12   968  		likely(pgsize_bitmap & PAGE_SIZE)) {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   969  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   970  			return -ENXIO;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   971  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   972  		map.leaf_level = 0;
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   973  		map.num_leaves = 1;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   974  		single_page = true;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   975  	} else {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   976  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   977  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   978  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   979  			return -ENXIO;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   980  		map.leaf_level =
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   981  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   982  		map.num_leaves = pt_pgsz_count(pgsize_bitmap, range.va,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   983  					       range.last_va, paddr,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27   984  					       map.leaf_pgsize_lg2);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   985  	}
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   986  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   987  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   988  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   989  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   990  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   991  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   992  
efa03dab7ce4ed7 Jason Gunthorpe 2025-10-23   993  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   994  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   995  	/*
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   996  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   997  	 * cache that may refer to the freed levels.
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   998  	 */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04   999  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1000  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1001  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1002  	/* Bytes successfully mapped */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1003  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1004  	*mapped += map.oa - paddr;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1005  	return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1006  }
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  1007  

:::::: The code at line 952 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
