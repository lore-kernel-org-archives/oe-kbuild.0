Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619A172BD5
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714492652; cv=none; b=Czw83qU1HFcG4OOKyGak8eG4h0CzPsDWv8sGE3WTtIpBIm1hDHQRdelFMgQRYWqhJ2+qr0Az7UrtNX+hAZ8OY/zKgsuif8WTHfFYxTYIqD7W2wdKhP9PfwcbEs6z+ABcI5z0LZEbOugmtLkBmmpPug86yg4oWF7GNH2hIX6P+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714492652; c=relaxed/simple;
	bh=az4oAtn1FNTZLgbHyc3Yz2MaU26M/thSe9ZglD1cZQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dU8vtilEDSNSYMjz5jCm1LaxrNrFCPbr7J/q5bk+5sntcikltn/tAsNZm38tVdKQcx2yqMJaRxS6MZ3HJjFEo0JFLLnbo7Lw0gieOnnPX8LDcS4bbkiMV9ez2IZuqBz4l64WPD7zwjndgQAiiLf9Hf9CY7vLRUoKd8nfvJGK4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNKnlGeH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNKnlGeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714492650; x=1746028650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=az4oAtn1FNTZLgbHyc3Yz2MaU26M/thSe9ZglD1cZQw=;
  b=CNKnlGeH0TVejRYDRN5S/Mh87/zKKQFu+d8UUu2rrTLcmQnTprY4z1Af
   j0cuODmLp783YxZGlxp10MCLkY/SXw8/FJ52RIYKPYCs++IS4Ioyx2KQF
   XGh+ghVuVU5zdzyDp+xkms+TWOp5/q8fZQQA0u/k0+WkF0RH0JTRr47PH
   XPb0QXp/A/FCBn+8/XReT03sqIEeCZY/nlAoH4xrwwV/TqHmlZEqOucX4
   WyDsrZVSrfqq3zL0T7VsMJ5Tukr8z/EdCUjuDJr+5QSt+Ot2FqZoh6WHs
   YTSJcCWjW/kt6yZ49kiPfFb7yGmcZJqXOyqtOe0UCFdmHb5RCC8W/YWVu
   A==;
X-CSE-ConnectionGUID: /NK3jO+DQ4aJjeuAAu55yg==
X-CSE-MsgGUID: 8SAFs7eJSCGi+32TB+zN+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20755014"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="20755014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:57:30 -0700
X-CSE-ConnectionGUID: G5u/WIXAQ3K3DyqWOFkCeg==
X-CSE-MsgGUID: ot7BbFHWTieE/dD/Y9H9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26912447"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2024 08:57:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1prC-0008I7-0o;
	Tue, 30 Apr 2024 15:57:26 +0000
Date: Tue, 30 Apr 2024 23:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/6] perf test pmu: Refactor format test and exposed
 test APIs
Message-ID: <202404302348.8fXJfenz-lkp@intel.com>
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
In-Reply-To: <20240429200225.1271876-4-irogers@google.com>
References: <20240429200225.1271876-4-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Thomas Richter <tmricht@linux.ibm.com>
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
patch link:    https://lore.kernel.org/r/20240429200225.1271876-4-irogers%40google.com
patch subject: [PATCH v3 3/6] perf test pmu: Refactor format test and exposed test APIs
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404302348.8fXJfenz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404302348.8fXJfenz-lkp@intel.com/

All errors (new ones prefixed by >>):

     PERF_VERSION = 6.9.rc5.g00252012d0a2
   tests/pmu.c: In function 'test_pmu_get':
>> tests/pmu.c:84:9: error: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Werror=unused-result]
      84 |         write(file, "9999\n", 5);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
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
