Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA801E868
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jun 2024 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719256887; cv=none; b=BpR7y6p2UyzX/fDKRLAVpzAQQn+G6gnF/YmopQlJQ6c+eGeeNym8Et+TL7pv6kPDFyXNrdZqkOpvtFUuFlvD+uiIgSMXF98n5cH3PerikwGPpYy0S1BlwDXnVzJrzskcpiKGm5N36lITIx57bHb5HnWIrqsTv4WS+eacKddz5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719256887; c=relaxed/simple;
	bh=EILS9pJki5rQ9qOROTavFZwIImFdjGcMAgTHOoja7GM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ay/BJLMCszCN0jBEqFgDZNjv9aDl9lWV8fPv8TtOQdllYL3XVbc7hDX68QqFoKcG0D4JZmpwDQuGNwQVlhjqe7RxovOFp3viqb1YUWZ5JsDZSnbaIyMMnl/Mr/Qmi8G2aex8W3xULauMTIR3HdD6xa+o81IRh7geX6hYPTRLOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OA7tqFXq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OA7tqFXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719256885; x=1750792885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EILS9pJki5rQ9qOROTavFZwIImFdjGcMAgTHOoja7GM=;
  b=OA7tqFXq710DndbGTnyqua8sgeRSkqn9Mj84WyicfUrQD9HorT3GA8vV
   HXQ22WiY32cwW5KX6ACViButOnH/k9tXr7m3nu87pg3w9xd1e9BrnnAyU
   A79WZrz5LPvY9nfCBipFUuRvnt21AQhhRg8SupkaUrkt49MMsRxT/MEdJ
   UWchexgNYir1n8db+Wej/NqzLX+b9crx9b10mSJGZzLZSm5uvJlaNNtOw
   ZpckaXb8kPMsoUo4xX76GSnt0qRJAk+qiY9L0mXsPVgFT4En5Gsm+HAEa
   AI5L85/mew41/hBFY73Lx7NQ3qEWQDDaWMsqKrqQrmpC7uWY4Jg5IfKvY
   Q==;
X-CSE-ConnectionGUID: THrdL564SAykPvYWkHyFEw==
X-CSE-MsgGUID: f1NqiGcxQUm4SfuypRTwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19149196"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="19149196"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 12:21:25 -0700
X-CSE-ConnectionGUID: q+hU2ZZWS/malX+Sw22sUQ==
X-CSE-MsgGUID: LBg3Wij0Q8ewLz5V91ZlOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43833268"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2024 12:21:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLpFg-000DeZ-2m;
	Mon, 24 Jun 2024 19:21:20 +0000
Date: Tue, 25 Jun 2024 03:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/5] perf trace: Add test for enum augmentation
Message-ID: <202406250302.E4WaX9Ud-lkp@intel.com>
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
In-Reply-To: <20240619082042.4173621-6-howardchu95@gmail.com>
References: <20240619082042.4173621-6-howardchu95@gmail.com>
TO: Howard Chu <howardchu95@gmail.com>
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>
CC: Ian Rogers <irogers@google.com>
CC: Adrian Hunter <adrian.hunter@intel.com>
CC: Kan Liang <kan.liang@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: linux-perf-users@vger.kernel.org

Hi Howard,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on next-20240621]
[cannot apply to tip/perf/core perf-tools/perf-tools acme/perf/core linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Howard-Chu/perf-trace-Fix-iteration-of-syscall-ids-in-syscalltbl-entries/20240619-162417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240619082042.4173621-6-howardchu95%40gmail.com
patch subject: [PATCH v2 5/5] perf trace: Add test for enum augmentation
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250302.E4WaX9Ud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406250302.E4WaX9Ud-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc1.gf6ac54426465
>> tests/workloads/landlock_add_rule.c:20:24: error: use of undeclared identifier 'LANDLOCK_ACCESS_NET_CONNECT_TCP'
      20 |             .allowed_access = LANDLOCK_ACCESS_NET_CONNECT_TCP,
         |                               ^
>> tests/workloads/landlock_add_rule.c:18:32: error: variable has incomplete type 'struct landlock_net_port_attr'
      18 |         struct landlock_net_port_attr net_port_attr = {
         |                                       ^
   tests/workloads/landlock_add_rule.c:18:9: note: forward declaration of 'struct landlock_net_port_attr'
      18 |         struct landlock_net_port_attr net_port_attr = {
         |                ^
>> tests/workloads/landlock_add_rule.c:26:38: error: use of undeclared identifier 'LANDLOCK_RULE_NET_PORT'
      26 |         syscall(__NR_landlock_add_rule, fd, LANDLOCK_RULE_NET_PORT,
         |                                             ^
   3 errors generated.
   make[8]: *** [tools/build/Makefile.build:105: tools/perf/tests/workloads/landlock_add_rule.o] Error 1
   make[8]: *** Waiting for unfinished jobs....
   make[7]: *** [tools/build/Makefile.build:158: workloads] Error 2
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [Makefile.perf:727: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2


vim +/LANDLOCK_ACCESS_NET_CONNECT_TCP +20 tools/perf/tests/workloads/landlock_add_rule.c

f6ac54426465a5 Howard Chu 2024-06-19   7  
f6ac54426465a5 Howard Chu 2024-06-19   8  static int landlock_add_rule(int argc __maybe_unused, const char **argv __maybe_unused)
f6ac54426465a5 Howard Chu 2024-06-19   9  {
f6ac54426465a5 Howard Chu 2024-06-19  10  	int fd = 11;
f6ac54426465a5 Howard Chu 2024-06-19  11  	int flags = 45;
f6ac54426465a5 Howard Chu 2024-06-19  12  
f6ac54426465a5 Howard Chu 2024-06-19  13  	struct landlock_path_beneath_attr path_beneath_attr = {
f6ac54426465a5 Howard Chu 2024-06-19  14  	    .allowed_access = LANDLOCK_ACCESS_FS_READ_FILE,
f6ac54426465a5 Howard Chu 2024-06-19  15  	    .parent_fd = 14,
f6ac54426465a5 Howard Chu 2024-06-19  16  	};
f6ac54426465a5 Howard Chu 2024-06-19  17  
f6ac54426465a5 Howard Chu 2024-06-19  18  	struct landlock_net_port_attr net_port_attr = {
f6ac54426465a5 Howard Chu 2024-06-19  19  	    .port = 19,
f6ac54426465a5 Howard Chu 2024-06-19 @20  	    .allowed_access = LANDLOCK_ACCESS_NET_CONNECT_TCP,
f6ac54426465a5 Howard Chu 2024-06-19  21  	};
f6ac54426465a5 Howard Chu 2024-06-19  22  
f6ac54426465a5 Howard Chu 2024-06-19  23  	syscall(__NR_landlock_add_rule, fd, LANDLOCK_RULE_PATH_BENEATH,
f6ac54426465a5 Howard Chu 2024-06-19  24  		&path_beneath_attr, flags);
f6ac54426465a5 Howard Chu 2024-06-19  25  
f6ac54426465a5 Howard Chu 2024-06-19  26  	syscall(__NR_landlock_add_rule, fd, LANDLOCK_RULE_NET_PORT,
f6ac54426465a5 Howard Chu 2024-06-19  27  		&net_port_attr, flags);
f6ac54426465a5 Howard Chu 2024-06-19  28  
f6ac54426465a5 Howard Chu 2024-06-19  29  	return 0;
f6ac54426465a5 Howard Chu 2024-06-19  30  }
f6ac54426465a5 Howard Chu 2024-06-19  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
