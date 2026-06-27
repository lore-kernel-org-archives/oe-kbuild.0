Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBB3AD50F
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jun 2026 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782569057; cv=none; b=i4kz5F9xzQuvodT93iyWtB2zpBlVwuypEkkYwMeTtgmGqsoV1ORA4+7jcLZKchhcF/1YqiywvWkwkvEvWTKSYTqsc8f9TAqLu/7WsSGnUwOGGEVEUCygF8imgcaqcg7xUg3JH7eRWVZu1xBjxognO1BnCFEFcJq0BJWX8Gh+1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782569057; c=relaxed/simple;
	bh=r6mglgh0L3jkpYEdUF9wSLBZzDGaAY7R4FNTFX+/UbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dC5CL9EVl71hQX+k82kAHE/TjN96rbkhP2EFStakqaFm5ZV+oFjuu6KHG5aSdemanY3avtTfBnPrGB1AL2n5xz7WCzvDrCtbFVB2SABTC94/717/RhqOs73vWnuj2G96V0qB+VxnRG/TVb1f3PP4N4225+D2NhF+MGn/1xayCrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGsnx0BZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGsnx0BZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782569056; x=1814105056;
  h=date:from:to:cc:subject:message-id;
  bh=r6mglgh0L3jkpYEdUF9wSLBZzDGaAY7R4FNTFX+/UbY=;
  b=MGsnx0BZnqXu0GcTpItpnKYBMrBntq+qTQy2anY5eSXvLhkW4zMum8fG
   uQ4W3d87qXOPNTCez3nVVzcQdhUPcHAip/D04/SUp61boGRz4xTwGqSzV
   AmFY4Z7KCZSNQ/Bmidhp8S5/9Ge6FEBc4l//dX4r2jixjX051XhtZclsZ
   /odCKEoV4Sfqx2o7mUdZEB31VtYBNUKsadayGWuNwqDAPAkc28PvK4yrO
   oO2O1VkWMZ579UPb51Lb/sg7fjYd5vswhJHkBZk/IdPaWxndbUhT8nbt2
   R21UbVhFXHaLlVMlYbuw6ZLHh45AC6OsuhBKPzBQNNzb+DLJ0AyurFWHi
   w==;
X-CSE-ConnectionGUID: RiewVCYuRsyUYela41QvRQ==
X-CSE-MsgGUID: kIVc0LscT6eS8LudCd00CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="87022400"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="87022400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 07:04:16 -0700
X-CSE-ConnectionGUID: YFD0ejQARZSLxZk1zcgHYg==
X-CSE-MsgGUID: 6RZ2h7Z2S+61yW1L2j5G9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="248904265"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jun 2026 07:04:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdTdd-000000005sE-0K8S;
	Sat, 27 Jun 2026 14:04:06 +0000
Date: Sat, 27 Jun 2026 22:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/ras/rascore/ras_umc.c:267:21-22: WARNING
 opportunity for min()
Message-ID: <202606272131.dOwEeYSu-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a66900afbd6b2a063eebad35294038a654de2b0
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r064-20260627 (https://download.01.org/0day-ci/archive/20260627/202606272131.dOwEeYSu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606272131.dOwEeYSu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/rascore/ras_umc.c:267:21-22: WARNING opportunity for min()
--
>> drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c:229:4-8: opportunity for str_read_write(read)

vim +267 drivers/gpu/drm/amd/ras/rascore/ras_umc.c

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

:::::: The code at line 267 was first introduced by commit
:::::: 7a3f9c0992c4f8e3d9c0c340ec46e4a8ebd1c7d5 drm/amd/ras: Add umc common ras functions

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
