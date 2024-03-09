Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456FA36AEE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Mar 2024 03:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709956756; cv=none; b=OaX2hTwe6BBUy1yLIHw9iStl0FA7aXXLrCpSbbx+KLmFbbNmVWQbiRrcMMRvkh9QOowuCmohwQsb/WepBLGtPr0GnmqRWr/qr92QKauGcp8RahLOYDkGYV5206L9PIf/KhP/wB2yZy3q5IFPSwvrWihZG7EJyKLbzOzK/fN8aBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709956756; c=relaxed/simple;
	bh=PILkVD4M4AhLTzjYU3luyRRVPWhew9glyoNJyjtLvzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XcmObQXEFWOzSfzLBFvbV0wsDy0oBqBn9VM8GVIP2EJWNnv2RGd0ZKP1XuYqApCESuqOM87Fc00Smx7uLD8oJum+j6NNYeJYPV/XZ6jdGeF46yn1NC9/LLQ6cigMvl7YObaXiHyX0mILEPcPft55HfMo4GjIIlVrzaKwur0tYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDT7Aysv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDT7Aysv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709956754; x=1741492754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PILkVD4M4AhLTzjYU3luyRRVPWhew9glyoNJyjtLvzE=;
  b=LDT7Aysvd+9LMoWgZ1nQDVovuB5FuJBiqIbpFJq6h0zMKeseajnsGHXr
   IaZWbbYy+rhjeA3Hl+ci69vjzNQstqU9H7JGeVNDHrxXOPIOun/1ozxtf
   aA3rCXyxj5yCrkE44xn8ZLS/ux5NCq64Abv+zaCQ8uykEIXurUenBkvh9
   75Bv/+7zVlvs6DKATAUYGP/WrCWcOPHxT59JJBYJghLlE1+wqmJMaL2OL
   /ZnFm4wWow5E1TdknD/GjxuSX4OJBEA6/Qcu5Cr+T8mlyQpeEv+g7YFdx
   FdQZFhd5o8G5Eqcn0e4RfVLCLBX26iwQtxVedgKrUqvzjAvXN96SF/33O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16122289"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="16122289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 19:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10653879"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 19:59:12 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rinrZ-0006x1-2A;
	Sat, 09 Mar 2024 03:59:09 +0000
Date: Sat, 9 Mar 2024 11:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10:
 line 444 is redundant because platform_get_irq() already prints an error
Message-ID: <202403091108.0PKiLgpn-lkp@intel.com>
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
TO: Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Alain Volmat <alain.volmat@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   10d48d70e82d7d19eb9157fdb599bfce4a5768bc
commit: 28e0f37722965fa150af31d82101c95fd21aef60 media: stm32-dcmipp: STM32 DCMIPP camera interface driver
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-r061-20240308 (https://download.01.org/0day-ci/archive/20240309/202403091108.0PKiLgpn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403091108.0PKiLgpn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

vim +444 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c

28e0f37722965f Hugues Fruchet 2023-11-27  410  
28e0f37722965f Hugues Fruchet 2023-11-27  411  static int dcmipp_probe(struct platform_device *pdev)
28e0f37722965f Hugues Fruchet 2023-11-27  412  {
28e0f37722965f Hugues Fruchet 2023-11-27  413  	struct dcmipp_device *dcmipp;
28e0f37722965f Hugues Fruchet 2023-11-27  414  	struct clk *kclk;
28e0f37722965f Hugues Fruchet 2023-11-27  415  	const struct dcmipp_pipeline_config *pipe_cfg;
28e0f37722965f Hugues Fruchet 2023-11-27  416  	struct reset_control *rstc;
28e0f37722965f Hugues Fruchet 2023-11-27  417  	int irq;
28e0f37722965f Hugues Fruchet 2023-11-27  418  	int ret;
28e0f37722965f Hugues Fruchet 2023-11-27  419  
28e0f37722965f Hugues Fruchet 2023-11-27  420  	dcmipp = devm_kzalloc(&pdev->dev, sizeof(*dcmipp), GFP_KERNEL);
28e0f37722965f Hugues Fruchet 2023-11-27  421  	if (!dcmipp)
28e0f37722965f Hugues Fruchet 2023-11-27  422  		return -ENOMEM;
28e0f37722965f Hugues Fruchet 2023-11-27  423  
28e0f37722965f Hugues Fruchet 2023-11-27  424  	dcmipp->dev = &pdev->dev;
28e0f37722965f Hugues Fruchet 2023-11-27  425  
28e0f37722965f Hugues Fruchet 2023-11-27  426  	pipe_cfg = device_get_match_data(dcmipp->dev);
28e0f37722965f Hugues Fruchet 2023-11-27  427  	if (!pipe_cfg) {
28e0f37722965f Hugues Fruchet 2023-11-27  428  		dev_err(&pdev->dev, "Can't get device data\n");
28e0f37722965f Hugues Fruchet 2023-11-27  429  		return -ENODEV;
28e0f37722965f Hugues Fruchet 2023-11-27  430  	}
28e0f37722965f Hugues Fruchet 2023-11-27  431  	dcmipp->pipe_cfg = pipe_cfg;
28e0f37722965f Hugues Fruchet 2023-11-27  432  
28e0f37722965f Hugues Fruchet 2023-11-27  433  	platform_set_drvdata(pdev, dcmipp);
28e0f37722965f Hugues Fruchet 2023-11-27  434  
28e0f37722965f Hugues Fruchet 2023-11-27  435  	/* Get hardware resources from devicetree */
28e0f37722965f Hugues Fruchet 2023-11-27  436  	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
28e0f37722965f Hugues Fruchet 2023-11-27  437  	if (IS_ERR(rstc))
28e0f37722965f Hugues Fruchet 2023-11-27  438  		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
28e0f37722965f Hugues Fruchet 2023-11-27  439  				     "Could not get reset control\n");
28e0f37722965f Hugues Fruchet 2023-11-27  440  
28e0f37722965f Hugues Fruchet 2023-11-27  441  	irq = platform_get_irq(pdev, 0);
28e0f37722965f Hugues Fruchet 2023-11-27  442  	if (irq <= 0) {
28e0f37722965f Hugues Fruchet 2023-11-27  443  		if (irq != -EPROBE_DEFER)
28e0f37722965f Hugues Fruchet 2023-11-27 @444  			dev_err(&pdev->dev, "Could not get irq\n");
28e0f37722965f Hugues Fruchet 2023-11-27  445  		return irq ? irq : -ENXIO;
28e0f37722965f Hugues Fruchet 2023-11-27  446  	}
28e0f37722965f Hugues Fruchet 2023-11-27  447  
28e0f37722965f Hugues Fruchet 2023-11-27  448  	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
28e0f37722965f Hugues Fruchet 2023-11-27  449  	if (IS_ERR(dcmipp->regs)) {
28e0f37722965f Hugues Fruchet 2023-11-27  450  		dev_err(&pdev->dev, "Could not map registers\n");
28e0f37722965f Hugues Fruchet 2023-11-27  451  		return PTR_ERR(dcmipp->regs);
28e0f37722965f Hugues Fruchet 2023-11-27  452  	}
28e0f37722965f Hugues Fruchet 2023-11-27  453  
28e0f37722965f Hugues Fruchet 2023-11-27  454  	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmipp_irq_callback,
28e0f37722965f Hugues Fruchet 2023-11-27  455  					dcmipp_irq_thread, IRQF_ONESHOT,
28e0f37722965f Hugues Fruchet 2023-11-27  456  					dev_name(&pdev->dev), dcmipp);
28e0f37722965f Hugues Fruchet 2023-11-27  457  	if (ret) {
28e0f37722965f Hugues Fruchet 2023-11-27  458  		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
28e0f37722965f Hugues Fruchet 2023-11-27  459  		return ret;
28e0f37722965f Hugues Fruchet 2023-11-27  460  	}
28e0f37722965f Hugues Fruchet 2023-11-27  461  
28e0f37722965f Hugues Fruchet 2023-11-27  462  	/* Reset device */
28e0f37722965f Hugues Fruchet 2023-11-27  463  	ret = reset_control_assert(rstc);
28e0f37722965f Hugues Fruchet 2023-11-27  464  	if (ret) {
28e0f37722965f Hugues Fruchet 2023-11-27  465  		dev_err(&pdev->dev, "Failed to assert the reset line\n");
28e0f37722965f Hugues Fruchet 2023-11-27  466  		return ret;
28e0f37722965f Hugues Fruchet 2023-11-27  467  	}
28e0f37722965f Hugues Fruchet 2023-11-27  468  
28e0f37722965f Hugues Fruchet 2023-11-27  469  	usleep_range(3000, 5000);
28e0f37722965f Hugues Fruchet 2023-11-27  470  
28e0f37722965f Hugues Fruchet 2023-11-27  471  	ret = reset_control_deassert(rstc);
28e0f37722965f Hugues Fruchet 2023-11-27  472  	if (ret) {
28e0f37722965f Hugues Fruchet 2023-11-27  473  		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
28e0f37722965f Hugues Fruchet 2023-11-27  474  		return ret;
28e0f37722965f Hugues Fruchet 2023-11-27  475  	}
28e0f37722965f Hugues Fruchet 2023-11-27  476  
28e0f37722965f Hugues Fruchet 2023-11-27  477  	kclk = devm_clk_get(&pdev->dev, NULL);
28e0f37722965f Hugues Fruchet 2023-11-27  478  	if (IS_ERR(kclk))
28e0f37722965f Hugues Fruchet 2023-11-27  479  		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
28e0f37722965f Hugues Fruchet 2023-11-27  480  				     "Unable to get kclk\n");
28e0f37722965f Hugues Fruchet 2023-11-27  481  	dcmipp->kclk = kclk;
28e0f37722965f Hugues Fruchet 2023-11-27  482  
28e0f37722965f Hugues Fruchet 2023-11-27  483  	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
28e0f37722965f Hugues Fruchet 2023-11-27  484  				      sizeof(*dcmipp->entity), GFP_KERNEL);
28e0f37722965f Hugues Fruchet 2023-11-27  485  	if (!dcmipp->entity)
28e0f37722965f Hugues Fruchet 2023-11-27  486  		return -ENOMEM;
28e0f37722965f Hugues Fruchet 2023-11-27  487  
28e0f37722965f Hugues Fruchet 2023-11-27  488  	/* Register the v4l2 struct */
28e0f37722965f Hugues Fruchet 2023-11-27  489  	ret = v4l2_device_register(&pdev->dev, &dcmipp->v4l2_dev);
28e0f37722965f Hugues Fruchet 2023-11-27  490  	if (ret) {
28e0f37722965f Hugues Fruchet 2023-11-27  491  		dev_err(&pdev->dev,
28e0f37722965f Hugues Fruchet 2023-11-27  492  			"v4l2 device register failed (err=%d)\n", ret);
28e0f37722965f Hugues Fruchet 2023-11-27  493  		return ret;
28e0f37722965f Hugues Fruchet 2023-11-27  494  	}
28e0f37722965f Hugues Fruchet 2023-11-27  495  
28e0f37722965f Hugues Fruchet 2023-11-27  496  	/* Link the media device within the v4l2_device */
28e0f37722965f Hugues Fruchet 2023-11-27  497  	dcmipp->v4l2_dev.mdev = &dcmipp->mdev;
28e0f37722965f Hugues Fruchet 2023-11-27  498  
28e0f37722965f Hugues Fruchet 2023-11-27  499  	/* Initialize media device */
28e0f37722965f Hugues Fruchet 2023-11-27  500  	strscpy(dcmipp->mdev.model, DCMIPP_MDEV_MODEL_NAME,
28e0f37722965f Hugues Fruchet 2023-11-27  501  		sizeof(dcmipp->mdev.model));
28e0f37722965f Hugues Fruchet 2023-11-27  502  	dcmipp->mdev.dev = &pdev->dev;
28e0f37722965f Hugues Fruchet 2023-11-27  503  	media_device_init(&dcmipp->mdev);
28e0f37722965f Hugues Fruchet 2023-11-27  504  
28e0f37722965f Hugues Fruchet 2023-11-27  505  	/* Initialize subdevs */
28e0f37722965f Hugues Fruchet 2023-11-27  506  	ret = dcmipp_create_subdevs(dcmipp);
28e0f37722965f Hugues Fruchet 2023-11-27  507  	if (ret) {
28e0f37722965f Hugues Fruchet 2023-11-27  508  		media_device_cleanup(&dcmipp->mdev);
28e0f37722965f Hugues Fruchet 2023-11-27  509  		v4l2_device_unregister(&dcmipp->v4l2_dev);
28e0f37722965f Hugues Fruchet 2023-11-27  510  		return ret;
28e0f37722965f Hugues Fruchet 2023-11-27  511  	}
28e0f37722965f Hugues Fruchet 2023-11-27  512  
28e0f37722965f Hugues Fruchet 2023-11-27  513  	pm_runtime_enable(dcmipp->dev);
28e0f37722965f Hugues Fruchet 2023-11-27  514  
28e0f37722965f Hugues Fruchet 2023-11-27  515  	dev_info(&pdev->dev, "Probe done");
28e0f37722965f Hugues Fruchet 2023-11-27  516  
28e0f37722965f Hugues Fruchet 2023-11-27  517  	return 0;
28e0f37722965f Hugues Fruchet 2023-11-27  518  }
28e0f37722965f Hugues Fruchet 2023-11-27  519  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
