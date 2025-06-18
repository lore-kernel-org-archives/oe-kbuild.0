Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676E2FEE36
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265780; cv=none; b=Mz1wCbl5bon+bHM33TOuaYWZOE2N+AzNAEaI/Muye18oSLIAA+2llErpKf51+K8C+azmtoY5GbDz7AWTqoUb2KSoBqSyFTrhBBLeB20S/Tv4T+mj5omPx6gEmPf5nYN1qROQ+XA1z14glnIhUwbh9HI70G6cSSvAzNIspVgUJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265780; c=relaxed/simple;
	bh=/VUdNGC4KAF9wwnGLo3jNvnPK2tjtmWc7D0Tk7WCnpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sUBFpxVEOjIlZlnXBJ45apc25onHNgFIrEWwMVopWzeIXm2vicvgAELrwzG2c3DY6HhTcsN5OQ9GHEUurDF5fNPCHbjbDnAy1AO3MPAMXfEMVssylQrom2HZS9qlxPJeAYLP2S7bXV4feya5R0v675Mtka+85afef6vpU8gfj/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXnoGu02; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXnoGu02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750265779; x=1781801779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VUdNGC4KAF9wwnGLo3jNvnPK2tjtmWc7D0Tk7WCnpE=;
  b=BXnoGu020Nw5dZCgV6/etJZjUBgDPRmT9IU3NwvqhST9DtDO0GZn6Bn6
   UoAyX0L+Y6ndUMqafWvzI0kX260NMUnhviJ49P0PWiftOkgeBJgm8Bbr5
   3xdvNqjTIsSs1XDSETFhGcLer09Nc2VdrPmKPx/HaEQ07OprmruiK9dH4
   Djniz0OfDnQDGXOPC8I7P6K7ffCMEazufT7xoyu3NZpIOgsbkGohCYjQd
   xYmF3AguX7ZOu5zuXfG+UcAWy2yFrGcXDLFjyfjFX3Xrz5fOcp7oR26tR
   MURSNfM+5i9L2U8L05MfWo5Jw7u9DhOlpHsoqQLoGO6knlxQRZto0FBh8
   g==;
X-CSE-ConnectionGUID: qEZEuJSzSbOpWeQWbedOjw==
X-CSE-MsgGUID: nWsnC+o8SWmF0aGd0gzzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52417929"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52417929"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 09:54:08 -0700
X-CSE-ConnectionGUID: e7aYka/yQle4isp5LdgdXg==
X-CSE-MsgGUID: DaRjYFnHRt+gedxts9k2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="153811511"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 09:54:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRw33-000Jzs-1a;
	Wed, 18 Jun 2025 16:54:05 +0000
Date: Thu, 19 Jun 2025 00:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_all 43/62]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:729 vtdss_cut_mapping() warn:
 sizeof(NUMBER)?
Message-ID: <202506190033.eaf2Apel-lkp@intel.com>
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

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   95229c50e3ce2b6ecb8126b5f765996c1b73f4c1
commit: dfb9a34e74ddeb4a364d4a79f9e111c70ad83152 [43/62] iommupt: Add cut_mapping op
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190033.eaf2Apel-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506190033.eaf2Apel-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:729 vtdss_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:729 x86_64_cut_mapping() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:206 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_vtdss_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:321 vtdss_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1012 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1012 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:961 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1100 pt_iommu_vtdss_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1372 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../pt_defs.h:206 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_x86_64_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:321 x86_64_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1012 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1012 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:961 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1100 pt_iommu_x86_64_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1372 pt_init_common() warn: bitwise AND condition is false here

vim +729 drivers/iommu/generic_pt/fmt/../iommu_pt.h

dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  710  
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  711  /*
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  712   * FIXME this is currently incompatible with active dirty tracking as we
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  713   * don't take care to capture or propagate the dirty bits during the mutation.
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  714   */
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  715  static int NS(cut_mapping)(struct pt_iommu *iommu_table, dma_addr_t cut_iova,
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  716  			   gfp_t gfp)
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  717  {
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  718  	struct pt_common *common = common_from_iommu(iommu_table);
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  719  	struct pt_write_attrs cut_attrs = {
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  720  		.gfp = gfp,
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  721  	};
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  722  	struct pt_range range;
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  723  	int ret;
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  724  
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  725  	ret = pt_iommu_set_prot(common, &cut_attrs, IOMMU_READ);
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  726  	if (ret)
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  727  		return ret;
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  728  
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03 @729  	ret = make_range(common_from_iommu(iommu_table), &range, cut_iova, 1);
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  730  	if (ret)
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  731  		return ret;
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  732  
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  733  	return pt_walk_range(&range, __cut_mapping, &cut_attrs);
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  734  }
dfb9a34e74ddeb Jason Gunthorpe 2025-04-03  735  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
