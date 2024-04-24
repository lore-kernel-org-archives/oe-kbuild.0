Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F48BF8
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Apr 2024 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713926697; cv=none; b=hsXFa574b0ItPhKeMX9csL/WQEae1pYIH3TUV7u+VGKk+pQ32B5YkzzUf7drWFA7WPx4Mdo1of7DIgolv+O3pwi3Hrr/00FPR8wjBO4jZgsUycGA4de4OG37Qj0VhHEiHzQ4dW6VB546XHhNNYFs0ZoZjyrQZlhgnr4m3SoTPlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713926697; c=relaxed/simple;
	bh=X22t4/h9YSAup7ocEm7bnvL3/6kFAIWu6SFDc+rd/fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SE2OPG1tVJ83vOUwd3H7aZ+SjCLYKJq2vb54sPush726xVyVP5XYWydFVQ+iX4nkI9K6221JJzoSuwGCSNWlU31KPA/aQO1rpZEyeFysHlWEtxiYmTziWt4tqusUk1BNuJVhfNGBb4IT5Xtsdw1hQlOxRPdnITRoa8zRFAtAlhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQpv8P/V; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQpv8P/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713926696; x=1745462696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X22t4/h9YSAup7ocEm7bnvL3/6kFAIWu6SFDc+rd/fs=;
  b=XQpv8P/V9n+uQ7nF+XM6B0/QBxCGnpn2/J/keb3c1CVIejClowgDWYF0
   /Lpj3Smynh+JfaxZYI55B59VUnVCJG4rXyL78lm3RQ0Qsh/wPGbzG7tbS
   5pHEmliFcOGJIEqZK5f/vc5LcKbS5RCh7+XRAtpyqEWUBPWgS7S8axjW0
   PB165RIAgllY6nWQgkFgRZVxe9np3S9ecqVjCl80QDIyjucu6SsdeJ6/I
   4ja4vIi5UUc8YROIFYguB/6di8zVguP/ImG1Kc2pvhRcBKQJDSSpLV2Wb
   Ev+faA8txavAJW4Z7D6LT6MJq00zevt9EbWtcsXgiWnXbSo/XQz3uPLZp
   Q==;
X-CSE-ConnectionGUID: VDARV+iXR4O166nb2wB/WQ==
X-CSE-MsgGUID: 2KO0DKheS/O009Zsi4ZrTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9367631"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9367631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 19:44:55 -0700
X-CSE-ConnectionGUID: kAagK9ujQGyHF+RKHE5BZQ==
X-CSE-MsgGUID: c46APcJxScyu+eQrjRR2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="24609178"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Apr 2024 19:44:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzSct-0000mV-2h;
	Wed, 24 Apr 2024 02:44:51 +0000
Date: Wed, 24 Apr 2024 10:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/6] perf test pmu: Add an eagerly loaded event test
Message-ID: <202404241018.bgi3yFxj-lkp@intel.com>
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
In-Reply-To: <20240423031719.1941141-5-irogers@google.com>
References: <20240423031719.1941141-5-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
TO: Jing Zhang <renyu.zj@linux.alibaba.com>
TO: James Clark <james.clark@arm.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.9-rc5 next-20240423]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-test-pmu-events-Make-it-clearer-that-pmu-events-tests-json-events/20240423-112057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240423031719.1941141-5-irogers%40google.com
patch subject: [PATCH v2 4/6] perf test pmu: Add an eagerly loaded event test
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241018.bgi3yFxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404241018.bgi3yFxj-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.8.ged816a028ac7
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
