Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B2AC950
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Apr 2023 22:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680732149; x=1712268149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJWenFH3NkEz+gczUV9UbjHbK5/PJeZtqTNv9enoOwM=;
  b=OpNMFvLTMcw9k3IxztoQ0VHZLJcSeCPKIbfAM1OJbPqtBO8UqUlO8Jem
   R4nDImyt4Pi4JWjHA+3nSHJJ+cpdFWG1MoL5cB2Befod1ELXo2fEGMmKo
   TQtsn7TZhsCvMAtDjW3Bv9rXuliJhWfdxOg9fVrsL4qC1tydHFcqAdPvE
   yyqLESHm8RfDrjsQ+NJDWZL73HHw2Jvumxk8kb2qRp/0dkzJ21mDz0p+O
   HihK6tQIpfbZ4/vfz4kNQxO9nAW9SpR9Oliof6H8I9EkNSMSh7giQTof2
   8iKw8J9uz8X/Od2VUtBJkPirkx8ZkObGOXmQHXoQL0jL684dNImRuRkJf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="340073773"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="340073773"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 15:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="932989583"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="932989583"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 15:02:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkBD0-000QqE-3B;
	Wed, 05 Apr 2023 22:02:26 +0000
Date: Thu, 6 Apr 2023 06:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/sched/fair.c:7531:10: warning: Assigned value is garbage or
 undefined [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202304060500.0qeAPcHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/sched/fair.c:7531:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vincent Guittot <vincent.guittot@linaro.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   76f598ba7d8e2bfb4855b5298caedd5af0c374a8
commit: e5ed0550c04c5469ecdc1634d8aa18c8609590f0 sched/fair: unlink misfit task from cpu overutilized
date:   8 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20230402 (https://download.01.org/0day-ci/archive/20230406/202304060500.0qeAPcHh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e5ed0550c04c5469ecdc1634d8aa18c8609590f0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5ed0550c04c5469ecdc1634d8aa18c8609590f0
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304060500.0qeAPcHh-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/sched/fair.c:332:2: note: Taking true branch
           if (unlikely(fact_hi)) {
           ^
   kernel/sched/fair.c:341:6: note: Assuming 'fact_hi' is not equal to 0
           if (fact_hi) {
               ^~~~~~~
   kernel/sched/fair.c:341:2: note: Taking true branch
           if (fact_hi) {
           ^
   kernel/sched/fair.c:342:8: note: Calling 'fls'
                   fs = fls(fact_hi);
                        ^~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is not equal to 0
           if (!x)
                ^
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is true
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking true branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is true
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking true branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is true
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking true branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is true
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking true branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is true
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking true branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:37:3: note: The value 1 is assigned to 'r'
                   r -= 1;
                   ^~~~~~
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 1 (loaded from 'r')
           return r;
           ^~~~~~~~
   kernel/sched/fair.c:342:8: note: Returning from 'fls'
                   fs = fls(fact_hi);
                        ^~~~~~~~~~~~
   kernel/sched/fair.c:342:3: note: The value 1 is assigned to 'fs'
                   fs = fls(fact_hi);
                   ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:343:3: note: The value -1 is assigned to 'shift'
                   shift -= fs;
                   ^~~~~~~~~~~
   kernel/sched/fair.c:347:43: note: Passing the value 4294967295 via 3rd parameter 'shift'
           return mul_u64_u32_shr(delta_exec, fact, shift);
                                                    ^~~~~
   kernel/sched/fair.c:347:9: note: Calling 'mul_u64_u32_shr'
           return mul_u64_u32_shr(delta_exec, fact, shift);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:166:44: note: The result of the right shift is undefined due to shifting by '4294967295', which is greater or equal to the width of type 'unsigned __int128'
           return (u64)(((unsigned __int128)a * mul) >> shift);
                                                     ^  ~~~~~
   kernel/sched/fair.c:743:15: warning: Value stored to 'nr_running' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int nr_running = cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:743:15: note: Value stored to 'nr_running' during its initialization is never read
           unsigned int nr_running = cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6569:6: warning: Value stored to 'target' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int target = nr_cpumask_bits;
               ^~~~~~
   kernel/sched/fair.c:6569:6: note: Value stored to 'target' during its initialization is never read
           int target = nr_cpumask_bits;
               ^~~~~~
   kernel/sched/fair.c:6847:13: warning: Value stored to 'this_rq' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct rq *this_rq = this_rq();
                      ^~~~~~~
   kernel/sched/fair.c:6847:13: note: Value stored to 'this_rq' during its initialization is never read
           struct rq *this_rq = this_rq();
                      ^~~~~~~
   kernel/sched/fair.c:6848:6: warning: Value stored to 'this' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int this = smp_processor_id();
               ^~~~
   kernel/sched/fair.c:6848:6: note: Value stored to 'this' during its initialization is never read
           int this = smp_processor_id();
               ^~~~
>> kernel/sched/fair.c:7531:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   target = best_energy_cpu;
                          ^ ~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7354:25: note: Loop condition is false.  Exiting loop
           struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
                                  ^
   include/linux/cpumask.h:863:37: note: expanded from macro 'this_cpu_cpumask_var_ptr'
   #define this_cpu_cpumask_var_ptr(x) this_cpu_ptr(x)
                                       ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:7356:29: note: '?' condition is false
           unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
                                      ^
   kernel/sched/fair.c:7357:29: note: '?' condition is false
           unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
                                      ^
   kernel/sched/fair.c:7358:27: note: Loop condition is false.  Exiting loop
           struct root_domain *rd = this_rq()->rd;
                                    ^
   kernel/sched/sched.h:1206:20: note: expanded from macro 'this_rq'
   #define this_rq()               this_cpu_ptr(&runqueues)
                                   ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:7359:11: note: 'best_energy_cpu' declared without an initial value
           int cpu, best_energy_cpu, target = -1;
                    ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:7368:7: note: Left side of '||' is false
           pd = rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:673:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:601:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:453:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:339:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   kernel/sched/fair.c:7368:7: note: Left side of '||' is false
           pd = rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:673:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:601:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:453:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:339:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   kernel/sched/fair.c:7368:7: note: Left side of '||' is false
           pd = rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:673:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:601:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:453:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \

vim +7531 kernel/sched/fair.c

390031e4c309c9 Quentin Perret            2018-12-03  7312  
732cd75b8c920d Quentin Perret            2018-12-03  7313  /*
732cd75b8c920d Quentin Perret            2018-12-03  7314   * find_energy_efficient_cpu(): Find most energy-efficient target CPU for the
732cd75b8c920d Quentin Perret            2018-12-03  7315   * waking task. find_energy_efficient_cpu() looks for the CPU with maximum
732cd75b8c920d Quentin Perret            2018-12-03  7316   * spare capacity in each performance domain and uses it as a potential
732cd75b8c920d Quentin Perret            2018-12-03  7317   * candidate to execute the task. Then, it uses the Energy Model to figure
732cd75b8c920d Quentin Perret            2018-12-03  7318   * out which of the CPU candidates is the most energy-efficient.
732cd75b8c920d Quentin Perret            2018-12-03  7319   *
732cd75b8c920d Quentin Perret            2018-12-03  7320   * The rationale for this heuristic is as follows. In a performance domain,
732cd75b8c920d Quentin Perret            2018-12-03  7321   * all the most energy efficient CPU candidates (according to the Energy
732cd75b8c920d Quentin Perret            2018-12-03  7322   * Model) are those for which we'll request a low frequency. When there are
732cd75b8c920d Quentin Perret            2018-12-03  7323   * several CPUs for which the frequency request will be the same, we don't
732cd75b8c920d Quentin Perret            2018-12-03  7324   * have enough data to break the tie between them, because the Energy Model
732cd75b8c920d Quentin Perret            2018-12-03  7325   * only includes active power costs. With this model, if we assume that
732cd75b8c920d Quentin Perret            2018-12-03  7326   * frequency requests follow utilization (e.g. using schedutil), the CPU with
732cd75b8c920d Quentin Perret            2018-12-03  7327   * the maximum spare capacity in a performance domain is guaranteed to be among
732cd75b8c920d Quentin Perret            2018-12-03  7328   * the best candidates of the performance domain.
732cd75b8c920d Quentin Perret            2018-12-03  7329   *
732cd75b8c920d Quentin Perret            2018-12-03  7330   * In practice, it could be preferable from an energy standpoint to pack
732cd75b8c920d Quentin Perret            2018-12-03  7331   * small tasks on a CPU in order to let other CPUs go in deeper idle states,
732cd75b8c920d Quentin Perret            2018-12-03  7332   * but that could also hurt our chances to go cluster idle, and we have no
732cd75b8c920d Quentin Perret            2018-12-03  7333   * ways to tell with the current Energy Model if this is actually a good
732cd75b8c920d Quentin Perret            2018-12-03  7334   * idea or not. So, find_energy_efficient_cpu() basically favors
732cd75b8c920d Quentin Perret            2018-12-03  7335   * cluster-packing, and spreading inside a cluster. That should at least be
732cd75b8c920d Quentin Perret            2018-12-03  7336   * a good thing for latency, and this is consistent with the idea that most
732cd75b8c920d Quentin Perret            2018-12-03  7337   * of the energy savings of EAS come from the asymmetry of the system, and
732cd75b8c920d Quentin Perret            2018-12-03  7338   * not so much from breaking the tie between identical CPUs. That's also the
732cd75b8c920d Quentin Perret            2018-12-03  7339   * reason why EAS is enabled in the topology code only for systems where
732cd75b8c920d Quentin Perret            2018-12-03  7340   * SD_ASYM_CPUCAPACITY is set.
732cd75b8c920d Quentin Perret            2018-12-03  7341   *
732cd75b8c920d Quentin Perret            2018-12-03  7342   * NOTE: Forkees are not accepted in the energy-aware wake-up path because
732cd75b8c920d Quentin Perret            2018-12-03  7343   * they don't have any useful utilization data yet and it's not possible to
732cd75b8c920d Quentin Perret            2018-12-03  7344   * forecast their impact on energy consumption. Consequently, they will be
732cd75b8c920d Quentin Perret            2018-12-03  7345   * placed by find_idlest_cpu() on the least loaded CPU, which might turn out
732cd75b8c920d Quentin Perret            2018-12-03  7346   * to be energy-inefficient in some use-cases. The alternative would be to
732cd75b8c920d Quentin Perret            2018-12-03  7347   * bias new tasks towards specific types of CPUs first, or to try to infer
732cd75b8c920d Quentin Perret            2018-12-03  7348   * their util_avg from the parent task, but those heuristics could hurt
732cd75b8c920d Quentin Perret            2018-12-03  7349   * other use-cases too. So, until someone finds a better way to solve this,
732cd75b8c920d Quentin Perret            2018-12-03  7350   * let's keep things simple by re-using the existing slow path.
732cd75b8c920d Quentin Perret            2018-12-03  7351   */
732cd75b8c920d Quentin Perret            2018-12-03  7352  static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
732cd75b8c920d Quentin Perret            2018-12-03  7353  {
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7354  	struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
eb92692b2544d3 Quentin Perret            2019-09-12  7355  	unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
244226035a1f9b Qais Yousef               2022-08-04  7356  	unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
244226035a1f9b Qais Yousef               2022-08-04  7357  	unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7358  	struct root_domain *rd = this_rq()->rd;
b812fc9768e004 Vincent Donnefort         2022-06-21  7359  	int cpu, best_energy_cpu, target = -1;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7360  	int prev_fits = -1, best_fits = -1;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7361  	unsigned long best_thermal_cap = 0;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7362  	unsigned long prev_thermal_cap = 0;
732cd75b8c920d Quentin Perret            2018-12-03  7363  	struct sched_domain *sd;
eb92692b2544d3 Quentin Perret            2019-09-12  7364  	struct perf_domain *pd;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7365  	struct energy_env eenv;
732cd75b8c920d Quentin Perret            2018-12-03  7366  
732cd75b8c920d Quentin Perret            2018-12-03  7367  	rcu_read_lock();
732cd75b8c920d Quentin Perret            2018-12-03  7368  	pd = rcu_dereference(rd->pd);
732cd75b8c920d Quentin Perret            2018-12-03  7369  	if (!pd || READ_ONCE(rd->overutilized))
619e090c8e409e Pierre Gondois            2021-05-04  7370  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  7371  
732cd75b8c920d Quentin Perret            2018-12-03  7372  	/*
732cd75b8c920d Quentin Perret            2018-12-03  7373  	 * Energy-aware wake-up happens on the lowest sched_domain starting
732cd75b8c920d Quentin Perret            2018-12-03  7374  	 * from sd_asym_cpucapacity spanning over this_cpu and prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  7375  	 */
732cd75b8c920d Quentin Perret            2018-12-03  7376  	sd = rcu_dereference(*this_cpu_ptr(&sd_asym_cpucapacity));
732cd75b8c920d Quentin Perret            2018-12-03  7377  	while (sd && !cpumask_test_cpu(prev_cpu, sched_domain_span(sd)))
732cd75b8c920d Quentin Perret            2018-12-03  7378  		sd = sd->parent;
732cd75b8c920d Quentin Perret            2018-12-03  7379  	if (!sd)
619e090c8e409e Pierre Gondois            2021-05-04  7380  		goto unlock;
619e090c8e409e Pierre Gondois            2021-05-04  7381  
619e090c8e409e Pierre Gondois            2021-05-04  7382  	target = prev_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  7383  
732cd75b8c920d Quentin Perret            2018-12-03  7384  	sync_entity_load_avg(&p->se);
d81304bc619355 Qais Yousef               2022-08-04  7385  	if (!uclamp_task_util(p, p_util_min, p_util_max))
732cd75b8c920d Quentin Perret            2018-12-03  7386  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  7387  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7388  	eenv_task_busy_time(&eenv, p, prev_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7389  
732cd75b8c920d Quentin Perret            2018-12-03  7390  	for (; pd; pd = pd->next) {
e26fd28db82899 Qais Yousef               2023-01-12  7391  		unsigned long util_min = p_util_min, util_max = p_util_max;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7392  		unsigned long cpu_cap, cpu_thermal_cap, util;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7393  		unsigned long cur_delta, max_spare_cap = 0;
244226035a1f9b Qais Yousef               2022-08-04  7394  		unsigned long rq_util_min, rq_util_max;
ad841e569f5c88 Pierre Gondois            2022-10-06  7395  		unsigned long prev_spare_cap = 0;
732cd75b8c920d Quentin Perret            2018-12-03  7396  		int max_spare_cap_cpu = -1;
b812fc9768e004 Vincent Donnefort         2022-06-21  7397  		unsigned long base_energy;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7398  		int fits, max_fits = -1;
732cd75b8c920d Quentin Perret            2018-12-03  7399  
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7400  		cpumask_and(cpus, perf_domain_span(pd), cpu_online_mask);
9b340131a4bcf6 Dietmar Eggemann          2022-06-21  7401  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7402  		if (cpumask_empty(cpus))
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7403  			continue;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7404  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7405  		/* Account thermal pressure for the energy estimation */
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7406  		cpu = cpumask_first(cpus);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7407  		cpu_thermal_cap = arch_scale_cpu_capacity(cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7408  		cpu_thermal_cap -= arch_scale_thermal_pressure(cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7409  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7410  		eenv.cpu_cap = cpu_thermal_cap;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7411  		eenv.pd_cap = 0;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7412  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7413  		for_each_cpu(cpu, cpus) {
e26fd28db82899 Qais Yousef               2023-01-12  7414  			struct rq *rq = cpu_rq(cpu);
e26fd28db82899 Qais Yousef               2023-01-12  7415  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7416  			eenv.pd_cap += cpu_thermal_cap;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7417  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7418  			if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7419  				continue;
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7420  
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  7421  			if (!cpumask_test_cpu(cpu, p->cpus_ptr))
732cd75b8c920d Quentin Perret            2018-12-03  7422  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  7423  
732cd75b8c920d Quentin Perret            2018-12-03  7424  			util = cpu_util_next(cpu, p, cpu);
732cd75b8c920d Quentin Perret            2018-12-03  7425  			cpu_cap = capacity_of(cpu);
1d42509e475cdc Valentin Schneider        2019-12-11  7426  
1d42509e475cdc Valentin Schneider        2019-12-11  7427  			/*
1d42509e475cdc Valentin Schneider        2019-12-11  7428  			 * Skip CPUs that cannot satisfy the capacity request.
1d42509e475cdc Valentin Schneider        2019-12-11  7429  			 * IOW, placing the task there would make the CPU
1d42509e475cdc Valentin Schneider        2019-12-11  7430  			 * overutilized. Take uclamp into account to see how
1d42509e475cdc Valentin Schneider        2019-12-11  7431  			 * much capacity we can get out of the CPU; this is
a5418be9dffe70 Viresh Kumar              2020-12-08  7432  			 * aligned with sched_cpu_util().
1d42509e475cdc Valentin Schneider        2019-12-11  7433  			 */
e26fd28db82899 Qais Yousef               2023-01-12  7434  			if (uclamp_is_used() && !uclamp_rq_is_idle(rq)) {
244226035a1f9b Qais Yousef               2022-08-04  7435  				/*
244226035a1f9b Qais Yousef               2022-08-04  7436  				 * Open code uclamp_rq_util_with() except for
244226035a1f9b Qais Yousef               2022-08-04  7437  				 * the clamp() part. Ie: apply max aggregation
244226035a1f9b Qais Yousef               2022-08-04  7438  				 * only. util_fits_cpu() logic requires to
244226035a1f9b Qais Yousef               2022-08-04  7439  				 * operate on non clamped util but must use the
244226035a1f9b Qais Yousef               2022-08-04  7440  				 * max-aggregated uclamp_{min, max}.
244226035a1f9b Qais Yousef               2022-08-04  7441  				 */
e26fd28db82899 Qais Yousef               2023-01-12  7442  				rq_util_min = uclamp_rq_get(rq, UCLAMP_MIN);
e26fd28db82899 Qais Yousef               2023-01-12  7443  				rq_util_max = uclamp_rq_get(rq, UCLAMP_MAX);
244226035a1f9b Qais Yousef               2022-08-04  7444  
244226035a1f9b Qais Yousef               2022-08-04  7445  				util_min = max(rq_util_min, p_util_min);
244226035a1f9b Qais Yousef               2022-08-04  7446  				util_max = max(rq_util_max, p_util_max);
244226035a1f9b Qais Yousef               2022-08-04  7447  			}
e5ed0550c04c54 Vincent Guittot           2023-02-01  7448  
e5ed0550c04c54 Vincent Guittot           2023-02-01  7449  			fits = util_fits_cpu(util, util_min, util_max, cpu);
e5ed0550c04c54 Vincent Guittot           2023-02-01  7450  			if (!fits)
732cd75b8c920d Quentin Perret            2018-12-03  7451  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  7452  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7453  			lsub_positive(&cpu_cap, util);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7454  
732cd75b8c920d Quentin Perret            2018-12-03  7455  			if (cpu == prev_cpu) {
8d4c97c105ca07 Pierre Gondois            2021-05-04  7456  				/* Always use prev_cpu as a candidate. */
ad841e569f5c88 Pierre Gondois            2022-10-06  7457  				prev_spare_cap = cpu_cap;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7458  				prev_fits = fits;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7459  			} else if ((fits > max_fits) ||
e5ed0550c04c54 Vincent Guittot           2023-02-01  7460  				   ((fits == max_fits) && (cpu_cap > max_spare_cap))) {
732cd75b8c920d Quentin Perret            2018-12-03  7461  				/*
8d4c97c105ca07 Pierre Gondois            2021-05-04  7462  				 * Find the CPU with the maximum spare capacity
ad841e569f5c88 Pierre Gondois            2022-10-06  7463  				 * among the remaining CPUs in the performance
ad841e569f5c88 Pierre Gondois            2022-10-06  7464  				 * domain.
732cd75b8c920d Quentin Perret            2018-12-03  7465  				 */
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7466  				max_spare_cap = cpu_cap;
732cd75b8c920d Quentin Perret            2018-12-03  7467  				max_spare_cap_cpu = cpu;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7468  				max_fits = fits;
732cd75b8c920d Quentin Perret            2018-12-03  7469  			}
732cd75b8c920d Quentin Perret            2018-12-03  7470  		}
732cd75b8c920d Quentin Perret            2018-12-03  7471  
ad841e569f5c88 Pierre Gondois            2022-10-06  7472  		if (max_spare_cap_cpu < 0 && prev_spare_cap == 0)
8d4c97c105ca07 Pierre Gondois            2021-05-04  7473  			continue;
8d4c97c105ca07 Pierre Gondois            2021-05-04  7474  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7475  		eenv_pd_busy_time(&eenv, cpus, p);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7476  		/* Compute the 'base' energy of the pd, without @p */
b812fc9768e004 Vincent Donnefort         2022-06-21  7477  		base_energy = compute_energy(&eenv, pd, cpus, p, -1);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7478  
8d4c97c105ca07 Pierre Gondois            2021-05-04  7479  		/* Evaluate the energy impact of using prev_cpu. */
ad841e569f5c88 Pierre Gondois            2022-10-06  7480  		if (prev_spare_cap > 0) {
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7481  			prev_delta = compute_energy(&eenv, pd, cpus, p,
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7482  						    prev_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7483  			/* CPU utilization has changed */
b812fc9768e004 Vincent Donnefort         2022-06-21  7484  			if (prev_delta < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  7485  				goto unlock;
b812fc9768e004 Vincent Donnefort         2022-06-21  7486  			prev_delta -= base_energy;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7487  			prev_thermal_cap = cpu_thermal_cap;
8d4c97c105ca07 Pierre Gondois            2021-05-04  7488  			best_delta = min(best_delta, prev_delta);
8d4c97c105ca07 Pierre Gondois            2021-05-04  7489  		}
8d4c97c105ca07 Pierre Gondois            2021-05-04  7490  
8d4c97c105ca07 Pierre Gondois            2021-05-04  7491  		/* Evaluate the energy impact of using max_spare_cap_cpu. */
ad841e569f5c88 Pierre Gondois            2022-10-06  7492  		if (max_spare_cap_cpu >= 0 && max_spare_cap > prev_spare_cap) {
e5ed0550c04c54 Vincent Guittot           2023-02-01  7493  			/* Current best energy cpu fits better */
e5ed0550c04c54 Vincent Guittot           2023-02-01  7494  			if (max_fits < best_fits)
e5ed0550c04c54 Vincent Guittot           2023-02-01  7495  				continue;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7496  
e5ed0550c04c54 Vincent Guittot           2023-02-01  7497  			/*
e5ed0550c04c54 Vincent Guittot           2023-02-01  7498  			 * Both don't fit performance hint (i.e. uclamp_min)
e5ed0550c04c54 Vincent Guittot           2023-02-01  7499  			 * but best energy cpu has better capacity.
e5ed0550c04c54 Vincent Guittot           2023-02-01  7500  			 */
e5ed0550c04c54 Vincent Guittot           2023-02-01  7501  			if ((max_fits < 0) &&
e5ed0550c04c54 Vincent Guittot           2023-02-01  7502  			    (cpu_thermal_cap <= best_thermal_cap))
e5ed0550c04c54 Vincent Guittot           2023-02-01  7503  				continue;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7504  
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7505  			cur_delta = compute_energy(&eenv, pd, cpus, p,
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7506  						   max_spare_cap_cpu);
3e8c6c9aac42ce Vincent Donnefort         2022-06-21  7507  			/* CPU utilization has changed */
b812fc9768e004 Vincent Donnefort         2022-06-21  7508  			if (cur_delta < base_energy)
619e090c8e409e Pierre Gondois            2021-05-04  7509  				goto unlock;
b812fc9768e004 Vincent Donnefort         2022-06-21  7510  			cur_delta -= base_energy;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7511  
e5ed0550c04c54 Vincent Guittot           2023-02-01  7512  			/*
e5ed0550c04c54 Vincent Guittot           2023-02-01  7513  			 * Both fit for the task but best energy cpu has lower
e5ed0550c04c54 Vincent Guittot           2023-02-01  7514  			 * energy impact.
e5ed0550c04c54 Vincent Guittot           2023-02-01  7515  			 */
e5ed0550c04c54 Vincent Guittot           2023-02-01  7516  			if ((max_fits > 0) && (best_fits > 0) &&
e5ed0550c04c54 Vincent Guittot           2023-02-01  7517  			    (cur_delta >= best_delta))
e5ed0550c04c54 Vincent Guittot           2023-02-01  7518  				continue;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7519  
eb92692b2544d3 Quentin Perret            2019-09-12  7520  			best_delta = cur_delta;
732cd75b8c920d Quentin Perret            2018-12-03  7521  			best_energy_cpu = max_spare_cap_cpu;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7522  			best_fits = max_fits;
e5ed0550c04c54 Vincent Guittot           2023-02-01  7523  			best_thermal_cap = cpu_thermal_cap;
732cd75b8c920d Quentin Perret            2018-12-03  7524  		}
732cd75b8c920d Quentin Perret            2018-12-03  7525  	}
732cd75b8c920d Quentin Perret            2018-12-03  7526  	rcu_read_unlock();
732cd75b8c920d Quentin Perret            2018-12-03  7527  
e5ed0550c04c54 Vincent Guittot           2023-02-01  7528  	if ((best_fits > prev_fits) ||
e5ed0550c04c54 Vincent Guittot           2023-02-01  7529  	    ((best_fits > 0) && (best_delta < prev_delta)) ||
e5ed0550c04c54 Vincent Guittot           2023-02-01  7530  	    ((best_fits < 0) && (best_thermal_cap > prev_thermal_cap)))
619e090c8e409e Pierre Gondois            2021-05-04 @7531  		target = best_energy_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  7532  
619e090c8e409e Pierre Gondois            2021-05-04  7533  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  7534  
619e090c8e409e Pierre Gondois            2021-05-04  7535  unlock:
732cd75b8c920d Quentin Perret            2018-12-03  7536  	rcu_read_unlock();
732cd75b8c920d Quentin Perret            2018-12-03  7537  
619e090c8e409e Pierre Gondois            2021-05-04  7538  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  7539  }
732cd75b8c920d Quentin Perret            2018-12-03  7540  

:::::: The code at line 7531 was first introduced by commit
:::::: 619e090c8e409e09bd3e8edcd5a73d83f689890c sched/fair: Fix negative energy delta in find_energy_efficient_cpu()

:::::: TO: Pierre Gondois <Pierre.Gondois@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
