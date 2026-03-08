Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A629D27E
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772941854; cv=none; b=F3Q1NPE3cdSFDDl4VZLgfqVnbMCntbaSccuZqtgvx7SkKhLrJBW2qzCAfRT6PuRzVwiAAvCiubwN35NkDjbm6nv0l5bVtSgocdc9QqO2+nSLWKsf1HSqP8QOkYvXPPeqwlPFPUL/7wZIS8Ul6JCWf9gvNLNNKupnAkxIIqj3b50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772941854; c=relaxed/simple;
	bh=uo4TFnIB+haj9cmnmtreyNDnYzZo1AHNhTC4dICjtXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h6FVdQ9HofcyVY2R9SteWOoGm7o4yVG4aKzjnAuA+EOH302MLHYmiRTdapzyXvWi/lLh/Dp0esy+Qfj7Cg4XTL6/UUdVL9LKVzj1nFWM5bIsxc7jrcA4pEBXa9UKDym6IfnD/cak/R46WQpUb8cxRJVFmBrMtYYBTR92RwTUbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FS0B7r0t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FS0B7r0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772941852; x=1804477852;
  h=date:from:to:cc:subject:message-id;
  bh=uo4TFnIB+haj9cmnmtreyNDnYzZo1AHNhTC4dICjtXM=;
  b=FS0B7r0t3+DxMXiHFrKqTkU1HUKQ1HdGvxQdUFX8E8ovyYIAfxIQruqf
   p1wWDM79kDaHL6irn/xv7Km5nzwNFwXfHjgUyiUZ6CLeLPjVkCmJQIKbg
   dtWUcUuzrfpkRq94ovAy9C0aMannHC+pQ/BK1D0U9wEzNbDBmQvJc1cGV
   BOR5AelhlA4R9RpGGULrud7kwxrzubx08oYNeR2bxipPF3eMGvPOAzj1M
   llxjDUUoS4OpPQd4ZCLetfYBwwo2ixzfhCR0duqdPh2aq2tjh99Vl4AZI
   jOX4gwh2YBpY1vocK1dP/sT8HoOc8pdXy2pVOnslN92qhLlgdD1JCvVyj
   g==;
X-CSE-ConnectionGUID: l0xvShqhQbWNcNcASx7E+A==
X-CSE-MsgGUID: aaPZEWbXSHGKr1U5IM39yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="91574939"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="91574939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 19:50:51 -0800
X-CSE-ConnectionGUID: m6RB6BiwQ3SKVfbd2BDdCA==
X-CSE-MsgGUID: V3suTnXYQzeE78A3jZgvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="242414892"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2026 19:50:50 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz5AG-000000002t3-0TxO;
	Sun, 08 Mar 2026 03:50:48 +0000
Date: Sun, 08 Mar 2026 11:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-6.6.y 685/685]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:217
 dcn21_set_pipe() error: we previously assumed 'tg' could be null (see line
 214)
Message-ID: <202603081114.uRkcSjeC-lkp@intel.com>
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
commit: 3f3c237a706580326d3b7a1b97697e5031ca4667 [685/685] drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20260306 (https://download.01.org/0day-ci/archive/20260308/202603081114.uRkcSjeC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603081114.uRkcSjeC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:217 dcn21_set_pipe() error: we previously assumed 'tg' could be null (see line 214)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:224 dcn21_set_pipe() error: we previously assumed 'abm' could be null (see line 214)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:251 dcn21_set_backlight_level() error: we previously assumed 'tg' could be null (see line 248)
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:258 dcn21_set_backlight_level() error: we previously assumed 'abm' could be null (see line 248)

vim +/tg +217 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c

474ac4a875ca6f Yongqiang Sun        2020-04-27  205  
474ac4a875ca6f Yongqiang Sun        2020-04-27  206  void dcn21_set_pipe(struct pipe_ctx *pipe_ctx)
474ac4a875ca6f Yongqiang Sun        2020-04-27  207  {
474ac4a875ca6f Yongqiang Sun        2020-04-27  208  	struct abm *abm = pipe_ctx->stream_res.abm;
3f3c237a706580 Srinivasan Shanmugam 2024-01-31  209  	struct timing_generator *tg = pipe_ctx->stream_res.tg;
474ac4a875ca6f Yongqiang Sun        2020-04-27  210  	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
474ac4a875ca6f Yongqiang Sun        2020-04-27  211  	struct dmcu *dmcu = pipe_ctx->stream->ctx->dc->res_pool->dmcu;
3f3c237a706580 Srinivasan Shanmugam 2024-01-31  212  	uint32_t otg_inst;
3f3c237a706580 Srinivasan Shanmugam 2024-01-31  213  
3f3c237a706580 Srinivasan Shanmugam 2024-01-31 @214  	if (!abm && !tg && !panel_cntl)
3f3c237a706580 Srinivasan Shanmugam 2024-01-31  215  		return;
3f3c237a706580 Srinivasan Shanmugam 2024-01-31  216  
3f3c237a706580 Srinivasan Shanmugam 2024-01-31 @217  	otg_inst = tg->inst;
474ac4a875ca6f Yongqiang Sun        2020-04-27  218  
474ac4a875ca6f Yongqiang Sun        2020-04-27  219  	if (dmcu) {
474ac4a875ca6f Yongqiang Sun        2020-04-27  220  		dce110_set_pipe(pipe_ctx);
474ac4a875ca6f Yongqiang Sun        2020-04-27  221  		return;
474ac4a875ca6f Yongqiang Sun        2020-04-27  222  	}
474ac4a875ca6f Yongqiang Sun        2020-04-27  223  
6f0ef80a00adfd Leon Huang           2022-12-08 @224  	if (abm->funcs && abm->funcs->set_pipe_ex) {
71be0f674070a5 Lewis Huang          2023-12-01  225  		abm->funcs->set_pipe_ex(abm,
71be0f674070a5 Lewis Huang          2023-12-01  226  					otg_inst,
71be0f674070a5 Lewis Huang          2023-12-01  227  					SET_ABM_PIPE_NORMAL,
71be0f674070a5 Lewis Huang          2023-12-01  228  					panel_cntl->inst,
71be0f674070a5 Lewis Huang          2023-12-01  229  					panel_cntl->pwrseq_inst);
6f0ef80a00adfd Leon Huang           2022-12-08  230  	} else {
71be0f674070a5 Lewis Huang          2023-12-01  231  		dmub_abm_set_pipe(abm, otg_inst,
71be0f674070a5 Lewis Huang          2023-12-01  232  				  SET_ABM_PIPE_NORMAL,
71be0f674070a5 Lewis Huang          2023-12-01  233  				  panel_cntl->inst,
71be0f674070a5 Lewis Huang          2023-12-01  234  				  panel_cntl->pwrseq_inst);
474ac4a875ca6f Yongqiang Sun        2020-04-27  235  	}
6f0ef80a00adfd Leon Huang           2022-12-08  236  }
474ac4a875ca6f Yongqiang Sun        2020-04-27  237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
