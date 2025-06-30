Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63DD433A4
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 07:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267001; cv=none; b=kmMpkowbCYpD1/+ICU9QHJWy/aRp2A+0NEt9rpIab6KWn2J3NYL/xsNyg58p/uythVslRPvixWSqdpbA/ZdDUI8TfyQcdYtWPnbmE16ltmT6qh4m87bNOymP45RhUtBOFPLU1+GAbptPw3V0MBd3CNhf+NEC64nV3rA5vgYBDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267001; c=relaxed/simple;
	bh=3N637DEuc1lnuAFBvtOI41oGGIbC66NXxP8wNTqPCXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rT1Zm7p6RZkCKcXNlSwFT24zBgYDDEdBosoyUgHFVUWdWViVOOZOVmuzIRT8nvcm1N5zEadsjlDIndkB6zEo7KsiszAr/oyP1jXhpi8z0QGBH7J+SLjfoZX2H5neyZB6/ZLtXVmwbHpKUEkuae0+lY9NrhhOO3mTNIxJ2oCnQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq5U59Vd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq5U59Vd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751266999; x=1782802999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3N637DEuc1lnuAFBvtOI41oGGIbC66NXxP8wNTqPCXE=;
  b=gq5U59VdJ4yMmdpfaUqz45xPWDBwN9aUhFTsjtI5NmJhxA14jhDKFru7
   I6ZskMXuQlNfqhXptTnh8MfAdh+H7MxEgLjczKq058+mDfoN8zpk4P2mp
   4gBqKFFKEc9Gwkt61jiB927yhW4ccwyXRr4tpC9/iipVqD43dkIkA8izF
   2YM36R9mSwQlJeZhHRniiqNOTpShzK2cpFyQfe66ez9SY+buytBGh/Uo2
   WGGYtzoFzkvNxlforsCjA2TFjmPpTDRQdoEEHRzd7EszimG5ZJpQmeTqi
   i/QvoPaIlGlz6S+GY0VP2JEjtfP/zCqGD9xFSdGBGI7Pg7VSHl+pc4xe7
   Q==;
X-CSE-ConnectionGUID: TrLW0Js/S1SxAo+kF6/IUA==
X-CSE-MsgGUID: A48PSfPeR9ybtBWEhA+Dmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57286697"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57286697"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:03:18 -0700
X-CSE-ConnectionGUID: fEgaD3OITPC+6pFsvDVauA==
X-CSE-MsgGUID: XLtEog/CRg2z6nBhp+jHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152999313"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 00:03:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW8Xq-000YaI-2a;
	Mon, 30 Jun 2025 07:03:14 +0000
Date: Mon, 30 Jun 2025 15:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 889/5998] drivers/spi/spi-fsl-dspi.c:1358
 dspi_resume() warn: 'dspi->clk' from clk_prepare_enable() not released on
 lines: 1352.
Message-ID: <202506301541.8dfVGezn-lkp@intel.com>
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
TO: Larisa Grigore <larisa.grigore@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: James Clark <james.clark@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c5412ec5f687732f9722bd0f94f9632ad78f4c52 [889/5998] spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-r072-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301541.8dfVGezn-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506301541.8dfVGezn-lkp@intel.com/

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
