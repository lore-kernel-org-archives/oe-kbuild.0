Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A549625
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719785; cv=none; b=lWdJ3/Q5qevAN21XP3nb3cltTtjg10vYSVux/XDLyWfYR3hycsWj31fAkNumgrGGCr7p19Y0Exs0tjVSEZV5iEXv8kK/DHlNRdpG2UGtzF+Sr2llZ4q7q66teyDMQ1yUSRdjbNc6nOQ3jpzUxWUnaZOPQeJeuHox9teggBWC7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719785; c=relaxed/simple;
	bh=XIPxEw3lNAKNcsQA+jA4Y7zrOh4uzr4JTIv1iMC39eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clddObGVSBcsTtOBSwKV0+PreScMKruZ1viNX8/++6oFgz1ztlUAx3tW/L198nnjveAAvcN0yyznjvGGKgn2nmJMqtR+jik5QKmYglIAbs8kvyAc7heNYWt3NlSWWtzq6NbPh6BwjLprlRyCDllavWWJskJZxjuGco0TMiqsZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOV41jbz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOV41jbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719784; x=1765255784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIPxEw3lNAKNcsQA+jA4Y7zrOh4uzr4JTIv1iMC39eQ=;
  b=QOV41jbzhu0OHZK3icVA+DHly0BP0U0eQqhQK4pNExXUbll6i7caOosg
   bouRuVLjW0d1X6DjMM5MDIoBqb/spRYNoLF5HRKOdCBVDU0dialgK1+sv
   SiYCZbstK+q/HcSWaJdUT5Ar3wVLqSrspF/z93R1WNWSbK0Qy4jAEq6lU
   TqTHfv/gdpDW8pw1CrvgPrKX9/xXCRJL5PS9i/LO32/TG3E5+pAlWcTFM
   q2bexGZukqbMfw9YdXZUYLYTDodzBvCXxz86ofE7npof34QrFm7dXzvp4
   jeOgfK4v4mA4WlDM+sn6cLwgtha006Y8+S17yd8dyCC/psneROQYuqqSO
   Q==;
X-CSE-ConnectionGUID: tJMkhhDLThi93lEDUH+DZg==
X-CSE-MsgGUID: apwLhVbiR1+0Lw3XlyS2zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416430"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:49:41 -0800
X-CSE-ConnectionGUID: FBNiUKQrTuexYDpSD/a+cA==
X-CSE-MsgGUID: oAhlyioLSGajlibEYTkasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94802119"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:49:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKViD-0003vg-1C;
	Mon, 09 Dec 2024 04:49:37 +0000
Date: Mon, 9 Dec 2024 12:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202412082206.Fm2XEo5q-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: dd22e56217495e2d392ded86a1e11a908e424e64 clk: renesas: Add family-specific clock driver for RZ/V2H(P)
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241208/202412082206.Fm2XEo5q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412082206.Fm2XEo5q-lkp@intel.com/

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
