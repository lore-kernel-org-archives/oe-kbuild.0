Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDA2475D0
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774189; cv=none; b=A0ExyfKKmFz/WlMS2cqp+r/oizM7C3OAecXIOzI+R/5v5hprKj4DbIKb3UdceG/WeS9AWueV9wshIkZihSAnDq4Gf2yui6ri9FlhSfhQ2ATLQRIuPknnSpdk8zxKiwxocCbIHKe+7rUmHNsxMhG9rpjmxJjSwZdccBYTgSFioCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774189; c=relaxed/simple;
	bh=0dWXXUtma3+UVPCRvcQ7z4TWGVHl8vDNc1oGKkiDn7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yw1y/+TPinQCmIn2XN7ZTi/0Hfz3275yIPKKhon1H74v7YLCNdYq7W3sKzIODBoddvs6rdd9SmxGYLOjz6kg14bPf2mU3mh+95jFtyvsSPapPp/fKnR7ZfqYu0ATZjIYQKAwxOTqI/Qsyc7TXVUcb657wwreZJUFoVlvzGu8lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBDdX3Gr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBDdX3Gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784774187; x=1816310187;
  h=date:from:to:cc:subject:message-id;
  bh=0dWXXUtma3+UVPCRvcQ7z4TWGVHl8vDNc1oGKkiDn7c=;
  b=KBDdX3GrGNpP9XdQNNkluPZ6vEQCfyVF9BMDTHWErI+pHcazeFN2K5rU
   ZN2fkZxNNhOOpG+ExXLBoBnJgWDuqj/6i++m107WgkILdi5UEHMhYtt/t
   pcrwRrWWS1ufrE6pQa0Zdtc0BD/CO309V1GfF1OZLTBfOmbHKUjsqTzNx
   O35aPj6Vh0nBW1VA7XBAZQqj7m31a3J/ngaDGheEGojEYvDa+iKT7ZzUA
   wi69ZT5YzfQ6KyOmCwH8Vixaxt3+mFEms9RjRJMONIzP1JhhyJlNSMsMN
   z2g7V8Do2C7Gc32ieOxEgybZIsbN/YrVrGVI0jNdBrghWLa1zW6uqiM6B
   w==;
X-CSE-ConnectionGUID: eMWFkKhVTj+QAMNEfq1LZQ==
X-CSE-MsgGUID: /FhagaDBSyuxkbtM3dU9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85438935"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="85438935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:36:26 -0700
X-CSE-ConnectionGUID: bRH6Jl4BQ4CdQpyS2xaKmA==
X-CSE-MsgGUID: M01+AigtSrW7mR3GcmHSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="251958478"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2026 19:36:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmjIM-00000000ZBo-18Mt;
	Thu, 23 Jul 2026 02:36:22 +0000
Date: Thu, 23 Jul 2026 10:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:126
 isp_genpd_add_device() warn: can 'pdev' even be NULL?
Message-ID: <202607230826.6uHwoUpw-lkp@intel.com>
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
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: fd14786071021bb63b0ab32b95257a594e46f8d4 drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support
date:   1 year, 1 month ago
:::::: branch date: 33 hours ago
:::::: commit date: 1 year, 1 month ago
config: riscv-randconfig-r073-20260722 (https://download.01.org/0day-ci/archive/20260723/202607230826.6uHwoUpw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fd1478607102 ("drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607230826.6uHwoUpw-lkp@intel.com/

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
