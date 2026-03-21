Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BC283FDD
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774109816; cv=none; b=aTzMq2i4xyRjQQY1ungC5aTA/Gq45PkoXku+/6qlntTn9uiS47O57UAd8jN6SlNocqmTXBR6bWBvL3DkevsR5ZZFzovW0dqsm3V4Nc/r/yfVQ4e+rpb8p2SaPVypjyAO8cheFhgM25tSloMRCuFbmhovDUqXoCrtsoXdyXj2stc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774109816; c=relaxed/simple;
	bh=R0heqGQ29G4U0J7yUzNmrMJChbzMcWpt6PhoJrd7CcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SmecI87IXQCULzsJFrvi4yVNIaDnuczQvrwMPev7PoRHB3pkDetTx7jSQkLheCADwmlFhaiMpfMUNzflbwPHOMdutHa3ttOZq0V/W5xJKRYvuqy6BptQ8cQY8F7tJeYrnjaO2wVCaHZdNstFMGPowx5hIJX0K1cQ61tfONqwPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmbRmqhp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmbRmqhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774109815; x=1805645815;
  h=date:from:to:cc:subject:message-id;
  bh=R0heqGQ29G4U0J7yUzNmrMJChbzMcWpt6PhoJrd7CcY=;
  b=EmbRmqhpf0tSGATc7FgpqNdabJCUQg5auaiq36W3yUcG26Fq+cfqsb6v
   RVMj96WAM/wVnGf9oH/jMM23fYbylBhiW1YaRkVp6Om1vqPIN1SANU98M
   WZ6/QBNFkiRa3Z77tudneMjDxMUULoSZ1RAdSJc6+u3SMUhNZjBvn7M86
   ClY9IxjsmPpSTeU0+HIaF4173nW/dC7fety1NWHAvULl8eRY1X1MqqxdO
   bjMek2XeYsnPtbkEkBZyWHGa36yeFkQe0/qqudGdtsSf90N/jVPsF9+Vo
   C60cjEWRzRDzQvK8j4ouy2gyzqMPOw20vgWE/EV+4euK+45je1c2FvkU9
   g==;
X-CSE-ConnectionGUID: j+EeBaBsQqGsF2C9yo6Hyg==
X-CSE-MsgGUID: Nvd94q3GR1mb8tmPPa97zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="74352132"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="74352132"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 09:16:54 -0700
X-CSE-ConnectionGUID: jlriT2BcTpqdrqFIKRImJg==
X-CSE-MsgGUID: qa/4C3AWTiSrAw+k9X92Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="227694636"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2026 09:16:53 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3z0M-0000000010J-0cOb;
	Sat, 21 Mar 2026 16:16:50 +0000
Date: Sun, 22 Mar 2026 00:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5929/7971]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:908 riscv_64_map_range() warn:
 impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202603220050.mzJIGe86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Samiullah Khawaja <skhawaja@google.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: d6c65b0fd6218bd21ed0be7a8d3218e8f6dc91de [5929/7971] iommupt: Avoid rewalking during map
:::::: branch date: 25 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20260321 (https://download.01.org/0day-ci/archive/20260322/202603220050.mzJIGe86-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603220050.mzJIGe86-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:908 riscv_64_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

vim +908 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523a Jason Gunthorpe 2025-11-04  885  
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  886  static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  887  			 phys_addr_t paddr, dma_addr_t len, unsigned int prot,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  888  			 gfp_t gfp, size_t *mapped)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  889  {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  890  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  891  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  892  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  893  	struct pt_iommu_map_args map = {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  894  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  895  		.oa = paddr,
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  896  	};
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  897  	bool single_page = false;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  898  	struct pt_range range;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  899  	int ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  900  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  901  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  902  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  903  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  904  		return -EINVAL;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  905  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  906  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  907  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523a Jason Gunthorpe 2025-11-04 @908  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  909  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  910  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  911  		return -ERANGE;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  912  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  913  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  914  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  915  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  916  	map.attrs.gfp = gfp;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  917  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  918  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  919  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  920  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  921  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  922  	/* Calculate target page size and level for the leaves */
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  923  	if (pt_has_system_page_size(common) && len == PAGE_SIZE) {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  924  		PT_WARN_ON(!(pgsize_bitmap & PAGE_SIZE));
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  925  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  926  			return -ENXIO;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  927  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  928  		map.leaf_level = 0;
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  929  		map.num_leaves = 1;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  930  		single_page = true;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  931  	} else {
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  932  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  933  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  934  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  935  			return -ENXIO;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  936  		map.leaf_level =
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  937  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  938  		map.num_leaves = pt_pgsz_count(pgsize_bitmap, range.va,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  939  					       range.last_va, paddr,
d6c65b0fd6218bd Jason Gunthorpe 2026-02-27  940  					       map.leaf_pgsize_lg2);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  941  	}
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  942  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  943  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  944  	if (ret)
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  945  		return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  946  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  947  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  948  
efa03dab7ce4ed7 Jason Gunthorpe 2025-10-23  949  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  950  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  951  	/*
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  952  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  953  	 * cache that may refer to the freed levels.
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  954  	 */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  955  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  956  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  957  
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  958  	/* Bytes successfully mapped */
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  959  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  960  	*mapped += map.oa - paddr;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  961  	return ret;
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  962  }
dcd6a011a8d523a Jason Gunthorpe 2025-11-04  963  

:::::: The code at line 908 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
