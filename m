Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB978190462
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014486; cv=none; b=mv1zMpxcAZXNOFhpQm1F2uB744MBLs/p7hz6XfLexSfth/axBf+6J0shjK4XCPpPHkMWVmbROTX4jkwoPxIMUJ1L1KH2TAlfCbDdaVTkQDGewzKzrJepXdrhD6ThP5QIGGyQiK2oaqWTFzNibXb47/yNEXjXRiKUnBgZhHeTMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014486; c=relaxed/simple;
	bh=rZlwErZxcaZKB5seig8tqiYetwBOGEzCdLgNsYuSnSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqPt7yl2kp+5RtAjylmR+XtdOBW2NgkYgmrY0ZK9yS1QmhwruKAto4M7H0LWD2jEWJ3pfOa0rNiPGbKC5MF+EqNcWNgVAZqnr7PzWjZSPvdwQRL0XTZGGTe+pTpbkSJOIvwCb5wZ16IkXQLcCV97n/P+htFMmKOubhTlnL0LgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUwTLrVA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUwTLrVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792014485; x=1823550485;
  h=date:from:to:cc:subject:message-id;
  bh=rZlwErZxcaZKB5seig8tqiYetwBOGEzCdLgNsYuSnSc=;
  b=dUwTLrVArKN9XHQz5QhVZixm0MUOQsX0z5hlraSyPC82fZr+BIj/thkd
   Aqrwd43PrTQt8SACT/uADu5iOzRdKpIg5oS3pzR3yI7dNKJBkS/cRq80u
   gPI4l4w5x8vRIepJwJx2xoefDUaMxQpQw8aC03YKmGUPgz0CR+nhw0c1X
   40uoUYflzrMoGRcxwFEKYjrO0hilD2iTb3HIxMYf5jPK5uOE53nhS6Po3
   1rzMcg8WtuGhmwXYHV+hgAuoByGP6krYVNGZmq37V3ivQewFJ7kbgqr5q
   yi+9/GS1JD0+vCfYir4YkmL+dAkEa9SDnO3bR8n0JjVAnhSrNIdD+BNv1
   A==;
X-CSE-ConnectionGUID: YD+J128XRmesxMPP1aLZ7Q==
X-CSE-MsgGUID: 6Rfq4I59TdWLkVMZuuoOuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="663637"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="663637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 14:48:04 -0700
X-CSE-ConnectionGUID: JbaXMOVtQCqd1889GGuy8w==
X-CSE-MsgGUID: eqpJWigIQZu/k+pox/3Pkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1499740"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2026 14:48:03 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH6pM-00000000BJf-488P;
	Wed, 14 Oct 2026 21:48:00 +0000
Date: Wed, 14 Oct 2026 23:47:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-5.15-2025-07 2/2]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2044:2-8: preceding lock
 on line 1983
Message-ID: <202610142346.N4lhdzz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-07
head:   46c96f2b3074c362a75032e50d95ec77b346008b
commit: 89788cd9824c28ffcdea40232c458233353d1896 [2/2] drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
:::::: branch date: 25 hours ago
:::::: commit date: 2 years, 4 months ago
config: x86_64-randconfig-2104-20261014 (https://download.01.org/0day-ci/archive/20261014/202610142346.N4lhdzz4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 13bbb29ea2c939629201dc70ce350cf27ad3e8d4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610142346.N4lhdzz4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2044:2-8: preceding lock on line 1983
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2044:2-8: preceding lock on line 2019

vim +2044 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1966  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1967  static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1968  				    struct drm_bridge_state *bridge_state)
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1969  {
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1970  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1971  	struct drm_atomic_state *state = bridge_state->base.state;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1972  	struct cdns_mhdp_bridge_state *mhdp_state;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1973  	struct drm_crtc_state *crtc_state;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1974  	struct drm_connector *connector;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1975  	struct drm_connector_state *conn_state;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1976  	struct drm_bridge_state *new_state;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1977  	const struct drm_display_mode *mode;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1978  	u32 resp;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1979  	int ret;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1980  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1981  	dev_dbg(mhdp->dev, "bridge enable\n");
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1982  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18 @1983  	mutex_lock(&mhdp->link_mutex);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1984  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1985  	if (mhdp->plugged && !mhdp->link_up) {
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1986  		ret = cdns_mhdp_link_up(mhdp);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1987  		if (ret < 0)
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1988  			goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1989  	}
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1990  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1991  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1992  		mhdp->info->ops->enable(mhdp);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1993  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1994  	/* Enable VIF clock for stream 0 */
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1995  	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1996  	if (ret < 0) {
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1997  		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1998  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  1999  	}
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2000  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2001  	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2002  			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2003  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2004  	connector = drm_atomic_get_new_connector_for_encoder(state,
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2005  							     bridge->encoder);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2006  	if (WARN_ON(!connector))
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2007  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2008  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2009  	conn_state = drm_atomic_get_new_connector_state(state, connector);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2010  	if (WARN_ON(!conn_state))
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2011  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2012  
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2013  	if (mhdp->hdcp_supported &&
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2014  	    mhdp->hw_state == MHDP_HW_READY &&
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2015  	    conn_state->content_protection ==
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2016  	    DRM_MODE_CONTENT_PROTECTION_DESIRED) {
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2017  		mutex_unlock(&mhdp->link_mutex);
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2018  		cdns_mhdp_hdcp_enable(mhdp, conn_state->hdcp_content_type);
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2019  		mutex_lock(&mhdp->link_mutex);
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2020  	}
6a3608eae6d33a4 Parshuram Thombare 2021-04-10  2021  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2022  	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2023  	if (WARN_ON(!crtc_state))
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2024  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2025  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2026  	mode = &crtc_state->adjusted_mode;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2027  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2028  	new_state = drm_atomic_get_new_bridge_state(state, bridge);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2029  	if (WARN_ON(!new_state))
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2030  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2031  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2032  	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2033  				    mhdp->link.rate)) {
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2034  		ret = -EINVAL;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2035  		goto out;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2036  	}
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2037  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2038  	cdns_mhdp_sst_enable(mhdp, mode);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2039  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2040  	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2041  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2042  	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
89788cd9824c28f Aleksandr Mishin   2024-04-08  2043  	if (!mhdp_state->current_mode)
89788cd9824c28f Aleksandr Mishin   2024-04-08 @2044  		return;
89788cd9824c28f Aleksandr Mishin   2024-04-08  2045  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2046  	drm_mode_set_name(mhdp_state->current_mode);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2047  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2048  	dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2049  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2050  	mhdp->bridge_enabled = true;
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2051  
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2052  out:
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2053  	mutex_unlock(&mhdp->link_mutex);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2054  	if (ret < 0)
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2055  		schedule_work(&mhdp->modeset_retry_work);
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2056  }
fb43aa0acdfd600 Swapnil Jakhade    2020-09-18  2057  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
