Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF84028F7
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677961387; x=1709497387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPiKw4WvUdFpT7bKOO/giW8oCVXW95CH7B9OuAfPXFI=;
  b=iRgaNFgYYz2MdozsKU5XhPQUx+wFbHc9YpWaRzmDL7MylhjfWZwdFFzk
   D6TSVjpyMJ+mu+JWmy94SEzdcB7OnkcNMGnKponBioPO6q+OdukgzxQSR
   N92BsX2YK256akI9tzCvXMMUtchAxjGzw5FqSIjA78NKZQmONSBenLu3L
   +b2jTJVvkzEBWKB+lx7UNQ0WRpj+BKpOr0JzQKrjdJvNpY4tF/j52zAOw
   PHyHSqzhi0LSVdFfYhudeSPZNZindv5Jq/++ilp/6/ycbTvBqisRMq3CU
   UQM3nVk9epmPCnVJENVIXv4K4TJINZ14LmEo3h2rcdHveIxQeQHoTTvQI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315699891"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="315699891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 12:23:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="625710389"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="625710389"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Mar 2023 12:23:05 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYYPI-0002LI-2n;
	Sat, 04 Mar 2023 20:23:04 +0000
Date: Sun, 5 Mar 2023 04:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/s390/char/con3270.c:203:2: warning: Call to function
 'strcpy' is insecure as it does not provide bounding of the memory buffer.
 Replace unbounded copy functions with analogous functions that support
 length arguments such as 'strlcpy'. CWE-119 [cla...
Message-ID: <202303050448.FS1fRBYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/s390/char/con3270.c:203:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0988a0ea791999ebbf95693f2676381825b05033
commit: 76485078702ae680c9683500ad9caafea05678b1 s390/con3270: rewrite command line recalling
date:   8 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 weeks ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303050448.FS1fRBYy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=76485078702ae680c9683500ad9caafea05678b1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 76485078702ae680c9683500ad9caafea05678b1
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050448.FS1fRBYy-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
                                    ^
   arch/s390/include/asm/percpu.h:71:2: note: expanded from macro 'arch_this_cpu_add'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:254:35: note: expanded from macro 'preempt_disable_notrace'
   #define preempt_disable_notrace() \
                                     ^
   include/linux/percpu-refcount.h:333:3: note: Loop condition is false.  Exiting loop
                   this_cpu_sub(*percpu_count, nr);
                   ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/s390/include/asm/percpu.h:72:10: note: expanded from macro 'arch_this_cpu_add'
           ptr__ = raw_cpu_ptr(&(pcp));                            \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   include/linux/percpu-refcount.h:333:3: note: Dereference of null pointer
                   this_cpu_sub(*percpu_count, nr);
                   ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))(val))
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_size_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   kernel/dma/debug.c:1043:55: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           struct vm_struct *stack_vm_area = task_stack_vm_area(current);
                                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/dma/debug.c:1289:2: note: Taking false branch
           if (unlikely(dma_debug_disabled()))
           ^
   kernel/dma/debug.c:1292:28: note: Assuming 'i' is < 'nents'
           for_each_sg(sg, s, nents, i) {
                                     ^
   include/linux/scatterlist.h:172:31: note: expanded from macro 'for_each_sg'
           for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
                                        ^~~~~~~~~~
   kernel/dma/debug.c:1292:2: note: Loop condition is true.  Entering loop body
           for_each_sg(sg, s, nents, i) {
           ^
   include/linux/scatterlist.h:172:2: note: expanded from macro 'for_each_sg'
           for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
           ^
   kernel/dma/debug.c:1293:3: note: Calling 'check_for_stack'
                   check_for_stack(dev, sg_page(s), s->offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/debug.c:1043:55: note: Dereference of null pointer
           struct vm_struct *stack_vm_area = task_stack_vm_area(current);
                                                                ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/dma/debug.c:1060:4: warning: Value stored to 'addr' is never read [clang-analyzer-deadcode.DeadStores]
                           addr = (u8 *)current->stack + i * PAGE_SIZE + offset;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/debug.c:1060:4: note: Value stored to 'addr' is never read
                           addr = (u8 *)current->stack + i * PAGE_SIZE + offset;
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/s390/char/con3270.c:203:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tp->prompt, input);
           ^~~~~~
   drivers/s390/char/con3270.c:203:2: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
           strcpy(tp->prompt, input);
           ^~~~~~
   drivers/s390/char/con3270.c:1126:24: warning: 1st function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           tty->winsize.ws_row = tty3270_tty_rows(tp);
                                 ^                ~~
   drivers/s390/char/con3270.c:1111:2: note: 'tp' declared without an initial value
           struct tty3270 *tp;
           ^~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1116:2: note: Taking true branch
           if (IS_ERR(view)) {
           ^
   drivers/s390/char/con3270.c:1117:8: note: Calling 'tty3270_create_view'
                   rc = tty3270_create_view(tty->index, &tp);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1028:6: note: Assuming the condition is false
           if (tty3270_max_index < index + 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1028:2: note: Taking false branch
           if (tty3270_max_index < index + 1)
           ^
   drivers/s390/char/con3270.c:1032:7: note: Calling 'tty3270_alloc_view'
           tp = tty3270_alloc_view();
                ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:760:7: note: Calling 'kzalloc'
           tp = kzalloc(sizeof(struct tty3270), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:573:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && size) {
                                          ^
   include/linux/slab.h:584:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:760:7: note: Returning from 'kzalloc'
           tp = kzalloc(sizeof(struct tty3270), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:761:6: note: Assuming 'tp' is non-null, which participates in a condition later
           if (!tp)
               ^~~
   drivers/s390/char/con3270.c:761:2: note: Taking false branch
           if (!tp)
           ^
   drivers/s390/char/con3270.c:765:2: note: Taking false branch
           if (IS_ERR(tp->write))
           ^
   drivers/s390/char/con3270.c:768:2: note: Taking false branch
           if (IS_ERR(tp->read))
           ^
   drivers/s390/char/con3270.c:771:2: note: Taking false branch
           if (IS_ERR(tp->kreset))
           ^
   drivers/s390/char/con3270.c:774:2: note: Taking false branch
           if (IS_ERR(tp->readpartreq))
           ^
   drivers/s390/char/con3270.c:777:6: note: Assuming field 'kbd' is non-null, which participates in a condition later
           if (!tp->kbd)
               ^~~~~~~~
   drivers/s390/char/con3270.c:777:2: note: Taking false branch
           if (!tp->kbd)
           ^
   drivers/s390/char/con3270.c:781:2: note: Loop condition is false.  Exiting loop
           timer_setup(&tp->timer, tty3270_update, 0);
           ^
   include/linux/timer.h:142:2: note: expanded from macro 'timer_setup'
           __init_timer((timer), (callback), (flags))
           ^
   include/linux/timer.h:113:2: note: expanded from macro '__init_timer'
           do {                                                            \
           ^
   drivers/s390/char/con3270.c:786:2: note: Returning pointer (loaded from 'tp'), which participates in a condition later
           return tp;
           ^~~~~~~~~
   drivers/s390/char/con3270.c:1032:7: note: Returning from 'tty3270_alloc_view'
           tp = tty3270_alloc_view();
                ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1033:2: note: Taking true branch
           if (IS_ERR(tp))
           ^
   drivers/s390/char/con3270.c:1034:3: note: Returning without writing to '*newtp'
                   return PTR_ERR(tp);
                   ^
   drivers/s390/char/con3270.c:1034:3: note: Returning value, which participates in a condition later
                   return PTR_ERR(tp);
                   ^~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1117:8: note: Returning from 'tty3270_create_view'
                   rc = tty3270_create_view(tty->index, &tp);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/s390/char/con3270.c:1118:7: note: Assuming 'rc' is 0
                   if (rc)

vim +203 drivers/s390/char/con3270.c

^1da177e4c3f41 drivers/s390/char/tty3270.c Linus Torvalds 2005-04-16  200  
76485078702ae6 drivers/s390/char/con3270.c Sven Schnelle  2022-11-28  201  static void tty3270_update_prompt(struct tty3270 *tp, char *input)
164eb669348045 drivers/s390/char/con3270.c Sven Schnelle  2022-11-28  202  {
76485078702ae6 drivers/s390/char/con3270.c Sven Schnelle  2022-11-28 @203  	strcpy(tp->prompt, input);
^1da177e4c3f41 drivers/s390/char/tty3270.c Linus Torvalds 2005-04-16  204  	tp->update_flags |= TTY_UPDATE_INPUT;
164eb669348045 drivers/s390/char/con3270.c Sven Schnelle  2022-11-28  205  	tty3270_set_timer(tp, 1);
^1da177e4c3f41 drivers/s390/char/tty3270.c Linus Torvalds 2005-04-16  206  }
^1da177e4c3f41 drivers/s390/char/tty3270.c Linus Torvalds 2005-04-16  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
