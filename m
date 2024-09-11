Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A02BAE3
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726036479; cv=none; b=QTtfffLXS4/d9IRJjbh4I31SlL7EiG/MwAhrAwpvGKh5XyyjhR9WGGWxGgZ0JjxDzU8lyb0Jbb11KHPrsi+KQ/kHZ7+J1ZRk400c706OQcn1rfN7sIJiqxkDX15t7a+iefm13NCLd0uW0888SXax4aeORY5uHb8B7E6RA+P5Dgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726036479; c=relaxed/simple;
	bh=+Yl8DoXoPo1+U53Sb9q4y3Fx2NLKBo/ktFePBs4bRlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ+ASw/TSz4/3cxSgv+5DRTbiKQtTP/tcu/Ox8x399P9ENgd/YUVh3I+BSvXCUJCcbQ3jPF4KMP6lxr50Xq6mX9B5ZENY4f77cb0a9lmBgMtEPzKfNiprZXvt2gEzX1+N+0QHVpPJ54C26HvIMUG2Me/jjgzEZUeioSHQhY6opY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmdY4SOi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmdY4SOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726036478; x=1757572478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Yl8DoXoPo1+U53Sb9q4y3Fx2NLKBo/ktFePBs4bRlU=;
  b=mmdY4SOiEvaust2C5coY3TXFG0tBgzuofQyYKIAMcae8qz0MZFmd5aIR
   S2j7Q/BYO5RV6pKULnUdCNOIc+ZQDgPCtWrAQeIUbfzYtKaqZvLRer1Cl
   00w7OArEFMcAKez9V/IB8lxn5Cktj2zZPEqeRHWksi90xFgdRbP4VMbtO
   TNwtzxU4EcKW77t7mFPnvKcFGjarUDGJFi/ZADPKuTJDBBmDr+aMxcenT
   pcIrpMClvuTvKuSx9sYnjtZRGJCi3hgVjKZNIV1SFW3szPucZyhrz8t+4
   mDQwtf75mCjCcLi7cujGUeElAV2tzABEwJx8BQN4AApdbNcTu38eEuNfF
   Q==;
X-CSE-ConnectionGUID: ZdPArs1TQSaE1nVOIv58hA==
X-CSE-MsgGUID: JCoP0FOuQfea47MOkzwchQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36171790"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="36171790"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 23:34:35 -0700
X-CSE-ConnectionGUID: u1aoMZ23TQGAPPoHpfcTLA==
X-CSE-MsgGUID: NALdnE+SS0KTEsVRWYvZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67769342"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2024 23:34:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soGvu-00037y-3A;
	Wed, 11 Sep 2024 06:34:30 +0000
Date: Wed, 11 Sep 2024 14:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] libperf: Add perf_evsel__id() function
Message-ID: <202409111408.NA8mGIbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240909-perf_evsel_get_id-v2-1-b26eae02f606@rivosinc.com>
References: <20240909-perf_evsel_get_id-v2-1-b26eae02f606@rivosinc.com>
TO: Charlie Jenkins <charlie@rivosinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Charlie Jenkins <charlie@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 47ac09b91befbb6a235ab620c32af719f8208399]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/libperf-Add-perf_evsel__id-function/20240910-142806
base:   47ac09b91befbb6a235ab620c32af719f8208399
patch link:    https://lore.kernel.org/r/20240909-perf_evsel_get_id-v2-1-b26eae02f606%40rivosinc.com
patch subject: [PATCH v2] libperf: Add perf_evsel__id() function
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111408.NA8mGIbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409111408.NA8mGIbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc4.ge8b423023fcf
>> evsel.c:493:57: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'void *' [-Wint-conversion]
     493 |                 err = perf_evsel__run_ioctl(evsel, PERF_EVENT_IOC_ID, (unsigned long)&ids[i], i);
         |                                                                       ^~~~~~~~~~~~~~~~~~~~~~
   evsel.c:427:22: note: passing argument to parameter 'arg' here
     427 |                                  int ioc,  void *arg,
         |                                                  ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/libperf/evsel.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [Makefile:122: tools/perf/libperf/libperf-in.o] Error 2
   make[5]: *** [Makefile.perf:961: tools/perf/libperf/libperf.a] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:290: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
