Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0993EA71
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727228757; cv=none; b=Y2kUbO7KH606G+oL/TwWM2zqpq9EEs0Wy8HPMngdm8w5QAtBFSG1mEZShlRw4BntdqNrJVFgD9lIfB7pt2sLaLYmWagVOiqB/cqEVk8BC3tcEfF7nzyqCweYo0Ug+GLoUzscv3XCPV+7rMUP2sHWTU0FfV7+oTTmjS3WZbhjJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727228757; c=relaxed/simple;
	bh=40yxoxAAyh8jkoS9zMy8ye4JgN1V9vDedU2Z4yPM/P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSF5kkuZ1PUhV4hLW7BMQOFc6pClUdEmDCGfcuG+hgaZ9VSJnMgWYzZsTeguEHMMx8WdI8iBssTfdP54WEP9PVh4tKjqWuFZzxMhRAp8PwuzY5CsHUExKqaVOJ1N0ay9/nCoukjlajEcYa8pNh+EO64lz5EdyTqjHxkHeDNZJPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1qAWfP4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1qAWfP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727228755; x=1758764755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40yxoxAAyh8jkoS9zMy8ye4JgN1V9vDedU2Z4yPM/P4=;
  b=R1qAWfP4PeUu7TYLY7WsFYqjlYfOXbRYkbrdQ1OnMji1mokFZBuC4Vxl
   YSV6thtOraCeUw7T3JtZ3trWSQF9gCedofYhcEoKByqMyfxT3X2skZgad
   vaQhTi+X494u3pSF5WVkCuX6PE0uVnyN25AnmttbN7gC06u87Mu4uIJXr
   VoC5ZCFwuktzqKtabxE/f2EP7mG4K/k8+jMtwqZWkRNn6EbfhZ1+TNWTd
   EfXFzACKq+7Elf5aSPXunB9XQ3ZpPVVIseOGBXsf2xefePsEIZshtfikR
   Sa35letOjvBwDt6lH3PL/zeYN++ouEQTGoCxNCa0DO18xPWORsFXeQFuI
   g==;
X-CSE-ConnectionGUID: 2Dna2aAeTKWtDjwmGExZgg==
X-CSE-MsgGUID: KcGpCfJySLywb9z+NwskGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37631414"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="37631414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 18:45:52 -0700
X-CSE-ConnectionGUID: IXiIV+xRRrWGzzVVeA8bWA==
X-CSE-MsgGUID: VOEyXxipRxiMGC7Ne6DqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76543324"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 18:45:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stH6B-000J1j-2f;
	Wed, 25 Sep 2024 01:45:47 +0000
Date: Wed, 25 Sep 2024 09:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 23321/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:900
 isst_if_get_perf_level_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202409250923.creialJL-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yingbao Jia <yingbao.jia@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ef5e9d0437237465f258a80a0d5d8e1e26872c7a
commit: fffa812876c8b38aa463dc414f86b0f2960e2158 [23321/30000] platform/x86: ISST: Add SST-PP support via TPMI
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250923.creialJL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409250923.creialJL-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]

Old smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1029 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1033 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +900 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

fffa812876c8b38 Srinivas Pandruvada 2023-03-07   880  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   881  static int isst_if_get_perf_level_info(void __user *argp)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   882  {
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   883  	struct isst_perf_level_data_info perf_level;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   884  	struct tpmi_per_power_domain_info *power_domain_info;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   885  	int i, j;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   886  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   887  	if (copy_from_user(&perf_level, argp, sizeof(perf_level)))
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   888  		return -EFAULT;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   889  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   890  	power_domain_info = get_instance(perf_level.socket_id, perf_level.power_domain_id);
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   891  	if (!power_domain_info)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   892  		return -EINVAL;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   893  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   894  	if (perf_level.level > power_domain_info->max_level)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   895  		return -EINVAL;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   896  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   897  	if (!(power_domain_info->pp_header.level_en_mask & BIT(perf_level.level)))
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   898  		return -EINVAL;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   899  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  @900  	_read_pp_level_info("tdp_ratio", perf_level.tdp_ratio, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   901  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   902  			    SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   903  	_read_pp_level_info("base_freq_mhz", perf_level.base_freq_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   904  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   905  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   906  	_read_pp_level_info("base_freq_avx2_mhz", perf_level.base_freq_avx2_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   907  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX2_START, SST_PP_P1_AVX2_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   908  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   909  	_read_pp_level_info("base_freq_avx512_mhz", perf_level.base_freq_avx512_mhz,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   910  			    perf_level.level, SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX512_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   911  			    SST_PP_P1_AVX512_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   912  	_read_pp_level_info("base_freq_amx_mhz", perf_level.base_freq_amx_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   913  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AMX_START, SST_PP_P1_AMX_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   914  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   915  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   916  	_read_pp_level_info("thermal_design_power_w", perf_level.thermal_design_power_w,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   917  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_TDP_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   918  			    SST_PP_TDP_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   919  	perf_level.thermal_design_power_w /= 8; /* units are in 1/8th watt */
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   920  	_read_pp_level_info("tjunction_max_c", perf_level.tjunction_max_c, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   921  			    SST_PP_INFO_1_OFFSET, SST_PP_T_PROCHOT_START, SST_PP_T_PROCHOT_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   922  			    SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   923  	_read_pp_level_info("max_memory_freq_mhz", perf_level.max_memory_freq_mhz,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   924  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_MAX_MEMORY_FREQ_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   925  			    SST_PP_MAX_MEMORY_FREQ_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   926  	_read_pp_level_info("cooling_type", perf_level.cooling_type, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   927  			    SST_PP_INFO_1_OFFSET, SST_PP_COOLING_TYPE_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   928  			    SST_PP_COOLING_TYPE_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   929  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   930  	for (i = 0; i < TRL_MAX_LEVELS; ++i) {
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   931  		for (j = 0; j < TRL_MAX_BUCKETS; ++j)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   932  			_read_pp_level_info("trl*_bucket*_freq_mhz",
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   933  					    perf_level.trl_freq_mhz[i][j], perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   934  					    SST_PP_INFO_4_OFFSET + (i * SST_PP_TRL_0_RATIO_0_WIDTH),
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   935  					    j * SST_PP_TRL_0_RATIO_0_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   936  					    SST_PP_TRL_0_RATIO_0_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   937  					    SST_MUL_FACTOR_FREQ);
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   938  	}
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   939  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   940  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   941  		_read_pp_level_info("bucket*_core_count", perf_level.bucket_core_counts[i],
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   942  				    perf_level.level, SST_PP_INFO_10_OFFSET,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   943  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH * i,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   944  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   945  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   946  	perf_level.max_buckets = TRL_MAX_BUCKETS;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   947  	perf_level.max_trl_levels = TRL_MAX_LEVELS;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   948  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   949  	_read_pp_level_info("p0_freq_mhz", perf_level.p0_freq_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   950  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P0_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   951  			    SST_PP_CORE_RATIO_P0_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   952  	_read_pp_level_info("p1_freq_mhz", perf_level.p1_freq_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   953  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P1_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   954  			    SST_PP_CORE_RATIO_P1_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   955  	_read_pp_level_info("pn_freq_mhz", perf_level.pn_freq_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   956  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PN_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   957  			    SST_PP_CORE_RATIO_PN_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   958  	_read_pp_level_info("pm_freq_mhz", perf_level.pm_freq_mhz, perf_level.level,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   959  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PM_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   960  			    SST_PP_CORE_RATIO_PM_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   961  	_read_pp_level_info("p0_fabric_freq_mhz", perf_level.p0_fabric_freq_mhz,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   962  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   963  			    SST_PP_CORE_RATIO_P0_FABRIC_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   964  			    SST_PP_CORE_RATIO_P0_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   965  	_read_pp_level_info("p1_fabric_freq_mhz", perf_level.p1_fabric_freq_mhz,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   966  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   967  			    SST_PP_CORE_RATIO_P1_FABRIC_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   968  			    SST_PP_CORE_RATIO_P1_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   969  	_read_pp_level_info("pm_fabric_freq_mhz", perf_level.pm_fabric_freq_mhz,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   970  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   971  			    SST_PP_CORE_RATIO_PM_FABRIC_START,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   972  			    SST_PP_CORE_RATIO_PM_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   973  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   974  	if (copy_to_user(argp, &perf_level, sizeof(perf_level)))
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   975  		return -EFAULT;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   976  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   977  	return 0;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   978  }
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   979  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   980  #define SST_PP_FUSED_CORE_COUNT_START	0
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   981  #define SST_PP_FUSED_CORE_COUNT_WIDTH	8
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   982  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   983  #define SST_PP_RSLVD_CORE_COUNT_START	8
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   984  #define SST_PP_RSLVD_CORE_COUNT_WIDTH	8
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   985  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   986  #define SST_PP_RSLVD_CORE_MASK_START	0
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   987  #define SST_PP_RSLVD_CORE_MASK_WIDTH	64
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   988  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   989  static int isst_if_get_perf_level_mask(void __user *argp)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   990  {
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   991  	static struct isst_perf_level_cpu_mask cpumask;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   992  	struct tpmi_per_power_domain_info *power_domain_info;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   993  	u64 mask;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   994  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   995  	if (copy_from_user(&cpumask, argp, sizeof(cpumask)))
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   996  		return -EFAULT;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   997  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   998  	power_domain_info = get_instance(cpumask.socket_id, cpumask.power_domain_id);
fffa812876c8b38 Srinivas Pandruvada 2023-03-07   999  	if (!power_domain_info)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1000  		return -EINVAL;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1001  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07 @1002  	_read_pp_level_info("mask", mask, cpumask.level, SST_PP_INFO_2_OFFSET,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1003  			    SST_PP_RSLVD_CORE_MASK_START, SST_PP_RSLVD_CORE_MASK_WIDTH,
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1004  			    SST_MUL_FACTOR_NONE)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1005  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1006  	cpumask.mask = mask;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1007  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1008  	if (!cpumask.punit_cpu_map)
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1009  		return -EOPNOTSUPP;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1010  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1011  	if (copy_to_user(argp, &cpumask, sizeof(cpumask)))
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1012  		return -EFAULT;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1013  
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1014  	return 0;
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1015  }
fffa812876c8b38 Srinivas Pandruvada 2023-03-07  1016  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
