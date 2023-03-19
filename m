Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DF7C
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679263524; x=1710799524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=boeTuxsiYph15XGoqiJmS9dGiau/A6BmYbn0j02AhpQ=;
  b=b+DMKVklZiZ6WWFvz6Jq2EX1hiy2gCRjrHsen78ATJGl6bvuJ2FAxj2i
   Fj1esNJbke1AvsSp5x4rWDut1beYDTc+oHrEJXMVh01fN62oaCnKW716U
   fxl4CJEzyiFy9eMGEU+qUKacVMX+zuKBcM0GI4ns53i2miuWp0G/7n+ug
   wbct6ibHRxZFTvWPRT8+F2uHLETHn+LXrkQ8U3t92GkCXRFtQxgA3PizW
   WxTXwXT4drzvFJFavEU1CxXj3sgTfNkmAe7BRC7ezSoPmAlvbd3GEsjI+
   MRx9Kroj5aXvmNvcflzb3wjRd2rHeQ03xFQpyl8ASsMASE/FoGnqaZqTU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326912377"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="326912377"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 15:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926770059"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="926770059"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2023 15:05:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe19V-000Ag4-21;
	Sun, 19 Mar 2023 22:05:21 +0000
Date: Mon, 20 Mar 2023 06:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_timer_imp_v1 5/40] kernel/irq/ipi-mux.c:56:22:
 warning: Value stored to 'icpu' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303200644.uVeiR05f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/irq/ipi-mux.c:56:22: warning: Value stored to 'icpu' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   4857c17859cb86c385e7e17acd52266dad120e81
commit: 302039ad1384af843559886391042dc0b3e81f92 [5/40] RISC-V: Treat IPIs as normal Linux IRQs
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230320/202303200644.uVeiR05f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/302039ad1384af843559886391042dc0b3e81f92
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_imp_v1
        git checkout 302039ad1384af843559886391042dc0b3e81f92
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303200644.uVeiR05f-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   26 warnings generated.
   Suppressed 26 warnings (13 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   include/asm-generic/bitops/generic-non-atomic.h:128:16: warning: Array access (from variable 'addr') results in a null pointer dereference [clang-analyzer-core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   kernel/time/alarmtimer.c:92:6: note: Assuming 'rtcdev' is null
           if (rtcdev)
               ^~~~~~
   kernel/time/alarmtimer.c:92:2: note: Taking false branch
           if (rtcdev)
           ^
   kernel/time/alarmtimer.c:95:7: note: Left side of '&&' is true
           if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
                ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   kernel/time/alarmtimer.c:95:7: note: Assuming field 'features' is equal to 0
           if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
                ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/alarmtimer.c:95:7: note: Left side of '&&' is false
           if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
                ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   kernel/time/alarmtimer.c:95:35: note: Passing null pointer value via 2nd parameter 'addr'
           if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
                                            ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                                                ^~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   kernel/time/alarmtimer.c:95:7: note: Calling 'generic_test_bit'
           if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
                ^
   include/linux/bitops.h:61:35: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:20: note: expanded from macro '_test_bit'
   #define _test_bit               arch_test_bit
                                   ^
   include/asm-generic/bitops/non-atomic.h:15:23: note: expanded from macro 'arch_test_bit'
   #define arch_test_bit generic_test_bit
                         ^
   include/linux/bitops.h:53:25: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:128:16: note: Array access (from variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   kernel/irq/irqdomain.c:640:2: warning: Value stored to 'of_node' is never read [clang-analyzer-deadcode.DeadStores]
           of_node = irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdomain.c:640:2: note: Value stored to 'of_node' is never read
           of_node = irq_domain_get_of_node(domain);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (6 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
>> kernel/irq/ipi-mux.c:56:22: warning: Value stored to 'icpu' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
                               ^~~~
   kernel/irq/ipi-mux.c:56:22: note: Value stored to 'icpu' during its initialization is never read
           struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
                               ^~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/rcu/srcutree.c:226:30: warning: Access to field 'grplo' results in a dereference of a null pointer (loaded from field 'mynode') [clang-analyzer-core.NullDereference]
                   sdp->grpmask = 1 << (cpu - sdp->mynode->grplo);
                                              ^
   kernel/rcu/srcutree.c:1904:2: note: Control jumps to 'case MODULE_STATE_COMING:'  at line 1905
           switch (val) {
           ^
   kernel/rcu/srcutree.c:1906:9: note: Calling 'srcu_module_coming'
                   ret = srcu_module_coming(mod);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:1879:14: note: Assuming 'i' is < field 'num_srcu_structs'
           for (i = 0; i < mod->num_srcu_structs; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:1879:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < mod->num_srcu_structs; i++) {
           ^
   kernel/rcu/srcutree.c:1880:9: note: Calling '__init_srcu_struct'
                   ret = init_srcu_struct(*(sspp++));
                         ^
   include/linux/srcu.h:35:2: note: expanded from macro 'init_srcu_struct'
           __init_srcu_struct((ssp), #ssp, &__srcu_key); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:280:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&ACCESS_PRIVATE(ssp, lock));
           ^
   include/linux/spinlock.h:330:35: note: expanded from macro 'spin_lock_init'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   kernel/rcu/srcutree.c:281:9: note: Calling 'init_srcu_struct_fields'
           return init_srcu_struct_fields(ssp, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/srcutree.c:241:2: note: Loop condition is false.  Exiting loop
           mutex_init(&ssp->srcu_cb_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   kernel/rcu/srcutree.c:242:2: note: Loop condition is false.  Exiting loop
           mutex_init(&ssp->srcu_gp_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   kernel/rcu/srcutree.c:246:2: note: Loop condition is false.  Exiting loop
           mutex_init(&ssp->srcu_barrier_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   kernel/rcu/srcutree.c:248:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&ssp->work, process_srcu);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:252:3: note: expanded from macro '__INIT_DELAYED_WORK'
                   INIT_WORK(&(_work)->work, (_func));                     \
                   ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   kernel/rcu/srcutree.c:248:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&ssp->work, process_srcu);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:253:3: note: expanded from macro '__INIT_DELAYED_WORK'
                   __init_timer(&(_work)->timer,                           \
                   ^
   include/linux/timer.h:113:2: note: expanded from macro '__init_timer'
           do {                                                            \
           ^
   kernel/rcu/srcutree.c:248:2: note: Loop condition is false.  Exiting loop
           INIT_DELAYED_WORK(&ssp->work, process_srcu);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:251:2: note: expanded from macro '__INIT_DELAYED_WORK'
           do {                                                            \

vim +/icpu +56 kernel/irq/ipi-mux.c

835a486cd9f557 Anup Patel 2023-01-03  53  
835a486cd9f557 Anup Patel 2023-01-03  54  static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
835a486cd9f557 Anup Patel 2023-01-03  55  {
835a486cd9f557 Anup Patel 2023-01-03 @56  	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
835a486cd9f557 Anup Patel 2023-01-03  57  	u32 ibit = BIT(irqd_to_hwirq(d));
835a486cd9f557 Anup Patel 2023-01-03  58  	unsigned long pending;
835a486cd9f557 Anup Patel 2023-01-03  59  	int cpu;
835a486cd9f557 Anup Patel 2023-01-03  60  
835a486cd9f557 Anup Patel 2023-01-03  61  	for_each_cpu(cpu, mask) {
835a486cd9f557 Anup Patel 2023-01-03  62  		icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
835a486cd9f557 Anup Patel 2023-01-03  63  
835a486cd9f557 Anup Patel 2023-01-03  64  		/*
835a486cd9f557 Anup Patel 2023-01-03  65  		 * This sequence is the mirror of the one in ipi_mux_unmask();
835a486cd9f557 Anup Patel 2023-01-03  66  		 * see the comment there. Additionally, release semantics
835a486cd9f557 Anup Patel 2023-01-03  67  		 * ensure that the vIPI flag set is ordered after any shared
835a486cd9f557 Anup Patel 2023-01-03  68  		 * memory accesses that precede it. This therefore also pairs
835a486cd9f557 Anup Patel 2023-01-03  69  		 * with the atomic_fetch_andnot in ipi_mux_process().
835a486cd9f557 Anup Patel 2023-01-03  70  		 */
835a486cd9f557 Anup Patel 2023-01-03  71  		pending = atomic_fetch_or_release(ibit, &icpu->bits);
835a486cd9f557 Anup Patel 2023-01-03  72  
835a486cd9f557 Anup Patel 2023-01-03  73  		/*
835a486cd9f557 Anup Patel 2023-01-03  74  		 * The atomic_fetch_or_release() above must complete
835a486cd9f557 Anup Patel 2023-01-03  75  		 * before the atomic_read() below to avoid racing with
835a486cd9f557 Anup Patel 2023-01-03  76  		 * ipi_mux_unmask().
835a486cd9f557 Anup Patel 2023-01-03  77  		 */
835a486cd9f557 Anup Patel 2023-01-03  78  		smp_mb__after_atomic();
835a486cd9f557 Anup Patel 2023-01-03  79  
835a486cd9f557 Anup Patel 2023-01-03  80  		/*
835a486cd9f557 Anup Patel 2023-01-03  81  		 * The flag writes must complete before the physical IPI is
835a486cd9f557 Anup Patel 2023-01-03  82  		 * issued to another CPU. This is implied by the control
835a486cd9f557 Anup Patel 2023-01-03  83  		 * dependency on the result of atomic_read() below, which is
835a486cd9f557 Anup Patel 2023-01-03  84  		 * itself already ordered after the vIPI flag write.
835a486cd9f557 Anup Patel 2023-01-03  85  		 */
835a486cd9f557 Anup Patel 2023-01-03  86  		if (!(pending & ibit) && (atomic_read(&icpu->enable) & ibit))
835a486cd9f557 Anup Patel 2023-01-03  87  			ipi_mux_send(cpu);
835a486cd9f557 Anup Patel 2023-01-03  88  	}
835a486cd9f557 Anup Patel 2023-01-03  89  }
835a486cd9f557 Anup Patel 2023-01-03  90  

:::::: The code at line 56 was first introduced by commit
:::::: 835a486cd9f55790dee9f6b67ce0057d49f15da5 genirq: Add mechanism to multiplex a single HW IPI

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
