Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B437DABC
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539031; cv=none; b=YlVF1cnj1I2CdullaDXQUtBk+LW38fQyKYrkpLZn3pUCIQJvbG+irBTjJ9C/mLLgU0ILGqrVHeKrXiF5ODI9daJg3TvCSYNkj1rK7VEhikjtr9NIbSED5WXE559u/+deOKRWKQaKkdKmZxg5/LVhf/OMzK+Pp2POwpbkE8kDuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539031; c=relaxed/simple;
	bh=V/X8CoBd7m0UQz+6z6jzPk9sxWmKTKc64UoMC/90ztc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VSExRr37XBV9DX8e52s963l3uEzWxaAb2x3qCqQxIhc9ohE3k2zRrxiQIHJ6MKVNHVE/P1mZUbomeud9P0yOuJ8/tmhpyH4x1ATacLcITsgN0yhQkbX7BX9RpQLTMQJBvgB+92j0/Epi3tiySatQEzoEehbVHwhTdnFYF4jHGJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXXJ/hTG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXXJ/hTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779539029; x=1811075029;
  h=date:from:to:cc:subject:message-id;
  bh=V/X8CoBd7m0UQz+6z6jzPk9sxWmKTKc64UoMC/90ztc=;
  b=BXXJ/hTGJw0pqR0I3vesYC0oKBP+G70NiE5llTSGijN6sLoqO1w2bvqh
   gRpjr01QAaa9s/uGI/x/9u7CUPjlaA/XLDhXAyIjfFB33MwBIaUgPBMoD
   DUMf97mN0jtXx+rFH7UmeEp3CnFSIulFLfxY1LSLGl3oQObtj1Gypao1P
   /6YM4K74JkZi/Uvrhb4B8zY6fAOqSf2qt/AUTX3cDBwJpySfpzCN3sDom
   POX93zEgYD6dZK0E1oLG3q8tJ3Bu49l/ttp2ozTq+E2hDdoL+8bC3ib5+
   MhDVNRlJpXLvMhxQ0LnyWlNQON1G1cMfKPV3vEXGXxlIaELGa4npGJ6+u
   g==;
X-CSE-ConnectionGUID: NnQeWr2+QMGbbrRH8Hb1pQ==
X-CSE-MsgGUID: 2c678+yLRBij6jfWUBUwJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67969747"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67969747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 05:23:48 -0700
X-CSE-ConnectionGUID: ME986861RMm233pC0QU/JA==
X-CSE-MsgGUID: f9Nmk2F2QieCF4/Ihym+AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245441546"
Received: from lkp-server02.sh.intel.com (HELO 4bc6da68457b) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 05:23:47 -0700
Received: from kbuild by 4bc6da68457b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQlOK-000000000Hi-1lsz;
	Sat, 23 May 2026 12:23:44 +0000
Date: Sat, 23 May 2026 20:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c:36
 r535_nvenc_alloc() warn: 'args' can also be NULL
Message-ID: <202605232024.ylR4pNlY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   1 year ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year ago
config: mips-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232024.ylR4pNlY-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7c2d25f1e408 ("drm/nouveau/gsp: add common code for engines/engine objects")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605232024.ylR4pNlY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c:36 r535_nvenc_alloc() warn: 'args' can also be NULL
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c:36 r535_ofa_alloc() warn: 'args' can also be NULL

vim +/args +36 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c

08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  25  
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  26  static int
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  27  r535_nvenc_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  28  		 struct nvkm_gsp_object *nvenc)
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  29  {
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  30  	NV_MSENC_ALLOCATION_PARAMETERS *args;
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  31  
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  32  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvenc);
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  33  	if (WARN_ON(IS_ERR(args)))
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  34  		return PTR_ERR(args);
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  35  
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19 @36  	args->size = sizeof(*args);
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  37  	args->engineInstance = inst;
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  38  
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  39  	return nvkm_gsp_rm_alloc_wr(nvenc, args);
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  40  }
08ab88f5a033c67 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  41  

:::::: The code at line 36 was first introduced by commit
:::::: 08ab88f5a033c67625272eda99de4d245809e0f6 drm/nouveau/nvenc/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
