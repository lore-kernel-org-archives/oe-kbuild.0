Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2342D311
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FrDhWsI9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40651a726acso6387785e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091983; x=1697696783; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKEUhR0aHZbx7hGKisd7o9a7pG0ffuhwVSY+TfiquOc=;
        b=FrDhWsI9MCfuXUrZ01gViXyRc1e/5n02DZcTpXXjw4G8Hw3D/KhNIO3HGlBX4dWujh
         LBv12VgXXcbSwx6c6NiEmPntO+coEWDraNUG4Zaex1AkgUONqzJe/ujVIYSHPDDX1iQQ
         CA4tKNkovzXibSAJ2f0W5kxdDTXpr3cXff77AZ89UHFUV6/gT1d2uUhZ1dQ7/ValJ+lk
         IMFMAqorvQZP49UaKHbAhOchHrcYjtBFcM3OAoucR5saEi3jQVLr/4Zborr/As/RXOtG
         0DNwAfa9hyGXCMzhQUQY+vQyMVTtlzH1blH5lOA7FSScLL80IQh0ixPnJFjOFaAh2xhv
         kKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091983; x=1697696783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKEUhR0aHZbx7hGKisd7o9a7pG0ffuhwVSY+TfiquOc=;
        b=jFNSSxJOsMWFsQh6OLm6SgK2fyHXPXizz4K9sHbKrcrpHB9BThRqezqlHou6nWZ7xa
         UZDevrXDobwhHCUg6GcsDT2c43RM4KUk3dvs9Sikrkw0O99GeHLvK/Rbt/QLt5lS9gz3
         OjSdvErNgCjc1dzvQcMOHbWPak9yYLsADnC//MhSpRl2bmiraDkMpFfSq3uXUFwIr0XG
         0nLcqD0CzplNa5MGhGNaDUDlKC0nF1uPZ4NLCqUiefj8DmGm9FRizAkb2Kv1fGF+iOza
         hFEsbscng9HfiLv+O1cGIEsZyYx1vSVXuHq15LLoE1jesGJnmXEi2R6gjutEMrqqsfKb
         JN0g==
X-Gm-Message-State: AOJu0Ywe1XoVN0OUwLiDGWUjNGMCZu8ZuZNP6UQm1N6W0y4WL/JIf2pt
	jkzsctnw3O0njgJ6+V2pmc/iNDtGRPA8iHSW/Mc=
X-Google-Smtp-Source: AGHT+IH2MmVmDPxOt5jV0FsJyhXS3HkCcEFtbp1UlMVpX0UIaDI0IW3dDweTZtSNoJzmqb+HohKIvA==
X-Received: by 2002:a7b:c419:0:b0:3fe:d630:f568 with SMTP id k25-20020a7bc419000000b003fed630f568mr19914490wmi.39.1697091982515;
        Wed, 11 Oct 2023 23:26:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b00405623e0186sm20998303wmc.26.2023.10.11.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:26:22 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:26:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wenjing Liu <wenjing.liu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>
Subject: [linux-next:master 420/11428]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1756
 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state'
 could be null (see line 1719)
Message-ID: <33b49f99-dd85-4b01-a038-a52b102dd24d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: 15e6b396f5ac259126f2447fcd2279ed5d3dd14f [420/11428] drm/amd/display: update blank state on ODM changes
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20231012/202310120506.aBio3Ik1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120506.aBio3Ik1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310120506.aBio3Ik1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1756 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state' could be null (see line 1719)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:815 dcn20_enable_stream_timing() warn: variable dereferenced before check 'pipe_ctx->stream_res.tg' (see line 722)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:2016 dcn20_post_unlock_program_front_end() error: we previously assumed 'hwseq' could be null (see line 2010)

vim +1756 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c

b6e881c947417e Dmytro Laktyushkin  2019-09-13  1706  static void dcn20_program_pipe(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1707  		struct dc *dc,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1708  		struct pipe_ctx *pipe_ctx,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1709  		struct dc_state *context)
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1710  {
f42ea55be11147 Anthony Koo         2019-11-05  1711  	struct dce_hwseq *hws = dc->hwseq;
d3dfceb58de5f8 Aurabindo Pillai    2022-02-23  1712  
15e6b396f5ac25 Wenjing Liu         2023-08-14  1713  	/* Only need to unblank on top pipe */
15e6b396f5ac25 Wenjing Liu         2023-08-14  1714  	if (resource_is_pipe_type(pipe_ctx, OTG_MASTER)) {
15e6b396f5ac25 Wenjing Liu         2023-08-14  1715  		if (pipe_ctx->update_flags.bits.enable ||
15e6b396f5ac25 Wenjing Liu         2023-08-14  1716  				pipe_ctx->update_flags.bits.odm ||
15e6b396f5ac25 Wenjing Liu         2023-08-14  1717  				pipe_ctx->stream->update_flags.bits.abm_level)
15e6b396f5ac25 Wenjing Liu         2023-08-14  1718  			hws->funcs.blank_pixel_data(dc, pipe_ctx,
15e6b396f5ac25 Wenjing Liu         2023-08-14 @1719  					!pipe_ctx->plane_state ||
                                                                                         ^^^^^^^^^^^^^^^^^^^^^
Can ->plane_state really be NULL?

15e6b396f5ac25 Wenjing Liu         2023-08-14  1720  					!pipe_ctx->plane_state->visible);
15e6b396f5ac25 Wenjing Liu         2023-08-14  1721  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1722  
a71e5529d26745 Aric Cyr            2020-12-10  1723  	/* Only update TG on top pipe */
a71e5529d26745 Aric Cyr            2020-12-10  1724  	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
a71e5529d26745 Aric Cyr            2020-12-10  1725  			&& !pipe_ctx->prev_odm_pipe) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1726  		pipe_ctx->stream_res.tg->funcs->program_global_sync(
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1727  				pipe_ctx->stream_res.tg,
5842abd985b792 Wesley Chalmers     2022-11-09  1728  				calculate_vready_offset_for_group(pipe_ctx),
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1729  				pipe_ctx->pipe_dlg_param.vstartup_start,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1730  				pipe_ctx->pipe_dlg_param.vupdate_offset,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1731  				pipe_ctx->pipe_dlg_param.vupdate_width);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1732  
ac84304d68c4b3 Zhikai Zhai         2023-03-02  1733  		if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM)
203ccaf586446b Haiyi Zhou          2022-10-20  1734  			pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
a71e5529d26745 Aric Cyr            2020-12-10  1735  
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1736  		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
a71e5529d26745 Aric Cyr            2020-12-10  1737  				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
1caba4e83b9d8a Aric Cyr            2019-09-06  1738  
f42ea55be11147 Anthony Koo         2019-11-05  1739  		if (hws->funcs.setup_vupdate_interrupt)
f42ea55be11147 Anthony Koo         2019-11-05  1740  			hws->funcs.setup_vupdate_interrupt(dc, pipe_ctx);
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1741  	}
a14e9e0292e299 Dmytro Laktyushkin  2019-08-26  1742  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1743  	if (pipe_ctx->update_flags.bits.odm)
f42ea55be11147 Anthony Koo         2019-11-05  1744  		hws->funcs.update_odm(dc, context, pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1745  
868149c9a072cb Joshua Aberback     2020-03-30  1746  	if (pipe_ctx->update_flags.bits.enable) {
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1747  		dcn20_enable_plane(dc, pipe_ctx, context);
868149c9a072cb Joshua Aberback     2020-03-30  1748  		if (dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes)
868149c9a072cb Joshua Aberback     2020-03-30  1749  			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
868149c9a072cb Joshua Aberback     2020-03-30  1750  	}
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1751  
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1752  	if (dc->res_pool->hubbub->funcs->program_det_size && pipe_ctx->update_flags.bits.det_size)
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1753  		dc->res_pool->hubbub->funcs->program_det_size(
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1754  			dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
ba5a5371812e1f Nicholas Kazlauskas 2021-05-19  1755  
747012382937e4 Dmytro Laktyushkin  2019-08-22 @1756  	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference

b6e881c947417e Dmytro Laktyushkin  2019-09-13  1757  		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1758  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1759  	if (pipe_ctx->update_flags.bits.enable
46250a0cba4ce9 Michael Strauss     2019-11-03  1760  			|| pipe_ctx->plane_state->update_flags.bits.hdr_mult)
f42ea55be11147 Anthony Koo         2019-11-05  1761  		hws->funcs.set_hdr_multiplier(pipe_ctx);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1762  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1763  	if (pipe_ctx->update_flags.bits.enable ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

