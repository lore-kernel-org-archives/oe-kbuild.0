Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB43F39FE
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416634; cv=none; b=RW518GKTuNGvo6ck3O6kBN4fEhigV0O0mgLOEHk1we9kFU0taY+o8Ien9/2NZTFgYTXvyxvYeHq4K7k/BJ9vxma2GSAemR544lzSDG3jtOEBuOQ6YX52MKlrpjLFhdGdz67V8JVyaTbEmgP1+1U6yghK368z0PIlmIO4tjRMJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416634; c=relaxed/simple;
	bh=4Nef9q/WouF8QhVJjiu1CIVxwXfnC7zmfL2UgPXN7Rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j8BoShAd0IWBJkUVp4n8WnBZQ2XMvBOz9oASRNvwPdhDgLsPvkPk3m1mftA6spC8W75/f0DXA0zOR4/GGSajM0EzpkC9mRh/3SzpNLmVvZorr5hPln+sDPOBEdMZTYKV/qRC9lZUGbJXyTHLUnNUo+S3naW8eyKC+pcbfADrJPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlQf7r70; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlQf7r70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780416633; x=1811952633;
  h=date:from:to:cc:subject:message-id;
  bh=4Nef9q/WouF8QhVJjiu1CIVxwXfnC7zmfL2UgPXN7Rw=;
  b=IlQf7r70a5sCyxnZ8ibJjHfl8xlLL+YXhDdlx0HUWa6Qs2kB0CUXUl32
   XqhvZA6/Vdbm+facMZ36E078dLfMrx7qKWYPhdTklph8vYUx/iDheoOOV
   v8kgOJTKy8bv3G/mqbPsv6k4QywipVfAnUtWN8UI/V7KOflB3f+tnWXe5
   rDeC5ukq0NmH0ha9WO4fbVVME3z45i6uxRaBpWXxl4N8HUy/obJQuBjuZ
   LO3k6KLJIEtslrKMv8pVz4pQNO7ZsJL8i2XECCjmOtGl4AYkkvpBjK9XK
   iH1h4R0cp+uGym9KjOC2Sk0MZZDj27oK4ekxdWf0ilzuFuFnJx5y5ZkZu
   g==;
X-CSE-ConnectionGUID: LIHgIgl3TRO9Oa4vONMZbQ==
X-CSE-MsgGUID: f/6w212sQQi06Rcd665c8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92693922"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92693922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:10:30 -0700
X-CSE-ConnectionGUID: S9rJgltwTSSWVUcpUL2a8w==
X-CSE-MsgGUID: NhYoXcWQQ+my9v/ycy6N6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244039700"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 09:10:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wURhC-000000001pD-31yD;
	Tue, 02 Jun 2026 16:10:26 +0000
Date: Tue, 02 Jun 2026 18:10:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tests/pmu-events.c:1104:34: error: implicit declaration of
 function 'pmu_metrics_table__name'; did you mean 'pmu_metrics_table__find'?
Message-ID: <202606021848.jZADRwin-lkp@intel.com>
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

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test-pmu-events-A-sub-test-per-metric-table/20260602-164002
head:   e4c41d658075c69ae93088b2c7235a38c7eceea3
commit: e4c41d658075c69ae93088b2c7235a38c7eceea3 perf test pmu-events: A sub-test per metric table
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260602/202606021848.jZADRwin-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021848.jZADRwin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606021848.jZADRwin-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:566: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:940: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1136: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc5.ge4c41d658075
   tests/pmu-events.c: In function 'test__parsing':
   tests/pmu-events.c:932:50: error: 'struct test_case' has no member named 'priv'
     932 |                 table = test->test_cases[subtest].priv;
         |                                                  ^
   tests/pmu-events.c: In function 'test__parsing_fake':
   tests/pmu-events.c:1050:50: error: 'struct test_case' has no member named 'priv'
    1050 |                 table = test->test_cases[subtest].priv;
         |                                                  ^
   tests/pmu-events.c: In function 'populate_metrics_tables_cb':
>> tests/pmu-events.c:1104:34: error: implicit declaration of function 'pmu_metrics_table__name'; did you mean 'pmu_metrics_table__find'? [-Wimplicit-function-declaration]
    1104 |         const char *table_name = pmu_metrics_table__name(table);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                  pmu_metrics_table__find
>> tests/pmu-events.c:1104:34: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   tests/pmu-events.c:1121:18: error: 'struct test_case' has no member named 'priv'
    1121 |                 .priv = (void *)table,
         |                  ^~~~
   tests/pmu-events.c:1129:18: error: 'struct test_case' has no member named 'priv'
    1129 |                 .priv = (void *)table,
         |                  ^~~~
   tests/pmu-events.c: In function 'setup_pmu_events_suite':
>> tests/pmu-events.c:1151:15: error: implicit declaration of function 'pmu_metrics_table__iterate_tables'; did you mean 'pmu_metrics_table__default'? [-Wimplicit-function-declaration]
    1151 |         ret = pmu_metrics_table__iterate_tables(count_metrics_tables_cb, &num_tables);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               pmu_metrics_table__default
   tests/pmu-events.c: At top level:
   tests/pmu-events.c:1214:10: error: 'struct test_suite' has no member named 'setup'
    1214 |         .setup = setup_pmu_events_suite,
         |          ^~~~~
   make[4]: *** [tools/build/Makefile.build:95: tests/pmu-events.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[2]: *** [Makefile.perf:566: perf-test-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
