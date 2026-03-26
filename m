Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D2033ADB0
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526911; cv=none; b=uTSqlXzP8bm/w0Ecy3ok68m5PB6iWOaSaTWq4MLmMfzC+zNf8PfU0Siq03SWtNyECskMuSfyZcHliiSwPd4bieQTswFjm8MX0PsqouMHhGCisiDdKLIdtxy6BaBk/vV5Rp7dNSl9GozkOjWSBnRGHMo6KjMJXKJeNNtG2nHjJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526911; c=relaxed/simple;
	bh=EJ3PnYrmj1f8o1j+YEHp1ejHg19GNiCsj3gR3SpLRyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rXPqHhrwULZis029LjYUKZmzMZlZ9XO7UyIiONnEoeN1vSIIKFwsrOuDYC0HT++QxdgYQZJwgjX/h/CvkyPColwBwQa8aptnW7Xsn5GZq8AZndtvc8Ge5EORZAY+QSc7ijANXDLvnMC1vcaEe7svBacGoyZQseernoXn7jMBBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvJbeT7K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvJbeT7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774526907; x=1806062907;
  h=date:from:to:cc:subject:message-id;
  bh=EJ3PnYrmj1f8o1j+YEHp1ejHg19GNiCsj3gR3SpLRyw=;
  b=hvJbeT7Kyp4UmVc2oieibsk1Mkc7HSNW3JB/vLlmWQGI8PrLIiP5daXF
   6catP94jKzEDF7JN590NN+rOXRe6Agp8Sbmh8RZs3ohKq+RYrfzSJGWXr
   gyZH78On+vSCRJhjzbm9dIV/f4bIwkOF9e8gB8qwGtcSK4rtaLhUgsxPp
   7Ys+Ro5AW56Z2+1+sLiY5uXVtBCP3XBYr52WML139Wnt6B3nqp7tebnlA
   xV++99HMceOcPy0AAHu5aSw76QHN+Ayyh4CZVCi3It8X6Oj1J+Eqw53Gc
   lh6PniIpNhxfVAoTQAAihqG55gQWH3h1nIN+vsS3bGvCTr1a/0/4y15on
   g==;
X-CSE-ConnectionGUID: jfF24ad8Q5uGLkuN6MDRXA==
X-CSE-MsgGUID: VmvN6mvkR3CBmXrr7rGZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92963627"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="92963627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 05:08:26 -0700
X-CSE-ConnectionGUID: uGSkW+hYQSictkv7sv/Cjg==
X-CSE-MsgGUID: fvXTpgEiQR+5zYSDgJI18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="255484740"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2026 05:08:24 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5jVd-000000008pf-2dXB;
	Thu, 26 Mar 2026 12:08:21 +0000
Date: Thu, 26 Mar 2026 20:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/renesas/rcar/adg.c:431 rsnd_adg_clk_control()
 warn: 'adg->adg' from clk_prepare_enable() not released on lines: 431.
Message-ID: <202603261906.JNHLbEKn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: 0cc88846cbfb3018c036a20390acb1e35de03e1d ASoC: renesas: rsnd: enable to use "adg" clock
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r071-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261906.JNHLbEKn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603261906.JNHLbEKn-lkp@intel.com/

New smatch warnings:
sound/soc/renesas/rcar/adg.c:431 rsnd_adg_clk_control() warn: 'adg->adg' from clk_prepare_enable() not released on lines: 431.

Old smatch warnings:
sound/soc/renesas/rcar/adg.c:444 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'

vim +431 sound/soc/renesas/rcar/adg.c

dfc9403b7c1f56 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2013-07-21  381  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  382  int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  383  {
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  384  	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  385  	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  386  	struct clk *clk;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  387  	int ret = 0, i;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  388  
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  389  	if (enable) {
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  390  		ret = clk_prepare_enable(adg->adg);
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  391  		if (ret < 0)
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  392  			return ret;
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  393  
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  394  		rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  395  		rsnd_mod_write(adg_mod, BRRA,  adg->brga);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  396  		rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  397  	}
4acdf9aedd5624 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-08-22  398  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  399  	for_each_rsnd_clkin(clk, adg, i) {
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  400  		if (enable) {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  401  			ret = clk_prepare_enable(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  402  
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  403  			/*
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  404  			 * We shouldn't use clk_get_rate() under
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  405  			 * atomic context. Let's keep it when
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  406  			 * rsnd_adg_clk_enable() was called
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  407  			 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  408  			if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  409  				break;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  410  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  411  			adg->clkin_rate[i] = clk_get_rate(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  412  		} else {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  413  			if (adg->clkin_rate[i])
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  414  				clk_disable_unprepare(clk);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  415  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  416  			adg->clkin_rate[i] = 0;
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  417  		}
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  418  	}
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  419  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  420  	/*
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  421  	 * rsnd_adg_clk_enable() might return error (_disable() will not).
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  422  	 * We need to rollback in such case
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  423  	 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  424  	if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  425  		rsnd_adg_clk_disable(priv);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  426  
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  427  	/* disable adg */
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  428  	if (!enable)
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  429  		clk_disable_unprepare(adg->adg);
0cc88846cbfb30 sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-04-17  430  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09 @431  	return ret;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  432  }
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  433  

:::::: The code at line 431 was first introduced by commit
:::::: 139fa599cea0fd9d38e00246ea9f79af6c59acbd ASoC: rsnd: check rsnd_adg_clk_enable() return value

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
