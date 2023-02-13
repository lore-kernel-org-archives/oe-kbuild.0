Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518F33D1
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676291599; x=1707827599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QXlo+w4suXsTnGEEDlJ/a9iKxVZDik6KN0A/98kVmQ=;
  b=fo18p5r/BPiWhkqRUGmInNu0vHs44Fo01XKpoe5UwhsnjwDvOseq4C9T
   OYw0yDHvZ8Z42qTpaYOgiPNXeEnYX4BKeZZ/QDUb8nM8omlqTWEj1iAX+
   ZebUKHtNi9R+a+SHibUFQcPJeQ/OPbeZqi56LrrhtaNcYUOO7Brd4VMLq
   I/ML2KhHdEsWsxNZLgIwwHnJ52lPhIO3LXLjiCUQ4u6iljwTtU33N3Drg
   Vnj1U6B+u8pMP+JRDuz/mebJy4+qH6jrmXttiC2bAtRgfoEPr2e15jjn3
   37v9F+e16Qh34JvBjQCHoCbhtdyLhTh3/sc5rn0LyUCBM0zgV1wAn2M6b
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332187828"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="332187828"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792715626"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="792715626"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 04:33:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRY1E-0007jZ-23;
	Mon, 13 Feb 2023 12:33:16 +0000
Date: Mon, 13 Feb 2023 20:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 2/28] kernel/sched/fair.c:5486:24: warning:
 Uninitialized variables: cursor.load, cursor.nr_running,
 cursor.h_nr_running, cursor.idle_nr_running, cursor.idle_h_nr_running,
 cursor.exec_clock, cursor.min_vruntime, cursor.min_vruntime_copy,
 cursor.tasks_timeline, ...
Message-ID: <202302132053.s282uPME-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/fair.c:5486:24: warning: Uninitialized variables: cursor.load, cursor.nr_running, cursor.h_nr_running, cursor.idle_nr_running, cursor.idle_h_nr_running, cursor.exec_clock, cursor.min_vruntime, cursor.min_vruntime_copy, cursor.tasks_timeline, cursor.curr, cursor.next, cursor.last, cursor.skip, cursor.avg, cursor.last_update_time_copy, cursor.removed, cursor.tg_load_avg_contrib, cursor.propagate, cursor.prop_runnable_sum, cursor.h_load, cursor.last_h_load_update, cursor.h_load_next, cursor.rq, cursor.on_list, cursor.leaf_cfs_rq_list, cursor.tg, cursor.idle, cursor.runtime_enabled, cursor.runtime_remaining, cursor.throttled_pelt_idle, cursor.throttled_pelt_idle_copy, cursor.throttled_clock, cursor.throttled_clock_pelt, cursor.throttled_clock_pelt_time, cursor.throttled, cursor.throttle_count, cursor.throttled_list [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Don <joshdon@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   7c4a5b89a0b5a57a64b601775b296abf77a9fe97
commit: 8ad075c2eb1f6b4b33436144ea1ef2619f3b6398 [2/28] sched: Async unthrottling for cfs bandwidth
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8ad075c2eb1f6b4b33436144ea1ef2619f3b6398
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302132053.s282uPME-lkp@intel.com/

cppcheck warnings: (new ones prefixed by >>)
          ^
   kernel/sched/fair.c:11057:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:6356:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11057:16: note: Shadow variable
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:11453:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:6356:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11453:16: note: Shadow variable
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:11636:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + HZ;
                  ^
   kernel/sched/fair.c:6356:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11636:16: note: Shadow variable
    unsigned long next_balance = jiffies + HZ;
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

          ^
   kernel/sched/fair.c:5545:14: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip [uninitvar]
     rq = rq_of(cfs_rq);
                ^
   kernel/sched/fair.c:5545:14: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.rq, cfs_rq.on_list, cfs_rq.leaf_cfs_rq_list, cfs_rq.tg, cfs_rq.idle, cfs_rq.runtime_enabled, cfs_rq.runtime_remaining, cfs_rq.throttled_pelt_idle, cfs_rq.throttled_pelt_idle_copy, cfs_rq.throttled_clock, cfs_rq.throttled_clock_pelt, cfs_rq.throttled_clock_pelt_time, cfs_rq.throttled, cfs_rq.throttle_count, cfs_rq.throttled_list [uninitvar]
     rq = rq_of(cfs_rq);
                ^
   kernel/sched/fair.c:6927:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util, util_min, util_max, best_cap = 0;
                  ^
   kernel/sched/fair.c:4277:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6927:16: note: Shadow variable
    unsigned long task_util, util_min, util_max, best_cap = 0;
                  ^
   kernel/sched/fair.c:6973:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util, util_min, util_max;
                  ^
   kernel/sched/fair.c:4277:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6973:16: note: Shadow variable
    unsigned long task_util, util_min, util_max;
                  ^
   kernel/sched/fair.c:11058:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10912:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:11058:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:9604:58: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static int idle_cpu_without(int cpu, struct task_struct *p)
                                                            ^
>> kernel/sched/fair.c:5486:24: warning: Uninitialized variables: cursor.load, cursor.nr_running, cursor.h_nr_running, cursor.idle_nr_running, cursor.idle_h_nr_running, cursor.exec_clock, cursor.min_vruntime, cursor.min_vruntime_copy, cursor.tasks_timeline, cursor.curr, cursor.next, cursor.last, cursor.skip, cursor.avg, cursor.last_update_time_copy, cursor.removed, cursor.tg_load_avg_contrib, cursor.propagate, cursor.prop_runnable_sum, cursor.h_load, cursor.last_h_load_update, cursor.h_load_next, cursor.rq, cursor.on_list, cursor.leaf_cfs_rq_list, cursor.tg, cursor.idle, cursor.runtime_enabled, cursor.runtime_remaining, cursor.throttled_pelt_idle, cursor.throttled_pelt_idle_copy, cursor.throttled_clock, cursor.throttled_clock_pelt, cursor.throttled_clock_pelt_time, cursor.throttled, cursor.throttle_count, cursor.throttled_list [uninitvar]
     if (cfs_rq_throttled(cursor))
                          ^
   kernel/sched/fair.c:5545:14: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.avg, cfs_rq.last_update_time_copy, cfs_rq.removed, cfs_rq.tg_load_avg_contrib, cfs_rq.propagate, cfs_rq.prop_runnable_sum, cfs_rq.h_load, cfs_rq.last_h_load_update, cfs_rq.h_load_next, cfs_rq.rq, cfs_rq.on_list, cfs_rq.leaf_cfs_rq_list, cfs_rq.tg, cfs_rq.idle, cfs_rq.runtime_enabled, cfs_rq.runtime_remaining, cfs_rq.throttled_pelt_idle, cfs_rq.throttled_pelt_idle_copy, cfs_rq.throttled_clock, cfs_rq.throttled_clock_pelt, cfs_rq.throttled_clock_pelt_time, cfs_rq.throttled, cfs_rq.throttle_count, cfs_rq.throttled_list, cfs_rq.throttled_csd_list [uninitvar]
     rq = rq_of(cfs_rq);
                ^
   kernel/sched/fair.c:6993:20: warning: Uninitialized variable: task_util [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                      ^
   kernel/sched/fair.c:6980:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6993:20: note: Uninitialized variable: task_util
        asym_fits_cpu(task_util, util_min, util_max, target))
                      ^
   kernel/sched/fair.c:6993:31: warning: Uninitialized variable: util_min [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                                 ^
   kernel/sched/fair.c:6980:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6993:31: note: Uninitialized variable: util_min
        asym_fits_cpu(task_util, util_min, util_max, target))
                                 ^
   kernel/sched/fair.c:6993:41: warning: Uninitialized variable: util_max [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                                           ^
   kernel/sched/fair.c:6980:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6993:41: note: Uninitialized variable: util_max
        asym_fits_cpu(task_util, util_min, util_max, target))
                                           ^
   kernel/sched/fair.c:8761:48: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.avg, cfs_rq.last_update_time_copy, cfs_rq.removed, cfs_rq.tg_load_avg_contrib, cfs_rq.propagate, cfs_rq.prop_runnable_sum, cfs_rq.h_load, cfs_rq.last_h_load_update, cfs_rq.h_load_next, cfs_rq.rq, cfs_rq.on_list, cfs_rq.leaf_cfs_rq_list, cfs_rq.tg, cfs_rq.idle, cfs_rq.runtime_enabled, cfs_rq.runtime_remaining, cfs_rq.throttled_pelt_idle, cfs_rq.throttled_pelt_idle_copy, cfs_rq.throttled_clock, cfs_rq.throttled_clock_pelt, cfs_rq.throttled_clock_pelt_time, cfs_rq.throttled, cfs_rq.throttle_count, cfs_rq.throttled_list, cfs_rq.throttled_csd_list [uninitvar]
     if (update_cfs_rq_load_avg(cfs_rq_clock_pelt(cfs_rq), cfs_rq)) {
                                                  ^
   kernel/sched/fair.c:11455:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10912:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:11455:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:5486:24: warning: Uninitialized variables: cursor.load, cursor.nr_running, cursor.h_nr_running, cursor.idle_nr_running, cursor.idle_h_nr_running, cursor.exec_clock, cursor.min_vruntime, cursor.min_vruntime_copy, cursor.tasks_timeline, cursor.curr, cursor.next, cursor.last, cursor.skip, cursor.avg, cursor.last_update_time_copy, cursor.removed [uninitvar]
     if (cfs_rq_throttled(cursor))
                          ^
   kernel/sched/fair.c:5545:14: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.avg, cfs_rq.last_update_time_copy, cfs_rq.removed [uninitvar]
     rq = rq_of(cfs_rq);
                ^

vim +5486 kernel/sched/fair.c

671fd9dabe5239 kernel/sched_fair.c Paul Turner 2011-07-21  5463  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5464  #ifdef CONFIG_SMP
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5465  static void __cfsb_csd_unthrottle(void *arg)
671fd9dabe5239 kernel/sched_fair.c Paul Turner 2011-07-21  5466  {
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5467  	struct cfs_rq *cursor, *tmp;
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5468  	struct rq *rq = arg;
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5469  	struct rq_flags rf;
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5470  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5471  	rq_lock(rq, &rf);
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5472  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5473  	/*
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5474  	 * Since we hold rq lock we're safe from concurrent manipulation of
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5475  	 * the CSD list. However, this RCU critical section annotates the
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5476  	 * fact that we pair with sched_free_group_rcu(), so that we cannot
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5477  	 * race with group being freed in the window between removing it
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5478  	 * from the list and advancing to the next entry in the list.
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5479  	 */
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5480  	rcu_read_lock();
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5481  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5482  	list_for_each_entry_safe(cursor, tmp, &rq->cfsb_csd_list,
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5483  				 throttled_csd_list) {
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5484  		list_del_init(&cursor->throttled_csd_list);
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5485  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16 @5486  		if (cfs_rq_throttled(cursor))
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5487  			unthrottle_cfs_rq(cursor);
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5488  	}
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5489  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5490  	rcu_read_unlock();
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5491  
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5492  	rq_unlock(rq, &rf);
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5493  }
8ad075c2eb1f6b kernel/sched/fair.c Josh Don    2022-11-16  5494  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
