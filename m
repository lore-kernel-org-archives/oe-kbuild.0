Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C52C9D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679095526; x=1710631526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVHIbbCP7dXne0fmNi14Gsq4C0Q/4VyTxdz/2jaJOxo=;
  b=Nt2fJ4Oayw23fFP7w0zgpvUacp8ejm7E5u2yKPtTKunfULoQa35ki7dh
   NOeQzRxsXdky0PIiVGQftvH7Xsk4aJvnxl/NoS4zlzf2g7xwgBcKFb+8i
   FfF+xJu+UsH3vduLHP+XMZyJsQrWyJjq/iLjLkS4t3dSrWwE/ojWurCjc
   MBhkQkL668dnIaJtIjpZVh8yL84hhRo98uL1FEgTJqsXi46xhH7FsUwEq
   Yw4ozL816u6Vpx+gcoSf/M/7FqZ9lchdYhIk3sGGOzU6hnWiFXaKYkGGR
   8ST5sHdSPfIwyLX+XVFnite/6tFvdpxO3oYuQcQOHsLPycZN8X/6Uahr1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318782822"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="318782822"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 16:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="804271554"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="804271554"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Mar 2023 16:25:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdJRr-0009eU-09;
	Fri, 17 Mar 2023 23:25:23 +0000
Date: Sat, 18 Mar 2023 07:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3815/4413] include/trace/events/notifier.h:33:1:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303180739.bKXY3XtY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/notifier.h:33:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 9db243bc3d81f9fa34bba6f4c94972fdac8ce355 [3815/4413] notifiers: add tracepoints to the notifiers infrastructure
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180739.bKXY3XtY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9db243bc3d81f9fa34bba6f4c94972fdac8ce355
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9db243bc3d81f9fa34bba6f4c94972fdac8ce355
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303180739.bKXY3XtY-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           if (connection->state == GB_CONNECTION_STATE_DISABLED)
           ^
   drivers/greybus/connection.c:862:2: note: Calling 'trace_gb_connection_disable'
           trace_gb_connection_disable(connection);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/greybus_trace.h:233:1: note: Taking true branch
   DEFINE_CONNECTION_EVENT(gb_connection_disable);
   ^
   drivers/greybus/greybus_trace.h:194:3: note: expanded from macro 'DEFINE_CONNECTION_EVENT'
                   DEFINE_EVENT(gb_connection, name,                       \
                   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:430:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:258:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/greybus/greybus_trace.h:233:1: note: Dereference of null pointer
   DEFINE_CONNECTION_EVENT(gb_connection_disable);
   ^
   drivers/greybus/greybus_trace.h:194:3: note: expanded from macro 'DEFINE_CONNECTION_EVENT'
                   DEFINE_EVENT(gb_connection, name,                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:261:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:199:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   drivers/greybus/greybus_trace.h:486:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_HD_EVENT(gb_hd_in);
   ^
   drivers/greybus/greybus_trace.h:453:3: note: expanded from macro 'DEFINE_HD_EVENT'
                   DEFINE_EVENT(gb_host_device, name,                      \
                   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/greybus/connection.c:81:2: note: Calling 'trace_gb_hd_in'
           trace_gb_hd_in(hd);
           ^~~~~~~~~~~~~~~~~~
   drivers/greybus/greybus_trace.h:486:1: note: Taking true branch
   DEFINE_HD_EVENT(gb_hd_in);
   ^
   drivers/greybus/greybus_trace.h:453:3: note: expanded from macro 'DEFINE_HD_EVENT'
                   DEFINE_EVENT(gb_host_device, name,                      \
                   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:430:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:258:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   drivers/greybus/greybus_trace.h:486:1: note: Dereference of null pointer
   DEFINE_HD_EVENT(gb_hd_in);
   ^
   drivers/greybus/greybus_trace.h:453:3: note: expanded from macro 'DEFINE_HD_EVENT'
                   DEFINE_EVENT(gb_host_device, name,                      \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:261:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:199:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
>> include/trace/events/notifier.h:33:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(notifier_info, notifier_register,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/notifier.c:602:9: note: Calling 'atomic_notifier_chain_register'
           return atomic_notifier_chain_register(&die_chain, nb);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/notifier.c:155:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&nh->lock, flags);
           ^
   include/linux/spinlock.h:380:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   kernel/notifier.c:155:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&nh->lock, flags);
           ^
   include/linux/spinlock.h:378:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   kernel/notifier.c:156:8: note: Calling 'notifier_chain_register'
           ret = notifier_chain_register(&nh->head, n, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/notifier.c:29:9: note: Assuming the condition is false
           while ((*nl) != NULL) {
                  ^~~~~~~~~~~~~
   kernel/notifier.c:29:2: note: Loop condition is false. Execution continues on line 41
           while ((*nl) != NULL) {
           ^
   kernel/notifier.c:42:2: note: Left side of '&&' is false
           rcu_assign_pointer(*nl, n);
           ^
   include/linux/rcupdate.h:523:30: note: expanded from macro 'rcu_assign_pointer'
           if (__builtin_constant_p(v) && (_r_a_p__v) == (uintptr_t)NULL)        \
                                       ^
   kernel/notifier.c:42:2: note: Loop condition is false.  Exiting loop
           rcu_assign_pointer(*nl, n);
           ^
   include/linux/rcupdate.h:526:3: note: expanded from macro 'rcu_assign_pointer'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                   ^
   include/asm-generic/barrier.h:172:38: note: expanded from macro 'smp_store_release'
   #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                        ^
   include/linux/kcsan-checks.h:267:25: note: expanded from macro 'kcsan_release'
   #define kcsan_release() do { } while (0)
                           ^
   kernel/notifier.c:42:2: note: Left side of '||' is false
           rcu_assign_pointer(*nl, n);
           ^
   include/linux/rcupdate.h:526:3: note: expanded from macro 'rcu_assign_pointer'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                   ^
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
   #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                         ^
   arch/s390/include/asm/barrier.h:40:2: note: expanded from macro '__smp_store_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:400:21: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   kernel/notifier.c:42:2: note: Left side of '||' is false
           rcu_assign_pointer(*nl, n);
           ^
   include/linux/rcupdate.h:526:3: note: expanded from macro 'rcu_assign_pointer'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                   ^
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
   #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
                                                         ^
   arch/s390/include/asm/barrier.h:40:2: note: expanded from macro '__smp_store_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:400:21: note: expanded from macro 'compiletime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   kernel/notifier.c:42:2: note: Left side of '||' is false
           rcu_assign_pointer(*nl, n);
           ^
   include/linux/rcupdate.h:526:3: note: expanded from macro 'rcu_assign_pointer'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
                   ^
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
   #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)

vim +33 include/trace/events/notifier.h

9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  26  
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  27  /*
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  28   * notifier_register - called upon notifier callback registration
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  29   *
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  30   * @cb:		callback pointer
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  31   *
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  32   */
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14 @33  DEFINE_EVENT(notifier_info, notifier_register,
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  34  
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  35  	TP_PROTO(void *cb),
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  36  
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  37  	TP_ARGS(cb)
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  38  );
9db243bc3d81f9 Guilherme G. Piccoli 2023-03-14  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
