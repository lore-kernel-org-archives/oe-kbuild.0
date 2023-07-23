Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32C1378
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690117365; x=1721653365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGD7QifAybXnWKELYLg13oGwQYkUpEORYyO2Nyyu0+4=;
  b=eZuzuh2IwR4OvHpk8qLLy2JTrkvuVaf6Jn5zB62zDHq506MgqgrhNs4y
   awZv+XKDAETSGpY8v3gRLcPW588nsBhu3gJ2QFEdRGesSKy3yUIRmPAn4
   8uxVRHmDDNGhcyrRXCH/73lPPTJxJaHrhO4BobOJc/cV+nT/zsf9Pyy3H
   oWBkUsMK/hSw22hOwNvsJn1grUPYrhXFuK5wMiD0Jy5bYmO9d5Uy9EUad
   DJ4rArFi82kIj8EMQHJiNo/ahNtU1BAVNJe7pXsdHzgWLGI1hu4vnreSJ
   HeYhzjbREu1IDjeCDWpjNossJVkyNFNBtyBHBaf1iNXtryUCJbuTS+Rwr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357272504"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="357272504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 06:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="675553644"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="675553644"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Jul 2023 06:02:43 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNYjC-00090X-06;
	Sun, 23 Jul 2023 13:02:29 +0000
Date: Sun, 23 Jul 2023 21:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1047
 isst_if_get_base_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202307232017.y5UAWtvq-lkp@intel.com>
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
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: 06a61df83209ac7f376616f83f3485217c703d50 platform/x86: ISST: Add SST-BF support via TPMI
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230723/202307232017.y5UAWtvq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307232017.y5UAWtvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307232017.y5UAWtvq-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1047 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1083 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1110 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1114 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +1047 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

06a61df83209ac Srinivas Pandruvada 2023-03-07  1031  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1032  static int isst_if_get_base_freq_info(void __user *argp)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1033  {
06a61df83209ac Srinivas Pandruvada 2023-03-07  1034  	static struct isst_base_freq_info base_freq;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1035  	struct tpmi_per_power_domain_info *power_domain_info;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1036  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1037  	if (copy_from_user(&base_freq, argp, sizeof(base_freq)))
06a61df83209ac Srinivas Pandruvada 2023-03-07  1038  		return -EFAULT;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1039  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1040  	power_domain_info = get_instance(base_freq.socket_id, base_freq.power_domain_id);
06a61df83209ac Srinivas Pandruvada 2023-03-07  1041  	if (!power_domain_info)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1042  		return -EINVAL;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1043  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1044  	if (base_freq.level > power_domain_info->max_level)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1045  		return -EINVAL;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1046  
06a61df83209ac Srinivas Pandruvada 2023-03-07 @1047  	_read_bf_level_info("p1_high", base_freq.high_base_freq_mhz, base_freq.level,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1048  			    SST_BF_INFO_0_OFFSET, SST_BF_P1_HIGH_START, SST_BF_P1_HIGH_WIDTH,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1049  			    SST_MUL_FACTOR_FREQ)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1050  	_read_bf_level_info("p1_low", base_freq.low_base_freq_mhz, base_freq.level,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1051  			    SST_BF_INFO_0_OFFSET, SST_BF_P1_LOW_START, SST_BF_P1_LOW_WIDTH,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1052  			    SST_MUL_FACTOR_FREQ)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1053  	_read_bf_level_info("BF-TJ", base_freq.tjunction_max_c, base_freq.level,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1054  			    SST_BF_INFO_0_OFFSET, SST_BF_T_PROHOT_START, SST_BF_T_PROHOT_WIDTH,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1055  			    SST_MUL_FACTOR_NONE)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1056  	_read_bf_level_info("BF-tdp", base_freq.thermal_design_power_w, base_freq.level,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1057  			    SST_BF_INFO_0_OFFSET, SST_BF_TDP_START, SST_BF_TDP_WIDTH,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1058  			    SST_MUL_FACTOR_NONE)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1059  	base_freq.thermal_design_power_w /= 8; /*unit = 1/8th watt*/
06a61df83209ac Srinivas Pandruvada 2023-03-07  1060  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1061  	if (copy_to_user(argp, &base_freq, sizeof(base_freq)))
06a61df83209ac Srinivas Pandruvada 2023-03-07  1062  		return -EFAULT;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1063  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1064  	return 0;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1065  }
06a61df83209ac Srinivas Pandruvada 2023-03-07  1066  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1067  #define P1_HI_CORE_MASK_START	0
06a61df83209ac Srinivas Pandruvada 2023-03-07  1068  #define P1_HI_CORE_MASK_WIDTH	64
06a61df83209ac Srinivas Pandruvada 2023-03-07  1069  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1070  static int isst_if_get_base_freq_mask(void __user *argp)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1071  {
06a61df83209ac Srinivas Pandruvada 2023-03-07  1072  	static struct isst_perf_level_cpu_mask cpumask;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1073  	struct tpmi_per_power_domain_info *power_domain_info;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1074  	u64 mask;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1075  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1076  	if (copy_from_user(&cpumask, argp, sizeof(cpumask)))
06a61df83209ac Srinivas Pandruvada 2023-03-07  1077  		return -EFAULT;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1078  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1079  	power_domain_info = get_instance(cpumask.socket_id, cpumask.power_domain_id);
06a61df83209ac Srinivas Pandruvada 2023-03-07  1080  	if (!power_domain_info)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1081  		return -EINVAL;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1082  
06a61df83209ac Srinivas Pandruvada 2023-03-07 @1083  	_read_bf_level_info("BF-cpumask", mask, cpumask.level, SST_BF_INFO_1_OFFSET,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1084  			    P1_HI_CORE_MASK_START, P1_HI_CORE_MASK_WIDTH,
06a61df83209ac Srinivas Pandruvada 2023-03-07  1085  			    SST_MUL_FACTOR_NONE)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1086  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1087  	cpumask.mask = mask;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1088  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1089  	if (!cpumask.punit_cpu_map)
06a61df83209ac Srinivas Pandruvada 2023-03-07  1090  		return -EOPNOTSUPP;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1091  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1092  	if (copy_to_user(argp, &cpumask, sizeof(cpumask)))
06a61df83209ac Srinivas Pandruvada 2023-03-07  1093  		return -EFAULT;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1094  
06a61df83209ac Srinivas Pandruvada 2023-03-07  1095  	return 0;
06a61df83209ac Srinivas Pandruvada 2023-03-07  1096  }
06a61df83209ac Srinivas Pandruvada 2023-03-07  1097  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
