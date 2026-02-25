Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967B3D332F
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Feb 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034610; cv=none; b=fGYKbPYXcd+kXBXWycNEmtnBJvWfHZOmM6xND6nUa8nh2r7RhuSiiEabPzaiudQz4dpwJLuq4WkS6a80p/SDGyuNJzMZwmLoqN9iBDFH7a6CW6uQexr0RIpDXuK9yDwIXQh7ztB5CUtyEeWxdBiyiE9l4ZOjrYmev6yWvO9cZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034610; c=relaxed/simple;
	bh=QepE0mDW5d83K5rl+PTNtNuU6ntdcX+UsxunWgeyA08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c8RaZNx0FjqbrcC4uNV/aaeJyMMN8vKEYhTBAqO82Oljn+9MAoORog45ydcgeFGdO8dF7MU5k9dN1pe6KX9ZCTGXi7cF/QkhMCJeJZb5fm34ZPNEHN1GA/EixeWjPWy3tU3SKv6O25pPLx9hbzpCipH+xAI1eFK4Z5vvm0HNYxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNTDz90V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNTDz90V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772034608; x=1803570608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QepE0mDW5d83K5rl+PTNtNuU6ntdcX+UsxunWgeyA08=;
  b=iNTDz90Vg+1Y2/vMWvqIs3Gv/m3WxjWmgSzRK+/e/J3envpmF8UMxFvH
   AnYkvU2HNK71uiHMmvVexsENVtACoa6gjKV648ZkCVOYB7P9jqtuJsN2G
   S4u6bwdLNAHiy5v4EzoCsm5yAWFlH/C7sQWzgDawQBEbObXcQxHvox1M4
   co0awg+pXBFuz0kKnPQimX/Y7DBsmls8xa1EAh6icEc5/IUee+MxmjCxV
   Ku/GuJ3jJYiofXeFfsb9g8zjKp6jqH1boRUMEcj1u8/2XpEwC+Luki/Y2
   Odl9PvZB1xL/DNaXbBdM89rRClq+bojbAQaBlayeu5eCmdjMIpiO5wxl2
   A==;
X-CSE-ConnectionGUID: elKWBTTNRFGpVtgqei0qTw==
X-CSE-MsgGUID: TkFvbhkRQECwu7qjaoyADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="60649548"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="60649548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 07:50:07 -0800
X-CSE-ConnectionGUID: pLCBjeGwRnaEwGOnhDOwFA==
X-CSE-MsgGUID: kfIOF1OnQ2um1vo98plwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216152560"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2026 07:50:05 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvH8c-000000006LZ-3yqD;
	Wed, 25 Feb 2026 15:49:39 +0000
Date: Wed, 25 Feb 2026 23:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v10 3/9] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202602252310.2cVbnvYP-lkp@intel.com>
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
In-Reply-To: <20260225-rz-sdio-mux-v10-3-1ee44f2ea112@solid-run.com>
References: <20260225-rz-sdio-mux-v10-3-1ee44f2ea112@solid-run.com>
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
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>
CC: Jon Nettleton <jon@solid-run.com>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>
CC: linux-can@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: linux-i2c@vger.kernel.org

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260225-194325
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260225-rz-sdio-mux-v10-3-1ee44f2ea112%40solid-run.com
patch subject: [PATCH v10 3/9] mux: Add helper functions for getting optional and selected mux-state
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sparc-randconfig-r053-20260225 (https://download.01.org/0day-ci/archive/20260225/202602252310.2cVbnvYP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602252310.2cVbnvYP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mux/core.c:733:18-24: ERROR: reference preceded by free on line 732

vim +733 drivers/mux/core.c

a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin    2017-05-14  712  
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  713  /**
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  714   * mux_state_get() - Get the mux-state for a device.
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  715   * @dev: The device that needs a mux-state.
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  716   * @mux_name: The name identifying the mux-state.
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  717   * @optional: Whether to return NULL and silence errors when mux doesn't exist.
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  718   *
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  719   * Return: Pointer to the mux-state on success, an ERR_PTR with a negative errno on error,
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  720   * or NULL if optional is true and mux doesn't exist.
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  721   */
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  722  static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  723  {
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  724  	struct mux_state *mstate;
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  725  
bf4afc53b77aea drivers/mux/core.c     Linus Torvalds 2026-02-21  726  	mstate = kzalloc_obj(*mstate);
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  727  	if (!mstate)
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  728  		return ERR_PTR(-ENOMEM);
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  729  
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  730  	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  731  	if (IS_ERR(mstate->mux)) {
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07 @732  		kfree(mstate);
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25 @733  		return ERR_CAST(mstate->mux);
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  734  	} else if (optional && !mstate->mux) {
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  735  		kfree(mstate);
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  736  		return NULL;
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  737  	} else if (!mstate->mux) {
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  738  		kfree(mstate);
a67ef2fe0fda72 drivers/mux/core.c     Josua Mayer    2026-02-25  739  		return ERR_PTR(-ENOENT);
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  740  	}
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  741  
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  742  	return mstate;
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  743  }
6632866df852bd drivers/mux/core.c     Peter Rosin    2022-01-07  744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
