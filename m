Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A60126BE1
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731838102; cv=none; b=rU7fNXH9XdLJymwzHV3kTc+wRdMUPaBQx3TaU77y8HaOuTB67L4UT1BPTqLyiGx6AyzV8rqejS00iI27JTf/IMBDfW4r96kjSJu0LEAcZaH7AnQXB/qBpTGPvsL1JKx+jmLhcOEurqANx3RaRZoy9XUkBN0+Ra5DJ6t+6qEmZH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731838102; c=relaxed/simple;
	bh=y1E6B/l84w85cx3ri9o0AzwPl4SFR1iH45EVGFOyygg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9UmuGebM+Z/43SMqmv59o4oA50iiNMAccIWKErzObiNw705xhK/PPz39A9Uu82yOxQwg68bSR9QGPhYrC2Qjgfo550ty9CS6EnnNhWFT98GO8tpGvSPSEt++c1c4s7FcoKZjV1feFx5pdMg0DzIbAIjkWEfUVDy32prKYIt0QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHGIkyF+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHGIkyF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731838100; x=1763374100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1E6B/l84w85cx3ri9o0AzwPl4SFR1iH45EVGFOyygg=;
  b=WHGIkyF+SPcBUkOKXP9FMXeNyRQxLp11YZr3MDPQ/VA1UvoXNE7cWUfx
   1oXymXe4gpiwrsA2N9Ioj5LK1yLLDfC6gJzjXDox2uHb3YDmbpnjXLbFF
   pBw0bJgg3V0mRH7314fcdF0KEHDBxtOOFZ6m+MK81Gt3Nbd3OqWvzyns9
   UZTnkhhQhUsX44sv21JQucDV7tkwFKe9mmf3TeZ0VU3NP0Shu2R1UortU
   96DR6iX0/coVVHUKgvG7IxuJZtpaUi31cd/oTgRAhKBp1/bEKQgEiB1KW
   cjlMhaT1yXtwjsfn4RNiknuZaJWDGsOxRtq/HRoK2RA9H9KyWQsWnQgtq
   w==;
X-CSE-ConnectionGUID: oR3QEwmDTgqARnm89BJmwg==
X-CSE-MsgGUID: oZD21KXrStqy++gkZ1LXXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49329544"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="49329544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 02:08:20 -0800
X-CSE-ConnectionGUID: WwIYo8iQSQ2t/thrCMVTZQ==
X-CSE-MsgGUID: 336YxUPsQuaSA3JCiuBadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93892536"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 02:08:19 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCcCW-0001gB-1A;
	Sun, 17 Nov 2024 10:08:16 +0000
Date: Sun, 17 Nov 2024 18:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/fw/regulatory.c:286
 iwl_fill_ppag_table() error: buffer overflow 'gain' 11 <= 21
Message-ID: <202411171847.0REwoxyl-lkp@intel.com>
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
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: 09059c6764a8870ff7515c2d78ecbea7fbcffc23 wifi: iwlwifi: prepare for reading PPAG table from UEFI
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20241115 (https://download.01.org/0day-ci/archive/20241117/202411171847.0REwoxyl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171847.0REwoxyl-lkp@intel.com/

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
