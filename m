Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657A38F651
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413167; cv=none; b=hGuHVH5vktPYV6hgu8VK/DkuhAmR8Uhp9/gXEJeEfEeV37rW9xkcuunvMjmCr4KiMHLO3ZG2SIB1Ctvjd2tq2twAn+qzbNclx63vdu+BzrYaPSfNomcxDhfW3QhRiBPU8t/BV9hPdRaIOrYTqmAZbspWrWmqrP7xQsQShVh+I8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413167; c=relaxed/simple;
	bh=oDQRn6/DTnXrchqeVfG4MBCRRL5BLhlsFvYZfpbmUP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sxx4HyRtNYpfZbC8QFf1hTbqIcxxKQJS7X2uoVD5sWn4mQNxqDtz9ozZXs+oxiHE+GNAJWsLTbi1O+t2zuhDuSFbradiWW6u47Q3wiQbd3UcT9dGVezTwrOsQgGO82kPTtmYAkv524LzAJIlM7i/yiMw22B5lGFfksyiiWIJ2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMJfGhJN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMJfGhJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789413160; x=1820949160;
  h=date:from:to:cc:subject:message-id;
  bh=oDQRn6/DTnXrchqeVfG4MBCRRL5BLhlsFvYZfpbmUP4=;
  b=NMJfGhJNV63mnh6i562vAzo4UQuh9+1LiNrGYMG6dxcp/sNh1DTcpByi
   hYMy0GnhVM0TxxyFrjG9/CwL5/YbXt7NqZQZZ516PuoI8FgmF5Gq/sN/u
   Y0NhyWrz+v8AIt4kBmEGcG6yeFE7IohBtGDxKRQsiWD5NlTw5wKLUMmik
   fGkWj4HfJ3QHSmtxttsiPxiF0vHrS8+VHCdsmiuKsDKy1Q+PN0vSGboem
   kVTqfWuFc1aD0IIRltpwYNBmnXn05C8z3Jb7/sDKvUrKL80Pgp9yErjzx
   pTbwJ0PkwXHX+ffpcSAddtwwjkFpseyPztDe3zLPAjKzld7yxwADQ/4RL
   g==;
X-CSE-ConnectionGUID: hAJw7/x6SR2ObC7H6I7cyg==
X-CSE-MsgGUID: HAejwn6VSnGXJy7kGtU7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107283323"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107283323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:12:35 -0700
X-CSE-ConnectionGUID: pOk+6X2nS9qKAHXXiYCOQQ==
X-CSE-MsgGUID: jlvTH7vaSsmmtp4qGz3SdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266514473"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2026 12:12:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6C6R-000000003QB-2ViQ;
	Mon, 14 Sep 2026 19:12:31 +0000
Date: Tue, 15 Sep 2026 03:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/mm/mmu.c:2414:19: error: use of undeclared
 identifier 'PTVAL_STR_MAX'
Message-ID: <202609150317.TnMGzi8i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Anshuman-Khandual/arm64-mm-Move-__check_safe_pte_update/20260909-093004, commit: adfcfb8f361eadd9da277cd41d20ba0ac620e94d"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm64-mm-Move-__check_safe_pte_update/20260909-093004
head:   adfcfb8f361eadd9da277cd41d20ba0ac620e94d
commit: adfcfb8f361eadd9da277cd41d20ba0ac620e94d arm64/mm: Standardize printing for pgtable entries
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-004-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150317.TnMGzi8i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150317.TnMGzi8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150317.TnMGzi8i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:2414:19: error: use of undeclared identifier 'PTVAL_STR_MAX'
    2414 |         char pte_str_old[PTVAL_STR_MAX];
         |                          ^~~~~~~~~~~~~
   arch/arm64/mm/mmu.c:2415:15: error: use of undeclared identifier 'PTVAL_STR_MAX'
    2415 |         char pte_str[PTVAL_STR_MAX];
         |                      ^~~~~~~~~~~~~
>> arch/arm64/mm/mmu.c:2430:2: error: call to undeclared function 'ptval_to_str'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2430 |         ptval_to_str(pte_str, pte_val(pte));
         |         ^
   3 errors generated.
--
>> arch/arm64/mm/fault.c:134:15: error: use of undeclared identifier 'PTVAL_STR_MAX'
     134 |         char pxd_str[PTVAL_STR_MAX];
         |                      ^~~~~~~~~~~~~
>> arch/arm64/mm/fault.c:164:2: error: call to undeclared function 'ptval_to_str'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |         ptval_to_str(pxd_str, pgd_val(pgd));
         |         ^
   2 errors generated.


vim +/PTVAL_STR_MAX +2414 arch/arm64/mm/mmu.c

9d2af8f32deaad Anshuman Khandual 2026-09-09  2395  
9d2af8f32deaad Anshuman Khandual 2026-09-09  2396  /*
9d2af8f32deaad Anshuman Khandual 2026-09-09  2397   * PTE bits configuration in the presence of hardware Dirty Bit Management
9d2af8f32deaad Anshuman Khandual 2026-09-09  2398   * (PTE_WRITE == PTE_DBM):
9d2af8f32deaad Anshuman Khandual 2026-09-09  2399   *
9d2af8f32deaad Anshuman Khandual 2026-09-09  2400   * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
9d2af8f32deaad Anshuman Khandual 2026-09-09  2401   *   0      0      |   1           0          0
9d2af8f32deaad Anshuman Khandual 2026-09-09  2402   *   0      1      |   1           1          0
9d2af8f32deaad Anshuman Khandual 2026-09-09  2403   *   1      0      |   1           0          1
9d2af8f32deaad Anshuman Khandual 2026-09-09  2404   *   1      1      |   0           1          x
9d2af8f32deaad Anshuman Khandual 2026-09-09  2405   *
9d2af8f32deaad Anshuman Khandual 2026-09-09  2406   * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
9d2af8f32deaad Anshuman Khandual 2026-09-09  2407   * the page fault mechanism. Checking the dirty status of a pte becomes:
9d2af8f32deaad Anshuman Khandual 2026-09-09  2408   *
9d2af8f32deaad Anshuman Khandual 2026-09-09  2409   *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
9d2af8f32deaad Anshuman Khandual 2026-09-09  2410   */
9d2af8f32deaad Anshuman Khandual 2026-09-09  2411  #ifdef CONFIG_DEBUG_VM
9d2af8f32deaad Anshuman Khandual 2026-09-09  2412  void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
9d2af8f32deaad Anshuman Khandual 2026-09-09  2413  {
adfcfb8f361ead Anshuman Khandual 2026-09-09 @2414  	char pte_str_old[PTVAL_STR_MAX];
adfcfb8f361ead Anshuman Khandual 2026-09-09  2415  	char pte_str[PTVAL_STR_MAX];
9d2af8f32deaad Anshuman Khandual 2026-09-09  2416  	pte_t old_pte;
9d2af8f32deaad Anshuman Khandual 2026-09-09  2417  
9d2af8f32deaad Anshuman Khandual 2026-09-09  2418  	old_pte = __ptep_get(ptep);
9d2af8f32deaad Anshuman Khandual 2026-09-09  2419  
9d2af8f32deaad Anshuman Khandual 2026-09-09  2420  	if (!pte_valid(old_pte) || !pte_valid(pte))
9d2af8f32deaad Anshuman Khandual 2026-09-09  2421  		return;
9d2af8f32deaad Anshuman Khandual 2026-09-09  2422  	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
9d2af8f32deaad Anshuman Khandual 2026-09-09  2423  		return;
9d2af8f32deaad Anshuman Khandual 2026-09-09  2424  
9d2af8f32deaad Anshuman Khandual 2026-09-09  2425  	/*
9d2af8f32deaad Anshuman Khandual 2026-09-09  2426  	 * Check for potential race with hardware updates of the pte
9d2af8f32deaad Anshuman Khandual 2026-09-09  2427  	 * (__ptep_set_access_flags safely changes valid ptes without going
9d2af8f32deaad Anshuman Khandual 2026-09-09  2428  	 * through an invalid entry).
9d2af8f32deaad Anshuman Khandual 2026-09-09  2429  	 */
adfcfb8f361ead Anshuman Khandual 2026-09-09 @2430  	ptval_to_str(pte_str, pte_val(pte));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
