Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCA926B971
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355241; cv=none; b=Dngn0nxJMjWlguwIp4YU3jJO71vsXXY98tZBfWtM1KXTPU9sge1jjFpFaFDieGDQEkyPXeQNr8srRzJD5cz+oIX/VnGGz6goce1AtlcCqYTOTasoB/C9//26tdqS/4WCCgb0Y+dnPEdo0kVa7AMBOd3cCyy0l81jx8G3WIw8W60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355241; c=relaxed/simple;
	bh=tCq53Y02TOcCclmBUU6lSuwIHS1GeViHN16kAe9asqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ukNzQ9Y7N7paGDWFHhrd/6EYlZ/0d4sr3ew0pJfpUs07dBkFkRZ7IvVb3LsCpqUOZsqJ2VRvMIbrwuKkCmv1yiK7OrhRHBUOUVl+G8xg/CgOFuT/c8IePvvNYQma1swHlSrBUr13R0xwLpLE79XMjOnslkuh7Lt7CN7N/uXSgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dskhaMN9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dskhaMN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780355240; x=1811891240;
  h=date:from:to:cc:subject:message-id;
  bh=tCq53Y02TOcCclmBUU6lSuwIHS1GeViHN16kAe9asqM=;
  b=dskhaMN9EqmnlYySC8ahdyhM6gJRIiVsnZTkp2DQuwJCy8IL79JPFeip
   TA999ygqfGmsMhtoUPCUjjmul1ki/my/jZ4lonfgbxlr+YWncW4klgbuQ
   kmQt9I7iNyt+G0Pfl/rvffgr1LLVBxOQ21q4ZTCZNGMxsCALLLF9b9GFB
   j0E0v50+MmTVWcPL6+C5VJHGv4FoyzMa0xkDuizebf34tHOs1UUQZsKQ0
   soDjB3/9PE1O2vPiBKe582o8e3dgfzoWxs/lz+T+3TZ9BA/Yqm+xcZ6Sh
   ucgEQk7N922RmuyTNhWK5CctUHDiF6PsXnZ+idrWgxrGJ7hGqJYQP8tdl
   A==;
X-CSE-ConnectionGUID: s1VhCZPKTE6hnPkFWZu5ag==
X-CSE-MsgGUID: Nv4AuAg5SCqOQ1aDjGaw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80151805"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="80151805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 16:07:20 -0700
X-CSE-ConnectionGUID: DDxDsw+AR7SgoYO3R0ufvQ==
X-CSE-MsgGUID: Z7fsQJ1vRS6r6JBWUL41XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="239543142"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 16:07:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUBj2-00000000BC8-1H0d;
	Mon, 01 Jun 2026 23:07:16 +0000
Date: Tue, 02 Jun 2026 07:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36
 r535_nvdec_alloc() warn: 'args' can also be NULL
Message-ID: <202606020601.chCDJclp-lkp@intel.com>
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
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   1 year ago
:::::: branch date: 25 hours ago
:::::: commit date: 1 year ago
config: openrisc-randconfig-r073-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020601.chCDJclp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7c2d25f1e408 ("drm/nouveau/gsp: add common code for engines/engine objects")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606020601.chCDJclp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36 r535_nvdec_alloc() warn: 'args' can also be NULL
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c:36 r535_nvjpg_alloc() warn: 'args' can also be NULL

vim +/args +36 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c

142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  25  
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  26  static int
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  27  r535_nvdec_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  28  		 struct nvkm_gsp_object *nvdec)
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  29  {
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  30  	NV_BSP_ALLOCATION_PARAMETERS *args;
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  31  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  32  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvdec);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  33  	if (WARN_ON(IS_ERR(args)))
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  34  		return PTR_ERR(args);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  35  
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19 @36  	args->size = sizeof(*args);
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  37  	args->engineInstance = inst;
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  38  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  39  	return nvkm_gsp_rm_alloc_wr(nvdec, args);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  40  }
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  41  

:::::: The code at line 36 was first introduced by commit
:::::: 142cd60243cac1dfa18d3714ed4dd0cdc3786180 drm/nouveau/nvdec/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
