Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2272F39B4
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785653613; cv=none; b=BeeziUfAfa6bcPeu/omSy/5EZmkd2uq54fAqEXe/NFseYg7Ka1ypy9aVQnEhFHjUZ2AYxu9+eZTYFyHBnVijMArFSJ2sPo0tl3SZrqGYGX/crS+vVgdezBjIMuI35LsyEVD+RG6utR+TLFSYdr4P/t7RbdNmUqf8PLwC3+QJSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785653613; c=relaxed/simple;
	bh=WhNW4z1KbDwZ6lqOlwEEaLCj9sa0rs/NIA49wOfsIbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aXjASrQ2F38FkkjApbNDEJG+qqLQUTjviiY+B6UxcfilF38SzDPXHJojB859t3/mPTSCsCTQfG8/JNg4nLbPPft4fRyu9iDHmN5QikBchdIk+K2bVAdkASbTcsiibPsNuqARqoRDTzMs0nbt7YCOpYTsgz9g9cwVaAGiRyCBzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idb7Zkry; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idb7Zkry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785653611; x=1817189611;
  h=date:from:to:cc:subject:message-id;
  bh=WhNW4z1KbDwZ6lqOlwEEaLCj9sa0rs/NIA49wOfsIbY=;
  b=idb7Zkry7Kqv9yxNq2JgmI88VxNZxX4tF7ZFe0Ftb+jQn3xPqnfVdNF9
   0E+yH1yg6ipLGd1cQNyzS1Wb+H+vplGzgCCZa2U3U2Zlz3mgMAIzhHoft
   jJ2DIm5g1Cx58dZ6QdMbn2KLkwtj+7BP0V3ERSR/dwfi2jlDZ8xPRsaeV
   bnee/a3ay8X7f0MWFefTmN2mT5xBv0JEztvnL7aPnAEwFNG/F+mmsAY0P
   mI9cEr8SgNAB4Ql6QE8Jfugg19g/veBtuEog2D8xcY1CP3TpjaUJx/LfC
   Q5m01nUAhb+1LkIkTZxDEMlneu1yZMgsmkPYxTD0qa9EhkXxwFZFCGQFL
   g==;
X-CSE-ConnectionGUID: W5vu4fi3SIKb1gQulxl0cg==
X-CSE-MsgGUID: 2JVc3kapTWSDBJtfProK2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86095993"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="86095993"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 23:53:30 -0700
X-CSE-ConnectionGUID: +C9feZVBTPy6GAr196XM5Q==
X-CSE-MsgGUID: x+qLS8aCQxKrnPrhT4FzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="264749786"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2026 23:53:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqQ4d-000000004cr-1Q3p;
	Sun, 02 Aug 2026 06:53:27 +0000
Date: Sun, 02 Aug 2026 14:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/generic_pt/fmt/../iommu_pt.h:908
 x86_64_map_range() warn: impossible condition '(paddr > 18446744073709551615)
 => (0-u64max > u64max)'
Message-ID: <202608021448.pXUZd42S-lkp@intel.com>
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
CC: Samiullah Khawaja <skhawaja@google.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02dc699f83d04069fdabc996fc22d47cda47a4a9
commit: d6c65b0fd6218bd21ed0be7a8d3218e8f6dc91de iommupt: Avoid rewalking during map
date:   5 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-r072-20260802 (https://download.01.org/0day-ci/archive/20260802/202608021448.pXUZd42S-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d6c65b0fd621 ("iommupt: Avoid rewalking during map")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608021448.pXUZd42S-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:908 x86_64_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:908 vtdss_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'

vim +908 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04  885  
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  886  static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  887  			 phys_addr_t paddr, dma_addr_t len, unsigned int prot,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  888  			 gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  889  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  890  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  891  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  892  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  893  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  894  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  895  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  896  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  897  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  898  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  899  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  900  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  901  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  902  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  903  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  904  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  905  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  906  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  907  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04 @908  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  909  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  910  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  911  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  912  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  913  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  914  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  915  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  916  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  917  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  918  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  919  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  920  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  921  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  922  	/* Calculate target page size and level for the leaves */
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  923  	if (pt_has_system_page_size(common) && len == PAGE_SIZE) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  924  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  925  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  926  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  927  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  928  		map.leaf_level = 0;
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  929  		map.num_leaves = 1;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  930  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  931  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  932  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  933  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  934  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  935  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  936  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  937  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  938  		map.num_leaves = pt_pgsz_count(pgsize_bitmap, range.va,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  939  					       range.last_va, paddr,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27  940  					       map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  941  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  942  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  943  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  944  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  945  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  946  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  947  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  948  
efa03dab7ce4ed Jason Gunthorpe 2025-10-23  949  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  950  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  951  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  952  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  953  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  954  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  955  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  956  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  957  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  958  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  959  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  960  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  961  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  962  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  963  

:::::: The code at line 908 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
