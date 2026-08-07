Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4862264A7
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 00:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786062587; cv=none; b=XLiRdWsal2pXNHkrCEq/59sclKOfPNUZhu8fA/mZMiaH3FPF/uwO3kOHtDf4UB1nRJyE4932x4G0W5IQuvI4t6nUnDN/+QoR3vrdqHhcQIgVgNbWgt0j12CXpDI6HAunVTb8xkpuI8D7gPxXVmKfcjlItoYJfrjkLbl/LnV9rb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786062587; c=relaxed/simple;
	bh=UdugJ0eAegEoU07REXKtEKnZe9mawEjH+YvfskP8zzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uasstZoQDqsM7ojVjCpbxtucz8dE5fed+UE5HOYBL+wmSrBr6Aj0/cCD5JuZldA0SboMhTB6O6BfEpLrBISsA+lMpaZD8tdyPs4T+grMjiqi6wOpJL2MdoWVs+VEsSPl1pZosUj51D0WfVxPyVKycqQ8pEHQ0kAEOjJVdo3x4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9nJoSG1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9nJoSG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786062585; x=1817598585;
  h=date:from:to:cc:subject:message-id;
  bh=UdugJ0eAegEoU07REXKtEKnZe9mawEjH+YvfskP8zzQ=;
  b=U9nJoSG1peYtRgc3WTiEPYm/EzCsuFgXXT7hTYnLCVScM3GwQPoIvEIF
   1JhRUaFdbr4/2y+mD/GzXdnl92jZf9dfDo6yS1w/8Ay7EjuPbnNttAGhz
   P2Fw0q/IDjZNUKKVBUwGG9ZIuVqs68Vt/zi134ao8Pf2q4EXwkBHls4jF
   aFGosoN462qFeVKEmZe33czO13SKz9dUb7QgqCOsn5FuXXF+41spqFwb+
   EvthdLzLe9anbR7yfNjTUvkFH3tJA7O+ZDE9Gay8bPKaZ99yHKS+2HZ7W
   +LJurxCUW6lqNgvb9HF88WjQUikzFEbwX7vlQ6Cp+5PjOJfJjCU4GUa5c
   Q==;
X-CSE-ConnectionGUID: ldYvGfuFT66WJZWx3p5goA==
X-CSE-MsgGUID: XOlMGeovT8Of1iy51pD2dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74211510"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="74211510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 17:29:44 -0700
X-CSE-ConnectionGUID: SJce1o1XTHGvFoYtSXvD4g==
X-CSE-MsgGUID: ixItx1dARriA9bO+ecI/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="300462783"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2026 17:29:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws8Sz-00000000GhQ-1de1;
	Fri, 07 Aug 2026 00:29:41 +0000
Date: Fri, 07 Aug 2026 08:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1229
 mes_v12_1_kiq_enable_queue() error: buffer overflow 'adev->mes.ring' 16 <=
 s32max
Message-ID: <202608070852.ZI0TtEht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jack Xiao <Jack.Xiao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Mukul Joshi <mukul.joshi@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c68fa601b49683ecb04eded993a71dfa8b2ba0b
commit: e220edf2d6fd6dbf08fa93790809500a80217948 drm/amdgpu/mes_v12_1: initial support for mes_v12_1
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260807/202608070852.ZI0TtEht-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e220edf2d6fd ("drm/amdgpu/mes_v12_1: initial support for mes_v12_1")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608070852.ZI0TtEht-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1229 mes_v12_1_kiq_enable_queue() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1516 mes_v12_1_kiq_dequeue_sched() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1604 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1625 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1607 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1612 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1680 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max

vim +1229 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

e220edf2d6fd6d Jack Xiao 2025-05-14  1213  
e220edf2d6fd6d Jack Xiao 2025-05-14  1214  static int mes_v12_1_kiq_enable_queue(struct amdgpu_device *adev, int xcc_id)
e220edf2d6fd6d Jack Xiao 2025-05-14  1215  {
e220edf2d6fd6d Jack Xiao 2025-05-14  1216  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
e220edf2d6fd6d Jack Xiao 2025-05-14  1217  	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq[xcc_id].ring;
e220edf2d6fd6d Jack Xiao 2025-05-14  1218  	int r, inst = MES_PIPE_INST(xcc_id, AMDGPU_MES_SCHED_PIPE);
e220edf2d6fd6d Jack Xiao 2025-05-14  1219  
e220edf2d6fd6d Jack Xiao 2025-05-14  1220  	if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
e220edf2d6fd6d Jack Xiao 2025-05-14  1221  		return -EINVAL;
e220edf2d6fd6d Jack Xiao 2025-05-14  1222  
e220edf2d6fd6d Jack Xiao 2025-05-14  1223  	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
e220edf2d6fd6d Jack Xiao 2025-05-14  1224  	if (r) {
e220edf2d6fd6d Jack Xiao 2025-05-14  1225  		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
e220edf2d6fd6d Jack Xiao 2025-05-14  1226  		return r;
e220edf2d6fd6d Jack Xiao 2025-05-14  1227  	}
e220edf2d6fd6d Jack Xiao 2025-05-14  1228  
e220edf2d6fd6d Jack Xiao 2025-05-14 @1229  	kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring[inst]);
e220edf2d6fd6d Jack Xiao 2025-05-14  1230  
e220edf2d6fd6d Jack Xiao 2025-05-14  1231  	r = amdgpu_ring_test_ring(kiq_ring);
e220edf2d6fd6d Jack Xiao 2025-05-14  1232  	if (r) {
e220edf2d6fd6d Jack Xiao 2025-05-14  1233  		DRM_ERROR("kfq enable failed\n");
e220edf2d6fd6d Jack Xiao 2025-05-14  1234  		kiq_ring->sched.ready = false;
e220edf2d6fd6d Jack Xiao 2025-05-14  1235  	}
e220edf2d6fd6d Jack Xiao 2025-05-14  1236  	return r;
e220edf2d6fd6d Jack Xiao 2025-05-14  1237  }
e220edf2d6fd6d Jack Xiao 2025-05-14  1238  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
