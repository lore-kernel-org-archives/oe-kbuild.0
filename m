Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ADA33ADB5
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196672; cv=none; b=DN1O9IsQk9JrFgELSFbnhsGgx1K6xmOUZ4a7AAFYABOkbUpC60xMCzGC/LETHIhliKRZh3NPqxilGaeNpDzVRpxSmfXhr2lq//jmTDsum5cuo5TCJKIXLwna/Jcrr60FnRSHvSb1gGSDK9u5gvHr9tuVyc11MXTeRTegQhl3blg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196672; c=relaxed/simple;
	bh=Te+7y8ExDxi4LceNqvBZHZqu0EyWuAjc7LQ4gOHejUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z+ETtwzqfs12cFDaq5s0Can31TMC82VoROEYWIYX9gYroRvVJBSjtbUXliYAjgpx5OvzupmnjreWdhIdznion/lP/8UiJpRq3XtEHB1VQyViHxHVCnSqwpIA1+9VdziwOwmes3x8+j4GMGBYGwGKJ+QGNNrZrLFB8+lI9pDpd5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrLwyp6c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrLwyp6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781196671; x=1812732671;
  h=date:from:to:cc:subject:message-id;
  bh=Te+7y8ExDxi4LceNqvBZHZqu0EyWuAjc7LQ4gOHejUs=;
  b=mrLwyp6cLRnQMkksALqvRFWXme85ye/rEpLQuAho+w/V0/LPgrlt9J0p
   xfD45kbm/WWdP890oRCIGdutceuRaDspV8KPI6lEdtO6lT3QSMPYo14+G
   ZP1MOjMmZ17zriSwz3mml7n3OcTGMIRqr3eWlMT8Mwen7AK/BYoJhBITb
   43gL6qY7UUeuCy53B8uASRxZ+FeCyniHCEZmKLIMJ/00zmH1lbrt1tGO2
   zl0fdHccUpSGttobW4izmPrf3SMYLthrM510Go5BWGsIdgKoJkznxD01U
   Q39ubdsAesnt2r9O+brM066ZJZBwJPAzb/5hGsgMkDaGnPZ9xq1cBM+rH
   A==;
X-CSE-ConnectionGUID: TkPFmdDUQpmwAJoqLkfbSA==
X-CSE-MsgGUID: gkeCfNI+TLeMTY9P0zEECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93123903"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93123903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:51:11 -0700
X-CSE-ConnectionGUID: qkw7v7n3RtuM/Uo5zFPuVQ==
X-CSE-MsgGUID: SFW7SpKiRDmRWmVOol+GfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246416789"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2026 09:51:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXicU-00000000NWC-0rYS;
	Thu, 11 Jun 2026 16:51:06 +0000
Date: Fri, 12 Jun 2026 00:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8891/13002]
 sound/soc/renesas/rcar/adg.c:523 rsnd_adg_clk_control() warn: 'clk' from
 clk_prepare_enable() not released on lines: 523.
Message-ID: <202606120053.A24i8uLb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: John Madieu <john.madieu.xa@bp.renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 47899d53f86f5ab8a65a8d7bfa53d4ba79fa9e82 [8891/13002] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
:::::: branch date: 25 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120053.A24i8uLb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606120053.A24i8uLb-lkp@intel.com/

New smatch warnings:
sound/soc/renesas/rcar/adg.c:523 rsnd_adg_clk_control() warn: 'clk' from clk_prepare_enable() not released on lines: 523.

Old smatch warnings:
sound/soc/renesas/rcar/adg.c:523 rsnd_adg_clk_control() warn: 'adg->adg' from clk_prepare_enable() not released on lines: 523.
sound/soc/renesas/rcar/adg.c:536 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'

vim +/clk +523 sound/soc/renesas/rcar/adg.c

47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  451  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  452  int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  453  {
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  454  	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  455  	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  456  	struct clk *clk;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  457  	int ret = 0, i;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  458  
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  459  	if (enable) {
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  460  		ret = clk_prepare_enable(adg->adg);
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  461  		if (ret < 0)
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  462  			return ret;
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  463  
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  464  		rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  465  		rsnd_mod_write(adg_mod, BRRA,  adg->brga);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  466  		rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  467  	}
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  468  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  469  	for_each_rsnd_clkin(clk, adg, i) {
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  470  		if (enable) {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  471  			ret = clk_prepare_enable(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  472  
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  473  			/*
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  474  			 * We shouldn't use clk_get_rate() under
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  475  			 * atomic context. Let's keep it when
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  476  			 * rsnd_adg_clk_enable() was called
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  477  			 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  478  			if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  479  				break;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  480  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  481  			adg->clkin_rate[i] = clk_get_rate(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  482  		} else {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  483  			if (adg->clkin_rate[i])
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  484  				clk_disable_unprepare(clk);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  485  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  486  			adg->clkin_rate[i] = 0;
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  487  		}
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  488  	}
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  489  
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  490  	/*
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  491  	 * rsnd_adg_clk_enable() might return error (_disable() will not).
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  492  	 * We need to rollback in such case
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  493  	 */
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  494  	/*
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  495  	 * RZ/G3E per-SSI ADG and SSIF supply clocks.
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  496  	 *
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  497  	 * Follow the same style as for_each_rsnd_clkin() above: on enable,
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  498  	 * try to prepare every clock and accumulate the error. On disable,
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  499  	 * unprepare every clock. Absent optional clocks are NULL, for
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  500  	 * which clk_prepare() and clk_unprepare() are no-ops.
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  501  	 */
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  502  	if (enable) {
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  503  		int sub_ret = rsnd_adg_ssi_clk_prepare(adg);
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  504  
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  505  		/* Preserve the first error from the clkin loop above. */
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  506  		if (sub_ret && !ret)
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  507  			ret = sub_ret;
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  508  	} else {
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  509  		rsnd_adg_ssi_clk_unprepare(adg);
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  510  	}
47899d53f86f5a sound/soc/renesas/rcar/adg.c John Madieu       2026-05-25  511  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  512  	/*
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  513  	 * rsnd_adg_clk_enable() might return error (_disable() will not).
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  514  	 * We need to rollback in such case
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  515  	 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  516  	if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  517  		rsnd_adg_clk_disable(priv);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  518  
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  519  	/* disable adg */
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  520  	if (!enable)
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  521  		clk_disable_unprepare(adg->adg);
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  522  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09 @523  	return ret;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  524  }
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  525  

:::::: The code at line 523 was first introduced by commit
:::::: 139fa599cea0fd9d38e00246ea9f79af6c59acbd ASoC: rsnd: check rsnd_adg_clk_enable() return value

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
