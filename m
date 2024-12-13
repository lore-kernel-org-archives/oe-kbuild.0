Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F901DF256
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092740; cv=none; b=IOT55w5u45mpU5/WRD8F1uQnNX5KhuzrMlRScV6s1ops/r+Oj9m7zT2rTc/AytPivEp3y2NzJXb896zW6ym5JHrcoJyo/M9JkzftPMpydBsuQJKqoDU+hwucWF2+buGgQjG2b/YarETCrdAizE3mCXRP0Snfu0zLj2elNGBnnWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092740; c=relaxed/simple;
	bh=gmzGjnPwM4nBaPXQxaRLt8vGRO9PbbbkbQsD/1PVJZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WQoWvTrZvMrNQdvOkXZCrRDzAKwCEdNr/BUzorixGgIgbdVyKzMjsCNRejqg0ySGg2bS3LHntSw7TADu3LSyTuYLRt7STqWOkRnoCn1quO1qsuZre6KSq2GxoWPJ9k/H+vwMY0X9ZqKTn7Adl0aHaR9lbkqeF6SOx5DgT0/wQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMUrjUfq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMUrjUfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734092738; x=1765628738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gmzGjnPwM4nBaPXQxaRLt8vGRO9PbbbkbQsD/1PVJZ0=;
  b=OMUrjUfqIpLPGuKNRNdIWQEHgZ7gdgd1rQTePVvnfrdNOIzdh3hoglzc
   o2v8mes18uCn+LP9jzNwUnFRhMAwWsW+zMtUaPTePMm5Ygn4qtJKUrUS6
   1OMIKBqDTLHejMa87ldXpSyZMWez4g4lzP2sZadrXXHo4S0edttaiF08W
   EVQcjcnB/d+710BUBXyaThLPmnmho3SGdC9Lbu9RNqRB8uCMGfwPzR27d
   mAybZzLBsIMyqzdP/kD6vduS5AODH/knetxBFsfSra24QPAfrtQTgKuGC
   0CJ6xjdnrAcOekoBBpmNz6YaNmMWDcJNZMrjE8murUx+UIk9h/V07xUGE
   Q==;
X-CSE-ConnectionGUID: JfgtkziPRyyTXhYCjehwVg==
X-CSE-MsgGUID: s6rfJT4VTKOJr0VvMX5l/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38320417"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="38320417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 04:25:37 -0800
X-CSE-ConnectionGUID: fpSaigROS8utXKdrI34zsw==
X-CSE-MsgGUID: Ss4iXS7KR4em3akd2Lgx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="97082740"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 04:25:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM4jd-000C0x-2A;
	Fri, 13 Dec 2024 12:25:33 +0000
Date: Fri, 13 Dec 2024 20:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:286
 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202412132004.HrilL50h-lkp@intel.com>
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
head:   f932fb9b40749d1c9a539d89bb3e288c077aafe5
commit: 09059c6764a8870ff7515c2d78ecbea7fbcffc23 wifi: iwlwifi: prepare for reading PPAG table from UEFI
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132004.HrilL50h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412132004.HrilL50h-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:286 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:288 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21

vim +/gain +286 drivers/net/wireless/intel/iwlwifi/fw/regulatory.c

09059c6764a8870 Miri Korenblit 2024-01-31  208  
09059c6764a8870 Miri Korenblit 2024-01-31  209  int iwl_fill_ppag_table(struct iwl_fw_runtime *fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  210  			union iwl_ppag_table_cmd *cmd, int *cmd_size)
09059c6764a8870 Miri Korenblit 2024-01-31  211  {
09059c6764a8870 Miri Korenblit 2024-01-31  212  	u8 cmd_ver;
09059c6764a8870 Miri Korenblit 2024-01-31  213  	int i, j, num_sub_bands;
09059c6764a8870 Miri Korenblit 2024-01-31  214  	s8 *gain;
09059c6764a8870 Miri Korenblit 2024-01-31  215  
09059c6764a8870 Miri Korenblit 2024-01-31  216  	/* many firmware images for JF lie about this */
09059c6764a8870 Miri Korenblit 2024-01-31  217  	if (CSR_HW_RFID_TYPE(fwrt->trans->hw_rf_id) ==
09059c6764a8870 Miri Korenblit 2024-01-31  218  	    CSR_HW_RFID_TYPE(CSR_HW_RF_ID_TYPE_JF))
09059c6764a8870 Miri Korenblit 2024-01-31  219  		return -EOPNOTSUPP;
09059c6764a8870 Miri Korenblit 2024-01-31  220  
09059c6764a8870 Miri Korenblit 2024-01-31  221  	if (!fw_has_capa(&fwrt->fw->ucode_capa, IWL_UCODE_TLV_CAPA_SET_PPAG)) {
09059c6764a8870 Miri Korenblit 2024-01-31  222  		IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  223  				"PPAG capability not supported by FW, command not sent.\n");
09059c6764a8870 Miri Korenblit 2024-01-31  224  		return -EINVAL;
09059c6764a8870 Miri Korenblit 2024-01-31  225  	}
09059c6764a8870 Miri Korenblit 2024-01-31  226  
09059c6764a8870 Miri Korenblit 2024-01-31  227  	cmd_ver = iwl_fw_lookup_cmd_ver(fwrt->fw,
09059c6764a8870 Miri Korenblit 2024-01-31  228  					WIDE_ID(PHY_OPS_GROUP,
09059c6764a8870 Miri Korenblit 2024-01-31  229  						PER_PLATFORM_ANT_GAIN_CMD),
09059c6764a8870 Miri Korenblit 2024-01-31  230  					IWL_FW_CMD_VER_UNKNOWN);
09059c6764a8870 Miri Korenblit 2024-01-31  231  	if (!fwrt->ppag_table_valid || (cmd_ver <= 3 && !fwrt->ppag_flags)) {
09059c6764a8870 Miri Korenblit 2024-01-31  232  		IWL_DEBUG_RADIO(fwrt, "PPAG not enabled, command not sent.\n");
09059c6764a8870 Miri Korenblit 2024-01-31  233  		return -EINVAL;
09059c6764a8870 Miri Korenblit 2024-01-31  234  	}
09059c6764a8870 Miri Korenblit 2024-01-31  235  
09059c6764a8870 Miri Korenblit 2024-01-31  236  	/* The 'flags' field is the same in v1 and in v2 so we can just
09059c6764a8870 Miri Korenblit 2024-01-31  237  	 * use v1 to access it.
09059c6764a8870 Miri Korenblit 2024-01-31  238  	 */
09059c6764a8870 Miri Korenblit 2024-01-31  239  	cmd->v1.flags = cpu_to_le32(fwrt->ppag_flags);
09059c6764a8870 Miri Korenblit 2024-01-31  240  
09059c6764a8870 Miri Korenblit 2024-01-31  241  	IWL_DEBUG_RADIO(fwrt, "PPAG cmd ver is %d\n", cmd_ver);
09059c6764a8870 Miri Korenblit 2024-01-31  242  	if (cmd_ver == 1) {
09059c6764a8870 Miri Korenblit 2024-01-31  243  		num_sub_bands = IWL_NUM_SUB_BANDS_V1;
09059c6764a8870 Miri Korenblit 2024-01-31  244  		gain = cmd->v1.gain[0];
09059c6764a8870 Miri Korenblit 2024-01-31  245  		*cmd_size = sizeof(cmd->v1);
09059c6764a8870 Miri Korenblit 2024-01-31  246  		if (fwrt->ppag_ver == 1 || fwrt->ppag_ver == 2) {
09059c6764a8870 Miri Korenblit 2024-01-31  247  			/* in this case FW supports revision 0 */
09059c6764a8870 Miri Korenblit 2024-01-31  248  			IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  249  					"PPAG table rev is %d, send truncated table\n",
09059c6764a8870 Miri Korenblit 2024-01-31  250  					fwrt->ppag_ver);
09059c6764a8870 Miri Korenblit 2024-01-31  251  		}
09059c6764a8870 Miri Korenblit 2024-01-31  252  	} else if (cmd_ver >= 2 && cmd_ver <= 4) {
09059c6764a8870 Miri Korenblit 2024-01-31  253  		num_sub_bands = IWL_NUM_SUB_BANDS_V2;
09059c6764a8870 Miri Korenblit 2024-01-31  254  		gain = cmd->v2.gain[0];
09059c6764a8870 Miri Korenblit 2024-01-31  255  		*cmd_size = sizeof(cmd->v2);
09059c6764a8870 Miri Korenblit 2024-01-31  256  		if (fwrt->ppag_ver == 0) {
09059c6764a8870 Miri Korenblit 2024-01-31  257  			/* in this case FW supports revisions 1 or 2 */
09059c6764a8870 Miri Korenblit 2024-01-31  258  			IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  259  					"PPAG table rev is 0, send padded table\n");
09059c6764a8870 Miri Korenblit 2024-01-31  260  		}
09059c6764a8870 Miri Korenblit 2024-01-31  261  	} else {
09059c6764a8870 Miri Korenblit 2024-01-31  262  		IWL_DEBUG_RADIO(fwrt, "Unsupported PPAG command version\n");
09059c6764a8870 Miri Korenblit 2024-01-31  263  		return -EINVAL;
09059c6764a8870 Miri Korenblit 2024-01-31  264  	}
09059c6764a8870 Miri Korenblit 2024-01-31  265  
09059c6764a8870 Miri Korenblit 2024-01-31  266  	/* ppag mode */
09059c6764a8870 Miri Korenblit 2024-01-31  267  	IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  268  			"PPAG MODE bits were read from bios: %d\n",
09059c6764a8870 Miri Korenblit 2024-01-31  269  			cmd->v1.flags);
09059c6764a8870 Miri Korenblit 2024-01-31  270  	if ((cmd_ver == 1 &&
09059c6764a8870 Miri Korenblit 2024-01-31  271  	     !fw_has_capa(&fwrt->fw->ucode_capa,
09059c6764a8870 Miri Korenblit 2024-01-31  272  			  IWL_UCODE_TLV_CAPA_PPAG_CHINA_BIOS_SUPPORT)) ||
09059c6764a8870 Miri Korenblit 2024-01-31  273  	    (cmd_ver == 2 && fwrt->ppag_ver == 2)) {
09059c6764a8870 Miri Korenblit 2024-01-31  274  		cmd->v1.flags &= cpu_to_le32(IWL_PPAG_ETSI_MASK);
09059c6764a8870 Miri Korenblit 2024-01-31  275  		IWL_DEBUG_RADIO(fwrt, "masking ppag China bit\n");
09059c6764a8870 Miri Korenblit 2024-01-31  276  	} else {
09059c6764a8870 Miri Korenblit 2024-01-31  277  		IWL_DEBUG_RADIO(fwrt, "isn't masking ppag China bit\n");
09059c6764a8870 Miri Korenblit 2024-01-31  278  	}
09059c6764a8870 Miri Korenblit 2024-01-31  279  
09059c6764a8870 Miri Korenblit 2024-01-31  280  	IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  281  			"PPAG MODE bits going to be sent: %d\n",
09059c6764a8870 Miri Korenblit 2024-01-31  282  			cmd->v1.flags);
09059c6764a8870 Miri Korenblit 2024-01-31  283  
09059c6764a8870 Miri Korenblit 2024-01-31  284  	for (i = 0; i < IWL_NUM_CHAIN_LIMITS; i++) {
09059c6764a8870 Miri Korenblit 2024-01-31  285  		for (j = 0; j < num_sub_bands; j++) {
09059c6764a8870 Miri Korenblit 2024-01-31 @286  			gain[i * num_sub_bands + j] =
09059c6764a8870 Miri Korenblit 2024-01-31  287  				fwrt->ppag_chains[i].subbands[j];
09059c6764a8870 Miri Korenblit 2024-01-31  288  			IWL_DEBUG_RADIO(fwrt,
09059c6764a8870 Miri Korenblit 2024-01-31  289  					"PPAG table: chain[%d] band[%d]: gain = %d\n",
09059c6764a8870 Miri Korenblit 2024-01-31  290  					i, j, gain[i * num_sub_bands + j]);
09059c6764a8870 Miri Korenblit 2024-01-31  291  		}
09059c6764a8870 Miri Korenblit 2024-01-31  292  	}
09059c6764a8870 Miri Korenblit 2024-01-31  293  
09059c6764a8870 Miri Korenblit 2024-01-31  294  	return 0;
09059c6764a8870 Miri Korenblit 2024-01-31  295  }
09059c6764a8870 Miri Korenblit 2024-01-31  296  IWL_EXPORT_SYMBOL(iwl_fill_ppag_table);
09059c6764a8870 Miri Korenblit 2024-01-31  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
