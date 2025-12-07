Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D1A23AB9D
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765135707; cv=none; b=BaRP+e59D3c+EP49N6EhDlh+bCLHb4rjsFCUPVeDZlfMTlJ/gd7CBu6Roj+uUvSPsBIc4iIdP85pCJFOGYCvPoNMzIoEFQ/TdQVAmgpnbTMznKZKYyteeHSYeNdghCRcD5ObqtcRWh+2qAnxf7THya6PBTyFOawkqjrKSguGCNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765135707; c=relaxed/simple;
	bh=bDHmZwUyq69Xt4xOrtu83y6hX5yMMwnLmT6mWBEC+aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9MKabO2/h0hjASi6EgJA3OMS4vMR5bb7xBZQoPltoroRHagnmu+MtCxkwdWfqZOyvVv2qyjWG3msFkWgdZ7Y+FfjWSBHCW4Xmp1zcHYYmrMn+AjDrh3XpubRbG/ZESQEkICg/E/X+hNAHRoCdygwIImiFYb2vopjEro4li2O3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QC6/oicN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QC6/oicN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765135705; x=1796671705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDHmZwUyq69Xt4xOrtu83y6hX5yMMwnLmT6mWBEC+aE=;
  b=QC6/oicNCrk9x+Gq9JFm3nwF3fQ0UbMR7yuyFgWqOfcq49VE0D7RkIUZ
   vIYpftaj7OjidZWyR+u9riB+Qcy7RwJ1imxNoo4zE2/A9HEfye/b1rKTd
   W1NCzfVBr9x24vHy2hNkOFb4sgJQLxsYDJmJ8kll9OoC6o++W6axiBm+K
   rc8e1BUbuiW9kJqGDqzZ7ZMn9sGAKR8j2uvjmbO9qZvciwWnLPaFqj/PI
   0mc3wB5FAlSAvZe2JYnCfmDi7vDLZSX/PJAGI0Ux0dWN5T32XNRlr/BL9
   ds3JCoQs4nlUCszfA1CfP+xUWJri1XFgO7KlU7c+iVKSFp6ym0zmuDe1v
   Q==;
X-CSE-ConnectionGUID: gBPFza2uTF2Y63kXU1rEQA==
X-CSE-MsgGUID: oe3HvCvRQNK0z311XDqrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67136014"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="67136014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 11:28:24 -0800
X-CSE-ConnectionGUID: Fibi8PIjRvya/J8+W+rf9w==
X-CSE-MsgGUID: 4JBkXDpjSZaRTMQFcCQu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="226428214"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2025 11:28:24 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSKQf-00000000JaJ-0aXS;
	Sun, 07 Dec 2025 19:28:21 +0000
Date: Mon, 8 Dec 2025 03:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202512080321.Nbes6d5F-lkp@intel.com>
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
head:   67a454e6b1c604555c04501c77b7fedc5d98a779
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251208/202512080321.Nbes6d5F-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512080321.Nbes6d5F-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)

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
