Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746D20CCE4
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768665130; cv=none; b=aTeVe1B8f0vp+me1C6sG1AJ6zLu0okADWZ7iokPZhCEVnsUtkIGQKQNBwldqC9P1e2jiVSZMguf11Y56sh/2tuTLjBWaAwiP0KCBxuRgfKna0x/jV114wBAutKg/a+djAfDVUkNDe2koRnmvcMGi1YMUrADUDkFnMC9njUxuYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768665130; c=relaxed/simple;
	bh=sTen2GQyTqZQ0HnYc+N/GFfB7HgVO8xxBy0cIF+ZLSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jax7po1rVXoo5DCUS+ChWpnXw8YzzhnYgazAvgrQOSrlogUQhlQgQmro5euP04fZMHECRryuMNdm+XTkRtnkJxCJ80j+HwdgKS7c//U1ZxWjW8bLNiV7mlvs2lqLss/yjtT2qF+V062d4DdN1vYTkDbsCOFy8DYr8ICYIuosW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqNR5T7Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqNR5T7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768665128; x=1800201128;
  h=date:from:to:cc:subject:message-id;
  bh=sTen2GQyTqZQ0HnYc+N/GFfB7HgVO8xxBy0cIF+ZLSc=;
  b=aqNR5T7ZHKSf7+wkJHTf5SiAtSyM3Odo05WEfBBYQYb/Vp2e01zAtouT
   sCqpxJy8Aphpv1KtDVAgp2ba6/ZNh0/cxPfZrh45Hm9i7Q/4wouEEwTnU
   ZAuQh3OuAeqWIsWpZm5WnHgUIBbdk9FTmeJIfW1L3IXTVJwZIydzlPqau
   FGsI3nxiIeKCdgYUPc75ckQgR4Id/DyW/IWRHOovwinbP6jBxVcjfZ1lB
   UF1mWmjo9kcvSUEa21FJuQ8C+DrtLkPDa7xakp6uEeoEKcGMnLeizfycv
   nWUDMEXX7HgErQxXwnx17KDQgtj8Jd6W+UC0AyJNNCB6kZQPZfA7IcaC5
   g==;
X-CSE-ConnectionGUID: BzLDr5g6QQydtC/RFrh5Fw==
X-CSE-MsgGUID: +c2DkeMqRrq03Bo7MArC5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69683606"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69683606"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 07:52:05 -0800
X-CSE-ConnectionGUID: 5tiNGn0QSA69c86TeVg8EA==
X-CSE-MsgGUID: TFOVrD48R3KgvKk/VkVd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205906534"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2026 07:52:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh8an-00000000Lyk-1Kg0;
	Sat, 17 Jan 2026 15:52:01 +0000
Date: Sat, 17 Jan 2026 23:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/ras/rascore/ras_umc.c:210:6-14: ERROR:
 iterator variable bound on line 208 cannot be NULL
Message-ID: <202601172329.MRnZeFv2-lkp@intel.com>
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
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260117/202601172329.MRnZeFv2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601172329.MRnZeFv2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/rascore/ras_umc.c:210:6-14: ERROR: iterator variable bound on line 208 cannot be NULL
--
>> drivers/gpu/drm/amd/ras/rascore/ras_core.c:269:10-17: WARNING opportunity for kmemdup
--
>> drivers/gpu/drm/amd/ras/rascore/ras_umc.c:267:21-22: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c:229:4-8: opportunity for str_read_write(read)

vim +210 drivers/gpu/drm/amd/ras/rascore/ras_umc.c

7a3f9c0992c4f8 YiPeng Chai 2025-03-17  199  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  200  /* After gpu reset is complete, re-log the pending error banks.
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  201   */
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  202  int ras_umc_log_pending_bad_bank(struct ras_core_context *ras_core)
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  203  {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  204  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  205  	struct ras_bank_ecc_node *ecc_node, *tmp;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  206  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  207  	mutex_lock(&ras_umc->pending_ecc_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17 @208  	list_for_each_entry_safe(ecc_node,
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  209  		tmp, &ras_umc->pending_ecc_list, node){
7a3f9c0992c4f8 YiPeng Chai 2025-03-17 @210  		if (ecc_node && !ras_umc_log_bad_bank(ras_core, &ecc_node->ecc)) {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  211  			list_del(&ecc_node->node);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  212  			kfree(ecc_node);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  213  		}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  214  	}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  215  	mutex_unlock(&ras_umc->pending_ecc_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  216  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  217  	return 0;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  218  }
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  219  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  220  int ras_umc_log_bad_bank(struct ras_core_context *ras_core, struct ras_bank_ecc *bank)
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  221  {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  222  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  223  	struct eeprom_umc_record umc_rec;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  224  	struct eeprom_umc_record *err_rec;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  225  	int ret;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  226  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  227  	memset(&umc_rec, 0, sizeof(umc_rec));
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  228  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  229  	mutex_lock(&ras_umc->bank_log_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  230  	ret = ras_umc->ip_func->bank_to_eeprom_record(ras_core, bank, &umc_rec);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  231  	if (ret)
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  232  		goto out;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  233  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  234  	err_rec = kzalloc(sizeof(*err_rec), GFP_KERNEL);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  235  	if (!err_rec) {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  236  		ret = -ENOMEM;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  237  		goto out;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  238  	}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  239  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  240  	memcpy(err_rec, &umc_rec, sizeof(umc_rec));
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  241  	ret = ras_umc_log_ecc(ras_core, err_rec->cur_nps_retired_row_pfn, err_rec);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  242  	if (ret) {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  243  		if (ret == -EEXIST) {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  244  			RAS_DEV_INFO(ras_core->dev, "The bad pages have been logged before.\n");
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  245  			ret = 0;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  246  		}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  247  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  248  		kfree(err_rec);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  249  		goto out;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  250  	}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  251  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  252  	ras_umc_reserve_eeprom_record(ras_core, err_rec);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  253  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  254  	ret = ras_core_event_notify(ras_core,
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  255  			RAS_EVENT_ID__BAD_PAGE_DETECTED, NULL);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  256  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  257  out:
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  258  	mutex_unlock(&ras_umc->bank_log_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  259  	return ret;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  260  }
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  261  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  262  static int ras_umc_get_new_records(struct ras_core_context *ras_core,
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  263  			struct eeprom_umc_record *records, u32 num)
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  264  {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  265  	struct ras_umc *ras_umc = &ras_core->ras_umc;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  266  	struct eeprom_umc_record *entries[MAX_ECC_NUM_PER_RETIREMENT];
7a3f9c0992c4f8 YiPeng Chai 2025-03-17 @267  	u32 entry_num = num < MAX_ECC_NUM_PER_RETIREMENT ? num : MAX_ECC_NUM_PER_RETIREMENT;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  268  	int count = 0;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  269  	int new_detected, i;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  270  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  271  	mutex_lock(&ras_umc->tree_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  272  	new_detected = radix_tree_gang_lookup_tag(&ras_umc->root, (void **)entries,
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  273  			0, entry_num, UMC_ECC_NEW_DETECTED_TAG);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  274  	for (i = 0; i < new_detected; i++) {
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  275  		if (!entries[i])
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  276  			continue;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  277  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  278  		memcpy(&records[i], entries[i], sizeof(struct eeprom_umc_record));
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  279  		count++;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  280  		radix_tree_tag_clear(&ras_umc->root,
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  281  				entries[i]->cur_nps_retired_row_pfn, UMC_ECC_NEW_DETECTED_TAG);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  282  	}
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  283  	mutex_unlock(&ras_umc->tree_lock);
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  284  
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  285  	return count;
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  286  }
7a3f9c0992c4f8 YiPeng Chai 2025-03-17  287  

:::::: The code at line 210 was first introduced by commit
:::::: 7a3f9c0992c4f8e3d9c0c340ec46e4a8ebd1c7d5 drm/amd/ras: Add umc common ras functions

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
