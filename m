Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600AC147C9B
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727250912; cv=none; b=hI/PjsaT+bIRsDxeVxFM86oun9N9LjOJXJEagWEH/Z8dKoLivA6d5DfSh/ROABe5qM92mhgsZD9lGsCAlB+EW1ro+BunqmC5FMnpUJVMsW3S4Zt3F9uoINxVvF6hiA2mgb1WgdJEOV0ExT8C6AGLN0DebRNIRam+p78zOnpQjNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727250912; c=relaxed/simple;
	bh=sPPceIo8Hi+tC/kOaoxwcKXvqcv3QcTwcfGQxCoJUi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMQNTTFnSwFRuIzgyUmqviCxLrrKVCxvqHmsJp1FxQmjA2cGJAJKV1HDsItZ1wlRQOm1NGH2NdU74iypMFpNNq/WFTeuZPobkUB5jkxqcMAeNKI+p4f7fGWvzCULarwk/3bue5P9roMf41s2kC7p/qdRxxjy7Oha0TFv6WCIUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpILZthS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpILZthS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727250911; x=1758786911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPPceIo8Hi+tC/kOaoxwcKXvqcv3QcTwcfGQxCoJUi4=;
  b=lpILZthSUCjpv5RVIIZza4ocFh1PZdvi7z6noWZqSn5bWdkstWKennom
   E6xJPQnX/W5FIIx4DDzysEJr+e1dsHKPU4Kf/Z7dA6J2WS3idAciHU6ZN
   pHmwEflvsVRVGnAkK+WPe3wn+hkVYZ4OKhO7Wsyl98YJS4G1wKTPX6Qtg
   ZUbb+KGmCyJew7KvKS8DL94JUO6Yal9p8uDM0MRvWi3+X2WfMUKNxGxdi
   +DbGHet+H7Lt5oFUOUG65L/Rvp0kNXKMGisVtGQzG6t+p4pDXETD85YFT
   h5uQozN0prVjUP8kAd+gyppFWaN79V08jK8Gl6zMzIhm9ir9ONqu0L1Ni
   g==;
X-CSE-ConnectionGUID: 70BXMx/HQaeLJy7WWPXppg==
X-CSE-MsgGUID: ngPWKuWgSKCP1DhNqsh8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26231806"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26231806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 00:55:09 -0700
X-CSE-ConnectionGUID: +NzC01/TTfC89PXAJEEqng==
X-CSE-MsgGUID: GIMuOOPvThuuUeIOb0frQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71837111"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 00:55:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stMrZ-000JKf-1L;
	Wed, 25 Sep 2024 07:55:05 +0000
Date: Wed, 25 Sep 2024 15:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 23323/30000]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1164
 isst_if_get_turbo_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202409251521.YBFBDX9R-lkp@intel.com>
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
head:   d831c8e9a987a5c339274aaac9f8d205dba1ef8b
commit: 568e6cdd8c7c54efd42dbe0be517668bf1febe7f [23323/30000] platform/x86: ISST: Add SST-TF support via TPMI
:::::: branch date: 54 minutes ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251521.YBFBDX9R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409251521.YBFBDX9R-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1164 isst_if_get_turbo_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)

Old smatch warnings:
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:585 isst_if_clos_assoc() warn: potential spectre issue 'isst_common.sst_inst' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:587 isst_if_clos_assoc() warn: possible spectre second half.  'sst_inst'
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:590 isst_if_clos_assoc() warn: potential spectre issue 'sst_inst->power_domain_info' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:900 isst_if_get_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1002 isst_if_get_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1047 isst_if_get_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_levels' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1083 isst_if_get_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_levels' [r]
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1110 isst_if_get_tpmi_instance_count() warn: potential spectre issue 'isst_common.sst_inst' [r] (local cap)
drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1114 isst_if_get_tpmi_instance_count() warn: possible spectre second half.  'sst_inst'

vim +1164 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c

568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1142  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1143  static int isst_if_get_turbo_freq_info(void __user *argp)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1144  {
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1145  	static struct isst_turbo_freq_info turbo_freq;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1146  	struct tpmi_per_power_domain_info *power_domain_info;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1147  	int i, j;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1148  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1149  	if (copy_from_user(&turbo_freq, argp, sizeof(turbo_freq)))
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1150  		return -EFAULT;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1151  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1152  	power_domain_info = get_instance(turbo_freq.socket_id, turbo_freq.power_domain_id);
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1153  	if (!power_domain_info)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1154  		return -EINVAL;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1155  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1156  	if (turbo_freq.level > power_domain_info->max_level)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1157  		return -EINVAL;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1158  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1159  	turbo_freq.max_buckets = TRL_MAX_BUCKETS;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1160  	turbo_freq.max_trl_levels = TRL_MAX_LEVELS;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1161  	turbo_freq.max_clip_freqs = SST_TF_MAX_LP_CLIP_RATIOS;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1162  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1163  	for (i = 0; i < turbo_freq.max_clip_freqs; ++i)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07 @1164  		_read_tf_level_info("lp_clip*", turbo_freq.lp_clip_freq_mhz[i],
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1165  				    turbo_freq.level, SST_TF_INFO_0_OFFSET,
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1166  				    SST_TF_LP_CLIP_RATIO_0_START +
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1167  				    (i * SST_TF_LP_CLIP_RATIO_0_WIDTH),
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1168  				    SST_TF_LP_CLIP_RATIO_0_WIDTH, SST_MUL_FACTOR_FREQ)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1169  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1170  	for (i = 0; i < TRL_MAX_LEVELS; ++i) {
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1171  		for (j = 0; j < TRL_MAX_BUCKETS; ++j)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1172  			_read_tf_level_info("cydn*_bucket_*_trl",
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1173  					    turbo_freq.trl_freq_mhz[i][j], turbo_freq.level,
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1174  					    SST_TF_INFO_2_OFFSET + (i * SST_TF_RATIO_0_WIDTH),
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1175  					    j * SST_TF_RATIO_0_WIDTH, SST_TF_RATIO_0_WIDTH,
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1176  					    SST_MUL_FACTOR_FREQ)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1177  	}
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1178  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1179  	for (i = 0; i < TRL_MAX_BUCKETS; ++i)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1180  		_read_tf_level_info("bucket_*_core_count", turbo_freq.bucket_core_counts[i],
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1181  				    turbo_freq.level, SST_TF_INFO_1_OFFSET,
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1182  				    SST_TF_NUM_CORE_0_WIDTH * i, SST_TF_NUM_CORE_0_WIDTH,
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1183  				    SST_MUL_FACTOR_NONE)
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1184  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1185  	if (copy_to_user(argp, &turbo_freq, sizeof(turbo_freq)))
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1186  		return -EFAULT;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1187  
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1188  	return 0;
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1189  }
568e6cdd8c7c54 Srinivas Pandruvada 2023-03-07  1190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
