Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC1830C360
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292267; cv=none; b=YpO6uMAkb2hmOJxuyQOuDPjxh5tVX/1bm8Dig4YyasRrnQaJi1FxnetSc7DH7cINkJb84ajg/vWBexb+b5k95SDm9LZWvhOpwF+cQsTPdXUBU8/zyN6Agf0pxmMzZefsOQRv4d46kYa8c4t+mSPnfIgvjGBjlsn44GGXLXW4D3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292267; c=relaxed/simple;
	bh=tHeVSh7SFVI3iQWkIP78nrJug/852aXKmZqVfUPjWEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GcKb1YjTgRt/Viucyf9hhGwnVwDqwmtBIez/I2mt87eLnAyUHitae7dYmmdicPL3S1Iq/Aes4pl8n/FXAScNpDLoCw05x5xATe1HvedLfZtrl3QfAg1hus3/4lk4TyEddch9DC3eIbjzrKGjDUDHAw61YqGB5OSD17VmDITnsAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TToeaFzg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TToeaFzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774292263; x=1805828263;
  h=date:from:to:cc:subject:message-id;
  bh=tHeVSh7SFVI3iQWkIP78nrJug/852aXKmZqVfUPjWEw=;
  b=TToeaFzgsf1UQ6Vrv3hnPChUoPxD9wsTP9bsQ3Y6yJt385fuCqLOZmJi
   PYyCDNkcPUQgxYmZoJ59YdJWolsEXLVnv/ps17zLVnfWB5rxo5U2SBN9x
   6fYMWBu0a72bpUPAEyAcCjTR9I/SURGKfYMZUNlanZiv7bt1WSX9o6661
   35gVR+G9QcQpJzHOlTeneQg2p5Ntfw2G6UtomLBdy14zzywUR8vDW8aGe
   dnGOmSTVvG/yXmyds9enrKXYKgzWh4UUdfa6yKG3Kj1Khz6KsWZFkC+ba
   /wYap1aCK/U1G+xq2oZNxx6NWylYqAjq0s/ieuZtXkjDd9KSjcsjFc55O
   Q==;
X-CSE-ConnectionGUID: p4V46DPeSKKLnnx6oTf3aA==
X-CSE-MsgGUID: 6bkCHDt1SJ+I1TZSnqtNFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100751805"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100751805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 11:57:40 -0700
X-CSE-ConnectionGUID: LKIvWy4/SiewdPhcXsKpzw==
X-CSE-MsgGUID: v0ItfHHQQlGLkc6VZRcrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="254597748"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2026 11:57:39 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4kT2-0000000035k-1WdZ;
	Mon, 23 Mar 2026 18:57:36 +0000
Date: Tue, 24 Mar 2026 02:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c:96
 r535_bar_bar2_init() error: we previously assumed 'bar->flushFBZero' could be
 null (see line 83)
Message-ID: <202603240248.k6YjSUq6-lkp@intel.com>
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
head:   c369299895a591d96745d6492d4888259b004a9e
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r071-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240248.k6YjSUq6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240248.k6YjSUq6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c:96 r535_bar_bar2_init() error: we previously assumed 'bar->flushFBZero' could be null (see line 83)

vim +96 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c

5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  72  
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  73  static void
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  74  r535_bar_bar2_init(struct nvkm_bar *bar)
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  75  {
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  76  	struct nvkm_device *device = bar->subdev.device;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  77  	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  78  	struct nvkm_gsp *gsp = device->gsp;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  79  
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  80  	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->pd->pde[0]->pt[0]->addr));
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  81  	vmm->rm.bar2_pdb = gsp->bar.rm_bar2_pdb;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  82  
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19 @83  	if (!bar->flushFBZero) {
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  84  		struct nvkm_memory *fbZero;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  85  		int ret;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  86  
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  87  		ret = nvkm_ram_wrap(device, 0, 0x1000, &fbZero);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  88  		if (ret == 0) {
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  89  			ret = nvkm_memory_kmap(fbZero, &bar->flushFBZero);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  90  			nvkm_memory_unref(&fbZero);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  91  		}
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  92  		WARN_ON(ret);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  93  	}
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  94  
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  95  	bar->bar2 = true;
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19 @96  	bar->flushBAR2 = nvkm_kmap(bar->flushFBZero);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  97  	WARN_ON(!bar->flushBAR2);
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  98  }
5bf0257136a223d drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  99  

:::::: The code at line 96 was first introduced by commit
:::::: 5bf0257136a223d0e887441799527b320fc8313f drm/nouveau/mmu/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
