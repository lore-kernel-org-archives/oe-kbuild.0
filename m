Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A6B4502A
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643886; cv=none; b=hWgAgV2p+MpQNeSo/2FMlWuomF66Pmf9ZywCewOdO4EAYuTLRBOUnLYUpAoKDcIh0eBJjPHKLYS2a3sXwaRnydvSciPD5HGY6R+rnr/hVA/Ot317ATYzx/m2IRGtkoO9rfBb93HbIzZHUpLEBe9CkSSHEUekq6FBZyPTs99gerE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643886; c=relaxed/simple;
	bh=roHUyOFlP7S57+3SFWelCZjlXda6Uy+Ln4yDQft8XJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sqa1YXLUNqH/pozs4m8XWfAljXhm0g8AijKWS5HvxJ+t5uInSFEmERZGCQeyj8lm5fxxuyZwb72ORCJl9XR5mAS4k3/a/FyfQXYvDc2bVXBT/6NPfphNrnbCdECTNQ/gnZ1B8xhi6x3EllNR/jQ0OLICJNcquIqRU1jTSl9Z6ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evFnr3i1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evFnr3i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765643884; x=1797179884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=roHUyOFlP7S57+3SFWelCZjlXda6Uy+Ln4yDQft8XJs=;
  b=evFnr3i1lc7iT5YW0zItrKPmbRNdbFNK9C6HJZHR4etd9Yu7pkZ02CQ9
   gd09RaZz3ra7SpJ6LBgCs7IMopBOB1VZwXrV124k3Y/kaBI41UUTJ58dx
   qd2bB2Y33cTvDDFyx3MEvdbQvUnYlW3gbbUScdxZ0MsB8PWGgbcSZGy51
   P2+ZEQAnOITaozubfs3sH1UP/9j6kK/35wK3Vyqyej03+kbXB7HFlupKR
   fVzsNgMIIJ1RyEZpBaHGiwJfTEy7p5QyYkL/viO7U2Ipfz5LesW5DuOgG
   OwBfMVjE2kmnb/6Tnabp9O7RnaJOW70DvuUWqdLX0IhvPUBm9zpTPoL2G
   A==;
X-CSE-ConnectionGUID: P5sxd0fRT4mcAZA6ee/2xQ==
X-CSE-MsgGUID: Y1k12T9XTjCmz69RtA11BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67366306"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67366306"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:38:04 -0800
X-CSE-ConnectionGUID: td73hzQAR+iQcb65qZUPfQ==
X-CSE-MsgGUID: FCEjquLTTzOXzV5bmF6aLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196954993"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 08:38:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSd6-000000007vV-1V43;
	Sat, 13 Dec 2025 16:38:00 +0000
Date: Sun, 14 Dec 2025 00:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c:87
 r570_gsp_get_static_info() warn: 'rpc' can also be NULL
Message-ID: <202512140048.DLJcyVwd-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 53dac0623853457ec7564152528b686b8d5dfabe drm/nouveau/gsp: add support for 570.144
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140048.DLJcyVwd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140048.DLJcyVwd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c:87 r570_gsp_get_static_info() warn: 'rpc' can also be NULL

vim +/rpc +87 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c

53dac062385345 Ben Skeggs 2024-11-14   72  
53dac062385345 Ben Skeggs 2024-11-14   73  static int
53dac062385345 Ben Skeggs 2024-11-14   74  r570_gsp_get_static_info(struct nvkm_gsp *gsp)
53dac062385345 Ben Skeggs 2024-11-14   75  {
53dac062385345 Ben Skeggs 2024-11-14   76  	GspStaticConfigInfo *rpc;
53dac062385345 Ben Skeggs 2024-11-14   77  	u32 gpc_mask;
53dac062385345 Ben Skeggs 2024-11-14   78  	u32 tpc_mask;
53dac062385345 Ben Skeggs 2024-11-14   79  	int ret;
53dac062385345 Ben Skeggs 2024-11-14   80  
53dac062385345 Ben Skeggs 2024-11-14   81  	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
53dac062385345 Ben Skeggs 2024-11-14   82  	if (IS_ERR(rpc))
53dac062385345 Ben Skeggs 2024-11-14   83  		return PTR_ERR(rpc);
53dac062385345 Ben Skeggs 2024-11-14   84  
53dac062385345 Ben Skeggs 2024-11-14   85  	gsp->internal.client.object.client = &gsp->internal.client;
53dac062385345 Ben Skeggs 2024-11-14   86  	gsp->internal.client.object.parent = NULL;
53dac062385345 Ben Skeggs 2024-11-14  @87  	gsp->internal.client.object.handle = rpc->hInternalClient;
53dac062385345 Ben Skeggs 2024-11-14   88  	gsp->internal.client.gsp = gsp;
53dac062385345 Ben Skeggs 2024-11-14   89  	INIT_LIST_HEAD(&gsp->internal.client.events);
53dac062385345 Ben Skeggs 2024-11-14   90  
53dac062385345 Ben Skeggs 2024-11-14   91  	gsp->internal.device.object.client = &gsp->internal.client;
53dac062385345 Ben Skeggs 2024-11-14   92  	gsp->internal.device.object.parent = &gsp->internal.client.object;
53dac062385345 Ben Skeggs 2024-11-14   93  	gsp->internal.device.object.handle = rpc->hInternalDevice;
53dac062385345 Ben Skeggs 2024-11-14   94  
53dac062385345 Ben Skeggs 2024-11-14   95  	gsp->internal.device.subdevice.client = &gsp->internal.client;
53dac062385345 Ben Skeggs 2024-11-14   96  	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
53dac062385345 Ben Skeggs 2024-11-14   97  	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
53dac062385345 Ben Skeggs 2024-11-14   98  
53dac062385345 Ben Skeggs 2024-11-14   99  	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
53dac062385345 Ben Skeggs 2024-11-14  100  	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
53dac062385345 Ben Skeggs 2024-11-14  101  
53dac062385345 Ben Skeggs 2024-11-14  102  	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
53dac062385345 Ben Skeggs 2024-11-14  103  
53dac062385345 Ben Skeggs 2024-11-14  104  	nvkm_gsp_rpc_done(gsp, rpc);
53dac062385345 Ben Skeggs 2024-11-14  105  
53dac062385345 Ben Skeggs 2024-11-14  106  	ret = r570_gr_gpc_mask(gsp, &gpc_mask);
53dac062385345 Ben Skeggs 2024-11-14  107  	if (ret)
53dac062385345 Ben Skeggs 2024-11-14  108  		return ret;
53dac062385345 Ben Skeggs 2024-11-14  109  
53dac062385345 Ben Skeggs 2024-11-14  110  	for (int gpc = 0; gpc < 32; gpc++) {
53dac062385345 Ben Skeggs 2024-11-14  111  		if (gpc_mask & BIT(gpc)) {
53dac062385345 Ben Skeggs 2024-11-14  112  			ret = r570_gr_tpc_mask(gsp, gpc, &tpc_mask);
53dac062385345 Ben Skeggs 2024-11-14  113  			if (ret)
53dac062385345 Ben Skeggs 2024-11-14  114  				return ret;
53dac062385345 Ben Skeggs 2024-11-14  115  
53dac062385345 Ben Skeggs 2024-11-14  116  			gsp->gr.tpcs += hweight32(tpc_mask);
53dac062385345 Ben Skeggs 2024-11-14  117  			gsp->gr.gpcs++;
53dac062385345 Ben Skeggs 2024-11-14  118  		}
53dac062385345 Ben Skeggs 2024-11-14  119  	}
53dac062385345 Ben Skeggs 2024-11-14  120  
53dac062385345 Ben Skeggs 2024-11-14  121  	return 0;
53dac062385345 Ben Skeggs 2024-11-14  122  }
53dac062385345 Ben Skeggs 2024-11-14  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
