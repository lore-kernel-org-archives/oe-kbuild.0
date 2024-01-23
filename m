Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A15A0E6
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jan 2024 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003836; cv=none; b=FRirAsCMtMFXfNkkrBtEwXPRddBNFRXtHCLDXStVENaYinicfuLHv2dleN0KXfXO13ovoIKD5ZfLIU8GgIC8C6ge/AklZ4Q9mag3rT/WRmEY2EBP8bfMiX52tF4QQj+O6lTeowrir6ME//tMSvTzI0FQaI7NmcNB+zhwAWZgoCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003836; c=relaxed/simple;
	bh=HgBCGMcHg9vkZ7yKq14ePlQLHjTmBIwXUQ5W6evgpHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIykmlvHCX3AWrWCFewfhbWJH6i54T7s3MTku6ME1KH6PJyPm7EUU0u0aLp+eS8iEZLZKkLF2GvW0sF8J86jen3JNenjGfzNFUfxmoHAJ6eYSpdY6hS+uVG8/++BafRNpNm9dVCesVORxdUXloqxNFgZOUVzmXFU6bq450UhmSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=freBYhOz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="freBYhOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706003834; x=1737539834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HgBCGMcHg9vkZ7yKq14ePlQLHjTmBIwXUQ5W6evgpHk=;
  b=freBYhOzyAtoM49kYj14xZjpSwURoj7IuaYS29kAnSZIkMG+b7AK8lyy
   w+nwIu2Ya0vbyEQdADbxT11x0NNF96M/JhPSo9qEFVJUFr5F5+UI8UmUJ
   mG9qb+VIkmxSHRr+YCorMS1x4LRVizJ7VlusD89XXkVD0hPABhiEn7QGZ
   /n4qgOwxGhUBaE2skjLMo9zjCri06kQV3qoNfGgyMDrPMSyry3UcT5Z4L
   vGr5i5/rjGAQ/2rR5EnLJEtm+nc9s+Ry+wtY5siD3EfXXs0klmfYAPtz9
   IQdkJV6H+8YzjngKCHJwg2O/qAGsUC962rDmMOsRCugARV4fhL6yxxWOI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8584417"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8584417"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 01:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929288437"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="929288437"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2024 01:57:11 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSDWn-0007KR-0n;
	Tue, 23 Jan 2024 09:57:09 +0000
Date: Tue, 23 Jan 2024 17:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 55/79] drivers/rtc/rtc-tps6594.c:442:2-9:
 line 442 is redundant because platform_get_irq() already prints an error
Message-ID: <202401231704.rxvH4G5u-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   95b5a09669edc6d3a5216ab8155a621ac28dd6ca
commit: 2b13d2f1be636addc928fef814e6fdad9cd2c21f [55/79] rtc: tps6594: add driver for TPS6594 PMIC RTC
:::::: branch date: 13 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20240123 (https://download.01.org/0day-ci/archive/20240123/202401231704.rxvH4G5u-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401231704.rxvH4G5u-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-tps6594.c:442:2-9: line 442 is redundant because platform_get_irq() already prints an error

vim +442 drivers/rtc/rtc-tps6594.c

2b13d2f1be636a Esteban Blanc 2023-04-17  382  
2b13d2f1be636a Esteban Blanc 2023-04-17  383  static int tps6594_rtc_probe(struct platform_device *pdev)
2b13d2f1be636a Esteban Blanc 2023-04-17  384  {
2b13d2f1be636a Esteban Blanc 2023-04-17  385  	struct tps6594 *tps;
2b13d2f1be636a Esteban Blanc 2023-04-17  386  	struct rtc_device *rtc;
2b13d2f1be636a Esteban Blanc 2023-04-17  387  	int irq;
2b13d2f1be636a Esteban Blanc 2023-04-17  388  	int ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  389  
2b13d2f1be636a Esteban Blanc 2023-04-17  390  	tps = dev_get_drvdata(pdev->dev.parent);
2b13d2f1be636a Esteban Blanc 2023-04-17  391  
2b13d2f1be636a Esteban Blanc 2023-04-17  392  	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
2b13d2f1be636a Esteban Blanc 2023-04-17  393  	if (!rtc)
2b13d2f1be636a Esteban Blanc 2023-04-17  394  		return -ENOMEM;
2b13d2f1be636a Esteban Blanc 2023-04-17  395  
2b13d2f1be636a Esteban Blanc 2023-04-17  396  	rtc = devm_rtc_allocate_device(&pdev->dev);
2b13d2f1be636a Esteban Blanc 2023-04-17  397  	if (IS_ERR(rtc))
2b13d2f1be636a Esteban Blanc 2023-04-17  398  		return PTR_ERR(rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  399  
2b13d2f1be636a Esteban Blanc 2023-04-17  400  	/* Enable crystal oscillator */
2b13d2f1be636a Esteban Blanc 2023-04-17  401  	ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_2,
2b13d2f1be636a Esteban Blanc 2023-04-17  402  			      TPS6594_BIT_XTAL_EN);
2b13d2f1be636a Esteban Blanc 2023-04-17  403  	if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  404  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  405  
2b13d2f1be636a Esteban Blanc 2023-04-17  406  	ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
2b13d2f1be636a Esteban Blanc 2023-04-17  407  			       TPS6594_BIT_RUN);
2b13d2f1be636a Esteban Blanc 2023-04-17  408  	if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  409  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  410  	/* RTC not running */
2b13d2f1be636a Esteban Blanc 2023-04-17  411  	if (ret == 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17  412  		/* Start rtc */
2b13d2f1be636a Esteban Blanc 2023-04-17  413  		ret = regmap_set_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
2b13d2f1be636a Esteban Blanc 2023-04-17  414  				      TPS6594_BIT_STOP_RTC);
2b13d2f1be636a Esteban Blanc 2023-04-17  415  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  416  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  417  
2b13d2f1be636a Esteban Blanc 2023-04-17  418  		mdelay(100);
2b13d2f1be636a Esteban Blanc 2023-04-17  419  
2b13d2f1be636a Esteban Blanc 2023-04-17  420  		/*
2b13d2f1be636a Esteban Blanc 2023-04-17  421  		 * RTC should be running now. Check if this is the case.
2b13d2f1be636a Esteban Blanc 2023-04-17  422  		 * If not it might be a missing oscillator.
2b13d2f1be636a Esteban Blanc 2023-04-17  423  		 */
2b13d2f1be636a Esteban Blanc 2023-04-17  424  		ret = regmap_test_bits(tps->regmap, TPS6594_REG_RTC_STATUS,
2b13d2f1be636a Esteban Blanc 2023-04-17  425  				       TPS6594_BIT_RUN);
2b13d2f1be636a Esteban Blanc 2023-04-17  426  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  427  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  428  		if (ret == 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  429  			return -ENODEV;
2b13d2f1be636a Esteban Blanc 2023-04-17  430  
2b13d2f1be636a Esteban Blanc 2023-04-17  431  		/* Stop RTC until first call to `tps6594_rtc_set_time */
2b13d2f1be636a Esteban Blanc 2023-04-17  432  		ret = regmap_clear_bits(tps->regmap, TPS6594_REG_RTC_CTRL_1,
2b13d2f1be636a Esteban Blanc 2023-04-17  433  					TPS6594_BIT_STOP_RTC);
2b13d2f1be636a Esteban Blanc 2023-04-17  434  		if (ret < 0)
2b13d2f1be636a Esteban Blanc 2023-04-17  435  			return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  436  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  437  
2b13d2f1be636a Esteban Blanc 2023-04-17  438  	platform_set_drvdata(pdev, rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  439  
2b13d2f1be636a Esteban Blanc 2023-04-17  440  	irq = platform_get_irq_byname(pdev, TPS6594_IRQ_NAME_ALARM);
2b13d2f1be636a Esteban Blanc 2023-04-17  441  	if (irq < 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17 @442  		dev_err(&pdev->dev, "Failed to get irq\n");
2b13d2f1be636a Esteban Blanc 2023-04-17  443  		return irq;
2b13d2f1be636a Esteban Blanc 2023-04-17  444  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  445  
2b13d2f1be636a Esteban Blanc 2023-04-17  446  	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
2b13d2f1be636a Esteban Blanc 2023-04-17  447  					tps6594_rtc_interrupt, IRQF_ONESHOT,
2b13d2f1be636a Esteban Blanc 2023-04-17  448  					TPS6594_IRQ_NAME_ALARM, &pdev->dev);
2b13d2f1be636a Esteban Blanc 2023-04-17  449  	if (ret < 0) {
2b13d2f1be636a Esteban Blanc 2023-04-17  450  		dev_err(&pdev->dev, "Failed to request_threaded_irq\n");
2b13d2f1be636a Esteban Blanc 2023-04-17  451  		return ret;
2b13d2f1be636a Esteban Blanc 2023-04-17  452  	}
2b13d2f1be636a Esteban Blanc 2023-04-17  453  
2b13d2f1be636a Esteban Blanc 2023-04-17  454  	rtc->ops = &tps6594_rtc_ops;
2b13d2f1be636a Esteban Blanc 2023-04-17  455  	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
2b13d2f1be636a Esteban Blanc 2023-04-17  456  	rtc->range_max = RTC_TIMESTAMP_END_2099;
2b13d2f1be636a Esteban Blanc 2023-04-17  457  
2b13d2f1be636a Esteban Blanc 2023-04-17  458  	return devm_rtc_register_device(rtc);
2b13d2f1be636a Esteban Blanc 2023-04-17  459  }
2b13d2f1be636a Esteban Blanc 2023-04-17  460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
