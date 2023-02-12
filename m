Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B65EDE
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676170839; x=1707706839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=464rFMxfRfD5qhN1MlTyExMS4yItuVk2P3FCkJSSxww=;
  b=AvLH/gKbLnlcCIWxxt2SokeM1BlR78tYgZSYQXabqptMlRo+59x8Pkbe
   Yz+qtXCLVbMAjgo/rH47u4BHHvPrAEABNUB9cAVZ0OIZpTye0bQhGNgmn
   tv+LTK6kKRupw5qJYIw4pNDIcMkhDKsVH0mb5cmKVKwRa3HNOJecUiP8z
   lLnzd6MasiCM7TxO0FRIfRrjImSZdmZ93zsD1nVZkjBIEwOR8e2fsIOiT
   wD0retU5wwrr78KqY3247V+JtwRUQkp6GT/fmaNvyluDZ92I30PqvOERP
   +8wEfxkkvPa78KfkU7F7OwzjuBQBowJcWFcdv/1uSMO4ria1vh6MTq3Y9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="358088108"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="358088108"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 19:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="618262187"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="618262187"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2023 19:00:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pR2bR-0006zJ-10;
	Sun, 12 Feb 2023 03:00:33 +0000
Date: Sun, 12 Feb 2023 10:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11236/12152] lib/kunit/static_stub.c:118:3:
 warning: Value stored to 'res' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302121006.OyAZQ1YB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kunit/static_stub.c:118:3: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Gow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Daniel Latypov <dlatypov@google.com>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba8a227fd19d19779005fb66ad7562608e1df83
commit: e047c5eaa76324575e1f95664be4c74ce0e2571b [11236/12152] kunit: Expose 'static stub' API to redirect functions
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20230210 (https://download.01.org/0day-ci/archive/20230212/202302121006.OyAZQ1YB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e047c5eaa76324575e1f95664be4c74ce0e2571b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e047c5eaa76324575e1f95664be4c74ce0e2571b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302121006.OyAZQ1YB-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                          ^
   mm/rmap.c:1257:2: note: Assuming the condition is true
           VM_BUG_ON_PAGE(!first && (flags & RMAP_EXCLUSIVE), page);
           ^
   include/linux/mmdebug.h:20:7: note: expanded from macro 'VM_BUG_ON_PAGE'
                   if (unlikely(cond)) {                                   \
                       ^~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   mm/rmap.c:1257:2: note: Taking false branch
           VM_BUG_ON_PAGE(!first && (flags & RMAP_EXCLUSIVE), page);
           ^
   include/linux/mmdebug.h:20:3: note: expanded from macro 'VM_BUG_ON_PAGE'
                   if (unlikely(cond)) {                                   \
                   ^
   mm/rmap.c:1257:2: note: Loop condition is false.  Exiting loop
           VM_BUG_ON_PAGE(!first && (flags & RMAP_EXCLUSIVE), page);
           ^
   include/linux/mmdebug.h:19:2: note: expanded from macro 'VM_BUG_ON_PAGE'
           do {                                                            \
           ^
   mm/rmap.c:1258:18: note: 'first' is false
           VM_BUG_ON_PAGE(!first && PageAnonExclusive(page), page);
                           ^
   include/linux/mmdebug.h:20:16: note: expanded from macro 'VM_BUG_ON_PAGE'
                   if (unlikely(cond)) {                                   \
                                ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/rmap.c:1258:17: note: Left side of '&&' is true
           VM_BUG_ON_PAGE(!first && PageAnonExclusive(page), page);
                          ^
   mm/rmap.c:1258:27: note: Calling 'PageAnonExclusive'
           VM_BUG_ON_PAGE(!first && PageAnonExclusive(page), page);
                                    ^
   include/linux/mmdebug.h:20:16: note: expanded from macro 'VM_BUG_ON_PAGE'
                   if (unlikely(cond)) {                                   \
                                ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/page-flags.h:1002:9: note: Left side of '&&' is true
           return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
                  ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   include/linux/page-flags.h:1002:9: note: Assuming the condition is false
           return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
                  ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:1002:9: note: Left side of '&&' is false
           return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
                  ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                                                        ^
   include/linux/page-flags.h:1002:37: note: Passing null pointer value via 2nd parameter 'addr'
           return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
                                              ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/bitops.h:53:32: note: expanded from macro 'bitop'
            const##op(nr, addr) : op(nr, addr))
                                         ^~~~
   include/linux/page-flags.h:1002:9: note: Calling 'generic_test_bit'
           return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
>> lib/kunit/static_stub.c:118:3: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                   res = kunit_alloc_resource(test, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/static_stub.c:118:3: note: Value stored to 'res' is never read
                   res = kunit_alloc_resource(test, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   include/kunit/resource.h:121:3: warning: Argument to kfree() is the address of a local stack variable, which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(res);
                   ^
   lib/kunit/kunit-test.c:374:2: note: Assuming '__left' is equal to '__right'
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:592:13: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/kunit/kunit-test.c:374:2: note: Taking true branch
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:592:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
           ^
   lib/kunit/kunit-test.c:374:2: note:  Execution continues on line 378
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:773:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:776:2: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
           KUNIT_BINARY_INT_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:613:2: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:593:3: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
                   break;                                                         \
                   ^
   lib/kunit/kunit-test.c:378:2: note: Taking false branch
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:592:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           if (likely(__left op __right))                                         \
           ^
   lib/kunit/kunit-test.c:378:2: note: Loop condition is false.  Exiting loop
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:794:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:797:2: note: expanded from macro 'KUNIT_EXPECT_PTR_EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                       \
           ^
   include/kunit/test.h:628:2: note: expanded from macro 'KUNIT_BINARY_PTR_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                                      \
           ^
   include/kunit/test.h:595:2: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
           _KUNIT_FAILED(test,                                                    \

vim +/res +118 lib/kunit/static_stub.c

e047c5eaa76324 David Gow 2023-01-31   83  
e047c5eaa76324 David Gow 2023-01-31   84  /* Helper function for kunit_activate_static_stub(). The macro does
e047c5eaa76324 David Gow 2023-01-31   85   * typechecking, so use it instead.
e047c5eaa76324 David Gow 2023-01-31   86   */
e047c5eaa76324 David Gow 2023-01-31   87  void __kunit_activate_static_stub(struct kunit *test,
e047c5eaa76324 David Gow 2023-01-31   88  				  void *real_fn_addr,
e047c5eaa76324 David Gow 2023-01-31   89  				  void *replacement_addr)
e047c5eaa76324 David Gow 2023-01-31   90  {
e047c5eaa76324 David Gow 2023-01-31   91  	struct kunit_static_stub_ctx *ctx;
e047c5eaa76324 David Gow 2023-01-31   92  	struct kunit_resource *res;
e047c5eaa76324 David Gow 2023-01-31   93  
e047c5eaa76324 David Gow 2023-01-31   94  	KUNIT_ASSERT_PTR_NE_MSG(test, real_fn_addr, NULL,
e047c5eaa76324 David Gow 2023-01-31   95  				"Tried to activate a stub for function NULL");
e047c5eaa76324 David Gow 2023-01-31   96  
e047c5eaa76324 David Gow 2023-01-31   97  	/* If the replacement address is NULL, deactivate the stub. */
e047c5eaa76324 David Gow 2023-01-31   98  	if (!replacement_addr) {
e047c5eaa76324 David Gow 2023-01-31   99  		kunit_deactivate_static_stub(test, replacement_addr);
e047c5eaa76324 David Gow 2023-01-31  100  		return;
e047c5eaa76324 David Gow 2023-01-31  101  	}
e047c5eaa76324 David Gow 2023-01-31  102  
e047c5eaa76324 David Gow 2023-01-31  103  	/* Look up any existing stubs for this function, and replace them. */
e047c5eaa76324 David Gow 2023-01-31  104  	res = kunit_find_resource(test,
e047c5eaa76324 David Gow 2023-01-31  105  				  __kunit_static_stub_resource_match,
e047c5eaa76324 David Gow 2023-01-31  106  				  real_fn_addr);
e047c5eaa76324 David Gow 2023-01-31  107  	if (res) {
e047c5eaa76324 David Gow 2023-01-31  108  		ctx = res->data;
e047c5eaa76324 David Gow 2023-01-31  109  		ctx->replacement_addr = replacement_addr;
e047c5eaa76324 David Gow 2023-01-31  110  
e047c5eaa76324 David Gow 2023-01-31  111  		/* We got an extra reference from find_resource(), so put it. */
e047c5eaa76324 David Gow 2023-01-31  112  		kunit_put_resource(res);
e047c5eaa76324 David Gow 2023-01-31  113  	} else {
e047c5eaa76324 David Gow 2023-01-31  114  		ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
e047c5eaa76324 David Gow 2023-01-31  115  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
e047c5eaa76324 David Gow 2023-01-31  116  		ctx->real_fn_addr = real_fn_addr;
e047c5eaa76324 David Gow 2023-01-31  117  		ctx->replacement_addr = replacement_addr;
e047c5eaa76324 David Gow 2023-01-31 @118  		res = kunit_alloc_resource(test, NULL,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
