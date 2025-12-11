Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515322BE647
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 01:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416508; cv=none; b=nnyUGq8pqIO9qLy9h6hd0FRadjXweRwERc2m8cpp+6YpAOTUDzHIL4QfPzfhhT0SbJgvvZauRunh1oKBlw++B3GK4cRXP5pzGb7w89X1pr/U0WSmM73LTE086w2/xGDhT7GH+pvOipzLV5qTNHvKQ6qJ7VIBxAqXpvKCSg4HDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416508; c=relaxed/simple;
	bh=BgEjkuiIfU/U+z/vRac4WXSX22nF+I3G9aaPF3FWXuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nw7mkvVDfGT5n1yXHH8+ZdUKGaRE9JFuHoJpF+50gPf8+ngEtzWInBnO2yDQoy2BcomxnT5MTYMI0597OvfxTZe2MvISqueMTyhcVsWv90UzKwlpdosHtmq3e5WD7MRu10mDR6jN6a0h4cZniVZVpsW4bh6v2F/N2c71f0LbhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7+ktXIL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7+ktXIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765416506; x=1796952506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BgEjkuiIfU/U+z/vRac4WXSX22nF+I3G9aaPF3FWXuA=;
  b=X7+ktXIL39c50hmFIMtVlYiAOUgFtI2oZVwptrF08/uXrzVe9LdkKImJ
   heOJNLZRvx1Kxs+U7iwhfQCvDUkqgu0bGjqGn2zGpSnLxLBHdigPYxrH0
   f6cfj13JmFnR/y0KWLwegAJtOOExyWf87tQXC/0fSOSm/4frDC+/n2qfh
   YUdOvSFbPaw/9AOl7xg8OKoxz/8bp0axc6yCGn6ZxuB4itQZFSom8YNlM
   Q7202MBj+O2mPQHDW14cWpJUUHNX1FKpFT4vk0YKRaz8nHY/eLQtY4XWF
   vQbLSb6uii6sFpah3NzUTfbHEQ6yLEm7U1xIZC6N3z6xJrv6+W8ekUcu2
   w==;
X-CSE-ConnectionGUID: VYswBhWdQvqg7sd0AQhD4w==
X-CSE-MsgGUID: a3fB0orzRl6cU7J3R1U4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84804450"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84804450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 17:28:24 -0800
X-CSE-ConnectionGUID: 7wrE7U8wQMStynDBvIV1ZQ==
X-CSE-MsgGUID: YAYR9G/gTfyMa3g4vMBmmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220007984"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 17:28:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTVTg-000000003xx-1t5R;
	Thu, 11 Dec 2025 01:28:20 +0000
Date: Thu, 11 Dec 2025 09:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/i915/crtc: move crtc initialization loop to
 intel_crtc.c
Message-ID: <202512110945.XlM3uGiG-lkp@intel.com>
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
In-Reply-To: <20251204143235.3138973-1-jani.nikula@intel.com>
References: <20251204143235.3138973-1-jani.nikula@intel.com>
TO: Jani Nikula <jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-i915/for-linux-next-fixes linus/master v6.18 next-20251210]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-crtc-move-crtc-initialization-loop-to-intel_crtc-c/20251204-223750
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20251204143235.3138973-1-jani.nikula%40intel.com
patch subject: [PATCH] drm/i915/crtc: move crtc initialization loop to intel_crtc.c
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251211/202512110945.XlM3uGiG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110945.XlM3uGiG-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_crtc.c:334 __intel_crtc_init() warn: 'primary' can also be NULL
drivers/gpu/drm/i915/display/intel_crtc.c:349 __intel_crtc_init() warn: 'plane' can also be NULL

vim +/primary +334 drivers/gpu/drm/i915/display/intel_crtc.c

fbf756c31cca38 Dave Airlie   2021-01-14  311  
f5d19f74d99a2a Jani Nikula   2025-12-04  312  static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
fbf756c31cca38 Dave Airlie   2021-01-14  313  {
fbf756c31cca38 Dave Airlie   2021-01-14  314  	struct intel_plane *primary, *cursor;
fbf756c31cca38 Dave Airlie   2021-01-14  315  	const struct drm_crtc_funcs *funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  316  	struct intel_crtc *crtc;
fbf756c31cca38 Dave Airlie   2021-01-14  317  	int sprite, ret;
fbf756c31cca38 Dave Airlie   2021-01-14  318  
fbf756c31cca38 Dave Airlie   2021-01-14  319  	crtc = intel_crtc_alloc();
fbf756c31cca38 Dave Airlie   2021-01-14  320  	if (IS_ERR(crtc))
fbf756c31cca38 Dave Airlie   2021-01-14  321  		return PTR_ERR(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  322  
fbf756c31cca38 Dave Airlie   2021-01-14  323  	crtc->pipe = pipe;
b2479f7231d8b1 Ville Syrjälä 2025-02-06  324  	crtc->num_scalers = DISPLAY_RUNTIME_INFO(display)->num_scalers[pipe];
fbf756c31cca38 Dave Airlie   2021-01-14  325  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  326  	if (DISPLAY_VER(display) >= 9)
a2ed9f84524795 Ville Syrjälä 2025-02-06  327  		primary = skl_universal_plane_create(display, pipe, PLANE_1);
46d12f911821f7 Dave Airlie   2021-02-05  328  	else
880ed2d84db9a1 Ville Syrjälä 2025-02-06  329  		primary = intel_primary_plane_create(display, pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  330  	if (IS_ERR(primary)) {
fbf756c31cca38 Dave Airlie   2021-01-14  331  		ret = PTR_ERR(primary);
fbf756c31cca38 Dave Airlie   2021-01-14  332  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  333  	}
fbf756c31cca38 Dave Airlie   2021-01-14 @334  	crtc->plane_ids_mask |= BIT(primary->id);
fbf756c31cca38 Dave Airlie   2021-01-14  335  
f414bb4f717ad5 Jani Nikula   2025-02-12  336  	intel_init_fifo_underrun_reporting(display, crtc, false);
66560f33059ebe Ville Syrjälä 2023-01-25  337  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  338  	for_each_sprite(display, pipe, sprite) {
fbf756c31cca38 Dave Airlie   2021-01-14  339  		struct intel_plane *plane;
fbf756c31cca38 Dave Airlie   2021-01-14  340  
a76a2be26df373 Jani Nikula   2025-05-06  341  		if (DISPLAY_VER(display) >= 9)
a2ed9f84524795 Ville Syrjälä 2025-02-06  342  			plane = skl_universal_plane_create(display, pipe, PLANE_2 + sprite);
46d12f911821f7 Dave Airlie   2021-02-05  343  		else
9665025b57796f Ville Syrjälä 2025-02-06  344  			plane = intel_sprite_plane_create(display, pipe, sprite);
fbf756c31cca38 Dave Airlie   2021-01-14  345  		if (IS_ERR(plane)) {
fbf756c31cca38 Dave Airlie   2021-01-14  346  			ret = PTR_ERR(plane);
fbf756c31cca38 Dave Airlie   2021-01-14  347  			goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  348  		}
fbf756c31cca38 Dave Airlie   2021-01-14 @349  		crtc->plane_ids_mask |= BIT(plane->id);
fbf756c31cca38 Dave Airlie   2021-01-14  350  	}
fbf756c31cca38 Dave Airlie   2021-01-14  351  
69e79a3a3208fb Ville Syrjälä 2025-02-06  352  	cursor = intel_cursor_plane_create(display, pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  353  	if (IS_ERR(cursor)) {
fbf756c31cca38 Dave Airlie   2021-01-14  354  		ret = PTR_ERR(cursor);
fbf756c31cca38 Dave Airlie   2021-01-14  355  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  356  	}
fbf756c31cca38 Dave Airlie   2021-01-14  357  	crtc->plane_ids_mask |= BIT(cursor->id);
fbf756c31cca38 Dave Airlie   2021-01-14  358  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  359  	if (HAS_GMCH(display)) {
b2479f7231d8b1 Ville Syrjälä 2025-02-06  360  		if (display->platform.cherryview ||
b2479f7231d8b1 Ville Syrjälä 2025-02-06  361  		    display->platform.valleyview ||
b2479f7231d8b1 Ville Syrjälä 2025-02-06  362  		    display->platform.g4x)
fbf756c31cca38 Dave Airlie   2021-01-14  363  			funcs = &g4x_crtc_funcs;
b2479f7231d8b1 Ville Syrjälä 2025-02-06  364  		else if (DISPLAY_VER(display) == 4)
fbf756c31cca38 Dave Airlie   2021-01-14  365  			funcs = &i965_crtc_funcs;
b2479f7231d8b1 Ville Syrjälä 2025-02-06  366  		else if (display->platform.i945gm ||
b2479f7231d8b1 Ville Syrjälä 2025-02-06  367  			 display->platform.i915gm)
fbf756c31cca38 Dave Airlie   2021-01-14  368  			funcs = &i915gm_crtc_funcs;
b2479f7231d8b1 Ville Syrjälä 2025-02-06  369  		else if (DISPLAY_VER(display) == 3)
fbf756c31cca38 Dave Airlie   2021-01-14  370  			funcs = &i915_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  371  		else
fbf756c31cca38 Dave Airlie   2021-01-14  372  			funcs = &i8xx_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  373  	} else {
b2479f7231d8b1 Ville Syrjälä 2025-02-06  374  		if (DISPLAY_VER(display) >= 8)
fbf756c31cca38 Dave Airlie   2021-01-14  375  			funcs = &bdw_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  376  		else
fbf756c31cca38 Dave Airlie   2021-01-14  377  			funcs = &ilk_crtc_funcs;
fbf756c31cca38 Dave Airlie   2021-01-14  378  	}
fbf756c31cca38 Dave Airlie   2021-01-14  379  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  380  	ret = drm_crtc_init_with_planes(display->drm, &crtc->base,
fbf756c31cca38 Dave Airlie   2021-01-14  381  					&primary->base, &cursor->base,
fbf756c31cca38 Dave Airlie   2021-01-14  382  					funcs, "pipe %c", pipe_name(pipe));
fbf756c31cca38 Dave Airlie   2021-01-14  383  	if (ret)
fbf756c31cca38 Dave Airlie   2021-01-14  384  		goto fail;
fbf756c31cca38 Dave Airlie   2021-01-14  385  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  386  	if (DISPLAY_VER(display) >= 11)
fbf756c31cca38 Dave Airlie   2021-01-14  387  		drm_crtc_create_scaling_filter_property(&crtc->base,
fbf756c31cca38 Dave Airlie   2021-01-14  388  						BIT(DRM_SCALING_FILTER_DEFAULT) |
fbf756c31cca38 Dave Airlie   2021-01-14  389  						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
fbf756c31cca38 Dave Airlie   2021-01-14  390  
a2b1d9ecaa755c Ville Syrjälä 2022-10-04  391  	intel_color_crtc_init(crtc);
a2b1d9ecaa755c Ville Syrjälä 2022-10-04  392  	intel_drrs_crtc_init(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  393  	intel_crtc_crc_init(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  394  
2bbc6fcaf8c58a Ville Syrjälä 2021-10-21  395  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
2bbc6fcaf8c58a Ville Syrjälä 2021-10-21  396  
b2479f7231d8b1 Ville Syrjälä 2025-02-06  397  	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
fbf756c31cca38 Dave Airlie   2021-01-14  398  
7460b69f1d61e8 Nemesa Garg   2025-10-28  399  	if (HAS_CASF(display))
7460b69f1d61e8 Nemesa Garg   2025-10-28  400  		drm_crtc_create_sharpness_strength_property(&crtc->base);
7460b69f1d61e8 Nemesa Garg   2025-10-28  401  
fbf756c31cca38 Dave Airlie   2021-01-14  402  	return 0;
fbf756c31cca38 Dave Airlie   2021-01-14  403  
fbf756c31cca38 Dave Airlie   2021-01-14  404  fail:
fbf756c31cca38 Dave Airlie   2021-01-14  405  	intel_crtc_free(crtc);
fbf756c31cca38 Dave Airlie   2021-01-14  406  
fbf756c31cca38 Dave Airlie   2021-01-14  407  	return ret;
fbf756c31cca38 Dave Airlie   2021-01-14  408  }
d471008b00c1a0 Dave Airlie   2021-02-05  409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
