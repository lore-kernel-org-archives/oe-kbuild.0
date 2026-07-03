Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B52BD02
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783046428; cv=none; b=m97CqlmkjkK7opKnHQDsVmzmRiDOEQy1lrYCPtgN/IQZagoUnxYvN3esNql2GLsesR/0MjkB5pBg6omLP1ybIsA/z46xhTaRFaik3TLsaVM9WqOuGvNihUrMek5k8dqglc2I0iTG6izu7YNnpsuwdxi8Q040oMCXdCV7kjXcrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783046428; c=relaxed/simple;
	bh=kvinl/7t2WUrDhO1QhkSTMYRHyrmLtdxo0hJ/u4HVas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnaU3omROdeiBEH4JR2VAfxnHLF4DK1r6KpnS6SKiMOzzTCbkkmph1EYfdfdLWRyOu+Mt6Q86lw3rdTmGcHw/KK9YWidWhktYMmdu5oylqwV2B6kJsTiUoDlCFXy5nTusu9lm1QS82X2Y5yrOTe0eMD8+XRrjXkd+QtIEYBk07o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuHt30N7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuHt30N7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783046426; x=1814582426;
  h=date:from:to:cc:subject:message-id;
  bh=kvinl/7t2WUrDhO1QhkSTMYRHyrmLtdxo0hJ/u4HVas=;
  b=DuHt30N7H6SuxemrlShJRWU9VaXtKF6uoNe2RRYTkE0+5qfJIRzIX3zN
   88tqSEqL72h7AcMRfvT8eyiHuBWlXGg0HL/u1HHuVhv1CwkBst2K9dUH3
   e7EAwb2yjj0nTsg867/+vYU9DZ0N6AmDwXymrLpXdHvtGkdPvJMIM6ZjP
   6/ZzNmh1YSvejlPzQLYTC9nB2gtFVuBSptCSZy+6QjxFyJhX2hoZuxgZq
   Pns0evZCfnU7+TU5J1TjveHv5Ard6t7RUztpKkBPdehzfsm9rwDFngceS
   ykDDIAEF9fBkk3EDHGkYd9gHkUhSYm9kX/NH7t45HmnUCUMGgxM8rdfob
   Q==;
X-CSE-ConnectionGUID: FMx8Cf3zQ9a8b9ypgzNGuQ==
X-CSE-MsgGUID: PBiXisyNSoqMPkY6rvoxCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82785946"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="82785946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:40:26 -0700
X-CSE-ConnectionGUID: sT6FpmEoTbGjryJ2Nc0MOA==
X-CSE-MsgGUID: +WsDP3bRSzyskqyMCmyu+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="291124144"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2026 19:40:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfTpA-00000000BZQ-46U2;
	Fri, 03 Jul 2026 02:40:17 +0000
Date: Fri, 03 Jul 2026 10:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1679/3422] sound/soc/meson/aiu.c:313
 aiu_probe() warn: missing unwind goto?
Message-ID: <202607031022.4wWDCjAs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Valerio Setti <vsetti@baylibre.com>
CC: Mark Brown <broonie@kernel.org>
CC: Jerome Brunet <jbrunet@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6eb8711ece2ce27e52e327a5b7a628ed39b97f45
commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [1679/3422] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r071-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031022.4wWDCjAs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031022.4wWDCjAs-lkp@intel.com/

smatch warnings:
sound/soc/meson/aiu.c:313 aiu_probe() warn: missing unwind goto?

vim +313 sound/soc/meson/aiu.c

6ae9ca9ce986bf Jerome Brunet       2020-02-13  253  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  254  static int aiu_probe(struct platform_device *pdev)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  255  {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  256  	struct device *dev = &pdev->dev;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  257  	void __iomem *regs;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  258  	struct regmap *map;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  259  	struct aiu *aiu;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  260  	int ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  261  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  262  	aiu = devm_kzalloc(dev, sizeof(*aiu), GFP_KERNEL);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  263  	if (!aiu)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  264  		return -ENOMEM;
edc761805302db Martin Blumenstingl 2020-02-20  265  
edc761805302db Martin Blumenstingl 2020-02-20  266  	aiu->platform = device_get_match_data(dev);
edc761805302db Martin Blumenstingl 2020-02-20  267  	if (!aiu->platform)
edc761805302db Martin Blumenstingl 2020-02-20  268  		return -ENODEV;
edc761805302db Martin Blumenstingl 2020-02-20  269  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  270  	platform_set_drvdata(pdev, aiu);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  271  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  272  	ret = device_reset(dev);
2ff4e003e8e105 Kuninori Morimoto   2021-12-14  273  	if (ret)
2ff4e003e8e105 Kuninori Morimoto   2021-12-14  274  		return dev_err_probe(dev, ret, "Failed to reset device\n");
6ae9ca9ce986bf Jerome Brunet       2020-02-13  275  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  276  	regs = devm_platform_ioremap_resource(pdev, 0);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  277  	if (IS_ERR(regs))
6ae9ca9ce986bf Jerome Brunet       2020-02-13  278  		return PTR_ERR(regs);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  279  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  280  	map = devm_regmap_init_mmio(dev, regs, &aiu_regmap_cfg);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  281  	if (IS_ERR(map)) {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  282  		dev_err(dev, "failed to init regmap: %ld\n",
6ae9ca9ce986bf Jerome Brunet       2020-02-13  283  			PTR_ERR(map));
6ae9ca9ce986bf Jerome Brunet       2020-02-13  284  		return PTR_ERR(map);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  285  	}
6ae9ca9ce986bf Jerome Brunet       2020-02-13  286  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  287  	aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
6e700f0672199f Jerome Brunet       2020-02-14  288  	if (aiu->i2s.irq < 0)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  289  		return aiu->i2s.irq;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  290  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  291  	aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
6e700f0672199f Jerome Brunet       2020-02-14  292  	if (aiu->spdif.irq < 0)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  293  		return aiu->spdif.irq;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  294  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  295  	ret = aiu_clk_get(dev);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  296  	if (ret)
6ae9ca9ce986bf Jerome Brunet       2020-02-13  297  		return ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  298  
83b83024cdbfdd Valerio Setti       2026-06-10  299  	/* Allocate the aiu-formatter into its widget */
83b83024cdbfdd Valerio Setti       2026-06-10  300  	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
83b83024cdbfdd Valerio Setti       2026-06-10  301  				  &aiu_formatter_i2s_drv, map);
83b83024cdbfdd Valerio Setti       2026-06-10  302  	if (ret) {
83b83024cdbfdd Valerio Setti       2026-06-10  303  		dev_err(dev, "Failed to allocate aiu formatter\n");
83b83024cdbfdd Valerio Setti       2026-06-10  304  		goto err;
83b83024cdbfdd Valerio Setti       2026-06-10  305  	}
83b83024cdbfdd Valerio Setti       2026-06-10  306  
6ae9ca9ce986bf Jerome Brunet       2020-02-13  307  	/* Register the cpu component of the aiu */
6ae9ca9ce986bf Jerome Brunet       2020-02-13  308  	ret = snd_soc_register_component(dev, &aiu_cpu_component,
6ae9ca9ce986bf Jerome Brunet       2020-02-13  309  					 aiu_cpu_dai_drv,
6ae9ca9ce986bf Jerome Brunet       2020-02-13  310  					 ARRAY_SIZE(aiu_cpu_dai_drv));
b82b734c0e9a75 Jerome Brunet       2020-02-13  311  	if (ret) {
6ae9ca9ce986bf Jerome Brunet       2020-02-13  312  		dev_err(dev, "Failed to register cpu component\n");
b82b734c0e9a75 Jerome Brunet       2020-02-13 @313  		return ret;
b82b734c0e9a75 Jerome Brunet       2020-02-13  314  	}
6ae9ca9ce986bf Jerome Brunet       2020-02-13  315  
b82b734c0e9a75 Jerome Brunet       2020-02-13  316  	/* Register the hdmi codec control component */
b82b734c0e9a75 Jerome Brunet       2020-02-13  317  	ret = aiu_hdmi_ctrl_register_component(dev);
b82b734c0e9a75 Jerome Brunet       2020-02-13  318  	if (ret) {
b82b734c0e9a75 Jerome Brunet       2020-02-13  319  		dev_err(dev, "Failed to register hdmi control component\n");
b82b734c0e9a75 Jerome Brunet       2020-02-13  320  		goto err;
b82b734c0e9a75 Jerome Brunet       2020-02-13  321  	}
b82b734c0e9a75 Jerome Brunet       2020-02-13  322  
65816025d46169 Jerome Brunet       2020-02-13  323  	/* Register the internal dac control component on gxl */
edc761805302db Martin Blumenstingl 2020-02-20  324  	if (aiu->platform->has_acodec) {
65816025d46169 Jerome Brunet       2020-02-13  325  		ret = aiu_acodec_ctrl_register_component(dev);
65816025d46169 Jerome Brunet       2020-02-13  326  		if (ret) {
65816025d46169 Jerome Brunet       2020-02-13  327  			dev_err(dev,
65816025d46169 Jerome Brunet       2020-02-13  328  			    "Failed to register acodec control component\n");
65816025d46169 Jerome Brunet       2020-02-13  329  			goto err;
65816025d46169 Jerome Brunet       2020-02-13  330  		}
65816025d46169 Jerome Brunet       2020-02-13  331  	}
65816025d46169 Jerome Brunet       2020-02-13  332  
b82b734c0e9a75 Jerome Brunet       2020-02-13  333  	return 0;
b82b734c0e9a75 Jerome Brunet       2020-02-13  334  err:
83b83024cdbfdd Valerio Setti       2026-06-10  335  	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
b82b734c0e9a75 Jerome Brunet       2020-02-13  336  	snd_soc_unregister_component(dev);
6ae9ca9ce986bf Jerome Brunet       2020-02-13  337  	return ret;
6ae9ca9ce986bf Jerome Brunet       2020-02-13  338  }
6ae9ca9ce986bf Jerome Brunet       2020-02-13  339  

:::::: The code at line 313 was first introduced by commit
:::::: b82b734c0e9a75e1b956214ac523a8eb590f51f3 ASoC: meson: aiu: add hdmi codec control support

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
