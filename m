Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E8320CD9
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774096962; cv=none; b=EzSuJCGXcTaXp17czdQPgS+2zjSkLWFQ18DG+SG51ZihzDpS+KZYw4XXGqOtnaaWTmgc5BJ3IS6O4XrVW0+L9HhCaiNLPwSBzPB9s7ENWdVms7I8w7BnZtN+CpGgBAPBgcYMZqC6lp9NfvDIFvGQQdvXMoXei2W7ylSEZPctH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774096962; c=relaxed/simple;
	bh=SV6cYAbTVeyj1QhFDwIR9BqvFQ7wqOOroDVXNIONS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hGQM6w4rmEvI3PhAg9Zmonwhf5Dh4aVAew0FGog7VjsWPJkMMonB0YqVa0t0ZIm+ZOdAwKSTjelVRX2/1f1DoBwBsW6Wts4tKvKWir5NWeP7zh2c435t28uRdrn8w41Edqb38XAHCjweCCj4Rv+1ub06mAgBtk8zanRDS+51TqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfXdW5ty; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfXdW5ty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774096957; x=1805632957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV6cYAbTVeyj1QhFDwIR9BqvFQ7wqOOroDVXNIONS2g=;
  b=OfXdW5tyhq0L+ZUDeacaTkl/IhiGvACRquzkc/KVYj7gqXjxVSMuuSPN
   qqkQFvNH5K0PDS7a+RXSBGGBqM3C+zM8rFvsQBpiQnYRTtGXWFavIqNmg
   e8aBKDStCQ5Qlv3MpwhKJkNDG6FvNIzSV60X+TYfgKdptzvbS5FFSXZgQ
   s1+vQhqsD3u1T85s63Pu552L/wCYe+G9GzAN7lNn5OhQZbXVxxSJm7U3f
   nosnBZ+zrG1UDh89Xg98aXF0lefY8kfCBhPcANGHwnhOx/SvYUhgZjAge
   DYFHl4wtBRcnBBma1VsBvNyx2SD/tKLJoF5gI/iFrAU3ENE5l9lsxY3iz
   A==;
X-CSE-ConnectionGUID: Vvd7s2B9SSufXRkiDHuZFg==
X-CSE-MsgGUID: i3+P4kVBRGmayrgDJ8orvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="62726041"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="62726041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 05:42:35 -0700
X-CSE-ConnectionGUID: TzjYJj+rRi+tOz6/Gpz4Nw==
X-CSE-MsgGUID: b0jGH0E4RTiNEig+FrSRQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="227663716"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2026 05:42:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3vex-0000000067D-2Anz;
	Sat, 21 Mar 2026 12:42:31 +0000
Date: Sat, 21 Mar 2026 13:41:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] perf inject: Factor build ID inject out into a
 separate tool
Message-ID: <202603211341.4yqxPbic-lkp@intel.com>
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
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260320223520.520454-1-irogers@google.com>
References: <20260320223520.520454-1-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: James Clark <james.clark@linaro.org>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v7.0-rc4 next-20260320]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-inject-Factor-build-ID-inject-out-into-a-separate-tool/20260321-191906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260320223520.520454-1-irogers%40google.com
patch subject: [PATCH v1] perf inject: Factor build ID inject out into a separate tool
:::::: branch date: 81 minutes ago
:::::: commit date: 81 minutes ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260321/202603211341.4yqxPbic-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211341.4yqxPbic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603211341.4yqxPbic-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc1.g492296b4d64a
   builtin-inject.c: In function 'cmd_inject':
>> builtin-inject.c:2324:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
    2324 |         return ret;
         |                ^~~
   builtin-inject.c:2044:13: note: 'ret' was declared here
    2044 |         int ret;
         |             ^~~
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:93: builtin-inject.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile.perf:770: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
