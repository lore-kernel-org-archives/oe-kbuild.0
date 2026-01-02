Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD02D97A5
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362707; cv=none; b=tmvYfOiemvLCbWLre1FxpagEqddG5irgBb8BdZAyvokEIxTWv5j+vcxvSCDcazsz+eyQI9QzLfFdsE1HXijGNUdBI9vj9a5dHP1DMrbDpe8oVeKg+bTbs5lnmEdahWhoab5pGy6ZBoGpRzyTpvboFHMu0U5YzfjMiorHtZSdkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362707; c=relaxed/simple;
	bh=GzpvzAm/mjqo1+YxBTLAce1watj2JTjm+NzFFHrl2IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mh3cVNVnvw9ubmc+IqcOH/4Swp3hMClyrT0JBrhChAinwVhSIVYLxvC95IR5rZ7CdRgxB2O6+hxs8y0+ANnEguiCFpcnrCtG7GCCcJrECX9fVhTCORmjtjRFGINYgwe654P0v4ZwpnOW6hypuqopu9Epei+4JctfTbconeqtd9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elwRmWQh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elwRmWQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767362706; x=1798898706;
  h=date:from:to:cc:subject:message-id;
  bh=GzpvzAm/mjqo1+YxBTLAce1watj2JTjm+NzFFHrl2IU=;
  b=elwRmWQhA5AG2wEyHUMaaY8wBtbKQZrymMPLeMAVsMWf39gEbCqJXAdF
   M07a9Nr+H3Mmm3Dx8scsmKMPJrgUSNgoikDIiGA6hOt+PrGpsciAocVdA
   soLk8kOs0FXkwOLioDP0H+xpgmYy2mqeA3J09K7gr8cxnPF6fJ8H/cNzO
   RNvsOz7R3/sdlXbwy10yNnQjgPsZhcuBMv4l3Q6WKLE9Iunk1RaRtJB1M
   3Vn7wsTtm9I97UgjBji7my6zdAWYNWg6RbVzyVXGupO5OXo0BiEpBzqRI
   SC2K3Yc6prrEpc8bG/pubYhNnhsqQJAgklbgANCweZE0BWn1ZuUDV68a0
   A==;
X-CSE-ConnectionGUID: l5rtmxHNSXiRrT272Am6XQ==
X-CSE-MsgGUID: CbolPWeITVGixZ/+VihftA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="69015052"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="69015052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 06:05:05 -0800
X-CSE-ConnectionGUID: zcqFfoUGQAO5oZuX1FJALA==
X-CSE-MsgGUID: 86Oy3Bg0RCCZn4GZqYiYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="206708395"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jan 2026 06:05:04 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbfm1-000000002IB-2bqe;
	Fri, 02 Jan 2026 14:05:01 +0000
Date: Fri, 02 Jan 2026 22:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/max77705_charger.c:626:7-32: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202601022157.t2ZdxqQL-lkp@intel.com>
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
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 12a1185a06e3377af777e792ba7436862f8e528a power: supply: max77705_charger: rework interrupts
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601022157.t2ZdxqQL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601022157.t2ZdxqQL-lkp@intel.com/

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
