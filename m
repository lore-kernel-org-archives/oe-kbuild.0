Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F553B14AA
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922045; cv=none; b=CjYzqfsSkjYJX+JWX/NE35kIrTlKAsuCQykr56DGiNy4fipg2oqsPjs/g2qgeH+Jie9S3edsrT+EQcZm6rHLPbwXIoR5uUmVRokrVH4nsOEmhxBMt+w5kEJqwA1i5IUOm0bbc1kCzQhX8Y+W2u/AxPBe7mWEVEy5uIeU/ReUQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922045; c=relaxed/simple;
	bh=7Zf1+RUjZDlXHAc7rfBN4HGc45ki4mDR3NZyCGbHAbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RvPA1DPgunFwbf0XM8Q+JQtwEL4sPwyDoAbHG26lJAo0EYHm1ZcB2ndigJAVl0CB3tRRHYGDY3RZ2NG31ssQRNVYpcXHe0ilr4bwlfXAdLcuy3fOaQeWvFsX+aFritG5nYlvREjWjtSSI9ajK9RNSGowcqc37c+dlGf1hpGbYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixYYGwpS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixYYGwpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785922044; x=1817458044;
  h=date:from:to:cc:subject:message-id;
  bh=7Zf1+RUjZDlXHAc7rfBN4HGc45ki4mDR3NZyCGbHAbc=;
  b=ixYYGwpSSN9MrNM9PWSAdUWkROYdWPPKPwkXn4S+9Fxc2Nh9g0Zb8TUn
   FCdx17bfk/suFwDQh+jPoJeKhv3BTSSTgS6mE9gfmhUB930NmzhDz9XIF
   O+4AXfDFIaI4yrWD3Dnxpd2zUVvj9Rxlxxpmp9Q+VgDFxAPa8tzReNeUT
   ZXZWrbiI4v3pejQjmuB3ssfKmoIpnBgGlcSJMP281Mis+Qnc6aP/jc69s
   +GpISeb6eCsIzvpTah2s7NDjRco1g7+2+yH2rkZL0jSRE9wvGeuJx2eu2
   zlz3YOqxjrFBd+AeWfx+IJmoDSlxjgbZ+L3sv+9uUvC92jjlS/GowkoMq
   A==;
X-CSE-ConnectionGUID: hIKjYSXRRPmhBzGumkxatg==
X-CSE-MsgGUID: FXfDm6qOSF2CNrzwscwzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90376100"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90376100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 02:27:23 -0700
X-CSE-ConnectionGUID: yWIbYoj3QoO3xgTqLOxsag==
X-CSE-MsgGUID: DcoxsZDEQzii+AAcNNPp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="299973114"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2026 02:27:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrXuC-00000000C25-0obJ;
	Wed, 05 Aug 2026 09:27:20 +0000
Date: Wed, 05 Aug 2026 17:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527
 iwl_trans_pcie_dump_monitor() error: we previously assumed
 'trans->dbg.dest_tlv' could be null (see line 3512)
Message-ID: <202608051757.N59CZcWz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

Hi Miri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   31996e14bd59840692d6c1c6e41ef878b77a2967
commit: c8a00a6e89ffee419a9190d2af9c75a7afe196d2 wifi: iwlwifi: pcie: move generation specific files to a folder
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051757.N59CZcWz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c8a00a6e89ff ("wifi: iwlwifi: pcie: move generation specific files to a folder")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608051757.N59CZcWz-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527 iwl_trans_pcie_dump_monitor() error: we previously assumed 'trans->dbg.dest_tlv' could be null (see line 3512)
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

vim +3527 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c

7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3503  
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3504  static u32
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3505  iwl_trans_pcie_dump_monitor(struct iwl_trans *trans,
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3506  			    struct iwl_fw_error_dump_data **data,
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3507  			    u32 monitor_len)
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3508  {
69f0e5059b09613 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3509  	struct iwl_dram_data *fw_mon = &trans->dbg.fw_mon;
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3510  	u32 len = 0;
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3511  
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3512  	if (trans->dbg.dest_tlv ||
69f0e5059b09613 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3513  	    (fw_mon->size &&
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3514  	     (trans->mac_cfg->device_family == IWL_DEVICE_FAMILY_7000 ||
c96a36491003d7a drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3515  	      trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210))) {
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3516  		struct iwl_fw_error_dump_fw_mon *fw_mon_data;
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3517  
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3518  		(*data)->type = cpu_to_le32(IWL_FW_ERROR_DUMP_FW_MONITOR);
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3519  		fw_mon_data = (void *)(*data)->data;
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3520  
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3521  		iwl_trans_pcie_dump_pointers(trans, fw_mon_data);
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3522  
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3523  		len += sizeof(**data) + sizeof(*fw_mon_data);
69f0e5059b09613 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3524  		if (fw_mon->size) {
69f0e5059b09613 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3525  			memcpy(fw_mon_data->data, fw_mon->block, fw_mon->size);
69f0e5059b09613 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3526  			monitor_len = fw_mon->size;
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3527  		} else if (trans->dbg.dest_tlv->monitor_mode == SMEM_MODE) {
7a14c23dcdee687 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3528  			u32 base = le32_to_cpu(fw_mon_data->fw_mon_base_ptr);
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3529  			/*
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3530  			 * Update pointers to reflect actual values after
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3531  			 * shifting
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3532  			 */
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3533  			if (trans->dbg.dest_tlv->version) {
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3534  				base = (iwl_read_prph(trans, base) &
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3535  					IWL_LDBG_M2S_BUF_BA_MSK) <<
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3536  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3537  				base *= IWL_M2S_UNIT_SIZE;
857ecb8524020dd drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3538  				base += trans->mac_cfg->base->smem_offset;
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3539  			} else {
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3540  				base = iwl_read_prph(trans, base) <<
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3541  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3542  			}
fd527eb5d229366 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3543  
332fbf871d44cc7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-02  3544  			iwl_trans_pcie_read_mem(trans, base, fw_mon_data->data,
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3545  						monitor_len / sizeof(u32));
91c28b83da21624 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3546  		} else if (trans->dbg.dest_tlv->monitor_mode == MARBH_MODE) {
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3547  			monitor_len =
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3548  				iwl_trans_pci_dump_marbh_monitor(trans,
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3549  								 fw_mon_data,
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3550  								 monitor_len);
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3551  		} else {
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3552  			/* Didn't match anything - output no monitor data */
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3553  			monitor_len = 0;
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3554  		}
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3555  
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3556  		len += monitor_len;
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3557  		(*data)->len = cpu_to_le32(monitor_len + sizeof(*fw_mon_data));
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3558  	}
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3559  
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3560  	return len;
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3561  }
36fb90172688c8e drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3562  

:::::: The code at line 3527 was first introduced by commit
:::::: 91c28b83da21624dabd1ee9e9c35e2747d6a9563 iwlwifi: dbg: move trans debug fields to a separate struct

:::::: TO: Shahar S Matityahu <shahar.s.matityahu@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
