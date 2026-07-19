Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54F019ADA4
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784489862; cv=none; b=Kg5qAWU9KH3SqeXJ7resXNdrp5FlnEro1R53GziK+KcdWdk3B47ZVB802Z5Rq/hOPTUIZvivVdEsl1MZvkzQ5Bi9H0uex4F/+ElA0jPUjFs4i7XpIvRh2E8gaelciNtKxMnKsEu2dLH6MYW7IWPkrbGso2DTzMc0SG9r93soB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784489862; c=relaxed/simple;
	bh=2qMhGnD0e71oa4fiGz1/vfUXOhytewcn5xpqkwi1704=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKjz59kMOsbUWP3tMEry2QxWW0z8U5TDzIHG3ICiw08ceY67nxLZW0ApXiEEJ/efo+htieEqI1dReQKtwA7JB7L1CxTCcKcyE/bIMLReuAPd8mXXRfDcouYInePzuCvu53t5RrkcLG3Eif6HzqPuXBb3Dl7Zj61E7gYqRAmB0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeuMv75Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeuMv75Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784489860; x=1816025860;
  h=date:from:to:cc:subject:message-id;
  bh=2qMhGnD0e71oa4fiGz1/vfUXOhytewcn5xpqkwi1704=;
  b=IeuMv75ZlEs5D2AvAWXUDFJc77S42peLBs3ZoG+P4+UGJjJUUnUurctd
   Ojbv2zLFaTWEjPPH4GtdsUEwHqowpD5SdXRUqBDKrYmgZN5aaGu0uMUXx
   mF+9EZOAJzID34wwBcM0w35KHnPp2NMURzTcmNY+dbFV2gSV397Iqyd7W
   2Nto/TG3k/6LuanjLr/cXvSSeBr2jblzPTOTKUSqpomHe+HnqTpbq89Xf
   osGN4BgCTrJx31GN2ejwGbrkOrMHW5Vpu7fSBG6XenByLKDO05sziEaoR
   p2hQFwwxwqENDkX5j/8iS7w7PZaH5gcvDyoNtfsA30NZ8vp6NpJqhTZah
   w==;
X-CSE-ConnectionGUID: VThAudm8TsSije5xevqWYw==
X-CSE-MsgGUID: ZTqumJqtT8q29cUHxldFPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95438288"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="95438288"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 12:37:40 -0700
X-CSE-ConnectionGUID: o44jor9+TN+/DtWq00r4eQ==
X-CSE-MsgGUID: e948o3EoS16CdjpA3V78KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="253864037"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jul 2026 12:37:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlXKK-00000000VgN-006L;
	Sun, 19 Jul 2026 19:37:30 +0000
Date: Mon, 20 Jul 2026 03:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/pf1550-charger.c:594:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202607200340.XP0KAZgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 4b6b6433a97d5863b5340fc87f866d784fdf0783 power: supply: pf1550: add battery charger support
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260720/202607200340.XP0KAZgU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4b6b6433a97d ("power: supply: pf1550: add battery charger support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607200340.XP0KAZgU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/pf1550-charger.c:594:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +594 drivers/power/supply/pf1550-charger.c

4b6b6433a97d58 Samuel Kayode 2025-10-01  548  
4b6b6433a97d58 Samuel Kayode 2025-10-01  549  static int pf1550_charger_probe(struct platform_device *pdev)
4b6b6433a97d58 Samuel Kayode 2025-10-01  550  {
4b6b6433a97d58 Samuel Kayode 2025-10-01  551  	const struct pf1550_ddata *pf1550 = dev_get_drvdata(pdev->dev.parent);
4b6b6433a97d58 Samuel Kayode 2025-10-01  552  	struct power_supply_config psy_cfg = {};
4b6b6433a97d58 Samuel Kayode 2025-10-01  553  	struct pf1550_charger *chg;
4b6b6433a97d58 Samuel Kayode 2025-10-01  554  	int i, irq, ret;
4b6b6433a97d58 Samuel Kayode 2025-10-01  555  
4b6b6433a97d58 Samuel Kayode 2025-10-01  556  	chg = devm_kzalloc(&pdev->dev, sizeof(*chg), GFP_KERNEL);
4b6b6433a97d58 Samuel Kayode 2025-10-01  557  	if (!chg)
4b6b6433a97d58 Samuel Kayode 2025-10-01  558  		return -ENOMEM;
4b6b6433a97d58 Samuel Kayode 2025-10-01  559  
4b6b6433a97d58 Samuel Kayode 2025-10-01  560  	chg->dev = &pdev->dev;
4b6b6433a97d58 Samuel Kayode 2025-10-01  561  	chg->pf1550 = pf1550;
4b6b6433a97d58 Samuel Kayode 2025-10-01  562  
4b6b6433a97d58 Samuel Kayode 2025-10-01  563  	if (!chg->pf1550->regmap)
4b6b6433a97d58 Samuel Kayode 2025-10-01  564  		return dev_err_probe(&pdev->dev, -ENODEV,
4b6b6433a97d58 Samuel Kayode 2025-10-01  565  				     "failed to get regmap\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  566  
4b6b6433a97d58 Samuel Kayode 2025-10-01  567  	platform_set_drvdata(pdev, chg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  568  
4b6b6433a97d58 Samuel Kayode 2025-10-01  569  	ret = devm_delayed_work_autocancel(chg->dev, &chg->vbus_sense_work,
4b6b6433a97d58 Samuel Kayode 2025-10-01  570  					   pf1550_chg_vbus_work);
4b6b6433a97d58 Samuel Kayode 2025-10-01  571  	if (ret)
4b6b6433a97d58 Samuel Kayode 2025-10-01  572  		return dev_err_probe(chg->dev, ret,
4b6b6433a97d58 Samuel Kayode 2025-10-01  573  				     "failed to add vbus sense work\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  574  
4b6b6433a97d58 Samuel Kayode 2025-10-01  575  	ret = devm_delayed_work_autocancel(chg->dev, &chg->chg_sense_work,
4b6b6433a97d58 Samuel Kayode 2025-10-01  576  					   pf1550_chg_chg_work);
4b6b6433a97d58 Samuel Kayode 2025-10-01  577  	if (ret)
4b6b6433a97d58 Samuel Kayode 2025-10-01  578  		return dev_err_probe(chg->dev, ret,
4b6b6433a97d58 Samuel Kayode 2025-10-01  579  				     "failed to add charger sense work\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  580  
4b6b6433a97d58 Samuel Kayode 2025-10-01  581  	ret = devm_delayed_work_autocancel(chg->dev, &chg->bat_sense_work,
4b6b6433a97d58 Samuel Kayode 2025-10-01  582  					   pf1550_chg_bat_work);
4b6b6433a97d58 Samuel Kayode 2025-10-01  583  	if (ret)
4b6b6433a97d58 Samuel Kayode 2025-10-01  584  		return dev_err_probe(chg->dev, ret,
4b6b6433a97d58 Samuel Kayode 2025-10-01  585  				     "failed to add battery sense work\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  586  
4b6b6433a97d58 Samuel Kayode 2025-10-01  587  	for (i = 0; i < PF1550_CHARGER_IRQ_NR; i++) {
4b6b6433a97d58 Samuel Kayode 2025-10-01  588  		irq = platform_get_irq(pdev, i);
4b6b6433a97d58 Samuel Kayode 2025-10-01  589  		if (irq < 0)
4b6b6433a97d58 Samuel Kayode 2025-10-01  590  			return irq;
4b6b6433a97d58 Samuel Kayode 2025-10-01  591  
4b6b6433a97d58 Samuel Kayode 2025-10-01  592  		chg->virqs[i] = irq;
4b6b6433a97d58 Samuel Kayode 2025-10-01  593  
4b6b6433a97d58 Samuel Kayode 2025-10-01 @594  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
4b6b6433a97d58 Samuel Kayode 2025-10-01  595  						pf1550_charger_irq_handler,
4b6b6433a97d58 Samuel Kayode 2025-10-01  596  						IRQF_NO_SUSPEND,
4b6b6433a97d58 Samuel Kayode 2025-10-01  597  						"pf1550-charger", chg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  598  		if (ret)
4b6b6433a97d58 Samuel Kayode 2025-10-01  599  			return dev_err_probe(&pdev->dev, ret,
4b6b6433a97d58 Samuel Kayode 2025-10-01  600  					     "failed irq request\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  601  	}
4b6b6433a97d58 Samuel Kayode 2025-10-01  602  
4b6b6433a97d58 Samuel Kayode 2025-10-01  603  	psy_cfg.drv_data = chg;
4b6b6433a97d58 Samuel Kayode 2025-10-01  604  
4b6b6433a97d58 Samuel Kayode 2025-10-01  605  	chg->charger = devm_power_supply_register(&pdev->dev,
4b6b6433a97d58 Samuel Kayode 2025-10-01  606  						  &pf1550_charger_desc,
4b6b6433a97d58 Samuel Kayode 2025-10-01  607  						  &psy_cfg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  608  	if (IS_ERR(chg->charger))
4b6b6433a97d58 Samuel Kayode 2025-10-01  609  		return dev_err_probe(&pdev->dev, PTR_ERR(chg->charger),
4b6b6433a97d58 Samuel Kayode 2025-10-01  610  				     "failed: power supply register\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  611  
4b6b6433a97d58 Samuel Kayode 2025-10-01  612  	chg->battery = devm_power_supply_register(&pdev->dev,
4b6b6433a97d58 Samuel Kayode 2025-10-01  613  						  &pf1550_battery_desc,
4b6b6433a97d58 Samuel Kayode 2025-10-01  614  						  &psy_cfg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  615  	if (IS_ERR(chg->battery))
4b6b6433a97d58 Samuel Kayode 2025-10-01  616  		return dev_err_probe(&pdev->dev, PTR_ERR(chg->battery),
4b6b6433a97d58 Samuel Kayode 2025-10-01  617  				     "failed: power supply register\n");
4b6b6433a97d58 Samuel Kayode 2025-10-01  618  
4b6b6433a97d58 Samuel Kayode 2025-10-01  619  	pf1550_dt_parse_dev_info(chg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  620  
4b6b6433a97d58 Samuel Kayode 2025-10-01  621  	return pf1550_reg_init(chg);
4b6b6433a97d58 Samuel Kayode 2025-10-01  622  }
4b6b6433a97d58 Samuel Kayode 2025-10-01  623  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
