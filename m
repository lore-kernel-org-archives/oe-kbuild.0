Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713CB275105
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765316657; cv=none; b=fNKhFwCNyrzvJL9uc3ysUQYU50ng3WUoim+xj++3qAx+JM5oMf4khSw95x9Kn1RA7u8gaDHlIXu+oNlGrfvBCn4/5Q2EvRg1huKD8C19DAMFz/rrw/FssWgJlthKXyIm7e16m2g0GfliaxGgASSpj41bVgJJ0bGjKKet6/J4y8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765316657; c=relaxed/simple;
	bh=bkO6nJTzkf1Ol8oZ/PTJKcVHAvYGCLXIHT/5lEtAs+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dj/g6cB/u+z2q2BQPevmVxBzHC7gzwqvLMbap0RlSwdaGIBact+IZ1lP44W3+femrmYBkG2wc1Uv1+hffIbgrPI1DucZIG+RcGewpqehsvJREZiiYCeZKErh2h4+AVE//eLs6di2O0mRBZP+bN4Ehpv0t7nU2+pdUoExpNpEvGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHYG2f5o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHYG2f5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765316655; x=1796852655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkO6nJTzkf1Ol8oZ/PTJKcVHAvYGCLXIHT/5lEtAs+Q=;
  b=XHYG2f5odvVT8X/6GIEbhKdQS5WNRSExT2Sw4oMTcOlkmgfgxApDJQEM
   W4TR77WEQ5WUYaFxvtLs4qfnR0JHkBlN6RjetmrSmLKiBY3Te56ozXLVf
   V2Kn1HT3YA4OJqrp8p+GFmNmhRtABKVs/WWKtG+rp2C+hngSV8YGZaOZC
   vA8ZGJSV6LgKa1LouDGDDeIlD6FCokagsbm/bPjvqUA0U0qqpXc9eRvRg
   DaEbMTeJ6F/V37Tk4TP5OdkAVx4vbOQHnu84nzxRxGgg6mdDGs1fpflHo
   /sSKHYdUMkVnLbA/uULUAND0VI4NQsnbuDzWqiY4E5gR6baREDly7yE6d
   A==;
X-CSE-ConnectionGUID: 3TDtrwdOQiiY4u15L5Q5qA==
X-CSE-MsgGUID: cSWX/JxBTBi3KpyS0xJevw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="89935386"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="89935386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 13:44:14 -0800
X-CSE-ConnectionGUID: nQ29l0ggTOecwrakQ/UB0w==
X-CSE-MsgGUID: 8KCwbyKTR+2TarKTaFcF1w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 13:44:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT5VC-000000002IH-34RR;
	Tue, 09 Dec 2025 21:44:10 +0000
Date: Wed, 10 Dec 2025 05:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202512100556.jnd3b44W-lkp@intel.com>
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
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251210/202512100556.jnd3b44W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512100556.jnd3b44W-lkp@intel.com/

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
