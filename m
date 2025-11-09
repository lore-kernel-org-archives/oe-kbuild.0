Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F314A60C
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762647973; cv=none; b=UGOuQX64hrZZgvZtk64pIGh8VTlZ5SXJy3qJ0Ha+UZ6DOftAFQUxv+D7UxtUnBAO1qW7QyVr1tg26ZHDlfGmCZuesaPk4n3IaQm6LwbkVaF7S1aoVZhVHibtOlWhNS2tJAmBbJCQNpWvGVdFBgZSVLJZ/CE3hAsXJe1Y56jdf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762647973; c=relaxed/simple;
	bh=gfTvkSDO93yEohQHy5QK7CqSk4MH+Dv/kdIIYA+EKYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GH5v8l6wTBLH694LbeiUP0nFtdC8aEE8ZlZDq7qkS925M3arCBu8PxBCtnbBlmgYsTt6/dt44tVUb1TSIGb6nhHZ3RlHizQKAb+xVn66qszHuMLz1FlAfY+n8QNJ1s0MNYt3x/FhiUTLhVFmsWw+XUD1RA/4zR0WlpKLZ9pQy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca5PIDlz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca5PIDlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762647972; x=1794183972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gfTvkSDO93yEohQHy5QK7CqSk4MH+Dv/kdIIYA+EKYs=;
  b=Ca5PIDlzunS7dtjl/xpyiRD55u0f2wsk0qNebYPLpoA32Mi7zYsA29gV
   DHJXgXi4Af2qD5z3LIryRArimwCc+Pr2iGRtxWpZu9jxszFPPWfPND9uh
   DPADhc+/85QjYim9gNEj0oBHs+GgBq7y+010uAW/aoGR34rcwXldzC5Ht
   j5fqXlFenodyh7RaESw2aX33TwWRtkMddj73CfivmI0FdZQokiUNFkkW4
   qybTydIw8rZSltx4aaLTvdQKluf3h6owWWXdqKgUu1Y9JE8tG/3T9El5K
   D9+DF78RU6lmw3UVQfYNty60OdMfLiKqz+nM3urWzVwORBkt/YdSefaD/
   g==;
X-CSE-ConnectionGUID: 13EIelHMRtKx2kv6Uuwa3A==
X-CSE-MsgGUID: XzFEevsBTp2LhhIIspU9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="68592268"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="68592268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 16:26:09 -0800
X-CSE-ConnectionGUID: u4DaSyPORvaGJJpxfOe2tw==
X-CSE-MsgGUID: dMwwLbvKQ66Z8oEoK3AVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="188526620"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2025 16:26:08 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHtFs-0001cJ-2p;
	Sun, 09 Nov 2025 00:26:04 +0000
Date: Sun, 9 Nov 2025 08:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iommu:core 14/36] drivers/iommu/generic_pt/fmt/../iommu_pt.h:628
 pt_iommu_amdv1_map_pages() warn: impossible condition '(paddr >
 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202511090813.fMvRHxBR-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Samiullah Khawaja <skhawaja@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   9ad648017b1813a05c4ce899e5e454ec3adb1dfe
commit: dcd6a011a8d523a114af2360a8753de5bd60c139 [14/36] iommupt: Add map_pages op
:::::: branch date: 33 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251108 (https://download.01.org/0day-ci/archive/20251109/202511090813.fMvRHxBR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511090813.fMvRHxBR-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:628 pt_iommu_amdv1_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_amdv1_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:525 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:525 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:484 increase_top() warn: missing unwind goto?

vim +628 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  576  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  577  /**
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  578   * map_pages() - Install translation for an IOVA range
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  579   * @domain: Domain to manipulate
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  580   * @iova: IO virtual address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  581   * @paddr: Physical/Output address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  582   * @pgsize: Length of each page
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  583   * @pgcount: Length of the range in pgsize units starting from @iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  584   * @prot: A bitmap of IOMMU_READ/WRITE/CACHE/NOEXEC/MMIO
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  585   * @gfp: GFP flags for any memory allocations
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  586   * @mapped: Total bytes successfully mapped
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  587   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  588   * The range starting at IOVA will have paddr installed into it. The caller
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  589   * must specify a valid pgsize and pgcount to segment the range into compatible
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  590   * blocks.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  591   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  592   * On error the caller will probably want to invoke unmap on the range from iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  593   * up to the amount indicated by @mapped to return the table back to an
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  594   * unchanged state.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  595   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  596   * Context: The caller must hold a write range lock that includes the whole
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  597   * range.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  598   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  599   * Returns: -ERRNO on failure, 0 on success. The number of bytes of VA that were
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  600   * mapped are added to @mapped, @mapped is not zerod first.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  601   */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  602  int DOMAIN_NS(map_pages)(struct iommu_domain *domain, unsigned long iova,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  603  			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  604  			 int prot, gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  605  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  606  	struct pt_iommu *iommu_table =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  607  		container_of(domain, struct pt_iommu, domain);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  608  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  609  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  610  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  611  	pt_vaddr_t len = pgsize * pgcount;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  612  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  613  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  614  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  615  		.leaf_pgsize_lg2 = vaffs(pgsize),
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  616  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  617  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  618  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  619  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  620  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  621  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  622  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  623  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  624  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  625  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  626  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  627  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @628  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  629  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  630  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  631  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  632  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  633  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  634  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  635  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  636  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  637  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  638  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  639  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  640  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  641  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  642  	/* Calculate target page size and level for the leaves */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  643  	if (pt_has_system_page_size(common) && pgsize == PAGE_SIZE &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  644  	    pgcount == 1) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  645  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  646  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  647  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  648  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  649  		map.leaf_level = 0;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  650  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  651  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  652  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  653  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  654  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  655  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  656  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  657  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  658  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  659  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  660  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  661  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  662  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  663  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  664  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  665  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  666  	ret = do_map(&range, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  667  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  668  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  669  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  670  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  671  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  672  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  673  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  674  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  675  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  676  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  677  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  678  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  679  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  680  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(map_pages), "GENERIC_PT_IOMMU");
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
