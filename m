Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59FECF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Sep 2023 08:50:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so2851554f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Sep 2023 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693990254; x=1694595054; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOVo3ZwDvKArSHES499DNzECR9ZSYSriWYZ+V08m7Fo=;
        b=ZFC78c01lXrv6hBRU7DYWKNqa66l+f1Poz3SAR/FwSX2Xj/+K89zeksZTaVnwuwY3F
         ezstj8wsjdlJA2PGx4HPxZFKcGfEfTB0ej6S0PRvw5mjLYcD6bWwRSdVesBsTt8MwcKu
         xjIBQqzexg9OteZj/KZvIMUzr220wtpw7rTVLBQyGAqvB4ona8oSgbhGu68PNh/gMsjT
         /qrVbNFRgXx9HsAS8RSb81cOEDfMA1EagDecvjN0GWHUBkhMug9aTzFt82bcXpMisdjY
         PhAVd/30oA5ryRq7eWm1PyDk2t5FqlY3WxtlQw62L+iS+FjphtPmL8PJVO1h0Xh9Od78
         SE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990254; x=1694595054;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOVo3ZwDvKArSHES499DNzECR9ZSYSriWYZ+V08m7Fo=;
        b=RfdzUws25yKXp3jpeg6FiV6bfdERgepDKPhmz8cQc5tmwDjIurVyTa6RaNXbd3pq00
         YsDdgwHVmg3hXy64IavKl0Odd3eOUxo2LuXWptFDqlb1CCwdTH3wFXKbHMU/T7CevRXt
         vW6SrxamqxyhwgucTn4ztp1JXNEvivHETWhEKb0DQ/lgZibqbyxTtbBeeet9crg3gVQO
         R+ctMaamkefg2AkTCjpboTbT7lxJCieVKXHTssaPpaY5/SE0nR8GPjJ/umaTnwYw1YVo
         bk2+i629sO47JrVKspzJLF1NPWMXdTL+gs/XZnMsiri2Lb+PuwynCt0n1APxSzAVjxnq
         LEFw==
X-Gm-Message-State: AOJu0YzXQtKhH/jEpIpMYhoBvqxYxDEQDPl9eTopyeOy2AAno4h9d9bD
	Egd3vmrwhxDHWRrvK4Ns/lKzN8E8llZZ0SwzeC4=
X-Google-Smtp-Source: AGHT+IFYAVIUJmWNHmb4PEL4o8U/ePstlp09xawzES7nEjibffUharmDCiScln3UrEMo1YRaaVIliA==
X-Received: by 2002:adf:f144:0:b0:319:8436:d77d with SMTP id y4-20020adff144000000b003198436d77dmr1769783wro.37.1693990253607;
        Wed, 06 Sep 2023 01:50:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bt12-20020a056000080c00b0031433443265sm14068819wrb.53.2023.09.06.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 01:50:53 -0700 (PDT)
Date: Wed, 6 Sep 2023 11:50:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wenjing Liu <wenjing.liu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>
Subject: [linux-next:master 13273/13985]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1756
 dcn20_program_pipe() error: we previously assumed 'pipe_ctx->plane_state'
 could be null (see line 1719)
Message-ID: <63b3f332-0682-4d9b-96ae-a5bddb1bc8b4@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 15e6b396f5ac259126f2447fcd2279ed5d3dd14f [13273/13985] drm/amd/display: update blank state on ODM changes
config: i386-randconfig-141-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060233.75PHiDL2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060233.75PHiDL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309060233.75PHiDL2-lkp@intel.com/

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
Can this really be NULL?

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
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1764  	    pipe_ctx->plane_state->update_flags.bits.in_transfer_func_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1765  	    pipe_ctx->plane_state->update_flags.bits.gamma_change ||
2dc84508f8c692 Melissa Wen         2023-05-23  1766  	    pipe_ctx->plane_state->update_flags.bits.lut_3d)
f42ea55be11147 Anthony Koo         2019-11-05  1767  		hws->funcs.set_input_transfer_func(dc, pipe_ctx, pipe_ctx->plane_state);
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1768  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1769  	/* dcn10_translate_regamma_to_hw_format takes 750us to finish
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1770  	 * only do gamma programming for powering on, internal memcmp to avoid
b6e881c947417e Dmytro Laktyushkin  2019-09-13  1771  	 * updating on slave planes
7ed4e6352c16fe Harry Wentland      2019-02-22  1772  	 */
bb622e0c004404 Dillon Varone       2022-11-17  1773  	if (pipe_ctx->update_flags.bits.enable ||
bb622e0c004404 Dillon Varone       2022-11-17  1774  			pipe_ctx->update_flags.bits.plane_changed ||
bb622e0c004404 Dillon Varone       2022-11-17  1775  			pipe_ctx->stream->update_flags.bits.out_tf ||
bb622e0c004404 Dillon Varone       2022-11-17  1776  			pipe_ctx->plane_state->update_flags.bits.output_tf_change)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

