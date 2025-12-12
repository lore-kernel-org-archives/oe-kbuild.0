Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A60313285
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765551905; cv=none; b=DCGR17Iie8eC61thXkCrttTRuK4AmnTLeYBN/NnhCY01M7OY5Nfctwco04yaPgeNBD1859rUvBpD/rvV7cxgABH0ZI8W56q+P1MTGTelnaZupbQmKoxZUaeT4PtbqgM4maO9MFJAfKDawoLsD358v0alizJkgsx3s/MUMm14wwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765551905; c=relaxed/simple;
	bh=jSMhwru/erXPRz7GylwnQNL3/kscVYCn8dcwE8Qy0e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHqE0Q/dK4VA1n49osQHzPLJzTK6/BpqxSlbunwL7JASUmLPqzk8cyIgRV8WFug4aGXWoOYsJsZeGne38JvkIwtfo72QOYExjQ89GGoi0f63b2eeVNZwLgWsJQXfSrdRQOvgcbmCRSkvI6jw5J7vcG0zfo6MjJIqxQkF2mfss6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWolMtNY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWolMtNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765551904; x=1797087904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSMhwru/erXPRz7GylwnQNL3/kscVYCn8dcwE8Qy0e4=;
  b=YWolMtNYxn0YWysRRY9Hkgsp1X+OgWbuj1GIZJ9gkxV6HPa+Mddd18IZ
   +6DvVICMG+2FYlDuA38Xd7B3GsRztQLDQNShUESEn908VR2YoEHwdJpmO
   y9+qAjHphiPzoPGk/jdqcWu6Nv6d3KwjzwCIQ4h40iQT4XVXfTupFwGLz
   WFfmXZyuYUl6msb1/f555SKWecaU8GKv0ekKQrBPPate47oiHXyzFZ9Nn
   XN7RjBM3luHKLhdEFInEyPvtPuSsPM1Q69qHzZb4MHoyCHyjQp+ugn17u
   bFLrxWf2RjUkP4sGDhtEChGwuLMxyd2VS37HopFtHT59rz3xNKBl2eoaa
   Q==;
X-CSE-ConnectionGUID: +QomloP4TpuwJsBCneKXpA==
X-CSE-MsgGUID: s3mi36ndR8utODqoNJd3kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67438038"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67438038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 07:05:03 -0800
X-CSE-ConnectionGUID: A1Bgp2iTQgKEeBoRrc3jJw==
X-CSE-MsgGUID: /5Bli3K5SH26KW7AUbrSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="220480954"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 07:05:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4hX-000000006Cc-31cy;
	Fri, 12 Dec 2025 15:04:59 +0000
Date: Fri, 12 Dec 2025 23:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36
 r535_nvdec_alloc() warn: 'args' can also be NULL
Message-ID: <202512122247.ikHWVktA-lkp@intel.com>
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
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122247.ikHWVktA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122247.ikHWVktA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36 r535_nvdec_alloc() warn: 'args' can also be NULL

vim +/args +36 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c

142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  25  
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  26  static int
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  27  r535_nvdec_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  28  		 struct nvkm_gsp_object *nvdec)
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  29  {
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  30  	NV_BSP_ALLOCATION_PARAMETERS *args;
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  31  
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  32  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvdec);
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  33  	if (WARN_ON(IS_ERR(args)))
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  34  		return PTR_ERR(args);
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  35  
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19 @36  	args->size = sizeof(*args);
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  37  	args->engineInstance = inst;
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  38  
7c2d25f1e408bb7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  39  	return nvkm_gsp_rm_alloc_wr(nvdec, args);
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  40  }
142cd60243cac1d drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  41  

:::::: The code at line 36 was first introduced by commit
:::::: 142cd60243cac1dfa18d3714ed4dd0cdc3786180 drm/nouveau/nvdec/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
