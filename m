Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78C25DB11
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828428; cv=none; b=UG3Iv/X0N77NgpalKx2iKDDQbfT5bXne6cz2JMaBEoHIssq5SaDp3iV5QDppUqoGjcFubRplQGIaiDtBr83ftYPnuymxj5llPp/KSWw6uLgs+JENm2Rjx1KDJ3/ohbzpznuCl5YbfenqKnJ6lc4+aaM/DASavf4saaNkfu0Ykkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828428; c=relaxed/simple;
	bh=J98Vkhhj0jKyjyG4yOWJbROvKF6fyPqDQFdPXpsjthY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZQtMxzHU+eW7RM15sraFFbdfmzfNOEQDOk8w4uIUlGx1s1snJ9dwf8QgSDoIMaK8QUmdZ9RTJLxN1lt6Y4nZ0RQ8aWy6KHRjx555W/q27aWDM92jqhBaP7wtqx6BNwCNnTvMQoJvKIfMIS7nh12czHIKuqB9lzLJJjCSHpypJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnIijV8j; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnIijV8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746828425; x=1778364425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J98Vkhhj0jKyjyG4yOWJbROvKF6fyPqDQFdPXpsjthY=;
  b=VnIijV8jnB4WUeiAySnQCCBM7C4+6U/DHRXUKG89k9/4CVIowpFBRvPj
   f61oUrW7G22/U6fzJP+FDzxRQSCjkey1YlVER0YKveIg2DzkeG8R+CAKH
   UjUPwJjwCCgb8H21Qj0vitVlCh/E5bbjr3+f98YikJqr/TOFQ/+pUuBCB
   iSF0K6nKvgQ7PcsYaqtcP7Bwi+F/bYIbe/89UniIt388GXIqpmlrzeEG3
   KeyeYHmtN1C+9aGLL/1D1AR1CARyFiZMgyb0f6CyBAVCK+RowjJ3/jVc0
   wHuT0tOyj7+C668Wq4XNFeBBBBPSeWCWN8ujAdqQnwSX0w0Jeu99Xa5yS
   g==;
X-CSE-ConnectionGUID: IIYnhFoUSW2ylCJ0HN+1MA==
X-CSE-MsgGUID: BVK1Kq/XTkCpNIhHmT3Kjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48822722"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48822722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 15:07:04 -0700
X-CSE-ConnectionGUID: TMokcKZuS2iQuP13F9Y44A==
X-CSE-MsgGUID: C8YG+VLqRx2xH7GJgbAjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137129831"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 15:07:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDVrx-000CWz-0X;
	Fri, 09 May 2025 22:07:01 +0000
Date: Sat, 10 May 2025 06:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7134/10031]
 drivers/regulator/tps65219-regulator.c:407 tps65219_regulator_probe() error:
 uninitialized symbol 'rdev'.
Message-ID: <202505100652.RkAzg3df-lkp@intel.com>
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
TO: Shree Ramamoorthy <s-ramamoorthy@ti.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 38c9f98db20a649a1f8454f507608b6aef0c9297 [7134/10031] regulator: tps65219: Add support for TPS65215 Regulator IRQs
:::::: branch date: 12 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20250508 (https://download.01.org/0day-ci/archive/20250510/202505100652.RkAzg3df-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505100652.RkAzg3df-lkp@intel.com/

New smatch warnings:
drivers/regulator/tps65219-regulator.c:407 tps65219_regulator_probe() error: uninitialized symbol 'rdev'.
drivers/regulator/tps65219-regulator.c:407 tps65219_regulator_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/regulator/tps65219-regulator.c:430 tps65219_regulator_probe() error: uninitialized symbol 'rdev'.
drivers/regulator/tps65219-regulator.c:430 tps65219_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/rdev +407 drivers/regulator/tps65219-regulator.c

3f2e457efdad5a Shree Ramamoorthy 2025-04-25  350  
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  351  static int tps65219_regulator_probe(struct platform_device *pdev)
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  352  {
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  353  	struct tps65219_regulator_irq_data *irq_data;
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  354  	struct tps65219_regulator_irq_type *irq_type;
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  355  	struct tps65219_chip_data *pmic;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  356  	struct regulator_dev *rdev;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  357  	int error;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  358  	int irq;
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  359  	int i;
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  360  
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  361  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  362  	struct regulator_config config = { };
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  363  	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  364  
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  365  	pmic = &chip_info_table[chip];
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  366  
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  367  	config.dev = tps->dev;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  368  	config.driver_data = tps;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  369  	config.regmap = tps->regmap;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  370  
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  371  	for (i = 0; i <  pmic->common_rdesc_size; i++) {
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  372  		rdev = devm_regulator_register(&pdev->dev, &pmic->common_rdesc[i],
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  373  					       &config);
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  374  		if (IS_ERR(rdev))
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  375  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  376  					      "Failed to register %s regulator\n",
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  377  					      pmic->common_rdesc[i].name);
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  378  	}
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  379  
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  380  	for (i = 0; i <  pmic->rdesc_size; i++) {
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  381  		rdev = devm_regulator_register(&pdev->dev, &pmic->rdesc[i],
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  382  					       &config);
e7ce0437709552 Shree Ramamoorthy 2024-12-17  383  		if (IS_ERR(rdev))
e7ce0437709552 Shree Ramamoorthy 2024-12-17  384  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
e7ce0437709552 Shree Ramamoorthy 2024-12-17  385  					     "Failed to register %s regulator\n",
3f2e457efdad5a Shree Ramamoorthy 2025-04-25  386  					     pmic->rdesc[i].name);
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  387  	}
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  388  
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  389  	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  390  	if (!irq_data)
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  391  		return -ENOMEM;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  392  
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  393  	for (i = 0; i < pmic->common_irq_size; ++i) {
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  394  		irq_type = &pmic->common_irq_types[i];
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  395  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
d46f737208a45d Yang Li           2022-08-25  396  		if (irq < 0)
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  397  			return -EINVAL;
d46f737208a45d Yang Li           2022-08-25  398  
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  399  		irq_data[i].dev = tps->dev;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  400  		irq_data[i].type = irq_type;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  401  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  402  						  tps65219_regulator_irq_handler,
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  403  						  IRQF_ONESHOT,
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  404  						  irq_type->irq_name,
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  405  						  &irq_data[i]);
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  406  		if (error)
38c9f98db20a64 Shree Ramamoorthy 2025-04-25 @407  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  408  					     "Failed to request %s IRQ %d: %d\n",
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  409  					     irq_type->irq_name, irq, error);
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  410  	}
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  411  
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  412  	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  413  	if (!irq_data)
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  414  		return -ENOMEM;
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  415  
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  416  	for (i = 0; i < pmic->dev_irq_size; ++i) {
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  417  		irq_type = &pmic->irq_types[i];
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  418  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  419  		if (irq < 0)
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  420  			return -EINVAL;
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  421  
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  422  		irq_data[i].dev = tps->dev;
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  423  		irq_data[i].type = irq_type;
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  424  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  425  						  tps65219_regulator_irq_handler,
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  426  						  IRQF_ONESHOT,
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  427  						  irq_type->irq_name,
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  428  						  &irq_data[i]);
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  429  		if (error)
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  430  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  431  					     "Failed to request %s IRQ %d: %d\n",
38c9f98db20a64 Shree Ramamoorthy 2025-04-25  432  					     irq_type->irq_name, irq, error);
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  433  	}
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  434  
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  435  	return 0;
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  436  }
c12ac5fc3e0af2 Jerome Neanne     2022-08-05  437  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
