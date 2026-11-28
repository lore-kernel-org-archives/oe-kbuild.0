Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795829113;
	b=GPopCjo7uQ/KQ2xAvTvCNE290lxh2YQJ3p/5EQ+2P9OGIBoytXw6CUJdvfUlCiskv2dx
	 ybO619+vtbOoMZe45YelFRxreK+YSj9S6mWebUjB0lDTGe9eBrI4QpN18m7AFh/Li0phi
	 nv3HssJjyjIuG/o3U/vxYXDR9+mB/N9Te+kJSmyGAlPuykB14UGllCZnAU4TXZMXdJPGS
	 tEe/oBwlUet3wZeOs5J3T/CamZDUclAP2am/Rth/HZtU+g5he8yoLISUORfYoYfrjFm0n
	 RyaivPUFcr4Eo8XSmZ9B3PiqhY0VVol3MVuo4yEhtiZbdwlRnpYlwY+XIVKw4vw/2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=C5R/MItvFx+0naHGNI00UNzeOJnEoZpMB2BTgxKO3gA=;
	b=JYyvQJWNBoLN0n85MG2mqFGFK/OhtcwGpmUq7c4XLxcwllYCVJBVbLncsQ0i14OwOpCa
	 e989zOdw3k8pg35/K7hPQH6xB0Z6/E0q9fSjr199LqL+gtZAqZwTyaFMExtIWDpg2H+z7
	 stuy/m6+HoMlv+/90uMYayTzvJgaNO7JnRaLprGw+cVADJc38+C6pvDHqMyprtrS+fL6A
	 +fL9XwHZpciZZVuoas/5qW7DYU51pX7Ejje8UJGYplqOdFYumI8j49WIh562auqugZfSy
	 /m7TDi2BdyWSQ784McC9f9KcsiIrhD5pm5PKy9FMBXOBNT32n8y89A0z3dv9OOUnVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kO88EWou;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD5606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 01:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kO88EWou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795829113; x=1827365113;
  h=date:from:to:cc:subject:message-id;
  bh=+A8Zpz+0RaJv4DSbatxTUS8+KvwqDFYu+obKdSxAw0Q=;
  b=kO88EWoujY9+Imoo1c4xk3bhsVY5ZleX9RR3Y2VTdd5OChFWwqMBOcAC
   rnac0uCiF+OjGAnnC86DkE7amD4TA2BTppE/ETz87C+ocsI+g2n8k72e3
   9KzlhAS32MxROC/Xup1c5vXYnRf92MVLJYAa6K5ni64FodQwkiyw66tuD
   paLI4gJg4ZuO23Pv0VIR/KmfOM7rhmgZNGdHLjzyPDhMo8weza6xO6huH
   BgxV3G+7+oECjqJhQltsRgiwUPahUslLMWuhffFKbdvzMQm7eSwufvG7h
   60LAwQBK85gOGGjSY/ks6X4GUCF+dRc+C4L0137qzyGa5T7xJJiRy7cCf
   w==;
X-CSE-ConnectionGUID: Uzh6pe9sT12Nl5Qfa0i31w==
X-CSE-MsgGUID: lsb90fwlRWSQior974J2AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4578763"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4578763"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 17:25:12 -0800
X-CSE-ConnectionGUID: O7i57+W3QEaXVHvQTF7i+Q==
X-CSE-MsgGUID: I7tBH5X6RqyCjt6V2zjhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12651944"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2026 17:25:10 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX7Bc-000000000TO-0qhU;
	Sat, 28 Nov 2026 01:25:08 +0000
Date: Sat, 28 Nov 2026 02:24:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22:
 WARNING opportunity for min()
Message-ID: <20261128022015.2gG87g2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4585067150b85e33f60876149a6e742928da75e
commit: 4bbba79a7f1d0c7296bf8c935d65a9ff633f6917 drm/amdgpu: move devcoredump generation to a worker
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-r2100-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128022015.2gG87g2J-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbba79a7f1d ("drm/amdgpu: move devcoredump generation to a worker")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261128022015.2gG87g2J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c:343:21-22: WARNING opportunity for min()

vim +343 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c

9022f01b970933 Sunil Khatri               2024-03-21  326  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  327  static ssize_t
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  328  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  329  			void *data, size_t datalen)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  330  {
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  331  	struct amdgpu_coredump_info *coredump = data;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  332  	ssize_t byte_copied;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  333  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  334  	if (!coredump)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  335  		return -ENODEV;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  336  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  337  	if (!coredump->formatted)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  338  		return -ENODEV;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  339  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  340  	if (offset >= coredump->formatted_size)
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  341  		return 0;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  342  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21 @343  	byte_copied = count < coredump->formatted_size - offset ? count :
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  344  		coredump->formatted_size - offset;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  345  	memcpy(buffer, coredump->formatted + offset, byte_copied);
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  346  
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  347  	return byte_copied;
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  348  }
4bbba79a7f1d0c Pierre-Eric Pelloux-Prayer 2025-02-21  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
