Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256A63D1
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsaLELpt"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696494338; x=1728030338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gSJaQfck9Wh7Fq9WxM3qIVwavIEBEb96IdtrbLz3DY=;
  b=WsaLELptjsSNtXoVQYENYzewEjxfhE29NV5gdNjXPwbp1SIU3HNtfZSa
   rkXvedzR/eYl1+NE//jl83hOvF3ZXnLXi6RiIo8l3yC8ABc5CsREXhDuS
   pNlXl+I3RPMoAtdYkdB8UBdkCLm5Tf/vetFzq0AeRSO3W+UO98iVVNXeK
   gID0y065wizBE8hgfZGau5lpNiYXM8vzPXIheYpzlF7XgyEv0ghxO3K7A
   lFZ7ky517YRJbzLZTWJm00Q1uHBiCJuDkDS97ASG/ihy9JGq2qXcWqMF4
   duDmNkHUYJJqiuGLfH6WAE4BHR2mpo8pugi2himCj6LPUk1JuRwMAj/2z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383342452"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383342452"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 01:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786874183"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="786874183"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 01:25:35 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoJfp-000LCE-0X;
	Thu, 05 Oct 2023 08:25:33 +0000
Date: Thu, 5 Oct 2023 16:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1047
 isst_if_get_base_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202310051627.I2ejkr3s-lkp@intel.com>
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
commit: 06a61df83209ac7f376616f83f3485217c703d50 platform/x86: ISST: Add SST-BF support via TPMI
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051627.I2ejkr3s-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051627.I2ejkr3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051627.I2ejkr3s-lkp@intel.com/

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
