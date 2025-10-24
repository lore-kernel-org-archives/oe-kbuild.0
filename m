Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6B2DC78C
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316884; cv=none; b=rAygZ1PDlNPz0IJjjedxQf2KOVXXtDbyiPKAQD3iziul8zI39eoBDuqfx/e+UQ69++1WohlFqylndtx7h4qLrHrH8DhWBbLJ+es7jP9lSLvJSGL0RI6/BNlvO5utqNaHQh3w/2lKL5uVWrcNvwyga6kmQjJT9Z24JsBAVN7x3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316884; c=relaxed/simple;
	bh=x6zwFCKaqWkfQ0WPL6yEXDqF3wacc8ymTpInJ+H+60A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3Qc8nY6Yrh925+ACiUAnFwx4wpRYTGyUhm6y0bhg70DHv6FIC+FulaOq9od6G2PS8xVAQxuqXSf4tCytv3/n0DbV+7IJBxSrO9w8qtOUCwzq0pP7EpM485I0sH+95RQmqJ8MCWdN2TUqP0P2jJvSwJs34kLLZkv/gN7A+8pfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+TGqzZj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+TGqzZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761316883; x=1792852883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6zwFCKaqWkfQ0WPL6yEXDqF3wacc8ymTpInJ+H+60A=;
  b=N+TGqzZjpigP21A/751yxFBnsy9pOOmzMVE8OuBUzJs6MVLQmwP7vtYG
   FcHnUx/iOYdT8UVedzhEZu0ahG1v3Ag7IM0O04D2gssVv/4cjvgeOh3ZT
   QWwlNu9z9n9ruk9yLInfJc7rP00S6nRbnAuE+AG70EVSc0SarDYvYoE7F
   OFXhxepz0+vmLSmrvmnGp1qXvE6WKxeE31K6f4Su3w3pc31bjcSzQpmIx
   5ZhmLKI6liTvm0BNK4Ey0SRd6htCyO5fTd0UHDt730HuKZSMSorPda4l+
   ecFm04suzvH9s2szDb4x5Wvmxbg+Xd90WjujX+i9Q+iDBxRxlR7rkGIk+
   g==;
X-CSE-ConnectionGUID: TNFoaIWlSCmHQP3JOuLToQ==
X-CSE-MsgGUID: cVV0bPwqRHS7LzxeUHRE+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74170702"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74170702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:41:22 -0700
X-CSE-ConnectionGUID: IKMBLqE0QDu5eS6/XMe5Og==
X-CSE-MsgGUID: Kwg+6vQYTdSP9XpsKte9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="185214649"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 07:41:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCIyl-000EZ3-0M;
	Fri, 24 Oct 2025 14:41:19 +0000
Date: Fri, 24 Oct 2025 22:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/max77705_charger.c:626:7-32: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <202510242252.UUvmZq9F-lkp@intel.com>
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
TO: Dzmitry Sankouski <dsankouski@gmail.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
commit: 12a1185a06e3377af777e792ba7436862f8e528a power: supply: max77705_charger: rework interrupts
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-053-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242252.UUvmZq9F-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510242252.UUvmZq9F-lkp@intel.com/

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
