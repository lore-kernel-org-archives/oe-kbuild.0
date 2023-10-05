Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36B4C92
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjKs7rH9"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696487281; x=1728023281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoHDlyzjFNwaKHZZL0nPIYgNmqcIjn8P8CXpZJwqcQ0=;
  b=YjKs7rH919jlxIEz+Wfg+ll3uyrGdK6XWFcnwLpP+vSUZcbedVne6+0o
   QNq4qqdZ2dxcG7woPWDfwppZGGdhlsMx/J/o33MIUX92qQJMCK4P3P6Wt
   eX26HnEXiTC6uUTizLKrjrX609jePM8avB+PO6/M+8hhkRGUsfLFZA5L+
   Ihw0ovMsV9g2vflihsfy4Dyas1enUXNYrLwVgSnnFjltZfechY3beVITO
   Ix8BAE2/fQq2F6y8vQo04krQ+LEIppjM7jyFKMW43xqrLPTPeZSzOulzg
   XfqLHNLZpnGHVA4ztq/BQbzLM2h7t+S8XrR6V0LKbJTig/sIUShlTi9+H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362776332"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="362776332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 23:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998832114"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="998832114"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 23:27:57 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoHpc-000L6w-12;
	Thu, 05 Oct 2023 06:27:39 +0000
Date: Thu, 5 Oct 2023 14:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:900
 isst_if_get_perf_level_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202310051435.upAWza1M-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Zhang Rui <rui.zhang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3006adf3be79cde4d14b1800b963b82b6e5572e0
commit: ea009e4769fa3bd05d4c111c3b6865eb3a9be829 platform/x86: ISST: Add SST-PP support via TPMI
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051435.upAWza1M-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051435.upAWza1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051435.upAWza1M-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1029 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1033 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +900 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

ea009e4769fa3b Srinivas Pandruvada 2023-03-07   880  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   881  static int isst_if_get_perf_level_info(void __user *argp)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   882  {
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   883  	struct isst_perf_level_data_info perf_level;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   884  	struct tpmi_per_power_domain_info *power_domain_info;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   885  	int i, j;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   886  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   887  	if (copy_from_user(&perf_level, argp, sizeof(perf_level)))
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   888  		return -EFAULT;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   889  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   890  	power_domain_info = get_instance(perf_level.socket_id, perf_level.power_domain_id);
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   891  	if (!power_domain_info)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   892  		return -EINVAL;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   893  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   894  	if (perf_level.level > power_domain_info->max_level)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   895  		return -EINVAL;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   896  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   897  	if (!(power_domain_info->pp_header.level_en_mask & BIT(perf_level.level)))
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   898  		return -EINVAL;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   899  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  @900  	_read_pp_level_info("tdp_ratio", perf_level.tdp_ratio, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   901  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   902  			    SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   903  	_read_pp_level_info("base_freq_mhz", perf_level.base_freq_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   904  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_SSE_START, SST_PP_P1_SSE_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   905  			    SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   906  	_read_pp_level_info("base_freq_avx2_mhz", perf_level.base_freq_avx2_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   907  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX2_START, SST_PP_P1_AVX2_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   908  			    SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   909  	_read_pp_level_info("base_freq_avx512_mhz", perf_level.base_freq_avx512_mhz,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   910  			    perf_level.level, SST_PP_INFO_0_OFFSET, SST_PP_P1_AVX512_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   911  			    SST_PP_P1_AVX512_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   912  	_read_pp_level_info("base_freq_amx_mhz", perf_level.base_freq_amx_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   913  			    SST_PP_INFO_0_OFFSET, SST_PP_P1_AMX_START, SST_PP_P1_AMX_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   914  			    SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   915  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   916  	_read_pp_level_info("thermal_design_power_w", perf_level.thermal_design_power_w,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   917  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_TDP_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   918  			    SST_PP_TDP_WIDTH, SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   919  	perf_level.thermal_design_power_w /= 8; /* units are in 1/8th watt */
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   920  	_read_pp_level_info("tjunction_max_c", perf_level.tjunction_max_c, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   921  			    SST_PP_INFO_1_OFFSET, SST_PP_T_PROCHOT_START, SST_PP_T_PROCHOT_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   922  			    SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   923  	_read_pp_level_info("max_memory_freq_mhz", perf_level.max_memory_freq_mhz,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   924  			    perf_level.level, SST_PP_INFO_1_OFFSET, SST_PP_MAX_MEMORY_FREQ_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   925  			    SST_PP_MAX_MEMORY_FREQ_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   926  	_read_pp_level_info("cooling_type", perf_level.cooling_type, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   927  			    SST_PP_INFO_1_OFFSET, SST_PP_COOLING_TYPE_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   928  			    SST_PP_COOLING_TYPE_WIDTH, SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   929  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   930  	for (i = 0; i < TRL_MAX_LEVELS; ++i) {
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   931  		for (j = 0; j < TRL_MAX_BUCKETS; ++j)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   932  			_read_pp_level_info("trl*_bucket*_freq_mhz",
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   933  					    perf_level.trl_freq_mhz[i][j], perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   934  					    SST_PP_INFO_4_OFFSET + (i * SST_PP_TRL_0_RATIO_0_WIDTH),
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   935  					    j * SST_PP_TRL_0_RATIO_0_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   936  					    SST_PP_TRL_0_RATIO_0_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   937  					    SST_MUL_FACTOR_FREQ);
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   938  	}
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   939  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   940  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   941  		_read_pp_level_info("bucket*_core_count", perf_level.bucket_core_counts[i],
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   942  				    perf_level.level, SST_PP_INFO_10_OFFSET,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   943  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH * i,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   944  				    SST_PP_TRL_CORES_BUCKET_0_WIDTH, SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   945  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   946  	perf_level.max_buckets = TRL_MAX_BUCKETS;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   947  	perf_level.max_trl_levels = TRL_MAX_LEVELS;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   948  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   949  	_read_pp_level_info("p0_freq_mhz", perf_level.p0_freq_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   950  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P0_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   951  			    SST_PP_CORE_RATIO_P0_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   952  	_read_pp_level_info("p1_freq_mhz", perf_level.p1_freq_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   953  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_P1_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   954  			    SST_PP_CORE_RATIO_P1_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   955  	_read_pp_level_info("pn_freq_mhz", perf_level.pn_freq_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   956  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PN_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   957  			    SST_PP_CORE_RATIO_PN_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   958  	_read_pp_level_info("pm_freq_mhz", perf_level.pm_freq_mhz, perf_level.level,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   959  			    SST_PP_INFO_11_OFFSET, SST_PP_CORE_RATIO_PM_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   960  			    SST_PP_CORE_RATIO_PM_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   961  	_read_pp_level_info("p0_fabric_freq_mhz", perf_level.p0_fabric_freq_mhz,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   962  			    perf_level.level, SST_PP_INFO_11_OFFSET,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   963  			    SST_PP_CORE_RATIO_P0_FABRIC_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   964  			    SST_PP_CORE_RATIO_P0_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   965  	_read_pp_level_info("p1_fabric_freq_mhz", perf_level.p1_fabric_freq_mhz,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   966  			    perf_level.level, SST_PP_INFO_11_OFFSET,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   967  			    SST_PP_CORE_RATIO_P1_FABRIC_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   968  			    SST_PP_CORE_RATIO_P1_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   969  	_read_pp_level_info("pm_fabric_freq_mhz", perf_level.pm_fabric_freq_mhz,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   970  			    perf_level.level, SST_PP_INFO_11_OFFSET,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   971  			    SST_PP_CORE_RATIO_PM_FABRIC_START,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   972  			    SST_PP_CORE_RATIO_PM_FABRIC_WIDTH, SST_MUL_FACTOR_FREQ)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   973  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   974  	if (copy_to_user(argp, &perf_level, sizeof(perf_level)))
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   975  		return -EFAULT;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   976  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   977  	return 0;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   978  }
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   979  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   980  #define SST_PP_FUSED_CORE_COUNT_START	0
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   981  #define SST_PP_FUSED_CORE_COUNT_WIDTH	8
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   982  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   983  #define SST_PP_RSLVD_CORE_COUNT_START	8
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   984  #define SST_PP_RSLVD_CORE_COUNT_WIDTH	8
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   985  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   986  #define SST_PP_RSLVD_CORE_MASK_START	0
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   987  #define SST_PP_RSLVD_CORE_MASK_WIDTH	64
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   988  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   989  static int isst_if_get_perf_level_mask(void __user *argp)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   990  {
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   991  	static struct isst_perf_level_cpu_mask cpumask;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   992  	struct tpmi_per_power_domain_info *power_domain_info;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   993  	u64 mask;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   994  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   995  	if (copy_from_user(&cpumask, argp, sizeof(cpumask)))
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   996  		return -EFAULT;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   997  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   998  	power_domain_info = get_instance(cpumask.socket_id, cpumask.power_domain_id);
ea009e4769fa3b Srinivas Pandruvada 2023-03-07   999  	if (!power_domain_info)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1000  		return -EINVAL;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1001  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07 @1002  	_read_pp_level_info("mask", mask, cpumask.level, SST_PP_INFO_2_OFFSET,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1003  			    SST_PP_RSLVD_CORE_MASK_START, SST_PP_RSLVD_CORE_MASK_WIDTH,
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1004  			    SST_MUL_FACTOR_NONE)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1005  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1006  	cpumask.mask = mask;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1007  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1008  	if (!cpumask.punit_cpu_map)
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1009  		return -EOPNOTSUPP;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1010  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1011  	if (copy_to_user(argp, &cpumask, sizeof(cpumask)))
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1012  		return -EFAULT;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1013  
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1014  	return 0;
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1015  }
ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1016  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
