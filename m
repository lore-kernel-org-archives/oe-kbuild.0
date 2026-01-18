Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699931684BE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759451; cv=none; b=m55tf6+2On4/ZUEyrxpDZ5fnFLvPdqmYNs3ULE73wqjH+T7C/Yza01TVVLJeYKTZzktL8/mCySto3yOYqME14d477FZUugsJhbBk9/rRVdrtj8PvoSdLUYWEKQ7tWqj/mJBVriRL//O+x0m6ryOZfA9F+70B/Vcsm0LsmbmHxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759451; c=relaxed/simple;
	bh=0fxtDNMWyHlVYB0ffWHXKf1/Szd8JRWrctT8+PG/WVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gt79OdkRUCopDIViOX/D+eP3/oH8POahERIPuziVqXlSIGCANB81lx+RcbJK87pfoAasHYFx6+LkwSisirlwCDQJIsGqNv2RZnjgByE9RqoBlQXSRD/RCzhQzY0dthksOvjIfjvRTXbpJ3D6Ap4iRhZZFpnfgjYZhGnJhS7vM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL4Co+I2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL4Co+I2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768759449; x=1800295449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fxtDNMWyHlVYB0ffWHXKf1/Szd8JRWrctT8+PG/WVo=;
  b=IL4Co+I2tOmAZ7Vkmh7fbDRYHMrceU2YVxNt/OQbYQEVZH6rVEnmTeCm
   nFjM8BhTa5UW2r6nVoFcWZN5QTsxIo6D2pVhxhY9BQ7B3mISHh/c5RD/5
   BYesbr/bwkYb2lZmFvpJuuGEfFOV5h8m/AdKHbHxtyX7czLHrXTcu1WQj
   SGPMo4oMOJX9IBSlx0ckad/2CVR+k4Xhkd4l1Ni8NhQc00PEPctbFbH+V
   nFdFpqaqQZFGaU6OoHARuwb9YUsavQ+njl9SAHOa9Ucs0KJI0IXT1YBTy
   xkrJdT8Igapyo54NDK+QyT3slF3rMSEPzrXkJjEowPCoICO9Eux6zCXpa
   w==;
X-CSE-ConnectionGUID: NsIsMOprTsWxRVC8IfQ3Rg==
X-CSE-MsgGUID: LoNP2iRVTZSDGk5+gwYwnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80623351"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="80623351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 10:04:05 -0800
X-CSE-ConnectionGUID: 3TmFAtrMSDW+h7wMGV9fIA==
X-CSE-MsgGUID: xY17cavUQtySIe/v12EyWQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2026 10:04:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhX85-00000000N8i-1wjs;
	Sun, 18 Jan 2026 18:04:01 +0000
Date: Mon, 19 Jan 2026 02:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v5 2/7] mux: Add helper functions for getting optional
 and selected mux-state
Message-ID: <202601190136.Fpl1Voph-lkp@intel.com>
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
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/phy-can-transceiver-rename-temporary-helper-function-to-avoid-conflict/20260118-183905
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260118-rz-sdio-mux-v5-2-3c37e8872683%40solid-run.com
patch subject: [PATCH v5 2/7] mux: Add helper functions for getting optional and selected mux-state
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-054-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190136.Fpl1Voph-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601190136.Fpl1Voph-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mux/core.c:721:18-24: ERROR: reference preceded by free on line 720

vim +721 drivers/mux/core.c

a3b02a9c6591ce drivers/mux/mux-core.c Peter Rosin 2017-05-14  702  
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  703  /*
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  704   * mux_state_get() - Get the mux-state for a device.
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  705   * @dev: The device that needs a mux-state.
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  706   * @mux_name: The name identifying the mux-state.
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  707   *
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  708   * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  709   */
f7086d2a8ffae3 drivers/mux/core.c     Josua Mayer 2026-01-18  710  static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  711  {
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  712  	struct mux_state *mstate;
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  713  
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  714  	mstate = kzalloc(sizeof(*mstate), GFP_KERNEL);
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  715  	if (!mstate)
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  716  		return ERR_PTR(-ENOMEM);
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  717  
f7086d2a8ffae3 drivers/mux/core.c     Josua Mayer 2026-01-18  718  	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
f7086d2a8ffae3 drivers/mux/core.c     Josua Mayer 2026-01-18  719  	if (IS_ERR_OR_NULL(mstate->mux)) {
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07 @720  		kfree(mstate);
f7086d2a8ffae3 drivers/mux/core.c     Josua Mayer 2026-01-18 @721  		return ERR_CAST(mstate->mux);
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  722  	}
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  723  
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  724  	return mstate;
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  725  }
6632866df852bd drivers/mux/core.c     Peter Rosin 2022-01-07  726  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
