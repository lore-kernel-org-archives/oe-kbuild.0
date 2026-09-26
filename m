Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EF73126D6
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459758; cv=none; b=Y6LyYVSTAE6sHRoUtvCssbnKn9+k0AI4+0DOR1q4DvRyhC+0ZV9tgdtBjgbZfvJHp22YvylhZC4j+aeHgCbKgUsB34N5V9fp2jmczhTxkjKrI3KXeeQZOx26BlfKLraqfGJXHhvqvTIHKgUDc9dIqZM7Bxz3XRAfGdb4EXaqxjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459758; c=relaxed/simple;
	bh=55mGaCFPxlLOPasr3d1MHZAUR0xg/lUy0dwzEGvm+Cw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mN+Ihe9AVZUq01o2epq7AIcrnG1Z12AHyliiMTza9ptGu7Pc4SQwHCTbYJWHIjukvuBcD1dwjFxfeDMlwX3FEuSO9N/BhbWee74fPUC5kRSwziB0aDiJqVIoNr9JEV5DEx5sbrUgQ2O67IiMtKd9OljGRRvCmLZXYHcJjwvURaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4umLfpi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4umLfpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790459755; x=1821995755;
  h=date:from:to:cc:subject:message-id;
  bh=55mGaCFPxlLOPasr3d1MHZAUR0xg/lUy0dwzEGvm+Cw=;
  b=k4umLfpixTBQNFCGopx3YRgIx1rXsLANgCgwa5xB5g/7xcThAQtHzHsH
   EAXZOODjLcEaagL2abF0Ne2OxNsHyDeDzw6JxOt/N1ki7tRW+6PZHHobz
   n/5tVsnr3lM7XmlbRYgEEGnKy1nPoMGdXvElxyEV4JlmPYE0j416CE14x
   dvVmiKLa7FcYF3wgxHsLx+HKBcD8GWC6ZAS9MZ1RzThzvtcE9gbKf8YSn
   lXYognQYIItOChvh18VLScSYrRLWO8GYzF6WQYOEUQl3nmVIczcmp3Yc3
   Ks3xbce4awYhqBepa6iw/12/2553TV0ezGPMIf1571gwBWWePfdpNx8/6
   g==;
X-CSE-ConnectionGUID: IlY98TyoQtySH3l+wfLPtg==
X-CSE-MsgGUID: g9PuxV6JRz64F6vBxQG/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91228813"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="91228813"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 14:55:54 -0700
X-CSE-ConnectionGUID: hfDfWrEpQ5qecA4915m+Eg==
X-CSE-MsgGUID: f0SEe+hMSyaH6bk9zkikhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274230483"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2026 14:55:53 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAaN4-000000000D1-2hBg;
	Sat, 26 Sep 2026 21:55:50 +0000
Date: Sat, 26 Sep 2026 23:55:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 284/284]
 util/stat-shadow.c:359:55: error: 'calloc' sizes specified with 'sizeof' in
 the earlier argument and not in the later argument
Message-ID: <202609262305.zshd065q-lkp@intel.com>
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
head:   9b45a047ff0f19af584920a93cd8020b8538a5c3
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [284/284] libsubcmd: Fix use-after-free for realloc(..., 0)
:::::: branch date: 35 hours ago
:::::: commit date: 4 years, 7 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260926/202609262305.zshd065q-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262305.zshd065q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609262305.zshd065q-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                          ^~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1029:34: note: in expansion of macro 'cBOOL'
    1029 | #   define TAINTING_get         (cBOOL(UNLIKELY(PL_tainting)))
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1718:51: note: in expansion of macro 'TAINTING_get'
    1718 | #define SvTAINTED_on(sv)  STMT_START{ if(UNLIKELY(TAINTING_get)){sv_taint(sv);}   }STMT_END
         |                                                   ^~~~~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1725:13: note: in expansion of macro 'SvTAINTED_on'
    1725 |             SvTAINTED_on(sv);           \
         |             ^~~~~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:1013:5: note: in expansion of macro 'SvTAINT'
    1013 |     SvTAINT(sv);
         |     ^~~~~~~
   util/metricgroup.c: In function 'metricgroup__setup_events':
   util/metricgroup.c:315:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     315 |                 metric_events = calloc(sizeof(void *),
         |                                               ^~~~
   util/metricgroup.c:315:47: note: earlier argument should specify number of elements, later size of each element
   Context.c: In function 'XS_Perf__Trace__Context_common_pc':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]
    2496 | #  define INT2PTR(any,d)        (any)(d)
         |                                 ^
   Context.c:55:39: note: in expansion of macro 'INT2PTR'
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4253:52: note: in expansion of macro 'cBOOL'
    4253 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:485:13: note: in expansion of macro 'LIKELY'
     485 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:487:28: note: in expansion of macro 'TAINT_get'
     487 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:556:38: note: in expansion of macro 'TARGi'
     556 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:60:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_flags':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]
    2496 | #  define INT2PTR(any,d)        (any)(d)
         |                                 ^
   Context.c:78:39: note: in expansion of macro 'INT2PTR'
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4253:52: note: in expansion of macro 'cBOOL'
    4253 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:485:13: note: in expansion of macro 'LIKELY'
     485 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:487:28: note: in expansion of macro 'TAINT_get'
     487 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:556:38: note: in expansion of macro 'TARGi'
     556 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:83:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_lock_depth':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:2496:33: error: cast from function call of type 'IV' {aka 'long int'} to non-matching type 'struct scripting_context *' [-Werror=bad-function-cast]
    2496 | #  define INT2PTR(any,d)        (any)(d)
         |                                 ^
   Context.c:101:39: note: in expansion of macro 'INT2PTR'
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4253:52: note: in expansion of macro 'cBOOL'
    4253 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:485:13: note: in expansion of macro 'LIKELY'
     485 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:487:28: note: in expansion of macro 'TAINT_get'
     487 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/pp.h:556:38: note: in expansion of macro 'TARGi'
     556 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:106:13: note: in expansion of macro 'PUSHi'
   util/stat-shadow.c: In function 'perf_stat__collect_metric_expr':
>> util/stat-shadow.c:359:55: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     359 |                         metric_events = calloc(sizeof(struct evsel *),
         |                                                       ^~~~~~
   util/stat-shadow.c:359:55: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:483:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     483 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:483:49: note: earlier argument should specify number of elements, later size of each element
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:97: scripts/perl/Perf-Trace-Util/Context.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: perl/Perf-Trace-Util] Error 2
   make[3]: *** [tools/build/Makefile.build:139: scripts] Error 2
   make[3]: *** Waiting for unfinished jobs....
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:936:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     936 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:936:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:940:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     940 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:940:29: note: earlier argument should specify number of elements, later size of each element
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In file included from /usr/aarch64-linux-gnu/include/stdio.h:970,
                    from util/branch.h:9,
                    from util/callchain.h:8,
                    from util/machine.c:7:
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/aarch64-linux-gnu/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/aarch64-linux-gnu/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/aarch64-linux-gnu/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/aarch64-linux-gnu/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
