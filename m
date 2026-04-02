Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF819C54E
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 01:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775092216; cv=none; b=F9TsvqUQq3vnK+ZDZ+JibgwVYCcBj/YjnsyQBeKj24k4I6JuYFY25omSCwbUlc0QTPG2wh6b/HwsgV5WBtP67cMVQmJ0txuL3izFsc/YRQvSJtHSBj22HXzKByFbPqvdhdJOL3Pw2eJ5ihdghDQMORpBsJxlrx/slQx1R9YZE5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775092216; c=relaxed/simple;
	bh=N2IZhy0aYd/qZu+/ovf29z4NXMFNgj0QAYnBWMfVAxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=clv2x66lPOLMpj6Xi//oMl3slaHTv+Xdht8N4wdaiCh0ogxJWjJtpjWoNyAb2uf8tvMjqfmOZom8NsvxdsbaeOqH4k1y/OzsiscshDbAyxR5HOef0yUtH2iEYaH5BdJkzdOFFYd/aFoebZRzU1kUbzYIR+i9idVXH8V8H2erWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3/Znh5X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3/Znh5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775092215; x=1806628215;
  h=date:from:to:cc:subject:message-id;
  bh=N2IZhy0aYd/qZu+/ovf29z4NXMFNgj0QAYnBWMfVAxY=;
  b=l3/Znh5XhI8QpZ0uCHNI5fbRcK/R7dmc3sGSAwHg0ITEwD0Fz+AokVWf
   nbizQcCPY9Wy46BVK3rVqm/4xzkgaQwHZx3cWKd8g70jSA9YxmL9fFCdH
   Pkas4uE4MvXYZzpv8GqQ5q7t5/N4pO03TEctlQiAEymemcqmEN1xyoW2Q
   8b5MWf5y6SASbUJd3mugfd+Z3L6OflJZPtjdIxoTKtYShtDJMJ6CDaLbM
   YI40gs/2CCBiWKxZqnLYvaaxUQs1EcAVaBJPrvoekSLScDiUllTMCRccv
   Kqw29CK3r1wiF2bwBKZ5VtI2FybxolF7lihb9NsfukcuHfE+M+JQWiFxD
   A==;
X-CSE-ConnectionGUID: 9OPpIyEnR4uY0W4cCYEABQ==
X-CSE-MsgGUID: gg1ARuxkRtyfLim5imuZNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87604602"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87604602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 18:10:14 -0700
X-CSE-ConnectionGUID: hs9xLKFbQ5GhAS0swtP60A==
X-CSE-MsgGUID: z316olmzQTmFTRu0GMHPJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225992844"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2026 18:10:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w86ZX-000000008ub-0rFC;
	Thu, 02 Apr 2026 01:10:11 +0000
Date: Thu, 02 Apr 2026 03:09:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 14/20]
 util/header.c:2549:36: error: format '%d' expects argument of type 'int', but
 argument 4 has type 'ssize_t' {aka 'long int'}
Message-ID: <202604020316.eOOSUBEU-lkp@intel.com>
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
TO: SeungJu Cheon <suunj1331@gmail.com>
CC: Namhyung Kim <namhyung@kernel.org>
CC: Ian Rogers <irogers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   98fb63998c72ab248ea1e02aa96a8e1f8e6d8a33
commit: b604ccac3472cfb0423842b0dc562304144e2d17 [14/20] perf header: Validate build_id filename length to prevent buffer overflow
:::::: branch date: 49 minutes ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260402/202604020316.eOOSUBEU-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020316.eOOSUBEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020316.eOOSUBEU-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc4.gb604ccac3472
   In file included from util/header.c:38:
   util/header.c: In function 'perf_header__read_build_ids_abi_quirk':
>> util/header.c:2549:36: error: format '%d' expects argument of type 'int', but argument 4 has type 'ssize_t' {aka 'long int'} [-Werror=format=]
    2549 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   util/debug.h:20:21: note: in definition of macro 'pr_fmt'
      20 | #define pr_fmt(fmt) fmt
         |                     ^~~
   util/header.c:2549:25: note: in expansion of macro 'pr_warning'
    2549 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                         ^~~~~~~~~~
   util/header.c:2549:71: note: format string is defined here
    2549 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                                                                      ~^
         |                                                                       |
         |                                                                       int
         |                                                                      %ld
   util/header.c: In function 'perf_header__read_build_ids':
   util/header.c:2596:36: error: format '%d' expects argument of type 'int', but argument 4 has type 'ssize_t' {aka 'long int'} [-Werror=format=]
    2596 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   util/debug.h:20:21: note: in definition of macro 'pr_fmt'
      20 | #define pr_fmt(fmt) fmt
         |                     ^~~
   util/header.c:2596:25: note: in expansion of macro 'pr_warning'
    2596 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                         ^~~~~~~~~~
   util/header.c:2596:71: note: format string is defined here
    2596 |                         pr_warning("invalid build_id filename length %d\n", len);
         |                                                                      ~^
         |                                                                       |
         |                                                                       int
         |                                                                      %ld
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:95: util/header.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: util] Error 2
   make[2]: *** [Makefile.perf:797: perf-util-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
