Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B51A682C
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454393; cv=none; b=omYGtZWjDu9KEnbYh+yz2Nnt27XBGt4TpEbiebnOtNxxlt0aC5YMLuOerorn/olrjTJWOZJpREGPLH6fhiaI/aFBpr811WssD0+FggHk47qNC+u0JisbfHVWBHxDZju7FJNAAEy7mfsfQxz+BWQWiTGnVA+5cj7AsRfQvockVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454393; c=relaxed/simple;
	bh=7cTBgxnr2KjP7U7EgIJeQLeiaHld2BIaZaDhPD4YTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k7YFGaEE32/0+uzZh+wWUNa7HneY6x1GeEGdbVunx27K/8LhF9EHXgBywSAIJ6mNr0PwSOgtdpKRXSsjuzgDCfOSrkeTPOJ4GhxoEZfBs/dYLZkAHfI7cbd7Pjgae5yva+OaX5SFOaUBc+jy8+TEkQ3BEAi+32hT9V1D7WLYxdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaAiq0bl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaAiq0bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776454391; x=1807990391;
  h=date:from:to:cc:subject:message-id;
  bh=7cTBgxnr2KjP7U7EgIJeQLeiaHld2BIaZaDhPD4YTPQ=;
  b=RaAiq0blA+tPfJofaO4Pnv//bIgq7AeqixJBYFt34ofHSOBAOZyFCoim
   zdpEG0TCL0YKxWaTN4Uk9zOIJLqHC0jGJxuuAo3B6ARhj6VXJb7khLpTY
   OUA2yYViB3z5NPJdhwSB4C5Ttwfwx/lTECB+qsoy7KAbp7agU6IzvRFQL
   MMMh+mGz9w7ADFBbJiIJnWKn+bXRp3Iahj4wAa9DUBDghI1vhHJIelTJG
   vWNJPjfYLkFi1WYiyVeXdmBvC4o5tV9ST4i7KEqaV6Es8sZ9EOz3RoFPC
   vb4zG667Hu/KRE/kEYk/zN2+QZL9y5ijSK+7+S5VZoeE9W9gkT8tU+vB9
   g==;
X-CSE-ConnectionGUID: aum7Jy+jTcWc4gVWMSxfUA==
X-CSE-MsgGUID: qSS1yWYNSMy9yqHTGG6zJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77486138"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77486138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 12:33:10 -0700
X-CSE-ConnectionGUID: O3floMzSSaGvQUsMUQ0STA==
X-CSE-MsgGUID: WomrlbuCQqmBp/xYp5FlAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="254595545"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2026 12:33:09 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDow6-000000000eW-1hB5;
	Fri, 17 Apr 2026 19:33:06 +0000
Date: Sat, 18 Apr 2026 03:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178
 r535_dmac_alloc() warn: 'args' can also be NULL
Message-ID: <202604180342.azsBtRqp-lkp@intel.com>
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
head:   43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9
commit: f82fb646e12e3f64c4576d8f537b343f16966be9 drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-r072-20260417 (https://download.01.org/0day-ci/archive/20260418/202604180342.azsBtRqp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f82fb646e12e ("drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604180342.azsBtRqp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178 r535_dmac_alloc() warn: 'args' can also be NULL

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:130 r535_curs_init() warn: 'args' can also be NULL

vim +/args +178 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c

9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c        Ben Skeggs 2023-09-19  166  
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  167  static int
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  168  r535_dmac_alloc(struct nvkm_disp *disp, u32 oclass, int inst, u32 put_offset,
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  169  		struct nvkm_gsp_object *dmac)
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  170  {
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  171  	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  172  
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  173  	args = nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | inst, oclass,
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  174  				     sizeof(*args), dmac);
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  175  	if (IS_ERR(args))
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  176  		return PTR_ERR(args);
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  177  
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14 @178  	args->channelInstance = inst;
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  179  	args->offset = put_offset;
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  180  
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  181  	return nvkm_gsp_rm_alloc_wr(dmac, args);
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  182  }
f82fb646e12e3f drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c Ben Skeggs 2024-11-14  183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
