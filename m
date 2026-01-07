Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58382253FC
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 02:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754159; cv=none; b=BYqj82TmUVx0FfrjsSAiiIdt2lZM93kFfmX16AqkDmqmkGOUTB7HOQSZrxKf5lXS9Ryf09BFbZmZZ7QIq8EszVcMHrLJMI2Idzr8niScbQgN3SuGNFEj6/xgGsy55Mf86m1e6urIg9688Sbzc45qlljYQ9FVZsjKYPp+fjc41wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754159; c=relaxed/simple;
	bh=j2kQDOhpd0vLeMBmZoSoD/U5nBKr986qcqz6OeEZowI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=djPris3+TaEZ5tBA7reMLTuI7MmWASey5eI4A5KeWo4gab+totBI5TUbgb6S89Mn79XxPiToacnYKKKPeWrzKDhea8cwYxJb1vEnl5uNIpw0f0cbpjywU+WP3fWbazCYD9aoinjp/vb1GgaczidM3U+zHaQdaBuBnE+Sll8qesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXvQCiIg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXvQCiIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767754158; x=1799290158;
  h=date:from:to:cc:subject:message-id;
  bh=j2kQDOhpd0vLeMBmZoSoD/U5nBKr986qcqz6OeEZowI=;
  b=GXvQCiIgNm0q/WXob7Bs7CLO5E5CEYMJwFxzIj3ykIi4gi7s1g7J/8L2
   bAhP83A/X/fVbGsCf+SQGvSpsfg4llqqnIOJ1+ovX38vlR3ino9EcXv7D
   QaZ/sdJSaVWmjW8xdD7EebPz28/WrSCmq1GoXJaai63n/hoCG+YqNKuun
   iaL3GKjMxGM8zDLcQPEFQeJc6GI3TuQvdAdCMxKsrIVMWGcMYOBA3iVcL
   4xWdx/rd3EqEw6iqGZIPtht1iydHjjcZTDQyRUXN8WdAks7T8ZrLndgiI
   +2JdPwmxzCb9R0bQKcQYx9T5ud5GMtN/Kx90N20fb0JhUgnqI++5pKJTC
   Q==;
X-CSE-ConnectionGUID: xKjXjR2DTvi36Ms283QA2A==
X-CSE-MsgGUID: MzyYUcZfSmqvBQOPsFlaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91780222"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="91780222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 18:49:17 -0800
X-CSE-ConnectionGUID: eHM80ZkvQbatF56D8nEMCA==
X-CSE-MsgGUID: DAUjQdAZQCKBVRN30yg/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="207680680"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jan 2026 18:49:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdJbl-000000003P9-3v0H;
	Wed, 07 Jan 2026 02:49:13 +0000
Date: Wed, 07 Jan 2026 10:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3977/4052]
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:34:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601071056.FusqsRx2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:34:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6cd6c12031130a349a098dbeb19d8c3070d2dfbe
commit: fd26c076232d34088da0887b57ed431726337a5f [3977/4052] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux.git
:::::: branch date: 25 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-062-20260106 (https://download.01.org/0day-ci/archive/20260107/202601071056.FusqsRx2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071056.FusqsRx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601071056.FusqsRx2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/psp_v15_0.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:500:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:34:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/amd/amdgpu/psp_v15_0.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"

vim +34 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c

9b24f63d825e77 Pratik Vishwakarma 2025-11-24  33  
9b24f63d825e77 Pratik Vishwakarma 2025-11-24 @34  MODULE_FIRMWARE("amdgpu/psp_15_0_0_toc.bin");
9b24f63d825e77 Pratik Vishwakarma 2025-11-24  35  

:::::: The code at line 34 was first introduced by commit
:::::: 9b24f63d825e771dafa137e6370c6bf44395e748 drm/amdgpu: Enable support for PSP 15_0_0

:::::: TO: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
