Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBE1F9F63
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131539; cv=none; b=WnXuIpNFZmvUTRcJ/URxFLNesfDfQdqmihnspqdiP7KdmP3Mi2ggofjjD57DmcUmv33iuPk69M8yDjonh/ApGcjUDMtiwILvhoRTo/0XbPmtMQOhrKMxa/ujPlKtyw0M/rEkCzAk3EDpbGUfc9fU4BfBTOwqsyW8wwR6qEc39lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131539; c=relaxed/simple;
	bh=WoGW2MXYj0QD3pkL8zaPmf8nxJ4r57/NeSqkEGkYHVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5mEC+Dxz2DL+WQg/0vTFyCbKsSusy+MPWgKZ1W943Eqh6JqGyPPaZve3ZwhiosuvcVNwVmJUu27mZXSZpguxJhzyLegxh7PdIdfBjvyXpSjrTHq/OR47a1XJSIMRCBedXvesyk4xZnSNPVFA4vZR0ZcK6dGBdAapnhMj9QQt/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myj6xhnP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myj6xhnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733131537; x=1764667537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoGW2MXYj0QD3pkL8zaPmf8nxJ4r57/NeSqkEGkYHVU=;
  b=myj6xhnPfO+qPi19m0SUqxuHdDyXLrxhx4IiW1p/ZA7uke1u6Hjl6YCI
   FiEj6dJzYrHMzcCs9npJU/zFJRMIzijUJkEFcuqCjV+87KFxaw5UQGdnQ
   hRg7uoRGubDK9Lg+CzOMm29FWsyY/bT1xTVxJpVO7+1QDuwsZ3jwL+sT4
   ugdF9F3uvf0QFo06khs3xwkqjuXYlFic4cA9gE/73K7EO3SS37xFDx2jl
   PaDeSvK4HbcQ3Go3ZJOdLXOGNM1uQI4sLdCFPiGeyAHCyBgTQt0yQ1Yv3
   lQuOxT6PPB++N3n71d8Z7ndmkiwbAiy5/Phg6Kjf+pjL+lyQ8QqemzAvL
   A==;
X-CSE-ConnectionGUID: Lw3gyK9MRb6vZMn06HLcJA==
X-CSE-MsgGUID: BaGbvuRCT0SPGQ40WIp7JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33443411"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33443411"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 01:25:33 -0800
X-CSE-ConnectionGUID: EkbkcMpvSPi3BoOnfCQU3w==
X-CSE-MsgGUID: gZFkuVkDTkiBPl3kP2JbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93892523"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 01:25:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI2gM-0002Ft-0W;
	Mon, 02 Dec 2024 09:25:30 +0000
Date: Mon, 2 Dec 2024 17:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2063:2-8:
 preceding lock on line 2002
Message-ID: <202412021715.xjsYGsdN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Aleksandr Mishin <amishin@t-argos.ru>
CC: Robert Foss <rfoss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 935a92a1c400285545198ca2800a4c6c519c650a drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r054-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021715.xjsYGsdN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412021715.xjsYGsdN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2063:2-8: preceding lock on line 2002
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2063:2-8: preceding lock on line 2038

vim +2063 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1985  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1986  static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1987  				    struct drm_bridge_state *bridge_state)
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1988  {
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1989  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1990  	struct drm_atomic_state *state = bridge_state->base.state;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1991  	struct cdns_mhdp_bridge_state *mhdp_state;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1992  	struct drm_crtc_state *crtc_state;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1993  	struct drm_connector *connector;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1994  	struct drm_connector_state *conn_state;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1995  	struct drm_bridge_state *new_state;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1996  	const struct drm_display_mode *mode;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1997  	u32 resp;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1998  	int ret;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  1999  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2000  	dev_dbg(mhdp->dev, "bridge enable\n");
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2001  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18 @2002  	mutex_lock(&mhdp->link_mutex);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2003  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2004  	if (mhdp->plugged && !mhdp->link_up) {
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2005  		ret = cdns_mhdp_link_up(mhdp);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2006  		if (ret < 0)
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2007  			goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2008  	}
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2009  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2010  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->enable)
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2011  		mhdp->info->ops->enable(mhdp);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2012  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2013  	/* Enable VIF clock for stream 0 */
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2014  	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2015  	if (ret < 0) {
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2016  		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2017  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2018  	}
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2019  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2020  	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2021  			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2022  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2023  	connector = drm_atomic_get_new_connector_for_encoder(state,
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2024  							     bridge->encoder);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2025  	if (WARN_ON(!connector))
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2026  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2027  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2028  	conn_state = drm_atomic_get_new_connector_state(state, connector);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2029  	if (WARN_ON(!conn_state))
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2030  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2031  
6a3608eae6d33a Parshuram Thombare 2021-04-10  2032  	if (mhdp->hdcp_supported &&
6a3608eae6d33a Parshuram Thombare 2021-04-10  2033  	    mhdp->hw_state == MHDP_HW_READY &&
6a3608eae6d33a Parshuram Thombare 2021-04-10  2034  	    conn_state->content_protection ==
6a3608eae6d33a Parshuram Thombare 2021-04-10  2035  	    DRM_MODE_CONTENT_PROTECTION_DESIRED) {
6a3608eae6d33a Parshuram Thombare 2021-04-10  2036  		mutex_unlock(&mhdp->link_mutex);
6a3608eae6d33a Parshuram Thombare 2021-04-10  2037  		cdns_mhdp_hdcp_enable(mhdp, conn_state->hdcp_content_type);
6a3608eae6d33a Parshuram Thombare 2021-04-10  2038  		mutex_lock(&mhdp->link_mutex);
6a3608eae6d33a Parshuram Thombare 2021-04-10  2039  	}
6a3608eae6d33a Parshuram Thombare 2021-04-10  2040  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2041  	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2042  	if (WARN_ON(!crtc_state))
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2043  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2044  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2045  	mode = &crtc_state->adjusted_mode;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2046  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2047  	new_state = drm_atomic_get_new_bridge_state(state, bridge);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2048  	if (WARN_ON(!new_state))
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2049  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2050  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2051  	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2052  				    mhdp->link.rate)) {
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2053  		ret = -EINVAL;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2054  		goto out;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2055  	}
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2056  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2057  	cdns_mhdp_sst_enable(mhdp, mode);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2058  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2059  	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2060  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2061  	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
935a92a1c40028 Aleksandr Mishin   2024-04-08  2062  	if (!mhdp_state->current_mode)
935a92a1c40028 Aleksandr Mishin   2024-04-08 @2063  		return;
935a92a1c40028 Aleksandr Mishin   2024-04-08  2064  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2065  	drm_mode_set_name(mhdp_state->current_mode);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2066  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2067  	dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2068  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2069  	mhdp->bridge_enabled = true;
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2070  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2071  out:
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2072  	mutex_unlock(&mhdp->link_mutex);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2073  	if (ret < 0)
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2074  		schedule_work(&mhdp->modeset_retry_work);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2075  }
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2076  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
