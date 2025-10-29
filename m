Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B72D8391
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742869; cv=none; b=GpGhGAZH5+PL9Xpd/nQFmLLtBUQw4rtxe+3SdPhglT8SvwGhlVvNoCkrg6g3QIM5Z3kVTeoFIT3/2IuMThfdBihRYSUKNCjZqDd/B5Lq83k9tWyOK9CNA2zP0WwGY/OrSMgGs9EHGklDVLzCJg9yL4R6VT7IiWduYBjI06hK1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742869; c=relaxed/simple;
	bh=sGMM9KVkCaIRpGQlM0rUbruFlUMD3ACcrNgX/Ut9rBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+97Z6oepqDzqUHkDrBVfJOvZveJ4xqoQeZEs0iJYBdsiLXp9gGJy5dkAP9itWB2mx4z5PGgSrMmHllEU3mKguxOurgZh7xc9vfueaBWF0Q9Z9Ij/qXre0o/kAeXMpsDq7wJOgJ3TQI7NLPnVLWCTjaUXOmeru2tVzIx9SDWTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vp/4aYxj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vp/4aYxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761742867; x=1793278867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sGMM9KVkCaIRpGQlM0rUbruFlUMD3ACcrNgX/Ut9rBU=;
  b=Vp/4aYxjMkg1pkdrCwiVuGZ8KSUSq3oVeAjhikKqxcqZNDCYnTOz3oVX
   ue9B3NhywahYZ2XH0HWUu3lvXd+Zm43VYC0sUKWLpKJc31J9TR/9sSUDc
   b/0IrJMCIGEw23i9x0OaG3mHfi/Eo/ErhaRkabHR1SQeMwyM3V/45+che
   SWlfHWfB0uybkTta3MPLXfMR+XMziZcB/xjyk7Hlv1T+6OJ3E+m+xXOu9
   wuqxdGOscCo9RJFnsNnkoKGk8ROslJ7V+B1hE53oPp1Erh8QqnsqYSVSl
   rqjzxfRDfzhZSFnSfGR0NmQv1945hYR+1N1rSXXVYbAFJBE2uXzpUfs3s
   w==;
X-CSE-ConnectionGUID: 9EP5X3M/TnCWv2kurW41dg==
X-CSE-MsgGUID: /EL3oKtpRnWy+jhaAimusA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63897713"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63897713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 06:01:07 -0700
X-CSE-ConnectionGUID: LPTRpY09TvC9aYD3DinkGg==
X-CSE-MsgGUID: j7qiIrh3Rra4wwgaakTH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="186009931"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 06:01:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE5mt-000Kbl-35;
	Wed, 29 Oct 2025 13:00:36 +0000
Date: Wed, 29 Oct 2025 20:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4371/4731]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118
 dml_floor() warn: if statement not indented
Message-ID: <202510292021.XfUW1Zro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Austin Zheng <Austin.Zheng@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Dillon Varone <dillon.varone@amd.com>
CC: waynelin <Wayne.Lin@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c [4371/4731] drm/amd/display: Rename dml2 to dml2_0 folder
:::::: branch date: 10 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292021.XfUW1Zro-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510292021.XfUW1Zro-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118 dml_floor() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:152 dml_max() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:733 dml_get_num_active_planes() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_wrapper.c:527 dml2_validate_only() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_policy.c:208 dml2_policy_build_synthetic_soc_states() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_mall_phantom.c:468 dml2_svp_drr_schedulable() error: we previously assumed 'pipe->stream' could be null (see line 454)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_mall_phantom.c:557 subvp_vblank_schedulable() error: we previously assumed 'subvp_pipe' could be null (see line 549)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1213 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2755 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3176 CalculateDCFCLKDeepSleep() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3754 CalculateVMGroupAndRequestTimes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4056 CalculateStutterEfficiency() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4206 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4789 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:5201 CalculateVMRowAndSwath() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6019 CalculatePrefetchBandwithSupport() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6201 CalculateMaxVStartup() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6923 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:8380 dml_core_mode_programming() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:9362 dml_core_mode_programming() warn: for statement not indented

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1295 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1462 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1565 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2757 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4252 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4794 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7220 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7469 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7883 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7954 dml_core_mode_support() warn: inconsistent indenting

vim +118 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c

7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  115  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  116  dml_float_t dml_floor(dml_float_t x, dml_float_t granularity)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  117  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28 @118  	if (granularity == 0)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  119  	return 0;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  120  	//return (dml_float_t) (floor(x / granularity) * granularity);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  121  	return (dml_float_t)dcn_bw_floor2(x, granularity);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  122  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  123  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  124  dml_float_t dml_min(dml_float_t x, dml_float_t y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  125  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  126  	if (x != x)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  127  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  128  	if (y != y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  129  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  130  	if (x < y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  131  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  132  	else
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  133  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  134  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  135  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  136  dml_float_t dml_min3(dml_float_t x, dml_float_t y, dml_float_t z)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  137  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  138  	return dml_min(dml_min(x, y), z);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  139  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  140  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  141  dml_float_t dml_min4(dml_float_t x, dml_float_t y, dml_float_t z, dml_float_t w)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  142  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  143  	return dml_min(dml_min(dml_min(x, y), z), w);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  144  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  145  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  146  dml_float_t dml_max(dml_float_t x, dml_float_t y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  147  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  148  	if (x != x)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  149  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  150  	if (y != y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  151  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28 @152  if (x > y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  153  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  154  	else
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  155  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  156  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  157  dml_float_t dml_max3(dml_float_t x, dml_float_t y, dml_float_t z)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  158  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  159  	return dml_max(dml_max(x, y), z);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  160  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  161  dml_float_t dml_max4(dml_float_t a, dml_float_t b, dml_float_t c, dml_float_t d)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  162  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  163  	return dml_max(dml_max(a, b), dml_max(c, d));
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  164  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  165  dml_float_t dml_max5(dml_float_t a, dml_float_t b, dml_float_t c, dml_float_t d, dml_float_t e)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  166  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  167  	return dml_max(dml_max4(a, b, c, d), e);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  168  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  169  dml_float_t dml_log(dml_float_t x, dml_float_t base)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  170  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  171  	return (dml_float_t) (_log(x) / _log(base));
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  172  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  173  

:::::: The code at line 118 was first introduced by commit
:::::: 7966f319c66d9468623c6a6a017ecbc0dd79be75 drm/amd/display: Introduce DML2

:::::: TO: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
