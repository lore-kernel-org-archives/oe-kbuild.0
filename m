Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659024;
	b=kGcLe4NNGKGdlghgmgpJoy8qS8sr1TpQPFMTx4SxB+2pmh4LQKz19xVq3a1F8J6zt7Vj
	 cB5NQXORQYgG1XS7TcjlwA/t/HBdbqKD6JYP/YaQE3KPGsKcftHDFy8ATAghwm5ILhkpo
	 yXIPy077jogTaPLzHTkQErhzVQIZpnzMO/qNkTKNznXjRQPR63PDmVugGy30a5LSieAKu
	 4i0GcX4FGVsnMwe1uAM5trUl/fY4Z3NjS1Xr0vP7EYSWoRs1YsHx8FFwMh47iDj9ADRzl
	 2ZNa+BLBGxpFlcjZLm01M8tTsMN5Q3LOyrnMDdEAYNgOI9ILmMgtpoZBM//FH3VZykA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659024;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QgFD/MnWd0QwlH7Z9T7oE0mYQzIyUtVGxlIeGQRhTIk=;
	b=iftaECSAffPJqmB1Uj8clLqekOjHeue9f8utv9eR9iBPG8dXR/uPq2f/FEaQYgSeg8x8
	 DqF30E4/9GsMC6jcLFf7hXrQtxRByk0bntS0/QEENnp/BbIjEqxBHA7fflzf57aQYOzL8
	 qr43P++v/rYSaqX6yeHPnoOEH9ELmy+7efdnTVw4h/55NzLdVf6oYzoNpNx7FQ08UnZ03
	 U26TNjqOR7dh5OlMt1NTLAyTDw0to6KF1RqCqARkNzZMeCDhO6M2T4QqzFQVkUKcgXtIP
	 3XD20NomeIbfknZPPEBk69h/aXpZAu/xaCJFEScDbJQUJQLwBy4J8HozX2v4USRJwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Byv74YHA;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFA1606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 02:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFA1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Byv74YHA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795659023; x=1827195023;
  h=date:from:to:cc:subject:message-id;
  bh=95rnh94FEcppo1kTmI2eP3x7wgjzvUVhP8wsRATg4FQ=;
  b=Byv74YHAGT+f09wNDcz0Mb8G17vOXza2yQOQQmZHxsDxiH/00aAEg7vt
   SqTy3ohozhkArzTgXArEhBXISb/tnQwdd5WsEZ6P+ELasxTqPE2DYN5Lm
   v52OExyHiK57BGyIa3a+0D86l7wxvAGsEC3qea+Ye9gwZL9sBSFrZrIg5
   7G99zcfdftOdaNbbaHCkur+NsZ+cf6kxb9ob6+pNKHSB/EEXgXK9DEqLi
   tGapR5glLSQqaTq8l4oE0nZqc/BDvpXs2webRIbUTM4Mvf0T3zTYDas1q
   iEXQS6FBactY651uwd/pFBnqkFYHAYJ47rPlFiNimdK+5GbaJR2CO83I+
   A==;
X-CSE-ConnectionGUID: YLceNVcnSkWKfyNBVnOseg==
X-CSE-MsgGUID: wtaNrqpCRN2Y0UgVHJjIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4527280"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4527280"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 18:10:22 -0800
X-CSE-ConnectionGUID: tKEADMHyRCmLxsShqN0F5A==
X-CSE-MsgGUID: MM78mgIbSo28wRmU22qr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11929156"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 18:10:20 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWOwD-000000000CB-2zS9;
	Thu, 26 Nov 2026 02:10:17 +0000
Date: Thu, 26 Nov 2026 03:09:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/generic_pt/fmt/../iommu_pt.h:952
 bcm2712_map_range() warn: impossible condition '(paddr >
 18446744073709551615) => (0-u64max > u64max)'
Message-ID: <20261126030015.FFVuhuLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Drake <dan@reactivated.net>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ebb7a8dc1e74c705daffe11c2faf38ec2628f838
commit: 3e69ac737ed4ae248c49f8a70faa0a96eeecd59a iommu/generic_pt: Add Broadcom BCM2712 page table format
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126030015.FFVuhuLQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3e69ac737ed4 ("iommu/generic_pt: Add Broadcom BCM2712 page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126030015.FFVuhuLQ-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 bcm2712_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'

vim +952 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dcd6a011a8d523 Jason Gunthorpe 2025-11-04   929  
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   930  static int NS(map_range)(struct pt_iommu *iommu_table, dma_addr_t iova,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   931  			 phys_addr_t paddr, dma_addr_t len, unsigned int prot,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   932  			 gfp_t gfp, size_t *mapped)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   933  {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   934  	pt_vaddr_t pgsize_bitmap = iommu_table->domain.pgsize_bitmap;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   935  	struct pt_common *common = common_from_iommu(iommu_table);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   936  	struct iommu_iotlb_gather iotlb_gather;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   937  	struct pt_iommu_map_args map = {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   938  		.iotlb_gather = &iotlb_gather,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   939  		.oa = paddr,
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   940  	};
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   941  	bool single_page = false;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   942  	struct pt_range range;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   943  	int ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   944  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   945  	iommu_iotlb_gather_init(&iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   946  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   947  	if (WARN_ON(!(prot & (IOMMU_READ | IOMMU_WRITE))))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   948  		return -EINVAL;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   949  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   950  	/* Check the paddr doesn't exceed what the table can store */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   951  	if ((sizeof(pt_oaddr_t) < sizeof(paddr) &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  @952  	     (pt_vaddr_t)paddr > PT_VADDR_MAX) ||
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   953  	    (common->max_oasz_lg2 != PT_VADDR_MAX_LG2 &&
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   954  	     oalog2_div(paddr, common->max_oasz_lg2)))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   955  		return -ERANGE;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   956  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   957  	ret = pt_iommu_set_prot(common, &map.attrs, prot);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   958  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   959  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   960  	map.attrs.gfp = gfp;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   961  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   962  	ret = make_range_no_check(common, &range, iova, len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   963  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   964  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   965  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   966  	/* Calculate target page size and level for the leaves */
8ef3f77c440005 Jason Gunthorpe 2026-05-12   967  	if (pt_has_system_page_size(common) && len == PAGE_SIZE &&
8ef3f77c440005 Jason Gunthorpe 2026-05-12   968  		likely(pgsize_bitmap & PAGE_SIZE)) {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   969  		if (log2_mod(iova | paddr, PAGE_SHIFT))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   970  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   971  		map.leaf_pgsize_lg2 = PAGE_SHIFT;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   972  		map.leaf_level = 0;
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   973  		map.num_leaves = 1;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   974  		single_page = true;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   975  	} else {
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   976  		map.leaf_pgsize_lg2 = pt_compute_best_pgsize(
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   977  			pgsize_bitmap, range.va, range.last_va, paddr);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   978  		if (!map.leaf_pgsize_lg2)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   979  			return -ENXIO;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   980  		map.leaf_level =
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   981  			pt_pgsz_lg2_to_level(common, map.leaf_pgsize_lg2);
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   982  		map.num_leaves = pt_pgsz_count(pgsize_bitmap, range.va,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   983  					       range.last_va, paddr,
d6c65b0fd6218b Jason Gunthorpe 2026-02-27   984  					       map.leaf_pgsize_lg2);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   985  	}
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   986  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   987  	ret = check_map_range(iommu_table, &range, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   988  	if (ret)
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   989  		return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   990  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   991  	PT_WARN_ON(map.leaf_level > range.top_level);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   992  
efa03dab7ce4ed Jason Gunthorpe 2025-10-23   993  	ret = do_map(&range, common, single_page, &map);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   994  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   995  	/*
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   996  	 * Table levels were freed and replaced with large items, flush any walk
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   997  	 * cache that may refer to the freed levels.
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   998  	 */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04   999  	if (!iommu_pages_list_empty(&iotlb_gather.freelist))
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1000  		iommu_iotlb_sync(&iommu_table->domain, &iotlb_gather);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1001  
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1002  	/* Bytes successfully mapped */
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1003  	PT_WARN_ON(!ret && map.oa - paddr != len);
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1004  	*mapped += map.oa - paddr;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1005  	return ret;
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1006  }
dcd6a011a8d523 Jason Gunthorpe 2025-11-04  1007  

:::::: The code at line 952 was first introduced by commit
:::::: dcd6a011a8d523a114af2360a8753de5bd60c139 iommupt: Add map_pages op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <joerg.roedel@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
