Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0013DFC6D
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149583; cv=none; b=WhdFsLjZph6o1ieQ5umISXQ2Hoo7uI30fmVMGbW79ok9oMiWmprODQwI1TlUSRSDdWHq7fZSmaCwtqtZkm7orXnFMiCIlxH+1qLCRTJsFefuKZnuCDXns4AsOm6G+Hbizut56npRpdf5JgbhiGgML3+CKDjZPqCG+YG+/iwqXz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149583; c=relaxed/simple;
	bh=3KRVLE6QFbX+r7lM9wjpSQ15pWdlLOPAIkhcgNv28cI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=snXLuvHmQq2H1iL7J47LHeXjIaUd338aKmpMzNQz0VIVa5vKyThLeL+B7ToZ2aueJr71U9xctiqY/ZwAiUXT9g6URhl4Z4yAUGJYloC/3ziJulN0TSsBp1k5DCd6SKcGE5PTH/GUuHfRe7qrwuPCx4BvS+BzkF4ZPOoEujsH1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/RH9xC2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/RH9xC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791149580; x=1822685580;
  h=date:from:to:cc:subject:message-id;
  bh=3KRVLE6QFbX+r7lM9wjpSQ15pWdlLOPAIkhcgNv28cI=;
  b=O/RH9xC2EOkdmPE4eNcBRXiDHNB988pHeUr4EPzNZut9K3cTZ6IXDaVM
   XXRXI1ros9JQ+LmQy0KL1Sg5fnF7TQQ+nxQq/spd2HEqIH/FmzYRn3nTj
   AxDZlZOQRNiigUtNDhTASpb3oSb2+FZTGahHnCRWtuRuaZAHduCfICOX9
   nbQe8vOebfvllhXowoOJeF21BJM8bB/eksUUJEVepaDcnDLu8NwfqIQ+H
   ktzkBEAhnfe2FbPJIbisdpAdMAC98DDNCI0hFJPP5NA3kx26+8RlT9fbZ
   j5MjdrvtPX1RgykXqnvtKFbnmHyw7mv6JX5WoPZy80Wxcjpnqen0vYg1j
   g==;
X-CSE-ConnectionGUID: oRCBVhgSTQaWAQ7YdIhXrg==
X-CSE-MsgGUID: d4FAyjZPSyeKiAPoAyH+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94311900"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94311900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 14:32:59 -0700
X-CSE-ConnectionGUID: gnFLXKd2TgqA/nMDyBnR5Q==
X-CSE-MsgGUID: 8P0u8K4CT12B0U5y94YCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304622164"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2026 14:32:58 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDTpH-000000000QF-490C;
	Sun, 04 Oct 2026 21:32:55 +0000
Date: Sun, 04 Oct 2026 23:32:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iwlwifi-next:next 48/90]
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c:3352
 iwl_trans_pcie_dump_monitor() error: we previously assumed
 'trans->dbg.dest_tlv' could be null (see line 3337)
Message-ID: <202610042316.UMVEHpYv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>

Hi Miri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   5d017b30f502e20bfb96ba534b1c36f060a06e98
commit: e07ca69f9f6621624e97917f7c2d099fbb6e9467 [48/90] wifi: iwlwifi: Revert "wifi: iwlwifi: pcie: move generation specific files to a folder"
:::::: branch date: 18 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-2200-20261004 (https://download.01.org/0day-ci/archive/20261004/202610042316.UMVEHpYv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610042316.UMVEHpYv-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:3352 iwl_trans_pcie_dump_monitor() error: we previously assumed 'trans->dbg.dest_tlv' could be null (see line 3337)

vim +3352 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3328  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3329  static u32
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3330  iwl_trans_pcie_dump_monitor(struct iwl_trans *trans,
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3331  			    struct iwl_fw_error_dump_data **data,
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3332  			    u32 monitor_len)
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3333  {
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3334  	struct iwl_dram_data *fw_mon = &trans->dbg.fw_mon;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3335  	u32 len = 0;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3336  
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3337  	if (trans->dbg.dest_tlv ||
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3338  	    (fw_mon->size &&
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3339  	     (trans->mac_cfg->device_family == IWL_DEVICE_FAMILY_7000 ||
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3340  	      trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210))) {
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3341  		struct iwl_fw_error_dump_fw_mon *fw_mon_data;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3342  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3343  		(*data)->type = cpu_to_le32(IWL_FW_ERROR_DUMP_FW_MONITOR);
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3344  		fw_mon_data = (void *)(*data)->data;
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3345  
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3346  		iwl_trans_pcie_dump_pointers(trans, fw_mon_data);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3347  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3348  		len += sizeof(**data) + sizeof(*fw_mon_data);
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3349  		if (fw_mon->size) {
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3350  			memcpy(fw_mon_data->data, fw_mon->block, fw_mon->size);
69f0e5059b0961 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-07-22  3351  			monitor_len = fw_mon->size;
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13 @3352  		} else if (trans->dbg.dest_tlv->monitor_mode == SMEM_MODE) {
7a14c23dcdee68 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Sara Sharon        2018-06-13  3353  			u32 base = le32_to_cpu(fw_mon_data->fw_mon_base_ptr);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3354  			/*
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3355  			 * Update pointers to reflect actual values after
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3356  			 * shifting
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3357  			 */
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3358  			if (trans->dbg.dest_tlv->version) {
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3359  				base = (iwl_read_prph(trans, base) &
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3360  					IWL_LDBG_M2S_BUF_BA_MSK) <<
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3361  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3362  				base *= IWL_M2S_UNIT_SIZE;
857ecb8524020d drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-08  3363  				base += trans->mac_cfg->base->smem_offset;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3364  			} else {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3365  				base = iwl_read_prph(trans, base) <<
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3366  				       trans->dbg.dest_tlv->base_shift;
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3367  			}
fd527eb5d22936 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Golan Ben Ami      2017-08-16  3368  
332fbf871d44cc drivers/net/wireless/intel/iwlwifi/pcie/trans.c Johannes Berg      2025-05-02  3369  			iwl_trans_pcie_read_mem(trans, base, fw_mon_data->data,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3370  						monitor_len / sizeof(u32));
91c28b83da2162 drivers/net/wireless/intel/iwlwifi/pcie/trans.c Shahar S Matityahu 2019-05-13  3371  		} else if (trans->dbg.dest_tlv->monitor_mode == MARBH_MODE) {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3372  			monitor_len =
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3373  				iwl_trans_pci_dump_marbh_monitor(trans,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3374  								 fw_mon_data,
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3375  								 monitor_len);
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3376  		} else {
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3377  			/* Didn't match anything - output no monitor data */
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3378  			monitor_len = 0;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3379  		}
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3380  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3381  		len += monitor_len;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3382  		(*data)->len = cpu_to_le32(monitor_len + sizeof(*fw_mon_data));
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3383  	}
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3384  
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3385  	return len;
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3386  }
36fb90172688c8 drivers/net/wireless/iwlwifi/pcie/trans.c       Oren Givon         2015-07-15  3387  

:::::: The code at line 3352 was first introduced by commit
:::::: 91c28b83da21624dabd1ee9e9c35e2747d6a9563 iwlwifi: dbg: move trans debug fields to a separate struct

:::::: TO: Shahar S Matityahu <shahar.s.matityahu@intel.com>
:::::: CC: Luca Coelho <luciano.coelho@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
