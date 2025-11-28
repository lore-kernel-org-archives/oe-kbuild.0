Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CE208D0
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764290751; cv=none; b=C7MUIPHHt0sIQxZcBpZSaw/Ke7MBmImKYkmIo/+Fp4X5xKFdA4xU9R0/KN204yA86ny0US94cN6jAPHsBUcOsZyx9+8q1PcQThIi8UFQ0d6tanknFRfADdhRn9/IN1T1WVDTtzWx11Scy8Xfp/SKwLZNHEbWDAUz3rEEJYQxHTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764290751; c=relaxed/simple;
	bh=J1EpiXFSGGPYwaQnIrHOhTNL3rslFjKYL0JxswtRS+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eq6uCx0FIi9UxGWjSZmtuIrxcJ3XrY0n119ua2gNCDKJ92BlhjWHKp3yvdv6gsIcXt/HqJrgLhcqqo75lZzQJMaEO1NkEwqa/LeNURVKZ/9V4QI9Dt46Q/5jh78vMoJIqTDCNREo5n6o5iOLG+UNfMXquyAZrxfyEmw3FGilUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKD89xS0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKD89xS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764290750; x=1795826750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1EpiXFSGGPYwaQnIrHOhTNL3rslFjKYL0JxswtRS+A=;
  b=WKD89xS0wuOOE8vCj/ALb/ycgbFELp+5zts1EJ95AXeyUG4HO4wmBwtE
   uDswlbsx2nIJuPSTkJT3L28JNKU0RQ+MhBvRcRWM+bBwuGSU16B+jX2Lg
   h3VadcR7l+K6pY5D6jjpaAa053TQpGuUczbsihN6w+V7HcHh/KoFg0atw
   3DkvQ2UvNqjyLcW/aNwkf8VnmWxgvxG02vg1EiXg+VsBsncLlx953UHTR
   /VWSuhjbPHXIJjChdTjCoaoKQvxe2Ewk3v+vTK09oDL98WtG3PMlWrf5q
   odSQxgxmCOvG22vjiJnzGh63Yli5OKEbOzUXNDXvmfDJ6j3FHsRX0GeVL
   Q==;
X-CSE-ConnectionGUID: ptHaqw1GTA+5BsPFteojrg==
X-CSE-MsgGUID: a++xqn3AQ3apy3pq8rfHcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65515635"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="65515635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 16:45:49 -0800
X-CSE-ConnectionGUID: PfNnHFesSD6795Qva7+oLw==
X-CSE-MsgGUID: WexvjPRjSuqKXN8OVsiJWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224038086"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2025 16:45:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOmcK-000000005st-42PQ;
	Fri, 28 Nov 2025 00:45:44 +0000
Date: Fri, 28 Nov 2025 08:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2573/12398]
 drivers/regulator/pf1550-regulator.c:399:8-33: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202511280839.LVVxce0P-lkp@intel.com>
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
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 [2573/12398] regulator: pf1550: Add support for regulator
:::::: branch date: 22 hours ago
:::::: commit date: 5 weeks ago
config: hexagon-randconfig-r064-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280839.LVVxce0P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511280839.LVVxce0P-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/pf1550-regulator.c:399:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +399 drivers/regulator/pf1550-regulator.c

7320d41c29bbd80 Samuel Kayode 2025-10-01  345  
7320d41c29bbd80 Samuel Kayode 2025-10-01  346  static int pf1550_regulator_probe(struct platform_device *pdev)
7320d41c29bbd80 Samuel Kayode 2025-10-01  347  {
7320d41c29bbd80 Samuel Kayode 2025-10-01  348  	const struct pf1550_ddata *pf1550 = dev_get_drvdata(pdev->dev.parent);
7320d41c29bbd80 Samuel Kayode 2025-10-01  349  	struct regulator_config config = { };
7320d41c29bbd80 Samuel Kayode 2025-10-01  350  	struct pf1550_regulator_info *info;
7320d41c29bbd80 Samuel Kayode 2025-10-01  351  	int i, irq = -1, ret = 0;
7320d41c29bbd80 Samuel Kayode 2025-10-01  352  
7320d41c29bbd80 Samuel Kayode 2025-10-01  353  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
7320d41c29bbd80 Samuel Kayode 2025-10-01  354  	if (!info)
7320d41c29bbd80 Samuel Kayode 2025-10-01  355  		return -ENOMEM;
7320d41c29bbd80 Samuel Kayode 2025-10-01  356  
7320d41c29bbd80 Samuel Kayode 2025-10-01  357  	config.regmap = dev_get_regmap(pf1550->dev, NULL);
7320d41c29bbd80 Samuel Kayode 2025-10-01  358  	if (!config.regmap)
7320d41c29bbd80 Samuel Kayode 2025-10-01  359  		return dev_err_probe(&pdev->dev, -ENODEV,
7320d41c29bbd80 Samuel Kayode 2025-10-01  360  				     "failed to get parent regmap\n");
7320d41c29bbd80 Samuel Kayode 2025-10-01  361  
7320d41c29bbd80 Samuel Kayode 2025-10-01  362  	config.dev = pf1550->dev;
7320d41c29bbd80 Samuel Kayode 2025-10-01  363  	config.regmap = pf1550->regmap;
7320d41c29bbd80 Samuel Kayode 2025-10-01  364  	info->dev = &pdev->dev;
7320d41c29bbd80 Samuel Kayode 2025-10-01  365  	info->pf1550 = pf1550;
7320d41c29bbd80 Samuel Kayode 2025-10-01  366  
7320d41c29bbd80 Samuel Kayode 2025-10-01  367  	memcpy(info->regulator_descs, pf1550_regulators,
7320d41c29bbd80 Samuel Kayode 2025-10-01  368  	       sizeof(info->regulator_descs));
7320d41c29bbd80 Samuel Kayode 2025-10-01  369  
7320d41c29bbd80 Samuel Kayode 2025-10-01  370  	for (i = 0; i < ARRAY_SIZE(pf1550_regulators); i++) {
7320d41c29bbd80 Samuel Kayode 2025-10-01  371  		struct regulator_desc *desc;
7320d41c29bbd80 Samuel Kayode 2025-10-01  372  
7320d41c29bbd80 Samuel Kayode 2025-10-01  373  		desc = &info->regulator_descs[i].desc;
7320d41c29bbd80 Samuel Kayode 2025-10-01  374  
7320d41c29bbd80 Samuel Kayode 2025-10-01  375  		if ((desc->id == PF1550_SW2 && !pf1550->dvs2_enable) ||
7320d41c29bbd80 Samuel Kayode 2025-10-01  376  		    (desc->id == PF1550_SW1 && !pf1550->dvs1_enable)) {
7320d41c29bbd80 Samuel Kayode 2025-10-01  377  			/* OTP_SW2_DVS_ENB == 1? or OTP_SW1_DVS_ENB == 1? */
7320d41c29bbd80 Samuel Kayode 2025-10-01  378  			desc->volt_table = pf1550_sw12_volts;
7320d41c29bbd80 Samuel Kayode 2025-10-01  379  			desc->n_voltages = ARRAY_SIZE(pf1550_sw12_volts);
7320d41c29bbd80 Samuel Kayode 2025-10-01  380  			desc->ops = &pf1550_sw1_ops;
7320d41c29bbd80 Samuel Kayode 2025-10-01  381  		}
7320d41c29bbd80 Samuel Kayode 2025-10-01  382  
7320d41c29bbd80 Samuel Kayode 2025-10-01  383  		info->rdevs[i] = devm_regulator_register(&pdev->dev, desc,
7320d41c29bbd80 Samuel Kayode 2025-10-01  384  							 &config);
7320d41c29bbd80 Samuel Kayode 2025-10-01  385  		if (IS_ERR(info->rdevs[i]))
7320d41c29bbd80 Samuel Kayode 2025-10-01  386  			return dev_err_probe(&pdev->dev,
7320d41c29bbd80 Samuel Kayode 2025-10-01  387  					     PTR_ERR(info->rdevs[i]),
7320d41c29bbd80 Samuel Kayode 2025-10-01  388  					     "failed to initialize regulator-%d\n",
7320d41c29bbd80 Samuel Kayode 2025-10-01  389  					     i);
7320d41c29bbd80 Samuel Kayode 2025-10-01  390  	}
7320d41c29bbd80 Samuel Kayode 2025-10-01  391  
7320d41c29bbd80 Samuel Kayode 2025-10-01  392  	platform_set_drvdata(pdev, info);
7320d41c29bbd80 Samuel Kayode 2025-10-01  393  
7320d41c29bbd80 Samuel Kayode 2025-10-01  394  	for (i = 0; i < PF1550_REGULATOR_IRQ_NR; i++) {
7320d41c29bbd80 Samuel Kayode 2025-10-01  395  		irq = platform_get_irq(pdev, i);
7320d41c29bbd80 Samuel Kayode 2025-10-01  396  		if (irq < 0)
7320d41c29bbd80 Samuel Kayode 2025-10-01  397  			return irq;
7320d41c29bbd80 Samuel Kayode 2025-10-01  398  
7320d41c29bbd80 Samuel Kayode 2025-10-01 @399  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
7320d41c29bbd80 Samuel Kayode 2025-10-01  400  						pf1550_regulator_irq_handler,
7320d41c29bbd80 Samuel Kayode 2025-10-01  401  						IRQF_NO_SUSPEND,
7320d41c29bbd80 Samuel Kayode 2025-10-01  402  						"pf1550-regulator", info);
7320d41c29bbd80 Samuel Kayode 2025-10-01  403  		if (ret)
7320d41c29bbd80 Samuel Kayode 2025-10-01  404  			return dev_err_probe(&pdev->dev, ret,
7320d41c29bbd80 Samuel Kayode 2025-10-01  405  					     "failed: irq request (IRQ: %d)\n",
7320d41c29bbd80 Samuel Kayode 2025-10-01  406  					     i);
7320d41c29bbd80 Samuel Kayode 2025-10-01  407  	}
7320d41c29bbd80 Samuel Kayode 2025-10-01  408  
7320d41c29bbd80 Samuel Kayode 2025-10-01  409  	return 0;
7320d41c29bbd80 Samuel Kayode 2025-10-01  410  }
7320d41c29bbd80 Samuel Kayode 2025-10-01  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
