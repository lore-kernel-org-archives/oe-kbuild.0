Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E648BD54
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586715; cv=none; b=YziUJURkI1WEbWmFfVqAEBgTPvdq/xRE20DpDuhCOijTqkz9XhTPHlijiAdYuUOZ+kSSEBgAaN0m0lMDX3JCgaX8sXxiIPxxjSURv+gqJsAJbfDaZzKcn37zG06uvoZWPF+L2awBm+jYfbmAWE0pqbu5ZB028TCTTaYNlcTuaQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586715; c=relaxed/simple;
	bh=7VdSu1chu9kyHoQGEPBddOvbQGj6pmefrVMj2Gz390o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RYSrqppTtEaEcY+zBYAoA7tPbi6blEvAkQ0XkxgJrZf1o5kt3CnN+cncgpJwBhpdIvYVU3Km/h0jZ5r9asmGZGEtYR3/aDmLZNfk44ytiQhYuWbjzkjzLY/0rhd1/BgDwuq+nco1oVGf0pMCFdWRuB4/YjDSp4ZpZva4qzVss6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUBa5bGM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUBa5bGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790586715; x=1822122715;
  h=date:from:to:cc:subject:message-id;
  bh=7VdSu1chu9kyHoQGEPBddOvbQGj6pmefrVMj2Gz390o=;
  b=hUBa5bGM0iNAWV6jya46LsaZohziSxBi8mp/US4fl/7f2QisMa2qmoG7
   7o/aGw3VU86QeTY7FsY9QhthROiG4YJ3LUFjVSJDOL9S+tPCrErnShzqv
   3nvX93IDzsqaSwrUm/w7CVFtLrfpVg1cEGe7I/rVRNISunHh3v5j+wL9j
   iaqw0SQFD86lzXD/FIw5l/Q736WmhjVDiISh6VKr9mZHur/71m5G9HPO7
   TNe1/3MT6A3Hd6yhTNBfrDbwEM7SU9u5N418ftWvuXY2kMROux0L9mFhT
   BpyEXsOB0QNvc/EfeWuEC6YEij7G6TS41OFVCmV6Xn1RH5gcfTJ6wWz4l
   w==;
X-CSE-ConnectionGUID: s1oCZfqGRqK7zKh7Na2FjA==
X-CSE-MsgGUID: CaNL02LiQ/ilTBNeHuwNew==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="94161851"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="94161851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 02:11:54 -0700
X-CSE-ConnectionGUID: vbAEPu04Rx+8kZkAWDz0Ig==
X-CSE-MsgGUID: iM3iKvF4SuGlPqLXp3LV/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274540698"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 28 Sep 2026 02:11:53 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB7Oo-000000000wL-1mjS;
	Mon, 28 Sep 2026 09:11:50 +0000
Date: Mon, 28 Sep 2026 11:11:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf0900-regulator.c:891:7-32: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202609281100.yUtZUAu4-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d regulator: pf0900: Add PMIC PF0900 support
date:   1 year, 2 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-2101-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281100.yUtZUAu4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609281100.yUtZUAu4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/pf0900-regulator.c:891:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +891 drivers/regulator/pf0900-regulator.c

162e23657e5379 Joy Zou 2025-07-31  826  
162e23657e5379 Joy Zou 2025-07-31  827  static int pf0900_i2c_probe(struct i2c_client *i2c)
162e23657e5379 Joy Zou 2025-07-31  828  {
162e23657e5379 Joy Zou 2025-07-31  829  	const struct pf0900_regulator_desc *regulator_desc;
162e23657e5379 Joy Zou 2025-07-31  830  	const struct pf0900_drvdata *drvdata = NULL;
162e23657e5379 Joy Zou 2025-07-31  831  	struct device_node *np = i2c->dev.of_node;
162e23657e5379 Joy Zou 2025-07-31  832  	unsigned int device_id, device_fam, i;
162e23657e5379 Joy Zou 2025-07-31  833  	struct regulator_config config = { };
162e23657e5379 Joy Zou 2025-07-31  834  	struct pf0900 *pf0900;
162e23657e5379 Joy Zou 2025-07-31  835  	int ret;
162e23657e5379 Joy Zou 2025-07-31  836  
162e23657e5379 Joy Zou 2025-07-31  837  	if (!i2c->irq)
162e23657e5379 Joy Zou 2025-07-31  838  		return dev_err_probe(&i2c->dev, -EINVAL, "No IRQ configured?\n");
162e23657e5379 Joy Zou 2025-07-31  839  
162e23657e5379 Joy Zou 2025-07-31  840  	pf0900 = devm_kzalloc(&i2c->dev, sizeof(struct pf0900), GFP_KERNEL);
162e23657e5379 Joy Zou 2025-07-31  841  	if (!pf0900)
162e23657e5379 Joy Zou 2025-07-31  842  		return -ENOMEM;
162e23657e5379 Joy Zou 2025-07-31  843  
162e23657e5379 Joy Zou 2025-07-31  844  	drvdata = device_get_match_data(&i2c->dev);
162e23657e5379 Joy Zou 2025-07-31  845  	if (!drvdata)
162e23657e5379 Joy Zou 2025-07-31  846  		return dev_err_probe(&i2c->dev, -EINVAL, "unable to find driver data\n");
162e23657e5379 Joy Zou 2025-07-31  847  
162e23657e5379 Joy Zou 2025-07-31  848  	regulator_desc = drvdata->desc;
162e23657e5379 Joy Zou 2025-07-31  849  	pf0900->drvdata = drvdata;
162e23657e5379 Joy Zou 2025-07-31  850  	pf0900->crc_en = of_property_read_bool(np, "nxp,i2c-crc-enable");
162e23657e5379 Joy Zou 2025-07-31  851  	pf0900->irq = i2c->irq;
162e23657e5379 Joy Zou 2025-07-31  852  	pf0900->dev = &i2c->dev;
162e23657e5379 Joy Zou 2025-07-31  853  	pf0900->addr = i2c->addr;
162e23657e5379 Joy Zou 2025-07-31  854  
162e23657e5379 Joy Zou 2025-07-31  855  	dev_set_drvdata(&i2c->dev, pf0900);
162e23657e5379 Joy Zou 2025-07-31  856  
162e23657e5379 Joy Zou 2025-07-31  857  	pf0900->regmap = devm_regmap_init(&i2c->dev, &pf0900_regmap_bus, &i2c->dev,
162e23657e5379 Joy Zou 2025-07-31  858  					       &pf0900_regmap_config);
162e23657e5379 Joy Zou 2025-07-31  859  	if (IS_ERR(pf0900->regmap))
162e23657e5379 Joy Zou 2025-07-31  860  		return dev_err_probe(&i2c->dev, PTR_ERR(pf0900->regmap),
162e23657e5379 Joy Zou 2025-07-31  861  				     "regmap initialization failed\n");
162e23657e5379 Joy Zou 2025-07-31  862  	ret = regmap_read(pf0900->regmap, PF0900_REG_DEV_ID, &device_id);
162e23657e5379 Joy Zou 2025-07-31  863  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  864  		return dev_err_probe(&i2c->dev, ret, "Read device id error\n");
162e23657e5379 Joy Zou 2025-07-31  865  
162e23657e5379 Joy Zou 2025-07-31  866  	ret = regmap_read(pf0900->regmap, PF0900_REG_DEV_FAM, &device_fam);
162e23657e5379 Joy Zou 2025-07-31  867  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  868  		return dev_err_probe(&i2c->dev, ret, "Read device fam error\n");
162e23657e5379 Joy Zou 2025-07-31  869  
162e23657e5379 Joy Zou 2025-07-31  870  	/* Check your board and dts for match the right pmic */
162e23657e5379 Joy Zou 2025-07-31  871  	if (device_fam == 0x09 && (device_id & 0x1F) != 0x0)
162e23657e5379 Joy Zou 2025-07-31  872  		return dev_err_probe(&i2c->dev, -EINVAL, "Device id(%x) mismatched\n",
162e23657e5379 Joy Zou 2025-07-31  873  				     device_id >> 4);
162e23657e5379 Joy Zou 2025-07-31  874  
162e23657e5379 Joy Zou 2025-07-31  875  	for (i = 0; i < drvdata->rcnt; i++) {
162e23657e5379 Joy Zou 2025-07-31  876  		const struct regulator_desc *desc;
162e23657e5379 Joy Zou 2025-07-31  877  		const struct pf0900_regulator_desc *r;
162e23657e5379 Joy Zou 2025-07-31  878  
162e23657e5379 Joy Zou 2025-07-31  879  		r = &regulator_desc[i];
162e23657e5379 Joy Zou 2025-07-31  880  		desc = &r->desc;
162e23657e5379 Joy Zou 2025-07-31  881  		config.regmap = pf0900->regmap;
162e23657e5379 Joy Zou 2025-07-31  882  		config.driver_data = (void *)r;
162e23657e5379 Joy Zou 2025-07-31  883  		config.dev = pf0900->dev;
162e23657e5379 Joy Zou 2025-07-31  884  
162e23657e5379 Joy Zou 2025-07-31  885  		pf0900->rdevs[i] = devm_regulator_register(pf0900->dev, desc, &config);
162e23657e5379 Joy Zou 2025-07-31  886  		if (IS_ERR(pf0900->rdevs[i]))
162e23657e5379 Joy Zou 2025-07-31  887  			return dev_err_probe(pf0900->dev, PTR_ERR(pf0900->rdevs[i]),
162e23657e5379 Joy Zou 2025-07-31  888  					     "Failed to register regulator(%s)\n", desc->name);
162e23657e5379 Joy Zou 2025-07-31  889  	}
162e23657e5379 Joy Zou 2025-07-31  890  
162e23657e5379 Joy Zou 2025-07-31 @891  	ret = devm_request_threaded_irq(pf0900->dev, pf0900->irq, NULL,
162e23657e5379 Joy Zou 2025-07-31  892  					pf0900_irq_handler,
162e23657e5379 Joy Zou 2025-07-31  893  					(IRQF_TRIGGER_FALLING | IRQF_ONESHOT),
162e23657e5379 Joy Zou 2025-07-31  894  					"pf0900-irq", pf0900);
162e23657e5379 Joy Zou 2025-07-31  895  
162e23657e5379 Joy Zou 2025-07-31  896  	if (ret != 0)
162e23657e5379 Joy Zou 2025-07-31  897  		return dev_err_probe(pf0900->dev, ret, "Failed to request IRQ: %d\n",
162e23657e5379 Joy Zou 2025-07-31  898  				     pf0900->irq);
162e23657e5379 Joy Zou 2025-07-31  899  	/*
162e23657e5379 Joy Zou 2025-07-31  900  	 * The PWRUP_M is unmasked by default. When the device enter in RUN state,
162e23657e5379 Joy Zou 2025-07-31  901  	 * it will assert the PWRUP_I interrupt and assert the INTB pin to inform
162e23657e5379 Joy Zou 2025-07-31  902  	 * the MCU that it has finished the power up sequence properly.
162e23657e5379 Joy Zou 2025-07-31  903  	 */
162e23657e5379 Joy Zou 2025-07-31  904  	ret = regmap_write_bits(pf0900->regmap, PF0900_REG_STATUS1_INT, PF0900_IRQ_PWRUP,
162e23657e5379 Joy Zou 2025-07-31  905  				PF0900_IRQ_PWRUP);
162e23657e5379 Joy Zou 2025-07-31  906  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  907  		return dev_err_probe(&i2c->dev, ret, "Clean PWRUP_I error\n");
162e23657e5379 Joy Zou 2025-07-31  908  
162e23657e5379 Joy Zou 2025-07-31  909  	/* mask interrupt PWRUP */
162e23657e5379 Joy Zou 2025-07-31  910  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_STATUS1_MSK, PF0900_IRQ_PWRUP,
162e23657e5379 Joy Zou 2025-07-31  911  				 PF0900_IRQ_PWRUP);
162e23657e5379 Joy Zou 2025-07-31  912  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  913  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  914  
162e23657e5379 Joy Zou 2025-07-31  915  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_SW_ILIM_MSK, PF0900_IRQ_SW1_IL |
162e23657e5379 Joy Zou 2025-07-31  916  				 PF0900_IRQ_SW2_IL | PF0900_IRQ_SW3_IL | PF0900_IRQ_SW4_IL |
162e23657e5379 Joy Zou 2025-07-31  917  				 PF0900_IRQ_SW5_IL, 0);
162e23657e5379 Joy Zou 2025-07-31  918  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  919  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  920  
162e23657e5379 Joy Zou 2025-07-31  921  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_SW_UV_MSK, PF0900_IRQ_SW1_UV |
162e23657e5379 Joy Zou 2025-07-31  922  				 PF0900_IRQ_SW2_UV | PF0900_IRQ_SW3_UV | PF0900_IRQ_SW4_UV |
162e23657e5379 Joy Zou 2025-07-31  923  				 PF0900_IRQ_SW5_UV, 0);
162e23657e5379 Joy Zou 2025-07-31  924  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  925  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  926  
162e23657e5379 Joy Zou 2025-07-31  927  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_SW_OV_MSK, PF0900_IRQ_SW1_OV |
162e23657e5379 Joy Zou 2025-07-31  928  				 PF0900_IRQ_SW2_OV | PF0900_IRQ_SW3_OV | PF0900_IRQ_SW4_OV |
162e23657e5379 Joy Zou 2025-07-31  929  				 PF0900_IRQ_SW5_OV, 0);
162e23657e5379 Joy Zou 2025-07-31  930  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  931  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  932  
162e23657e5379 Joy Zou 2025-07-31  933  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_LDO_ILIM_MSK, PF0900_IRQ_LDO1_IL |
162e23657e5379 Joy Zou 2025-07-31  934  				 PF0900_IRQ_LDO2_IL | PF0900_IRQ_LDO3_IL, 0);
162e23657e5379 Joy Zou 2025-07-31  935  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  936  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  937  
162e23657e5379 Joy Zou 2025-07-31  938  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_LDO_UV_MSK, PF0900_IRQ_LDO1_UV |
162e23657e5379 Joy Zou 2025-07-31  939  				 PF0900_IRQ_LDO2_UV | PF0900_IRQ_LDO3_UV | PF0900_IRQ_VAON_UV, 0);
162e23657e5379 Joy Zou 2025-07-31  940  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  941  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  942  
162e23657e5379 Joy Zou 2025-07-31  943  	ret = regmap_update_bits(pf0900->regmap, PF0900_REG_LDO_OV_MSK, PF0900_IRQ_LDO1_OV |
162e23657e5379 Joy Zou 2025-07-31  944  				 PF0900_IRQ_LDO2_OV | PF0900_IRQ_LDO3_OV | PF0900_IRQ_VAON_OV, 0);
162e23657e5379 Joy Zou 2025-07-31  945  	if (ret)
162e23657e5379 Joy Zou 2025-07-31  946  		return dev_err_probe(&i2c->dev, ret, "Unmask irq error\n");
162e23657e5379 Joy Zou 2025-07-31  947  
162e23657e5379 Joy Zou 2025-07-31  948  	return 0;
162e23657e5379 Joy Zou 2025-07-31  949  }
162e23657e5379 Joy Zou 2025-07-31  950  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
