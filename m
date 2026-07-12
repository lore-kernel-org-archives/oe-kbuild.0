Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6739A061
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783864600; cv=none; b=Ryj08GPfxhUCJyGQx7fAMV4OtIT/hOVaTFjHT9o7VpxfpfOqvCYdOYpJXZQxSGtxK8uh6ZgnMCEhOJsibnODR7k5OjUUui7dtfNPzt7as5uyW73bZNKtEDNHwdBf3UjBv0+kq4WosdjKrGollK/OS4Opo1hbKLg4wEGbT9qRbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783864600; c=relaxed/simple;
	bh=PRwVUH7KXTrisca9zvL3yI2zW7Wh+Sc/8x4zlKy4DYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jnUb1X1/5KaiY32ygZ98BVAuAFN0kHqtJJfcyLXs/wE5Rwg1f/M3KO3vhVyPReFmO+uPRhamRLLJmoW55bxOaBoSLScV14QdOGNL/vgD5Pc2OEHKCIDlhIyM412CKHHJcyrCQIqk4FDaHW8/f6XgIL2BmX2K3GMYmcoOewdU/Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5o9O+uU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5o9O+uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783864597; x=1815400597;
  h=date:from:to:cc:subject:message-id;
  bh=PRwVUH7KXTrisca9zvL3yI2zW7Wh+Sc/8x4zlKy4DYk=;
  b=N5o9O+uU4wY6pU3MrL6o8jh6TDRKN6hjCQUMQvyqhE9H37xevkFkybqn
   GOt/kVuZ5ZvZ0dIYsBDEQ3n1BFN6yoVx1YqzzTbZjCYAWoXit2815t9Z7
   VnWC8L/bFT186Ii/9661IssrC2FjWGN2GvyERxAUANS9dGxDLO468eorb
   ghf5eY5a+fljCKoQ9QyWE3oikrSHZAPkYMdxK8fdTcOkCtVEbelPXsPke
   kkpRYN3HeKCxkBJZypm00TKQcyzWLyjd6vAPlBNmiefsfBvGIWjw1Ba2x
   hq7xz5cbuHrnMX0rASFvgK6WfFCQm8297+xs+9Ch/6JSR8YqgQ9J2qq9H
   Q==;
X-CSE-ConnectionGUID: MaYWgbnmT5y88wR/Qq07lA==
X-CSE-MsgGUID: I0u2TBykRk+1uoFhBeBWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110037621"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="110037621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 06:56:36 -0700
X-CSE-ConnectionGUID: 0aghXkhNQsOEnH/9XLCgDw==
X-CSE-MsgGUID: UqzhSQXKT2GZvZEd0m5oWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251350877"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jul 2026 06:56:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiufZ-00000000KtE-0oIr;
	Sun, 12 Jul 2026 13:56:33 +0000
Date: Sun, 12 Jul 2026 21:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/clk/renesas/rzg2l-cpg.c:1222:52-58: opportunity for
 str_enable_disable(enable)
Message-ID: <202607122044.E6IpiczG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: 78db1faa6b681da20ec167268b28778ebb0f98b7 clk: renesas: rzg2l: Add support for enabling PLLs
date:   3 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r062-20260712 (https://download.01.org/0day-ci/archive/20260712/202607122044.E6IpiczG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 78db1faa6b68 ("clk: renesas: rzg2l: Add support for enabling PLLs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607122044.E6IpiczG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/rzg2l-cpg.c:1222:52-58: opportunity for str_enable_disable(enable)

vim +1222 drivers/clk/renesas/rzg2l-cpg.c

78db1faa6b681d Biju Das 2026-03-26  1195  
78db1faa6b681d Biju Das 2026-03-26  1196  static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
78db1faa6b681d Biju Das 2026-03-26  1197  {
78db1faa6b681d Biju Das 2026-03-26  1198  	struct pll_clk *pll_clk = to_pll(hw);
78db1faa6b681d Biju Das 2026-03-26  1199  	struct rzg2l_cpg_priv *priv = pll_clk->priv;
78db1faa6b681d Biju Das 2026-03-26  1200  	u32 stby_offset, mon_offset;
78db1faa6b681d Biju Das 2026-03-26  1201  	u32 val, mon_val;
78db1faa6b681d Biju Das 2026-03-26  1202  	int ret;
78db1faa6b681d Biju Das 2026-03-26  1203  
78db1faa6b681d Biju Das 2026-03-26  1204  	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
78db1faa6b681d Biju Das 2026-03-26  1205  	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
78db1faa6b681d Biju Das 2026-03-26  1206  
78db1faa6b681d Biju Das 2026-03-26  1207  	if (enable) {
78db1faa6b681d Biju Das 2026-03-26  1208  		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
78db1faa6b681d Biju Das 2026-03-26  1209  		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
78db1faa6b681d Biju Das 2026-03-26  1210  	} else {
78db1faa6b681d Biju Das 2026-03-26  1211  		val = RZG3L_PLL_STBY_RESETB_WEN;
78db1faa6b681d Biju Das 2026-03-26  1212  		mon_val = 0;
78db1faa6b681d Biju Das 2026-03-26  1213  	}
78db1faa6b681d Biju Das 2026-03-26  1214  
78db1faa6b681d Biju Das 2026-03-26  1215  	writel(val, priv->base + stby_offset);
78db1faa6b681d Biju Das 2026-03-26  1216  
78db1faa6b681d Biju Das 2026-03-26  1217  	/* ensure PLL is in normal/standby mode */
78db1faa6b681d Biju Das 2026-03-26  1218  	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
78db1faa6b681d Biju Das 2026-03-26  1219  					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
78db1faa6b681d Biju Das 2026-03-26  1220  					10, 100);
78db1faa6b681d Biju Das 2026-03-26  1221  	if (ret)
78db1faa6b681d Biju Das 2026-03-26 @1222  		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
78db1faa6b681d Biju Das 2026-03-26  1223  			"enable" : "disable", stby_offset, hw->clk);
78db1faa6b681d Biju Das 2026-03-26  1224  
78db1faa6b681d Biju Das 2026-03-26  1225  	return ret;
78db1faa6b681d Biju Das 2026-03-26  1226  }
78db1faa6b681d Biju Das 2026-03-26  1227  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
