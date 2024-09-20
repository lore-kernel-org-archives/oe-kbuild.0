Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033E11CA9
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726848558; cv=none; b=ZRaVPIeR9QrQwdn0N81KcZ10+NXJCHEYuMsa0EhZjrmCw4+SYxWlLRNjMJFPfJVo6VmFxwHkSK1bHEexy55mlWpZajAFoJUzMNI/usjcInPEVYlBI16A1d0aW+jHmHtqI6fWFb2F5yAV64ijLE1qywcnagVxQjMdf8l3xBrDiIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726848558; c=relaxed/simple;
	bh=G1/a9kff4Muvo5V2LhgC4VsVMoGUSvfEM//Lw1Wkg0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwseg4EqhMVMvhxBQMiZJ30XXsx0SDX0cFPSsOnQmWq+bzp3btDzvm7fDc9DJutqVM/tUOtXl/JS1iuHD0nZppeFekLU//kBXkEaOLQHZFp6anHfj1HPPWXWkxDMWoDdfKgwqm1cyat+LWHUBi633C7tTmd73c+7Ow9vTTKmce0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0YrAfgh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0YrAfgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726848555; x=1758384555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1/a9kff4Muvo5V2LhgC4VsVMoGUSvfEM//Lw1Wkg0k=;
  b=C0YrAfghkqXCmDPKE1WHaELpqNnj+d9bRBfF3sOgJVxAtoj0YMURmn8+
   h5n9pky+lAQDKbEJwmpN3/89eb6wtE3ZooS/xu5wb0UVoxWP6qQxnZBok
   WR35eV8c3OR1+F2RUgRnknB2C/9tGUWU3GPFceqdpl4TUUq/mvpOCQVLR
   EtyFnSsbPL2YyNU7bnkeyA6t4WEiCvI1S0yuBGPjxmTs6mDbRHzv+X7zd
   csktN5nmSHwwIq8rH4qJqoUImVnw2IJl94uXucK5YWW/JMA9jibgtkqx3
   B420m1vheH1cDjsJ+Q36Elrd16rLPWRhlLPbfsspWWUq9mqwShZRNCWQP
   A==;
X-CSE-ConnectionGUID: /+CKrUrgShWDzny/vvJ/TA==
X-CSE-MsgGUID: WRlrXN8uSgScAwERVa4P6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29650652"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="29650652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:09:01 -0700
X-CSE-ConnectionGUID: j4dJq2ibRy20AIwVbSJ9qQ==
X-CSE-MsgGUID: eHPPDK1uSeq2ePGjvqb3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70230692"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Sep 2024 09:09:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srgBm-000EdB-0O;
	Fri, 20 Sep 2024 16:08:58 +0000
Date: Sat, 21 Sep 2024 00:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1175
 smu_v14_0_2_force_clk_levels() error: buffer overflow
 'single_dpm_table->dpm_levels' 16 <= 31
Message-ID: <202409210029.LFTFRAkq-lkp@intel.com>
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
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Kenneth Feng <kenneth.feng@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   baeb9a7d8b60b021d907127509c44507539c15e5
commit: 3e55845c3983d92e28517a545e403b5eb9acf95b drm/amd/swsmu: add smu v14_0_2 support
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r071-20240919 (https://download.01.org/0day-ci/archive/20240921/202409210029.LFTFRAkq-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409210029.LFTFRAkq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1175 smu_v14_0_2_force_clk_levels() error: buffer overflow 'single_dpm_table->dpm_levels' 16 <= 31

vim +1175 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c

3e55845c3983d9 Likun Gao 2023-04-25  1112  
3e55845c3983d9 Likun Gao 2023-04-25  1113  static int smu_v14_0_2_force_clk_levels(struct smu_context *smu,
3e55845c3983d9 Likun Gao 2023-04-25  1114  					enum smu_clk_type clk_type,
3e55845c3983d9 Likun Gao 2023-04-25  1115  					uint32_t mask)
3e55845c3983d9 Likun Gao 2023-04-25  1116  {
3e55845c3983d9 Likun Gao 2023-04-25  1117  	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
3e55845c3983d9 Likun Gao 2023-04-25  1118  	struct smu_14_0_dpm_context *dpm_context = smu_dpm->dpm_context;
3e55845c3983d9 Likun Gao 2023-04-25  1119  	struct smu_14_0_dpm_table *single_dpm_table;
3e55845c3983d9 Likun Gao 2023-04-25  1120  	uint32_t soft_min_level, soft_max_level;
3e55845c3983d9 Likun Gao 2023-04-25  1121  	uint32_t min_freq, max_freq;
3e55845c3983d9 Likun Gao 2023-04-25  1122  	int ret = 0;
3e55845c3983d9 Likun Gao 2023-04-25  1123  
3e55845c3983d9 Likun Gao 2023-04-25  1124  	soft_min_level = mask ? (ffs(mask) - 1) : 0;
3e55845c3983d9 Likun Gao 2023-04-25  1125  	soft_max_level = mask ? (fls(mask) - 1) : 0;
3e55845c3983d9 Likun Gao 2023-04-25  1126  
3e55845c3983d9 Likun Gao 2023-04-25  1127  	switch (clk_type) {
3e55845c3983d9 Likun Gao 2023-04-25  1128  	case SMU_GFXCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1129  	case SMU_SCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1130  		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
3e55845c3983d9 Likun Gao 2023-04-25  1131  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1132  	case SMU_MCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1133  	case SMU_UCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1134  		single_dpm_table = &(dpm_context->dpm_tables.uclk_table);
3e55845c3983d9 Likun Gao 2023-04-25  1135  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1136  	case SMU_SOCCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1137  		single_dpm_table = &(dpm_context->dpm_tables.soc_table);
3e55845c3983d9 Likun Gao 2023-04-25  1138  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1139  	case SMU_FCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1140  		single_dpm_table = &(dpm_context->dpm_tables.fclk_table);
3e55845c3983d9 Likun Gao 2023-04-25  1141  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1142  	case SMU_VCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1143  	case SMU_VCLK1:
3e55845c3983d9 Likun Gao 2023-04-25  1144  		single_dpm_table = &(dpm_context->dpm_tables.vclk_table);
3e55845c3983d9 Likun Gao 2023-04-25  1145  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1146  	case SMU_DCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1147  	case SMU_DCLK1:
3e55845c3983d9 Likun Gao 2023-04-25  1148  		single_dpm_table = &(dpm_context->dpm_tables.dclk_table);
3e55845c3983d9 Likun Gao 2023-04-25  1149  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1150  	default:
3e55845c3983d9 Likun Gao 2023-04-25  1151  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1152  	}
3e55845c3983d9 Likun Gao 2023-04-25  1153  
3e55845c3983d9 Likun Gao 2023-04-25  1154  	switch (clk_type) {
3e55845c3983d9 Likun Gao 2023-04-25  1155  	case SMU_GFXCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1156  	case SMU_SCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1157  	case SMU_MCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1158  	case SMU_UCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1159  	case SMU_SOCCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1160  	case SMU_FCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1161  	case SMU_VCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1162  	case SMU_VCLK1:
3e55845c3983d9 Likun Gao 2023-04-25  1163  	case SMU_DCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1164  	case SMU_DCLK1:
3e55845c3983d9 Likun Gao 2023-04-25  1165  		if (single_dpm_table->is_fine_grained) {
3e55845c3983d9 Likun Gao 2023-04-25  1166  			/* There is only 2 levels for fine grained DPM */
3e55845c3983d9 Likun Gao 2023-04-25  1167  			soft_max_level = (soft_max_level >= 1 ? 1 : 0);
3e55845c3983d9 Likun Gao 2023-04-25  1168  			soft_min_level = (soft_min_level >= 1 ? 1 : 0);
3e55845c3983d9 Likun Gao 2023-04-25  1169  		} else {
3e55845c3983d9 Likun Gao 2023-04-25  1170  			if ((soft_max_level >= single_dpm_table->count) ||
3e55845c3983d9 Likun Gao 2023-04-25  1171  			    (soft_min_level >= single_dpm_table->count))
3e55845c3983d9 Likun Gao 2023-04-25  1172  				return -EINVAL;
3e55845c3983d9 Likun Gao 2023-04-25  1173  		}
3e55845c3983d9 Likun Gao 2023-04-25  1174  
3e55845c3983d9 Likun Gao 2023-04-25 @1175  		min_freq = single_dpm_table->dpm_levels[soft_min_level].value;
3e55845c3983d9 Likun Gao 2023-04-25  1176  		max_freq = single_dpm_table->dpm_levels[soft_max_level].value;
3e55845c3983d9 Likun Gao 2023-04-25  1177  
3e55845c3983d9 Likun Gao 2023-04-25  1178  		ret = smu_v14_0_set_soft_freq_limited_range(smu,
3e55845c3983d9 Likun Gao 2023-04-25  1179  							    clk_type,
3e55845c3983d9 Likun Gao 2023-04-25  1180  							    min_freq,
3e55845c3983d9 Likun Gao 2023-04-25  1181  							    max_freq);
3e55845c3983d9 Likun Gao 2023-04-25  1182  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1183  	case SMU_DCEFCLK:
3e55845c3983d9 Likun Gao 2023-04-25  1184  	case SMU_PCIE:
3e55845c3983d9 Likun Gao 2023-04-25  1185  	default:
3e55845c3983d9 Likun Gao 2023-04-25  1186  		break;
3e55845c3983d9 Likun Gao 2023-04-25  1187  	}
3e55845c3983d9 Likun Gao 2023-04-25  1188  
3e55845c3983d9 Likun Gao 2023-04-25  1189  	return ret;
3e55845c3983d9 Likun Gao 2023-04-25  1190  }
3e55845c3983d9 Likun Gao 2023-04-25  1191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
