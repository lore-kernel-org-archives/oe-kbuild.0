Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10259B42
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Mar 2024 21:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710797958; cv=none; b=JQmOBMwWX1UxYTImoLmB8jZXHLOnvPYVJUNGh3sWhqYUi+XsnFj6Mn4i2ISx2DZ4qSWj1tPuNGpmJihh/knT4yxNY4OqyydI8y1ajqPm401IOaEEynd29ajx2BUqZEvFB6XpqbfOPiIzEEhxzDP6i9gYaRwFR0lBAp4ksp1ETks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710797958; c=relaxed/simple;
	bh=IXolrVjwFYIHdb/NMhsBqg++f8+N9+1cbH6c9mDLckA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rre1UQT7NHsMs4sloGiLiaSww/H2pA8F0ls7ReOEDs7sH0AoFHML5+hI6cwLNZA6Z14vio/3UdFXX87aGBaUqU/kGIuDSRGE8Y9TJ/6BJAN8OzpzJmeOYuS7zONvSEL9nvamB2nMTPnJ5W+2LPwhWSbzAwEFFqE12DeuOYthmRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4fPGkAh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4fPGkAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710797956; x=1742333956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXolrVjwFYIHdb/NMhsBqg++f8+N9+1cbH6c9mDLckA=;
  b=B4fPGkAhbcM4XZCUFfBgWTrpkG6ul5Vok1YXKWDo0gFPYEVTA4FX30uL
   uUXGUz3MDHslhM6v+brJhR4h3q9UtQw91YpDiJ84I4PSaAxxXXjGoTHZ+
   QSCJzOywxlykfc9A+epP5no2ShaJJLyQIPnj4U2h6hjXiPziw5gcryT6E
   hXubZh5yZBL/hy1dkIGyd9chHGu8f2ce0wUTJEtwepQ4EvN0lKSnnKGA7
   keTrkIf7Otq0OGHeSEuCk9Chzg0dIZu+B8fkXvKXuv6ySmjuCNcz2Offr
   pD4dHadLtU8Dddkifs5rGFbd0kCpAgf5sdykbtQXNlVAMIqMzzj9ST2gi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23093644"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="23093644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 14:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13556938"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2024 14:39:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmKhM-000HFn-0b;
	Mon, 18 Mar 2024 21:39:12 +0000
Date: Tue, 19 Mar 2024 05:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_display_driver.c:269:6-27:
 opportunity for str_plural(INTEL_NUM_PIPES ( i915 ))
Message-ID: <202403190522.YCnbUBX3-lkp@intel.com>
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
head:   bf3a69c6861ff4dc7892d895c87074af7bc1c400
commit: 40053823baadce4e300cb011ac4e3d16be93bf6a drm/i915/display: move modeset probe/remove functions to intel_display_driver.c
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-051-20240318 (https://download.01.org/0day-ci/archive/20240319/202403190522.YCnbUBX3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403190522.YCnbUBX3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_driver.c:269:6-27: opportunity for str_plural(INTEL_NUM_PIPES ( i915 ))

vim +269 drivers/gpu/drm/i915/display/intel_display_driver.c

40053823baadce4 Jani Nikula 2023-04-14  247  
40053823baadce4 Jani Nikula 2023-04-14  248  /* part #2: call after irq install, but before gem init */
40053823baadce4 Jani Nikula 2023-04-14  249  int intel_modeset_init_nogem(struct drm_i915_private *i915)
40053823baadce4 Jani Nikula 2023-04-14  250  {
40053823baadce4 Jani Nikula 2023-04-14  251  	struct drm_device *dev = &i915->drm;
40053823baadce4 Jani Nikula 2023-04-14  252  	enum pipe pipe;
40053823baadce4 Jani Nikula 2023-04-14  253  	struct intel_crtc *crtc;
40053823baadce4 Jani Nikula 2023-04-14  254  	int ret;
40053823baadce4 Jani Nikula 2023-04-14  255  
40053823baadce4 Jani Nikula 2023-04-14  256  	if (!HAS_DISPLAY(i915))
40053823baadce4 Jani Nikula 2023-04-14  257  		return 0;
40053823baadce4 Jani Nikula 2023-04-14  258  
40053823baadce4 Jani Nikula 2023-04-14  259  	intel_wm_init(i915);
40053823baadce4 Jani Nikula 2023-04-14  260  
40053823baadce4 Jani Nikula 2023-04-14  261  	intel_panel_sanitize_ssc(i915);
40053823baadce4 Jani Nikula 2023-04-14  262  
40053823baadce4 Jani Nikula 2023-04-14  263  	intel_pps_setup(i915);
40053823baadce4 Jani Nikula 2023-04-14  264  
40053823baadce4 Jani Nikula 2023-04-14  265  	intel_gmbus_setup(i915);
40053823baadce4 Jani Nikula 2023-04-14  266  
40053823baadce4 Jani Nikula 2023-04-14  267  	drm_dbg_kms(&i915->drm, "%d display pipe%s available.\n",
40053823baadce4 Jani Nikula 2023-04-14  268  		    INTEL_NUM_PIPES(i915),
40053823baadce4 Jani Nikula 2023-04-14 @269  		    INTEL_NUM_PIPES(i915) > 1 ? "s" : "");
40053823baadce4 Jani Nikula 2023-04-14  270  
40053823baadce4 Jani Nikula 2023-04-14  271  	for_each_pipe(i915, pipe) {
40053823baadce4 Jani Nikula 2023-04-14  272  		ret = intel_crtc_init(i915, pipe);
40053823baadce4 Jani Nikula 2023-04-14  273  		if (ret) {
40053823baadce4 Jani Nikula 2023-04-14  274  			intel_mode_config_cleanup(i915);
40053823baadce4 Jani Nikula 2023-04-14  275  			return ret;
40053823baadce4 Jani Nikula 2023-04-14  276  		}
40053823baadce4 Jani Nikula 2023-04-14  277  	}
40053823baadce4 Jani Nikula 2023-04-14  278  
40053823baadce4 Jani Nikula 2023-04-14  279  	intel_plane_possible_crtcs_init(i915);
40053823baadce4 Jani Nikula 2023-04-14  280  	intel_shared_dpll_init(i915);
40053823baadce4 Jani Nikula 2023-04-14  281  	intel_fdi_pll_freq_update(i915);
40053823baadce4 Jani Nikula 2023-04-14  282  
40053823baadce4 Jani Nikula 2023-04-14  283  	intel_update_czclk(i915);
40053823baadce4 Jani Nikula 2023-04-14  284  	intel_modeset_init_hw(i915);
40053823baadce4 Jani Nikula 2023-04-14  285  	intel_dpll_update_ref_clks(i915);
40053823baadce4 Jani Nikula 2023-04-14  286  
40053823baadce4 Jani Nikula 2023-04-14  287  	intel_hdcp_component_init(i915);
40053823baadce4 Jani Nikula 2023-04-14  288  
40053823baadce4 Jani Nikula 2023-04-14  289  	if (i915->display.cdclk.max_cdclk_freq == 0)
40053823baadce4 Jani Nikula 2023-04-14  290  		intel_update_max_cdclk(i915);
40053823baadce4 Jani Nikula 2023-04-14  291  
40053823baadce4 Jani Nikula 2023-04-14  292  	intel_hti_init(i915);
40053823baadce4 Jani Nikula 2023-04-14  293  
40053823baadce4 Jani Nikula 2023-04-14  294  	/* Just disable it once at startup */
40053823baadce4 Jani Nikula 2023-04-14  295  	intel_vga_disable(i915);
40053823baadce4 Jani Nikula 2023-04-14  296  	intel_setup_outputs(i915);
40053823baadce4 Jani Nikula 2023-04-14  297  
40053823baadce4 Jani Nikula 2023-04-14  298  	drm_modeset_lock_all(dev);
40053823baadce4 Jani Nikula 2023-04-14  299  	intel_modeset_setup_hw_state(i915, dev->mode_config.acquire_ctx);
40053823baadce4 Jani Nikula 2023-04-14  300  	intel_acpi_assign_connector_fwnodes(i915);
40053823baadce4 Jani Nikula 2023-04-14  301  	drm_modeset_unlock_all(dev);
40053823baadce4 Jani Nikula 2023-04-14  302  
40053823baadce4 Jani Nikula 2023-04-14  303  	for_each_intel_crtc(dev, crtc) {
40053823baadce4 Jani Nikula 2023-04-14  304  		if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
40053823baadce4 Jani Nikula 2023-04-14  305  			continue;
40053823baadce4 Jani Nikula 2023-04-14  306  		intel_crtc_initial_plane_config(crtc);
40053823baadce4 Jani Nikula 2023-04-14  307  	}
40053823baadce4 Jani Nikula 2023-04-14  308  
40053823baadce4 Jani Nikula 2023-04-14  309  	/*
40053823baadce4 Jani Nikula 2023-04-14  310  	 * Make sure hardware watermarks really match the state we read out.
40053823baadce4 Jani Nikula 2023-04-14  311  	 * Note that we need to do this after reconstructing the BIOS fb's
40053823baadce4 Jani Nikula 2023-04-14  312  	 * since the watermark calculation done here will use pstate->fb.
40053823baadce4 Jani Nikula 2023-04-14  313  	 */
40053823baadce4 Jani Nikula 2023-04-14  314  	if (!HAS_GMCH(i915))
40053823baadce4 Jani Nikula 2023-04-14  315  		ilk_wm_sanitize(i915);
40053823baadce4 Jani Nikula 2023-04-14  316  
40053823baadce4 Jani Nikula 2023-04-14  317  	return 0;
40053823baadce4 Jani Nikula 2023-04-14  318  }
40053823baadce4 Jani Nikula 2023-04-14  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
