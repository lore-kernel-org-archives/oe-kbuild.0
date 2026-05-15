Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A08E366DB9
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808969; cv=none; b=ClavBDS3dNGzoyxUTvqkaWVOmEBBno/bid5dpoHnf7OV1q+0ehnZPspuJAmFSk8vnfjvIulA2CJ9RHuw08uzxt66oiYPLZaobV9LX1iynFUweSgLmUcXfcKYmJhiv9NHIC8KTEhJvUBzzRl+xiQ/3wF5xXMAZMEkutlvN41mJXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808969; c=relaxed/simple;
	bh=WUtfM9jfcQye6XIQYHdVim6KD6tTBibD0sHIzXBaNxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X1dCFhXIXjXeDy8eS8J8lMG/Zc33smkK4p+fvw8H8jff5IePVNlwU1PTjVUaxt3MnJGS0dBrvbmAvIuXIgw8lNQuZdsspAaw8Kajeaai9G+xqUED7RC0WhRpTD7cxC1D/Zn0rOB6yqGbI9P24tRMxH2ygjQxPHc3xHlCWb5zFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeKA4p2I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeKA4p2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778808967; x=1810344967;
  h=date:from:to:cc:subject:message-id;
  bh=WUtfM9jfcQye6XIQYHdVim6KD6tTBibD0sHIzXBaNxE=;
  b=CeKA4p2IkGwt/AV4u72zRjNed9zlUDNi2VM+zBG07GlhBukOF6aJ95qe
   JRi/T7MtRynAq6t+lFBXDSPrkG6HYVD9l4eCEy8soYyBrigzg6U0jlyXP
   fxz+OTXiKDfZP8IkYX50dTBZBsVnhDv+QhEVeDFAbM2t6mTLZ/auUsegc
   jvA6eFRwy34FdKsVmayBhrX8Y4nztCtibXl3kGpmNy5YgL3sBSEK4OXy+
   47Ur4w9MrVcjNFYW6/21g/XEL4JBvPkaR+phJG3+zBwjKFw0Ged08dApf
   1PoSMnd3w/YPMWAo0CWlyn8JfcYOMrl0NA+5mMnOBAb/kKQoNxoETFB/3
   A==;
X-CSE-ConnectionGUID: DfIjfDreTnudY99Vy855Mg==
X-CSE-MsgGUID: 6qmWEfx6S5SHUF+1Yw6BDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79791047"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79791047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 18:36:06 -0700
X-CSE-ConnectionGUID: 72F4g/IrTEiTgCeUXQ3Tlg==
X-CSE-MsgGUID: 4IG7k5WPT62xsR5dYtK8dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="268896504"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 May 2026 18:36:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNhT8-000000008v9-3KDZ;
	Fri, 15 May 2026 01:36:02 +0000
Date: Fri, 15 May 2026 03:35:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tests/builtin-test.c:520:13: error: invalid storage class
 for function 'drain_child_process_err'
Message-ID: <202605150337.7N09s8AH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Rogers <irogers@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-jevents-py-Make-generated-C-code-more-kernel-style/20260515-050303
head:   1486b474d48345ed0cca3daad8c9966bc7c84764
commit: 324a137bfa4a31dcf2a9ec59f7ccef9a25977c18 perf test: Refactor parallel poll loop to drain all pipes simultaneously
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260515/202605150337.7N09s8AH-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150337.7N09s8AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150337.7N09s8AH-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc2.g324a137bfa4a
   tests/builtin-test.c: In function 'finish_tests_parallel':
>> tests/builtin-test.c:520:13: error: invalid storage class for function 'drain_child_process_err'
     520 | static void drain_child_process_err(struct child_test *child)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:531:12: error: invalid storage class for function 'finish_tests_parallel'
     531 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:531:12: error: declaration of 'finish_tests_parallel' shadows a global declaration [-Werror=shadow]
   tests/builtin-test.c:514:12: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
>> tests/builtin-test.c:531:54: error: declaration of 'child_tests' shadows a parameter [-Werror=shadow]
     531 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:514:54: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
>> tests/builtin-test.c:531:74: error: declaration of 'num_tests' shadows a parameter [-Werror=shadow]
     531 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:514:74: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
>> tests/builtin-test.c:531:89: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     531 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c:514:89: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
>> tests/builtin-test.c:533:16: error: declaration of 'next_to_print' shadows a previous local [-Werror=shadow]
     533 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:516:16: note: shadowed declaration is here
     516 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
>> tests/builtin-test.c:534:24: error: declaration of 'pfds' shadows a previous local [-Werror=shadow]
     534 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:517:24: note: shadowed declaration is here
     517 |         struct pollfd *pfds;
         |                        ^~~~
>> tests/builtin-test.c:535:17: error: declaration of 'pfd_indices' shadows a previous local [-Werror=shadow]
     535 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:518:17: note: shadowed declaration is here
     518 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
>> tests/builtin-test.c:536:16: error: declaration of 'num_pfds' shadows a previous local [-Werror=shadow]
     536 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:519:16: note: shadowed declaration is here
     519 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
>> tests/builtin-test.c:695:12: error: invalid storage class for function 'start_test'
     695 | static int start_test(struct test_suite *test, int curr_suite, int curr_test_case,
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function 'start_test':
   tests/builtin-test.c:696:48: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     696 |                 struct child_test **child, int width, int pass)
         |                                            ~~~~^~~~~
   tests/builtin-test.c:514:89: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
>> tests/builtin-test.c:749:15: error: 'num_tests' redeclared as different kind of symbol
     749 | static size_t num_tests;
         |               ^~~~~~~~~
   tests/builtin-test.c:514:74: note: previous definition of 'num_tests' with type 'size_t' {aka 'long unsigned int'}
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
>> tests/builtin-test.c:750:28: error: 'child_tests' redeclared as different kind of symbol
     750 | static struct child_test **child_tests;
         |                            ^~~~~~~~~~~
   tests/builtin-test.c:514:54: note: previous definition of 'child_tests' with type 'struct child_test **'
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
>> tests/builtin-test.c:753:13: error: invalid storage class for function 'cmd_test_sig_handler'
     753 | static void cmd_test_sig_handler(int sig)
         |             ^~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:758:12: error: invalid storage class for function '__cmd_test'
     758 | static int __cmd_test(struct test_suite **suites, int argc, const char *argv[],
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function '__cmd_test':
   tests/builtin-test.c:761:20: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     761 |         static int width = 0;
         |                    ^~~~~
   tests/builtin-test.c:514:89: note: shadowed declaration is here
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
>> tests/builtin-test.c:874:12: error: invalid storage class for function 'perf_test__list'
     874 | static int perf_test__list(FILE *fp, struct test_suite **suites, int argc, const char **argv)
         |            ^~~~~~~~~~~~~~~
>> tests/builtin-test.c:897:12: error: invalid storage class for function 'workloads__fprintf_list'
     897 | static int workloads__fprintf_list(FILE *fp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:908:12: error: invalid storage class for function 'run_workload'
     908 | static int run_workload(const char *work, int argc, const char **argv)
         |            ^~~~~~~~~~~~
>> tests/builtin-test.c:921:12: error: invalid storage class for function 'perf_test__config'
     921 | static int perf_test__config(const char *var, const char *value,
         |            ^~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:930:28: error: invalid storage class for function 'build_suites'
     930 | static struct test_suite **build_suites(void)
         |                            ^~~~~~~~~~~~
   tests/builtin-test.c:983:5: error: declaration of 'cmd_test' shadows a global declaration [-Werror=shadow]
     983 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   In file included from tests/builtin-test.c:22:
   tools/perf/builtin.h:45:5: note: shadowed declaration is here
      45 | int cmd_test(int argc, const char **argv);
         |     ^~~~~~~~
   tests/builtin-test.c:1064:1: error: expected declaration or statement at end of input
    1064 | }
         | ^
   tests/builtin-test.c:519:16: error: unused variable 'num_pfds' [-Werror=unused-variable]
     519 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:518:17: error: unused variable 'pfd_indices' [-Werror=unused-variable]
     518 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:517:24: error: unused variable 'pfds' [-Werror=unused-variable]
     517 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:516:16: error: unused variable 'next_to_print' [-Werror=unused-variable]
     516 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:1064:1: error: no return statement in function returning non-void [-Werror=return-type]
    1064 | }
         | ^
   tests/builtin-test.c:514:54: error: unused parameter 'child_tests' [-Werror=unused-parameter]
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:514:74: error: unused parameter 'num_tests' [-Werror=unused-parameter]
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:514:89: error: unused parameter 'width' [-Werror=unused-parameter]
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: At top level:
   tests/builtin-test.c:983:5: error: 'cmd_test' defined but not used [-Werror=unused-function]
     983 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   tests/builtin-test.c:514:12: error: 'finish_tests_parallel' defined but not used [-Werror=unused-function]
     514 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:95: tests/builtin-test.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[2]: *** [Makefile.perf:785: perf-test-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
