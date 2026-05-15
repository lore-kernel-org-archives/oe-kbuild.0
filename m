Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06D30C637
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 02:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778810828; cv=none; b=cITnxWqGBl/M8wJMDDquTwFC73sKXfxfe5rVHOrGHHxxf3bsebalDiFFWpLG+C4TsDN1natuZvAEKlgvvFCjl6WggegCDtzHRpVRCkik5SWF8p5zRnszaG1lII+0gbO0E//ZQrkMqilBwKBcsZlMtACWH1rMuXtV2k2qnt1x9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778810828; c=relaxed/simple;
	bh=Qpwyb/mkNRBmi7fxqV2KCuqvQLx7b67jrQpwB9CS3KQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKiB9jx7f7L4YQgikBqILlmqJ7Y3vNGe4DuFSi/It1bwNW+YYg5hLf1or6M1iX6jcxVdn5DtdqOiC06n7hDo6es+Kn7xDrsqBIXdtQQ4+u/C67McVmvyrgIFNwy80zVS60QAuMzkMrsNSgYmFNaasJLpbMXlBmWJn1lNjFMsCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5buDX87; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5buDX87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778810827; x=1810346827;
  h=date:from:to:cc:subject:message-id;
  bh=Qpwyb/mkNRBmi7fxqV2KCuqvQLx7b67jrQpwB9CS3KQ=;
  b=E5buDX87q44KSzcho4FAATZv1FvsISXb0uwcl6ObfScC6EiXaGBGykED
   t4s57SV1SezwYHFgEGPa9IVdYJDSbsZTrgjUxADW+bhA8UYdP3LwaaPdM
   QrzfUtsyM8qxR7DaNUmsAZ/NOgmGtsjb3Q0B683ZaGVjTMygftPZEnd0t
   u8C6xjmdwnn+2T4L87/ULiV1+9heXxhtjtiH1cqhh9bRSMWq8miTs6We/
   8MNIu+pdEotXI6Bx9+JAT7KcmgZlHIIzxpvY/a6shXu0nGtFIRJEOBzwU
   CnvYe+GWfuvQjGOTNNvWrf+aikHkCXff8rimn3QEPVwCsF6cqOKiwHdDI
   g==;
X-CSE-ConnectionGUID: D2MNKqwVR0qqeTg22LSBJg==
X-CSE-MsgGUID: 3553r4vtTsC9QbWEeS4mZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79804663"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79804663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 19:07:07 -0700
X-CSE-ConnectionGUID: ECfKbHs8SIuHzAZcIRibjA==
X-CSE-MsgGUID: rFLu5b3eRPOHZeo/7vLZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242555057"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 19:07:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNhx9-000000008vN-0BsK;
	Fri, 15 May 2026 02:07:03 +0000
Date: Fri, 15 May 2026 04:06:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tests/builtin-test.c:988:13: error: invalid storage class
 for function 'print_tests_summary'
Message-ID: <202605150331.LJ7JoCiL-lkp@intel.com>
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
commit: a393f28de6e4d0abf028c1dbe06c72292c4c9156 perf test: Add summary reporting
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260515/202605150331.LJ7JoCiL-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150331.LJ7JoCiL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150331.LJ7JoCiL-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc2.ga393f28de6e4
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:748:13: error: invalid storage class for function 'drain_child_process_err'
     748 | static void drain_child_process_err(struct child_test *child)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:759:12: error: invalid storage class for function 'finish_tests_parallel'
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:759:12: error: declaration of 'finish_tests_parallel' shadows a global declaration [-Werror=shadow]
   tests/builtin-test.c:742:12: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:759:54: error: declaration of 'child_tests' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:742:54: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:759:74: error: declaration of 'num_tests' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:742:74: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:759:89: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c:761:16: error: declaration of 'next_to_print' shadows a previous local [-Werror=shadow]
     761 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:744:16: note: shadowed declaration is here
     744 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:762:24: error: declaration of 'pfds' shadows a previous local [-Werror=shadow]
     762 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:745:24: note: shadowed declaration is here
     745 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:763:17: error: declaration of 'pfd_indices' shadows a previous local [-Werror=shadow]
     763 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:746:17: note: shadowed declaration is here
     746 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:764:16: error: declaration of 'num_pfds' shadows a previous local [-Werror=shadow]
     764 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:747:16: note: shadowed declaration is here
     747 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:925:12: error: invalid storage class for function 'start_test'
     925 | static int start_test(struct test_suite *test, int curr_suite, int curr_test_case,
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function 'start_test':
   tests/builtin-test.c:926:48: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     926 |                 struct child_test **child, int width, int pass)
         |                                            ~~~~^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:979:15: error: 'num_tests' redeclared as different kind of symbol
     979 | static size_t num_tests;
         |               ^~~~~~~~~
   tests/builtin-test.c:742:74: note: previous definition of 'num_tests' with type 'size_t' {aka 'long unsigned int'}
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:980:28: error: 'child_tests' redeclared as different kind of symbol
     980 | static struct child_test **child_tests;
         |                            ^~~~~~~~~~~
   tests/builtin-test.c:742:54: note: previous definition of 'child_tests' with type 'struct child_test **'
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:983:13: error: invalid storage class for function 'cmd_test_sig_handler'
     983 | static void cmd_test_sig_handler(int sig)
         |             ^~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:988:13: error: invalid storage class for function 'print_tests_summary'
     988 | static void print_tests_summary(void)
         |             ^~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1004:12: error: invalid storage class for function '__cmd_test'
    1004 | static int __cmd_test(struct test_suite **suites, int argc, const char *argv[],
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function '__cmd_test':
   tests/builtin-test.c:1007:20: error: declaration of 'width' shadows a parameter [-Werror=shadow]
    1007 |         static int width = 0;
         |                    ^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:1123:12: error: invalid storage class for function 'perf_test__list'
    1123 | static int perf_test__list(FILE *fp, struct test_suite **suites, int argc, const char **argv)
         |            ^~~~~~~~~~~~~~~
   tests/builtin-test.c:1146:12: error: invalid storage class for function 'workloads__fprintf_list'
    1146 | static int workloads__fprintf_list(FILE *fp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1157:12: error: invalid storage class for function 'run_workload'
    1157 | static int run_workload(const char *work, int argc, const char **argv)
         |            ^~~~~~~~~~~~
   tests/builtin-test.c:1170:12: error: invalid storage class for function 'perf_test__config'
    1170 | static int perf_test__config(const char *var, const char *value,
         |            ^~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1179:28: error: invalid storage class for function 'build_suites'
    1179 | static struct test_suite **build_suites(void)
         |                            ^~~~~~~~~~~~
   tests/builtin-test.c:1232:5: error: declaration of 'cmd_test' shadows a global declaration [-Werror=shadow]
    1232 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   In file included from tests/builtin-test.c:22:
   tools/perf/builtin.h:45:5: note: shadowed declaration is here
      45 | int cmd_test(int argc, const char **argv);
         |     ^~~~~~~~
   tests/builtin-test.c:1315:1: error: expected declaration or statement at end of input
    1315 | }
         | ^
   tests/builtin-test.c:747:16: error: unused variable 'num_pfds' [-Werror=unused-variable]
     747 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:746:17: error: unused variable 'pfd_indices' [-Werror=unused-variable]
     746 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:745:24: error: unused variable 'pfds' [-Werror=unused-variable]
     745 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:744:16: error: unused variable 'next_to_print' [-Werror=unused-variable]
     744 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:1315:1: error: no return statement in function returning non-void [-Werror=return-type]
    1315 | }
         | ^
   tests/builtin-test.c:742:54: error: unused parameter 'child_tests' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:742:74: error: unused parameter 'num_tests' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:742:89: error: unused parameter 'width' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: At top level:
   tests/builtin-test.c:1232:5: error: 'cmd_test' defined but not used [-Werror=unused-function]
    1232 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   tests/builtin-test.c:742:12: error: 'finish_tests_parallel' defined but not used [-Werror=unused-function]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/builtin-test.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[2]: *** [Makefile.perf:785: perf-test-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
