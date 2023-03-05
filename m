Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B927E
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678003702; x=1709539702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gn0wl3C6elO73N4B7LSdoiKa/LEuv+jfs+C9Sgt6vJU=;
  b=YdEpiDPvXgYDdwxzYPwXRW3fA/oAcacQGEj43XoHx66DjU5QNj55bA0C
   M4FpviAmC9D5hk50JRGn7C6QOh0XkYGvj4oIAfX+rm2ASfS5ex/SjQ5BJ
   CKfRKx/evNnyLcRbE+Pj3HzEit630VHXi6ttZxUaxhgZ7O1TxCI8RDbpN
   Rpk8khSBNhOQmLWBAKI7F7q1iKkOaL7VGGFd691mLmroyxlUVCqMmWNqf
   2qMpLagNwqupCOZVRDdSAJ8FIo2SA7a0NDfyeNK6TgzPrLjGsq1FR8w7f
   zYB7Z8VmDGTcuGLAFwR5pFVcu17hVNcR0kRptZhOH+T1/Akz+3VOZ5ShK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="421634162"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="421634162"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 00:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="708308705"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="708308705"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Mar 2023 00:08:19 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYjPn-0002cK-0W;
	Sun, 05 Mar 2023 08:08:19 +0000
Date: Sun, 5 Mar 2023 16:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/dhry_1.c:151:2: warning: Call to function 'strcpy' is insecure
 as it does not provide bounding of the memory buffer. Replace unbounded copy
 functions with analogous functions that support length arguments such as
 'strlcpy'. CWE-119 [clang-analyzer-sec...
Message-ID: <202303051521.IIWwDDTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/dhry_1.c:151:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b01fe98d34f3bed944a93bd8119fed80c856fad8
commit: d5528cc16893f1f64b07936b1e88aa023128debb lib: add Dhrystone benchmark test
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303051521.IIWwDDTl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5528cc16893f1f64b07936b1e88aa023128debb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d5528cc16893f1f64b07936b1e88aa023128debb
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303051521.IIWwDDTl-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   lib/dhry_1.c:163:2: note: Loop condition is false.  Exiting loop
           pr_debug("Execution starts, %d runs through Dhrystone\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   lib/dhry_1.c:163:2: note: Taking false branch
           pr_debug("Execution starts, %d runs through Dhrystone\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   lib/dhry_1.c:163:2: note: Loop condition is false.  Exiting loop
           pr_debug("Execution starts, %d runs through Dhrystone\n",
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:220:58: note: expanded from macro '__dynamic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   lib/dhry_1.c:172:22: note: Assuming 'Run_Index' is <= 'Number_Of_Runs'
           for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:172:2: note: Loop condition is true.  Entering loop body
           for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index) {
           ^
   lib/dhry_1.c:180:15: note: Assuming the condition is false
                   Bool_Glob = !Func_2(Str_1_Loc, Str_2_Loc);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:182:3: note: Loop condition is true.  Entering loop body
                   while (Int_1_Loc < Int_2_Loc) {
                   ^
   lib/dhry_1.c:182:3: note: Loop condition is false. Execution continues on line 191
   lib/dhry_1.c:194:24: note: Assuming 'Ch_Index' is > 'Ch_2_Glob'
                   for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index) {
                                        ^~~~~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:194:3: note: Loop condition is false. Execution continues on line 205
                   for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index) {
                   ^
   lib/dhry_1.c:209:3: note: Calling 'Proc_2'
                   Proc_2(&Int_1_Loc);
                   ^~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:86:2: note: 'Enum_Loc' declared without an initial value
           Enumeration   Enum_Loc;
           ^~~~~~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:91:7: note: Assuming the condition is false
                   if (Ch_1_Glob == 'A') {
                       ^~~~~~~~~~~~~~~~
   lib/dhry_1.c:91:3: note: Taking false branch
                   if (Ch_1_Glob == 'A') {
                   ^
   lib/dhry_1.c:97:20: note: The left operand of '!=' is a garbage value
           } while (Enum_Loc != Ident_1); /* true */
                    ~~~~~~~~ ^
>> lib/dhry_1.c:151:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
           ^~~~~~
   lib/dhry_1.c:151:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
           ^~~~~~
   lib/dhry_1.c:178:3: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
                   ^~~~~~
   lib/dhry_1.c:178:3: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
                   ^~~~~~
   lib/dhry_1.c:199:5: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
                                   ^~~~~~
   lib/dhry_1.c:199:5: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                                   strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
                                   ^~~~~~
   lib/dhry_1.c:266:2: warning: The left operand of '!=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           dhry_assert_int_eq(Int_1_Loc, 5);
           ^
   lib/dhry_1.c:221:10: note: expanded from macro 'dhry_assert_int_eq'
           if (val != expected)                                            \
               ~~~ ^
   lib/dhry_1.c:128:2: note: 'Int_1_Loc' declared without an initial value
           One_Fifty Int_1_Loc;
           ^~~~~~~~~~~~~~~~~~~
   lib/dhry_1.c:159:2: note: Taking false branch
           pr_debug("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   lib/dhry_1.c:159:2: note: Loop condition is false.  Exiting loop
           pr_debug("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   lib/dhry_1.c:159:2: note: Taking false branch
           pr_debug("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:247:2: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:222:2: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   lib/dhry_1.c:159:2: note: Loop condition is false.  Exiting loop
           pr_debug("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
           ^
   include/linux/printk.h:581:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:268:2: note: expanded from macro 'dynamic_pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:249:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^
--
           ^
   mm/memory.c:5121:3: note: Dereference of null pointer
                   current->min_flt++;
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5141:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->in_lru_fault = !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ));
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5141:26: note: Assuming the condition is false
           current->in_lru_fault = !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:5141:2: note: Dereference of null pointer
           current->in_lru_fault = !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ));
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5146:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->in_lru_fault = false;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5146:2: note: Dereference of null pointer
           current->in_lru_fault = false;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5193:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:213:3: note: expanded from macro '__set_current_state'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:147:3: note: expanded from macro 'debug_normal_state_change'
                   current->task_state_change = _THIS_IP_;                 \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5193:2: note: Dereference of null pointer
           __set_current_state(TASK_RUNNING);
           ^
   include/linux/sched.h:213:3: note: expanded from macro '__set_current_state'
                   debug_normal_state_change((state_value));               \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:147:3: note: expanded from macro 'debug_normal_state_change'
                   current->task_state_change = _THIS_IP_;                 \
                   ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5611:25: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/memory.c:5611:25: note: Dereference of null pointer
           struct mm_struct *mm = current->mm;
                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
>> lib/dhry_run.c:50:4: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                           smp_processor_id(), n, n / DHRY_VAX);
                           ^
   lib/dhry_run.c:77:6: note: Assuming 'dhry_run' is true
           if (dhry_run)
               ^~~~~~~~
   lib/dhry_run.c:77:2: note: Taking true branch
           if (dhry_run)
           ^
   lib/dhry_run.c:78:3: note: Calling 'dhry_benchmark'
                   dhry_benchmark();
                   ^~~~~~~~~~~~~~~~
   lib/dhry_run.c:36:6: note: Assuming 'iterations' is > 0
           if (iterations > 0) {
               ^~~~~~~~~~~~~~
   lib/dhry_run.c:36:2: note: Taking true branch
           if (iterations > 0) {
           ^
   lib/dhry_run.c:38:3: note: Control jumps to line 48
                   goto report;
                   ^
   lib/dhry_run.c:48:6: note: Assuming 'n' is >= 0
           if (n >= 0)
               ^~~~~~
   lib/dhry_run.c:48:2: note: Taking true branch
           if (n >= 0)
           ^
   lib/dhry_run.c:49:3: note: Left side of '&&' is true
                   pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n",
                   ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:381:7: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                       ^
   lib/dhry_run.c:49:3: note: Taking true branch
                   pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n",
                   ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:381:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   lib/dhry_run.c:49:3: note: '?' condition is true
                   pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n",
                   ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:390:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   lib/dhry_run.c:49:3: note: '?' condition is true
                   pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n",
                   ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:394:14: note: expanded from macro '__printk_index_emit'
                                   .level = __builtin_constant_p(_level) ? (_level) : NULL, \
                                            ^
   lib/dhry_run.c:49:3: note: Loop condition is false.  Exiting loop
                   pr_info("CPU%u: Dhrystones per Second: %d (%d DMIPS)\n",
                   ^
   include/linux/printk.h:530:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:457:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:428:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:380:2: note: expanded from macro '__printk_index_emit'
           do {                                                            \

vim +151 lib/dhry_1.c

d5528cc16893f1 Geert Uytterhoeven 2022-12-08  124  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  125    /* main program, corresponds to procedures        */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  126    /* Main and Proc_0 in the Ada version             */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  127  {
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  128  	One_Fifty Int_1_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  129  	One_Fifty Int_2_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  130  	One_Fifty Int_3_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  131  	char Ch_Index;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  132  	Enumeration Enum_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  133  	Str_30 Str_1_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  134  	Str_30 Str_2_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  135  	int Run_Index;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  136  	int Number_Of_Runs;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  137  	ktime_t Begin_Time, End_Time;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  138  	u32 User_Time;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  139  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  140  	/* Initializations */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  141  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  142  	Next_Ptr_Glob = (Rec_Pointer)kzalloc(sizeof(Rec_Type), GFP_KERNEL);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  143  	Ptr_Glob = (Rec_Pointer)kzalloc(sizeof(Rec_Type), GFP_KERNEL);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  144  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  145  	Ptr_Glob->Ptr_Comp = Next_Ptr_Glob;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  146  	Ptr_Glob->Discr = Ident_1;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  147  	Ptr_Glob->variant.var_1.Enum_Comp = Ident_3;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  148  	Ptr_Glob->variant.var_1.Int_Comp = 40;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  149  	strcpy(Ptr_Glob->variant.var_1.Str_Comp,
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  150  	       "DHRYSTONE PROGRAM, SOME STRING");
d5528cc16893f1 Geert Uytterhoeven 2022-12-08 @151  	strcpy(Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  152  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  153  	Arr_2_Glob[8][7] = 10;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  154  	/* Was missing in published program. Without this statement,    */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  155  	/* Arr_2_Glob[8][7] would have an undefined value.             */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  156  	/* Warning: With 16-Bit processors and Number_Of_Runs > 32000,  */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  157  	/* overflow may occur for this array element.                   */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  158  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  159  	pr_debug("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  160  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  161  	Number_Of_Runs = n;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  162  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  163  	pr_debug("Execution starts, %d runs through Dhrystone\n",
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  164  		 Number_Of_Runs);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  165  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  166  	/***************/
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  167  	/* Start timer */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  168  	/***************/
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  169  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  170  	Begin_Time = ktime_get();
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  171  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  172  	for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index) {
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  173  		Proc_5();
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  174  		Proc_4();
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  175  		/* Ch_1_Glob == 'A', Ch_2_Glob == 'B', Bool_Glob == true */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  176  		Int_1_Loc = 2;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  177  		Int_2_Loc = 3;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  178  		strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  179  		Enum_Loc = Ident_2;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  180  		Bool_Glob = !Func_2(Str_1_Loc, Str_2_Loc);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  181  		/* Bool_Glob == 1 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  182  		while (Int_1_Loc < Int_2_Loc) {
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  183  			/* loop body executed once */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  184  			Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  185  			/* Int_3_Loc == 7 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  186  			Proc_7(Int_1_Loc, Int_2_Loc, &Int_3_Loc);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  187  			/* Int_3_Loc == 7 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  188  			Int_1_Loc += 1;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  189  		} /* while */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  190  		/* Int_1_Loc == 3, Int_2_Loc == 3, Int_3_Loc == 7 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  191  		Proc_8(Arr_1_Glob, Arr_2_Glob, Int_1_Loc, Int_3_Loc);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  192  		/* Int_Glob == 5 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  193  		Proc_1(Ptr_Glob);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  194  		for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index) {
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  195  			/* loop body executed twice */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  196  			if (Enum_Loc == Func_1(Ch_Index, 'C')) {
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  197  				/* then, not executed */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  198  				Proc_6(Ident_1, &Enum_Loc);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  199  				strcpy(Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  200  				Int_2_Loc = Run_Index;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  201  				Int_Glob = Run_Index;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  202  			}
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  203  		}
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  204  		/* Int_1_Loc == 3, Int_2_Loc == 3, Int_3_Loc == 7 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  205  		Int_2_Loc = Int_2_Loc * Int_1_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  206  		Int_1_Loc = Int_2_Loc / Int_3_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  207  		Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  208  		/* Int_1_Loc == 1, Int_2_Loc == 13, Int_3_Loc == 7 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  209  		Proc_2(&Int_1_Loc);
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  210  		/* Int_1_Loc == 5 */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  211  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  212  	} /* loop "for Run_Index" */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  213  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  214  	/**************/
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  215  	/* Stop timer */
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  216  	/**************/
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  217  
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  218  	End_Time = ktime_get();
d5528cc16893f1 Geert Uytterhoeven 2022-12-08  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
