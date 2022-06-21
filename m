Content-Type: multipart/mixed; boundary="===============1225781168039984599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 7/7] sched/fair: de-entropy for SIS filter
Date: Tue, 21 Jun 2022 15:27:07 +0800
Message-ID: <202206211517.bchsifSF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1225781168039984599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/sc=
hed/fair.c:9330:6: warning: Value stored to 'icpu' during its initializatio=
n is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220619120451.95251-8-wuyun.abel@bytedance.com>
References: <20220619120451.95251-8-wuyun.abel@bytedance.com>
TO: Abel Wu <wuyun.abel@bytedance.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Mel Gorman <mgorman@suse.de>
TO: Vincent Guittot <vincent.guittot@linaro.org>
CC: Josh Don <joshdon@google.com>
CC: Chen Yu <yu.c.chen@intel.com>
CC: Tim Chen <tim.c.chen@linux.intel.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>
CC: "Gautham R . Shenoy" <gautham.shenoy@amd.com>
CC: linux-kernel(a)vger.kernel.org
CC: Abel Wu <wuyun.abel@bytedance.com>

Hi Abel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Wu/sched-fair-i=
mprove-scan-efficiency-of-SIS/20220619-200743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git f3dd3f6=
74555bd9455c5ae7fafce0696bd9931b3
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20220619 (https://download.01.org/0day-ci/arch=
ive/20220621/202206211517.bchsifSF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a=
0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/32fe13cd7aa184ed349=
d698ebf6f420fa426dd73
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Wu/sched-fair-improve-scan-ef=
ficiency-of-SIS/20220619-200743
        git checkout 32fe13cd7aa184ed349d698ebf6f420fa426dd73
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9670:2: note: Calling 'update_sd_lb_stats'
           update_sd_lb_stats(env, &sds);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9422:7: note: Assuming 'local_group' is 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9422:3: note: Taking false branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9431:3: note: Calling 'update_sg_lb_stats'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8766:16: note: Assuming 'group' is not equal to fiel=
d 'local'
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8769:2: note: Assuming 'i' is >=3D 'nr_cpu_ids'
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:326:3: note: expanded from macro 'for_each_cpu_a=
nd'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8769:2: note: Loop condition is false. Execution con=
tinues on line 8828
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:324:2: note: expanded from macro 'for_each_cpu_a=
nd'
           for ((cpu) =3D -1;                                              =
  \
           ^
   kernel/sched/fair.c:8833:7: note: 'local_group' is 0
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
                ^~~~~~~~~~~
   kernel/sched/fair.c:8833:6: note: Left side of '&&' is true
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
               ^
   kernel/sched/fair.c:8833:22: note: Assuming the condition is true
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8833:6: note: Left side of '&&' is true
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
               ^
   kernel/sched/fair.c:8834:6: note: Assuming field 'idle' is not equal to =
CPU_NOT_IDLE
               env->idle !=3D CPU_NOT_IDLE && sgs->sum_h_nr_running &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8833:6: note: Left side of '&&' is true
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
               ^
   kernel/sched/fair.c:8834:35: note: Assuming field 'sum_h_nr_running' is =
not equal to 0
               env->idle !=3D CPU_NOT_IDLE && sgs->sum_h_nr_running &&
                                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8833:6: note: Left side of '&&' is true
           if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
               ^
   kernel/sched/fair.c:8835:6: note: Calling 'sched_asym'
               sched_asym(env, sds, sgs, group)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8727:7: note: Access to field 'flags' results in a d=
ereference of a null pointer (loaded from field 'local')
           if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
                ^    ~~~~~
   kernel/sched/fair.c:8828:24: warning: Access to field 'sgc' results in a=
 dereference of a null pointer (loaded from variable 'group') [clang-analyz=
er-core.NullDereference]
           sgs->group_capacity =3D group->sgc->capacity;
                                 ^
   kernel/sched/fair.c:9670:2: note: Calling 'update_sd_lb_stats'
           update_sd_lb_stats(env, &sds);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9412:2: note: 'sg' initialized here
           struct sched_group *sg =3D env->sd->groups;
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9422:7: note: Assuming 'local_group' is 0
                   if (local_group) {
                       ^~~~~~~~~~~
   kernel/sched/fair.c:9422:3: note: Taking false branch
                   if (local_group) {
                   ^
   kernel/sched/fair.c:9431:32: note: Passing 'sg' via 3rd parameter 'group'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                                                ^~
   kernel/sched/fair.c:9431:3: note: Calling 'update_sg_lb_stats'
                   update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8766:16: note: Assuming 'group' is equal to field 'l=
ocal'
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8766:16: note: Assuming pointer value is null
           local_group =3D group =3D=3D sds->local;
                         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8769:2: note: Assuming 'i' is >=3D 'nr_cpu_ids'
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:326:3: note: expanded from macro 'for_each_cpu_a=
nd'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8769:2: note: Loop condition is false. Execution con=
tinues on line 8828
           for_each_cpu_and(i, sched_group_span(group), env->cpus) {
           ^
   include/linux/cpumask.h:324:2: note: expanded from macro 'for_each_cpu_a=
nd'
           for ((cpu) =3D -1;                                              =
  \
           ^
   kernel/sched/fair.c:8828:24: note: Access to field 'sgc' results in a de=
reference of a null pointer (loaded from variable 'group')
           sgs->group_capacity =3D group->sgc->capacity;
                                 ^~~~~
>> kernel/sched/fair.c:9330:6: warning: Value stored to 'icpu' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           int icpu =3D sds->idle_cpu, this =3D env->dst_cpu;
               ^~~~   ~~~~~~~~~~~~~
   kernel/sched/fair.c:9330:6: note: Value stored to 'icpu' during its init=
ialization is never read
           int icpu =3D sds->idle_cpu, this =3D env->dst_cpu;
               ^~~~   ~~~~~~~~~~~~~
>> kernel/sched/fair.c:9352:4: warning: Value stored to 'icpu' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           icpu =3D this;
                           ^      ~~~~
   kernel/sched/fair.c:9352:4: note: Value stored to 'icpu' is never read
                           icpu =3D this;
                           ^      ~~~~
   kernel/sched/fair.c:10040:25: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(load_balance_m=
ask);
                                  ^
   include/linux/cpumask.h:761:37: note: expanded from macro 'this_cpu_cpum=
ask_var_ptr'
   #define this_cpu_cpumask_var_ptr(x) this_cpu_ptr(x)
                                       ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   kernel/sched/fair.c:10462:13: note: Assuming 'idle' is equal to CPU_IDLE
           int busy =3D idle !=3D CPU_IDLE && !sched_idle_cpu(cpu);
                      ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10462:30: note: Left side of '&&' is false
           int busy =3D idle !=3D CPU_IDLE && !sched_idle_cpu(cpu);
                                       ^
   kernel/sched/fair.c:10472:2: note: Left side of '||' is false
           for_each_domain(cpu, sd) {
           ^
   kernel/sched/sched.h:1716:14: note: expanded from macro 'for_each_domain'
           for (__sd =3D rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd=
); \
                       ^
   kernel/sched/sched.h:1705:2: note: expanded from macro 'rcu_dereference_=
check_sched_domain'
           rcu_dereference_check((p), \
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:10472:2: note: Left side of '||' is false
           for_each_domain(cpu, sd) {
           ^
   kernel/sched/sched.h:1716:14: note: expanded from macro 'for_each_domain'
           for (__sd =3D rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd=
); \
                       ^
   kernel/sched/sched.h:1705:2: note: expanded from macro 'rcu_dereference_=
check_sched_domain'
           rcu_dereference_check((p), \
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:10472:2: note: Left side of '||' is false
           for_each_domain(cpu, sd) {
           ^
   kernel/sched/sched.h:1716:14: note: expanded from macro 'for_each_domain'
           for (__sd =3D rcu_dereference_check_sched_domain(cpu_rq(cpu)->sd=
); \
                       ^
   kernel/sched/sched.h:1705:2: note: expanded from macro 'rcu_dereference_=
check_sched_domain'
           rcu_dereference_check((p), \
           ^
   include/linux/rcupdate.h:532:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:319:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:10472:2: note: Left side of '||' is true
           for_each_domain(cpu, sd) {

vim +/icpu +9330 kernel/sched/fair.c

57abff067a0848 Vincent Guittot 2019-10-18  9325  =

ba6ee6cee1ed2f Abel Wu         2022-06-19  9326  static void sd_update_stat=
e(struct lb_env *env, struct sd_lb_stats *sds)
ba6ee6cee1ed2f Abel Wu         2022-06-19  9327  {
fcc108377a7cf7 Abel Wu         2022-06-19  9328  	struct sched_domain_share=
d *sd_smt_shared =3D env->sd->shared;
fcc108377a7cf7 Abel Wu         2022-06-19  9329  	enum sd_state new =3D sds=
->sd_state;
32fe13cd7aa184 Abel Wu         2022-06-19 @9330  	int icpu =3D sds->idle_cp=
u, this =3D env->dst_cpu;
fcc108377a7cf7 Abel Wu         2022-06-19  9331  =

fcc108377a7cf7 Abel Wu         2022-06-19  9332  	/*
fcc108377a7cf7 Abel Wu         2022-06-19  9333  	 * Parallel updating can =
hardly contribute accuracy to
fcc108377a7cf7 Abel Wu         2022-06-19  9334  	 * the filter, besides it=
 can be one of the burdens on
fcc108377a7cf7 Abel Wu         2022-06-19  9335  	 * cache traffic.
fcc108377a7cf7 Abel Wu         2022-06-19  9336  	 */
fcc108377a7cf7 Abel Wu         2022-06-19  9337  	if (cmpxchg(&sd_smt_share=
d->updating, 0, 1))
fcc108377a7cf7 Abel Wu         2022-06-19  9338  		return;
fcc108377a7cf7 Abel Wu         2022-06-19  9339  =

32fe13cd7aa184 Abel Wu         2022-06-19  9340  	/*
32fe13cd7aa184 Abel Wu         2022-06-19  9341  	 * The dst_cpu is likely =
to be fed with tasks soon.
32fe13cd7aa184 Abel Wu         2022-06-19  9342  	 * If it is the only unoc=
cupied cpu in this domain,
32fe13cd7aa184 Abel Wu         2022-06-19  9343  	 * we still handle it the=
 same way as as_has_icpus
32fe13cd7aa184 Abel Wu         2022-06-19  9344  	 * but turn the SMT into =
the unstable state, rather
32fe13cd7aa184 Abel Wu         2022-06-19  9345  	 * than waiting to the en=
d of load balancing since
32fe13cd7aa184 Abel Wu         2022-06-19  9346  	 * it's also important th=
at update the filter as
32fe13cd7aa184 Abel Wu         2022-06-19  9347  	 * early as possible to k=
eep it fresh.
32fe13cd7aa184 Abel Wu         2022-06-19  9348  	 */
32fe13cd7aa184 Abel Wu         2022-06-19  9349  	if (new =3D=3D sd_is_busy=
) {
32fe13cd7aa184 Abel Wu         2022-06-19  9350  		if (idle_cpu(this) || sc=
hed_idle_cpu(this)) {
32fe13cd7aa184 Abel Wu         2022-06-19  9351  			new =3D sd_may_idle;
32fe13cd7aa184 Abel Wu         2022-06-19 @9352  			icpu =3D this;
32fe13cd7aa184 Abel Wu         2022-06-19  9353  		}
32fe13cd7aa184 Abel Wu         2022-06-19  9354  	}
32fe13cd7aa184 Abel Wu         2022-06-19  9355  =

fcc108377a7cf7 Abel Wu         2022-06-19  9356  	/*
fcc108377a7cf7 Abel Wu         2022-06-19  9357  	 * There is at least one =
unoccupied cpu available, so
fcc108377a7cf7 Abel Wu         2022-06-19  9358  	 * propagate it to the fi=
lter to avoid false negative
fcc108377a7cf7 Abel Wu         2022-06-19  9359  	 * issue which could resu=
lt in lost tracking of some
fcc108377a7cf7 Abel Wu         2022-06-19  9360  	 * idle cpus thus through=
upt downgraded.
fcc108377a7cf7 Abel Wu         2022-06-19  9361  	 */
fcc108377a7cf7 Abel Wu         2022-06-19  9362  	if (new !=3D sd_is_busy) {
32fe13cd7aa184 Abel Wu         2022-06-19  9363  		/*
32fe13cd7aa184 Abel Wu         2022-06-19  9364  		 * The sd_may_idle state=
 is taken into
32fe13cd7aa184 Abel Wu         2022-06-19  9365  		 * consideration as well=
 because from
32fe13cd7aa184 Abel Wu         2022-06-19  9366  		 * here we couldn't actu=
ally know task
32fe13cd7aa184 Abel Wu         2022-06-19  9367  		 * migrations would happ=
en or not.
32fe13cd7aa184 Abel Wu         2022-06-19  9368  		 */
fcc108377a7cf7 Abel Wu         2022-06-19  9369  		if (!test_idle_cpus(this=
))
fcc108377a7cf7 Abel Wu         2022-06-19  9370  			set_idle_cpus(this, tru=
e);
fcc108377a7cf7 Abel Wu         2022-06-19  9371  	} else {
fcc108377a7cf7 Abel Wu         2022-06-19  9372  		/*
fcc108377a7cf7 Abel Wu         2022-06-19  9373  		 * Nothing changes so no=
thing to update or
fcc108377a7cf7 Abel Wu         2022-06-19  9374  		 * propagate.
fcc108377a7cf7 Abel Wu         2022-06-19  9375  		 */
fcc108377a7cf7 Abel Wu         2022-06-19  9376  		if (sd_smt_shared->state=
 =3D=3D sd_is_busy)
fcc108377a7cf7 Abel Wu         2022-06-19  9377  			goto out;
32fe13cd7aa184 Abel Wu         2022-06-19  9378  =

32fe13cd7aa184 Abel Wu         2022-06-19  9379  		/*
32fe13cd7aa184 Abel Wu         2022-06-19  9380  		 * Allow false positive =
to exist for some time
32fe13cd7aa184 Abel Wu         2022-06-19  9381  		 * to make a tradeoff of=
 accuracy of the filter
32fe13cd7aa184 Abel Wu         2022-06-19  9382  		 * for relieving cache t=
raffic.
32fe13cd7aa184 Abel Wu         2022-06-19  9383  		 */
32fe13cd7aa184 Abel Wu         2022-06-19  9384  		if (sd_smt_shared->state=
 =3D=3D sd_has_icpus) {
32fe13cd7aa184 Abel Wu         2022-06-19  9385  			new =3D sd_may_idle;
32fe13cd7aa184 Abel Wu         2022-06-19  9386  			goto update;
32fe13cd7aa184 Abel Wu         2022-06-19  9387  		}
32fe13cd7aa184 Abel Wu         2022-06-19  9388  =

32fe13cd7aa184 Abel Wu         2022-06-19  9389  		/*
32fe13cd7aa184 Abel Wu         2022-06-19  9390  		 * If the false positive=
 issue has already been
32fe13cd7aa184 Abel Wu         2022-06-19  9391  		 * there for a while, a =
correction of the filter
32fe13cd7aa184 Abel Wu         2022-06-19  9392  		 * is needed.
32fe13cd7aa184 Abel Wu         2022-06-19  9393  		 */
fcc108377a7cf7 Abel Wu         2022-06-19  9394  	}
fcc108377a7cf7 Abel Wu         2022-06-19  9395  =

fcc108377a7cf7 Abel Wu         2022-06-19  9396  	sd_update_icpus(this, sds=
->idle_cpu);
32fe13cd7aa184 Abel Wu         2022-06-19  9397  update:
fcc108377a7cf7 Abel Wu         2022-06-19  9398  	sd_smt_shared->state =3D =
new;
fcc108377a7cf7 Abel Wu         2022-06-19  9399  out:
fcc108377a7cf7 Abel Wu         2022-06-19  9400  	xchg(&sd_smt_shared->upda=
ting, 0);
ba6ee6cee1ed2f Abel Wu         2022-06-19  9401  }
ba6ee6cee1ed2f Abel Wu         2022-06-19  9402  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1225781168039984599==--

