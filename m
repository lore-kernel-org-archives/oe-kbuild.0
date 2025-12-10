Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A79721CC44
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765346871; cv=none; b=nf5IaG9eTJ4kjD4pRtv8Ai4BBLYD81VCts5yDPFr9N4R6+ddk2CTM8fLA6KjTDiMtehrmeWo6l2D15BVeMJaVE3V1dWozu8iKRh0WNYQXrbi2yrzugii1EeYzbEJlKM5yxq5aYHWIo32J9knlt4TfCzmVmsQByD1EQYX0OsINlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765346871; c=relaxed/simple;
	bh=Aoa8RLFaF5XHrGW8Fcjnz8gFSVLGB+Mn9vU6vUuBjJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss4VsasDXp+UD7qBkt81T7eBQRFdpjVU3lYMmpxmh9cPAuRPm9PFaiQQkuzYbeb5xc7OkxJC1QyEDdiHkL+cxQ/dWEPQBxpxAesuOtDQkcQa9fyO7POmzhV9x30Surn9G9WkbYtMW5MYCYTBVleEXZECpNX2MKWt46YnJm9RRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F33LMNnE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F33LMNnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765346869; x=1796882869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aoa8RLFaF5XHrGW8Fcjnz8gFSVLGB+Mn9vU6vUuBjJ0=;
  b=F33LMNnE15N2S+4n0aqZ/LeOBIxT4s/dikUkQo+FI+CzcDbZ1E70j/Nd
   e+cOL4rSB9U0PX5vQOXmjGODwwn3oLpsrK2gszUQSCaQfhqH/qY6p5Dfl
   KuD1r90xlauWjYP8j7cozejletGNB8M6yMFVbyTwhw53mSn5PgTaRF3XZ
   9ZWik3FvZyYPHRt02AeH2HQ7OZEv8/m/SUeoxUx3iI62ztec8ZS+5qe/Q
   un1tpfPIBQlo4NMo5T0T9XBMSbtIJ+DtXPpo/VXXcQPTPIDVqgIzAdoUh
   VdnzAfqR/f+7E6rme3POE1jZqPx4bXh3wC7RdRnSxmaSA/4KNd/CJ3EwP
   g==;
X-CSE-ConnectionGUID: KpC0z01NQ/mVNGReDTnQew==
X-CSE-MsgGUID: /n+J99HcS0GBIIhIptfWeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67387804"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67387804"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 22:07:49 -0800
X-CSE-ConnectionGUID: qzgGicEmTO2h3K4wyRMohw==
X-CSE-MsgGUID: ckh1yUFMTSSXeP1RxC4TCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="201538954"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2025 22:07:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTDMW-000000002j4-42FS;
	Wed, 10 Dec 2025 06:07:44 +0000
Date: Wed, 10 Dec 2025 14:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a8xx_gpu.c:255 a8xx_set_cp_protect()
 error: uninitialized symbol 'final_cfg'.
Message-ID: <202512101331.7lvdnT3K-lkp@intel.com>
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
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: 288a932008925644d8d0ca69bf7a69a0dce82dc5 drm/msm/adreno: Introduce A8x GPU Support
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251210/202512101331.7lvdnT3K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512101331.7lvdnT3K-lkp@intel.com/

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
