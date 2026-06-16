Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0184D42981C
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607378; cv=none; b=DA9pnn42tQ1/ELcNgGz+8e7yCAqRrmRQT9nWjJx4SEl1to0rAF7MFZCiJb2S/A0XlDJY1CagmdXcHzW5DVXFqHLkWC1GZw1u34dinU+Y7KJUoG22iXoPNlQ7O/sVnpC/LjAxmEyL2/udmMfSi+49lAzi3yk52DBbx0dyBKtvyP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607378; c=relaxed/simple;
	bh=Cgw3ABT9pBkomqaKRkRYcm74nI6B59+N8g63924rC3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgatAvmjfNGCKBmhCeKjA21xCkYWQh9xmV2I2JpDyl1ir1hi4pMxNtxNxRw/5bm9VEMhEF0K0WQPB1WHzeeNq+aDsIbvApsEKM/uYWcWRatTKx5MC5NYb+giyi3VYlCfezuOzZCjnLNZ7+hBIn7FxVDxFvyb6ZdQeqA4VCTPNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCbabpKU; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCbabpKU"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9157f7c1c0eso465766485a.1
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607376; x=1782212176; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sL1EYeunZVmeX2O8G+uTenF+3xBYFtXT4U5wPuM3bzc=;
        b=cCbabpKUdHltJ7i0ml9+1RvI/lZw1+hP1vg+Gv+ztRDSRZdDFOhnhdTzNuKsJarB52
         UQWdPlbmImNJoy6Z0u2RggZleVCECRl0tCrI5FjYJ3a55lsu+Mhmt1GdRAUFTRaD26++
         x5SK6hAkTScJR5a+5+BsevOwWN/24T+M9OuXUms6nEB9tCp9aqhKRxoRw/2/iG+th26v
         4OcvLHWdWUNAR75Sdj9Dt3WaK5Rp2npgh4Nmda4Y0B5VzC40O+SSYqrSCIrZ4i+Ekae7
         nN4pNBMOa4+fXn+vktdsqjt3nY/QXzbCEbFnhyhiMdgeBJ7BA4TqGUhbsk4s3sEP4mjL
         vDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607376; x=1782212176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sL1EYeunZVmeX2O8G+uTenF+3xBYFtXT4U5wPuM3bzc=;
        b=s285lTvYIG6wmXZ+GEDq2st3k1jpTZb0s0GY35TM76WPDBIvi/SLpY2wOAWWjkYsxu
         hQ7UQLI4lbqcAqQaXTE1KwNYd7XiRZ6BnkmTzTZyDfjRSBC3XPsDXDTXuVTMzgjdMMIm
         3/E9+VptA4ofUK7QLdnUn9HAOu0PIoqanX6NaC6wOABWU+eJAuEYtzxGF+5Uc/bThPZI
         XPP34zLT8ObWB6Nipkwn+UAdkHBq8Fd9dvHplYIP6yS3CjPidMDnNSIMhjaT0qu0gwaR
         4gvnnzv1rl0zddGNcPkdfva0o0Df6L/oRgt3Nfxv1aZF0m1M8STO4SCjRxpFpNcHwrVd
         N7Ew==
X-Gm-Message-State: AOJu0YywMceIIlxIopSbFUuR4NQ8Ppi9aXRYuEMsA9GdQgyU3ZSXmC9d
	8y52CEyxsq35q46K7QrloWjWKLV3/10GlSwRjDSrk2TEeG63n3LQL4PgVXUQUIVl1qM=
X-Gm-Gg: Acq92OGhFpopnv9mcQjXmCFpFJPsINMDxfILaWV7cNy+cCWTr/wWdbK1zOSP9GMsV4q
	aZYWZ0o4BQqrSGtsDDuf9y+RiucVOqQTg6NNm5bsSP99zBhmK6z7aNnH/oZbMOi+7q050pRLz+v
	YkMSpm6hTnhm2xpGtysXpJco8SKD88L/+ZAZo9kdzYl1eE+hxUQzTeZN0zsgQmk9OXp92p6fVzy
	0ES23odOpGcdEMLSvzdAFC1YVkrMSm60+KjXa6vUaRjoNoMP0QYytYmpCk0Esq+7Rnto+u0KQGg
	cR0ZcNPboGhsLVRBdXI30aKU//2fQfz2o65UAYH1KhE5BgDc0OPbKIcDzuYUuR/lUYgDvVyAHwH
	ozU14PqSCPDU5UnsoaMkEc1hMpA6QrXynIfhZdNSsVS+LKfJJEW6g3rB1dnqxgTFJg7AJSiaLnC
	2FK3azOMeHV0cHI0mf
X-Received: by 2002:a05:620a:1a10:b0:915:79c8:ec9c with SMTP id af79cd13be357-91c4807388emr438300585a.35.1781607376030;
        Tue, 16 Jun 2026 03:56:16 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f19e917bsm31563066d6.13.2026.06.16.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:56:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:56:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Harry Wentland <harry.wentland@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [linux-next:master 9794/14023]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:584
 update_config() error: we previously assumed 'aconnector->dc_sink' could be
 null (see line 559)
Message-ID: <202606161822.yCBePSkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260616105608.2N5SaOjNy_3HN9SNYfOy-akABrTwocSQq66CrqtmQEI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
commit: 5c9b8b27a883822fe5812bed23bca7ffeb4301f7 [9794/14023] drm/amd/display: Tie FRL support into amdgpu_dm
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260616/202606161822.yCBePSkO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606161822.yCBePSkO-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:584 update_config() error: we previously assumed 'aconnector->dc_sink' could be null (see line 559)

vim +584 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c

a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  535  static void update_config(void *handle, struct cp_psp_stream_config *config)
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  536  {
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  537  	struct hdcp_workqueue *hdcp_work = handle;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  538  	struct amdgpu_dm_connector *aconnector = config->dm_stream_ctx;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  539  	int link_index = aconnector->dc_link->link_index;
be593d9d91c5a3a Chris Bainbridge       2025-04-17  540  	unsigned int conn_index = aconnector->base.index;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  541  	struct mod_hdcp_display *display = &hdcp_work[link_index].display;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  542  	struct mod_hdcp_link *link = &hdcp_work[link_index].link;
393e83484839970 Bhawanpreet Lakha      2023-07-24  543  	struct hdcp_workqueue *hdcp_w = &hdcp_work[link_index];
4d31819a3746b1f Wayne Lin              2022-05-31  544  	struct dc_sink *sink = NULL;
035f54969bb2c1a Aurabindo Pillai       2021-08-13  545  	bool link_is_hdcp14 = false;
face6a3615a6494 Wenjing Liu            2025-10-03  546  	const struct dc *dc = aconnector->dc_link->dc;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  547  
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  548  	if (config->dpms_off) {
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  549  		hdcp_remove_display(hdcp_work, link_index, aconnector);
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  550  		return;
a30a8c2f884c283 Bhawanpreet Lakha      2019-12-06  551  	}
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  552) 
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  553) 	memset(display, 0, sizeof(*display));
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  554) 	memset(link, 0, sizeof(*link));
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  555) 
3528cae940d75f3 Leo (Hanghong  Ma      2020-05-08  556) 	display->index = aconnector->base.index;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  557  	display->state = MOD_HDCP_DISPLAY_ACTIVE;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  558  
4d31819a3746b1f Wayne Lin              2022-05-31 @559  	if (aconnector->dc_sink)
                                                                    ^^^^^^^^^^^^^^^^^^^
This looks like there is a very good reason to thing aconnector->dc_sink
can be NULL.

4d31819a3746b1f Wayne Lin              2022-05-31  560  		sink = aconnector->dc_sink;
4d31819a3746b1f Wayne Lin              2022-05-31  561  	else if (aconnector->dc_em_sink)
4d31819a3746b1f Wayne Lin              2022-05-31  562  		sink = aconnector->dc_em_sink;
4d31819a3746b1f Wayne Lin              2022-05-31  563  
a19de9dbb4d293c Srinivasan Shanmugam   2023-07-13  564  	if (sink)
4d31819a3746b1f Wayne Lin              2022-05-31  565  		link->mode = mod_hdcp_signal_type_to_operation_mode(sink->sink_signal);
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  566  
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  567  	display->controller = CONTROLLER_ID_D0 + config->otg_inst;
aac6d4391a0a354 Wenjing Liu            2020-12-10  568  	display->dig_fe = config->dig_fe;
aac6d4391a0a354 Wenjing Liu            2020-12-10  569  	link->dig_be = config->dig_be;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  570  	link->ddc_line = aconnector->dc_link->ddc_hw_inst + 1;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  571  	display->stream_enc_idx = config->stream_enc_idx;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  572  	link->link_enc_idx = config->link_enc_idx;
f51d22b0d04aa33 Qingqing Zhuo          2022-06-03  573  	link->dio_output_id = config->dio_output_idx;
bf62221e9d0e1e4 Nicholas Kazlauskas    2021-05-19  574  	link->phy_idx = config->phy_idx;
10a36226157035e Wayne Lin              2022-04-13  575  
4d31819a3746b1f Wayne Lin              2022-05-31  576  	if (sink)
4d31819a3746b1f Wayne Lin              2022-05-31  577  		link_is_hdcp14 = dc_link_is_hdcp14(aconnector->dc_link, sink->sink_signal);
035f54969bb2c1a Aurabindo Pillai       2021-08-13  578  	link->hdcp_supported_informational = link_is_hdcp14;
a193ed2094ba2f8 Bhawanpreet Lakha      2019-05-14  579  	link->dp.rev = aconnector->dc_link->dpcd_caps.dpcd_rev.raw;
aac6d4391a0a354 Wenjing Liu            2020-12-10  580  	link->dp.assr_enabled = config->assr_enabled;
aac6d4391a0a354 Wenjing Liu            2020-12-10  581  	link->dp.mst_enabled = config->mst_enabled;
c32699caeca802c Jasdeep Dhillon        2023-01-25  582  	link->dp.dp2_enabled = config->dp2_enabled;
f51d22b0d04aa33 Qingqing Zhuo          2022-06-03  583  	link->dp.usb4_enabled = config->usb4_enabled;
5c9b8b27a883822 Harry Wentland         2026-04-24 @584  	if (aconnector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_FRL)
                                                                    ^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

5c9b8b27a883822 Harry Wentland         2026-04-24  585  		link->hdmi.frl_enabled = config->frl_enabled;
4fe1fdcc230189b Wenjing Liu            2021-03-10  586  	display->adjust.disable = MOD_HDCP_DISPLAY_DISABLE_AUTHENTICATION;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

