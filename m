Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479DBA41
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667827729; x=1699363729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pt6EXU1MZ/z7k9PKBGLDIhagrx+NvWBN4B55zcx65yw=;
  b=nFtaYQ7bzonxVbXSoJtF8jr1cZfqfQu/T56S9gySOonIuFzAe6Sw0Lpj
   6wDAB80WgUPVo0NsjD3/g4nvLZyv++n6mrAQaw0+NKAMLIXflmPuTQ6gM
   vvcorO0PDkwwK321RCKOdKJolfpffIDK1I5mfDcOCmcAqLv7YecttexCf
   Kez9+hbtz60sSvkE7xL7TkqX0E9u57Q4pFKqiKor5fIyCcDnaOh6nzEPi
   eSUmwc4rIpHaWN7oSwrKRzKoqhIckmpXKlffZnCvDpL7nhK68m2vpYFAk
   WWGDuMHltJftOZF5Lg0BS1OXyWytNwpPHclciAjvBuUmurXN6xGaPYZ+7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="308030448"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308030448"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635909064"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="635909064"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2022 05:28:47 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os2BC-0000ib-3B;
	Mon, 07 Nov 2022 13:28:46 +0000
Date: Mon, 7 Nov 2022 21:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/core.c:5714:2: warning: Comparing pointers that point
 to different objects [comparePointers]
Message-ID: <202211072157.Da3VQjhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/core.c:5714:2: warning: Comparing pointers that point to different objects [comparePointers]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 546a3fee174969ff323d70ff27b1ef181f0d7ceb sched: Reverse sched_class layout
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 546a3fee174969ff323d70ff27b1ef181f0d7ceb
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/sched/core.c:5714:2: warning: Comparing pointers that point to different objects [comparePointers]
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:5714:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:5714:2: note: Array decayed to pointer here.
    for_each_class(class) {
    ^
   kernel/sched/core.c:5714:2: note: Comparing pointers that point to different objects
    for_each_class(class) {
    ^
   kernel/sched/sched.h:2004:67: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static inline int task_current(struct rq *rq, struct task_struct *p)
                                                                     ^
   kernel/sched/core.c:5355:34: warning: Uninitialized variable: resched_latency [uninitvar]
    if (sched_feat(LATENCY_WARN) && resched_latency)
                                    ^
   kernel/sched/core.c:5348:6: note: Assuming condition is false
    if (sched_feat(LATENCY_WARN))
        ^
   kernel/sched/core.c:5355:34: note: Uninitialized variable: resched_latency
    if (sched_feat(LATENCY_WARN) && resched_latency)
                                    ^
   kernel/sched/core.c:2760:4: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
      p->migration_pending = &my_pending;
      ^
   kernel/sched/core.c:9130:3: warning: Comparing pointers that point to different objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9130:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9130:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9130:3: note: Comparing pointers that point to different objects
     for_each_class(class) {
     ^
   kernel/sched/core.c:9142:3: warning: Comparing pointers that point to different objects [comparePointers]
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2190:27: note: Variable declared here.
   extern struct sched_class __sched_class_highest[];
                             ^
   kernel/sched/core.c:9142:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/sched.h:2191:27: note: Variable declared here.
   extern struct sched_class __sched_class_lowest[];
                             ^
   kernel/sched/core.c:9142:3: note: Array decayed to pointer here.
     for_each_class(class) {
     ^
   kernel/sched/core.c:9142:3: note: Comparing pointers that point to different objects
     for_each_class(class) {
     ^

vim +5714 kernel/sched/core.c

457d1f465778cc kernel/sched/core.c Chen Yu         2020-04-21  5679  
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5680  /*
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5681   * Pick up the highest-prio task:
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5682   */
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5683  static inline struct task_struct *
539f65125d20aa kernel/sched/core.c Peter Zijlstra  2020-11-17  5684  __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5685  {
49ee576809d837 kernel/sched/core.c Peter Zijlstra  2017-01-19  5686  	const struct sched_class *class;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5687  	struct task_struct *p;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5688  
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5689  	/*
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5690  	 * Optimization: we know that if all tasks are in the fair class we can
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5691  	 * call that function directly, but only if the @prev task wasn't of a
b19a888c1e9bdf kernel/sched/core.c Tal Zussman     2020-11-12  5692  	 * higher scheduling class, because otherwise those lose the
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5693  	 * opportunity to pull in more work from other CPUs.
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5694  	 */
546a3fee174969 kernel/sched/core.c Peter Zijlstra  2022-05-17  5695  	if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5696  		   rq->nr_running == rq->cfs.h_nr_running)) {
0ba87bb27d66b7 kernel/sched/core.c Peter Zijlstra  2017-03-01  5697  
5d7d605642b28a kernel/sched/core.c Peter Zijlstra  2019-11-08  5698  		p = pick_next_task_fair(rq, prev, rf);
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5699  		if (unlikely(p == RETRY_TASK))
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5700  			goto restart;
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5701  
1699949d3314e5 kernel/sched/core.c Masahiro Yamada 2021-05-19  5702  		/* Assume the next prioritized class is idle_sched_class */
5d7d605642b28a kernel/sched/core.c Peter Zijlstra  2019-11-08  5703  		if (!p) {
f488e1057bb97b kernel/sched/core.c Peter Zijlstra  2019-11-08  5704  			put_prev_task(rq, prev);
98c2f700edb413 kernel/sched/core.c Peter Zijlstra  2019-11-08  5705  			p = pick_next_task_idle(rq);
f488e1057bb97b kernel/sched/core.c Peter Zijlstra  2019-11-08  5706  		}
6ccdc84b81a0a6 kernel/sched/core.c Peter Zijlstra  2014-04-24  5707  
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5708  		return p;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5709  	}
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5710  
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5711  restart:
457d1f465778cc kernel/sched/core.c Chen Yu         2020-04-21  5712  	put_prev_task_balance(rq, prev, rf);
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5713  
34f971f6f7988b kernel/sched.c      Peter Zijlstra  2010-09-22 @5714  	for_each_class(class) {
98c2f700edb413 kernel/sched/core.c Peter Zijlstra  2019-11-08  5715  		p = class->pick_next_task(rq);
67692435c411e5 kernel/sched/core.c Peter Zijlstra  2019-05-29  5716  		if (p)
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5717  			return p;
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5718  	}
34f971f6f7988b kernel/sched.c      Peter Zijlstra  2010-09-22  5719  
bc9ffef31bf598 kernel/sched/core.c Peter Zijlstra  2021-08-24  5720  	BUG(); /* The idle class should always have a runnable task. */
dd41f596cda0d7 kernel/sched.c      Ingo Molnar     2007-07-09  5721  }
^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5722  

:::::: The code at line 5714 was first introduced by commit
:::::: 34f971f6f7988be4d014eec3e3526bee6d007ffa sched: Create special class for stop/migrate work

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
