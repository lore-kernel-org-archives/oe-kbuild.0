Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3C13D51E
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637152; cv=none; b=JqtxT5HR5bDo2ByUz4HdsbKn3YDxGXPST8+NtdX5uzI29o9C2Dx/veCtd4Ulh4E1JUco6NdwWEYJHeODhL0l4Fbdhjn9fruvVpYZe93oTBHtUU0EomrXmmiQ3YVgZbW9oToAkBQRkCOf7iVhvwdIojZ0s3ffDUVL1iphm7ZsyMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637152; c=relaxed/simple;
	bh=v8ta+/VvELDcRTkr9jEXGGxtDwT7aeqwsOLoqooqNac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqrdh5dq7yk7wq4Ih09jPAZEwSCTpHDqnp6leTgPREphBFPg4ComPOQNFIEEyvc2wkrn/f+u4kgqMtKepuWbNEa8YFgAt+HDBZmhF/GRoNbGGwmb1GxcaBdSDcZ1wcc5pU9CvQhBoZcDfoOvy+SAjMBVSEnDl8VqWADLhbS/GPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvMcnBuJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvMcnBuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637151; x=1797173151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8ta+/VvELDcRTkr9jEXGGxtDwT7aeqwsOLoqooqNac=;
  b=cvMcnBuJHnSBYJD+pfXwH+f03X6YyYvw8KJX2c26rDzhuF3ct9rTL56t
   dx9l/m/yzlDwPCBuV4KXdSV8/Zb/HyRfxu6/F8NJ8VxW8/FNTAnAEn4yl
   Rw+aBTzkFatXy/mtqqWKXsFL2EaKJfSs+XA9Kezty5Yt8HbRHoCBdkaDE
   ahPkxDpF3hkNYP9QNx9tSaExmO3gtuQI2vrt6G7DUoRMOU5wSZxdxmb2v
   nE+zc+rEYw3OJQmWy5VAnpx3RDSgt+zvPkxT/qmMaxYQ+L05OPP1zYgvr
   QyyTUYsg4tc7eoSVE8+frqP2nQ6VMcUSRZKdNc+J/nDEgWiC+usQCt3KI
   A==;
X-CSE-ConnectionGUID: ExmIQv69SAe+3CA8OKnRXg==
X-CSE-MsgGUID: m+b6vgS5S2Oiwx7BZABc/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85020531"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85020531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: 1SuckUmsT/SJ1ZZipMgDFA==
X-CSE-MsgGUID: UG4Z+VGpRpSIeGgB3qmixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196604545"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 06:45:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007ka-112n;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c:42
 r535_mmu_vaspace_new() warn: 'args' can also be NULL
Message-ID: <202512132208.HueINJYw-lkp@intel.com>
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
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512132208.HueINJYw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132208.HueINJYw-lkp@intel.com/

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
