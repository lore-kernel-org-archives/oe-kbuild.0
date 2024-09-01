Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9C24A1B
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181904; cv=none; b=jinMT/FwvOGtZ2smiYA1clFpaHzaZHDiEt/D7fFSOO1wK+wvkwbAlcOa+vtacKjTeYOst5YfG39CDYLfYjXJvrXXlVmjFcc/I/n5TW0S2k/P2SNlmSGh+9br2hWgDitirQNjak4B+m3OwvTIVhIMlM0DMdExg+ZJ9AytcCen9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181904; c=relaxed/simple;
	bh=fe8Wj1BD/bi+YuoLS5n6Qg10LoNVb/HHhHlTM/unmas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHBSeBX8J0HtZSGpSr69NTOqPF3FSdQmtLvMnH98yOB1WWuI3fBHs2BYfxLPTcIaQABmm3RxI1BDMGTQDuDXGsXMKdubTl4eUICRstxB0+sFIWmXC54kC9c1M1V+u8weMFwDWZTPOskYLPjpvUxCVeDtguYGov02UYprgbvIoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KesbKEw7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KesbKEw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725181903; x=1756717903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fe8Wj1BD/bi+YuoLS5n6Qg10LoNVb/HHhHlTM/unmas=;
  b=KesbKEw7lJl9l5exa2olXtr6PV5jh6X5vpzpgtNGL8Klr//5IIXSuorD
   E/V8jqWjuf4LB580UYqp7+fe2YL7NyL+jNry/D17hzvzrbW4kJfzF7EWf
   Zmq3CC1VxHWVsMDN1EMUAM1vyUVJT5pbnazcDTgLYHNUxBC4agAEn4zKZ
   JibHZXMbvzrGTmz78bH9OqS3HuyELGZnJ5jY49x30LjE7ZYLi8wsX80yN
   Z7gQHJovpfTlsmXXq9igNaFTq779lWLJQqFlKrHemeamrhNmTmXP+RDxe
   vi8j0e36BsDfa9sVRNdxaF3kaIBW+/ceU1rqhmJLHbMpTogPBzrrlzfc9
   g==;
X-CSE-ConnectionGUID: +oHvMR+TS12L9kf3npNOCQ==
X-CSE-MsgGUID: 0BpAKxDGSDSO643MF7YHbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23641334"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23641334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 02:11:41 -0700
X-CSE-ConnectionGUID: tocUii0mQr6O582RZkuimQ==
X-CSE-MsgGUID: S6qcokisRweyEUjCp2EmJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="64355014"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2024 02:11:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skgcT-0003Z0-1p;
	Sun, 01 Sep 2024 09:11:37 +0000
Date: Sun, 1 Sep 2024 17:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/6] perf parse-events: Add default_breakpoint_len
 helper
Message-ID: <202409011605.G583kE4G-lkp@intel.com>
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
In-Reply-To: <20240831070415.506194-5-irogers@google.com>
References: <20240831070415.506194-5-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
TO: Namhyung Kim <namhyung@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Jiri Olsa <jolsa@kernel.org>
TO: Ian Rogers <irogers@google.com>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Kan Liang <kan.liang@linux.intel.com>
TO: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
TO: Dominique Martinet <asmadeus@codewreck.org>
TO: Yang Jihong <yangjihong@bytedance.com>
TO: Colin Ian King <colin.i.king@gmail.com>
TO: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
TO: James Clark <james.clark@linaro.org>
TO: John Garry <john.g.garry@oracle.com>
TO: Junhao He <hejunhao3@huawei.com>
TO: David Ahern <dsa@cumulusnetworks.com>
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc5 next-20240830]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-pmus-Fix-name-comparisons-on-32-bit-systems/20240831-150738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240831070415.506194-5-irogers%40google.com
patch subject: [PATCH v1 4/6] perf parse-events: Add default_breakpoint_len helper
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409011605.G583kE4G-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/tests/parse-events.c: parse-events.h is included more than once.

vim +2 tools/perf/tests/parse-events.c

   > 2	#include "parse-events.h"
     3	#include "evsel.h"
     4	#include "evlist.h"
     5	#include <api/fs/fs.h>
     6	#include "tests.h"
     7	#include "debug.h"
   > 8	#include "parse-events.h"
     9	#include "pmu.h"
    10	#include "pmus.h"
    11	#include <dirent.h>
    12	#include <errno.h>
    13	#include "fncache.h"
    14	#include <sys/types.h>
    15	#include <sys/stat.h>
    16	#include <unistd.h>
    17	#include <linux/kernel.h>
    18	#include <linux/hw_breakpoint.h>
    19	#include <api/fs/tracing_path.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
