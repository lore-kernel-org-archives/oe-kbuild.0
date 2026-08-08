Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A62E737E
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786189285; cv=none; b=TeB51HSqefgGETQpuqGMkEy1SsMTxlHFpcfHr6ADolgAUm7rWGC+aS5TpMPLTVrr75KZMUEhxWxpT7+1+z4V7WPknM5e7tBovNv1yRg6JqtNeaZ8cif0CV0OYgM4Sscu3hOGmJqgWbZF0Y8+l8Qss6xb6tlxMRI9GqbD6NA0Hmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786189285; c=relaxed/simple;
	bh=7BFmDdriEfQ8/1KUBuKUlQCuFWfgcSk0rtjiK358B6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UqtlMw7jFHUpwBhv53RMgFgARlGQWaO3koFzJiW2+y9gBguk2VBRe7MzllCyx5kBuTLUCFcpa+Cywk6JIEQ7nMtx/Oqswo616tLslwFfiX1JPVxz3jWNaiz9FoNZz3ZAjpSqmieQicy04olES4Fs9Olt0XUPYw3kgKBeIQRG1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmJlSjai; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmJlSjai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786189284; x=1817725284;
  h=date:from:to:cc:subject:message-id;
  bh=7BFmDdriEfQ8/1KUBuKUlQCuFWfgcSk0rtjiK358B6M=;
  b=MmJlSjaiFM1G8Y/BxrQUWohQqWqMtpwxyL6JcNx+MDH7Rl0ZMhfJnAP7
   kTOUpMbQSlWpwk1EkzsqDWQGvi8VSILOILqjC4vjzS9KVqHA8w27e8QhS
   fn7x8ES9B2axutMuoO0sc38Xm2dxsulqIKumSNMfDlVBMT3nNZ8F8mbhs
   SWb7SOHmTAxanyJHdOj2t6KVcFderppRsHmYCjqGqnTEA2R59Y6wseOlv
   GCBHwIIZqlbqrnx/CIaSokbJIQXZ8CKGPesF6Feq1CEr/t8q6ZvHbhDeX
   ORrl5wUFTeKvXH3giXSU48GmBiFsig51LFmFNOiuiFChZ/4ElOPRtNmIm
   g==;
X-CSE-ConnectionGUID: huCCN1X7TdqjeY/vHJXayw==
X-CSE-MsgGUID: dcCxridWQ5q4m6i7gmuc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97933253"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="97933253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 04:41:23 -0700
X-CSE-ConnectionGUID: AP99JH6HRmyvT/KCwkXzeA==
X-CSE-MsgGUID: KOsFQvpMTOW7VM0D9Hjf3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="264612468"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2026 04:41:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsfQV-00000000K7T-2CFp;
	Sat, 08 Aug 2026 11:41:19 +0000
Date: Sat, 08 Aug 2026 19:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1229
 mes_v12_1_kiq_enable_queue() error: buffer overflow 'adev->mes.ring' 16 <=
 s32max
Message-ID: <202608081921.zUla9MpN-lkp@intel.com>
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
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: e220edf2d6fd6dbf08fa93790809500a80217948 drm/amdgpu/mes_v12_1: initial support for mes_v12_1
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260808/202608081921.zUla9MpN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e220edf2d6fd ("drm/amdgpu/mes_v12_1: initial support for mes_v12_1")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608081921.zUla9MpN-lkp@intel.com/

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
