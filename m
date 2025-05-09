Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DE21C9FD
	for <oe-kbuild@lists.linux.dev>; Fri,  9 May 2025 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775060; cv=none; b=nwFyhfUSL5BseFZsvDJJMb0ierUS5752K9K7Q3DSiO4NmxhX5dtrenyN7m6eBzebhK7lqB8V3zrhzH+RS7M4+06+mbP3KL21ub/epsfDOVJj6lahqJ1jF/6bRUBl5Z4eNKXy6q9iSRzIX8XoNiDR38iVtp+0Nh9E8AKM4cjOxnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775060; c=relaxed/simple;
	bh=ISv8WfQBwhEFH46DVP1bc0rvN+VhH/t74gr1LQjGrTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7/kqbmp1dKIKTO54VmDAyNKNaTZIWQFezJbJ/kYOPf1FfGw1MpdQUlbmROXqTDcJR5wBhFQ72mihk+FupzT03BpdynmCugjKBGPXJJQDx3rTETdMZkDZ4Cxd4E3Zhe7lGv87fxpx9c7aIwaXaF4nMhX+sUg3uwN7/3LHFzeLSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xoz7VZdR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xoz7VZdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746775059; x=1778311059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISv8WfQBwhEFH46DVP1bc0rvN+VhH/t74gr1LQjGrTY=;
  b=Xoz7VZdRIIZ8eCvw6ySkpNkhYKYUSg5s9gEZDvF0JmDiITx7QlINJOVj
   Dw+UFkPVzjTHihkLQWK75KIdlnBVwjjD6DMfG1+jWMrNiIFc/3+1rZhBD
   L0X/XtE4ZZ2xOLCsiBWnyO/5q6rZZ2aToNWQmXmAkTZ2hgf1TfpVCnJD4
   G+RY5b+o0gKfWc38heFzRGeZE5ThLA5St0nhof+vNcYQdGT/taONyWyAJ
   M+kJqKpRlK4EZgP57lpA6RZqxtS5wJzFLkBbQVMJh/HeqzeUOf6bxdWmC
   46a090HIY8vKwmuS81ZIJz/kTfXHld4+yENCHUbQEqUj4/0egM7/8lSqL
   w==;
X-CSE-ConnectionGUID: PKF5jqZ3QDqIrE2/7nYgqQ==
X-CSE-MsgGUID: GfjstVPLSP2L5GXRNGiavg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48743319"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48743319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:17:38 -0700
X-CSE-ConnectionGUID: GkJejVzIRp+SrPrpAAjX7Q==
X-CSE-MsgGUID: CWe3KBDwT9ixDZvUUGVyww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136925332"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 00:17:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDHzC-000BkF-1d;
	Fri, 09 May 2025 07:17:34 +0000
Date: Fri, 9 May 2025 15:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8421/9729]
 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:548:2-8: preceding lock
 on line 494
Message-ID: <202505091533.KNVEEj65-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 909e1be6546258efb45993851d51d86862e2e5ee [8421/9729] wifi: iwlwifi: implement TOP reset
:::::: branch date: 22 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-054-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091533.KNVEEj65-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505091533.KNVEEj65-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c:548:2-8: preceding lock on line 494

vim +548 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c

25628bc08d4526d Johannes Berg  2021-03-26  485  
eda50cde58de736 Sara Sharon    2016-09-28  486  int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
eda50cde58de736 Sara Sharon    2016-09-28  487  				 const struct fw_img *fw, bool run_in_rfkill)
eda50cde58de736 Sara Sharon    2016-09-28  488  {
eda50cde58de736 Sara Sharon    2016-09-28  489  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
70582b826365d27 Johannes Berg  2023-04-13  490  	bool hw_rfkill, keep_ram_busy;
909e1be6546258e Johannes Berg  2025-04-30  491  	bool top_reset_done = false;
eda50cde58de736 Sara Sharon    2016-09-28  492  	int ret;
eda50cde58de736 Sara Sharon    2016-09-28  493  
909e1be6546258e Johannes Berg  2025-04-30 @494  	mutex_lock(&trans_pcie->mutex);
909e1be6546258e Johannes Berg  2025-04-30  495  again:
eda50cde58de736 Sara Sharon    2016-09-28  496  	/* This may fail if AMT took ownership of the device */
eda50cde58de736 Sara Sharon    2016-09-28  497  	if (iwl_pcie_prepare_card_hw(trans)) {
eda50cde58de736 Sara Sharon    2016-09-28  498  		IWL_WARN(trans, "Exit HW not ready\n");
909e1be6546258e Johannes Berg  2025-04-30  499  		ret = -EIO;
909e1be6546258e Johannes Berg  2025-04-30  500  		goto out;
eda50cde58de736 Sara Sharon    2016-09-28  501  	}
eda50cde58de736 Sara Sharon    2016-09-28  502  
eda50cde58de736 Sara Sharon    2016-09-28  503  	iwl_enable_rfkill_int(trans);
eda50cde58de736 Sara Sharon    2016-09-28  504  
eda50cde58de736 Sara Sharon    2016-09-28  505  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de736 Sara Sharon    2016-09-28  506  
eda50cde58de736 Sara Sharon    2016-09-28  507  	/*
eda50cde58de736 Sara Sharon    2016-09-28  508  	 * We enabled the RF-Kill interrupt and the handler may very
eda50cde58de736 Sara Sharon    2016-09-28  509  	 * well be running. Disable the interrupts to make sure no other
eda50cde58de736 Sara Sharon    2016-09-28  510  	 * interrupt can be fired.
eda50cde58de736 Sara Sharon    2016-09-28  511  	 */
eda50cde58de736 Sara Sharon    2016-09-28  512  	iwl_disable_interrupts(trans);
eda50cde58de736 Sara Sharon    2016-09-28  513  
eda50cde58de736 Sara Sharon    2016-09-28  514  	/* Make sure it finished running */
eda50cde58de736 Sara Sharon    2016-09-28  515  	iwl_pcie_synchronize_irqs(trans);
eda50cde58de736 Sara Sharon    2016-09-28  516  
eda50cde58de736 Sara Sharon    2016-09-28  517  	/* If platform's RF_KILL switch is NOT set to KILL */
9ad8fd0b4a24e64 Johannes Berg  2017-06-20  518  	hw_rfkill = iwl_pcie_check_hw_rf_kill(trans);
eda50cde58de736 Sara Sharon    2016-09-28  519  	if (hw_rfkill && !run_in_rfkill) {
eda50cde58de736 Sara Sharon    2016-09-28  520  		ret = -ERFKILL;
eda50cde58de736 Sara Sharon    2016-09-28  521  		goto out;
eda50cde58de736 Sara Sharon    2016-09-28  522  	}
eda50cde58de736 Sara Sharon    2016-09-28  523  
eda50cde58de736 Sara Sharon    2016-09-28  524  	/* Someone called stop_device, don't try to start_fw */
eda50cde58de736 Sara Sharon    2016-09-28  525  	if (trans_pcie->is_down) {
eda50cde58de736 Sara Sharon    2016-09-28  526  		IWL_WARN(trans,
eda50cde58de736 Sara Sharon    2016-09-28  527  			 "Can't start_fw since the HW hasn't been started\n");
eda50cde58de736 Sara Sharon    2016-09-28  528  		ret = -EIO;
eda50cde58de736 Sara Sharon    2016-09-28  529  		goto out;
eda50cde58de736 Sara Sharon    2016-09-28  530  	}
eda50cde58de736 Sara Sharon    2016-09-28  531  
eda50cde58de736 Sara Sharon    2016-09-28  532  	/* make sure rfkill handshake bits are cleared */
eda50cde58de736 Sara Sharon    2016-09-28  533  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR, CSR_UCODE_SW_BIT_RFKILL);
eda50cde58de736 Sara Sharon    2016-09-28  534  	iwl_write32(trans, CSR_UCODE_DRV_GP1_CLR,
eda50cde58de736 Sara Sharon    2016-09-28  535  		    CSR_UCODE_DRV_GP1_BIT_CMD_BLOCKED);
eda50cde58de736 Sara Sharon    2016-09-28  536  
eda50cde58de736 Sara Sharon    2016-09-28  537  	/* clear (again), then enable host interrupts */
eda50cde58de736 Sara Sharon    2016-09-28  538  	iwl_write32(trans, CSR_INT, 0xFFFFFFFF);
eda50cde58de736 Sara Sharon    2016-09-28  539  
eda50cde58de736 Sara Sharon    2016-09-28  540  	ret = iwl_pcie_gen2_nic_init(trans);
eda50cde58de736 Sara Sharon    2016-09-28  541  	if (ret) {
eda50cde58de736 Sara Sharon    2016-09-28  542  		IWL_ERR(trans, "Unable to init nic\n");
eda50cde58de736 Sara Sharon    2016-09-28  543  		goto out;
eda50cde58de736 Sara Sharon    2016-09-28  544  	}
eda50cde58de736 Sara Sharon    2016-09-28  545  
909e1be6546258e Johannes Berg  2025-04-30  546  	if (WARN_ON(trans->do_top_reset &&
909e1be6546258e Johannes Berg  2025-04-30  547  		    trans->trans_cfg->device_family < IWL_DEVICE_FAMILY_SC))
909e1be6546258e Johannes Berg  2025-04-30 @548  		return -EINVAL;
909e1be6546258e Johannes Berg  2025-04-30  549  
909e1be6546258e Johannes Berg  2025-04-30  550  	/* we need to wait later - set state */
909e1be6546258e Johannes Berg  2025-04-30  551  	if (trans->do_top_reset)
909e1be6546258e Johannes Berg  2025-04-30  552  		trans_pcie->fw_reset_state = FW_RESET_TOP_REQUESTED;
909e1be6546258e Johannes Berg  2025-04-30  553  
909e1be6546258e Johannes Berg  2025-04-30  554  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
909e1be6546258e Johannes Berg  2025-04-30  555  		if (!top_reset_done) {
909e1be6546258e Johannes Berg  2025-04-30  556  			ret = iwl_pcie_ctxt_info_gen3_alloc(trans, fw);
909e1be6546258e Johannes Berg  2025-04-30  557  			if (ret)
909e1be6546258e Johannes Berg  2025-04-30  558  				goto out;
909e1be6546258e Johannes Berg  2025-04-30  559  		}
909e1be6546258e Johannes Berg  2025-04-30  560  
909e1be6546258e Johannes Berg  2025-04-30  561  		iwl_pcie_ctxt_info_gen3_kick(trans);
909e1be6546258e Johannes Berg  2025-04-30  562  	} else {
97b00d877bb8c2e Johannes Berg  2017-04-19  563  		ret = iwl_pcie_ctxt_info_init(trans, fw);
97b00d877bb8c2e Johannes Berg  2017-04-19  564  		if (ret)
97b00d877bb8c2e Johannes Berg  2017-04-19  565  			goto out;
909e1be6546258e Johannes Berg  2025-04-30  566  	}
eda50cde58de736 Sara Sharon    2016-09-28  567  
70582b826365d27 Johannes Berg  2023-04-13  568  	keep_ram_busy = !iwl_pcie_set_ltr(trans);
25628bc08d4526d Johannes Berg  2021-03-26  569  
595c230b95130b2 Matti Gottlieb 2021-08-26  570  	if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
70d400ba7fa71d1 Johannes Berg  2024-07-29  571  		IWL_DEBUG_POWER(trans, "function scratch register value is 0x%08x\n",
70d400ba7fa71d1 Johannes Berg  2024-07-29  572  				iwl_read32(trans, CSR_FUNC_SCRATCH));
595c230b95130b2 Matti Gottlieb 2021-08-26  573  		iwl_write32(trans, CSR_FUNC_SCRATCH, CSR_FUNC_SCRATCH_INIT_VALUE);
9ce041f5966fd07 Johannes Berg  2021-08-02  574  		iwl_set_bit(trans, CSR_GP_CNTRL,
9ce041f5966fd07 Johannes Berg  2021-08-02  575  			    CSR_GP_CNTRL_REG_FLAG_ROM_START);
595c230b95130b2 Matti Gottlieb 2021-08-26  576  	} else if (trans->trans_cfg->device_family >= IWL_DEVICE_FAMILY_AX210) {
25628bc08d4526d Johannes Berg  2021-03-26  577  		iwl_write_umac_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b2 Matti Gottlieb 2021-08-26  578  	} else {
25628bc08d4526d Johannes Berg  2021-03-26  579  		iwl_write_prph(trans, UREG_CPU_INIT_RUN, 1);
595c230b95130b2 Matti Gottlieb 2021-08-26  580  	}
25628bc08d4526d Johannes Berg  2021-03-26  581  
70582b826365d27 Johannes Berg  2023-04-13  582  	if (keep_ram_busy)
70582b826365d27 Johannes Berg  2023-04-13  583  		iwl_pcie_spin_for_iml(trans);
70582b826365d27 Johannes Berg  2023-04-13  584  
909e1be6546258e Johannes Berg  2025-04-30  585  	if (trans->do_top_reset) {
909e1be6546258e Johannes Berg  2025-04-30  586  		trans->do_top_reset = 0;
909e1be6546258e Johannes Berg  2025-04-30  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
