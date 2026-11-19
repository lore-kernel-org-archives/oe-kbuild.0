Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064192;
	b=qr206KYgXnMXZoOpU/J84dS0atElWkds9FTlHANmJzP38tjFhJcslhPyfXv2SdfdWHDn
	 ABTEPk4S4+i9XbZVvwfdUyMZIMkWQlaQJfNbFKW2C1VY6qr5I9mxrb4TqPQnHDJ8HpEgG
	 NXbxOagmWWI4o/GtWkpo3CDz4UI66vmNsXjd0KJHmPfdP5u2GXFMAoXoCwrRuh4K0czYN
	 Hw1yBw5B0K59PVTP9M5+tZxwc/U5Sl/sAe90utiCskueVPWFauBRlSJrDu3y98c9EQAcK
	 xc630ot1aZuUUZHCAmiUdOXfKlCYvbggAaTqZvzrRH8qb71y9rvD63x5JqfNqulVLIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064192;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EsVjz/oO8JU67VUdhWk7fQFB7LSn7v+7DVlY9lQit3o=;
	b=pCu2x9xoWpiGqqIxNk6vfnQ+7kE5tNcuW4PWxlxjUuLnNnWuq0BK9inZT9m38AmYYi3f
	 kHUi9ZHxI8joqiD6bqDQ/5x7MdaphGeRpjtY+IB6hTYBBAHey2WheXH/ZLC2fFHacInb6
	 xQksGiF+lIlDDuioa/cOFDNispKBJtULgJbetnjSzluq2TfSPXt+SgHIXg9bFlvnpSQKV
	 /aZ51tO/T5RIqGfPsUFfL2+LvkVw55e3rxRWk4UKCn8QxRAQBaim8rlG+4mi6WBJRYqpf
	 Yc0kI5TdSTvU6ItG/kI5KwxUmRTCWQxwuxUxKZeexUwkYia8UCkzGz0a4AkcBu0CIww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWgNBThp;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECD606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 04:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6ECD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kWgNBThp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795064191; x=1826600191;
  h=date:from:to:cc:subject:message-id;
  bh=bt4t92ZrbNPSduAJEx5uks+R4rlRbDY2qS3dVyxADqU=;
  b=kWgNBThp9xJoI2e+QG9K7eJOd6FjJN4lnx5246BtSUaU8SpfOI6TUKAI
   /uT9mrYhdAE9P+fJePxo5cd7OBh0b/S93/HcaB6c+B1DosCNPDI+/cHK6
   6I/mWYAb4gVLjLYoaQH0HJh6RNZZ7x7FZo5U8NR2UBI6n0vTfP90ZzK3U
   suYF/OAzq3zPSEOySpL9ma5Pebzs9+Mg/R1Zw1OPMW09bfz0Vl7LKaPuj
   CUOLj7JOJiOIrVUIffqgxZ96XaIeAmABxM2TbTW6aKBA1+RHx0Rh8d2wo
   aO4KrlhqlhJ/mr0EyIimdJVxgcKJsQr+phGyXWBIk1ODVd1onogftoaVW
   A==;
X-CSE-ConnectionGUID: 9fueBUnBSjeJa85PFxjFkQ==
X-CSE-MsgGUID: ijQo1dWaSL23JVvKH25PBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3800165"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3800165"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 20:56:30 -0800
X-CSE-ConnectionGUID: daQyEX8ZRhCBudPwwicdUQ==
X-CSE-MsgGUID: bjUz2QEcRE2HHZ7YISR3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12288588"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Nov 2026 20:56:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTuCA-000000003fd-1OBf;
	Thu, 19 Nov 2026 04:56:26 +0000
Date: Thu, 19 Nov 2026 05:56:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1-lts 200/200]
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_hwss_hpo_dp.c:142
 reset_hpo_dp_stream_encoder() error: we previously assumed 'dccg' could be
 null (see line 140)
Message-ID: <20261119055333.15uYya1M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   32c8e7bb8f634f61dd3c764ccd86ac57794bb9f5
commit: 967ebae13e206b90c2ef57b917adceaee1fa5390 [200/200] drm/amd/display: Prevent crash when disable stream
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
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

9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  127  
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
0ec744084793db drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c Leung, Martin 2022-05-10  141  		dccg->funcs->set_dtbclk_dto(dccg, &dto_params);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28 @142  	dccg->funcs->disable_symclk32_se(dccg, stream_enc->inst);
9af611f29034dd drivers/gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c George Shen   2022-08-10  143  	dccg->funcs->set_dpstreamclk(dccg, REFCLK, tg->inst, stream_enc->inst);
9d8033d6beca43 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  144  }
e8702d0b97dc9f drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c     Wenjing Liu   2022-01-28  145  

:::::: The code at line 142 was first introduced by commit
:::::: 9d8033d6beca43e9d8eb952adfa8bf08642a357f drm/amd/display: add setup/reset stream encoder to link_hwss

:::::: TO: Wenjing Liu <wenjing.liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
