Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C724614D447
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688132; cv=none; b=AwpBdQzafirpGs7WcER+hWa00eP45idBR+Oe0cOKcw1afC2RXu5wnqIVnFI1CrnvYHfG50umA9yS/odKMlJGuUYbs7HoJzDK4dpnA45Xa4cdhSv2cyd2gHMkob0vRcI7kOyQwlL8Xh6o5QbECxJ6Ddxvd9i08A//+4KaC8MRa64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688132; c=relaxed/simple;
	bh=wZ0SSA/dyoLqGh6lezrcRzgN4Kr8iiiE4czUDEQ3mKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9KyOzdA4uA4nXoGlTTCM7KsUFKn733m6zsQX1Ereu8j7Qw8bZefU8CnDGxbG97oroZCX5sKGPtbcOdFiNOiXz/59GLGNOL7mYJCJqRCmjGFNGTkvoVv8ujWRO5d77pbwv80skTrdg3U1X84sQ7N0/EZrMQhqW7EggysEpxBbB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmsawO3o; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmsawO3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722688130; x=1754224130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZ0SSA/dyoLqGh6lezrcRzgN4Kr8iiiE4czUDEQ3mKc=;
  b=JmsawO3o2jgOTpv0xtqIGzlIrVk5Yu6YSOAR4A/15EnIjo7S3QBOpDNl
   CqPe0LmcV9uUV2a0toIaXLx3u/6MwfYRqKJhnrNVIr70Cd0X1PlFpZU/I
   UIukHGyYJnJb8Cdgmknh/gCKc5BslebEhYcAsjeQcaqManw6BFfELvgMK
   ThAK8IRxx0vWNo7Ie9mLBdfoRp/utoSby9Qlg3n5Ap1I+FeZfoOKUQp35
   nGjFQfZle+bQE/tLNDHQOimgc6zrtucC8mmRzRlCDM2D3S3nZwvXrWBhL
   K0E1aQn5SNKAyjE0kUpjrdZLMox1Bd39XqsEKTznso/N75lbyuc2xxMOI
   g==;
X-CSE-ConnectionGUID: TjKVz4HbQqWVVivW3NcMXQ==
X-CSE-MsgGUID: GECvCsrXR+OnzUGE/ss2pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20853105"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20853105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 05:28:49 -0700
X-CSE-ConnectionGUID: +bJ3LcV+RBmtFK7fFpYXHg==
X-CSE-MsgGUID: u/b7dnKUSLKIpxB2GYbe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60512694"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2024 05:28:48 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saDsF-0000RI-2G;
	Sat, 03 Aug 2024 12:28:41 +0000
Date: Sat, 3 Aug 2024 20:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 28/29]
 drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202408032025.ve2JMaoV-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
head:   42b54d52ecb7a81998592c2b40f8a963e82ed02e
commit: dd22e56217495e2d392ded86a1e11a908e424e64 [28/29] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: parisc-randconfig-r081-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032025.ve2JMaoV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/

smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +269 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  219  
dd22e56217495e Lad Prabhakar 2024-07-29  220  static void __init
dd22e56217495e Lad Prabhakar 2024-07-29  221  rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
dd22e56217495e Lad Prabhakar 2024-07-29  222  			    struct rzv2h_cpg_priv *priv)
dd22e56217495e Lad Prabhakar 2024-07-29  223  {
dd22e56217495e Lad Prabhakar 2024-07-29  224  	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
dd22e56217495e Lad Prabhakar 2024-07-29  225  	unsigned int id = core->id, div = core->div;
dd22e56217495e Lad Prabhakar 2024-07-29  226  	struct device *dev = priv->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  227  	const char *parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  228  	struct clk_hw *clk_hw;
dd22e56217495e Lad Prabhakar 2024-07-29  229  
dd22e56217495e Lad Prabhakar 2024-07-29  230  	WARN_DEBUG(id >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  231  	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  232  
dd22e56217495e Lad Prabhakar 2024-07-29  233  	switch (core->type) {
dd22e56217495e Lad Prabhakar 2024-07-29  234  	case CLK_TYPE_IN:
dd22e56217495e Lad Prabhakar 2024-07-29  235  		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
dd22e56217495e Lad Prabhakar 2024-07-29  236  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  237  	case CLK_TYPE_FF:
dd22e56217495e Lad Prabhakar 2024-07-29  238  		WARN_DEBUG(core->parent >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  239  		parent = priv->clks[core->parent];
dd22e56217495e Lad Prabhakar 2024-07-29  240  		if (IS_ERR(parent)) {
dd22e56217495e Lad Prabhakar 2024-07-29  241  			clk = parent;
dd22e56217495e Lad Prabhakar 2024-07-29  242  			goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  243  		}
dd22e56217495e Lad Prabhakar 2024-07-29  244  
dd22e56217495e Lad Prabhakar 2024-07-29  245  		parent_name = __clk_get_name(parent);
dd22e56217495e Lad Prabhakar 2024-07-29  246  		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name,
dd22e56217495e Lad Prabhakar 2024-07-29  247  							   parent_name, CLK_SET_RATE_PARENT,
dd22e56217495e Lad Prabhakar 2024-07-29  248  							   core->mult, div);
dd22e56217495e Lad Prabhakar 2024-07-29  249  		if (IS_ERR(clk_hw))
dd22e56217495e Lad Prabhakar 2024-07-29  250  			clk = ERR_CAST(clk_hw);
dd22e56217495e Lad Prabhakar 2024-07-29  251  		else
dd22e56217495e Lad Prabhakar 2024-07-29  252  			clk = clk_hw->clk;
dd22e56217495e Lad Prabhakar 2024-07-29  253  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  254  	case CLK_TYPE_PLL:
dd22e56217495e Lad Prabhakar 2024-07-29  255  		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
dd22e56217495e Lad Prabhakar 2024-07-29  256  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  257  	default:
dd22e56217495e Lad Prabhakar 2024-07-29  258  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  259  	}
dd22e56217495e Lad Prabhakar 2024-07-29  260  
dd22e56217495e Lad Prabhakar 2024-07-29  261  	if (IS_ERR_OR_NULL(clk))
dd22e56217495e Lad Prabhakar 2024-07-29  262  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  263  
dd22e56217495e Lad Prabhakar 2024-07-29  264  	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  265  	priv->clks[id] = clk;
dd22e56217495e Lad Prabhakar 2024-07-29  266  	return;
dd22e56217495e Lad Prabhakar 2024-07-29  267  
dd22e56217495e Lad Prabhakar 2024-07-29  268  fail:
dd22e56217495e Lad Prabhakar 2024-07-29 @269  	dev_err(dev, "Failed to register core clock %s: %ld\n",
dd22e56217495e Lad Prabhakar 2024-07-29  270  		core->name, PTR_ERR(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  271  }
dd22e56217495e Lad Prabhakar 2024-07-29  272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
