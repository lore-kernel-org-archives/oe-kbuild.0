Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89137F339
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 20:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515872; cv=none; b=Qs1rf06QzNMbQW5j/orUcwD75NeZi4pfLywceXsW5fp9lUfxZINAHi8rcHLQT5bGKJSqHMV/8Qs3Bg86tudg3v3c5Kc3bf7PfvGHtH9N89JuzyWRCITwzXj7NodPlAlxiGsOx4DkHXeaV9Nlh+097xaVFOp6Y3+JnEhpHlxmU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515872; c=relaxed/simple;
	bh=CuKHslUZI8L15t7gvpPvGOZzEkpX+ExYd7pMyRF4GRA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LrTUkjdySK2JCTHl9m7WVm5L8rxUkPl823bfri+e/IpCl5kuq2R/4/l01VYTnW2RjIxjIL3ahqylNOkWdvetxP5kqFzdI8NepPktH4+X31up5kiBq4tfuPWiU3yaj3qMLiD/84o8m3Gv35kOdsKjj32SQIUb+a+rCgkVEh1z08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkQLFWgd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkQLFWgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787515868; x=1819051868;
  h=date:from:to:cc:subject:message-id;
  bh=CuKHslUZI8L15t7gvpPvGOZzEkpX+ExYd7pMyRF4GRA=;
  b=DkQLFWgdeLfFwiIQLJn1t5LspiZqCPfxz5fvmsHiCubXLKSQrjWJcvSR
   CFzPahALs7/tyIKx/KJ/zBLLCKeT37T/KVNcZF2DXf44T4BRi+o/WHlFG
   I5TN8lgisWvUKnJMBlCf7/KM1iaoRQv+HAEDS46VoE2IJ9kWLIC4C5v6X
   dv/0XY2m9HxXp+Ph7+HTUySCs91O+rgI7OjwxYUcWfRh2zmCXlDhCnoag
   Q0kuBr5CF8FNFK3Jh54HknIX0t0EjUOulG5bvBD4jeDY242lFkfW2Y2Km
   RtolRZlTvvfd+nzCfKuelPcbwb8kv6gTPzfouGAgyhT5u7DFvUZxm8jMC
   Q==;
X-CSE-ConnectionGUID: ZJPZDI4GRraNtiTrV3XZdA==
X-CSE-MsgGUID: VWo5aU5wSYaNIzryaXo5zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87089224"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87089224"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 13:11:07 -0700
X-CSE-ConnectionGUID: P8WaAqNLQkyCesubtbCx2A==
X-CSE-MsgGUID: pi8XvWa+S0WFEXcpwNBeow==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Aug 2026 13:11:06 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyEWy-0000000017V-0Ho1;
	Sun, 23 Aug 2026 20:11:01 +0000
Date: Mon, 24 Aug 2026 04:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1153
 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202608240353.uU7dcs7f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2709dd5ae32f0828f386327c76bba9f39f63a1c6
commit: 1a7d1830be843af332081833223f4be536c00e3b wifi: iwlwifi: bring iwl_fill_ppag_table to the iwlmvm
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260824/202608240353.uU7dcs7f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1a7d1830be84 ("wifi: iwlwifi: bring iwl_fill_ppag_table to the iwlmvm")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608240353.uU7dcs7f-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1153 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:757 iwl_run_init_mvm_ucode() error: we previously assumed 'mvm->nvm_data' could be null (see line 742)
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1155 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

vim +/gain +1153 drivers/net/wireless/intel/iwlwifi/mvm/fw.c

1a7d1830be843a Emmanuel Grumbach 2026-03-19  1051  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1052  static int iwl_mvm_fill_ppag_table(struct iwl_fw_runtime *fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1053  				   union iwl_ppag_table_cmd *cmd,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1054  				   int *cmd_size)
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1055  {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1056  	u8 cmd_ver;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1057  	int i, j, num_sub_bands;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1058  	s8 *gain;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1059  	bool send_ppag_always;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1060  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1061  	/* many firmware images for JF lie about this */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1062  	if (CSR_HW_RFID_TYPE(fwrt->trans->info.hw_rf_id) ==
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1063  	    CSR_HW_RFID_TYPE(CSR_HW_RF_ID_TYPE_JF))
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1064  		return -EOPNOTSUPP;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1065  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1066  	if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_PPAG)) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1067  		IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1068  				"PPAG capability not supported by FW, command not sent.\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1069  		return -EINVAL;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1070  	}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1071  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1072  	cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1073  					WIDE_ID(PHY_OPS_GROUP,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1074  						PER_PLATFORM_ANT_GAIN_CMD), 1);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1075  	/*
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1076  	 * Starting from ver 4, driver needs to send the PPAG CMD regardless
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1077  	 * if PPAG is enabled/disabled or valid/invalid.
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1078  	 */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1079  	send_ppag_always = cmd_ver > 3;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1080  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1081  	/* Don't send PPAG if it is disabled */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1082  	if (!send_ppag_always && !fwrt->ppag_flags) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1083  		IWL_DEBUG_RADIO(fwrt, "PPAG not enabled, command not sent.\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1084  		return -EINVAL;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1085  	}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1086  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1087  	IWL_DEBUG_RADIO(fwrt, "PPAG cmd ver is %d\n", cmd_ver);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1088  	if (cmd_ver == 1) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1089  		num_sub_bands = IWL_NUM_SUB_BANDS_V1;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1090  		gain = cmd->v1.gain[0];
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1091  		*cmd_size = sizeof(cmd->v1);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1092  		cmd->v1.flags =
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1093  			cpu_to_le32(fwrt->ppag_flags & IWL_PPAG_CMD_V1_MASK);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1094  		if (fwrt->ppag_bios_rev >= 1) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1095  			/* in this case FW supports revision 0 */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1096  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1097  					"PPAG table rev is %d, send truncated table\n",
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1098  					fwrt->ppag_bios_rev);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1099  		}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1100  	} else if (cmd_ver == 5) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1101  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1102  		gain = cmd->v5.gain[0];
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1103  		*cmd_size = sizeof(cmd->v5);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1104  		cmd->v5.flags =
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1105  			cpu_to_le32(fwrt->ppag_flags & IWL_PPAG_CMD_V5_MASK);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1106  		if (fwrt->ppag_bios_rev == 0) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1107  			/* in this case FW supports revisions 1,2 or 3 */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1108  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1109  					"PPAG table rev is 0, send padded table\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1110  		}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1111  	} else if (cmd_ver == 7) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1112  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1113  		gain = cmd->v7.gain[0];
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1114  		*cmd_size = sizeof(cmd->v7);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1115  		cmd->v7.ppag_config_info.hdr.table_source =
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1116  			fwrt->ppag_bios_source;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1117  		cmd->v7.ppag_config_info.hdr.table_revision =
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1118  			fwrt->ppag_bios_rev;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1119  		cmd->v7.ppag_config_info.value = cpu_to_le32(fwrt->ppag_flags);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1120  	} else {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1121  		IWL_DEBUG_RADIO(fwrt, "Unsupported PPAG command version\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1122  		return -EINVAL;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1123  	}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1124  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1125  	/* ppag mode */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1126  	IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1127  			"PPAG MODE bits were read from bios: %d\n",
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1128  			fwrt->ppag_flags);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1129  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1130  	if (cmd_ver == 1 &&
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1131  	    !fw_has_capa(&fwrt->fw->ucode_capa,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1132  			 IWL_UCODE_TLV_CAPA_PPAG_CHINA_BIOS_SUPPORT)) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1133  		cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1134  		IWL_DEBUG_RADIO(fwrt, "masking ppag China bit\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1135  	} else {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1136  		IWL_DEBUG_RADIO(fwrt, "isn't masking ppag China bit\n");
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1137  	}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1138  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1139  	/* The 'flags' field is the same in v1 and v5 so we can just
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1140  	 * use v1 to access it.
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1141  	 */
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1142  	IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1143  			"PPAG MODE bits going to be sent: %d\n",
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1144  			(cmd_ver < 7) ? le32_to_cpu(cmd->v1.flags) :
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1145  					le32_to_cpu(cmd->v7.ppag_config_info.value));
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1146  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1147  	for (i = 0; i < IWL_NUM_CHAIN_LIMITS; i++) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1148  		for (j = 0; j < num_sub_bands; j++) {
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1149  			if (!send_ppag_always &&
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1150  			    !iwl_mvm_ppag_value_valid(fwrt, i, j))
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1151  				return -EINVAL;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1152  
1a7d1830be843a Emmanuel Grumbach 2026-03-19 @1153  			gain[i * num_sub_bands + j] =
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1154  				fwrt->ppag_chains[i].subbands[j];
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1155  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1156  					"PPAG table: chain[%d] band[%d]: gain = %d\n",
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1157  					i, j, gain[i * num_sub_bands + j]);
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1158  		}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1159  	}
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1160  
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1161  	return 0;
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1162  }
1a7d1830be843a Emmanuel Grumbach 2026-03-19  1163  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
