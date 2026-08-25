Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8D3D9DB1
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649375; cv=none; b=HkI8sV6RsE+BHWIWv12S8WdRcyjiycbeFSJWboBXPMmIbBVBJgzyFC9U8LHoRnZ2qx1Cjq1EkLxuZ8x/SfY/7vslRDjuxwspvxTh4mF3KeQm1j7+hbYHag7+zRhTB4cx4v9j9esWQ9pa8v6WdFYQlHb1AUKXT2uLnBLd2fz3csE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649375; c=relaxed/simple;
	bh=h5Ph9dMpuM0XKnk6Ii3GBQq/yhZXMQ7ETgKifeLIf34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMe07Oul9OSZTSDxyDZIs6rUGcpQ0UL7eKDOQ0okoEYohl2sMEoC67NAau9ApbX7OrasQnJESkeb2fWEaThvi06g0sGqcaP/nphQBrj+SubL/9Y1Ova46tw0FMP44xlQ1PUTV1PxZg+biyHmkLlZ7outqcaW7oUxvoRv3EfRlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REAsZNJO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REAsZNJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787649373; x=1819185373;
  h=date:from:to:cc:subject:message-id;
  bh=h5Ph9dMpuM0XKnk6Ii3GBQq/yhZXMQ7ETgKifeLIf34=;
  b=REAsZNJOK/EyghJuuF4V2JHpIpcenQzoT8TmAKc5l1rSXGHQfUUapRBh
   voA7EiIX2QYvFc3x/8+4OkE50Y2jyKAT7q6N5xgI3LmpKtSPHEsInPYW5
   PfY5TAnbFr3ONgO8BlV+4ULSkGnh88JEqoc65N6Cq400Uqva4YKfyrj0T
   Nq4oTxjKeXsNEVDwNywFRk+usnLPSMdpzIqgPc37yhOeWZQoutI1nChRY
   0LbhXKqonh7/zySggEtmhVT8z2N9JtXVJgN1ycJ8dFiffXf6S2glvSf1i
   MvgfHRlGvcbye0kiBDBoPiQD7aO8Wk/y56AxKQ3hu8Xjs06Q2AbbzxPpk
   w==;
X-CSE-ConnectionGUID: J1r0y9ZKTFaMiBQmKOpZCg==
X-CSE-MsgGUID: BJuubRScSWSzzbp4Y0ivzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88239159"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88239159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:16:13 -0700
X-CSE-ConnectionGUID: /GMtEhsQQcC4pULyilyKJQ==
X-CSE-MsgGUID: 1g4vqug7SeCjEVImPw2IpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="297136941"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Aug 2026 02:16:12 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wynGL-000000005Vh-1nPG;
	Tue, 25 Aug 2026 09:16:09 +0000
Date: Tue, 25 Aug 2026 17:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/tests/stacktrace_kunit.c:13:16: error: variable 'trace'
 has initializer but incomplete type
Message-ID: <202608251703.x4npy956-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bill-Wendling/stacktrace-Add-__counted_by_ptr-attribute-to-struct-stack_trace/20260823-123532, commit: 2f587ab333d26b331b33c137ec41b057e470e4e6"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bill Wendling <morbo@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/stacktrace-Add-__counted_by_ptr-attribute-to-struct-stack_trace/20260823-123532
head:   2f587ab333d26b331b33c137ec41b057e470e4e6
commit: 2f587ab333d26b331b33c137ec41b057e470e4e6 lib/tests: Add KUnit test for struct stack_trace __counted_by_ptr attribute
date:   23 hours ago
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260825/202608251703.x4npy956-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251703.x4npy956-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251703.x4npy956-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/tests/stacktrace_kunit.c: In function 'test_stack_trace_counted_by':
>> lib/tests/stacktrace_kunit.c:13:16: error: variable 'trace' has initializer but incomplete type
      13 |         struct stack_trace trace = {
         |                ^~~~~~~~~~~
>> lib/tests/stacktrace_kunit.c:14:18: error: 'struct stack_trace' has no member named 'entries'
      14 |                 .entries = entries_buf,
         |                  ^~~~~~~
>> lib/tests/stacktrace_kunit.c:14:28: warning: excess elements in struct initializer
      14 |                 .entries = entries_buf,
         |                            ^~~~~~~~~~~
   lib/tests/stacktrace_kunit.c:14:28: note: (near initialization for 'trace')
>> lib/tests/stacktrace_kunit.c:15:18: error: 'struct stack_trace' has no member named 'max_entries'
      15 |                 .max_entries = 4,
         |                  ^~~~~~~~~~~
   lib/tests/stacktrace_kunit.c:15:32: warning: excess elements in struct initializer
      15 |                 .max_entries = 4,
         |                                ^
   lib/tests/stacktrace_kunit.c:15:32: note: (near initialization for 'trace')
>> lib/tests/stacktrace_kunit.c:13:28: error: storage size of 'trace' isn't known
      13 |         struct stack_trace trace = {
         |                            ^~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from lib/tests/stacktrace_kunit.c:6:
>> include/kunit/test.h:1060:42: warning: comparison between pointer and integer
    1060 |                                    left, ==, right,                            \
         |                                          ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from lib/tests/stacktrace_kunit.c:6:
>> include/kunit/test.h:857:55: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     857 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:735:49: note: in definition of macro '_KUNIT_FAILED'
     735 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:856:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     856 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:857:55: note: (near initialization for '__assertion.left_value')
     857 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:735:49: note: in definition of macro '_KUNIT_FAILED'
     735 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:856:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     856 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   lib/tests/stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
>> lib/tests/stacktrace_kunit.c:13:28: warning: unused variable 'trace' [-Wunused-variable]
      13 |         struct stack_trace trace = {
         |                            ^~~~~
--
   stacktrace_kunit.c: In function 'test_stack_trace_counted_by':
   stacktrace_kunit.c:13:16: error: variable 'trace' has initializer but incomplete type
      13 |         struct stack_trace trace = {
         |                ^~~~~~~~~~~
   stacktrace_kunit.c:14:18: error: 'struct stack_trace' has no member named 'entries'
      14 |                 .entries = entries_buf,
         |                  ^~~~~~~
   stacktrace_kunit.c:14:28: warning: excess elements in struct initializer
      14 |                 .entries = entries_buf,
         |                            ^~~~~~~~~~~
   stacktrace_kunit.c:14:28: note: (near initialization for 'trace')
   stacktrace_kunit.c:15:18: error: 'struct stack_trace' has no member named 'max_entries'
      15 |                 .max_entries = 4,
         |                  ^~~~~~~~~~~
   stacktrace_kunit.c:15:32: warning: excess elements in struct initializer
      15 |                 .max_entries = 4,
         |                                ^
   stacktrace_kunit.c:15:32: note: (near initialization for 'trace')
   stacktrace_kunit.c:13:28: error: storage size of 'trace' isn't known
      13 |         struct stack_trace trace = {
         |                            ^~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from stacktrace_kunit.c:6:
>> include/kunit/test.h:1060:42: warning: comparison between pointer and integer
    1060 |                                    left, ==, right,                            \
         |                                          ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from stacktrace_kunit.c:6:
>> include/kunit/test.h:857:55: warning: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     857 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:735:49: note: in definition of macro '_KUNIT_FAILED'
     735 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:856:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     856 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:857:55: note: (near initialization for '__assertion.left_value')
     857 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:735:49: note: in definition of macro '_KUNIT_FAILED'
     735 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:856:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     856 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:885:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     885 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1058:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1058 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1055:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ_MSG'
    1055 |         KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   stacktrace_kunit.c:19:9: note: in expansion of macro 'KUNIT_EXPECT_PTR_EQ'
      19 |         KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
         |         ^~~~~~~~~~~~~~~~~~~
   stacktrace_kunit.c:13:28: warning: unused variable 'trace' [-Wunused-variable]
      13 |         struct stack_trace trace = {
         |                            ^~~~~


vim +/trace +13 lib/tests/stacktrace_kunit.c

2f587ab333d26b Bill Wendling 2026-08-23   8  
2f587ab333d26b Bill Wendling 2026-08-23   9  #ifndef CONFIG_ARCH_STACKWALK
2f587ab333d26b Bill Wendling 2026-08-23  10  static void test_stack_trace_counted_by(struct kunit *test)
2f587ab333d26b Bill Wendling 2026-08-23  11  {
2f587ab333d26b Bill Wendling 2026-08-23  12  	unsigned long entries_buf[4];
2f587ab333d26b Bill Wendling 2026-08-23 @13  	struct stack_trace trace = {
2f587ab333d26b Bill Wendling 2026-08-23 @14  		.entries = entries_buf,
2f587ab333d26b Bill Wendling 2026-08-23 @15  		.max_entries = 4,
2f587ab333d26b Bill Wendling 2026-08-23  16  	};
2f587ab333d26b Bill Wendling 2026-08-23  17  
2f587ab333d26b Bill Wendling 2026-08-23  18  	KUNIT_EXPECT_EQ(test, trace.max_entries, 4U);
2f587ab333d26b Bill Wendling 2026-08-23 @19  	KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
2f587ab333d26b Bill Wendling 2026-08-23  20  
2f587ab333d26b Bill Wendling 2026-08-23  21  	/* Write to the allocated elements to verify access */
2f587ab333d26b Bill Wendling 2026-08-23  22  	trace.entries[0] = 0xdeadbeef;
2f587ab333d26b Bill Wendling 2026-08-23  23  	trace.entries[1] = 0xbeefcafe;
2f587ab333d26b Bill Wendling 2026-08-23  24  	trace.entries[2] = 0xcafebabe;
2f587ab333d26b Bill Wendling 2026-08-23  25  	trace.entries[3] = 0x12345678;
2f587ab333d26b Bill Wendling 2026-08-23  26  
2f587ab333d26b Bill Wendling 2026-08-23  27  	KUNIT_EXPECT_EQ(test, trace.entries[0], 0xdeadbeefUL);
2f587ab333d26b Bill Wendling 2026-08-23  28  	KUNIT_EXPECT_EQ(test, trace.entries[1], 0xbeefcafeUL);
2f587ab333d26b Bill Wendling 2026-08-23  29  	KUNIT_EXPECT_EQ(test, trace.entries[2], 0xcafebabeUL);
2f587ab333d26b Bill Wendling 2026-08-23  30  	KUNIT_EXPECT_EQ(test, trace.entries[3], 0x12345678UL);
2f587ab333d26b Bill Wendling 2026-08-23  31  }
2f587ab333d26b Bill Wendling 2026-08-23  32  #else
2f587ab333d26b Bill Wendling 2026-08-23  33  static void test_stack_trace_counted_by(struct kunit *test)
2f587ab333d26b Bill Wendling 2026-08-23  34  {
2f587ab333d26b Bill Wendling 2026-08-23  35  	kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_trace is not defined");
2f587ab333d26b Bill Wendling 2026-08-23  36  }
2f587ab333d26b Bill Wendling 2026-08-23  37  #endif
2f587ab333d26b Bill Wendling 2026-08-23  38  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
