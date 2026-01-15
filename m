Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B027FB35
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 03:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768447855; cv=none; b=ngT0TF4PUJU9KyRJfWo0AlrMDPATM4kEoG9HV/K6OCFcS0eHBO8ZyS6wb1q0bveuH8Ae1ZkXCnMQiWF0l6J30AAVgXseJT0NnFJhMGGH3UsEv2YXfifZYtruyjZAhcNGskdImh9AF0qG+hA1oVaYtvv5sD5cW1vD4pa04K30fqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768447855; c=relaxed/simple;
	bh=JjKBpDSLCQXyiDRG52z5BvUqnMx/9+2nMBwmUBZu3kw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r0lqe0sKxBrx8DkBhiYMxiA6PMObZJ6VBiLObUkT1H/1qwtruOaLE+PfcmF19sAVxnF9fxGrHCdD1HpL+Uvv2VrhsCBnGVuWejYl/GzugIDfj0rsa+cFdkUFALWx15/jZYky4Dg/PcZBL5+JRLLDZYQjHuVMxiA1fQXsnYSo4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5XCVJzR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5XCVJzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768447854; x=1799983854;
  h=date:from:to:cc:subject:message-id;
  bh=JjKBpDSLCQXyiDRG52z5BvUqnMx/9+2nMBwmUBZu3kw=;
  b=l5XCVJzRbCoOVH2gDIJtQS3oMQMoR4AC5LHG5nh+FULg2e4jc3g8vVhO
   KlF46R0AxcriNNcWUln9QIpnHKcewsyPbgc6vskSwxpN8S7z02Pfw29OZ
   U8eC/ofyteq+l1NMo2McR3pT4TOstjUXsE/OsY8hNGsFp+ztsv1jGPBZe
   4xvvvl0oFrKWeXdaby9Kj8D+Lu7QPxG5SnWGe8AoIE93t+N04HaYNRM2Z
   Xg6v3h5DnmHQrWrw94G8C/CssKt777poQFyQsgeMSRTzrpDVILQ8GJ0w5
   JJhvxtg9Exdqt+L5Xj/od1nFj7RUFdsE+Dac42MQalSLFRhCle4jy38eB
   A==;
X-CSE-ConnectionGUID: CSPeMqctS7mdn26JicmfZA==
X-CSE-MsgGUID: 2dSbMGyIS5STqHplgQT0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69731745"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69731745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 19:30:45 -0800
X-CSE-ConnectionGUID: jONbjbNSQ7qT35QEkoXsfg==
X-CSE-MsgGUID: sN1BBUGYQqerLT74pKyCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204905261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jan 2026 19:30:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgE4G-00000000HUI-3vBb;
	Thu, 15 Jan 2026 03:30:40 +0000
Date: Thu, 15 Jan 2026 11:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/ras/rascore/ras_umc.c:210:6-14: ERROR:
 iterator variable bound on line 208 cannot be NULL
Message-ID: <202601151111.R1Gd9H68-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tao Zhou <tao.zhou1@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

Hi YiPeng,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260115/202601151111.R1Gd9H68-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601151111.R1Gd9H68-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/rascore/ras_umc.c:210:6-14: ERROR: iterator variable bound on line 208 cannot be NULL
--
>> drivers/gpu/drm/amd/ras/rascore/ras_core.c:269:10-17: WARNING opportunity for kmemdup
--
>> drivers/gpu/drm/amd/ras/rascore/ras_umc.c:267:21-22: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c:229:4-8: opportunity for str_read_write(read)

vim +210 drivers/gpu/drm/amd/ras/rascore/ras_umc.c

7a3f9c0992c4f8e YiPeng Chai 2025-03-17  199  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  200  /* After gpu reset is complete, re-log the pending error banks.
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  201   */
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  202  int ras_umc_log_pending_bad_bank(struct ras_core_context *ras_core)
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  203  {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  204  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  205  	struct ras_bank_ecc_node *ecc_node, *tmp;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  206  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  207  	mutex_lock(&ras_umc->pending_ecc_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17 @208  	list_for_each_entry_safe(ecc_node,
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  209  		tmp, &ras_umc->pending_ecc_list, node){
7a3f9c0992c4f8e YiPeng Chai 2025-03-17 @210  		if (ecc_node && !ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  211  			list_del(&ecc_node->node);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  212  			kfree(ecc_node);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  213  		}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  214  	}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  215  	mutex_unlock(&ras_umc->pending_ecc_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  216  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  217  	return 0;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  218  }
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  219  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  220  int ras_umc_log_bad_bank(struct ras_core_context *ras_core, struct ras_bank_ecc *bank)
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  221  {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  222  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  223  	struct eeprom_umc_record umc_rec;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  224  	struct eeprom_umc_record *err_rec;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  225  	int ret;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  226  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  227  	memset(&umc_rec, 0, sizeof(umc_rec));
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  228  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  229  	mutex_lock(&ras_umc->bank_log_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  230  	ret = ras_umc->ip_func->bank_to_eeprom_record(ras_core, bank, &umc_rec);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  231  	if (ret)
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  232  		goto out;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  233  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  234  	err_rec = kzalloc(sizeof(*err_rec), GFP_KERNEL);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  235  	if (!err_rec) {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  236  		ret = -ENOMEM;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  237  		goto out;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  238  	}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  239  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  240  	memcpy(err_rec, &umc_rec, sizeof(umc_rec));
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  241  	ret = ras_umc_log_ecc(ras_core, err_rec->cur_nps_retired_row_pfn, err_rec);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  242  	if (ret) {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  243  		if (ret == -EEXIST) {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  244  			RAS_DEV_INFO(ras_core->dev, "The bad pages have been logged before.\n");
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  245  			ret = 0;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  246  		}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  247  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  248  		kfree(err_rec);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  249  		goto out;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  250  	}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  251  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  252  	ras_umc_reserve_eeprom_record(ras_core, err_rec);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  253  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  254  	ret = ras_core_event_notify(ras_core,
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  255  			RAS_EVENT_ID__BAD_PAGE_DETECTED, NULL);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  256  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  257  out:
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  258  	mutex_unlock(&ras_umc->bank_log_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  259  	return ret;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  260  }
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  261  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  262  static int ras_umc_get_new_records(struct ras_core_context *ras_core,
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  263  			struct eeprom_umc_record *records, u32 num)
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  264  {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  265  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  266  	struct eeprom_umc_record *entries[MAX_ECC_NUM_PER_RETIREMENT];
7a3f9c0992c4f8e YiPeng Chai 2025-03-17 @267  	u32 entry_num = num < MAX_ECC_NUM_PER_RETIREMENT ? num : MAX_ECC_NUM_PER_RETIREMENT;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  268  	int count = 0;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  269  	int new_detected, i;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  270  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  271  	mutex_lock(&ras_umc->tree_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  272  	new_detected = radix_tree_gang_lookup_tag(&ras_umc->root, (void **)entries,
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  273  			0, entry_num, UMC_ECC_NEW_DETECTED_TAG);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  274  	for (i = 0; i < new_detected; i++) {
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  275  		if (!entries[i])
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  276  			continue;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  277  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  278  		memcpy(&records[i], entries[i], sizeof(struct eeprom_umc_record));
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  279  		count++;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  280  		radix_tree_tag_clear(&ras_umc->root,
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  281  				entries[i]->cur_nps_retired_row_pfn, UMC_ECC_NEW_DETECTED_TAG);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  282  	}
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  283  	mutex_unlock(&ras_umc->tree_lock);
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  284  
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  285  	return count;
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  286  }
7a3f9c0992c4f8e YiPeng Chai 2025-03-17  287  

:::::: The code at line 210 was first introduced by commit
:::::: 7a3f9c0992c4f8e3d9c0c340ec46e4a8ebd1c7d5 drm/amd/ras: Add umc common ras functions

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
