Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070425777
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759249; cv=none; b=i6dSFLcppa/JUDLPKyDfzCSS9PYQWHaL8yvjzz6oBmW+2bIVbt2aOgmqMwDdOTC1NwKKJykSsZpZrtaSWXDfgXudJlGwRUESqmSUGuDIa1ZLBzvOxtNqFpOz3hUYoPvOwdRBZ57ycCbOVDZ2OKrMu4cJznzfYcxoPUb5c5w3gUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759249; c=relaxed/simple;
	bh=UZDgkA7H4Nz5DZ7OId4/HoqQZ4OUhjZyeoB9GiSG2WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJqha0TIKELW4lP8I27l+DFIdhOT3GKrE8X0kqSxYaVO4v1xyEBfF8o7NCet150MVQEfs7uba4iHRxboB10XFhYfiPtTsAjdPCluiKQIYpZnk1qPSSsmcTyiw1RYeA7YGf6tDoAdL3rc29iOM5yvrjxvrk5pL+BAymAYPI+k2ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZcy0v/v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZcy0v/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733759247; x=1765295247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZDgkA7H4Nz5DZ7OId4/HoqQZ4OUhjZyeoB9GiSG2WY=;
  b=UZcy0v/vn/894TR2p7pUdsKNXKLHgOn9GJy6MivaJvF149g7z5NKD6rh
   vajCsbqUREExrYz6ygv2YwP/Lu9TYwa/nuQWpFQWHRMTjCCa43ni4CT7j
   sCByrIW4aALz9/bdW59up7DPQHF1gh1gUK2Rqshdpil5QrcW6scVvUE3u
   eIgTxevDOTZRIRmcP+bA6yX8aocQvBk0OwG0YzmNfeEThuXczJPguNApr
   oTD6A1RI3CT7mrXsUljzWXqGFdf9BLZbP1xbagjsjQqlfbBfY1watHRHK
   HG7RaH/CJXkSwLoVSd/2+KlrWj8g3jvvXjf2C3KNGZ9k22YG6GYpaT/uD
   g==;
X-CSE-ConnectionGUID: lFIIU9SkSWiAwebnmHHWhg==
X-CSE-MsgGUID: vnJITQ75QOu6CZMafCyBhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44668756"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="44668756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 07:47:26 -0800
X-CSE-ConnectionGUID: ljRY+W1OTwSWFl41cbqr0g==
X-CSE-MsgGUID: AulplJbeTreHC1bb+GJqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95182432"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Dec 2024 07:47:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKfyj-0004Wf-36;
	Mon, 09 Dec 2024 15:47:21 +0000
Date: Mon, 9 Dec 2024 23:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_display_driver.c:269:6-27:
 opportunity for str_plural(INTEL_NUM_PIPES ( i915 ))
Message-ID: <202412092325.5iKc86zb-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 40053823baadce4e300cb011ac4e3d16be93bf6a drm/i915/display: move modeset probe/remove functions to intel_display_driver.c
date:   1 year, 8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 8 months ago
config: i386-randconfig-051-20241209 (https://download.01.org/0day-ci/archive/20241209/202412092325.5iKc86zb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412092325.5iKc86zb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_driver.c:269:6-27: opportunity for str_plural(INTEL_NUM_PIPES ( i915 ))

vim +269 drivers/gpu/drm/i915/display/intel_display_driver.c

40053823baadce Jani Nikula 2023-04-14  247  
40053823baadce Jani Nikula 2023-04-14  248  /* part #2: call after irq install, but before gem init */
40053823baadce Jani Nikula 2023-04-14  249  int intel_modeset_init_nogem(struct drm_i915_private *i915)
40053823baadce Jani Nikula 2023-04-14  250  {
40053823baadce Jani Nikula 2023-04-14  251  	struct drm_device *dev = &i915->drm;
40053823baadce Jani Nikula 2023-04-14  252  	enum pipe pipe;
40053823baadce Jani Nikula 2023-04-14  253  	struct intel_crtc *crtc;
40053823baadce Jani Nikula 2023-04-14  254  	int ret;
40053823baadce Jani Nikula 2023-04-14  255  
40053823baadce Jani Nikula 2023-04-14  256  	if (!HAS_DISPLAY(i915))
40053823baadce Jani Nikula 2023-04-14  257  		return 0;
40053823baadce Jani Nikula 2023-04-14  258  
40053823baadce Jani Nikula 2023-04-14  259  	intel_wm_init(i915);
40053823baadce Jani Nikula 2023-04-14  260  
40053823baadce Jani Nikula 2023-04-14  261  	intel_panel_sanitize_ssc(i915);
40053823baadce Jani Nikula 2023-04-14  262  
40053823baadce Jani Nikula 2023-04-14  263  	intel_pps_setup(i915);
40053823baadce Jani Nikula 2023-04-14  264  
40053823baadce Jani Nikula 2023-04-14  265  	intel_gmbus_setup(i915);
40053823baadce Jani Nikula 2023-04-14  266  
40053823baadce Jani Nikula 2023-04-14  267  	drm_dbg_kms(&i915->drm, "%d display pipe%s available.\n",
40053823baadce Jani Nikula 2023-04-14  268  		    INTEL_NUM_PIPES(i915),
40053823baadce Jani Nikula 2023-04-14 @269  		    INTEL_NUM_PIPES(i915) > 1 ? "s" : "");
40053823baadce Jani Nikula 2023-04-14  270  
40053823baadce Jani Nikula 2023-04-14  271  	for_each_pipe(i915, pipe) {
40053823baadce Jani Nikula 2023-04-14  272  		ret = intel_crtc_init(i915, pipe);
40053823baadce Jani Nikula 2023-04-14  273  		if (ret) {
40053823baadce Jani Nikula 2023-04-14  274  			intel_mode_config_cleanup(i915);
40053823baadce Jani Nikula 2023-04-14  275  			return ret;
40053823baadce Jani Nikula 2023-04-14  276  		}
40053823baadce Jani Nikula 2023-04-14  277  	}
40053823baadce Jani Nikula 2023-04-14  278  
40053823baadce Jani Nikula 2023-04-14  279  	intel_plane_possible_crtcs_init(i915);
40053823baadce Jani Nikula 2023-04-14  280  	intel_shared_dpll_init(i915);
40053823baadce Jani Nikula 2023-04-14  281  	intel_fdi_pll_freq_update(i915);
40053823baadce Jani Nikula 2023-04-14  282  
40053823baadce Jani Nikula 2023-04-14  283  	intel_update_czclk(i915);
40053823baadce Jani Nikula 2023-04-14  284  	intel_modeset_init_hw(i915);
40053823baadce Jani Nikula 2023-04-14  285  	intel_dpll_update_ref_clks(i915);
40053823baadce Jani Nikula 2023-04-14  286  
40053823baadce Jani Nikula 2023-04-14  287  	intel_hdcp_component_init(i915);
40053823baadce Jani Nikula 2023-04-14  288  
40053823baadce Jani Nikula 2023-04-14  289  	if (i915->display.cdclk.max_cdclk_freq == 0)
40053823baadce Jani Nikula 2023-04-14  290  		intel_update_max_cdclk(i915);
40053823baadce Jani Nikula 2023-04-14  291  
40053823baadce Jani Nikula 2023-04-14  292  	intel_hti_init(i915);
40053823baadce Jani Nikula 2023-04-14  293  
40053823baadce Jani Nikula 2023-04-14  294  	/* Just disable it once at startup */
40053823baadce Jani Nikula 2023-04-14  295  	intel_vga_disable(i915);
40053823baadce Jani Nikula 2023-04-14  296  	intel_setup_outputs(i915);
40053823baadce Jani Nikula 2023-04-14  297  
40053823baadce Jani Nikula 2023-04-14  298  	drm_modeset_lock_all(dev);
40053823baadce Jani Nikula 2023-04-14  299  	intel_modeset_setup_hw_state(i915, dev->mode_config.acquire_ctx);
40053823baadce Jani Nikula 2023-04-14  300  	intel_acpi_assign_connector_fwnodes(i915);
40053823baadce Jani Nikula 2023-04-14  301  	drm_modeset_unlock_all(dev);
40053823baadce Jani Nikula 2023-04-14  302  
40053823baadce Jani Nikula 2023-04-14  303  	for_each_intel_crtc(dev, crtc) {
40053823baadce Jani Nikula 2023-04-14  304  		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
40053823baadce Jani Nikula 2023-04-14  305  			continue;
40053823baadce Jani Nikula 2023-04-14  306  		intel_crtc_initial_plane_config(crtc);
40053823baadce Jani Nikula 2023-04-14  307  	}
40053823baadce Jani Nikula 2023-04-14  308  
40053823baadce Jani Nikula 2023-04-14  309  	/*
40053823baadce Jani Nikula 2023-04-14  310  	 * Make sure hardware watermarks really match the state we read out.
40053823baadce Jani Nikula 2023-04-14  311  	 * Note that we need to do this after reconstructing the BIOS fb's
40053823baadce Jani Nikula 2023-04-14  312  	 * since the watermark calculation done here will use pstate->fb.
40053823baadce Jani Nikula 2023-04-14  313  	 */
40053823baadce Jani Nikula 2023-04-14  314  	if (!HAS_GMCH(i915))
40053823baadce Jani Nikula 2023-04-14  315  		ilk_wm_sanitize(i915);
40053823baadce Jani Nikula 2023-04-14  316  
40053823baadce Jani Nikula 2023-04-14  317  	return 0;
40053823baadce Jani Nikula 2023-04-14  318  }
40053823baadce Jani Nikula 2023-04-14  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
