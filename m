Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D82F3C1C
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053294; cv=none; b=O9f3o0wjZdJw0Dk5HpvtuZqaQYRiBMBzLncGbhtfxP8JCLy0AWwRW3lmSH2mmMFwW1k3btquBKdPZcuHLPr1tFgZEikjUD0oC7ED9GvgEp47BCYkvV0ajvGyeHVUTwnf4oTYtOsGXhk98uF7zi6eFjrSWrd7b/N+m7s+UmgqdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053294; c=relaxed/simple;
	bh=w57aaSA8TlCcrdSAMHdAB+bRW0VV81eh4ORnavAiiJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=STYDCF+4x/EjOO9knnqGk82T0s0WKuPhrldA+T7ErgqhzxdH7lBIL5qQQXgv0IH+DCoudA0yhaFtc9hkEr52K8wFgq6xtzteoglJNTz+Koqubuzm8hvkrvE6KJofsTHqoqQzhSwIo2DyAdsONb+ax6XrAGqZfqdQMjfAAgXYAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVzHR45S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVzHR45S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761053293; x=1792589293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w57aaSA8TlCcrdSAMHdAB+bRW0VV81eh4ORnavAiiJk=;
  b=fVzHR45SB0eI73kTNdPp+pY6WoLUKp/mMgmowxH3Bos3EB6nZ/0l1PcZ
   +Z8W/L2wuneI5BH/kUEZMzyU+/1mHCvYCpZ2F54XJcKQSgmjHuXvvAo0f
   XLRXfEU8S4LKuxG3ZD1PSgqH0F4HN2qIxREp+EKaLxJ1I9bQ7IOQIcXnr
   K+tWxmSUyXqLVVuolW+tLkcan+11OyylDqCejsPzh7sDZmKundaF3OFH0
   dW4I94oD10W8TnNWke0EctKOve5GPgpptqfrjg3EHxvJnafUH87QgnMdB
   a/TSu7oceyNPtA8HehncMt1AogoqW104D9LRLWFHEW6izos4yEpB4VOiI
   A==;
X-CSE-ConnectionGUID: 5G2uz/ozQyKprOn5DawBPQ==
X-CSE-MsgGUID: cIvb+KNNTAeXwk9f9n6k+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62385950"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62385950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:28:12 -0700
X-CSE-ConnectionGUID: 7jvxurxiQtmmfOcTlx6yCA==
X-CSE-MsgGUID: L5/wtb0QTf2KaUOfo19Z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183297124"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 06:28:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBCPI-000ArB-2U;
	Tue, 21 Oct 2025 13:28:08 +0000
Date: Tue, 21 Oct 2025 21:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
Message-ID: <202510212140.4YWihsB7-lkp@intel.com>
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
In-Reply-To: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
TO: Rob Clark <robin.clark@oss.qualcomm.com>
TO: Sean Paul <sean@poorly.run>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Dmitry Baryshkov <lumag@kernel.org>
TO: Abhinav Kumar <abhinav.kumar@linux.dev>
TO: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
TO: Marijn Suijten <marijn.suijten@somainline.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: freedreno@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Jie Zhang <quic_jiezh@quicinc.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cb6649f6217c0331b885cf787f1d175963e2a1d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-a6xx-Add-support-for-Adreno-612/20251018-011020
base:   cb6649f6217c0331b885cf787f1d175963e2a1d2
patch link:    https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-1-0baa44f80905%40oss.qualcomm.com
patch subject: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-r073-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212140.4YWihsB7-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510212140.4YWihsB7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a6xx_gpu.c:641 a6xx_set_hwcg() error: uninitialized symbol 'cgc_hyst'.

vim +/cgc_hyst +641 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

af66706accdf5af Konrad Dybcio  2023-09-25  599  
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  600  static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  601  {
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  602  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  603  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  604  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  605  	const struct adreno_reglist *reg;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  606  	unsigned int i;
40c297eb245b1c9 Konrad Dybcio  2024-08-28  607  	u32 cgc_delay, cgc_hyst;
51682bc4abf4b55 Konrad Dybcio  2024-08-28  608  	u32 val, clock_cntl_on;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  609  
dff2f69f3e8a6ea Rob Clark      2024-06-18  610  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  611  		return;
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  612  
66ffb9150b00f3f Jonathan Marek 2020-07-10  613  	if (adreno_is_a630(adreno_gpu))
66ffb9150b00f3f Jonathan Marek 2020-07-10  614  		clock_cntl_on = 0x8aa8aa02;
5cb9695ccef2305 Jie Zhang      2025-10-17  615  	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
e7fc9398e608a7b Konrad Dybcio  2023-06-16  616  		clock_cntl_on = 0xaaa8aa82;
18397519cb62248 Konrad Dybcio  2024-02-23  617  	else if (adreno_is_a702(adreno_gpu))
18397519cb62248 Konrad Dybcio  2024-02-23  618  		clock_cntl_on = 0xaaaaaa82;
66ffb9150b00f3f Jonathan Marek 2020-07-10  619  	else
66ffb9150b00f3f Jonathan Marek 2020-07-10  620  		clock_cntl_on = 0x8aa8aa82;
66ffb9150b00f3f Jonathan Marek 2020-07-10  621  
5cb9695ccef2305 Jie Zhang      2025-10-17  622  	if (adreno_is_a612(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  623  		cgc_delay = 0x11;
5cb9695ccef2305 Jie Zhang      2025-10-17  624  	else if (adreno_is_a615_family(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  625  		cgc_delay = 0x111;
5cb9695ccef2305 Jie Zhang      2025-10-17  626  	else
5cb9695ccef2305 Jie Zhang      2025-10-17  627  		cgc_delay = 0x10111;
5cb9695ccef2305 Jie Zhang      2025-10-17  628  
5cb9695ccef2305 Jie Zhang      2025-10-17  629  	if (adreno_is_a612(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  630  		cgc_hyst = 0x55;
5cb9695ccef2305 Jie Zhang      2025-10-17  631  	else if (adreno_is_a615_family(adreno_gpu))
5cb9695ccef2305 Jie Zhang      2025-10-17  632  		cgc_delay = 0x555;
5cb9695ccef2305 Jie Zhang      2025-10-17  633  	else
5cb9695ccef2305 Jie Zhang      2025-10-17  634  		cgc_delay = 0x5555;
40c297eb245b1c9 Konrad Dybcio  2024-08-28  635  
af66706accdf5af Konrad Dybcio  2023-09-25  636  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
51682bc4abf4b55 Konrad Dybcio  2024-08-28  637  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
af66706accdf5af Konrad Dybcio  2023-09-25  638  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
40c297eb245b1c9 Konrad Dybcio  2024-08-28  639  			state ? cgc_delay : 0);
af66706accdf5af Konrad Dybcio  2023-09-25  640  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
40c297eb245b1c9 Konrad Dybcio  2024-08-28 @641  			state ? cgc_hyst : 0);
af66706accdf5af Konrad Dybcio  2023-09-25  642  
dff2f69f3e8a6ea Rob Clark      2024-06-18  643  	if (!adreno_gpu->info->a6xx->hwcg) {
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  644  		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  645  		gpu_write(gpu, REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  646  
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  647  		if (state) {
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  648  			gpu_write(gpu, REG_A7XX_RBBM_CGC_P2S_TRIG_CMD, 1);
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  649  
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  650  			if (gpu_poll_timeout(gpu, REG_A7XX_RBBM_CGC_P2S_STATUS, val,
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  651  					     val & A7XX_RBBM_CGC_P2S_STATUS_TXDONE, 1, 10)) {
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  652  				dev_err(&gpu->pdev->dev, "RBBM_CGC_P2S_STATUS TXDONE Poll failed\n");
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  653  				return;
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  654  			}
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  655  
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  656  			gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 0);
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  657  		}
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  658  
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  659  		return;
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  660  	}
d2bcca0ccccfa5e Neil Armstrong 2024-02-16  661  
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  662  	val = gpu_read(gpu, REG_A6XX_RBBM_CLOCK_CNTL);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  663  
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  664  	/* Don't re-program the registers if they are already correct */
66ffb9150b00f3f Jonathan Marek 2020-07-10  665  	if ((!state && !val) || (state && (val == clock_cntl_on)))
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  666  		return;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  667  
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  668  	/* Disable SP clock before programming HWCG registers */
18397519cb62248 Konrad Dybcio  2024-02-23  669  	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  670  		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  671  
dff2f69f3e8a6ea Rob Clark      2024-06-18  672  	for (i = 0; (reg = &adreno_gpu->info->a6xx->hwcg[i], reg->offset); i++)
b1c53a2a2d395d4 Jonathan Marek 2020-07-10  673  		gpu_write(gpu, reg->offset, state ? reg->value : 0);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  674  
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  675  	/* Enable SP clock */
18397519cb62248 Konrad Dybcio  2024-02-23  676  	if (!adreno_is_a610_family(adreno_gpu) && !adreno_is_a7xx(adreno_gpu))
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  677  		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  678  
66ffb9150b00f3f Jonathan Marek 2020-07-10  679  	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  680  }
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
