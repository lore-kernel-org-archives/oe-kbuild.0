Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23663274B2A
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753719760; cv=none; b=K9maL3xJsFoux5ADQ7bUqs/3G+uuc8J2v9HTTtWX+1WDKKSSulwDd36QxpZl3TfVp+0y88yek+I1u4uMN7DZRKApUIjSB1QfGRo73eMgXQ0EIdIK4eKajQijHMtXQ98mf1owy2rD5sRK6LeXk7vZovrU1LMZN7Cxook8TbipJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753719760; c=relaxed/simple;
	bh=qEptmLeQC82EbUtnGAV4bMXmPiPRraPp63om6TA5J10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6TlaBF3ThGAHop+gYKDaJU8kIoSXx8qxID+egwWu330tvS3rBnQJ1GBLp8b6sTHjFLLW5YI/39FNZMhG+u5EGluAEhhpS/OJb6D1Nyuu1qW4SnPoJUcineXgyiJfE5KP/aKIJc3880Kx3wmnpvUVSUePsICA3wCzhZDfu1TEic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRj/p37P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRj/p37P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753719759; x=1785255759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEptmLeQC82EbUtnGAV4bMXmPiPRraPp63om6TA5J10=;
  b=bRj/p37PSmBpnbgDbz7aFRR93pzXXU2S+o9j8i2N6ycq91rYXhpmauWB
   m2U779nnN108LNaBUD6VPxsnaoczO2GqxD7+RbZhv1XdHPTBJWM5oxoq8
   858Lk+ocsnq0OwMv3b7bsNfYOczD7IxI04MYTGh6qIPSea6H2AcLdFoQV
   6FoSFoSmFhcPaYqIrbqJE93sar2wb4nB0Dg6Dj2hkXx3q/sv3Jqv0b5DR
   bfNRsBEIre/A90ZheG8MFubDBmOjv5D8doxSt5dxp6001jAybTkXkxudw
   ELxPiHkcgaWPIyYgSip0bUtXlxRFr90KAmJTYnFBtYD82H7yaqLOukMa+
   A==;
X-CSE-ConnectionGUID: lIw7HdWFQtiKg/OoO2vyjA==
X-CSE-MsgGUID: qAeYfKCqQJOp0wsI1ikUIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67328527"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67328527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 09:22:21 -0700
X-CSE-ConnectionGUID: s9F946m9QjOOl6AjuaOLUg==
X-CSE-MsgGUID: 0hYx02YVSFCFWvnhYl1pdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193305421"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jul 2025 09:22:15 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugQc8-0000Zf-1g;
	Mon, 28 Jul 2025 16:22:12 +0000
Date: Tue, 29 Jul 2025 00:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4107/12680]
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527
 iwl_trans_pcie_dump_monitor() error: we previously assumed
 'trans->dbg.dest_tlv' could be null (see line 3512)
Message-ID: <202507290021.SSOS7V6E-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
commit: c8a00a6e89ffee419a9190d2af9c75a7afe196d2 [4107/12680] wifi: iwlwifi: pcie: move generation specific files to a folder
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-141-20250728 (https://download.01.org/0day-ci/archive/20250729/202507290021.SSOS7V6E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507290021.SSOS7V6E-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:3527 iwl_trans_pcie_dump_monitor() error: we previously assumed 'trans->dbg.dest_tlv' could be null (see line 3512)

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
