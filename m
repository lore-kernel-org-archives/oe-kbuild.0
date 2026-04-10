Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D53B4E8A
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819015; cv=none; b=p4I1WIDEn6zC7CInEeQuU1mKAcBm9YGqpBpUAvHuzqyU8MVGuh0/UGMddrP9EgYo8C2f0wgkzRW+dmFnvfJnEikbJT2LOrReMgCrR2l1CRqz1vWjC8ZT2urQ9k39gSxifNoifMAnb2EJYKO9Ma3/RC9R0s7PT0IpSXRRnEM7KWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819015; c=relaxed/simple;
	bh=S04TaVQrBk+iMxeDsLJcAKgcITb3tGG95jPFJL9n2Vo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nLv/C3ECrFEcPxHjtlhSO9NetM1ILD2N0hYNSU8zH/v83YPySbGa73iWVN+iXqIPicTwolbJazu8fxPvCJXJa6AyBTJGkmaIZIfxFo7SjmMkkX5nUgA4PO7wkJqDJePVTl01uoWvDGLHlcWGvnJRQZ1/aD4C2mfsbr6mIz/ArqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GleQhm8t; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GleQhm8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775819014; x=1807355014;
  h=date:from:to:cc:subject:message-id;
  bh=S04TaVQrBk+iMxeDsLJcAKgcITb3tGG95jPFJL9n2Vo=;
  b=GleQhm8t6PeragLzP0q0Q94MzDKhCeCXtM1MmeumfXgfQmPvXNJqHwmI
   bCH8fjBOuxwb/g07gDrMRoIn46W/AeXka7c2xT+UeHpyxfLmPEAmnkrHl
   CUc84nWTJg5P5TNUiQnEF+w0/K9GmhjQuEZsU8fErokcFxhYY8AcQIe4r
   0WigNCWQFyRxComfBq+oV4+ExXZcZ0hdE6REI/QMJzeegpW0NJwv3nI9M
   uyTCQVkpLF2N6yrgG5gjDBJI8H3ey/HYdF9dQ4cqnhzHMDeryIWZNpe8U
   HMpfgzBtg+G3XEisIXQ4wTGAiXJyM4cqj5h+fc3WXrkEIRiZAQ6BjfYQt
   g==;
X-CSE-ConnectionGUID: d53qU31XRjSfrGIHGs367w==
X-CSE-MsgGUID: rVB9VuWcSp2vIw6G1gaW8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76743968"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76743968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:03:31 -0700
X-CSE-ConnectionGUID: pJ5BSDAiScOfvkWMAlV0bA==
X-CSE-MsgGUID: ZNVpEPkMSxyWeTP7BDRS0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="222566694"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 04:03:30 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9e4-000000003dW-050m;
	Fri, 10 Apr 2026 11:03:28 +0000
Date: Fri, 10 Apr 2026 19:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/aspeed/clk-aspeed.c:682 aspeed_ast2500_cc()
 warn: mask and shift to zero: expr='val >> 23'
Message-ID: <202604101931.hAQIMRx9-lkp@intel.com>
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

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 03b3faa12c25140d00f9dca4ed44a6184600d9d8 clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: alpha-randconfig-r072-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101931.hAQIMRx9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 03b3faa12c25 ("clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604101931.hAQIMRx9-lkp@intel.com/

smatch warnings:
drivers/clk/aspeed/clk-aspeed.c:682 aspeed_ast2500_cc() warn: mask and shift to zero: expr='val >> 23'

vim +682 drivers/clk/aspeed/clk-aspeed.c

99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  650  
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  651  static void __init aspeed_ast2500_cc(struct regmap *map)
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  652  {
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  653  	struct clk_hw *hw;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  654  	u32 val, freq, div;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  655  
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  656  	/* CLKIN is the crystal oscillator, 24 or 25MHz selected by strapping */
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  657  	regmap_read(map, ASPEED_STRAP, &val);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  658  	if (val & CLKIN_25MHZ_EN)
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  659  		freq = 25000000;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  660  	else
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  661  		freq = 24000000;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  662  	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  663  	pr_debug("clkin @%u MHz\n", freq / 1000000);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  664  
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  665  	/*
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  666  	 * High-speed PLL clock derived from the crystal. This the CPU clock,
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  667  	 * and we assume that it is enabled
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  668  	 */
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  669  	regmap_read(map, ASPEED_HPLL_PARAM, &val);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  670  	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2500_calc_pll("hpll", val);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  671  
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  672  	/* Strap bits 11:9 define the AXI/AHB clock frequency ratio (aka HCLK)*/
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  673  	regmap_read(map, ASPEED_STRAP, &val);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  674  	val = (val >> 9) & 0x7;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  675  	WARN(val == 0, "strapping is zero: cannot determine ahb clock");
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  676  	div = 2 * (val + 1);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  677  	hw = clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, div);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  678  	aspeed_clk_data->hws[ASPEED_CLK_AHB] = hw;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  679  
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  680  	/* APB clock clock selection register SCU08 (aka PCLK) */
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  681  	regmap_read(map, ASPEED_CLK_SELECTION, &val);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22 @682  	val = (val >> 23) & 0x7;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  683  	div = 4 * (val + 1);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  684  	hw = clk_hw_register_fixed_factor(NULL, "apb", "hpll", 0, 1, div);
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  685  	aspeed_clk_data->hws[ASPEED_CLK_APB] = hw;
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  686  };
99d01e0ec341542 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  687  

:::::: The code at line 682 was first introduced by commit
:::::: 99d01e0ec3415424210fcd345ebb0c516e4b7fa9 clk: aspeed: Register core clocks

:::::: TO: Joel Stanley <joel@jms.id.au>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
