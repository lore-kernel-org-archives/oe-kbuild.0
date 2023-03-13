Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C7883D
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678735304; x=1710271304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gg4kQ0WLA+BMJGXiFnN+ES0ONH4TcGeH7IEMvg8z0RI=;
  b=KPxhS+E4IM9WVmqffZbinb81DiGNpcDynjcDzp64Ejgv8knGoxyALHx5
   DHoqv/SPo/U3pyQqQe0tLVPJhs0J+eZTuKxOb+c0EN6T/BMrtw/29GP+s
   nWO0qMYln7Hrwno7ki3LQuo/9ByPqCE5na0TB2otXUBeXOsxLbP6ejTRX
   tY4Q/yNwB5xSyb9uzFnulBKxd3yp1JuJuQlRZ/8FmMlmhGT89yCUwJfkL
   0hp8f2as/G6iCYgIMnC5WG5qV0ktHMpf/b2jOyBNWE/i0jT1E7srLl1F3
   2APZKEwpqGycFUxSInJw3zpU4A8eNYtD5gfFXr1GQAlmG3j3YtcRFNPto
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423511128"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="423511128"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 12:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747719204"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="747719204"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 12:21:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbnjn-00062o-1G;
	Mon, 13 Mar 2023 19:21:39 +0000
Date: Tue, 14 Mar 2023 03:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/fair.c:6848:31: warning: Uninitialized variable:
 util_min [uninitvar]
Message-ID: <202303140352.rCViA1PE-lkp@intel.com>
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
TO: Qais Yousef <qais.yousef@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: a2e7f03ed28fce26c78b985f87913b6ce3accf9d sched/uclamp: Make asym_fits_capacity() use util_fits_cpu()
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a2e7f03ed28fce26c78b985f87913b6ce3accf9d
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303140352.rCViA1PE-lkp@intel.com/

cppcheck warnings: (new ones prefixed by >>)
               ^
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
https://github.com/intel/lkp-tests
