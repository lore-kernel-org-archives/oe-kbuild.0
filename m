Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FC29E11B
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Feb 2026 01:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240497; cv=none; b=ox33KdiszCM6rkaJquMkixwJKQOXh/EtwJ++5zBYb3HcvBFPJGfb2qnVFZnxHZzNB4cDf7H+mOcFipDe6GFLqYn/rOV8BWfm+NGluaKpApZHF2mhlq64X/hfSKSLsv4Udow1dI0of+MmX7fTSGkCxGSQBfDaQJ3rLLhgy03L7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240497; c=relaxed/simple;
	bh=19ZvxXqBnn9xwGQY5cAhp0jtoaqhSh1ZnAG4m9MhzYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHeBqpzoWFigZfWkG57fqqBPAbPedzYL1ADIhhtp15DY7/La7BRD3W56CgQDgmGIzU0UYXl1bqWbrX7iqQW9zMpnml8FB5CSxm8D2xWJij5sIaH64iqD9OrPOxir6gMaloEwRircRkkdV2dil9UQO7SialP6aPpTIXryoEr0P+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iY6nQMUB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iY6nQMUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772240493; x=1803776493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19ZvxXqBnn9xwGQY5cAhp0jtoaqhSh1ZnAG4m9MhzYw=;
  b=iY6nQMUBJTckj1ldY1FzNKadm8CE9usuQm+yzB6PXhXU1e/6qUoBWwXS
   3lYYODPcN/viB66HA1KovJbKc/926A7oHxd1iscmyk0CyexlSg9yyPMRu
   jOIRjVW/C738hsbVrwtX06DLOtVpd0H7SfQ/iAI2bhDmcp9ECOybsDxrC
   S4XbJ77bJ1qKYqtlXkxIRMS7qQfycnUAaDOYrPt1YEXLT882lzWYvojdS
   aJ0yiaLLsxfxAwWFVp+AzNnmnBCkqG+WqS7Fc1hkPNIQtMv+RrqOLqZjp
   AfwfbB6ol+JSG+A6gqaMW/WCsdkE6Kf0Zm84h8Uz39xR8/YthboxrrbhT
   w==;
X-CSE-ConnectionGUID: alzjxEbZTEedUACXj7C/5g==
X-CSE-MsgGUID: SMO/rakaQxeJjiY+kjWH/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="90905650"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="90905650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 17:01:32 -0800
X-CSE-ConnectionGUID: +BiCof+1TK2YkRC+I6OCaQ==
X-CSE-MsgGUID: vN/NR2jGSAmTIGxE9V4OAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="240063729"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2026 17:01:31 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw8hi-00000000BDb-2mWh;
	Sat, 28 Feb 2026 01:01:13 +0000
Date: Sat, 28 Feb 2026 09:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] iommupt: Avoid rewalking during map
Message-ID: <202602280840.ok5l06Wt-lkp@intel.com>
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
In-Reply-To: <2-v3-a1777ea76519+370f-iommpt_map_direct_jgg@nvidia.com>
References: <2-v3-a1777ea76519+370f-iommpt_map_direct_jgg@nvidia.com>
TO: Jason Gunthorpe <jgg@nvidia.com>
TO: iommu@lists.linux.dev
TO: Joerg Roedel <joro@8bytes.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Will Deacon <will@kernel.org>
CC: Kevin Tian <kevin.tian@intel.com>
CC: patches@lists.linux.dev
CC: Samiullah Khawaja <skhawaja@google.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommupt-Directly-call-iommupt-s-unmap_range/20260228-033653
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/2-v3-a1777ea76519%2B370f-iommpt_map_direct_jgg%40nvidia.com
patch subject: [PATCH v3 2/2] iommupt: Avoid rewalking during map
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20260228 (https://download.01.org/0day-ci/archive/20260228/202602280840.ok5l06Wt-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602280840.ok5l06Wt-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:897 x86_64_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:897 vtdss_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:897 amdv1_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

vim +897 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  874  
c4359bc14c2605 Jason Gunthorpe 2026-02-27  875  static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
c4359bc14c2605 Jason Gunthorpe 2026-02-27  876  			 phys_addr_t paddr, dma_addr_t len, unsigned int prot,
c4359bc14c2605 Jason Gunthorpe 2026-02-27  877  			 gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  878  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  879  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  880  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  881  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  882  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  883  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  884  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  885  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  886  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  887  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  888  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  889  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  890  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  891  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  892  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  893  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  894  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  895  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  896  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @897  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  898  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  899  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  900  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  901  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  902  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  903  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  904  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  905  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  906  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  907  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  908  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  909  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  910  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  911  	/* Calculate target page size and level for the leaves */
c4359bc14c2605 Jason Gunthorpe 2026-02-27  912  	if (pt_has_system_page_size(common) && len == PAGE_SIZE) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  913  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  914  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  915  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  916  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  917  		map.leaf_level = 0;
c4359bc14c2605 Jason Gunthorpe 2026-02-27  918  		map.num_leaves = 1;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  919  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  920  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  921  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  922  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  923  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  924  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  925  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  926  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
c4359bc14c2605 Jason Gunthorpe 2026-02-27  927  		map.num_leaves = pt_pgsz_count(pgsize_bitmap, range.va,
c4359bc14c2605 Jason Gunthorpe 2026-02-27  928  					       range.last_va, paddr,
c4359bc14c2605 Jason Gunthorpe 2026-02-27  929  					       map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  930  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  931  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  932  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  933  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  934  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  935  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  936  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  937  
efa03dab7ce4ed Jason Gunthorpe 2025-10-23  938  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  939  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  940  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  941  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  942  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  943  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  944  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  945  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  946  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  947  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  948  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  949  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  950  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  951  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  952  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
