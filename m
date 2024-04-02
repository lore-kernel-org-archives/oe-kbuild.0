Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A212DD92
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070041; cv=none; b=j5gBOTGNJnLwhLz+a2gUOYGgSPT/W/AwSD1pb9l4B32uxV9io8dCBENCqx9z0ZNwWbHIGNfYtCb1whCINFRJWuJiobf5sr5uRlPr8yQVtkTrYogscbTT3s8WVqVz42UI0r0OJTDRhbBVKqRvhxqt9G+4pV9TT0iGm4jTCBF7IJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070041; c=relaxed/simple;
	bh=nbGgwfTfzdKjfLxHgHJox6Y+ka7rH6uTRrp4pu6Oocc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAjqiAisDMgrh2Wf1+1xeUTBgvbE2NzkFdVIsr3MUIGvOabh/Jsia+aSUlBbXoP62kFn/Z6CLZzRmY8l91v4KGJNu4piI+zi6RGI6BGb81ZirT6PbUdCeIKsj6G21D/D6apcHsAASfFbKPN5Qqi/en49NP6h0F9VtvmYtiTFV0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJhJ5SMz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJhJ5SMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070039; x=1743606039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbGgwfTfzdKjfLxHgHJox6Y+ka7rH6uTRrp4pu6Oocc=;
  b=TJhJ5SMz2NwGYZfGDqGhjiYGzublpFfZrdZRGbqmtvGtkjV8TDvWOIbL
   ScDiALhR58sSB2AfP6Yg5XT1QLTR9M8HWfVeRwy7A3vXh+Ty/F2ZHKoEJ
   4vfEg8G5zFKoK9it+d2ZpsHYlFoFcBiYa29WlSc53Xzur7nr7OwJw/E1M
   759fwTPDTvgPplKpAzJnzNG5mnh7yO7dYG0aaOznxloDTkzhHskoZZnmh
   XaZp4VDrJXnsi1ARenyseCm8G4A+rrOpKwz9SgbVAYtswaXLj/zqKDdld
   XBkok6TpUGPs0tOFyrtMxkEtRk/xEIqpi0we5mj/FfUVSJBjZTjAU8ois
   A==;
X-CSE-ConnectionGUID: z82pLuUITaa6nclxwk6lCQ==
X-CSE-MsgGUID: NKmPePkMSGSpdwFbqCmxag==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18603713"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="18603713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:38 -0700
X-CSE-ConnectionGUID: 4p0ZorMpTcihmJmcGbG78A==
X-CSE-MsgGUID: DSlPl08JQjO9z1ouPZlOQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="49326157"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2024 08:00:38 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrfcp-0001GF-2a;
	Tue, 02 Apr 2024 15:00:35 +0000
Date: Tue, 2 Apr 2024 22:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] perf evsel: Use evsel__name_is() helper
Message-ID: <202404022240.nFyJIMwC-lkp@intel.com>
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
In-Reply-To: <20240401062724.1006010-3-yangjihong@bytedance.com>
References: <20240401062724.1006010-3-yangjihong@bytedance.com>
TO: Yang Jihong <yangjihong@bytedance.com>
TO: peterz@infradead.org
TO: mingo@redhat.com
TO: acme@kernel.org
TO: namhyung@kernel.org
TO: mark.rutland@arm.com
TO: alexander.shishkin@linux.intel.com
TO: jolsa@kernel.org
TO: irogers@google.com
TO: adrian.hunter@intel.com
TO: kan.liang@linux.intel.com
TO: james.clark@arm.com
TO: linux-perf-users@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: yangjihong@bytedance.com

Hi Yang,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v6.9-rc2 next-20240402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Jihong/perf-sched-timehist-Fix-g-call-graph-option-failure/20240401-143023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240401062724.1006010-3-yangjihong%40bytedance.com
patch subject: [PATCH v2 2/2] perf evsel: Use evsel__name_is() helper
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022240.nFyJIMwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404022240.nFyJIMwC-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:1095: No libcapstone found, disables disasm engine support for 'perf script', please install libcapstone-dev/capstone-devel
   Makefile.config:1160: libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev
     PERF_VERSION = 6.8.g91c361385eb9
   builtin-trace.c: In function 'cmd_trace':
>> builtin-trace.c:4919:90: error: macro "assert" passed 2 arguments, but takes just 1
    4919 |         assert(evsel__name_is(trace.syscalls.events.bpf_output), "__augmented_syscalls__");
         |                                                                                          ^
   In file included from tools/include/linux/kernel.h:7,
                    from tools/include/linux/refcount.h:42,
                    from util/cgroup.h:6,
                    from builtin-trace.c:29:
   /usr/include/assert.h:50: note: macro "assert" defined here
      50 | # define assert(expr)           (__ASSERT_VOID_CAST (0))
         | 
>> builtin-trace.c:4919:9: error: 'assert' undeclared (first use in this function)
    4919 |         assert(evsel__name_is(trace.syscalls.events.bpf_output), "__augmented_syscalls__");
         |         ^~~~~~
   builtin-trace.c:915:1: note: 'assert' is defined in header '<assert.h>'; did you forget to '#include <assert.h>'?
     914 | #include "trace/beauty/waitid_options.c"
     +++ |+#include <assert.h>
     915 | 
   builtin-trace.c:4919:9: note: each undeclared identifier is reported only once for each function it appears in
    4919 |         assert(evsel__name_is(trace.syscalls.events.bpf_output), "__augmented_syscalls__");
         |         ^~~~~~
   make[6]: *** [tools/build/Makefile.build:105: tools/perf/builtin-trace.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
