Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861D35977
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750569730; cv=none; b=i1SzztTewhxNyZUZ5Y+tiajt9YpOUgSc5CuV8YSAwpLv9+kKcI+YJO6N0DSj7UlqK35KO3aknI/NlKQgQiDlzLjGpcA9p+JlBx9VbcUPt/GqSEmZa0S6OwRVEr4XsZeuzbs+sguCwCY1wdPedwi91L4DLUCthiSX71zEG+m19UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750569730; c=relaxed/simple;
	bh=ONvRycjgqP0ftrev7XvalmaezDaBgXWWpOC7/PZkIS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EmSOPAdmsdzkglpAI8ugrjAtR6PPbh4neElzdys/osrTqeZIWlGR4PTCo1WR9tt/vbvNIXkM0LWycPed2hWa6zF/zQcgQ/W9xl37XO4rDVNGsDke+F2UhLP1byqE5bDb9DtnHdyuBX6DIhCdA5IRdNY/UKdRtx8BT8ex3GMeDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOTEFwUA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOTEFwUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750569728; x=1782105728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONvRycjgqP0ftrev7XvalmaezDaBgXWWpOC7/PZkIS4=;
  b=JOTEFwUApH49LfxBtag9dgitc7WVZRPFt9Ez+ayNnQWaXzfBPD+k8wZk
   jx9yk78URjunK2+QAKHHw1J5YNlQ9okGfsNAYA8u1rjN+dT6sjzfT2G3W
   AQ7zRKrmkICBxDVuCYl9nhq4gU9K2cqu4R8Sr/0KkvlpjVqZreYP4X/Q5
   c3MxayEItJBKh+uWxrf1ExjFdW2Y38CYApqseUsRC41u3v3bx3Q3ESiFf
   QaNno/vbK8zmKG8d/8L9F1orQE0qgprLHZZH82apFHhgAweUoRP5TQt1c
   whQY7aSPbrN6r5SEzQOypJWbmYnvLO70aVoVDAqPgUNqTDBzaVMvyv1y4
   g==;
X-CSE-ConnectionGUID: 0yOctA6sQZyMyhcce6KJLA==
X-CSE-MsgGUID: zoSKw1WGTxKRrGroU/TxXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="56594003"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="56594003"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 22:22:08 -0700
X-CSE-ConnectionGUID: /ljIHQaKSGypSYozGvkp2A==
X-CSE-MsgGUID: MmOYapaNTyC1BEqaB/9TMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="155291219"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jun 2025 22:22:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTD9Z-000N4a-0y;
	Sun, 22 Jun 2025 05:22:05 +0000
Date: Sun, 22 Jun 2025 13:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chleroy:uaccess_masked 7/7]
 arch/powerpc/include/asm/uaccess.h:510:2: error: call to
 '__compiletime_assert_309' declared with 'error' attribute: BUILD_BUG_ON
 failed: TASK_SIZE_MAX + SZ_128K > border
Message-ID: <202506221303.U8vJZoiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://github.com/chleroy/linux uaccess_masked
head:   ddfbac9ee97c521bcc7bc856f90384363f7e2f74
commit: ddfbac9ee97c521bcc7bc856f90384363f7e2f74 [7/7] powerpc: Implement masked user access
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: powerpc-randconfig-001-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221303.U8vJZoiN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221303.U8vJZoiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506221303.U8vJZoiN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/futex/pi.c:5:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
>> arch/powerpc/include/asm/uaccess.h:510:2: error: call to '__compiletime_assert_309' declared with 'error' attribute: BUILD_BUG_ON failed: TASK_SIZE_MAX + SZ_128K > border
     510 |         BUILD_BUG_ON(TASK_SIZE_MAX + SZ_128K > border);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:568:2: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:20:1: note: expanded from here
      20 | __compiletime_assert_309
         | ^
   In file included from kernel/futex/pi.c:5:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
>> arch/powerpc/include/asm/uaccess.h:510:2: error: call to '__compiletime_assert_309' declared with 'error' attribute: BUILD_BUG_ON failed: TASK_SIZE_MAX + SZ_128K > border
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:568:2: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:20:1: note: expanded from here
      20 | __compiletime_assert_309
         | ^
   In file included from kernel/futex/pi.c:5:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
>> arch/powerpc/include/asm/uaccess.h:510:2: error: call to '__compiletime_assert_309' declared with 'error' attribute: BUILD_BUG_ON failed: TASK_SIZE_MAX + SZ_128K > border
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:568:2: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:20:1: note: expanded from here
      20 | __compiletime_assert_309
         | ^
   3 errors generated.


vim +510 arch/powerpc/include/asm/uaccess.h

ddfbac9ee97c52 Christophe Leroy 2025-06-18  501  
ddfbac9ee97c52 Christophe Leroy 2025-06-18  502  static inline void __user *mask_user_address(const void __user *ptr)
ddfbac9ee97c52 Christophe Leroy 2025-06-18  503  {
ddfbac9ee97c52 Christophe Leroy 2025-06-18  504  #ifdef MODULES_VADDR
ddfbac9ee97c52 Christophe Leroy 2025-06-18  505  	const unsigned long border = MODULES_VADDR;
ddfbac9ee97c52 Christophe Leroy 2025-06-18  506  #else
ddfbac9ee97c52 Christophe Leroy 2025-06-18  507  	const unsigned long border = PAGE_OFFSET;
ddfbac9ee97c52 Christophe Leroy 2025-06-18  508  #endif
ddfbac9ee97c52 Christophe Leroy 2025-06-18  509  	BUILD_BUG_ON(TASK_SIZE_MAX & (SZ_128K - 1));
ddfbac9ee97c52 Christophe Leroy 2025-06-18 @510  	BUILD_BUG_ON(TASK_SIZE_MAX + SZ_128K > border);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  511  	BUILD_BUG_ON(TASK_SIZE_MAX & 0x8000000000000000ULL);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  512  	BUILD_BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(PAGE_OFFSET & 0x8000000000000000ULL));
ddfbac9ee97c52 Christophe Leroy 2025-06-18  513  
ddfbac9ee97c52 Christophe Leroy 2025-06-18  514  	if (IS_ENABLED(CONFIG_PPC64))
ddfbac9ee97c52 Christophe Leroy 2025-06-18  515  		return mask_user_address_simple(ptr);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  516  	if (IS_ENABLED(CONFIG_E500))
ddfbac9ee97c52 Christophe Leroy 2025-06-18  517  		return mask_user_address_e500(ptr);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  518  	if (TASK_SIZE <= SZ_2G && border >= SZ_2G)
ddfbac9ee97c52 Christophe Leroy 2025-06-18  519  		return mask_user_address_simple(ptr);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  520  	if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC))
ddfbac9ee97c52 Christophe Leroy 2025-06-18  521  		return mask_user_address_32(ptr);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  522  	return mask_user_address_fallback(ptr);
ddfbac9ee97c52 Christophe Leroy 2025-06-18  523  }
ddfbac9ee97c52 Christophe Leroy 2025-06-18  524  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
