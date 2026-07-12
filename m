Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87A36F8E4
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 04:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783829371; cv=none; b=Iylu5azql+NxVbyHxnR1Avz1lek3GpzhFMhUP5CnAf+cglc3GYk0o80GlDBabOuzwp+F4lwhGN7LLwRij7r3WaIdXkqDueNPEefp5De4xflYtyLh84ZJZHhqsEV/QZwpqiw67N++M6Wr1fFbQEk2cSSjkSZrG0q2cko+S1c3M2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783829371; c=relaxed/simple;
	bh=fVZplJdi/s+ujShsAuuKfFfvzv7ds/wcmVR8eXxP8SI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+Gl7JmVoouyANrpMSMiA7GmmB0GBnFnepJiFbaTtbN9uG74ANBHzR6NOUqjCvPG4rPt86oM07pF2a6jHyIezlusKLUD56kyXvkej9+wV0lEDBlKB6XRIBIVWsQvyxqHbs1oGFrwOSEz3tc+i5aj+HdydBaSX0ENHe8JDLHedX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOI+e5aZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOI+e5aZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783829369; x=1815365369;
  h=date:from:to:cc:subject:message-id;
  bh=fVZplJdi/s+ujShsAuuKfFfvzv7ds/wcmVR8eXxP8SI=;
  b=jOI+e5aZOsxRGJcLCbxt6GxJFt+ctl4RzZa/EBlvaHkobCEKPfujxZlo
   jVHmQev+uZ8LeQV7ubZdYHA0YN+wtlchaAxDvASkVkz1LP9SXn6pIYyy2
   WpVnEiZwogenYFDVZuXtWjqvwtjMOVAg2+HE/xXhvai/1eOVtfX17it4W
   iyJyNwPspvFRx+VNEdodWymAsYNUZIFFLvtaKCPmFr/LfgHEz6x4v83iG
   SS7/mEoPykqfy7fPYwKpiBzo/JO+gjQjrR0YPTf1Ek7Hckj2BikL/3mAC
   vnZz22vOnqNOQnFnCl3nK8qAd48GbS9XVK00t3j4tvsksY5pecbSozXTy
   g==;
X-CSE-ConnectionGUID: Rlj1K7dEQwCSt1bJrTqbxw==
X-CSE-MsgGUID: 2wlOkT8qR4GqVYnXpJP19A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101903723"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101903723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 21:09:28 -0700
X-CSE-ConnectionGUID: 6oBbHARRTtOANbf4Pne4ZQ==
X-CSE-MsgGUID: YIndNVJDTSKOdYwOp5WSgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254726674"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2026 21:09:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wilVL-00000000Kfs-2ksP;
	Sun, 12 Jul 2026 04:09:23 +0000
Date: Sun, 12 Jul 2026 12:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c:1529:51-61:
 opportunity for str_enable_disable(enablement)
Message-ID: <202607121136.iVz9scpE-lkp@intel.com>
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
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: c7fc0f372374cf463be2ba4b5b21c20c3c051bb6 drm/amd: Enable SMU 15_0_0 support
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-103-20260711 (https://download.01.org/0day-ci/archive/20260712/202607121136.iVz9scpE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7fc0f372374 ("drm/amd: Enable SMU 15_0_0 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607121136.iVz9scpE-lkp@intel.com/

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
