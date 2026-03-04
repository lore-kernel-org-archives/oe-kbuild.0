Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FA358385
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640815; cv=none; b=UW+ASP9ly4VhesAFD+lnaQaFWYSP32owwkk8lXPhb5g460VwmDnxSOKXbFtKX9QRBUPfnV9GJOOr1dyMm4GifYAqs4nd+I/W897HJohE767/4SjXJVi1wJhqWhYbfvDO1xhm6gAAiduVz1MyE9WuxFguj3rpBlojJt/cGFdeODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640815; c=relaxed/simple;
	bh=ccQlV0/ORlb2VzXGU1JYa/f0uYGRXmfbBU32/HirR+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rAQ9JQG880sRcCkJIKlJIPT10TEBMbNf10Wlzsb9Yn4QoCNBFkiTZmuupNBWIg7aoGuZwlQNg3Fvyy2c0sb9h+EnscC+/3ovyu4td8im8t2NgKAr6Eu/qotlE1LBEqOxDW2U7fWhP8YggCCGhgqhK5BzS0itb1DwCI5+g24DD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUJT8aw1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUJT8aw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772640812; x=1804176812;
  h=date:from:to:cc:subject:message-id;
  bh=ccQlV0/ORlb2VzXGU1JYa/f0uYGRXmfbBU32/HirR+M=;
  b=PUJT8aw17cmECa+h+P9v3ocr/TqTDLoEm8UohX81YBW6Rpc7+UpQAVdT
   aAUBbUfn868dvNMc+h7MrQxcLkGue5Bhoom5wbfdc8/0EyOcxPLcdVwkc
   YcZDHf5V18nsxZ7zA13qWsJv0BFgPEy7hr34kjfPqRanpjD1oZJEU46uV
   2qiQkJD4J5MuyBoECsZDyz1Ryx8WrFDeh+WwMaWwI+H9FkbmSw0yd4wVR
   pJTmzDRZtQLPs6egjfT6BGci99gihbXZNDDJ8kB5SPyI7VwtFyQIYV3Zx
   kJhJtssRxaw9xoYMfNdA9P/9HzeimBs0nMgq0aOCPJaCOz+NDtM3mMtdK
   A==;
X-CSE-ConnectionGUID: LJ7hX1pVR8mwifE0OVxDxg==
X-CSE-MsgGUID: aGWy0MPJTiGyGiZO4QPhkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77311577"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77311577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 08:13:32 -0800
X-CSE-ConnectionGUID: bvhgNVcBTOWUpr6EmvoKoA==
X-CSE-MsgGUID: xVY1+OaAQwyySp3kDid8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="248858350"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 08:13:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxoqm-000000001k1-3w6W;
	Wed, 04 Mar 2026 16:13:28 +0000
Date: Wed, 04 Mar 2026 17:12:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:upstream-linux-6.6.y 683/683]
 util/unwind-libdw.c:323:17: error: implicit declaration of function
 'map_symbol__exit'; did you mean 'symbol__exit'?
Message-ID: <202603041758.rTUlJoq0-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   682d8e2f892b73c2f574684c8dd6b625361b4c03
commit: 442f5db913172f4bce8b5ccd1fc3660d58077f6b [683/683] tools: Fix bitfield dependency failure
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260304/202603041758.rTUlJoq0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041758.rTUlJoq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603041758.rTUlJoq0-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:558: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:647: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.6.127.g442f5db91317
   tools/perf/pmu-events/jevents.py:86: SyntaxWarning: invalid escape sequence '\ '
     all \ are for escaping, it then adjusts as it will have over counted
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4039:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    4039 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:4039:62: note: earlier argument should specify number of elements, later size of each element
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:360:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     360 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   util/metricgroup.c: In function 'setup_metric_events':
   util/metricgroup.c:289:39: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     289 |         metric_events = calloc(sizeof(void *), ids_size + 1);
         |                                       ^~~~
   util/metricgroup.c:289:39: note: earlier argument should specify number of elements, later size of each element
   util/unwind-libdw.c: In function 'unwind__get_entries':
>> util/unwind-libdw.c:323:17: error: implicit declaration of function 'map_symbol__exit'; did you mean 'symbol__exit'? [-Wimplicit-function-declaration]
     323 |                 map_symbol__exit(&ui->entries[i].ms);
         |                 ^~~~~~~~~~~~~~~~
         |                 symbol__exit
   make[4]: *** [tools/build/Makefile.build:97: util/unwind-libdw.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   util/synthetic-events.c: In function 'perf_event__synthesize_threads':
   util/synthetic-events.c:1042:44: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1042 |         synthesize_threads = calloc(sizeof(pthread_t), thread_nr);
         |                                            ^~~~~~~~~
   util/synthetic-events.c:1042:44: note: earlier argument should specify number of elements, later size of each element
   util/synthetic-events.c:1046:29: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    1046 |         args = calloc(sizeof(*args), thread_nr);
         |                             ^
   util/synthetic-events.c:1046:29: note: earlier argument should specify number of elements, later size of each element
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:494:49: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
     494 |                 he->res_samples = calloc(sizeof(struct res_sample),
         |                                                 ^~~~~~
   util/hist.c:494:49: note: earlier argument should specify number of elements, later size of each element
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:97: builtin-top.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:97: builtin-record.o] Error 1
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: util/metricgroup.o] Error 1
   make[4]: *** [tools/build/Makefile.build:97: util/synthetic-events.o] Error 1
   make[4]: *** [tools/build/Makefile.build:97: util/hist.o] Error 1
   make[3]: *** [tools/build/Makefile.build:154: util] Error 2
   make[2]: *** [Makefile.perf:691: perf-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:267: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
