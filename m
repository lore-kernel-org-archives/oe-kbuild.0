Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE42F9C3C
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760133574; cv=none; b=MvHxyR8hCukrsveVbuRERXA5NRTjHyvwemqodEjMLDw35wBhRHkajZwQIAZ6lVEQhQrX585lvqF+UGcQLu35lynZw775R0YRcAgn4Wx3LwNNi8+/iCAxW1cbpyMYPAschZjTAfNSmYaCZRlGBKppFjtScpDRVmgYn9JVyCcAjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760133574; c=relaxed/simple;
	bh=8lmVyDeMgSOkzJcRqNLnmv8Zd8njSn5HWH1gA/w2fNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSYq32E0Q8TGomrTia1IHGLtMudZNsAkZy1FLR8tUE4VW4cy2psYfSaGqgOcoeLyLN2wrjcZdk2Xw3FV2TAPNDddNebNsvosXWCyCC7hxepQTYX/XNX7/ApLRbCvcwGb+5NqG6jBd8JKtTqhcZxxeAmzwEBsa+oibPYq11zB5kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN9UA7gX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN9UA7gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760133572; x=1791669572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lmVyDeMgSOkzJcRqNLnmv8Zd8njSn5HWH1gA/w2fNg=;
  b=FN9UA7gXCZo/U6FVM0rly8/0zTlI8m5tDOQHA44QCr7ZfBJLNDW5PL+0
   jkIZtQo5uhM2nabRriGQXtfiu99Sbb3QAeNEsWI1m9f8LFJy/XxrT6De4
   gYR1TnOQrbNxWpiD/B9Y/yn5c0g/tw5/5TeHE+ppIlPxRIEQ/FQ+erzXK
   Ij06WPNSNpc5Qwl3r3yWRiMAdHE3tBDlhy5Nx+1aUkHsVCo1id9k51+q8
   xYOAZckws6BK1xUmoBeNUwjvaxIBctsm/7WBg20MWq0cH2v3kldE+1T6B
   2N35lchvM3XtJwrMbSPxuSgdoKvZRbepOAomn5KdgMdznSyDQ6F0OtaV3
   w==;
X-CSE-ConnectionGUID: 3uHBD8zMRWWaHU9ORKEFgQ==
X-CSE-MsgGUID: eX85+nTIRjyMq0YD2vnoEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62514012"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62514012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 14:59:31 -0700
X-CSE-ConnectionGUID: SeegaXpwT2ycNiMERxGZlw==
X-CSE-MsgGUID: PqQIeSk/TaCeOx54AJAYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="186200197"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2025 14:59:30 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7L95-0003DJ-2A;
	Fri, 10 Oct 2025 21:59:27 +0000
Date: Sat, 11 Oct 2025 05:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_all 41/59]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 armv8_4k_cut_mapping() warn:
 sizeof(NUMBER)?
Message-ID: <202510110555.T4CZqm10-lkp@intel.com>
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
head:   9c69ad5f7c8c4c920b421601258f0c8b120dd80c
commit: e62242285cdb70842837a9da559dceced3130664 [41/59] iommupt: Add cut_mapping op
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110555.T4CZqm10-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110555.T4CZqm10-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 armv8_4k_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 riscv_64_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 dart_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 armv8_16k_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 armv8_64k_cut_mapping() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:799 amdv1_cut_mapping() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:226 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_armv8_4k_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 armv8_4k_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1452 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../pt_defs.h:226 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_riscv_64_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 riscv_64_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1452 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../pt_defs.h:226 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_dart_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 dart_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1452 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../pt_defs.h:226 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_armv8_16k_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 armv8_16k_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1452 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../pt_defs.h:226 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_armv8_64k_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 armv8_64k_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1452 pt_init_common() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_amdv1_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 amdv1_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1090 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1039 increase_top() warn: missing unwind goto?

vim +799 drivers/iommu/generic_pt/fmt/../iommu_pt.h

e62242285cdb70 Jason Gunthorpe 2025-04-03  780  
e62242285cdb70 Jason Gunthorpe 2025-04-03  781  /*
e62242285cdb70 Jason Gunthorpe 2025-04-03  782   * FIXME this is currently incompatible with active dirty tracking as we
e62242285cdb70 Jason Gunthorpe 2025-04-03  783   * don't take care to capture or propagate the dirty bits during the mutation.
e62242285cdb70 Jason Gunthorpe 2025-04-03  784   */
e62242285cdb70 Jason Gunthorpe 2025-04-03  785  static int NS(cut_mapping)(struct pt_iommu *iommu_table, dma_addr_t cut_iova,
e62242285cdb70 Jason Gunthorpe 2025-04-03  786  			   gfp_t gfp)
e62242285cdb70 Jason Gunthorpe 2025-04-03  787  {
e62242285cdb70 Jason Gunthorpe 2025-04-03  788  	struct pt_common *common = common_from_iommu(iommu_table);
e62242285cdb70 Jason Gunthorpe 2025-04-03  789  	struct pt_write_attrs cut_attrs = {
e62242285cdb70 Jason Gunthorpe 2025-04-03  790  		.gfp = gfp,
e62242285cdb70 Jason Gunthorpe 2025-04-03  791  	};
e62242285cdb70 Jason Gunthorpe 2025-04-03  792  	struct pt_range range;
e62242285cdb70 Jason Gunthorpe 2025-04-03  793  	int ret;
e62242285cdb70 Jason Gunthorpe 2025-04-03  794  
e62242285cdb70 Jason Gunthorpe 2025-04-03  795  	ret = pt_iommu_set_prot(common, &cut_attrs, IOMMU_READ);
e62242285cdb70 Jason Gunthorpe 2025-04-03  796  	if (ret)
e62242285cdb70 Jason Gunthorpe 2025-04-03  797  		return ret;
e62242285cdb70 Jason Gunthorpe 2025-04-03  798  
e62242285cdb70 Jason Gunthorpe 2025-04-03 @799  	ret = make_range(common_from_iommu(iommu_table), &range, cut_iova, 1);
e62242285cdb70 Jason Gunthorpe 2025-04-03  800  	if (ret)
e62242285cdb70 Jason Gunthorpe 2025-04-03  801  		return ret;
e62242285cdb70 Jason Gunthorpe 2025-04-03  802  
e62242285cdb70 Jason Gunthorpe 2025-04-03  803  	return pt_walk_range(&range, __cut_mapping, &cut_attrs);
e62242285cdb70 Jason Gunthorpe 2025-04-03  804  }
e62242285cdb70 Jason Gunthorpe 2025-04-03  805  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
