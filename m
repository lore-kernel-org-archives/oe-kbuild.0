Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC5C0A3
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Feb 2023 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676411605; x=1707947605;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OEmSfnren99XsVIciYnWbGGesAKyT2hOubHEQb3e54A=;
  b=K8Rabp2ayyFIRj4duVDg6QNz3zDyNydwYgtf2rUlaQCFD+UPRb1fo5Pv
   JmpKeKPQcCr1WzH9WPt8git5TqOm5buEpXh6/2hTEeETwSIrAeOnWgzbf
   T25yJNkyDQHW4qo7Zwk3tM6B139ybuSq6pGA8kxOk+EAAnH0KcxVlBnbu
   iRVJhhaq0DLuM2uVLhIZziofPgsVHt7dd6reTMT+hwEVMZnVg3SqpZO6C
   ZkUqun63r2jtLCWdR4QmjJMVTeTkCkzCjvw8RU56MmaOS1+WW8nh9eZDu
   EkGwXrFzTMBhm7XEGv7VzUi8+lZYLPWGdGB6c9/Qbsk5PrWgt7jgUaavd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319311711"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="319311711"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 13:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671379750"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="671379750"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 13:53:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS3Eo-0008oD-22;
	Tue, 14 Feb 2023 21:53:22 +0000
Date: Wed, 15 Feb 2023 05:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/6] regulator: pca9450: Fix control register for LDO5
Message-ID: <202302150540.GhiyJj5s-lkp@intel.com>
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
In-Reply-To: <20230213155833.1644366-6-frieder@fris.de>
References: <20230213155833.1644366-6-frieder@fris.de>
TO: Frieder Schrempf <frieder@fris.de>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: linux-kernel@vger.kernel.org
TO: Mark Brown <broonie@kernel.org>
CC: Marek Vasut <marex@denx.de>
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
CC: "Per-Daniel Olsson" <perdo@axis.com>
CC: Rickard x Andersson <rickaran@axis.com>
CC: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

Hi Frieder,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on shawnguo/for-next arm/for-next arm/fixes arm64/for-next/core kvmarm/next rockchip/for-next soc/for-next xilinx-xlnx/master linus/master v6.2-rc8 next-20230214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frieder-Schrempf/dt-bindings-regulator-pca9450-Document-new-usage-of-sd-vsel-gpios/20230214-013045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230213155833.1644366-6-frieder%40fris.de
patch subject: [PATCH 5/6] regulator: pca9450: Fix control register for LDO5
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230215/202302150540.GhiyJj5s-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302150540.GhiyJj5s-lkp@intel.com/

smatch warnings:
drivers/regulator/pca9450-regulator.c:866 pca9450_i2c_probe() error: uninitialized symbol 'ldo5'.

vim +/ldo5 +866 drivers/regulator/pca9450-regulator.c

0935ff5f1f0a44 Robin Gong          2020-07-04  721  
ed56fa6e804cb1 Uwe Kleine-König    2022-11-18  722  static int pca9450_i2c_probe(struct i2c_client *i2c)
0935ff5f1f0a44 Robin Gong          2020-07-04  723  {
0935ff5f1f0a44 Robin Gong          2020-07-04  724  	enum pca9450_chip_type type = (unsigned int)(uintptr_t)
0935ff5f1f0a44 Robin Gong          2020-07-04  725  				      of_device_get_match_data(&i2c->dev);
0935ff5f1f0a44 Robin Gong          2020-07-04  726  	const struct pca9450_regulator_desc	*regulator_desc;
0935ff5f1f0a44 Robin Gong          2020-07-04  727  	struct regulator_config config = { };
f722e874661add Frieder Schrempf    2023-02-13  728  	struct regulator_dev *ldo5;
0935ff5f1f0a44 Robin Gong          2020-07-04  729  	struct pca9450 *pca9450;
0935ff5f1f0a44 Robin Gong          2020-07-04  730  	unsigned int device_id, i;
2364a64d0673f5 Rickard x Andersson 2022-04-29  731  	unsigned int reset_ctrl;
0935ff5f1f0a44 Robin Gong          2020-07-04  732  	int ret;
0935ff5f1f0a44 Robin Gong          2020-07-04  733  
0935ff5f1f0a44 Robin Gong          2020-07-04  734  	if (!i2c->irq) {
0935ff5f1f0a44 Robin Gong          2020-07-04  735  		dev_err(&i2c->dev, "No IRQ configured?\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  736  		return -EINVAL;
0935ff5f1f0a44 Robin Gong          2020-07-04  737  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  738  
0935ff5f1f0a44 Robin Gong          2020-07-04  739  	pca9450 = devm_kzalloc(&i2c->dev, sizeof(struct pca9450), GFP_KERNEL);
0935ff5f1f0a44 Robin Gong          2020-07-04  740  	if (!pca9450)
0935ff5f1f0a44 Robin Gong          2020-07-04  741  		return -ENOMEM;
0935ff5f1f0a44 Robin Gong          2020-07-04  742  
0935ff5f1f0a44 Robin Gong          2020-07-04  743  	switch (type) {
0935ff5f1f0a44 Robin Gong          2020-07-04  744  	case PCA9450_TYPE_PCA9450A:
0935ff5f1f0a44 Robin Gong          2020-07-04  745  		regulator_desc = pca9450a_regulators;
0935ff5f1f0a44 Robin Gong          2020-07-04  746  		pca9450->rcnt = ARRAY_SIZE(pca9450a_regulators);
0935ff5f1f0a44 Robin Gong          2020-07-04  747  		break;
0935ff5f1f0a44 Robin Gong          2020-07-04  748  	case PCA9450_TYPE_PCA9450BC:
0935ff5f1f0a44 Robin Gong          2020-07-04  749  		regulator_desc = pca9450bc_regulators;
0935ff5f1f0a44 Robin Gong          2020-07-04  750  		pca9450->rcnt = ARRAY_SIZE(pca9450bc_regulators);
0935ff5f1f0a44 Robin Gong          2020-07-04  751  		break;
0935ff5f1f0a44 Robin Gong          2020-07-04  752  	default:
0935ff5f1f0a44 Robin Gong          2020-07-04  753  		dev_err(&i2c->dev, "Unknown device type");
0935ff5f1f0a44 Robin Gong          2020-07-04  754  		return -EINVAL;
0935ff5f1f0a44 Robin Gong          2020-07-04  755  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  756  
0935ff5f1f0a44 Robin Gong          2020-07-04  757  	pca9450->irq = i2c->irq;
0935ff5f1f0a44 Robin Gong          2020-07-04  758  	pca9450->type = type;
0935ff5f1f0a44 Robin Gong          2020-07-04  759  	pca9450->dev = &i2c->dev;
0935ff5f1f0a44 Robin Gong          2020-07-04  760  
0935ff5f1f0a44 Robin Gong          2020-07-04  761  	dev_set_drvdata(&i2c->dev, pca9450);
0935ff5f1f0a44 Robin Gong          2020-07-04  762  
0935ff5f1f0a44 Robin Gong          2020-07-04  763  	pca9450->regmap = devm_regmap_init_i2c(i2c,
0935ff5f1f0a44 Robin Gong          2020-07-04  764  					       &pca9450_regmap_config);
0935ff5f1f0a44 Robin Gong          2020-07-04  765  	if (IS_ERR(pca9450->regmap)) {
0935ff5f1f0a44 Robin Gong          2020-07-04  766  		dev_err(&i2c->dev, "regmap initialization failed\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  767  		return PTR_ERR(pca9450->regmap);
0935ff5f1f0a44 Robin Gong          2020-07-04  768  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  769  
0935ff5f1f0a44 Robin Gong          2020-07-04  770  	ret = regmap_read(pca9450->regmap, PCA9450_REG_DEV_ID, &device_id);
0935ff5f1f0a44 Robin Gong          2020-07-04  771  	if (ret) {
0935ff5f1f0a44 Robin Gong          2020-07-04  772  		dev_err(&i2c->dev, "Read device id error\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  773  		return ret;
0935ff5f1f0a44 Robin Gong          2020-07-04  774  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  775  
0935ff5f1f0a44 Robin Gong          2020-07-04  776  	/* Check your board and dts for match the right pmic */
0935ff5f1f0a44 Robin Gong          2020-07-04  777  	if (((device_id >> 4) != 0x1 && type == PCA9450_TYPE_PCA9450A) ||
0935ff5f1f0a44 Robin Gong          2020-07-04  778  	    ((device_id >> 4) != 0x3 && type == PCA9450_TYPE_PCA9450BC)) {
0935ff5f1f0a44 Robin Gong          2020-07-04  779  		dev_err(&i2c->dev, "Device id(%x) mismatched\n",
0935ff5f1f0a44 Robin Gong          2020-07-04  780  			device_id >> 4);
0935ff5f1f0a44 Robin Gong          2020-07-04  781  		return -EINVAL;
0935ff5f1f0a44 Robin Gong          2020-07-04  782  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  783  
0935ff5f1f0a44 Robin Gong          2020-07-04  784  	for (i = 0; i < pca9450->rcnt; i++) {
0935ff5f1f0a44 Robin Gong          2020-07-04  785  		const struct regulator_desc *desc;
0935ff5f1f0a44 Robin Gong          2020-07-04  786  		struct regulator_dev *rdev;
0935ff5f1f0a44 Robin Gong          2020-07-04  787  		const struct pca9450_regulator_desc *r;
0935ff5f1f0a44 Robin Gong          2020-07-04  788  
0935ff5f1f0a44 Robin Gong          2020-07-04  789  		r = &regulator_desc[i];
0935ff5f1f0a44 Robin Gong          2020-07-04  790  		desc = &r->desc;
0935ff5f1f0a44 Robin Gong          2020-07-04  791  
0935ff5f1f0a44 Robin Gong          2020-07-04  792  		config.regmap = pca9450->regmap;
0935ff5f1f0a44 Robin Gong          2020-07-04  793  		config.dev = pca9450->dev;
f722e874661add Frieder Schrempf    2023-02-13  794  		config.driver_data = pca9450;
0935ff5f1f0a44 Robin Gong          2020-07-04  795  
0935ff5f1f0a44 Robin Gong          2020-07-04  796  		rdev = devm_regulator_register(pca9450->dev, desc, &config);
0935ff5f1f0a44 Robin Gong          2020-07-04  797  		if (IS_ERR(rdev)) {
0935ff5f1f0a44 Robin Gong          2020-07-04  798  			ret = PTR_ERR(rdev);
0935ff5f1f0a44 Robin Gong          2020-07-04  799  			dev_err(pca9450->dev,
0935ff5f1f0a44 Robin Gong          2020-07-04  800  				"Failed to register regulator(%s): %d\n",
0935ff5f1f0a44 Robin Gong          2020-07-04  801  				desc->name, ret);
0935ff5f1f0a44 Robin Gong          2020-07-04  802  			return ret;
0935ff5f1f0a44 Robin Gong          2020-07-04  803  		}
f722e874661add Frieder Schrempf    2023-02-13  804  
f722e874661add Frieder Schrempf    2023-02-13  805  		if (!strcmp(desc->name, "ldo5"))
f722e874661add Frieder Schrempf    2023-02-13  806  			ldo5 = rdev;
0935ff5f1f0a44 Robin Gong          2020-07-04  807  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  808  
0935ff5f1f0a44 Robin Gong          2020-07-04  809  	ret = devm_request_threaded_irq(pca9450->dev, pca9450->irq, NULL,
0935ff5f1f0a44 Robin Gong          2020-07-04  810  					pca9450_irq_handler,
0935ff5f1f0a44 Robin Gong          2020-07-04  811  					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
0935ff5f1f0a44 Robin Gong          2020-07-04  812  					"pca9450-irq", pca9450);
0935ff5f1f0a44 Robin Gong          2020-07-04  813  	if (ret != 0) {
0935ff5f1f0a44 Robin Gong          2020-07-04  814  		dev_err(pca9450->dev, "Failed to request IRQ: %d\n",
0935ff5f1f0a44 Robin Gong          2020-07-04  815  			pca9450->irq);
0935ff5f1f0a44 Robin Gong          2020-07-04  816  		return ret;
0935ff5f1f0a44 Robin Gong          2020-07-04  817  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  818  	/* Unmask all interrupt except PWRON/WDOG/RSVD */
0935ff5f1f0a44 Robin Gong          2020-07-04  819  	ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_INT1_MSK,
0935ff5f1f0a44 Robin Gong          2020-07-04  820  				IRQ_VR_FLT1 | IRQ_VR_FLT2 | IRQ_LOWVSYS |
0935ff5f1f0a44 Robin Gong          2020-07-04  821  				IRQ_THERM_105 | IRQ_THERM_125,
0935ff5f1f0a44 Robin Gong          2020-07-04  822  				IRQ_PWRON | IRQ_WDOGB | IRQ_RSVD);
0935ff5f1f0a44 Robin Gong          2020-07-04  823  	if (ret) {
0935ff5f1f0a44 Robin Gong          2020-07-04  824  		dev_err(&i2c->dev, "Unmask irq error\n");
0935ff5f1f0a44 Robin Gong          2020-07-04  825  		return ret;
0935ff5f1f0a44 Robin Gong          2020-07-04  826  	}
0935ff5f1f0a44 Robin Gong          2020-07-04  827  
98b94b6e38ca0c Frieder Schrempf    2021-02-22  828  	/* Clear PRESET_EN bit in BUCK123_DVS to use DVS registers */
98b94b6e38ca0c Frieder Schrempf    2021-02-22  829  	ret = regmap_clear_bits(pca9450->regmap, PCA9450_REG_BUCK123_DVS,
98b94b6e38ca0c Frieder Schrempf    2021-02-22  830  				BUCK123_PRESET_EN);
98b94b6e38ca0c Frieder Schrempf    2021-02-22  831  	if (ret) {
98b94b6e38ca0c Frieder Schrempf    2021-02-22  832  		dev_err(&i2c->dev, "Failed to clear PRESET_EN bit: %d\n", ret);
98b94b6e38ca0c Frieder Schrempf    2021-02-22  833  		return ret;
98b94b6e38ca0c Frieder Schrempf    2021-02-22  834  	}
98b94b6e38ca0c Frieder Schrempf    2021-02-22  835  
2364a64d0673f5 Rickard x Andersson 2022-04-29  836  	if (of_property_read_bool(i2c->dev.of_node, "nxp,wdog_b-warm-reset"))
2364a64d0673f5 Rickard x Andersson 2022-04-29  837  		reset_ctrl = WDOG_B_CFG_WARM;
2364a64d0673f5 Rickard x Andersson 2022-04-29  838  	else
2364a64d0673f5 Rickard x Andersson 2022-04-29  839  		reset_ctrl = WDOG_B_CFG_COLD_LDO12;
2364a64d0673f5 Rickard x Andersson 2022-04-29  840  
f7684f5a048feb Frieder Schrempf    2021-02-11  841  	/* Set reset behavior on assertion of WDOG_B signal */
f7684f5a048feb Frieder Schrempf    2021-02-11  842  	ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_RESET_CTRL,
2364a64d0673f5 Rickard x Andersson 2022-04-29  843  				 WDOG_B_CFG_MASK, reset_ctrl);
f7684f5a048feb Frieder Schrempf    2021-02-11  844  	if (ret) {
f7684f5a048feb Frieder Schrempf    2021-02-11  845  		dev_err(&i2c->dev, "Failed to set WDOG_B reset behavior\n");
f7684f5a048feb Frieder Schrempf    2021-02-11  846  		return ret;
f7684f5a048feb Frieder Schrempf    2021-02-11  847  	}
f7684f5a048feb Frieder Schrempf    2021-02-11  848  
62139f52b7e588 Per-Daniel Olsson   2022-04-29  849  	if (of_property_read_bool(i2c->dev.of_node, "nxp,i2c-lt-enable")) {
62139f52b7e588 Per-Daniel Olsson   2022-04-29  850  		/* Enable I2C Level Translator */
62139f52b7e588 Per-Daniel Olsson   2022-04-29  851  		ret = regmap_update_bits(pca9450->regmap, PCA9450_REG_CONFIG2,
62139f52b7e588 Per-Daniel Olsson   2022-04-29  852  					 I2C_LT_MASK, I2C_LT_ON_STANDBY_RUN);
62139f52b7e588 Per-Daniel Olsson   2022-04-29  853  		if (ret) {
62139f52b7e588 Per-Daniel Olsson   2022-04-29  854  			dev_err(&i2c->dev,
62139f52b7e588 Per-Daniel Olsson   2022-04-29  855  				"Failed to enable I2C level translator\n");
62139f52b7e588 Per-Daniel Olsson   2022-04-29  856  			return ret;
62139f52b7e588 Per-Daniel Olsson   2022-04-29  857  		}
62139f52b7e588 Per-Daniel Olsson   2022-04-29  858  	}
62139f52b7e588 Per-Daniel Olsson   2022-04-29  859  
f722e874661add Frieder Schrempf    2023-02-13  860  	/*
f722e874661add Frieder Schrempf    2023-02-13  861  	 * For LDO5 we need to be able to check the status of the SD_VSEL input in
f722e874661add Frieder Schrempf    2023-02-13  862  	 * order to know which control register is used. Most boards connect SD_VSEL
f722e874661add Frieder Schrempf    2023-02-13  863  	 * to the VSELECT signal, so we can use the GPIO that is internally routed
f722e874661add Frieder Schrempf    2023-02-13  864  	 * to this signal (if SION bit is set in IOMUX).
f722e874661add Frieder Schrempf    2023-02-13  865  	 */
f722e874661add Frieder Schrempf    2023-02-13 @866  	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
f722e874661add Frieder Schrempf    2023-02-13  867  	if (IS_ERR(pca9450->sd_vsel_gpio)) {
f722e874661add Frieder Schrempf    2023-02-13  868  		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
f722e874661add Frieder Schrempf    2023-02-13  869  		return ret;
f722e874661add Frieder Schrempf    2023-02-13  870  	}
f722e874661add Frieder Schrempf    2023-02-13  871  
0935ff5f1f0a44 Robin Gong          2020-07-04  872  	dev_info(&i2c->dev, "%s probed.\n",
0935ff5f1f0a44 Robin Gong          2020-07-04  873  		type == PCA9450_TYPE_PCA9450A ? "pca9450a" : "pca9450bc");
0935ff5f1f0a44 Robin Gong          2020-07-04  874  
0935ff5f1f0a44 Robin Gong          2020-07-04  875  	return 0;
0935ff5f1f0a44 Robin Gong          2020-07-04  876  }
0935ff5f1f0a44 Robin Gong          2020-07-04  877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
