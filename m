Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6416D14A8B
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762662760; cv=none; b=GnDKYPR50NU2fuZSxVMcxVTs/lWDfbw4TSe8onfSWUk3YEsNGwDwMHCYES542uHAaRdu896fAPA1ojZPzDGm6BiOGgH7ui78DriMp+bp6Leh1nh4klI1SC7iJrHcXDJRBef+W6N1cROshXb8eLjTkXWdEL/kTQsKWCLMx8wgElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762662760; c=relaxed/simple;
	bh=0DV3YQkhmjsxmIbBTnbjcCMCW2A/pSNP0v8hMca6aMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glYdkWCqAxh65LJR4t+/Am4tiMSZQrNiwYT94lKZKpkCg0zdQt6UkPpnQAW91TgamhFrDWb/FNh/i2RluohCbyiKM204vre6XzAXCsZWwyhQFOpiLlS2tZW/3Oq8krBNpXnRmx3twzpS+CxjbL2jCjhVLM21QbvqHJD4BbocS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES3IUFvi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES3IUFvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762662758; x=1794198758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0DV3YQkhmjsxmIbBTnbjcCMCW2A/pSNP0v8hMca6aMY=;
  b=ES3IUFviTyNclSnuhCvlpSsvh7/RmNR6OmUeE8ayfkENhcHO4YCa1Qjx
   UU2b+Q3YnGlpJyqy0rTFNzYCczyYCMQWgX34lwyQtUPsJPn4OVDEascCE
   KQmjuUAGhQXt3PuQDXuW1P4Jj5g7fnKVqxTDGwQ/942eK7CUKnIk/TyFY
   1sMuCViTdeHque173reEyfUm2PcYAxTV0bBA19CFSAC+BQTFnpLfgY4y0
   uGFLNwHIw4z592sVtNKI6WLYmDdfku6AGBYqX2dxHhMqP0Nvl7WPnAtHj
   QsLxZMbA//QkYbXlgoJLbZafpbePMz+gXEjGPHmKw83j/JQSWqV45lRMV
   A==;
X-CSE-ConnectionGUID: TSAxXi2+TWmIND8468O3vA==
X-CSE-MsgGUID: nZCwd1wcS6upNQZUuwVhmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="67361952"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="67361952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 20:32:37 -0800
X-CSE-ConnectionGUID: m/4Ps4YASmaXP56OdS05Pw==
X-CSE-MsgGUID: NQuHAmhSR8OHrNLaJGSrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="188224822"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Nov 2025 20:32:36 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHx6Q-0001lg-1K;
	Sun, 09 Nov 2025 04:32:34 +0000
Date: Sun, 9 Nov 2025 12:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iommu:core 27/36] drivers/iommu/generic_pt/fmt/../iommu_pt.h:862
 pt_iommu_vtdss_map_pages() warn: impossible condition '(paddr >
 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202511091240.xZkxRKOz-lkp@intel.com>
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
CC: Lu Baolu <baolu.lu@linux.intel.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   9ad648017b1813a05c4ce899e5e454ec3adb1dfe
commit: 5448c1558f60d4051c90938f2878c6fb20e2982a [27/36] iommupt: Add the Intel VT-d second stage page table format
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251108 (https://download.01.org/0day-ci/archive/20251109/202511091240.xZkxRKOz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511091240.xZkxRKOz-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:862 pt_iommu_vtdss_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:208 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_vtdss_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 vtdss_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:752 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:752 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:701 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1122 pt_init_common() warn: bitwise AND condition is false here

vim +862 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  810  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  811  /**
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  812   * map_pages() - Install translation for an IOVA range
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  813   * @domain: Domain to manipulate
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  814   * @iova: IO virtual address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  815   * @paddr: Physical/Output address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  816   * @pgsize: Length of each page
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  817   * @pgcount: Length of the range in pgsize units starting from @iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  818   * @prot: A bitmap of IOMMU_READ/WRITE/CACHE/NOEXEC/MMIO
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  819   * @gfp: GFP flags for any memory allocations
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  820   * @mapped: Total bytes successfully mapped
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  821   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  822   * The range starting at IOVA will have paddr installed into it. The caller
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  823   * must specify a valid pgsize and pgcount to segment the range into compatible
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  824   * blocks.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  825   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  826   * On error the caller will probably want to invoke unmap on the range from iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  827   * up to the amount indicated by @mapped to return the table back to an
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  828   * unchanged state.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  829   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  830   * Context: The caller must hold a write range lock that includes the whole
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  831   * range.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  832   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  833   * Returns: -ERRNO on failure, 0 on success. The number of bytes of VA that were
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  834   * mapped are added to @mapped, @mapped is not zerod first.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  835   */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  836  int DOMAIN_NS(map_pages)(struct iommu_domain *domain, unsigned long iova,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  837  			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  838  			 int prot, gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  839  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  840  	struct pt_iommu *iommu_table =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  841  		container_of(domain, struct pt_iommu, domain);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  842  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  843  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  844  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  845  	pt_vaddr_t len = pgsize * pgcount;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  846  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  847  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  848  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  849  		.leaf_pgsize_lg2 = vaffs(pgsize),
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  850  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  851  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  852  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  853  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  854  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  855  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  856  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  857  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  858  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  859  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  860  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  861  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @862  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  863  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  864  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  865  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  866  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  867  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  868  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  869  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  870  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  871  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  872  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  873  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  874  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  875  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  876  	/* Calculate target page size and level for the leaves */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  877  	if (pt_has_system_page_size(common) && pgsize == PAGE_SIZE &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  878  	    pgcount == 1) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  879  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  880  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  881  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  882  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  883  		map.leaf_level = 0;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  884  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  885  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  886  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  887  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  888  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  889  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  890  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  891  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  892  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  893  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  894  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  895  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  896  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  897  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  898  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  899  
efa03dab7ce4ed Jason Gunthorpe 2025-10-23  900  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  901  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  902  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  903  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  904  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  905  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  906  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  907  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  908  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  909  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  910  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  911  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  912  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  913  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  914  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(map_pages), "GENERIC_PT_IOMMU");
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  915  

:::::: The code at line 862 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
