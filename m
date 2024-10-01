Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F20C144
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 02:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727748232; cv=none; b=sBfO8EAx45HxKZ8qb//jMd+JcNPhO4/Ff4UMT0ueRr8GskQ9+vOhZrPpC3Jh6F5TvSExiISheL+VV4bEbigSI5WnMgHpJjjobzCxRFGdha7HaVw2sbrA4pgJlpJJacKv6mgd9+CeU/R4iv4LbGRKs1AI6lW6nVN4cfLQv0DXvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727748232; c=relaxed/simple;
	bh=t34/+j5ziQaBHeCe10P9J7TOKHufvt14sav9MA9jQiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J93E2kj0oJGDTrsIkDeVH7Yyd27QxgDe/Lfs3oexu9zDvoBDCVEiYSNBAG8+qkqDoFyo5yBHkDE0+tO6/tGljMRWGQfX/UkQUJs0aVk/V9oJ/zs6Is9yulS4J3Pky8a/Y//A+PZnvz1FO5lN/widvdsD4bJ462zePHo0GjNA8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5USBF8E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5USBF8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727748230; x=1759284230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t34/+j5ziQaBHeCe10P9J7TOKHufvt14sav9MA9jQiw=;
  b=e5USBF8EQ9P+kkhIGnzo26Z+w4GZCEfCy87LOyzYIicGpzyzWxa/HIHd
   cOx4vC0Jxz/BS4N4/QY0kaPlxSUD620RJXIlwwWQVDqUYXNyN7NVVigJB
   Xr4rD+CLLpo0mx4c6rAA97kBilqQjjW09qjXX0M4UEV1btL0B/d61l8cb
   iGz/uNdnjfNZueDutHvAYmDI6pidKDOXOR2I5BzUL3F2LHDq7pWXTBAil
   hyfmr9EZBZTDTZ3k0p8zCydFTZd16duhLTwhCwYbwMokEmm6yZWF7acsN
   uEr8PGgkfPn16o3T9GpkOhNmF1tpjgKSTXuBTZlrlq4W/KeuQt9+1Xd93
   g==;
X-CSE-ConnectionGUID: LAlw2r/bT0+MJ1gP9eWsmg==
X-CSE-MsgGUID: CPSaEza3QOqDq85Yr2u0Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27038221"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27038221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:03:49 -0700
X-CSE-ConnectionGUID: X5lUdsRiRCSt+DX3WbiZqw==
X-CSE-MsgGUID: HDjz3wfNSWCV21EddJUjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73168800"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2024 19:03:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSEr-000Q8h-14;
	Tue, 01 Oct 2024 02:03:45 +0000
Date: Tue, 1 Oct 2024 10:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 3/3] drm/i915/display: Call panel_fitting from
 pipe_config
Message-ID: <202410010933.PZc3ug9p-lkp@intel.com>
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
In-Reply-To: <20240925063032.2311796-4-nemesa.garg@intel.com>
References: <20240925063032.2311796-4-nemesa.garg@intel.com>
TO: Nemesa Garg <nemesa.garg@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: Nemesa Garg <nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc1 next-20240930]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Modify-panel_fitting-code-for-joiner/20240925-143239
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240925063032.2311796-4-nemesa.garg%40intel.com
patch subject: [PATCH v4 3/3] drm/i915/display: Call panel_fitting from pipe_config
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240930 (https://download.01.org/0day-ci/archive/20241001/202410010933.PZc3ug9p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410010933.PZc3ug9p-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_display.c:4792 intel_modeset_pipe_config() error: uninitialized symbol 'fixed_mode'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_display.c:6584 intel_atomic_check() warn: missing unwind goto?

vim +/fixed_mode +4792 drivers/gpu/drm/i915/display/intel_display.c

83a57153f5de29 drivers/gpu/drm/i915/intel_display.c         Ander Conselvan de Oliveira 2015-03-20  4645  
548ee15b38ff5f drivers/gpu/drm/i915/intel_display.c         Ander Conselvan de Oliveira 2015-04-21  4646  static int
aa07c1d3be699b drivers/gpu/drm/i915/display/intel_display.c Manasi Navare               2020-11-13  4647  intel_modeset_pipe_config(struct intel_atomic_state *state,
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4648  			  struct intel_crtc *crtc,
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4649  			  const struct intel_link_bw_limits *limits)
f6e5b1603b8bb7 drivers/gpu/drm/i915/intel_display.c         Chris Wilson                2011-04-12  4650  {
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4651  	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4652  	struct intel_crtc_state *crtc_state =
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4653  		intel_atomic_get_new_crtc_state(state, crtc);
da3ced29869a1e drivers/gpu/drm/i915/intel_display.c         Ander Conselvan de Oliveira 2015-04-21  4654  	struct drm_connector *connector;
0b901879393997 drivers/gpu/drm/i915/intel_display.c         Ander Conselvan de Oliveira 2015-03-20  4655  	struct drm_connector_state *connector_state;
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4656  	const struct drm_display_mode *fixed_mode;
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4657  	struct intel_dp *intel_dp;
26111a161ab56e drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-02-23  4658  	int pipe_src_w, pipe_src_h;
b50a1aa6e1e947 drivers/gpu/drm/i915/display/intel_display.c Manasi Navare               2020-02-14  4659  	int base_bpp, ret, i;
ee7b9f93fd96a7 drivers/gpu/drm/i915/intel_display.c         Jesse Barnes                2012-04-20  4660  
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4661  	crtc_state->cpu_transcoder = (enum transcoder) crtc->pipe;
b8cecdf5a8cb84 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-03-27  4662  
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4663  	crtc_state->framestart_delay = 1;
50c335f94d71c8 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-02-21  4664  
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4665  	/*
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4666  	 * Sanitize sync polarity flags based on requested ones. If neither
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4667  	 * positive or negative polarity is requested, treat this as meaning
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4668  	 * negative polarity.
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4669  	 */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4670  	if (!(crtc_state->hw.adjusted_mode.flags &
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4671  	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4672  		crtc_state->hw.adjusted_mode.flags |= DRM_MODE_FLAG_NHSYNC;
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4673  
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4674  	if (!(crtc_state->hw.adjusted_mode.flags &
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4675  	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4676  		crtc_state->hw.adjusted_mode.flags |= DRM_MODE_FLAG_NVSYNC;
2960bc9cceecb5 drivers/gpu/drm/i915/intel_display.c         Imre Deak                   2013-07-30  4677  
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4678  	ret = compute_baseline_pipe_bpp(state, crtc);
bcce8d8633ff01 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4679  	if (ret)
bcce8d8633ff01 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4680  		return ret;
bcce8d8633ff01 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4681  
36f579ffc69214 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-10-24  4682  	crtc_state->fec_enable = limits->force_fec_pipes & BIT(crtc->pipe);
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4683  	crtc_state->max_link_bpp_x16 = limits->max_bpp_x16[crtc->pipe];
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4684  
8466a14173e5ff drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2024-08-05  4685  	if (crtc_state->pipe_bpp > fxp_q4_to_int(crtc_state->max_link_bpp_x16)) {
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4686  		drm_dbg_kms(&i915->drm,
2796b7ceec95bd drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2024-08-05  4687  			    "[CRTC:%d:%s] Link bpp limited to " FXP_Q4_FMT "\n",
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4688  			    crtc->base.base.id, crtc->base.name,
2796b7ceec95bd drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2024-08-05  4689  			    FXP_Q4_ARGS(crtc_state->max_link_bpp_x16));
998d2cd361caeb drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4690  		crtc_state->bw_constrained = true;
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4691  	}
8ca0b875c08258 drivers/gpu/drm/i915/display/intel_display.c Imre Deak                   2023-09-21  4692  
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4693  	base_bpp = crtc_state->pipe_bpp;
4e53c2e010e531 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-03-27  4694  
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4695  	/*
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4696  	 * Determine the real pipe dimensions. Note that stereo modes can
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4697  	 * increase the actual pipe size due to the frame doubling and
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4698  	 * insertion of additional space for blanks between the frame. This
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4699  	 * is stored in the crtc timings. We use the requested mode to do this
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4700  	 * computation to clearly distinguish it from the adjusted mode, which
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4701  	 * can be changed by the connectors in the below retry loop.
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4702  	 */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4703  	drm_mode_get_hv_timing(&crtc_state->hw.mode,
26111a161ab56e drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-02-23  4704  			       &pipe_src_w, &pipe_src_h);
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4705  	drm_rect_init(&crtc_state->pipe_src, 0, 0,
26111a161ab56e drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-02-23  4706  		      pipe_src_w, pipe_src_h);
e41a56be017c6e drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2013-10-01  4707  
aa07c1d3be699b drivers/gpu/drm/i915/display/intel_display.c Manasi Navare               2020-11-13  4708  	for_each_new_connector_in_state(&state->base, connector, connector_state, i) {
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4709  		struct intel_encoder *encoder =
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4710  			to_intel_encoder(connector_state->best_encoder);
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4711  
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4712  		if (connector_state->crtc != &crtc->base)
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4713  			continue;
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4714  
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4715  		if (!check_single_encoder_cloning(state, crtc, encoder)) {
cd49f81806815b drivers/gpu/drm/i915/display/intel_display.c Wambui Karuga               2020-01-22  4716  			drm_dbg_kms(&i915->drm,
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4717  				    "[ENCODER:%d:%s] rejecting invalid cloning configuration\n",
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4718  				    encoder->base.base.id, encoder->base.name);
d26592c601ec24 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4719  			return -EINVAL;
e25148d01d58a7 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4720  		}
e25148d01d58a7 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4721  
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4722  		/*
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4723  		 * Determine output_types before calling the .compute_config()
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4724  		 * hooks so that the hooks can use this information safely.
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4725  		 */
7e732cacb1ae27 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2017-10-27  4726  		if (encoder->compute_output_type)
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4727  			crtc_state->output_types |=
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4728  				BIT(encoder->compute_output_type(encoder, crtc_state,
7e732cacb1ae27 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2017-10-27  4729  								 connector_state));
7e732cacb1ae27 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2017-10-27  4730  		else
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4731  			crtc_state->output_types |= BIT(encoder->type);
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4732  	}
253c84c82aaeb9 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2016-06-22  4733  
ef1b460d1bab7e drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-06-01  4734  	/* Ensure the port clock defaults are reset when retrying. */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4735  	crtc_state->port_clock = 0;
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4736  	crtc_state->pixel_multiplier = 1;
ff9a6750aca355 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-06-01  4737  
135c81b8c3c9a7 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-07-21  4738  	/* Fill in default crtc timings, allow encoders to overwrite them. */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4739  	drm_mode_set_crtcinfo(&crtc_state->hw.adjusted_mode,
2d112de7db9d2c drivers/gpu/drm/i915/intel_display.c         Ander Conselvan de Oliveira 2015-01-15  4740  			      CRTC_STEREO_DOUBLE);
135c81b8c3c9a7 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-07-21  4741  
7758a11340cc88 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2012-07-08  4742  	/* Pass our mode to the connectors and the CRTC to give them a chance to
7758a11340cc88 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2012-07-08  4743  	 * adjust it according to limitations or connector properties, and also
7758a11340cc88 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2012-07-08  4744  	 * a chance to reject the mode entirely.
f6e5b1603b8bb7 drivers/gpu/drm/i915/intel_display.c         Chris Wilson                2011-04-12  4745  	 */
aa07c1d3be699b drivers/gpu/drm/i915/display/intel_display.c Manasi Navare               2020-11-13  4746  	for_each_new_connector_in_state(&state->base, connector, connector_state, i) {
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4747  		struct intel_encoder *encoder =
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4748  			to_intel_encoder(connector_state->best_encoder);
691313ea621482 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2020-01-15  4749  
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4750  		if (connector_state->crtc != &crtc->base)
7758a11340cc88 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2012-07-08  4751  			continue;
7ae892337e3357 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-03-27  4752  
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4753  		ret = encoder->compute_config(encoder, crtc_state,
204474a6b859ff drivers/gpu/drm/i915/intel_display.c         Lyude Paul                  2019-01-15  4754  					      connector_state);
048a57fc0d6ab7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2021-09-30  4755  		if (ret == -EDEADLK)
048a57fc0d6ab7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2021-09-30  4756  			return ret;
204474a6b859ff drivers/gpu/drm/i915/intel_display.c         Lyude Paul                  2019-01-15  4757  		if (ret < 0) {
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4758  			drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] config failure: %d\n",
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4759  				    encoder->base.base.id, encoder->base.name, ret);
204474a6b859ff drivers/gpu/drm/i915/intel_display.c         Lyude Paul                  2019-01-15  4760  			return ret;
7ae892337e3357 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-03-27  4761  		}
ee7b9f93fd96a7 drivers/gpu/drm/i915/intel_display.c         Jesse Barnes                2012-04-20  4762  	}
ee7b9f93fd96a7 drivers/gpu/drm/i915/intel_display.c         Jesse Barnes                2012-04-20  4763  
ff9a6750aca355 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-06-01  4764  	/* Set default port clock if not overwritten by the encoder. Needs to be
ff9a6750aca355 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-06-01  4765  	 * done afterwards in case the encoder adjusts the mode. */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4766  	if (!crtc_state->port_clock)
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4767  		crtc_state->port_clock = crtc_state->hw.adjusted_mode.crtc_clock
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4768  			* crtc_state->pixel_multiplier;
ff9a6750aca355 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-06-01  4769  
3d140a3d881608 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4770  	ret = intel_crtc_compute_config(state, crtc);
8e2b4dffeca0a4 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4771  	if (ret == -EDEADLK)
d26592c601ec24 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4772  		return ret;
a23299bb9a49f0 drivers/gpu/drm/i915/display/intel_display.c Jani Nikula                 2021-09-30  4773  	if (ret < 0) {
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4774  		drm_dbg_kms(&i915->drm, "[CRTC:%d:%s] config failure: %d\n",
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4775  			    crtc->base.base.id, crtc->base.name, ret);
a23299bb9a49f0 drivers/gpu/drm/i915/display/intel_display.c Jani Nikula                 2021-09-30  4776  		return ret;
a23299bb9a49f0 drivers/gpu/drm/i915/display/intel_display.c Jani Nikula                 2021-09-30  4777  	}
e29c22c0c4fefe drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-02-21  4778  
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4779  	for_each_new_connector_in_state(&state->base, connector,
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4780  					connector_state, i) {
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4781  		struct intel_encoder *encoder =
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4782  			to_intel_encoder(connector_state->best_encoder);
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4783  
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4784  		if (connector_state->crtc != &crtc->base)
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4785  			continue;
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4786  
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4787  		intel_dp = enc_to_intel_dp(encoder);
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4788  
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4789  		if (!intel_dp)
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4790  			continue;
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4791  
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25 @4792  		if ((intel_dp_is_edp(intel_dp) && fixed_mode) ||
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4793  		    crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4794  			return intel_pch_panel_fitting(crtc_state, connector_state);
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4795  	}
f1c6f5c8170cef drivers/gpu/drm/i915/display/intel_display.c Nemesa Garg                 2024-09-25  4796  
e8fa4270536de2 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2015-08-12  4797  	/* Dithering seems to not pass-through bits correctly when it should, so
611032bfa71a76 drivers/gpu/drm/i915/intel_display.c         Manasi Navare               2017-01-24  4798  	 * only enable it on 6bpc panels and when its not a compliance
611032bfa71a76 drivers/gpu/drm/i915/intel_display.c         Manasi Navare               2017-01-24  4799  	 * test requesting 6bpc video pattern.
611032bfa71a76 drivers/gpu/drm/i915/intel_display.c         Manasi Navare               2017-01-24  4800  	 */
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4801  	crtc_state->dither = (crtc_state->pipe_bpp == 6*3) &&
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4802  		!crtc_state->dither_force_disable;
cd49f81806815b drivers/gpu/drm/i915/display/intel_display.c Wambui Karuga               2020-01-22  4803  	drm_dbg_kms(&i915->drm,
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4804  		    "[CRTC:%d:%s] hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
58ae532ee87578 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4805  		    crtc->base.base.id, crtc->base.name,
aa71f9870efea7 drivers/gpu/drm/i915/display/intel_display.c Ville Syrjälä               2022-05-03  4806  		    base_bpp, crtc_state->pipe_bpp, crtc_state->dither);
4e53c2e010e531 drivers/gpu/drm/i915/intel_display.c         Daniel Vetter               2013-03-27  4807  
d26592c601ec24 drivers/gpu/drm/i915/intel_display.c         Ville Syrjälä               2018-11-07  4808  	return 0;
ee7b9f93fd96a7 drivers/gpu/drm/i915/intel_display.c         Jesse Barnes                2012-04-20  4809  }
ee7b9f93fd96a7 drivers/gpu/drm/i915/intel_display.c         Jesse Barnes                2012-04-20  4810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
