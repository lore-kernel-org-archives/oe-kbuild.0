Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1D61EF36C
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 06:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765607595; cv=none; b=ghxjcxKKPMfzdeQCXlQyYP/FtY5nK9y/72Bbx/MaKY9QdTvxnp/jlzfhJIxAH8S6s21EpY8Z9P0d5LSFED7dyjL8yxyaVfgVFfcUkUqt/kxKwIvmWBmH8j0sOsKm3K9r413KrD6ha9cmy/XlpD/msBvKwtoGViYsII7QBY09ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765607595; c=relaxed/simple;
	bh=VB4MLwgQBGAXaDpTHrgF6gfI/JTJx/HyNRrnVTutqdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W0tLHCkcgj+Y/2VPcD98GfThEQ4vi3KtBZ0ZzMqDzUhFt6ye7LWzPlPOde3zkS+j8P5NwxN5QmZ0ouqAokU/b6j+xwpSEgH370dZ4sMhxZS6xjP4nRBY90+7WmhHqbAFHuuK2hIiu4JbTi0NjZZ5r2eJ0rSB1FLEjRLGVT8ttXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d824ecOZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d824ecOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765607594; x=1797143594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VB4MLwgQBGAXaDpTHrgF6gfI/JTJx/HyNRrnVTutqdE=;
  b=d824ecOZRXCeaYKO2zkvHfuzpTpSrkn9ZwB1NmMNoVaPvO+r5+Y0rNW6
   ZkKpNR9Gllk1LP6Ekpo8Djf6NgoSyt4MNIal+CCLx111UoNeLgCOb0aBf
   mqVYDOc4J/cthuK/wrgsUfyI6zqxWSWg9yfCD3qSdbrq05nQGzPf0MZqN
   rvL7Ec9NSsDYxkCNxe9YWOUUxaUBI2hmJ5SBTnPrjkG70BVi1mSyYRqRt
   2FmoBqOLaJr7RkQgc5hRWouL+zfII2ULgKt0LX4vPZvty1nudZIFRiiER
   E3w6AiN6VtOwzkvMIuaIhcl/ECqQttGjQaCD4TTl4lHDgNPKAJHzjQdCF
   Q==;
X-CSE-ConnectionGUID: ylzehoLbQ4+gQTIcj/ZFwg==
X-CSE-MsgGUID: pfyg7DkzTbaVbfT3GQ+98w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78241655"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78241655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:33:10 -0800
X-CSE-ConnectionGUID: LUs980/4SRqZh7BXXxEV5Q==
X-CSE-MsgGUID: mnqvrGcnTY+NFZkpxeFnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198094477"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 22:33:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJBj-000000007B1-0F3M;
	Sat, 13 Dec 2025 06:33:07 +0000
Date: Sat, 13 Dec 2025 14:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c:214
 r535_gsp_get_static_info() warn: 'rpc' can also be NULL
Message-ID: <202512131447.i5xVtjMu-lkp@intel.com>
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
commit: 7bb77eacdb85d7628a541938f5752528eb1d4029 drm/nouveau/gsp: add hal for gsp.get_static_info()
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-r073-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131447.i5xVtjMu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131447.i5xVtjMu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c:214 r535_gsp_get_static_info() warn: 'rpc' can also be NULL

vim +/rpc +214 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c

7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  202  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  203  static int
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  204  r535_gsp_get_static_info(struct nvkm_gsp *gsp)
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  205  {
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  206  	GspStaticConfigInfo *rpc;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  207  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  208  	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  209  	if (IS_ERR(rpc))
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  210  		return PTR_ERR(rpc);
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  211  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  212  	gsp->internal.client.object.client = &gsp->internal.client;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  213  	gsp->internal.client.object.parent = NULL;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14 @214  	gsp->internal.client.object.handle = rpc->hInternalClient;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  215  	gsp->internal.client.gsp = gsp;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  216  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  217  	gsp->internal.device.object.client = &gsp->internal.client;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  218  	gsp->internal.device.object.parent = &gsp->internal.client.object;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  219  	gsp->internal.device.object.handle = rpc->hInternalDevice;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  220  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  221  	gsp->internal.device.subdevice.client = &gsp->internal.client;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  222  	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  223  	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  224  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  225  	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  226  	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  227  
7bb77eacdb85d7 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c Ben Skeggs 2024-11-14  228  	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  229  
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  230  	for (int gpc = 0; gpc < ARRAY_SIZE(rpc->tpcInfo); gpc++) {
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  231  		if (rpc->gpcInfo.gpcMask & BIT(gpc)) {
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  232  			gsp->gr.tpcs += hweight32(rpc->tpcInfo[gpc].tpcMask);
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  233  			gsp->gr.gpcs++;
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  234  		}
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  235  	}
361c3cd8ae1277 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  236  
4cf2c83eb3a4c4 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  237  	nvkm_gsp_rpc_done(gsp, rpc);
4cf2c83eb3a4c4 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  238  	return 0;
4cf2c83eb3a4c4 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  239  }
4cf2c83eb3a4c4 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c        Ben Skeggs 2023-09-19  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
