Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA152CCE2
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790548; cv=none; b=JJXcFdpjki+MyOwn/Yr2NcpMYBNsQyY1Xx2kF/Kwzv328E0IrrNW4HTelezPPYou3EcoLRGl6HNOJHU0l3SPamVSv/UNAR9HxttsR8lYjLEj3ojJIlyra1JUsal3LeeXhDHY60QWxyJmwSKGYulIyjGVS2qVHGQQcKNQdrHDYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790548; c=relaxed/simple;
	bh=EcOhN+2JonphCiJbhZyeIGU2tciEofrxn8DQG1xbUKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHFnonyrbmU4Y5gk6j3kxAnrzl4FUb1+PyczWV/jBD8B4q9NS6xeC6KE5d0zC1OStB4R7TW/OokQ8Lr0Ynx9+/SjwEuG+2lGsemFfuEhtSLZvbIZErGhIV9W1VIMneojjsDvGO5JhDbg8uOG1ZlIzUScDiPMrz5H+qsJjjEN/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcOYUv+F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcOYUv+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790790546; x=1822326546;
  h=date:from:to:cc:subject:message-id;
  bh=EcOhN+2JonphCiJbhZyeIGU2tciEofrxn8DQG1xbUKc=;
  b=PcOYUv+F58FrelTIEgRw0H13tC1TtiOqFyq1Za6s5OaIk2P+eaGnQXG9
   f/+wWln9tbKYh6orlND75bsVMmTi3nLdN4hLE+IYTTRFIgluazvhunlnF
   UX9ezA8HO0ucSlhBvm1IWnATgsBZTVRQy5qtEu+WJ2zGECtF0HQOSNLOA
   C2pKYb+cycw2R+hAfVJUSeTOxc/IhMVWyM2rzkJyqy2XZnc2ucPs5/ITu
   kTrjuRNpVsUQWx7c391P633TSXdc0Ud8DTOmNkuIswkTBtoayoDsZjUDT
   qxjIq9t0OOOp83KrGtUr6+cPMV9ygVH8+P+ZLl7zZJOf4692GkemCtbgb
   g==;
X-CSE-ConnectionGUID: Gxa5mSwvRVeuR3V7N4zWkw==
X-CSE-MsgGUID: 95pckKMCRx6n6luosKDD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102061535"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="102061535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:49:06 -0700
X-CSE-ConnectionGUID: 3mxspP0fSEmA+poVOCegSw==
X-CSE-MsgGUID: IN/ln/IsQV6fTEJelGyYGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="274870111"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 10:49:05 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xByQQ-000000001x1-3qqE;
	Wed, 30 Sep 2026 17:49:02 +0000
Date: Wed, 30 Sep 2026 19:48:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_mpxy_imp_v1 2/5]
 arch/riscv/kernel/sbi_mpxy.c:104:19-20: WARNING opportunity for min()
Message-ID: <202609301955.YFKKcuVe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <anup.patel@oss.qualcomm.com>
CC: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

tree:   https://github.com/avpatel/linux.git riscv_mpxy_imp_v1
head:   48be05a1fcc231a756503546729aefd39ba8ca76
commit: 6439174960c8ce56a3b4ce6eb5fabde7bdaae27a [2/5] RISC-V: Move common MPXY helper routines to arch/riscv
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-r2103-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301955.YFKKcuVe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609301955.YFKKcuVe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/sbi_mpxy.c:104:19-20: WARNING opportunity for min()

vim +104 arch/riscv/kernel/sbi_mpxy.c

6439174960c8ce Anup Patel 2026-05-26   80  
6439174960c8ce Anup Patel 2026-05-26   81  int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
6439174960c8ce Anup Patel 2026-05-26   82  {
6439174960c8ce Anup Patel 2026-05-26   83  	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
6439174960c8ce Anup Patel 2026-05-26   84  	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
6439174960c8ce Anup Patel 2026-05-26   85  	u32 remaining, returned, count, start_index = 0;
6439174960c8ce Anup Patel 2026-05-26   86  	struct sbiret sret;
6439174960c8ce Anup Patel 2026-05-26   87  
6439174960c8ce Anup Patel 2026-05-26   88  	if (!mpxy->shmem_active)
6439174960c8ce Anup Patel 2026-05-26   89  		return -ENODEV;
6439174960c8ce Anup Patel 2026-05-26   90  	if (!channel_count || !channel_ids)
6439174960c8ce Anup Patel 2026-05-26   91  		return -EINVAL;
6439174960c8ce Anup Patel 2026-05-26   92  
6439174960c8ce Anup Patel 2026-05-26   93  	get_cpu();
6439174960c8ce Anup Patel 2026-05-26   94  
6439174960c8ce Anup Patel 2026-05-26   95  	do {
6439174960c8ce Anup Patel 2026-05-26   96  		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
6439174960c8ce Anup Patel 2026-05-26   97  				 start_index, 0, 0, 0, 0, 0);
6439174960c8ce Anup Patel 2026-05-26   98  		if (sret.error)
6439174960c8ce Anup Patel 2026-05-26   99  			goto err_put_cpu;
6439174960c8ce Anup Patel 2026-05-26  100  
6439174960c8ce Anup Patel 2026-05-26  101  		remaining = le32_to_cpu(sdata->remaining);
6439174960c8ce Anup Patel 2026-05-26  102  		returned = le32_to_cpu(sdata->returned);
6439174960c8ce Anup Patel 2026-05-26  103  
6439174960c8ce Anup Patel 2026-05-26 @104  		count = returned < (channel_count - start_index) ?
6439174960c8ce Anup Patel 2026-05-26  105  			returned : (channel_count - start_index);
6439174960c8ce Anup Patel 2026-05-26  106  		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
6439174960c8ce Anup Patel 2026-05-26  107  		start_index += count;
6439174960c8ce Anup Patel 2026-05-26  108  	} while (remaining && start_index < channel_count);
6439174960c8ce Anup Patel 2026-05-26  109  
6439174960c8ce Anup Patel 2026-05-26  110  err_put_cpu:
6439174960c8ce Anup Patel 2026-05-26  111  	put_cpu();
6439174960c8ce Anup Patel 2026-05-26  112  	return sbi_err_map_linux_errno(sret.error);
6439174960c8ce Anup Patel 2026-05-26  113  }
6439174960c8ce Anup Patel 2026-05-26  114  EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
6439174960c8ce Anup Patel 2026-05-26  115  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
