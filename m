Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634827;
	b=HX5YlINduFAnAMJXI+6OGbXUZSwnhIJ59aSt4rMA8ckktI3eHpn0NBPSyugvZzkyDnfn
	 unXxB2BtFtprP5tqkFrHd2Nji2z9NHcrQvoSB0aQObdvYQdrI7wQcLuMwYYL4KeLMbxuC
	 2moQsftDEdgUag+r7Yj3Yc9lOcKHqlIB1if5UmU9IGt30iqJt4lOAbXf4qIgWe0YssRw1
	 Ar0g1a0iFHYPZ07Ldg7wH9RC9F25ggNK7Pe+oSZTu3OcKiCrMojl43uRO6jnwKJBOiik+
	 1NPOfYYrVztGNg12f+sLPglQeUHNNPcqlvqgkokL25XK9HK89lcgIt1wZHzn6vSDD5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k5IJKpEfxB1mACRY3HujQ32KFL1oCmxfu1VjmUp7OTQ=;
	b=vlq3ycQcAGVilCejC2sewaz5PELoXK/zbWsQD1kkoRi88N7fofdkyorjihZMpov6ZgqW
	 TLqflRTg1zR3Ccy2D+HhNORAQdXL046ShRg+ZJpp2dcPv4nk5p3gSy4Vd7nDvr4BSGIeZ
	 XTDmueU2DDRcQUFC3tgxPukdKVxDZCEV6t3V7C1uSpacm9Jf/+i9YcpRFh+SjaRqps5YD
	 NJFEK4y17lYartGBPJ8sWxmXt+wCisdGkcRmXNlb64ACzy0w7bX+n6SAfPcn8KvMTTwMB
	 563V9Ty2YjSGD8LOp7JdjOa8RkOkrIT3Q2tJc/uzeUO21gx9pien8j7PrgzNTEMhgMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MzT/rIc7";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95170606A329
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 05:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95170606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MzT/rIc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794634826; x=1826170826;
  h=date:from:to:cc:subject:message-id;
  bh=Bi6hsuEBK6uayEKHfgj+Cneisz2qwNk7/iUA6nP/64g=;
  b=MzT/rIc7dCmOcKazaB+rijbJzKgZmMM3sBNYyZu6yi36KIbjo19G1rB6
   /6/fn6IponoOSNotlXQCVjnK0oTeEJaKvahGGc39jUhJTFxq1wMl4xn9e
   GULT4Nsnh+g3vc+PnwlTL8H1rARrMLt1PPwKkI0fba7q+YaYg/7t0R1KB
   o2LU6IDVTuDmG6PhlVeKsfkb8ZsDUIZ2AI7FID1+ElYRNfXJ69S1bfuB0
   r1mk/W02EEcnavJ/aWgTXRU9sL/5PKDtd7/gJRpQoZhN4tgCouq2gPZY4
   LzHa0EvZ0u4ziZWUnn4g8AeudqJ3Ka3L6ei2sQL/D4x30d4RZwcCpYwXm
   w==;
X-CSE-ConnectionGUID: AWOAUJL6QNeAqVXIIhOYIw==
X-CSE-MsgGUID: v/q6zwqAQbGcgp61BgmzUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3459369"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3459369"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 21:40:26 -0800
X-CSE-ConnectionGUID: VMpTh45nREu0ZuZ0S3RH8Q==
X-CSE-MsgGUID: ji9KEln/Qqeo2lTa0G+8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10872585"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 21:40:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS6Ux-000000001Ut-0Hw4;
	Sat, 14 Nov 2026 05:40:23 +0000
Date: Sat, 14 Nov 2026 06:39:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/generic_pt/fmt/../iommu_pt.h:952
 x86_64_map_range() warn: impossible condition '(paddr > 18446744073709551615)
 => (0-u64max > u64max)'
Message-ID: <202611140642.RsJ33isq-lkp@intel.com>
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
TO: Jacob Pan <jacob.pan@linux.microsoft.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Pranjal Shrivastava <praan@google.com>
CC: Yi Liu <yi.l.liu@intel.com>
CC: Alex Williamson <alex@shazbot.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97d73c8251226cf27cc6656b4c542869bb8c69fa
commit: e8efdf02d3a97466650d94a6a0574af4db65d3ad vfio: Enable cdev noiommu mode under iommufd
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140642.RsJ33isq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e8efdf02d3a9 ("vfio: Enable cdev noiommu mode under iommufd")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611140642.RsJ33isq-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 x86_64_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 vtdss_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 amdv1_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 riscv_64_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'

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
