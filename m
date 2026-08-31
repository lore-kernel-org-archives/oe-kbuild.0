Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85A02EA498
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203047; cv=none; b=LrF14SALKiyKE5lnkwQ1LQwp+kLypWt459DDK7T1KSNsh1t5FtmpgLCATzijHEfKq9iDDzR4BeC0XrmtbECytR9H+RdyN1fQsmkS4o0oSIWHL3tvlKxBglt5a9NzqL8Z0y87faA+KfEr22BDiUVdf/pdI/7lvqmD1GGMcvmXAvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203047; c=relaxed/simple;
	bh=RIQ/PQKLl6zQ4t2YRxy3kVpw4za4Gc24DQOO8rz8kp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ALJ+zmSuTAtI9E1MxHP5U5Nga3Fab6qsWLZf1AARTnw2eD98D0HLT1QXqwngjJWSGcait27tcZC/UAz1LFujpTOoznGC52q5so0pKL27ggRczDKNXOypULifEIpIcujKKcHlsqJMVsTMph1gweDO0+MZkKqurDZLEDda8KjmW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6kkZFSp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6kkZFSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788203045; x=1819739045;
  h=date:from:to:cc:subject:message-id;
  bh=RIQ/PQKLl6zQ4t2YRxy3kVpw4za4Gc24DQOO8rz8kp4=;
  b=Z6kkZFSplkc1HtZsnPcaF3kvX10GG2cgjDwXmF/qf1GW7o6jN0j1m36T
   aRQDoRfVR//24TlLvl83KcCqtBGKJL1wGD1+H2McPxbWRet8Uhp2l3B5D
   lYr5F+ne92N6lMLdpf578xZVKeQaibYZ8Y+LBcCSi6WlSN+b4xwfj9Kuz
   WEo6djLkFdyN+CW/rM0uLOdmuEdB6Cu5WdsygMAD/H6hJhsN/7lS88gmj
   JUIERWmPII6+cvCpGGYZPqZGKeX8RmSp7oAaJImR1UYWcYNee1x/HtOYD
   Usq/akde54d2z4+D8ZS1AePfih+Yb06JItCaCt7UQAJDmU6BKrBhaA2LY
   A==;
X-CSE-ConnectionGUID: n2FQd/z5RXCi0nL8yHlIJQ==
X-CSE-MsgGUID: 2++EH2ZDTP2ThTpeGuTjNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99779707"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99779707"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:04:04 -0700
X-CSE-ConnectionGUID: UtM8mf9aQcG+eFVjY/wTJQ==
X-CSE-MsgGUID: ryi7msMFTLayco5yJvxAWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="273058507"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2026 12:04:03 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x17IW-000000000ZD-2qSp;
	Mon, 31 Aug 2026 19:04:00 +0000
Date: Mon, 31 Aug 2026 21:03:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:irqflags 14/22] include/linux/sched.h:55:10:
 fatal error: 'generated/rq-offsets.h' file not found
Message-ID: <202608312046.HpApJS9W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   ec3ae38eecb47043e2e2d2138e35ee22dedfced4
commit: 713612643bcd86e6e6403ba754428d9d54d27ba6 [14/22] irqflags: Cleanup wrappers
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260831/202608312046.HpApJS9W-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 06bfa42c66dea409a9737f9679260ff51425d5b3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312046.HpApJS9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608312046.HpApJS9W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../../../drivers/nvdimm/core.c:5:
   In file included from include/linux/libnvdimm.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm64/include/asm/pgtable.h:12:
   In file included from arch/arm64/include/asm/mte.h:15:
   In file included from include/linux/page-flags.h:13:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:59:
   include/linux/irqflags.h:205:2: error: call to undeclared function 'arch_safe_halt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |         arch_safe_halt();
         |         ^
   include/linux/irqflags.h:205:2: note: did you mean 'raw_safe_halt'?
   include/linux/irqflags.h:203:29: note: 'raw_safe_halt' declared here
     203 | static __always_inline void raw_safe_halt(void)
         |                             ^
     204 | {
     205 |         arch_safe_halt();
         |         ~~~~~~~~~~~~~~
         |         raw_safe_halt
   In file included from ../../../drivers/nvdimm/core.c:5:
   In file included from include/linux/libnvdimm.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm64/include/asm/pgtable.h:12:
   In file included from arch/arm64/include/asm/mte.h:15:
   In file included from include/linux/page-flags.h:13:
   In file included from include/linux/mm_types.h:11:
   In file included from include/linux/rbtree.h:24:
   In file included from include/linux/rcupdate.h:27:
>> include/linux/sched.h:55:10: fatal error: 'generated/rq-offsets.h' file not found
      55 | #include <generated/rq-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +55 include/linux/sched.h

^1da177e4c3f41 Linus Torvalds             2005-04-16  17  
e034d49eb01c7c Kent Overstreet            2023-12-11  18  #include <linux/cache.h>
c1ffc9c6e4f8a1 Thomas Gleixner            2026-06-02  19  #include <linux/futex_types.h>
9983deb26d9021 Kent Overstreet            2023-12-11  20  #include <linux/irqflags_types.h>
1e2f2d31997a94 Kent Overstreet            2023-12-15  21  #include <linux/smp_types.h>
6d5e9d63683042 Kent Overstreet            2023-12-11  22  #include <linux/pid_types.h>
e034d49eb01c7c Kent Overstreet            2023-12-11  23  #include <linux/sem_types.h>
ab602f79915939 Jack Miller                2014-08-08  24  #include <linux/shm.h>
f80be4571b19b9 Alexander Potapenko        2022-09-15  25  #include <linux/kmsan_types.h>
d84f317915172c Kent Overstreet            2023-12-11  26  #include <linux/mutex_types.h>
8b7787a543cde9 Kent Overstreet            2023-12-11  27  #include <linux/plist_types.h>
50d91c76582513 Kent Overstreet            2023-12-11  28  #include <linux/hrtimer_types.h>
e034d49eb01c7c Kent Overstreet            2023-12-11  29  #include <linux/timer_types.h>
a6e1420ce4fc91 Kent Overstreet            2023-12-11  30  #include <linux/seccomp_types.h>
bea32141764bc7 Kent Overstreet            2022-12-06  31  #include <linux/nodemask_types.h>
f9d6966b7f4182 Kent Overstreet            2023-12-11  32  #include <linux/refcount_types.h>
a3b6714e1744a5 David Woodhouse            2006-04-25  33  #include <linux/resource.h>
9745512ce79de6 Arjan van de Ven           2008-01-25  34  #include <linux/latencytop.h>
5eca1c10cbaa9c Ingo Molnar                2017-02-06  35  #include <linux/sched/prio.h>
9eacb5c7e6607a Thomas Gleixner            2019-08-21  36  #include <linux/sched/types.h>
5eca1c10cbaa9c Ingo Molnar                2017-02-06  37  #include <linux/signal_types.h>
a4f0b6fef4b08e Valentin Schneider         2025-07-12  38  #include <linux/spinlock.h>
55b899aa3e7d0d Kent Overstreet            2023-12-11  39  #include <linux/syscall_user_dispatch_types.h>
5eca1c10cbaa9c Ingo Molnar                2017-02-06  40  #include <linux/mm_types_task.h>
ecefbc09e8ee76 Sebastian Andrzej Siewior  2024-06-20  41  #include <linux/netdevice_xmit.h>
5eca1c10cbaa9c Ingo Molnar                2017-02-06  42  #include <linux/task_io_accounting.h>
53d31ba842d9cc Kent Overstreet            2023-12-11  43  #include <linux/posix-timers_types.h>
cba6167f0adb07 Kent Overstreet            2023-12-11  44  #include <linux/restart_block.h>
faba9d250eaec7 Thomas Gleixner            2025-10-27  45  #include <linux/rseq_types.h>
f038cc1379c0ff Kent Overstreet            2023-12-11  46  #include <linux/seqlock_types.h>
dfd402a4c4baae Marco Elver                2019-11-14  47  #include <linux/kcsan.h>
102227b970a152 Daniel Bristot de Oliveira 2022-07-29  48  #include <linux/rv.h>
af6da56a223831 Kent Overstreet            2023-12-11  49  #include <linux/uidgid_types.h>
26f80681a09b95 Gabriele Monaco            2025-03-05  50  #include <linux/tracepoint-defs.h>
5e32d0f15cc5c8 Steven Rostedt             2025-07-29  51  #include <linux/unwind_deferred_types.h>
5fbda3ecd14a53 Thomas Gleixner            2020-11-18  52  #include <asm/kmap_size.h>
503efe850c7463 Wang Yaxin                 2026-01-19  53  #include <linux/time64.h>
378b7708194fff Menglong Dong              2025-09-17  54  #ifndef COMPILE_OFFSETS
378b7708194fff Menglong Dong              2025-09-17 @55  #include <generated/rq-offsets.h>
378b7708194fff Menglong Dong              2025-09-17  56  #endif
a3b6714e1744a5 David Woodhouse            2006-04-25  57  

:::::: The code at line 55 was first introduced by commit
:::::: 378b7708194fff77c9020392067329931c3fcc04 sched: Make migrate_{en,dis}able() inline

:::::: TO: Menglong Dong <menglong8.dong@gmail.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
