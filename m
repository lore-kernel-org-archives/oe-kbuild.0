Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DA254841
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 01:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293010; cv=none; b=Rrppvdhhr83XpM8hn/WyLYISFSutJlH/vTbp1YeiFuhYVuQwzwTYwaMDB4oiKrFuiq3QovQxQxACaOb5h78+QGEkyNuBWsGncgbJB22CpLFMHZv0si7NMafQApOxe3TfAFS44zXltLLDDr8xhQiWW7QqxEol1gEnzxdaAHxaIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293010; c=relaxed/simple;
	bh=SgDeNHW2EtpeGypE6ZuIM3R70d9tDXWlMFASXprtkug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f/l3elA2TS/R9a+GrF4mcYWE1RSmsRPX0oqs0uB9623i4wTt7mLe/K5fO5Fkex4WV5LRnoeOARPSr+Vop+B7r20KFJr4B7EAGKpq3TVE2vUz9Olr+0DrPvPoEfkhuXTDotgXFS+H6oJlKrXypXiuNLJpRcT72eug5wGaabO2GSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDzUhZvM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDzUhZvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293008; x=1802829008;
  h=date:from:to:cc:subject:message-id;
  bh=SgDeNHW2EtpeGypE6ZuIM3R70d9tDXWlMFASXprtkug=;
  b=CDzUhZvMJy3HM6igUAvg8PYd6/K4ZOB5Onbxgmqlb0kpcnXqCD9qO4Ss
   EAL56P1ruhHoCK0Ha8/ek7UEMjejp7VqkTutTESeKFFSjH4Ncvohu9tEE
   umGZITT+EzclDSEFaz1LjZJ/7U3XYSdO1xDVqFXsI+wBHGXFJDPdA19ge
   Y2Rl2+BY3pcdrD/FrLfNnoFc+2WusLCQ3RiBU6VqMmOX4hzlUhuUNh9No
   b3aRBRfQhLFJArfLz9Abnb1yPEneAonmYQPuw+WeMZCG/h9D2twxg74fK
   rDAQ2Uj0PNYeAdAV9IdJTyrtSrHMgekn+duWQZjNVP0B65gOh+xGij4mM
   Q==;
X-CSE-ConnectionGUID: oxL4T8+PTPy7d5noDPsNlw==
X-CSE-MsgGUID: R7TuQ+dzQ3+vN50d32r4Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996449"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:50:04 -0800
X-CSE-ConnectionGUID: KrMAijjOQUCG8aH4KFsbnw==
X-CSE-MsgGUID: IZGEus4aRsaIAGX4sQidqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217714757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 17:50:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsADw-000000010U0-3Lsx;
	Tue, 17 Feb 2026 01:50:00 +0000
Date: Tue, 17 Feb 2026 09:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/aspeed/clk-ast2600.c:808 aspeed_g6_cc() warn:
 mask and shift to zero: expr='val >> 9'
Message-ID: <202602170949.2kx5B7Ql-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ryan Chen <ryan_chen@aspeedtech.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>

Hi Ryan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: 03b3faa12c25140d00f9dca4ed44a6184600d9d8 clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
date:   13 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-r072-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170949.2kx5B7Ql-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602170949.2kx5B7Ql-lkp@intel.com/

smatch warnings:
drivers/clk/aspeed/clk-ast2600.c:808 aspeed_g6_cc() warn: mask and shift to zero: expr='val >> 9'

vim +808 drivers/clk/aspeed/clk-ast2600.c

d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  748  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  749  static void __init aspeed_g6_cc(struct regmap *map)
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  750  {
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  751  	struct clk_hw *hw;
f45c5b1c27293f8 drivers/clk/clk-ast2600.c Joel Stanley 2021-09-23  752  	u32 val, div, divbits, axi_div, ahb_div;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  753  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  754  	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  755  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  756  	/*
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  757  	 * High-speed PLL clock derived from the crystal. This the CPU clock,
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  758  	 * and we assume that it is enabled
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  759  	 */
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  760  	regmap_read(map, ASPEED_HPLL_PARAM, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  761  	aspeed_g6_clk_data->hws[ASPEED_CLK_HPLL] = ast2600_calc_pll("hpll", val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  762  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  763  	regmap_read(map, ASPEED_MPLL_PARAM, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  764  	aspeed_g6_clk_data->hws[ASPEED_CLK_MPLL] = ast2600_calc_pll("mpll", val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  765  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  766  	regmap_read(map, ASPEED_DPLL_PARAM, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  767  	aspeed_g6_clk_data->hws[ASPEED_CLK_DPLL] = ast2600_calc_pll("dpll", val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  768  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  769  	regmap_read(map, ASPEED_EPLL_PARAM, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  770  	aspeed_g6_clk_data->hws[ASPEED_CLK_EPLL] = ast2600_calc_pll("epll", val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  771  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  772  	regmap_read(map, ASPEED_APLL_PARAM, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  773  	aspeed_g6_clk_data->hws[ASPEED_CLK_APLL] = ast2600_calc_apll("apll", val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  774  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  775  	/* Strap bits 12:11 define the AXI/AHB clock frequency ratio (aka HCLK)*/
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  776  	regmap_read(map, ASPEED_G6_STRAP1, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  777  	if (val & BIT(16))
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  778  		axi_div = 1;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  779  	else
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  780  		axi_div = 2;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  781  
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  782  	divbits = (val >> 11) & 0x3;
f45c5b1c27293f8 drivers/clk/clk-ast2600.c Joel Stanley 2021-09-23  783  	if (soc_rev >= 1) {
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  784  		if (!divbits) {
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  785  			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  786  			if (val & BIT(16))
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  787  				ahb_div *= 2;
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  788  		} else {
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  789  			if (val & BIT(16))
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  790  				ahb_div = ast2600_a1_axi_ahb_div1_tbl[divbits];
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  791  			else
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  792  				ahb_div = ast2600_a1_axi_ahb_div0_tbl[divbits];
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  793  		}
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  794  	} else {
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  795  		ahb_div = ast2600_a0_axi_ahb_div_table[(val >> 11) & 0x3];
2d491066ccd4286 drivers/clk/clk-ast2600.c Eddie James  2020-04-08  796  	}
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  797  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  798  	hw = clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, axi_div * ahb_div);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  799  	aspeed_g6_clk_data->hws[ASPEED_CLK_AHB] = hw;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  800  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  801  	regmap_read(map, ASPEED_G6_CLK_SELECTION1, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  802  	val = (val >> 23) & 0x7;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  803  	div = 4 * (val + 1);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  804  	hw = clk_hw_register_fixed_factor(NULL, "apb1", "hpll", 0, 1, div);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  805  	aspeed_g6_clk_data->hws[ASPEED_CLK_APB1] = hw;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  806  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  807  	regmap_read(map, ASPEED_G6_CLK_SELECTION4, &val);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25 @808  	val = (val >> 9) & 0x7;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  809  	div = 2 * (val + 1);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  810  	hw = clk_hw_register_fixed_factor(NULL, "apb2", "ahb", 0, 1, div);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  811  	aspeed_g6_clk_data->hws[ASPEED_CLK_APB2] = hw;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  812  
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  813  	/* USB 2.0 port1 phy 40MHz clock */
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  814  	hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL, 0, 40000000);
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  815  	aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  816  
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  817  	/* i3c clock: source from apll, divide by 8 */
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  818  	regmap_update_bits(map, ASPEED_G6_CLK_SELECTION5,
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  819  			   I3C_CLK_SELECTION | APLL_DIV_SELECTION,
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  820  			   I3C_CLK_SELECT_APLL_DIV | APLL_DIV_8);
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  821  
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  822  	hw = clk_hw_register_fixed_factor(NULL, "i3cclk", "apll", 0, 1, 8);
e9d230146f1521d drivers/clk/clk-ast2600.c Jeremy Kerr  2023-03-02  823  	aspeed_g6_clk_data->hws[ASPEED_CLK_I3C] = hw;
56ce4e733cead48 drivers/clk/clk-ast2600.c Eddie James  2024-02-15  824  
56ce4e733cead48 drivers/clk/clk-ast2600.c Eddie James  2024-02-15  825  	hw = clk_hw_register_fixed_factor(NULL, "fsiclk", "apll", 0, 1, 4);
56ce4e733cead48 drivers/clk/clk-ast2600.c Eddie James  2024-02-15  826  	aspeed_g6_clk_data->hws[ASPEED_CLK_FSI] = hw;
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  827  };
d3d04f6c330a60c drivers/clk/clk-ast2600.c Joel Stanley 2019-08-25  828  

:::::: The code at line 808 was first introduced by commit
:::::: d3d04f6c330a60ce7170a1076b06f31c77ba7873 clk: Add support for AST2600 SoC

:::::: TO: Joel Stanley <joel@jms.id.au>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
