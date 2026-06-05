Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B7175A9F
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623372; cv=none; b=pikdHzTQcAgsNQPbwX2jtecIsw0gQ7oHVdsLRuMJ1lxtY5Z5vpiEsjQCRhGET8Pt1fuICe0ZRIs/omKyVjvqPMw8y33vMGIvz1Gqudrp00uld7EakJ0wxLDt4VZn4/T6T4UEAozM1TAoa4o4ReTIzW/Gih7hPR0vam+Ce2mSby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623372; c=relaxed/simple;
	bh=NvNPKJz+dv0hO6nV4au5ar2M90MEcSOKiljb4BLYKqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O/7jZUgELzzqn9bLRyAAAFfwVlLNAX8sPS+0QOXd34GfvoSn8eKm2IBH7nEEk7i7yMXECkWBY3uZRiAlvXKrha9MLnQEMz8MQ5VU6dPs/tyOUrWxYSmGvecq8F8lhW3AxaAC5u/6Tt3UR5xkmw4YvDxEJbQf+13LfkAnB5eLa/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UE1XTic3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UE1XTic3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780623366; x=1812159366;
  h=date:from:to:cc:subject:message-id;
  bh=NvNPKJz+dv0hO6nV4au5ar2M90MEcSOKiljb4BLYKqM=;
  b=UE1XTic3JWyuZwn4H1nlBTRAlBYSuM2bpBY/jFfmd0ZniJNWfhGlP7Al
   4rli0Guc8R3s+BKi+fWM2L5zXCxvsUA2Oszk9Kyk7BNAFFBm+wavP0WGr
   26BnQTI3jcbbRHbH6ThTA04ZLXtN/cd/ywscL6mqgoLp7BI2hsjm3fVXv
   oOLzc+kmlvBPnSeQ4Lm0KBJdOW8NsnfTpn4ksqalq9L0qBtHehkh9duiQ
   vSGpZQGqCOxTRq+Vl4cn6/P43UJbfWhxJj3UDTCk5gLw5nHPR8G6ptlBl
   OmMGZegjXNgomsxv6QHJTZJ8hLlhNBIqnRNGVGTg+6c9qBZvJB7koawjh
   A==;
X-CSE-ConnectionGUID: G40eGsN1Rl2XiZNdY7Ousg==
X-CSE-MsgGUID: 7EljoC1SQKyivyCi8Fg4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85311174"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85311174"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 18:36:06 -0700
X-CSE-ConnectionGUID: QGnLSUP2RLea30Na8mR1iw==
X-CSE-MsgGUID: gMg8gX2BRaeb3HBtAFPN3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248638128"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2026 18:36:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVJTd-00000000FR2-3rHz;
	Fri, 05 Jun 2026 01:36:01 +0000
Date: Fri, 05 Jun 2026 09:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf1550-regulator.c:399:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202606050950.hMXzGnmA-lkp@intel.com>
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
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 regulator: pf1550: Add support for regulator
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050950.hMXzGnmA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606050950.hMXzGnmA-lkp@intel.com/

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
