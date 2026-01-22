Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97138B7A4
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048320; cv=none; b=XuSek7XWjTM4ids1Q33yVpEBBFhPyEzLaWbI5S6VLBTnWYzJsVnB2bKosYCkO07MoRCu7gx5YDeFJCx2T7eyputWqa9yHF5yAHYZ+F8XYY9VjvSFj27ITu5TwUczxKDHT/ShqPaHQ1hB6F/8Ku/x8Os0QxRUzir4iI+/+um7w0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048320; c=relaxed/simple;
	bh=pMvFtkpKz8Kyxn68lwrhnMfM2JF/heiMXQSsNoOdFW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0SUwWKnNHvwxPNnJ2SgldlihVeLcmnIlWmhKPq/Br6XVDZowlJC5nkbSKeBoUwGk10QbcqbaVkvobOC/OI1+DTv34yvsQJB+N1ikrvPdaM5mt4FVJveiFsIUnQdBaBbmiV7d86RNwd3qntctw02OBMfuTztvN5Vhuh3+dTudd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzeanUaO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzeanUaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769048317; x=1800584317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMvFtkpKz8Kyxn68lwrhnMfM2JF/heiMXQSsNoOdFW4=;
  b=CzeanUaORHq6KBRJmAWa5fKLKm/PxTVxR/thbewNb4xDH9B9BfIbQuoY
   sLXAXDZM2Fbg3yBfOVY0+HeUNh2O2hLg4ic0e8E1+lLcz2DY2Ck2aE7Kr
   dTvtrQaCJQwM3rWRiTfukdCZ5cL2bd6b9x7WSNr8KwuoeapUOwI6McfAN
   LKZlYaMWaRPHDqLTAn0ok+8jo6nS8xMEV5FF2fyQ8H3hVCfZYM45ME0Rk
   y7BDjS7TRXF7KAdfHBWiwJKrFmX6Er3aD557kZhCR/32PB7RfNHETQjtB
   KrRbsFy4MpOCMh+rDLFydxsyvT5qLPo/hTV0zOvKmZB0baXQEk5jCzmuu
   g==;
X-CSE-ConnectionGUID: Sqv3l4yXRjav+C8ycbHifg==
X-CSE-MsgGUID: yE0Cc+UgTEmaF018qi5wjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80908478"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="80908478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:18:37 -0800
X-CSE-ConnectionGUID: 8Pzo1xG1SoG/ILkdEEc4DA==
X-CSE-MsgGUID: NH5hFIXfSZi74uQ9/ARmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="237872448"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2026 18:18:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikHB-00000000SJV-2l31;
	Thu, 22 Jan 2026 02:18:25 +0000
Date: Thu, 22 Jan 2026 10:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202601221036.J0kR78Uw-lkp@intel.com>
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
In-Reply-To: <20260121-rz-sdio-mux-v6-2-38aa39527928@solid-run.com>
References: <20260121-rz-sdio-mux-v6-2-38aa39527928@solid-run.com>
TO: Josua Mayer <josua@solid-run.com>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Vincent Mailhol <mailhol@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Peter Rosin <peda@axentia.se>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Roger Quadros <rogerq@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Janusz Krzysztofik <jmkrzyszt@gmail.com>
TO: Vignesh R <vigneshr@ti.com>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>
CC: Jon Nettleton <jon@solid-run.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>
CC: linux-can@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260121-173607
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260121-rz-sdio-mux-v6-2-38aa39527928%40solid-run.com
patch subject: [PATCH v6 2/7] mux: Add helper functions for getting optional and selected mux-state
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601221036.J0kR78Uw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601221036.J0kR78Uw-lkp@intel.com/

New smatch warnings:
drivers/mux/core.c:776 __devm_mux_state_get() warn: passing zero to 'PTR_ERR'
drivers/mux/core.c:796 __devm_mux_state_get() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
drivers/mux/core.c:722 mux_state_get() warn: passing zero to 'ERR_CAST'

vim +/PTR_ERR +776 drivers/mux/core.c

0610cc3159b786 Josua Mayer       2026-01-21  749  
0610cc3159b786 Josua Mayer       2026-01-21  750  /**
0610cc3159b786 Josua Mayer       2026-01-21  751   * __devm_mux_state_get() - Get the optional mux-state for a device,
0610cc3159b786 Josua Mayer       2026-01-21  752   *			    with resource management.
0610cc3159b786 Josua Mayer       2026-01-21  753   * @dev: The device that needs a mux-state.
0610cc3159b786 Josua Mayer       2026-01-21  754   * @mux_name: The name identifying the mux-state.
0610cc3159b786 Josua Mayer       2026-01-21  755   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
0610cc3159b786 Josua Mayer       2026-01-21  756   * @init: Optional function pointer for mux-state object initialisation.
0610cc3159b786 Josua Mayer       2026-01-21  757   * @exit: Optional function pointer for mux-state object cleanup on release.
0610cc3159b786 Josua Mayer       2026-01-21  758   *
0610cc3159b786 Josua Mayer       2026-01-21  759   * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
0610cc3159b786 Josua Mayer       2026-01-21  760   */
0610cc3159b786 Josua Mayer       2026-01-21  761  static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
0610cc3159b786 Josua Mayer       2026-01-21  762  					      bool optional,
0610cc3159b786 Josua Mayer       2026-01-21  763  					      int (*init)(struct mux_state *mstate),
0610cc3159b786 Josua Mayer       2026-01-21  764  					      int (*exit)(struct mux_state *mstate))
0610cc3159b786 Josua Mayer       2026-01-21  765  {
0610cc3159b786 Josua Mayer       2026-01-21  766  	struct devm_mux_state_state *devm_state;
0610cc3159b786 Josua Mayer       2026-01-21  767  	struct mux_state *mstate;
0610cc3159b786 Josua Mayer       2026-01-21  768  	int ret;
84564481bc4520 Aswath Govindraju 2022-01-07  769  
0610cc3159b786 Josua Mayer       2026-01-21  770  	devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
0610cc3159b786 Josua Mayer       2026-01-21  771  	if (!devm_state)
0610cc3159b786 Josua Mayer       2026-01-21  772  		return ERR_PTR(-ENOMEM);
0610cc3159b786 Josua Mayer       2026-01-21  773  
0610cc3159b786 Josua Mayer       2026-01-21  774  	mstate = mux_state_get(dev, mux_name, optional);
0610cc3159b786 Josua Mayer       2026-01-21  775  	if (IS_ERR_OR_NULL(mstate)) {
0610cc3159b786 Josua Mayer       2026-01-21 @776  		ret = PTR_ERR(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  777  		goto err_mux_state_get;
0610cc3159b786 Josua Mayer       2026-01-21  778  	}
0610cc3159b786 Josua Mayer       2026-01-21  779  
0610cc3159b786 Josua Mayer       2026-01-21  780  	if (init) {
0610cc3159b786 Josua Mayer       2026-01-21  781  		ret = init(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  782  		if (ret)
0610cc3159b786 Josua Mayer       2026-01-21  783  			goto err_mux_state_init;
0610cc3159b786 Josua Mayer       2026-01-21  784  	}
0610cc3159b786 Josua Mayer       2026-01-21  785  
0610cc3159b786 Josua Mayer       2026-01-21  786  	devm_state->mstate = mstate;
0610cc3159b786 Josua Mayer       2026-01-21  787  	devm_state->exit = exit;
0610cc3159b786 Josua Mayer       2026-01-21  788  	devres_add(dev, devm_state);
0610cc3159b786 Josua Mayer       2026-01-21  789  
0610cc3159b786 Josua Mayer       2026-01-21  790  	return mstate;
0610cc3159b786 Josua Mayer       2026-01-21  791  
0610cc3159b786 Josua Mayer       2026-01-21  792  err_mux_state_init:
84564481bc4520 Aswath Govindraju 2022-01-07  793  	mux_state_put(mstate);
0610cc3159b786 Josua Mayer       2026-01-21  794  err_mux_state_get:
0610cc3159b786 Josua Mayer       2026-01-21  795  	devres_free(devm_state);
0610cc3159b786 Josua Mayer       2026-01-21 @796  	return ERR_PTR(ret);
84564481bc4520 Aswath Govindraju 2022-01-07  797  }
84564481bc4520 Aswath Govindraju 2022-01-07  798  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
