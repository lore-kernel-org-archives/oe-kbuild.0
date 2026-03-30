Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493E3E1205
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897780; cv=none; b=NskS17+F3JhQ0cCtLxLdVng+K8H4fLktdcbK58tZrybOHs9qPABkx5RGOBk/nEFWso567mRe0cv5wk1QOfZyFF8FmMr9ZQi2AaQlNjmAmnNbL1cTv54Yrznj4qtKw9FQtFrQE54tisjB32EF29e1soGFKOI3mny+Xrx4tXXcT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897780; c=relaxed/simple;
	bh=JLrC2Tugy7cHRk/Q6ucqEbNVB/DxAYfIE3l1zaX6lM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bEK3X75/8/XUOEm5LpE6FFFxAIOtfhPPMa5dH4salfcRvfK3QuwrQarMMOarJjZDAj9LIdT5VRX7njnc56VCrGkullU0gUcX4WEojyc0YyxQEgqiw5yH8kz/+sYdihP1bPxuQTUzVUWljO2JuKIXq4GveBaHhQuuMPdzTVB71/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmbLvXXf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmbLvXXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774897777; x=1806433777;
  h=date:from:to:cc:subject:message-id;
  bh=JLrC2Tugy7cHRk/Q6ucqEbNVB/DxAYfIE3l1zaX6lM8=;
  b=ZmbLvXXfiUNFrBswslkff2Km80Tpmjq+ElI7f35A/ukOUx+/1WSvmll9
   QuGFeDB8OfEPcC2CoWWuUVFzZpix0A/UQ0EG/0NX12+p/S/tE94ht/5TC
   0hDfWcuHyLusH+Wi8Wknqf8KqRH98/JBbUe7X18yUiHGNN7ifnxjFv8xa
   Zu2/RrFPhU5yXry9zs/1qgtpdpQz/EzNOiZT6WYRkFDf95Vvo94WrdvZN
   73S0VfjW+iDPh74a67g1uZr0krMvUcACtypo+tzz1RMHZS+MwYLE6wOgu
   ig8z3WrNVg4vixEFARtbLQMEdOZsAIrC4TIxEgn0ee4d6FLWVoYjrVPkD
   g==;
X-CSE-ConnectionGUID: g7kWnHLQRjqM9nMIF1c/BA==
X-CSE-MsgGUID: 9ZYQEWQWSZKVM1SsWhU2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76010343"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="76010343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 12:09:36 -0700
X-CSE-ConnectionGUID: 8WRhJdaTSayEzxTscbpxaA==
X-CSE-MsgGUID: mCd+buoQTKOgiS32gxJhhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230602986"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Mar 2026 12:09:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7HzQ-000000001X9-1L3o;
	Mon, 30 Mar 2026 19:09:32 +0000
Date: Tue, 31 Mar 2026 03:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/pf1550-charger.c:594:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202603310329.V0dDFga3-lkp@intel.com>
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
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 4b6b6433a97d5863b5340fc87f866d784fdf0783 power: supply: pf1550: add battery charger support
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r052-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310329.V0dDFga3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603310329.V0dDFga3-lkp@intel.com/

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
