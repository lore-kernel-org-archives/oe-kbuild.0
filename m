Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881AE6AAD
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742662714; cv=none; b=h8UBZL+PIiwfXYYCUhUzbhFygwTjwtAzxeS487iOO1xkUSW4l2xhzuRvAIozcZjTPiTmyQgdAzDHrYe9dkZkppU174XICmU80uMZ1YKkAD+flOx0xZwkxEZeD/6rkXa8u9GpFeWTxRZEgxI7dzFKNEoLoLM9ZLphmeQBKtGaWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742662714; c=relaxed/simple;
	bh=j0GadwOaF1uVmBuGhuSDZahIDM/DzbxKsagJ/DFm+9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/Sw4qfjPH0H+MWHi7rw2/XCktgiAMgTbspBgeuHQ4oQe/I/GH7YKujlFjmJthp90hiuPpnAJ/SXgFW8FDIXDkbja1PTAuh/99r17Ur5spSOVl5bI/HC+dQxHOx5T+wjp25oTYxfuBmbdBlFktIb83l8XTBg5jE1dtu08OV80AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaHOqveM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaHOqveM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742662712; x=1774198712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0GadwOaF1uVmBuGhuSDZahIDM/DzbxKsagJ/DFm+9Q=;
  b=KaHOqveMHe0ryQ9UmtjwDbg1QEDsrDtclL3wvWtJouqnSDDpjqqbPoqO
   Q/AI1M1HjjYd+PRsAqQw3C+vqPWOrBMQiH/Mr6VJFhq+XxTqFpf8JPRgB
   cCWgYm91cz9jbIJX/XohPrjEYqvi2rZGgBGzpKXNAJJ4p+BNs/9CGPduc
   5xyNlsvLsn3JZUpPA0KmhGrpmRXbJAHanGdN30R2G+nY6D49MTqo4k1HD
   VyFI8ErWvI8nJXdt1OMVQubohf5ljHZKAxn/Zz9lY944qnRWrcOgDYT+F
   pPNRqtKNv+c2pce0Rgn5YTHVksxSxN58+1OMdIxZJ/1uAHwTRp3Czbpjr
   g==;
X-CSE-ConnectionGUID: aRzUluADTbuz/aKHxovSkw==
X-CSE-MsgGUID: 1InGAyYYQomfcsHauM8bng==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44072853"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="44072853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 09:58:32 -0700
X-CSE-ConnectionGUID: tooWJ/6jSluvSyt+lXeJ0w==
X-CSE-MsgGUID: fnRegGFaTXa805M3i9zUkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124441963"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Mar 2025 09:58:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw2AL-0002Hn-2Y;
	Sat, 22 Mar 2025 16:58:04 +0000
Date: Sun, 23 Mar 2025 00:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-msiof-2025-03-18-2 8/11]
 sound/soc/renesas/rcar/adg.c:423 rsnd_adg_clk_control() warn: 'adg->adg'
 from clk_prepare_enable() not released on lines: 423.
Message-ID: <202503230043.MWzWn8oQ-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: c88340e663e79b3431fbb6f7647c3d9b1f94b994 [8/11] ASoC: rsnd: enable to use "adg" clock
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230043.MWzWn8oQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503230043.MWzWn8oQ-lkp@intel.com/

New smatch warnings:
sound/soc/renesas/rcar/adg.c:423 rsnd_adg_clk_control() warn: 'adg->adg' from clk_prepare_enable() not released on lines: 423.

Old smatch warnings:
sound/soc/renesas/rcar/adg.c:436 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'

vim +423 sound/soc/renesas/rcar/adg.c

dfc9403b7c1f56 sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2013-07-21  377  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  378  int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  379  {
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  380  	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  381  	struct clk *clk;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  382  	int ret = 0, i;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  383  
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  384  	/* enable adg */
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  385  	if (enable) {
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  386  		ret = clk_prepare_enable(adg->adg);
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  387  		if (ret < 0)
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  388  			return ret;
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  389  	}
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  390  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  391  	for_each_rsnd_clkin(clk, adg, i) {
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  392  		if (enable) {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  393  			ret = clk_prepare_enable(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  394  
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  395  			/*
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  396  			 * We shouldn't use clk_get_rate() under
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  397  			 * atomic context. Let's keep it when
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  398  			 * rsnd_adg_clk_enable() was called
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  399  			 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  400  			if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  401  				break;
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  402  
4bbff16d26e83a sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2023-02-01  403  			adg->clkin_rate[i] = clk_get_rate(clk);
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  404  		} else {
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  405  			if (adg->clkin_rate[i])
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  406  				clk_disable_unprepare(clk);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  407  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  408  			adg->clkin_rate[i] = 0;
06e8f5c842f2db sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2019-08-06  409  		}
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  410  	}
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  411  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  412  	/*
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  413  	 * rsnd_adg_clk_enable() might return error (_disable() will not).
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  414  	 * We need to rollback in such case
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  415  	 */
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  416  	if (ret < 0)
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  417  		rsnd_adg_clk_disable(priv);
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09  418  
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  419  	/* disable adg */
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  420  	if (!enable)
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  421  		clk_disable_unprepare(adg->adg);
c88340e663e79b sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-03-18  422  
139fa599cea0fd sound/soc/renesas/rcar/adg.c Kuninori Morimoto 2025-01-09 @423  	return ret;
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  424  }
c2d3171847611e sound/soc/sh/rcar/adg.c      Kuninori Morimoto 2016-12-07  425  

:::::: The code at line 423 was first introduced by commit
:::::: 139fa599cea0fd9d38e00246ea9f79af6c59acbd ASoC: rsnd: check rsnd_adg_clk_enable() return value

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
