Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4D29AAEA
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522546; cv=none; b=JXG1EKBP2lGHzdE8pNMlA6n2jsMNQK2rpiWqfnB5K1ypZJxg+q7QGDyy1+KBPAdF53KjC0OCYRtRzGP51wcT2EouMrYUbgir5bdy7AEzpln8CfqPOjApCZMU9d/pbMCBnVjbT912bu8Uq3mR6LgG5I/5zjO7ApkmnSESHQURAOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522546; c=relaxed/simple;
	bh=/jIpSRanFjgSSf+FxIJI/OiDxzY+HaMiydE6DjZH+0w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MHOc4nVL9uwGQwkMl68zYo7KZ5g2DiW1RN7nHTqGTsJs+wYJUo4Id2Q2sn76dpC7+Ox4mT2y28fCdSiE/m8OVQo/76sYH6XA14rTdOa6jpenB9F0uc081V3v/LgruU4IYoOIhTzPE6kwmX8zXdec6UjwreoVizYqfGw+HK/FqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8unTNoG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8unTNoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791522544; x=1823058544;
  h=date:from:to:cc:subject:message-id;
  bh=/jIpSRanFjgSSf+FxIJI/OiDxzY+HaMiydE6DjZH+0w=;
  b=L8unTNoGkDxBnELKqM9f/6Nh/HGDGzcuGBU2WeGdf5tEhqTdC9QmNXCy
   ms4RssXmmOUEMchdrM8tPmujPcqbdJ0tQgh6fmhURILS4heTPVEKcUZCH
   lO2yhC4MF8S51dOYiq/MlBdzys/uKo+CRR4fJyrhsV4SCYbnaKvpE3WmF
   Ugwi4c5ewAHa87Dhyukk7Zk8EZ/jpeYckK3kOW9YVws+IqggyjicN4de9
   Elx8tzmzMgiL4D4z9WdMNTk8OvK48v72mULUAzNKA/OJSR4/qxpH+VvDO
   cmXZFOnIL/aweW5D3OBrF1A6oa1ku2KHO3v5+uplMl8TX6XFFkl2S7jft
   w==;
X-CSE-ConnectionGUID: Fz5J2/+6SFOdVpI8R2ARIQ==
X-CSE-MsgGUID: xTKn/KR5RnycJ9dSC0DbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="202068"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="202068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 22:09:03 -0700
X-CSE-ConnectionGUID: JiH3nPDwQsODJLz3AlGMNQ==
X-CSE-MsgGUID: cdm+xLiWRsymJDKEG9uVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="224018"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2026 22:09:02 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF2qp-000000006jv-3ZhY;
	Fri, 09 Oct 2026 05:08:59 +0000
Date: Fri, 09 Oct 2026 07:08:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 785/15343]
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c:503:2-12: second lock on line 503
Message-ID: <202610090645.i5ztnF2u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Asad Kamal <asad.kamal@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 208e5d4b3f1e2efb87e8d5307b4752f2e103fb3e [785/15343] drm/amd/amdgpu: Add soc_v1_0 reset handler
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090645.i5ztnF2u-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610090645.i5ztnF2u-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/soc_v1_0.c:503:2-12: second lock on line 503

vim +503 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c

208e5d4b3f1e2e Asad Kamal 2025-11-26  487  
208e5d4b3f1e2e Asad Kamal 2025-11-26  488  static int
208e5d4b3f1e2e Asad Kamal 2025-11-26  489  soc_v1_0_mode2_perform_reset(struct amdgpu_reset_control *reset_ctl,
208e5d4b3f1e2e Asad Kamal 2025-11-26  490  			     struct amdgpu_reset_context *reset_context)
208e5d4b3f1e2e Asad Kamal 2025-11-26  491  {
208e5d4b3f1e2e Asad Kamal 2025-11-26  492  	struct amdgpu_device *adev = (struct amdgpu_device *)reset_ctl->handle;
208e5d4b3f1e2e Asad Kamal 2025-11-26  493  	struct list_head *reset_device_list = reset_context->reset_device_list;
208e5d4b3f1e2e Asad Kamal 2025-11-26  494  	struct amdgpu_device *tmp_adev = NULL;
208e5d4b3f1e2e Asad Kamal 2025-11-26  495  	int r = 0;
208e5d4b3f1e2e Asad Kamal 2025-11-26  496  
208e5d4b3f1e2e Asad Kamal 2025-11-26  497  	dev_dbg(adev->dev, "soc_v1_0 perform hw reset\n");
208e5d4b3f1e2e Asad Kamal 2025-11-26  498  
208e5d4b3f1e2e Asad Kamal 2025-11-26  499  	if (!reset_device_list)
208e5d4b3f1e2e Asad Kamal 2025-11-26  500  		return -EINVAL;
208e5d4b3f1e2e Asad Kamal 2025-11-26  501  
208e5d4b3f1e2e Asad Kamal 2025-11-26  502  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
208e5d4b3f1e2e Asad Kamal 2025-11-26 @503  		mutex_lock(&tmp_adev->reset_cntl->reset_lock);
208e5d4b3f1e2e Asad Kamal 2025-11-26  504  		tmp_adev->reset_cntl->active_reset = AMD_RESET_METHOD_MODE2;
208e5d4b3f1e2e Asad Kamal 2025-11-26  505  	}
208e5d4b3f1e2e Asad Kamal 2025-11-26  506  
208e5d4b3f1e2e Asad Kamal 2025-11-26  507  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
208e5d4b3f1e2e Asad Kamal 2025-11-26  508  		r = soc_v1_0_mode2_reset(tmp_adev);
208e5d4b3f1e2e Asad Kamal 2025-11-26  509  		if (r) {
208e5d4b3f1e2e Asad Kamal 2025-11-26  510  			dev_err(tmp_adev->dev,
208e5d4b3f1e2e Asad Kamal 2025-11-26  511  				"ASIC reset failed with error, %d for drm dev, %s",
208e5d4b3f1e2e Asad Kamal 2025-11-26  512  				r, adev_to_drm(tmp_adev)->unique);
208e5d4b3f1e2e Asad Kamal 2025-11-26  513  			break;
208e5d4b3f1e2e Asad Kamal 2025-11-26  514  		}
208e5d4b3f1e2e Asad Kamal 2025-11-26  515  	}
208e5d4b3f1e2e Asad Kamal 2025-11-26  516  
208e5d4b3f1e2e Asad Kamal 2025-11-26  517  	list_for_each_entry(tmp_adev, reset_device_list, reset_list) {
208e5d4b3f1e2e Asad Kamal 2025-11-26  518  		mutex_unlock(&tmp_adev->reset_cntl->reset_lock);
208e5d4b3f1e2e Asad Kamal 2025-11-26  519  		tmp_adev->reset_cntl->active_reset = AMD_RESET_METHOD_NONE;
208e5d4b3f1e2e Asad Kamal 2025-11-26  520  	}
208e5d4b3f1e2e Asad Kamal 2025-11-26  521  
208e5d4b3f1e2e Asad Kamal 2025-11-26  522  	return r;
208e5d4b3f1e2e Asad Kamal 2025-11-26  523  }
208e5d4b3f1e2e Asad Kamal 2025-11-26  524  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
