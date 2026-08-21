Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33993546D3
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347035; cv=none; b=LESsTX9fvRM8gnvztvj2GTq7xQuMCsn1DyA53FZVcfBcKiYxDgYSb6NFnHC3Hnu7ttimdIk4KnQHiCmQfwnMFneVjECSEPYg2eOFYfyYu97isKMDQA4nOrpmi2TUMaCdTm3i5qwVQ7zx5rBlcB+r/qmqKpJ3waEAOeFa+29ChoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347035; c=relaxed/simple;
	bh=m9Tfl8FftYKzjR+M0J4ru7rgPqMRdFIWHHJrJHV0StE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uj8DMzlJl1YjBBXHuhV+5QolnqAQ0lC/eWK4FfFEbYWPI/sQ4qlDYDPinuX5JTAaqQrsGSARxrd3YMwK3lgO1oZp41gyHHjZoSotHwhQyMxVBYV8Eell2ieEynPcXPX2moTNRtFckMBvlLG/j0nTBpnQ0bDleoFAjriaKHbuOnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndbMs6Za; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndbMs6Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347034; x=1818883034;
  h=date:from:to:cc:subject:message-id;
  bh=m9Tfl8FftYKzjR+M0J4ru7rgPqMRdFIWHHJrJHV0StE=;
  b=ndbMs6Za1WFWlB/1i2HVqTEeUqhJVL8+dxkCNYYnbOh+/EGMaGtVgwwm
   jd5sxtRuwCEc9h9a+129hfdT6svUcb2cbCP2obib+H8gPmVV2wFwb813h
   /SrpKqx5jocpQiif3HM0sVI6rSPZLS/aBbWRF+AEEB9UJ5ggx9bM+DLt2
   Ipsvw+tX8UUlBtbbYtEJOtZZe0cfYMYIYZUV8V5aMQUOjGOPERMWPNZ00
   3FE/buQzeDHnEAC3JsxNBomJceQ5IHHVux/2vy/Jx0xDCw9h43QL9RH8Z
   6+rAELb6lcg1YxVz2IkSq4c1/4pGJvteijFjbtAoLOb8o0y+49NchKaeG
   w==;
X-CSE-ConnectionGUID: /qHvoVIgTBWECZvj8niCGQ==
X-CSE-MsgGUID: wne1DJoxRxCIQFl28nhegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="86849676"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="86849676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:17:11 -0700
X-CSE-ConnectionGUID: wAsV8T3wTxuaF7oTDmWBow==
X-CSE-MsgGUID: jbWvSqCvTRG0I9a3bGVZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263185925"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2026 14:17:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWbr-00000000qTv-0DGD;
	Fri, 21 Aug 2026 21:17:07 +0000
Date: Sat, 22 Aug 2026 05:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1153
 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202608220536.XZXJmRAK-lkp@intel.com>
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
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: 1a7d1830be843af332081833223f4be536c00e3b wifi: iwlwifi: bring iwl_fill_ppag_table to the iwlmvm
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260822/202608220536.XZXJmRAK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1a7d1830be84 ("wifi: iwlwifi: bring iwl_fill_ppag_table to the iwlmvm")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608220536.XZXJmRAK-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1153 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:757 iwl_run_init_mvm_ucode() error: we previously assumed 'mvm->nvm_data' could be null (see line 742)
drivers/net/wireless/intel/iwlwifi/mvm/fw.c:1155 iwl_mvm_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

vim +/gain +1153 drivers/net/wireless/intel/iwlwifi/mvm/fw.c

1a7d1830be843af Emmanuel Grumbach 2026-03-19  1051  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1052  static int iwl_mvm_fill_ppag_table(struct iwl_fw_runtime *fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1053  				   union iwl_ppag_table_cmd *cmd,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1054  				   int *cmd_size)
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1055  {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1056  	u8 cmd_ver;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1057  	int i, j, num_sub_bands;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1058  	s8 *gain;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1059  	bool send_ppag_always;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1060  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1061  	/* many firmware images for JF lie about this */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1062  	if (CSR_HW_RFID_TYPE(fwrt->trans->info.hw_rf_id) ==
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1063  	    CSR_HW_RFID_TYPE(CSR_HW_RF_ID_TYPE_JF))
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1064  		return -EOPNOTSUPP;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1065  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1066  	if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_PPAG)) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1067  		IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1068  				"PPAG capability not supported by FW, command not sent.\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1069  		return -EINVAL;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1070  	}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1071  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1072  	cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1073  					WIDE_ID(PHY_OPS_GROUP,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1074  						PER_PLATFORM_ANT_GAIN_CMD), 1);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1075  	/*
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1076  	 * Starting from ver 4, driver needs to send the PPAG CMD regardless
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1077  	 * if PPAG is enabled/disabled or valid/invalid.
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1078  	 */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1079  	send_ppag_always = cmd_ver > 3;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1080  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1081  	/* Don't send PPAG if it is disabled */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1082  	if (!send_ppag_always && !fwrt->ppag_flags) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1083  		IWL_DEBUG_RADIO(fwrt, "PPAG not enabled, command not sent.\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1084  		return -EINVAL;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1085  	}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1086  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1087  	IWL_DEBUG_RADIO(fwrt, "PPAG cmd ver is %d\n", cmd_ver);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1088  	if (cmd_ver == 1) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1089  		num_sub_bands = IWL_NUM_SUB_BANDS_V1;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1090  		gain = cmd->v1.gain[0];
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1091  		*cmd_size = sizeof(cmd->v1);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1092  		cmd->v1.flags =
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1093  			cpu_to_le32(fwrt->ppag_flags & IWL_PPAG_CMD_V1_MASK);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1094  		if (fwrt->ppag_bios_rev >= 1) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1095  			/* in this case FW supports revision 0 */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1096  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1097  					"PPAG table rev is %d, send truncated table\n",
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1098  					fwrt->ppag_bios_rev);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1099  		}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1100  	} else if (cmd_ver == 5) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1101  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1102  		gain = cmd->v5.gain[0];
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1103  		*cmd_size = sizeof(cmd->v5);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1104  		cmd->v5.flags =
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1105  			cpu_to_le32(fwrt->ppag_flags & IWL_PPAG_CMD_V5_MASK);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1106  		if (fwrt->ppag_bios_rev == 0) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1107  			/* in this case FW supports revisions 1,2 or 3 */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1108  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1109  					"PPAG table rev is 0, send padded table\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1110  		}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1111  	} else if (cmd_ver == 7) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1112  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1113  		gain = cmd->v7.gain[0];
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1114  		*cmd_size = sizeof(cmd->v7);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1115  		cmd->v7.ppag_config_info.hdr.table_source =
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1116  			fwrt->ppag_bios_source;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1117  		cmd->v7.ppag_config_info.hdr.table_revision =
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1118  			fwrt->ppag_bios_rev;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1119  		cmd->v7.ppag_config_info.value = cpu_to_le32(fwrt->ppag_flags);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1120  	} else {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1121  		IWL_DEBUG_RADIO(fwrt, "Unsupported PPAG command version\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1122  		return -EINVAL;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1123  	}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1124  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1125  	/* ppag mode */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1126  	IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1127  			"PPAG MODE bits were read from bios: %d\n",
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1128  			fwrt->ppag_flags);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1129  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1130  	if (cmd_ver == 1 &&
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1131  	    !fw_has_capa(&fwrt->fw->ucode_capa,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1132  			 IWL_UCODE_TLV_CAPA_PPAG_CHINA_BIOS_SUPPORT)) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1133  		cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1134  		IWL_DEBUG_RADIO(fwrt, "masking ppag China bit\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1135  	} else {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1136  		IWL_DEBUG_RADIO(fwrt, "isn't masking ppag China bit\n");
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1137  	}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1138  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1139  	/* The 'flags' field is the same in v1 and v5 so we can just
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1140  	 * use v1 to access it.
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1141  	 */
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1142  	IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1143  			"PPAG MODE bits going to be sent: %d\n",
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1144  			(cmd_ver < 7) ? le32_to_cpu(cmd->v1.flags) :
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1145  					le32_to_cpu(cmd->v7.ppag_config_info.value));
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1146  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1147  	for (i = 0; i < IWL_NUM_CHAIN_LIMITS; i++) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1148  		for (j = 0; j < num_sub_bands; j++) {
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1149  			if (!send_ppag_always &&
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1150  			    !iwl_mvm_ppag_value_valid(fwrt, i, j))
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1151  				return -EINVAL;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1152  
1a7d1830be843af Emmanuel Grumbach 2026-03-19 @1153  			gain[i * num_sub_bands + j] =
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1154  				fwrt->ppag_chains[i].subbands[j];
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1155  			IWL_DEBUG_RADIO(fwrt,
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1156  					"PPAG table: chain[%d] band[%d]: gain = %d\n",
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1157  					i, j, gain[i * num_sub_bands + j]);
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1158  		}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1159  	}
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1160  
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1161  	return 0;
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1162  }
1a7d1830be843af Emmanuel Grumbach 2026-03-19  1163  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
