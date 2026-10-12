Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5235028D
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 04:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780558; cv=none; b=WleAICJSmUapEX4jGgAw8af0ctuMpjvjwlE58imkj20CN63BrZZP7qIX4oM7oUdtCyEwDG5MAT+gw42d2+Erwc2YMHUsM5jXSWcM7llgAzoX8bMtV3FvlqCgXziO4wjjnsJNXFihLRBWTIv8z9GjP+J+1+S/+0nkGIWSjeXmzLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780558; c=relaxed/simple;
	bh=vI/6lsKbdXMdY/7h7Nao72Vgbmr0GEiXed6zjgWfboc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6lbG4FrTJZmVKZ0j0vnz6hDtRHB1q0D4SKnw3sv2MytIHjhHzIu3+8So8wVH4O0ZCGeUnpdw9rCrhzeL6BerwR/sW7hf1Mq1+wzfD6S6rjX0jKaE0/KblCyakxu9pXZLA2tDDweObXFuQhZ/7tRPsMHAwkBojK5S50VhTnVTD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL2GXlz4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL2GXlz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791780556; x=1823316556;
  h=date:from:to:cc:subject:message-id;
  bh=vI/6lsKbdXMdY/7h7Nao72Vgbmr0GEiXed6zjgWfboc=;
  b=iL2GXlz436vNc/adCVHPZG6Pc80ZCmTUDMJWduGz1UThMFjnYHKPaFUE
   n2Wrr7T+LLkjm/nVbeKpS6EpyzCLpDocNwrS9ZxG+xU2oLOlLErPFP32F
   pkazgiHADCRyvpvHQijiQ/1P3VNp4QJoP7SqdNmy7cI2+ggCcWFTcQotC
   DLDolENP8JFUne+9I6ajuiKneR2j5LUJS24jOMjw0S3TOyF1/lm1E071f
   AAHMiLGmcQSpvXMmzoBArSRs3KRa+yyc3d7X4TF2uIjkdR9Zj85hwZAye
   Caj/6JFwR3gJkdk5xj2Pt79dQ174OVnYLRNFUFR6QSNh9LMym2ST8/Vdm
   w==;
X-CSE-ConnectionGUID: aDSj3RSXRUiyWUOjZj/XkA==
X-CSE-MsgGUID: FqaHbfKHTY+zKPf7dRia1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="496748"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="496748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 21:49:16 -0700
X-CSE-ConnectionGUID: 7z2TPpGtSy2cC68HLVPJCg==
X-CSE-MsgGUID: yxbWP89GQ5Gs8kQoWnLb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1258689"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2026 21:49:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG7yK-000000009vT-0HeM;
	Mon, 12 Oct 2026 04:49:12 +0000
Date: Mon, 12 Oct 2026 06:49:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/tegra-smmu.c:430 tegra_smmu_as_prepare() warn:
 missing error code 'err'
Message-ID: <202610120635.FB2IvmZh-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: Joerg Roedel <joerg.roedel@amd.com>
CC: Jon Hunter <jonathanh@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>

Hi Johan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d6d3455d8751854e0d1820f14184682e23ac4475
commit: fbcf539840350f4b9b0a14e03ff97d1edbd4a75c iommu: tegra: enable compile testing
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-r2201-20261011 (https://download.01.org/0day-ci/archive/20261012/202610120635.FB2IvmZh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fbcf53984035 ("iommu: tegra: enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610120635.FB2IvmZh-lkp@intel.com/

smatch warnings:
drivers/iommu/tegra-smmu.c:430 tegra_smmu_as_prepare() warn: missing error code 'err'

vim +/err +430 drivers/iommu/tegra-smmu.c

7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  419  
891846516317132 Thierry Reding  2014-04-16  420  static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
891846516317132 Thierry Reding  2014-04-16  421  				 struct tegra_smmu_as *as)
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  422  {
891846516317132 Thierry Reding  2014-04-16  423  	u32 value;
d5f583bf8654c23 Nicolin Chen    2020-11-25  424  	int err = 0;
d5f583bf8654c23 Nicolin Chen    2020-11-25  425  
d5f583bf8654c23 Nicolin Chen    2020-11-25  426  	mutex_lock(&smmu->lock);
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  427  
891846516317132 Thierry Reding  2014-04-16  428  	if (as->use_count > 0) {
891846516317132 Thierry Reding  2014-04-16  429  		as->use_count++;
d5f583bf8654c23 Nicolin Chen    2020-11-25 @430  		goto unlock;
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  431  	}
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  432  
50568f87d1e233e Jason Gunthorpe 2025-04-08  433  	as->pd_dma =
50568f87d1e233e Jason Gunthorpe 2025-04-08  434  		dma_map_single(smmu->dev, as->pd, SMMU_SIZE_PD, DMA_TO_DEVICE);
d5f583bf8654c23 Nicolin Chen    2020-11-25  435  	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
d5f583bf8654c23 Nicolin Chen    2020-11-25  436  		err = -ENOMEM;
d5f583bf8654c23 Nicolin Chen    2020-11-25  437  		goto unlock;
d5f583bf8654c23 Nicolin Chen    2020-11-25  438  	}
e3c971960fd41fc Russell King    2015-07-27  439  
e3c971960fd41fc Russell King    2015-07-27  440  	/* We can't handle 64-bit DMA addresses */
e3c971960fd41fc Russell King    2015-07-27  441  	if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
e3c971960fd41fc Russell King    2015-07-27  442  		err = -ENOMEM;
e3c971960fd41fc Russell King    2015-07-27  443  		goto err_unmap;
e3c971960fd41fc Russell King    2015-07-27  444  	}
e3c971960fd41fc Russell King    2015-07-27  445  
891846516317132 Thierry Reding  2014-04-16  446  	err = tegra_smmu_alloc_asid(smmu, &as->id);
891846516317132 Thierry Reding  2014-04-16  447  	if (err < 0)
e3c971960fd41fc Russell King    2015-07-27  448  		goto err_unmap;
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  449  
e3c971960fd41fc Russell King    2015-07-27  450  	smmu_flush_ptc(smmu, as->pd_dma, 0);
891846516317132 Thierry Reding  2014-04-16  451  	smmu_flush_tlb_asid(smmu, as->id);
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  452  
891846516317132 Thierry Reding  2014-04-16  453  	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
e3c971960fd41fc Russell King    2015-07-27  454  	value = SMMU_PTB_DATA_VALUE(as->pd_dma, as->attr);
891846516317132 Thierry Reding  2014-04-16  455  	smmu_writel(smmu, value, SMMU_PTB_DATA);
891846516317132 Thierry Reding  2014-04-16  456  	smmu_flush(smmu);
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  457  
891846516317132 Thierry Reding  2014-04-16  458  	as->smmu = smmu;
891846516317132 Thierry Reding  2014-04-16  459  	as->use_count++;
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  460  
d5f583bf8654c23 Nicolin Chen    2020-11-25  461  	mutex_unlock(&smmu->lock);
d5f583bf8654c23 Nicolin Chen    2020-11-25  462  
891846516317132 Thierry Reding  2014-04-16  463  	return 0;
e3c971960fd41fc Russell King    2015-07-27  464  
e3c971960fd41fc Russell King    2015-07-27  465  err_unmap:
50568f87d1e233e Jason Gunthorpe 2025-04-08  466  	dma_unmap_single(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
d5f583bf8654c23 Nicolin Chen    2020-11-25  467  unlock:
d5f583bf8654c23 Nicolin Chen    2020-11-25  468  	mutex_unlock(&smmu->lock);
d5f583bf8654c23 Nicolin Chen    2020-11-25  469  
e3c971960fd41fc Russell King    2015-07-27  470  	return err;
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  471  }
7a31f6f48bb6e37 Hiroshi DOYU    2011-11-17  472  

:::::: The code at line 430 was first introduced by commit
:::::: d5f583bf8654c231b781096bc1a186065cda72b3 iommu/tegra-smmu: Expand mutex protection range

:::::: TO: Nicolin Chen <nicoleotsuka@gmail.com>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
