Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F4380FFB
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 03:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516480; cv=none; b=kMrAR4e1gYOE0yy0naSn30QmlK4S/8Ua6A6/AD3AQoZuUfVsiSmJ23EUybm9TT6QXr1ZDGJJi8NX/Zzmru8iCNMiyBqiqUs2FY2psQWRtmu5MRQUIKaZw/wcPvy58pXkwCBtZGEj4gvtT8X3rs1PGts9OpIz9HY8lTV84epusno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516480; c=relaxed/simple;
	bh=XvYtzQwgjxyYl4+1hnr76PIc95dqgxsSfIlfhKZrbSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sUF4012KX8MJgHWyxxR4ytPRv2HIImUsQ19f8eX0ZI2elrBzjD4wexdSGizGHXcWAgMDfmzOsYCYllM3clIMbTki3NAgyGmQcKwZTz+ky68kvFj96qNmddIbG/1Bg5VyTxlvPHuKdn/sbcdk78++r1lDd1ne017RI2gKH4oG7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URnkvyWH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URnkvyWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791516464; x=1823052464;
  h=date:from:to:cc:subject:message-id;
  bh=XvYtzQwgjxyYl4+1hnr76PIc95dqgxsSfIlfhKZrbSY=;
  b=URnkvyWHDNDqL+P8dWn5hThBdHc3Y3L/jBhsgufcAELi28lwb/LdDSh5
   3uF4XXm3qT4pNYK6dNic+2n4xV9pYFg9FUaCe6ay6bZtlVoFDwGFA3N5j
   BtL0AYiAaU0DojmqIfx0V+7fw0HxIXXToK8JXD7fNbO6ivSAJ4rrC8mbF
   OtY/Eg8AYw/kpqQCAZ/0jB82wvVrbpEDe2EG4l8xD46HnGz3S0vFJfJBT
   QMNTUFiLKMsebK5LLSKfckAW6cTCoDRLxTJ3HQvsf8FAKGUX+qqYbG/no
   LPrNa1kFCZia+Q5mb7S2jBk71B5kANgHEARQamT44Sp9WGGtQQNXwoAJ8
   w==;
X-CSE-ConnectionGUID: rTLL5E4XT6CD3JEbbs6Rkw==
X-CSE-MsgGUID: djQ2HoEYSxWiyckG6Xh0gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="211394"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="211394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 20:27:43 -0700
X-CSE-ConnectionGUID: t3qUXe50R7+E/cdmCFiRlA==
X-CSE-MsgGUID: o3HzK8RhTOuFj0sI4Ojccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="199895"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Oct 2026 20:27:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF1Gl-000000006d7-2Gvd;
	Fri, 09 Oct 2026 03:27:39 +0000
Date: Fri, 09 Oct 2026 05:27:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9475/15343]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 bcm2712_map_range() warn:
 impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'
Message-ID: <202610090504.nqAYpkKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Drake <dan@reactivated.net>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 3e69ac737ed4ae248c49f8a70faa0a96eeecd59a [9475/15343] iommu/generic_pt: Add Broadcom BCM2712 page table format
:::::: branch date: 17 hours ago
:::::: commit date: 11 days ago
config: openrisc-randconfig-r2200-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090504.nqAYpkKA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610090504.nqAYpkKA-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:952 bcm2712_map_range() warn: impossible condition '(paddr > 18446744073709551615) => (0-u32max > u64max)'

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
