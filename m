Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508737710B
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714504545; cv=none; b=Iu42iUjHw6UlGSIWLC1SmqX2NdHxkFRaV2QMUQJc3BOy4W1ROs6gnaNDIjX1oqR5XLaOpMQwOoSXf+F0mz//yYwDoNZmHMhc7nSHpr0hxRWxHNYXtfveRsHPqTGnt7BcSIfNp9ggmAszpcqQLwN9SwZGx+/M/SrPJ5d0poJ3teY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714504545; c=relaxed/simple;
	bh=mFfTUS9rNnA5QRDfIrnp206+8vJLn9S12T+vvy24qIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eGinLxbOeSp3NGkNTjwrcS51uCuNYBXRto3vGwl8uVjLX/3d4gAjdL4FFrBdpt3dJI8PmEjtgFzz3Jw0pzJKP9xfsTZQOKVyAO7Tqm/vOHHxXXGnu2H0dB96x85OsxCeOcJFujSWnNHTyB/fG6KLksuMYAfLXkgwd+AC9U0j/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBkFIbYY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBkFIbYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714504543; x=1746040543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFfTUS9rNnA5QRDfIrnp206+8vJLn9S12T+vvy24qIo=;
  b=dBkFIbYYwP4Ed3v3t+0T6eOKGU+UWrrcV+wh8ptk0d1obI85agzi+dB7
   thWHhITFk9wwyFGXlX25OmA8hk2NK5WaA8GuIINU/a898TTrzTGFJHmA7
   /tbMTxO7M1q+N+Oot/egtIC/Y98Ru/PZz1V9+H+NZE1EhxfJU5u8jUfwH
   nW/YSM6lt77scB7vDhfRtV86PHVBqXjUPyzhQPM1SlMUzX3DFFOvzndb4
   Fbo6T8UiOt0//FXEEmcpbGgUtvxYm+6Hju1Bnf3s0I8GoOhctLFm57X6n
   QMyJIRi2m89SLQb9o76ERIjqGC5/nnw7rdZsByzozSyWNlKTzGxuA87OF
   A==;
X-CSE-ConnectionGUID: Ba5vh34uSDaKPT1SEsm6mg==
X-CSE-MsgGUID: O+qW1Ej8RSeeY2ar1k6NVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="21649850"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="21649850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 12:15:43 -0700
X-CSE-ConnectionGUID: gdKWTiPSQ/CXiSPSWegacQ==
X-CSE-MsgGUID: dRnrbkULR8yqTfL6lmRdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="31009424"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2024 12:15:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1sx1-0008Tr-0b;
	Tue, 30 Apr 2024 19:15:39 +0000
Date: Wed, 1 May 2024 03:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] perf test pmu: Add an eagerly loaded event test
Message-ID: <202405010256.1BDkfF0K-lkp@intel.com>
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
In-Reply-To: <20240429200225.1271876-5-irogers@google.com>
References: <20240429200225.1271876-5-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Jing Zhang <renyu.zj@linux.alibaba.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org
CC: Ian Rogers <irogers@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.9-rc6 next-20240430]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test-pmu-events-Make-it-clearer-that-pmu-events-tests-json-events/20240430-040959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240429200225.1271876-5-irogers%40google.com
patch subject: [PATCH v3 4/6] perf test pmu: Add an eagerly loaded event test
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010256.1BDkfF0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405010256.1BDkfF0K-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.rc5.gea45a6cddbea
   tests/pmu.c: In function 'test_pmu_get':
   tests/pmu.c:89:9: error: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Werror=unused-result]
      89 |         write(file, "9999\n", 5);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   tests/pmu.c:128:9: error: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Werror=unused-result]
     128 |         write(file, test_event, strlen(test_event));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tests/pmu.c: In function 'test__pmu_events':
>> tests/pmu.c:241:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
     241 |         return ret;
         |                ^~~
   tests/pmu.c:198:13: note: 'ret' was declared here
     198 |         int ret;
         |             ^~~
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/tests/pmu.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
