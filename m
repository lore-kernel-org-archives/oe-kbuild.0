Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6074D2AE74
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754625407; cv=none; b=snT2mZD9OYEPp6VO8Lu0SsfOgv/p/uf1FLicNyY9Qk+LeY017Tgg/2TzZpjEOqZ6Mqa4+EHmLS/fWIiHomMncpSXxdchUQ78BNveOn9aFOmvRcllWMb+Lmp3uncfMNxj+YTSPoduuADaajoxOvkXh0uJWTSy5zCQhTBd+/wmB40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754625407; c=relaxed/simple;
	bh=+q3I9voVoj9adE4Ozs1uF+/hP/gs0UG+AGI1ZW54G4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKhlBld7c97hJANTVBxA3GltCfvEDeO9k9abw6MMClN5KuY7QEwT2NqbvIrFMAXya4jK2y7e6L4PLTFP7i5skHsLT7vOySVZeWo0BWkB3YjIX8NaH0wsOoR4hOoznQoMb75nUQF1dZa3nHUVwjRqutYW9GgUfu7bZ1A27UF2sU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTTJboAW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTTJboAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754625405; x=1786161405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+q3I9voVoj9adE4Ozs1uF+/hP/gs0UG+AGI1ZW54G4A=;
  b=fTTJboAWGL04McGKHI2X+GjVI/KDiETxOfWRbsj/IqGZdyCSDWL7S9EW
   VUa2G0chH9/MAVD3O/d6IJtyLgfvfLxV9Vy3YNBIruGoFc+P4AXaf8ZBF
   C9YmXazsuz4Fon2qNHMnSmoqB9O2yTA6mLICEFrAuhpif//VJ6w2kxDY4
   IDRTcTkG2bc1LptzjH1sGnK/XIM+okyptGLEw3IiIKwxkAJzkz3CeiTj2
   L2oiVFGikGSmZdxUs4Eban8fLb4KGTKDNAAav6Gr2FT7MPnhxBtrgJFIv
   SP0KyLMMn7TcRVVJpBn5cdgi802sD63JBHRd6EJp6o5udo7P40pDb6laE
   w==;
X-CSE-ConnectionGUID: z81WoE/0So+gB2YJ+T/YQg==
X-CSE-MsgGUID: HeJZY/GlSdqhx+LEenepYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56006892"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56006892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 20:56:44 -0700
X-CSE-ConnectionGUID: AFcuuYqQToOXZZEhTTdlog==
X-CSE-MsgGUID: fAobTZCOQaSzO5NnrXHpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169442824"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2025 20:56:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukEDg-0003Wm-2o;
	Fri, 08 Aug 2025 03:56:40 +0000
Date: Fri, 8 Aug 2025 11:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/phy/phy-snps-eusb2.c:571:28-35: ERROR: PTR_ERR applied after
 initialization to constant on line 562
Message-ID: <202508081148.qPx7EwYx-lkp@intel.com>
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
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6e64f4580381e32c06ee146ca807c555b8f73e24
commit: c4098f3e6134e79e070ec44c58976e1f00d9bfad phy: phy-snps-eusb2: add support for exynos2200
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r061-20250808 (https://download.01.org/0day-ci/archive/20250808/202508081148.qPx7EwYx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508081148.qPx7EwYx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/phy-snps-eusb2.c:571:28-35: ERROR: PTR_ERR applied after initialization to constant on line 562

vim +571 drivers/phy/phy-snps-eusb2.c

80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  522  
93dbe9b5b3a265 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  523  static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  524  {
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  525  	struct device *dev = &pdev->dev;
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  526  	struct device_node *np = dev->of_node;
93dbe9b5b3a265 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  527  	struct snps_eusb2_hsphy *phy;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  528  	struct phy_provider *phy_provider;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  529  	struct phy *generic_phy;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  530  	int ret, i;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  531  	int num;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  532  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  533  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  534  	if (!phy)
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  535  		return -ENOMEM;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  536  
3983b4e9746da1 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  537  	phy->data = device_get_match_data(dev);
3983b4e9746da1 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  538  	if (!phy->data)
3983b4e9746da1 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  539  		return -EINVAL;
3983b4e9746da1 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  540  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  541  	phy->base = devm_platform_ioremap_resource(pdev, 0);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  542  	if (IS_ERR(phy->base))
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  543  		return PTR_ERR(phy->base);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  544  
aba7a966b50d11 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  545  	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  546  	if (IS_ERR(phy->phy_reset))
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  547  		return PTR_ERR(phy->phy_reset);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  548  
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  549  	phy->clks = devm_kcalloc(dev, phy->data->num_clks, sizeof(*phy->clks),
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  550  				 GFP_KERNEL);
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  551  	if (!phy->clks)
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  552  		return -ENOMEM;
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  553  
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  554  	for (int i = 0; i < phy->data->num_clks; ++i)
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  555  		phy->clks[i].id = phy->data->clk_names[i];
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  556  
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  557  	ret = devm_clk_bulk_get(dev, phy->data->num_clks, phy->clks);
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  558  	if (ret)
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  559  		return dev_err_probe(dev, ret,
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  560  				     "failed to get phy clock(s)\n");
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  561  
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04 @562  	phy->ref_clk = NULL;
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  563  	for (int i = 0; i < phy->data->num_clks; ++i) {
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  564  		if (!strcmp(phy->clks[i].id, "ref")) {
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  565  			phy->ref_clk = phy->clks[i].clk;
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  566  			break;
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  567  		}
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  568  	}
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  569  
c4098f3e6134e7 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  570  	if (IS_ERR_OR_NULL(phy->ref_clk))
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08 @571  		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  572  				     "failed to get ref clk\n");
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  573  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  574  	num = ARRAY_SIZE(phy->vregs);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  575  	for (i = 0; i < num; i++)
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  576  		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  577  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  578  	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  579  	if (ret)
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  580  		return dev_err_probe(dev, ret,
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  581  				     "failed to get regulator supplies\n");
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  582  
d460be705ae599 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  583  	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  584  	if (IS_ERR(phy->repeater))
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  585  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  586  				     "failed to get repeater\n");
3584f6392f0944 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Neil Armstrong 2023-02-08  587  
93dbe9b5b3a265 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  588  	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  589  	if (IS_ERR(generic_phy)) {
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  590  		dev_err(dev, "failed to create phy %d\n", ret);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  591  		return PTR_ERR(generic_phy);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  592  	}
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  593  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  594  	dev_set_drvdata(dev, phy);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  595  	phy_set_drvdata(generic_phy, phy);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  596  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  597  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  598  	if (IS_ERR(phy_provider))
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  599  		return PTR_ERR(phy_provider);
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  600  
93dbe9b5b3a265 drivers/phy/phy-snps-eusb2.c               Ivaylo Ivanov  2025-05-04  601  	dev_info(dev, "Registered Snps-eUSB2 phy\n");
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  602  
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  603  	return 0;
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  604  }
80090810f5d332 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c Abel Vesa      2023-02-08  605  

:::::: The code at line 571 was first introduced by commit
:::::: 80090810f5d332bc41f1e64382ceca41fb1e16e3 phy: qcom: Add QCOM SNPS eUSB2 driver

:::::: TO: Abel Vesa <abel.vesa@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
