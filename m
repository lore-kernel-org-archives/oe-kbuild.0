Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8137194A75
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736282552; cv=none; b=K+1tD3KO78fRWVKX6HdI+5SEyih4lOh86jbCbCESyeHvAl467Am8g5sLP9CyT+6G+Jvi8KfIdFBnge8IhRGd5ZqRPRM8hupD1EZSDShWjgtsIOJ9U24fZga+w1jJ3UtjZcwa6qsmQb6OHk9ksflr1CoQH6hrX4XLPqc4ZpaQWtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736282552; c=relaxed/simple;
	bh=YhGuG29XXTglEqqqeAgDXoRogGODixl33lwr2zeQ8Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fRrVP3geii7cs34leGrRHbbFfO/p+oG3iobC7XzMBtZVg6wZojSQEUZK6uVunIwdVcxrjZeRq/crFeQ+GEBYkNpCZYpYgo57XU6RhlMa71xfNbDS/7cD/9+GAr22WwoaZamcTp8uZA5hSUOhMJZufnIBHOCpxmFFXnsOEaAyEoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEdmsc6o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEdmsc6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736282550; x=1767818550;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YhGuG29XXTglEqqqeAgDXoRogGODixl33lwr2zeQ8Nw=;
  b=JEdmsc6oHBAzs0pk0/X1RKKEmWUrhc6Q6UyroF4QXEA4XxZW3gkcPZrg
   KLw1WXALyMWx4pY1da2SOOzjcxoe5soPiljNlZgd79COCdMYQohikBXIF
   juCFa2AHqoJ02h5reKRjO2mO4Z1siEYb456pmAiupsianxWwt58m5DBhg
   Uk31y/SSSloA5fnCvOSad/V97cofq9YMP1OSSMFmyRiNKnTdE5rtXO8nO
   qv63LOhYpHBhx0WIJKasfj8jtyw/GChhlhUixpEwSDOhWleNvJrd5SQz8
   0fDV4h8vN6/7m9iHSCm0aeJNe+Eb8amdpr8OrkTdWAge/+5sxinnWAnBZ
   w==;
X-CSE-ConnectionGUID: SkXgNA9pSYOekckPuFFO+A==
X-CSE-MsgGUID: yf7tXGM4TgC9+9Ni6QACjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309952"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="39309952"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:42:27 -0800
X-CSE-ConnectionGUID: Zt8Q1obYT5aMlBrjElB1Sg==
X-CSE-MsgGUID: l9qloDepQQmGiQN0ElXzDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102785391"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jan 2025 12:42:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVGP9-000FCV-1d;
	Tue, 07 Jan 2025 20:42:23 +0000
Date: Wed, 8 Jan 2025 04:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/5] drm/i915/scaler: Compute scaling factors for pipe
 scaler
Message-ID: <202501080440.Cxe0ZHXJ-lkp@intel.com>
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
In-Reply-To: <20250106165111.1672722-4-mitulkumar.ajitkumar.golani@intel.com>
References: <20250106165111.1672722-4-mitulkumar.ajitkumar.golani@intel.com>
TO: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: intel-xe@lists.freedesktop.org
CC: ankit.k.nautiyal@intel.com
CC: jani.nikula@intel.com

Hi Mitul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20250107]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.13-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-scaler-Add-and-compute-scaling-factors/20250107-005708
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250106165111.1672722-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v3 3/5] drm/i915/scaler: Compute scaling factors for pipe scaler
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080440.Cxe0ZHXJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501080440.Cxe0ZHXJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/skl_scaler.c:451 intel_atomic_setup_scaler() error: uninitialized symbol 'hscale'.
drivers/gpu/drm/i915/display/skl_scaler.c:452 intel_atomic_setup_scaler() error: uninitialized symbol 'vscale'.

vim +/hscale +451 drivers/gpu/drm/i915/display/skl_scaler.c

ecf2afc59c1ea3 Ville Syrjälä 2024-11-07  311  
61e24d4de0edbc Mitul Golani  2025-01-06  312  static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
7488f64e89b02f Ville Syrjälä 2024-11-07  313  				     int num_scalers_need, struct intel_crtc *crtc,
8976b18249407d Ville Syrjälä 2023-04-18  314  				     const char *name, int idx,
8976b18249407d Ville Syrjälä 2023-04-18  315  				     struct intel_plane_state *plane_state,
8976b18249407d Ville Syrjälä 2023-04-18  316  				     int *scaler_id)
8976b18249407d Ville Syrjälä 2023-04-18  317  {
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  318  	struct intel_display *display = to_intel_display(crtc);
61e24d4de0edbc Mitul Golani  2025-01-06  319  	struct intel_crtc_scaler_state *scaler_state =
61e24d4de0edbc Mitul Golani  2025-01-06  320  					&crtc_state->scaler_state;
7488f64e89b02f Ville Syrjälä 2024-11-07  321  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
8976b18249407d Ville Syrjälä 2023-04-18  322  	u32 mode;
7c369018e87617 Mitul Golani  2025-01-06  323  	int hscale, vscale;
8976b18249407d Ville Syrjälä 2023-04-18  324  
ecf2afc59c1ea3 Ville Syrjälä 2024-11-07  325  	if (*scaler_id < 0)
ecf2afc59c1ea3 Ville Syrjälä 2024-11-07  326  		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
8976b18249407d Ville Syrjälä 2023-04-18  327  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  328  	if (drm_WARN(display->drm, *scaler_id < 0,
8976b18249407d Ville Syrjälä 2023-04-18  329  		     "Cannot find scaler for %s:%d\n", name, idx))
8976b18249407d Ville Syrjälä 2023-04-18  330  		return -EINVAL;
8976b18249407d Ville Syrjälä 2023-04-18  331  
8976b18249407d Ville Syrjälä 2023-04-18  332  	/* set scaler mode */
8976b18249407d Ville Syrjälä 2023-04-18  333  	if (plane_state && plane_state->hw.fb &&
8976b18249407d Ville Syrjälä 2023-04-18  334  	    plane_state->hw.fb->format->is_yuv &&
8976b18249407d Ville Syrjälä 2023-04-18  335  	    plane_state->hw.fb->format->num_planes > 1) {
8976b18249407d Ville Syrjälä 2023-04-18  336  		struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
8976b18249407d Ville Syrjälä 2023-04-18  337  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  338  		if (DISPLAY_VER(display) == 9) {
8976b18249407d Ville Syrjälä 2023-04-18  339  			mode = SKL_PS_SCALER_MODE_NV12;
8976b18249407d Ville Syrjälä 2023-04-18  340  		} else if (icl_is_hdr_plane(dev_priv, plane->id)) {
8976b18249407d Ville Syrjälä 2023-04-18  341  			/*
8976b18249407d Ville Syrjälä 2023-04-18  342  			 * On gen11+'s HDR planes we only use the scaler for
8976b18249407d Ville Syrjälä 2023-04-18  343  			 * scaling. They have a dedicated chroma upsampler, so
8976b18249407d Ville Syrjälä 2023-04-18  344  			 * we don't need the scaler to upsample the UV plane.
8976b18249407d Ville Syrjälä 2023-04-18  345  			 */
8976b18249407d Ville Syrjälä 2023-04-18  346  			mode = PS_SCALER_MODE_NORMAL;
8976b18249407d Ville Syrjälä 2023-04-18  347  		} else {
8976b18249407d Ville Syrjälä 2023-04-18  348  			struct intel_plane *linked =
8976b18249407d Ville Syrjälä 2023-04-18  349  				plane_state->planar_linked_plane;
8976b18249407d Ville Syrjälä 2023-04-18  350  
8976b18249407d Ville Syrjälä 2023-04-18  351  			mode = PS_SCALER_MODE_PLANAR;
8976b18249407d Ville Syrjälä 2023-04-18  352  
8976b18249407d Ville Syrjälä 2023-04-18  353  			if (linked)
ebb4e2b03acc3a Ville Syrjälä 2023-04-26  354  				mode |= PS_BINDING_Y_PLANE(linked->id);
8976b18249407d Ville Syrjälä 2023-04-18  355  		}
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  356  	} else if (DISPLAY_VER(display) >= 10) {
8976b18249407d Ville Syrjälä 2023-04-18  357  		mode = PS_SCALER_MODE_NORMAL;
7488f64e89b02f Ville Syrjälä 2024-11-07  358  	} else if (num_scalers_need == 1 && crtc->num_scalers > 1) {
8976b18249407d Ville Syrjälä 2023-04-18  359  		/*
8976b18249407d Ville Syrjälä 2023-04-18  360  		 * when only 1 scaler is in use on a pipe with 2 scalers
8976b18249407d Ville Syrjälä 2023-04-18  361  		 * scaler 0 operates in high quality (HQ) mode.
8976b18249407d Ville Syrjälä 2023-04-18  362  		 * In this case use scaler 0 to take advantage of HQ mode
8976b18249407d Ville Syrjälä 2023-04-18  363  		 */
3de26c81e9ae4a Ville Syrjälä 2024-11-07  364  		scaler_state->scalers[*scaler_id].in_use = false;
8976b18249407d Ville Syrjälä 2023-04-18  365  		*scaler_id = 0;
3de26c81e9ae4a Ville Syrjälä 2024-11-07  366  		scaler_state->scalers[0].in_use = true;
8976b18249407d Ville Syrjälä 2023-04-18  367  		mode = SKL_PS_SCALER_MODE_HQ;
8976b18249407d Ville Syrjälä 2023-04-18  368  	} else {
8976b18249407d Ville Syrjälä 2023-04-18  369  		mode = SKL_PS_SCALER_MODE_DYN;
8976b18249407d Ville Syrjälä 2023-04-18  370  	}
8976b18249407d Ville Syrjälä 2023-04-18  371  
8976b18249407d Ville Syrjälä 2023-04-18  372  	if (plane_state && plane_state->hw.fb) {
8976b18249407d Ville Syrjälä 2023-04-18  373  		const struct drm_framebuffer *fb = plane_state->hw.fb;
8976b18249407d Ville Syrjälä 2023-04-18  374  		const struct drm_rect *src = &plane_state->uapi.src;
8976b18249407d Ville Syrjälä 2023-04-18  375  		const struct drm_rect *dst = &plane_state->uapi.dst;
7c369018e87617 Mitul Golani  2025-01-06  376  		int max_vscale, max_hscale;
8976b18249407d Ville Syrjälä 2023-04-18  377  
8976b18249407d Ville Syrjälä 2023-04-18  378  		/*
8976b18249407d Ville Syrjälä 2023-04-18  379  		 * FIXME: When two scalers are needed, but only one of
8976b18249407d Ville Syrjälä 2023-04-18  380  		 * them needs to downscale, we should make sure that
8976b18249407d Ville Syrjälä 2023-04-18  381  		 * the one that needs downscaling support is assigned
8976b18249407d Ville Syrjälä 2023-04-18  382  		 * as the first scaler, so we don't reject downscaling
8976b18249407d Ville Syrjälä 2023-04-18  383  		 * unnecessarily.
8976b18249407d Ville Syrjälä 2023-04-18  384  		 */
8976b18249407d Ville Syrjälä 2023-04-18  385  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  386  		if (DISPLAY_VER(display) >= 14) {
8976b18249407d Ville Syrjälä 2023-04-18  387  			/*
8976b18249407d Ville Syrjälä 2023-04-18  388  			 * On versions 14 and up, only the first
8976b18249407d Ville Syrjälä 2023-04-18  389  			 * scaler supports a vertical scaling factor
8976b18249407d Ville Syrjälä 2023-04-18  390  			 * of more than 1.0, while a horizontal
8976b18249407d Ville Syrjälä 2023-04-18  391  			 * scaling factor of 3.0 is supported.
8976b18249407d Ville Syrjälä 2023-04-18  392  			 */
8976b18249407d Ville Syrjälä 2023-04-18  393  			max_hscale = 0x30000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  394  			if (*scaler_id == 0)
8976b18249407d Ville Syrjälä 2023-04-18  395  				max_vscale = 0x30000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  396  			else
8976b18249407d Ville Syrjälä 2023-04-18  397  				max_vscale = 0x10000;
8976b18249407d Ville Syrjälä 2023-04-18  398  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  399  		} else if (DISPLAY_VER(display) >= 10 ||
8976b18249407d Ville Syrjälä 2023-04-18  400  			   !intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
8976b18249407d Ville Syrjälä 2023-04-18  401  			max_hscale = 0x30000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  402  			max_vscale = 0x30000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  403  		} else {
8976b18249407d Ville Syrjälä 2023-04-18  404  			max_hscale = 0x20000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  405  			max_vscale = 0x20000 - 1;
8976b18249407d Ville Syrjälä 2023-04-18  406  		}
8976b18249407d Ville Syrjälä 2023-04-18  407  
8976b18249407d Ville Syrjälä 2023-04-18  408  		/*
8976b18249407d Ville Syrjälä 2023-04-18  409  		 * FIXME: We should change the if-else block above to
8976b18249407d Ville Syrjälä 2023-04-18  410  		 * support HQ vs dynamic scaler properly.
8976b18249407d Ville Syrjälä 2023-04-18  411  		 */
8976b18249407d Ville Syrjälä 2023-04-18  412  
8976b18249407d Ville Syrjälä 2023-04-18  413  		/* Check if required scaling is within limits */
8976b18249407d Ville Syrjälä 2023-04-18  414  		hscale = drm_rect_calc_hscale(src, dst, 1, max_hscale);
8976b18249407d Ville Syrjälä 2023-04-18  415  		vscale = drm_rect_calc_vscale(src, dst, 1, max_vscale);
8976b18249407d Ville Syrjälä 2023-04-18  416  
8976b18249407d Ville Syrjälä 2023-04-18  417  		if (hscale < 0 || vscale < 0) {
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  418  			drm_dbg_kms(display->drm,
8976b18249407d Ville Syrjälä 2023-04-18  419  				    "Scaler %d doesn't support required plane scaling\n",
8976b18249407d Ville Syrjälä 2023-04-18  420  				    *scaler_id);
8976b18249407d Ville Syrjälä 2023-04-18  421  			drm_rect_debug_print("src: ", src, true);
8976b18249407d Ville Syrjälä 2023-04-18  422  			drm_rect_debug_print("dst: ", dst, false);
8976b18249407d Ville Syrjälä 2023-04-18  423  
8976b18249407d Ville Syrjälä 2023-04-18  424  			return -EINVAL;
8976b18249407d Ville Syrjälä 2023-04-18  425  		}
7c369018e87617 Mitul Golani  2025-01-06  426  	}
7c369018e87617 Mitul Golani  2025-01-06  427  
7c369018e87617 Mitul Golani  2025-01-06  428  	if (crtc_state->pch_pfit.enabled) {
7c369018e87617 Mitul Golani  2025-01-06  429  		struct drm_rect src;
7c369018e87617 Mitul Golani  2025-01-06  430  
7c369018e87617 Mitul Golani  2025-01-06  431  		drm_rect_init(&src, 0, 0,
7c369018e87617 Mitul Golani  2025-01-06  432  			      drm_rect_width(&crtc_state->pipe_src) << 16,
7c369018e87617 Mitul Golani  2025-01-06  433  			      drm_rect_height(&crtc_state->pipe_src) << 16);
7c369018e87617 Mitul Golani  2025-01-06  434  
7c369018e87617 Mitul Golani  2025-01-06  435  		hscale = drm_rect_calc_hscale(&src, &crtc_state->pch_pfit.dst,
7c369018e87617 Mitul Golani  2025-01-06  436  					      0, INT_MAX);
7c369018e87617 Mitul Golani  2025-01-06  437  		vscale = drm_rect_calc_vscale(&src, &crtc_state->pch_pfit.dst,
7c369018e87617 Mitul Golani  2025-01-06  438  					      0, INT_MAX);
7c369018e87617 Mitul Golani  2025-01-06  439  
7c369018e87617 Mitul Golani  2025-01-06  440  		if (hscale < 0 || vscale < 0) {
7c369018e87617 Mitul Golani  2025-01-06  441  			drm_dbg_kms(display->drm,
7c369018e87617 Mitul Golani  2025-01-06  442  				    "Scaler %d doesn't support required pipe scaling\n",
7c369018e87617 Mitul Golani  2025-01-06  443  				    *scaler_id);
7c369018e87617 Mitul Golani  2025-01-06  444  			drm_rect_debug_print("src: ", &src, true);
7c369018e87617 Mitul Golani  2025-01-06  445  			drm_rect_debug_print("dst: ", &crtc_state->pch_pfit.dst, false);
7c369018e87617 Mitul Golani  2025-01-06  446  
7c369018e87617 Mitul Golani  2025-01-06  447  			return -EINVAL;
7c369018e87617 Mitul Golani  2025-01-06  448  		}
7c369018e87617 Mitul Golani  2025-01-06  449  	}
0641adb4624b5e Mitul Golani  2025-01-06  450  
0641adb4624b5e Mitul Golani  2025-01-06 @451  	scaler_state->scalers[*scaler_id].hscale = hscale;
0641adb4624b5e Mitul Golani  2025-01-06 @452  	scaler_state->scalers[*scaler_id].vscale = vscale;
8976b18249407d Ville Syrjälä 2023-04-18  453  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  454  	drm_dbg_kms(display->drm, "Attached scaler id %u.%u to %s:%d\n",
7488f64e89b02f Ville Syrjälä 2024-11-07  455  		    crtc->pipe, *scaler_id, name, idx);
8976b18249407d Ville Syrjälä 2023-04-18  456  	scaler_state->scalers[*scaler_id].mode = mode;
8976b18249407d Ville Syrjälä 2023-04-18  457  
8976b18249407d Ville Syrjälä 2023-04-18  458  	return 0;
8976b18249407d Ville Syrjälä 2023-04-18  459  }
8976b18249407d Ville Syrjälä 2023-04-18  460  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
