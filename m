Content-Type: multipart/mixed; boundary="===============5392208015804897280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/energy_model.h:155:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Tue, 22 Mar 2022 06:43:30 +0800
Message-ID: <202203220624.VIf9HsZu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5392208015804897280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Donnefort <vincent.donnefort@arm.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Lukasz Luba <lukasz.luba@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: 8354eb9eb3ddb4a8d0857648a470beffcc9d8639 PM: EM: Allow skipping ine=
fficient states
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-c001-20220321 (https://download.01.org/0day-ci/arch=
ive/20220322/202203220624.VIf9HsZu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8354eb9eb3ddb4a8d0857648a470beffcc9d8639
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8354eb9eb3ddb4a8d0857648a470beffcc9d8639
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'tb_cfg_request_destroy'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:104:31: note: Left side of '&&' is false
           struct tb_cfg_request *req =3D container_of(kref, typeof(*req), =
kref);
                                        ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/thunderbolt/ctl.c:104:31: note: Taking false branch
           struct tb_cfg_request *req =3D container_of(kref, typeof(*req), =
kref);
                                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/thunderbolt/ctl.c:104:31: note: Loop condition is false.  Exitin=
g loop
           struct tb_cfg_request *req =3D container_of(kref, typeof(*req), =
kref);
                                        ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/thunderbolt/ctl.c:106:2: note: Memory is released
           kfree(req);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:119:2: note: Returning; memory was released
           kref_put(&req->kref, tb_cfg_request_destroy);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:553:2: note: Returning; memory was released vi=
a 1st parameter
           tb_cfg_request_put(req);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:599:8: note: Returning; memory was released vi=
a 2nd parameter
           ret =3D tb_cfg_request(ctl, req, tb_cfg_request_complete, &done);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:600:6: note: 'ret' is -107
           if (ret) {
               ^~~
   drivers/thunderbolt/ctl.c:600:2: note: Taking true branch
           if (ret) {
           ^
   drivers/thunderbolt/ctl.c:967:9: note: Returning; memory was released vi=
a 2nd parameter
                   res =3D tb_cfg_request_sync(ctl, req, timeout_msec);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/ctl.c:969:3: note: Use of memory after it is freed
                   tb_cfg_request_put(req);
                   ^                  ~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   kernel/sched/cputime.c:570:3: warning: Value stored to 'utime' is never =
read [clang-analyzer-deadcode.DeadStores]
                   utime =3D rtime;
                   ^       ~~~~~
   kernel/sched/cputime.c:570:3: note: Value stored to 'utime' is never read
                   utime =3D rtime;
                   ^       ~~~~~
   Suppressed 15 warnings (14 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> include/linux/energy_model.h:155:2: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ps;
           ^
   kernel/sched/fair.c:6789:27: note: Loop condition is false.  Exiting loop
           struct root_domain *rd =3D cpu_rq(smp_processor_id())->rd;
                                    ^
   kernel/sched/sched.h:1366:24: note: expanded from macro 'cpu_rq'
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
   kernel/sched/fair.c:6789:34: note: Loop condition is false.  Exiting loop
           struct root_domain *rd =3D cpu_rq(smp_processor_id())->rd;
                                           ^
   include/linux/smp.h:265:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   arch/x86/include/asm/smp.h:159:30: note: expanded from macro '__smp_proc=
essor_id'
   #define __smp_processor_id() __this_cpu_read(cpu_number)
                                ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/fair.c:6789:34: note: Control jumps to 'case 4:'  at line 6=
789
           struct root_domain *rd =3D cpu_rq(smp_processor_id())->rd;
                                           ^
   include/linux/smp.h:265:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   arch/x86/include/asm/smp.h:159:30: note: expanded from macro '__smp_proc=
essor_id'
   #define __smp_processor_id() __this_cpu_read(cpu_number)
                                ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   kernel/sched/fair.c:6789:34: note:  Execution continues on line 6789
           struct root_domain *rd =3D cpu_rq(smp_processor_id())->rd;
                                           ^
   include/linux/smp.h:265:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   arch/x86/include/asm/smp.h:159:30: note: expanded from macro '__smp_proc=
essor_id'
   #define __smp_processor_id() __this_cpu_read(cpu_number)
                                ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   kernel/sched/fair.c:6796:7: note: Left side of '||' is false
           pd =3D rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
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
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/sched/fair.c:6796:7: note: Left side of '||' is false
           pd =3D rcu_dereference(rd->pd);
                ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)

vim +155 include/linux/energy_model.h

27871f7a8a341e Quentin Perret    2018-12-03  126  =

8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  127  /**
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  128   * em_pd_get_efficient_st=
ate() - Get an efficient performance state from the EM
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  129   * @pd   : Performance do=
main for which we want an efficient frequency
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  130   * @freq : Frequency to m=
ap with the EM
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  131   *
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  132   * It is called from the =
scheduler code quite frequently and as a consequence
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  133   * doesn't implement any =
check.
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  134   *
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  135   * Return: An efficient p=
erformance state, high enough to meet @freq
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  136   * requirement.
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  137   */
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  138  static inline
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  139  struct em_perf_state *em_=
pd_get_efficient_state(struct em_perf_domain *pd,
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  140  						unsigned long freq)
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  141  {
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  142  	struct em_perf_state *ps;
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  143  	int i;
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  144  =

8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  145  	for (i =3D 0; i < pd->nr=
_perf_states; i++) {
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  146  		ps =3D &pd->table[i];
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  147  		if (ps->frequency >=3D =
freq) {
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  148  			if (pd->flags & EM_PER=
F_DOMAIN_SKIP_INEFFICIENCIES &&
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  149  			    ps->flags & EM_PER=
F_STATE_INEFFICIENT)
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  150  				continue;
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  151  			break;
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  152  		}
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  153  	}
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  154  =

8354eb9eb3ddb4 Vincent Donnefort 2021-09-08 @155  	return ps;
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  156  }
8354eb9eb3ddb4 Vincent Donnefort 2021-09-08  157  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5392208015804897280==--

