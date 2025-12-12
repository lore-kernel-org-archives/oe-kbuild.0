Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A63128B7
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530708; cv=none; b=Qbwlvllp+PmuxV4OkOepPTbYq+tWpVlXwhmtS49w8f3XPuWjTzEb+GI0APrOPmcOM06GATm0Mrx/59wp6li7Z4d+yTjhUu2IEdC+BQsqlxgXG10iBJPmx5/7WT0wfl/ZcmyAmCmytu9QhEyZgXQEAqEk+IXeIGXg0inGmgk/7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530708; c=relaxed/simple;
	bh=VmnzL3AFz0f6xzt/ze8KEr4/Yf6Ln/mOSLCkOui2ZiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i12gM3+zGw9VRa61jU/TeEMmHw4g8+agklY9wJNobpygD5Rst8bJDqdxBn+4df/zZwH5Ii6ZcfPlGEhMmzMJKqPF2Y9jh10hlxZPc9VpdLSmok1dEw+OhvAwSOS5stAgA/yF45sN0yK89j7dvwzfYV9aa973D6DnwHzB/5Cqk7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTs+s/Bl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTs+s/Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765530706; x=1797066706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmnzL3AFz0f6xzt/ze8KEr4/Yf6Ln/mOSLCkOui2ZiQ=;
  b=cTs+s/BlNriS5cYUWk5lvnD8jW4Nc9o599tmXLa5UCYiMoLpgaQdUobQ
   MFDCpcJehsi5nF75GUB+Qu0eEnb4fEKA2ZYPQorTanuo3yibqOMDALUfQ
   9VRDjWOC8Gqz21ECVvbG0zLMF+slKxuNWZduVNt09XxK1y1fKUFdRO/O7
   lG2A1u4XOLiT6rdWqrTXIYHohUhyya8E7jwkW7Abh2y3NJULuhekgfdpi
   64uFg5AQbfWcwkSoSbIvzZAMkS0lcNuFBcEktbHaR9NjAG5aKShzVBbhB
   qJ/aN/RvRB2KHOOPkcJyHdMWhdb/vVzqcbJONznIEE3I8jwzc89jVII7k
   g==;
X-CSE-ConnectionGUID: GISVmeeySPKztzQ8S1/KiA==
X-CSE-MsgGUID: RDSPQRQuTtKL2r0nqRRvXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67595690"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67595690"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:11:44 -0800
X-CSE-ConnectionGUID: xYnl/fHYSxiGA7QuTV1uHw==
X-CSE-MsgGUID: HRYS9v3ZSImztk+MuRf8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196119182"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 01:11:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzBc-000000005qZ-0yUQ;
	Fri, 12 Dec 2025 09:11:40 +0000
Date: Fri, 12 Dec 2025 17:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c:96
 r535_bar_bar2_init() error: we previously assumed 'bar->flushFBZero' could
 be null (see line 83)
Message-ID: <202512121733.3McmkP2W-lkp@intel.com>
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
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   7 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121733.3McmkP2W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121733.3McmkP2W-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c:96 r535_bar_bar2_init() error: we previously assumed 'bar->flushFBZero' could be null (see line 83)

vim +96 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c

5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  72  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  73  static void
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  74  r535_bar_bar2_init(struct nvkm_bar *bar)
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  75  {
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  76  	struct nvkm_device *device = bar->subdev.device;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  77  	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  78  	struct nvkm_gsp *gsp = device->gsp;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  79  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  80  	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->pd->pde[0]->pt[0]->addr));
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  81  	vmm->rm.bar2_pdb = gsp->bar.rm_bar2_pdb;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  82  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19 @83  	if (!bar->flushFBZero) {
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  84  		struct nvkm_memory *fbZero;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  85  		int ret;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  86  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  87  		ret = nvkm_ram_wrap(device, 0, 0x1000, &fbZero);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  88  		if (ret == 0) {
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  89  			ret = nvkm_memory_kmap(fbZero, &bar->flushFBZero);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  90  			nvkm_memory_unref(&fbZero);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  91  		}
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  92  		WARN_ON(ret);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  93  	}
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  94  
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  95  	bar->bar2 = true;
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19 @96  	bar->flushBAR2 = nvkm_kmap(bar->flushFBZero);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  97  	WARN_ON(!bar->flushBAR2);
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  98  }
5bf0257136a223 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c Ben Skeggs 2023-09-19  99  

:::::: The code at line 96 was first introduced by commit
:::::: 5bf0257136a223d0e887441799527b320fc8313f drm/nouveau/mmu/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
