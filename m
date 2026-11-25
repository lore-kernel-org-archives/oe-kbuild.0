Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635603;
	b=uL/kxAgMu3/yFxzzLLohtxzjqb2SILpBX7AEIhHMCsM0LeG3YyQ+yp0df6n6CGF1vVtp
	 NLpmqp3EyvwSYqfLR1vWqzMrFM4EzsTuYapi5+cKC+AuNeZplu2YNvSXhFH52p4Ok1+Qw
	 JxnBQiZIZ3gwL5VDp3nhPR6LUh0KCNffleAxPgB3XiXFJetJWzeROFCyE5FgcuZo1xcVn
	 EidtDxYG2fxa9MzpgaeBWW1NAsm9/aEuL7Z36mpzaKlsDE3lcZAiQV2QX7hXzXkRaWd4/
	 XK6gUQJeKve/MQjAACn57QRv5tK1jp5NeuBIPoAT7fD1pyZOJhptDkYr71JbGYSlIqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jYHXK3X7hbXFNYNaVk3ULPJc+itanuHjmxuWC3h0CQI=;
	b=h8F7Sg5aFXnFCpp7tEiJmafpHUUsDyjE+fhvvDGBgzacpq7cThbU3jNYpw6oAvAqCKLG
	 Q/YHjl/F9vAu+CSV/H4X99QVsP8vVK4x07L/WjPyfEUgl86+NkPh+5xPsnHoRN16lTbSO
	 7l90ujb3/bIt4YNUUhQoe4/jYMXxqAvlvWWrdLWvlSjAnguIjd0MM35efXTOzuEwATUoH
	 PejuaRakZI+1u3hh0eWwzv5sjfuu0PNi5X3QCelptr5mvNCncjW/ocKqAzkCUyWVZ01im
	 i1krt97BKhqMsMf8jBKyZAVhPkpcv5sM62rRkPF1vf5gNFZ28ZebetOMtPmpnKGlBEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YNeGKQAJ;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940B606A326
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 19:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8940B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YNeGKQAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795635601; x=1827171601;
  h=date:from:to:cc:subject:message-id;
  bh=ODi5gS/QoCZAs6T5nCTfV4jXeWwuDJsJsgWEdyyX4/E=;
  b=YNeGKQAJ6T/zHlo3Cju/I8awwuJ+q1Kmv5bRM8p7L4jzM26kdbmVpwIr
   G16ZVSWXWn8HipFMJQgRE2VSGMbK+BDFEqaGkGSIxSHiHvo0GUiUHi3LC
   /fkmWp540Ee60rLYcLad913ooPbX6Q2FsB45ucCCyG3eZHoNck3ytxHDg
   mBllUu0d5wELOU4alMoUnz5c/PSwxPj6VeIaVk0MkSay8ycZSm2WVQEEW
   2cXWHi45PBzTmrxM6wK23lYIb6DBiZTlOJ7D8xbu4GVCfISPTSo3zc9ZM
   XrxXz/uGbTO+KTVMfgPhG+J3nL2gjns7uTaoNWvPESw2XGDJMM09rcW+H
   Q==;
X-CSE-ConnectionGUID: S49qLDTTQ6+fNyWG+JVPaw==
X-CSE-MsgGUID: POGX9gWqSSSw/FYyp7XcFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4536640"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4536640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:40:00 -0800
X-CSE-ConnectionGUID: pZodgurBRkOwcDa6969UaA==
X-CSE-MsgGUID: wa5VhIQLSl+enHiFqoJg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11835839"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 11:40:00 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWIqS-0000000004Z-1feM;
	Wed, 25 Nov 2026 19:39:56 +0000
Date: Wed, 25 Nov 2026 20:39:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-amdgpu:drm-amdgpu-next 148/243]
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:3781 gfx_v12_1_pre_px_switch() error:
 buffer overflow 'adev->mes.ring' 16 <= s32max
Message-ID: <20261125203106.sVpgvhnY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Sierra <alex.sierra@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   a69db917063c539fa09325ea22f3ff7b0626b478
commit: 5092fbd745ae7b36bdc9ef775d4b9012e5d5dcb6 [148/243] drm/amdgpu: reinitialize GFX compute across a partition switch
:::::: branch date: 5 hours ago
:::::: commit date: 23 hours ago
config: sparc64-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125203106.sVpgvhnY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261125203106.sVpgvhnY-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:3781 gfx_v12_1_pre_px_switch() error: buffer overflow 'adev->mes.ring' 16 <= s32max

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2414 gfx_v12_1_xcc_kcq_resume() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:2471 gfx_v12_1_xcc_cp_resume() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:3875 gfx_v12_1_set_ring_funcs() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max

vim +3781 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c

ad5f1ee0a9b032 Likun Gao   2025-02-17  3766  
5092fbd745ae7b Alex Sierra 2026-10-29  3767  /*
5092fbd745ae7b Alex Sierra 2026-10-29  3768   * A runtime partition switch does not pass through GFX hw_fini/hw_init.
5092fbd745ae7b Alex Sierra 2026-10-29  3769   * Stop the GFX compute path while the old partition is still programmed,
5092fbd745ae7b Alex Sierra 2026-10-29  3770   * then restore it after the new mode is committed.
5092fbd745ae7b Alex Sierra 2026-10-29  3771   */
5092fbd745ae7b Alex Sierra 2026-10-29  3772  static int gfx_v12_1_pre_px_switch(struct amdgpu_ip_block *ip_block)
5092fbd745ae7b Alex Sierra 2026-10-29  3773  {
5092fbd745ae7b Alex Sierra 2026-10-29  3774  	struct amdgpu_device *adev = ip_block->adev;
5092fbd745ae7b Alex Sierra 2026-10-29  3775  	int xcc_id, pipe, num_xcc = NUM_XCC(adev->gfx.xcc_mask);
5092fbd745ae7b Alex Sierra 2026-10-29  3776  
5092fbd745ae7b Alex Sierra 2026-10-29  3777  	if (!adev->enable_mes_kiq)
5092fbd745ae7b Alex Sierra 2026-10-29  3778  		return 0;
5092fbd745ae7b Alex Sierra 2026-10-29  3779  
5092fbd745ae7b Alex Sierra 2026-10-29  3780  	for (xcc_id = 0; xcc_id < num_xcc; xcc_id++) {
5092fbd745ae7b Alex Sierra 2026-10-29 @3781  		if (!adev->mes.ring[MES_PIPE_INST(xcc_id,
5092fbd745ae7b Alex Sierra 2026-10-29  3782  						  AMDGPU_MES_SCHED_PIPE)].sched.ready)
5092fbd745ae7b Alex Sierra 2026-10-29  3783  			return 0;
5092fbd745ae7b Alex Sierra 2026-10-29  3784  	}
5092fbd745ae7b Alex Sierra 2026-10-29  3785  
5092fbd745ae7b Alex Sierra 2026-10-29  3786  	for (xcc_id = 0; xcc_id < num_xcc; xcc_id++)
5092fbd745ae7b Alex Sierra 2026-10-29  3787  		gfx_v12_1_xcc_fini(adev, xcc_id);
5092fbd745ae7b Alex Sierra 2026-10-29  3788  
5092fbd745ae7b Alex Sierra 2026-10-29  3789  	/*
5092fbd745ae7b Alex Sierra 2026-10-29  3790  	 * MES firmware restarts with its read pointer at zero. Clear both
5092fbd745ae7b Alex Sierra 2026-10-29  3791  	 * rings and their writeback pointers before bringing the GFX compute
5092fbd745ae7b Alex Sierra 2026-10-29  3792  	 * path back up, otherwise firmware can replay stale packets.
5092fbd745ae7b Alex Sierra 2026-10-29  3793  	 */
5092fbd745ae7b Alex Sierra 2026-10-29  3794  	for (xcc_id = 0; xcc_id < num_xcc; xcc_id++) {
5092fbd745ae7b Alex Sierra 2026-10-29  3795  		for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++)
5092fbd745ae7b Alex Sierra 2026-10-29  3796  			amdgpu_ring_clear_ring_and_ptrs(
5092fbd745ae7b Alex Sierra 2026-10-29  3797  				&adev->mes.ring[MES_PIPE_INST(xcc_id, pipe)]);
5092fbd745ae7b Alex Sierra 2026-10-29  3798  	}
5092fbd745ae7b Alex Sierra 2026-10-29  3799  
5092fbd745ae7b Alex Sierra 2026-10-29  3800  	adev->gfx.px_switch_stopped = true;
5092fbd745ae7b Alex Sierra 2026-10-29  3801  	return 0;
5092fbd745ae7b Alex Sierra 2026-10-29  3802  }
5092fbd745ae7b Alex Sierra 2026-10-29  3803  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
