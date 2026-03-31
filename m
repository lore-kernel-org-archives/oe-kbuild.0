Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E235838A
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942230; cv=none; b=TCrze6voCbgbF8BmCy3eYdyLyh7REJmw8wUmhOjulsiaDLgbiQm9egplwuE1CtSk4XAsXtd8iajAiNFlJCSO3aZjWNrNA5+Lo07g5BL865qXtj31nLfAlglt7UReMDhc3Jv7yPaXW7WachdHmaT8h0qs6Zxl2MzbojmUhf5DeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942230; c=relaxed/simple;
	bh=17dAtVw2vFz4opT//FpLI/UL/G92BDNI0OTVhAGzcos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=muEBKnOT17GuHTUMbDhgLBAlY6B9YzEpGewV8C4vF+F3bIqYWPqbH9ug6JNPeuNK9XRKqbTPE8XZqvMRKHrSK2/s08tEPY9Bwaj4vTWhOSqE6OEzvxZhq0PqUXysjn4+OYGPkhwljuMFwzlKqgh5WuzBhSxh0Maooc7bJhaxdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4kYNrLU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4kYNrLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774942225; x=1806478225;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=17dAtVw2vFz4opT//FpLI/UL/G92BDNI0OTVhAGzcos=;
  b=i4kYNrLU6MV8ytjvqWPonOWlVabPDLxd2KzaJIIM2oOBc8ayhykpFvfc
   2u5z8DJAKHueGEpzUsd6og1qFFvhdp36uiYIqZt/3Dlwxtxq8V9N1xUmn
   Kt0/ExUt+0F7GGm7vOHlPEYJVRgPTbXDK8xSYboEyV/Lp/WvD7pjqtJZv
   OPuYzR2QK3LbPwEWdeEtRwE1xMWoeU5AfFypSixZmRmBvu8wfl+n7PE9S
   RvzyrWsM3TByaKlLkFFdefX4eVdo5s2jKI4TX39oAbwLlAaTdMSfied3N
   UV4ucbRVxQoNFocbcootQM6XHWO5bT/eKf/X/Ki3q+IPlZxjnpzcJM43x
   A==;
X-CSE-ConnectionGUID: B0qzDh+3S72paPYlxXmDLA==
X-CSE-MsgGUID: wtP3vxNDRBW1qpz9yAn57g==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86562197"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86562197"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 00:30:24 -0700
X-CSE-ConnectionGUID: M0qOa5ZTThWkr7EV2zgUTA==
X-CSE-MsgGUID: jdN+/4KsTV+jJuWIchvHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219643685"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Mar 2026 00:30:22 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7TYJ-000000002Mn-2voD;
	Tue, 31 Mar 2026 07:30:19 +0000
Date: Tue, 31 Mar 2026 15:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dd-shrink-go 64/82]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:238
 dml_log_pipe_params() error: no floats in the kernel; invalid format
 specifier '%3.2f'
Message-ID: <202603311532.yVXGXxBI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   057f3d58d13981b56f2850d8c96ef56b23cf349e
commit: bc7cb75552bb5191e9ac9f20e310d9b1858bc4aa [64/82] drm-dyndbg: restor=
e CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
:::::: branch date: 27 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20260329 (https://download.01.org/0day-ci/arc=
hive/20260331/202603311532.yVXGXxBI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603311532.yVXGXxBI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:238 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:248 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:129 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:117=
 get_refcyc_per_delivery() error: no floats in the kernel; invalid format s=
pecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:151=
 get_vratio_pre() error: no floats in the kernel; invalid format specifier =
'%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:181=
 get_swath_need() error: no floats in the kernel; invalid format specifier =
'%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:114=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:913 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1647 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_vba.c:287 get_det=
_buffer_size_kbytes() error: no floats in the kernel; invalid format specif=
ier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:144 get_refcyc_per_delivery() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:913 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1648 calculate_ttu_cursor() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:63=
8 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:12=
70 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
63 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:120 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:959 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1547 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1762 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
698 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1330 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3036 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
0 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:16=
54 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
50 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:68 get_refcyc_per_delivery() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:863 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1030 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1432 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:85=
5 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:18=
99 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:835 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:970 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:96=
9 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:21=
30 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
42 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:920 calculate_ttu_cursor() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1055 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
987 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2148 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6537 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:268 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1431 dcn_bw_=
sync_calcs_and_dml() error: no floats in the kernel; invalid format specifi=
er '%f'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:249 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:250 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:251 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:252 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:253 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:254 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:255 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:268 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.4f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:278 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:279 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:280 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:281 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:282 dml_log=
_pipe_params() error: no floats in the kernel; invalid format specifier '%3=
.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:130 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:131 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:132 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:133 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_rq_dlg_helpers.c:136 p=
rint__dlg_sys_params_st() error: no floats in the kernel; invalid format sp=
ecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118=
 get_refcyc_per_delivery() error: no floats in the kernel; invalid format s=
pecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:120=
 get_refcyc_per_delivery() error: no floats in the kernel; invalid format s=
pecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:122=
 get_refcyc_per_delivery() error: no floats in the kernel; invalid format s=
pecifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:152=
 get_vratio_pre() error: no floats in the kernel; invalid format specifier =
'%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:155=
 get_vratio_pre() error: no floats in the kernel; invalid format specifier =
'%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:160=
 get_vratio_pre() error: no floats in the kernel; invalid format specifier =
'%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:695=
 get_surf_rq_param() warn: right shifting more than type allows 32 vs 42949=
66273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:701=
 get_surf_rq_param() warn: right shifting more than type allows 32 vs 42949=
66273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:114=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:114=
6 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:114=
7 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:117=
8 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:117=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118=
0 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:118=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:131=
6 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:132=
0 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:132=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:133=
3 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:133=
7 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:133=
8 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:133=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:134=
0 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:134=
1 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:134=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:134=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
2 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
3 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
6 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
7 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
8 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:147=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:149=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:151=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:151=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:167=
3 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:167=
4 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:167=
8 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:171=
3 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:171=
7 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:176=
1 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:176=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:179=
8 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:180=
2 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:187=
3 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:187=
7 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:188=
1 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:188=
5 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:188=
9 dml1_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:463 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:467 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:914 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:915 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:916 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:939 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:942 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:945 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:948 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:954 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid =
format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1089 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1112 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1113 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1121 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1126 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1127 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1226 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1229 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1232 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1259 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1262 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1297 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1300 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1329 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1332 dml20_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1650 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1653 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1656 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:1659 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:145 get_refcyc_per_delivery() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:147 get_refcyc_per_delivery() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:149 get_refcyc_per_delivery() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:463 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:467 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:914 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:915 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:916 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:940 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:943 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:946 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:949 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:955 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inva=
lid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1090 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1113 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1114 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1122 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1127 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1128 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1227 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1230 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1233 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1260 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1263 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1298 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1301 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1330 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1333 dml20v2_rq_dlg_get_dlg_params() error: no floats in the kernel; inv=
alid format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1651 calculate_ttu_cursor() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1654 calculate_ttu_cursor() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1657 calculate_ttu_cursor() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:1660 calculate_ttu_cursor() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:63=
9 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
0 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
1 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
2 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
3 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
4 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:64=
5 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:12=
93 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:13=
24 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:13=
25 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:13=
26 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:13=
91 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:14=
83 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:14=
84 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:15=
01 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:15=
07 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:15=
11 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:15=
24 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:16=
85 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:16=
91 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:17=
01 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:17=
02 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() error: no floats in the kernel; invalid format specifier =
'%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:27=
01 dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerform=
anceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
66 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
67 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
68 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
69 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:29=
71 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:121 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:123 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:125 get_refcyc_per_delivery() error: no floats in the kernel; invalid form=
at specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:455 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:461 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:960 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:961 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:962 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:985 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:989 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:993 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:997 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1005 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1137 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1162 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1163 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1164 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1165 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1173 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1178 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1179 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1279 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1283 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1287 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1317 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1321 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1359 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1363 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1395 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1399 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1766 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1770 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1774 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:1778 calculate_ttu_cursor() error: no floats in the kernel; invalid format=
 specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
699 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
700 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
701 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
702 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
703 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
704 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
705 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1353 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1384 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1385 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1386 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1451 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1519 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1520 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1537 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1543 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1547 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1560 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1721 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1727 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1737 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
1738 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() error: no floats in the kernel; invalid format specif=
ier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
2774 dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer=
formanceCalculation() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3039 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3040 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3041 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3042 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:=
3044 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; inva=
lid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
1 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
2 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
3 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
4 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
5 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
6 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:85=
7 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:10=
16 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:10=
17 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:10=
18 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:10=
19 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:16=
73 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:16=
77 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:16=
78 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:16=
79 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:17=
39 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
53 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
54 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
55 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
56 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:30=
58 CalculateRemoteSurfaceFlipDelay() error: no floats in the kernel; invali=
d format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:50=
45 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenti=
ng
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:50=
50 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenti=
ng
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:50=
70 dml21_ModeSupportAndSystemConfigurationFull() warn: inconsistent indenti=
ng
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:69 get_refcyc_per_delivery() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:71 get_refcyc_per_delivery() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:73 get_refcyc_per_delivery() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:424 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:440 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:866 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:869 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:872 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:875 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1031 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1032 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1033 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1054 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1057 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1060 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1063 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1069 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1243 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1266 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1267 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1268 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1269 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1277 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1282 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1283 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1382 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1385 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1388 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1415 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1418 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1468 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1471 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1500 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1503 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c=
:1638 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:85=
6 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:85=
7 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:85=
8 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:93=
9 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
0 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
2 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
4 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
5 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
6 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
7 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
8 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:94=
9 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:95=
0 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:95=
1 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:95=
2 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:95=
3 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:10=
58 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
40 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
47 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
48 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
49 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
50 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
51 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
52 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:11=
54 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:19=
18 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:19=
23 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:19=
24 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:19=
75 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:24=
99 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:444 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:460 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:836 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:837 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:838 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:839 calculate_ttu_cursor() error: no floats in the kernel; invalid format =
specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:971 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:972 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:987 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:990 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid fo=
rmat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1089 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1110 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1111 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1112 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1113 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1114 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1123 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1124 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1157 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1158 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1159 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1226 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1227 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1228 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1229 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1230 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1263 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1264 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1265 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1266 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1310 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1311 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1312 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1313 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1347 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1348 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1349 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1350 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1384 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1385 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1386 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c=
:1387 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid f=
ormat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:97=
0 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:97=
1 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:97=
2 CalculatePrefetchSchedule() error: no floats in the kernel; invalid forma=
t specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
17 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
18 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
19 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
20 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
21 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
22 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
24 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
26 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
27 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
28 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
29 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
30 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
31 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
32 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
33 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
34 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
35 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:11=
36 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:12=
91 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
74 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
81 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
84 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
85 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
86 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
89 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:13=
93 CalculatePrefetchSchedule() error: no floats in the kernel; invalid form=
at specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:21=
39 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:21=
47 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:21=
48 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:22=
00 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:28=
08 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
43 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
47 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
48 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
53 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:64=
54 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:65=
33 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
01 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
02 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
03 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
04 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
05 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
06 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:66=
07 CalculateStutterEfficiency() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:532 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:548 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:921 calculate_ttu_cursor() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:922 calculate_ttu_cursor() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:923 calculate_ttu_cursor() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:924 calculate_ttu_cursor() error: no floats in the kernel; invalid forma=
t specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1056 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1057 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1074 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1077 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1177 dml_rq_dlg_get_dlg_params() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1198 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1199 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1200 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1201 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1202 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1211 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1212 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1245 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1246 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1247 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1314 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1315 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1316 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1317 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1318 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1351 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1352 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1353 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1354 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1398 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1399 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1400 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1401 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1435 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1436 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1437 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1438 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1472 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1473 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1474 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_rq_dlg_calc_314=
.c:1475 dml_rq_dlg_get_dlg_params() error: no floats in the kernel; invalid=
 format specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
988 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
989 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
990 CalculatePrefetchSchedule() error: no floats in the kernel; invalid for=
mat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1135 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1136 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1137 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1138 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1139 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1140 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1142 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1144 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1145 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1146 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1147 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1148 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1149 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1150 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1151 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1152 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1153 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1154 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1392 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1399 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1402 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1403 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1404 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1407 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
1409 CalculatePrefetchSchedule() error: no floats in the kernel; invalid fo=
rmat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2157 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2165 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2166 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2218 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
2827 DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformance=
Calculation() error: no floats in the kernel; invalid format specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6538 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6542 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6543 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6548 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6549 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6628 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6696 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6697 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6698 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6699 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6700 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6701 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:=
6702 CalculateStutterEfficiency() error: no floats in the kernel; invalid f=
ormat specifier '%f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:269 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:270 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:281 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:283 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:364 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:365 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:366 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:367 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:368 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:377 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:378 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:385 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:386 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:394 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:396 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:411 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:412 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:420 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:422 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:433 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_rq_dlg_calc_32.c=
:435 dml32_rq_dlg_get_dlg_reg() error: no floats in the kernel; invalid for=
mat specifier '%3.2f'
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calcs.c:1499 dcn_bw_=
sync_calcs_and_dml() error: no floats in the kernel; invalid format specifi=
er '%f'

vim +238 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c

20f2ffe5047286 Alex Deucher        2020-11-02  159 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  160  void dml_log_pipe_param=
s(
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  161  		struct display_mode_l=
ib *mode_lib,
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  162  		display_e2e_pipe_para=
ms_st *pipes,
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  163  		int pipe_cnt)
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  164  {
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  165  	display_pipe_source_pa=
rams_st *pipe_src;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  166  	display_pipe_dest_para=
ms_st   *pipe_dest;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  167  	scaler_ratio_depth_st =
        *scale_ratio_depth;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  168  	scaler_taps_st        =
        *scale_taps;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  169  	display_output_params_=
st      *dout;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  170  	display_clocks_and_cfg=
_st     *clks_cfg;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  171  	int i;
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  172 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  173  	for (i =3D 0; i < pipe=
_cnt; i++) {
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  174  		pipe_src =3D &(pipes[=
i].pipe.src);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  175  		pipe_dest =3D &(pipes=
[i].pipe.dest);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  176  		scale_ratio_depth =3D =
&(pipes[i].pipe.scale_ratio_depth);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  177  		scale_taps =3D &(pipe=
s[i].pipe.scale_taps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  178  		dout =3D &(pipes[i].d=
out);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  179  		clks_cfg =3D &(pipes[=
i].clks_cfg);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  180 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  181  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  182  		dml_print("DML PARAMS=
: PIPE [%d] SOURCE PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  183  		dml_print("DML PARAMS=
:     source_format              =3D %d\n", pipe_src->source_format);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  184  		dml_print("DML PARAMS=
:     dcc                        =3D %d\n", pipe_src->dcc);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  185  		dml_print("DML PARAMS=
:     dcc_rate                   =3D %d\n", pipe_src->dcc_rate);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  186  		dml_print("DML PARAMS=
:     dcc_use_global             =3D %d\n", pipe_src->dcc_use_global);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  187  		dml_print("DML PARAMS=
:     vm                         =3D %d\n", pipe_src->vm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  188  		dml_print("DML PARAMS=
:     gpuvm                      =3D %d\n", pipe_src->gpuvm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  189  		dml_print("DML PARAMS=
:     hostvm                     =3D %d\n", pipe_src->hostvm);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  190  		dml_print("DML PARAMS=
:     gpuvm_levels_force_en      =3D %d\n", pipe_src->gpuvm_levels_force_en=
);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  191  		dml_print("DML PARAMS=
:     gpuvm_levels_force         =3D %d\n", pipe_src->gpuvm_levels_force);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  192  		dml_print("DML PARAMS=
:     source_scan                =3D %d\n", pipe_src->source_scan);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  193  		dml_print("DML PARAMS=
:     sw_mode                    =3D %d\n", pipe_src->sw_mode);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  194  		dml_print("DML PARAMS=
:     macro_tile_size            =3D %d\n", pipe_src->macro_tile_size);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  195  		dml_print("DML PARAMS=
:     viewport_width             =3D %d\n", pipe_src->viewport_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  196  		dml_print("DML PARAMS=
:     viewport_height            =3D %d\n", pipe_src->viewport_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  197  		dml_print("DML PARAMS=
:     viewport_y_y               =3D %d\n", pipe_src->viewport_y_y);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  198  		dml_print("DML PARAMS=
:     viewport_y_c               =3D %d\n", pipe_src->viewport_y_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  199  		dml_print("DML PARAMS=
:     viewport_width_c           =3D %d\n", pipe_src->viewport_width_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  200  		dml_print("DML PARAMS=
:     viewport_height_c          =3D %d\n", pipe_src->viewport_height_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  201  		dml_print("DML PARAMS=
:     data_pitch                 =3D %d\n", pipe_src->data_pitch);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  202  		dml_print("DML PARAMS=
:     data_pitch_c               =3D %d\n", pipe_src->data_pitch_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  203  		dml_print("DML PARAMS=
:     meta_pitch                 =3D %d\n", pipe_src->meta_pitch);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  204  		dml_print("DML PARAMS=
:     meta_pitch_c               =3D %d\n", pipe_src->meta_pitch_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  205  		dml_print("DML PARAMS=
:     cur0_src_width             =3D %d\n", pipe_src->cur0_src_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  206  		dml_print("DML PARAMS=
:     cur0_bpp                   =3D %d\n", pipe_src->cur0_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  207  		dml_print("DML PARAMS=
:     cur1_src_width             =3D %d\n", pipe_src->cur1_src_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  208  		dml_print("DML PARAMS=
:     cur1_bpp                   =3D %d\n", pipe_src->cur1_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  209  		dml_print("DML PARAMS=
:     num_cursors                =3D %d\n", pipe_src->num_cursors);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  210  		dml_print("DML PARAMS=
:     is_hsplit                  =3D %d\n", pipe_src->is_hsplit);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  211  		dml_print("DML PARAMS=
:     hsplit_grp                 =3D %d\n", pipe_src->hsplit_grp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  212  		dml_print("DML PARAMS=
:     dynamic_metadata_enable    =3D %d\n", pipe_src->dynamic_metadata_enab=
le);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  213  		dml_print("DML PARAMS=
:     dmdata_lines_before_active =3D %d\n", pipe_src->dynamic_metadata_line=
s_before_active);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  214  		dml_print("DML PARAMS=
:     dmdata_xmit_bytes          =3D %d\n", pipe_src->dynamic_metadata_xmit=
_bytes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  215  		dml_print("DML PARAMS=
:     immediate_flip             =3D %d\n", pipe_src->immediate_flip);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  216  		dml_print("DML PARAMS=
:     v_total_min                =3D %d\n", pipe_src->v_total_min);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  217  		dml_print("DML PARAMS=
:     v_total_max                =3D %d\n", pipe_src->v_total_max);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  218  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  219 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  220  		dml_print("DML PARAMS=
: PIPE [%d] DESTINATION PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  221  		dml_print("DML PARAMS=
:     recout_width               =3D %d\n", pipe_dest->recout_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  222  		dml_print("DML PARAMS=
:     recout_height              =3D %d\n", pipe_dest->recout_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  223  		dml_print("DML PARAMS=
:     full_recout_width          =3D %d\n", pipe_dest->full_recout_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  224  		dml_print("DML PARAMS=
:     full_recout_height         =3D %d\n", pipe_dest->full_recout_height);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  225  		dml_print("DML PARAMS=
:     hblank_start               =3D %d\n", pipe_dest->hblank_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  226  		dml_print("DML PARAMS=
:     hblank_end                 =3D %d\n", pipe_dest->hblank_end);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  227  		dml_print("DML PARAMS=
:     vblank_start               =3D %d\n", pipe_dest->vblank_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  228  		dml_print("DML PARAMS=
:     vblank_end                 =3D %d\n", pipe_dest->vblank_end);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  229  		dml_print("DML PARAMS=
:     htotal                     =3D %d\n", pipe_dest->htotal);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  230  		dml_print("DML PARAMS=
:     vtotal                     =3D %d\n", pipe_dest->vtotal);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  231  		dml_print("DML PARAMS=
:     vactive                    =3D %d\n", pipe_dest->vactive);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  232  		dml_print("DML PARAMS=
:     hactive                    =3D %d\n", pipe_dest->hactive);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  233  		dml_print("DML PARAMS=
:     vstartup_start             =3D %d\n", pipe_dest->vstartup_start);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  234  		dml_print("DML PARAMS=
:     vupdate_offset             =3D %d\n", pipe_dest->vupdate_offset);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  235  		dml_print("DML PARAMS=
:     vupdate_width              =3D %d\n", pipe_dest->vupdate_width);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  236  		dml_print("DML PARAMS=
:     vready_offset              =3D %d\n", pipe_dest->vready_offset);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  237  		dml_print("DML PARAMS=
:     interlaced                 =3D %d\n", pipe_dest->interlaced);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21 @238  		dml_print("DML PARAMS=
:     pixel_rate_mhz             =3D %3.2f\n", pipe_dest->pixel_rate_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  239  		dml_print("DML PARAMS=
:     sync_vblank_all_planes     =3D %d\n", pipe_dest->synchronized_vblank_=
all_planes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  240  		dml_print("DML PARAMS=
:     otg_inst                   =3D %d\n", pipe_dest->otg_inst);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  241  		dml_print("DML PARAMS=
:     odm_combine                =3D %d\n", pipe_dest->odm_combine);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  242  		dml_print("DML PARAMS=
:     use_maximum_vstartup       =3D %d\n", pipe_dest->use_maximum_vstartup=
);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  243  		dml_print("DML PARAMS=
:     vtotal_max                 =3D %d\n", pipe_dest->vtotal_max);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  244  		dml_print("DML PARAMS=
:     vtotal_min                 =3D %d\n", pipe_dest->vtotal_min);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  245  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  246 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  247  		dml_print("DML PARAMS=
: PIPE [%d] SCALER PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21 @248  		dml_print("DML PARAMS=
:     hscl_ratio                 =3D %3.4f\n", scale_ratio_depth->hscl_rati=
o);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  249  		dml_print("DML PARAMS=
:     vscl_ratio                 =3D %3.4f\n", scale_ratio_depth->vscl_rati=
o);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  250  		dml_print("DML PARAMS=
:     hscl_ratio_c               =3D %3.4f\n", scale_ratio_depth->hscl_rati=
o_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  251  		dml_print("DML PARAMS=
:     vscl_ratio_c               =3D %3.4f\n", scale_ratio_depth->vscl_rati=
o_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  252  		dml_print("DML PARAMS=
:     vinit                      =3D %3.4f\n", scale_ratio_depth->vinit);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  253  		dml_print("DML PARAMS=
:     vinit_c                    =3D %3.4f\n", scale_ratio_depth->vinit_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  254  		dml_print("DML PARAMS=
:     vinit_bot                  =3D %3.4f\n", scale_ratio_depth->vinit_bot=
);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  255  		dml_print("DML PARAMS=
:     vinit_bot_c                =3D %3.4f\n", scale_ratio_depth->vinit_bot=
_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  256  		dml_print("DML PARAMS=
:     lb_depth                   =3D %d\n", scale_ratio_depth->lb_depth);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  257  		dml_print("DML PARAMS=
:     scl_enable                 =3D %d\n", scale_ratio_depth->scl_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  258  		dml_print("DML PARAMS=
:     htaps                      =3D %d\n", scale_taps->htaps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  259  		dml_print("DML PARAMS=
:     vtaps                      =3D %d\n", scale_taps->vtaps);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  260  		dml_print("DML PARAMS=
:     htaps_c                    =3D %d\n", scale_taps->htaps_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  261  		dml_print("DML PARAMS=
:     vtaps_c                    =3D %d\n", scale_taps->vtaps_c);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  262  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  263 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  264  		dml_print("DML PARAMS=
: PIPE [%d] DISPLAY OUTPUT PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  265  		dml_print("DML PARAMS=
:     output_type                =3D %d\n", dout->output_type);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  266  		dml_print("DML PARAMS=
:     output_format              =3D %d\n", dout->output_format);
091e3131a8c237 Nicholas Kazlauskas 2021-03-26  267  		dml_print("DML PARAMS=
:     dsc_input_bpc              =3D %d\n", dout->dsc_input_bpc);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  268  		dml_print("DML PARAMS=
:     output_bpp                 =3D %3.4f\n", dout->output_bpp);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  269  		dml_print("DML PARAMS=
:     dp_lanes                   =3D %d\n", dout->dp_lanes);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  270  		dml_print("DML PARAMS=
:     dsc_enable                 =3D %d\n", dout->dsc_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  271  		dml_print("DML PARAMS=
:     dsc_slices                 =3D %d\n", dout->dsc_slices);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  272  		dml_print("DML PARAMS=
:     wb_enable                  =3D %d\n", dout->wb_enable);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  273  		dml_print("DML PARAMS=
:     num_active_wb              =3D %d\n", dout->num_active_wb);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  274  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  275 =20
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  276  		dml_print("DML PARAMS=
: PIPE [%d] CLOCK CONFIG PARAMS:\n", i);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  277  		dml_print("DML PARAMS=
:     voltage                    =3D %d\n", clks_cfg->voltage);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  278  		dml_print("DML PARAMS=
:     dppclk_mhz                 =3D %3.2f\n", clks_cfg->dppclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  279  		dml_print("DML PARAMS=
:     refclk_mhz                 =3D %3.2f\n", clks_cfg->refclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  280  		dml_print("DML PARAMS=
:     dispclk_mhz                =3D %3.2f\n", clks_cfg->dispclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  281  		dml_print("DML PARAMS=
:     dcfclk_mhz                 =3D %3.2f\n", clks_cfg->dcfclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  282  		dml_print("DML PARAMS=
:     socclk_mhz                 =3D %3.2f\n", clks_cfg->socclk_mhz);
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  283  		dml_print("DML PARAMS=
: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  284  	}
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  285  }
6725a88f88a7e9 Bhawanpreet Lakha   2020-05-21  286 =20

:::::: The code at line 238 was first introduced by commit
:::::: 6725a88f88a7e922e91c45bf83d320487810c192 drm/amd/display: Add DCN3 D=
ML

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
