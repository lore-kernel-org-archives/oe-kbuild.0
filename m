Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6731DFF7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732987432; cv=none; b=cJn0Ie1kYhzU3ey7XBCB+JV4JYyesxgBwTfYmad1id5P1P6JhibJjlibkHPf0X9kjFIn3VkXN0Iz0AapWek4SbMQNBzpCVUYUaJecUSuHwYlla7AvMplBs4MqX1Z8Xh/NxP3njMeaTYBHiCj4bVZ4mJxrRFQfgqEnOvQk1tAo2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732987432; c=relaxed/simple;
	bh=ggkStIO5MILqpmiFkCGeH6B9jUGS0zfE0f2zmaV+IX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAXjioJvnVzjB1v2Xly4gts3RCganI4W0s3j/HbR4KbSLG1Dn1RhRRTHKkTPJiPb27nlQoPQZFiMdj5VYgg7asFP70rNCe+57J3AAOydvXn27EL0LBhd6H5JDpc08zXXvtozRnA/4LoIeJamRzaa/g5Qq/wOfBGwNWRm8JBiklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1k72Gnn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1k72Gnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732987430; x=1764523430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggkStIO5MILqpmiFkCGeH6B9jUGS0zfE0f2zmaV+IX0=;
  b=i1k72Gnn+JZAQtPbhXlMKjLGj6/WSmMs292mKHKQMtCm98wYsNJ+N2ou
   mLg8IT39sNwJC+v0xM+OFELo634TYteSahXAvrrEhx3HRBXWjsun0YLzS
   pkoIAFIDa/BCarEa5CcFBxVzk+CLSsGPxVx+UuGz/ya+p6yRVZ6FDGMeB
   ms5cP14ACN0X5yaRg0OnGyFLHDzh4I1j/kQB4eCdJ2qF9YUJBBW8Bn7s5
   cfamAjrfHdEi02bm26HFmXaehJMVqI2CITEQESgzVqKfSl3xfhjQSgGof
   h1q5PDkVf86UvpvJ1vzNHIIZsmS1/iq1EuIEfDBMZ/G7wLHjqcbjU1BRH
   Q==;
X-CSE-ConnectionGUID: CHL/km7vShejQ9z34iQxlg==
X-CSE-MsgGUID: POZCED+5ToKZij4A5S8dmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44567163"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="44567163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 09:23:49 -0800
X-CSE-ConnectionGUID: XaJEmsFyRNSgaO1cN4jtgQ==
X-CSE-MsgGUID: K2Ufj6t6SOyrKHatu/e6wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92598859"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2024 09:23:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHRBu-0000rV-1k;
	Sat, 30 Nov 2024 17:23:36 +0000
Date: Sun, 1 Dec 2024 01:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:900
 isst_if_get_perf_level_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202412010147.7oqApaBq-lkp@intel.com>
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
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: fffa812876c8b38aa463dc414f86b0f2960e2158 [2483/2483] platform/x86: ISST: Add SST-PP support via TPMI
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241201/202412010147.7oqApaBq-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412010147.7oqApaBq-lkp@intel.com/

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

fffa812876c8b3 Srinivas Pandruvada 2023-03-07   880  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   881  static int isst_if_get_perf_level_info(void __user *argp)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   882  {
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   883  	struct isst_perf_level_data_info perf_level;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   884  	struct tpmi_per_power_domain_info *power_domain_info;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   885  	int i, j;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   886  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   887  	if (copy_from_user(&perf_level, argp, sizeof(perf_level)))
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   888  		return -EFAULT;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   889  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   890  	power_domain_info = get_instance(perf_level.socket_id, perf_level.power_domain_id);
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   891  	if (!power_domain_info)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   892  		return -EINVAL;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   893  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   894  	if (perf_level.level > power_domain_info->max_level)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   895  		return -EINVAL;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   896  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   897  	if (!(power_domain_info->pp_header.level_en_mask & BIT(perf_level.level)))
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   898  		return -EINVAL;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   899  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  @900  	_read_pp_level_info("tdp_ratio", perf_level.tdp_ratio, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   901  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   902  			    SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   903  	_read_pp_level_info("base_freq_mhz", perf_level.base_freq_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   904  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   905  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   906  	_read_pp_level_info("base_freq_avx2_mhz", perf_level.base_freq_avx2_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   907  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX2_START, SST_PP_P1_AVX2_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   908  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   909  	_read_pp_level_info("base_freq_avx512_mhz", perf_level.base_freq_avx512_mhz,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   910  			    perf_level.level, SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX512_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   911  			    SST_PP_P1_AVX512_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   912  	_read_pp_level_info("base_freq_amx_mhz", perf_level.base_freq_amx_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   913  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AMX_START, SST_PP_P1_AMX_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   914  			    SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   915  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   916  	_read_pp_level_info("thermal_design_power_w", perf_level.thermal_design_power_w,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   917  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_TDP_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   918  			    SST_PP_TDP_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   919  	perf_level.thermal_design_power_w /= 8; /* units are in 1/8th watt */
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   920  	_read_pp_level_info("tjunction_max_c", perf_level.tjunction_max_c, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   921  			    SST_PP_INFO_1_OFFSET, SST_PP_T_PROCHOT_START, SST_PP_T_PROCHOT_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   922  			    SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   923  	_read_pp_level_info("max_memory_freq_mhz", perf_level.max_memory_freq_mhz,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   924  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_MAX_MEMORY_FREQ_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   925  			    SST_PP_MAX_MEMORY_FREQ_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   926  	_read_pp_level_info("cooling_type", perf_level.cooling_type, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   927  			    SST_PP_INFO_1_OFFSET, SST_PP_COOLING_TYPE_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   928  			    SST_PP_COOLING_TYPE_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   929  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   930  	for (i = 0; i < TRL_MAX_LEVELS; ++i) {
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   931  		for (j = 0; j < TRL_MAX_BUCKETS; ++j)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   932  			_read_pp_level_info("trl*_bucket*_freq_mhz",
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   933  					    perf_level.trl_freq_mhz[i][j], perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   934  					    SST_PP_INFO_4_OFFSET + (i * SST_PP_TRL_0_RATIO_0_WIDTH),
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   935  					    j * SST_PP_TRL_0_RATIO_0_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   936  					    SST_PP_TRL_0_RATIO_0_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   937  					    SST_MUL_FACTOR_FREQ);
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   938  	}
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   939  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   940  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   941  		_read_pp_level_info("bucket*_core_count", perf_level.bucket_core_counts[i],
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   942  				    perf_level.level, SST_PP_INFO_10_OFFSET,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   943  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH * i,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   944  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH, SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   945  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   946  	perf_level.max_buckets = TRL_MAX_BUCKETS;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   947  	perf_level.max_trl_levels = TRL_MAX_LEVELS;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   948  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   949  	_read_pp_level_info("p0_freq_mhz", perf_level.p0_freq_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   950  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P0_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   951  			    SST_PP_CORE_RATIO_P0_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   952  	_read_pp_level_info("p1_freq_mhz", perf_level.p1_freq_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   953  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P1_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   954  			    SST_PP_CORE_RATIO_P1_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   955  	_read_pp_level_info("pn_freq_mhz", perf_level.pn_freq_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   956  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PN_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   957  			    SST_PP_CORE_RATIO_PN_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   958  	_read_pp_level_info("pm_freq_mhz", perf_level.pm_freq_mhz, perf_level.level,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   959  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PM_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   960  			    SST_PP_CORE_RATIO_PM_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   961  	_read_pp_level_info("p0_fabric_freq_mhz", perf_level.p0_fabric_freq_mhz,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   962  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   963  			    SST_PP_CORE_RATIO_P0_FABRIC_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   964  			    SST_PP_CORE_RATIO_P0_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   965  	_read_pp_level_info("p1_fabric_freq_mhz", perf_level.p1_fabric_freq_mhz,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   966  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   967  			    SST_PP_CORE_RATIO_P1_FABRIC_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   968  			    SST_PP_CORE_RATIO_P1_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   969  	_read_pp_level_info("pm_fabric_freq_mhz", perf_level.pm_fabric_freq_mhz,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   970  			    perf_level.level, SST_PP_INFO_11_OFFSET,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   971  			    SST_PP_CORE_RATIO_PM_FABRIC_START,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   972  			    SST_PP_CORE_RATIO_PM_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   973  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   974  	if (copy_to_user(argp, &perf_level, sizeof(perf_level)))
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   975  		return -EFAULT;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   976  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   977  	return 0;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   978  }
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   979  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   980  #define SST_PP_FUSED_CORE_COUNT_START	0
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   981  #define SST_PP_FUSED_CORE_COUNT_WIDTH	8
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   982  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   983  #define SST_PP_RSLVD_CORE_COUNT_START	8
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   984  #define SST_PP_RSLVD_CORE_COUNT_WIDTH	8
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   985  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   986  #define SST_PP_RSLVD_CORE_MASK_START	0
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   987  #define SST_PP_RSLVD_CORE_MASK_WIDTH	64
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   988  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   989  static int isst_if_get_perf_level_mask(void __user *argp)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   990  {
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   991  	static struct isst_perf_level_cpu_mask cpumask;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   992  	struct tpmi_per_power_domain_info *power_domain_info;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   993  	u64 mask;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   994  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   995  	if (copy_from_user(&cpumask, argp, sizeof(cpumask)))
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   996  		return -EFAULT;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   997  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   998  	power_domain_info = get_instance(cpumask.socket_id, cpumask.power_domain_id);
fffa812876c8b3 Srinivas Pandruvada 2023-03-07   999  	if (!power_domain_info)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1000  		return -EINVAL;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1001  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07 @1002  	_read_pp_level_info("mask", mask, cpumask.level, SST_PP_INFO_2_OFFSET,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1003  			    SST_PP_RSLVD_CORE_MASK_START, SST_PP_RSLVD_CORE_MASK_WIDTH,
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1004  			    SST_MUL_FACTOR_NONE)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1005  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1006  	cpumask.mask = mask;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1007  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1008  	if (!cpumask.punit_cpu_map)
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1009  		return -EOPNOTSUPP;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1010  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1011  	if (copy_to_user(argp, &cpumask, sizeof(cpumask)))
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1012  		return -EFAULT;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1013  
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1014  	return 0;
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1015  }
fffa812876c8b3 Srinivas Pandruvada 2023-03-07  1016  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
