Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33E43ED126
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863278; cv=none; b=MfZq3e0lewGVZONNggOTr7sY7mr5fdv4Isghs4P/NYXCy+1yJrZ3amn0vgrHF/fXwwD2EiaDZBqZ4HsatcnjGCxaZyfrbTPmtDx/Bf3mjgG9Kpct0M7XoxfEHXNGvWmlWBHrIZUlcM2aWBJwxRpICDrVUUrzH3vxtGcFRyaQMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863278; c=relaxed/simple;
	bh=W6aoXAqoXHRhocUFtV8I9Vkae0NV5N4RJD8QKzcb8VE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0mqITagzNf4a0uF1d5HkMpYcfLiJUHbDf/c8xotykvNaDpRjLpqRrUjM69um7Q+soA6utAOvEoHpmaJx3Gnn7i/QsNZfMaHWHvMk8XAXnIMEctFSImobDnXTieQThLtkSU7Kkp2LB+Q5qNzGvfqJqG9aAr3CDwxHgm1x/fPsVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCDD837c; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCDD837c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767863269; x=1799399269;
  h=date:from:to:cc:subject:message-id;
  bh=W6aoXAqoXHRhocUFtV8I9Vkae0NV5N4RJD8QKzcb8VE=;
  b=YCDD837cXBFHiEZZ7rBKw+fIeU6A9liwZPZHcEt1uHXU290D5lKRa0b3
   cFSKfSLDUKptM8J1s8RYxQ3ymOpWkrMNYuF0uimYaF0vUgpH+pNd1yZg5
   mxZgUyXZjNqe9wBagtISVF/FQkrTFrkd98KdR2nGXMapksSGfvplnQn8o
   koy8piO7/rsLLg/TOZ+3N/LYy6CZBg4HQ3E7Kyi2rMc665lSwGvFElE44
   Or434ipXGSRJHAP75pvGSgdp2PmPGW9SHg7cDAvicrau57XfR2wJhabX5
   /3MkJxFQr9li/WSFZD3h2WLOPTO5JDUXuuK3mBErNxbgs+ELEhlufflFS
   Q==;
X-CSE-ConnectionGUID: 7FZQa3IOTe6YfZu/LaDdZw==
X-CSE-MsgGUID: L/VRzA/3Qc2zySy8cyQTUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79879042"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79879042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 01:07:46 -0800
X-CSE-ConnectionGUID: Uc7xuo/ITFGtCdfPJtzwTA==
X-CSE-MsgGUID: +Hl+S8HmTryeJTR8uxd2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202355399"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2026 01:07:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdlza-000000004XG-1CbE;
	Thu, 08 Jan 2026 09:07:42 +0000
Date: Thu, 08 Jan 2026 17:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4337/4725]
 drivers/power/sequencing/pwrseq-qcom-wcn.c:492 pwrseq_qcom_wcn_probe() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202601081704.7sulC5F2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: 0eb85f468ef515fbd2538375ef3884f6dd376382 [4337/4725] power: sequencing: qcom-wcn: add support for WCN39xx
:::::: branch date: 6 hours ago
:::::: commit date: 25 hours ago
config: microblaze-randconfig-r071-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081704.7sulC5F2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601081704.7sulC5F2-lkp@intel.com/

smatch warnings:
drivers/power/sequencing/pwrseq-qcom-wcn.c:492 pwrseq_qcom_wcn_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +492 drivers/power/sequencing/pwrseq-qcom-wcn.c

0eb85f468ef515 Dmitry Baryshkov    2026-01-06  457  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  458  static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  459  {
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  460  	struct device *dev = &pdev->dev;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  461  	struct pwrseq_qcom_wcn_ctx *ctx;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  462  	struct pwrseq_config config;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  463  	int i, ret;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  464  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  465  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  466  	if (!ctx)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  467  		return -ENOMEM;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  468  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  469  	ctx->of_node = dev->of_node;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  470  
b1857911d84513 Bartosz Golaszewski 2025-11-25  471  	ctx->pdata = device_get_match_data(dev);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  472  	if (!ctx->pdata)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  473  		return dev_err_probe(dev, -ENODEV,
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  474  				     "Failed to obtain platform data\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  475  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  476  	ctx->regs = devm_kcalloc(dev, ctx->pdata->num_vregs,
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  477  				 sizeof(*ctx->regs), GFP_KERNEL);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  478  	if (!ctx->regs)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  479  		return -ENOMEM;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  480  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  481  	for (i = 0; i < ctx->pdata->num_vregs; i++)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  482  		ctx->regs[i].supply = ctx->pdata->vregs[i];
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  483  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  484  	ret = devm_regulator_bulk_get(dev, ctx->pdata->num_vregs, ctx->regs);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  485  	if (ret < 0)
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  486  		return dev_err_probe(dev, ret,
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  487  				     "Failed to get all regulators\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  488  
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  489  	if (ctx->pdata->has_vddio) {
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  490  		ctx->vddio = devm_regulator_get(dev, "vddio");
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  491  		if (IS_ERR(ctx->vddio))
0eb85f468ef515 Dmitry Baryshkov    2026-01-06 @492  			return dev_err_probe(dev, ret, "Failed to get VDDIO\n");
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  493  	}
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  494  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  495  	ctx->bt_gpio = devm_gpiod_get_optional(dev, "bt-enable", GPIOD_OUT_LOW);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  496  	if (IS_ERR(ctx->bt_gpio))
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  497  		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  498  				     "Failed to get the Bluetooth enable GPIO\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  499  
29da3e8748f97d Bartosz Golaszewski 2025-01-02  500  	/*
29da3e8748f97d Bartosz Golaszewski 2025-01-02  501  	 * FIXME: This should actually be GPIOD_OUT_LOW, but doing so would
29da3e8748f97d Bartosz Golaszewski 2025-01-02  502  	 * cause the WLAN power to be toggled, resulting in PCIe link down.
29da3e8748f97d Bartosz Golaszewski 2025-01-02  503  	 * Since the PCIe controller driver is not handling link down currently,
29da3e8748f97d Bartosz Golaszewski 2025-01-02  504  	 * the device becomes unusable. So we need to keep this workaround until
29da3e8748f97d Bartosz Golaszewski 2025-01-02  505  	 * the link down handling is implemented in the controller driver.
29da3e8748f97d Bartosz Golaszewski 2025-01-02  506  	 */
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  507  	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
a9aaf1ff88a8cb Bartosz Golaszewski 2024-08-13  508  						 GPIOD_ASIS);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  509  	if (IS_ERR(ctx->wlan_gpio))
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  510  		return dev_err_probe(dev, PTR_ERR(ctx->wlan_gpio),
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  511  				     "Failed to get the WLAN enable GPIO\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  512  
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  513  	ctx->xo_clk_gpio = devm_gpiod_get_optional(dev, "xo-clk",
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  514  						   GPIOD_OUT_LOW);
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  515  	if (IS_ERR(ctx->xo_clk_gpio))
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  516  		return dev_err_probe(dev, PTR_ERR(ctx->xo_clk_gpio),
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  517  				     "Failed to get the XO_CLK GPIO\n");
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  518  
d8b762070c3fde Bartosz Golaszewski 2024-08-23  519  	/*
d8b762070c3fde Bartosz Golaszewski 2024-08-23  520  	 * Set direction to output but keep the current value in order to not
d8b762070c3fde Bartosz Golaszewski 2024-08-23  521  	 * disable the WLAN module accidentally if it's already powered on.
d8b762070c3fde Bartosz Golaszewski 2024-08-23  522  	 */
d8b762070c3fde Bartosz Golaszewski 2024-08-23  523  	gpiod_direction_output(ctx->wlan_gpio,
d8b762070c3fde Bartosz Golaszewski 2024-08-23  524  			       gpiod_get_value_cansleep(ctx->wlan_gpio));
d8b762070c3fde Bartosz Golaszewski 2024-08-23  525  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  526  	ctx->clk = devm_clk_get_optional(dev, NULL);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  527  	if (IS_ERR(ctx->clk))
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  528  		return dev_err_probe(dev, PTR_ERR(ctx->clk),
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  529  				     "Failed to get the reference clock\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  530  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  531  	memset(&config, 0, sizeof(config));
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  532  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  533  	config.parent = dev;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  534  	config.owner = THIS_MODULE;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  535  	config.drvdata = ctx;
0eb85f468ef515 Dmitry Baryshkov    2026-01-06  536  	config.match = ctx->pdata->match ? : pwrseq_qcom_wcn_match;
bd4c8bafcf50b6 Bartosz Golaszewski 2024-10-18  537  	config.targets = ctx->pdata->targets;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  538  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  539  	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  540  	if (IS_ERR(ctx->pwrseq))
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  541  		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  542  				     "Failed to register the power sequencer\n");
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  543  
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  544  	return 0;
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  545  }
2f1630f437dff2 Bartosz Golaszewski 2024-06-05  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
