Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69613A7F7A
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041629; cv=none; b=WngdBxndaobSOAHgsWPxL+Gt0udZlMuD3f3oN14ya2S4akW+zL6g1RvxfiWnEAJA4/Mykh8UADyvdnmzO124uz0coJ0pqG/vsRLSJMXDm2ZCVLjHHpPWvCbRNqTCjBj/1Pt9b+PyyJjrwHchEaNkfuPNfKPqHRAOG2vUfD+SikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041629; c=relaxed/simple;
	bh=W2Vxhi6uUlWNIRMFjdwwC9Dbc8feeiB4lGhLUy+a2qw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GInGEuNKMjgDkFXPVpJDfH/gOCnzxWuf0Sosi/4zu2uinZcJHAeyjUfT8LBtbKq5EIaz9fHTqkg2Cy5g95Y/Xnwx+ufUBDoOCpMtm4PxL07YtRcLuYamYsU2/4gnZ0qHsCd1Kcalk0c4Omb9QfOMfMJ5bm6u080UHaQah9q6WDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1RCsf66; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1RCsf66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786041627; x=1817577627;
  h=date:from:to:cc:subject:message-id;
  bh=W2Vxhi6uUlWNIRMFjdwwC9Dbc8feeiB4lGhLUy+a2qw=;
  b=c1RCsf66adA9PPTjaEvL17A1LrHb6FZR8zenQUWUL9CDpdCmONEQLFtO
   bokepkvruCYRtuVbGCw4GZ+i21Rw7uv0X+c8fT3PSbeJAKTQSHabkLW5h
   OYqfFoA9OOkzu/kEWuLlFiAiwLBBuhMpS2CL9jpBG7LjWYJeCGiGiubP6
   /dA1egetZlf76mm0zCb7ASy2mJVFXN5O0/e6jJd5R/7pJtEy9foK1COxy
   1TBunb3rCX3BBZ3cYT7Lo+rAT8D6r9VjPw3YacKeLFY0RCgIKhWNWMmqN
   euZuzXS235eChCLYeer42LuVARNQ6dFVyWkr5BTHE4YRt2G8FPAA4bSbX
   Q==;
X-CSE-ConnectionGUID: Ta/J7R2YSTiKfJC0BEMqxw==
X-CSE-MsgGUID: DZ7d1UGyS3WdRVKLKxdIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89173739"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89173739"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 11:40:26 -0700
X-CSE-ConnectionGUID: Xn5MbRfuToev7Yihq+ZTmA==
X-CSE-MsgGUID: V0CGgfvnR1ClGk9eZOcO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="262810163"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Aug 2026 11:40:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws30w-00000000FyC-2HmU;
	Thu, 06 Aug 2026 18:40:22 +0000
Date: Fri, 07 Aug 2026 02:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69
 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13
 <= s32max
Message-ID: <202608070257.3q9GpqXZ-lkp@intel.com>
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
head:   fcaeecb8b0cd44f77d03b28de0671258d4db18f8
commit: e87bfaf55e7311b9587c0163060c6939c36f077e drm/amdgpu: Add gfxhub v12_1 support
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260807/202608070257.3q9GpqXZ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e87bfaf55e73 ("drm/amdgpu: Add gfxhub v12_1 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608070257.3q9GpqXZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13 <= s32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:412 gfxhub_v12_1_xcc_setup_vmid_config() error: buffer overflow 'adev->vmhub' 13 <= s32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:470 gfxhub_v12_1_xcc_program_invalidation() error: buffer overflow 'adev->vmhub' 13 <= u32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:539 gfxhub_v12_1_xcc_gart_disable() error: buffer overflow 'adev->vmhub' 13 <= u32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:752 gfxhub_v12_1_xcc_init() error: buffer overflow 'adev->vmhub' 13 <= s32max

vim +69 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c

e87bfaf55e7311b Hawking Zhang 2025-02-24  59  
e87bfaf55e7311b Hawking Zhang 2025-02-24  60  static void gfxhub_v12_1_xcc_setup_vm_pt_regs(struct amdgpu_device *adev,
e87bfaf55e7311b Hawking Zhang 2025-02-24  61  					      uint32_t vmid,
e87bfaf55e7311b Hawking Zhang 2025-02-24  62  					      uint64_t page_table_base,
e87bfaf55e7311b Hawking Zhang 2025-02-24  63  					      uint32_t xcc_mask)
e87bfaf55e7311b Hawking Zhang 2025-02-24  64  {
e87bfaf55e7311b Hawking Zhang 2025-02-24  65  	struct amdgpu_vmhub *hub;
e87bfaf55e7311b Hawking Zhang 2025-02-24  66  	int i;
e87bfaf55e7311b Hawking Zhang 2025-02-24  67  
e87bfaf55e7311b Hawking Zhang 2025-02-24  68  	for_each_inst(i, xcc_mask) {
e87bfaf55e7311b Hawking Zhang 2025-02-24 @69  		hub = &adev->vmhub[AMDGPU_GFXHUB(i)];
e87bfaf55e7311b Hawking Zhang 2025-02-24  70  		WREG32_SOC15_OFFSET(GC, GET_INST(GC, i),
e87bfaf55e7311b Hawking Zhang 2025-02-24  71  				    regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
e87bfaf55e7311b Hawking Zhang 2025-02-24  72  				    hub->ctx_addr_distance * vmid,
e87bfaf55e7311b Hawking Zhang 2025-02-24  73  				    lower_32_bits(page_table_base));
e87bfaf55e7311b Hawking Zhang 2025-02-24  74  
e87bfaf55e7311b Hawking Zhang 2025-02-24  75  		WREG32_SOC15_OFFSET(GC, GET_INST(GC, i),
e87bfaf55e7311b Hawking Zhang 2025-02-24  76  				    regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
e87bfaf55e7311b Hawking Zhang 2025-02-24  77  				    hub->ctx_addr_distance * vmid,
e87bfaf55e7311b Hawking Zhang 2025-02-24  78  				    upper_32_bits(page_table_base));
e87bfaf55e7311b Hawking Zhang 2025-02-24  79  	}
e87bfaf55e7311b Hawking Zhang 2025-02-24  80  }
e87bfaf55e7311b Hawking Zhang 2025-02-24  81  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
