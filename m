Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F51CD3F
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065093; cv=none; b=X7UxQ6NmBe5qbhIO/f0wVjsD633yvdky3Qb2SLVSCIy3sj7FQ4vGMoUhryy3QJY1OfR9WwYAjm9Vd8sxGrcIOdpiPZeANMFNwI3xtEvOQRGsUxq7Pa30uHdhe7ufqXAc5ciqhYmTfv+Zpig4mKAt8KOqn7qFwtD+jYb9uDLlFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065093; c=relaxed/simple;
	bh=bgaHKD3ZhopknBcZ9iIjEmIXGYHMHGjozsbS1CJ+ngc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kzs4F/03QpoRkAkTfqgRDxH4hiXxTqPzZueuAiIxW32Bw4Wr9Iz+3Z9i79JFxb2kQKNM1kF4aNx4nWVuMsjeOGpT59V+zonpSyLNrHMyY1Vb9sM+at5KS25nMpkWxzIixPE5LVMaXuAf9RjY7hekaLWGcuF98xh4dY0IVTWDga4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5Fl+4+7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5Fl+4+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065092; x=1763601092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bgaHKD3ZhopknBcZ9iIjEmIXGYHMHGjozsbS1CJ+ngc=;
  b=K5Fl+4+7PS9K3Px65iAzUCYU69d8GuvPUiEGjRRMDMIcnuxAuhw71YWX
   4ynJwNhNajJUJ0exVMcheqP5WCiYQ608CNyu3opFUt6U0ywgJA2ZnfhGO
   sgzA8W3iB3bNlkzUL7U2wMdpF6D4qSNh6KHbhPLg6PwHufg0j1nTxv8UE
   KakO09ytGEwcf5VW+KLbjE+wx72Fjq31Jk17gnRHmWUwHkyFueqfoy9VP
   pq5e8xgFcZQ8HizbGFgXh5pyRen3I1oKGj43a/GhdQveRy+em2evbkEAu
   soGq4SihtVqYEwXcLdbp/H4z9egR8wauTg0CwXG9TieRM0T+5Nz7snrT6
   A==;
X-CSE-ConnectionGUID: EK79PBaCRgOsLdYJGM6o/g==
X-CSE-MsgGUID: gRUtfILnTYaXodT9CT3OCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42612942"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="42612942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: 0OrdY5o3T7G7/cZEdku8CQ==
X-CSE-MsgGUID: 5X9buek4SxWK6rLBs434YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="93813515"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000OB-1m;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0_2_ppt.c:1175
 smu_v14_0_2_force_clk_levels() error: buffer overflow
 'single_dpm_table->dpm_levels' 16 <= 31
Message-ID: <202411191621.xwXibNJu-lkp@intel.com>
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
head:   158f238aa69d91ad74e535c73f552bd4b025109c
commit: 3e55845c3983d92e28517a545e403b5eb9acf95b drm/amd/swsmu: add smu v14_0_2 support
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r071-20241118 (https://download.01.org/0day-ci/archive/20241119/202411191621.xwXibNJu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411191621.xwXibNJu-lkp@intel.com/

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
