Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9408211C9D
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690017922; x=1721553922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9d+nw3m0jFglJyt5EuJ/pFaTzCa06cHG9IxDZxWugo=;
  b=ZEhWGpXyiPotcz82bPI74pZ0J4TI13V7J4H7Fgr/zxzgP7OuMc6Sk+iD
   drXm2fI3OVuwLxhqIKWxINbKvDSdkAI5X+mUlDtbFIqd95o5Q0q18Mx6h
   XvrQNOQvHRFStbPzJqYbM3T4norlipTGmDtOHaIOR9fmAIo2h3iaNi0MR
   spDyuRVXMJ5y0gQcXsqR1EKwnMXQhYwQrw0pbrewaPd2cOiYAmxptgH5d
   aF0Oav+iAZ5VnD8hCiphNCdTFj77u0iXAtrapInfos9sUB9NGS5pDsFBI
   oubNBSyTw4zgFvGxdDo6iF41TcVmExBqGgG7wktssvl3wZK9FUj6qvvyJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346782514"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346782514"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="725154247"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="725154247"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Jul 2023 02:25:20 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN8rX-0008Co-2w;
	Sat, 22 Jul 2023 09:25:19 +0000
Date: Sat, 22 Jul 2023 17:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] perf: add new option '--workload-attr' to set
 workload sched_policy/priority/mask
Message-ID: <202307221757.XGfZBmn4-lkp@intel.com>
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
In-Reply-To: <20230717120003.2391329-3-changbin.du@huawei.com>
References: <20230717120003.2391329-3-changbin.du@huawei.com>
TO: Changbin Du <changbin.du@huawei.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>
CC: Ian Rogers <irogers@google.com>
CC: Adrian Hunter <adrian.hunter@intel.com>
CC: linux-perf-users@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Hui Wang <hw.huiwang@huawei.com>
CC: Changbin Du <changbin.du@huawei.com>

Hi Changbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acme/perf/core]
[also build test WARNING on tip/perf/core tip/master linus/master v6.5-rc2 next-20230721]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changbin-Du/perf-cpumap-Add-__perf_cpu_map__new-and-perf_cpu_map__2_cpuset/20230718-192933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230717120003.2391329-3-changbin.du%40huawei.com
patch subject: [PATCH v2 2/2] perf: add new option '--workload-attr' to set workload sched_policy/priority/mask
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221757.XGfZBmn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307221757.XGfZBmn4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/util/evlist.c: perf/cpumap.h is included more than once.

vim +60 tools/perf/util/evlist.c

    50	
    51	#include <linux/bitops.h>
    52	#include <linux/hash.h>
    53	#include <linux/log2.h>
    54	#include <linux/err.h>
    55	#include <linux/string.h>
    56	#include <linux/time64.h>
    57	#include <linux/zalloc.h>
    58	#include <perf/evlist.h>
    59	#include <perf/evsel.h>
  > 60	#include <perf/cpumap.h>
    61	#include <perf/mmap.h>
  > 62	#include <perf/cpumap.h>
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
