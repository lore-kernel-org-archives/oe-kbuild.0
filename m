Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858B1FDA61
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770771985; cv=none; b=Mf31ZcKH69D5D0oEEkig3LXDVC582ZMDfDp5nlHiZDXbsU3zPcuqO93+etv0yP734GhDwrEGDjWxXGDUgq4qwSOcwbdwQTgrXBHuFiy0zARsqX3sP/bNMcJOUyUIoQjbsvAOTlBNIiXaUuQ7B6CZYq8TGr9hm38bOKjRWorryTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770771985; c=relaxed/simple;
	bh=Sspvq7OacL0apWVuBgIGqFjJJ5/6sZyveARaYAQf9JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sukmmuk6UN0qUWnpcYqvCLKBeAqV+XVVJ+FfWEV4cvzRIjU5zkzQ4TwHQx0YbftkXpnmE/A5wYr+5pL3otgz55RF7zGUatfkkE/7QPINOa4CSD/9+Nhg7oHxej5XZFJb7lYG7fdZU8zaCF01pbpGrK+H3xDxPZ+dXUf8aT7mYv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayA7mNQa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayA7mNQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770771983; x=1802307983;
  h=date:from:to:cc:subject:message-id;
  bh=Sspvq7OacL0apWVuBgIGqFjJJ5/6sZyveARaYAQf9JI=;
  b=ayA7mNQavRfmGM1gP3V5qrq53V1dAV/8tMLjUfuyZcZOX43g+oyb2gGq
   m+nl2foG7VzW2qSEEOdjRUq0H7OQLbGY1qLnpDT/3biflrWNrzMMg4DlG
   AKNPbLuEretBqndn3czscBGYukFz9/zTJlk00COL1Y7hmJmyg42lPbQIo
   F41GkvZtOihmqVv5iOGSiT5bD6GS9qM7ERpVsgC9w1GiiwVggpdVTWaFc
   hPLozF2CNPB/ftKQpnohEGcO9h+bKJUrYeBLRTOOdIt0XwpVnOn6G3Kjf
   KQxa4t4eNrpfM+erGVvAADVGu7qwVGqQVVKKVvnYVmTuPaoSqEf6K8i7F
   Q==;
X-CSE-ConnectionGUID: JyCbrkH/QpGiVpeP1u2JyQ==
X-CSE-MsgGUID: wyqd34m1SbiZMrQ55WiLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83016156"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83016156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:06:23 -0800
X-CSE-ConnectionGUID: jPd6hzQOSIOlaBKgtXX2yw==
X-CSE-MsgGUID: NBKzSUY9TiqQnhIGcCPXjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241963045"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2026 17:06:20 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpygM-000000000xx-2lYN;
	Wed, 11 Feb 2026 01:06:18 +0000
Date: Wed, 11 Feb 2026 02:06:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 203/203]
 util/annotate.c:1729:9: error: too few arguments to function
 'init_disassemble_info'
Message-ID: <202602110235.8IBa7lvS-lkp@intel.com>
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
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [203/203] libsubcmd: Fix use-after-free for realloc(..., 0)
:::::: branch date: 4 hours ago
:::::: commit date: 4 years ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110235.8IBa7lvS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110235.8IBa7lvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110235.8IBa7lvS-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/stat.h' differs from latest version at 'include/uapi/linux/stat.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
   Warning: Kernel ABI header at 'tools/arch/powerpc/include/uapi/asm/errno.h' differs from latest version at 'arch/powerpc/include/uapi/asm/errno.h'
   Warning: Kernel ABI header at 'tools/include/linux/build_bug.h' differs from latest version at 'include/linux/build_bug.h'
   Makefile.config:602: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
   Makefile.config:695: No libcrypto.h found, disables jitted code injection, please install openssl-devel or libssl-dev
   scripts/bpf_helpers_doc.py:42: SyntaxWarning: invalid escape sequence '\w'
     arg_re = re.compile('((\w+ )*?(\w+|...))( (\**)(\w+))?$')
   scripts/bpf_helpers_doc.py:44: SyntaxWarning: invalid escape sequence '\*'
     proto_re = re.compile('(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
   scripts/bpf_helpers_doc.py:90: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
   scripts/bpf_helpers_doc.py:98: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Description$')
   scripts/bpf_helpers_doc.py:112: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_helpers_doc.py:121: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Return$')
   scripts/bpf_helpers_doc.py:135: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_helpers_doc.py:290: SyntaxWarning: invalid escape sequence '\ '
     license string passed (via **attr**) to the **bpf**\ () system call, and this
   scripts/bpf_helpers_doc.py:372: SyntaxWarning: invalid escape sequence '\ '
     one_arg += ' {}**\ '.format(a['star'].replace('*', '\\*'))
     PERF_VERSION = 5.10.101.g50f3b00d4c7b
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werror=nonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/include/x86_64-linux-gnu/sys/epoll.h:148:12: note: in a call to function 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
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
   util/metricgroup.c: In function 'metricgroup__setup_events':
   util/metricgroup.c:315:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     315 |                 metric_events = calloc(sizeof(void *),
         |                                               ^~~~
   util/metricgroup.c:315:47: note: earlier argument should specify number of elements, later size of each element
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:356:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     356 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:391:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     391 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   util/stat-shadow.c: In function 'perf_stat__collect_metric_expr':
   util/stat-shadow.c:359:55: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     359 |                         metric_events = calloc(sizeof(struct evsel *),
         |                                                       ^~~~~~
   util/stat-shadow.c:359:55: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:483:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     483 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:483:49: note: earlier argument should specify number of elements, later size of each element
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:2688:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    2688 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:2688:62: note: earlier argument should specify number of elements, later size of each element
   util/scripting-engines/trace-event-python.c: In function 'python_start_script':
   util/scripting-engines/trace-event-python.c:1642:9: error: 'PySys_SetArgv' is deprecated [-Werror=deprecated-declarations]
    1642 |         PySys_SetArgv(argc + 1, command_line);
         |         ^~~~~~~~~~~~~
   In file included from /usr/include/python3.13/Python.h:125,
                    from util/scripting-engines/trace-event-python.c:22:
   /usr/include/python3.13/sysmodule.h:10:38: note: declared here
      10 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) PySys_SetArgv(int, wchar_t **);
         |                                      ^~~~~~~~~~~~~
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:936:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     936 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:936:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:940:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     940 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:940:29: note: earlier argument should specify number of elements, later size of each element
   util/annotate.c: In function 'symbol__disassemble_bpf':
>> util/annotate.c:1729:9: error: too few arguments to function 'init_disassemble_info'
    1729 |         init_disassemble_info(&info, s,
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from util/annotate.c:1686:
   /usr/include/dis-asm.h:482:13: note: declared here
     482 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
         |             ^~~~~~~~~~~~~~~~~~~~~
   util/bpf-loader.c: In function 'config_bpf_program':
   util/bpf-loader.c:331:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     331 |         priv = calloc(sizeof(*priv), 1);
         |                             ^
   util/bpf-loader.c:331:29: note: earlier argument should specify number of elements, later size of each element
   make[4]: *** [tools/build/Makefile.build:96: util/annotate.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   util/machine.c: In function 'machine__create_modules':
   util/machine.c:1382:50: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Werror=format-truncation=]
    1382 |                 snprintf(path, sizeof(path), "%s/%s", dir_name, dent->d_name);
         |                                                  ^~
   In file included from /usr/include/stdio.h:970,
                    from util/branch.h:9,
                    from util/callchain.h:8,
                    from util/machine.c:7:
   In function 'snprintf',
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1382:3,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
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
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
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
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
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
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
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
       inlined from 'maps__set_modules_path_dir' at util/machine.c:1398:10,
       inlined from 'machine__set_modules_path' at util/machine.c:1436:9,
       inlined from 'machine__create_modules' at util/machine.c:1482:7:
   /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
      68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      69 |                                    __glibc_objsize (__s), __fmt,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      70 |                                    __va_arg_pack ());
         |                                    ~~~~~~~~~~~~~~~~~
   util/bpf-loader.c: In function 'bpf__obj_config_map':
   util/bpf-loader.c:1220:34: error: pointer 'map_opt' may be used after 'free' [-Werror=use-after-free]
    1220 |                 *key_scan_pos += strlen(map_opt);
         |                                  ^~~~~~~~~~~~~~~
   util/bpf-loader.c:1218:9: note: call to 'free' here
    1218 |         free(map_name);
         |         ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/metricgroup.o] Error 1
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:46,
                    from Context.xs:8:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_av_remove_offset':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/config.h:1211:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1211 | #define SSize_t ssize_t /* signed count of bytes */
         |                 ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:226:5: note: in expansion of macro 'SSize_t'
     226 |     SSize_t i = AvARRAY(av) - AvALLOC(av);
         |     ^~~~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:7869:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'S_PerlEnv_putenv':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:313:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
     313 |     bool retval = putenv(str);
         |     ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_rpp_context':
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h:1074:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    1074 |         SV *top = *svp;
         |         ^~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:3329:
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/inline.h: In function 'Perl_is_utf8_valid_partial_char_flags':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'STRLEN' {aka 'long unsigned int'} to non-matching type '_Bool' [-Werror=bad-function-cast]
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
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NULL' not handled in switch [-Werror=switch-enum]
     433 |         switch(type) {
         |         ^~~~~~
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_IV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_NV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_INVLIST' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVNV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVMG' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_REGEXP' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVGV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVLV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVCV' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVFM' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_PVIO' not handled in switch [-Werror=switch-enum]
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:433:9: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:396:5: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
     396 |     switch (type) {
         |     ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h: In function 'Perl_sv_setpv_freshbuf':
>> /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4254:52: note: in expansion of macro 'cBOOL'
    4254 | #define UNLIKELY(cond)                      EXPECT(cBOOL(cond),FALSE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1724:13: note: in expansion of macro 'UNLIKELY'
    1724 |         if (UNLIKELY(TAINT_get))        \
         |             ^~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:1028:34: note: in expansion of macro 'cBOOL'
    1028 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1724:22: note: in expansion of macro 'TAINT_get'
    1724 |         if (UNLIKELY(TAINT_get))        \
         |                      ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv_inline.h:1013:5: note: in expansion of macro 'SvTAINT'
    1013 |     SvTAINT(sv);
         |     ^~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/handy.h:155:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     155 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4233:62: note: in definition of macro 'EXPECT'
    4233 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/perl.h:4254:52: note: in expansion of macro 'cBOOL'
    4254 | #define UNLIKELY(cond)                      EXPECT(cBOOL(cond),FALSE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.40/CORE/sv.h:1718:42: note: in expansion of macro 'UNLIKELY'
    1718 | #define SvTAINTED_on(sv)  STMT_START{ if(UNLIKELY(TAINTING_get)){sv_taint(sv);}   }STMT_END
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
