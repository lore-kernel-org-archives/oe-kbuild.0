Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31606A94F
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 00:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748477471; cv=none; b=HxsOLlFUbM8PsJfZHN/TBdVhmCWBJcQjoH0lLdu4bnNEisihI643DEt5waN5V681gubBSGjNmnGcsq/m0Hi0Uw/RCZnuCZB3qKUwYhyrXGAybYb7rFtnDeFXXg+Ktqv7lNipljTfSWTLTQYVpGZH77m4cpWyS0nqt+cYmCyRz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748477471; c=relaxed/simple;
	bh=xzywDLT0yvDuxwzo1iE9bzNXG4Qp3ZigtghjcdgEVgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIeeZ+1oq/BEoaeKyLCmK8UV3cSpvICpv4XGzP0ZGUM+yiggP2GVmSdzAei+YY4VkPkvRSHvtjph+Ikp4E8vRp9v/QKU8RvuBHs3looTpvA2KCtiFp8DuGEtz8yVRosoMUMrBI3SDMizBitJZ+a/SlM96ASzMNVOdh0l92Qosp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbhNiqm3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbhNiqm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748477469; x=1780013469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzywDLT0yvDuxwzo1iE9bzNXG4Qp3ZigtghjcdgEVgY=;
  b=WbhNiqm3q0HX5xoL1Sk0yGkwE7U1LVWNT4O2+B5Z1Oi9zSBcg5xIy6Rt
   kBEGXeJ228kHSijPU+6nKTswLdYfPrWGYgBr+wimU32/aUH7KB9nydKgV
   eaMmc1Ku5Uu1qUUinujg86wP1cWHeDhTBl0s7bCw+ZHZIti5tveBZDrwy
   wMmljEapRnwFvRPrZauiKCkH189+Y08BFb5KlEBnXdKHqEz9D3WQTP3CG
   trvkSl8lSSBtwg60G1Yy5w9k89qlKbBpQKPqI7owdjRVTQXDRrJVM4dnD
   ncGq5TsH41Gsh28HHXxLO6Lne5Q5vvcreqnwcNvlbFeH3y4/i/GeGwEA7
   Q==;
X-CSE-ConnectionGUID: 73LFuDViT622fS37iZuZtA==
X-CSE-MsgGUID: JpRXVC1zQFmhazgaC1wunA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50580579"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="50580579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 17:11:09 -0700
X-CSE-ConnectionGUID: TGYDiS8JRjuJkWkoBQ2qsQ==
X-CSE-MsgGUID: DdzL2/L7T9aowV/J4KdWvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148691195"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2025 17:11:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQrP-000WAy-2Q;
	Thu, 29 May 2025 00:11:03 +0000
Date: Thu, 29 May 2025 08:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/6] mfd: pf1550: add core mfd driver
Message-ID: <202505290859.CKZrTkZu-lkp@intel.com>
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
In-Reply-To: <20250527-pf1550-v3-2-45f69453cd51@savoirfairelinux.com>
References: <20250527-pf1550-v3-2-45f69453cd51@savoirfairelinux.com>
TO: Samuel Kayode via B4 Relay <devnull+samuel.kayode.savoirfairelinux.com@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Sebastian Reichel <sre@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
CC: eballetbo@gmail.com
CC: abelvesa@linux.com
CC: b38343@freescale.com
CC: yibin.gong@nxp.com
CC: Abel Vesa <abelvesa@kernel.org>

Hi Samuel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Kayode-via-B4-Relay/dt-bindings-mfd-add-pf1550/20250528-062840
base:   0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
patch link:    https://lore.kernel.org/r/20250527-pf1550-v3-2-45f69453cd51%40savoirfairelinux.com
patch subject: [PATCH v3 2/6] mfd: pf1550: add core mfd driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: nios2-randconfig-r072-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290859.CKZrTkZu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505290859.CKZrTkZu-lkp@intel.com/

smatch warnings:
drivers/mfd/pf1550.c:162 pf1550_i2c_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +162 drivers/mfd/pf1550.c

fc62e32ad9eb64 Samuel Kayode 2025-05-27  139  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  140  static int pf1550_i2c_probe(struct i2c_client *i2c)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  141  {
fc62e32ad9eb64 Samuel Kayode 2025-05-27  142  	struct pf1550_dev *pf1550;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  143  	unsigned int reg_data = 0;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  144  	int ret = 0;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  145  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  146  	pf1550 = devm_kzalloc(&i2c->dev, sizeof(*pf1550), GFP_KERNEL);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  147  	if (!pf1550)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  148  		return -ENOMEM;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  149  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  150  	i2c_set_clientdata(i2c, pf1550);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  151  	pf1550->dev = &i2c->dev;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  152  	pf1550->i2c = i2c;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  153  	pf1550->irq = i2c->irq;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  154  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  155  	pf1550->regmap = devm_regmap_init_i2c(i2c, &pf1550_regmap_config);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  156  	if (IS_ERR(pf1550->regmap))
fc62e32ad9eb64 Samuel Kayode 2025-05-27  157  		return dev_err_probe(pf1550->dev, PTR_ERR(pf1550->regmap),
fc62e32ad9eb64 Samuel Kayode 2025-05-27  158  				     "failed to allocate register map\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  159  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  160  	ret = regmap_read(pf1550->regmap, PF1550_PMIC_REG_DEVICE_ID, &reg_data);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  161  	if (ret < 0 || reg_data != PF1550_DEVICE_ID)
fc62e32ad9eb64 Samuel Kayode 2025-05-27 @162  		return dev_err_probe(pf1550->dev, ret, "device not found!\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  163  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  164  	pf1550->type = PF1550;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  165  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  166  	ret = devm_regmap_add_irq_chip(pf1550->dev, pf1550->regmap,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  167  				       pf1550->irq,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  168  				       IRQF_ONESHOT | IRQF_SHARED |
fc62e32ad9eb64 Samuel Kayode 2025-05-27  169  				       IRQF_TRIGGER_FALLING, 0,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  170  				       &pf1550_regulator_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  171  				       &pf1550->irq_data_regulator);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  172  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  173  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  174  				     "failed to add regulator irq chip\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  175  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  176  	ret = pf1550_map_chip_irqs(&pf1550_regulator_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  177  				   pf1550->irq_data_regulator);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  178  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  179  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  180  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  181  				     "Failed to get parent vIRQ for chip %s\n",
fc62e32ad9eb64 Samuel Kayode 2025-05-27  182  				     pf1550_regulator_irq_chip.name);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  183  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  184  	ret = devm_regmap_add_irq_chip(pf1550->dev, pf1550->regmap,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  185  				       pf1550->irq,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  186  				       IRQF_ONESHOT | IRQF_SHARED |
fc62e32ad9eb64 Samuel Kayode 2025-05-27  187  				       IRQF_TRIGGER_FALLING, 0,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  188  				       &pf1550_onkey_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  189  				       &pf1550->irq_data_onkey);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  190  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  191  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  192  				     "failed to add onkey irq chip\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  193  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  194  	ret = pf1550_map_chip_irqs(&pf1550_onkey_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  195  				   pf1550->irq_data_onkey);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  196  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  197  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  198  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  199  				     "Failed to get parent vIRQ for chip %s\n",
fc62e32ad9eb64 Samuel Kayode 2025-05-27  200  				     pf1550_onkey_irq_chip.name);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  201  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  202  	ret = devm_regmap_add_irq_chip(pf1550->dev, pf1550->regmap,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  203  				       pf1550->irq,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  204  				       IRQF_ONESHOT | IRQF_SHARED |
fc62e32ad9eb64 Samuel Kayode 2025-05-27  205  				       IRQF_TRIGGER_FALLING, 0,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  206  				       &pf1550_charger_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  207  				       &pf1550->irq_data_charger);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  208  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  209  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  210  				     "failed to add charger irq chip\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  211  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  212  	ret = pf1550_map_chip_irqs(&pf1550_charger_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  213  				   pf1550->irq_data_charger);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  214  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  215  	if (ret)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  216  		return dev_err_probe(pf1550->dev, ret,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  217  				     "Failed to get parent vIRQ for chip %s\n",
fc62e32ad9eb64 Samuel Kayode 2025-05-27  218  				     pf1550_charger_irq_chip.name);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  219  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  220  	return devm_mfd_add_devices(pf1550->dev, -1, pf1550_devs,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  221  				    ARRAY_SIZE(pf1550_devs), NULL, 0, NULL);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  222  }
fc62e32ad9eb64 Samuel Kayode 2025-05-27  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
