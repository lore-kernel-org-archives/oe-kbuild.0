Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081807;
	b=RADOWmjLKI4XpGWDgArCC2CWUllxcOZJHa9KYbuSu8XvTEknD1U+pgeypVhvm3I8nTy5
	 N5BGCN49jIAmHGfb5cJHnH66faVbgQUP+99chJxwlINOaO7YA+r5RlS1NpSk8KpXStqq0
	 PAHA5JA9BTC6185SfhE0/hAi9Y8hFExOrR8TP8v/1/5mit7jwLk1iSvdCYcUU7IcpZkjw
	 hEbsGYWd8wqUmZBwqrhlfyzZza1mvVT2PISX5bm6bKkgFLQkszzaO5rtPx2L8qm5bxPP1
	 k9HsJ/fHpcwqA5douKvf33G0rWs4Q1ToYpZ9Q6dnrbdyhf/p0S6TkSNK5CZ/8bg3jag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uC2mdPQqWz0DdcRtE9L1NkxSRhmSRPXcZV3VfD4B0yw=;
	b=5kay5+gqqNusbF4dkSTh+ERqD0+r5j2RxMkZyFLVA2LoKpIjuL5QJOah0zbVqcyfsh4K
	 XgEuMgzci9qsTrif21i9XoeNci3ETiMAMaBBcmeyVO+pe2FNDJEShOyIfYbI+AjPpq1Ta
	 GVywAtuQ2rNfYXpzRn0hoIoHJVoS6VcfcO/g+dT4M+Z0FJdt6TqwXgZ9MblEuH79VAWp9
	 +nK85+p5cf63UOkI7Ydgv/xVXpm8H2Tz+6BJ2GkfUQw7bCdXxMuKBAcRT2eQqUzYDlOPO
	 n8Xj7IfnxYGr8lXl2zbt2gDxKdNKaa+kZNsoynDVZZcZPJ5ae2n8k6EpFh7Xka5goJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hoRcVPv/";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3C606A33E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 09:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF3C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoRcVPv/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795081807; x=1826617807;
  h=date:from:to:cc:subject:message-id;
  bh=oQv7cceB5+C/CW/8dYbcfnjrC1T8i9RsvDVhVud3Ev8=;
  b=hoRcVPv/stBTZeJutAvDJmlPOQrEEWxJ58LvCQNAbDlsRwLMg8rUWLTi
   EEyhhrlVu+T5h2g1WVx7v68iMB3bUr7K0eGmfm+rMGsYjJBhYs0MmCh+R
   /5VLMSQjPUpfEaJRfvFYl5S2uqWZADVB/JWgVJWep5lD4P4WoUiNgXek8
   uQTfe18fM5Va7JsnY9ZJ1LPReIqIhLEKHBWApM/zeZctuPyaDyi4lF1z4
   MKtEsQec4v43pkqvcUZJWF9tENVxV1r+PN+HLcKjJerEZnpzmlUqE58lg
   /4ihqcpon+eKnrUX5IK1J2NfBI9qCxTYX48S3IetfoaHOT56PUrUuaMHL
   g==;
X-CSE-ConnectionGUID: UTX+i6afQFSfCNVARrWJXA==
X-CSE-MsgGUID: u50gm9xYTYaIHKwl3jwqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3943927"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3943927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:50:06 -0800
X-CSE-ConnectionGUID: IStc1yrvRZq7xtAXuEaSOQ==
X-CSE-MsgGUID: L7OiQujwRmmWcmryeImxSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10773117"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2026 01:50:04 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTymH-000000003kN-3WDH;
	Thu, 19 Nov 2026 09:50:01 +0000
Date: Thu, 19 Nov 2026 10:49:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/pf1550-regulator.c:399:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <20261119104722.ZKkqZuSA-lkp@intel.com>
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
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 7320d41c29bbd80144bb89112b8bf0c8223b94a1 regulator: pf1550: Add support for regulator
date:   1 year, 1 month ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119104722.ZKkqZuSA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261119104722.ZKkqZuSA-lkp@intel.com/

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
