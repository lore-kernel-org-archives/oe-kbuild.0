Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66B54F96
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941923; cv=none; b=u7vd7vyPBdW0cxPkaCtmxXp5CoLkpI52GdqadVPQEU5j7gozauWuwOnLrkgBW/Ir6KX3u1lGcfkLOOc5zFZ5DMzwVGHNpS1DPmRK1dRhprWmobhwmWx5bbZsG4flESE9/y2sE07zJKy1FDJD/ZPx0hYi2iokgUgUYm8hk7CZ5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941923; c=relaxed/simple;
	bh=6T+uLO6I7CH4hbEhwVkMUlfl7bjaJLtd77WdXi8sq/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SNzlCyQT4Wj3bECVkfMMK3dAUIb8Fk6BQXxi3LLipvybWsQ+dsWt0y3/cOX838TurdpdeguVFZ5kkfSPpMV/1aHBAa5q9u6imqSQagBg2tTjWJmnq3aJZRa0V7dSxZ/m4J4PBEhv1LWCrOfrLVLnvTELd72llBYJBNuUO0t/PLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clsEJyEA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clsEJyEA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412a3371133so6567525e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Feb 2024 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708941909; x=1709546709; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcBIOucMAN+S6gTpmGCOg/zW6YlSfsS7OHTd/xLQuSI=;
        b=clsEJyEAUVlRqYNak233UrjrICour2cIKgGQAHPrywN1KTr3k/mDnVG39X4EiQgssg
         nTnGCjddsTfwLtzrlRWX1Uju52RYFtNzLRXx+6ZJEiOoahUOsuTNinOE1qedV+vThFSV
         JMYNBZYMCv+l34jItWWgcssReXc7g11ExXctwU4mmcHxQRDdumhix8kgfVhIfKypkZ1X
         QsEYWFVGwQEVkyuRVwfoW/XOUjmmy4B3CEW61E3aD8TqVafeFzWzIhnWUzYGTeChzGUF
         Xpa/AoJ4Q9tJUYhZW6R+2x1QwY0fOcSgcpitKRXFk+kMVQYSlHjImo8S+HvM7Nj/Msds
         dfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941909; x=1709546709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcBIOucMAN+S6gTpmGCOg/zW6YlSfsS7OHTd/xLQuSI=;
        b=EJvogoZB4VyyHEAT5ypKUQfrveFhBQZWf47dTc8nEYYKI6d48UYT6tp11b5T1Qa83I
         zPas1/S6ibQy2PNXksBW4mhIF80AF6yJKCKwmRVTs4l00ApobL7jVG2ff8teDYAIzMHU
         XGXw0HMv9XNE/xVQwHsaz2IK967BoFV1OElUM2XgSYPgEBH997vJbi/E9m+FzQyrjQqg
         Hdz794fkmUDrckK9N4ccsh7oKEKCTWDVNX2cOlFxDAVO9fNXZIDxZWGhSCiBo8aWx6O3
         dj72DCMO+4DfpF2Jibe1OWAQShBs8giLvQ8tKng6bSJD0KwOmje2yDUtGGNGChO+y2N2
         a54Q==
X-Gm-Message-State: AOJu0YwjFCpG4jANsGO0pOa/V4J3RoncY9+lazHvfIFoclWuHtaejA8z
	/jvd/vI8UGNsEK0nBGTx2D3eQqW8GvVdfmcHapcJbKaKvsha2eITTdvmAIexSL/VhfMuT6V7Hkq
	+
X-Google-Smtp-Source: AGHT+IGsGKWqF0+bDTc6+hQ/DghJAVK6dro+xWXta3HaOLtgEwNx1tGcEphVsnFdTW0bSv8HEvr4Jw==
X-Received: by 2002:a05:600c:1553:b0:412:a206:ad16 with SMTP id f19-20020a05600c155300b00412a206ad16mr3104748wmg.12.1708941909322;
        Mon, 26 Feb 2024 02:05:09 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b00412a0ce903dsm5234762wmq.46.2024.02.26.02.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:05:08 -0800 (PST)
Date: Mon, 26 Feb 2024 13:05:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/psr: Improve fast and IO wake lines
 calculation
Message-ID: <88b9f039-65ed-4138-9479-50f564ac992e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221075322.2764209-3-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-display-Add-aux-function-pointer-for-fast-wake-sync-pulse-count/20240221-160220
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240221075322.2764209-3-jouni.hogander%40intel.com
patch subject: [PATCH 2/3] drm/i915/psr: Improve fast and IO wake lines calculation
config: i386-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240225/202402250758.KqBqXYrz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402250758.KqBqXYrz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1203 _compute_alpm_params() error: uninitialized symbol 'io_wake_time'.

vim +/io_wake_time +1203 drivers/gpu/drm/i915/display/intel_psr.c

7903f1d36c3d97 Jouni Högander 2024-02-21  1174  
96a24945731fe9 Jouni Högander 2024-01-30  1175  static bool _compute_alpm_params(struct intel_dp *intel_dp,
cb42e8ede5b475 Jouni Högander 2023-02-21  1176  				 struct intel_crtc_state *crtc_state)
cb42e8ede5b475 Jouni Högander 2023-02-21  1177  {
cb42e8ede5b475 Jouni Högander 2023-02-21  1178  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
cb42e8ede5b475 Jouni Högander 2023-02-21  1179  	int io_wake_lines, io_wake_time, fast_wake_lines, fast_wake_time;
                                                                           ^^^^^^^^^^^^

cb42e8ede5b475 Jouni Högander 2023-02-21  1180  	u8 max_wake_lines;
cb42e8ede5b475 Jouni Högander 2023-02-21  1181  
7903f1d36c3d97 Jouni Högander 2024-02-21  1182  	if (intel_dp->get_aux_fw_sync_len) {
7903f1d36c3d97 Jouni Högander 2024-02-21  1183  		int io_wake_time = get_io_wake_time(intel_dp, crtc_state);

This declaration shadows the earlier io_wake_time declaration.

7903f1d36c3d97 Jouni Högander 2024-02-21  1184  		int tfw_exit_latency = 20; /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1185  		int phy_wake = 4;	   /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1186  		int preamble = 8;	   /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1187  		int precharge = intel_dp->get_aux_fw_sync_len() - preamble;
7903f1d36c3d97 Jouni Högander 2024-02-21  1188  
7903f1d36c3d97 Jouni Högander 2024-02-21  1189  		io_wake_time = max(precharge, io_wake_time) + preamble +
7903f1d36c3d97 Jouni Högander 2024-02-21  1190  			phy_wake + tfw_exit_latency;
7903f1d36c3d97 Jouni Högander 2024-02-21  1191  		fast_wake_time = precharge + preamble + phy_wake +
7903f1d36c3d97 Jouni Högander 2024-02-21  1192  			tfw_exit_latency;
29f3067a236ac5 Jouni Högander 2024-01-30  1193  
29f3067a236ac5 Jouni Högander 2024-01-30  1194  		/* TODO: Check how we can use ALPM_CTL fast wake extended field */
cb42e8ede5b475 Jouni Högander 2023-02-21  1195  		max_wake_lines = 12;
cb42e8ede5b475 Jouni Högander 2023-02-21  1196  	} else {
cb42e8ede5b475 Jouni Högander 2023-02-21  1197  		io_wake_time = 50;
cb42e8ede5b475 Jouni Högander 2023-02-21  1198  		fast_wake_time = 32;
cb42e8ede5b475 Jouni Högander 2023-02-21  1199  		max_wake_lines = 8;
cb42e8ede5b475 Jouni Högander 2023-02-21  1200  	}
cb42e8ede5b475 Jouni Högander 2023-02-21  1201  
cb42e8ede5b475 Jouni Högander 2023-02-21  1202  	io_wake_lines = intel_usecs_to_scanlines(
ef0af9db2a2125 Jouni Högander 2023-06-20 @1203  		&crtc_state->hw.adjusted_mode, io_wake_time);
                                                                                               ^^^^^^^^^^^^
Uninitialized

cb42e8ede5b475 Jouni Högander 2023-02-21  1204  	fast_wake_lines = intel_usecs_to_scanlines(
ef0af9db2a2125 Jouni Högander 2023-06-20  1205  		&crtc_state->hw.adjusted_mode, fast_wake_time);
cb42e8ede5b475 Jouni Högander 2023-02-21  1206  
cb42e8ede5b475 Jouni Högander 2023-02-21  1207  	if (io_wake_lines > max_wake_lines ||
cb42e8ede5b475 Jouni Högander 2023-02-21  1208  	    fast_wake_lines > max_wake_lines)
cb42e8ede5b475 Jouni Högander 2023-02-21  1209  		return false;
cb42e8ede5b475 Jouni Högander 2023-02-21  1210  
29f3067a236ac5 Jouni Högander 2024-01-30  1211  	if (!_lnl_compute_alpm_params(intel_dp, crtc_state))
29f3067a236ac5 Jouni Högander 2024-01-30  1212  		return false;
29f3067a236ac5 Jouni Högander 2024-01-30  1213  
942d654171bdaf Jouni Högander 2023-10-24  1214  	if (i915->display.params.psr_safest_params)
cb42e8ede5b475 Jouni Högander 2023-02-21  1215  		io_wake_lines = fast_wake_lines = max_wake_lines;
cb42e8ede5b475 Jouni Högander 2023-02-21  1216  
cb42e8ede5b475 Jouni Högander 2023-02-21  1217  	/* According to Bspec lower limit should be set as 7 lines. */
96a24945731fe9 Jouni Högander 2024-01-30  1218  	intel_dp->psr.alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
96a24945731fe9 Jouni Högander 2024-01-30  1219  	intel_dp->psr.alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
cb42e8ede5b475 Jouni Högander 2023-02-21  1220  
cb42e8ede5b475 Jouni Högander 2023-02-21  1221  	return true;
cb42e8ede5b475 Jouni Högander 2023-02-21  1222  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

