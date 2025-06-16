Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A22AE72
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057234; cv=none; b=uZPBFeXpQAAK1QpxpH2oS7PrgDTcjdIOIAU5DwBdWc1ATrJSA+o9DoF1UgV9WvAUCsRFpfYr0AtnxYjrbwUjKns97SuORwKWQGjHeCzbjeEU5pNwqc3SbIFmQW8UgiOPulMim3gVbeznCYromjwGc113swsSyH/KsKFRxDWIGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057234; c=relaxed/simple;
	bh=uLQvhtlNILS/I1zx3OgjSTifV64XAV+Heo2FbkxfEns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jdOat+RcEHWiEC91FSJskP3iHPX21C0aYToQN+VzyfY0MDc5S6V1ZfrxT6yvRCUPSWrgD+FZuwLa8WSe9sgIJ3D6JyJJshcV84KrokEP5LiEKp4jOiWTONLdacqmKp/9Wfey2QYgMDPD6VgfTZFmSmxFyoR5xWRSeG+Z9N4Kz9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKmRbRDM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKmRbRDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750057233; x=1781593233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLQvhtlNILS/I1zx3OgjSTifV64XAV+Heo2FbkxfEns=;
  b=VKmRbRDMKQ8B5nE0ZcGbxKX/3eHGSujGqng0jls+n6nirK/AUMN+XV2t
   Syeqn1/WR10+7B0XM98ykrTdJbLPMYlaBFlYuBy9dq2p6jRzjPTz/rGrc
   HpvDs5c/T/VJHxJRrGg4Z2V/aRBO2u0V039TozytjXvKkVeQImV1IYa/x
   hXcMVz/+iINypfPYCCHRnnhOm+237QsZ5RvD/kGF7PV+naWI3VwCUN/jx
   uUSwO9gMkzIxNOtJj1m9tt9cXBQApmPSbVzV6AYIzwRKpnzsFTewxCoYh
   EXNu9ysPo+eIA0ux1jWKTjVCAZn+mz2T7d8PRJlLsqzUGQt8MfuR4Yz8O
   w==;
X-CSE-ConnectionGUID: HuaWd+QBQsK05r6ALETDUg==
X-CSE-MsgGUID: 6ShpUKRkQrOIEXS1eORhlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69635072"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="69635072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:00:33 -0700
X-CSE-ConnectionGUID: kCM6R7quSoeJ5U7PBFGcgQ==
X-CSE-MsgGUID: BI3w4btRQe2TC1x98qSXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153539543"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2025 00:00:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR3pQ-000EoM-0y;
	Mon, 16 Jun 2025 07:00:24 +0000
Date: Mon, 16 Jun 2025 15:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [iwlwifi-next:next 11/45]
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c:550:2-8:
 preceding lock on line 496
Message-ID: <202506161436.H7OcUVvl-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

Hi Miri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   445241ba367ab74aa5eaa61fdf43551c451c2fe4
commit: aeee73e27f2d2eb8c389e13e99d16618fae55285 [11/45] wifi: iwlwifi: pcie: move generation specific files to a folder
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-103-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161436.H7OcUVvl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506161436.H7OcUVvl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c:550:2-8: preceding lock on line 496

vim +550 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c

25628bc08d4526d drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-03-26  485  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  486  int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
a94d0189961c4e5 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-03  487  				 const struct iwl_fw *fw,
a94d0189961c4e5 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-03  488  				 const struct fw_img *img,
a94d0189961c4e5 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-03  489  				 bool run_in_rfkill)
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  490  {
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  491  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
70582b826365d27 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2023-04-13  492  	bool hw_rfkill, keep_ram_busy;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  493  	bool top_reset_done = false;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  494  	int ret;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  495  
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30 @496  	mutex_lock(&trans_pcie->mutex);
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  497  again:
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  498  	/* This may fail if AMT took ownership of the device */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  499  	if (iwl_pcie_prepare_card_hw(trans)) {
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  500  		IWL_WARN(trans, "Exit HW not ready\n");
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  501  		ret = -EIO;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  502  		goto out;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  503  	}
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  504  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  505  	iwl_enable_rfkill_int(trans);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  506  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  507  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  508  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  509  	/*
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  510  	 * We enabled the RF-Kill interrupt and the handler may very
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  511  	 * well be running. Disable the interrupts to make sure no other
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  512  	 * interrupt can be fired.
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  513  	 */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  514  	iwl_disable_interrupts(trans);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  515  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  516  	/* Make sure it finished running */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  517  	iwl_pcie_synchronize_irqs(trans);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  518  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  519  	/* If platform's RF_KILL switch is NOT set to KILL */
9ad8fd0b4a24e64 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2017-06-20  520  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  521  	if (hw_rfkill && !run_in_rfkill) {
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  522  		ret = -ERFKILL;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  523  		goto out;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  524  	}
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  525  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  526  	/* Someone called stop_device, don't try to start_fw */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  527  	if (trans_pcie->is_down) {
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  528  		IWL_WARN(trans,
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  529  			 "Can't start_fw since the HW hasn't been started\n");
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  530  		ret = -EIO;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  531  		goto out;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  532  	}
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  533  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  534  	/* make sure rfkill handshake bits are cleared */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  535  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR, CSR_UCODE_SW_BIT_RFKILL);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  536  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR,
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  537  		    CSR_UCODE_DRV_GP1_BIT_CMD_BLOCKED);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  538  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  539  	/* clear (again), then enable host interrupts */
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  540  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  541  
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  542  	ret = iwl_pcie_gen2_nic_init(trans);
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  543  	if (ret) {
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  544  		IWL_ERR(trans, "Unable to init nic\n");
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  545  		goto out;
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  546  	}
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  547  
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  548  	if (WARN_ON(trans->do_top_reset &&
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-08  549  		    trans->mac_cfg->device_family < IWL_DEVICE_FAMILY_SC))
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30 @550  		return -EINVAL;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  551  
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  552  	/* we need to wait later - set state */
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  553  	if (trans->do_top_reset)
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  554  		trans_pcie->fw_reset_state = FW_RESET_TOP_REQUESTED;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  555  
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-08  556  	if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  557  		if (!top_reset_done) {
22a67414f4bae22 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Miri Korenblit 2025-05-11  558  			ret = iwl_pcie_ctxt_info_v2_alloc(trans, fw, img);
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  559  			if (ret)
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  560  				goto out;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  561  		}
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  562  
22a67414f4bae22 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Miri Korenblit 2025-05-11  563  		iwl_pcie_ctxt_info_v2_kick(trans);
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  564  	} else {
a94d0189961c4e5 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-03  565  		ret = iwl_pcie_ctxt_info_init(trans, img);
97b00d877bb8c2e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2017-04-19  566  		if (ret)
97b00d877bb8c2e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2017-04-19  567  			goto out;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  568  	}
eda50cde58de736 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Sara Sharon    2016-09-28  569  
70582b826365d27 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2023-04-13  570  	keep_ram_busy = !iwl_pcie_set_ltr(trans);
25628bc08d4526d drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-03-26  571  
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-08  572  	if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
70d400ba7fa71d1 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2024-07-29  573  		IWL_DEBUG_POWER(trans, "function scratch register value is 0x%08x\n",
70d400ba7fa71d1 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2024-07-29  574  				iwl_read32(trans, CSR_FUNC_SCRATCH));
595c230b95130b2 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Matti Gottlieb 2021-08-26  575  		iwl_write32(trans, CSR_FUNC_SCRATCH, CSR_FUNC_SCRATCH_INIT_VALUE);
9ce041f5966fd07 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-08-02  576  		iwl_set_bit(trans, CSR_GP_CNTRL,
9ce041f5966fd07 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-08-02  577  			    CSR_GP_CNTRL_REG_FLAG_ROM_START);
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-05-08  578  	} else if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
25628bc08d4526d drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-03-26  579  		iwl_write_umac_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b2 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Matti Gottlieb 2021-08-26  580  	} else {
25628bc08d4526d drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-03-26  581  		iwl_write_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b2 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Matti Gottlieb 2021-08-26  582  	}
25628bc08d4526d drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2021-03-26  583  
70582b826365d27 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2023-04-13  584  	if (keep_ram_busy)
70582b826365d27 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2023-04-13  585  		iwl_pcie_spin_for_iml(trans);
70582b826365d27 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2023-04-13  586  
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  587  	if (trans->do_top_reset) {
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  588  		trans->do_top_reset = 0;
909e1be6546258e drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c Johannes Berg  2025-04-30  589  

:::::: The code at line 550 was first introduced by commit
:::::: 909e1be6546258efb45993851d51d86862e2e5ee wifi: iwlwifi: implement TOP reset

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
