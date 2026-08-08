Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF3369D5B
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786227623; cv=none; b=G2jkFsW8vTM5AZWw3znHNGHwJmcOphqoxoqjsqtWirTop8PClpfxuWrvytH+gBatRbmQPx0D1VafZ1WncZBPLNPriIEGAy7n+7MylLkLqoZL8qFdYc1yOaNB7zm5e8Kpy1lhWvlndDu2y4XzUQMPgL1ZlXg0Tj2wM7Thxp4SHdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786227623; c=relaxed/simple;
	bh=g4FtxWUTSJcD7STqk6OZeCqUEVccgvX2h1fQCx6dj3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gx0pp2tpcKJ24Qba1PAD5yUowDidWXUbRHsPI12dpVl/7O1k/ze9YUwo/Z0/zMe8P3vasfYLjwGNRUnpzFDojZ7Y3et2HcS5afbDSJnJy3NoGP3dDFNfcfh+JtsyLnHzXVVMQGbehEdZR9INrsJyzPgTHmrEWH77+TxGCxstAG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwQwVByc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwQwVByc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786227622; x=1817763622;
  h=date:from:to:cc:subject:message-id;
  bh=g4FtxWUTSJcD7STqk6OZeCqUEVccgvX2h1fQCx6dj3Q=;
  b=mwQwVBycyaOEstp4w/GxxnpZ5TCsRJOaA3BMQDE8ctRzWvW71GJSFpZe
   y/SuYVEdrEpH9051b0Eu/D0Cmuu5rv+Yit2umBSimwCQR97diUyNU5cAW
   Njk2IxdIZpy+NR+xbcmQ/D1UC2aKCfnAIn7SWKp/XgiM+wQnPOgbN+d79
   slmmiblRSHT8rN3k6KPA2R046fvYWdt9+mqgY5mcSk8YLap4an785rrWq
   7f/cxGsWp15PChAKQIKdX3LE5QVPUVwvZiMji/F4RC3u6Tktouz5mo3Yu
   oQfgx0R5djwuXyM/m1wyDybNefF5MrjjQYzeLSJeoV6rtFwFki1wDf0wB
   A==;
X-CSE-ConnectionGUID: OYbZc1bhRNu6AhZx0YhUXA==
X-CSE-MsgGUID: ZQxInNNSSN6F8ck6VQtB3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86903813"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="86903813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 15:20:18 -0700
X-CSE-ConnectionGUID: 2+8xvMtIQUuK5mcGkUyCqw==
X-CSE-MsgGUID: F4GRdmDGQ3e6iexKZIZbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="266545175"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2026 15:20:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wspOp-00000000Kst-1UZC;
	Sat, 08 Aug 2026 22:20:15 +0000
Date: Sun, 09 Aug 2026 06:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:355
 mes_v12_1_remove_hw_queue() error: buffer overflow 'mes->master_xcc_ids' 16
 <= s32max
Message-ID: <202608090543.JAGQeVTE-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: 75053887d6d8f527578ffcb1113bc336fae49b42 drm/amdgpu/mes12_1: add cooperative dispatch support
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archive/20260809/202608090543.JAGQeVTE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 75053887d6d8 ("drm/amdgpu/mes12_1: add cooperative dispatch support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608090543.JAGQeVTE-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:355 mes_v12_1_remove_hw_queue() error: buffer overflow 'mes->master_xcc_ids' 16 <= s32max

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:296 mes_v12_1_add_hw_queue() error: buffer overflow 'mes->master_xcc_ids' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1313 mes_v12_1_kiq_enable_queue() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1614 mes_v12_1_kiq_dequeue_sched() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1702 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1705 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1710 mes_v12_1_kiq_hw_fini() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1723 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max
drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1778 mes_v12_1_xcc_hw_init() error: buffer overflow 'adev->mes.ring' 16 <= s32max

vim +355 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

e220edf2d6fd6d Jack Xiao 2025-05-14  346  
e220edf2d6fd6d Jack Xiao 2025-05-14  347  static int mes_v12_1_remove_hw_queue(struct amdgpu_mes *mes,
e220edf2d6fd6d Jack Xiao 2025-05-14  348  				     struct mes_remove_queue_input *input)
e220edf2d6fd6d Jack Xiao 2025-05-14  349  {
e220edf2d6fd6d Jack Xiao 2025-05-14  350  	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
75053887d6d8f5 Jack Xiao 2025-03-10  351  	int xcc_id = input->xcc_id;
75053887d6d8f5 Jack Xiao 2025-03-10  352  	int inst = MES_PIPE_INST(xcc_id, AMDGPU_MES_SCHED_PIPE);
75053887d6d8f5 Jack Xiao 2025-03-10  353  
75053887d6d8f5 Jack Xiao 2025-03-10  354  	if (mes->enable_coop_mode)
75053887d6d8f5 Jack Xiao 2025-03-10 @355  		xcc_id = mes->master_xcc_ids[inst];
e220edf2d6fd6d Jack Xiao 2025-05-14  356  
e220edf2d6fd6d Jack Xiao 2025-05-14  357  	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
e220edf2d6fd6d Jack Xiao 2025-05-14  358  
e220edf2d6fd6d Jack Xiao 2025-05-14  359  	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
e220edf2d6fd6d Jack Xiao 2025-05-14  360  	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
e220edf2d6fd6d Jack Xiao 2025-05-14  361  	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
e220edf2d6fd6d Jack Xiao 2025-05-14  362  
e220edf2d6fd6d Jack Xiao 2025-05-14  363  	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
e220edf2d6fd6d Jack Xiao 2025-05-14  364  	mes_remove_queue_pkt.gang_context_addr = input->gang_context_addr;
e220edf2d6fd6d Jack Xiao 2025-05-14  365  
e220edf2d6fd6d Jack Xiao 2025-05-14  366  	return mes_v12_1_submit_pkt_and_poll_completion(mes,
75053887d6d8f5 Jack Xiao 2025-03-10  367  			xcc_id, AMDGPU_MES_SCHED_PIPE,
e220edf2d6fd6d Jack Xiao 2025-05-14  368  			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
e220edf2d6fd6d Jack Xiao 2025-05-14  369  			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
e220edf2d6fd6d Jack Xiao 2025-05-14  370  }
e220edf2d6fd6d Jack Xiao 2025-05-14  371  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
