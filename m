Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4913777E
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 04:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000537; cv=none; b=WDgE//ixDOpxPnwjotYpwdQ75ugE0jAU/05bGGRoozq3AUvpeMTHCtEcQajyxwPF46PaNVpUEZB51rfu0Jz0DPEHSQE9CWAd1zjdgXsn5MHssrM5+9R0b4LHIB+PEmKo6V1I8BbU+scB+90dVFIHhsxWThJyxPIRqF3AgijTynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000537; c=relaxed/simple;
	bh=mz1Wq9SdWj5nf7v9GLA3TX4ps486eqYfX3poTZeuP9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0Cr7r6Jb7u6F/ierAJeWnsmVK3Ajjuzo2a5SlwIEoBOS+R2rcyJ8NOkrkoagVwdrcr9xNKO2lGR0CVXbtzfC2baso9RHtOPhfwP4K5cVWhdTVw17zXifegwLI9+twQmJzLqOAuv7pGITrlQlAE+qq1FswcB6a3JcTSGeDyafkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+gRYa0F; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+gRYa0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744000536; x=1775536536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mz1Wq9SdWj5nf7v9GLA3TX4ps486eqYfX3poTZeuP9Q=;
  b=T+gRYa0Fv54QTtj7OEAR81qW2alAzTl4vqEBJojsUQ4LI2srffyfUvFw
   Ds6HFC0fc3kNXssg1at3Z8sp6kqRk9I7GMVwCLelv4XOL3HVXUrtzkbtB
   ah/bdMtKutNmDrAGD/tWboXEaBCywO9wDsDKgSk88HGB5jKCtkMqmSdhg
   HUnEygpAarW7yOuVWEnuH9DqYvQMUdKGrpgrgkUwSoGHyODtG6i3x/3Er
   ZvRUVY1if8trIlFbeRPTPQLVOvADqCjQj2O5aQuf2wHlg5VykUmQE9cki
   nLD2cJQApOuw5gtKa6kBayv1w5+gWAFMgonr1Al/EjSkzlLqW1rhX6cJb
   A==;
X-CSE-ConnectionGUID: QWXfMtgjRcyv4SXtlbwo/g==
X-CSE-MsgGUID: 0K/YcJjNRq2z3/WH8qLNUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62764545"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62764545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 21:35:34 -0700
X-CSE-ConnectionGUID: lY8Eut/zSku61Xs1h5adQw==
X-CSE-MsgGUID: x2okPyE7T+2bm5K8c1+Vuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="158809902"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Apr 2025 21:35:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1eCo-0002zX-0w;
	Mon, 07 Apr 2025 04:35:30 +0000
Date: Mon, 7 Apr 2025 12:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf9453-regulator.c:820:7-32: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202504071237.GAhUodOT-lkp@intel.com>
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
TO: Joy Zou <joy.zou@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: 0959b6706325bf147f253841eea312e27a3bf013 regulator: pf9453: add PMIC PF9453 support
date:   3 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r062-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071237.GAhUodOT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504071237.GAhUodOT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/pf9453-regulator.c:820:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +820 drivers/regulator/pf9453-regulator.c

0959b6706325bf Joy Zou 2025-03-14  767  
0959b6706325bf Joy Zou 2025-03-14  768  static int pf9453_i2c_probe(struct i2c_client *i2c)
0959b6706325bf Joy Zou 2025-03-14  769  {
0959b6706325bf Joy Zou 2025-03-14  770  	const struct pf9453_regulator_desc *regulator_desc = of_device_get_match_data(&i2c->dev);
0959b6706325bf Joy Zou 2025-03-14  771  	struct regulator_config config = { };
0959b6706325bf Joy Zou 2025-03-14  772  	unsigned int reset_ctrl;
0959b6706325bf Joy Zou 2025-03-14  773  	unsigned int device_id;
0959b6706325bf Joy Zou 2025-03-14  774  	struct pf9453 *pf9453;
0959b6706325bf Joy Zou 2025-03-14  775  	int ret;
0959b6706325bf Joy Zou 2025-03-14  776  
0959b6706325bf Joy Zou 2025-03-14  777  	if (!i2c->irq)
0959b6706325bf Joy Zou 2025-03-14  778  		return dev_err_probe(&i2c->dev, -EINVAL, "No IRQ configured?\n");
0959b6706325bf Joy Zou 2025-03-14  779  
0959b6706325bf Joy Zou 2025-03-14  780  	pf9453 = devm_kzalloc(&i2c->dev, sizeof(struct pf9453), GFP_KERNEL);
0959b6706325bf Joy Zou 2025-03-14  781  	if (!pf9453)
0959b6706325bf Joy Zou 2025-03-14  782  		return -ENOMEM;
0959b6706325bf Joy Zou 2025-03-14  783  
0959b6706325bf Joy Zou 2025-03-14  784  	pf9453->regmap = devm_regmap_init_i2c(i2c, &pf9453_regmap_config);
0959b6706325bf Joy Zou 2025-03-14  785  	if (IS_ERR(pf9453->regmap))
0959b6706325bf Joy Zou 2025-03-14  786  		return dev_err_probe(&i2c->dev, PTR_ERR(pf9453->regmap),
0959b6706325bf Joy Zou 2025-03-14  787  				     "regmap initialization failed\n");
0959b6706325bf Joy Zou 2025-03-14  788  
0959b6706325bf Joy Zou 2025-03-14  789  	pf9453->irq = i2c->irq;
0959b6706325bf Joy Zou 2025-03-14  790  	pf9453->dev = &i2c->dev;
0959b6706325bf Joy Zou 2025-03-14  791  
0959b6706325bf Joy Zou 2025-03-14  792  	dev_set_drvdata(&i2c->dev, pf9453);
0959b6706325bf Joy Zou 2025-03-14  793  
0959b6706325bf Joy Zou 2025-03-14  794  	ret = regmap_read(pf9453->regmap, PF9453_REG_DEV_ID, &device_id);
0959b6706325bf Joy Zou 2025-03-14  795  	if (ret)
0959b6706325bf Joy Zou 2025-03-14  796  		return dev_err_probe(&i2c->dev, ret, "Read device id error\n");
0959b6706325bf Joy Zou 2025-03-14  797  
0959b6706325bf Joy Zou 2025-03-14  798  	/* Check your board and dts for match the right pmic */
0959b6706325bf Joy Zou 2025-03-14  799  	if ((device_id >> 4) != 0xb)
0959b6706325bf Joy Zou 2025-03-14  800  		return dev_err_probe(&i2c->dev, -EINVAL, "Device id(%x) mismatched\n",
0959b6706325bf Joy Zou 2025-03-14  801  				     device_id >> 4);
0959b6706325bf Joy Zou 2025-03-14  802  
0959b6706325bf Joy Zou 2025-03-14  803  	while (regulator_desc->desc.name) {
0959b6706325bf Joy Zou 2025-03-14  804  		const struct regulator_desc *desc;
0959b6706325bf Joy Zou 2025-03-14  805  		struct regulator_dev *rdev;
0959b6706325bf Joy Zou 2025-03-14  806  
0959b6706325bf Joy Zou 2025-03-14  807  		desc = &regulator_desc->desc;
0959b6706325bf Joy Zou 2025-03-14  808  
0959b6706325bf Joy Zou 2025-03-14  809  		config.regmap = pf9453->regmap;
0959b6706325bf Joy Zou 2025-03-14  810  		config.dev = pf9453->dev;
0959b6706325bf Joy Zou 2025-03-14  811  
0959b6706325bf Joy Zou 2025-03-14  812  		rdev = devm_regulator_register(pf9453->dev, desc, &config);
0959b6706325bf Joy Zou 2025-03-14  813  		if (IS_ERR(rdev))
0959b6706325bf Joy Zou 2025-03-14  814  			return dev_err_probe(pf9453->dev, PTR_ERR(rdev),
0959b6706325bf Joy Zou 2025-03-14  815  					     "Failed to register regulator(%s)\n", desc->name);
0959b6706325bf Joy Zou 2025-03-14  816  
0959b6706325bf Joy Zou 2025-03-14  817  		regulator_desc++;
0959b6706325bf Joy Zou 2025-03-14  818  	}
0959b6706325bf Joy Zou 2025-03-14  819  
0959b6706325bf Joy Zou 2025-03-14 @820  	ret = devm_request_threaded_irq(pf9453->dev, pf9453->irq, NULL, pf9453_irq_handler,
0959b6706325bf Joy Zou 2025-03-14  821  					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
0959b6706325bf Joy Zou 2025-03-14  822  					"pf9453-irq", pf9453);
0959b6706325bf Joy Zou 2025-03-14  823  	if (ret)
0959b6706325bf Joy Zou 2025-03-14  824  		return dev_err_probe(pf9453->dev, ret, "Failed to request IRQ: %d\n", pf9453->irq);
0959b6706325bf Joy Zou 2025-03-14  825  
0959b6706325bf Joy Zou 2025-03-14  826  	/* Unmask all interrupt except PWRON/WDOG/RSVD */
0959b6706325bf Joy Zou 2025-03-14  827  	ret = pf9453_pmic_write(pf9453, PF9453_REG_INT1_MASK,
0959b6706325bf Joy Zou 2025-03-14  828  				IRQ_ONKEY | IRQ_RESETKEY | IRQ_RSTB | IRQ_VR_FLT1
0959b6706325bf Joy Zou 2025-03-14  829  				| IRQ_LOWVSYS | IRQ_THERM_100 | IRQ_THERM_80, IRQ_RSVD);
0959b6706325bf Joy Zou 2025-03-14  830  	if (ret)
0959b6706325bf Joy Zou 2025-03-14  831  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
0959b6706325bf Joy Zou 2025-03-14  832  
0959b6706325bf Joy Zou 2025-03-14  833  	if (of_property_read_bool(i2c->dev.of_node, "nxp,wdog_b-warm-reset"))
0959b6706325bf Joy Zou 2025-03-14  834  		reset_ctrl = WDOG_B_CFG_WARM;
0959b6706325bf Joy Zou 2025-03-14  835  	else
0959b6706325bf Joy Zou 2025-03-14  836  		reset_ctrl = WDOG_B_CFG_COLD;
0959b6706325bf Joy Zou 2025-03-14  837  
0959b6706325bf Joy Zou 2025-03-14  838  	/* Set reset behavior on assertion of WDOG_B signal */
0959b6706325bf Joy Zou 2025-03-14  839  	ret = pf9453_pmic_write(pf9453, PF9453_REG_RESET_CTRL, WDOG_B_CFG_MASK, reset_ctrl);
0959b6706325bf Joy Zou 2025-03-14  840  	if (ret)
0959b6706325bf Joy Zou 2025-03-14  841  		return dev_err_probe(&i2c->dev, ret, "Failed to set WDOG_B reset behavior\n");
0959b6706325bf Joy Zou 2025-03-14  842  
0959b6706325bf Joy Zou 2025-03-14  843  	/*
0959b6706325bf Joy Zou 2025-03-14  844  	 * The driver uses the LDO1OUT_H register to control the LDO1 regulator.
0959b6706325bf Joy Zou 2025-03-14  845  	 * This is only valid if the SD_VSEL input of the PMIC is high. Let's
0959b6706325bf Joy Zou 2025-03-14  846  	 * check if the pin is available as GPIO and set it to high.
0959b6706325bf Joy Zou 2025-03-14  847  	 */
0959b6706325bf Joy Zou 2025-03-14  848  	pf9453->sd_vsel_gpio = gpiod_get_optional(pf9453->dev, "sd-vsel", GPIOD_OUT_HIGH);
0959b6706325bf Joy Zou 2025-03-14  849  
0959b6706325bf Joy Zou 2025-03-14  850  	if (IS_ERR(pf9453->sd_vsel_gpio))
0959b6706325bf Joy Zou 2025-03-14  851  		return dev_err_probe(&i2c->dev, PTR_ERR(pf9453->sd_vsel_gpio),
0959b6706325bf Joy Zou 2025-03-14  852  				     "Failed to get SD_VSEL GPIO\n");
0959b6706325bf Joy Zou 2025-03-14  853  
0959b6706325bf Joy Zou 2025-03-14  854  	return 0;
0959b6706325bf Joy Zou 2025-03-14  855  }
0959b6706325bf Joy Zou 2025-03-14  856  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
