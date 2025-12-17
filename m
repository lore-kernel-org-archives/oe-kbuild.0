Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450633858E
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765992252; cv=none; b=fQTJ/ai5lybsrgEx3kSZgsqNSkXe9YYfeB+bRuhjJPAWvx137QnRh2BD13bhKyiUeb2K3x6NuR+ARnIIFZHPiNZaVNzgGTskzCKPUTX4QNSumO1+uK7AdPFJo+jcTdhrJYmeRUCGEhm55w4GOsBYWoDBSLH9etf6Yiq6cNgyw0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765992252; c=relaxed/simple;
	bh=31Txs25GvLP34jFqYZ7HVFn4B8ENwxhZKIxoj2h5pQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPWDTizgW47v94WIK6XcIFZeMPtypOTfrE9hVqnuFxMEVkfKmBuqFhB0MwJAFVcBsag14GNPgoaWJuI3/g5Zuonx3lpxgCo4X43jgPzTGxik4zFye/YX3N3W9LgVTDrg8lNhC3TVSw1DMXTKA1+kkw/yrtdTf358DZuVj+WJF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=by3ylYX5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="by3ylYX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765992246; x=1797528246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=31Txs25GvLP34jFqYZ7HVFn4B8ENwxhZKIxoj2h5pQE=;
  b=by3ylYX5Axws9TkP3X0nm3UNQZIWhEQobxCr/JIyu/KYp6Nybq1D9CB+
   3tiKt0J4PQNqvGf2Xz9Vl21XxH57nnzHXYAzfRdem6+qN2Fg4XdUErapy
   tEcgT0xlh4qNftrrzKVtHXSuSM24cwfZmkNk+uIvgvzO2RUBr3MXipXRH
   VbLm2c7CxcJxr62Ht77wKJtSTB0x8XjIOAwpIxShUXvXVCJN5nQEz9qo0
   ZtyjVqc5LiW6sL6pj9ZBrvH5Hpy3CEDgH8InL+rDRBcaG14rcaMO4UrwR
   jYzvAuA3aku+p8foMHQEm6KviYp0oq5buaDtbK7aq0iuIYNY1izrP3Uvb
   Q==;
X-CSE-ConnectionGUID: n91ENVoqQM6tzg8XKGUAOA==
X-CSE-MsgGUID: eNNXMu/yR8mhQzjUPf1Pww==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="70514948"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="70514948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 09:24:03 -0800
X-CSE-ConnectionGUID: pDJDP1xvQaSNmrs4quzgWg==
X-CSE-MsgGUID: YxlIdjl4SU2AfomMm8qNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="199173346"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2025 09:24:02 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVvFn-0000000011m-49RP;
	Wed, 17 Dec 2025 17:23:59 +0000
Date: Thu, 18 Dec 2025 01:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527
 iwl_trans_pcie_dump_monitor() error: we previously assumed
 'trans->dbg.dest_tlv' could be null (see line 3512)
Message-ID: <202512180128.QbBiA5Gb-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: c8a00a6e89ffee419a9190d2af9c75a7afe196d2 wifi: iwlwifi: pcie: move generation specific files to a folder
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r073-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180128.QbBiA5Gb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512180128.QbBiA5Gb-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527 iwl_trans_pcie_dump_monitor() error: we previously assumed 'trans->dbg.dest_tlv' could be null (see line 3512)
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/tx.c:723 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'

vim +3527 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c

7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3503  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3504  static u32
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3505  iwl_trans_pcie_dump_monitor(struct iwl_trans *trans,
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3506  			    struct iwl_fw_error_dump_data **data,
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3507  			    u32 monitor_len)
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3508  {
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3509  	struct iwl_dram_data *fw_mon = &trans->dbg.fw_mon;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3510  	u32 len = 0;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3511  
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3512  	if (trans->dbg.dest_tlv ||
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3513  	    (fw_mon->size &&
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3514  	     (trans->mac_cfg->device_family == IWL_DEVICE_FAMILY_7000 ||
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3515  	      trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210))) {
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3516  		struct iwl_fw_error_dump_fw_mon *fw_mon_data;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3517  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3518  		(*data)->type = cpu_to_le32(IWL_FW_ERROR_DUMP_FW_MONITOR);
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3519  		fw_mon_data = (void *)(*data)->data;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3520  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3521  		iwl_trans_pcie_dump_pointers(trans, fw_mon_data);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3522  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3523  		len += sizeof(**data) + sizeof(*fw_mon_data);
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3524  		if (fw_mon->size) {
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3525  			memcpy(fw_mon_data->data, fw_mon->block, fw_mon->size);
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3526  			monitor_len = fw_mon->size;
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3527  		} else if (trans->dbg.dest_tlv->monitor_mode == SMEM_MODE) {
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3528  			u32 base = le32_to_cpu(fw_mon_data->fw_mon_base_ptr);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3529  			/*
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3530  			 * Update pointers to reflect actual values after
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3531  			 * shifting
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3532  			 */
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3533  			if (trans->dbg.dest_tlv->version) {
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3534  				base = (iwl_read_prph(trans, base) &
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3535  					IWL_LDBG_M2S_BUF_BA_MSK) <<
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3536  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3537  				base *= IWL_M2S_UNIT_SIZE;
857ecb8524020d drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3538  				base += trans->mac_cfg->base->smem_offset;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3539  			} else {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3540  				base = iwl_read_prph(trans, base) <<
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3541  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3542  			}
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3543  
332fbf871d44cc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-02  3544  			iwl_trans_pcie_read_mem(trans, base, fw_mon_data->data,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3545  						monitor_len / sizeof(u32));
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3546  		} else if (trans->dbg.dest_tlv->monitor_mode == MARBH_MODE) {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3547  			monitor_len =
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3548  				iwl_trans_pci_dump_marbh_monitor(trans,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3549  								 fw_mon_data,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3550  								 monitor_len);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3551  		} else {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3552  			/* Didn't match anything - output no monitor data */
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3553  			monitor_len = 0;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3554  		}
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3555  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3556  		len += monitor_len;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3557  		(*data)->len = cpu_to_le32(monitor_len + sizeof(*fw_mon_data));
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3558  	}
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3559  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3560  	return len;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3561  }
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3562  

:::::: The code at line 3527 was first introduced by commit
:::::: 91c28b83da21624dabd1ee9e9c35e2747d6a9563 iwlwifi: dbg: move trans debug fields to a separate struct

:::::: TO: Shahar S Matityahu <shahar.s.matityahu@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
