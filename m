Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AC3D9C
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Nov 2022 22:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668982278; x=1700518278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMH6XvIMMM4WdC0bD92cTg4o35f5htqX2rXVpLjbl9U=;
  b=PFE+6WDTt4+GFGTtF8UbKcaR6YNnf3GubyHKoO3WTjElUwpsKd04vXoL
   OYFmw2xViVfagkYRB1n23Rt6Ocd8lIePMLcjiYIdkzPWfdYvW7OeXNadE
   H4L9hIP6DctcwNWrtWrfB2FiNn3un60hXChMU82PHDE3cZXiYOpvo0Sfw
   ZS8qo2OUZu7r43vQ6vvKq9kMqWPIc7G80zShwNjTy29Y2MvWtfk8imbUa
   4Hn6ObQQGkj9uES8l8xfltMgjAHauNFSQG6seI33K0i94wBBQE1GxFdQd
   VMYh8Pv7mrToufbt3oOFp33JEIZCLVRNjzYTPK9/6fTpzAz3h8BvR8HGL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="313465357"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="313465357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 14:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="618622317"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="618622317"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Nov 2022 14:11:16 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owsWx-0003Ev-1o;
	Sun, 20 Nov 2022 22:11:15 +0000
Date: Mon, 21 Nov 2022 06:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 5/20] kernel/sched/fair.c:6848:31: warning:
 Uninitialized variable: util_min [uninitvar]
Message-ID: <202211210632.q3uF8AKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/fair.c:6848:31: warning: Uninitialized variable: util_min [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Qais Yousef <qais.yousef@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   d6962c4fe8f96f7d384d6489b6b5ab5bf3e35991
commit: a2e7f03ed28fce26c78b985f87913b6ce3accf9d [5/20] sched/uclamp: Make asym_fits_capacity() use util_fits_cpu()
:::::: branch date: 5 days ago
:::::: commit date: 4 weeks ago
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a2e7f03ed28fce26c78b985f87913b6ce3accf9d
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:10854:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:6211:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:10854:16: note: Shadow variable
    unsigned long next_balance = jiffies + 60*HZ;
                  ^
   kernel/sched/fair.c:11250:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:6211:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11250:16: note: Shadow variable
    unsigned long next_balance = now + 60*HZ;
                  ^
   kernel/sched/fair.c:11433:16: warning: Local variable 'next_balance' shadows outer variable [shadowVariable]
    unsigned long next_balance = jiffies + HZ;
                  ^
   kernel/sched/fair.c:6211:16: note: Shadowed declaration
    unsigned long next_balance;     /* in jiffy units */
                  ^
   kernel/sched/fair.c:11433:16: note: Shadow variable
    unsigned long next_balance = jiffies + HZ;
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mincore.c:198:17: warning: Local variable 'pages' shadows outer argument [shadowArgument]
     unsigned long pages = DIV_ROUND_UP(end - addr, PAGE_SIZE);
                   ^
   mm/mincore.c:187:58: note: Shadowed declaration
   static long do_mincore(unsigned long addr, unsigned long pages, unsigned char *vec)
                                                            ^
   mm/mincore.c:198:17: note: Shadow variable
     unsigned long pages = DIV_ROUND_UP(end - addr, PAGE_SIZE);
                   ^
--
>> mm/mlock.c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/mlock.c:229:9: note: Address of variable taken here.
    pvec = &per_cpu(mlock_pvec.vec, cpu);
           ^
   mm/mlock.c:229:17: note: Temporary created here.
    pvec = &per_cpu(mlock_pvec.vec, cpu);
                   ^
   mm/mlock.c:230:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   kernel/sched/fair.c:5454:25: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.rq, cfs_rq.on_list, cfs_rq.leaf_cfs_rq_list, cfs_rq.tg, cfs_rq.idle, cfs_rq.runtime_enabled, cfs_rq.runtime_remaining, cfs_rq.throttled_pelt_idle, cfs_rq.throttled_pelt_idle_copy, cfs_rq.throttled_clock, cfs_rq.throttled_clock_pelt, cfs_rq.throttled_clock_pelt_time, cfs_rq.throttled, cfs_rq.throttle_count, cfs_rq.throttled_list [uninitvar]
     struct rq *rq = rq_of(cfs_rq);
                           ^
   kernel/sched/fair.c:6782:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util, util_min, util_max, best_cap = 0;
                  ^
   kernel/sched/fair.c:4265:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6782:16: note: Shadow variable
    unsigned long task_util, util_min, util_max, best_cap = 0;
                  ^
   kernel/sched/fair.c:6828:16: warning: Local variable 'task_util' shadows outer function [shadowFunction]
    unsigned long task_util, util_min, util_max;
                  ^
   kernel/sched/fair.c:4265:29: note: Shadowed declaration
   static inline unsigned long task_util(struct task_struct *p)
                               ^
   kernel/sched/fair.c:6828:16: note: Shadow variable
    unsigned long task_util, util_min, util_max;
                  ^
   kernel/sched/fair.c:10855:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10709:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:10855:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:11252:6: warning: Local variable 'update_next_balance' shadows outer function [shadowFunction]
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:10709:1: note: Shadowed declaration
   update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
   ^
   kernel/sched/fair.c:11252:6: note: Shadow variable
    int update_next_balance = 0;
        ^
   kernel/sched/fair.c:9401:58: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static int idle_cpu_without(int cpu, struct task_struct *p)
                                                            ^
   kernel/sched/fair.c:5454:25: warning: Uninitialized variables: cfs_rq.load, cfs_rq.nr_running, cfs_rq.h_nr_running, cfs_rq.idle_nr_running, cfs_rq.idle_h_nr_running, cfs_rq.exec_clock, cfs_rq.min_vruntime, cfs_rq.min_vruntime_copy, cfs_rq.tasks_timeline, cfs_rq.curr, cfs_rq.next, cfs_rq.last, cfs_rq.skip, cfs_rq.avg, cfs_rq.last_update_time_copy, cfs_rq.removed [uninitvar]
     struct rq *rq = rq_of(cfs_rq);
                           ^
   kernel/sched/fair.c:6848:20: warning: Uninitialized variable: task_util [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                      ^
   kernel/sched/fair.c:6835:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6848:20: note: Uninitialized variable: task_util
        asym_fits_cpu(task_util, util_min, util_max, target))
                      ^
>> kernel/sched/fair.c:6848:31: warning: Uninitialized variable: util_min [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                                 ^
   kernel/sched/fair.c:6835:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6848:31: note: Uninitialized variable: util_min
        asym_fits_cpu(task_util, util_min, util_max, target))
                                 ^
>> kernel/sched/fair.c:6848:41: warning: Uninitialized variable: util_max [uninitvar]
        asym_fits_cpu(task_util, util_min, util_max, target))
                                           ^
   kernel/sched/fair.c:6835:30: note: Assuming condition is false
    if (sched_asym_cpucap_active()) {
                                ^
   kernel/sched/fair.c:6848:41: note: Uninitialized variable: util_max
        asym_fits_cpu(task_util, util_min, util_max, target))
                                           ^

vim +6848 kernel/sched/fair.c

b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6820  
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6821  /*
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6822   * Try and locate an idle core/thread in the LLC cache domain.
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6823   */
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen  2016-06-22  6824  static int select_idle_sibling(struct task_struct *p, int prev, int target)
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6825  {
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6826  	bool has_idle_core = false;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  6827  	struct sched_domain *sd;
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6828  	unsigned long task_util, util_min, util_max;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6829  	int i, recent_used_cpu;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6830  
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  6831  	/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6832  	 * On asymmetric system, update task utilization because we will check
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6833  	 * that the task fits with cpu's capacity.
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  6834  	 */
740cf8a760b73e kernel/sched/fair.c Dietmar Eggemann  2022-07-29  6835  	if (sched_asym_cpucap_active()) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6836  		sync_entity_load_avg(&p->se);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6837  		task_util = task_util_est(p);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6838  		util_min = uclamp_eff_value(p, UCLAMP_MIN);
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6839  		util_max = uclamp_eff_value(p, UCLAMP_MAX);
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  6840  	}
b7a331615d2541 kernel/sched/fair.c Morten Rasmussen  2020-02-06  6841  
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  6842  	/*
ec4fc801a02d96 kernel/sched/fair.c Dietmar Eggemann  2022-06-23  6843  	 * per-cpu select_rq_mask usage
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  6844  	 */
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  6845  	lockdep_assert_irqs_disabled();
9099a14708ce1d kernel/sched/fair.c Peter Zijlstra    2020-11-17  6846  
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6847  	if ((available_idle_cpu(target) || sched_idle_cpu(target)) &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04 @6848  	    asym_fits_cpu(task_util, util_min, util_max, target))
e0a79f529d5ba2 kernel/sched/fair.c Mike Galbraith    2013-01-28  6849  		return target;
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  6850  
99bd5e2f245d8c kernel/sched_fair.c Suresh Siddha     2010-03-31  6851  	/*
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar       2018-03-03  6852  	 * If the previous CPU is cache affine and idle, don't be stupid:
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6853  	 */
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar      2019-06-26  6854  	if (prev != target && cpus_share_cache(prev, target) &&
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6855  	    (available_idle_cpu(prev) || sched_idle_cpu(prev)) &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6856  	    asym_fits_cpu(task_util, util_min, util_max, prev))
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen  2016-06-22  6857  		return prev;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6858  
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6859  	/*
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6860  	 * Allow a per-cpu kthread to stack with the wakee if the
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6861  	 * kworker thread and the tasks previous CPUs are the same.
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6862  	 * The assumption is that the wakee queued work for the
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6863  	 * per-cpu kthread that is now complete and the wakeup is
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6864  	 * essentially a sync wakeup. An obvious example of this
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6865  	 * pattern is IO completions.
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6866  	 */
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6867  	if (is_per_cpu_kthread(current) &&
8b4e74ccb58279 kernel/sched/fair.c Vincent Donnefort 2021-12-01  6868  	    in_task() &&
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6869  	    prev == smp_processor_id() &&
014ba44e8184e1 kernel/sched/fair.c Vincent Donnefort 2021-11-29  6870  	    this_rq()->nr_running <= 1 &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6871  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6872  		return prev;
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6873  	}
52262ee567ad14 kernel/sched/fair.c Mel Gorman        2020-01-28  6874  
97fb7a0a8944bd kernel/sched/fair.c Ingo Molnar       2018-03-03  6875  	/* Check a recently used CPU as a potential idle candidate: */
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6876  	recent_used_cpu = p->recent_used_cpu;
89aafd67f28c9e kernel/sched/fair.c Mel Gorman        2021-08-04  6877  	p->recent_used_cpu = prev;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6878  	if (recent_used_cpu != prev &&
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6879  	    recent_used_cpu != target &&
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6880  	    cpus_share_cache(recent_used_cpu, target) &&
3c29e651e16dd3 kernel/sched/fair.c Viresh Kumar      2019-06-26  6881  	    (available_idle_cpu(recent_used_cpu) || sched_idle_cpu(recent_used_cpu)) &&
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6882  	    cpumask_test_cpu(p->recent_used_cpu, p->cpus_ptr) &&
a2e7f03ed28fce kernel/sched/fair.c Qais Yousef       2022-08-04  6883  	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6884  		return recent_used_cpu;
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6885  	}
32e839dda3ba57 kernel/sched/fair.c Mel Gorman        2018-01-30  6886  
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6887  	/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6888  	 * For asymmetric CPU capacity systems, our domain of interest is
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6889  	 * sd_asym_cpucapacity rather than sd_llc.
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6890  	 */
740cf8a760b73e kernel/sched/fair.c Dietmar Eggemann  2022-07-29  6891  	if (sched_asym_cpucap_active()) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6892  		sd = rcu_dereference(per_cpu(sd_asym_cpucapacity, target));
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6893  		/*
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6894  		 * On an asymmetric CPU capacity system where an exclusive
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6895  		 * cpuset defines a symmetric island (i.e. one unique
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6896  		 * capacity_orig value through the cpuset), the key will be set
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6897  		 * but the CPUs within that cpuset will not have a domain with
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6898  		 * SD_ASYM_CPUCAPACITY. These should follow the usual symmetric
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6899  		 * capacity path.
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6900  		 */
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6901  		if (sd) {
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6902  			i = select_idle_capacity(p, sd, target);
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6903  			return ((unsigned)i < nr_cpumask_bits) ? i : target;
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6904  		}
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6905  	}
b4c9c9f15649c9 kernel/sched/fair.c Vincent Guittot   2020-10-29  6906  
518cd62341786a kernel/sched/fair.c Peter Zijlstra    2011-12-07  6907  	sd = rcu_dereference(per_cpu(sd_llc, target));
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6908  	if (!sd)
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6909  		return target;
772bd008cd9a1d kernel/sched/fair.c Morten Rasmussen  2016-06-22  6910  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6911  	if (sched_smt_active()) {
398ba2b0cc0a43 kernel/sched/fair.c Abel Wu           2022-09-07  6912  		has_idle_core = test_idle_cores(target);
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6913  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6914  		if (!has_idle_core && cpus_share_cache(prev, target)) {
3e6efe87cd5cca kernel/sched/fair.c Abel Wu           2022-09-07  6915  			i = select_idle_smt(p, prev);
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6916  			if ((unsigned int)i < nr_cpumask_bits)
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6917  				return i;
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6918  		}
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6919  	}
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6920  
c722f35b513f80 kernel/sched/fair.c Rik van Riel      2021-03-26  6921  	i = select_idle_cpu(p, sd, has_idle_core, target);
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6922  	if ((unsigned)i < nr_cpumask_bits)
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6923  		return i;
10e2f1acd0106c kernel/sched/fair.c Peter Zijlstra    2016-05-09  6924  
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6925  	return target;
a50bde5130f657 kernel/sched_fair.c Peter Zijlstra    2009-11-12  6926  }
231678b768da07 kernel/sched/fair.c Dietmar Eggemann  2015-08-14  6927  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
