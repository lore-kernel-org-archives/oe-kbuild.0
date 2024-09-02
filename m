Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D79A33062
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725248149; cv=none; b=TxONz/sqXEZVcYgwhIkuRPKuJmOadICItPdr4SxiJGPw3TSKat7CbLfe4eVdaMOep/OJwHJ6gdSz9VcoUq743WCtFeDeC63UjKkydOzKHhq/iJDQ4qLQt6wRPBNOojbZV9Wo/UAoWoac6jDkXifRzY5YF0dhejD6taUIzY2m0P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725248149; c=relaxed/simple;
	bh=yAaaaAZdrw1hn5KAbNKWTY/2sAGCB9hylHSrkBlLkEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dERx27cAlnfSnD+IngMNvlO+drM3xBxU4D35Hk4HW5CBkBOiEqycQubZ8XS8ozSv2fFKrYWdfJR4oqT8hdkwEgxH8mB9mvbm3LPUGGx9YMjkzmP7wnihwL/WZ5Dj1NQFp+EHCr1hex/gxPB0H87JJDa7iRRKR+1OLm7DVmhSxEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIpWd5kT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIpWd5kT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725248146; x=1756784146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yAaaaAZdrw1hn5KAbNKWTY/2sAGCB9hylHSrkBlLkEQ=;
  b=ZIpWd5kTP5ayyacjt4DKjOSeplfGIzhG65Ft2tY+gfGLA/j+k7zubbBF
   qvzy23YG0bVsV1Y9eBCfK64WQuOkwVm5mYM02eY8YtVuzD+DWUBrV4mRT
   QiepUet7luCLW1kO/7gnmmW7DVhy/vQUzd73sVXe+A6LJlKjQRa8wM3AW
   1RUZPnSt2LAimZFe5/uu7Lbe7SnGeyOb9VGi1Kd+OMRcjhM4C7SzE7aa0
   PAgRNdGO9+ii+jfcPD2+vz5zR4j2Q0SzY/N/vxW0y3x/vO66r/qns7+Wq
   6hYbm/aQZQZQs+bNteep8rcXuANslW6Or+mQ6lV3SrdO9+Px8Ma5XV9ye
   g==;
X-CSE-ConnectionGUID: 4DcgoOA6RdeNdeTjhB0Jzg==
X-CSE-MsgGUID: M6YjAgTfTECiKznNfZBPxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23934241"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23934241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 20:35:45 -0700
X-CSE-ConnectionGUID: iCXCi4lpTiqV4rufMvY4yg==
X-CSE-MsgGUID: l82SQB6HRc+y8faEU0bcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="68876979"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Sep 2024 20:35:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skxqp-00055g-0G;
	Mon, 02 Sep 2024 03:35:35 +0000
Date: Mon, 2 Sep 2024 11:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/7] clk: en7523: introduce chip_scu regmap
Message-ID: <202409021114.11d1W3PJ-lkp@intel.com>
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
In-Reply-To: <20240831-clk-en7581-syscon-v1-4-5c2683541068@kernel.org>
References: <20240831-clk-en7581-syscon-v1-4-5c2683541068@kernel.org>
TO: Lorenzo Bianconi <lorenzo@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Felix Fietkau <nbd@nbd.name>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: upstream@airoha.com
CC: angelogioacchino.delregno@collabora.com
CC: linux-arm-kernel@lists.infradead.org
CC: lorenzo.bianconi83@gmail.com
CC: ansuelsmth@gmail.com
CC: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f0e992956eb617c8f16119944bfe101dea074147]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-clock-airoha-update-reg-mapping-for-EN7581-SoC/20240831-152135
base:   f0e992956eb617c8f16119944bfe101dea074147
patch link:    https://lore.kernel.org/r/20240831-clk-en7581-syscon-v1-4-5c2683541068%40kernel.org
patch subject: [PATCH 4/7] clk: en7523: introduce chip_scu regmap
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021114.11d1W3PJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409021114.11d1W3PJ-lkp@intel.com/

New smatch warnings:
drivers/clk/clk-en7523.c:471 en7581_register_clocks() error: uninitialized symbol 'hw'.
drivers/clk/clk-en7523.c:471 en7581_register_clocks() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/clk/clk-en7523.c:478 en7581_register_clocks() error: uninitialized symbol 'hw'.
drivers/clk/clk-en7523.c:478 en7581_register_clocks() warn: passing zero to 'PTR_ERR'

vim +/hw +471 drivers/clk/clk-en7523.c

1af506938394f5 Lorenzo Bianconi 2024-08-31  458  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  459  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
f114fc7e44857f Lorenzo Bianconi 2024-08-31  460  				   struct regmap *map, void __iomem *base)
f114fc7e44857f Lorenzo Bianconi 2024-08-31  461  {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  462  	struct clk_hw *hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  463  	u32 rate;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  464  	int i;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  465  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  466  	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  467  		const struct en_clk_desc *desc = &en7523_base_clks[i];
f114fc7e44857f Lorenzo Bianconi 2024-08-31  468  		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  469  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  470  		if (regmap_read(map, desc->base_reg, &val)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31 @471  			pr_err("Failed reading fixed clk rate %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  472  			       desc->name, PTR_ERR(hw));
f114fc7e44857f Lorenzo Bianconi 2024-08-31  473  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  474  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  475  		rate = en7523_get_base_rate(desc, val);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  476  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  477  		if (regmap_read(map, reg, &val)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  478  			pr_err("Failed reading fixed clk div %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  479  			       desc->name, PTR_ERR(hw));
f114fc7e44857f Lorenzo Bianconi 2024-08-31  480  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  481  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  482  		rate /= en7523_get_div(desc, val);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  483  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  484  		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  485  		if (IS_ERR(hw)) {
f114fc7e44857f Lorenzo Bianconi 2024-08-31  486  			pr_err("Failed to register clk %s: %ld\n",
f114fc7e44857f Lorenzo Bianconi 2024-08-31  487  			       desc->name, PTR_ERR(hw));
f114fc7e44857f Lorenzo Bianconi 2024-08-31  488  			continue;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  489  		}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  490  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  491  		clk_data->hws[desc->id] = hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  492  	}
f114fc7e44857f Lorenzo Bianconi 2024-08-31  493  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  494  	hw = en7523_register_pcie_clk(dev, base);
f114fc7e44857f Lorenzo Bianconi 2024-08-31  495  	clk_data->hws[EN7523_CLK_PCIE] = hw;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  496  
f114fc7e44857f Lorenzo Bianconi 2024-08-31  497  	clk_data->num = EN7523_NUM_CLOCKS;
f114fc7e44857f Lorenzo Bianconi 2024-08-31  498  }
f114fc7e44857f Lorenzo Bianconi 2024-08-31  499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
