Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249D7F
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675577956; x=1707113956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUwiN/dis6iItzcZI3U5RlayEQ0w7t4mOF32qLCQ/UU=;
  b=FW8FHyZgz5Oe7DvUSWXAYMUYjTTzRDRDMzIzwSpl8M+znJ9d6IO/MXVh
   lZdQTubIC+UNuW6QfANRoqVZMlmiRM0UUZYeNPeo9pU1xF10nNu70BynH
   Rrd/0rGRR6/9onOSJ8ijuBKO1eJMXcMpFh2uK+MHM/s9ZXkKFa2ePlqpI
   PP3kcRWRm+yBPxxE+KloqrXaF7kVUbtJYi8LDUHFSHNvpaz12Yh0xFq4Y
   u+PgMp6LLZ3VK9EpP488ZTL6nXhJ/75tyRwYMp2IxlFPoT/I5YHgzj03e
   W0almPQQlLLHchwi1VEyEBY4eYLKmyMxe3+F6s74JD+qPwCdDwHmoDcQ+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415236589"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="415236589"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790117686"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790117686"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 22:19:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYMo-0001n5-1e;
	Sun, 05 Feb 2023 06:19:10 +0000
Date: Sun, 5 Feb 2023 14:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/bitops.h:82:8: warning: Use of memory after it
 is freed [clang-analyzer-unix.Malloc]
Message-ID: <202302051406.aaeNhvqO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/include/asm/bitops.h:82:8: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Guillaume Nault <gnault@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   837c07cf68fec9cad455d5fc86aab5350cc06c53
commit: c4d48a58f32c5972174a1d01c33b296fe378cce0 l2tp: convert l2tp_tunnel_list to idr
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20230204 (https://download.01.org/0day-ci/archive/20230205/202302051406.aaeNhvqO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c4d48a58f32c5972174a1d01c33b296fe378cce0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c4d48a58f32c5972174a1d01c33b296fe378cce0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_assert'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:124:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:94:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:98:3: note: expanded from macro '__WARN_printf'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instrumentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   net/caif/cfveil.c:83:2: note: Loop condition is false.  Exiting loop
           caif_assert(layr->dn != NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_assert'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:124:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:94:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:95:38: note: expanded from macro '__WARN_printf'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   net/caif/cfveil.c:83:2: note: Loop condition is false.  Exiting loop
           caif_assert(layr->dn != NULL);
           ^
   include/net/caif/caif_layer.h:27:33: note: expanded from macro 'caif_assert'
   #define caif_assert(assert)                                     \
                                                                   ^
   net/caif/cfveil.c:84:14: note: Access to field 'transmit' results in a dereference of a null pointer (loaded from field 'dn')
           caif_assert(layr->dn->transmit != NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_assert'
           if (!(assert)) {                                        \
                 ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/atm/mpc.c:383:2: warning: Value stored to 'mpoa_device_type' is never read [clang-analyzer-deadcode.DeadStores]
           mpoa_device_type = number_of_mps_macs = 0; /* silence gcc */
           ^                  ~~~~~~~~~~~~~~~~~~~~~~
   net/atm/mpc.c:383:2: note: Value stored to 'mpoa_device_type' is never read
           mpoa_device_type = number_of_mps_macs = 0; /* silence gcc */
           ^                  ~~~~~~~~~~~~~~~~~~~~~~
   net/atm/mpc.c:383:21: warning: Although the value stored to 'number_of_mps_macs' is used in the enclosing expression, the value is never actually read from 'number_of_mps_macs' [clang-analyzer-deadcode.DeadStores]
           mpoa_device_type = number_of_mps_macs = 0; /* silence gcc */
                              ^                    ~
   net/atm/mpc.c:383:21: note: Although the value stored to 'number_of_mps_macs' is used in the enclosing expression, the value is never actually read from 'number_of_mps_macs'
           mpoa_device_type = number_of_mps_macs = 0; /* silence gcc */
                              ^                    ~
   net/atm/mpc.c:602:29: warning: Access to field 'old_ops' results in a dereference of a null pointer (loaded from variable 'mpc') [clang-analyzer-core.NullDereference]
           return __netdev_start_xmit(mpc->old_ops, skb, dev, false);
                                      ^~~
   net/atm/mpc.c:577:2: note: Value assigned to 'mpc'
           mpc = find_mpc_by_lec(dev); /* this should NEVER fail */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/atm/mpc.c:578:6: note: Assuming 'mpc' is equal to NULL
           if (mpc == NULL) {
               ^~~~~~~~~~~
   net/atm/mpc.c:578:2: note: Taking true branch
           if (mpc == NULL) {
           ^
   net/atm/mpc.c:579:3: note: Loop condition is false.  Exiting loop
                   pr_info("(%s) no MPC found\n", dev->name);
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
   include/linux/printk.h:403:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   net/atm/mpc.c:580:3: note: Control jumps to line 602
                   goto non_ip;
                   ^
   net/atm/mpc.c:602:29: note: Access to field 'old_ops' results in a dereference of a null pointer (loaded from variable 'mpc')
           return __netdev_start_xmit(mpc->old_ops, skb, dev, false);
                                      ^~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> arch/arm/include/asm/bitops.h:82:8: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           res = *p;
                 ^
   net/l2tp/l2tp_core.c:1245:2: note: Calling 'l2tp_tunnel_closeall'
           l2tp_tunnel_closeall(tunnel);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/l2tp/l2tp_core.c:1199:2: note: Loop condition is true.  Entering loop body
           for (hash = 0; hash < L2TP_HASH_SIZE; hash++) {
           ^
   net/l2tp/l2tp_core.c:1201:3: note: Left side of '||' is false
                   hlist_for_each_entry_rcu(session, &tunnel->session_hlist[hash], hlist) {
                   ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_each_entry_rcu'
                pos = hlist_entry_safe(rcu_dereference_raw(hlist_first_rcu(head)),\
                                       ^
   include/linux/rcupdate.h:470:32: note: expanded from macro 'rcu_dereference_raw'
   #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
                                  ^
   include/linux/rcupdate.h:467:20: note: expanded from macro '__rcu_dereference_raw'
           typeof(p) local = READ_ONCE(p); \
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   net/l2tp/l2tp_core.c:1201:3: note: Left side of '||' is false
                   hlist_for_each_entry_rcu(session, &tunnel->session_hlist[hash], hlist) {
                   ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_each_entry_rcu'
                pos = hlist_entry_safe(rcu_dereference_raw(hlist_first_rcu(head)),\
                                       ^
   include/linux/rcupdate.h:470:32: note: expanded from macro 'rcu_dereference_raw'
   #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
                                  ^
   include/linux/rcupdate.h:467:20: note: expanded from macro '__rcu_dereference_raw'
           typeof(p) local = READ_ONCE(p); \
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:325:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   net/l2tp/l2tp_core.c:1201:3: note: Left side of '||' is true
                   hlist_for_each_entry_rcu(session, &tunnel->session_hlist[hash], hlist) {
                   ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_each_entry_rcu'
                pos = hlist_entry_safe(rcu_dereference_raw(hlist_first_rcu(head)),\
                                       ^
   include/linux/rcupdate.h:470:32: note: expanded from macro 'rcu_dereference_raw'
   #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
                                  ^
   include/linux/rcupdate.h:467:20: note: expanded from macro '__rcu_dereference_raw'
           typeof(p) local = READ_ONCE(p); \
                             ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:326:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   net/l2tp/l2tp_core.c:1201:3: note: Taking false branch
                   hlist_for_each_entry_rcu(session, &tunnel->session_hlist[hash], hlist) {
                   ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_each_entry_rcu'
                pos = hlist_entry_safe(rcu_dereference_raw(hlist_first_rcu(head)),\
                                       ^
   include/linux/rcupdate.h:470:32: note: expanded from macro 'rcu_dereference_raw'
   #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
                                  ^
   include/linux/rcupdate.h:467:20: note: expanded from macro '__rcu_dereference_raw'
           typeof(p) local = READ_ONCE(p); \
                             ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   net/l2tp/l2tp_core.c:1201:3: note: Loop condition is false.  Exiting loop
                   hlist_for_each_entry_rcu(session, &tunnel->session_hlist[hash], hlist) {
                   ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_each_entry_rcu'
                pos = hlist_entry_safe(rcu_dereference_raw(hlist_first_rcu(head)),\
                                       ^
   include/linux/rcupdate.h:470:32: note: expanded from macro 'rcu_dereference_raw'

vim +82 arch/arm/include/asm/bitops.h

^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  71  
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  72  static inline int
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  73  ____atomic_test_and_set_bit(unsigned int bit, volatile unsigned long *p)
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  74  {
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  75  	unsigned long flags;
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  76  	unsigned int res;
8901925d32232a arch/arm/include/asm/bitops.h Masahiro Yamada   2015-08-17  77  	unsigned long mask = BIT_MASK(bit);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  78  
8901925d32232a arch/arm/include/asm/bitops.h Masahiro Yamada   2015-08-17  79  	p += BIT_WORD(bit);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  80  
e7cc2c59cc8355 include/asm-arm/bitops.h      Lennert Buytenhek 2006-09-21  81  	raw_local_irq_save(flags);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16 @82  	res = *p;
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  83  	*p = res | mask;
e7cc2c59cc8355 include/asm-arm/bitops.h      Lennert Buytenhek 2006-09-21  84  	raw_local_irq_restore(flags);
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  85  
e9ac829185c5d1 arch/arm/include/asm/bitops.h Johannes Weiner   2009-07-21  86  	return (res & mask) != 0;
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  87  }
^1da177e4c3f41 include/asm-arm/bitops.h      Linus Torvalds    2005-04-16  88  

:::::: The code at line 82 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
