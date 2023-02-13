Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E484BA31
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676331340; x=1707867340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZUs3Wdn0gXVehN2td8mNiO24gHIIPDKOgsI+74oTeI=;
  b=nzKH1YsGZ04D2qImEcBCS+tS6cii2kehEfaB8o2nxBgHwNsYyZuIhqgr
   NMIy0SmolFpaLVDHKoAcubkp+SZCYaPixw59OOEQgSLquhMoGCWsrV0OX
   wLhEjzJZV8g/oHUx5rE8N0q8uabsio37AFQMA39odLbcBGDMaFHAnZWUO
   EPayuGqk6t895Vb2yExrxOX3nLhsOAIdQuWZLf+rVkFSGSzcTWRCbN1KF
   2E0CFAvUm8Fl+aByKdXWOSKPlLsy2I1UC9v4kyszbvCpYGromPrzYuYfD
   EaW2ONAZCDrfcjKm98OmDjYaNF617pu5FIWoDAVRpgyOV8OaczBYZ0kMj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="331029612"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="331029612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757773665"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="757773665"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Feb 2023 15:35:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRiME-00084H-0j;
	Mon, 13 Feb 2023 23:35:38 +0000
Date: Tue, 14 Feb 2023 07:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1151
 iwl_read_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202302140737.zA6OSpvw-lkp@intel.com>
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
TO: Matt Chen <matt.chen@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b408817d48840847c00052ae0e02a54311913073
commit: e8e10a37c51c08b99d272b2e1b3ef70fcd38f9e8 iwlwifi: acpi: move ppag code from mvm to fw/acpi
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140737.zA6OSpvw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302140737.zA6OSpvw-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1151 iwl_read_ppag_table() error: buffer overflow 'gain' 11 <= 21

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:579 iwl_sar_get_wrds_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:595 iwl_sar_get_wrds_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:611 iwl_sar_get_wrds_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:668 iwl_sar_get_ewrd_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:684 iwl_sar_get_ewrd_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:700 iwl_sar_get_ewrd_table() warn: passing zero to 'PTR_ERR'
drivers/net/wireless/intel/iwlwifi/fw/acpi.c:1153 iwl_read_ppag_table() error: buffer overflow 'gain' 11 <= 21

vim +/gain +1151 drivers/net/wireless/intel/iwlwifi/fw/acpi.c

e8e10a37c51c08 Matt Chen 2022-03-04  1097  
e8e10a37c51c08 Matt Chen 2022-03-04  1098  int iwl_read_ppag_table(struct iwl_fw_runtime *fwrt, union iwl_ppag_table_cmd *cmd,
e8e10a37c51c08 Matt Chen 2022-03-04  1099  			int *cmd_size)
e8e10a37c51c08 Matt Chen 2022-03-04  1100  {
e8e10a37c51c08 Matt Chen 2022-03-04  1101          u8 cmd_ver;
e8e10a37c51c08 Matt Chen 2022-03-04  1102          int i, j, num_sub_bands;
e8e10a37c51c08 Matt Chen 2022-03-04  1103          s8 *gain;
e8e10a37c51c08 Matt Chen 2022-03-04  1104  
e8e10a37c51c08 Matt Chen 2022-03-04  1105          if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_PPAG)) {
e8e10a37c51c08 Matt Chen 2022-03-04  1106                  IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04  1107                                  "PPAG capability not supported by FW, command not sent.\n");
e8e10a37c51c08 Matt Chen 2022-03-04  1108                  return -EINVAL;
e8e10a37c51c08 Matt Chen 2022-03-04  1109          }
e8e10a37c51c08 Matt Chen 2022-03-04  1110          if (!fwrt->ppag_flags) {
e8e10a37c51c08 Matt Chen 2022-03-04  1111                  IWL_DEBUG_RADIO(fwrt, "PPAG not enabled, command not sent.\n");
e8e10a37c51c08 Matt Chen 2022-03-04  1112                  return -EINVAL;
e8e10a37c51c08 Matt Chen 2022-03-04  1113          }
e8e10a37c51c08 Matt Chen 2022-03-04  1114  
e8e10a37c51c08 Matt Chen 2022-03-04  1115          /* The 'flags' field is the same in v1 and in v2 so we can just
e8e10a37c51c08 Matt Chen 2022-03-04  1116           * use v1 to access it.
e8e10a37c51c08 Matt Chen 2022-03-04  1117           */
e8e10a37c51c08 Matt Chen 2022-03-04  1118          cmd->v1.flags = cpu_to_le32(fwrt->ppag_flags);
e8e10a37c51c08 Matt Chen 2022-03-04  1119          cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
e8e10a37c51c08 Matt Chen 2022-03-04  1120                                          WIDE_ID(PHY_OPS_GROUP, PER_PLATFORM_ANT_GAIN_CMD),
e8e10a37c51c08 Matt Chen 2022-03-04  1121                                          IWL_FW_CMD_VER_UNKNOWN);
e8e10a37c51c08 Matt Chen 2022-03-04  1122  	if (cmd_ver == 1) {
e8e10a37c51c08 Matt Chen 2022-03-04  1123                  num_sub_bands = IWL_NUM_SUB_BANDS_V1;
e8e10a37c51c08 Matt Chen 2022-03-04  1124                  gain = cmd->v1.gain[0];
e8e10a37c51c08 Matt Chen 2022-03-04  1125                  *cmd_size = sizeof(cmd->v1);
e8e10a37c51c08 Matt Chen 2022-03-04  1126                  if (fwrt->ppag_ver == 1 || fwrt->ppag_ver == 2) {
e8e10a37c51c08 Matt Chen 2022-03-04  1127                          IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04  1128                                          "PPAG table rev is %d but FW supports v1, sending truncated table\n",
e8e10a37c51c08 Matt Chen 2022-03-04  1129                                          fwrt->ppag_ver);
e8e10a37c51c08 Matt Chen 2022-03-04  1130                          cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
e8e10a37c51c08 Matt Chen 2022-03-04  1131  		}
e8e10a37c51c08 Matt Chen 2022-03-04  1132  	} else if (cmd_ver == 2 || cmd_ver == 3) {
e8e10a37c51c08 Matt Chen 2022-03-04  1133                  num_sub_bands = IWL_NUM_SUB_BANDS_V2;
e8e10a37c51c08 Matt Chen 2022-03-04  1134                  gain = cmd->v2.gain[0];
e8e10a37c51c08 Matt Chen 2022-03-04  1135                  *cmd_size = sizeof(cmd->v2);
e8e10a37c51c08 Matt Chen 2022-03-04  1136                  if (fwrt->ppag_ver == 0) {
e8e10a37c51c08 Matt Chen 2022-03-04  1137                          IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04  1138                                          "PPAG table is v1 but FW supports v2, sending padded table\n");
e8e10a37c51c08 Matt Chen 2022-03-04  1139                  } else if (cmd_ver == 2 && fwrt->ppag_ver == 2) {
e8e10a37c51c08 Matt Chen 2022-03-04  1140                          IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04  1141                                          "PPAG table is v3 but FW supports v2, sending partial bitmap.\n");
e8e10a37c51c08 Matt Chen 2022-03-04  1142                          cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
e8e10a37c51c08 Matt Chen 2022-03-04  1143                  }
e8e10a37c51c08 Matt Chen 2022-03-04  1144          } else {
e8e10a37c51c08 Matt Chen 2022-03-04  1145                  IWL_DEBUG_RADIO(fwrt, "Unsupported PPAG command version\n");
e8e10a37c51c08 Matt Chen 2022-03-04  1146                  return -EINVAL;
e8e10a37c51c08 Matt Chen 2022-03-04  1147          }
e8e10a37c51c08 Matt Chen 2022-03-04  1148  
e8e10a37c51c08 Matt Chen 2022-03-04  1149  	for (i = 0; i < IWL_NUM_CHAIN_LIMITS; i++) {
e8e10a37c51c08 Matt Chen 2022-03-04  1150                  for (j = 0; j < num_sub_bands; j++) {
e8e10a37c51c08 Matt Chen 2022-03-04 @1151                          gain[i * num_sub_bands + j] =
e8e10a37c51c08 Matt Chen 2022-03-04  1152                                  fwrt->ppag_chains[i].subbands[j];
e8e10a37c51c08 Matt Chen 2022-03-04  1153                          IWL_DEBUG_RADIO(fwrt,
e8e10a37c51c08 Matt Chen 2022-03-04  1154                                          "PPAG table: chain[%d] band[%d]: gain = %d\n",
e8e10a37c51c08 Matt Chen 2022-03-04  1155                                          i, j, gain[i * num_sub_bands + j]);
e8e10a37c51c08 Matt Chen 2022-03-04  1156                  }
e8e10a37c51c08 Matt Chen 2022-03-04  1157          }
e8e10a37c51c08 Matt Chen 2022-03-04  1158  
e8e10a37c51c08 Matt Chen 2022-03-04  1159  	return 0;
e8e10a37c51c08 Matt Chen 2022-03-04  1160  }
e8e10a37c51c08 Matt Chen 2022-03-04  1161  IWL_EXPORT_SYMBOL(iwl_read_ppag_table);
e8e10a37c51c08 Matt Chen 2022-03-04  1162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
