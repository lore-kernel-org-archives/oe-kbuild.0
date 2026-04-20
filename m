Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74676379ED5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Apr 2026 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776705249; cv=none; b=UZ3yT+gZ2G6GI9hfiZhzHffRVTPr0TE1UhJZoMq9yeOZU3f5aebkKcqE2PHmdtWxQ5TIL2IkBWvieQdg/b2cwM1HeCdWFfZ2PAbKWM0/4AZpW9Z9kCyVJ23BeaKxRz2i88M7Hl6Xc74E68vgfyTDBogWFoA9iwrRq/4nB9BjWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776705249; c=relaxed/simple;
	bh=0qh+3RzvQGnsJaFo4Qd6EyhaHBdZGTCRuEjIZTmnBrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FRGkV5wJJaYMoFbwi3KfSPo6V2qnZcNOTDEM3kWhzb5ULy37krD37dJhJTWKfOBzT/4kGXEkJrYaxUuLR1cTwxvOwnjrHVI+/KzYLmTWDYT/IlTptRbTLRuEqbieG9q5ve42NjI6T1eBScGYGW9emnvb4xmxbL55bv54kS+ibWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM6iTxey; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM6iTxey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776705247; x=1808241247;
  h=date:from:to:cc:subject:message-id;
  bh=0qh+3RzvQGnsJaFo4Qd6EyhaHBdZGTCRuEjIZTmnBrQ=;
  b=VM6iTxeyXXuXOTFuSoTcV3aImS5JzxRPuyjyFfYh1I2WkwuuvpoX201L
   HgzTXDPuWu2ZTdYKc3yCMp2EQmXWjEkkf8XMIKXfyRbYI0tjR6Uqy+ebK
   COWV5H9CxbzzFO0okr7Rz/uaSP/f8RguaDmjM0Eaw4kJRO6GhsquS13jk
   NyCwAcijZ01NhEL5NubNcnjQ4BixH0WwicIlWrGJL6mgzKoMBnhwJzjAr
   eIJVz/g0+ipATiTMKgt1ofLGIDjziKCeVhfoHkHLIeLF4RZnVv/9k6w4Q
   1dRgGMhLq/+1O8C+84PPZWgu1AH6f3WPzY/4hsoOG8czOv87SiyWm54GL
   A==;
X-CSE-ConnectionGUID: lZtRDllnRG+nVjtbEFG92w==
X-CSE-MsgGUID: C09KEWAORfKQZ41QHc9/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77332486"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="77332486"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 10:14:07 -0700
X-CSE-ConnectionGUID: ryviB+lzQLuw0siECwlhoQ==
X-CSE-MsgGUID: skisLBmfToqLW5DxuLMpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="231655565"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Apr 2026 10:14:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEsCB-000000002In-1B3a;
	Mon, 20 Apr 2026 17:14:03 +0000
Date: Mon, 20 Apr 2026 19:13:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 59/59]
 tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word
 size. Check asm/bitsperlong.h
Message-ID: <202604201938.VTmYGHJx-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a00cb39a367f410fb4a49bd4ad04a72e3d3764fd
commit: c8def8cde13bfb58e4ac663dfa27713cba54c60e [59/59] tools bitmap: Add missing asm-generic/bitsperlong.h include
:::::: branch date: 80 minutes ago
:::::: commit date: 5 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260420/202604201938.VTmYGHJx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201938.VTmYGHJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604201938.VTmYGHJx-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/const.h' differs from latest version at 'include/uapi/linux/const.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/in.h' differs from latest version at 'include/uapi/linux/in.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/required-features.h' differs from latest version at 'arch/x86/include/asm/required-features.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' differs from latest version at 'arch/x86/include/asm/msr-index.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' differs from latest version at 'arch/x86/include/uapi/asm/svm.h'
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' differs from latest version at 'arch/arm64/include/asm/cputype.h'
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/syscall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/syscall.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/socket.h' differs from latest version at 'include/linux/socket.h'
   Makefile.config:549: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:683: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
   tools/perf/pmu-events/jevents.py:60: SyntaxWarning: invalid escape sequence '\ '
     all \ are for escaping, it then adjusts as it will have over counted
   scripts/bpf_doc.py:62: SyntaxWarning: invalid escape sequence '\w'
     arg_re = re.compile('((\w+ )*?(\w+|...))( (\**)(\w+))?$')
   scripts/bpf_doc.py:64: SyntaxWarning: invalid escape sequence '\*'
     proto_re = re.compile('(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
   scripts/bpf_doc.py:116: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(BPF\w+)$')
   scripts/bpf_doc.py:120: SyntaxWarning: invalid escape sequence '\*'
     end_re = re.compile(' \* ?NOTES$')
   scripts/bpf_doc.py:135: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
   scripts/bpf_doc.py:143: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Description$')
   scripts/bpf_doc.py:156: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:169: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Return$')
   scripts/bpf_doc.py:182: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:221: SyntaxWarning: invalid escape sequence '\s'
     bpf_p = re.compile('\s*(BPF\w+)+')
   scripts/bpf_doc.py:226: SyntaxWarning: invalid escape sequence '\s'
     assign_p = re.compile('\s*(BPF\w+)\s*=\s*(BPF\w+)')
   scripts/bpf_doc.py:241: SyntaxWarning: invalid escape sequence '\w'
     self.enum_syscalls = re.findall('(BPF\w+)+', bpf_cmd_str)
   scripts/bpf_doc.py:264: SyntaxWarning: invalid escape sequence '\s'
     p = re.compile('\s*FN\((\w+)\)|\\\\')
   scripts/bpf_doc.py:277: SyntaxWarning: invalid escape sequence '\('
     self.define_unique_helpers = re.findall('FN\(\w+\)', fn_defines_str)
   scripts/bpf_doc.py:410: SyntaxWarning: invalid escape sequence '\*'
     '/{}/,/\*\//:include/uapi/linux/bpf.h'.format(delimiter)]
   scripts/bpf_doc.py:501: SyntaxWarning: invalid escape sequence '\ '
     license string passed (via **attr**) to the **bpf**\ () system call, and this
   scripts/bpf_doc.py:583: SyntaxWarning: invalid escape sequence '\ '
     one_arg += ' {}**\ '.format(a['star'].replace('*', '\\*'))
     PERF_VERSION = 6.1.158.gc8def8cde13b
   In file included from tools/include/linux/bitmap.h:6,
                    from util/pmu.h:5,
                    from builtin-list.c:14:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[3]: *** [tools/build/Makefile.build:97: builtin-list.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/util/pmu.h:5,
                    from arch/x86/util/mem-events.c:2:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/util/pmu.h:5,
                    from arch/x86/util/evlist.c:3:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/util/pmu.h:5,
                    from arch/x86/util/topdown.c:4:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:358:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     358 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:393:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     393 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   In file included from tools/include/linux/bitmap.h:6,
                    from ../lib/bitmap.c:6:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4072:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    4072 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:4072:62: note: earlier argument should specify number of elements, later size of each element
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werror=nonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/include/x86_64-linux-gnu/sys/epoll.h:148:12: note: in a call to function 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   make[6]: *** [tools/build/Makefile.build:96: arch/x86/util/mem-events.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:96: arch/x86/util/topdown.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:96: arch/x86/util/evlist.o] Error 1
   In file included from tools/include/linux/bitmap.h:6,
                    from util/pmu.h:5,
                    from util/topdown.c:3:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   In file included from tools/include/linux/bitmap.h:6,
                    from util/svghelper.c:16:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[4]: *** [util/Build:313: util/bitmap.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-top.o] Error 1
   In file included from tools/include/linux/bitmap.h:6,
                    from util/scripting-engines/trace-event-perl.c:28:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   util/metricgroup.c: In function 'setup_metric_events':
   util/metricgroup.c:269:39: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     269 |         metric_events = calloc(sizeof(void *), ids_size + 1);
         |                                       ^~~~
   util/metricgroup.c:269:39: note: earlier argument should specify number of elements, later size of each element
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/../lib/bitmap.c:6:
>> tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[4]: *** [tools/build/Makefile.build:96: util/svghelper.o] Error 1
   make[3]: *** [tools/build/Makefile.build:143: tests] Error 2
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:492:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     492 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:492:49: note: earlier argument should specify number of elements, later size of each element
   util/stat-shadow.c: In function 'perf_stat__collect_metric_expr':
   util/stat-shadow.c:390:55: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     390 |                         metric_events = calloc(sizeof(struct evsel *),
         |                                                       ^~~~~~
   util/stat-shadow.c:390:55: note: earlier argument should specify number of elements, later size of each element
   util/bpf-loader.c: In function 'config_bpf_program':
   util/bpf-loader.c:574:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     574 |         priv = calloc(sizeof(*priv), 1);
         |                             ^
   util/bpf-loader.c:574:29: note: earlier argument should specify number of elements, later size of each element
   make[4]: *** [tools/build/Makefile.build:96: util/topdown.o] Error 1
>> error: command '/usr/bin/gcc-14' failed with exit code 1
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:1040:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1040 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:1040:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:1044:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1044 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:1044:29: note: earlier argument should specify number of elements, later size of each element
>> cp: cannot stat 'python_ext_build/lib/perf*.so': No such file or directory
   make[2]: *** [Makefile.perf:647: python/perf.so] Error 1
   make[2]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:143: util] Error 2
   make[4]: *** [tools/build/Makefile.build:143: x86] Error 2
   make[3]: *** [tools/build/Makefile.build:143: arch] Error 2
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/metricgroup.o] Error 1
   make[5]: *** [tools/build/Makefile.build:97: util/scripting-engines/trace-event-perl.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/stat-shadow.o] Error 1
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-record.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/bpf-loader.o] Error 1
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/hist.o] Error 1
   make[4]: *** [tools/build/Makefile.build:96: util/synthetic-events.o] Error 1
   make[4]: *** [tools/build/Makefile.build:143: scripting-engines] Error 2
   make[3]: *** [tools/build/Makefile.build:143: util] Error 2
   make[2]: *** [Makefile.perf:669: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:240: sub-make] Error 2
--
   In file included from ../../include/linux/bitmap.h:6,
                    from bitmap.c:3:
>> ../../include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~


vim +14 tools/include/asm-generic/bitsperlong.h

bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  12  
2a00f026a15d16 Arnaldo Carvalho de Melo 2016-07-13  13  #if BITS_PER_LONG != __BITS_PER_LONG
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12 @14  #error Inconsistent word size. Check asm/bitsperlong.h
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  15  #endif
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  16  

:::::: The code at line 14 was first introduced by commit
:::::: bb9707077b4ee5f77bc9939b057ff8a0d410296f tools: Copy the bitsperlong.h files from the kernel

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
