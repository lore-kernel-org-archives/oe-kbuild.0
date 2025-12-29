Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCFCA52
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767047441; cv=none; b=WkuATou1pUUqyWavlp4aWzNuFv/FbA1NAkKeIwymdWjeJ3El4uT9actzjOXsRssHSYaRzFnPf0ta9wA49gzQdaAobrXG9LSSBs2BhBvDNKxIukxYrEpX+lFxM/PYm9AywTvrUB/JavinLCqWz5Re4HEDkAklpfaRtExgFgnmVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767047441; c=relaxed/simple;
	bh=iqAaXVCeF8DOdRDbjleBsWHdWzjeh+j9lXe/GUFxnRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkj8gps9azkyU1QHDOH5/75qLIytga9/+m4ZV91XXRc/gFD1Chh4/DxA/UF5fDVnGZKE1iMRQfYD/vcacjXQDSfo+p49DtCUs7TMhnVCsCreBo0rpWMXSbmTKzYEdWbE2/RMgo6eibHwJRnpdACn5svzr+0IfCcd+R72lh4ibEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8QRaFAM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8QRaFAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767047439; x=1798583439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iqAaXVCeF8DOdRDbjleBsWHdWzjeh+j9lXe/GUFxnRY=;
  b=N8QRaFAMysgzeX0q9OYPeDto6PDh0jX4gBUeh6n8N970x76rubsy90Cg
   hbN29huvlI8796wxUoV9EwSQwJfYICbnzIv8di53YBkvUdiYH2AMqoHkN
   6bNS8bhtPIWaXi/jIdlAKU9+jJYf24xTgpWVEFDqcXDK1rGvGUv2jOR34
   XyQVz/GX6cp2Wv06LIsLExY6S0WlGO82BBE1irP4IE97W/T2lhgMGfYQu
   Dj9S/b9M82uuTxsvwf6x7ZYjpcdCINUG8AK+i42ICGGoUi3xi1hF4DvIV
   oS1+ObWEQKTtM6lEFBJKuf3rHP77hUCDwAE4YuHVm5FVDbIrHM1Z0smvu
   g==;
X-CSE-ConnectionGUID: wWd9ZEHlR2iwOFRRTG7Y1A==
X-CSE-MsgGUID: ikYBVBy4Ra6/nVLqkHQcVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68684012"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68684012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 14:30:37 -0800
X-CSE-ConnectionGUID: nsdXOK/0RbKlkVmQm3xYZw==
X-CSE-MsgGUID: Mn49VpbRTCqkbvi2gNnZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="201972758"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Dec 2025 14:30:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaLkS-0000000085X-3AKT;
	Mon, 29 Dec 2025 22:30:06 +0000
Date: Tue, 30 Dec 2025 06:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk
 drivers into aspeed subdirectory.
Message-ID: <202512300629.AffxLzlt-lkp@intel.com>
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
In-Reply-To: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
References: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: Brian Masney <bmasney@redhat.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: Ryan Chen <ryan_chen@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/clk-aspeed-Move-the-existing-ASPEED-clk-drivers-into-aspeed-subdirectory/20251224-134447
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251224-upstream_clk-v16-1-8c1318f56c3c%40aspeedtech.com
patch subject: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300629.AffxLzlt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512300629.AffxLzlt-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
