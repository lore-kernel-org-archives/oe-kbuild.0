Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322AD1FBD
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679045826; x=1710581826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4xlK8t08GXhkAl29OFDHCs9Wqq/BJ2yNPjQdnPNy3A=;
  b=bdHyUbHk//4qh1aGJ3oBvf7YFtdkFYc4f1qWMbA2GoZjVVE7OwWnr3ym
   ftBkiRSRNJa7bQvR4znsZJi9kWjVHFiRGEwkHkfims/PQ6AMU6dz2+IeF
   FrIZZbKQL9wOQTU8T0lKwcIN3m7J0mvb6XCDQBGXuaoRKgJ8DSDqJTF3d
   faO7eJtX2cTbRuIEpJn2A0QtZC1djeGJE62fRpfDsz+PhxGLMicBwcTFQ
   4JyVWH9MIeUgVBK0VJ9Cpb/L1KAVpc1bp8vztJOaLmOSuSm/H+bNdNcAF
   nRG1IXvjCdgdml+PyVWDmG896SyXhedEDm+24xeMKYFJ8GEnVLsWM6C9Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340586772"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="340586772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 02:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="673497716"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="673497716"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 02:37:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd6WF-0009GU-0Z;
	Fri, 17 Mar 2023 09:37:03 +0000
Date: Fri, 17 Mar 2023 17:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] notifiers: Add tracepoints to the notifiers
 infrastructure
Message-ID: <202303171713.fai0WuRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/notifiers.h:33:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230314200058.1326909-1-gpiccoli@igalia.com>
References: <20230314200058.1326909-1-gpiccoli@igalia.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
TO: akpm@linux-foundation.org
TO: linux-kernel@vger.kernel.org
CC: kexec@lists.infradead.org
CC: bhe@redhat.com
CC: pmladek@suse.com
CC: xiyou.wangcong@gmail.com
CC: dmitry.osipenko@collabora.com
CC: rafael.j.wysocki@intel.com
CC: bigeasy@linutronix.de
CC: valentin.schneider@arm.com
CC: kernel-dev@igalia.com
CC: kernel@gpiccoli.net
CC: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Arjan van de Ven <arjan@linux.intel.com>
CC: Michael Kelley <mikelley@microsoft.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Xiaoming Ni <nixiaoming@huawei.com>

Hi Guilherme,

I love your patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.3-rc2]
[cannot apply to next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilherme-G-Piccoli/notifiers-Add-tracepoints-to-the-notifiers-infrastructure/20230315-040322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230314200058.1326909-1-gpiccoli%40igalia.com
patch subject: [PATCH v4] notifiers: Add tracepoints to the notifiers infrastructure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171713.fai0WuRp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/910a57f151b89a119a198bf1fc6c398481cd0cdd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Guilherme-G-Piccoli/notifiers-Add-tracepoints-to-the-notifiers-infrastructure/20230315-040322
        git checkout 910a57f151b89a119a198bf1fc6c398481cd0cdd
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303171713.fai0WuRp-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/input/serio/ps2-gpio.c:135:6: note: Calling 'preempt_count'
           if (in_task()) {
               ^
   include/linux/preempt.h:121:23: note: expanded from macro 'in_task'
   #define in_task()               (!(in_nmi() | in_hardirq() | in_serving_softirq()))
                                      ^~~~~~~~
   include/linux/preempt.h:118:20: note: expanded from macro 'in_nmi'
   #define in_nmi()                (nmi_count())
                                    ^~~~~~~~~~~
   include/linux/preempt.h:101:22: note: expanded from macro 'nmi_count'
   #define nmi_count()     (preempt_count() & NMI_MASK)
                            ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:364:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:365:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:377:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:17:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:369:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:17:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RESCHED;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/serio/ps2-gpio.c:223:4: warning: Value stored to 'rxflags' is never read [clang-analyzer-deadcode.DeadStores]
                           rxflags |= SERIO_PARITY;
                           ^
   drivers/input/serio/ps2-gpio.c:223:4: note: Value stored to 'rxflags' is never read
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   15 warnings generated.
>> include/trace/events/notifiers.h:33:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(notifiers_info, notifiers_register,
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

vim +33 include/trace/events/notifiers.h

910a57f151b89a Guilherme G. Piccoli 2023-03-14  26  
910a57f151b89a Guilherme G. Piccoli 2023-03-14  27  /*
910a57f151b89a Guilherme G. Piccoli 2023-03-14  28   * notifiers_register - called upon notifier callback registration
910a57f151b89a Guilherme G. Piccoli 2023-03-14  29   *
910a57f151b89a Guilherme G. Piccoli 2023-03-14  30   * @cb:		callback pointer
910a57f151b89a Guilherme G. Piccoli 2023-03-14  31   *
910a57f151b89a Guilherme G. Piccoli 2023-03-14  32   */
910a57f151b89a Guilherme G. Piccoli 2023-03-14 @33  DEFINE_EVENT(notifiers_info, notifiers_register,
910a57f151b89a Guilherme G. Piccoli 2023-03-14  34  
910a57f151b89a Guilherme G. Piccoli 2023-03-14  35  	TP_PROTO(void *cb),
910a57f151b89a Guilherme G. Piccoli 2023-03-14  36  
910a57f151b89a Guilherme G. Piccoli 2023-03-14  37  	TP_ARGS(cb)
910a57f151b89a Guilherme G. Piccoli 2023-03-14  38  );
910a57f151b89a Guilherme G. Piccoli 2023-03-14  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
