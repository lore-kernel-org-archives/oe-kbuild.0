Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856A19DF62
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604950; cv=none; b=KAbhPI+Jan5OFQLAaBA+EZbL4PV2Cxzf6bwr1LVbYPE6YIE3SA8FgjhxiR4vEyiCN+7j0Jwmb6KnRsAuQTTPQ97f6m9Gbgf4uag1oreGS0CjGd45VoYYse9ceRe+x2+T1jiRhZszHlOBzv6QJNxRu55LoYkG9uL4wS3LPVKF640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604950; c=relaxed/simple;
	bh=ICfiKHKqZ5vkXik18599Shv59v7qIwhiTg5Za9dI42o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GPIjlfdaGccLth0D+zuy8UJUDV6Vd8Wg4uPa4t62Y+f/rYAa1jOs4+q1S6RVKzrOEeD3CmfOnFoZaLe4F3peXXK2JueLVErsba7C1mrufCh3ALMn07XeRrAMUAVenjGS5Bvri2XYhmastROcdKJzNp+HVIJ/FOsDvjN6AbWR11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSFiFXK/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSFiFXK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765604947; x=1797140947;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ICfiKHKqZ5vkXik18599Shv59v7qIwhiTg5Za9dI42o=;
  b=TSFiFXK/kP9Ymo2/kLD7H5UqJ4lGHs7d/7fq3kus54fd563FHR1FY+gO
   xdVLsIwWtA/7oK1OUvgUeaO2riUiivA8AUN65W3bSWTmxwihD7UFWc8Mt
   uQdx+D2mtOgZvRY6cake+sbRa5sWJyrhaUB3oVT1qPS5+nesFjJoD8+lG
   snYNbsTrsb9AAGktSaRIY7Ugf1sK/+bdqzpv0l24suo2Enrel9umZD17a
   TgcqjwWkO1I9bqjydHPwWaOdMQ1tV065zfTJcWnyvYzqIv6DFga4wPj3g
   FxpPat8d1kYgQTJ+EgUsy+gQaXBmDWd5BdUT6p8eqlJ0QsSW6d9McqlNd
   Q==;
X-CSE-ConnectionGUID: VOtI6RcSSLyyZaT82x1tFQ==
X-CSE-MsgGUID: /GhwQbkkQv2LSiyd+BaGrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67756968"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67756968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:49:04 -0800
X-CSE-ConnectionGUID: F4I+bI8aTWefdepXY0U9/g==
X-CSE-MsgGUID: AFrO7+xZR62FJg8oIT5ZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197760804"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 21:49:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIV3-0000000077p-20ii;
	Sat, 13 Dec 2025 05:49:01 +0000
Date: Sat, 13 Dec 2025 13:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/regulator/pca9450-regulator.c:1097 pca9450_i2c_probe()
 error: uninitialized symbol 'ldo5'.
Message-ID: <202512131316.xgaTDL8j-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b regulator: pca9450: Fix control register for LDO5
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131316.xgaTDL8j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131316.xgaTDL8j-lkp@intel.com/

smatch warnings:
drivers/regulator/pca9450-regulator.c:1097 pca9450_i2c_probe() error: uninitialized symbol 'ldo5'.

vim +/ldo5 +1097 drivers/regulator/pca9450-regulator.c

0935ff5f1f0a44 Robin Gong          2020-07-04   963  
ed56fa6e804cb1 Uwe Kleine-König    2022-11-18   964  static int pca9450_i2c_probe(struct i2c_client *i2c)
0935ff5f1f0a44 Robin Gong          2020-07-04   965  {
0935ff5f1f0a44 Robin Gong          2020-07-04   966  	enum pca9450_chip_type type = (unsigned int)(uintptr_t)
0935ff5f1f0a44 Robin Gong          2020-07-04   967  				      of_device_get_match_data(&i2c->dev);
0935ff5f1f0a44 Robin Gong          2020-07-04   968  	const struct pca9450_regulator_desc	*regulator_desc;
0935ff5f1f0a44 Robin Gong          2020-07-04   969  	struct regulator_config config = { };
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18   970  	struct regulator_dev *ldo5;
0935ff5f1f0a44 Robin Gong          2020-07-04   971  	struct pca9450 *pca9450;
0935ff5f1f0a44 Robin Gong          2020-07-04   972  	unsigned int device_id, i;
2364a64d0673f5 Rickard x Andersson 2022-04-29   973  	unsigned int reset_ctrl;
0935ff5f1f0a44 Robin Gong          2020-07-04   974  	int ret;
0935ff5f1f0a44 Robin Gong          2020-07-04   975  
0935ff5f1f0a44 Robin Gong          2020-07-04   976  	pca9450 = devm_kzalloc(&i2c->dev, sizeof(struct pca9450), GFP_KERNEL);
0935ff5f1f0a44 Robin Gong          2020-07-04   977  	if (!pca9450)
0935ff5f1f0a44 Robin Gong          2020-07-04   978  		return -ENOMEM;
0935ff5f1f0a44 Robin Gong          2020-07-04   979  
0935ff5f1f0a44 Robin Gong          2020-07-04   980  	switch (type) {
0935ff5f1f0a44 Robin Gong          2020-07-04   981  	case PCA9450_TYPE_PCA9450A:
0935ff5f1f0a44 Robin Gong          2020-07-04   982  		regulator_desc = pca9450a_regulators;
0935ff5f1f0a44 Robin Gong          2020-07-04   983  		pca9450->rcnt = ARRAY_SIZE(pca9450a_regulators);
0935ff5f1f0a44 Robin Gong          2020-07-04   984  		break;
0935ff5f1f0a44 Robin Gong          2020-07-04   985  	case PCA9450_TYPE_PCA9450BC:
0935ff5f1f0a44 Robin Gong          2020-07-04   986  		regulator_desc = pca9450bc_regulators;
0935ff5f1f0a44 Robin Gong          2020-07-04   987  		pca9450->rcnt = ARRAY_SIZE(pca9450bc_regulators);
0935ff5f1f0a44 Robin Gong          2020-07-04   988  		break;
5edeb7d3126289 Joy Zou             2024-03-18   989  	case PCA9450_TYPE_PCA9451A:
017b76fb8e5b60 Joy Zou             2024-12-05   990  	case PCA9450_TYPE_PCA9452:
5edeb7d3126289 Joy Zou             2024-03-18   991  		regulator_desc = pca9451a_regulators;
5edeb7d3126289 Joy Zou             2024-03-18   992  		pca9450->rcnt = ARRAY_SIZE(pca9451a_regulators);
5edeb7d3126289 Joy Zou             2024-03-18   993  		break;
0935ff5f1f0a44 Robin Gong          2020-07-04   994  	default:
0935ff5f1f0a44 Robin Gong          2020-07-04   995  		dev_err(&i2c->dev, "Unknown device type");
0935ff5f1f0a44 Robin Gong          2020-07-04   996  		return -EINVAL;
0935ff5f1f0a44 Robin Gong          2020-07-04   997  	}
0935ff5f1f0a44 Robin Gong          2020-07-04   998  
0935ff5f1f0a44 Robin Gong          2020-07-04   999  	pca9450->irq = i2c->irq;
0935ff5f1f0a44 Robin Gong          2020-07-04  1000  	pca9450->type = type;
0935ff5f1f0a44 Robin Gong          2020-07-04  1001  	pca9450->dev = &i2c->dev;
0935ff5f1f0a44 Robin Gong          2020-07-04  1002  
0935ff5f1f0a44 Robin Gong          2020-07-04  1003  	dev_set_drvdata(&i2c->dev, pca9450);
0935ff5f1f0a44 Robin Gong          2020-07-04  1004  
0935ff5f1f0a44 Robin Gong          2020-07-04  1005  	pca9450->regmap = devm_regmap_init_i2c(i2c,
0935ff5f1f0a44 Robin Gong          2020-07-04  1006  					       &pca9450_regmap_config);
0f5c601098bd3c Frank Li            2024-12-05  1007  	if (IS_ERR(pca9450->regmap))
0f5c601098bd3c Frank Li            2024-12-05  1008  		return dev_err_probe(&i2c->dev, PTR_ERR(pca9450->regmap),
0f5c601098bd3c Frank Li            2024-12-05  1009  				     "regmap initialization failed\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  1010  
0935ff5f1f0a44 Robin Gong          2020-07-04  1011  	ret = regmap_read(pca9450->regmap, PCA9450_REG_DEV_ID, &device_id);
0f5c601098bd3c Frank Li            2024-12-05  1012  	if (ret)
0f5c601098bd3c Frank Li            2024-12-05  1013  		return dev_err_probe(&i2c->dev, ret, "Read device id error\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  1014  
0935ff5f1f0a44 Robin Gong          2020-07-04  1015  	/* Check your board and dts for match the right pmic */
0935ff5f1f0a44 Robin Gong          2020-07-04  1016  	if (((device_id >> 4) != 0x1 && type == PCA9450_TYPE_PCA9450A) ||
5edeb7d3126289 Joy Zou             2024-03-18  1017  	    ((device_id >> 4) != 0x3 && type == PCA9450_TYPE_PCA9450BC) ||
017b76fb8e5b60 Joy Zou             2024-12-05  1018  	    ((device_id >> 4) != 0x9 && type == PCA9450_TYPE_PCA9451A) ||
017b76fb8e5b60 Joy Zou             2024-12-05  1019  	    ((device_id >> 4) != 0x9 && type == PCA9450_TYPE_PCA9452))
0f5c601098bd3c Frank Li            2024-12-05  1020  		return dev_err_probe(&i2c->dev, -EINVAL,
0f5c601098bd3c Frank Li            2024-12-05  1021  				     "Device id(%x) mismatched\n", device_id >> 4);
0935ff5f1f0a44 Robin Gong          2020-07-04  1022  
0935ff5f1f0a44 Robin Gong          2020-07-04  1023  	for (i = 0; i < pca9450->rcnt; i++) {
0935ff5f1f0a44 Robin Gong          2020-07-04  1024  		const struct regulator_desc *desc;
0935ff5f1f0a44 Robin Gong          2020-07-04  1025  		struct regulator_dev *rdev;
0935ff5f1f0a44 Robin Gong          2020-07-04  1026  		const struct pca9450_regulator_desc *r;
0935ff5f1f0a44 Robin Gong          2020-07-04  1027  
0935ff5f1f0a44 Robin Gong          2020-07-04  1028  		r = &regulator_desc[i];
0935ff5f1f0a44 Robin Gong          2020-07-04  1029  		desc = &r->desc;
0935ff5f1f0a44 Robin Gong          2020-07-04  1030  
017b76fb8e5b60 Joy Zou             2024-12-05  1031  		if (type == PCA9450_TYPE_PCA9451A && !strcmp(desc->name, "ldo3"))
017b76fb8e5b60 Joy Zou             2024-12-05  1032  			continue;
017b76fb8e5b60 Joy Zou             2024-12-05  1033  
0935ff5f1f0a44 Robin Gong          2020-07-04  1034  		config.regmap = pca9450->regmap;
0935ff5f1f0a44 Robin Gong          2020-07-04  1035  		config.dev = pca9450->dev;
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1036  		config.driver_data = pca9450;
0935ff5f1f0a44 Robin Gong          2020-07-04  1037  
0935ff5f1f0a44 Robin Gong          2020-07-04  1038  		rdev = devm_regulator_register(pca9450->dev, desc, &config);
0f5c601098bd3c Frank Li            2024-12-05  1039  		if (IS_ERR(rdev))
0f5c601098bd3c Frank Li            2024-12-05  1040  			return dev_err_probe(pca9450->dev, PTR_ERR(rdev),
0f5c601098bd3c Frank Li            2024-12-05  1041  					     "Failed to register regulator(%s)\n", desc->name);
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1042  
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1043  		if (!strcmp(desc->name, "ldo5"))
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1044  			ldo5 = rdev;
0935ff5f1f0a44 Robin Gong          2020-07-04  1045  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  1046  
83808c54064eef Frieder Schrempf    2024-07-08  1047  	if (pca9450->irq) {
0935ff5f1f0a44 Robin Gong          2020-07-04  1048  		ret = devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
0935ff5f1f0a44 Robin Gong          2020-07-04  1049  						pca9450_irq_handler,
0935ff5f1f0a44 Robin Gong          2020-07-04  1050  						(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
0935ff5f1f0a44 Robin Gong          2020-07-04  1051  						"pca9450-irq", pca9450);
0f5c601098bd3c Frank Li            2024-12-05  1052  		if (ret != 0)
0f5c601098bd3c Frank Li            2024-12-05  1053  			return dev_err_probe(pca9450->dev, ret, "Failed to request IRQ: %d\n",
0935ff5f1f0a44 Robin Gong          2020-07-04  1054  					     pca9450->irq);
0f5c601098bd3c Frank Li            2024-12-05  1055  
0935ff5f1f0a44 Robin Gong          2020-07-04  1056  		/* Unmask all interrupt except PWRON/WDOG/RSVD */
0935ff5f1f0a44 Robin Gong          2020-07-04  1057  		ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_INT1_MSK,
0935ff5f1f0a44 Robin Gong          2020-07-04  1058  					IRQ_VR_FLT1 | IRQ_VR_FLT2 | IRQ_LOWVSYS |
0935ff5f1f0a44 Robin Gong          2020-07-04  1059  					IRQ_THERM_105 | IRQ_THERM_125,
0935ff5f1f0a44 Robin Gong          2020-07-04  1060  					IRQ_PWRON | IRQ_WDOGB | IRQ_RSVD);
0f5c601098bd3c Frank Li            2024-12-05  1061  		if (ret)
0f5c601098bd3c Frank Li            2024-12-05  1062  			return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
83808c54064eef Frieder Schrempf    2024-07-08  1063  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  1064  
98b94b6e38ca0c Frieder Schrempf    2021-02-22  1065  	/* Clear PRESET_EN bit in BUCK123_DVS to use DVS registers */
98b94b6e38ca0c Frieder Schrempf    2021-02-22  1066  	ret = regmap_clear_bits(pca9450->regmap, PCA9450_REG_BUCK123_DVS,
98b94b6e38ca0c Frieder Schrempf    2021-02-22  1067  				BUCK123_PRESET_EN);
0f5c601098bd3c Frank Li            2024-12-05  1068  	if (ret)
0f5c601098bd3c Frank Li            2024-12-05  1069  		return dev_err_probe(&i2c->dev, ret,  "Failed to clear PRESET_EN bit\n");
98b94b6e38ca0c Frieder Schrempf    2021-02-22  1070  
2364a64d0673f5 Rickard x Andersson 2022-04-29  1071  	if (of_property_read_bool(i2c->dev.of_node, "nxp,wdog_b-warm-reset"))
2364a64d0673f5 Rickard x Andersson 2022-04-29  1072  		reset_ctrl = WDOG_B_CFG_WARM;
2364a64d0673f5 Rickard x Andersson 2022-04-29  1073  	else
2364a64d0673f5 Rickard x Andersson 2022-04-29  1074  		reset_ctrl = WDOG_B_CFG_COLD_LDO12;
2364a64d0673f5 Rickard x Andersson 2022-04-29  1075  
f7684f5a048feb Frieder Schrempf    2021-02-11  1076  	/* Set reset behavior on assertion of WDOG_B signal */
f7684f5a048feb Frieder Schrempf    2021-02-11  1077  	ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_RESET_CTRL,
2364a64d0673f5 Rickard x Andersson 2022-04-29  1078  				 WDOG_B_CFG_MASK, reset_ctrl);
0f5c601098bd3c Frank Li            2024-12-05  1079  	if (ret)
0f5c601098bd3c Frank Li            2024-12-05  1080  		return dev_err_probe(&i2c->dev, ret, "Failed to set WDOG_B reset behavior\n");
f7684f5a048feb Frieder Schrempf    2021-02-11  1081  
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1082  	if (of_property_read_bool(i2c->dev.of_node, "nxp,i2c-lt-enable")) {
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1083  		/* Enable I2C Level Translator */
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1084  		ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_CONFIG2,
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1085  					 I2C_LT_MASK, I2C_LT_ON_STANDBY_RUN);
0f5c601098bd3c Frank Li            2024-12-05  1086  		if (ret)
0f5c601098bd3c Frank Li            2024-12-05  1087  			return dev_err_probe(&i2c->dev, ret,
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1088  					     "Failed to enable I2C level translator\n");
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1089  	}
62139f52b7e588 Per-Daniel Olsson   2022-04-29  1090  
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1091  	/*
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1092  	 * For LDO5 we need to be able to check the status of the SD_VSEL input in
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1093  	 * order to know which control register is used. Most boards connect SD_VSEL
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1094  	 * to the VSELECT signal, so we can use the GPIO that is internally routed
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1095  	 * to this signal (if SION bit is set in IOMUX).
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1096  	 */
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18 @1097  	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1098  	if (IS_ERR(pca9450->sd_vsel_gpio)) {
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1099  		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1100  		return ret;
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1101  	}
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1102  
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1103  	/*
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1104  	 * For LDO5 we need to be able to check the status of the SD_VSEL input in
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1105  	 * order to know which control register is used. Most boards connect SD_VSEL
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1106  	 * to the VSELECT signal, so we can use the GPIO that is internally routed
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1107  	 * to this signal (if SION bit is set in IOMUX).
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1108  	 */
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1109  	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1110  	if (IS_ERR(pca9450->sd_vsel_gpio)) {
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1111  		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1112  		return ret;
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1113  	}
3ce6f4f943ddd9 Frieder Schrempf    2024-12-18  1114  
0935ff5f1f0a44 Robin Gong          2020-07-04  1115  	dev_info(&i2c->dev, "%s probed.\n",
5edeb7d3126289 Joy Zou             2024-03-18  1116  		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
5edeb7d3126289 Joy Zou             2024-03-18  1117  		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
0935ff5f1f0a44 Robin Gong          2020-07-04  1118  
0935ff5f1f0a44 Robin Gong          2020-07-04  1119  	return 0;
0935ff5f1f0a44 Robin Gong          2020-07-04  1120  }
0935ff5f1f0a44 Robin Gong          2020-07-04  1121  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
