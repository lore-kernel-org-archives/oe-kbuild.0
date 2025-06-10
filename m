Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9819A
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749513873; cv=none; b=N5h6w4QmajiOFvji56/aFGTuxRZglKIdZMSIPfZZ39VxGQNmJSWyjy0TJKNTaA+yu7vZ8FpQJbZPLgI2Y9QxEZDuXGOwmS9R1ECDXBFdCACU8P96FiJl1feC90nTiwcZyyIGkc7MoIdR/N4R/TFdjAREcOnSsEeyqsyW4uGjFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749513873; c=relaxed/simple;
	bh=ieD/FZfD1oBJAD8tXUURZflK24oGS16YXuNR2tLsRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYcGFkWaRUIFwzyTLau9UsIZLCoOkMM0Tx6icqS9mcyOYf6zXi5anGSfxepp1HDPA2QNGLzd47gT7bQdX2xTPJW5LnZzYSuCzdWcYcYTUHuCnvNDY/+HE30EquSa4TmLI1to+z+kqutF5NMyYZjTB74HdIcOLKlpXZhIABNBd6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPSJfX3e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPSJfX3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749513872; x=1781049872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ieD/FZfD1oBJAD8tXUURZflK24oGS16YXuNR2tLsRMI=;
  b=IPSJfX3ebBbycUp0Uv31C+loBBfkhWeim5brpfXEP8xZgaO4vrbAEyjV
   NBUwoowUwLRPyQkx9cFxO5fMTeN28M2cWTyyzps+N+6mSJeFk9sPGnYeh
   qGP0PgoG+H+BeJode/MLbIHz7Xlx9oYKxmfa1E+L06r73FvNhKDLsWj3j
   tEjjjJ0/xNj/6eaBXdTQ8qIMYZpCJKaXxrT4L3b0Cygj1WQw8WR2tLS3l
   ibr04/N9l2nh0vJw/4/1gE2ucWNXjto+pvqxyZqLLk0e2XCx2VuzGYe3o
   t6bqLdA2ZD33rw+lWt8rTYvxKl0WlQjXBZ+MMrYrYUpYNgYrRtJjwTToR
   Q==;
X-CSE-ConnectionGUID: h53bzYZWQNeSHsi3+E8rtg==
X-CSE-MsgGUID: 2yM2YWnyQu2PWIKuZaYVig==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69168047"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="69168047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:04:31 -0700
X-CSE-ConnectionGUID: RtAM587QSlC+cmmrRYP8nA==
X-CSE-MsgGUID: aOGkr0+2Q2aZcuNaoGRK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169844024"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 17:04:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOmTb-0007Yd-2w;
	Tue, 10 Jun 2025 00:04:27 +0000
Date: Tue, 10 Jun 2025 08:03:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:624
 iwl_trans_pcie_gen2_start_fw() warn: inconsistent returns
 '&trans_pcie->mutex'.
Message-ID: <202506100707.WAnP5ePA-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: 909e1be6546258efb45993851d51d86862e2e5ee wifi: iwlwifi: implement TOP reset
date:   5 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 5 weeks ago
config: sparc-randconfig-r073-20250608 (https://download.01.org/0day-ci/archive/20250610/202506100707.WAnP5ePA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506100707.WAnP5ePA-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:624 iwl_trans_pcie_gen2_start_fw() warn: inconsistent returns '&trans_pcie->mutex'.

vim +624 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c

25628bc08d4526 Johannes Berg  2021-03-26  485  
eda50cde58de73 Sara Sharon    2016-09-28  486  int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
eda50cde58de73 Sara Sharon    2016-09-28  487  				 const struct fw_img *fw, bool run_in_rfkill)
eda50cde58de73 Sara Sharon    2016-09-28  488  {
eda50cde58de73 Sara Sharon    2016-09-28  489  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
70582b826365d2 Johannes Berg  2023-04-13  490  	bool hw_rfkill, keep_ram_busy;
909e1be6546258 Johannes Berg  2025-04-30  491  	bool top_reset_done = false;
eda50cde58de73 Sara Sharon    2016-09-28  492  	int ret;
eda50cde58de73 Sara Sharon    2016-09-28  493  
909e1be6546258 Johannes Berg  2025-04-30  494  	mutex_lock(&trans_pcie->mutex);
909e1be6546258 Johannes Berg  2025-04-30  495  again:
eda50cde58de73 Sara Sharon    2016-09-28  496  	/* This may fail if AMT took ownership of the device */
eda50cde58de73 Sara Sharon    2016-09-28  497  	if (iwl_pcie_prepare_card_hw(trans)) {
eda50cde58de73 Sara Sharon    2016-09-28  498  		IWL_WARN(trans, "Exit HW not ready\n");
909e1be6546258 Johannes Berg  2025-04-30  499  		ret = -EIO;
909e1be6546258 Johannes Berg  2025-04-30  500  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  501  	}
eda50cde58de73 Sara Sharon    2016-09-28  502  
eda50cde58de73 Sara Sharon    2016-09-28  503  	iwl_enable_rfkill_int(trans);
eda50cde58de73 Sara Sharon    2016-09-28  504  
eda50cde58de73 Sara Sharon    2016-09-28  505  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de73 Sara Sharon    2016-09-28  506  
eda50cde58de73 Sara Sharon    2016-09-28  507  	/*
eda50cde58de73 Sara Sharon    2016-09-28  508  	 * We enabled the RF-Kill interrupt and the handler may very
eda50cde58de73 Sara Sharon    2016-09-28  509  	 * well be running. Disable the interrupts to make sure no other
eda50cde58de73 Sara Sharon    2016-09-28  510  	 * interrupt can be fired.
eda50cde58de73 Sara Sharon    2016-09-28  511  	 */
eda50cde58de73 Sara Sharon    2016-09-28  512  	iwl_disable_interrupts(trans);
eda50cde58de73 Sara Sharon    2016-09-28  513  
eda50cde58de73 Sara Sharon    2016-09-28  514  	/* Make sure it finished running */
eda50cde58de73 Sara Sharon    2016-09-28  515  	iwl_pcie_synchronize_irqs(trans);
eda50cde58de73 Sara Sharon    2016-09-28  516  
eda50cde58de73 Sara Sharon    2016-09-28  517  	/* If platform's RF_KILL switch is NOT set to KILL */
9ad8fd0b4a24e6 Johannes Berg  2017-06-20  518  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de73 Sara Sharon    2016-09-28  519  	if (hw_rfkill && !run_in_rfkill) {
eda50cde58de73 Sara Sharon    2016-09-28  520  		ret = -ERFKILL;
eda50cde58de73 Sara Sharon    2016-09-28  521  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  522  	}
eda50cde58de73 Sara Sharon    2016-09-28  523  
eda50cde58de73 Sara Sharon    2016-09-28  524  	/* Someone called stop_device, don't try to start_fw */
eda50cde58de73 Sara Sharon    2016-09-28  525  	if (trans_pcie->is_down) {
eda50cde58de73 Sara Sharon    2016-09-28  526  		IWL_WARN(trans,
eda50cde58de73 Sara Sharon    2016-09-28  527  			 "Can't start_fw since the HW hasn't been started\n");
eda50cde58de73 Sara Sharon    2016-09-28  528  		ret = -EIO;
eda50cde58de73 Sara Sharon    2016-09-28  529  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  530  	}
eda50cde58de73 Sara Sharon    2016-09-28  531  
eda50cde58de73 Sara Sharon    2016-09-28  532  	/* make sure rfkill handshake bits are cleared */
eda50cde58de73 Sara Sharon    2016-09-28  533  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR, CSR_UCODE_SW_BIT_RFKILL);
eda50cde58de73 Sara Sharon    2016-09-28  534  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR,
eda50cde58de73 Sara Sharon    2016-09-28  535  		    CSR_UCODE_DRV_GP1_BIT_CMD_BLOCKED);
eda50cde58de73 Sara Sharon    2016-09-28  536  
eda50cde58de73 Sara Sharon    2016-09-28  537  	/* clear (again), then enable host interrupts */
eda50cde58de73 Sara Sharon    2016-09-28  538  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de73 Sara Sharon    2016-09-28  539  
eda50cde58de73 Sara Sharon    2016-09-28  540  	ret = iwl_pcie_gen2_nic_init(trans);
eda50cde58de73 Sara Sharon    2016-09-28  541  	if (ret) {
eda50cde58de73 Sara Sharon    2016-09-28  542  		IWL_ERR(trans, "Unable to init nic\n");
eda50cde58de73 Sara Sharon    2016-09-28  543  		goto out;
eda50cde58de73 Sara Sharon    2016-09-28  544  	}
eda50cde58de73 Sara Sharon    2016-09-28  545  
909e1be6546258 Johannes Berg  2025-04-30  546  	if (WARN_ON(trans->do_top_reset &&
909e1be6546258 Johannes Berg  2025-04-30  547  		    trans->trans_cfg->device_family < IWL_DEVICE_FAMILY_SC))
909e1be6546258 Johannes Berg  2025-04-30  548  		return -EINVAL;
909e1be6546258 Johannes Berg  2025-04-30  549  
909e1be6546258 Johannes Berg  2025-04-30  550  	/* we need to wait later - set state */
909e1be6546258 Johannes Berg  2025-04-30  551  	if (trans->do_top_reset)
909e1be6546258 Johannes Berg  2025-04-30  552  		trans_pcie->fw_reset_state = FW_RESET_TOP_REQUESTED;
909e1be6546258 Johannes Berg  2025-04-30  553  
909e1be6546258 Johannes Berg  2025-04-30  554  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
909e1be6546258 Johannes Berg  2025-04-30  555  		if (!top_reset_done) {
909e1be6546258 Johannes Berg  2025-04-30  556  			ret = iwl_pcie_ctxt_info_gen3_alloc(trans, fw);
909e1be6546258 Johannes Berg  2025-04-30  557  			if (ret)
909e1be6546258 Johannes Berg  2025-04-30  558  				goto out;
909e1be6546258 Johannes Berg  2025-04-30  559  		}
909e1be6546258 Johannes Berg  2025-04-30  560  
909e1be6546258 Johannes Berg  2025-04-30  561  		iwl_pcie_ctxt_info_gen3_kick(trans);
909e1be6546258 Johannes Berg  2025-04-30  562  	} else {
97b00d877bb8c2 Johannes Berg  2017-04-19  563  		ret = iwl_pcie_ctxt_info_init(trans, fw);
97b00d877bb8c2 Johannes Berg  2017-04-19  564  		if (ret)
97b00d877bb8c2 Johannes Berg  2017-04-19  565  			goto out;
909e1be6546258 Johannes Berg  2025-04-30  566  	}
eda50cde58de73 Sara Sharon    2016-09-28  567  
70582b826365d2 Johannes Berg  2023-04-13  568  	keep_ram_busy = !iwl_pcie_set_ltr(trans);
25628bc08d4526 Johannes Berg  2021-03-26  569  
595c230b95130b Matti Gottlieb 2021-08-26  570  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
70d400ba7fa71d Johannes Berg  2024-07-29  571  		IWL_DEBUG_POWER(trans, "function scratch register value is 0x%08x\n",
70d400ba7fa71d Johannes Berg  2024-07-29  572  				iwl_read32(trans, CSR_FUNC_SCRATCH));
595c230b95130b Matti Gottlieb 2021-08-26  573  		iwl_write32(trans, CSR_FUNC_SCRATCH, CSR_FUNC_SCRATCH_INIT_VALUE);
9ce041f5966fd0 Johannes Berg  2021-08-02  574  		iwl_set_bit(trans, CSR_GP_CNTRL,
9ce041f5966fd0 Johannes Berg  2021-08-02  575  			    CSR_GP_CNTRL_REG_FLAG_ROM_START);
595c230b95130b Matti Gottlieb 2021-08-26  576  	} else if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
25628bc08d4526 Johannes Berg  2021-03-26  577  		iwl_write_umac_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b Matti Gottlieb 2021-08-26  578  	} else {
25628bc08d4526 Johannes Berg  2021-03-26  579  		iwl_write_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b Matti Gottlieb 2021-08-26  580  	}
25628bc08d4526 Johannes Berg  2021-03-26  581  
70582b826365d2 Johannes Berg  2023-04-13  582  	if (keep_ram_busy)
70582b826365d2 Johannes Berg  2023-04-13  583  		iwl_pcie_spin_for_iml(trans);
70582b826365d2 Johannes Berg  2023-04-13  584  
909e1be6546258 Johannes Berg  2025-04-30  585  	if (trans->do_top_reset) {
909e1be6546258 Johannes Berg  2025-04-30  586  		trans->do_top_reset = 0;
909e1be6546258 Johannes Berg  2025-04-30  587  
909e1be6546258 Johannes Berg  2025-04-30  588  #define FW_TOP_RESET_TIMEOUT	(HZ / 4)
909e1be6546258 Johannes Berg  2025-04-30  589  		ret = wait_event_timeout(trans_pcie->fw_reset_waitq,
909e1be6546258 Johannes Berg  2025-04-30  590  					 trans_pcie->fw_reset_state != FW_RESET_TOP_REQUESTED,
909e1be6546258 Johannes Berg  2025-04-30  591  					 FW_TOP_RESET_TIMEOUT);
909e1be6546258 Johannes Berg  2025-04-30  592  
909e1be6546258 Johannes Berg  2025-04-30  593  		if (trans_pcie->fw_reset_state != FW_RESET_OK) {
909e1be6546258 Johannes Berg  2025-04-30  594  			if (trans_pcie->fw_reset_state != FW_RESET_TOP_REQUESTED)
909e1be6546258 Johannes Berg  2025-04-30  595  				IWL_ERR(trans,
909e1be6546258 Johannes Berg  2025-04-30  596  					"TOP reset interrupted by error (state %d)!\n",
909e1be6546258 Johannes Berg  2025-04-30  597  					trans_pcie->fw_reset_state);
909e1be6546258 Johannes Berg  2025-04-30  598  			else
909e1be6546258 Johannes Berg  2025-04-30  599  				IWL_ERR(trans, "TOP reset timed out!\n");
909e1be6546258 Johannes Berg  2025-04-30  600  			iwl_op_mode_nic_error(trans->op_mode,
909e1be6546258 Johannes Berg  2025-04-30  601  					      IWL_ERR_TYPE_TOP_RESET_FAILED);
909e1be6546258 Johannes Berg  2025-04-30  602  			iwl_trans_schedule_reset(trans,
909e1be6546258 Johannes Berg  2025-04-30  603  						 IWL_ERR_TYPE_TOP_RESET_FAILED);
909e1be6546258 Johannes Berg  2025-04-30  604  			ret = -EIO;
909e1be6546258 Johannes Berg  2025-04-30  605  			goto out;
909e1be6546258 Johannes Berg  2025-04-30  606  		}
909e1be6546258 Johannes Berg  2025-04-30  607  
909e1be6546258 Johannes Berg  2025-04-30  608  		msleep(10);
909e1be6546258 Johannes Berg  2025-04-30  609  		IWL_INFO(trans, "TOP reset successful, reinit now\n");
909e1be6546258 Johannes Berg  2025-04-30  610  		/* now load the firmware again properly */
909e1be6546258 Johannes Berg  2025-04-30  611  		trans_pcie->prph_scratch->ctrl_cfg.control.control_flags &=
909e1be6546258 Johannes Berg  2025-04-30  612  			~cpu_to_le32(IWL_PRPH_SCRATCH_TOP_RESET);
909e1be6546258 Johannes Berg  2025-04-30  613  		top_reset_done = true;
909e1be6546258 Johannes Berg  2025-04-30  614  		goto again;
909e1be6546258 Johannes Berg  2025-04-30  615  	}
909e1be6546258 Johannes Berg  2025-04-30  616  
eda50cde58de73 Sara Sharon    2016-09-28  617  	/* re-check RF-Kill state since we may have missed the interrupt */
9ad8fd0b4a24e6 Johannes Berg  2017-06-20  618  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de73 Sara Sharon    2016-09-28  619  	if (hw_rfkill && !run_in_rfkill)
eda50cde58de73 Sara Sharon    2016-09-28  620  		ret = -ERFKILL;
eda50cde58de73 Sara Sharon    2016-09-28  621  
eda50cde58de73 Sara Sharon    2016-09-28  622  out:
eda50cde58de73 Sara Sharon    2016-09-28  623  	mutex_unlock(&trans_pcie->mutex);
eda50cde58de73 Sara Sharon    2016-09-28 @624  	return ret;

:::::: The code at line 624 was first introduced by commit
:::::: eda50cde58de7368f982e3906090fc033ecb9360 iwlwifi: pcie: add context information support

:::::: TO: Sara Sharon <sara.sharon@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
