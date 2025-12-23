Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEF2E8DEF
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498381; cv=none; b=b1IHG1HdTqlS/H/xn1wuxrDyDbdcvuqxWtwGTogZLy3DDDDO/psgqVflOcmwbnQNWM9IRoYE2ss0mIHScA3Y0v+URAIoQ88ort5bQi3XlVqnE4DToSVZEN/JZz8lyLZhAMbepmATKkWLF/oCSkUuBHy8Ujtoxh8Mw+juuFrdwqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498381; c=relaxed/simple;
	bh=TMcBu97koPtLIwTQOJl7iHPSw+VHtRUcUpsxrov7Ca0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oLpzmBfPJO0FlgvegP6VVtlEgdMHqyLHurkgh9M0JW8yv7ytbatSauJPSZn2MWu8NE6kC3rKWfza5rZxAu/Ex9TOottZY762vGMTbLk8kn+WBkpjMxMbUsD79SFh2mKLU3vpxU1UDx7wGloQBYdhUhmGRzGbvUabvd7pUN7umrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEFBAt3I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEFBAt3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766498378; x=1798034378;
  h=date:from:to:cc:subject:message-id;
  bh=TMcBu97koPtLIwTQOJl7iHPSw+VHtRUcUpsxrov7Ca0=;
  b=NEFBAt3IEi1qHFiSqmXiSNNSUOvgJ1xjNuMRXN5Qjh2rspOeBCPU4PdG
   aHeCRHjT0F0kAVWrthYV/pwrAslZtvWeJ5OwH64Smjtl+0g8BwBcKqcMj
   dSrB1rJABFiWcW4BMK+Wy/sQUHbPVJRfMPkZSngJyLjXDezgvrHRJQLtL
   h3Uv8S45jc5DGqatmex7HATcEzWceWjqEAP28ug/MHMclcuTtXDFXMDWB
   3sbfzOnxJTalLkeRkKFaORCgKl9I1GnuITjIQhZj1zTtCELwi/VV2O2d3
   EqT2iuDMofeEbREoioXZxUGg0A4yM2463kZ2MXZfbRUHkdI750JECV7HS
   Q==;
X-CSE-ConnectionGUID: RiGWnfFtQDSygKterExffQ==
X-CSE-MsgGUID: n15nfbHwT1efx6L2Amk98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68102033"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68102033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:59:36 -0800
X-CSE-ConnectionGUID: qSQGLtRiTje0DVI3lWXyBA==
X-CSE-MsgGUID: hdxAsd2sTlqQA1dvxvTe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="223267044"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 05:59:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2vE-0000000020B-1R55;
	Tue, 23 Dec 2025 13:59:32 +0000
Date: Tue, 23 Dec 2025 21:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-fsl-dspi.c:1358 dspi_resume() warn:
 'dspi->clk' from clk_prepare_enable() not released on lines: 1352.
Message-ID: <202512232157.gfrj1I9j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Larisa Grigore <larisa.grigore@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: James Clark <james.clark@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: c5412ec5f687732f9722bd0f94f9632ad78f4c52 spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
date:   7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r073-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232157.gfrj1I9j-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512232157.gfrj1I9j-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-fsl-dspi.c:1358 dspi_resume() warn: 'dspi->clk' from clk_prepare_enable() not released on lines: 1352.

Old smatch warnings:
drivers/spi/spi-fsl-dspi.c:1516 dspi_probe() warn: why call request_threaded_irq() with a NULL thread

vim +1358 drivers/spi/spi-fsl-dspi.c

c5412ec5f68773 Larisa Grigore 2025-05-22  1336  
c5412ec5f68773 Larisa Grigore 2025-05-22  1337  static int dspi_resume(struct device *dev)
c5412ec5f68773 Larisa Grigore 2025-05-22  1338  {
c5412ec5f68773 Larisa Grigore 2025-05-22  1339  	struct fsl_dspi *dspi = dev_get_drvdata(dev);
c5412ec5f68773 Larisa Grigore 2025-05-22  1340  	int ret;
c5412ec5f68773 Larisa Grigore 2025-05-22  1341  
c5412ec5f68773 Larisa Grigore 2025-05-22  1342  	pinctrl_pm_select_default_state(dev);
c5412ec5f68773 Larisa Grigore 2025-05-22  1343  
c5412ec5f68773 Larisa Grigore 2025-05-22  1344  	ret = clk_prepare_enable(dspi->clk);
c5412ec5f68773 Larisa Grigore 2025-05-22  1345  	if (ret)
c5412ec5f68773 Larisa Grigore 2025-05-22  1346  		return ret;
c5412ec5f68773 Larisa Grigore 2025-05-22  1347  	spi_controller_resume(dspi->ctlr);
c5412ec5f68773 Larisa Grigore 2025-05-22  1348  
c5412ec5f68773 Larisa Grigore 2025-05-22  1349  	ret = dspi_init(dspi);
c5412ec5f68773 Larisa Grigore 2025-05-22  1350  	if (ret) {
c5412ec5f68773 Larisa Grigore 2025-05-22  1351  		dev_err(dev, "failed to initialize dspi during resume\n");
c5412ec5f68773 Larisa Grigore 2025-05-22  1352  		return ret;
c5412ec5f68773 Larisa Grigore 2025-05-22  1353  	}
c5412ec5f68773 Larisa Grigore 2025-05-22  1354  
c5412ec5f68773 Larisa Grigore 2025-05-22  1355  	if (dspi->irq)
c5412ec5f68773 Larisa Grigore 2025-05-22  1356  		enable_irq(dspi->irq);
c5412ec5f68773 Larisa Grigore 2025-05-22  1357  
c5412ec5f68773 Larisa Grigore 2025-05-22 @1358  	return 0;
c5412ec5f68773 Larisa Grigore 2025-05-22  1359  }
c5412ec5f68773 Larisa Grigore 2025-05-22  1360  #endif /* CONFIG_PM_SLEEP */
c5412ec5f68773 Larisa Grigore 2025-05-22  1361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
