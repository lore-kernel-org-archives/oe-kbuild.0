Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC228DB54
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828604; cv=none; b=S43t36kClzPJ3zVjD5/0SYgqjY4cDyf38cggFPWJZuKdjExVszj1LHqlUyCyWa/dZCO6w489hPsi/Nu9DaZfsw0AcJm3XXkFvISwfx+UK/2QLfWUUJJ3v37lhNAVmvMKznv324vlI8C/qqt+NBS9iAdFscyhbv6dP2PKUbUz1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828604; c=relaxed/simple;
	bh=uL2YnraB8+BjHtTimuF63PnIKI0sgHgCS9nMmrHT6po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EnamVtdrN8kzr0yPrVb32IIzZyfRhyG/Xovi+AyDUbAlqcL2P/tCRk0B5hEAE6tFbuFl9ibifbXpBOexnW6nN1CeffelNTrK0U7Lg7rimdRdrtyuuBz+CXyMd+QyGW3phgbO37dpzNIplKUM5HI3RMOebK6nlkyFceXBNPI6TmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHrmaxK1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHrmaxK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768828603; x=1800364603;
  h=date:from:to:cc:subject:message-id;
  bh=uL2YnraB8+BjHtTimuF63PnIKI0sgHgCS9nMmrHT6po=;
  b=SHrmaxK1B9URRKdcBoAJThYb0Ur0AnQmqP6shNuZIkGyBjqcD3hMtxN7
   hcbZcB8ekeRR1qYvKpmzYqAsuzsKi8dOkBIee+DdabjSxkTg++gG4+um3
   ZGVZJgL5RyWip+Z/Y89XPn35S+u9pOpFUlMO43C+q0GErZbzq/eX6jQ0e
   KWgAsB5oJ/cNGStyY+m8duWzYpzB1A6nZFIa1kXajlplaEPnixdJky3oo
   8g1JDmAdGWRtlSeWve6JyeqAtyPJlxcExQVSsM243yrUVMznztgbMf00B
   d/Vqe4sg8vKf69D6bfoYM8t+7T43RnfbmBqVLk5OcAlBqO4Pp2hAf417W
   A==;
X-CSE-ConnectionGUID: Z4eSJB6iSy6LMAiGLb9bKg==
X-CSE-MsgGUID: zyCQOPWGS1iQkl9xl+8xDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80339422"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="80339422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:16:43 -0800
X-CSE-ConnectionGUID: +lWdCw6eSw24tysuBPGQjg==
X-CSE-MsgGUID: /gylZqrgRVOV3Z3IhNL+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210006217"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 05:16:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhp7W-00000000Nov-3an9;
	Mon, 19 Jan 2026 13:16:38 +0000
Date: Mon, 19 Jan 2026 21:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-buf-hash 4/4] include/linux/lockdep.h:413:52:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202601192149.rcTFx0NV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-buf-hash
head:   9f73447f84e126bcdeaff55933254bf36fc33136
commit: 9f73447f84e126bcdeaff55933254bf36fc33136 [4/4] disable lockdep
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: s390-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192149.rcTFx0NV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192149.rcTFx0NV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192149.rcTFx0NV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:37:
   In file included from include/linux/spinlock.h:63:
>> include/linux/lockdep.h:413:52: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                    ^
         |                                                    int
   include/linux/lockdep.h:413:65: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     413 | void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
         |                                                                 ^
         |                                                                 int
   In file included from arch/s390/kernel/asm-offsets.c:10:
>> include/linux/sched.h:2042:2: error: use of undeclared identifier 'debug_locks'
    2042 |         lockdep_assert_irqs_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:582:15: note: expanded from macro 'lockdep_assert_irqs_disabled'
     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:573:28: note: expanded from macro '__lockdep_enabled'
     573 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                  ^~~~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:16:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:19:
   include/linux/seqlock.h:68:14: warning: unused variable 'l' [-Wunused-variable]
      68 |         seqcount_t *l = (seqcount_t *)s;
         |                     ^
   In file included from arch/s390/kernel/asm-offsets.c:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/s390/include/asm/pgtable.h:19:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1534:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
   include/linux/srcu.h:197:2: error: call to undeclared function 'lock_sync'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |         lock_map_sync(map);
         |         ^
   include/linux/lockdep.h:546:28: note: expanded from macro 'lock_map_sync'
     546 | #define lock_map_sync(l)                        lock_sync(l, 0, 0, 1, NULL, _THIS_IP_)
         |                                                 ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:15:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_NET_SMALL_RTNL [=y] && DEBUG_KERNEL [=y] && NET [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for DEBUG_LOCK_ALLOC
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && BROKEN [=n]
   Selected by [y]:
   - DEBUG_WW_MUTEX_SLOWPATH [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +/int +413 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar     2006-07-03  411  
eb1cfd09f788e3 Kent Overstreet 2023-05-09  412  #ifdef CONFIG_PROVE_LOCKING
eb1cfd09f788e3 Kent Overstreet 2023-05-09 @413  void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_print_fn);
eb1cfd09f788e3 Kent Overstreet 2023-05-09  414  

:::::: The code at line 413 was first introduced by commit
:::::: eb1cfd09f788e39948a82be8063e54e40dd018d9 lockdep: Add lock_set_cmp_fn() annotation

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
