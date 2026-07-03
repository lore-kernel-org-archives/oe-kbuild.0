Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA0241C8C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071138; cv=none; b=IQG/uOzYXxMWislUBC7Woz1bZJrU9TbAanK3JEdkXcyeylmT4LiElJZtLOBR1QJoTXgZA2Qn6wENoDfEy19fDnRCnIi4p2mCiteluTRESsFrFRuXYerTTFsc3Oc2oK4L/YXxyZrRvVL8Fd6aaazQWwCVRn0lL50807tVlfnNI4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071138; c=relaxed/simple;
	bh=ta0votAhmtVp82FZHTpheJZzj8MyRZ5U40tlcSKJKxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GP87e3myz/zfT7GtXcXjZZCLgLlAhJWT4XuzFebCqsmB8sIjuSPuBpTuqfBjDwHL5ZQM65mVf2Jtcpx5CywB5vldkvgosRY2sepS6ShvtkwPgQ3Rldc3O6zQ+sHqj2bXzxwN8zdui9yuDZvxMv4CeXBE4U/6ZxzwgsMlPs57GCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWjSpjOb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWjSpjOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783071133; x=1814607133;
  h=date:from:to:cc:subject:message-id;
  bh=ta0votAhmtVp82FZHTpheJZzj8MyRZ5U40tlcSKJKxY=;
  b=TWjSpjOblsqx72lHjY702cQXpxisNAJfKxd1sVyXQvFlHX7uFHZc0fyc
   OndMugHyUOnyCD7KjFR96PhH/n/LOvM11sUnU5VA/NBLjUbzD5Q0VlSbV
   QrLqHvVweGvDILuA3l8yKxdQB8lrjlv9gRgHtmdpwRMnjRL33AkVILMjt
   Rb9gRDB0kAwOMekAT1/oxckwNQqoILwb5jy8LnAdh2L4Tl7F4eFewCsQQ
   Qxze4SmrhjtxCzUqJUx6SZEhliTZPtaPvhGEf5mqCrN0sVD1E6LvmhslL
   XzurYUpFbuZGPvImbtXW/4L20fYTtmE0KF9iJaqN0suC+r3BRhrdC2Inu
   A==;
X-CSE-ConnectionGUID: b/Efgdu5RgmgMI8v+F7utw==
X-CSE-MsgGUID: vxMuCnhEQGmxSUzhEiRSVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95330017"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95330017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:32:12 -0700
X-CSE-ConnectionGUID: zV3Cg+W2Tae30kM4Od2YNQ==
X-CSE-MsgGUID: ZaF+MlK+QTucdQDud4fFFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257960536"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2026 02:32:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaFl-00000000BvR-0Ogl;
	Fri, 03 Jul 2026 09:32:09 +0000
Date: Fri, 03 Jul 2026 17:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init()
 warn: variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202607031755.QZSurBLv-lkp@intel.com>
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
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r072-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031755.QZSurBLv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to catalogue")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031755.QZSurBLv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)

vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c

21af872cd8c695 Jonathan Marek 2018-11-21  492  
491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
21af872cd8c695 Jonathan Marek 2018-11-21  494  {
21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
21af872cd8c695 Jonathan Marek 2018-11-21  502  
21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {
21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
21af872cd8c695 Jonathan Marek 2018-11-21  508  
21af872cd8c695 Jonathan Marek 2018-11-21  509  	a2xx_gpu = kzalloc(sizeof(*a2xx_gpu), GFP_KERNEL);
21af872cd8c695 Jonathan Marek 2018-11-21  510  	if (!a2xx_gpu) {
21af872cd8c695 Jonathan Marek 2018-11-21  511  		ret = -ENOMEM;
21af872cd8c695 Jonathan Marek 2018-11-21  512  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  513  	}
21af872cd8c695 Jonathan Marek 2018-11-21  514  
21af872cd8c695 Jonathan Marek 2018-11-21  515  	adreno_gpu = &a2xx_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  516  	gpu = &adreno_gpu->base;
21af872cd8c695 Jonathan Marek 2018-11-21  517  
21af872cd8c695 Jonathan Marek 2018-11-21  518  	gpu->perfcntrs = perfcntrs;
21af872cd8c695 Jonathan Marek 2018-11-21  519  	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
21af872cd8c695 Jonathan Marek 2018-11-21  520  
491fadb2b818e1 Akhil P Oommen 2025-11-18  521  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
db07ce5da8b26b Fabio Estevam  2023-06-20  522  	if (ret)
db07ce5da8b26b Fabio Estevam  2023-06-20  523  		goto fail;
db07ce5da8b26b Fabio Estevam  2023-06-20  524  
21af872cd8c695 Jonathan Marek 2018-11-21  525  	if (adreno_is_a20x(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  526  		adreno_gpu->registers = a200_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  527  	else if (adreno_is_a225(adreno_gpu))
21af872cd8c695 Jonathan Marek 2018-11-21  528  		adreno_gpu->registers = a225_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  529  	else
21af872cd8c695 Jonathan Marek 2018-11-21  530  		adreno_gpu->registers = a220_registers;
21af872cd8c695 Jonathan Marek 2018-11-21  531  
21af872cd8c695 Jonathan Marek 2018-11-21  532  	return gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  533  
21af872cd8c695 Jonathan Marek 2018-11-21  534  fail:
21af872cd8c695 Jonathan Marek 2018-11-21  535  	if (a2xx_gpu)
21af872cd8c695 Jonathan Marek 2018-11-21  536  		a2xx_destroy(&a2xx_gpu->base.base);
21af872cd8c695 Jonathan Marek 2018-11-21  537  
21af872cd8c695 Jonathan Marek 2018-11-21  538  	return ERR_PTR(ret);
21af872cd8c695 Jonathan Marek 2018-11-21  539  }
491fadb2b818e1 Akhil P Oommen 2025-11-18  540  

:::::: The code at line 503 was first introduced by commit
:::::: 21af872cd8c695060dd1d045293bf21ea9156a51 drm/msm/adreno: add a2xx

:::::: TO: Jonathan Marek <jonathan@marek.ca>
:::::: CC: Rob Clark <robdclark@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
