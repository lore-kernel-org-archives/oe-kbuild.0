Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800A2773EE
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380732; cv=none; b=E12Fs7VN6GSGEAm/RjWCneuFGsewEEg6AfLJOK0POoIEHD3tWUYy0uJq+fZ+BOnmZcGnMQV/fsoBsOheUYjOaEiGeN7l+J31JvehHAL5TCrgfL4Hve4ObSvDhmyHQlq9phG0ghrdtu7pJpyi2z0POrVRyzYdTpeXDDflx1vSmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380732; c=relaxed/simple;
	bh=6bYgIWsei+L0+gghMczvwn/zNWtS/7Ah4VVamfJ59Ic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rX2eC3P3OM2VAcQQUbhLsd907ZXBiVkMMF3HsQ3eySUbvDmMcVVfvBPf9eT4VBamRvP+ukbIBBLsr2jZhNp3kIbjzYgDE6KtjcD4ZP/E4qWuLrH8YI+lWCooQaS5mfAkVwINQNhArBkwum9LSzobU0vgPMlljs6utoonKekloas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS/juORj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS/juORj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774380730; x=1805916730;
  h=date:from:to:cc:subject:message-id;
  bh=6bYgIWsei+L0+gghMczvwn/zNWtS/7Ah4VVamfJ59Ic=;
  b=YS/juORjAY/sAt0QMN3rou0zI7NGrSJpDbMPuaNFESrpAytmI5g0s1Co
   w4tk6e4BLK6DFpLS3224FeBsvTRvojc040Bjuq0lT3mq3fYqsoProh1kB
   u56cpGwUK3urWjTx0Qxhln5Bw1Xdu5DrD13KxRpENTYE49pA4ygMp+oWx
   cLI0FwgPe/eyj6P1cE7IFp8QvQtS1Ih1fZYV0QtWomJ/nHNsOy3Dqp3S0
   dJyh5TzY2sYyboXvKkyJ0asW+v1S27IjBce96xNBXwSvquCrNjxlWGQoR
   Uvp850eNQSH4NuyFKa06KTaXked9xI5H14ck3LhkgNtO37Vw5skESPVMJ
   g==;
X-CSE-ConnectionGUID: h/Z7fkNOQ1aS724g/t9E/w==
X-CSE-MsgGUID: 79Ne530TSEKyYuyIJo1hxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92793518"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92793518"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 12:32:07 -0700
X-CSE-ConnectionGUID: RKAxJQ/bTJeWoWzeenGoOg==
X-CSE-MsgGUID: JO6eH0lUS7aqlvIwBCmhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247502702"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 12:32:05 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w57Tu-000000005Lj-4Aaa;
	Tue, 24 Mar 2026 19:32:02 +0000
Date: Wed, 25 Mar 2026 03:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c:42
 r535_mmu_vaspace_new() warn: 'args' can also be NULL
Message-ID: <202603250340.t8xXruKY-lkp@intel.com>
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
commit: 53dac0623853457ec7564152528b686b8d5dfabe drm/nouveau/gsp: add support for 570.144
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/archive/20260325/202603250340.t8xXruKY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603250340.t8xXruKY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c:42 r535_mmu_vaspace_new() warn: 'args' can also be NULL

vim +/args +42 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c

5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  25  
53dac062385345 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c Ben Skeggs 2024-11-14  26  int
53dac062385345 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c Ben Skeggs 2024-11-14  27  r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  28  {
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  29  	NV_VASPACE_ALLOCATION_PARAMETERS *args;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  30  	int ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  31  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  32  	ret = nvkm_gsp_client_device_ctor(vmm->mmu->subdev.device->gsp,
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  33  					  &vmm->rm.client, &vmm->rm.device);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  34  	if (ret)
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  35  		return ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  36  
53dac062385345 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c Ben Skeggs 2024-11-14  37  	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, handle, FERMI_VASPACE_A,
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  38  				     sizeof(*args), &vmm->rm.object);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  39  	if (IS_ERR(args))
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  40  		return PTR_ERR(args);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  41  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19 @42  	args->index = NV_VASPACE_ALLOCATION_INDEX_GPU_NEW;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  43  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  44  	ret = nvkm_gsp_rm_alloc_wr(&vmm->rm.object, args);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  45  	if (ret)
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  46  		return ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  47  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  48  	{
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  49  		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  50  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  51  		mutex_lock(&vmm->mutex.vmm);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  52  		ret = nvkm_vmm_get_locked(vmm, true, false, false, 0x1d, 32, 0x20000000,
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  53  					  &vmm->rm.rsvd);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  54  		mutex_unlock(&vmm->mutex.vmm);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  55  		if (ret)
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  56  			return ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  57  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  58  		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.object,
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  59  					    NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES,
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  60  					    sizeof(*ctrl));
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  61  		if (IS_ERR(ctrl))
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  62  			return PTR_ERR(ctrl);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  63  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  64  		ctrl->pageSize = 0x20000000;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  65  		ctrl->virtAddrLo = vmm->rm.rsvd->addr;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  66  		ctrl->virtAddrHi = vmm->rm.rsvd->addr + vmm->rm.rsvd->size - 1;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  67  		ctrl->numLevelsToCopy = vmm->pd->pde[0]->pde[0] ? 3 : 2;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  68  		ctrl->levels[0].physAddress = vmm->pd->pt[0]->addr;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  69  		ctrl->levels[0].size = 0x20;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  70  		ctrl->levels[0].aperture = 1;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  71  		ctrl->levels[0].pageShift = 0x2f;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  72  		ctrl->levels[1].physAddress = vmm->pd->pde[0]->pt[0]->addr;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  73  		ctrl->levels[1].size = 0x1000;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  74  		ctrl->levels[1].aperture = 1;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  75  		ctrl->levels[1].pageShift = 0x26;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  76  		if (vmm->pd->pde[0]->pde[0]) {
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  77  			ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  78  			ctrl->levels[2].size = 0x1000;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  79  			ctrl->levels[2].aperture = 1;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  80  			ctrl->levels[2].pageShift = 0x1d;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  81  		}
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  82  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  83  		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  84  	}
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  85  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  86  	return ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  87  }
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c        Ben Skeggs 2023-09-19  88  

:::::: The code at line 42 was first introduced by commit
:::::: 5bf0257136a223d0e887441799527b320fc8313f drm/nouveau/mmu/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
