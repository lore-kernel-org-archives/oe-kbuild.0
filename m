Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F55690
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItZjFQoq"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696500656; x=1728036656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hzG5PIFC/QbdlTVuzjfBC/TySJnevGcbdWVQY6tN/mY=;
  b=ItZjFQoq30x63D5fHqRBrqKCA7KZQGvEQ6ZXLkBXXilI4dSQau1fxxDh
   CTqPaZuYphYheAIMKSEalGuWkcLyE9quAWdxbEg54c6sABlv64Zh2PLlz
   JRJKvWUxmMwIYLG4qHtBmH1w0bYXMnqnr/Y96mjvVsLO/kU88p4uW9Ow7
   Qlp4p0FNfnetW9RyvuYJ3MCYIDOvouN+Xc70GsQNnmIkobHVx3gUYcST7
   /s7PGuffTGqcrcb6A3vHMbalJyoJK9nmvBCHl4N53/ybZ2G8Rk8atv7se
   CCYQV2iJQ96w/kC+g0j8z+NZg2Q1ZNxtMB1qynWeJony7fsRTFpmOYRq6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="2062201"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="2062201"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867836159"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="867836159"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2023 03:10:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoLJa-000LHk-1J;
	Thu, 05 Oct 2023 10:10:47 +0000
Date: Thu, 5 Oct 2023 18:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1164
 isst_if_get_turbo_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202310051800.Vk4kh4e7-lkp@intel.com>
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
commit: f8e0077a9d526cac7abbc682d83e98f834ffa909 platform/x86: ISST: Add SST-TF support via TPMI
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051800.Vk4kh4e7-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051800.Vk4kh4e7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051800.Vk4kh4e7-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1164 isst_if_get_turbo_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1047 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1083 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1110 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1114 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +1164 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1142  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1143  static int isst_if_get_turbo_freq_info(void __user *argp)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1144  {
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1145  	static struct isst_turbo_freq_info turbo_freq;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1146  	struct tpmi_per_power_domain_info *power_domain_info;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1147  	int i, j;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1148  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1149  	if (copy_from_user(&turbo_freq, argp, sizeof(turbo_freq)))
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1150  		return -EFAULT;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1151  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1152  	power_domain_info = get_instance(turbo_freq.socket_id, turbo_freq.power_domain_id);
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1153  	if (!power_domain_info)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1154  		return -EINVAL;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1155  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1156  	if (turbo_freq.level > power_domain_info->max_level)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1157  		return -EINVAL;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1158  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1159  	turbo_freq.max_buckets = TRL_MAX_BUCKETS;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1160  	turbo_freq.max_trl_levels = TRL_MAX_LEVELS;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1161  	turbo_freq.max_clip_freqs = SST_TF_MAX_LP_CLIP_RATIOS;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1162  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1163  	for (i = 0; i < turbo_freq.max_clip_freqs; ++i)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07 @1164  		_read_tf_level_info("lp_clip*", turbo_freq.lp_clip_freq_mhz[i],
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1165  				    turbo_freq.level, SST_TF_INFO_0_OFFSET,
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1166  				    SST_TF_LP_CLIP_RATIO_0_START +
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1167  				    (i * SST_TF_LP_CLIP_RATIO_0_WIDTH),
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1168  				    SST_TF_LP_CLIP_RATIO_0_WIDTH, SST_MUL_FACTOR_FREQ)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1169  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1170  	for (i = 0; i < TRL_MAX_LEVELS; ++i) {
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1171  		for (j = 0; j < TRL_MAX_BUCKETS; ++j)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1172  			_read_tf_level_info("cydn*_bucket_*_trl",
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1173  					    turbo_freq.trl_freq_mhz[i][j], turbo_freq.level,
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1174  					    SST_TF_INFO_2_OFFSET + (i * SST_TF_RATIO_0_WIDTH),
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1175  					    j * SST_TF_RATIO_0_WIDTH, SST_TF_RATIO_0_WIDTH,
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1176  					    SST_MUL_FACTOR_FREQ)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1177  	}
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1178  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1179  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1180  		_read_tf_level_info("bucket_*_core_count", turbo_freq.bucket_core_counts[i],
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1181  				    turbo_freq.level, SST_TF_INFO_1_OFFSET,
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1182  				    SST_TF_NUM_CORE_0_WIDTH * i, SST_TF_NUM_CORE_0_WIDTH,
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1183  				    SST_MUL_FACTOR_NONE)
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1184  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1185  	if (copy_to_user(argp, &turbo_freq, sizeof(turbo_freq)))
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1186  		return -EFAULT;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1187  
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1188  	return 0;
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1189  }
f8e0077a9d526c Srinivas Pandruvada 2023-03-07  1190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
