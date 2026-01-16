Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A231F1932
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591040; cv=none; b=FQWbv8v8OXUbiBP0Lo9W0OzDsqR2KwZBQ/Q8X0X6Ck0QXkc2iIiu4NZYUed9hwxR4L2RVHQGMSWCtovOKCvVXp2oPJ48he732KzshC2LJIpy4U5H701WFaCuv5ePb32bPZsicHNNJEPXlSyojvqZZGI5fHLiZhvTSyVBKaGdpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591040; c=relaxed/simple;
	bh=ULCl2uUYTASix6Zzu6o/8o5QbD9Px65gf8o5V/NxHto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMtFTdO1MBUbYiwUWHw6FF5LL1TRXljH+fRP+6YgA+LbmTnAL5Js8DKKUmr0A+uHjAxkNgLTzpMoXCi8GTGctxX5E4wBcqpMAG9Hg9ZWfZcCbxBQjTUyfVzAuH1izFde4cQ7a+gY1HtmQ3dz3s6Ac4AFzwBAh3hkAoBbXdKAGvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kArnN+tf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kArnN+tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768591038; x=1800127038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULCl2uUYTASix6Zzu6o/8o5QbD9Px65gf8o5V/NxHto=;
  b=kArnN+tfuQ5u0aR9ccCFxK5wnhxKKtGjfrIB6aZt88QT3swrFYH92GBj
   OFfR1zMKLGEzuRmzvAYeT1gR7MSOBQtSBa0IZM4yJqc5ZWT6Z30mcTt++
   OsKi+wfaab/FJQpSHThHyD4g87lU6gm/MBSOxTWYxQsx+2ns8Ie95W4zy
   RyArbduP0j+6z96itrYT5jAZdJ+/Rzy+gMhobWDTwCElwf8RSYcP0adZG
   0z6ErBHVst1OaNRU3pFHBR8IbHtWbn3MTSqAIAWR4g+AwPB4FobzoTE9f
   74CMgFi6Fo2mzDT2X12kzlK+y/a4DLbu2yqTV/9LR3WYgkTVNT2fHYS/a
   Q==;
X-CSE-ConnectionGUID: lo0+Y1JtR2Oyl0JRsBidcQ==
X-CSE-MsgGUID: qgT63UV/SYesDn7/7wzU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69812257"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69812257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 11:17:17 -0800
X-CSE-ConnectionGUID: Kc20NHciSzWO4GukkbqCGA==
X-CSE-MsgGUID: sc3GtCTBS56RpkFk4iZt3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205750353"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 11:17:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgpJp-00000000L9w-2Ip5;
	Fri, 16 Jan 2026 19:17:13 +0000
Date: Sat, 17 Jan 2026 03:17:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
Message-ID: <202601170203.upPyGvI2-lkp@intel.com>
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
In-Reply-To: <20260116101648.377952-3-shengjiu.wang@nxp.com>
References: <20260116101648.377952-3-shengjiu.wang@nxp.com>
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
TO: shengjiu.wang@gmail.com
TO: Xiubo.Lee@gmail.com
TO: festevam@gmail.com
TO: nicoleotsuka@gmail.com
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: perex@perex.cz
TO: tiwai@suse.com
TO: linux-sound@vger.kernel.org
TO: linuxppc-dev@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: kernel@pengutronix.de
TO: imx@lists.linux.dev
TO: linux-arm-kernel@lists.infradead.org

Hi Shengjiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on shawnguo/for-next linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-dt-bindings-fsl-audmix-Add-support-for-i-MX952-platform/20260116-182050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260116101648.377952-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_audmix: Add support for i.MX952 platform
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170203.upPyGvI2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601170203.upPyGvI2-lkp@intel.com/

smatch warnings:
sound/soc/fsl/fsl_audmix.c:522 fsl_audmix_probe() warn: missing error code 'ret'

vim +/ret +522 sound/soc/fsl/fsl_audmix.c

f2a36a78423ee8 Viorel Suman  2019-04-10  464  
be1df61cf06efb Viorel Suman  2019-01-22  465  static int fsl_audmix_probe(struct platform_device *pdev)
be1df61cf06efb Viorel Suman  2019-01-22  466  {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  467  	const struct fsl_audmix_soc_data *soc_data;
62be484f7ad844 Viorel Suman  2019-04-10  468  	struct device *dev = &pdev->dev;
be1df61cf06efb Viorel Suman  2019-01-22  469  	struct fsl_audmix *priv;
be1df61cf06efb Viorel Suman  2019-01-22  470  	void __iomem *regs;
be1df61cf06efb Viorel Suman  2019-01-22  471  	int ret;
f2a36a78423ee8 Viorel Suman  2019-04-10  472  
62be484f7ad844 Viorel Suman  2019-04-10  473  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
be1df61cf06efb Viorel Suman  2019-01-22  474  	if (!priv)
be1df61cf06efb Viorel Suman  2019-01-22  475  		return -ENOMEM;
be1df61cf06efb Viorel Suman  2019-01-22  476  
be1df61cf06efb Viorel Suman  2019-01-22  477  	/* Get the addresses */
959bb6b54d7086 YueHaibing    2019-07-27  478  	regs = devm_platform_ioremap_resource(pdev, 0);
be1df61cf06efb Viorel Suman  2019-01-22  479  	if (IS_ERR(regs))
be1df61cf06efb Viorel Suman  2019-01-22  480  		return PTR_ERR(regs);
be1df61cf06efb Viorel Suman  2019-01-22  481  
3feaba79d8f701 Shengjiu Wang 2021-03-24  482  	priv->regmap = devm_regmap_init_mmio(dev, regs, &fsl_audmix_regmap_config);
be1df61cf06efb Viorel Suman  2019-01-22  483  	if (IS_ERR(priv->regmap)) {
62be484f7ad844 Viorel Suman  2019-04-10  484  		dev_err(dev, "failed to init regmap\n");
be1df61cf06efb Viorel Suman  2019-01-22  485  		return PTR_ERR(priv->regmap);
be1df61cf06efb Viorel Suman  2019-01-22  486  	}
be1df61cf06efb Viorel Suman  2019-01-22  487  
62be484f7ad844 Viorel Suman  2019-04-10  488  	priv->ipg_clk = devm_clk_get(dev, "ipg");
be1df61cf06efb Viorel Suman  2019-01-22  489  	if (IS_ERR(priv->ipg_clk)) {
62be484f7ad844 Viorel Suman  2019-04-10  490  		dev_err(dev, "failed to get ipg clock\n");
be1df61cf06efb Viorel Suman  2019-01-22  491  		return PTR_ERR(priv->ipg_clk);
be1df61cf06efb Viorel Suman  2019-01-22  492  	}
be1df61cf06efb Viorel Suman  2019-01-22  493  
fe965096c9495d Shengjiu Wang 2019-11-11  494  	spin_lock_init(&priv->lock);
be1df61cf06efb Viorel Suman  2019-01-22  495  	platform_set_drvdata(pdev, priv);
62be484f7ad844 Viorel Suman  2019-04-10  496  	pm_runtime_enable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  497  
62be484f7ad844 Viorel Suman  2019-04-10  498  	ret = devm_snd_soc_register_component(dev, &fsl_audmix_component,
be1df61cf06efb Viorel Suman  2019-01-22  499  					      fsl_audmix_dai,
be1df61cf06efb Viorel Suman  2019-01-22  500  					      ARRAY_SIZE(fsl_audmix_dai));
be1df61cf06efb Viorel Suman  2019-01-22  501  	if (ret) {
62be484f7ad844 Viorel Suman  2019-04-10  502  		dev_err(dev, "failed to register ASoC DAI\n");
77fffa742285f2 Chuhong Yuan  2019-12-03  503  		goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  504  	}
be1df61cf06efb Viorel Suman  2019-01-22  505  
294a60e5e98300 Shengjiu Wang 2025-02-26  506  	/*
294a60e5e98300 Shengjiu Wang 2025-02-26  507  	 * If dais property exist, then register the imx-audmix card driver.
294a60e5e98300 Shengjiu Wang 2025-02-26  508  	 * otherwise, it should be linked by audio graph card.
294a60e5e98300 Shengjiu Wang 2025-02-26  509  	 */
294a60e5e98300 Shengjiu Wang 2025-02-26  510  	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
5057d108d69a55 Fabio Estevam 2020-12-02  511  		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
be1df61cf06efb Viorel Suman  2019-01-22  512  		if (IS_ERR(priv->pdev)) {
be1df61cf06efb Viorel Suman  2019-01-22  513  			ret = PTR_ERR(priv->pdev);
5057d108d69a55 Fabio Estevam 2020-12-02  514  			dev_err(dev, "failed to register platform: %d\n", ret);
77fffa742285f2 Chuhong Yuan  2019-12-03  515  			goto err_disable_pm;
be1df61cf06efb Viorel Suman  2019-01-22  516  		}
294a60e5e98300 Shengjiu Wang 2025-02-26  517  	}
be1df61cf06efb Viorel Suman  2019-01-22  518  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  519  	soc_data = of_device_get_match_data(dev);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  520  	if (!soc_data) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  521  		dev_err(dev, "failed to match device\n");
0c44e9e9e61cde Shengjiu Wang 2026-01-16 @522  		goto err_disable_pm;
0c44e9e9e61cde Shengjiu Wang 2026-01-16  523  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  524  
0c44e9e9e61cde Shengjiu Wang 2026-01-16  525  	if (of_property_read_bool(pdev->dev.of_node, "fsl,amix-bypass") &&
0c44e9e9e61cde Shengjiu Wang 2026-01-16  526  	    soc_data->bypass_index > 0) {
0c44e9e9e61cde Shengjiu Wang 2026-01-16  527  		ret = scmi_imx_misc_ctrl_set(soc_data->bypass_index, 0);
0c44e9e9e61cde Shengjiu Wang 2026-01-16  528  		if (ret)
0c44e9e9e61cde Shengjiu Wang 2026-01-16  529  			goto err_disable_pm;
0c44e9e9e61cde Shengjiu Wang 2026-01-16  530  	}
0c44e9e9e61cde Shengjiu Wang 2026-01-16  531  
77fffa742285f2 Chuhong Yuan  2019-12-03  532  	return 0;
77fffa742285f2 Chuhong Yuan  2019-12-03  533  
77fffa742285f2 Chuhong Yuan  2019-12-03  534  err_disable_pm:
77fffa742285f2 Chuhong Yuan  2019-12-03  535  	pm_runtime_disable(dev);
be1df61cf06efb Viorel Suman  2019-01-22  536  	return ret;
be1df61cf06efb Viorel Suman  2019-01-22  537  }
be1df61cf06efb Viorel Suman  2019-01-22  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
