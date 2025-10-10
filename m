Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1222F7ABF
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760109055; cv=none; b=sqI6V0eDpQtx71vWD81KDtZUzjXlHx0QinimARvbu40Ql5c4ckBiq49D5UJSd1MFHpPmzFNB3/WruXgVtmWd8QqXaM4s+rQnKJxQLQoeaxdZMsNFD++JQz9Q8v3v0hv9RV6C7u1rlTc0FkO3Q6A+7z5XdUjtQI/mrnnk3GbmER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760109055; c=relaxed/simple;
	bh=THHJae1J3tUISwLnLlY4Gl+xaeByfn+JqlrwHnhuwP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOw+kgeMfZhqBf7bkyGHkDoUhs8ONcumg1LXzTy05T1AU6X/kzWO42BXkcf5pkdKUvueVFpWweHal6NBDu1ObNSa2mDgrFXSTxaB4unTEQKGJtbNK5VQxkxHjJU1lOkehT2X45IhD7wRjtAVsmwyI2Q34SrzP1TRQzT+7qP561s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEbuI/nQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEbuI/nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760109053; x=1791645053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THHJae1J3tUISwLnLlY4Gl+xaeByfn+JqlrwHnhuwP4=;
  b=fEbuI/nQmlu8maexyiA8qlSWZzWc1MtMQ9K0hHFdGOJwTlJWSOwRygZR
   x/cfJdoc4qSuP2m9CIuSDwIMRGNfXFKsV9mckchNA7mDp4+sKrlWgkpqd
   zR1asW4m8/+mcGO+2vvotsogRDTJUJSwTIEn29CV9qogMjSWxd/z72hiX
   McZS5vXRmy6tH8z9UmZgr2JLfe/OjsXAB9HSN9TLo3Rci8eX8N5NiyNOQ
   JMMSH13BDpgi0x9f78fCIKfoEB8KT2VjQ0m7aPs0bjT0a+tIINg/GFFIp
   k/dzDIM/5w+npaBHhdtVtDdxzScANjG+mG6nw8CQ/VXvkxLiDsJmoE1kq
   w==;
X-CSE-ConnectionGUID: kdHn83T2SH2YQfnd2nqLbQ==
X-CSE-MsgGUID: tW4T0tNsRCOI7zFM26dlvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61538617"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="61538617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 08:10:52 -0700
X-CSE-ConnectionGUID: ALNaG5WfT7yxjE69NxZToQ==
X-CSE-MsgGUID: UxqflUEaQui+kjX9C/yg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="181425619"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2025 08:10:52 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Eld-0002t5-22;
	Fri, 10 Oct 2025 15:10:49 +0000
Date: Fri, 10 Oct 2025 23:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_vtd 6/34]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:113 pt_iommu_amdv1_iova_to_phys()
 warn: sizeof(NUMBER)?
Message-ID: <202510102327.6Dwls1x8-lkp@intel.com>
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
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   385b726d52995c3f1842ab4218ab299ef44c2360
commit: fde43dfc31dc9bbfb4524e00e55f4a9f6d6012b4 [6/34] iommupt: Add iova_to_phys op
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251010/202510102327.6Dwls1x8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510102327.6Dwls1x8-lkp@intel.com/

smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:113 pt_iommu_amdv1_iova_to_phys() warn: sizeof(NUMBER)?

vim +113 drivers/iommu/generic_pt/fmt/../iommu_pt.h

fde43dfc31dc9b Jason Gunthorpe 2024-06-28   91  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   92  /**
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   93   * iova_to_phys() - Return the output address for the given IOVA
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   94   * @iommu_table: Table to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   95   * @iova: IO virtual address to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   96   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   97   * Determine the output address from the given IOVA. @iova may have any
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   98   * alignment, the returned physical will be adjusted with any sub page offset.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28   99   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  100   * Context: The caller must hold a read range lock that includes @iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  101   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  102   * Return: 0 if there is no translation for the given iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  103   */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  104  phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  105  				    dma_addr_t iova)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  106  {
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  107  	struct pt_iommu *iommu_table =
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  108  		container_of(domain, struct pt_iommu, domain);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  109  	struct pt_range range;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  110  	pt_oaddr_t res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  111  	int ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  112  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28 @113  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  114  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  115  		return ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  116  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  117  	ret = pt_walk_range(&range, __iova_to_phys, &res);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  118  	/* PHYS_ADDR_MAX would be a better error code */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  119  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  120  		return 0;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  121  	return res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  122  }
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  123  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(iova_to_phys), "GENERIC_PT_IOMMU");
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
