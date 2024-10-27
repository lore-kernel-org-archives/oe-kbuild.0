Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D08B168BD
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730000773; cv=none; b=uX0PwMlwzUxHr0VftjDbrcb+sngWMFZ7k8d7NOA1BmQyg/W/FOS7qF93O2qEpoJCATRMMBrwQZf/P2nTmxgK3wfW0R0Sfhv/pWRnWMGS7/lO8tz9XeBl5K27c5nWLjooNXquu+7pl0SsCpXKTxfd4lrNqv5PmQwpgjpkJaFDUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730000773; c=relaxed/simple;
	bh=wuEpsX6rARwGEkvn5hUPX97XTpVe4XKmMTLdo3bKM+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVRVz46GCApHpmkBXa7bkzxVBFUFuykJObWvk/RzmX+aQtFXy/fzedVFcqYdMG8JoBszLZuAImPtRSG8DXQvXpCOYMr2qeerLnN8E/RUiOsBzn/qL3G2JYMxefCB4SvWBAl0zQCtOAQ4CmcaQzUmL4oKSOcxYtLnCy151efx2QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9Lyu7+h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9Lyu7+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730000771; x=1761536771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wuEpsX6rARwGEkvn5hUPX97XTpVe4XKmMTLdo3bKM+A=;
  b=J9Lyu7+hYuN7jcmz43HyPl3gB+eSQdI+fHnLRY3izcrZ7Z5Is1UtgnBD
   HZLmuFO3BO+ctcybjKZBQj5lKSS8hz2TQ51ujOWHeGfPDJjWxpZ3o8ApM
   pknVv8qhI/8p7/NZl/yr/XoZeG3zF8WBDbUP0K140tPA/wYYIr3ddYZLA
   Zv/Unk629O5zg2Asy7cwONK7NlzOc46LD7BWVbI5Jw38dLSLc3lBQ2K0j
   DuER7Gu/Hj/8t6jGYT6kSSwHXYUdteS6cayF/gGHFXwTUPpW2hA5QOLdO
   UcgJ2HytAgc3VJYLHe6RLlHVbN9xU1hRN5s/BkNZbqViX8MUnnvCbrm/N
   g==;
X-CSE-ConnectionGUID: ozMezAbGTVewy4G2IuLB2A==
X-CSE-MsgGUID: SSDqJgOBRsKK4dXECk7S+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29815969"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29815969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:46:08 -0700
X-CSE-ConnectionGUID: I8bXSTiES5Sp1ScBONANIw==
X-CSE-MsgGUID: rTH8yfGbTweTUq2fnYrItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85242933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 20:46:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uE8-000aKa-2f;
	Sun, 27 Oct 2024 03:46:04 +0000
Date: Sun, 27 Oct 2024 11:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:286
 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202410271114.qge0HTuv-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 09059c6764a8870ff7515c2d78ecbea7fbcffc23 wifi: iwlwifi: prepare for reading PPAG table from UEFI
date:   9 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20241026 (https://download.01.org/0day-ci/archive/20241027/202410271114.qge0HTuv-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271114.qge0HTuv-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:286 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:288 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

vim +/gain +286 drivers/net/wireless/intel/iwlwifi/fw/regulatory.c

09059c6764a887 Miri Korenblit 2024-01-31  208  
09059c6764a887 Miri Korenblit 2024-01-31  209  int iwl_fill_ppag_table(struct iwl_fw_runtime *fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  210  			union iwl_ppag_table_cmd *cmd, int *cmd_size)
09059c6764a887 Miri Korenblit 2024-01-31  211  {
09059c6764a887 Miri Korenblit 2024-01-31  212  	u8 cmd_ver;
09059c6764a887 Miri Korenblit 2024-01-31  213  	int i, j, num_sub_bands;
09059c6764a887 Miri Korenblit 2024-01-31  214  	s8 *gain;
09059c6764a887 Miri Korenblit 2024-01-31  215  
09059c6764a887 Miri Korenblit 2024-01-31  216  	/* many firmware images for JF lie about this */
09059c6764a887 Miri Korenblit 2024-01-31  217  	if (CSR_HW_RFID_TYPE(fwrt->trans->hw_rf_id) ==
09059c6764a887 Miri Korenblit 2024-01-31  218  	    CSR_HW_RFID_TYPE(CSR_HW_RF_ID_TYPE_JF))
09059c6764a887 Miri Korenblit 2024-01-31  219  		return -EOPNOTSUPP;
09059c6764a887 Miri Korenblit 2024-01-31  220  
09059c6764a887 Miri Korenblit 2024-01-31  221  	if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_PPAG)) {
09059c6764a887 Miri Korenblit 2024-01-31  222  		IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  223  				"PPAG capability not supported by FW, command not sent.\n");
09059c6764a887 Miri Korenblit 2024-01-31  224  		return -EINVAL;
09059c6764a887 Miri Korenblit 2024-01-31  225  	}
09059c6764a887 Miri Korenblit 2024-01-31  226  
09059c6764a887 Miri Korenblit 2024-01-31  227  	cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
09059c6764a887 Miri Korenblit 2024-01-31  228  					WIDE_ID(PHY_OPS_GROUP,
09059c6764a887 Miri Korenblit 2024-01-31  229  						PER_PLATFORM_ANT_GAIN_CMD),
09059c6764a887 Miri Korenblit 2024-01-31  230  					IWL_FW_CMD_VER_UNKNOWN);
09059c6764a887 Miri Korenblit 2024-01-31  231  	if (!fwrt->ppag_table_valid || (cmd_ver <= 3 && !fwrt->ppag_flags)) {
09059c6764a887 Miri Korenblit 2024-01-31  232  		IWL_DEBUG_RADIO(fwrt, "PPAG not enabled, command not sent.\n");
09059c6764a887 Miri Korenblit 2024-01-31  233  		return -EINVAL;
09059c6764a887 Miri Korenblit 2024-01-31  234  	}
09059c6764a887 Miri Korenblit 2024-01-31  235  
09059c6764a887 Miri Korenblit 2024-01-31  236  	/* The 'flags' field is the same in v1 and in v2 so we can just
09059c6764a887 Miri Korenblit 2024-01-31  237  	 * use v1 to access it.
09059c6764a887 Miri Korenblit 2024-01-31  238  	 */
09059c6764a887 Miri Korenblit 2024-01-31  239  	cmd->v1.flags = cpu_to_le32(fwrt->ppag_flags);
09059c6764a887 Miri Korenblit 2024-01-31  240  
09059c6764a887 Miri Korenblit 2024-01-31  241  	IWL_DEBUG_RADIO(fwrt, "PPAG cmd ver is %d\n", cmd_ver);
09059c6764a887 Miri Korenblit 2024-01-31  242  	if (cmd_ver == 1) {
09059c6764a887 Miri Korenblit 2024-01-31  243  		num_sub_bands = IWL_NUM_SUB_BANDS_V1;
09059c6764a887 Miri Korenblit 2024-01-31  244  		gain = cmd->v1.gain[0];
09059c6764a887 Miri Korenblit 2024-01-31  245  		*cmd_size = sizeof(cmd->v1);
09059c6764a887 Miri Korenblit 2024-01-31  246  		if (fwrt->ppag_ver == 1 || fwrt->ppag_ver == 2) {
09059c6764a887 Miri Korenblit 2024-01-31  247  			/* in this case FW supports revision 0 */
09059c6764a887 Miri Korenblit 2024-01-31  248  			IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  249  					"PPAG table rev is %d, send truncated table\n",
09059c6764a887 Miri Korenblit 2024-01-31  250  					fwrt->ppag_ver);
09059c6764a887 Miri Korenblit 2024-01-31  251  		}
09059c6764a887 Miri Korenblit 2024-01-31  252  	} else if (cmd_ver >= 2 && cmd_ver <= 4) {
09059c6764a887 Miri Korenblit 2024-01-31  253  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
09059c6764a887 Miri Korenblit 2024-01-31  254  		gain = cmd->v2.gain[0];
09059c6764a887 Miri Korenblit 2024-01-31  255  		*cmd_size = sizeof(cmd->v2);
09059c6764a887 Miri Korenblit 2024-01-31  256  		if (fwrt->ppag_ver == 0) {
09059c6764a887 Miri Korenblit 2024-01-31  257  			/* in this case FW supports revisions 1 or 2 */
09059c6764a887 Miri Korenblit 2024-01-31  258  			IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  259  					"PPAG table rev is 0, send padded table\n");
09059c6764a887 Miri Korenblit 2024-01-31  260  		}
09059c6764a887 Miri Korenblit 2024-01-31  261  	} else {
09059c6764a887 Miri Korenblit 2024-01-31  262  		IWL_DEBUG_RADIO(fwrt, "Unsupported PPAG command version\n");
09059c6764a887 Miri Korenblit 2024-01-31  263  		return -EINVAL;
09059c6764a887 Miri Korenblit 2024-01-31  264  	}
09059c6764a887 Miri Korenblit 2024-01-31  265  
09059c6764a887 Miri Korenblit 2024-01-31  266  	/* ppag mode */
09059c6764a887 Miri Korenblit 2024-01-31  267  	IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  268  			"PPAG MODE bits were read from bios: %d\n",
09059c6764a887 Miri Korenblit 2024-01-31  269  			cmd->v1.flags);
09059c6764a887 Miri Korenblit 2024-01-31  270  	if ((cmd_ver == 1 &&
09059c6764a887 Miri Korenblit 2024-01-31  271  	     !fw_has_capa(&fwrt->fw->ucode_capa,
09059c6764a887 Miri Korenblit 2024-01-31  272  			  IWL_UCODE_TLV_CAPA_PPAG_CHINA_BIOS_SUPPORT)) ||
09059c6764a887 Miri Korenblit 2024-01-31  273  	    (cmd_ver == 2 && fwrt->ppag_ver == 2)) {
09059c6764a887 Miri Korenblit 2024-01-31  274  		cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
09059c6764a887 Miri Korenblit 2024-01-31  275  		IWL_DEBUG_RADIO(fwrt, "masking ppag China bit\n");
09059c6764a887 Miri Korenblit 2024-01-31  276  	} else {
09059c6764a887 Miri Korenblit 2024-01-31  277  		IWL_DEBUG_RADIO(fwrt, "isn't masking ppag China bit\n");
09059c6764a887 Miri Korenblit 2024-01-31  278  	}
09059c6764a887 Miri Korenblit 2024-01-31  279  
09059c6764a887 Miri Korenblit 2024-01-31  280  	IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  281  			"PPAG MODE bits going to be sent: %d\n",
09059c6764a887 Miri Korenblit 2024-01-31  282  			cmd->v1.flags);
09059c6764a887 Miri Korenblit 2024-01-31  283  
09059c6764a887 Miri Korenblit 2024-01-31  284  	for (i = 0; i < IWL_NUM_CHAIN_LIMITS; i++) {
09059c6764a887 Miri Korenblit 2024-01-31  285  		for (j = 0; j < num_sub_bands; j++) {
09059c6764a887 Miri Korenblit 2024-01-31 @286  			gain[i * num_sub_bands + j] =
09059c6764a887 Miri Korenblit 2024-01-31  287  				fwrt->ppag_chains[i].subbands[j];
09059c6764a887 Miri Korenblit 2024-01-31  288  			IWL_DEBUG_RADIO(fwrt,
09059c6764a887 Miri Korenblit 2024-01-31  289  					"PPAG table: chain[%d] band[%d]: gain = %d\n",
09059c6764a887 Miri Korenblit 2024-01-31  290  					i, j, gain[i * num_sub_bands + j]);
09059c6764a887 Miri Korenblit 2024-01-31  291  		}
09059c6764a887 Miri Korenblit 2024-01-31  292  	}
09059c6764a887 Miri Korenblit 2024-01-31  293  
09059c6764a887 Miri Korenblit 2024-01-31  294  	return 0;
09059c6764a887 Miri Korenblit 2024-01-31  295  }
09059c6764a887 Miri Korenblit 2024-01-31  296  IWL_EXPORT_SYMBOL(iwl_fill_ppag_table);
09059c6764a887 Miri Korenblit 2024-01-31  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
