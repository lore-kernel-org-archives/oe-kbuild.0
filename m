Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FD3A4274
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784476699; cv=none; b=hhqneDv5DVnzjEKZljeTPspyyI9X4LPgb/wAjjxdpzi18P0UkB2oqnzDo/cYEO0GXuKzEIpWLcGCaH3gwJ1f8ecDJnoBmbmqLh9BIM45iI+HxEwXw8xfyrVbizLBVe6XmsHUFSGxPLYPL0Y+SBrDI4qDUb9Hr+Fq4Z95DQ7B6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784476699; c=relaxed/simple;
	bh=gqcpb3ETcl2kJeKalCHvBuBQ6bZFp39RhW/KqqbUBTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=avm4vH3rj0Zl/89VhjHWnX1LAZUiax5nt3/ncZE0+IYY80taEKM/slczx3KXuyzIluNb4FD76MF6WnV+2fbW9M311xBcA7oqmENxUREqRZuInDREQHKtbqzNLOgKAMLFIAPBoDkAjOlIUhINu9cAnL9FeIx63NcwbYQrsD0WeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwOx1BHw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwOx1BHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784476698; x=1816012698;
  h=date:from:to:cc:subject:message-id;
  bh=gqcpb3ETcl2kJeKalCHvBuBQ6bZFp39RhW/KqqbUBTk=;
  b=dwOx1BHwHVTY+db/hRrCBjSvsojOJyKMp3sMK5ykga7vTizFb7S/0KHa
   WolYKT97V74mvioiT3GnU65IWk7fMbuaNwFY6iRbF5txPrp2pysNAKD29
   tAZqol4Dsi2Jm+nzz3qnTA5DzSJ35boYW4EETIZWhncN3DdUZjbVsxQOp
   e0xa3kUyIwu4nPcjzszppPRp+ag1GOpJ+HXVbKGaq6bvNZewBYTf84uYF
   yLMgRfbSDMkXYpZ9E+uPuxbSfVyRLYN26TdoWJt7IxVtWJEvMFoqatO1C
   trLKkziH1d+YEBUaYXkgkDg1ejNp7HCH4pQflqVezVKR/YUqWEod4vifQ
   Q==;
X-CSE-ConnectionGUID: NoMNiA3VTvKH39lo9eLHmg==
X-CSE-MsgGUID: DILvCE/6S/G78xP8U8AQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95432068"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="95432068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 08:58:17 -0700
X-CSE-ConnectionGUID: ItQhJejPQ42fpvZDx2k5Ng==
X-CSE-MsgGUID: wCrFb365QiS91YcOzMH9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="253284778"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2026 08:58:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlTtu-00000000VXB-3wDj;
	Sun, 19 Jul 2026 15:58:11 +0000
Date: Sun, 19 Jul 2026 23:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf1550-regulator.c:399:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202607192351.jekhfiw2-lkp@intel.com>
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
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 regulator: pf1550: Add support for regulator
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260719/202607192351.jekhfiw2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607192351.jekhfiw2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/pf1550-regulator.c:399:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +399 drivers/regulator/pf1550-regulator.c

7320d41c29bbd8 Samuel Kayode 2025-10-01  345  
7320d41c29bbd8 Samuel Kayode 2025-10-01  346  static int pf1550_regulator_probe(struct platform_device *pdev)
7320d41c29bbd8 Samuel Kayode 2025-10-01  347  {
7320d41c29bbd8 Samuel Kayode 2025-10-01  348  	const struct pf1550_ddata *pf1550 = dev_get_drvdata(pdev->dev.parent);
7320d41c29bbd8 Samuel Kayode 2025-10-01  349  	struct regulator_config config = { };
7320d41c29bbd8 Samuel Kayode 2025-10-01  350  	struct pf1550_regulator_info *info;
7320d41c29bbd8 Samuel Kayode 2025-10-01  351  	int i, irq = -1, ret = 0;
7320d41c29bbd8 Samuel Kayode 2025-10-01  352  
7320d41c29bbd8 Samuel Kayode 2025-10-01  353  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
7320d41c29bbd8 Samuel Kayode 2025-10-01  354  	if (!info)
7320d41c29bbd8 Samuel Kayode 2025-10-01  355  		return -ENOMEM;
7320d41c29bbd8 Samuel Kayode 2025-10-01  356  
7320d41c29bbd8 Samuel Kayode 2025-10-01  357  	config.regmap = dev_get_regmap(pf1550->dev, NULL);
7320d41c29bbd8 Samuel Kayode 2025-10-01  358  	if (!config.regmap)
7320d41c29bbd8 Samuel Kayode 2025-10-01  359  		return dev_err_probe(&pdev->dev, -ENODEV,
7320d41c29bbd8 Samuel Kayode 2025-10-01  360  				     "failed to get parent regmap\n");
7320d41c29bbd8 Samuel Kayode 2025-10-01  361  
7320d41c29bbd8 Samuel Kayode 2025-10-01  362  	config.dev = pf1550->dev;
7320d41c29bbd8 Samuel Kayode 2025-10-01  363  	config.regmap = pf1550->regmap;
7320d41c29bbd8 Samuel Kayode 2025-10-01  364  	info->dev = &pdev->dev;
7320d41c29bbd8 Samuel Kayode 2025-10-01  365  	info->pf1550 = pf1550;
7320d41c29bbd8 Samuel Kayode 2025-10-01  366  
7320d41c29bbd8 Samuel Kayode 2025-10-01  367  	memcpy(info->regulator_descs, pf1550_regulators,
7320d41c29bbd8 Samuel Kayode 2025-10-01  368  	       sizeof(info->regulator_descs));
7320d41c29bbd8 Samuel Kayode 2025-10-01  369  
7320d41c29bbd8 Samuel Kayode 2025-10-01  370  	for (i = 0; i < ARRAY_SIZE(pf1550_regulators); i++) {
7320d41c29bbd8 Samuel Kayode 2025-10-01  371  		struct regulator_desc *desc;
7320d41c29bbd8 Samuel Kayode 2025-10-01  372  
7320d41c29bbd8 Samuel Kayode 2025-10-01  373  		desc = &info->regulator_descs[i].desc;
7320d41c29bbd8 Samuel Kayode 2025-10-01  374  
7320d41c29bbd8 Samuel Kayode 2025-10-01  375  		if ((desc->id == PF1550_SW2 && !pf1550->dvs2_enable) ||
7320d41c29bbd8 Samuel Kayode 2025-10-01  376  		    (desc->id == PF1550_SW1 && !pf1550->dvs1_enable)) {
7320d41c29bbd8 Samuel Kayode 2025-10-01  377  			/* OTP_SW2_DVS_ENB == 1? or OTP_SW1_DVS_ENB == 1? */
7320d41c29bbd8 Samuel Kayode 2025-10-01  378  			desc->volt_table = pf1550_sw12_volts;
7320d41c29bbd8 Samuel Kayode 2025-10-01  379  			desc->n_voltages = ARRAY_SIZE(pf1550_sw12_volts);
7320d41c29bbd8 Samuel Kayode 2025-10-01  380  			desc->ops = &pf1550_sw1_ops;
7320d41c29bbd8 Samuel Kayode 2025-10-01  381  		}
7320d41c29bbd8 Samuel Kayode 2025-10-01  382  
7320d41c29bbd8 Samuel Kayode 2025-10-01  383  		info->rdevs[i] = devm_regulator_register(&pdev->dev, desc,
7320d41c29bbd8 Samuel Kayode 2025-10-01  384  							 &config);
7320d41c29bbd8 Samuel Kayode 2025-10-01  385  		if (IS_ERR(info->rdevs[i]))
7320d41c29bbd8 Samuel Kayode 2025-10-01  386  			return dev_err_probe(&pdev->dev,
7320d41c29bbd8 Samuel Kayode 2025-10-01  387  					     PTR_ERR(info->rdevs[i]),
7320d41c29bbd8 Samuel Kayode 2025-10-01  388  					     "failed to initialize regulator-%d\n",
7320d41c29bbd8 Samuel Kayode 2025-10-01  389  					     i);
7320d41c29bbd8 Samuel Kayode 2025-10-01  390  	}
7320d41c29bbd8 Samuel Kayode 2025-10-01  391  
7320d41c29bbd8 Samuel Kayode 2025-10-01  392  	platform_set_drvdata(pdev, info);
7320d41c29bbd8 Samuel Kayode 2025-10-01  393  
7320d41c29bbd8 Samuel Kayode 2025-10-01  394  	for (i = 0; i < PF1550_REGULATOR_IRQ_NR; i++) {
7320d41c29bbd8 Samuel Kayode 2025-10-01  395  		irq = platform_get_irq(pdev, i);
7320d41c29bbd8 Samuel Kayode 2025-10-01  396  		if (irq < 0)
7320d41c29bbd8 Samuel Kayode 2025-10-01  397  			return irq;
7320d41c29bbd8 Samuel Kayode 2025-10-01  398  
7320d41c29bbd8 Samuel Kayode 2025-10-01 @399  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
7320d41c29bbd8 Samuel Kayode 2025-10-01  400  						pf1550_regulator_irq_handler,
7320d41c29bbd8 Samuel Kayode 2025-10-01  401  						IRQF_NO_SUSPEND,
7320d41c29bbd8 Samuel Kayode 2025-10-01  402  						"pf1550-regulator", info);
7320d41c29bbd8 Samuel Kayode 2025-10-01  403  		if (ret)
7320d41c29bbd8 Samuel Kayode 2025-10-01  404  			return dev_err_probe(&pdev->dev, ret,
7320d41c29bbd8 Samuel Kayode 2025-10-01  405  					     "failed: irq request (IRQ: %d)\n",
7320d41c29bbd8 Samuel Kayode 2025-10-01  406  					     i);
7320d41c29bbd8 Samuel Kayode 2025-10-01  407  	}
7320d41c29bbd8 Samuel Kayode 2025-10-01  408  
7320d41c29bbd8 Samuel Kayode 2025-10-01  409  	return 0;
7320d41c29bbd8 Samuel Kayode 2025-10-01  410  }
7320d41c29bbd8 Samuel Kayode 2025-10-01  411  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
