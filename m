Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD038DD2
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 04:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727237341; cv=none; b=hdp5Vn4taEkcVI1UXY9Ip2f0RiJh2zJ+sW0ItT+WXUd6uZTGeHIaw/O0MwMqkcGBtUFCY/N1Ae76J/hNONdXhwPlx4C5RcFbig8xuwhD2Yl5UTiFSML5S4MiDlONHDI+sWrxqc4PH6lHRUJWPQ3n17D9l2yCVz8qrFLCZ9onoBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727237341; c=relaxed/simple;
	bh=TtXiP5wNL+31POcjhbPqJFeULNKSiaMREX1G6/OpyVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKsdqL0Jl/TEE3OTWcNT3l8/fAGE2tYNKr7ZqW6e/BLEKEHoaJSq2ywDqD+8bRclccmGk5j/IiY8/zJIQzjO+FDhsAqIfkgFGNlY+kJhPogt9B24rN4IBC5lsymnTJl5utXd4Eqjb+z9+tMHM2eFMspG49XYgzORG6f92JNZC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAtzwJV3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAtzwJV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727237339; x=1758773339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TtXiP5wNL+31POcjhbPqJFeULNKSiaMREX1G6/OpyVA=;
  b=QAtzwJV3BBrtuh7RFxxmyhg6AHNAHJg4YDZWq0s7ayFE5L8edPcrna9f
   VH+GS1oUTcNvZgveH/cthUibbqBWQQx3HMggmTTgRZtav2lPCavM7aRFB
   MOARsmmX3ApOk7AjzhuP3IYX80LFRnM8jKZFIHJ8VIn1ADIOTSMeQLKsv
   erFo6mkiNcU77VfAiV1+jYO/NtqpKQ1weUvKBf1sVDWFTQ7fHgZY36Jma
   cW/U49GtEidOAnt/QxARGYciwDeo+Ak9rzbxfg0nR4CgUJ7iguQEUjHnu
   A+BFtYJsp2c1QVSp5hW4svvfYHTQHqXUSSL4A1gc222RJcy5C7/KgOR5L
   g==;
X-CSE-ConnectionGUID: EVLcvmNnQNG4mwvGIu30tA==
X-CSE-MsgGUID: Sq3zQAPFQdKoa+5QLnSTZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37642284"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="37642284"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 21:08:58 -0700
X-CSE-ConnectionGUID: 59BVsuQsQIyXmO0PdrZBwA==
X-CSE-MsgGUID: FvdvlAHnQ0KVzQL6fsNONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71783529"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2024 21:08:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stJKg-000J7T-2d;
	Wed, 25 Sep 2024 04:08:54 +0000
Date: Wed, 25 Sep 2024 12:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 23322/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1047
 isst_if_get_base_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202409251228.Ka94EkH5-lkp@intel.com>
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
commit: d6fd6e9bf42cc19d55448461c7971c86d3272e24 [23322/30000] platform/x86: ISST: Add SST-BF support via TPMI
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251228.Ka94EkH5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409251228.Ka94EkH5-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1047 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1083 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]

Old smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1110 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1114 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +1047 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1031  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1032  static int isst_if_get_base_freq_info(void __user *argp)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1033  {
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1034  	static struct isst_base_freq_info base_freq;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1035  	struct tpmi_per_power_domain_info *power_domain_info;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1036  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1037  	if (copy_from_user(&base_freq, argp, sizeof(base_freq)))
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1038  		return -EFAULT;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1039  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1040  	power_domain_info = get_instance(base_freq.socket_id, base_freq.power_domain_id);
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1041  	if (!power_domain_info)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1042  		return -EINVAL;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1043  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1044  	if (base_freq.level > power_domain_info->max_level)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1045  		return -EINVAL;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1046  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07 @1047  	_read_bf_level_info("p1_high", base_freq.high_base_freq_mhz, base_freq.level,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1048  			    SST_BF_INFO_0_OFFSET, SST_BF_P1_HIGH_START, SST_BF_P1_HIGH_WIDTH,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1049  			    SST_MUL_FACTOR_FREQ)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1050  	_read_bf_level_info("p1_low", base_freq.low_base_freq_mhz, base_freq.level,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1051  			    SST_BF_INFO_0_OFFSET, SST_BF_P1_LOW_START, SST_BF_P1_LOW_WIDTH,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1052  			    SST_MUL_FACTOR_FREQ)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1053  	_read_bf_level_info("BF-TJ", base_freq.tjunction_max_c, base_freq.level,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1054  			    SST_BF_INFO_0_OFFSET, SST_BF_T_PROHOT_START, SST_BF_T_PROHOT_WIDTH,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1055  			    SST_MUL_FACTOR_NONE)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1056  	_read_bf_level_info("BF-tdp", base_freq.thermal_design_power_w, base_freq.level,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1057  			    SST_BF_INFO_0_OFFSET, SST_BF_TDP_START, SST_BF_TDP_WIDTH,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1058  			    SST_MUL_FACTOR_NONE)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1059  	base_freq.thermal_design_power_w /= 8; /*unit = 1/8th watt*/
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1060  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1061  	if (copy_to_user(argp, &base_freq, sizeof(base_freq)))
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1062  		return -EFAULT;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1063  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1064  	return 0;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1065  }
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1066  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1067  #define P1_HI_CORE_MASK_START	0
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1068  #define P1_HI_CORE_MASK_WIDTH	64
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1069  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1070  static int isst_if_get_base_freq_mask(void __user *argp)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1071  {
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1072  	static struct isst_perf_level_cpu_mask cpumask;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1073  	struct tpmi_per_power_domain_info *power_domain_info;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1074  	u64 mask;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1075  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1076  	if (copy_from_user(&cpumask, argp, sizeof(cpumask)))
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1077  		return -EFAULT;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1078  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1079  	power_domain_info = get_instance(cpumask.socket_id, cpumask.power_domain_id);
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1080  	if (!power_domain_info)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1081  		return -EINVAL;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1082  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07 @1083  	_read_bf_level_info("BF-cpumask", mask, cpumask.level, SST_BF_INFO_1_OFFSET,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1084  			    P1_HI_CORE_MASK_START, P1_HI_CORE_MASK_WIDTH,
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1085  			    SST_MUL_FACTOR_NONE)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1086  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1087  	cpumask.mask = mask;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1088  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1089  	if (!cpumask.punit_cpu_map)
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1090  		return -EOPNOTSUPP;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1091  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1092  	if (copy_to_user(argp, &cpumask, sizeof(cpumask)))
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1093  		return -EFAULT;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1094  
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1095  	return 0;
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1096  }
d6fd6e9bf42cc1 Srinivas Pandruvada 2023-03-07  1097  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
