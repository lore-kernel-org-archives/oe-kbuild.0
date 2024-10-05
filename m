Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9A13635B
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 23:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728170378; cv=none; b=g5FMU3j3Al4nxxNJmqM5NUojXPXY4bVaXtBi2ODn6FXkweyXaxAPpAGf3/q5ClUSQ3k4qvPZ77EgRzxK2zSj7QSPMBizb4PsSp8DT616/vqflv212ncTHI8LyHJcOJlZK2Y4l9IvL7u9AiZtwI13RSJ6P/uzX9aKGF+cQzdFzM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728170378; c=relaxed/simple;
	bh=SbktbZjoqWREowieRAFIKomrQTfChEBXCRCii3nPPec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sh1T0PZQKVZvFp6p/YH1M8Y59+CuI3/FWZc3bnXByNzuJMVWt6ccuyW9sGKkOlSqel8RZp+Uxx5UQ+Rx+8sgO4ajVTk5HTGKwo9JQABARJNFpI3Ww+bCoQ2Y7vyEe5UjpvuOaFFQNqWhdslW7wCVq2XlzeoX82CPgZhaLtOxbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDbzdr8Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDbzdr8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728170373; x=1759706373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SbktbZjoqWREowieRAFIKomrQTfChEBXCRCii3nPPec=;
  b=JDbzdr8QDlhEm/3qb1av5dMEVkpB6ji2vuNoplyFAk7xbBNMbqBQQkYt
   NF6VYABkl5YWPdYAsOG8DMf1zHGmtas2hj9Ze535sr3SbuUZAQk7uZXMp
   PSRLSI96E053wciRv183PkEo4r+a0ye7M/jdtR/I1pO5MoZfrxIxNpf/5
   qNWp1uVUSP0Nq6n/qsaJGwNEy0OOa6SjcJeujQcQ/yrvo6THqWMkdAAV/
   /pxABhgd9BWbUVHdbJ00Cz4/N9MMhZqhlhKKy6iMHxxooHtwk3elNvG/X
   t/GOZFHBxPZpCWo806HhFRvxhAOyla+SvNkB/9r7j6a0H+jko0VBMJcJF
   g==;
X-CSE-ConnectionGUID: Qek4UWIdSbeMDhvvjqdNkQ==
X-CSE-MsgGUID: SZvBYt3NSAqLMTFrdSSIiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27235382"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27235382"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 16:19:32 -0700
X-CSE-ConnectionGUID: K78s95dWRQ+9WEgu3YhNCA==
X-CSE-MsgGUID: +QNbHN95TSaNFAdTYIllxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="80032552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 16:19:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxE3c-0003RS-09;
	Sat, 05 Oct 2024 23:19:28 +0000
Date: Sun, 6 Oct 2024 07:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dyndbg_trace_v4_5d 56/104]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:238
 dml_log_pipe_params() error: no floats in the kernel; invalid format
 specifier '%3.2f'
Message-ID: <202410060722.FI90PU1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5d
head:   f80f5812bfbeed250f7095621935b1eaaa5d71d2
commit: b62b20d59d01fab0bc194366191ff4edaa4a9ea7 [56/104] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r071-20241003 (https://download.01.org/0day-ci/archive/20241006/202410060722.FI90PU1k-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410060722.FI90PU1k-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:238 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:248 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:140 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.c:287 get_det_buffer_size_kbytes() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:920 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1655 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:117 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:151 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:181 get_swath_need() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1145 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:920 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1654 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:120 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:963 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1551 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1766 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:68 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:867 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1034 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1436 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:839 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:974 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:269 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:638 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1273 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2966 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:924 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1059 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:949 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2004 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:698 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1333 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3039 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:850 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1657 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3053 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:969 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2141 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6453 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:987 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2150 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6539 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1563 dcn_bw_sync_calcs_and_dml() error: no floats in the kernel; invalid format specifier '%f'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:249 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:250 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:251 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:252 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:253 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:254 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:255 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:268 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:278 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:279 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:280 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:281 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:282 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:141 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:142 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:143 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:144 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:147 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:472 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:656 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:656 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:921 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:922 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:923 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:947 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:950 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:953 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:956 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:962 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1097 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1120 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1121 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1129 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1134 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1135 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1234 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1237 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1240 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1267 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1270 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1305 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1308 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1337 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1340 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1658 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1661 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1664 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1667 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:120 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:122 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:152 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:155 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:160 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:696 get_surf_rq_param() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:702 get_surf_rq_param() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1146 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1147 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1148 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1179 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1180 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1181 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1185 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1190 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1317 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1321 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1325 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1334 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1338 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1339 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1340 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1341 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1342 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1346 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1350 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1473 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1474 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1475 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1476 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1477 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1478 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1479 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1480 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1496 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1515 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1516 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1674 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1675 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1679 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1714 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1718 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1762 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1766 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1799 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1803 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1874 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1878 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1882 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1886 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1890 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:468 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:472 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:656 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:921 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:922 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:923 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:946 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:949 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:952 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:955 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:961 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1096 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1119 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1120 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1128 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1133 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1134 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1233 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1236 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1239 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1266 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1269 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1304 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1307 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1336 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1339 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1657 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1660 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1663 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1666 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:121 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:123 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:125 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:457 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:463 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:659 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:659 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:964 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:965 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:966 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:989 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:993 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:997 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1001 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1009 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1141 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1166 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1167 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1168 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1169 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1177 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1182 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1183 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1283 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1287 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1291 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1321 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1325 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1363 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1367 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1399 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1403 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1770 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1774 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1778 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1782 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:69 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:71 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:73 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:426 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:442 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:627 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:627 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:870 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:873 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:876 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:879 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1035 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1036 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1037 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1058 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1061 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1064 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1067 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1073 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1247 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1270 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1271 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1272 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1273 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1281 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1286 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1287 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1386 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1389 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1392 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1419 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1422 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1472 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1475 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1504 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1507 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1641 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:446 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:462 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:622 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:840 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:841 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:842 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:843 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:975 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:976 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:991 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:994 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1093 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1114 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1115 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1116 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1117 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1118 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1127 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1128 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1161 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1162 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1163 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1230 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1231 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1232 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1233 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1234 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1267 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1268 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1269 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1270 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1314 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1315 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1316 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1317 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1351 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1352 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1353 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1354 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1388 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1389 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1390 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1391 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:270 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:271 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:282 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:284 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:365 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:366 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:367 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:368 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:369 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:378 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:379 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:386 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:387 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:395 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:397 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:412 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:413 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:421 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:423 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:434 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:436 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:639 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:640 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:641 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:642 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:643 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:644 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:645 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1296 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1327 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1328 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1329 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1394 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1486 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1487 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1504 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1510 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1514 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1527 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1688 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1694 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1704 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1705 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2704 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2969 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2970 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2971 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2972 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2974 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:534 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:550 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:710 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:710 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:925 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:926 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:927 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:928 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1060 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1061 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1078 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1081 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1181 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1202 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1203 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1204 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1205 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1206 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1215 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1216 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1249 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1250 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1251 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1318 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1319 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1320 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1321 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1322 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1355 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1356 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1357 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1358 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1402 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1403 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1404 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1405 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1439 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1440 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1441 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1442 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1476 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1477 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1478 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1479 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:950 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:951 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:952 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1032 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1033 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1035 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1037 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1038 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1039 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1040 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1041 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1042 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1043 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1044 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1045 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1046 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1151 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1233 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1240 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1241 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1242 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1243 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1244 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1245 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1247 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2023 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2028 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2029 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2080 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2633 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:699 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:700 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:701 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:702 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:703 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:704 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:705 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1356 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1387 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1388 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1389 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1454 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1522 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1523 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1540 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1546 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1550 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1563 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1724 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1730 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1740 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1741 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2777 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3042 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3043 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3044 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3045 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3047 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:851 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:852 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:853 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:854 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:855 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:856 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:857 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1016 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1017 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1018 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1019 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1676 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1680 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1681 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1682 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1742 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3056 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3057 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3058 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3059 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3061 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5048 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5053 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5073 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:970 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:971 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:972 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1116 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1117 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1118 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1119 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1120 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1121 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1123 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1125 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1126 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1127 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1128 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1129 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1130 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1131 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1132 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1133 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1134 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1135 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1290 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1373 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1380 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1383 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1384 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1385 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1388 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:1392 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2150 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2158 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2159 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2211 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2819 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6454 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6458 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6459 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6464 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6465 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6544 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6612 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6613 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6614 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6615 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6616 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6617 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6618 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:988 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:989 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:990 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1134 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1135 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1136 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1137 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1138 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1139 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1141 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1143 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1144 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1145 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1146 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1147 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1148 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1149 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1150 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1151 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1152 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1153 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1391 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1398 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1401 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1402 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1403 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1406 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:1408 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2159 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2167 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2168 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2220 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2829 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6540 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6544 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6545 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6550 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6551 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6630 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6698 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6699 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6700 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6701 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6702 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6703 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6704 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1631 dcn_bw_sync_calcs_and_dml() error: no floats in the kernel; invalid format specifier '%f'

vim +238 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c

20f2ffe5047286 Alex Deucher        2020-11-02  159  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  160  void dml_log_pipe_params(
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  161  		struct display_mode_lib *mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  162  		display_e2e_pipe_params_st *pipes,
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  163  		int pipe_cnt)
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  164  {
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  165  	display_pipe_source_params_st *pipe_src;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  166  	display_pipe_dest_params_st   *pipe_dest;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  167  	scaler_ratio_depth_st         *scale_ratio_depth;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  168  	scaler_taps_st                *scale_taps;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  169  	display_output_params_st      *dout;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  170  	display_clocks_and_cfg_st     *clks_cfg;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  171  	int i;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  172  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  173  	for (i = 0; i < pipe_cnt; i++) {
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  174  		pipe_src = &(pipes[i].pipe.src);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  175  		pipe_dest = &(pipes[i].pipe.dest);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  176  		scale_ratio_depth = &(pipes[i].pipe.scale_ratio_depth);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  177  		scale_taps = &(pipes[i].pipe.scale_taps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  178  		dout = &(pipes[i].dout);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  179  		clks_cfg = &(pipes[i].clks_cfg);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  180  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  181  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  182  		dml_print("DML PARAMS: PIPE [%d] SOURCE PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  183  		dml_print("DML PARAMS:     source_format              = %d\n", pipe_src->source_format);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  184  		dml_print("DML PARAMS:     dcc                        = %d\n", pipe_src->dcc);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  185  		dml_print("DML PARAMS:     dcc_rate                   = %d\n", pipe_src->dcc_rate);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  186  		dml_print("DML PARAMS:     dcc_use_global             = %d\n", pipe_src->dcc_use_global);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  187  		dml_print("DML PARAMS:     vm                         = %d\n", pipe_src->vm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  188  		dml_print("DML PARAMS:     gpuvm                      = %d\n", pipe_src->gpuvm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  189  		dml_print("DML PARAMS:     hostvm                     = %d\n", pipe_src->hostvm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  190  		dml_print("DML PARAMS:     gpuvm_levels_force_en      = %d\n", pipe_src->gpuvm_levels_force_en);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  191  		dml_print("DML PARAMS:     gpuvm_levels_force         = %d\n", pipe_src->gpuvm_levels_force);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  192  		dml_print("DML PARAMS:     source_scan                = %d\n", pipe_src->source_scan);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  193  		dml_print("DML PARAMS:     sw_mode                    = %d\n", pipe_src->sw_mode);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  194  		dml_print("DML PARAMS:     macro_tile_size            = %d\n", pipe_src->macro_tile_size);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  195  		dml_print("DML PARAMS:     viewport_width             = %d\n", pipe_src->viewport_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  196  		dml_print("DML PARAMS:     viewport_height            = %d\n", pipe_src->viewport_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  197  		dml_print("DML PARAMS:     viewport_y_y               = %d\n", pipe_src->viewport_y_y);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  198  		dml_print("DML PARAMS:     viewport_y_c               = %d\n", pipe_src->viewport_y_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  199  		dml_print("DML PARAMS:     viewport_width_c           = %d\n", pipe_src->viewport_width_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  200  		dml_print("DML PARAMS:     viewport_height_c          = %d\n", pipe_src->viewport_height_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  201  		dml_print("DML PARAMS:     data_pitch                 = %d\n", pipe_src->data_pitch);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  202  		dml_print("DML PARAMS:     data_pitch_c               = %d\n", pipe_src->data_pitch_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  203  		dml_print("DML PARAMS:     meta_pitch                 = %d\n", pipe_src->meta_pitch);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  204  		dml_print("DML PARAMS:     meta_pitch_c               = %d\n", pipe_src->meta_pitch_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  205  		dml_print("DML PARAMS:     cur0_src_width             = %d\n", pipe_src->cur0_src_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  206  		dml_print("DML PARAMS:     cur0_bpp                   = %d\n", pipe_src->cur0_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  207  		dml_print("DML PARAMS:     cur1_src_width             = %d\n", pipe_src->cur1_src_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  208  		dml_print("DML PARAMS:     cur1_bpp                   = %d\n", pipe_src->cur1_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  209  		dml_print("DML PARAMS:     num_cursors                = %d\n", pipe_src->num_cursors);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  210  		dml_print("DML PARAMS:     is_hsplit                  = %d\n", pipe_src->is_hsplit);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  211  		dml_print("DML PARAMS:     hsplit_grp                 = %d\n", pipe_src->hsplit_grp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  212  		dml_print("DML PARAMS:     dynamic_metadata_enable    = %d\n", pipe_src->dynamic_metadata_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  213  		dml_print("DML PARAMS:     dmdata_lines_before_active = %d\n", pipe_src->dynamic_metadata_lines_before_active);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  214  		dml_print("DML PARAMS:     dmdata_xmit_bytes          = %d\n", pipe_src->dynamic_metadata_xmit_bytes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  215  		dml_print("DML PARAMS:     immediate_flip             = %d\n", pipe_src->immediate_flip);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  216  		dml_print("DML PARAMS:     v_total_min                = %d\n", pipe_src->v_total_min);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  217  		dml_print("DML PARAMS:     v_total_max                = %d\n", pipe_src->v_total_max);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  218  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  219  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  220  		dml_print("DML PARAMS: PIPE [%d] DESTINATION PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  221  		dml_print("DML PARAMS:     recout_width               = %d\n", pipe_dest->recout_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  222  		dml_print("DML PARAMS:     recout_height              = %d\n", pipe_dest->recout_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  223  		dml_print("DML PARAMS:     full_recout_width          = %d\n", pipe_dest->full_recout_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  224  		dml_print("DML PARAMS:     full_recout_height         = %d\n", pipe_dest->full_recout_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  225  		dml_print("DML PARAMS:     hblank_start               = %d\n", pipe_dest->hblank_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  226  		dml_print("DML PARAMS:     hblank_end                 = %d\n", pipe_dest->hblank_end);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  227  		dml_print("DML PARAMS:     vblank_start               = %d\n", pipe_dest->vblank_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  228  		dml_print("DML PARAMS:     vblank_end                 = %d\n", pipe_dest->vblank_end);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  229  		dml_print("DML PARAMS:     htotal                     = %d\n", pipe_dest->htotal);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  230  		dml_print("DML PARAMS:     vtotal                     = %d\n", pipe_dest->vtotal);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  231  		dml_print("DML PARAMS:     vactive                    = %d\n", pipe_dest->vactive);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  232  		dml_print("DML PARAMS:     hactive                    = %d\n", pipe_dest->hactive);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  233  		dml_print("DML PARAMS:     vstartup_start             = %d\n", pipe_dest->vstartup_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  234  		dml_print("DML PARAMS:     vupdate_offset             = %d\n", pipe_dest->vupdate_offset);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  235  		dml_print("DML PARAMS:     vupdate_width              = %d\n", pipe_dest->vupdate_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  236  		dml_print("DML PARAMS:     vready_offset              = %d\n", pipe_dest->vready_offset);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  237  		dml_print("DML PARAMS:     interlaced                 = %d\n", pipe_dest->interlaced);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21 @238  		dml_print("DML PARAMS:     pixel_rate_mhz             = %3.2f\n", pipe_dest->pixel_rate_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  239  		dml_print("DML PARAMS:     sync_vblank_all_planes     = %d\n", pipe_dest->synchronized_vblank_all_planes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  240  		dml_print("DML PARAMS:     otg_inst                   = %d\n", pipe_dest->otg_inst);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  241  		dml_print("DML PARAMS:     odm_combine                = %d\n", pipe_dest->odm_combine);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  242  		dml_print("DML PARAMS:     use_maximum_vstartup       = %d\n", pipe_dest->use_maximum_vstartup);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  243  		dml_print("DML PARAMS:     vtotal_max                 = %d\n", pipe_dest->vtotal_max);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  244  		dml_print("DML PARAMS:     vtotal_min                 = %d\n", pipe_dest->vtotal_min);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  245  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  246  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  247  		dml_print("DML PARAMS: PIPE [%d] SCALER PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21 @248  		dml_print("DML PARAMS:     hscl_ratio                 = %3.4f\n", scale_ratio_depth->hscl_ratio);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  249  		dml_print("DML PARAMS:     vscl_ratio                 = %3.4f\n", scale_ratio_depth->vscl_ratio);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  250  		dml_print("DML PARAMS:     hscl_ratio_c               = %3.4f\n", scale_ratio_depth->hscl_ratio_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  251  		dml_print("DML PARAMS:     vscl_ratio_c               = %3.4f\n", scale_ratio_depth->vscl_ratio_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  252  		dml_print("DML PARAMS:     vinit                      = %3.4f\n", scale_ratio_depth->vinit);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  253  		dml_print("DML PARAMS:     vinit_c                    = %3.4f\n", scale_ratio_depth->vinit_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  254  		dml_print("DML PARAMS:     vinit_bot                  = %3.4f\n", scale_ratio_depth->vinit_bot);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  255  		dml_print("DML PARAMS:     vinit_bot_c                = %3.4f\n", scale_ratio_depth->vinit_bot_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  256  		dml_print("DML PARAMS:     lb_depth                   = %d\n", scale_ratio_depth->lb_depth);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  257  		dml_print("DML PARAMS:     scl_enable                 = %d\n", scale_ratio_depth->scl_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  258  		dml_print("DML PARAMS:     htaps                      = %d\n", scale_taps->htaps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  259  		dml_print("DML PARAMS:     vtaps                      = %d\n", scale_taps->vtaps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  260  		dml_print("DML PARAMS:     htaps_c                    = %d\n", scale_taps->htaps_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  261  		dml_print("DML PARAMS:     vtaps_c                    = %d\n", scale_taps->vtaps_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  262  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  263  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  264  		dml_print("DML PARAMS: PIPE [%d] DISPLAY OUTPUT PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  265  		dml_print("DML PARAMS:     output_type                = %d\n", dout->output_type);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  266  		dml_print("DML PARAMS:     output_format              = %d\n", dout->output_format);
091e3131a8c237 Nicholas Kazlauskas 2021-03-26  267  		dml_print("DML PARAMS:     dsc_input_bpc              = %d\n", dout->dsc_input_bpc);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  268  		dml_print("DML PARAMS:     output_bpp                 = %3.4f\n", dout->output_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  269  		dml_print("DML PARAMS:     dp_lanes                   = %d\n", dout->dp_lanes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  270  		dml_print("DML PARAMS:     dsc_enable                 = %d\n", dout->dsc_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  271  		dml_print("DML PARAMS:     dsc_slices                 = %d\n", dout->dsc_slices);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  272  		dml_print("DML PARAMS:     wb_enable                  = %d\n", dout->wb_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  273  		dml_print("DML PARAMS:     num_active_wb              = %d\n", dout->num_active_wb);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  274  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  275  
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  276  		dml_print("DML PARAMS: PIPE [%d] CLOCK CONFIG PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  277  		dml_print("DML PARAMS:     voltage                    = %d\n", clks_cfg->voltage);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  278  		dml_print("DML PARAMS:     dppclk_mhz                 = %3.2f\n", clks_cfg->dppclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  279  		dml_print("DML PARAMS:     refclk_mhz                 = %3.2f\n", clks_cfg->refclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  280  		dml_print("DML PARAMS:     dispclk_mhz                = %3.2f\n", clks_cfg->dispclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  281  		dml_print("DML PARAMS:     dcfclk_mhz                 = %3.2f\n", clks_cfg->dcfclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  282  		dml_print("DML PARAMS:     socclk_mhz                 = %3.2f\n", clks_cfg->socclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  283  		dml_print("DML PARAMS: =====================================\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  284  	}
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  285  }
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  286  

:::::: The code at line 238 was first introduced by commit
:::::: 6725a88f88a7e922e91c45bf83d320487810c192 drm/amd/display: Add DCN3 DML

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
