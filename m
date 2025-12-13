Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286D42D29AC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765617990; cv=none; b=slYHRz/9/bNpnnydv8+Ivrd1ckpL/Z2HyNfonGT5UeORicYgElUtz0L5jIuNLe7siYfaPqc0o441yQBpSikSKoQ13bIf95Z50Fk7Ho8aIesF3sb5PhTr4dlleTa3p6UXRg/zBlntTXbe8j+QquhKLyEkdSB38vbO8IBo1Jzz0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765617990; c=relaxed/simple;
	bh=QD1IW4kT3sHZ9Kvhlb41srPgrizBrPfJOOvFP5UgMXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJYsLx1OUbFOgBVSHR3nbL/qHLTRDTWjydFf33vhGGDYY4vt+GSpsnAIIIjCs1iWLcJGAvRqylfEdWSnIpdMhvMk8y64Cocg9hPInLuhxUaLx+I5LB6LAcw1Kbeic2+CAZ42KxWfnZiWZ6D9Zwvf6syFIKv165aSFJUCTOsDxcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwWzzK30; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwWzzK30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765617990; x=1797153990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QD1IW4kT3sHZ9Kvhlb41srPgrizBrPfJOOvFP5UgMXM=;
  b=NwWzzK30nAz47bxJECO08oTHoNmRa0r9nGf6toE+my9wZEyXaKe6LZUU
   1Cxh+vakqLmRGK7Lxhb0Rz9Lsyt8FOttl5zhY2St9SpO7Y3C7WMCKLNEB
   UpHXNDabLCxuFmSFUSh/N8zuYC2IsH0CdntGdk07FOUFkdotn+O+bsJ7f
   ud4bUuJjHIvia8oEm53SeO43xKIXWjKHtzNOwfmvavPN4TP0p8aBPSiY9
   i44Jo+0RfNMAid0l5bf3W/AS+a/jwpsU9NEgeWhpuPeAlwPEjmtiJK8B7
   Qa4h7N3GDGa3bGoMKr0iCSw8P12LqmB2JkTLP9ydK8TZgSkyiwt1g9ebo
   g==;
X-CSE-ConnectionGUID: uTHAeY7BQSmMUgpSlfG20A==
X-CSE-MsgGUID: d23kNtMoTMmYSL20ZxY9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71462994"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71462994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:26:27 -0800
X-CSE-ConnectionGUID: bhB71ZokQFunTETFqF0Nuw==
X-CSE-MsgGUID: zG20pltVTeyBL2onWhdz5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201706055"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 01:26:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULtO-000000007Q3-3y7u;
	Sat, 13 Dec 2025 09:26:22 +0000
Date: Sat, 13 Dec 2025 17:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:178
 r535_dmac_alloc() warn: 'args' can also be NULL
Message-ID: <202512131723.6LBv7CCY-lkp@intel.com>
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
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: f82fb646e12e3f64c4576d8f537b343f16966be9 drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131723.6LBv7CCY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131723.6LBv7CCY-lkp@intel.com/

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
