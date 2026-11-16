Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854603;
	b=jrySH3GQWVSqf37g3FEU3RuL/wWWoMEocGUAm/3fTtXIXliaXVrHzkqKvADdA/A+0luI
	 LKx+NV1xGGRy2q/hD37iaTS8XDZM38YVW5bXGyLTGmFbG09gCmNnFLzzq2D+nBZh6ibhx
	 rDd6r37fBrG36wIHVbSE9QxWPjWVAQloLtoa30B1AqsJ5Z8/xkYG0fU3XROpkBAA7Wt0h
	 N7vueWpN1b68d7NQkul0tyQeLRsWN/GCwZeR/5zXE6ryBBZ51VVPsaSIrcwvLdZ3fYUup
	 xolvrvcgTut1+OsHHSuKn0x0bo4ovqtl0sFHe+x28cuED57mjd8uuwAA7SUHH/7ujCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854603;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YP/mMNJSPThlmomxVgJcc+77ZhCRHJohmmVgifm6BA8=;
	b=yxyKKuEYOEN4D7P0Wn3IH92cwFCVk2E1FD44ibrLs1o2tb6XwAyS0tn19S1ftctVr08k
	 5nR20qS0q+GZv9EjlKI3Y/rdy+DtS3JtDQLGWfFxkYTCdVM68Ahovg3irq5ObfsmCnFVM
	 i+OAXUuDRWjsySxwepEHYlmlahYGDE+WVVGX7CrL1JJPuFv8cc7RBNXX6pJ/ylzP6wxnF
	 Zy99tr7HBi5Vnlc1aPAk/poxcX8jvevF7t6ojhETQB+30UJ/h+6dNJptSVhBOFoTuw/6Q
	 zHPh8Qo/PvXBxoXpp0Mpg4LSt3BSdk+6H2bX+Q+KaRO7ikq90D8X6+ukYa8j4GeISWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dAZmphL2;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B3606A32F
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 18:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645B3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dAZmphL2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794854602; x=1826390602;
  h=date:from:to:cc:subject:message-id;
  bh=MoI37/VqwxbxnCwTH9wZ0gnRLfFM7zDX64J8yI3gZWc=;
  b=dAZmphL29RvRSYqdXMdh8SFsJ14K1KFNIwMt+pw/vdBM2Uuta32PotES
   TKfLsLY1x7BmKqRJs7SchkLTtpRi02Mb29ljMHiggMRYUDzilr2hX3JKz
   N/8ZKQiC5Z6JdBiMr6/KARVjr/dO4/dygB1v5EFFFvbXVx18PiU6VL92U
   8cQpcTUeulvW8lQuBaBaqyMqTPVEweETcKDrE5fmHBiaBK2P3bjw4kCdP
   UZG+70ZgWDp2YblsqMfVNGhpxNXNNlzwpxJuLvVCxepHdhsbXD40SNvkk
   j54mV9Y614Umrp91qdRVAhqKvUC/qWcwuZulZGTyJA7wEFLpiR74IwtZb
   g==;
X-CSE-ConnectionGUID: 2s6tUxufRNSGhmQ3HqzQ+g==
X-CSE-MsgGUID: n2Ykzm8QQrCq51RgKGgDqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3592035"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3592035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:43:21 -0800
X-CSE-ConnectionGUID: OqBUgp7OS7m5YacLpEGf8Q==
X-CSE-MsgGUID: YHq4XJ0zSOWBLQhrz8shXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9932027"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2026 10:43:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT1fh-000000002mi-2XRE;
	Mon, 16 Nov 2026 18:43:17 +0000
Date: Mon, 16 Nov 2026 19:42:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf1550-regulator.c:399:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202611161950.9t7YudWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: Lee Jones <lee@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   141b164bbe186423e295b139e40e8e2d11cf1341
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 regulator: pf1550: Add support for regulator
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261116/202611161950.9t7YudWO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611161950.9t7YudWO-lkp@intel.com/

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
