Content-Type: multipart/mixed; boundary="===============0137039701734334767=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 6/7] sched/fair: Remove task_util from effective utilization in feec()
Date: Thu, 13 Jan 2022 19:35:05 +0800
Message-ID: <202201131912.xXKka1RZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0137039701734334767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220112161230.836326-7-vincent.donnefort@arm.com>
References: <20220112161230.836326-7-vincent.donnefort@arm.com>
TO: Vincent Donnefort <vincent.donnefort@arm.com>

Hi Vincent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on next-20220113]
[cannot apply to rafael-pm/linux-next rafael-pm/thermal v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vincent-Donnefort/feec-ene=
rgy-margin-removal/20220113-002104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 82762d2=
af31a60081162890983a83499c9c7dd74
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-c006-20220112 (https://download.01.org/0day-ci/arc=
hive/20220113/202201131912.xXKka1RZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/ce70047d014b32af0102fca56=
81c1e8aebc4b7ae
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vincent-Donnefort/feec-energy-marg=
in-removal/20220113-002104
        git checkout ce70047d014b32af0102fca5681c1e8aebc4b7ae
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/char/ipmi/ipmi_si_intf.c:770:3: note: Calling 'handle_transactio=
n_done'
                   handle_transaction_done(smi_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:542:2: note: Control jumps to 'case SI_=
GETTING_EVENTS:'  at line 601
           switch (smi_info->si_state) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:604:4: note: Access to field 'rsp_size'=
 results in a dereference of a null pointer (loaded from field 'curr_msg')
                           =3D smi_info->handlers->get_result(
                           ^
   drivers/char/ipmi/ipmi_si_intf.c:642:4: warning: Access to field 'rsp_si=
ze' results in a dereference of a null pointer (loaded from field 'curr_msg=
') [clang-analyzer-core.NullDereference]
                           =3D smi_info->handlers->get_result(
                           ^
   drivers/char/ipmi/ipmi_si_intf.c:2159:6: note: Assuming field 'dev_group=
_added' is false
           if (smi_info->dev_group_added) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2159:2: note: Taking false branch
           if (smi_info->dev_group_added) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2163:6: note: Assuming field 'dev' is n=
ull
           if (smi_info->io.dev)
               ^~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2163:2: note: Taking false branch
           if (smi_info->io.dev)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2171:6: note: Assuming field 'irq_clean=
up' is null
           if (smi_info->io.irq_cleanup) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2171:2: note: Taking false branch
           if (smi_info->io.irq_cleanup) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2175:2: note: Calling 'stop_timer_and_t=
hread'
           stop_timer_and_thread(smi_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1835:6: note: Assuming field 'thread' i=
s equal to NULL
           if (smi_info->thread !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1835:2: note: Taking false branch
           if (smi_info->thread !=3D NULL) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1841:2: note: Value assigned to field '=
curr_msg'
           del_timer_sync(&smi_info->si_timer);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2175:2: note: Returning from 'stop_time=
r_and_thread'
           stop_timer_and_thread(smi_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2189:9: note: Assuming field 'curr_msg'=
 is null
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
                  ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2189:9: note: Left side of '||' is false
   drivers/char/ipmi/ipmi_si_intf.c:2189:32: note: Assuming field 'si_state=
' is not equal to SI_NORMAL
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:2189:2: note: Loop condition is true.  =
Entering loop body
           while (smi_info->curr_msg || (smi_info->si_state !=3D SI_NORMAL)=
) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:2190:3: note: Calling 'poll'
                   poll(smi_info);
                   ^~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1041:6: note: Assuming 'run_to_completi=
on' is true
           if (!run_to_completion)
               ^~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:1041:2: note: Taking false branch
           if (!run_to_completion)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:1043:2: note: Calling 'smi_event_handle=
r'
           smi_event_handler(smi_info, 10);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:764:9: note: Assuming 'si_sm_result' is=
 not equal to SI_SM_CALL_WITHOUT_DELAY
           while (si_sm_result =3D=3D SI_SM_CALL_WITHOUT_DELAY)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:764:2: note: Loop condition is false. E=
xecution continues on line 767
           while (si_sm_result =3D=3D SI_SM_CALL_WITHOUT_DELAY)
           ^
   drivers/char/ipmi/ipmi_si_intf.c:767:6: note: Assuming 'si_sm_result' is=
 equal to SI_SM_TRANSACTION_COMPLETE
           if (si_sm_result =3D=3D SI_SM_TRANSACTION_COMPLETE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:767:2: note: Taking true branch
           if (si_sm_result =3D=3D SI_SM_TRANSACTION_COMPLETE) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:770:3: note: Calling 'handle_transactio=
n_done'
                   handle_transaction_done(smi_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:542:2: note: Control jumps to 'case SI_=
GETTING_MESSAGES:'  at line 639
           switch (smi_info->si_state) {
           ^
   drivers/char/ipmi/ipmi_si_intf.c:642:4: note: Access to field 'rsp_size'=
 results in a dereference of a null pointer (loaded from field 'curr_msg')
                           =3D smi_info->handlers->get_result(
                           ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   kernel/sched/fair.c:683:15: warning: Value stored to 'nr_running' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int nr_running =3D cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:683:15: note: Value stored to 'nr_running' during it=
s initialization is never read
           unsigned int nr_running =3D cfs_rq->nr_running;
                        ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:6738:11: warning: The left expression of the compoun=
d assignment is an uninitialized value. The computed value will also be gar=
bage [clang-analyzer-core.uninitialized.Assign]
                           pd_cap +=3D cpu_thermal_cap;
                           ~~~~~~ ^
   kernel/sched/fair.c:6691:25: note: Loop condition is false.  Exiting loop
           struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask=
);
                                  ^
   include/linux/cpumask.h:735:37: note: expanded from macro 'this_cpu_cpum=
ask_var_ptr'
   #define this_cpu_cpumask_var_ptr(x) this_cpu_ptr(x)
                                       ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:6693:52: note: 'pd_cap' declared without an initial =
value
           unsigned long busy_time, tsk_busy_time, max_util, pd_cap;
                                                             ^~~~~~
   kernel/sched/fair.c:6694:27: note: Loop condition is false.  Exiting loop
           struct root_domain *rd =3D cpu_rq(smp_processor_id())->rd;
                                    ^
   kernel/sched/sched.h:1411:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:6702:7: note: Left side of '||' is false
           pd =3D rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:6702:7: note: Left side of '||' is false
           pd =3D rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:6702:7: note: Left side of '||' is true
           pd =3D rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/sched/fair.c:6702:7: note: Taking false branch
           pd =3D rcu_dereference(rd->pd);

vim +6738 kernel/sched/fair.c

390031e4c309c9 Quentin Perret            2018-12-03  6649  =

732cd75b8c920d Quentin Perret            2018-12-03  6650  /*
732cd75b8c920d Quentin Perret            2018-12-03  6651   * find_energy_e=
fficient_cpu(): Find most energy-efficient target CPU for the
732cd75b8c920d Quentin Perret            2018-12-03  6652   * waking task. =
find_energy_efficient_cpu() looks for the CPU with maximum
732cd75b8c920d Quentin Perret            2018-12-03  6653   * spare capacit=
y in each performance domain and uses it as a potential
732cd75b8c920d Quentin Perret            2018-12-03  6654   * candidate to =
execute the task. Then, it uses the Energy Model to figure
732cd75b8c920d Quentin Perret            2018-12-03  6655   * out which of =
the CPU candidates is the most energy-efficient.
732cd75b8c920d Quentin Perret            2018-12-03  6656   *
732cd75b8c920d Quentin Perret            2018-12-03  6657   * The rationale=
 for this heuristic is as follows. In a performance domain,
732cd75b8c920d Quentin Perret            2018-12-03  6658   * all the most =
energy efficient CPU candidates (according to the Energy
732cd75b8c920d Quentin Perret            2018-12-03  6659   * Model) are th=
ose for which we'll request a low frequency. When there are
732cd75b8c920d Quentin Perret            2018-12-03  6660   * several CPUs =
for which the frequency request will be the same, we don't
732cd75b8c920d Quentin Perret            2018-12-03  6661   * have enough d=
ata to break the tie between them, because the Energy Model
732cd75b8c920d Quentin Perret            2018-12-03  6662   * only includes=
 active power costs. With this model, if we assume that
732cd75b8c920d Quentin Perret            2018-12-03  6663   * frequency req=
uests follow utilization (e.g. using schedutil), the CPU with
732cd75b8c920d Quentin Perret            2018-12-03  6664   * the maximum s=
pare capacity in a performance domain is guaranteed to be among
732cd75b8c920d Quentin Perret            2018-12-03  6665   * the best cand=
idates of the performance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6666   *
732cd75b8c920d Quentin Perret            2018-12-03  6667   * In practice, =
it could be preferable from an energy standpoint to pack
732cd75b8c920d Quentin Perret            2018-12-03  6668   * small tasks o=
n a CPU in order to let other CPUs go in deeper idle states,
732cd75b8c920d Quentin Perret            2018-12-03  6669   * but that coul=
d also hurt our chances to go cluster idle, and we have no
732cd75b8c920d Quentin Perret            2018-12-03  6670   * ways to tell =
with the current Energy Model if this is actually a good
732cd75b8c920d Quentin Perret            2018-12-03  6671   * idea or not. =
So, find_energy_efficient_cpu() basically favors
732cd75b8c920d Quentin Perret            2018-12-03  6672   * cluster-packi=
ng, and spreading inside a cluster. That should at least be
732cd75b8c920d Quentin Perret            2018-12-03  6673   * a good thing =
for latency, and this is consistent with the idea that most
732cd75b8c920d Quentin Perret            2018-12-03  6674   * of the energy=
 savings of EAS come from the asymmetry of the system, and
732cd75b8c920d Quentin Perret            2018-12-03  6675   * not so much f=
rom breaking the tie between identical CPUs. That's also the
732cd75b8c920d Quentin Perret            2018-12-03  6676   * reason why EA=
S is enabled in the topology code only for systems where
732cd75b8c920d Quentin Perret            2018-12-03  6677   * SD_ASYM_CPUCA=
PACITY is set.
732cd75b8c920d Quentin Perret            2018-12-03  6678   *
732cd75b8c920d Quentin Perret            2018-12-03  6679   * NOTE: Forkees=
 are not accepted in the energy-aware wake-up path because
732cd75b8c920d Quentin Perret            2018-12-03  6680   * they don't ha=
ve any useful utilization data yet and it's not possible to
732cd75b8c920d Quentin Perret            2018-12-03  6681   * forecast thei=
r impact on energy consumption. Consequently, they will be
732cd75b8c920d Quentin Perret            2018-12-03  6682   * placed by fin=
d_idlest_cpu() on the least loaded CPU, which might turn out
732cd75b8c920d Quentin Perret            2018-12-03  6683   * to be energy-=
inefficient in some use-cases. The alternative would be to
732cd75b8c920d Quentin Perret            2018-12-03  6684   * bias new task=
s towards specific types of CPUs first, or to try to infer
732cd75b8c920d Quentin Perret            2018-12-03  6685   * their util_av=
g from the parent task, but those heuristics could hurt
732cd75b8c920d Quentin Perret            2018-12-03  6686   * other use-cas=
es too. So, until someone finds a better way to solve this,
732cd75b8c920d Quentin Perret            2018-12-03  6687   * let's keep th=
ings simple by re-using the existing slow path.
732cd75b8c920d Quentin Perret            2018-12-03  6688   */
732cd75b8c920d Quentin Perret            2018-12-03  6689  static int find_=
energy_efficient_cpu(struct task_struct *p, int prev_cpu)
732cd75b8c920d Quentin Perret            2018-12-03  6690  {
245c43dc401377 Dietmar Eggemann          2022-01-12  6691  	struct cpumask =
*cpus =3D this_cpu_cpumask_var_ptr(select_rq_mask);
eb92692b2544d3 Quentin Perret            2019-09-12  6692  	unsigned long p=
rev_delta =3D ULONG_MAX, best_delta =3D ULONG_MAX;
ce70047d014b32 Vincent Donnefort         2022-01-12  6693  	unsigned long b=
usy_time, tsk_busy_time, max_util, pd_cap;
732cd75b8c920d Quentin Perret            2018-12-03  6694  	struct root_dom=
ain *rd =3D cpu_rq(smp_processor_id())->rd;
619e090c8e409e Pierre Gondois            2021-05-04  6695  	int cpu, best_e=
nergy_cpu =3D prev_cpu, target =3D -1;
ce70047d014b32 Vincent Donnefort         2022-01-12  6696  	unsigned long c=
pu_cap, cpu_thermal_cap, util;
ce70047d014b32 Vincent Donnefort         2022-01-12  6697  	unsigned long b=
ase_energy =3D 0;
732cd75b8c920d Quentin Perret            2018-12-03  6698  	struct sched_do=
main *sd;
eb92692b2544d3 Quentin Perret            2019-09-12  6699  	struct perf_dom=
ain *pd;
732cd75b8c920d Quentin Perret            2018-12-03  6700  =

732cd75b8c920d Quentin Perret            2018-12-03  6701  	rcu_read_lock();
732cd75b8c920d Quentin Perret            2018-12-03  6702  	pd =3D rcu_dere=
ference(rd->pd);
732cd75b8c920d Quentin Perret            2018-12-03  6703  	if (!pd || READ=
_ONCE(rd->overutilized))
619e090c8e409e Pierre Gondois            2021-05-04  6704  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6705  =

732cd75b8c920d Quentin Perret            2018-12-03  6706  	/*
732cd75b8c920d Quentin Perret            2018-12-03  6707  	 * Energy-aware=
 wake-up happens on the lowest sched_domain starting
732cd75b8c920d Quentin Perret            2018-12-03  6708  	 * from sd_asym=
_cpucapacity spanning over this_cpu and prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  6709  	 */
732cd75b8c920d Quentin Perret            2018-12-03  6710  	sd =3D rcu_dere=
ference(*this_cpu_ptr(&sd_asym_cpucapacity));
732cd75b8c920d Quentin Perret            2018-12-03  6711  	while (sd && !c=
pumask_test_cpu(prev_cpu, sched_domain_span(sd)))
732cd75b8c920d Quentin Perret            2018-12-03  6712  		sd =3D sd->par=
ent;
732cd75b8c920d Quentin Perret            2018-12-03  6713  	if (!sd)
619e090c8e409e Pierre Gondois            2021-05-04  6714  		goto unlock;
619e090c8e409e Pierre Gondois            2021-05-04  6715  =

619e090c8e409e Pierre Gondois            2021-05-04  6716  	target =3D prev=
_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6717  =

732cd75b8c920d Quentin Perret            2018-12-03  6718  	sync_entity_loa=
d_avg(&p->se);
732cd75b8c920d Quentin Perret            2018-12-03  6719  	if (!task_util_=
est(p))
732cd75b8c920d Quentin Perret            2018-12-03  6720  		goto unlock;
732cd75b8c920d Quentin Perret            2018-12-03  6721  =

ce70047d014b32 Vincent Donnefort         2022-01-12  6722  	tsk_busy_time =
=3D get_task_busy_time(p, prev_cpu);
ce70047d014b32 Vincent Donnefort         2022-01-12  6723  =

732cd75b8c920d Quentin Perret            2018-12-03  6724  	for (; pd; pd =
=3D pd->next) {
eb92692b2544d3 Quentin Perret            2019-09-12  6725  		unsigned long =
cur_delta, spare_cap, max_spare_cap =3D 0;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6726  		bool compute_p=
rev_delta =3D false;
eb92692b2544d3 Quentin Perret            2019-09-12  6727  		unsigned long =
base_energy_pd;
732cd75b8c920d Quentin Perret            2018-12-03  6728  		int max_spare_=
cap_cpu =3D -1;
732cd75b8c920d Quentin Perret            2018-12-03  6729  =

245c43dc401377 Dietmar Eggemann          2022-01-12  6730  		cpumask_and(cp=
us, perf_domain_span(pd), cpu_online_mask);
245c43dc401377 Dietmar Eggemann          2022-01-12  6731  =

ce70047d014b32 Vincent Donnefort         2022-01-12  6732  		/* Account the=
rmal pressure for the energy estimation */
ce70047d014b32 Vincent Donnefort         2022-01-12  6733  		cpu =3D cpumas=
k_first(cpus);
ce70047d014b32 Vincent Donnefort         2022-01-12  6734  		cpu_thermal_ca=
p =3D arch_scale_cpu_capacity(cpu);
ce70047d014b32 Vincent Donnefort         2022-01-12  6735  		cpu_thermal_ca=
p -=3D arch_scale_thermal_pressure(cpu);
ce70047d014b32 Vincent Donnefort         2022-01-12  6736  =

ce70047d014b32 Vincent Donnefort         2022-01-12  6737  		for_each_cpu(c=
pu, cpus) {
ce70047d014b32 Vincent Donnefort         2022-01-12 @6738  			pd_cap +=3D c=
pu_thermal_cap;
ce70047d014b32 Vincent Donnefort         2022-01-12  6739  =

ce70047d014b32 Vincent Donnefort         2022-01-12  6740  			if (!cpumask_=
test_cpu(cpu, sched_domain_span(sd)))
ce70047d014b32 Vincent Donnefort         2022-01-12  6741  				continue;
ce70047d014b32 Vincent Donnefort         2022-01-12  6742  =

3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  6743  			if (!cpumask_=
test_cpu(cpu, p->cpus_ptr))
732cd75b8c920d Quentin Perret            2018-12-03  6744  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6745  =

732cd75b8c920d Quentin Perret            2018-12-03  6746  			util =3D cpu_=
util_next(cpu, p, cpu);
732cd75b8c920d Quentin Perret            2018-12-03  6747  			cpu_cap =3D c=
apacity_of(cpu);
da0777d35f4789 Lukasz Luba               2020-08-10  6748  			spare_cap =3D=
 cpu_cap;
da0777d35f4789 Lukasz Luba               2020-08-10  6749  			lsub_positive=
(&spare_cap, util);
1d42509e475cdc Valentin Schneider        2019-12-11  6750  =

1d42509e475cdc Valentin Schneider        2019-12-11  6751  			/*
1d42509e475cdc Valentin Schneider        2019-12-11  6752  			 * Skip CPUs =
that cannot satisfy the capacity request.
1d42509e475cdc Valentin Schneider        2019-12-11  6753  			 * IOW, placi=
ng the task there would make the CPU
1d42509e475cdc Valentin Schneider        2019-12-11  6754  			 * overutiliz=
ed. Take uclamp into account to see how
1d42509e475cdc Valentin Schneider        2019-12-11  6755  			 * much capac=
ity we can get out of the CPU; this is
a5418be9dffe70 Viresh Kumar              2020-12-08  6756  			 * aligned wi=
th sched_cpu_util().
1d42509e475cdc Valentin Schneider        2019-12-11  6757  			 */
1d42509e475cdc Valentin Schneider        2019-12-11  6758  			util =3D ucla=
mp_rq_util_with(cpu_rq(cpu), util, p);
60e17f5cef838e Viresh Kumar              2019-06-04  6759  			if (!fits_cap=
acity(util, cpu_cap))
732cd75b8c920d Quentin Perret            2018-12-03  6760  				continue;
732cd75b8c920d Quentin Perret            2018-12-03  6761  =

732cd75b8c920d Quentin Perret            2018-12-03  6762  			if (cpu =3D=
=3D prev_cpu) {
8d4c97c105ca07 Pierre Gondois            2021-05-04  6763  				/* Always us=
e prev_cpu as a candidate. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6764  				compute_prev=
_delta =3D true;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6765  			} else if (sp=
are_cap > max_spare_cap) {
732cd75b8c920d Quentin Perret            2018-12-03  6766  				/*
8d4c97c105ca07 Pierre Gondois            2021-05-04  6767  				 * Find the =
CPU with the maximum spare capacity
8d4c97c105ca07 Pierre Gondois            2021-05-04  6768  				 * in the pe=
rformance domain.
732cd75b8c920d Quentin Perret            2018-12-03  6769  				 */
732cd75b8c920d Quentin Perret            2018-12-03  6770  				max_spare_ca=
p =3D spare_cap;
732cd75b8c920d Quentin Perret            2018-12-03  6771  				max_spare_ca=
p_cpu =3D cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6772  			}
732cd75b8c920d Quentin Perret            2018-12-03  6773  		}
732cd75b8c920d Quentin Perret            2018-12-03  6774  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6775  		if (max_spare_=
cap_cpu < 0 && !compute_prev_delta)
8d4c97c105ca07 Pierre Gondois            2021-05-04  6776  			continue;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6777  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6778  		/* Compute the=
 'base' energy of the pd, without @p */
ce70047d014b32 Vincent Donnefort         2022-01-12  6779  		busy_time =3D =
get_pd_busy_time(p, cpus, pd_cap);
ce70047d014b32 Vincent Donnefort         2022-01-12  6780  		max_util =3D g=
et_pd_max_util(p, -1, cpus, cpu_thermal_cap);
ce70047d014b32 Vincent Donnefort         2022-01-12  6781  		base_energy_pd=
 =3D compute_energy(pd, max_util, busy_time,
ce70047d014b32 Vincent Donnefort         2022-01-12  6782  						cpu_therma=
l_cap);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6783  		base_energy +=
=3D base_energy_pd;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6784  =

ce70047d014b32 Vincent Donnefort         2022-01-12  6785  		/* Take task i=
nto account for the next energy computations */
ce70047d014b32 Vincent Donnefort         2022-01-12  6786  		busy_time =3D =
min(pd_cap, busy_time + tsk_busy_time);
ce70047d014b32 Vincent Donnefort         2022-01-12  6787  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6788  		/* Evaluate th=
e energy impact of using prev_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6789  		if (compute_pr=
ev_delta) {
ce70047d014b32 Vincent Donnefort         2022-01-12  6790  			max_util =3D =
get_pd_max_util(p, prev_cpu, cpus,
ce70047d014b32 Vincent Donnefort         2022-01-12  6791  						   cpu_the=
rmal_cap);
ce70047d014b32 Vincent Donnefort         2022-01-12  6792  			prev_delta =
=3D compute_energy(pd, max_util, busy_time,
ce70047d014b32 Vincent Donnefort         2022-01-12  6793  						    cpu_th=
ermal_cap);
619e090c8e409e Pierre Gondois            2021-05-04  6794  			if (prev_delt=
a < base_energy_pd)
619e090c8e409e Pierre Gondois            2021-05-04  6795  				goto unlock;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6796  			prev_delta -=
=3D base_energy_pd;
8d4c97c105ca07 Pierre Gondois            2021-05-04  6797  			best_delta =
=3D min(best_delta, prev_delta);
8d4c97c105ca07 Pierre Gondois            2021-05-04  6798  		}
8d4c97c105ca07 Pierre Gondois            2021-05-04  6799  =

8d4c97c105ca07 Pierre Gondois            2021-05-04  6800  		/* Evaluate th=
e energy impact of using max_spare_cap_cpu. */
8d4c97c105ca07 Pierre Gondois            2021-05-04  6801  		if (max_spare_=
cap_cpu >=3D 0) {
ce70047d014b32 Vincent Donnefort         2022-01-12  6802  			max_util =3D =
get_pd_max_util(p, max_spare_cap_cpu, cpus,
ce70047d014b32 Vincent Donnefort         2022-01-12  6803  						   cpu_the=
rmal_cap);
ce70047d014b32 Vincent Donnefort         2022-01-12  6804  			cur_delta =3D=
 compute_energy(pd, max_util, busy_time,
ce70047d014b32 Vincent Donnefort         2022-01-12  6805  						   cpu_the=
rmal_cap);
619e090c8e409e Pierre Gondois            2021-05-04  6806  			if (cur_delta=
 < base_energy_pd)
619e090c8e409e Pierre Gondois            2021-05-04  6807  				goto unlock;
eb92692b2544d3 Quentin Perret            2019-09-12  6808  			cur_delta -=
=3D base_energy_pd;
eb92692b2544d3 Quentin Perret            2019-09-12  6809  			if (cur_delta=
 < best_delta) {
eb92692b2544d3 Quentin Perret            2019-09-12  6810  				best_delta =
=3D cur_delta;
732cd75b8c920d Quentin Perret            2018-12-03  6811  				best_energy_=
cpu =3D max_spare_cap_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6812  			}
732cd75b8c920d Quentin Perret            2018-12-03  6813  		}
732cd75b8c920d Quentin Perret            2018-12-03  6814  	}
732cd75b8c920d Quentin Perret            2018-12-03  6815  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6816  =

732cd75b8c920d Quentin Perret            2018-12-03  6817  	/*
732cd75b8c920d Quentin Perret            2018-12-03  6818  	 * Pick the bes=
t CPU if prev_cpu cannot be used, or if it saves at
732cd75b8c920d Quentin Perret            2018-12-03  6819  	 * least 6% of =
the energy used by prev_cpu.
732cd75b8c920d Quentin Perret            2018-12-03  6820  	 */
619e090c8e409e Pierre Gondois            2021-05-04  6821  	if ((prev_delta=
 =3D=3D ULONG_MAX) ||
619e090c8e409e Pierre Gondois            2021-05-04  6822  	    (prev_delta=
 - best_delta) > ((prev_delta + base_energy) >> 4))
619e090c8e409e Pierre Gondois            2021-05-04  6823  		target =3D bes=
t_energy_cpu;
732cd75b8c920d Quentin Perret            2018-12-03  6824  =

619e090c8e409e Pierre Gondois            2021-05-04  6825  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6826  =

619e090c8e409e Pierre Gondois            2021-05-04  6827  unlock:
732cd75b8c920d Quentin Perret            2018-12-03  6828  	rcu_read_unlock=
();
732cd75b8c920d Quentin Perret            2018-12-03  6829  =

619e090c8e409e Pierre Gondois            2021-05-04  6830  	return target;
732cd75b8c920d Quentin Perret            2018-12-03  6831  }
732cd75b8c920d Quentin Perret            2018-12-03  6832  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0137039701734334767==--

