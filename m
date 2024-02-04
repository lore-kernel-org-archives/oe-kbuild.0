Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DB8813
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707033628; cv=none; b=P3DIOpnSvPbvJsyNpUJatI3c2Ndo6QL10ICGQzzKTP+eXtNrFBl9qAjnVRgqnCwHzPcL7U4jGnmFjvZcWhYzaJT9+aSF+6LcYhsse4WkGMKk6XwF+ZLjQP7OJ64GOceRJu1KmivrfUx7uBrW1OEyjHjLPO8+aJexbSs/Roe5dR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707033628; c=relaxed/simple;
	bh=vdnV6JrcoUiUwitpzlCYL3MrcT98WrtsBJZTc0x5/r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QJdrPZ5D8JEwE6XHjhxYs9mEp3RYnoXwaskPk9jr97XRFzu6jXa9UTXjvdO6B1Z3Cf6R68uH5dLyAqlnIyMCVxinVpwJYrkO5OFYMgrCQ3HXviNmQEfILuPmtZsoB6pHO0ZMmNOoYdvN49XKCMCibi8M8OE25gOJOpXnakeNdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6MRQKWA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6MRQKWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707033625; x=1738569625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vdnV6JrcoUiUwitpzlCYL3MrcT98WrtsBJZTc0x5/r0=;
  b=j6MRQKWAvvec42ZWIbbvKXo74jYuaDbyuxhflCGAvqjYoXue5Fxha0vB
   LpHfLc98Ko2kuBMmFVp0lHqJzLNzMJG63+AMkhpbo7WKjJKF1Y/r4K0tK
   2fe+dyAWluVufcSvs5JiE10pP6nN0PSlS4/cZ8Qa/hIUUYHmintKtckWy
   KxZWJ2FqY7bmJsp2DaSG6Z93snOudcOMzjqDXW2cqgg+LNJdhAo7SOC5n
   DXVvqamXjxtacAdqJiWzTpLtgPg5UDmltf02lFfkTHfq0Z0T2JQ0sKI0H
   MId0rKA1hmBlM2wL+OHwy9KDDhodfKTkmNPfM4sYiZRW6E5fclkBROvpQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="532176"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="532176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 00:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5067625"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 00:00:23 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWXQK-00068q-2k;
	Sun, 04 Feb 2024 08:00:20 +0000
Date: Sun, 4 Feb 2024 15:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [plbossart-sound:fix/sdw-jd 6/12] drivers/soundwire/intel.c:448
 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.
Message-ID: <202402041508.xKhlqGcY-lkp@intel.com>
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
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound fix/sdw-jd
head:   3e0ec7682118696556df190024c476ad3ce3909f
commit: bb96c1f7a330eab199937c37611f14ff579cd2f5 [6/12] soundwire: intel: add support for MeteorLake additional clocks
:::::: branch date: 11 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041508.xKhlqGcY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402041508.xKhlqGcY-lkp@intel.com/

smatch warnings:
drivers/soundwire/intel.c:448 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.

vim +448 drivers/soundwire/intel.c

1e76de2e5dfeff Pierre-Louis Bossart 2023-03-14  337  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  338  static int intel_link_power_up(struct sdw_intel *sdw)
bc8729476a537f Pierre-Louis Bossart 2022-09-20  339  {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  340  	unsigned int link_id = sdw->instance;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  341  	void __iomem *shim = sdw->link_res->shim;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  342  	u32 *shim_mask = sdw->link_res->shim_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  343  	struct sdw_bus *bus = &sdw->cdns.bus;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  344  	struct sdw_master_prop *prop = &bus->prop;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  345  	u32 spa_mask, cpa_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  346  	u32 link_control;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  347  	int ret = 0;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  348  	u32 clock_source;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  349  	u32 syncprd;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  350  	u32 sync_reg;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  351  	bool lcap_mlcs;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  352  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  353  	mutex_lock(sdw->link_res->shim_lock);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  354  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  355  	/*
bc8729476a537f Pierre-Louis Bossart 2022-09-20  356  	 * The hardware relies on an internal counter, typically 4kHz,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  357  	 * to generate the SoundWire SSP - which defines a 'safe'
bc8729476a537f Pierre-Louis Bossart 2022-09-20  358  	 * synchronization point between commands and audio transport
bc8729476a537f Pierre-Louis Bossart 2022-09-20  359  	 * and allows for multi link synchronization. The SYNCPRD value
bc8729476a537f Pierre-Louis Bossart 2022-09-20  360  	 * is only dependent on the oscillator clock provided to
bc8729476a537f Pierre-Louis Bossart 2022-09-20  361  	 * the IP, so adjust based on _DSD properties reported in DSDT
bc8729476a537f Pierre-Louis Bossart 2022-09-20  362  	 * tables. The values reported are based on either 24MHz
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  363  	 * (CNL/CML) or 38.4 MHz (ICL/TGL+). On MeteorLake additional
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  364  	 * frequencies are available with the MLCS clock source selection.
bc8729476a537f Pierre-Louis Bossart 2022-09-20  365  	 */
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  366  	lcap_mlcs = intel_readl(shim, SDW_SHIM_LCAP) & SDW_SHIM_LCAP_MLCS_MASK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  367  
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  368  	if (prop->mclk_freq % 6000000) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  369  		if (prop->mclk_freq % 2400000) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  370  			if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  371  				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  372  				clock_source = SDW_SHIM_MLCS_CARDINAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  373  			} else {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  374  				dev_err(sdw->cdns.dev, "%s: invalid clock configuration, mclk %d lcap_mlcs %d\n",
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  375  					__func__, prop->mclk_freq, lcap_mlcs);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  376  				return -EINVAL;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  377  			}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  378  		} else {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  379  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_38_4;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  380  			clock_source = SDW_SHIM_MLCS_XTAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  381  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  382  	} else {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  383  		if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  384  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_96;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  385  			clock_source = SDW_SHIM_MLCS_AUDIO_PLL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  386  		} else {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  387  			syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  388  			clock_source = SDW_SHIM_MLCS_XTAL_CLK;
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  389  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  390  	}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  391  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  392  	if (!*shim_mask) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  393  		dev_dbg(sdw->cdns.dev, "powering up all links\n");
bc8729476a537f Pierre-Louis Bossart 2022-09-20  394  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  395  		/* we first need to program the SyncPRD/CPU registers */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  396  		dev_dbg(sdw->cdns.dev,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  397  			"first link up, programming SYNCPRD\n");
bc8729476a537f Pierre-Louis Bossart 2022-09-20  398  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  399  		/* set SyncPRD period */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  400  		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  401  		u32p_replace_bits(&sync_reg, syncprd, SDW_SHIM_SYNC_SYNCPRD);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  402  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  403  		/* Set SyncCPU bit */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  404  		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  405  		intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  406  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  407  		/* Link power up sequence */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  408  		link_control = intel_readl(shim, SDW_SHIM_LCTL);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  409  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  410  		/* only power-up enabled links */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  411  		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, sdw->link_res->link_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  412  		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  413  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  414  		link_control |=  spa_mask;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  415  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  416  		ret = intel_set_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  417  		if (ret < 0) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  418  			dev_err(sdw->cdns.dev, "Failed to power up link: %d\n", ret);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  419  			goto out;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  420  		}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  421  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  422  		/* SyncCPU will change once link is active */
bc8729476a537f Pierre-Louis Bossart 2022-09-20  423  		ret = intel_wait_bit(shim, SDW_SHIM_SYNC,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  424  				     SDW_SHIM_SYNC_SYNCCPU, 0);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  425  		if (ret < 0) {
bc8729476a537f Pierre-Louis Bossart 2022-09-20  426  			dev_err(sdw->cdns.dev,
bc8729476a537f Pierre-Louis Bossart 2022-09-20  427  				"Failed to set SHIM_SYNC: %d\n", ret);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  428  			goto out;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  429  		}
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  430  
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  431  		/* update link clock if needed */
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  432  		if (lcap_mlcs) {
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  433  			link_control = intel_readl(shim, SDW_SHIM_LCTL);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  434  			u32p_replace_bits(&link_control, clock_source, SDW_SHIM_LCTL_MLCS_MASK);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  435  			intel_writel(shim, SDW_SHIM_LCTL, link_control);
bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  436  		}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  437  	}
bc8729476a537f Pierre-Louis Bossart 2022-09-20  438  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  439  	*shim_mask |= BIT(link_id);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  440  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  441  	sdw->cdns.link_up = true;
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  442  
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  443  	intel_shim_init(sdw);
b81bcdb424d05a Pierre-Louis Bossart 2022-09-20  444  
bc8729476a537f Pierre-Louis Bossart 2022-09-20  445  out:
bc8729476a537f Pierre-Louis Bossart 2022-09-20  446  	mutex_unlock(sdw->link_res->shim_lock);
bc8729476a537f Pierre-Louis Bossart 2022-09-20  447  
bc8729476a537f Pierre-Louis Bossart 2022-09-20 @448  	return ret;
bc8729476a537f Pierre-Louis Bossart 2022-09-20  449  }
bc8729476a537f Pierre-Louis Bossart 2022-09-20  450  

:::::: The code at line 448 was first introduced by commit
:::::: bc8729476a537ff372c33588189c6ef5b39ce081 soundwire: intel: move shim initialization before power up/down

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
