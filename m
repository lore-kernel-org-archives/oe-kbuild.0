Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5E2566
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733017314; cv=none; b=KrgeUGiaua/Q2ckA0EpqZnuNhtB6WT20Zsr7LqW5a5IaXfAjD5jJvBis9oiBML3eZIGar4vjdr63QKtSqMP77t3lAKdT0RHspAVUnC8MXphzXADsNPPwllk/HDwwrM/j2GDe8WYTsvE5N9gjgb9Cya4twtYLeEiveX9+luuc8FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733017314; c=relaxed/simple;
	bh=0EUpfwTh5J7lN6/0354lbWjn6a6cqEuYXOieS5vO3Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEN3XOxhrfhZxiv5Dcq9EOrgPJwX7XtXvrBUzEET2ETIPiUGR7L2V3FN/ILeNgeBPlY8xzaQ54wCueLRtNMXFPbyMZ1jtprKkNQkx6tz1xIW/blF5NUffTfcTtCkBtYWfp5t1Jk20+rVbq0/wAeieudorQlU1b/N4YlNHZIkR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9wWn5d9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9wWn5d9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733017312; x=1764553312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EUpfwTh5J7lN6/0354lbWjn6a6cqEuYXOieS5vO3Lk=;
  b=l9wWn5d9YNoXg7NYK/irCcGfjAF5LOK+27hZzrVEy7hGsedJq3BRVZvc
   aSJrYMHFO+ifRFoDHkYxlZ8jzkIjTGuY/JpjCJq3jaQkVBmVQhNgTn343
   GgYFXGwIw8UTZMDkpQDulrgv3Jf9/bRFiWm4dvUBigncXSlNuyDGu9HTP
   ptTy/asO1h1JQWyz+0DoQkqjMYlU/bKUnG/JXTUgV4df/rL9G46uK6I0Y
   P5uQjWkhsNp+L/NUfGPqYbwkCiZtbSIHr94AofqOHgpw2St/zfKuMrEdt
   J2ARoIKfggzt6tRp0S3gYVuiSO4FEy33iU2XOFHiqbLtQSlxet1qTCIgG
   g==;
X-CSE-ConnectionGUID: l9vLMLHAS32f7c9VKZpfTg==
X-CSE-MsgGUID: f9Av5Zs5TH+L/pNmCseRMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33346198"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33346198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:41:51 -0800
X-CSE-ConnectionGUID: EVFchMuBR4Km/cuAcTNuHw==
X-CSE-MsgGUID: mc87yGZSRKKzwugiyAoTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="123724191"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2024 17:41:50 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYxq-00017X-39;
	Sun, 01 Dec 2024 01:41:39 +0000
Date: Sun, 1 Dec 2024 09:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2483/2483]
 drivers/platform/x86/intel_speed_select_if/isst_tpmi_core.c:1164
 isst_if_get_turbo_freq_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202412010908.REj7li8C-lkp@intel.com>
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
commit: 568e6cdd8c7c54efd42dbe0be517668bf1febe7f [2483/2483] platform/x86: ISST: Add SST-TF support via TPMI
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241126 (https://download.01.org/0day-ci/archive/20241201/202412010908.REj7li8C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412010908.REj7li8C-lkp@intel.com/

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
