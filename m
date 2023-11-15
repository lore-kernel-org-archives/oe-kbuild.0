Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD7381DA
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZFl2PZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700074987; x=1731610987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSStnE5Y4yj4VZimh8Tj3Z1JnG+vpLuq1/QCM/mfBEY=;
  b=fZFl2PZc1CCz8+LvVWSR0Kx5Dj5CAcg5MyWptzhNPTsVHsiMWH2735Dt
   YqvvKICASOXKyi6cp/nRDJ45oc6/BmZ2sJF8Fj4MS7YFk8zQHU/3lvQje
   brSR0bkBebgHdBO/iR0gHEx98bbwZEaSlaTSUKEnFkgxph07wqHt2hL30
   b01K7dDW+kC8SNteJ7tBDiv4jdS3ii9ciD9MbNfJJLmKOJYcerrxJtbXM
   K3W8NFrVe/P1rEGzI7SXXxzjcmJu2rK2qsK6Sexw9XellIoTp0Qx79Kpn
   eLFAaOqQu+4J/8iWEN7nNOgGEsYLeAgMFwCtT4QCqOS02OWHHlMJu1j3+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="422032499"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="422032499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="12867959"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2023 11:03:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3LAF-0000jK-0Y;
	Wed, 15 Nov 2023 19:03:03 +0000
Date: Thu, 16 Nov 2023 03:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202311160315.Bd6rDA4p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: ye xingchen <ye.xingchen@zte.com.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 35260cf545226c3b21d52a9d21083f7ff999969c Kconfig.debug: fix SCHED_DEBUG dependency
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: sparc64-randconfig-r025-20230806 (https://download.01.org/0day-ci/archive/20231116/202311160315.Bd6rDA4p-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160315.Bd6rDA4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160315.Bd6rDA4p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:746:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:746:9: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:746:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:746:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/psi.c:143:1: sparse: sparse: symbol 'psi_cgroups_enabled' was not declared. Should it be static?
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *

vim +746 kernel/sched/debug.c

13e099d2f77e1d kernel/sched/debug.c Peter Zijlstra 2012-05-14  738  
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  739  #define PN(x) \
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  740  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rq->x))
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  741  
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  742  	P(nr_running);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  743  	P(nr_switches);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  744  	P(nr_uninterruptible);
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  745  	PN(next_balance);
fc840914e9b07a kernel/sched/debug.c Peter Zijlstra 2013-09-09 @746  	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  747  	PN(clock);
5a5375977b7215 kernel/sched/debug.c Peter Zijlstra 2015-01-05  748  	PN(clock_task);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  749  #undef P
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  750  #undef PN
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  751  

:::::: The code at line 746 was first introduced by commit
:::::: fc840914e9b07ab4685c195e1e54e58de4f84c03 sched/debug: Take PID namespace into account

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
