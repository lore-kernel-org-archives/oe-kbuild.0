Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D93209
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678984370; x=1710520370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sXLKWdsqjurp4KM2WygSg+rwp5nXm7LsmzpTiU5Iwc=;
  b=LlEhdfJA+hmwr9wrJAFWB4Lohgn3m1E093Ox7p1yVK1sxKUv+prWic7F
   tYNAt9CDnba06k9Am6crGXy7T4kXN1ku/eg+0PDs58IEjxUo3uebNGMH9
   oCCT/6nEQ5FyKGFOW30NNRjL4zMxxf7GewwI+Bf2IDOqRSD3sOBNVXLdy
   KVIklaNVF3JZdphKUDJFoodBe4ZwniVxOXkOEW2Fuscpa4E55vl+yb5MU
   AWA1SOYbU4PR97lEOcRmjifx7/9CXrFzjit4vB5Z3Z/jnACZ7H+farfIV
   n6FP4TnZ/GWq5Bf9AmTMKamsJQrJY3DnNq/who6hSWuLPay/ahDBHvHww
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338060641"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="338060641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 09:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854117090"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="854117090"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Mar 2023 09:31:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcqVr-0008d2-19;
	Thu, 16 Mar 2023 16:31:35 +0000
Date: Fri, 17 Mar 2023 00:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:sched/eevdf 11/13] kernel/sched/fair.c:7664:17:
 warning: Value stored to 'cfs_rq' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303170057.0XX3AP2n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/fair.c:7664:17: warning: Value stored to 'cfs_rq' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   89ce053e40c45326076a4a36ac63b1d0ae104fa2
commit: 164d97b23b044aeb5103bc89030c2b4e4edf6a5e [11/13] sched: Commit to EEVDF
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170057.0XX3AP2n-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=164d97b23b044aeb5103bc89030c2b4e4edf6a5e
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout 164d97b23b044aeb5103bc89030c2b4e4edf6a5e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303170057.0XX3AP2n-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           do {                                                            \
           ^
   kernel/sched/fair.c:7334:25: note: Loop condition is false.  Exiting loop
           struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
                                  ^
   include/linux/cpumask.h:853:37: note: expanded from macro 'this_cpu_cpumask_var_ptr'
   #define this_cpu_cpumask_var_ptr(x)     this_cpu_read(x)
                                           ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:119:22: note: expanded from macro '__this_cpu_generic_read_nopreempt'
           ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
                               ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:7334:25: note: Dereference of null pointer
           struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
                                  ^
   include/linux/cpumask.h:853:37: note: expanded from macro 'this_cpu_cpumask_var_ptr'
   #define this_cpu_cpumask_var_ptr(x)     this_cpu_read(x)
                                           ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   note: (skipping 7 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ~~~~~~~~~~~~^~
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                                                                           ^
   kernel/sched/fair.c:7534:41: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/sched/fair.c:7534:14: note: Assuming the condition is true
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                       ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7534:13: note: Left side of '&&' is true
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                      ^
   kernel/sched/fair.c:7534:41: note: Dereference of null pointer
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                                                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/sched/fair.c:7536:12: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           int cpu = smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7534:14: note: Assuming the condition is false
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                       ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7534:36: note: Left side of '&&' is false
           int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
                                             ^
   kernel/sched/fair.c:7536:12: note: Dereference of null pointer
           int cpu = smp_processor_id();
                     ^
   include/linux/smp.h:264:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/smp.h:257:31: note: expanded from macro '__smp_processor_id'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:7664:17: warning: Value stored to 'cfs_rq' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cfs_rq *cfs_rq = task_cfs_rq(curr);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7664:17: note: Value stored to 'cfs_rq' during its initialization is never read
           struct cfs_rq *cfs_rq = task_cfs_rq(curr);
                          ^~~~~~   ~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9204:7: warning: Access to field 'flags' results in a dereference of a null pointer (loaded from field 'local') [clang-analyzer-core.NullDereference]
           if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
                ^
   kernel/sched/fair.c:10139:2: note: Calling 'init_sd_lb_stats'
           init_sd_lb_stats(&sds);
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8866:2: note: Null pointer value stored to 'sds.local'
           *sds = (struct sd_lb_stats){
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10139:2: note: Returning from 'init_sd_lb_stats'
           init_sd_lb_stats(&sds);
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10145:2: note: Calling 'update_sd_lb_stats'
           update_sd_lb_stats(env, &sds);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9886:7: note: Assuming 'local_group' is 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9886:3: note: Taking false branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9895:3: note: Calling 'update_sg_lb_stats'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9242:16: note: 'group' is not equal to field 'local'
           local_group = group == sds->local;
                         ^~~~~
   kernel/sched/fair.c:9244:2: note: Assuming 'i' is < 64
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:333:2: note: expanded from macro 'for_each_cpu_and'
           for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:531:67: note: expanded from macro 'for_each_and_bit'
                (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
                                                                            ^~~~~~~~~~~~~~
   kernel/sched/fair.c:9244:2: note: Loop condition is true.  Entering loop body
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:333:2: note: expanded from macro 'for_each_cpu_and'
           for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
           ^
   include/linux/find.h:530:2: note: expanded from macro 'for_each_and_bit'
           for ((bit) = 0;                                                                 \
           ^
   kernel/sched/fair.c:9245:19: note: Loop condition is false.  Exiting loop
                   struct rq *rq = cpu_rq(i);
                                   ^
   kernel/sched/sched.h:1209:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:9256:7: note: Assuming 'nr_running' is <= 1
                   if (nr_running > 1)
                       ^~~~~~~~~~~~~~
   kernel/sched/fair.c:9256:3: note: Taking false branch
                   if (nr_running > 1)
                   ^
   kernel/sched/fair.c:9259:3: note: Taking false branch
                   if (cpu_overutilized(i))
                   ^
   kernel/sched/fair.c:9269:7: note: Assuming 'nr_running' is 0
                   if (!nr_running && idle_cpu(i)) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9269:7: note: Left side of '&&' is true
   kernel/sched/fair.c:9269:22: note: Assuming the condition is true
                   if (!nr_running && idle_cpu(i)) {
                                      ^~~~~~~~~~~
   kernel/sched/fair.c:9269:3: note: Taking true branch
                   if (!nr_running && idle_cpu(i)) {
                   ^
   kernel/sched/fair.c:9272:4: note:  Execution continues on line 9244
                           continue;
                           ^
   kernel/sched/fair.c:9244:2: note: Assuming 'i' is >= 64
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:333:2: note: expanded from macro 'for_each_cpu_and'
           for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/find.h:531:67: note: expanded from macro 'for_each_and_bit'
                (bit) = find_next_and_bit((addr1), (addr2), (size), (bit)), (bit) < (size);\
                                                                            ^~~~~~~~~~~~~~
   kernel/sched/fair.c:9244:2: note: Loop condition is false. Execution continues on line 9292
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:333:2: note: expanded from macro 'for_each_cpu_and'

vim +/cfs_rq +7664 kernel/sched/fair.c

02479099c28689 kernel/sched_fair.c Peter Zijlstra      2008-11-04  7656  
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7657  /*
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7658   * Preempt the current task with a newly woken task if needed:
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7659   */
5a9b86f647a568 kernel/sched_fair.c Peter Zijlstra      2009-09-16  7660  static void check_preempt_wakeup(struct rq *rq, struct task_struct *p, int wake_flags)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7661  {
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7662  	struct task_struct *curr = rq->curr;
8651a86c342ab7 kernel/sched_fair.c Srivatsa Vaddagiri  2007-10-15  7663  	struct sched_entity *se = &curr->se, *pse = &p->se;
4793241be408b3 kernel/sched_fair.c Peter Zijlstra      2008-11-04 @7664  	struct cfs_rq *cfs_rq = task_cfs_rq(curr);
2f36825b176f67 kernel/sched_fair.c Venkatesh Pallipadi 2011-04-14  7665  	int next_buddy_marked = 0;
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7666  	int cse_is_idle, pse_is_idle;
4793241be408b3 kernel/sched_fair.c Peter Zijlstra      2008-11-04  7667  
4ae7d5cefd4aa3 kernel/sched_fair.c Ingo Molnar         2008-03-19  7668  	if (unlikely(se == pse))
4ae7d5cefd4aa3 kernel/sched_fair.c Ingo Molnar         2008-03-19  7669  		return;
4ae7d5cefd4aa3 kernel/sched_fair.c Ingo Molnar         2008-03-19  7670  
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7671  	/*
163122b7fcfa28 kernel/sched/fair.c Kirill Tkhai        2014-08-20  7672  	 * This is possible from callers such as attach_tasks(), in which we
3b03706fa621ce kernel/sched/fair.c Ingo Molnar         2021-03-18  7673  	 * unconditionally check_preempt_curr() after an enqueue (which may have
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7674  	 * lead to a throttle).  This both saves work and prevents false
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7675  	 * next-buddy nomination below.
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7676  	 */
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7677  	if (unlikely(throttled_hierarchy(cfs_rq_of(pse))))
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7678  		return;
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7679  
164d97b23b044a kernel/sched/fair.c Peter Zijlstra      2023-03-11  7680  	if (sched_feat(NEXT_BUDDY) && !(wake_flags & WF_FORK)) {
02479099c28689 kernel/sched_fair.c Peter Zijlstra      2008-11-04  7681  		set_next_buddy(pse);
2f36825b176f67 kernel/sched_fair.c Venkatesh Pallipadi 2011-04-14  7682  		next_buddy_marked = 1;
2f36825b176f67 kernel/sched_fair.c Venkatesh Pallipadi 2011-04-14  7683  	}
57fdc26d4a734a kernel/sched_fair.c Peter Zijlstra      2008-09-23  7684  
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7685  	/*
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7686  	 * We can come here with TIF_NEED_RESCHED already set from new task
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7687  	 * wake up path.
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7688  	 *
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7689  	 * Note: this also catches the edge-case of curr being in a throttled
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7690  	 * group (e.g. via set_curr_task), since update_curr() (in the
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7691  	 * enqueue of curr) will have resulted in resched being set.  This
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7692  	 * prevents us from potentially nominating it as a false LAST_BUDDY
5238cdd3873e67 kernel/sched_fair.c Paul Turner         2011-07-21  7693  	 * below.
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7694  	 */
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7695  	if (test_tsk_need_resched(curr))
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7696  		return;
aec0a5142cb52a kernel/sched_fair.c Bharata B Rao       2008-08-28  7697  
a2f5c9ab79f78e kernel/sched_fair.c Darren Hart         2011-02-22  7698  	/* Idle tasks are by definition preempted by non-idle tasks. */
1da1843f9f0334 kernel/sched/fair.c Viresh Kumar        2018-11-05  7699  	if (unlikely(task_has_idle_policy(curr)) &&
1da1843f9f0334 kernel/sched/fair.c Viresh Kumar        2018-11-05  7700  	    likely(!task_has_idle_policy(p)))
a2f5c9ab79f78e kernel/sched_fair.c Darren Hart         2011-02-22  7701  		goto preempt;
a2f5c9ab79f78e kernel/sched_fair.c Darren Hart         2011-02-22  7702  
91c234b4e3419c kernel/sched_fair.c Ingo Molnar         2007-10-15  7703  	/*
a2f5c9ab79f78e kernel/sched_fair.c Darren Hart         2011-02-22  7704  	 * Batch and idle tasks do not preempt non-idle tasks (their preemption
a2f5c9ab79f78e kernel/sched_fair.c Darren Hart         2011-02-22  7705  	 * is driven by the tick):
91c234b4e3419c kernel/sched_fair.c Ingo Molnar         2007-10-15  7706  	 */
8ed92e51f99c21 kernel/sched/fair.c Ingo Molnar         2012-10-14  7707  	if (unlikely(p->policy != SCHED_NORMAL) || !sched_feat(WAKEUP_PREEMPTION))
91c234b4e3419c kernel/sched_fair.c Ingo Molnar         2007-10-15  7708  		return;
8651a86c342ab7 kernel/sched_fair.c Srivatsa Vaddagiri  2007-10-15  7709  
464b75273f64be kernel/sched_fair.c Peter Zijlstra      2008-10-24  7710  	find_matching_se(&se, &pse);
09348d75a6ce60 kernel/sched/fair.c Ingo Molnar         2022-08-11  7711  	WARN_ON_ONCE(!pse);
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7712  
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7713  	cse_is_idle = se_is_idle(se);
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7714  	pse_is_idle = se_is_idle(pse);
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7715  
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7716  	/*
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7717  	 * Preempt an idle group in favor of a non-idle group (and don't preempt
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7718  	 * in the inverse case).
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7719  	 */
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7720  	if (cse_is_idle && !pse_is_idle)
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7721  		goto preempt;
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7722  	if (cse_is_idle != pse_is_idle)
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7723  		return;
304000390f88d0 kernel/sched/fair.c Josh Don            2021-07-29  7724  
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7725  	cfs_rq = cfs_rq_of(se);
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7726  	update_curr(cfs_rq);
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7727  
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7728  	/*
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7729  	 * XXX pick_eevdf(cfs_rq) != se ?
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7730  	 */
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7731  	if (pick_eevdf(cfs_rq) == pse)
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7732  		goto preempt;
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7733  
4dacb601bb1f46 kernel/sched/fair.c Peter Zijlstra      2010-04-20  7734  	return;
a65ac745e47e91 kernel/sched_fair.c Jupyung Lee         2009-11-17  7735  
3a7e73a2e26fff kernel/sched_fair.c Peter Zijlstra      2009-11-28  7736  preempt:
8875125efe8402 kernel/sched/fair.c Kirill Tkhai        2014-06-29  7737  	resched_curr(rq);
f685ceacab07d3 kernel/sched_fair.c Mike Galbraith      2009-10-23  7738  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar         2007-07-09  7739  

:::::: The code at line 7664 was first introduced by commit
:::::: 4793241be408b3926ee00c704d7da3b3faf3a05f sched: backward looking buddy

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
