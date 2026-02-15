Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5321A447
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771124708; cv=none; b=Q6cJUoWmFSyHxnSOu43sQpsJ7Qqqbjg8duEuJNV0z4MUDpE7riHa4fQd0bJxqZi7YmiCC0MwZ5D1a2zvbNhQ7Q7kEw34900CPwa2apUmWE1Y2PPMVFLyLTC1+GcoBhqV2MrBgJd/NCBpcH2wk7SNUrXv6s5qicvsvvNbs74YQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771124708; c=relaxed/simple;
	bh=SOM3RyhRlatW1aeCn9bW3MdQrDBAgSaeU+9O5/zJ/NY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sC0ARp4ois3rK5r9KwJI8ZV5H3sH1mnioazYWEu2z6s4Fh4V3UVj6awiUHnZCgzfqmL4PG1McgGrmo+77XQZY3B9HWU5HBsOZZcaaAo9iWL5PSZejeJlwxbPSRC06340eADBrYxJ9XaxSNNQvUzZS7pE0E/alx1hWDfXrcVs2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpRb9jTF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpRb9jTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771124707; x=1802660707;
  h=date:from:to:cc:subject:message-id;
  bh=SOM3RyhRlatW1aeCn9bW3MdQrDBAgSaeU+9O5/zJ/NY=;
  b=VpRb9jTFi59BWZeIQeWBC2GoJy8MD4DKsTiE8F/Ob5wuH0Tm731KwBdQ
   fquGFNe0+Y6YF9/nownI1UK4U1Y+CLcA1rq9U3xJYTyHM2j/4G2T2IkwQ
   stq/9GDPy5fIZ2G63QSajM+Yhsw0+SsyZWwpbjXYXDrqfrTpPd2WN2U4m
   LJTHoLxqz19NXFbTlQ6kfaViYwx1IVh0jIHxMVd/QFhqPUW/32EG6eojO
   Fp+ci7PgZOFpOPgDIOq5s1hovxT9dsn1Xx6rJ4J9O04P2rlowBvHzsS4w
   TkClDLZ5qYJRIf1DeBhsEPcqD4im8stLs2AWQrK53/19HpXPz7anFvwS9
   A==;
X-CSE-ConnectionGUID: btQ3S0QbS2ixCY4IabhWTg==
X-CSE-MsgGUID: i4c9ZEaXSYyrrGGulOwIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59826712"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="59826712"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:05:06 -0800
X-CSE-ConnectionGUID: 3CJhBPoLQgmsT3jT+KJhXA==
X-CSE-MsgGUID: q8Ggh2BxSKStUGdDSq4iKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213373814"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2026 19:05:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrSRS-00000000xDF-2tOl;
	Sun, 15 Feb 2026 03:05:02 +0000
Date: Sun, 15 Feb 2026 11:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/pf1550-charger.c:594:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202602151032.KFAbs8Tn-lkp@intel.com>
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
head:   ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
commit: 4b6b6433a97d5863b5340fc87f866d784fdf0783 power: supply: pf1550: add battery charger support
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r063-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151032.KFAbs8Tn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602151032.KFAbs8Tn-lkp@intel.com/

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
