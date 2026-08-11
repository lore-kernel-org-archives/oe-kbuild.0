Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF642885F
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Aug 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440565; cv=none; b=akXdCOcYtYo4m8NEW4pCnra9nQGaQjn5to45rj7AoJyhEDoA3CLGHvN8MpwwwcrZ0vy2KsK5mYIaLfv0VkJuiPycBA2dbP5kdcI5ZW8fJKUtyoOk4DqVOPUpdp9YloCq+Up3cGW7KG1pQHbK0AWvpDsiTYX42p7GAin3EGgzL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440565; c=relaxed/simple;
	bh=NG/g7fYzU96TjpUVmZb4SfGAHAHqmix2KZXZQ3/pkoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uK/eVfxtFgVZf+AxgUW0qKydbe6P9Ql09KYwo4bJhR76bqovEvv6bCFriyvNLYPmRqJCTeibyJCZYMW/uf0AVaorPvZ6HFn55s2dwLMT5hrTCjTPXF+KMQNn0qePw4oz0rg/2FiDyz7wHdqqbnNJB4TD+VUzj0YNjVSQiRYSDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWl/5mgV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWl/5mgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786440560; x=1817976560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NG/g7fYzU96TjpUVmZb4SfGAHAHqmix2KZXZQ3/pkoE=;
  b=KWl/5mgVJVmc/kAo7yOtessRWv/2Ub1toT8vOcDPHd3M2XrLzK8FCJ/u
   AGzyU1BfBtoK5D/K6koXmPLBVxQKH/rhZiAK/OIf0MGjz7MMZXaQsYyxl
   uLZoUI8/NeHVEE/1PPkk5YVm5jdN+gVB0A9OycmygrB+hGjxba9dYRB4T
   /voBMb46DAglRmh8jSMUpme3dC0FXUkTC2S5PTk9uyiBWdbtzzCO7Wlz9
   tRTh71FPwwQXqMwpl1Vcb1wVpU3nqLnPVhAVXnOcf/D4UUKVcRusPt2A6
   lym9GSUcZxhD9pqJuOVQx37Se+W4w6gJNwSQPzBhKiCOukzHWZJ3UG+Vc
   g==;
X-CSE-ConnectionGUID: T+2O+sl+RSCJ1EZzFrWe5w==
X-CSE-MsgGUID: P2zPqFJsQFyXmRLuITq1+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98326712"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="98326712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 02:29:15 -0700
X-CSE-ConnectionGUID: FgkoYvrcTQCfaydcjqJkgg==
X-CSE-MsgGUID: YvGicJClQrKOxCwL15DE2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="262791111"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2026 02:29:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtinH-00000000OWM-21Le;
	Tue, 11 Aug 2026 09:29:11 +0000
Date: Tue, 11 Aug 2026 17:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv2] clk: davinci: add COMPILE_TEST support
Message-ID: <202608111657.akibigNG-lkp@intel.com>
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
In-Reply-To: <20260719214214.726826-1-rosenp@gmail.com>
References: <20260719214214.726826-1-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-clk@vger.kernel.org
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>
CC: David Lechner <david@lechnology.com>
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/clk-davinci-add-COMPILE_TEST-support/20260810-131535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260719214214.726826-1-rosenp%40gmail.com
patch subject: [PATCHv2] clk: davinci: add COMPILE_TEST support
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc64-randconfig-r073-20260811 (https://download.01.org/0day-ci/archive/20260811/202608111657.akibigNG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608111657.akibigNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608111657.akibigNG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `of_da850_pll0_init'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/clk/davinci/pll.o: in function `.__da850_pll0_of_clk_init_declare':
>> pll.c:(.init.text+0x8c): undefined reference to `.of_da850_pll0_init'
>> powerpc64-linux-ld: drivers/clk/davinci/pll.o:(.data.rel.ro+0x18): undefined reference to `da850_pll0_init'
>> powerpc64-linux-ld: drivers/clk/davinci/pll.o:(.data.rel.ro+0x38): undefined reference to `da850_pll1_init'
>> powerpc64-linux-ld: drivers/clk/davinci/pll.o:(.data.rel.ro+0x120): undefined reference to `of_da850_pll1_init'
>> powerpc64-linux-ld: drivers/clk/davinci/psc.o:(.data.rel.ro+0x18): undefined reference to `da850_psc0_init_data'
>> powerpc64-linux-ld: drivers/clk/davinci/psc.o:(.data.rel.ro+0x38): undefined reference to `da850_psc1_init_data'
>> powerpc64-linux-ld: drivers/clk/davinci/psc.o:(.data.rel.ro+0x120): undefined reference to `of_da850_psc0_init_data'
>> powerpc64-linux-ld: drivers/clk/davinci/psc.o:(.data.rel.ro+0x1e8): undefined reference to `of_da850_psc1_init_data'

smatch warnings:
drivers/clk/davinci/pll.c:429 davinci_pll_clk_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +429 drivers/clk/davinci/pll.c

2d172691515961 David Lechner  2018-03-15  344  
2d172691515961 David Lechner  2018-03-15  345  /**
2d172691515961 David Lechner  2018-03-15  346   * davinci_pll_clk_register - Register a PLL clock
76c9dd9dbd6459 David Lechner  2018-05-25  347   * @dev: The PLL platform device or NULL
2d172691515961 David Lechner  2018-03-15  348   * @info: The device-specific clock info
2d172691515961 David Lechner  2018-03-15  349   * @parent_name: The parent clock name
2d172691515961 David Lechner  2018-03-15  350   * @base: The PLL's memory region
76c9dd9dbd6459 David Lechner  2018-05-25  351   * @cfgchip: CFGCHIP syscon regmap for info->unlock_reg or NULL
2d172691515961 David Lechner  2018-03-15  352   *
2d172691515961 David Lechner  2018-03-15  353   * This creates a series of clocks that represent the PLL.
2d172691515961 David Lechner  2018-03-15  354   *
2d172691515961 David Lechner  2018-03-15  355   *     OSCIN > [PREDIV >] PLL > [POSTDIV >] PLLEN
2d172691515961 David Lechner  2018-03-15  356   *
2d172691515961 David Lechner  2018-03-15  357   * - OSCIN is the parent clock (on secondary PLL, may come from primary PLL)
2d172691515961 David Lechner  2018-03-15  358   * - PREDIV and POSTDIV are optional (depends on the PLL controller)
2d172691515961 David Lechner  2018-03-15  359   * - PLL is the PLL output (aka PLLOUT)
2d172691515961 David Lechner  2018-03-15  360   * - PLLEN is the bypass multiplexer
2d172691515961 David Lechner  2018-03-15  361   *
2d172691515961 David Lechner  2018-03-15  362   * Returns: The PLLOUT clock or a negative error code.
2d172691515961 David Lechner  2018-03-15  363   */
2d172691515961 David Lechner  2018-03-15  364  struct clk *davinci_pll_clk_register(struct device *dev,
2d172691515961 David Lechner  2018-03-15  365  				     const struct davinci_pll_clk_info *info,
2d172691515961 David Lechner  2018-03-15  366  				     const char *parent_name,
76c9dd9dbd6459 David Lechner  2018-05-25  367  				     void __iomem *base,
76c9dd9dbd6459 David Lechner  2018-05-25  368  				     struct regmap *cfgchip)
2d172691515961 David Lechner  2018-03-15  369  {
2d172691515961 David Lechner  2018-03-15  370  	char prediv_name[MAX_NAME_SIZE];
2d172691515961 David Lechner  2018-03-15  371  	char pllout_name[MAX_NAME_SIZE];
2d172691515961 David Lechner  2018-03-15  372  	char postdiv_name[MAX_NAME_SIZE];
2d172691515961 David Lechner  2018-03-15  373  	char pllen_name[MAX_NAME_SIZE];
2d172691515961 David Lechner  2018-03-15  374  	struct clk_init_data init;
2d172691515961 David Lechner  2018-03-15  375  	struct davinci_pll_clk *pllout;
2d172691515961 David Lechner  2018-03-15  376  	struct davinci_pllen_clk *pllen;
76c9dd9dbd6459 David Lechner  2018-05-25  377  	struct clk *oscin_clk = NULL;
76c9dd9dbd6459 David Lechner  2018-05-25  378  	struct clk *prediv_clk = NULL;
76c9dd9dbd6459 David Lechner  2018-05-25  379  	struct clk *pllout_clk;
76c9dd9dbd6459 David Lechner  2018-05-25  380  	struct clk *postdiv_clk = NULL;
76c9dd9dbd6459 David Lechner  2018-05-25  381  	struct clk *pllen_clk;
76c9dd9dbd6459 David Lechner  2018-05-25  382  	int ret;
2d172691515961 David Lechner  2018-03-15  383  
2d172691515961 David Lechner  2018-03-15  384  	if (info->flags & PLL_HAS_CLKMODE) {
2d172691515961 David Lechner  2018-03-15  385  		/*
2d172691515961 David Lechner  2018-03-15  386  		 * If a PLL has PLLCTL[CLKMODE], then it is the primary PLL.
2d172691515961 David Lechner  2018-03-15  387  		 * We register a clock named "oscin" that serves as the internal
2d172691515961 David Lechner  2018-03-15  388  		 * "input clock" domain shared by both PLLs (if there are 2)
2d172691515961 David Lechner  2018-03-15  389  		 * and will be the parent clock to the AUXCLK, SYSCLKBP and
2d172691515961 David Lechner  2018-03-15  390  		 * OBSCLK domains. NB: The various TRMs use "OSCIN" to mean
2d172691515961 David Lechner  2018-03-15  391  		 * a number of different things. In this driver we use it to
2d172691515961 David Lechner  2018-03-15  392  		 * mean the signal after the PLLCTL[CLKMODE] switch.
2d172691515961 David Lechner  2018-03-15  393  		 */
76c9dd9dbd6459 David Lechner  2018-05-25  394  		oscin_clk = clk_register_fixed_factor(dev, OSCIN_CLK_NAME,
2d172691515961 David Lechner  2018-03-15  395  						      parent_name, 0, 1, 1);
76c9dd9dbd6459 David Lechner  2018-05-25  396  		if (IS_ERR(oscin_clk))
76c9dd9dbd6459 David Lechner  2018-05-25  397  			return oscin_clk;
2d172691515961 David Lechner  2018-03-15  398  
2d172691515961 David Lechner  2018-03-15  399  		parent_name = OSCIN_CLK_NAME;
2d172691515961 David Lechner  2018-03-15  400  	}
2d172691515961 David Lechner  2018-03-15  401  
2d172691515961 David Lechner  2018-03-15  402  	if (info->flags & PLL_HAS_PREDIV) {
2d172691515961 David Lechner  2018-03-15  403  		bool fixed = info->flags & PLL_PREDIV_FIXED_DIV;
2d172691515961 David Lechner  2018-03-15  404  		u32 flags = 0;
2d172691515961 David Lechner  2018-03-15  405  
2d172691515961 David Lechner  2018-03-15  406  		snprintf(prediv_name, MAX_NAME_SIZE, "%s_prediv", info->name);
2d172691515961 David Lechner  2018-03-15  407  
2d172691515961 David Lechner  2018-03-15  408  		if (info->flags & PLL_PREDIV_ALWAYS_ENABLED)
2d172691515961 David Lechner  2018-03-15  409  			flags |= CLK_IS_CRITICAL;
2d172691515961 David Lechner  2018-03-15  410  
2d172691515961 David Lechner  2018-03-15  411  		/* Some? DM355 chips don't correctly report the PREDIV value */
2d172691515961 David Lechner  2018-03-15  412  		if (info->flags & PLL_PREDIV_FIXED8)
76c9dd9dbd6459 David Lechner  2018-05-25  413  			prediv_clk = clk_register_fixed_factor(dev, prediv_name,
2d172691515961 David Lechner  2018-03-15  414  							parent_name, flags, 1, 8);
2d172691515961 David Lechner  2018-03-15  415  		else
76c9dd9dbd6459 David Lechner  2018-05-25  416  			prediv_clk = davinci_pll_div_register(dev, prediv_name,
2d172691515961 David Lechner  2018-03-15  417  				parent_name, base + PREDIV, fixed, flags);
76c9dd9dbd6459 David Lechner  2018-05-25  418  		if (IS_ERR(prediv_clk)) {
76c9dd9dbd6459 David Lechner  2018-05-25  419  			ret = PTR_ERR(prediv_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  420  			goto err_unregister_oscin;
76c9dd9dbd6459 David Lechner  2018-05-25  421  		}
2d172691515961 David Lechner  2018-03-15  422  
2d172691515961 David Lechner  2018-03-15  423  		parent_name = prediv_name;
2d172691515961 David Lechner  2018-03-15  424  	}
2d172691515961 David Lechner  2018-03-15  425  
2d172691515961 David Lechner  2018-03-15  426  	/* Unlock writing to PLL registers */
2d172691515961 David Lechner  2018-03-15  427  	if (info->unlock_reg) {
76c9dd9dbd6459 David Lechner  2018-05-25  428  		if (IS_ERR_OR_NULL(cfgchip))
2d172691515961 David Lechner  2018-03-15 @429  			dev_warn(dev, "Failed to get CFGCHIP (%ld)\n",
76c9dd9dbd6459 David Lechner  2018-05-25  430  				 PTR_ERR(cfgchip));
2d172691515961 David Lechner  2018-03-15  431  		else
76c9dd9dbd6459 David Lechner  2018-05-25  432  			regmap_write_bits(cfgchip, info->unlock_reg,
2d172691515961 David Lechner  2018-03-15  433  					  info->unlock_mask, 0);
2d172691515961 David Lechner  2018-03-15  434  	}
2d172691515961 David Lechner  2018-03-15  435  
bf4afc53b77aea Linus Torvalds 2026-02-21  436  	pllout = kzalloc_obj(*pllout);
76c9dd9dbd6459 David Lechner  2018-05-25  437  	if (!pllout) {
76c9dd9dbd6459 David Lechner  2018-05-25  438  		ret = -ENOMEM;
76c9dd9dbd6459 David Lechner  2018-05-25  439  		goto err_unregister_prediv;
76c9dd9dbd6459 David Lechner  2018-05-25  440  	}
2d172691515961 David Lechner  2018-03-15  441  
2d172691515961 David Lechner  2018-03-15  442  	snprintf(pllout_name, MAX_NAME_SIZE, "%s_pllout", info->name);
2d172691515961 David Lechner  2018-03-15  443  
2d172691515961 David Lechner  2018-03-15  444  	init.name = pllout_name;
2d172691515961 David Lechner  2018-03-15  445  	if (info->flags & PLL_PLLM_2X)
2d172691515961 David Lechner  2018-03-15  446  		init.ops = &dm365_pll_ops;
2d172691515961 David Lechner  2018-03-15  447  	else
2d172691515961 David Lechner  2018-03-15  448  		init.ops = &davinci_pll_ops;
2d172691515961 David Lechner  2018-03-15  449  	init.parent_names = &parent_name;
2d172691515961 David Lechner  2018-03-15  450  	init.num_parents = 1;
2d172691515961 David Lechner  2018-03-15  451  	init.flags = 0;
2d172691515961 David Lechner  2018-03-15  452  
2d172691515961 David Lechner  2018-03-15  453  	if (info->flags & PLL_HAS_PREDIV)
2d172691515961 David Lechner  2018-03-15  454  		init.flags |= CLK_SET_RATE_PARENT;
2d172691515961 David Lechner  2018-03-15  455  
2d172691515961 David Lechner  2018-03-15  456  	pllout->hw.init = &init;
2d172691515961 David Lechner  2018-03-15  457  	pllout->base = base;
2d172691515961 David Lechner  2018-03-15  458  	pllout->pllm_mask = info->pllm_mask;
2d172691515961 David Lechner  2018-03-15  459  	pllout->pllm_min = info->pllm_min;
2d172691515961 David Lechner  2018-03-15  460  	pllout->pllm_max = info->pllm_max;
2d172691515961 David Lechner  2018-03-15  461  
76c9dd9dbd6459 David Lechner  2018-05-25  462  	pllout_clk = clk_register(dev, &pllout->hw);
76c9dd9dbd6459 David Lechner  2018-05-25  463  	if (IS_ERR(pllout_clk)) {
76c9dd9dbd6459 David Lechner  2018-05-25  464  		ret = PTR_ERR(pllout_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  465  		goto err_free_pllout;
76c9dd9dbd6459 David Lechner  2018-05-25  466  	}
2d172691515961 David Lechner  2018-03-15  467  
2d172691515961 David Lechner  2018-03-15  468  	clk_hw_set_rate_range(&pllout->hw, info->pllout_min_rate,
2d172691515961 David Lechner  2018-03-15  469  			      info->pllout_max_rate);
2d172691515961 David Lechner  2018-03-15  470  
2d172691515961 David Lechner  2018-03-15  471  	parent_name = pllout_name;
2d172691515961 David Lechner  2018-03-15  472  
2d172691515961 David Lechner  2018-03-15  473  	if (info->flags & PLL_HAS_POSTDIV) {
2d172691515961 David Lechner  2018-03-15  474  		bool fixed = info->flags & PLL_POSTDIV_FIXED_DIV;
2d172691515961 David Lechner  2018-03-15  475  		u32 flags = CLK_SET_RATE_PARENT;
2d172691515961 David Lechner  2018-03-15  476  
2d172691515961 David Lechner  2018-03-15  477  		snprintf(postdiv_name, MAX_NAME_SIZE, "%s_postdiv", info->name);
2d172691515961 David Lechner  2018-03-15  478  
2d172691515961 David Lechner  2018-03-15  479  		if (info->flags & PLL_POSTDIV_ALWAYS_ENABLED)
2d172691515961 David Lechner  2018-03-15  480  			flags |= CLK_IS_CRITICAL;
2d172691515961 David Lechner  2018-03-15  481  
76c9dd9dbd6459 David Lechner  2018-05-25  482  		postdiv_clk = davinci_pll_div_register(dev, postdiv_name,
76c9dd9dbd6459 David Lechner  2018-05-25  483  				parent_name, base + POSTDIV, fixed, flags);
76c9dd9dbd6459 David Lechner  2018-05-25  484  		if (IS_ERR(postdiv_clk)) {
76c9dd9dbd6459 David Lechner  2018-05-25  485  			ret = PTR_ERR(postdiv_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  486  			goto err_unregister_pllout;
76c9dd9dbd6459 David Lechner  2018-05-25  487  		}
2d172691515961 David Lechner  2018-03-15  488  
2d172691515961 David Lechner  2018-03-15  489  		parent_name = postdiv_name;
2d172691515961 David Lechner  2018-03-15  490  	}
2d172691515961 David Lechner  2018-03-15  491  
bf4afc53b77aea Linus Torvalds 2026-02-21  492  	pllen = kzalloc_obj(*pllen);
76c9dd9dbd6459 David Lechner  2018-05-25  493  	if (!pllen) {
76c9dd9dbd6459 David Lechner  2018-05-25  494  		ret = -ENOMEM;
76c9dd9dbd6459 David Lechner  2018-05-25  495  		goto err_unregister_postdiv;
76c9dd9dbd6459 David Lechner  2018-05-25  496  	}
2d172691515961 David Lechner  2018-03-15  497  
2d172691515961 David Lechner  2018-03-15  498  	snprintf(pllen_name, MAX_NAME_SIZE, "%s_pllen", info->name);
2d172691515961 David Lechner  2018-03-15  499  
2d172691515961 David Lechner  2018-03-15  500  	init.name = pllen_name;
2d172691515961 David Lechner  2018-03-15  501  	init.ops = &davinci_pllen_ops;
2d172691515961 David Lechner  2018-03-15  502  	init.parent_names = &parent_name;
2d172691515961 David Lechner  2018-03-15  503  	init.num_parents = 1;
2d172691515961 David Lechner  2018-03-15  504  	init.flags = CLK_SET_RATE_PARENT;
2d172691515961 David Lechner  2018-03-15  505  
2d172691515961 David Lechner  2018-03-15  506  	pllen->hw.init = &init;
2d172691515961 David Lechner  2018-03-15  507  	pllen->base = base;
2d172691515961 David Lechner  2018-03-15  508  
76c9dd9dbd6459 David Lechner  2018-05-25  509  	pllen_clk = clk_register(dev, &pllen->hw);
76c9dd9dbd6459 David Lechner  2018-05-25  510  	if (IS_ERR(pllen_clk)) {
76c9dd9dbd6459 David Lechner  2018-05-25  511  		ret = PTR_ERR(pllen_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  512  		goto err_free_pllen;
76c9dd9dbd6459 David Lechner  2018-05-25  513  	}
2d172691515961 David Lechner  2018-03-15  514  
76c9dd9dbd6459 David Lechner  2018-05-25  515  	clk_notifier_register(pllen_clk, &davinci_pllen_notifier);
2d172691515961 David Lechner  2018-03-15  516  
2d172691515961 David Lechner  2018-03-15  517  	return pllout_clk;
76c9dd9dbd6459 David Lechner  2018-05-25  518  
76c9dd9dbd6459 David Lechner  2018-05-25  519  err_free_pllen:
76c9dd9dbd6459 David Lechner  2018-05-25  520  	kfree(pllen);
76c9dd9dbd6459 David Lechner  2018-05-25  521  err_unregister_postdiv:
76c9dd9dbd6459 David Lechner  2018-05-25  522  	clk_unregister(postdiv_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  523  err_unregister_pllout:
76c9dd9dbd6459 David Lechner  2018-05-25  524  	clk_unregister(pllout_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  525  err_free_pllout:
76c9dd9dbd6459 David Lechner  2018-05-25  526  	kfree(pllout);
76c9dd9dbd6459 David Lechner  2018-05-25  527  err_unregister_prediv:
76c9dd9dbd6459 David Lechner  2018-05-25  528  	clk_unregister(prediv_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  529  err_unregister_oscin:
76c9dd9dbd6459 David Lechner  2018-05-25  530  	clk_unregister(oscin_clk);
76c9dd9dbd6459 David Lechner  2018-05-25  531  
76c9dd9dbd6459 David Lechner  2018-05-25  532  	return ERR_PTR(ret);
2d172691515961 David Lechner  2018-03-15  533  }
2d172691515961 David Lechner  2018-03-15  534  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
