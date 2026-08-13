Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520340B0EC
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621583; cv=none; b=rsumm5mJpYv/3p91LTjhnQehKpRgcv3BRBm6ZxXXSn7MXDXQB4+Tj/YgTHtT+kdgA7vhMfemeB/SFKsZncRc+Ks8KkqkvIwV8AgjZTWPbtImq3HtWTbReiMiFHTVW/+hPRyQVHqTDuypP9A0XDSLAh0pn/w42U7KpXXjwFotKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621583; c=relaxed/simple;
	bh=9sgAEScAJGc6iJ7PvijSAMkT4Bx4xqsBbHyso0VtbvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNrtbKqENeYQgozSQOlowLHoJcegS5c3I4MI+RBjQVE3r8BIPQegWlgg3u9bWReBMm4dH8MAzWhmJTxQmbF6IF0MESh4b+sQTW1py/zIen6qS7A36J4cN1UoZU/P6Kb/Q9TmoZeKqr+Y79wtKeKGevum+J7NBsCBUcv1/dLqjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVMZFo+C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVMZFo+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786621583; x=1818157583;
  h=date:from:to:cc:subject:message-id;
  bh=9sgAEScAJGc6iJ7PvijSAMkT4Bx4xqsBbHyso0VtbvE=;
  b=UVMZFo+CpW4INr8kvlLmAQonAQk3c/FGaNqC4zEP9PbbhlEPxJS6ncHB
   4WsAKq6KVtx1yxnt/dlzhi5nn/uuXtIE5nP4xPJcs3YBJLGKZbayxQnsY
   WZfWV3yK3sBR+XPs1a/6M7wvKZinMvatQC3Wg6vsClamdGe4mGKH7pOJc
   eR+TVXNYGpKBKxHVCKUt9SyvCIULzJlalY/kpOJXRwsFXaAE8QCqqnlDv
   /01V0yZxVSGMXg3MBYCXKj/fXpnmlV4LazD4CkDM9mSJLWb4WbAiiZvfA
   mEewT7qDTaoW0+nhnLpATaPJziZliFVqwsQqQPwfnThS40wslA57K3oka
   A==;
X-CSE-ConnectionGUID: n2aVVuAhRT2IqMw4uw244w==
X-CSE-MsgGUID: ZXVCa2FnRB2AFFeSoMqvIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91067619"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91067619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:46:21 -0700
X-CSE-ConnectionGUID: DIZ4ExpjQWqRqGcss2+3HQ==
X-CSE-MsgGUID: CAN4x8DRQU6CpsYNYQqvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267436784"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 04:46:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTt3-00000000TvD-29NM;
	Thu, 13 Aug 2026 11:46:17 +0000
Date: Thu, 13 Aug 2026 19:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69
 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13
 <= 31
Message-ID: <202608131936.P4bbb5ZC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Le Ma <le.ma@amd.com>
CC: Likun Gao <Likun.Gao@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: e87bfaf55e7311b9587c0163060c6939c36f077e drm/amdgpu: Add gfxhub v12_1 support
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131936.P4bbb5ZC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e87bfaf55e73 ("drm/amdgpu: Add gfxhub v12_1 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608131936.P4bbb5ZC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13 <= 31
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:470 gfxhub_v12_1_xcc_program_invalidation() error: buffer overflow 'adev->vmhub' 13 <= 31
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:539 gfxhub_v12_1_xcc_gart_disable() error: buffer overflow 'adev->vmhub' 13 <= 31
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:752 gfxhub_v12_1_xcc_init() error: buffer overflow 'adev->vmhub' 13 <= 31

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:412 gfxhub_v12_1_xcc_setup_vmid_config() error: buffer overflow 'adev->vmhub' 13 <= 31

vim +69 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c

e87bfaf55e7311 Hawking Zhang 2025-02-24  59  
e87bfaf55e7311 Hawking Zhang 2025-02-24  60  static void gfxhub_v12_1_xcc_setup_vm_pt_regs(struct amdgpu_device *adev,
e87bfaf55e7311 Hawking Zhang 2025-02-24  61  					      uint32_t vmid,
e87bfaf55e7311 Hawking Zhang 2025-02-24  62  					      uint64_t page_table_base,
e87bfaf55e7311 Hawking Zhang 2025-02-24  63  					      uint32_t xcc_mask)
e87bfaf55e7311 Hawking Zhang 2025-02-24  64  {
e87bfaf55e7311 Hawking Zhang 2025-02-24  65  	struct amdgpu_vmhub *hub;
e87bfaf55e7311 Hawking Zhang 2025-02-24  66  	int i;
e87bfaf55e7311 Hawking Zhang 2025-02-24  67  
e87bfaf55e7311 Hawking Zhang 2025-02-24  68  	for_each_inst(i, xcc_mask) {
e87bfaf55e7311 Hawking Zhang 2025-02-24 @69  		hub = &adev->vmhub[AMDGPU_GFXHUB(i)];
e87bfaf55e7311 Hawking Zhang 2025-02-24  70  		WREG32_SOC15_OFFSET(GC, GET_INST(GC, i),
e87bfaf55e7311 Hawking Zhang 2025-02-24  71  				    regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
e87bfaf55e7311 Hawking Zhang 2025-02-24  72  				    hub->ctx_addr_distance * vmid,
e87bfaf55e7311 Hawking Zhang 2025-02-24  73  				    lower_32_bits(page_table_base));
e87bfaf55e7311 Hawking Zhang 2025-02-24  74  
e87bfaf55e7311 Hawking Zhang 2025-02-24  75  		WREG32_SOC15_OFFSET(GC, GET_INST(GC, i),
e87bfaf55e7311 Hawking Zhang 2025-02-24  76  				    regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
e87bfaf55e7311 Hawking Zhang 2025-02-24  77  				    hub->ctx_addr_distance * vmid,
e87bfaf55e7311 Hawking Zhang 2025-02-24  78  				    upper_32_bits(page_table_base));
e87bfaf55e7311 Hawking Zhang 2025-02-24  79  	}
e87bfaf55e7311 Hawking Zhang 2025-02-24  80  }
e87bfaf55e7311 Hawking Zhang 2025-02-24  81  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
