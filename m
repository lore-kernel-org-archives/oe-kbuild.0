Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D0060ED0
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Apr 2024 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713179706; cv=none; b=EDVD6exlQVp5kgpxaNeWzWaWvsKltswTw5swknDVvUyYri5jd52Lc1z882jq8dMWEKx9QB3vyrUe/456B8AbXcU4HzY/jQnmzvfw33Zz26uGT0KVVcTRoV57k/ij6YZnIe31WCB8WHZKmSTjiu8hiOFhfvYGxGpnytXygx6bbcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713179706; c=relaxed/simple;
	bh=/0Y2lBqlhlLZVrd0nMgOl9hotpETRJ44fH8xSq5x2Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReNtuZku7Z3R7UUPBH/a752g0ovAGHSWLiEox2bBeEe79S21/575EgF3uRmdTsYn7d5IGzjNUbXQSv+mczu7+nLTf6dZ/QgCEPh4PrN3K74Qg9yICgghNG3z6jL4hdlkLgY0WW6DB3WK/xC0uYT2q6TqfaD3knsZGJuja6rva0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNgsQOpF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNgsQOpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713179704; x=1744715704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0Y2lBqlhlLZVrd0nMgOl9hotpETRJ44fH8xSq5x2Tw=;
  b=WNgsQOpF4SbvrxyyuDwFbssnnWzFiDQxulto3fiRSe3pTY16Ur95fsnI
   RzBB7loyqUi/qKXWhVgWt1A1ZzNws+QcrMJKXLGX3HGJfrYMS+3K6gg36
   uRpHg2ybhsdTkt+ywSd8ZuaLF+pW0/mW2V62al9KFaJRFenLE6pH/No5a
   0vlmTO990FN/NMYgsX4Qaihuq6drOLxKNuYM0v3lsBLRta+EKG1WKqi5t
   bQzV6NUd370+GfD5LN/tCdXKPhY1DUzig6acH3rilCquy55m0zAOlafHx
   uqe2X7VALmtJgexogKcECJOMJvHClU/9PTz5JhucPvq0SwhwOd68wR/1T
   Q==;
X-CSE-ConnectionGUID: qJ2aIuCAT5mQVZS0lfwmfA==
X-CSE-MsgGUID: RHapRjReQTCkxOgnMHracg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12409036"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12409036"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:15:02 -0700
X-CSE-ConnectionGUID: dugwTEGwQxqVfmok/6giOA==
X-CSE-MsgGUID: XzttpDpDRHeIEgzTUTIRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26679896"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 04:15:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwKIb-00048u-0d;
	Mon, 15 Apr 2024 11:14:57 +0000
Date: Mon, 15 Apr 2024 19:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3684/6266]
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2074
 cdns_mhdp_atomic_enable() warn: inconsistent returns '&mhdp->link_mutex'.
Message-ID: <202404151943.eTnMyskc-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aleksandr Mishin <amishin@t-argos.ru>
CC: Robert Foss <rfoss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: 935a92a1c400285545198ca2800a4c6c519c650a [3684/6266] drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
:::::: branch date: 5 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151943.eTnMyskc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404151943.eTnMyskc-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2074 cdns_mhdp_atomic_enable() warn: inconsistent returns '&mhdp->link_mutex'.

vim +2074 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

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
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2002  	mutex_lock(&mhdp->link_mutex);
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
935a92a1c40028 Aleksandr Mishin   2024-04-08  2063  		return;
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
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18 @2074  		schedule_work(&mhdp->modeset_retry_work);
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2075  }
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2076  

:::::: The code at line 2074 was first introduced by commit
:::::: fb43aa0acdfd600c75b8c877bdf9f6e9893ffc9b drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge

:::::: TO: Swapnil Jakhade <sjakhade@cadence.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
