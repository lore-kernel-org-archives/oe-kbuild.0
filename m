Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B921146C
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770093471; cv=none; b=gdilmv0VgmBPzpckRqSky43/d/Srs1+hPo2wW5q6xFXOp+/RMQqIP4r4krE4EpoPTDcIiOPiOCNUym54V5SJMLoCowOMvgissdqCJleqZIj58RixVdWYkZlwfNZQgx30MdN2fGOt4R9n18H7C0W5wVhI+yyKmn7Ay7np6f7dAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770093471; c=relaxed/simple;
	bh=t9NywLDsp4hEuCFnJDBgaupvyeY6svSpmKKYHreCnAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1CVMK1fI8ir/++jKCSFAv2daOQWLv3scYcTT3iyyxlhAaUFYpCtazZWDd29hez9MeW24QbfWLBsHAn1qghaXmfVUxiI3GbQl2ZnLlUrMhZD/phCMlBj5sgMS68RlhTZTJlGdYar+GxF2J/YR3JAvPR2zkSwh+FSXHBLs6mDvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeBjEgOc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeBjEgOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770093470; x=1801629470;
  h=date:from:to:cc:subject:message-id;
  bh=t9NywLDsp4hEuCFnJDBgaupvyeY6svSpmKKYHreCnAc=;
  b=FeBjEgOcE06bF7ZzQyG6+KzrU5RYlpSN6HgcTNqbVGNHsLjHPZ8404sJ
   DGB4trqhAtEz3QDx+1lWsqDYDC3MMVbw3WkJnaNE+2rRaAwr2sKHtmuXv
   WlywtVXsKKx75A6EQsLJuni/Ws0c6YhzDtaBXrwc7gFEkEPBjxUuM873+
   Qu8uaHtuMnMyUpeXAxKaiu8y1mwgEQzTxEr/VYMp7WRSRaqNOsWEDtcWz
   sUZXpHBQo0kNdaYer6LU0yxL/pYbZLxGJtdqgXoClF2F6bWqrDY1w0w6P
   jUOItHOFJ4cNm7C0Bww9Z1DiMPyK0ls51tw96LcWzwrCb/q4pxEf6Y/0k
   Q==;
X-CSE-ConnectionGUID: vurqgkY7Toa0+tc0xqvZMA==
X-CSE-MsgGUID: vW68714CQYC5sw/5SqH1bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88678553"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="88678553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 20:37:49 -0800
X-CSE-ConnectionGUID: IeofivmgQ+6oUX5yU4exmQ==
X-CSE-MsgGUID: 7wfVXCLWS3CDHLfPhAx+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209016549"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2026 20:37:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn8AY-00000000gFk-1G1W;
	Tue, 03 Feb 2026 04:37:42 +0000
Date: Tue, 03 Feb 2026 12:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511
 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core'
 could be null (see line 507)
Message-ID: <202602031229.RI8PLyjl-lkp@intel.com>
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
head:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20260202 (https://download.01.org/0day-ci/archive/20260203/202602031229.RI8PLyjl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602031229.RI8PLyjl-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core' could be null (see line 507)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:530 ras_core_ras_interrupt_detected() error: we previously assumed 'ras_core' could be null (see line 526)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:210 ras_umc_log_pending_bad_bank() warn: variable dereferenced before check 'ecc_node' (see line 208)

vim +/ras_core +511 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

13c91b5b4378b5 YiPeng Chai 2025-03-17  504  
13c91b5b4378b5 YiPeng Chai 2025-03-17  505  uint64_t ras_core_get_utc_second_timestamp(struct ras_core_context *ras_core)
13c91b5b4378b5 YiPeng Chai 2025-03-17  506  {
13c91b5b4378b5 YiPeng Chai 2025-03-17 @507  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5 YiPeng Chai 2025-03-17  508  		ras_core->sys_fn->get_utc_second_timestamp)
13c91b5b4378b5 YiPeng Chai 2025-03-17  509  		return ras_core->sys_fn->get_utc_second_timestamp(ras_core);
13c91b5b4378b5 YiPeng Chai 2025-03-17  510  
13c91b5b4378b5 YiPeng Chai 2025-03-17 @511  	RAS_DEV_ERR(ras_core->dev, "Failed to get system timestamp!\n");
13c91b5b4378b5 YiPeng Chai 2025-03-17  512  	return 0;
13c91b5b4378b5 YiPeng Chai 2025-03-17  513  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  514  
13c91b5b4378b5 YiPeng Chai 2025-03-17  515  int ras_core_translate_soc_pa_and_bank(struct ras_core_context *ras_core,
13c91b5b4378b5 YiPeng Chai 2025-03-17  516  	uint64_t *soc_pa, struct umc_bank_addr *bank_addr, bool bank_to_pa)
13c91b5b4378b5 YiPeng Chai 2025-03-17  517  {
13c91b5b4378b5 YiPeng Chai 2025-03-17  518  	if (!ras_core || !soc_pa || !bank_addr)
13c91b5b4378b5 YiPeng Chai 2025-03-17  519  		return -EINVAL;
13c91b5b4378b5 YiPeng Chai 2025-03-17  520  
13c91b5b4378b5 YiPeng Chai 2025-03-17  521  	return ras_umc_translate_soc_pa_and_bank(ras_core, soc_pa, bank_addr, bank_to_pa);
13c91b5b4378b5 YiPeng Chai 2025-03-17  522  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  523  
13c91b5b4378b5 YiPeng Chai 2025-03-17  524  bool ras_core_ras_interrupt_detected(struct ras_core_context *ras_core)
13c91b5b4378b5 YiPeng Chai 2025-03-17  525  {
13c91b5b4378b5 YiPeng Chai 2025-03-17 @526  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5 YiPeng Chai 2025-03-17  527  		ras_core->sys_fn->detect_ras_interrupt)
13c91b5b4378b5 YiPeng Chai 2025-03-17  528  		return ras_core->sys_fn->detect_ras_interrupt(ras_core);
13c91b5b4378b5 YiPeng Chai 2025-03-17  529  
13c91b5b4378b5 YiPeng Chai 2025-03-17 @530  	RAS_DEV_ERR(ras_core->dev, "Failed to detect ras interrupt!\n");
13c91b5b4378b5 YiPeng Chai 2025-03-17  531  	return false;
13c91b5b4378b5 YiPeng Chai 2025-03-17  532  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  533  

:::::: The code at line 511 was first introduced by commit
:::::: 13c91b5b4378b5d08dc9ae9121b1645a0beec0bb drm/amd/ras: Add rascore unified interface function

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
