Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2553E2740
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453443; cv=none; b=WBZsHNHieMG68Jbo/lZzkd492qHMT/uwxkisD8h7GMmFSUzxa9vKky0jSCCuJdyB6Mmt8bKmUGi6Bn0d05bXA0yIxMOhAD/RSQoJdmLC03D7IwmWmJXotSUVCdx8f59zJvMtrGjipD9v6yIhKQENL7rdYiC6ANguWQCgIe+qt7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453443; c=relaxed/simple;
	bh=CO+NBKV2qnR2llBu67aWWaN4KZbmgy3/r1ea5tpEkaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VKHDzwxyOnyuOLjBAuLCjnBH1Ye/V0BLcWyCF9TgkZ22eqv9KVWIWHGOxJLlSWYt7YR0LuNARw3vFu5hrpW/8AJw5+q5U6j7JyzHAQmNN3bkE5Y8uugQWB3MUKRO6pIx1pX8J/pkWEZPJO/loVnQKuPjlobo11YNkD6yWxigDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsQ+c1Eb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsQ+c1Eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774453442; x=1805989442;
  h=date:from:to:cc:subject:message-id;
  bh=CO+NBKV2qnR2llBu67aWWaN4KZbmgy3/r1ea5tpEkaQ=;
  b=SsQ+c1Ebm9Fe6yTVzDFahJYNC3Gc0G+Kqs7CZFhQJxeu7v5XNX5M7pDD
   54H/NOgKRE+weTMlzraRQRJ4KVavcLwgU6jF4CmqC8xeveypC2xEFsQlQ
   bVSNj0z1YXyWqp35e4XKjXZfDuJ3xnkxRg2toKpRfNnmN6fET+bJxV2QG
   jRuoha/5qgtyHoumfIg9DTp58S8//HZrozNyi1ObDYS3JzlrlAwZM7z65
   zvFkms7XU+3iaR4qe2y5wN/YTK2zOLBRptszgPOCNWEJmVWCJtiVBXgIt
   13qaCRYtN/iOQZWFIKRaKCorSGYxZTR3PKa4ri/nufIinrMdIC8zqMYSm
   w==;
X-CSE-ConnectionGUID: 2pjtDDphTSK7O3HBKY292g==
X-CSE-MsgGUID: yuMOxW+HTAOln7a8jKoaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75381626"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75381626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 08:44:02 -0700
X-CSE-ConnectionGUID: DHULTaZOS9q9FciCtlFGaA==
X-CSE-MsgGUID: tEtS+aJ8QA2UWmqy0Ryb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229172838"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 08:44:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5QOk-000000007AX-1mNe;
	Wed, 25 Mar 2026 15:43:58 +0000
Date: Wed, 25 Mar 2026 23:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1529:51-61:
 opportunity for str_enable_disable(enablement)
Message-ID: <202603252333.8uMxBNjr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: c7fc0f372374cf463be2ba4b5b21c20c3c051bb6 drm/amd: Enable SMU 15_0_0 support
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260325/202603252333.8uMxBNjr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603252333.8uMxBNjr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1529:51-61: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1537:49-59: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1545:49-59: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1553:51-61: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1561:49-59: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1569:48-58: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1577:56-66: opportunity for str_enable_disable(enablement)
   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1585:51-61: opportunity for str_enable_disable(enablement)

vim +1529 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c

c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1519  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1520  int smu_v15_0_deep_sleep_control(struct smu_context *smu,
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1521  				 bool enablement)
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1522  {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1523  	struct amdgpu_device *adev = smu->adev;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1524  	int ret = 0;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1525  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1526  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_GFXCLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1527  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_GFXCLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1528  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05 @1529  			dev_err(adev->dev, "Failed to %s GFXCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1530  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1531  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1532  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1533  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1534  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_UCLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1535  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_UCLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1536  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1537  			dev_err(adev->dev, "Failed to %s UCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1538  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1539  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1540  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1541  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1542  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_FCLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1543  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_FCLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1544  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1545  			dev_err(adev->dev, "Failed to %s FCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1546  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1547  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1548  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1549  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1550  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_SOCCLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1551  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_SOCCLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1552  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1553  			dev_err(adev->dev, "Failed to %s SOCCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1554  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1555  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1556  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1557  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1558  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_LCLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1559  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_LCLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1560  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1561  			dev_err(adev->dev, "Failed to %s LCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1562  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1563  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1564  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1565  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1566  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_VCN_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1567  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_VCN_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1568  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1569  			dev_err(adev->dev, "Failed to %s VCN DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1570  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1571  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1572  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1573  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1574  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_MP0CLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1575  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_MP0CLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1576  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1577  			dev_err(adev->dev, "Failed to %s MP0/MPIOCLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1578  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1579  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1580  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1581  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1582  	if (smu_cmn_feature_is_supported(smu, SMU_FEATURE_DS_MP1CLK_BIT)) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1583  		ret = smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DS_MP1CLK_BIT, enablement);
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1584  		if (ret) {
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1585  			dev_err(adev->dev, "Failed to %s MP1CLK DS!\n", enablement ? "enable" : "disable");
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1586  			return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1587  		}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1588  	}
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1589  
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1590  	return ret;
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1591  }
c7fc0f372374cf Pratik Vishwakarma 2025-12-05  1592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
