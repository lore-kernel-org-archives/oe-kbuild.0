Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6056D1D8DE4
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 01:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748049895; cv=none; b=EEY6RalZ64Ko9UXUOJt/Ynj//mt9HXS+UZGRxofcFUMCZ/3eznSRJPFz+beulQX3ZPfvBVVDXikZB4KrLyRB3ikt39CJR7qoeblvOpRPjlYOPnlPGiuRPagFLJisaFDeYjcsjzAGCOQB/A6KksVcK5ECraaF5wky7TRI+mlzPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748049895; c=relaxed/simple;
	bh=vNHls/X5e7ne4gKtpqIgVSNK+oZlfaLoQbO+YeQ4NQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrJT21mklOlO3Xd8Ghn0+LbASb/7eChiBcdhwRALFtq13VU57AeIVW1aRQezCUsBNYMIwfoeCrPtNyqCHWfjARPwmCfQK3FJqYjZm0HixfSlqDUMI2Eq4llIlyTYvGW5NBm5Er7YpTdiZqh3hj1spGmr4ktvlpv9cL8Q1lrPnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ddg04Q9u; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ddg04Q9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748049894; x=1779585894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNHls/X5e7ne4gKtpqIgVSNK+oZlfaLoQbO+YeQ4NQk=;
  b=Ddg04Q9ukfvEzQg396I/U3zwR6zbksiktxBl55L8VTREyfZtHecgFy90
   jJwAijPGbY31uqI7HwW4cdsayQryw0NNBCMIOBYMIPhGEW/cI1r0SHLaJ
   //y4MTI52IJm0RPtmfVTC+YdsFfNiNjuYSOjikSMXBBbaLUpl1HCvBm7J
   02/Ujc/bA1G5gt4rXvE0NFN/xt8DjmXuwzhpgo07265inZwIiFE1HY0kt
   bU/RkXlEIlTKKtc7xyflC8x+broPF/AZZGDuGZDVCTnirLJHzEfxkExc3
   y7lhE4cBIqQFegPTSealvdQaJgaxGrZT9WdSLBgx46Wc1uVlUaCfS5yQB
   Q==;
X-CSE-ConnectionGUID: auehxZHTSb2QX8SvZng7jA==
X-CSE-MsgGUID: cDmbnMhBQC6rhwA8Aj7SIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50108519"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50108519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:24:53 -0700
X-CSE-ConnectionGUID: YorkL27aRfS6mUuZ3H03ag==
X-CSE-MsgGUID: 1SQ0bpRUQZmVYM8UhVINvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146566236"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2025 18:24:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdd3-000Qr8-1D;
	Sat, 24 May 2025 01:24:49 +0000
Date: Sat, 24 May 2025 09:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-desktop 0/24]
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c:396:39-40:
 WARNING opportunity for max()
Message-ID: <202505240945.5jvlhFRo-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   faddd8b9e49cb6ec917511d2839d916ea49312d3
commit: a29997b7ac1f5c816b543e0c56aa2b5b56baac24 [0/24] drm/amd/display: Limit VTotal range to max hw cap minus fp
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-053-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240945.5jvlhFRo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505240945.5jvlhFRo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c:396:39-40: WARNING opportunity for max()

vim +396 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c

a29997b7ac1f5c Dillon Varone    2024-11-13  352  
70839da6360500 Aurabindo Pillai 2024-04-19  353  static void populate_dml21_timing_config_from_stream_state(struct dml2_timing_cfg *timing,
a00e85713c372f Rodrigo Siqueira 2024-04-29  354  		struct dc_stream_state *stream,
a00e85713c372f Rodrigo Siqueira 2024-04-29  355  		struct dml2_context *dml_ctx)
70839da6360500 Aurabindo Pillai 2024-04-19  356  {
a29997b7ac1f5c Dillon Varone    2024-11-13  357  	unsigned int hblank_start, vblank_start, min_hardware_refresh_in_uhz;
70839da6360500 Aurabindo Pillai 2024-04-19  358  
70839da6360500 Aurabindo Pillai 2024-04-19  359  	timing->h_active = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
70839da6360500 Aurabindo Pillai 2024-04-19  360  	timing->v_active = stream->timing.v_addressable + stream->timing.v_border_bottom + stream->timing.v_border_top;
70839da6360500 Aurabindo Pillai 2024-04-19  361  	timing->h_front_porch = stream->timing.h_front_porch;
70839da6360500 Aurabindo Pillai 2024-04-19  362  	timing->v_front_porch = stream->timing.v_front_porch;
70839da6360500 Aurabindo Pillai 2024-04-19  363  	timing->pixel_clock_khz = stream->timing.pix_clk_100hz / 10;
70839da6360500 Aurabindo Pillai 2024-04-19  364  	if (stream->timing.timing_3d_format == TIMING_3D_FORMAT_HW_FRAME_PACKING)
70839da6360500 Aurabindo Pillai 2024-04-19  365  		timing->pixel_clock_khz *= 2;
70839da6360500 Aurabindo Pillai 2024-04-19  366  	timing->h_total = stream->timing.h_total;
70839da6360500 Aurabindo Pillai 2024-04-19  367  	timing->v_total = stream->timing.v_total;
70839da6360500 Aurabindo Pillai 2024-04-19  368  	timing->h_sync_width = stream->timing.h_sync_width;
70839da6360500 Aurabindo Pillai 2024-04-19  369  	timing->interlaced = stream->timing.flags.INTERLACE;
70839da6360500 Aurabindo Pillai 2024-04-19  370  
70839da6360500 Aurabindo Pillai 2024-04-19  371  	hblank_start = stream->timing.h_total - stream->timing.h_front_porch;
70839da6360500 Aurabindo Pillai 2024-04-19  372  
70839da6360500 Aurabindo Pillai 2024-04-19  373  	timing->h_blank_end = hblank_start - stream->timing.h_addressable
70839da6360500 Aurabindo Pillai 2024-04-19  374  		- stream->timing.h_border_left - stream->timing.h_border_right;
70839da6360500 Aurabindo Pillai 2024-04-19  375  
70839da6360500 Aurabindo Pillai 2024-04-19  376  	if (hblank_start < stream->timing.h_addressable)
70839da6360500 Aurabindo Pillai 2024-04-19  377  		timing->h_blank_end = 0;
70839da6360500 Aurabindo Pillai 2024-04-19  378  
70839da6360500 Aurabindo Pillai 2024-04-19  379  	vblank_start = stream->timing.v_total - stream->timing.v_front_porch;
70839da6360500 Aurabindo Pillai 2024-04-19  380  
70839da6360500 Aurabindo Pillai 2024-04-19  381  	timing->v_blank_end = vblank_start - stream->timing.v_addressable
70839da6360500 Aurabindo Pillai 2024-04-19  382  		- stream->timing.v_border_top - stream->timing.v_border_bottom;
70839da6360500 Aurabindo Pillai 2024-04-19  383  
70839da6360500 Aurabindo Pillai 2024-04-19  384  	timing->drr_config.enabled = stream->ignore_msa_timing_param;
70839da6360500 Aurabindo Pillai 2024-04-19  385  	timing->drr_config.drr_active_variable = stream->vrr_active_variable;
70839da6360500 Aurabindo Pillai 2024-04-19  386  	timing->drr_config.drr_active_fixed = stream->vrr_active_fixed;
70839da6360500 Aurabindo Pillai 2024-04-19  387  	timing->drr_config.disallowed = !stream->allow_freesync;
a00e85713c372f Rodrigo Siqueira 2024-04-29  388  
a29997b7ac1f5c Dillon Varone    2024-11-13  389  	/* limit min refresh rate to DC cap */
a29997b7ac1f5c Dillon Varone    2024-11-13  390  	min_hardware_refresh_in_uhz = stream->timing.min_refresh_in_uhz;
a29997b7ac1f5c Dillon Varone    2024-11-13  391  	if (stream->ctx->dc->caps.max_v_total != 0) {
a29997b7ac1f5c Dillon Varone    2024-11-13  392  		min_hardware_refresh_in_uhz = div64_u64((stream->timing.pix_clk_100hz * 100000000ULL),
a29997b7ac1f5c Dillon Varone    2024-11-13  393  				(stream->timing.h_total * (long long)calc_max_hardware_v_total(stream)));
a29997b7ac1f5c Dillon Varone    2024-11-13  394  	}
a29997b7ac1f5c Dillon Varone    2024-11-13  395  
a29997b7ac1f5c Dillon Varone    2024-11-13 @396  	if (stream->timing.min_refresh_in_uhz > min_hardware_refresh_in_uhz) {
a29997b7ac1f5c Dillon Varone    2024-11-13  397  		timing->drr_config.min_refresh_uhz = stream->timing.min_refresh_in_uhz;
a29997b7ac1f5c Dillon Varone    2024-11-13  398  	} else {
a29997b7ac1f5c Dillon Varone    2024-11-13  399  		timing->drr_config.min_refresh_uhz = min_hardware_refresh_in_uhz;
a29997b7ac1f5c Dillon Varone    2024-11-13  400  	}
a29997b7ac1f5c Dillon Varone    2024-11-13  401  
a00e85713c372f Rodrigo Siqueira 2024-04-29  402  	if (dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_increase &&
a00e85713c372f Rodrigo Siqueira 2024-04-29  403  			stream->ctx->dc->config.enable_fpo_flicker_detection == 1)
a00e85713c372f Rodrigo Siqueira 2024-04-29  404  		timing->drr_config.max_instant_vtotal_delta = dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_increase(stream, false);
a00e85713c372f Rodrigo Siqueira 2024-04-29  405  	else
a00e85713c372f Rodrigo Siqueira 2024-04-29  406  		timing->drr_config.max_instant_vtotal_delta = 0;
70839da6360500 Aurabindo Pillai 2024-04-19  407  
70839da6360500 Aurabindo Pillai 2024-04-19  408  	if (stream->timing.flags.DSC) {
70839da6360500 Aurabindo Pillai 2024-04-19  409  		timing->dsc.enable = dml2_dsc_enable;
70839da6360500 Aurabindo Pillai 2024-04-19  410  		timing->dsc.overrides.num_slices = stream->timing.dsc_cfg.num_slices_h;
70839da6360500 Aurabindo Pillai 2024-04-19  411  		timing->dsc.dsc_compressed_bpp_x16 = stream->timing.dsc_cfg.bits_per_pixel;
70839da6360500 Aurabindo Pillai 2024-04-19  412  	} else
70839da6360500 Aurabindo Pillai 2024-04-19  413  		timing->dsc.enable = dml2_dsc_disable;
70839da6360500 Aurabindo Pillai 2024-04-19  414  
70839da6360500 Aurabindo Pillai 2024-04-19  415  	switch (stream->timing.display_color_depth) {
70839da6360500 Aurabindo Pillai 2024-04-19  416  	case COLOR_DEPTH_666:
70839da6360500 Aurabindo Pillai 2024-04-19  417  		timing->bpc = 6;
70839da6360500 Aurabindo Pillai 2024-04-19  418  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  419  	case COLOR_DEPTH_888:
70839da6360500 Aurabindo Pillai 2024-04-19  420  		timing->bpc = 8;
70839da6360500 Aurabindo Pillai 2024-04-19  421  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  422  	case COLOR_DEPTH_101010:
70839da6360500 Aurabindo Pillai 2024-04-19  423  		timing->bpc = 10;
70839da6360500 Aurabindo Pillai 2024-04-19  424  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  425  	case COLOR_DEPTH_121212:
70839da6360500 Aurabindo Pillai 2024-04-19  426  		timing->bpc = 12;
70839da6360500 Aurabindo Pillai 2024-04-19  427  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  428  	case COLOR_DEPTH_141414:
70839da6360500 Aurabindo Pillai 2024-04-19  429  		timing->bpc = 14;
70839da6360500 Aurabindo Pillai 2024-04-19  430  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  431  	case COLOR_DEPTH_161616:
70839da6360500 Aurabindo Pillai 2024-04-19  432  		timing->bpc = 16;
70839da6360500 Aurabindo Pillai 2024-04-19  433  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  434  	case COLOR_DEPTH_999:
70839da6360500 Aurabindo Pillai 2024-04-19  435  		timing->bpc = 9;
70839da6360500 Aurabindo Pillai 2024-04-19  436  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  437  	case COLOR_DEPTH_111111:
70839da6360500 Aurabindo Pillai 2024-04-19  438  		timing->bpc = 11;
70839da6360500 Aurabindo Pillai 2024-04-19  439  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  440  	default:
70839da6360500 Aurabindo Pillai 2024-04-19  441  		timing->bpc = 8;
70839da6360500 Aurabindo Pillai 2024-04-19  442  		break;
70839da6360500 Aurabindo Pillai 2024-04-19  443  	}
70839da6360500 Aurabindo Pillai 2024-04-19  444  
70839da6360500 Aurabindo Pillai 2024-04-19  445  	timing->vblank_nom = timing->v_total - timing->v_active;
70839da6360500 Aurabindo Pillai 2024-04-19  446  }
70839da6360500 Aurabindo Pillai 2024-04-19  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
