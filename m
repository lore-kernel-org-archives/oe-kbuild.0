Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6414B95A
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325911; cv=none; b=dA0vsIu+FSIt4NnI92f1WQ7ScCqMtyhRVDxKv8B6kFRmXMBi+jhurvZEWXfTwJwjkmVvz7N1ZqUmpipi6PpyvXMAlvyrkaWLo8wsO4lUYAck9IS4LLDcmhs5MLPXhcqm1kcUpyNfWb8HX/pAXUzzoihiI31HXc6QAez4UGNaSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325911; c=relaxed/simple;
	bh=wLrkWM2VDzynXIKEbQ26rFC3DCBtFv30FVgRq2NIkQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GjoiSRcY8Tv2sTYBv9qZhlVj/ONGMx5CCEozHvvnTi1GI0jaVw2vNxXQRTTVobqFeWKHoQTn+xN5reZSy+xr7l3eFwSYRb65JZm7qapOpB/gk0nF2DUl0MIXX9aOlbrF5tsDBOMV0Pzm0k9kjWer/uI+JR0hNZE7nGKtT59bMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cv2VErzX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cv2VErzX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f796586so168701525e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 08 Jan 2025 00:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736325906; x=1736930706; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JP018VLwPV0hK3cOGPTiHoAVwa0YSAd3lxx+6rxQn8c=;
        b=Cv2VErzXJfWCpUE1mif9upA8qg6HGWOcneFVntc5f0vMdsMhTczNsJfUHoVLf/Q2Bf
         5H1RmmxAd3y8fN4EiTrNTI/kD17JFY3cy5bXwG3YJ2QqGmRXqDsm4XIvmomcFequM8F+
         ZglyPj7NXRQBIQwRYHXtyET92LEQ64fGOtle267NUwoj3SLZDTT7AXRheRs9q2cJ5l2A
         72BLxKo2KWoP5w4RVqIwprG+Jq64PN+hlLSZCg4bOlSAr93TRyDwaMMAMhAUct3oGi29
         Zov8zM9EOxZlM6zot3yHOLm4mLADgTEDYDy/PsNyBV1rEoFjGNT+rEZCsoZM/VuRZ76k
         SXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325906; x=1736930706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JP018VLwPV0hK3cOGPTiHoAVwa0YSAd3lxx+6rxQn8c=;
        b=jjTFmWChCONeESHv4IBzjSOS+67uYQKla0agszarxmFNn2mS9U2ACsuyx3SQ1ZoztK
         izfT3BxOf+rT2cYtPmejFB4sPVgiwBTywqK7ntmeLZQbeuURvAmPraVhPO6enC0m4Uro
         Jew/nRBpeX1n+l3t4TDsnFCnA8KMdSF1vhA/QkYBxHa9MrrMIqjuGGarteJegc91vSCr
         ffAOY5ORO7goI7rafw7HJ6G24WH/qCEgnM6wNUuBIU9yTsf0un4kcZOaKLr7czP2cozH
         yY+064aXQAv0J4SgYlq6pPgzlm6X0RlsUUeeumO6fdMgvzYRVv15Z6dwwcxy3tdC/Po1
         Ue3Q==
X-Gm-Message-State: AOJu0Yzfs8QRal9I3HMvHypJXyM4AM5DWanoPzx+zurMqL6XjBr4l7c6
	qbD9b12LYR76xq5xBvUpZ/+0nHRUQgCU+i84ShITt9WLHDyw852xTsYz5YFtbBru0SFEkct2mNO
	R
X-Gm-Gg: ASbGncvem94DpaSXgGuPvtEkUfX2GuDj/QQPdAesBows6mqjSKj2lYYoVOdpTcuFvP9
	/lY1XNhTtcsftKjPhs7+ghe/QlibDe4uwDRC73BXL1XSShxuaBdEhZeJQpttjjUTKSVKvrrV++K
	dqHr2iDsvXY/dpven4T60lJ6MJzuFt4v9WzR57HtnkwVnhAdDsnUmmxyGKMjanyfDitccLWB243
	hSxi866swbohXJN6yv/eD0Fn9Ei7DhD1VwUauabRBVw4bxZqf9HL75Xay3PtQ==
X-Google-Smtp-Source: AGHT+IHIqqZOLSIy8nKlU099+xiY1TE/M8WEOwgqMg2Q+R1j5urlOdP028lHRQ6DNFXejmLw9S7jkw==
X-Received: by 2002:a05:600c:3506:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-436e26f137dmr12310595e9.29.1736325906293;
        Wed, 08 Jan 2025 00:45:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0babsm13161145e9.14.2025.01.08.00.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:45:05 -0800 (PST)
Date: Wed, 8 Jan 2025 11:45:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com
Subject: Re: [PATCH v3 3/5] drm/i915/scaler: Compute scaling factors for pipe
 scaler
Message-ID: <9b0fef6f-9bb9-492d-a984-da825858df47@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106165111.1672722-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-scaler-Add-and-compute-scaling-factors/20250107-005708
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250106165111.1672722-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v3 3/5] drm/i915/scaler: Compute scaling factors for pipe scaler
config: x86_64-randconfig-161-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080440.Cxe0ZHXJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501080440.Cxe0ZHXJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/skl_scaler.c:451 intel_atomic_setup_scaler() error: uninitialized symbol 'hscale'.
drivers/gpu/drm/i915/display/skl_scaler.c:452 intel_atomic_setup_scaler() error: uninitialized symbol 'vscale'.

vim +/hscale +451 drivers/gpu/drm/i915/display/skl_scaler.c

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

vscale and hscale are initialized if crtc_state->pch_pfit.enabled or
plane_state->hw.fb is true, but otherwise they aren't.


8976b18249407d Ville Syrjälä 2023-04-18  453  
3360d4d6d42ab3 Ville Syrjälä 2024-11-07  454  	drm_dbg_kms(display->drm, "Attached scaler id %u.%u to %s:%d\n",
7488f64e89b02f Ville Syrjälä 2024-11-07  455  		    crtc->pipe, *scaler_id, name, idx);
8976b18249407d Ville Syrjälä 2023-04-18  456  	scaler_state->scalers[*scaler_id].mode = mode;
8976b18249407d Ville Syrjälä 2023-04-18  457  
8976b18249407d Ville Syrjälä 2023-04-18  458  	return 0;
8976b18249407d Ville Syrjälä 2023-04-18  459  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

