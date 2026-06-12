Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FC0382F18
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 02:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230515; cv=none; b=Gsp7Q2M4sHWxNDj10iIexvi/vmTaGdkPMRyL4doVOuOew7jkG19WZbOY4boI+quLNqAg8pck5nJJEPSHSMUcVKoO0qT30NYqyx0IDJ5ZvOMuJUju+RFiJ5BRwdRkQnW/2Z6iKRZ8CVYGLr5aufjweTDohraEe0NTpqq8IByNFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230515; c=relaxed/simple;
	bh=JIHcN8U9PzlxJPyv9MdOFkW1by9xOjvEJuf+nY9BKTU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HrBLxzv7Ggh614CD5Bg5encPlwxkYj8ryxvg7+/Q0aP0AxizI5kUNLIz2Hx3f3dTWwA+7JfqKRiI/GUylLN8dta6d2dnkKgmaedgsqW1feKfNlpj6a+Ff86NzZ2ETGS8O/ocKiIwvTbT9oGQ4Sw5ms0R58t0Cojyi2JjuqNyOIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0o93X/5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0o93X/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781230514; x=1812766514;
  h=date:from:to:cc:subject:message-id;
  bh=JIHcN8U9PzlxJPyv9MdOFkW1by9xOjvEJuf+nY9BKTU=;
  b=A0o93X/5ZWE0rqxCLkh68qaOI1eXmLbayKY8/nOeXiBz6+UUo6tzyzQo
   cmZLopGCLKHsknDZX/D+UrjA/vjaX6d9uiTExCNIvASJwlT+xdjTnx9M4
   58PmwLlqsh1M5qv0YfwlWf8zvoYKlWBR3oT1XL2vnXZLP6IVNf1DqzSpG
   aBGLxSX0CZJ9TtbxUTPbV+jKXxjwPMzLbJ6iQPlQla4Yr5LYBTRMNRADq
   6m2SdBPGmZFQCabKpgIaR+4Lw80tHK6swK5nGijyN1S6DRoM7EIYQwsxg
   p9bXV9K84mAqM94A04WaQxXJ3wIurAagLhaKRMK6Nqul0r0Kcsiqv6ih8
   w==;
X-CSE-ConnectionGUID: d3GLLqA3SbmAIS5w9RV9wA==
X-CSE-MsgGUID: 1OE8drbHRnWp02GB3wnR3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82105466"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82105466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:15:13 -0700
X-CSE-ConnectionGUID: shNpzHsYSiunANd+0MvcQQ==
X-CSE-MsgGUID: ST67bH2yRHq1ymAmm6BWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251641457"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 19:15:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrQK-00000000OAE-0sY0;
	Fri, 12 Jun 2026 02:15:08 +0000
Date: Fri, 12 Jun 2026 10:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/spi/spi-fsl-dspi.c:1358 dspi_resume() warn:
 'dspi->clk' from clk_prepare_enable() not released on lines: 1352.
Message-ID: <202606121016.C45Fjwwh-lkp@intel.com>
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
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: c5412ec5f687732f9722bd0f94f9632ad78f4c52 spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
date:   1 year ago
:::::: branch date: 31 hours ago
:::::: commit date: 1 year ago
config: powerpc64-randconfig-r072-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121016.C45Fjwwh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c5412ec5f687 ("spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606121016.C45Fjwwh-lkp@intel.com/

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
