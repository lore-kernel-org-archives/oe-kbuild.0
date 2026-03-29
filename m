Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D7F175A77
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798835; cv=none; b=mEdhdiUh8VEisyCSgIFbScXBoYepT2lD5520oYIUk6iijpvom5T+BPQELma/vrm2VwK46hHxRpe0CWZSHzC/f6UMbzTsZ3waTN60gFua7eTTsswGlTEjt3CSYC/HuqCr3BEuIw1zazwcEw67yjOHCW0psR7KHTUIj2+jqJwxT8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798835; c=relaxed/simple;
	bh=rEy06HLBQUOgMhrJNTJps6KmvYiEVOmUdAqT+9w0ZJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hf29Vlv7b3eSjAlJqw5kdGuAhA1TOC+0lngakowof2C3/28z9pmUp50iK9V0BqgPJrV52qCKzz5t4VCovMXfF6014De2pr52qxS9/3ZWr3wRBpD546uPmip6Fd2Ut+VPjEQMkRMK/NPRNtb5hroEYOclyB4xfI5mQn2voiJhxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqhCuhTL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqhCuhTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774798833; x=1806334833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rEy06HLBQUOgMhrJNTJps6KmvYiEVOmUdAqT+9w0ZJI=;
  b=MqhCuhTLHT+o1Cfohav3gCkFgRuZFEiM4tVNrdheFQG96mNG8Nyovsau
   S0e52//DVUcb5PJZ06Z3utwVSq/sOyyHW7uQzgAshWduRf6tKbxFTnBZO
   IsO5SnFzljUyB2NwXT8VVslJ+RLh8kX/lN1UBqKpfoYlztNsRE96RJiBv
   dGr6DwAKS4Tn4Cv2QlvRkM+vVqlty4VKs9r0VbGI3zAm9PZjxCmesmYwN
   ao3A2FQ4m8tnvMCOLU4X31ROCpI70my9xy2sIYfcauUmckLeG/UMWKBYI
   ueFCmb6DK88LK9I/tFaB/KF3loJBN3UU7h3s/tGWkBMnH5mkobO797hd5
   w==;
X-CSE-ConnectionGUID: 7TwXKhbOSUuAmm9tmc8HXg==
X-CSE-MsgGUID: KyauKVJxRbm9LMhU8QkESA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79406430"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="79406430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 08:40:33 -0700
X-CSE-ConnectionGUID: wWJyiKuvS0KHpvfvvPbiOw==
X-CSE-MsgGUID: wXVnX3M1Rfe/nhvgoBdFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="220959688"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Mar 2026 08:40:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6sFY-00000000CVJ-2GQ9;
	Sun, 29 Mar 2026 15:40:28 +0000
Date: Sun, 29 Mar 2026 23:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Message-ID: <202603292342.zguwE4It-lkp@intel.com>
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
In-Reply-To: <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
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
[also build test WARNING on clk/clk-next linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/clk-renesas-rzg2l-Drop-a-check-in-rzg3s_cpg_pll_clk_recalc_rate/20260329-042328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20260326110648.29389-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: nios2-randconfig-r061-20260329 (https://download.01.org/0day-ci/archive/20260329/202603292342.zguwE4It-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603292342.zguwE4It-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/rzg2l-cpg.c:1222:52-58: opportunity for str_enable_disable(enable)

vim +1222 drivers/clk/renesas/rzg2l-cpg.c

b86e61ba2b0a5ed Biju Das 2026-03-26  1195  
b86e61ba2b0a5ed Biju Das 2026-03-26  1196  static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
b86e61ba2b0a5ed Biju Das 2026-03-26  1197  {
b86e61ba2b0a5ed Biju Das 2026-03-26  1198  	struct pll_clk *pll_clk = to_pll(hw);
b86e61ba2b0a5ed Biju Das 2026-03-26  1199  	struct rzg2l_cpg_priv *priv = pll_clk->priv;
b86e61ba2b0a5ed Biju Das 2026-03-26  1200  	u32 stby_offset, mon_offset;
b86e61ba2b0a5ed Biju Das 2026-03-26  1201  	u32 val, mon_val;
b86e61ba2b0a5ed Biju Das 2026-03-26  1202  	int ret;
b86e61ba2b0a5ed Biju Das 2026-03-26  1203  
b86e61ba2b0a5ed Biju Das 2026-03-26  1204  	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
b86e61ba2b0a5ed Biju Das 2026-03-26  1205  	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
b86e61ba2b0a5ed Biju Das 2026-03-26  1206  
b86e61ba2b0a5ed Biju Das 2026-03-26  1207  	if (enable) {
b86e61ba2b0a5ed Biju Das 2026-03-26  1208  		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
b86e61ba2b0a5ed Biju Das 2026-03-26  1209  		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
b86e61ba2b0a5ed Biju Das 2026-03-26  1210  	} else {
b86e61ba2b0a5ed Biju Das 2026-03-26  1211  		val = RZG3L_PLL_STBY_RESETB_WEN;
b86e61ba2b0a5ed Biju Das 2026-03-26  1212  		mon_val = 0;
b86e61ba2b0a5ed Biju Das 2026-03-26  1213  	}
b86e61ba2b0a5ed Biju Das 2026-03-26  1214  
b86e61ba2b0a5ed Biju Das 2026-03-26  1215  	writel(val, priv->base + stby_offset);
b86e61ba2b0a5ed Biju Das 2026-03-26  1216  
b86e61ba2b0a5ed Biju Das 2026-03-26  1217  	/* ensure PLL is in normal/stanby mode */
b86e61ba2b0a5ed Biju Das 2026-03-26  1218  	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
b86e61ba2b0a5ed Biju Das 2026-03-26  1219  					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
b86e61ba2b0a5ed Biju Das 2026-03-26  1220  					10, 100);
b86e61ba2b0a5ed Biju Das 2026-03-26  1221  	if (ret)
b86e61ba2b0a5ed Biju Das 2026-03-26 @1222  		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
b86e61ba2b0a5ed Biju Das 2026-03-26  1223  			"enable" : "disable", stby_offset, hw->clk);
b86e61ba2b0a5ed Biju Das 2026-03-26  1224  
b86e61ba2b0a5ed Biju Das 2026-03-26  1225  	return ret;
b86e61ba2b0a5ed Biju Das 2026-03-26  1226  }
b86e61ba2b0a5ed Biju Das 2026-03-26  1227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
