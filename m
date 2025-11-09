Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CCE33E7
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762654710; cv=none; b=ZldDSRzRaAYkN9mChO9Fm9G0FGVRa+e0wyanEQReza20vrQV83K5NKNC5FT52k7nFFAqIpWpEd/SxPwGo2AWQItdgZTAIbYGQIvt9gh4jZn5Ss+MqAEmTYrMpGPaATCZtB/Y/WIlCVjmCv3UHW7RpnRw3N9Fo/lTGYCailqrUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762654710; c=relaxed/simple;
	bh=fGpQfssbXkeAU/Zg/8FkcBODFyKH8IRKDs405uuW+1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V//eeCLe68x/8e4aeYHBXtQvRnf29xeN23m8vSHZl8tSZwGCqtqzo0xLYcCM5MQe9aVO0S8ME74mOV1Jh3c+ebXqVWAp8pvF9fUVyOakKj3zFSziCPPj3N1Ey+EZmVyRS9Xt6a/MJ/hNXVz09U1etM26EJ2akRVMmfiSrKaJpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNnsXyil; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNnsXyil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762654708; x=1794190708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGpQfssbXkeAU/Zg/8FkcBODFyKH8IRKDs405uuW+1Q=;
  b=PNnsXyilcfHn/HL/CPL5ipujVuhABXVKMlal87IlLoXogV1kftY+FXZg
   U4Y2atzHWEA58alibSKmU3otXGl21vgfIqmg0B/YOgdcMiouu0iyAkWUx
   ejq39bxlK+EgYh8T4GvM+gPO6CSxSJUTFrNcFgWW5BlVS7/cEdS9uTbVW
   3WhtQJfVvBciixrLQ6rwiwv+vW703KsjMF3W+WJAwiQfL5T7r6ZnoIql1
   XfkChaz31H65zaF5zNBhbqtpt4I8cRHDaxRy/npmRW+VDnaZFB7zTZEjY
   lUTy1eiIFnQgJsHcqKVMn/3Ainl1sNNj+JlRr8uFfX7vvXe0PN8gSOIV/
   A==;
X-CSE-ConnectionGUID: UDvBMXxOShOtlcIcYgbT9Q==
X-CSE-MsgGUID: M7DiJhAVTqioHe4hljWZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="90223850"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="90223850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 18:18:27 -0800
X-CSE-ConnectionGUID: IwHIgrmlQnyzITTMbS7uuA==
X-CSE-MsgGUID: FwjaI7jGQ/mp84xIYylDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="187624109"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2025 18:18:25 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHv0Y-0001gt-2v;
	Sun, 09 Nov 2025 02:18:22 +0000
Date: Sun, 9 Nov 2025 10:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iommu:core 19/36] drivers/iommu/generic_pt/fmt/../iommu_pt.h:765
 pt_iommu_x86_64_map_pages() warn: impossible condition '(paddr >
 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202511091045.XAPx4qom-lkp@intel.com>
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
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   9ad648017b1813a05c4ce899e5e454ec3adb1dfe
commit: aef5de756ea871ab44e3a1a87be6c944e6587c51 [19/36] iommupt: Add the x86 64 bit page table format
:::::: branch date: 35 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251108 (https://download.01.org/0day-ci/archive/20251109/202511091045.XAPx4qom-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511091045.XAPx4qom-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:765 pt_iommu_x86_64_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:205 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_x86_64_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:291 x86_64_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:662 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:662 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:621 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1020 pt_init_common() warn: bitwise AND condition is false here

vim +765 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  713  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  714  /**
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  715   * map_pages() - Install translation for an IOVA range
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  716   * @domain: Domain to manipulate
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  717   * @iova: IO virtual address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  718   * @paddr: Physical/Output address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  719   * @pgsize: Length of each page
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  720   * @pgcount: Length of the range in pgsize units starting from @iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  721   * @prot: A bitmap of IOMMU_READ/WRITE/CACHE/NOEXEC/MMIO
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  722   * @gfp: GFP flags for any memory allocations
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  723   * @mapped: Total bytes successfully mapped
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  724   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  725   * The range starting at IOVA will have paddr installed into it. The caller
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  726   * must specify a valid pgsize and pgcount to segment the range into compatible
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  727   * blocks.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  728   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  729   * On error the caller will probably want to invoke unmap on the range from iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  730   * up to the amount indicated by @mapped to return the table back to an
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  731   * unchanged state.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  732   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  733   * Context: The caller must hold a write range lock that includes the whole
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  734   * range.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  735   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  736   * Returns: -ERRNO on failure, 0 on success. The number of bytes of VA that were
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  737   * mapped are added to @mapped, @mapped is not zerod first.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  738   */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  739  int DOMAIN_NS(map_pages)(struct iommu_domain *domain, unsigned long iova,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  740  			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  741  			 int prot, gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  742  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  743  	struct pt_iommu *iommu_table =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  744  		container_of(domain, struct pt_iommu, domain);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  745  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  746  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  747  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  748  	pt_vaddr_t len = pgsize * pgcount;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  749  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  750  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  751  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  752  		.leaf_pgsize_lg2 = vaffs(pgsize),
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  753  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  754  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  755  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  756  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  757  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  758  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  759  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  760  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  761  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  762  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  763  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  764  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @765  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  766  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  767  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  768  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  769  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  770  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  771  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  772  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  773  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  774  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  775  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  776  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  777  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  778  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  779  	/* Calculate target page size and level for the leaves */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  780  	if (pt_has_system_page_size(common) && pgsize == PAGE_SIZE &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  781  	    pgcount == 1) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  782  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  783  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  784  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  785  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  786  		map.leaf_level = 0;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  787  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  788  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  789  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  790  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  791  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  792  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  793  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  794  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  795  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  796  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  797  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  798  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  799  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  800  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  801  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  802  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  803  	ret = do_map(&range, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  804  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  805  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  806  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  807  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  808  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  809  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  810  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  811  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  812  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  813  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  814  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  815  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  816  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  817  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(map_pages), "GENERIC_PT_IOMMU");
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  818  

:::::: The code at line 765 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
