Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A8EEC3
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726807; cv=none; b=obuHXkd1iB2l9s3PkGrkKp+MYZqMJGzmIDqQkif26KaTI2XalajpLJAi7ttTzpD7oTOAI+a2DsGe3ScsSDMrNvJ2ynca7ee34Ghm/uavrk+QQX0aRIo8JOY5snnbRJlUjn95i1Ruv06RxikkktQX32Ll8gE+XOPVay9WXCJH9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726807; c=relaxed/simple;
	bh=nTtIwlFCas6s82qvUP1SgTK/lOt910E3MvLSTCHFrKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nLu9ICFRNe/NlJsXbyahaWdZG/NOlEXDN2iSqfqfBUEf3heiv8HqrDGrQDNjN4iVaLlR/P3lVzi0EoJJogJeDl1qJ/1t1+vklkv8z82VoMcQKgeW4slZ2ivPIbumKNlgDDSKkH/kneQnnkEbMBiMR/yxL9IyMWWeeV+fDB/AzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COhv6Ou4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COhv6Ou4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743726801; x=1775262801;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nTtIwlFCas6s82qvUP1SgTK/lOt910E3MvLSTCHFrKE=;
  b=COhv6Ou4QndLWufo6evkf18u7cjVCwhqu/AQZb70ib7ga+XpEMa32SzS
   QDl7JQtExmn2DL+JUnH1z627opZVHWgs2rPnP1xN4YPGr6uqaFF8Xs4E8
   IypXyWXLewxIkVqB0VvB+k9VS0PjBKqjXA+N2F/EoYk77ma6e06/UxO+D
   l7ccihNyL53G1SRxcAsncohHEr0tuafmLdVg9U2ycggEhJKpWNXhaeYS5
   PWPIrhDD4fPADAfUD9P9i6NSUgFn0tNjwGs2DxlUbGV3SdG82Yd3FL0T0
   MWkNgI1MkCaL9NccMtJcWbuvGfQAfzAEPJGlDazhLPkQhpwzFWa5enb70
   w==;
X-CSE-ConnectionGUID: CrP+XqapQT+oQLuhzrsEhA==
X-CSE-MsgGUID: JQ2PfiEVRHGIh7dsMvSm3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48955904"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="48955904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 17:33:21 -0700
X-CSE-ConnectionGUID: x95iJHsWQbK0HODLldkYXA==
X-CSE-MsgGUID: jgixwDOtQfKuLhoYIBjljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="164387267"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2025 17:33:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Uzk-0000sx-0w;
	Fri, 04 Apr 2025 00:33:16 +0000
Date: Fri, 4 Apr 2025 08:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dd-fix-614 53/54]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:140
 print__dlg_sys_params_st() error: no floats in the kernel; invalid format
 specifier '%3.2f'
Message-ID: <202504040814.DfAhoGRi-lkp@intel.com>
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

tree:   https://github.com/jimc/linux.git dd-fix-614
head:   5cbe833ce591cdb076310b7dcf479fd566f10a22
commit: 375b286467696baaf263d4cfc346febf32447118 [53/54] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250403 (https://download.01.org/0day-ci/archive/20250404/202504040814.DfAhoGRi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504040814.DfAhoGRi-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:140 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:238 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:248 dml_log_pipe_params() error: no floats in the kernel; invalid format specifier '%3.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:117 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:151 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:181 get_swath_need() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1144 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:913 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1647 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:913 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1648 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.c:287 get_det_buffer_size_kbytes() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:120 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:959 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1547 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1762 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:68 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:863 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1030 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1432 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:835 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:970 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c:269 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:920 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1055 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:638 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1270 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2963 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:698 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1330 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3036 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:850 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1654 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3050 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1431 dcn_bw_sync_calcs_and_dml() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:949 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:1992 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:969 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2129 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6441 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:987 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2147 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6536 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:141 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:142 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:143 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:144 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:147 print__dlg_sys_params_st() error: no floats in the kernel; invalid format specifier '%3.2f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:120 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:122 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:152 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:155 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:160 get_vratio_pre() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:695 get_surf_rq_param() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:701 get_surf_rq_param() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1145 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1146 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1147 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1178 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1179 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1180 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1184 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1189 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1316 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1320 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1324 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1333 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1337 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1338 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1339 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1340 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1341 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1345 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1349 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1472 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1473 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1474 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1475 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1476 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1477 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1478 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1479 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1495 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1514 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1515 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1673 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1674 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1678 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1713 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1717 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1761 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1765 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1798 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1802 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1873 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1877 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1881 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1885 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:1889 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:463 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:467 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:649 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:649 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:914 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:915 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:916 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:939 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:942 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:945 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:948 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:954 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1089 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1112 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1113 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1121 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1126 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1127 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1226 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1229 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1232 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1259 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1262 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1297 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1300 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1329 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1332 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1650 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1653 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1656 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c:1659 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:463 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:467 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:649 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:649 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:914 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:915 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:916 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:940 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:943 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:946 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:949 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:955 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1090 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1113 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1114 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1122 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1127 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1128 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1227 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1230 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1233 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1260 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1263 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1298 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1301 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1330 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1333 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1651 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1654 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1657 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c:1660 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:121 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:123 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:125 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:455 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:461 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:655 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:655 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:960 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:961 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:962 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:985 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:989 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:993 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:997 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1005 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1137 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1162 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1163 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1164 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1165 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1173 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1178 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1179 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1279 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1283 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1287 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1317 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1321 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1359 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1363 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1395 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1399 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1766 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1770 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1774 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1778 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:69 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:71 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:73 get_refcyc_per_delivery() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:424 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:440 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:623 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:623 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:866 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:869 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:872 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:875 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1031 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1032 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1033 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1054 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1057 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1060 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1063 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1069 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1243 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1266 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1267 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1268 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1269 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1277 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1282 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1283 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1382 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1385 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1388 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1415 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1418 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1468 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1471 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1500 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1503 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1638 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:444 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:460 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:618 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:618 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:836 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:837 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:838 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:839 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:971 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:972 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:987 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:990 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1089 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1110 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1111 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1112 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1113 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1114 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1123 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1124 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1157 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1158 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1159 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1226 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1227 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1228 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1229 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1230 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1263 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1264 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1265 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1266 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1310 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1311 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1312 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1313 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1347 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1348 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1349 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1350 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1384 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1385 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1386 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1387 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:532 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:548 get_meta_and_pte_attr() warn: right shifting more than type allows 32 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:706 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:706 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:921 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:922 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:923 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:924 calculate_ttu_cursor() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1056 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1057 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1074 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1077 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1177 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1198 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1199 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1200 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1201 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1202 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1211 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1212 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1245 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1246 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1247 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1314 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1315 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1316 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1317 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1318 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1351 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1352 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1353 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1354 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1398 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1399 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1400 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1401 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1435 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1436 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1437 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1438 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1472 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1473 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1474 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314.c:1475 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:639 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:640 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:641 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:642 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:643 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:644 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:645 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1293 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1324 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1325 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1326 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1391 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1483 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1484 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1501 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1507 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1511 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1524 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1685 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1691 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1701 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:1702 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2701 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2966 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2967 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2968 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2969 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:2971 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:699 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:700 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:701 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:702 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:703 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:704 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:705 CalculatePrefetchSchedule() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1353 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1384 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1385 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1386 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1451 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1519 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1520 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1537 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1543 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1547 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1560 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1721 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1727 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1737 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:1738 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:2774 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3039 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3040 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3041 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3042 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3044 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1673 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1677 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1678 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1679 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:1739 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3053 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3054 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3055 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3056 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3058 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5045 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5050 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:5070 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1499 dcn_bw_sync_calcs_and_dml() error: no floats in the kernel; invalid format specifier '%f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2011 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2016 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2017 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2068 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:2621 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2138 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2146 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2147 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2199 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:2807 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6442 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6446 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6447 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6452 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6453 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6532 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6600 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6601 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6602 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6603 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6604 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6605 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:6606 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2156 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2164 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2165 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2217 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:2826 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6537 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6541 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6542 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6547 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6548 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6627 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6695 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6696 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6697 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6698 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6699 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6700 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:6701 CalculateStutterEfficiency() error: no floats in the kernel; invalid format specifier '%f'

vim +140 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c

061bfa06a42a9f Harry Wentland     2017-05-08  135  
4768349e8885a1 Harry Wentland     2021-09-08  136  void print__dlg_sys_params_st(struct display_mode_lib *mode_lib, const struct _vcs_dpi_display_dlg_sys_params_st *dlg_sys_param)
061bfa06a42a9f Harry Wentland     2017-05-08  137  {
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  138  	dml_print("DML_RQ_DLG_CALC: =====================================\n");
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  139  	dml_print("DML_RQ_DLG_CALC: DISPLAY_RQ_DLG_PARAM_ST\n");
4768349e8885a1 Harry Wentland     2021-09-08 @140  	dml_print("DML_RQ_DLG_CALC:    t_mclk_wm_us         = %3.2f\n", dlg_sys_param->t_mclk_wm_us);
4768349e8885a1 Harry Wentland     2021-09-08  141  	dml_print("DML_RQ_DLG_CALC:    t_urg_wm_us          = %3.2f\n", dlg_sys_param->t_urg_wm_us);
4768349e8885a1 Harry Wentland     2021-09-08  142  	dml_print("DML_RQ_DLG_CALC:    t_sr_wm_us           = %3.2f\n", dlg_sys_param->t_sr_wm_us);
4768349e8885a1 Harry Wentland     2021-09-08  143  	dml_print("DML_RQ_DLG_CALC:    t_extra_us           = %3.2f\n", dlg_sys_param->t_extra_us);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  144  	dml_print(
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  145  			"DML_RQ_DLG_CALC:    deepsleep_dcfclk_mhz = %3.2f\n",
4768349e8885a1 Harry Wentland     2021-09-08  146  			dlg_sys_param->deepsleep_dcfclk_mhz);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  147  	dml_print(
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  148  			"DML_RQ_DLG_CALC:    total_flip_bw        = %3.2f\n",
4768349e8885a1 Harry Wentland     2021-09-08  149  			dlg_sys_param->total_flip_bw);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  150  	dml_print(
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  151  			"DML_RQ_DLG_CALC:    total_flip_bytes     = %i\n",
4768349e8885a1 Harry Wentland     2021-09-08  152  			dlg_sys_param->total_flip_bytes);
6d04ee9dc10149 Dmytro Laktyushkin 2017-08-23  153  	dml_print("DML_RQ_DLG_CALC: =====================================\n");
061bfa06a42a9f Harry Wentland     2017-05-08  154  }
061bfa06a42a9f Harry Wentland     2017-05-08  155  

:::::: The code at line 140 was first introduced by commit
:::::: 4768349e8885a171a279ff26af218b48b8cdddf0 drm/amd/display: Pass all structs in display_rq_dlg_helpers by pointer

:::::: TO: Harry Wentland <harry.wentland@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
