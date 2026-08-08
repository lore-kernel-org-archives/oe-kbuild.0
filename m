Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC4379989
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786175106; cv=none; b=AobAuFc17jOsVnAhlqOtxXrKfL5poKxVV/44b35af2ctpFFEVduxOmQD5494S6znG58tNAUgWXnhKTtMhsDC78YTd46gMlqZBd5zc+vga+g1j+NxmV0S3Oh4XDiAlzkNXuDaJNgOBbmOtRFdOp43QiTdnclrJVZH18W23LxPUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786175106; c=relaxed/simple;
	bh=9/vZRvP70LOS/YLkLfgPGM4Ur9O7M+3eMXm79cZEXDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZBJc1iq4tGm++8wXupqVO6SywocRN06oxJIxZpQkvOhdnk3DeXKFLWH3eeV+8GLVINN/0LLGw/lSEgak2x9KJYd9JUAFM8OMEnRqaj/xa33X0Jaodpwi4WuUk3K4dMKDIjYTisLgz7AwSKJgUXtqrapx7cBqWxXJAuD/2+gdf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RB+xe8tC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RB+xe8tC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786175104; x=1817711104;
  h=date:from:to:cc:subject:message-id;
  bh=9/vZRvP70LOS/YLkLfgPGM4Ur9O7M+3eMXm79cZEXDQ=;
  b=RB+xe8tCfFHY7+uHhBH8IcgKLo3DxWuVHmMABnGWB7fEFkmTBhQFgl8Z
   DA4FwURE+b/yTSSvgOZiHd/Ya2427h6qlIwcnqYXN9aD0sJU1pH+pS4Y8
   le77QkXQ869LYhPGPtpXXEk2mGi9XxJc1DCXwwuFgUqkCPKFzSZu4MAXI
   VKBO5vKAeWAMXIyi8ujeAxbWFaoz4SxlDOnwnrdyO2unbcDO4SAEvVn1U
   An+3UJAohsz0X9JoAsIiiAS8Un7k/YN+wyOOBNppZEHqPvw4T2LvPYzI+
   xbhEbAneWfSNGU/RN0BtaUYELVT4wEPfmf+vAD3F+4CR5inBpzB4rz7Cs
   A==;
X-CSE-ConnectionGUID: XoskcE1lSuucpOayFWPlSQ==
X-CSE-MsgGUID: 7bJonUEuS2mzIhWpDR82JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86714736"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86714736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 00:44:56 -0700
X-CSE-ConnectionGUID: uVA7Mt8dQf+6YALxgxhm5Q==
X-CSE-MsgGUID: JrNPGuM1Seitmz9hPRUNIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="261296212"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2026 00:44:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsbjg-00000000JyC-2mDR;
	Sat, 08 Aug 2026 07:44:52 +0000
Date: Sat, 08 Aug 2026 15:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69
 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13
 <= s32max
Message-ID: <202608081419.1cCE4164-lkp@intel.com>
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
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: e87bfaf55e7311b9587c0163060c6939c36f077e drm/amdgpu: Add gfxhub v12_1 support
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260808/202608081419.1cCE4164-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e87bfaf55e73 ("drm/amdgpu: Add gfxhub v12_1 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608081419.1cCE4164-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:69 gfxhub_v12_1_xcc_setup_vm_pt_regs() error: buffer overflow 'adev->vmhub' 13 <= s32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:412 gfxhub_v12_1_xcc_setup_vmid_config() error: buffer overflow 'adev->vmhub' 13 <= s32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:470 gfxhub_v12_1_xcc_program_invalidation() error: buffer overflow 'adev->vmhub' 13 <= u32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:539 gfxhub_v12_1_xcc_gart_disable() error: buffer overflow 'adev->vmhub' 13 <= u32max
drivers/gpu/drm/amd/amdgpu/gfxhub_v12_1.c:752 gfxhub_v12_1_xcc_init() error: buffer overflow 'adev->vmhub' 13 <= s32max

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
