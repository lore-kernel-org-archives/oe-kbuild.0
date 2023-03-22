Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581C15A6
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679445791; x=1710981791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNRxoHz/i965NOWu0doLOjPabUnTjh0hjAAkVYjMmO4=;
  b=nXEgcqVmewuHTEZCtTcjAI0/vBqrQuWOXSVdJLNuMyvpYSP5y8oxLKcp
   kvNrruDNZ3XGwFAC7jl5eHww3pZBUPKkfW5KGziEV5mD1ZciZo1dLfrAl
   TQjH07lUXt21vZDoV2TjVtKgAhWgjqEU0aAICzSTNuxSMZj8fjGyvWiFl
   uELsQcjD0eeRQHcO4oLQSVLzxRGyZub7o8mroq2ZJEV7AKS49GyOyg5+9
   0hiD+mn25lQtyCr82vFqOA6AWR+a0/DZt8L6igU/+OT92Ej3LJyvUgdt9
   vT0PWbRFH4nt/rVv5aX8VTWaze9N03dvk1ZJA3xpO3Br0+PRoJa+dD/yT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425383435"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="425383435"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 17:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825186784"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="825186784"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 17:43:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pemZD-000CcG-1O;
	Wed, 22 Mar 2023 00:43:03 +0000
Date: Wed, 22 Mar 2023 08:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rppt:mm-init/v1 10/15] mm/mm_init.c:2560:3: warning: Value stored
 to 'want_check_pages' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303220844.AQDZXy3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/mm_init.c:2560:3: warning: Value stored to 'want_check_pages' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm-init/v1
head:   dc7dc51d67cacd0def0f53d84adb9014d408abd5
commit: bae703e52af6d8e71caf347f6c085d5fdcf1f1ec [10/15] mm: move init_mem_debugging_and_hardening() to mm/mm_init.c
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220844.AQDZXy3v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=bae703e52af6d8e71caf347f6c085d5fdcf1f1ec
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt mm-init/v1
        git checkout bae703e52af6d8e71caf347f6c085d5fdcf1f1ec
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303220844.AQDZXy3v-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <= 4) ?              \
           ^
   mm/mm_init.c:2443:12: note: Calling '__ilog2_u64'
           log2qty = ilog2(numentries);
                     ^
   include/linux/log2.h:163:2: note: expanded from macro 'ilog2'
           __ilog2_u64(n)                  \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:32:2: note: Returning the value 63
           return fls64(n) - 1;
           ^~~~~~~~~~~~~~~~~~~
   mm/mm_init.c:2443:12: note: Returning from '__ilog2_u64'
           log2qty = ilog2(numentries);
                     ^
   include/linux/log2.h:163:2: note: expanded from macro 'ilog2'
           __ilog2_u64(n)                  \
           ^~~~~~~~~~~~~~
   mm/mm_init.c:2443:2: note: The value 63 is assigned to 'log2qty'
           log2qty = ilog2(numentries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mm_init.c:2445:15: note: Assuming the condition is false
           gfp_flags = (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GFP_ATOMIC;
                        ^~~~~~~~~~~~~~~~~
   mm/mm_init.c:2445:14: note: '?' condition is false
           gfp_flags = (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GFP_ATOMIC;
                       ^
   mm/mm_init.c:2449:7: note: Assuming the condition is true
                   if (flags & HASH_EARLY) {
                       ^~~~~~~~~~~~~~~~~~
   mm/mm_init.c:2449:3: note: Taking true branch
                   if (flags & HASH_EARLY) {
                   ^
   mm/mm_init.c:2450:4: note: Taking false branch
                           if (flags & HASH_ZERO)
                           ^
   mm/mm_init.c:2469:11: note: Assuming 'table' is non-null
           } while (!table && size > PAGE_SIZE && --log2qty);
                    ^~~~~~
   mm/mm_init.c:2469:18: note: Left side of '&&' is false
           } while (!table && size > PAGE_SIZE && --log2qty);
                           ^
   mm/mm_init.c:2446:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   mm/mm_init.c:2471:7: note: 'table' is non-null
           if (!table)
                ^~~~~
   mm/mm_init.c:2471:2: note: Taking false branch
           if (!table)
           ^
   mm/mm_init.c:2474:2: note: Loop condition is false.  Exiting loop
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n",
           ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:455:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:426:3: note: expanded from macro 'printk_index_wrap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:401:34: note: expanded from macro '__printk_index_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   mm/mm_init.c:2475:30: note: '?' condition is false
                   tablename, 1UL << log2qty, ilog2(size) - PAGE_SHIFT, size,
                                              ^
   mm/mm_init.c:2475:30: note: '?' condition is false
   mm/mm_init.c:2476:3: note: 'virt' is false
                   virt ? (huge ? "vmalloc hugepage" : "vmalloc") : "linear");
                   ^
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   mm/mm_init.c:2476:3: note: '?' condition is false
                   virt ? (huge ? "vmalloc hugepage" : "vmalloc") : "linear");
                   ^
   mm/mm_init.c:2478:6: note: Assuming '_hash_shift' is null
           if (_hash_shift)
               ^~~~~~~~~~~
   mm/mm_init.c:2478:2: note: Taking false branch
           if (_hash_shift)
           ^
   mm/mm_init.c:2480:6: note: Assuming '_hash_mask' is non-null
           if (_hash_mask)
               ^~~~~~~~~~
   mm/mm_init.c:2480:2: note: Taking true branch
           if (_hash_mask)
           ^
   mm/mm_init.c:2481:20: note: The result of the left shift is undefined due to shifting by '63', which is greater or equal to the width of type 'int'
                   *_hash_mask = (1 << log2qty) - 1;
                                    ^  ~~~~~~~
>> mm/mm_init.c:2560:3: warning: Value stored to 'want_check_pages' is never read [clang-analyzer-deadcode.DeadStores]
                   want_check_pages = true;
                   ^                  ~~~~
   mm/mm_init.c:2560:3: note: Value stored to 'want_check_pages' is never read
                   want_check_pages = true;
                   ^                  ~~~~
   mm/mm_init.c:2573:3: warning: Value stored to 'want_check_pages' is never read [clang-analyzer-deadcode.DeadStores]
                   want_check_pages = true;
                   ^                  ~~~~
   mm/mm_init.c:2573:3: note: Value stored to 'want_check_pages' is never read
                   want_check_pages = true;
                   ^                  ~~~~
   mm/mm_init.c:2580:3: warning: Value stored to 'want_check_pages' is never read [clang-analyzer-deadcode.DeadStores]
                   want_check_pages = true;
                   ^                  ~~~~
   mm/mm_init.c:2580:3: note: Value stored to 'want_check_pages' is never read
                   want_check_pages = true;
                   ^                  ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   lib/kfifo.c:31:9: note: '?' condition is false
           size = roundup_pow_of_two(size);
                  ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   lib/kfifo.c:31:9: note: Calling '__roundup_pow_of_two'
           size = roundup_pow_of_two(size);
                  ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:205:2: note: Taking false branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:207:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal to 0
           if (x == 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x == 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:207:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:207:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << (fls_long(n) - 1);
                      ^
   lib/kfifo.c:71:2: note: Taking true branch
           if (!is_power_of_2(size))
           ^
   lib/kfifo.c:72:10: note: '?' condition is false
                   size = rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   lib/kfifo.c:72:10: note: Calling '__rounddown_pow_of_two'
                   size = rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '64', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   lib/stackdepot.c:178:6: note: Assuming 'stack_depot_disabled' is false
           if (stack_depot_disabled || stack_table)
               ^~~~~~~~~~~~~~~~~~~~
   lib/stackdepot.c:178:6: note: Left side of '||' is false
   lib/stackdepot.c:178:30: note: Assuming 'stack_table' is null
           if (stack_depot_disabled || stack_table)
                                       ^~~~~~~~~~~
   lib/stackdepot.c:178:2: note: Taking false branch

vim +/want_check_pages +2560 mm/mm_init.c

bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2538) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2539) /*
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2540)  * Enable static keys related to various memory debugging and hardening options.
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2541)  * Some override others, and depend on early params that are evaluated in the
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2542)  * order of appearance. So we need to first gather the full picture of what was
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2543)  * enabled, and then make decisions.
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2544)  */
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2545) static void __init init_mem_debugging_and_hardening(void)
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2546) {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2547) 	bool page_poisoning_requested = false;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2548) 	bool want_check_pages = false;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2549) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2550) #ifdef CONFIG_PAGE_POISONING
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2551) 	/*
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2552) 	 * Page poisoning is debug page alloc for some arches. If
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2553) 	 * either of those options are enabled, enable poisoning.
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2554) 	 */
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2555) 	if (page_poisoning_enabled() ||
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2556) 	     (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC) &&
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2557) 	      debug_pagealloc_enabled())) {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2558) 		static_branch_enable(&_page_poisoning_enabled);
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2559) 		page_poisoning_requested = true;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18 @2560) 		want_check_pages = true;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2561) 	}
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2562) #endif
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2563) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2564) 	if ((_init_on_alloc_enabled_early || _init_on_free_enabled_early) &&
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2565) 	    page_poisoning_requested) {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2566) 		pr_info("mem auto-init: CONFIG_PAGE_POISONING is on, "
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2567) 			"will take precedence over init_on_alloc and init_on_free\n");
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2568) 		_init_on_alloc_enabled_early = false;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2569) 		_init_on_free_enabled_early = false;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2570) 	}
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2571) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2572) 	if (_init_on_alloc_enabled_early) {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2573) 		want_check_pages = true;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2574) 		static_branch_enable(&init_on_alloc);
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2575) 	} else {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2576) 		static_branch_disable(&init_on_alloc);
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2577) 	}
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2578) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2579) 	if (_init_on_free_enabled_early) {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2580) 		want_check_pages = true;
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2581) 		static_branch_enable(&init_on_free);
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2582) 	} else {
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2583) 		static_branch_disable(&init_on_free);
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2584) 	}
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2585) 
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2586) 	if (IS_ENABLED(CONFIG_KMSAN) &&
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2587) 	    (_init_on_alloc_enabled_early || _init_on_free_enabled_early))
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2588) 		pr_info("mem auto-init: please make sure init_on_alloc and init_on_free are disabled when running KMSAN\n");
bae703e52af6d8 Mike Rapoport (IBM  2023-03-18  2589) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
