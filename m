Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6389F9E6
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 03:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886969; cv=none; b=MsNIBISHVDgJBw5/DB+ONIEwfm9Wk8j+brMIP/o8RUMikH+0FXvfBzSKMc++0jpKix0IjN6kOUa8kzcfIaDMawCimDzym09wZXJf8hydgzmTI3a+0PW+3Ir5/wiU1wBKLIMzc0oo84hh4aPTsDxfWlCG/NCUYwKPN/HqHcVlMkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886969; c=relaxed/simple;
	bh=OihNI0GSCMKDAioDQn3DbbGeKfJs+WF85NfqRDZCFTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mgDCbtsDd/fTbrzxEc5u1vMPWv7NtQUPWTTHSQkyxdJpvgkOBPEPb8b+BPwRYc21r6+dT0jtgtOrBdw95Rs+VXYYmQosFDmrcuNwgwPNWnlkY3XF2LZRIOZzFelL6M9HdUArDkdAYyJCnMT+T3/CHgbGIYjzO4p1zWZ8H4vNdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnmt9jXc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnmt9jXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733886966; x=1765422966;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OihNI0GSCMKDAioDQn3DbbGeKfJs+WF85NfqRDZCFTo=;
  b=hnmt9jXcK35SeFrf7vVJKT3Lz41khoeRd7RXIGnwC33kHxTk9Zr1Euxh
   oaq+zpoDZZrkRxfb3+cp6avjZdsTfPQYDHo4p4kEorc3EgpC8JPntO8RX
   g4IIIpakhFqxqVaBV2mPPStukPV2QDiREaBCrwZtCExLVZxtLjnq8m3qs
   HbmSV7LvN/AdlDJ/jTBxjfTcw0JQT/uvvauK11jNnaO/HS+fF+MpBWKqo
   BIM9ePHVwuOwPGmvcujf4hOOLOnF5XerD159E7jzvfKzra2Pmpy5/lqEh
   7KAXEFmWfzvBCTCGG4SSz90dbi2aSkRTtF9DFUCWuw9X8darRfo5YfnKo
   g==;
X-CSE-ConnectionGUID: 40ZQzJdYRPK10Mj5aDVzVQ==
X-CSE-MsgGUID: hWhrv07MSXqXGuHT6HqulQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51784780"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="51784780"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 19:16:05 -0800
X-CSE-ConnectionGUID: eygUhD8zTKK40OBbAOmjjw==
X-CSE-MsgGUID: T7VjVJF/SvaXKCnLZzZFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118877313"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2024 19:16:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLDCj-0006D3-30;
	Wed, 11 Dec 2024 03:16:01 +0000
Date: Wed, 11 Dec 2024 11:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [drm-i915:for-linux-next 1/7]
 drivers/gpu/drm/i915/display/intel_display_driver.c:446:6-30: opportunity
 for str_plural(INTEL_NUM_PIPES ( display ))
Message-ID: <202412111138.ztfxui5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jani Nikula <jani.nikula@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   d82bb731e7606f1b07886aa2ac9b47a69019704b
commit: f5d38d4fa88441bc4f96e185bce7426790e32949 [1/7] drm/i915/display: convert intel_display_driver.[ch] to struct intel_display
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-r061-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111138.ztfxui5L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412111138.ztfxui5L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_driver.c:446:6-30: opportunity for str_plural(INTEL_NUM_PIPES ( display ))

vim +446 drivers/gpu/drm/i915/display/intel_display_driver.c

bd738d859e71ac Imre Deak     2024-01-04  425  
40053823baadce Jani Nikula   2023-04-14  426  /* part #2: call after irq install, but before gem init */
f5d38d4fa88441 Jani Nikula   2024-12-04  427  int intel_display_driver_probe_nogem(struct intel_display *display)
40053823baadce Jani Nikula   2023-04-14  428  {
f5d38d4fa88441 Jani Nikula   2024-12-04  429  	struct drm_i915_private *i915 = to_i915(display->drm);
40053823baadce Jani Nikula   2023-04-14  430  	enum pipe pipe;
40053823baadce Jani Nikula   2023-04-14  431  	int ret;
40053823baadce Jani Nikula   2023-04-14  432  
f5d38d4fa88441 Jani Nikula   2024-12-04  433  	if (!HAS_DISPLAY(display))
40053823baadce Jani Nikula   2023-04-14  434  		return 0;
40053823baadce Jani Nikula   2023-04-14  435  
40053823baadce Jani Nikula   2023-04-14  436  	intel_wm_init(i915);
40053823baadce Jani Nikula   2023-04-14  437  
40053823baadce Jani Nikula   2023-04-14  438  	intel_panel_sanitize_ssc(i915);
40053823baadce Jani Nikula   2023-04-14  439  
8a37cd4dc50e8f Jani Nikula   2024-08-30  440  	intel_pps_setup(display);
40053823baadce Jani Nikula   2023-04-14  441  
fdc387383ebd0d Jani Nikula   2024-10-28  442  	intel_gmbus_setup(display);
40053823baadce Jani Nikula   2023-04-14  443  
f5d38d4fa88441 Jani Nikula   2024-12-04  444  	drm_dbg_kms(display->drm, "%d display pipe%s available.\n",
f5d38d4fa88441 Jani Nikula   2024-12-04  445  		    INTEL_NUM_PIPES(display),
f5d38d4fa88441 Jani Nikula   2024-12-04 @446  		    INTEL_NUM_PIPES(display) > 1 ? "s" : "");
40053823baadce Jani Nikula   2023-04-14  447  
f5d38d4fa88441 Jani Nikula   2024-12-04  448  	for_each_pipe(display, pipe) {
40053823baadce Jani Nikula   2023-04-14  449  		ret = intel_crtc_init(i915, pipe);
e60cff453b8278 Imre Deak     2024-02-20  450  		if (ret)
e60cff453b8278 Imre Deak     2024-02-20  451  			goto err_mode_config;
40053823baadce Jani Nikula   2023-04-14  452  	}
40053823baadce Jani Nikula   2023-04-14  453  
f5d38d4fa88441 Jani Nikula   2024-12-04  454  	intel_plane_possible_crtcs_init(display);
40053823baadce Jani Nikula   2023-04-14  455  	intel_shared_dpll_init(i915);
40053823baadce Jani Nikula   2023-04-14  456  	intel_fdi_pll_freq_update(i915);
40053823baadce Jani Nikula   2023-04-14  457  
40053823baadce Jani Nikula   2023-04-14  458  	intel_update_czclk(i915);
f5d38d4fa88441 Jani Nikula   2024-12-04  459  	intel_display_driver_init_hw(display);
40053823baadce Jani Nikula   2023-04-14  460  	intel_dpll_update_ref_clks(i915);
40053823baadce Jani Nikula   2023-04-14  461  
d34927acff9150 Ville Syrjälä 2024-09-06  462  	if (display->cdclk.max_cdclk_freq == 0)
d34927acff9150 Ville Syrjälä 2024-09-06  463  		intel_update_max_cdclk(display);
40053823baadce Jani Nikula   2023-04-14  464  
7d085bb17e3cab Jani Nikula   2024-08-13  465  	intel_hti_init(display);
40053823baadce Jani Nikula   2023-04-14  466  
40053823baadce Jani Nikula   2023-04-14  467  	/* Just disable it once at startup */
4b6e05c43b7542 Ville Syrjälä 2024-09-06  468  	intel_vga_disable(display);
40053823baadce Jani Nikula   2023-04-14  469  	intel_setup_outputs(i915);
40053823baadce Jani Nikula   2023-04-14  470  
a954e0a26146c4 Jani Nikula   2024-08-30  471  	ret = intel_dp_tunnel_mgr_init(display);
e60cff453b8278 Imre Deak     2024-02-20  472  	if (ret)
e60cff453b8278 Imre Deak     2024-02-20  473  		goto err_hdcp;
e60cff453b8278 Imre Deak     2024-02-20  474  
f5d38d4fa88441 Jani Nikula   2024-12-04  475  	intel_display_driver_disable_user_access(display);
bd738d859e71ac Imre Deak     2024-01-04  476  
f5d38d4fa88441 Jani Nikula   2024-12-04  477  	drm_modeset_lock_all(display->drm);
f5d38d4fa88441 Jani Nikula   2024-12-04  478  	intel_modeset_setup_hw_state(i915, display->drm->mode_config.acquire_ctx);
f7303ab29d08a5 Jani Nikula   2024-08-09  479  	intel_acpi_assign_connector_fwnodes(display);
f5d38d4fa88441 Jani Nikula   2024-12-04  480  	drm_modeset_unlock_all(display->drm);
40053823baadce Jani Nikula   2023-04-14  481  
d9b31d6accc40b Jani Nikula   2024-11-20  482  	intel_initial_plane_config(display);
40053823baadce Jani Nikula   2023-04-14  483  
40053823baadce Jani Nikula   2023-04-14  484  	/*
40053823baadce Jani Nikula   2023-04-14  485  	 * Make sure hardware watermarks really match the state we read out.
40053823baadce Jani Nikula   2023-04-14  486  	 * Note that we need to do this after reconstructing the BIOS fb's
40053823baadce Jani Nikula   2023-04-14  487  	 * since the watermark calculation done here will use pstate->fb.
40053823baadce Jani Nikula   2023-04-14  488  	 */
f5d38d4fa88441 Jani Nikula   2024-12-04  489  	if (!HAS_GMCH(display))
40053823baadce Jani Nikula   2023-04-14  490  		ilk_wm_sanitize(i915);
40053823baadce Jani Nikula   2023-04-14  491  
40053823baadce Jani Nikula   2023-04-14  492  	return 0;
e60cff453b8278 Imre Deak     2024-02-20  493  
e60cff453b8278 Imre Deak     2024-02-20  494  err_hdcp:
c214fc98cf292d Jani Nikula   2024-10-28  495  	intel_hdcp_component_fini(display);
e60cff453b8278 Imre Deak     2024-02-20  496  err_mode_config:
f5d38d4fa88441 Jani Nikula   2024-12-04  497  	intel_mode_config_cleanup(display);
e60cff453b8278 Imre Deak     2024-02-20  498  
e60cff453b8278 Imre Deak     2024-02-20  499  	return ret;
40053823baadce Jani Nikula   2023-04-14  500  }
40053823baadce Jani Nikula   2023-04-14  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
