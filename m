Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7F29DB9A
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820939; cv=none; b=GRx6iRKkBMv3SUfaIVqTxk1R0bKA8YA3UUiqqUOQ6tPecs14Eod+V8+IxYqExINi462IfWGto0wUafN8RyaeXrmyI4+Ukp6mZ/3lo4nQ90B/nCCjxR3rtJrj+d9fnl0GcSPSK0Lhqw2Wf9IOLQY4lns1vuv7V6wHSG/ku2dj3Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820939; c=relaxed/simple;
	bh=6vUR9lePzA9GLPF/d2DhXC3cdbAJ/XPuDA9mqrPDWPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RS5oOO6jZEYwiw92MJdOIvOrYDe9IRTNxq99cJuThJNQ2V/kKze/uWqZ2bpTxMapMGD5WZ672yk6Uy0CNIA6sS2zsz6isZcl9seU5KGEiSMRIfGWJ/PFoBx+zkND12NsQ7eg9lMSlQSr9QAvdNtsXNCGUbNsUBtwtYD+/Tqc/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiN0rqrv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiN0rqrv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b78b638eso6331479f8f.2
        for <oe-kbuild@lists.linux.dev>; Fri, 06 Mar 2026 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820936; x=1773425736; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rriMUzh31RKjt/5T8gDUKHkgaP5StcNn7rIgMnKm1IY=;
        b=ZiN0rqrvCCDdq/EjZx+kIhURo0auoM7/nK6Hzh8G9SPx5jR30RwZY7GH9k/ibHgXqO
         Xo2WJJKDo08ZHdRRm58YpAKRL5hRsz5aV27H/SW/ISrfGxcvxafFXf1nGouVMtLE9GUg
         GzbPKfgB1QQIr1j1BKz/OKaq8pVmzw+dPWvZiim0CEWCCwKhCfCK7wmdbBUhgrgzDOBy
         uEGXyqlnkowfmGoZEVm9wL3kwrQKCsCuqV1RGYkYy6FKPl5IMZX/SHq+rjPHx7BDYkcn
         yTpRdCrX3tcGw+SZV8ppD8ZukKNpISH5kVRuoUpBk27GN6pBz61OTE4+gpnAo2r04VVk
         bDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820936; x=1773425736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rriMUzh31RKjt/5T8gDUKHkgaP5StcNn7rIgMnKm1IY=;
        b=G4/r2ZfIqAO7luczBz0cPFpgLAPrAM2XxKAP00Tz4ZhPGEvjGzcUH2cX5jGNc4PW+M
         ZukSt9FLYRymd/xoqr4vw++oVeK2TY4zRoD/Tf8KQMQjaofc/Yyb/mZr5/KWqSMf3W6T
         wXuhlNpvoHpbWHZddMSIn2OOBSdPHGDQq1QSmDAWC37L20KVhqR4WZJc99Gm7m132SFI
         u1F46j9hx2RsM1yNHgXUmbd78fo+tXCnTmjLCTk+gA1v/4cyP7hP9+uW0O4xE43O+Q0M
         uwGLKWBMoRBMpyzXWIGIgooYMSndbwGYxovMAxJ6K+ZG8zpzP4XPQeSfdOaQvmfi4kgI
         bO9g==
X-Gm-Message-State: AOJu0YwQWyW8Pu3cn7S5b8LO72cLth/ikpLx3SeF7abOgVVnHf415OM0
	loQQkg76W2uqheZqy1zrF9jqJwX9COmAeh5CsPHBbf5Jz05vSRfHyeMjT2aUoBOAWlGiIFkDSqa
	SvA2+
X-Gm-Gg: ATEYQzyEea4lHvqkyAQCPo32cVXJQg3z/xZXiIMBz/qaSS0owTxzmF7f1r/Ide5t20R
	D18OTjZm2O+tEv3Dz4+u5gN40Bl0Ub+5VQD/Nks0aX8XuqzHV6WNtE4XewQNtEWV4CexITXN2vg
	yMcj3R7xOft5G1k+QKQCbJxtcViy8D173uaw1vEjojgZFPCBqhH1oDbgwZsKLNnwtj9Yg58JfCE
	cn5+fjXsNpgqEP3Ftx9gC92Ak6jOJhwAUJFRkq2D7Him+C2qCzKqf7gPZUr90t1tEWcHHlTGvUu
	X0zZO/g+3cSk9ES/ToEVZ15/VUqRPZSbQDYjzL7IslTSQi97CEEvsg2Z0oP6CdtWHP70bBmIk7P
	0sEdCkO3tnj/Q3GtRWGOywlhOyvtl6agM8znEtQNycR8HPE3gW7RPhZKn0pYEX9vAL5ED6GgzEI
	+qe3xhX1ZKBmJLL1vYXf6V4/oil31+
X-Received: by 2002:a5d:64c7:0:b0:439:cd8c:209f with SMTP id ffacd0b85a97d-439da662501mr5804360f8f.23.1772820935470;
        Fri, 06 Mar 2026 10:15:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3c80esm4701625f8f.29.2026.03.06.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:15:35 -0800 (PST)
Date: Fri, 6 Mar 2026 21:15:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 685/685]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247
 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null
 (see line 244)
Message-ID: <202603062103.GcIsRo8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260306181531.4QibeuKtNsrWq_eBlh6GuO5SbDevdgmivMWiNXy1VxA@z>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47
commit: 2e150ccea13129eb048679114808eb9770443e4d [685/685] drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062103.GcIsRo8v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603062103.GcIsRo8v-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null (see line 244)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:254 dcn21_set_backlight_level() error: we previously assumed 'abm' could be null (see line 244)

vim +/tg +247 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c

474ac4a875ca6fe Yongqiang Sun        2020-04-27  234  bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
474ac4a875ca6fe Yongqiang Sun        2020-04-27  235  		uint32_t backlight_pwm_u16_16,
474ac4a875ca6fe Yongqiang Sun        2020-04-27  236  		uint32_t frame_ramp)
474ac4a875ca6fe Yongqiang Sun        2020-04-27  237  {
474ac4a875ca6fe Yongqiang Sun        2020-04-27  238  	struct dc_context *dc = pipe_ctx->stream->ctx;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  239  	struct abm *abm = pipe_ctx->stream_res.abm;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  240  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  241  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  242  	uint32_t otg_inst;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  243  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27 @244  	if (!abm && !tg && !panel_cntl)

Presumable || was intended instead of &&.

2e150ccea13129e Srinivasan Shanmugam 2024-01-27  245  		return false;
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  246  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27 @247  	otg_inst = tg->inst;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  248  
474ac4a875ca6fe Yongqiang Sun        2020-04-27  249  	if (dc->dc->res_pool->dmcu) {
474ac4a875ca6fe Yongqiang Sun        2020-04-27  250  		dce110_set_backlight_level(pipe_ctx, backlight_pwm_u16_16, frame_ramp);
474ac4a875ca6fe Yongqiang Sun        2020-04-27  251  		return true;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  252  	}
474ac4a875ca6fe Yongqiang Sun        2020-04-27  253  
6f0ef80a00adfd5 Leon Huang           2022-12-08 @254  	if (abm->funcs && abm->funcs->set_pipe_ex) {
71be0f674070a5a Lewis Huang          2023-12-01  255  		abm->funcs->set_pipe_ex(abm,
71be0f674070a5a Lewis Huang          2023-12-01  256  					otg_inst,
71be0f674070a5a Lewis Huang          2023-12-01  257  					SET_ABM_PIPE_NORMAL,
71be0f674070a5a Lewis Huang          2023-12-01  258  					panel_cntl->inst,
71be0f674070a5a Lewis Huang          2023-12-01  259  					panel_cntl->pwrseq_inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  260  	} else {
71be0f674070a5a Lewis Huang          2023-12-01  261  		dmub_abm_set_pipe(abm,
71be0f674070a5a Lewis Huang          2023-12-01  262  				  otg_inst,
71be0f674070a5a Lewis Huang          2023-12-01  263  				  SET_ABM_PIPE_NORMAL,
71be0f674070a5a Lewis Huang          2023-12-01  264  				  panel_cntl->inst,
71be0f674070a5a Lewis Huang          2023-12-01  265  				  panel_cntl->pwrseq_inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  266  	}
474ac4a875ca6fe Yongqiang Sun        2020-04-27  267  
2e150ccea13129e Srinivasan Shanmugam 2024-01-27  268  	if (abm->funcs && abm->funcs->set_backlight_level_pwm)
6f0ef80a00adfd5 Leon Huang           2022-12-08  269  		abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
6f0ef80a00adfd5 Leon Huang           2022-12-08  270  			frame_ramp, 0, panel_cntl->inst);
6f0ef80a00adfd5 Leon Huang           2022-12-08  271  	else
6f0ef80a00adfd5 Leon Huang           2022-12-08  272  		dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp, panel_cntl->inst);
474ac4a875ca6fe Yongqiang Sun        2020-04-27  273  
474ac4a875ca6fe Yongqiang Sun        2020-04-27  274  	return true;
474ac4a875ca6fe Yongqiang Sun        2020-04-27  275  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

