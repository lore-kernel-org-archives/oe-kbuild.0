Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D81C3F38
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402865; cv=none; b=aGAbwT616dpGkrFIKSxNb2p9Wb8SZ0urjrkJ9T1cAc2pH8lTlP4l628KfaW1STK+YSshvzrFATqn8uqHFKMOfdvunfWv4lJoVyX2IgiWa36mliGRRGzMvqSxAuY3fvHzctwESURrHo+u0675URQe4VhoiFYagbwIIPWZgMtHwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402865; c=relaxed/simple;
	bh=nbivMgqjPkDUkavGzzK2z4gI0CgTCHY7eS0wKcZYO78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XOVVlhK6oIr3koLvzRypy/sogguxSJnuHo1PHcgrZ2iO6XXgm0mKdqMMd0H7wUOQTUVzm8ABjuMPx5xZWvCE94PRRpgjupz7AQ8c/uyuOF6nt7Uc2uohg7efQQXUT45X3d+nUzZrVknOkAnIZXGgxqhmpBp23rdk2f+uzMZEBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwbRUiLH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwbRUiLH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae102702so19248485e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726402862; x=1727007662; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f/cChD3RtsO+wRk6LOTLwGyXke8XHaeDLPwpHkMkngQ=;
        b=FwbRUiLHVoELTARqnXxlUpKR6b5It8Q7Phr4AwOLH5xmVOvjrMrAkUaDDif+w3JldZ
         XQgr/RPeOHkLaKRfnkJaWht8EsK4Mw4AG5UqoXDL0JGMTMAxf96K+U7cdgK7m8EH06ZX
         1skVwNsaZSnoduLc3s1cD8lTHmkKPFdXu1f50bgqjIm/rbpfRzrwJkptL4K0r4kfnImv
         /Y7qt00cnq5Xsq4/kuMSUOKCl1bIP1baal4qqj0loDxTPjVcqvqT9RCtncdZE+SD+lX6
         2nNh0p28yum3uk/+YLjuOCmD7gTdFEDc8x9CJZjBDIAfcIh0KmMR7NhMiI3c4w/EP/Hp
         N70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726402862; x=1727007662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cChD3RtsO+wRk6LOTLwGyXke8XHaeDLPwpHkMkngQ=;
        b=XY8JB78cNaTpFFjCNRNr5EURRUrgt8EI5Tir+6j735K/DVIC/gAtV2gujNOmkSOAfR
         xtsohyQW7lWG58YfQmJZG2zTcvG/4y4eMr1kkozEsl0s0eLW7F4QujqPA6xby06aItjI
         uPwWRhoXd4oPO2jIS/EZEFii28wb4abmvnvJGZ537n1nd2Wv2K4G0y8RcHeNplWvT9Oo
         u5heMcf3ugiSqWHI7iva4UOUrT63X1ZQ1MSLS0xxSLJjawQeLfnwgJY3Lrimzd7fnRz6
         oFOrkbeagfHD31AFAD5ym6h88MnW3YFW9vIxB+4SZsYXRid54PXoYFbPW15ZX3Yn76rQ
         UREA==
X-Gm-Message-State: AOJu0YwVFLqG6iHEW3RbAwTcsM7r2Mpmk3G4i6JBSHSxx7dlG1O4m7tQ
	JdjugYdn5vmm7Td49Eaq4qhPcf4MbK5q6JvWT/oJ5SwoFm9/07bnnQk5h2Sc3LWWFPmPG0iEA4R
	F
X-Google-Smtp-Source: AGHT+IG0JI7Qbv956I1/ozTovHJY3uhyPV9YHjYZxyeYtvP3yP60B0OsrIPBqDf5KkpdB9zTYToXWg==
X-Received: by 2002:a05:600c:3492:b0:42c:ad30:678 with SMTP id 5b1f17b1804b1-42d964d8446mr62309105e9.28.1726402861736;
        Sun, 15 Sep 2024 05:21:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b1949c3sm81624155e9.46.2024.09.15.05.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 05:21:01 -0700 (PDT)
Date: Sun, 15 Sep 2024 15:20:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nemesa Garg <nemesa.garg@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Message-ID: <ec32680f-fa31-445b-83f5-022e2af7a86d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910143619.143514-1-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Workaround-for-odd-panning-for-planar-yuv/20240910-223820
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240910143619.143514-1-nemesa.garg%40intel.com
patch subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
config: x86_64-randconfig-161-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151558.ETIW5UMU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409151558.ETIW5UMU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_atomic_plane.c:1045 intel_plane_check_src_coordinates() error: uninitialized symbol 'hsub'.

vim +/hsub +1045 drivers/gpu/drm/i915/display/intel_atomic_plane.c

0ec2a5b291af32 Ville Syrjälä       2023-03-14   991  int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
0ec2a5b291af32 Ville Syrjälä       2023-03-14   992  {
0ec2a5b291af32 Ville Syrjälä       2023-03-14   993  	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
0ec2a5b291af32 Ville Syrjälä       2023-03-14   994  	const struct drm_framebuffer *fb = plane_state->hw.fb;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   995  	struct drm_rect *src = &plane_state->uapi.src;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   996  	u32 src_x, src_y, src_w, src_h, hsub, vsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14   997  	bool rotated = drm_rotation_90_or_270(plane_state->hw.rotation);
0ec2a5b291af32 Ville Syrjälä       2023-03-14   998  
0ec2a5b291af32 Ville Syrjälä       2023-03-14   999  	/*
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1000  	 * FIXME hsub/vsub vs. block size is a mess. Pre-tgl CCS
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1001  	 * abuses hsub/vsub so we can't use them here. But as they
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1002  	 * are limited to 32bpp RGB formats we don't actually need
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1003  	 * to check anything.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1004  	 */
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1005  	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1006  	    fb->modifier == I915_FORMAT_MOD_Yf_TILED_CCS)
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1007  		return 0;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1008  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1009  	/*
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1010  	 * Hardware doesn't handle subpixel coordinates.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1011  	 * Adjust to (macro)pixel boundary, but be careful not to
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1012  	 * increase the source viewport size, because that could
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1013  	 * push the downscaling factor out of bounds.
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1014  	 */
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1015  	src_x = src->x1 >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1016  	src_w = drm_rect_width(src) >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1017  	src_y = src->y1 >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1018  	src_h = drm_rect_height(src) >> 16;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1019  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1020  	drm_rect_init(src, src_x << 16, src_y << 16,
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1021  		      src_w << 16, src_h << 16);
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1022  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1023  	if (fb->format->format == DRM_FORMAT_RGB565 && rotated) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1024  		hsub = 2;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1025  		vsub = 2;
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1026  	} else if (DISPLAY_VER(i915) >= 20 &&
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1027  		   intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1028  		/*
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1029  		 * This allows NV12 and P0xx formats to have odd size and/or odd
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1030  		 * source coordinates on DISPLAY_VER(i915) >= 20
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1031  		 */
533a7836d39f1a Juha-Pekka Heikkilä 2023-09-19  1032  		vsub = 1;
68f459ad919373 Nemesa Garg         2024-09-10  1033  		/*
68f459ad919373 Nemesa Garg         2024-09-10  1034  		 * Wa_16023981245 for display version 20.
68f459ad919373 Nemesa Garg         2024-09-10  1035  		 * Do not support odd x-panning for NV12.
68f459ad919373 Nemesa Garg         2024-09-10  1036  		 */
68f459ad919373 Nemesa Garg         2024-09-10  1037  		if (IS_LUNARLAKE(i915) && fb->format->format != DRM_FORMAT_NV12)
68f459ad919373 Nemesa Garg         2024-09-10  1038  			hsub = 1;

husb needs to be initialized on the else path.

0ec2a5b291af32 Ville Syrjälä       2023-03-14  1039  	} else {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1040  		hsub = fb->format->hsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1041  		vsub = fb->format->vsub;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1042  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1043  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1044  	if (rotated)
0ec2a5b291af32 Ville Syrjälä       2023-03-14 @1045  		hsub = vsub = max(hsub, vsub);
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1046  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1047  	if (src_x % hsub || src_w % hsub) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1048  		drm_dbg_kms(&i915->drm, "src x/w (%u, %u) must be a multiple of %u (rotated: %s)\n",
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1049  			    src_x, src_w, hsub, str_yes_no(rotated));
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1050  		return -EINVAL;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1051  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1052  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1053  	if (src_y % vsub || src_h % vsub) {
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1054  		drm_dbg_kms(&i915->drm, "src y/h (%u, %u) must be a multiple of %u (rotated: %s)\n",
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1055  			    src_y, src_h, vsub, str_yes_no(rotated));
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1056  		return -EINVAL;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1057  	}
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1058  
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1059  	return 0;
0ec2a5b291af32 Ville Syrjälä       2023-03-14  1060  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

