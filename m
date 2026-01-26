Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905901DF75D
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450726; cv=none; b=Vn3ZC+3cpdzA6mI4UwdWvF+2hAjL4OKmCvRXpriacaS/QMuGyFkvlvo2qN6S6hnjI+qDjNiDvajXFyQ7w9t8W9jDAs0N2Py86UbcXtmAzxusCBg8VBXN344Jc2+pQZK6y4AyBTM1xAPNQl8NBHzh7Ebk94F33O75ZI7ucOOtwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450726; c=relaxed/simple;
	bh=MjfMLsqCd0/kWG7WW3ddYmMoPlEZwTJhZFAovYEya/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qHQ9u/HCAWWGk0yup00Twg/O9pHs6Bx0PyAWHEa0T9yofdiu/VMtsSpwv3nPgceGkLqHVyfptp4II/NxZFCKNAroZrEreVcHtlNj1EPY2oSBOrWNLNnx5+oMqTfdyu9/g6eCtJvEBiKtmX0iEj/mrx0VQi06AD10Omnl3dzdgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUbn6JWW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUbn6JWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769450724; x=1800986724;
  h=date:from:to:cc:subject:message-id;
  bh=MjfMLsqCd0/kWG7WW3ddYmMoPlEZwTJhZFAovYEya/I=;
  b=JUbn6JWWBV5Pq4P6Zg4P8S4vf0ETavlsu2rvjiEMOknhMjxMCbb3obzu
   AQ2WeNLGtU+hagDjW3DEniMPRjZ6eBeNNtKHERocwppkajQa7qhseFYKX
   cWIhbumIzkNot3tPM0dfKqNroqqIKxa6YjRFpvboNZPN4rRMaRyy/lW6K
   DKwIalbNpX2vOmCm1Vnc3w3Hhdwq9Cxt0k/pXHGeNTa51sjQt0wlQmxEC
   FfOl4a1i6EMEVBweBrdfU+76Xx5iDQbepVcI2t1qV66AmIzQYr2eKqkcj
   tTwlRDtTqMr3XVyMdPQxapd5g8VYipXDxD8/WQkZF65ncZ/x5JtZfb3gc
   g==;
X-CSE-ConnectionGUID: oA+nQma2S4CXknLg1JjPZw==
X-CSE-MsgGUID: mS945Y/1RUyJYOdJNaSuGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69655332"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69655332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 10:05:24 -0800
X-CSE-ConnectionGUID: hANdYaaOQF+TfNSOQlrntw==
X-CSE-MsgGUID: EapDinY6TJ+kBM5Xv/pbSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="208173240"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2026 10:05:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkQxk-00000000XZI-3D9j;
	Mon, 26 Jan 2026 18:05:20 +0000
Date: Tue, 27 Jan 2026 02:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/generic_pt/fmt/../iommu_pt.h:730
 pt_iommu_amdv1_mock_map_pages() warn: impossible condition '(paddr >
 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202601270141.EsSldWJP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Samiullah Khawaja <skhawaja@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: e5359dcc617a2174d834bab4083340196615d8bd iommupt: Add a mock pagetable format for iommufd selftest to use
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r071-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270141.EsSldWJP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601270141.EsSldWJP-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:730 pt_iommu_amdv1_mock_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:586 increase_top() warn: missing unwind goto?

vim +730 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  678  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  679  /**
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  680   * map_pages() - Install translation for an IOVA range
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  681   * @domain: Domain to manipulate
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  682   * @iova: IO virtual address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  683   * @paddr: Physical/Output address to start
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  684   * @pgsize: Length of each page
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  685   * @pgcount: Length of the range in pgsize units starting from @iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  686   * @prot: A bitmap of IOMMU_READ/WRITE/CACHE/NOEXEC/MMIO
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  687   * @gfp: GFP flags for any memory allocations
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  688   * @mapped: Total bytes successfully mapped
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  689   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  690   * The range starting at IOVA will have paddr installed into it. The caller
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  691   * must specify a valid pgsize and pgcount to segment the range into compatible
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  692   * blocks.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  693   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  694   * On error the caller will probably want to invoke unmap on the range from iova
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  695   * up to the amount indicated by @mapped to return the table back to an
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  696   * unchanged state.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  697   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  698   * Context: The caller must hold a write range lock that includes the whole
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  699   * range.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  700   *
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  701   * Returns: -ERRNO on failure, 0 on success. The number of bytes of VA that were
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  702   * mapped are added to @mapped, @mapped is not zerod first.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  703   */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  704  int DOMAIN_NS(map_pages)(struct iommu_domain *domain, unsigned long iova,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  705  			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  706  			 int prot, gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  707  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  708  	struct pt_iommu *iommu_table =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  709  		container_of(domain, struct pt_iommu, domain);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  710  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  711  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  712  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  713  	pt_vaddr_t len = pgsize * pgcount;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  714  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  715  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  716  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  717  		.leaf_pgsize_lg2 = vaffs(pgsize),
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  718  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  719  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  720  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  721  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  722  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  723  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  724  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  725  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  726  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  727  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  728  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  729  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @730  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  731  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  732  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  733  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  734  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  735  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  736  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  737  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  738  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  739  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  740  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  741  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  742  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  743  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  744  	/* Calculate target page size and level for the leaves */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  745  	if (pt_has_system_page_size(common) && pgsize == PAGE_SIZE &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  746  	    pgcount == 1) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  747  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  748  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  749  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  750  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  751  		map.leaf_level = 0;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  752  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  753  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  754  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  755  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  756  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  757  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  758  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  759  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  760  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  761  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  762  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  763  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  764  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  765  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  766  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  767  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  768  	ret = do_map(&range, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  769  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  770  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  771  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  772  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  773  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  774  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  775  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  776  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  777  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  778  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  779  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  780  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  781  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  782  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(map_pages), "GENERIC_PT_IOMMU");
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  783  

:::::: The code at line 730 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
