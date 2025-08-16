Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA233993
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755307862; cv=none; b=W54iA2ekauUR9n6UKUn6tTe9TOtGg/RBjiICue/x9CwL5CHpg+V+chyl/jm2jYunBS4wepcv82A2pkpQZl4kZDEjvrEawuWuZ8b5XQAZxOxjzTEioLRbFmGBWBpwx6gFZgQq+tILrT2V8DUYm2ppjUMTcFGg0N0k7iTvyT6aC48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755307862; c=relaxed/simple;
	bh=nwuXtJ9NRzehq1aHrzaiI3ZM5Q0Cb1nABDvjMbah/7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyTRVroseKF/5BgqIX9tBL8CnIqx6tX+LgV120OaENTBY/DCNQVgfqjy3SoKYhapJEC7a9Joq2Wdeq5Aw0uCddIeXnURHnQuk+tw/BPZxuFGqO0t0fA9uWtXYw4PjeqhlgiV5J4mgrGosfAWfCyB14tlmLUA8R2yU4Si+k9iHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzKZ3Q22; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzKZ3Q22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755307860; x=1786843860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nwuXtJ9NRzehq1aHrzaiI3ZM5Q0Cb1nABDvjMbah/7c=;
  b=jzKZ3Q224nR2Vp0u4UghwsZRI/JdFaIFkARv/U5M2Cghu2A404d5lSVp
   IilMBb03BeY2cHmlx4In1R5TGyXnTcS4Pgqe3SNTp6HKNVbTsn1/l/OYh
   ++0tl0VTIkObqMBxweHy90y/zFJY5PNHdpQdmas5hg8GbtlQKavkTPmA4
   zB7il+Ui12gjEQ2daSI7REcVyjJsZYmsDcxZ7V3eSK7LKpzHDVVfW+4cu
   6qKRFPsFktwtyLagtNHy1AmUSovygcd3Hvc0GgWvJEWrAtY7QDF0st/en
   CfFDCA24SkcC5JrrpmuWs9gPlmHmU+eCFgIFYf5/WbdddqRHiShrtz1CG
   A==;
X-CSE-ConnectionGUID: 2ES/8WWyQ6C8O4oSJiNToA==
X-CSE-MsgGUID: yma4GEtwSNSSMHoTO+IxCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56835199"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56835199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 18:31:00 -0700
X-CSE-ConnectionGUID: 2YR/AsQUTQmIsog6Uy6ifA==
X-CSE-MsgGUID: HF4XWWt7QsOwdTHNZR0EhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171387603"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 18:30:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un5kh-000CTg-2O;
	Sat, 16 Aug 2025 01:30:43 +0000
Date: Sat, 16 Aug 2025 09:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod
 clocks
Message-ID: <202508160958.ounSAlER-lkp@intel.com>
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
In-Reply-To: <20250814124832.76266-3-biju.das.jz@bp.renesas.com>
References: <20250814124832.76266-3-biju.das.jz@bp.renesas.com>
TO: Biju <biju.das.au@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-clk]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/clk-renesas-rzv2h-Refactor-rzv2h_cpg_fixed_mod_status_clk_register/20250814-205111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20250814124832.76266-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod clocks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160958.ounSAlER-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508160958.ounSAlER-lkp@intel.com/

New smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:875 rzv2h_cpg_register_mod_clk() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:621 rzv2h_cpg_register_core_clk() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +875 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  769  
dd22e56217495e Lad Prabhakar 2024-07-29  770  static void __init
dd22e56217495e Lad Prabhakar 2024-07-29  771  rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
dd22e56217495e Lad Prabhakar 2024-07-29  772  			   struct rzv2h_cpg_priv *priv)
dd22e56217495e Lad Prabhakar 2024-07-29  773  {
dd22e56217495e Lad Prabhakar 2024-07-29  774  	struct mod_clock *clock = NULL;
dd22e56217495e Lad Prabhakar 2024-07-29  775  	struct device *dev = priv->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  776  	struct clk_init_data init;
dd22e56217495e Lad Prabhakar 2024-07-29  777  	struct clk *parent, *clk;
dd22e56217495e Lad Prabhakar 2024-07-29  778  	const char *parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  779  	unsigned int id;
dd22e56217495e Lad Prabhakar 2024-07-29  780  	int ret;
dd22e56217495e Lad Prabhakar 2024-07-29  781  
dd22e56217495e Lad Prabhakar 2024-07-29  782  	id = GET_MOD_CLK_ID(priv->num_core_clks, mod->on_index, mod->on_bit);
dd22e56217495e Lad Prabhakar 2024-07-29  783  	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  784  	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  785  	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  786  
dd22e56217495e Lad Prabhakar 2024-07-29  787  	parent = priv->clks[mod->parent];
dd22e56217495e Lad Prabhakar 2024-07-29  788  	if (IS_ERR(parent)) {
dd22e56217495e Lad Prabhakar 2024-07-29  789  		clk = parent;
dd22e56217495e Lad Prabhakar 2024-07-29  790  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  791  	}
dd22e56217495e Lad Prabhakar 2024-07-29  792  
dd22e56217495e Lad Prabhakar 2024-07-29  793  	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
dd22e56217495e Lad Prabhakar 2024-07-29  794  	if (!clock) {
dd22e56217495e Lad Prabhakar 2024-07-29  795  		clk = ERR_PTR(-ENOMEM);
dd22e56217495e Lad Prabhakar 2024-07-29  796  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  797  	}
dd22e56217495e Lad Prabhakar 2024-07-29  798  
dd22e56217495e Lad Prabhakar 2024-07-29  799  	init.name = mod->name;
dd22e56217495e Lad Prabhakar 2024-07-29  800  	init.ops = &rzv2h_mod_clock_ops;
dd22e56217495e Lad Prabhakar 2024-07-29  801  	init.flags = CLK_SET_RATE_PARENT;
dd22e56217495e Lad Prabhakar 2024-07-29  802  	if (mod->critical)
dd22e56217495e Lad Prabhakar 2024-07-29  803  		init.flags |= CLK_IS_CRITICAL;
dd22e56217495e Lad Prabhakar 2024-07-29  804  
dd22e56217495e Lad Prabhakar 2024-07-29  805  	parent_name = __clk_get_name(parent);
dd22e56217495e Lad Prabhakar 2024-07-29  806  	init.parent_names = &parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  807  	init.num_parents = 1;
dd22e56217495e Lad Prabhakar 2024-07-29  808  
dd22e56217495e Lad Prabhakar 2024-07-29  809  	clock->on_index = mod->on_index;
dd22e56217495e Lad Prabhakar 2024-07-29  810  	clock->on_bit = mod->on_bit;
dd22e56217495e Lad Prabhakar 2024-07-29  811  	clock->mon_index = mod->mon_index;
dd22e56217495e Lad Prabhakar 2024-07-29  812  	clock->mon_bit = mod->mon_bit;
03108a2614ecab Lad Prabhakar 2024-12-02  813  	clock->no_pm = mod->no_pm;
899e7ede4c19c6 Lad Prabhakar 2025-05-09  814  	clock->ext_clk_mux_index = mod->ext_clk_mux_index;
dd22e56217495e Lad Prabhakar 2024-07-29  815  	clock->priv = priv;
dd22e56217495e Lad Prabhakar 2024-07-29  816  	clock->hw.init = &init;
9b6e63a777ea5f Biju Das      2024-12-13  817  	clock->mstop_data = mod->mstop_data;
dd22e56217495e Lad Prabhakar 2024-07-29  818  
dd22e56217495e Lad Prabhakar 2024-07-29  819  	ret = devm_clk_hw_register(dev, &clock->hw);
dd22e56217495e Lad Prabhakar 2024-07-29  820  	if (ret) {
dd22e56217495e Lad Prabhakar 2024-07-29  821  		clk = ERR_PTR(ret);
dd22e56217495e Lad Prabhakar 2024-07-29  822  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  823  	}
dd22e56217495e Lad Prabhakar 2024-07-29  824  
dd22e56217495e Lad Prabhakar 2024-07-29  825  	priv->clks[id] = clock->hw.clk;
18610e6bf54faa Biju Das      2025-08-14  826  	if (mod->child_name) {
18610e6bf54faa Biju Das      2025-08-14  827  		WARN_DEBUG(mod->child >= priv->num_core_clks);
18610e6bf54faa Biju Das      2025-08-14  828  		WARN_DEBUG(PTR_ERR(priv->clks[mod->child]) != -ENOENT);
18610e6bf54faa Biju Das      2025-08-14  829  
18610e6bf54faa Biju Das      2025-08-14  830  		clk = rzv2h_cpg_mod_status_clk_register(priv, mod->child_name, mod->name, 1, 1,
18610e6bf54faa Biju Das      2025-08-14  831  							FIXED_MOD_CONF_PACK(mod->mon_index,
18610e6bf54faa Biju Das      2025-08-14  832  									    mod->mon_bit));
18610e6bf54faa Biju Das      2025-08-14  833  		if (IS_ERR_OR_NULL(clk))
18610e6bf54faa Biju Das      2025-08-14  834  			goto fail;
18610e6bf54faa Biju Das      2025-08-14  835  		priv->clks[mod->child] = clk;
18610e6bf54faa Biju Das      2025-08-14  836  	}
dd22e56217495e Lad Prabhakar 2024-07-29  837  
9b6e63a777ea5f Biju Das      2024-12-13  838  	/*
9b6e63a777ea5f Biju Das      2024-12-13  839  	 * Ensure the module clocks and MSTOP bits are synchronized when they are
9b6e63a777ea5f Biju Das      2024-12-13  840  	 * turned ON by the bootloader. Enable MSTOP bits for module clocks that were
9b6e63a777ea5f Biju Das      2024-12-13  841  	 * turned ON in an earlier boot stage.
9b6e63a777ea5f Biju Das      2024-12-13  842  	 */
9b6e63a777ea5f Biju Das      2024-12-13  843  	if (clock->mstop_data != BUS_MSTOP_NONE &&
9b6e63a777ea5f Biju Das      2024-12-13  844  	    !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw)) {
9b6e63a777ea5f Biju Das      2024-12-13  845  		rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
9b6e63a777ea5f Biju Das      2024-12-13  846  	} else if (clock->mstop_data != BUS_MSTOP_NONE && mod->critical) {
9b6e63a777ea5f Biju Das      2024-12-13  847  		unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, clock->mstop_data);
9b6e63a777ea5f Biju Das      2024-12-13  848  		u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, clock->mstop_data);
69ac2acd209a15 Biju Das      2025-02-22  849  		atomic_t *mstop = &priv->mstop_count[mstop_index * 16];
9b6e63a777ea5f Biju Das      2024-12-13  850  		unsigned long flags;
9b6e63a777ea5f Biju Das      2024-12-13  851  		unsigned int i;
9b6e63a777ea5f Biju Das      2024-12-13  852  		u32 val = 0;
9b6e63a777ea5f Biju Das      2024-12-13  853  
9b6e63a777ea5f Biju Das      2024-12-13  854  		/*
9b6e63a777ea5f Biju Das      2024-12-13  855  		 * Critical clocks are turned ON immediately upon registration, and the
9b6e63a777ea5f Biju Das      2024-12-13  856  		 * MSTOP counter is updated through the rzv2h_mod_clock_enable() path.
9b6e63a777ea5f Biju Das      2024-12-13  857  		 * However, if the critical clocks were already turned ON by the initial
9b6e63a777ea5f Biju Das      2024-12-13  858  		 * bootloader, synchronize the atomic counter here and clear the MSTOP bit.
9b6e63a777ea5f Biju Das      2024-12-13  859  		 */
9b6e63a777ea5f Biju Das      2024-12-13  860  		spin_lock_irqsave(&priv->rmw_lock, flags);
9b6e63a777ea5f Biju Das      2024-12-13  861  		for_each_set_bit(i, &mstop_mask, 16) {
9b6e63a777ea5f Biju Das      2024-12-13  862  			if (atomic_read(&mstop[i]))
9b6e63a777ea5f Biju Das      2024-12-13  863  				continue;
9b6e63a777ea5f Biju Das      2024-12-13  864  			val |= BIT(i) << 16;
9b6e63a777ea5f Biju Das      2024-12-13  865  			atomic_inc(&mstop[i]);
9b6e63a777ea5f Biju Das      2024-12-13  866  		}
9b6e63a777ea5f Biju Das      2024-12-13  867  		if (val)
9b6e63a777ea5f Biju Das      2024-12-13  868  			writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
9b6e63a777ea5f Biju Das      2024-12-13  869  		spin_unlock_irqrestore(&priv->rmw_lock, flags);
9b6e63a777ea5f Biju Das      2024-12-13  870  	}
9b6e63a777ea5f Biju Das      2024-12-13  871  
dd22e56217495e Lad Prabhakar 2024-07-29  872  	return;
dd22e56217495e Lad Prabhakar 2024-07-29  873  
dd22e56217495e Lad Prabhakar 2024-07-29  874  fail:
dd22e56217495e Lad Prabhakar 2024-07-29 @875  	dev_err(dev, "Failed to register module clock %s: %ld\n",
dd22e56217495e Lad Prabhakar 2024-07-29  876  		mod->name, PTR_ERR(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  877  }
dd22e56217495e Lad Prabhakar 2024-07-29  878  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
