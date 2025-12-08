Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63591FA859
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765237524; cv=none; b=j8da8WL/bcu9U9dgBGSyuTqOf/EG+Q9JoFocCj3Sdn9Jve09Oh1xVWV7h4/7PLxkRgR3Kt6npSBHOdld0XyGPrxMGyqVJarhpluavWGBaXrIpmt+0D/GaJbHN5MVoUIn/ez50Dj1bkRENus5KoQacWHVkae3B15ZUWzPcNlHQx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765237524; c=relaxed/simple;
	bh=O0EfVmvcpVkbir/M8mXvc3rLMV4JK/1HdIAuJLYbJFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UmLSUBmGR05tE8ClJSA+QT92BKf9Giu3rz5Mt3/U1KLu5fUxLV6+COFyANQN9bvCdxc8BCmk3TxIP8AaJW8iWsOBqsdyvC631+mv8dcw2ZffXe6DhmzF508GFC9Oo+kM1COHzR40OBLJIFWjL3mOq9wFjQHCLRek3CZJdZIPrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaM+wXMv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaM+wXMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765237521; x=1796773521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0EfVmvcpVkbir/M8mXvc3rLMV4JK/1HdIAuJLYbJFs=;
  b=JaM+wXMvL/MqYpFixglb3aGSTAJWERPdMjwLStbN+ijWuBqZc57rUM7o
   Zk9EYivINZhR3nyiyd7yBCKPTyne0Wfqs5s9C4CXLf95xSni6aP83WrCY
   pcHvSLS5YAAVhAovnxYERx0xsGLeEEmyCSEmKPyBjM1JNHxltu2RpIe1b
   oY2qpvAtGRUsUG45dTHCk9oqwDE6Hw9Rm72oKpEyo0FnoMxc+4VO/dkCH
   Je213PlCrjgaoUy8yjQel+Ydwy7q/uuxuA+N9338sgC985k6BJNlqkuvP
   5l2Roz/vA2UN0DrrLpM+PYE7nshdgtbyyxQyRJ623jL/4lH4v25IB5Qsd
   A==;
X-CSE-ConnectionGUID: ty/jq/isRjaQRQdfBqvqQg==
X-CSE-MsgGUID: +WwyVeJZTKauM/e7NegeJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67073301"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67073301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 15:45:20 -0800
X-CSE-ConnectionGUID: n3Vym3MlRvmtb4YE410wXQ==
X-CSE-MsgGUID: HjaYevs+TrmLVm172l9mdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195350226"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2025 15:45:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSkuq-000000000zH-0ftq;
	Mon, 08 Dec 2025 23:45:16 +0000
Date: Tue, 9 Dec 2025 07:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a8xx_gpu.c:255 a8xx_set_cp_protect()
 error: uninitialized symbol 'final_cfg'.
Message-ID: <202512090746.yHMo8Q3l-lkp@intel.com>
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
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a110f942672c8995dc1cacb5a44c6730856743aa
commit: 288a932008925644d8d0ca69bf7a69a0dce82dc5 drm/msm/adreno: Introduce A8x GPU Support
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251209/202512090746.yHMo8Q3l-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512090746.yHMo8Q3l-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a8xx_gpu.c:255 a8xx_set_cp_protect() error: uninitialized symbol 'final_cfg'.

vim +/final_cfg +255 drivers/gpu/drm/msm/adreno/a8xx_gpu.c

288a9320089256 Akhil P Oommen 2025-11-18  221  
288a9320089256 Akhil P Oommen 2025-11-18  222  static void a8xx_set_cp_protect(struct msm_gpu *gpu)
288a9320089256 Akhil P Oommen 2025-11-18  223  {
288a9320089256 Akhil P Oommen 2025-11-18  224  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
288a9320089256 Akhil P Oommen 2025-11-18  225  	const struct adreno_protect *protect = adreno_gpu->info->a6xx->protect;
288a9320089256 Akhil P Oommen 2025-11-18  226  	u32 cntl, final_cfg;
288a9320089256 Akhil P Oommen 2025-11-18  227  	unsigned int i;
288a9320089256 Akhil P Oommen 2025-11-18  228  
288a9320089256 Akhil P Oommen 2025-11-18  229  	cntl = A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_PROT_EN |
288a9320089256 Akhil P Oommen 2025-11-18  230  		A8XX_CP_PROTECT_CNTL_PIPE_ACCESS_FAULT_ON_VIOL_EN |
288a9320089256 Akhil P Oommen 2025-11-18  231  		A8XX_CP_PROTECT_CNTL_PIPE_LAST_SPAN_INF_RANGE |
288a9320089256 Akhil P Oommen 2025-11-18  232  		A8XX_CP_PROTECT_CNTL_PIPE_HALT_SQE_RANGE__MASK;
288a9320089256 Akhil P Oommen 2025-11-18  233  	/*
288a9320089256 Akhil P Oommen 2025-11-18  234  	 * Enable access protection to privileged registers, fault on an access
288a9320089256 Akhil P Oommen 2025-11-18  235  	 * protect violation and select the last span to protect from the start
288a9320089256 Akhil P Oommen 2025-11-18  236  	 * address all the way to the end of the register address space
288a9320089256 Akhil P Oommen 2025-11-18  237  	 */
288a9320089256 Akhil P Oommen 2025-11-18  238  	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
288a9320089256 Akhil P Oommen 2025-11-18  239  	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_CNTL_PIPE, cntl);
288a9320089256 Akhil P Oommen 2025-11-18  240  
288a9320089256 Akhil P Oommen 2025-11-18  241  	a8xx_aperture_clear(gpu);
288a9320089256 Akhil P Oommen 2025-11-18  242  
288a9320089256 Akhil P Oommen 2025-11-18  243  	for (i = 0; i < protect->count; i++) {
288a9320089256 Akhil P Oommen 2025-11-18  244  		/* Intentionally skip writing to some registers */
288a9320089256 Akhil P Oommen 2025-11-18  245  		if (protect->regs[i]) {
288a9320089256 Akhil P Oommen 2025-11-18  246  			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
288a9320089256 Akhil P Oommen 2025-11-18  247  			final_cfg = protect->regs[i];
288a9320089256 Akhil P Oommen 2025-11-18  248  		}
288a9320089256 Akhil P Oommen 2025-11-18  249  	}
288a9320089256 Akhil P Oommen 2025-11-18  250  
288a9320089256 Akhil P Oommen 2025-11-18  251  	/*
288a9320089256 Akhil P Oommen 2025-11-18  252  	 * Last span feature is only supported on PIPE specific register.
288a9320089256 Akhil P Oommen 2025-11-18  253  	 * So update those here
288a9320089256 Akhil P Oommen 2025-11-18  254  	 */
288a9320089256 Akhil P Oommen 2025-11-18 @255  	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
288a9320089256 Akhil P Oommen 2025-11-18  256  	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
288a9320089256 Akhil P Oommen 2025-11-18  257  
288a9320089256 Akhil P Oommen 2025-11-18  258  	a8xx_aperture_clear(gpu);
288a9320089256 Akhil P Oommen 2025-11-18  259  }
288a9320089256 Akhil P Oommen 2025-11-18  260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
