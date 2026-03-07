Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B942BFC8F
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884154; cv=none; b=GqB478F84QrLVbThuQ+IUZanyDkgfRUAw6LC8I1VQfbfhlo33YMNhEY2hfrq7EuSbad0Da/fdhjruRIsGY23Kg1JHDbVRWDVXoScIDEWvoYrCJWyDGM7qGAh14HHJlQ+ZM87V8mRjYHcg+ACOZLvns0Fs2ciVBgEUgQ6mQHBMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884154; c=relaxed/simple;
	bh=PpDMyPg74rPMA9OpbNZL2SIqcBKVB/g5QnUXQSGGNtU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ShU99dC73IoznHtMIV2qkqb5rcbbLCSZ+vNgeMroXadx22GjhZawnnZ3WoBQ8qjKaq0qQK3rtw61ydqAgy9WLV2wE6/3O9JHGZiXCBx/I2bk7ZB/DDB+HYA3m742v8dQkc5eiYDxn395s5y1yqoXNTuf48Q129WxNbvyE4r9I7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIhkp99O; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIhkp99O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772884152; x=1804420152;
  h=date:from:to:cc:subject:message-id;
  bh=PpDMyPg74rPMA9OpbNZL2SIqcBKVB/g5QnUXQSGGNtU=;
  b=dIhkp99ObxlDbu2y3XDlSYvuUzjaWq3gEMgNttjfmoBxHF+xM0a+YE/B
   0LIDgYlvHq3/SxQTnxvj0OJL3jnxM7L7BpMYT0qlmV7zh5FQFNly1IRqr
   U0RGsOnj2HlwwagXicpSUKxkM5+exsa2ZDDRp7zO214qMa37yevSq6j4M
   /wPCY42W/ZuHYZvgBN9uS3vJJ9Cc4pk2Sndnkqdyi/npRIa+olg4QEbb1
   tlv0mY2rS2Pmf0RcBgGmCd4AQej4CC6bio3dYMjUVA6xdYdFFapOJ3s8P
   l8pF1TIaXmq32xCBh2G3HRKtWCncS2yBB/k7jpAyw/b+Ys/wE2A3mqaSO
   g==;
X-CSE-ConnectionGUID: DWWtzgPxQLOHTwI1hrRM4g==
X-CSE-MsgGUID: g1S+DhWqQeWv2z4dJhQ1sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73173840"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73173840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 03:49:12 -0800
X-CSE-ConnectionGUID: X9QB3NuFS5GG7yF7kRCvZA==
X-CSE-MsgGUID: t3YIwJfmSNq4bJ5MyNyXkA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2026 03:49:10 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyq9c-000000001wr-1Zs3;
	Sat, 07 Mar 2026 11:49:08 +0000
Date: Sat, 07 Mar 2026 19:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-6.6.y 685/685]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247
 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null
 (see line 244)
Message-ID: <202603071935.OQME78z6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47
commit: 2e150ccea13129eb048679114808eb9770443e4d [685/685] drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071935.OQME78z6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071935.OQME78z6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:247 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null (see line 244)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:254 dcn21_set_backlight_level() error: we previously assumed 'abm' could be null (see line 244)

vim +/tg +247 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c

474ac4a875ca6f Yongqiang Sun        2020-04-27  233  
474ac4a875ca6f Yongqiang Sun        2020-04-27  234  bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
474ac4a875ca6f Yongqiang Sun        2020-04-27  235  		uint32_t backlight_pwm_u16_16,
474ac4a875ca6f Yongqiang Sun        2020-04-27  236  		uint32_t frame_ramp)
474ac4a875ca6f Yongqiang Sun        2020-04-27  237  {
474ac4a875ca6f Yongqiang Sun        2020-04-27  238  	struct dc_context *dc = pipe_ctx->stream->ctx;
474ac4a875ca6f Yongqiang Sun        2020-04-27  239  	struct abm *abm = pipe_ctx->stream_res.abm;
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  240  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
474ac4a875ca6f Yongqiang Sun        2020-04-27  241  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  242  	uint32_t otg_inst;
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  243  
2e150ccea13129 Srinivasan Shanmugam 2024-01-27 @244  	if (!abm && !tg && !panel_cntl)
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  245  		return false;
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  246  
2e150ccea13129 Srinivasan Shanmugam 2024-01-27 @247  	otg_inst = tg->inst;
474ac4a875ca6f Yongqiang Sun        2020-04-27  248  
474ac4a875ca6f Yongqiang Sun        2020-04-27  249  	if (dc->dc->res_pool->dmcu) {
474ac4a875ca6f Yongqiang Sun        2020-04-27  250  		dce110_set_backlight_level(pipe_ctx, backlight_pwm_u16_16, frame_ramp);
474ac4a875ca6f Yongqiang Sun        2020-04-27  251  		return true;
474ac4a875ca6f Yongqiang Sun        2020-04-27  252  	}
474ac4a875ca6f Yongqiang Sun        2020-04-27  253  
6f0ef80a00adfd Leon Huang           2022-12-08 @254  	if (abm->funcs && abm->funcs->set_pipe_ex) {
71be0f674070a5 Lewis Huang          2023-12-01  255  		abm->funcs->set_pipe_ex(abm,
71be0f674070a5 Lewis Huang          2023-12-01  256  					otg_inst,
71be0f674070a5 Lewis Huang          2023-12-01  257  					SET_ABM_PIPE_NORMAL,
71be0f674070a5 Lewis Huang          2023-12-01  258  					panel_cntl->inst,
71be0f674070a5 Lewis Huang          2023-12-01  259  					panel_cntl->pwrseq_inst);
6f0ef80a00adfd Leon Huang           2022-12-08  260  	} else {
71be0f674070a5 Lewis Huang          2023-12-01  261  		dmub_abm_set_pipe(abm,
71be0f674070a5 Lewis Huang          2023-12-01  262  				  otg_inst,
71be0f674070a5 Lewis Huang          2023-12-01  263  				  SET_ABM_PIPE_NORMAL,
71be0f674070a5 Lewis Huang          2023-12-01  264  				  panel_cntl->inst,
71be0f674070a5 Lewis Huang          2023-12-01  265  				  panel_cntl->pwrseq_inst);
6f0ef80a00adfd Leon Huang           2022-12-08  266  	}
474ac4a875ca6f Yongqiang Sun        2020-04-27  267  
2e150ccea13129 Srinivasan Shanmugam 2024-01-27  268  	if (abm->funcs && abm->funcs->set_backlight_level_pwm)
6f0ef80a00adfd Leon Huang           2022-12-08  269  		abm->funcs->set_backlight_level_pwm(abm, backlight_pwm_u16_16,
6f0ef80a00adfd Leon Huang           2022-12-08  270  			frame_ramp, 0, panel_cntl->inst);
6f0ef80a00adfd Leon Huang           2022-12-08  271  	else
6f0ef80a00adfd Leon Huang           2022-12-08  272  		dmub_abm_set_backlight(dc, backlight_pwm_u16_16, frame_ramp, panel_cntl->inst);
474ac4a875ca6f Yongqiang Sun        2020-04-27  273  
474ac4a875ca6f Yongqiang Sun        2020-04-27  274  	return true;
474ac4a875ca6f Yongqiang Sun        2020-04-27  275  }
474ac4a875ca6f Yongqiang Sun        2020-04-27  276  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
