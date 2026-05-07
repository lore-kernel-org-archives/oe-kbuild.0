Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313536494A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139476; cv=none; b=AjSbtTWYTjZU24Q3A1YdEbGqm+0nEv8l8PZwZGIRCo8ImMI1xPkxDblLBQKjHj47arPBA8d48BaSi97jR96dKfzMDLtzVxcwi8LXxQzGJMowfHYrr49ktYvtLRJZL7m3s72cDLJsiGwgM09g69vyXYHtEx/EAhJilSBR/BO1fhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139476; c=relaxed/simple;
	bh=mgNfHsrrslFFdVdbyDL3zxWl+YK4efJOntOcAgDdHpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccdRi9K8vFqlKMv+Mu43d94euovDUWdYcFFN933sIszvElKemQn0Zq4bgK5TxR6X10U9X/6wHexCwjLvpkIjrR+HorWOIpXUZUxyTNH80+ttVMKDyIyYqgIkx14bU1CaxgMsYbXzs233/68HQ/zQcxnhSm+ngU4dPD+mbz0aDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkALFWoE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkALFWoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778139475; x=1809675475;
  h=date:from:to:cc:subject:message-id;
  bh=mgNfHsrrslFFdVdbyDL3zxWl+YK4efJOntOcAgDdHpg=;
  b=NkALFWoEyO0D3Tyk/gMlI4nq3gHXRUGAj8SQox5pu6jjhhd51VVdPK3B
   zaJVlJJNQofCOVum7bqkeXg+i3eqpYU6qlAyz4ME0wbUFZq6dEJpfatpJ
   1jvtLHJkxfrejiikdYDBNpIFij+TmEWK2wnGKNAm2s5rIGPgwiT60n0Fz
   PGEd1hCEnUslW7u3zgt6Dma2SBLSjxropxzuLT+mq+m2LBTeONqqg5OXN
   R4HWrEpovwu1HqqnVhxT7e/TITRNLjNVWgro4whjPwxcsBYOh0D3sO/MW
   iYcxUHNsEj1ke8a56IOBOcYlyYVgZvYXwLBM4JSOFdRgwTJHUolgSyG5K
   g==;
X-CSE-ConnectionGUID: phL07ufMTPuFwtyoKtfHtw==
X-CSE-MsgGUID: U3djd5f6QfCgDDryQ5xAag==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96512214"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96512214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:37:54 -0700
X-CSE-ConnectionGUID: RA+cuFpERImnl5Q7Cc06ZQ==
X-CSE-MsgGUID: fKOv4BcuQ9uAHt7bzG6qpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266769181"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2026 00:37:52 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKtIs-0000000006P-2GWI;
	Thu, 07 May 2026 07:37:50 +0000
Date: Thu, 07 May 2026 15:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alexshi:pr/14 1/2] arch/x86/kernel/ptrace.c:245:2: error:
 call to '__compiletime_assert_297' declared with 'error' attribute:
 BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
Message-ID: <202605071520.xUuuGA1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: alexs@kernel.org

Hi Alex,

FYI, the error/warning still remains.

tree:   https://github.com/alexshi/linux.git pr/14
head:   2c747efc9d7577692406c8a4074612499513ed93
commit: 80997c8b66fd8d73a96cd681a473bacaf75b7d98 [1/2] x86/ptrace: move down unused registers
:::::: branch date: 12 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605071520.xUuuGA1z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071520.xUuuGA1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605071520.xUuuGA1z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/ptrace.c:11:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
     245 |         BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
>> arch/x86/kernel/ptrace.c:245:2: error: call to '__compiletime_assert_297' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct pt_regs, r15) != 0
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:435:2: note: expanded from macro 'compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:5:1: note: expanded from here
       5 | __compiletime_assert_297
         | ^
   1 warning and 3 errors generated.


vim +245 arch/x86/kernel/ptrace.c

2047b08be67b708 Roland McGrath 2008-01-30  242  
2047b08be67b708 Roland McGrath 2008-01-30  243  static unsigned long *pt_regs_access(struct pt_regs *regs, unsigned long offset)
2047b08be67b708 Roland McGrath 2008-01-30  244  {
2047b08be67b708 Roland McGrath 2008-01-30 @245  	BUILD_BUG_ON(offsetof(struct pt_regs, r15) != 0);
2047b08be67b708 Roland McGrath 2008-01-30  246  	return &regs->r15 + (offset / sizeof(regs->r15));
2047b08be67b708 Roland McGrath 2008-01-30  247  }
2047b08be67b708 Roland McGrath 2008-01-30  248  

:::::: The code at line 245 was first introduced by commit
:::::: 2047b08be67b70875d8765fc81d34ce28041bec3 x86: x86 ptrace getreg/putreg merge

:::::: TO: Roland McGrath <roland@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
