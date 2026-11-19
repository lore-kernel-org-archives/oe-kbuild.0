Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070521;
	b=RiytVySk+xgQWxgBtb/OJweHT4BzebQ4XBcBCfmxBfUDHfMVxwU916tb0S1gj+X2bWOI
	 mBDJfPOd4U3miCKnMNVV3gJ51CGews0RJHcc28f4we/vT4uUEhKiFj3XFV5JfLwgTwxSv
	 B8e9gx11Tvq135vXmBXgdpJT4KJUm0eYlCO77YxUIBGe8toQeddyVFuG9IlK7I0IkLZAi
	 rIWHsCQe717AynM65xVSp/sG8pxO8mHpKDKMK85bXN4CIoW5LPkMg5nF5ZX5r3K2diu1E
	 tvf7UDaKVwdE/uS5nomxCZRiedCvhhd/gCsiF3q3XMjSVKrgy+0MuWHriXusgTqmJIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
	b=tT7P7pkpSoFmKU8d97f872vnxVQs0FbV4C4PDvZ0NNggpXCOrnFnpBT8SedaeGfHIR5i
	 SZAofiqlq5h/c/DWQtt8w813TgdHSOnykM14Kch9am3bSwuBltPNgd1fDKXYZgOTt4ciP
	 o2pbOrC8RzrbYw48Olq+cORuBD/YlwsThOnCq1RcsU+QikOaQt30RVXD2IgcpmtNuz66J
	 rDGeLFl7kpMSsBgf6QAUiiiGqV5CrMNcKfEWpidd+Vc6z7WvlywtsFi8/8hcP8RLqIhcN
	 57Q1XqUkOn0LjeqSsDpvRErVy74H7f9sMb9t6GM2JyrQa2eDL7LDGt5ZSy4VJJWt1Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnjV95BK;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D76606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 06:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D76606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnjV95BK
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1158302f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 22:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795070519; x=1795675319; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
        b=ZnjV95BKpCpUNLqUKiT3b8bXbSijZVADl2KKgIXMoe4fxfAKYAF09isDmvq+dfZ3Kg
         iwuNvNmjc8vPOwZcnGZzivea/d9J4R8CHw2L8v2LBioFNfebBQZhhStWFOa81y7lIJQR
         JKGisdJT5t7ucgDEa9rB3dbiwu3yL9e7MBwT6PP2T9XdWUs5f2zPSbRtpqz5XMlR113C
         rAN0Om79FHvTlqIQhGB2ZrCcFBmsTh9nbJVG27dFctGlw3i6+k7JdX7Aenk8C9bVOU58
         bNAS5JxCHW9fAvI40h7/eH2E+y5xwzmdhYKyzBYGSrMkIAgKeaKxzWayge07vqkF47nW
         q4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070519; x=1795675319;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbrQrYPj864sNBPbTz+UkOUsiRLn26jjLzWGOh/hKj0=;
        b=LGHFynfN4BK/jQ1sGb8dzAGqHSructyB3DUQZd1tC1WRSfu7ZuRD3n7U8G7wzss/T9
         OLfjlPcZ+7fjz43VjwMHQmVm838SoTZGZ12quWXaid427ZDSEz8L55YLYllTGsVeV50q
         igiiVfX2hTrDZsUyCSKxJvyfss29tpIifmmUESneA+wAuEhtLlab8O/mY2wTFBoPw8U8
         2AmoZQTCG15uHsU6JllPxZq9fDonfonQG2R5uvQ3mHMwfdergzuwxOIwTKJVpH9IjJAO
         CMO1YUXJPFA4ZANoEjIyeuOMcXTilfTipGcOtX4HTyAyaEh3DdnJzYaBO++8e/v0698k
         Nxow==
X-Gm-Message-State: APuU4Z81UFjBbbzWqFAXxA81GIPUR1PnEol9aXYwRMlwwVTznaZC6pI7
	C7g0/hgJCOYT/oeuEqzlk779vZvmTJ34/Y02b+Y9ix9zTW3a9SmaFi84cUUxezZ8KnDm9Q==
X-Gm-Gg: AZFdTZe5rhNZmoa9lqwvryA2YdzGOqMFuzqwgfIkzfgpZdGrmT4W5NyMWSlgOgP4mDy
	EJH6zKqeePQ9X+bjUzcYixDdRjWG0/+zGuwcAIsSjQCedprF1VPxbvUg3BEGRhLLMDmiaeHZ31c
	czQuNilOjK/q/lQ2X2IzREXBGfQ91q0ibJINAF9D54CmIYjF8AhsEzOuT1zGclwh8ZiNtsE2ii+
	6D+nr2+8SrCRGGmahMF2s+uBmrhVouXjLfCW7ktStCZNkYVtYMbbQGR6jwqrbXUMr4jAjr58oST
	1BCFI0mYWZIa8o2hENurc+SGZJBd/c4ObvB/xoXxpIfIu/znqoMHrFGCuO74mB79f5pfcj/f5HR
	aGARX0soYwv1MMfT4Jyrde9YWLwbaMFVGRSXB/tj6OIGw3eSGOiUXWV6XYi4H26KZzA28EQBybX
	jnhSauS32j4UgvPZJq77tCoIG3LoMAX64vAjdOpF7E+Z/dZ6QJy/7tjsGoJ6RVCaHsKdZkCEXqh
	e28TvlOYgfJfkS5/yrJB7TQHs3HyDTyN0qzjeVfIsOMzFgOjlSl5foP38aptLowZ2fcQuLBCf2+
	e9tjt+I3cOYst/mo6XBr8QqNYXPesrx43qi6x1U0tjpAtH1ku0uEJi3zBNp/ACYj7I4jEDDvUxo
	ZS1YwSNdbwFG2XhZKxW2wKdXrgLGVsHTXa8Z49NF+oKm+Jw4pIF52ncQEYmnnRq69Clc=
X-Received: by 2002:a05:6000:4b1e:b0:498:bc2a:8f31 with SMTP id ffacd0b85a97d-4a6389ece92mr10513314f8f.19.1795070519350;
        Wed, 18 Nov 2026 22:41:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm9271363f8f.27.2026.11.18.22.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:41:58 -0800 (PST)
Date: Thu, 19 Nov 2026 09:41:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 200/200]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c:142
 reset_hpo_dp_stream_encoder() error: we previously assumed 'dccg' could be
 null (see line 140)
Message-ID: <20261119055333.15uYya1M-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261119064155.jyOWBOYne0kJVL5OmTHwb7RBP80bbCIpwyMIL40J0hg@z>

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: 967ebae13e206b90c2ef57b917adceaee1fa5390 [200/200] drm/amd/display: Prevent crash when disable stream
config: arm64-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119055333.15uYya1M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119055333.15uYya1M-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c:142 reset_hpo_dp_stream_encoder() error: we previously assumed 'dccg' could be null (see line 140)

vim +/dccg +142 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c

9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  128  static void reset_hpo_dp_stream_encoder(struct pipe_ctx *pipe_ctx)
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  129  {
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  130  	struct dc *dc = pipe_ctx->stream->ctx->dc;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  131  	struct hpo_dp_stream_encoder *stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  132  	struct dccg *dccg = dc->res_pool->dccg;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  133  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  134  	struct dtbclk_dto_params dto_params = {0};
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  135  
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  136  	dto_params.otg_inst = tg->inst;
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  137  	dto_params.timing = &pipe_ctx->stream->timing;
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  138  
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  139  	stream_enc->funcs->disable(stream_enc);
967ebae13e206b drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Chris Park    2024-03-05 @140  	if (dccg && dccg->funcs->set_dtbclk_dto)

This line assumes dccg can be NULL

0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  141  		dccg->funcs->set_dtbclk_dto(dccg, &dto_params);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28 @142  	dccg->funcs->disable_symclk32_se(dccg, stream_enc->inst);

The next line doesn't

9af611f29034dd drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c George Shen   2022-08-10  143  	dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst, stream_enc->inst);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

