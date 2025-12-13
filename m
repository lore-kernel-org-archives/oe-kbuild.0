Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AD321D3E4
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765607594; cv=none; b=ui7I9cfyoKvojzZK9brrTplE2MBV75jrqny3hUbiCcfMIH1BIi0euNNnNPowLGn+IKdq959sHXPoX8TbEHp3x+TvjTkAIPvgj3HZhTYmsDQt/ukkZSs9ccKgYa8EC5LqT2+kUhFDj2TnsyE3wscAgCJJuCrazfWOWlPPwQ+eX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765607594; c=relaxed/simple;
	bh=tvB3yS0fLPXoB7QqQZfEL/ljeVWAtxvco6ar69TsLnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prbbDjTdWQKYupRQ1lughcXzFnAPiAyASNAjBcNMeLvRyAFZF1WBdkdWB1791qqYYOavVIFLBs+jgnMxHCo5RRF4QaP3yWLae1HK4Yti/kAoG05P7xJn+bDmbhYOVYHRz67jFYeNmLJdBMjeonM8PdVqOOBb/l5wt/NRm/L3Gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJkjepwY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJkjepwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765607592; x=1797143592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvB3yS0fLPXoB7QqQZfEL/ljeVWAtxvco6ar69TsLnc=;
  b=BJkjepwYxUubO2PudSLGnKzDQrF8es6pb0bUMB7a6y0W0IUVmbNEUJWJ
   XF2j9qrqWgdNVNHwoua4vrKtJUDcKPD4NHX9Zq3j1TEfpcjTgUBLOC6nR
   9qceyZS6BFlRX9mTwngG794cVrJGBpauyeTjeVWt2nRq37gu61tXY6r4z
   BPq8af981p14FCxb+emzbX3QIXYjbm228QqviVfkK6ryxIyFZUNTQawy7
   Bnk8I0WD5lzf9r9BbYPtyHfUHIs2g2q+P4K9qv73jweb/DaGUnY2xptME
   Q6b1siX1YS6LGPjWTyqIDW2N6eIyltcuSOzkY0P8u9VkA+ICjNmShVgNr
   w==;
X-CSE-ConnectionGUID: nlWXcMhTT+S1/1okHws7cw==
X-CSE-MsgGUID: c9RNm8PdTL2r8bpMpXOeCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78241653"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78241653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:33:10 -0800
X-CSE-ConnectionGUID: W7Za4NF7QmqCP1OjWF4ONA==
X-CSE-MsgGUID: yvjGgN8pRPWUZi1ppkCyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198094475"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 22:33:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJBj-000000007Az-07X7;
	Sat, 13 Dec 2025 06:33:07 +0000
Date: Sat, 13 Dec 2025 14:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c:37
 r535_ce_alloc() warn: 'args' can also be NULL
Message-ID: <202512131447.j8C3NEsl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a919610db43b34621d0c3b333e12db9002caf5da
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131447.j8C3NEsl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131447.j8C3NEsl-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c:37 r535_ce_alloc() warn: 'args' can also be NULL

vim +/args +37 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c

b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  26  
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  27  static int
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c Ben Skeggs 2025-02-15  28  r535_ce_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c Ben Skeggs 2025-02-15  29  	      struct nvkm_gsp_object *ce)
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  30  {
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  31  	NVC0B5_ALLOCATION_PARAMETERS *args;
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  32  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c Ben Skeggs 2025-02-15  33  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), ce);
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  34  	if (WARN_ON(IS_ERR(args)))
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  35  		return PTR_ERR(args);
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  36  
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19 @37  	args->version = 1;
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c Ben Skeggs 2025-02-15  38  	args->engineType = NV2080_ENGINE_TYPE_COPY0 + inst;
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  39  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c Ben Skeggs 2025-02-15  40  	return nvkm_gsp_rm_alloc_wr(ce, args);
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  41  }
b5ce219ab368bb drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c        Ben Skeggs 2023-09-19  42  

:::::: The code at line 37 was first introduced by commit
:::::: b5ce219ab368bbb430f9f59a3e0b8f05bc7354ae drm/nouveau/ce/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
