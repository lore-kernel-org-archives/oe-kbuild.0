Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF09263F4A
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 22:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780613666; cv=none; b=jA2GtMrnBh2ebR0Gqivovo+gjVQboXf9mqO9saA3tyexnVKJ3kyIRpOVuysFk/YZnJcUJq/PT29WkONc/vak+U8tTclPf7DxGr48meLjrq8JDpJzK+k8U57YedtG0kyuLzGLSYKwrErF35bVId/7gS/A/4e5X0QKxQTW2RLLFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780613666; c=relaxed/simple;
	bh=NzPEenXOoDo7Lm3Sbw+ScuOwGkwaEcyzsj8ZijzkmEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJ7rUBamJl6DHKbUBOQG6pU5JX7JVDx61GKsOKxYyLewXLG7xjCYALED7KiXFP1FQ8iRaIqobrlirXvxV243O+36FU8CIS3V7ghtWTBpq2xM1plkT8Y0UNTsdgB4BLGs2Wook9SJN9BzakJIyjy8syi567LPmRAL6IgyPUSZ5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOnV6m2i; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOnV6m2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780613665; x=1812149665;
  h=date:from:to:cc:subject:message-id;
  bh=NzPEenXOoDo7Lm3Sbw+ScuOwGkwaEcyzsj8ZijzkmEg=;
  b=SOnV6m2iZ5+Rps35zndxgo8GI9Mli+DG88IGZo4Qx8P/BMLvExsArRyT
   1n7RdVCYmb2NnYJ4Qft96ay0TLWCLUWyKcNzlvoSCUqRU43oFSe9VmV6E
   ulTuom+jxpcLdQBAon+BK8t1hO/wncGMk5ggS3jWEB0GsnlsNDP4MvS1h
   CvOXmkIFWToEOLDMTip4LXOuVTC1jvbvLGqZkE+fF4c+yBTcvdZ+RwgOo
   eNPdvv0T3knn4qnsADz0dMGeEFFRA6a6NTMYx7eo8j4rqg4GwCI835B72
   aBxtcnwvV8QFL6lqCtG+15HBCNPzb42AXK0Ds0334L7kstYRMj/kwBdlW
   g==;
X-CSE-ConnectionGUID: NhX7yzpgQ1qRu183PcdB7A==
X-CSE-MsgGUID: bcsHKDySSTWz52/hFkKDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85303703"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85303703"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 15:54:24 -0700
X-CSE-ConnectionGUID: kfAZ8d83TVaoP0BSxWoTsg==
X-CSE-MsgGUID: 7I634wM7QT+JvThen7p0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248607492"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2026 15:54:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVGx9-00000000FIC-2BX8;
	Thu, 04 Jun 2026 22:54:19 +0000
Date: Fri, 05 Jun 2026 06:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/max77705_charger.c:626:7-32: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202606050608.KsT8xMUj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dzmitry Sankouski <dsankouski@gmail.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 12a1185a06e3377af777e792ba7436862f8e528a power: supply: max77705_charger: rework interrupts
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050608.KsT8xMUj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 12a1185a06e3 ("power: supply: max77705_charger: rework interrupts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606050608.KsT8xMUj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/max77705_charger.c:626:7-32: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +626 drivers/power/supply/max77705_charger.c

a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  565  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  566  static int max77705_charger_probe(struct i2c_client *i2c)
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  567  {
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  568  	struct power_supply_config pscfg = {};
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  569  	struct max77705_charger_data *chg;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  570  	struct device *dev;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  571  	struct regmap_irq_chip_data *irq_data;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  572  	int ret;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  573  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  574  	dev = &i2c->dev;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  575  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  576  	chg = devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  577  	if (!chg)
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  578  		return -ENOMEM;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  579  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  580  	chg->dev = dev;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  581  	i2c_set_clientdata(i2c, chg);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  582  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  583  	chg->regmap = devm_regmap_init_i2c(i2c, &max77705_chg_regmap_config);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  584  	if (IS_ERR(chg->regmap))
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  585  		return PTR_ERR(chg->regmap);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  586  
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  587  	for (int i = 0; i < MAX77705_N_REGMAP_FIELDS; i++) {
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  588  		chg->rfield[i] = devm_regmap_field_alloc(dev, chg->regmap,
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  589  							 max77705_reg_field[i]);
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  590  		if (IS_ERR(chg->rfield[i]))
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  591  			return dev_err_probe(dev, PTR_ERR(chg->rfield[i]),
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  592  					     "cannot allocate regmap field\n");
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  593  	}
ef1e734dbe257c Dzmitry Sankouski 2025-09-18  594  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  595  	pscfg.fwnode = dev_fwnode(dev);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  596  	pscfg.drv_data = chg;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  597  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  598  	chg->psy_chg = devm_power_supply_register(dev, &max77705_charger_psy_desc, &pscfg);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  599  	if (IS_ERR(chg->psy_chg))
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  600  		return PTR_ERR(chg->psy_chg);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  601  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  602  	max77705_charger_irq_chip.irq_drv_data = chg;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  603  	ret = devm_regmap_add_irq_chip(chg->dev, chg->regmap, i2c->irq,
12a1185a06e337 Dzmitry Sankouski 2025-09-18  604  					IRQF_ONESHOT, 0,
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  605  					&max77705_charger_irq_chip,
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  606  					&irq_data);
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  607  	if (ret)
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  608  		return dev_err_probe(dev, ret, "failed to add irq chip\n");
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  609  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  610  	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
11741b8e382d34 Dan Carpenter     2025-03-21  611  	if (!chg->wqueue)
c3a49515225e44 Xichao Zhao       2025-08-20  612  		return -ENOMEM;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  613  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  614  	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
11741b8e382d34 Dan Carpenter     2025-03-21  615  	if (ret) {
11741b8e382d34 Dan Carpenter     2025-03-21  616  		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
11741b8e382d34 Dan Carpenter     2025-03-21  617  		goto destroy_wq;
11741b8e382d34 Dan Carpenter     2025-03-21  618  	}
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  619  
55af7b9bb66c1c Dzmitry Sankouski 2025-09-18  620  	ret = max77705_charger_initialize(chg);
55af7b9bb66c1c Dzmitry Sankouski 2025-09-18  621  	if (ret) {
55af7b9bb66c1c Dzmitry Sankouski 2025-09-18  622  		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
55af7b9bb66c1c Dzmitry Sankouski 2025-09-18  623  		goto destroy_wq;
55af7b9bb66c1c Dzmitry Sankouski 2025-09-18  624  	}
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  625  
12a1185a06e337 Dzmitry Sankouski 2025-09-18 @626  	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
12a1185a06e337 Dzmitry Sankouski 2025-09-18  627  					NULL, max77705_chgin_irq,
12a1185a06e337 Dzmitry Sankouski 2025-09-18  628  					IRQF_TRIGGER_NONE,
12a1185a06e337 Dzmitry Sankouski 2025-09-18  629  					"chgin-irq", chg);
12a1185a06e337 Dzmitry Sankouski 2025-09-18  630  	if (ret) {
12a1185a06e337 Dzmitry Sankouski 2025-09-18  631  		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
12a1185a06e337 Dzmitry Sankouski 2025-09-18  632  		goto destroy_wq;
12a1185a06e337 Dzmitry Sankouski 2025-09-18  633  	}
12a1185a06e337 Dzmitry Sankouski 2025-09-18  634  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  635  	ret = max77705_charger_enable(chg);
11741b8e382d34 Dan Carpenter     2025-03-21  636  	if (ret) {
11741b8e382d34 Dan Carpenter     2025-03-21  637  		dev_err_probe(dev, ret, "failed to enable charge\n");
11741b8e382d34 Dan Carpenter     2025-03-21  638  		goto destroy_wq;
11741b8e382d34 Dan Carpenter     2025-03-21  639  	}
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  640  
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  641  	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
11741b8e382d34 Dan Carpenter     2025-03-21  642  
11741b8e382d34 Dan Carpenter     2025-03-21  643  destroy_wq:
11741b8e382d34 Dan Carpenter     2025-03-21  644  	destroy_workqueue(chg->wqueue);
11741b8e382d34 Dan Carpenter     2025-03-21  645  	return ret;
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  646  }
a6a494c8e3ce1f Dzmitry Sankouski 2025-01-23  647  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
