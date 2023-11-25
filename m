Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6B28E35
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGP3K2bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700928796; x=1732464796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q44O102aCrW0zfxPTzSLDdB7O35AZTerm8bMIK44LG4=;
  b=BGP3K2bA37ED6ReaToL72BrSRY1hy6KCc4cQBvwGAGtDuMtt/yXWZ5FG
   iom35xJfjydvp546DxvaHCy5DNpIndYmss9w8ebb/7CLKvfWsh9OjZmNU
   R6Wu2P3zh42FQcG/1oC2VY5w+BLRLpFD1Iucw7V/iUkDOxOSRXxVb8FRe
   e0y1g3Af3xmxuKVrgRyT+j6egC0e1x1RfApNt2Six9yfhY/rs2Yv8+1kW
   afzpVALhwX+D2dE/XVZtlQ5Z2fMG6Wf6b6kYbLt0jKJ+jmyLGdE210JA9
   lCoAaZb7RhFwHtVNHgAU16ItNrSboUyzWGZRkB60jF6qRvAyhPkunzOHh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="11216658"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="11216658"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 08:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099358965"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="1099358965"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 08:13:11 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6vHJ-00049G-17;
	Sat, 25 Nov 2023 16:13:09 +0000
Date: Sun, 26 Nov 2023 00:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/i2c/busses/i2c-rcar.c:366 rcar_i2c_clock_calculate() warn:
 '4 * x' 1908874336 can't fit into 65535 'priv->schd'
Message-ID: <202311252357.qWRTeUUC-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
commit: 54c76ed33008d0b342daa52a45ac304e5e3ab312 i2c: rcar: improve accuracy for R-Car Gen3+
date:   9 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 weeks ago
config: hexagon-randconfig-r071-20231124 (https://download.01.org/0day-ci/archive/20231125/202311252357.qWRTeUUC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311252357.qWRTeUUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311252357.qWRTeUUC-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-rcar.c:366 rcar_i2c_clock_calculate() warn: '4 * x' 1908874336 can't fit into 65535 'priv->schd'
drivers/i2c/busses/i2c-rcar.c:367 rcar_i2c_clock_calculate() warn: '5 * x' 2386092920 can't fit into 65535 'priv->scld'

vim +366 drivers/i2c/busses/i2c-rcar.c

6ccbe607132bd8 Kuninori Morimoto     2012-09-27  266  
38a592e26612a6 Andy Shevchenko       2020-03-24  267  static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  268  {
54c76ed33008d0 Wolfram Sang          2023-09-21  269  	u32 cdf, round, ick, sum, scl, cdf_width;
8d0494037bb2af Guennadi Liakhovetski 2013-09-12  270  	unsigned long rate;
f9c9d31bdd3797 Wolfram Sang          2015-12-08  271  	struct device *dev = rcar_i2c_priv_to_dev(priv);
df576beee53ac9 Wolfram Sang          2020-03-26  272  	struct i2c_timings t = {
38a592e26612a6 Andy Shevchenko       2020-03-24  273  		.bus_freq_hz		= I2C_MAX_STANDARD_MODE_FREQ,
38a592e26612a6 Andy Shevchenko       2020-03-24  274  		.scl_fall_ns		= 35,
38a592e26612a6 Andy Shevchenko       2020-03-24  275  		.scl_rise_ns		= 200,
38a592e26612a6 Andy Shevchenko       2020-03-24  276  		.scl_int_delay_ns	= 50,
df576beee53ac9 Wolfram Sang          2020-03-26  277  	};
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  278  
c7881871de878a Wolfram Sang          2015-12-08  279  	/* Fall back to previously used values if not supplied */
df576beee53ac9 Wolfram Sang          2020-03-26  280  	i2c_parse_fw_timings(dev, &t, false);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  281  
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  282  	/*
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  283  	 * calculate SCL clock
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  284  	 * see
54c76ed33008d0 Wolfram Sang          2023-09-21  285  	 *	ICCCR (and ICCCR2 for Gen3+)
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  286  	 *
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  287  	 * ick	= clkp / (1 + CDF)
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  288  	 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  289  	 *
54c76ed33008d0 Wolfram Sang          2023-09-21  290  	 * for Gen3+:
54c76ed33008d0 Wolfram Sang          2023-09-21  291  	 * SCL	= clkp / (8 + SMD * 2 + SCLD + SCHD +F[(ticf + tr + intd) * clkp])
54c76ed33008d0 Wolfram Sang          2023-09-21  292  	 *
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  293  	 * ick  : I2C internal clock < 20 MHz
ca68eade666a6a Wolfram Sang          2015-12-08  294  	 * ticf : I2C SCL falling time
ca68eade666a6a Wolfram Sang          2015-12-08  295  	 * tr   : I2C SCL rising  time
ca68eade666a6a Wolfram Sang          2015-12-08  296  	 * intd : LSI internal delay
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  297  	 * clkp : peripheral_clk
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  298  	 * F[]  : integer up-valuation
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  299  	 */
bc8120f17ae87d Ben Dooks             2014-01-26  300  	rate = clk_get_rate(priv->clk);
8d0494037bb2af Guennadi Liakhovetski 2013-09-12  301  	cdf = rate / 20000000;
54c76ed33008d0 Wolfram Sang          2023-09-21  302  	cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
54c76ed33008d0 Wolfram Sang          2023-09-21  303  	if (cdf >= 1U << cdf_width)
54c76ed33008d0 Wolfram Sang          2023-09-21  304  		goto err_no_val;
54c76ed33008d0 Wolfram Sang          2023-09-21  305  
54c76ed33008d0 Wolfram Sang          2023-09-21  306  	/* On Gen3+, we use cdf only for the filters, not as a SCL divider */
54c76ed33008d0 Wolfram Sang          2023-09-21  307  	ick = rate / (priv->devtype < I2C_RCAR_GEN3 ? (cdf + 1) : 1);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  308  
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  309  	/*
3c417c947c13f2 Wolfram Sang          2023-09-06  310  	 * It is impossible to calculate a large scale number on u32. Separate it.
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  311  	 *
ca68eade666a6a Wolfram Sang          2015-12-08  312  	 * F[(ticf + tr + intd) * ick] with sum = (ticf + tr + intd)
ca68eade666a6a Wolfram Sang          2015-12-08  313  	 *  = F[sum * ick / 1000000000]
ca68eade666a6a Wolfram Sang          2015-12-08  314  	 *  = F[(ick / 1000000) * sum / 1000]
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  315  	 */
df576beee53ac9 Wolfram Sang          2020-03-26  316  	sum = t.scl_fall_ns + t.scl_rise_ns + t.scl_int_delay_ns;
3c417c947c13f2 Wolfram Sang          2023-09-06  317  	round = DIV_ROUND_CLOSEST(ick, 1000000);
3c417c947c13f2 Wolfram Sang          2023-09-06  318  	round = DIV_ROUND_CLOSEST(round * sum, 1000);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  319  
54c76ed33008d0 Wolfram Sang          2023-09-21  320  	if (priv->devtype < I2C_RCAR_GEN3) {
54c76ed33008d0 Wolfram Sang          2023-09-21  321  		u32 scgd;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  322  		/*
47280af872367e Wolfram Sang          2023-09-06  323  		 * SCL	= ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
47280af872367e Wolfram Sang          2023-09-06  324  		 * 20 + 8 * SCGD + F[...] = ick / SCL
47280af872367e Wolfram Sang          2023-09-06  325  		 * SCGD = ((ick / SCL) - 20 - F[...]) / 8
47280af872367e Wolfram Sang          2023-09-06  326  		 * Result (= SCL) should be less than bus_speed for hardware safety
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  327  		 */
47280af872367e Wolfram Sang          2023-09-06  328  		scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
47280af872367e Wolfram Sang          2023-09-06  329  		scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
47280af872367e Wolfram Sang          2023-09-06  330  		scl = ick / (20 + 8 * scgd + round);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  331  
47280af872367e Wolfram Sang          2023-09-06  332  		if (scgd > 0x3f)
be944ceb6761a6 Wolfram Sang          2023-09-06  333  			goto err_no_val;
be944ceb6761a6 Wolfram Sang          2023-09-06  334  
d72857907af04f Wolfram Sang          2023-09-06  335  		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
df576beee53ac9 Wolfram Sang          2020-03-26  336  			scl, t.bus_freq_hz, rate, round, cdf, scgd);
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  337  
14d32f1794fd55 Guennadi Liakhovetski 2013-09-12  338  		priv->icccr = scgd << cdf_width | cdf;
54c76ed33008d0 Wolfram Sang          2023-09-21  339  	} else {
54c76ed33008d0 Wolfram Sang          2023-09-21  340  		u32 x, sum_ratio = RCAR_SCHD_RATIO + RCAR_SCLD_RATIO;
54c76ed33008d0 Wolfram Sang          2023-09-21  341  		/*
54c76ed33008d0 Wolfram Sang          2023-09-21  342  		 * SCLD/SCHD ratio and SMD default value are explained above
54c76ed33008d0 Wolfram Sang          2023-09-21  343  		 * where they are defined. With these definitions, we can compute
54c76ed33008d0 Wolfram Sang          2023-09-21  344  		 * x as a base value for the SCLD/SCHD ratio:
54c76ed33008d0 Wolfram Sang          2023-09-21  345  		 *
54c76ed33008d0 Wolfram Sang          2023-09-21  346  		 * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
54c76ed33008d0 Wolfram Sang          2023-09-21  347  		 * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
54c76ed33008d0 Wolfram Sang          2023-09-21  348  		 *		 + RCAR_SCHD_RATIO * x + F[...])
54c76ed33008d0 Wolfram Sang          2023-09-21  349  		 *
54c76ed33008d0 Wolfram Sang          2023-09-21  350  		 * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
54c76ed33008d0 Wolfram Sang          2023-09-21  351  		 * and:  smd = RCAR_DEFAULT_SMD
54c76ed33008d0 Wolfram Sang          2023-09-21  352  		 *
54c76ed33008d0 Wolfram Sang          2023-09-21  353  		 * SCL = clkp / (8 + 2 * smd + sum_ratio * x + F[...])
54c76ed33008d0 Wolfram Sang          2023-09-21  354  		 * 8 + 2 * smd + sum_ratio * x + F[...] = clkp / SCL
54c76ed33008d0 Wolfram Sang          2023-09-21  355  		 * x = ((clkp / SCL) - 8 - 2 * smd - F[...]) / sum_ratio
54c76ed33008d0 Wolfram Sang          2023-09-21  356  		 */
54c76ed33008d0 Wolfram Sang          2023-09-21  357  		x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
54c76ed33008d0 Wolfram Sang          2023-09-21  358  		x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
54c76ed33008d0 Wolfram Sang          2023-09-21  359  		scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
54c76ed33008d0 Wolfram Sang          2023-09-21  360  
54c76ed33008d0 Wolfram Sang          2023-09-21  361  		/* Bail out if values don't fit into 16 bit or SMD became too large */
54c76ed33008d0 Wolfram Sang          2023-09-21  362  		if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)
54c76ed33008d0 Wolfram Sang          2023-09-21  363  			goto err_no_val;
54c76ed33008d0 Wolfram Sang          2023-09-21  364  
54c76ed33008d0 Wolfram Sang          2023-09-21  365  		priv->icccr = cdf;
54c76ed33008d0 Wolfram Sang          2023-09-21 @366  		priv->schd = RCAR_SCHD_RATIO * x;
54c76ed33008d0 Wolfram Sang          2023-09-21 @367  		priv->scld = RCAR_SCLD_RATIO * x;
54c76ed33008d0 Wolfram Sang          2023-09-21  368  
54c76ed33008d0 Wolfram Sang          2023-09-21  369  		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCHD %u SCLD %u\n",
54c76ed33008d0 Wolfram Sang          2023-09-21  370  			scl, t.bus_freq_hz, rate, round, cdf, priv->schd, priv->scld);
54c76ed33008d0 Wolfram Sang          2023-09-21  371  	}
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  372  
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  373  	return 0;
be944ceb6761a6 Wolfram Sang          2023-09-06  374  
be944ceb6761a6 Wolfram Sang          2023-09-06  375  err_no_val:
be944ceb6761a6 Wolfram Sang          2023-09-06  376  	dev_err(dev, "it is impossible to calculate best SCL\n");
be944ceb6761a6 Wolfram Sang          2023-09-06  377  	return -EINVAL;
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  378  }
6ccbe607132bd8 Kuninori Morimoto     2012-09-27  379  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
