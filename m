Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CC37474B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 03:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534067; cv=none; b=QRgkFvbD3t98Dy1iwb9t7UGJkFUZlfQH5BtRiNq26OGWfQmzqftRPCVuIzKDvwPNYNVH/Ots5ZUpHt5xhk8jA7cWcINgPOgMoJDBEeQu6OJH4xdj0A4DXh+SjNnYVoKVpkCi7Y5N2usWuco/JxmjhRnLE7zza7avF+OpqffDe0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534067; c=relaxed/simple;
	bh=q4VXhDa9Ypw3lK4HnTEUgVSSLgsZW100/OtrcrNS0Tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NP0NSWvWL3gYBIlz0AAb4Yg2dzaeUdUUihGT0KU5lRoAgDSi5VvrQuqlLhaF6gJ3uq6E6vqwNJmVd2OdcmGYCDNaXWuW4SyHwzQMTUoqbrJH9EKJP4dO6YZ6Hr903rO946D7Kac3nSpXq8QoeJ7etJq9/ZvCWv/diRMq2khRKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbVbBnRK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbVbBnRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534067; x=1807070067;
  h=date:from:to:cc:subject:message-id;
  bh=q4VXhDa9Ypw3lK4HnTEUgVSSLgsZW100/OtrcrNS0Tc=;
  b=GbVbBnRKOXWjA3x87oxw1h3Y6rQbs9FfGMmFYlLMXhtCcXPdUynsPMOH
   vKK0XGdy6eWwUkwBdg3GOmc9SOetEK4JeH79VlT4YQ9AadAYxNYYH0v3D
   MPeWkJKOBh7iNOPbmu0ZVfPI8lpfQVjVIUztPmB5zbGLgoMQZ7kYta/X1
   WtyzgLpBOVaakkKozrkUrodIpxsiMgr33OE8MoaFUz60sCKtFY40vp0QB
   gnNDdd+VUEfTWMJOizHL+4iwaBRARWJRN+8IjGdPCn0g2jXe1TnAh79ZA
   dO/6EJT6uaBr4hiwI1VHcm+g7NxnMHXrPUW8RXJVe1mjN7Bj09kHDYgU7
   g==;
X-CSE-ConnectionGUID: rsXR/uYOSzmidXI7RNMZdQ==
X-CSE-MsgGUID: 3XBkcqwVSE+V10IP6DS80Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80080773"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80080773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:26 -0700
X-CSE-ConnectionGUID: QiLHTgWSQsOGj2Sl9Erbjg==
X-CSE-MsgGUID: lrpdOXo4QPm85iYhOqRSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227994782"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:54:25 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-0000000004E-1NWN;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/arm/pxa2xx-ac97-lib.c:334 pxa2xx_ac97_hw_probe() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202604041426.i2C1xqHk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peng Fan <peng.fan@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: c76d50b71e898694c946993eb3c77f50efa97254 ASoC: ac97: Convert to GPIO descriptors
date:   10 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 weeks ago
config: microblaze-randconfig-r072-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041426.i2C1xqHk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c76d50b71e89 ("ASoC: ac97: Convert to GPIO descriptors")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604041426.i2C1xqHk-lkp@intel.com/

smatch warnings:
sound/arm/pxa2xx-ac97-lib.c:334 pxa2xx_ac97_hw_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +334 sound/arm/pxa2xx-ac97-lib.c

9c63634221f6745 Dmitry Baryshkov 2008-09-10  319  
e21596bba143563 Bill Pemberton   2012-12-06  320  int pxa2xx_ac97_hw_probe(struct platform_device *dev)
9c63634221f6745 Dmitry Baryshkov 2008-09-10  321  {
9c63634221f6745 Dmitry Baryshkov 2008-09-10  322  	int ret;
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  323  	int irq;
26ade896b6ba3fd Robert Jarzmik   2009-03-15  324  
8ff064521f97554 Arnd Bergmann    2019-09-18  325  	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
8ff064521f97554 Arnd Bergmann    2019-09-18  326  	if (IS_ERR(ac97_reg_base)) {
8ff064521f97554 Arnd Bergmann    2019-09-18  327  		dev_err(&dev->dev, "Missing MMIO resource\n");
8ff064521f97554 Arnd Bergmann    2019-09-18  328  		return PTR_ERR(ac97_reg_base);
8ff064521f97554 Arnd Bergmann    2019-09-18  329  	}
8ff064521f97554 Arnd Bergmann    2019-09-18  330  
be829277ef79aa6 Peng Fan         2026-01-22  331  	if (dev->dev.of_node) {
c76d50b71e89869 Peng Fan         2026-01-22  332  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
c76d50b71e89869 Peng Fan         2026-01-22  333  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
c76d50b71e89869 Peng Fan         2026-01-22 @334  		ret = PTR_ERR(rst_gpio);
c76d50b71e89869 Peng Fan         2026-01-22  335  		if (ret == -ENOENT)
be829277ef79aa6 Peng Fan         2026-01-22  336  			reset_gpio = -1;
c76d50b71e89869 Peng Fan         2026-01-22  337  		else if (ret)
c76d50b71e89869 Peng Fan         2026-01-22  338  			return ret;
c76d50b71e89869 Peng Fan         2026-01-22  339  		reset_gpio = desc_to_gpio(rst_gpio);
26ade896b6ba3fd Robert Jarzmik   2009-03-15  340  	} else {
26ade896b6ba3fd Robert Jarzmik   2009-03-15  341  		if (cpu_is_pxa27x())
26ade896b6ba3fd Robert Jarzmik   2009-03-15  342  			reset_gpio = 113;
26ade896b6ba3fd Robert Jarzmik   2009-03-15  343  	}
9c63634221f6745 Dmitry Baryshkov 2008-09-10  344  
9d1cf39be670976 Dmitry Baryshkov 2008-09-10  345  	if (cpu_is_pxa27x()) {
3b4bc7bccc78572 Mike Dunn        2013-01-07  346  		/*
3b4bc7bccc78572 Mike Dunn        2013-01-07  347  		 * This gpio is needed for a work-around to a bug in the ac97
3b4bc7bccc78572 Mike Dunn        2013-01-07  348  		 * controller during warm reset.  The direction and level is set
3b4bc7bccc78572 Mike Dunn        2013-01-07  349  		 * here so that it is an output driven high when switching from
3b4bc7bccc78572 Mike Dunn        2013-01-07  350  		 * AC97_nRESET alt function to generic gpio.
3b4bc7bccc78572 Mike Dunn        2013-01-07  351  		 */
c76d50b71e89869 Peng Fan         2026-01-22  352  		gpiod_set_consumer_name(rst_gpio, "pxa27x ac97 reset");
053fe0f166e540a Mike Dunn        2013-01-07  353  		pxa27x_configure_ac97reset(reset_gpio, false);
3b4bc7bccc78572 Mike Dunn        2013-01-07  354  
9c63634221f6745 Dmitry Baryshkov 2008-09-10  355  		ac97conf_clk = clk_get(&dev->dev, "AC97CONFCLK");
9c63634221f6745 Dmitry Baryshkov 2008-09-10  356  		if (IS_ERR(ac97conf_clk)) {
9c63634221f6745 Dmitry Baryshkov 2008-09-10  357  			ret = PTR_ERR(ac97conf_clk);
9c63634221f6745 Dmitry Baryshkov 2008-09-10  358  			ac97conf_clk = NULL;
796123368871e4a Dmitry Baryshkov 2009-01-05  359  			goto err_conf;
9c63634221f6745 Dmitry Baryshkov 2008-09-10  360  		}
9d1cf39be670976 Dmitry Baryshkov 2008-09-10  361  	}
9c63634221f6745 Dmitry Baryshkov 2008-09-10  362  
9c63634221f6745 Dmitry Baryshkov 2008-09-10  363  	ac97_clk = clk_get(&dev->dev, "AC97CLK");
9c63634221f6745 Dmitry Baryshkov 2008-09-10  364  	if (IS_ERR(ac97_clk)) {
9c63634221f6745 Dmitry Baryshkov 2008-09-10  365  		ret = PTR_ERR(ac97_clk);
9c63634221f6745 Dmitry Baryshkov 2008-09-10  366  		ac97_clk = NULL;
796123368871e4a Dmitry Baryshkov 2009-01-05  367  		goto err_clk;
9c63634221f6745 Dmitry Baryshkov 2008-09-10  368  	}
9c63634221f6745 Dmitry Baryshkov 2008-09-10  369  
4091d3425a2e494 Robert Jarzmik   2014-06-09  370  	ret = clk_prepare_enable(ac97_clk);
796123368871e4a Dmitry Baryshkov 2009-01-05  371  	if (ret)
796123368871e4a Dmitry Baryshkov 2009-01-05  372  		goto err_clk2;
796123368871e4a Dmitry Baryshkov 2009-01-05  373  
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  374  	irq = platform_get_irq(dev, 0);
46cf1954de3f324 Yang Yingliang   2022-10-29  375  	if (irq < 0) {
46cf1954de3f324 Yang Yingliang   2022-10-29  376  		ret = irq;
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  377  		goto err_irq;
46cf1954de3f324 Yang Yingliang   2022-10-29  378  	}
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  379  
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  380  	ret = request_irq(irq, pxa2xx_ac97_irq, 0, "AC97", NULL);
796123368871e4a Dmitry Baryshkov 2009-01-05  381  	if (ret < 0)
796123368871e4a Dmitry Baryshkov 2009-01-05  382  		goto err_irq;
796123368871e4a Dmitry Baryshkov 2009-01-05  383  
796123368871e4a Dmitry Baryshkov 2009-01-05  384  	return 0;
9c63634221f6745 Dmitry Baryshkov 2008-09-10  385  
9c63634221f6745 Dmitry Baryshkov 2008-09-10  386  err_irq:
8ff064521f97554 Arnd Bergmann    2019-09-18  387  	writel(readl(ac97_reg_base + GCR) | (GCR_ACLINK_OFF), ac97_reg_base + GCR);
796123368871e4a Dmitry Baryshkov 2009-01-05  388  err_clk2:
796123368871e4a Dmitry Baryshkov 2009-01-05  389  	clk_put(ac97_clk);
796123368871e4a Dmitry Baryshkov 2009-01-05  390  	ac97_clk = NULL;
796123368871e4a Dmitry Baryshkov 2009-01-05  391  err_clk:
9c63634221f6745 Dmitry Baryshkov 2008-09-10  392  	if (ac97conf_clk) {
9c63634221f6745 Dmitry Baryshkov 2008-09-10  393  		clk_put(ac97conf_clk);
9c63634221f6745 Dmitry Baryshkov 2008-09-10  394  		ac97conf_clk = NULL;
9c63634221f6745 Dmitry Baryshkov 2008-09-10  395  	}
796123368871e4a Dmitry Baryshkov 2009-01-05  396  err_conf:
9c63634221f6745 Dmitry Baryshkov 2008-09-10  397  	return ret;
9c63634221f6745 Dmitry Baryshkov 2008-09-10  398  }
9c63634221f6745 Dmitry Baryshkov 2008-09-10  399  EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_probe);
9c63634221f6745 Dmitry Baryshkov 2008-09-10  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
