Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DC1E1DFC
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765937435; cv=none; b=uBxyvqNTFH3evV4qIavmQt4sEaFsp4fOFjL3E8p5WzlwOlICUHl+f1c3dDzO59Tv5ZW8+EHk13XEsddQeUh40fQBtXW1zhBHdOhzj32w5XssjiJV1eGRBQdQXYb81JbzaSP4yL1PbMYl4HZB/eahpNMjVDJgTLv0BrVeW3JlHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765937435; c=relaxed/simple;
	bh=ObUqZVlXC5unEP0maOJzyveY84MOyNRuh7XRs11/dwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGC1Wie895jAb3x+uxdrP0AeKN+4idm+E9N5cwAWmWGkZCVfRPp7bwa+BZlsmgMbOGgQ8qaBO6+2L1AXDBKDi8Y1Az0MN1M6xK5mY8lQprXgEXIgL/hDvPdEyVYt6JWuR5cGLrYuk8h0gUpudFiNb2THUtcM3KPqVXUN+UcFLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNtY+wSk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNtY+wSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765937434; x=1797473434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObUqZVlXC5unEP0maOJzyveY84MOyNRuh7XRs11/dwM=;
  b=bNtY+wSk8Y+DdoWHZFwSonOXKbamyVv/iez3kImqeFFFN7bdSYx3z5PF
   D4SLP53k9HvIMb1wr4WGxLcIR5XUGOWtjsInxfhcfAVVhfpzrKpzGi37/
   1EMRKYL4kT5cFiBjYVKaJjLw70CXkO0aSLm68OJRuaNpMZD6SkWcn3dn0
   LkKteEEwPoLB7MTAs4T77GwYxr51/k0Hojym7BH4tjW4ZLrvoc2WHUnps
   xemiM55zsdF1BAaGH+CgPWBW5xXj6zwgooIoojnJg6jNVDhEaOS4IxM74
   akm2TOKlQhnHph2MyZQRZNjm3GUVOkJod3zgPOmZwN1eJr9vcTLviyRNT
   Q==;
X-CSE-ConnectionGUID: qQKiLCy7Saa6dkddHjpfmw==
X-CSE-MsgGUID: wD11LLo2R4ePfjsGByC/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78505967"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78505967"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 18:10:33 -0800
X-CSE-ConnectionGUID: MbpTy7kORiycS0BXXiwqYA==
X-CSE-MsgGUID: gfM47PqTRLeVXDd1h7V34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="203090696"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2025 18:10:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVgzl-0000000043y-3PYt;
	Wed, 17 Dec 2025 02:10:29 +0000
Date: Wed, 17 Dec 2025 10:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/pf1550-charger.c:594:8-33: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <202512171041.le9ry8Jd-lkp@intel.com>
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
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 4b6b6433a97d5863b5340fc87f866d784fdf0783 power: supply: pf1550: add battery charger support
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: microblaze-randconfig-r051-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171041.le9ry8Jd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512171041.le9ry8Jd-lkp@intel.com/

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
