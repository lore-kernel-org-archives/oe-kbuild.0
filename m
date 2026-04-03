Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B040379ED2
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205600; cv=none; b=lg6hpHx+Tr4Mev66DZxqBJxAA731hjp8ugPsYK6cEZGS9JwqEArjHC5VPjTi/wZpMFFGRJlcsN1RUIjcR+LLuNn73F9vYLcH8qr5kCFmrSnqNefjDCgsxF/bXMpZiaTN/bv9/50NpxxHdeFAGffLd38oWrvBZIJvLdNmYsDluXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205600; c=relaxed/simple;
	bh=ELo1vuQiZeXqhztasWVFkV7z/kHWnSC/6pFGUih4E00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oq7vovEO3wd47fnJrjU61Om1H2aok6jvsVw6xjALrUdudsqAI6tj6MyO1akx+V8jqdwMpSQsjIxgKLNnm3tYPKqZK+tHqtJL+piDWfKOlLIANxmwx7VY2P+Xbgcy+tv8YlTPApJECRL8FK0y5vPFY3PDfmTKHUTV7I/aEy86/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mya3Hras; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mya3Hras"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205599; x=1806741599;
  h=date:from:to:cc:subject:message-id;
  bh=ELo1vuQiZeXqhztasWVFkV7z/kHWnSC/6pFGUih4E00=;
  b=Mya3HrassC1i03/2SDYkq/ixioX8A+/n73zrzKNnFDyoCn6ERXHL4LlF
   2cYVM0R75sTPeV17uqY/vstlP/8IEKCBo/VbV5zSgMOA8+XtAUfp/Zo1X
   WsJ3+D7/EaGgOKcfzTzUEyELJIeB5RorH+8GZsLSWzDlMplEigb/mhWOm
   gwsyPEekfd/y4FHHjQHbY1OkpFoPYtXjBFS4c1Th7uZtZ2rtKU5NBO3Uw
   mfA4piWFAhPH8k2dkBTHoTvX/tm6CKXkZM+ny9w+uTiIZmOTlboG3WfB6
   wEGG9yH7z5nbZh3ahqsn3xKjtkwM66ii1G9dqNPuEq+U7oNJju+07ppdB
   w==;
X-CSE-ConnectionGUID: KDGOwm+4QyWdwNl3lNpfVw==
X-CSE-MsgGUID: CPg4PrAaRaOmJoNG91g5ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76153053"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76153053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:59 -0700
X-CSE-ConnectionGUID: 1+JKeg44SOGPTf7mMGGT9Q==
X-CSE-MsgGUID: jiNBwpkTQ6KwH8zp+c97RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="257678119"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4I-0000000011l-09wr;
	Fri, 03 Apr 2026 08:39:54 +0000
Date: Fri, 03 Apr 2026 16:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:126
 isp_genpd_add_device() warn: can 'pdev' even be NULL?
Message-ID: <202604021030.uHxhgntW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pratap Nirujogi <pratap.nirujogi@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Bin Du <bin.du@amd.com>
CC: Mario Limonciello <mario.limonciello@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: fd14786071021bb63b0ab32b95257a594e46f8d4 drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support
date:   9 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r071-20260330 (https://download.01.org/0day-ci/archive/20260402/202604021030.uHxhgntW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd1478607102 ("drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604021030.uHxhgntW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:126 isp_genpd_add_device() warn: can 'pdev' even be NULL?
drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:159 isp_genpd_remove_device() warn: can 'pdev' even be NULL?

vim +/pdev +126 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c

fd14786071021b Pratap Nirujogi 2025-05-29  117  
fd14786071021b Pratap Nirujogi 2025-05-29  118  static int isp_genpd_add_device(struct device *dev, void *data)
fd14786071021b Pratap Nirujogi 2025-05-29  119  {
fd14786071021b Pratap Nirujogi 2025-05-29  120  	struct generic_pm_domain *gpd = data;
fd14786071021b Pratap Nirujogi 2025-05-29  121  	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  122  	struct amdgpu_isp *isp = container_of(gpd, struct amdgpu_isp, ispgpd);
fd14786071021b Pratap Nirujogi 2025-05-29  123  	struct amdgpu_device *adev = isp->adev;
fd14786071021b Pratap Nirujogi 2025-05-29  124  	int ret;
fd14786071021b Pratap Nirujogi 2025-05-29  125  
fd14786071021b Pratap Nirujogi 2025-05-29 @126  	if (!pdev)
fd14786071021b Pratap Nirujogi 2025-05-29  127  		return -EINVAL;
fd14786071021b Pratap Nirujogi 2025-05-29  128  
fd14786071021b Pratap Nirujogi 2025-05-29  129  	if (!dev->type->name) {
fd14786071021b Pratap Nirujogi 2025-05-29  130  		drm_dbg(&adev->ddev, "Invalid device type to add\n");
fd14786071021b Pratap Nirujogi 2025-05-29  131  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  132  	}
fd14786071021b Pratap Nirujogi 2025-05-29  133  
fd14786071021b Pratap Nirujogi 2025-05-29  134  	if (strcmp(dev->type->name, "mfd_device")) {
fd14786071021b Pratap Nirujogi 2025-05-29  135  		drm_dbg(&adev->ddev, "Invalid isp mfd device %s to add\n", pdev->mfd_cell->name);
fd14786071021b Pratap Nirujogi 2025-05-29  136  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  137  	}
fd14786071021b Pratap Nirujogi 2025-05-29  138  
fd14786071021b Pratap Nirujogi 2025-05-29  139  	ret = pm_genpd_add_device(gpd, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  140  	if (ret) {
fd14786071021b Pratap Nirujogi 2025-05-29  141  		drm_err(&adev->ddev, "Failed to add dev %s to genpd %d\n",
fd14786071021b Pratap Nirujogi 2025-05-29  142  			pdev->mfd_cell->name, ret);
fd14786071021b Pratap Nirujogi 2025-05-29  143  		return -ENODEV;
fd14786071021b Pratap Nirujogi 2025-05-29  144  	}
fd14786071021b Pratap Nirujogi 2025-05-29  145  
fd14786071021b Pratap Nirujogi 2025-05-29  146  exit:
fd14786071021b Pratap Nirujogi 2025-05-29  147  	/* Continue to add */
fd14786071021b Pratap Nirujogi 2025-05-29  148  	return 0;
fd14786071021b Pratap Nirujogi 2025-05-29  149  }
fd14786071021b Pratap Nirujogi 2025-05-29  150  
fd14786071021b Pratap Nirujogi 2025-05-29  151  static int isp_genpd_remove_device(struct device *dev, void *data)
fd14786071021b Pratap Nirujogi 2025-05-29  152  {
fd14786071021b Pratap Nirujogi 2025-05-29  153  	struct generic_pm_domain *gpd = data;
fd14786071021b Pratap Nirujogi 2025-05-29  154  	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  155  	struct amdgpu_isp *isp = container_of(gpd, struct amdgpu_isp, ispgpd);
fd14786071021b Pratap Nirujogi 2025-05-29  156  	struct amdgpu_device *adev = isp->adev;
fd14786071021b Pratap Nirujogi 2025-05-29  157  	int ret;
fd14786071021b Pratap Nirujogi 2025-05-29  158  
fd14786071021b Pratap Nirujogi 2025-05-29 @159  	if (!pdev)
fd14786071021b Pratap Nirujogi 2025-05-29  160  		return -EINVAL;
fd14786071021b Pratap Nirujogi 2025-05-29  161  
fd14786071021b Pratap Nirujogi 2025-05-29  162  	if (!dev->type->name) {
fd14786071021b Pratap Nirujogi 2025-05-29  163  		drm_dbg(&adev->ddev, "Invalid device type to remove\n");
fd14786071021b Pratap Nirujogi 2025-05-29  164  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  165  	}
fd14786071021b Pratap Nirujogi 2025-05-29  166  
fd14786071021b Pratap Nirujogi 2025-05-29  167  	if (strcmp(dev->type->name, "mfd_device")) {
fd14786071021b Pratap Nirujogi 2025-05-29  168  		drm_dbg(&adev->ddev, "Invalid isp mfd device %s to remove\n",
fd14786071021b Pratap Nirujogi 2025-05-29  169  			pdev->mfd_cell->name);
fd14786071021b Pratap Nirujogi 2025-05-29  170  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  171  	}
fd14786071021b Pratap Nirujogi 2025-05-29  172  
fd14786071021b Pratap Nirujogi 2025-05-29  173  	ret = pm_genpd_remove_device(dev);
fd14786071021b Pratap Nirujogi 2025-05-29  174  	if (ret) {
fd14786071021b Pratap Nirujogi 2025-05-29  175  		drm_err(&adev->ddev, "Failed to remove dev from genpd %d\n", ret);
fd14786071021b Pratap Nirujogi 2025-05-29  176  		return -ENODEV;
fd14786071021b Pratap Nirujogi 2025-05-29  177  	}
fd14786071021b Pratap Nirujogi 2025-05-29  178  
fd14786071021b Pratap Nirujogi 2025-05-29  179  exit:
fd14786071021b Pratap Nirujogi 2025-05-29  180  	/* Continue to remove */
fd14786071021b Pratap Nirujogi 2025-05-29  181  	return 0;
fd14786071021b Pratap Nirujogi 2025-05-29  182  }
fd14786071021b Pratap Nirujogi 2025-05-29  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
