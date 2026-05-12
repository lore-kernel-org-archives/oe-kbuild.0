Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D473E172D
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591129; cv=none; b=MvlgJWullgMoLYgTIwIShzOtK08YFq585GNHukSEM5mqHc/nYa94Bw6al+VwYxo6XnyO0QUugmjS/vApfps5CqWGVySx7/q7+eYv56hsyDILJIAEqNLJGBa+cv2tt+yFiU8DBki7GYctx5d2RECUrc0Pq6a6OnbgLqyBd+t8kcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591129; c=relaxed/simple;
	bh=urcXousgWz7RNmE2FI4W3yDOpJn1+BMGYzT+HonINYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oM0S6E+rU8cLwDNFtlpYctzTc2TAiw8SlSKPElXspBciimxt+yD3G+QTLgHc7LM/jHWVp6OHCow7LZFlrxtOl6EGYk0R3Oqfav1D2qcfYzFONG+htYaBueHEEWEftFpyXf+glyhI0Cn5nwniKB6eOVredMWGcE9iHCkzko9IQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSdazNTT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSdazNTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778591127; x=1810127127;
  h=date:from:to:cc:subject:message-id;
  bh=urcXousgWz7RNmE2FI4W3yDOpJn1+BMGYzT+HonINYc=;
  b=RSdazNTTVL4wpXADWHTQEwmsbUk913C4AOYI1I1+pgp53aetyTlNw+7x
   76/J8hsbd3n/mFrLBLawQsaQaIaxIV4ptI17OJmrLYjlAdz88m4ruG4uh
   yj0E4+jaI0jc/edBu9GDc2TaDJBz7M/m5bYM31XL/VGO9UwH0GdgDUiIj
   351HFA4c3iwqwoZvkRxy3dUKfV5WnntCK/6hQd+OJrWVQ724rVIzU9F0O
   /7hrCsMc4ugjDKFqygWb3MVW9kGsAKimdGHGYCuyvcG5HRIxsVh0cj1Rq
   LCx3uhfDwfpeXb5p37EsV4UpMCNyVh3KCj0GYW2BxJVIZrjkrbZy++ZqE
   g==;
X-CSE-ConnectionGUID: As9HWHhgTQyy9j7wBfPDuA==
X-CSE-MsgGUID: zUvBBfkhRvePSuhrcxr92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="67026468"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="67026468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 06:05:26 -0700
X-CSE-ConnectionGUID: /r4CFR5iTb+2fUrqJFr0VQ==
X-CSE-MsgGUID: pmBeGZo2SCWvXYKtaw/pRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235098931"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 06:05:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMmnb-000000008H3-3MHC;
	Tue, 12 May 2026 13:05:23 +0000
Date: Tue, 12 May 2026 15:04:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 231/231]
 util/bpf-loader.c:331:29: error: 'calloc' sizes specified with 'sizeof' in
 the earlier argument and not in the later argument
Message-ID: <202605121414.opl5o6kd-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   467ad5b5a7fa9ee7c9e135d2ad6d59b02ad6c279
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [231/231] libsubcmd: Fix use-after-free for realloc(..., 0)
:::::: branch date: 4 hours ago
:::::: commit date: 4 years, 3 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605121414.opl5o6kd-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121414.opl5o6kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605121414.opl5o6kd-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
     PERF_VERSION = 5.10.101.g50f3b00d4c7b
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:356:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     356 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:391:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     391 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werror=nonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/aarch64-linux-gnu/include/sys/epoll.h:148:12: note: in a call to function 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   util/metricgroup.c: In function 'metricgroup__setup_events':
   util/metricgroup.c:315:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     315 |                 metric_events = calloc(sizeof(void *),
         |                                               ^~~~
   util/metricgroup.c:315:47: note: earlier argument should specify number of elements, later size of each element
   In file included from tools/include/linux/refcount.h:42,
                    from tools/lib/perf/include/internal/cpumap.h:5,
                    from util/cpumap.h:7,
                    from builtin-sched.c:6:
   builtin-sched.c: In function 'create_tasks':
   tools/include/linux/kernel.h:43:24: error: comparison of distinct pointer types lacks a cast [-Werror=compare-distinct-pointer-types]
      43 |         (void) (&_max1 == &_max2);              \
         |                        ^~
   builtin-sched.c:673:34: note: in expansion of macro 'max'
     673 |                         (size_t) max(16 * 1024, PTHREAD_STACK_MIN));
         |                                  ^~~
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:2688:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    2688 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:2688:62: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:483:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     483 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:483:49: note: earlier argument should specify number of elements, later size of each element
   util/stat-shadow.c: In function 'perf_stat__collect_metric_expr':
   util/stat-shadow.c:359:55: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     359 |                         metric_events = calloc(sizeof(struct evsel *),
         |                                                       ^~~~~~
   util/stat-shadow.c:359:55: note: earlier argument should specify number of elements, later size of each element
   util/scripting-engines/trace-event-python.c: In function 'python_start_script':
   util/scripting-engines/trace-event-python.c:1642:9: error: 'PySys_SetArgv' is deprecated [-Werror=deprecated-declarations]
    1642 |         PySys_SetArgv(argc + 1, command_line);
         |         ^~~~~~~~~~~~~
   In file included from /usr/include/python3.13/Python.h:125,
                    from util/scripting-engines/trace-event-python.c:22:
   /usr/include/python3.13/sysmodule.h:10:38: note: declared here
      10 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) PySys_SetArgv(int, wchar_t **);
         |                                      ^~~~~~~~~~~~~
   util/bpf-loader.c: In function 'config_bpf_program':
>> util/bpf-loader.c:331:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     331 |         priv = calloc(sizeof(*priv), 1);
         |                             ^
   util/bpf-loader.c:331:29: note: earlier argument should specify number of elements, later size of each element
   util/bpf-loader.c: In function 'bpf__obj_config_map':
   util/bpf-loader.c:1220:34: error: pointer 'map_opt' may be used after 'free' [-Werror=use-after-free]
    1220 |                 *key_scan_pos += strlen(map_opt);
         |                                  ^~~~~~~~~~~~~~~
   util/bpf-loader.c:1218:9: note: call to 'free' here
    1218 |         free(map_name);
         |         ^~~~~~~~~~~~~~
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:936:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     936 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:936:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:940:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     940 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:940:29: note: earlier argument should specify number of elements, later size of each element
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:46,
                    from Context.xs:8:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_av_remove_offset':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/config.h:1211:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1211 | #define SSize_t ssize_t /* signed count of bytes */
         |                 ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:226:5: note: in expansion of macro 'SSize_t'
     226 |     SSize_t i = AvARRAY(av) - AvALLOC(av);
         |     ^~~~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:7869:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'S_PerlEnv_putenv':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:313:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     313 |     bool retval = putenv(str);
         |     ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_rpp_context':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:1074:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1074 |         SV *top = *svp;
         |         ^~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:3329:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_is_utf8_valid_partial_char_flags':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'STRLEN' {aka 'long unsigned int'} to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:3160:12: note: in expansion of macro 'cBOOL'
    3160 |     return cBOOL(is_utf8_char_helper_(s0, e, flags));
         |            ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_push_stackinfo':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4012:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4012 |     PERL_SI *next = PL_curstackinfo->si_next;
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_pop_stackinfo':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4052:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4052 |     PERL_SI * const prev = PL_curstackinfo->si_prev;
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_newPADxVOP':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4094:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4094 |     OP *o = newOP(type, flags);
         |     ^~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_foldEQ':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4120:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4120 |     const U8 *a = (const U8 *)s1;
         |     ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_foldEQ_latin1':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4145:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4145 |     const U8 *a = (const U8 *)s1;
         |     ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_cop_file_avn':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:4464:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    4464 |     const char *file = CopFILE(cop);
         |     ^~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:7870:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h: In function 'Perl_newSV_type':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NULL' not handled in switch [-Werror=switch-enum]
     433 |         switch(type) {
         |         ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_IV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_INVLIST' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVNV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVMG' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_REGEXP' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVGV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVLV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVCV' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVFM' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIO' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:396:5: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
     396 |     switch (type) {
         |     ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h: In function 'Perl_sv_setpv_freshbuf':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4254:52: note: in expansion of macro 'cBOOL'
    4254 | #define UNLIKELY(cond)                      EXPECT(cBOOL(cond),FALSE)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
