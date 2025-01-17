Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5F1AA78D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737149578; cv=none; b=nSiWRtnwoWYecyw5p78kysHhHLcZlSGEoONKFhTuo/iCFNJcstvRh47QRxCEZolJufBvKjjcYB13M8X2veFCdhq5Mmr54Ei0zwG6d3askoj3M84gv/GaTt4JSySz8EYGywi0Txvoc6Ax2b3lndUkvp9wciPpQNSV0WXP5mKWwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737149578; c=relaxed/simple;
	bh=kUjl/MfKNKHYiQ++CVIujlShHqmacvaZSU+qlGRErjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gx5CU35ywkiwOLfX/2eG0Ir9ahybZzTRPc43uTvnERw+5ijxfndJ6PoRZx6Pwvb+rXHx3bPPgkNnOEDgQwqKcDSlINWkaI8u7rhdzv4iUT/fpuDJwIHBxgZTdRQBh+OFv7Rf9iMeh99H8WxLAeFKhv+NunJ6yuj7X6oxXA+DiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiYZXSWK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiYZXSWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737149577; x=1768685577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kUjl/MfKNKHYiQ++CVIujlShHqmacvaZSU+qlGRErjE=;
  b=KiYZXSWKLnrHzzaZDaWzi04ynpZd6FmoqTK90hdztNBv6UALIezXvpt9
   2Gzqd0eH+YXC86Hk2HzvvGynJORy6jYrj8BMLFuKhhcMWlAPQPS7UHy80
   iI3J6kk78yufDtgwgZFtmk1a97PLpJV30MUHF9XnFH2j/iahu4g0epLyT
   pZv/e6jqW/QJM0vfwziZDhhWwHuCvP2QjrDGXyU0cTTplOxfjfCHXqDy2
   9C80QxDhwDXcn90LbUM4WnuCgM0M/yi3+Y+2EbPmzqvTE4G9c3D69jrEL
   eB5gYscJeuMrjGfTAweoPABhR8MCzY7VJ63WNUszA4Gnr89WXDSmPbosA
   g==;
X-CSE-ConnectionGUID: sDCkJyphTaqH1iowY2fYQA==
X-CSE-MsgGUID: RyB3eJxnQhekrpcNvsdYoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48593891"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48593891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:32:57 -0800
X-CSE-ConnectionGUID: eKy4Ew9ZQfSS9nUa5CQy1w==
X-CSE-MsgGUID: +CgNiKvASnm7BN30lb1gCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106462554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2025 13:32:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtxC-000Tih-1J;
	Fri, 17 Jan 2025 21:32:34 +0000
Date: Sat, 18 Jan 2025 05:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wens:mtk-wip 26/48] drivers/gpu/drm/bridge/ite-it6505.c:3645
 it6505_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
Message-ID: <202501180556.ioJ3h9V5-lkp@intel.com>
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
TO: "Pin-yen Lin" <treapking@chromium.org>
CC: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: 5a3446d82f7c65f26ee4e81a9af77bb509a1d501 [26/48] drm/bridge: it6505: Register Type C mode switches
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180556.ioJ3h9V5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501180556.ioJ3h9V5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ite-it6505.c:3645 it6505_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()

vim +/port +3645 drivers/gpu/drm/bridge/ite-it6505.c

5a3446d82f7c65 Pin-yen Lin 2023-03-31  3640  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3641  static int it6505_typec_mux_set(struct typec_mux_dev *mux,
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3642  				struct typec_mux_state *state)
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3643  {
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3644  	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
5a3446d82f7c65 Pin-yen Lin 2023-03-31 @3645  	struct it6505 *it6505 = port->data;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3646  	struct device *dev = it6505->dev;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3647  	struct drm_dp_typec_switch_desc switch_desc = it6505->switch_desc;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3648  	bool old_dp_connected, new_dp_connected;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3649  	int ret = 0;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3650  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3651  	if (switch_desc.num_typec_switches == 1)
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3652  		return 0;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3653  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3654  	mutex_lock(&it6505->extcon_lock);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3655  	/*
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3656  	 * The completion is called in it6505_register_typec_switches even on
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3657  	 * errors, so it's safe to wait for completion without timeout.
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3658  	 */
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3659  	wait_for_completion(&it6505->mux_register);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3660  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3661  	/* Abort when the switches are unregistered. */
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3662  	if (!it6505->port_data) {
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3663  		ret = -EINVAL;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3664  		goto unlock;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3665  	}
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3666  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3667  	old_dp_connected = it6505->port_data[0].dp_connected ||
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3668  			   it6505->port_data[1].dp_connected;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3669  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3670  	it6505->port_data[port->port_num].dp_connected =
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3671  		state->alt &&
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3672  		state->alt->svid == USB_TYPEC_DP_SID &&
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3673  		state->alt->mode == USB_TYPEC_DP_MODE;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3674  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3675  	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3676  		it6505->port_data[0].dp_connected, it6505->port_data[1].dp_connected);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3677  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3678  	new_dp_connected = it6505->port_data[0].dp_connected ||
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3679  			   it6505->port_data[1].dp_connected;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3680  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3681  	if (it6505->enable_drv_hold) {
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3682  		dev_dbg(dev, "enable driver hold\n");
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3683  		goto unlock;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3684  	}
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3685  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3686  	it6505_typec_ports_update(it6505);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3687  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3688  	if (!old_dp_connected && new_dp_connected) {
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3689  		/*
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3690  		 * pm_runtime_force_suspend() disables runtime PM when the
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3691  		 * system enters suspend state. But on system resume, mux_set
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3692  		 * can be triggered before pm_runtime_force_resume() re-enables
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3693  		 * runtime PM. This makes the bridge stay powered off if the
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3694  		 * downstream display is connected when the system is suspended.
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3695  		 * Handling the error here to make sure the bridge is powered
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3696  		 * on, and leave the PM runtime usage count incremented so
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3697  		 * the future runtime PM calls is balanced.
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3698  		 */
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3699  		if (pm_runtime_get_sync(dev) < 0)
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3700  			it6505_poweron(it6505);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3701  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3702  		complete_all(&it6505->extcon_completion);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3703  	}
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3704  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3705  	if (old_dp_connected && !new_dp_connected) {
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3706  		reinit_completion(&it6505->extcon_completion);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3707  		pm_runtime_put_sync(dev);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3708  		if (it6505->bridge.dev)
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3709  			drm_helper_hpd_irq_event(it6505->bridge.dev);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3710  		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3711  	}
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3712  
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3713  unlock:
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3714  	mutex_unlock(&it6505->extcon_lock);
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3715  	return ret;
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3716  }
5a3446d82f7c65 Pin-yen Lin 2023-03-31  3717  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
