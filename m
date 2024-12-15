Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14565653
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Dec 2024 21:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734299849; cv=none; b=Q/4vx/d4+r0O32csCHdi7dI6tkab2pEixfT0gOL56UdoGpPIH4J09KXFOc7ACDM55Dm/OvvxWOBIvw1pxkINqBse80qvP4BdFJVJCalhedKPvsdjEkfKkj6lijQXSlnELTEPnoHyvuYgiswnDz1jaq9kflMHI2bj7koCRTxbSdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734299849; c=relaxed/simple;
	bh=CfY7WSkG+NvdYEl4yNFcBa6+jzsqop5dn6VcWYCG0/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jn1JT03qq/jk/3R6AJ/MLmtJ7WsqI1LU3zZLGJRzPyctDJRy1CCYz/H/6qmPWXMsvPMpQaEeDA0eTKAo5CYCxIezhTROp8Rd0gDTbubDk470I8+tU0hijggGyQrpkKb4zkcI66xRCAYpPWw/ND7Af6lVUukrSVPRjFYWLeM1YHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyCrD0RA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyCrD0RA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734299847; x=1765835847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CfY7WSkG+NvdYEl4yNFcBa6+jzsqop5dn6VcWYCG0/k=;
  b=QyCrD0RAzFt9/fkkZrLfJXa12bGhhrCMBinQZU2+QOU4EJ4EwKYMyoxn
   h57jHw20V7BYOypQ3U+NjQ+AV+WlofC74cOIe/Fhph0R8qsS05HiM+Pnu
   O4SO0bhjy2PK0uJoptVUbq6eW0HtiRkGKtqh1aFRWazrvWUxCn8ofb+Db
   doHKWwlwLUiGl8np7nsh/mL84jxUItj2VLYqz1uihyz/xmYe0ggrZPrl5
   /IT87GJea9RjMECDvSV4+UMaZavTKSbGxcMR7Ez6AqMeR29E2HhUx74oK
   RhUoya9rGy9sfvzKmtzAQh6/7a1rQUPqr+zNEROeeXgZHMj21QPqapuLs
   A==;
X-CSE-ConnectionGUID: HpVvU7+SRPOemF3jbx8hBg==
X-CSE-MsgGUID: MOBQNW1yQF+hKSVuSuR+hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="45370720"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="45370720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 13:57:26 -0800
X-CSE-ConnectionGUID: ZYC+TzknR0yjoWelQLDK2A==
X-CSE-MsgGUID: 6QMw/qxcQGCNYh2a7wFkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="96903378"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2024 13:57:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMwc7-000Dsc-1K;
	Sun, 15 Dec 2024 21:57:23 +0000
Date: Mon, 16 Dec 2024 05:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:725:67-70: opportunity for
 str_on_off(val)
Message-ID: <202412160522.wcHyAn3L-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dccbe2047a5b0859de24bf463dae9eeea8e01c1e
commit: 33dcda51e9bd1b904d034fee3332ded8ad254125 drm/amdgpu: add ACA bank dump debugfs support
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-052-20241214 (https://download.01.org/0day-ci/archive/20241216/202412160522.wcHyAn3L-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412160522.wcHyAn3L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:725:67-70: opportunity for str_on_off(val)

vim +725 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c

33dcda51e9bd1b9 Yang Wang 2023-11-24  714  
33dcda51e9bd1b9 Yang Wang 2023-11-24  715  #if defined(CONFIG_DEBUG_FS)
33dcda51e9bd1b9 Yang Wang 2023-11-24  716  static int amdgpu_aca_smu_debug_mode_set(void *data, u64 val)
33dcda51e9bd1b9 Yang Wang 2023-11-24  717  {
33dcda51e9bd1b9 Yang Wang 2023-11-24  718  	struct amdgpu_device *adev = (struct amdgpu_device *)data;
33dcda51e9bd1b9 Yang Wang 2023-11-24  719  	int ret;
33dcda51e9bd1b9 Yang Wang 2023-11-24  720  
33dcda51e9bd1b9 Yang Wang 2023-11-24  721  	ret = amdgpu_ras_set_aca_debug_mode(adev, val ? true : false);
33dcda51e9bd1b9 Yang Wang 2023-11-24  722  	if (ret)
33dcda51e9bd1b9 Yang Wang 2023-11-24  723  		return ret;
33dcda51e9bd1b9 Yang Wang 2023-11-24  724  
33dcda51e9bd1b9 Yang Wang 2023-11-24 @725  	dev_info(adev->dev, "amdgpu set smu aca debug mode %s success\n", val ? "on" : "off");
33dcda51e9bd1b9 Yang Wang 2023-11-24  726  
33dcda51e9bd1b9 Yang Wang 2023-11-24  727  	return 0;
33dcda51e9bd1b9 Yang Wang 2023-11-24  728  }
33dcda51e9bd1b9 Yang Wang 2023-11-24  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
