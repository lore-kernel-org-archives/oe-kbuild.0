Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE92AD00
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 03:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891697; cv=none; b=taSmV+w63K6dANyf/KsSuj1xw51YutjV2k5DSMTO1+jFDSUuC6gt8F7W5Ky5f+iLZeXp8EDFrqvDE7l9un66+/hm6FMLh93API37ZQj6oafBlM6ekWcHs9xD+vv1gUI10zGyf/Pealnoj6rlOq55ZLKPaZtQsNFDQ/WF62BJjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891697; c=relaxed/simple;
	bh=wW/4Ut0xLZdf1BbxX/0/XbcNl+Jld2wO0+LHH0sJrDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o3Z0MswwMeXui1ltyKFg4YtE3jLAwJ0CBzQNbxv08XgIhUNu7O3pafVSlhtLETxemcvU6k856y9TIAa0Rj6gGrBlwHYMdA6+h40MAl5d74JkGq68sBxhnueJL8HQcB39uRRw6gHT1hN3P+mUamET6wPMB068mL3Tw82z8s6yGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8IqrA14; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8IqrA14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773891695; x=1805427695;
  h=date:from:to:cc:subject:message-id;
  bh=wW/4Ut0xLZdf1BbxX/0/XbcNl+Jld2wO0+LHH0sJrDY=;
  b=L8IqrA14/lofcNyW3/bjo3+LpGQMkZMr0x+z78EN/RnH9RfdPzy1wck7
   Cyh84lJ8aA8OvMomsjZqjUkMMXBLcCeAlhCA/HYejnoZ1e1stxa6SrAIY
   xiqJ286KkxSHyoX3tlvCqrwCuZtPg39P9PzE8gJgi97yNcJvoh10a2TE0
   K4ySG02zbtO9lzEYTW2jmZGZrRq62442tOgtdCY5aLc7ajOTI5FW+Rdw7
   8oSs6eaIrxTM/91w2uJlFgkNt428IMQvcUJOoLH6aJ9NQp6S4R5OqOqYX
   c6g6nuIBSCn+zPuMdRBB6rufJyfLCjqrPeaNj5HBKVvTO8M6vcKRIL1j6
   Q==;
X-CSE-ConnectionGUID: W39GQgPnSG6Q1PeJgYBIeA==
X-CSE-MsgGUID: Ke0MhQn6S9OkbmEfTCOw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75037636"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75037636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 20:41:35 -0700
X-CSE-ConnectionGUID: iq1mZq3zRFWwwQvNxI2U5Q==
X-CSE-MsgGUID: LqNPvnnkSPmL4jo/N+oUiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227535586"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 20:41:34 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w34GJ-000000000GB-2gO5;
	Thu, 19 Mar 2026 03:41:31 +0000
Date: Thu, 19 Mar 2026 11:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init()
 warn: variable dereferenced before check 'pdev' (see line 525)
Message-ID: <202603191102.hueYyyPw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191102.hueYyyPw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603191102.hueYyyPw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)

vim +/pdev +530 drivers/gpu/drm/msm/adreno/a3xx_gpu.c

70c70f091b1ffd Rob Clark      2014-05-30  517  
491fadb2b818e1 Akhil P Oommen 2025-11-18  518  static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
7198e6b03155f6 Rob Clark      2013-07-19  519  {
7198e6b03155f6 Rob Clark      2013-07-19  520  	struct a3xx_gpu *a3xx_gpu = NULL;
55459968176f13 Rob Clark      2013-12-05  521  	struct adreno_gpu *adreno_gpu;
7198e6b03155f6 Rob Clark      2013-07-19  522  	struct msm_gpu *gpu;
060530f1ea6740 Rob Clark      2014-03-03  523  	struct msm_drm_private *priv = dev->dev_private;
060530f1ea6740 Rob Clark      2014-03-03  524  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @525  	struct adreno_platform_config *config = pdev->dev.platform_data;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  526  	struct icc_path *ocmem_icc_path;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  527  	struct icc_path *icc_path;
7198e6b03155f6 Rob Clark      2013-07-19  528  	int ret;
7198e6b03155f6 Rob Clark      2013-07-19  529  
7198e6b03155f6 Rob Clark      2013-07-19 @530  	if (!pdev) {
6a41da17e87dee Mamta Shukla   2018-10-20  531  		DRM_DEV_ERROR(dev->dev, "no a3xx device\n");
7198e6b03155f6 Rob Clark      2013-07-19  532  		ret = -ENXIO;
7198e6b03155f6 Rob Clark      2013-07-19  533  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  534  	}
7198e6b03155f6 Rob Clark      2013-07-19  535  
7198e6b03155f6 Rob Clark      2013-07-19  536  	a3xx_gpu = kzalloc(sizeof(*a3xx_gpu), GFP_KERNEL);
7198e6b03155f6 Rob Clark      2013-07-19  537  	if (!a3xx_gpu) {
7198e6b03155f6 Rob Clark      2013-07-19  538  		ret = -ENOMEM;
7198e6b03155f6 Rob Clark      2013-07-19  539  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  540  	}
7198e6b03155f6 Rob Clark      2013-07-19  541  
55459968176f13 Rob Clark      2013-12-05  542  	adreno_gpu = &a3xx_gpu->base;
55459968176f13 Rob Clark      2013-12-05  543  	gpu = &adreno_gpu->base;
7198e6b03155f6 Rob Clark      2013-07-19  544  
70c70f091b1ffd Rob Clark      2014-05-30  545  	gpu->perfcntrs = perfcntrs;
70c70f091b1ffd Rob Clark      2014-05-30  546  	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
70c70f091b1ffd Rob Clark      2014-05-30  547  
3bcefb0497f9fc Rob Clark      2014-09-05  548  	adreno_gpu->registers = a3xx_registers;
3bcefb0497f9fc Rob Clark      2014-09-05  549  
491fadb2b818e1 Akhil P Oommen 2025-11-18  550  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
7198e6b03155f6 Rob Clark      2013-07-19  551  	if (ret)
7198e6b03155f6 Rob Clark      2013-07-19  552  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  553  
55459968176f13 Rob Clark      2013-12-05  554  	/* if needed, allocate gmem: */
3d6ab124a4d5de Luca Weiss     2024-01-21  555  	if (adreno_is_a330(adreno_gpu) || adreno_is_a305b(adreno_gpu)) {
26c0b26dcd005d Brian Masney   2019-08-23  556  		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
26c0b26dcd005d Brian Masney   2019-08-23  557  					    adreno_gpu, &a3xx_gpu->ocmem);
26c0b26dcd005d Brian Masney   2019-08-23  558  		if (ret)
26c0b26dcd005d Brian Masney   2019-08-23  559  			goto fail;
55459968176f13 Rob Clark      2013-12-05  560  	}
55459968176f13 Rob Clark      2013-12-05  561  
5785dd7a8ef0de Akhil P Oommen 2020-10-28  562  	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
3eda901995371d Dan Carpenter  2021-10-01  563  	if (IS_ERR(icc_path)) {
3eda901995371d Dan Carpenter  2021-10-01  564  		ret = PTR_ERR(icc_path);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  565  		goto fail;
3eda901995371d Dan Carpenter  2021-10-01  566  	}
5785dd7a8ef0de Akhil P Oommen 2020-10-28  567  
5785dd7a8ef0de Akhil P Oommen 2020-10-28  568  	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
3eda901995371d Dan Carpenter  2021-10-01  569  	if (IS_ERR(ocmem_icc_path)) {
3eda901995371d Dan Carpenter  2021-10-01  570  		ret = PTR_ERR(ocmem_icc_path);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  571  		/* allow -ENODATA, ocmem icc is optional */
5785dd7a8ef0de Akhil P Oommen 2020-10-28  572  		if (ret != -ENODATA)
5785dd7a8ef0de Akhil P Oommen 2020-10-28  573  			goto fail;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  574  		ocmem_icc_path = NULL;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  575  	}
5785dd7a8ef0de Akhil P Oommen 2020-10-28  576  
5785dd7a8ef0de Akhil P Oommen 2020-10-28  577  
d163ba0b65f2e4 Brian Masney   2019-11-21  578  	/*
d163ba0b65f2e4 Brian Masney   2019-11-21  579  	 * Set the ICC path to maximum speed for now by multiplying the fastest
d163ba0b65f2e4 Brian Masney   2019-11-21  580  	 * frequency by the bus width (8). We'll want to scale this later on to
d163ba0b65f2e4 Brian Masney   2019-11-21  581  	 * improve battery life.
d163ba0b65f2e4 Brian Masney   2019-11-21  582  	 */
5785dd7a8ef0de Akhil P Oommen 2020-10-28  583  	icc_set_bw(icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  584  	icc_set_bw(ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
d163ba0b65f2e4 Brian Masney   2019-11-21  585  
871d812aa43e63 Rob Clark      2013-11-16  586  	return gpu;
7198e6b03155f6 Rob Clark      2013-07-19  587  
7198e6b03155f6 Rob Clark      2013-07-19  588  fail:
7198e6b03155f6 Rob Clark      2013-07-19  589  	if (a3xx_gpu)
7198e6b03155f6 Rob Clark      2013-07-19  590  		a3xx_destroy(&a3xx_gpu->base.base);
7198e6b03155f6 Rob Clark      2013-07-19  591  
7198e6b03155f6 Rob Clark      2013-07-19  592  	return ERR_PTR(ret);
7198e6b03155f6 Rob Clark      2013-07-19  593  }
491fadb2b818e1 Akhil P Oommen 2025-11-18  594  

:::::: The code at line 530 was first introduced by commit
:::::: 7198e6b03155f6dadecadba004eb83b81a6ffe4c drm/msm: add a3xx gpu support

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
