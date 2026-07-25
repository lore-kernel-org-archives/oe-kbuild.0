Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D431E849
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784999721; cv=none; b=FofclKcOHUVQlY1nTtcXc6O/3Tcdhr9OMCRNMLYIUJRQlZqtQOcXp5C665nXTi+y6owRmyJ4HOxYedVjn3Io6DJwbijzCrAcdS9uOcCnPJkVdauJS9OG0oUqohElvFso8MXGht5AH8RJRKqZSaavJutHymt36QABePdrnwPi+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784999721; c=relaxed/simple;
	bh=0vfxwC7TY8fFx2/GVAbpFbK6Bsy3aTgXizxUb6KkCxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLRblAnR9A2tz9MB3jdK1nzsG9sVOIO/uiv3PwJLz+bi71FNfUwObU59a4rTis0w4xfAwb23fBX+uAfYDVhYgA4GuGV/4LmX6vaG+t99CiIDyHP/8859OHSGpbYXpikDil64vgWPglQt4wN2NwT1E1aUnVLr0Kdlk3kSu3JMe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRkHllH2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRkHllH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784999719; x=1816535719;
  h=date:from:to:cc:subject:message-id;
  bh=0vfxwC7TY8fFx2/GVAbpFbK6Bsy3aTgXizxUb6KkCxw=;
  b=TRkHllH2s2eIh+lOiaRKsogQucwBN7WRlZ+E99cb2o5plaefFGfr66mm
   K+UHUIEOSm3ParC6dVknqglgXb+aRHiuogMcw4sJHPExE5YoUpy9+twwq
   ZlXi0ZGxIp7iXz4oBF8fONwsDuEhC+63P5rhmnjgIu+pVP2seB+V4io4D
   +gGEMkiR1H3xyIU/aZgDj6kzpYZRfCYqqmifTQXa/Qmho6VqxAIh3FANU
   RR1jdKR/tVo3SPxD9oB+bM3MU+9umYzieuSBgzuFGR3RbUxBgwyz3Xr/O
   AuylikyDIS2eLEpGufPr2rIL2pLDGBVMG6vp42P2CibS+4wtXP6L9n0Tl
   g==;
X-CSE-ConnectionGUID: DqCMNKsHSf2/BBcTN/N0Wg==
X-CSE-MsgGUID: zBP0NsUPQ3SL51MQB3zsig==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96225622"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="96225622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 10:15:18 -0700
X-CSE-ConnectionGUID: OR52lH8BQCyxPCkWqyRnvg==
X-CSE-MsgGUID: N+j5OhzdSoGXngHElO4ecQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="262501978"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Jul 2026 10:15:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnfxq-00000000bq6-00QV;
	Sat, 25 Jul 2026 17:15:08 +0000
Date: Sun, 26 Jul 2026 01:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/aspeed/clk-aspeed.c:682 aspeed_ast2500_cc()
 warn: mask and shift to zero: expr='val >> 23'
Message-ID: <202607260043.DgRarqsj-lkp@intel.com>
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
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 03b3faa12c25140d00f9dca4ed44a6184600d9d8 clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r071-20260723 (https://download.01.org/0day-ci/archive/20260726/202607260043.DgRarqsj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 03b3faa12c25 ("clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260043.DgRarqsj-lkp@intel.com/

smatch warnings:
drivers/clk/aspeed/clk-aspeed.c:682 aspeed_ast2500_cc() warn: mask and shift to zero: expr='val >> 23'

vim +682 drivers/clk/aspeed/clk-aspeed.c

99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  650  
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  651  static void __init aspeed_ast2500_cc(struct regmap *map)
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  652  {
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  653  	struct clk_hw *hw;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  654  	u32 val, freq, div;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  655  
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  656  	/* CLKIN is the crystal oscillator, 24 or 25MHz selected by strapping */
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  657  	regmap_read(map, ASPEED_STRAP, &val);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  658  	if (val & CLKIN_25MHZ_EN)
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  659  		freq = 25000000;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  660  	else
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  661  		freq = 24000000;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  662  	hw = clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, freq);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  663  	pr_debug("clkin @%u MHz\n", freq / 1000000);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  664  
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  665  	/*
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  666  	 * High-speed PLL clock derived from the crystal. This the CPU clock,
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  667  	 * and we assume that it is enabled
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  668  	 */
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  669  	regmap_read(map, ASPEED_HPLL_PARAM, &val);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  670  	aspeed_clk_data->hws[ASPEED_CLK_HPLL] = aspeed_ast2500_calc_pll("hpll", val);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  671  
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  672  	/* Strap bits 11:9 define the AXI/AHB clock frequency ratio (aka HCLK)*/
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  673  	regmap_read(map, ASPEED_STRAP, &val);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  674  	val = (val >> 9) & 0x7;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  675  	WARN(val == 0, "strapping is zero: cannot determine ahb clock");
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  676  	div = 2 * (val + 1);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  677  	hw = clk_hw_register_fixed_factor(NULL, "ahb", "hpll", 0, 1, div);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  678  	aspeed_clk_data->hws[ASPEED_CLK_AHB] = hw;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  679  
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  680  	/* APB clock clock selection register SCU08 (aka PCLK) */
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  681  	regmap_read(map, ASPEED_CLK_SELECTION, &val);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22 @682  	val = (val >> 23) & 0x7;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  683  	div = 4 * (val + 1);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  684  	hw = clk_hw_register_fixed_factor(NULL, "apb", "hpll", 0, 1, div);
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  685  	aspeed_clk_data->hws[ASPEED_CLK_APB] = hw;
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  686  };
99d01e0ec34154 drivers/clk/clk-aspeed.c Joel Stanley 2017-12-22  687  

:::::: The code at line 682 was first introduced by commit
:::::: 99d01e0ec3415424210fcd345ebb0c516e4b7fa9 clk: aspeed: Register core clocks

:::::: TO: Joel Stanley <joel@jms.id.au>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
