Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF123EAB2
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 02:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767926740; cv=none; b=Q5E6cOpcG/ESwDTH70nipK1TlWjvT7+fynIbswH9Egy4/1WWC2m+3Ubht5B8hCJwT8R6MBt03ZmLCLDspAI9fQtdadMLkBGG+EIGmPLaE88wl0V8Hl9AnVSSGmzMHmSc+LEk2+gLHSTPWL1sMKMTTMGMZ/gjff8w7mI/MDT5bXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767926740; c=relaxed/simple;
	bh=0iil80PQFbcUQo5AN6tk4iBAydeFYn04MYF31SdyZQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ycp1qP8ayA9TNf6DXyV35g76eI7E1yUQUWMJEQKZDN/ibqr+ux9K3/g2CS0BXX40ViNTrTa4Qx3KY/18reXUMquR0y6VndvQhUOAAIrlnMURzI86iKtnUl2da/SHs47zLR5+NUGVtuO3HoQABtXuIgaUJOzRs4KSwI2LeiWvycg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsxNC66x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsxNC66x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767926738; x=1799462738;
  h=date:from:to:cc:subject:message-id;
  bh=0iil80PQFbcUQo5AN6tk4iBAydeFYn04MYF31SdyZQk=;
  b=UsxNC66xNAHT3gtMe2FXqSSteKJ6TefosIdC7FLJgwYyt/KJ9kca5cwV
   av3SvZrkJFeUmvqA81cVrB9IQ8vHOrpPvLW1iTw1z7UJ5r7Zky03Dy40B
   FykUAxUmM0mfdNICZAxs5avgoS8/rrzr7yfJwN4Y201n69xTMuuX13X1g
   NRshiXNa5FbMgc9ZUIof6i6Jj6+wa5M5YxI4iG2muWh1S3hQ5Ob8qG2DV
   lBlZDh/zxCbH78n2a2/40cxVLTYCPcvJceDT25oTUtzM8P6QHe5AvoTc1
   SFH5LU9bmd/k5rbE8o7zC7zef3zsuByBSwntJGgTLrdmZ4u8jHAOoofen
   Q==;
X-CSE-ConnectionGUID: arcGNJGHQUOt1Yet4+651A==
X-CSE-MsgGUID: CBpiPIR7TsCMlCVznIzWAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68313654"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="68313654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:45:37 -0800
X-CSE-ConnectionGUID: bY34w5juQ6arRsONIwmtUQ==
X-CSE-MsgGUID: 0TkL06ToTgWASDErYNNHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203137748"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jan 2026 18:45:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve2VK-000000005L4-11ZC;
	Fri, 09 Jan 2026 02:45:34 +0000
Date: Fri, 09 Jan 2026 10:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf1550-regulator.c:399:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202601091001.w8pPqgVN-lkp@intel.com>
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
head:   5572ad8fddecd4a0db19801262072ff5916b7589
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 regulator: pf1550: Add support for regulator
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: nios2-randconfig-r051-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091001.w8pPqgVN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601091001.w8pPqgVN-lkp@intel.com/

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
