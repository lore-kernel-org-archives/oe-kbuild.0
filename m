Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC2A7E107
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735514421; cv=none; b=LI3e52RHnYYR+f9xE6Ooz3Qa0iqMrYu3Sqe2XYO+OnRXJ36IBnzyLFYjZaLlT0ozIGqB3EatDORaf+oaxiLFT/wri7QsxY/SvMDHfVi3vk3oVQwTxt1qgPhxWgXlzK25t3QWkclj6En5/vvWZ8tK6MDuYHNFufv0BD5J9TIv/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735514421; c=relaxed/simple;
	bh=zMS/XK0G2T6QhooBdZs5ASXdtHbH5gXFyJjj9Gp4vLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfR3blbvOM5QywP8o7TrbdR2fc9nsm2fFx/IBI88SZipEn3MvxRA74yGa/yRPj0XIGCiC3DyRxDIQNWu7GNBzoi22pCRLHQPgGYsLjlGO4IaRdaAo+K8at481i4yLnd25qmTTtC8oWdGop1ZJi8kPnvalYU7rrsDHTZhiWaigrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6zhD0jf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6zhD0jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735514420; x=1767050420;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zMS/XK0G2T6QhooBdZs5ASXdtHbH5gXFyJjj9Gp4vLQ=;
  b=J6zhD0jfDFDlUJLn8Rg7Mx2elexld7rkTQMCckEM6CuDGiGt8HucTkk+
   071vNAbCKquSWPRB+0RP/h8LX1k8H465EK7rms2o/Yxh6mHNKvWoNiVnj
   jVWegUA9elM879tmCKKikH7fxQiWyM1alA2HrMh8SFeztJ5iHDFFnDYGq
   S3ciLHZp2Jxr3rOV0+zXL1zqGfmLFBdb3BLfFaV9av5prU9EsB/3vo8aZ
   YFZwCTgiM2yRQUGzJV1V7CEYP2/1EaXdRA5Yc4zbxWcXOw1+8HhoBqrYh
   CmgiQvyfxgeQ9qsm5Pw4elXcCUNrrjtx4IZgf0YAen4OHsYzBj1fB2gcZ
   w==;
X-CSE-ConnectionGUID: UvZx0u3wR/OorjM/FWjXmQ==
X-CSE-MsgGUID: eKSj3Nh8TZyyHthVF5aaRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46392347"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="46392347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 15:20:19 -0800
X-CSE-ConnectionGUID: 5m2d70cVRmeibQD/ld19xg==
X-CSE-MsgGUID: /ofzB8v6T3OjuuO8CnmUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105725835"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Dec 2024 15:20:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tS2Zz-0005EE-2t;
	Sun, 29 Dec 2024 23:20:15 +0000
Date: Mon, 30 Dec 2024 07:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3636/5236] drivers/spi/atmel-quadspi.c:1607
 atmel_qspi_resume() warn: 'aq->pclk' from clk_prepare() not released on
 lines: 1598.
Message-ID: <202412300711.4iDNSrvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Varshini Rajendran <varshini.rajendran@microchip.com>
CC: "Csókás, Bence" <csokas.bence@prolan.hu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [3636/5236] spi: atmel-quadspi: Add support for sama7g5 QSPI
:::::: branch date: 10 days ago
:::::: commit date: 13 days ago
config: arc-randconfig-r072-20241230 (https://download.01.org/0day-ci/archive/20241230/202412300711.4iDNSrvD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412300711.4iDNSrvD-lkp@intel.com/

New smatch warnings:
drivers/spi/atmel-quadspi.c:1607 atmel_qspi_resume() warn: 'aq->pclk' from clk_prepare() not released on lines: 1598.
drivers/spi/atmel-quadspi.c:1607 atmel_qspi_resume() warn: 'aq->qspick' from clk_prepare() not released on lines: 1598.

Old smatch warnings:
drivers/spi/atmel-quadspi.c:1282 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

vim +1607 drivers/spi/atmel-quadspi.c

de217c1cca435a drivers/mtd/spi-nor/atmel-quadspi.c Claudiu Beznea 2018-06-04  1576  
de217c1cca435a drivers/mtd/spi-nor/atmel-quadspi.c Claudiu Beznea 2018-06-04  1577  static int __maybe_unused atmel_qspi_resume(struct device *dev)
de217c1cca435a drivers/mtd/spi-nor/atmel-quadspi.c Claudiu Beznea 2018-06-04  1578  {
e5c27498a0403b drivers/spi/atmel-quadspi.c         Claudiu Beznea 2019-04-24  1579  	struct spi_controller *ctrl = dev_get_drvdata(dev);
e5c27498a0403b drivers/spi/atmel-quadspi.c         Claudiu Beznea 2019-04-24  1580  	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1581  	int ret;
de217c1cca435a drivers/mtd/spi-nor/atmel-quadspi.c Claudiu Beznea 2018-06-04  1582  
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1583  	ret = clk_prepare(aq->pclk);
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1584  	if (ret)
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1585  		return ret;
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1586  
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1587  	ret = clk_prepare(aq->qspick);
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1588  	if (ret) {
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1589  		clk_unprepare(aq->pclk);
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1590  		return ret;
ef901b38d3a461 drivers/spi/atmel-quadspi.c         Chen Ni        2024-05-15  1591  	}
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1592  
5af42209a4d23a drivers/spi/atmel-quadspi.c         Tudor Ambarus  2024-11-28  1593  	if (aq->caps->has_gclk)
5af42209a4d23a drivers/spi/atmel-quadspi.c         Tudor Ambarus  2024-11-28  1594  		return atmel_qspi_sama7g5_init(aq);
5af42209a4d23a drivers/spi/atmel-quadspi.c         Tudor Ambarus  2024-11-28  1595  
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1596  	ret = pm_runtime_force_resume(dev);
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1597  	if (ret < 0)
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1598  		return ret;
de217c1cca435a drivers/mtd/spi-nor/atmel-quadspi.c Claudiu Beznea 2018-06-04  1599  
5b74e9a306267b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-06-28  1600  	atmel_qspi_init(aq);
ab735611402f42 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-06-28  1601  
c528ecfbef040b drivers/spi/atmel-quadspi.c         Tudor Ambarus  2020-03-20  1602  	atmel_qspi_write(aq->scr, aq, QSPI_SCR);
ab735611402f42 drivers/spi/atmel-quadspi.c         Tudor Ambarus  2019-06-28  1603  
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1604  	pm_runtime_mark_last_busy(dev);
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1605  	pm_runtime_put_autosuspend(dev);
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1606  
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09 @1607  	return 0;
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1608  }
4a2f83b7f78092 drivers/spi/atmel-quadspi.c         Claudiu Beznea 2022-06-09  1609  

:::::: The code at line 1607 was first introduced by commit
:::::: 4a2f83b7f78092a6d9e98fb5573d8f4b79c56336 spi: atmel-quadspi: add runtime pm support

:::::: TO: Claudiu Beznea <claudiu.beznea@microchip.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
