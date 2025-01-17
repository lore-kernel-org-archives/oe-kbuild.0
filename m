Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDFD187550
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 20:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737145053; cv=none; b=foKGd25sdEWRJlp2wVKH7bYGzqpFb6RfP1QfI1iK65uRLoqNuvGxWTV9PVS8CNYKGuOC6L3ISojSIF3s1WI88ov4pMmjf9ni+j3XpaZVrZl6dcx78DSYV3Exs0mR7IQMy7VIRnQZzpAc3PbBy4aAthtEVLgvSz6iBi3MdqLaY+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737145053; c=relaxed/simple;
	bh=wWVZNNRwDsv5KPVqsM0uneL4QOZVQCQa6OeNuBZGa64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBPpKipzIq6+q3PKYhZxkmdUDHqDiwzLkPgTTz/iR7491ecLOWO0ZzquHmnO2Ovtx+1ff36OeqAVdpYGO60/zq/BZjKUO8wrXk7FUaH7bdeZ4VpLrRyd2N9jWyTg16/5Oh6EnmxatRjx860Hs8Hh3rCJ56p/7HvXbM8iAnpi0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLIouiFh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLIouiFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737145052; x=1768681052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWVZNNRwDsv5KPVqsM0uneL4QOZVQCQa6OeNuBZGa64=;
  b=WLIouiFhruW/HDWANLDoAc6FTGrqw4nmyJBMN4Qs3i2/3Rq+uOXMVJQ2
   m/urSiUiiPWI7gJ6WacT91keeLRnENbi1eRMlV8UgbKwlajo0cJxDOts8
   UE7RV63kz/e+UqIez9TZTnUqbaGKwn8RpTpz0fk3lYk3ncMaldIQ7zg72
   gdBilBrIlC2HL/XLZlAtlLbJTSfdPI//wFogVSrJXbnnKLcFOhIUAGlRb
   TJbgtc8HcVPDQt7Crhpca1ocmdqjqemn1AeiZSwGWlMjqB8neiOlVF0ix
   /qMZEXWS3+pcB8iJyy751kqYZi6n7wIuLeAwdvW+vo+gYruEVx194+Ud4
   w==;
X-CSE-ConnectionGUID: oCtIANZYS+OzVhxAIzOxpA==
X-CSE-MsgGUID: Wn0u4IPNTyeyig+PZEGqKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37282948"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37282948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:17:31 -0800
X-CSE-ConnectionGUID: VVWl3efYRQGBddmp6a31zQ==
X-CSE-MsgGUID: WbP4eBbCQxCUUwTwJcbZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110538794"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2025 12:17:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYsmV-000Tfx-2C;
	Fri, 17 Jan 2025 20:17:27 +0000
Date: Sat, 18 Jan 2025 04:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wens:mtk-wip 24/48] drivers/gpu/drm/bridge/analogix/anx7625.c:2658
 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
Message-ID: <202501180409.LUg1bFSN-lkp@intel.com>
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
commit: d62036e150e84eff425756d90cf8f060d86beb17 [24/48] drm/bridge: anx7625: Register Type C mode switches
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180409.LUg1bFSN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501180409.LUg1bFSN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()

vim +/port +2658 drivers/gpu/drm/bridge/analogix/anx7625.c

d62036e150e84e Pin-yen Lin 2023-03-31  2653  
d62036e150e84e Pin-yen Lin 2023-03-31  2654  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
d62036e150e84e Pin-yen Lin 2023-03-31  2655  				 struct typec_mux_state *state)
d62036e150e84e Pin-yen Lin 2023-03-31  2656  {
d62036e150e84e Pin-yen Lin 2023-03-31  2657  	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
d62036e150e84e Pin-yen Lin 2023-03-31 @2658  	struct anx7625_data *ctx = port->data;
d62036e150e84e Pin-yen Lin 2023-03-31  2659  	struct device *dev = ctx->dev;
d62036e150e84e Pin-yen Lin 2023-03-31  2660  	struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
d62036e150e84e Pin-yen Lin 2023-03-31  2661  	bool new_dp_connected, old_dp_connected;
d62036e150e84e Pin-yen Lin 2023-03-31  2662  
d62036e150e84e Pin-yen Lin 2023-03-31  2663  	if (switch_desc.num_typec_switches == 1)
d62036e150e84e Pin-yen Lin 2023-03-31  2664  		return 0;
d62036e150e84e Pin-yen Lin 2023-03-31  2665  
d62036e150e84e Pin-yen Lin 2023-03-31  2666  	/*
d62036e150e84e Pin-yen Lin 2023-03-31  2667  	 * The completion is called in anx7625_register_typec_switches
d62036e150e84e Pin-yen Lin 2023-03-31  2668  	 * even on errors, so it's safe to wait for completion without timeout.
d62036e150e84e Pin-yen Lin 2023-03-31  2669  	 */
d62036e150e84e Pin-yen Lin 2023-03-31  2670  	wait_for_completion(&ctx->mux_register);
d62036e150e84e Pin-yen Lin 2023-03-31  2671  
d62036e150e84e Pin-yen Lin 2023-03-31  2672  	/* Abort when the switches are unregistered. */
d62036e150e84e Pin-yen Lin 2023-03-31  2673  	if (!ctx->port_data)
d62036e150e84e Pin-yen Lin 2023-03-31  2674  		return -EINVAL;
d62036e150e84e Pin-yen Lin 2023-03-31  2675  
d62036e150e84e Pin-yen Lin 2023-03-31  2676  	old_dp_connected = ctx->port_data[0].dp_connected ||
d62036e150e84e Pin-yen Lin 2023-03-31  2677  			   ctx->port_data[1].dp_connected;
d62036e150e84e Pin-yen Lin 2023-03-31  2678  
d62036e150e84e Pin-yen Lin 2023-03-31  2679  	ctx->port_data[port->port_num].dp_connected =
d62036e150e84e Pin-yen Lin 2023-03-31  2680  		state->alt &&
d62036e150e84e Pin-yen Lin 2023-03-31  2681  		state->alt->svid == USB_TYPEC_DP_SID &&
d62036e150e84e Pin-yen Lin 2023-03-31  2682  		state->alt->mode == USB_TYPEC_DP_MODE;
d62036e150e84e Pin-yen Lin 2023-03-31  2683  
d62036e150e84e Pin-yen Lin 2023-03-31  2684  	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
d62036e150e84e Pin-yen Lin 2023-03-31  2685  		ctx->port_data[0].dp_connected, ctx->port_data[1].dp_connected);
d62036e150e84e Pin-yen Lin 2023-03-31  2686  
d62036e150e84e Pin-yen Lin 2023-03-31  2687  	new_dp_connected = ctx->port_data[0].dp_connected ||
d62036e150e84e Pin-yen Lin 2023-03-31  2688  			   ctx->port_data[1].dp_connected;
d62036e150e84e Pin-yen Lin 2023-03-31  2689  
d62036e150e84e Pin-yen Lin 2023-03-31  2690  	/* DP on, power on first */
d62036e150e84e Pin-yen Lin 2023-03-31  2691  	if (!old_dp_connected && new_dp_connected)
d62036e150e84e Pin-yen Lin 2023-03-31  2692  		pm_runtime_get_sync(dev);
d62036e150e84e Pin-yen Lin 2023-03-31  2693  
d62036e150e84e Pin-yen Lin 2023-03-31  2694  	anx7625_typec_two_ports_update(ctx);
d62036e150e84e Pin-yen Lin 2023-03-31  2695  
d62036e150e84e Pin-yen Lin 2023-03-31  2696  	/* DP off, power off last */
d62036e150e84e Pin-yen Lin 2023-03-31  2697  	if (old_dp_connected && !new_dp_connected)
d62036e150e84e Pin-yen Lin 2023-03-31  2698  		pm_runtime_put_sync(dev);
d62036e150e84e Pin-yen Lin 2023-03-31  2699  
d62036e150e84e Pin-yen Lin 2023-03-31  2700  	return 0;
d62036e150e84e Pin-yen Lin 2023-03-31  2701  }
d62036e150e84e Pin-yen Lin 2023-03-31  2702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
