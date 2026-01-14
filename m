Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92F35294C
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374214; cv=none; b=BYadAfrLm/PIXwRRg12mCvCsudZq8bEFCFMOHEZ919lu9sLqHsK56qchWihu57lehmjOuH0Se/0ld0+LZur5t1TKk5qnBglmjd1/sQlcUUXI/W4QIH82XOEethqSathb2sHQ3l3tWeVBW9rfBWKLKW9OM9HaKFwsBWkclRx5jRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374214; c=relaxed/simple;
	bh=UGJZzZPtMdvlRBCn5omoorSPxZxJmyaOcsZeGbQCe3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r//OEwaTAWoBZ9swUwx7Rt2ZZB/wa0I74/q8PrJ2Wf9zi5wmepcEjNnSqeOnwBZJDuA9dNWD6lCOSsiYQBWf6E7B7UTfVK9imFoww+OyvRkjTGd/OUaMhaDzT5oU242LnhoEU2pc1NRwUeB1lIQIvpAyd/+nY7aupH+3woHOXWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyMdojp3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyMdojp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374205; x=1799910205;
  h=date:from:to:cc:subject:message-id;
  bh=UGJZzZPtMdvlRBCn5omoorSPxZxJmyaOcsZeGbQCe3s=;
  b=HyMdojp350fgTJ9D6vV7Ol3CBDAHc4znOYE077B02e8k3PDb8uQ6hTEh
   3DqvpGrqrEGXyg2j6rcxpZrocAPPq21hU9d3hRVfdmhND9FG+LGUDNKpg
   MEI3aVwDU+5dXdh4K3+xzeARD7NLHfQrTXTCAs5zApPtsA0euAodmLt+R
   JhBLb2R8lklolfpMLzfpwhIGkWIikDQjTMc+d8TIXL9oRyUhz+tpGICBc
   KALjnlZxUWAy5rraUpm3SBTPPS/ju5PsL2FlLeO5hIHIUz59/XfQbI9KY
   xM1WfRnd7ZXPEbPuREBDOLaKsVWI4MZzUPPbtCiv9Pe1dy0YwoKobJJKW
   w==;
X-CSE-ConnectionGUID: i6Iuxd3bSP+qpblRqjH/Ug==
X-CSE-MsgGUID: VvPc5C5OSfC430mf0PLhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69752538"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69752538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:03:21 -0800
X-CSE-ConnectionGUID: 19hDGNWzTFuircOroFGGMA==
X-CSE-MsgGUID: eNQUxcLEQiyneqWURFeQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209110182"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jan 2026 23:03:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuuT-00000000Fy8-0KRV;
	Wed, 14 Jan 2026 07:03:17 +0000
Date: Wed, 14 Jan 2026 15:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5687/5774]
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601141437.osVfCYHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c:34:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: 849db7dc012ffdeb2fb9e09609a2ab1a8f498aa0 [5687/5774] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
:::::: branch date: 2 hours ago
:::::: commit date: 29 hours ago
config: s390-randconfig-r111-20260113 (https://download.01.org/0day-ci/archive/20260114/202601141437.osVfCYHT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141437.osVfCYHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601141437.osVfCYHT-lkp@intel.com/

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
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:47:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:47:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
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
>> drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:61:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:61:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:62:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"

vim +34 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c

c92bb14151a5971 Le Ma 2025-11-02  33  
c92bb14151a5971 Le Ma 2025-11-02 @34  MODULE_FIRMWARE("amdgpu/psp_15_0_8_toc.bin");
c92bb14151a5971 Le Ma 2025-11-02  35  

:::::: The code at line 34 was first introduced by commit
:::::: c92bb14151a59715c674d421d647e37dc6cedd6e drm/amdgpu: Add psp v15.0.8 ip block v3

:::::: TO: Le Ma <le.ma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
