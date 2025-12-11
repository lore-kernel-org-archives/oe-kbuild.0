Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CB319850
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475741; cv=none; b=Qq4GS5s/aSvH8W9wrlDt5sRfXQGY+3Kp0JFtjdAhtfyE+jTyMVruuIlH4/1ZpVTIEJA3DnE4TxEtanjn4/K5G0q7Ax9VUZBXBr9wkjbp9gsFlwY+MgCG7+/jNADN2oecDrC2oKkcWLwcJGfF2vg0+ndAj6Bchqej6ETp0k/IRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475741; c=relaxed/simple;
	bh=hC62331sjXzFF4V2yOw4avGRGplLfh2qD9fMKY1b62E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XlzCuZWr0gQvIbW3YLoYKzcbu5g5YrBvnt4+qgUFjadXYmgkuIdtQYJGER4sFF/GR6oCEmLfYzDL/WqQSSnjcVhZrlLXwUdf09UxrWmiNlbEQDk2nBRABgVqT/B6b1DmSjmCECUMTRiLWjBzllMZrKPvDVeoJlpvVmaoD6gOym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eu+vj3Os; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eu+vj3Os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765475740; x=1797011740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hC62331sjXzFF4V2yOw4avGRGplLfh2qD9fMKY1b62E=;
  b=Eu+vj3OsLYf9Xg6a6PKEnE9BcVlYo8gutGN9iYdWYh8I0lAVQaMWp28M
   a9BXiWbogMnUBDGv1x0zaOnXM5DRp7R2QxyYO1m+WOKMhaGpPDreMYWQz
   lChrfxK9t0wbDj0lJvvzCFwVrWyC4I4KrBq2Q/iabQAfDEauSoC2J5FGw
   l8zvFqhC/+ENqQEmcA281WTj1GQetVswBZSFGDmwy403kFihBzgd20DIK
   8HLuD1OV1WDHQprGmjXfZRGxO6vbMljkvMm1Ayz2yaFbBtse8baT2LlP7
   gF/ZM5pqFdZzdCsg6mozWkArk75gmHkBJi6dGEtkM8nbCirrh8B/SHDWN
   w==;
X-CSE-ConnectionGUID: m7z0cyRlRhCQE0Zdfzb6bw==
X-CSE-MsgGUID: UW+21wnXRymu3kh8S6xxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67423085"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67423085"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 09:55:39 -0800
X-CSE-ConnectionGUID: Xkf/HuIlRF6hH/diDAl3Rw==
X-CSE-MsgGUID: sUX07lgCSkOle0YfRLCx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201329010"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 09:55:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTkt6-000000004vl-0KaE;
	Thu, 11 Dec 2025 17:55:36 +0000
Date: Fri, 12 Dec 2025 01:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13956/13990]
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512120148.U0vJkzko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5ce74bc1b7cb2732b22f9c93082545bc655d6547
commit: be6b9291a22c3935d24f5b49a9a0666aca0d0096 [13956/13990] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-123-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120148.U0vJkzko-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120148.U0vJkzko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120148.U0vJkzko-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
--
   drivers/gpu/drm/amd/amdgpu/imu_v12_1.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/imu_v12_1.c:35:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/imu_v12_1.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
--
   drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:46:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:46:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
--
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:35:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:36:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:37:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
--
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:52:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:52:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:53:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:53:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"

vim +34 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c

c92bb14151a597 Le Ma 2025-11-02  33  
c92bb14151a597 Le Ma 2025-11-02 @34  MODULE_FIRMWARE("amdgpu/psp_15_0_8_toc.bin");
c92bb14151a597 Le Ma 2025-11-02  35  

:::::: The code at line 34 was first introduced by commit
:::::: c92bb14151a59715c674d421d647e37dc6cedd6e drm/amdgpu: Add psp v15.0.8 ip block v3

:::::: TO: Le Ma <le.ma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
