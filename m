Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C16284B26
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771282602; cv=none; b=fWwhKs0bmjhidg5M2SVEI+VmEd/X09TpOMn2ai/H/55/vjWZjhtp5mYbHHrOKeEzq61oEgWZNz4OMBzfFPVTJxFQZ5/M/Lvh/pCIOBHy9XqvOBFmSF28Fa2P22q8aq7CgIoi1tb/9XUZWinEZbqj7KfpV1Erp9q5kNDt/uevX1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771282602; c=relaxed/simple;
	bh=Nbf9CARngc2X93L+/5rusUz31LRV1ACUAR+z1Lzw9S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iz+hD9ueHroTFR2CMh3eh8hop70Za19MRm+PoOGo5MhDldufMSwWAJZOKi14NbwsnaCUA9xiI/fZAl3alSUBkOwD4mQeUwlmQZwN782hj38FkgR4Tdb72HHW/epWxZO8QROS3affujiALYXa01uSkPclrIOuzRSAa4QBxWcePO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHcN3rff; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHcN3rff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771282601; x=1802818601;
  h=date:from:to:cc:subject:message-id;
  bh=Nbf9CARngc2X93L+/5rusUz31LRV1ACUAR+z1Lzw9S4=;
  b=aHcN3rffs6sLZHdO9miVxKkbs5bIGg5qlbKRpyMBu4HZK5mWEmNjeeYl
   tkx9P5+sqeSUhvDfJIVFs1irt50dJ4xOiplm5Kbur9D+3LbIYJo57if45
   t2ooRl8R/IVPiwSmhz3zTaNSAAkmFo2c6RywYVCYS/PLJp862ghhmjOTg
   ewp3bf5Ig0vRNGDtXdqir75qJHcMrzc4fHyVfBmEZVvDNVjmuR2MogurQ
   fP5Fb/UJX4cIU/KbzZm1htiOaewLh1C9K83ee5E09cxIwj9mepUEr/Xhr
   OWZ5yL9PF+Hlvc94w0ufV44rm3o+dImrvUc2rNMfe2RWumwCFcVtdc3pj
   w==;
X-CSE-ConnectionGUID: KV286XH+R2O9SbOltD8JCQ==
X-CSE-MsgGUID: CjXxmGt4Q7+vqfXnK53uVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72428300"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72428300"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 14:56:40 -0800
X-CSE-ConnectionGUID: WaLJSAHZRVeY/QDNea5rSA==
X-CSE-MsgGUID: N4U6vtGxSGG+yMtYQqIgMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 14:56:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs7W8-000000010Li-3DEx;
	Mon, 16 Feb 2026 22:56:36 +0000
Date: Tue, 17 Feb 2026 06:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf9453-regulator.c:820:7-32: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202602170614.jkZOcRJ4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Joy Zou <joy.zou@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57d76ceccee4b497eb835831206b50e72915a501
commit: 0959b6706325bf147f253841eea312e27a3bf013 regulator: pf9453: add PMIC PF9453 support
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r064-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170614.jkZOcRJ4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project afd4df07ab0262482829d4410a6bae9f2809d37b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602170614.jkZOcRJ4-lkp@intel.com/

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
