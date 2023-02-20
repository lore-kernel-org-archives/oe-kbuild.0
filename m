Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94DE63BB
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676903241; x=1708439241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=36DzIBFncHuy6Tiu9PGo5kVbAlB9ibe+2yjX/UV+xps=;
  b=O5QJ4LXs7NpTqdOOGc+8NN2xym2K0/IQrfw8Nnb0UiWSYBIg4Ll5vO4J
   n4+3JQ+VDXlQCbPNY/yff00lnFrtvJ4YA1Sw/09ybyUwsere4wUDJ0XZ4
   ESppcZpuTiFGQ8NgGAihyc4ia2ikzFJDODSVREUH0ZwDlstoth2VXD34+
   hmQ9oSc5sCIHK/le4fxROMFVXd5nmH7kejdrPnkK4BUtf0nh5sR+Nd9x6
   BjCoi0hQ0xeRZAdu+cWJKMYvN9AaCRaHUeKN5uN+Q7CJk7dYd5Deo3xRf
   /d6hF/Hz5JwZn2mGPlQu1NMTXNk5R4hPl0OTYYoYCepdxkf4H2hysJeZk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330125276"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="330125276"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 06:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814158557"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="814158557"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2023 06:27:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU78Q-000Dyr-2w;
	Mon, 20 Feb 2023 14:27:18 +0000
Date: Mon, 20 Feb 2023 22:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/stackinit_kunit.c:333:1: warning: Address of stack memory
 associated with local variable 'var' is still referred to by the global
 variable 'fill_start' upon returning to the caller.  This will be a dangling
 reference [clang-analyzer-core.StackAddressE...
Message-ID: <202302202200.M9IKs9N5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/stackinit_kunit.c:333:1: warning: Address of stack memory associated with local variable 'var' is still referred to by the global variable 'fill_start' upon returning to the caller.  This will be a dangling reference [clang-analyzer-core.StackAddressEscape]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
commit: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to KUnit
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230220/202302202200.M9IKs9N5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=02788ebcf521fe78c24eb221fd1ed7f86792c330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 02788ebcf521fe78c24eb221fd1ed7f86792c330
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302202200.M9IKs9N5-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                                 ^~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   lib/raid6/algos.c:149:6: warning: Value stored to 'start' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int start = (disks>>1)-1, stop = disks-3;       /* work on the second half of the disks */
               ^~~~~   ~~~~~~~~~~~~
   lib/raid6/algos.c:149:6: note: Value stored to 'start' during its initialization is never read
           int start = (disks>>1)-1, stop = disks-3;       /* work on the second half of the disks */
               ^~~~~   ~~~~~~~~~~~~
   lib/raid6/algos.c:149:28: warning: Value stored to 'stop' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int start = (disks>>1)-1, stop = disks-3;       /* work on the second half of the disks */
                                     ^~~~   ~~~~~~~
   lib/raid6/algos.c:149:28: note: Value stored to 'stop' during its initialization is never read
           int start = (disks>>1)-1, stop = disks-3;       /* work on the second half of the disks */
                                     ^~~~   ~~~~~~~
   lib/raid6/algos.c:153:7: warning: Value stored to 'bestgenperf' is never read [clang-analyzer-deadcode.DeadStores]
           for (bestgenperf = 0, best = NULL, algo = raid6_algos; *algo; algo++) {
                ^             ~
   lib/raid6/algos.c:153:7: note: Value stored to 'bestgenperf' is never read
           for (bestgenperf = 0, best = NULL, algo = raid6_algos; *algo; algo++) {
                ^             ~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/xfs/libxfs/xfs_refcount.c:114:19: warning: Value stored to 'agno' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           xfs_agnumber_t                  agno = cur->bc_ag.pag->pag_agno;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_refcount.c:114:19: note: Value stored to 'agno' during its initialization is never read
           xfs_agnumber_t                  agno = cur->bc_ag.pag->pag_agno;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (6 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   135 warnings generated.
   lib/stackinit_kunit.c:259:8: warning: Excessive padding in 'struct test_big_hole' (124 padding bytes, where 60 is optimal). Optimal fields order: four, one, two, three, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct test_big_hole {
   ~~~~~~~^~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:259:8: note: Excessive padding in 'struct test_big_hole' (124 padding bytes, where 60 is optimal). Optimal fields order: four, one, two, three, consider reordering the fields or adding explicit padding members
   struct test_big_hole {
   ~~~~~~~^~~~~~~~~~~~~~~
>> lib/stackinit_kunit.c:333:1: warning: Address of stack memory associated with local variable 'var' is still referred to by the global variable 'fill_start' upon returning to the caller.  This will be a dangling reference [clang-analyzer-core.StackAddressEscape]
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/stackinit_kunit.c:333:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:333:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:333:1: note: Calling 'leaf_u8_zero'
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:163:12: note: expanded from macro '\
   DEFINE_TEST_DRIVER'
           ignored = leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/stackinit_kunit.c:333:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:223:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/stackinit_kunit.c:333:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:223:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/stackinit_kunit.c:333:1: note: Address of stack memory associated with local variable 'var' is still referred to by the global variable 'fill_start' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
>> lib/stackinit_kunit.c:333:1: warning: Address of stack memory associated with local variable 'var' is still referred to by the global variable 'target_start' upon returning to the caller.  This will be a dangling reference [clang-analyzer-core.StackAddressEscape]
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/stackinit_kunit.c:333:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:333:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:333:1: note: Calling 'leaf_u8_zero'
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:163:12: note: expanded from macro '\
   DEFINE_TEST_DRIVER'
           ignored = leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/stackinit_kunit.c:333:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:223:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/stackinit_kunit.c:333:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TEST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:223:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/stackinit_kunit.c:333:1: note: Address of stack memory associated with local variable 'var' is still referred to by the global variable 'target_start' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TESTS'

vim +333 lib/stackinit_kunit.c

02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  303  
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  304  #define DEFINE_SCALAR_TEST(name, init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  305  		DEFINE_TEST(name ## _ ## init, name, SCALAR,	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  306  			    init, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  307  
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  308  #define DEFINE_SCALAR_TESTS(init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  309  		DEFINE_SCALAR_TEST(u8, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  310  		DEFINE_SCALAR_TEST(u16, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  311  		DEFINE_SCALAR_TEST(u32, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  312  		DEFINE_SCALAR_TEST(u64, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  313  		DEFINE_TEST(char_array_ ## init, unsigned char,	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  314  			    STRING, init, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  315  
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  316  #define DEFINE_STRUCT_TEST(name, init, xfail)			\
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  317  		DEFINE_TEST(name ## _ ## init,			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  318  			    struct test_ ## name, STRUCT, init, \
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  319  			    xfail)
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  320  
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  321  #define DEFINE_STRUCT_TESTS(init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  322  		DEFINE_STRUCT_TEST(small_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  323  		DEFINE_STRUCT_TEST(big_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  324  		DEFINE_STRUCT_TEST(trailing_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  325  		DEFINE_STRUCT_TEST(packed, init, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  326  
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  327  #define DEFINE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  328  		DEFINE_STRUCT_TESTS(base ## _ ## partial,	\
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  329  				    xfail);			\
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  330  		DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  331  
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  332  /* These should be fully initialized all the time! */
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16 @333  DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  334  DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  335  /* Struct initializers: padding may be left uninitialized. */
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  336  DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  337  DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  338  DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  339  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  340  DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  341  DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  342  /* No initialization without compiler instrumentation. */
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  343  DEFINE_SCALAR_TESTS(none, STRONG_PASS);
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  344  DEFINE_STRUCT_TESTS(none, BYREF_PASS);
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  345  /* Initialization of members with __user attribute. */
02788ebcf521fe7 lib/stackinit_kunit.c Kees Cook 2022-02-16  346  DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
