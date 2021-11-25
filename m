Content-Type: multipart/mixed; boundary="===============0670398126033305131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mel:sched-sisdepth-v1r3 3/3] kernel/sched/fair.c:6287:4: warning: Value stored to 'nr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 25 Nov 2021 18:40:54 +0800
Message-ID: <202111251837.B12qrT0B-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0670398126033305131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mel Gorman <mgorman@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git sched=
-sisdepth-v1r3
head:   29b51054eca8c8c58122830b8a747df1a4605045
commit: 29b51054eca8c8c58122830b8a747df1a4605045 [3/3] SIS_DEPTH
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20211027 (https://download.01.org/0day-ci/arc=
hive/20211125/202111251837.B12qrT0B-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db756=
8a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git/com=
mit/?id=3D29b51054eca8c8c58122830b8a747df1a4605045
        git remote add mel https://git.kernel.org/pub/scm/linux/kernel/git/=
mel/linux.git
        git fetch --no-tags mel sched-sisdepth-v1r3
        git checkout 29b51054eca8c8c58122830b8a747df1a4605045
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/sched/sch_fq.c:314:7: note: Assuming 'sk' is equal to field 'sk'
                   if (f->sk =3D=3D sk) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/sch_fq.c:314:3: note: '?' condition is false
                   if (f->sk =3D=3D sk) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/sch_fq.c:314:16: note: 'sk' is equal to field 'sk'
                   if (f->sk =3D=3D sk) {
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/sched/sch_fq.c:314:3: note: '?' condition is true
                   if (f->sk =3D=3D sk) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/sched/sch_fq.c:314:3: note: Taking true branch
                   if (f->sk =3D=3D sk) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/sch_fq.c:320:17: note: Assuming 'sk' is equal to field 'sk'
                           if (unlikely(skb->sk =3D=3D sk &&
                                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/sch_fq.c:320:17: note: Left side of '&&' is true
                           if (unlikely(skb->sk =3D=3D sk &&
                                        ^
   net/sched/sch_fq.c:321:28: note: Dereference of null pointer
                                        f->socket_hash !=3D sk->sk_hash)) {
                                                          ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   kernel/sched/cputime.c:570:3: warning: Value stored to 'utime' is never =
read [clang-analyzer-deadcode.DeadStores]
                   utime =3D rtime;
                   ^       ~~~~~
   kernel/sched/cputime.c:570:3: note: Value stored to 'utime' is never read
                   utime =3D rtime;
                   ^       ~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> kernel/sched/fair.c:6287:4: warning: Value stored to 'nr' is never read =
[clang-analyzer-deadcode.DeadStores]
                           nr *=3D sched_smt_weight;
                           ^
   kernel/sched/fair.c:6287:4: note: Value stored to 'nr' is never read
   kernel/sched/fair.c:6390:6: warning: 1st function call argument is an un=
initialized value [clang-analyzer-core.CallAndMessage]
               asym_fits_capacity(task_util, target))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/sched/fair.c:6372:2: note: 'task_util' declared without an initia=
l value
           unsigned long task_util;
           ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6379:6: note: Left side of '&&' is false
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   kernel/sched/fair.c:6379:6: note: '?' condition is true
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:2: note: expanded from macro 'static_key_=
enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/sched/fair.c:6379:6: note: Left side of '&&' is false
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   kernel/sched/fair.c:6379:6: note: Taking false branch
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:2: note: expanded from macro 'static_key_=
enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/sched/fair.c:6379:6: note: Assuming the condition is false
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:420:2: note: expanded from macro 'static_key_=
enabled'
           static_key_count((struct static_key *)x) > 0;                   =
        \
           ^
   include/linux/compiler.h:21:49: note: expanded from macro 'unlikely_notr=
ace'
   #define unlikely_notrace(x)     __builtin_expect(!!(x), 0)
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/sched/fair.c:6379:2: note: '?' condition is false
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/sched/fair.c:6379:6: note: Left side of '&&' is false
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:416:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   kernel/sched/fair.c:6379:6: note: '?' condition is true
           if (static_branch_unlikely(&sched_asym_cpucapacity)) {
               ^
   include/linux/jump_label.h:508:52: note: expanded from macro 'static_bra=
nch_unlikely'

vim +/nr +6287 kernel/sched/fair.c

8335aa1277b644 Mel Gorman        2021-06-17  6265  =

10e2f1acd0106c Peter Zijlstra    2016-05-09  6266  /*
10e2f1acd0106c Peter Zijlstra    2016-05-09  6267   * Scan the LLC domain f=
or idle CPUs; this is dynamically regulated by
29b51054eca8c8 Mel Gorman        2021-10-11  6268   * the success or failur=
e of previous scans;
10e2f1acd0106c Peter Zijlstra    2016-05-09  6269   */
c722f35b513f80 Rik van Riel      2021-03-26  6270  static int select_idle_c=
pu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int =
target)
10e2f1acd0106c Peter Zijlstra    2016-05-09  6271  {
60588bfa223ff6 Cheng Jian        2019-12-13  6272  	struct cpumask *cpus =
=3D this_cpu_cpumask_var_ptr(select_idle_mask);
9fe1f127b91331 Mel Gorman        2021-01-27  6273  	int i, cpu, idle_cpu =
=3D -1, nr =3D INT_MAX;
9cfb38a7ba5a9c Wanpeng Li        2016-10-09  6274  	struct sched_domain *th=
is_sd;
29b51054eca8c8 Mel Gorman        2021-10-11  6275  	int depth =3D 0;
10e2f1acd0106c Peter Zijlstra    2016-05-09  6276  =

9cfb38a7ba5a9c Wanpeng Li        2016-10-09  6277  	this_sd =3D rcu_derefer=
ence(*this_cpu_ptr(&sd_llc));
9cfb38a7ba5a9c Wanpeng Li        2016-10-09  6278  	if (!this_sd)
9cfb38a7ba5a9c Wanpeng Li        2016-10-09  6279  		return -1;
9cfb38a7ba5a9c Wanpeng Li        2016-10-09  6280  =

bae4ec13640b09 Mel Gorman        2021-01-25  6281  	cpumask_and(cpus, sched=
_domain_span(sd), p->cpus_ptr);
bae4ec13640b09 Mel Gorman        2021-01-25  6282  =

29b51054eca8c8 Mel Gorman        2021-10-11  6283  	if (sched_feat(SIS_DEPT=
H)) {
29b51054eca8c8 Mel Gorman        2021-10-11  6284  		depth =3D min_t(int, t=
his_sd->sis_scan_depth, nr);
1ad3aaf3fcd244 Peter Zijlstra    2017-05-17  6285  =

b1168d8cf90943 Mel Gorman        2021-06-18  6286  		if (!has_idle_core)
8335aa1277b644 Mel Gorman        2021-06-17 @6287  			nr *=3D sched_smt_wei=
ght;
29b51054eca8c8 Mel Gorman        2021-10-11  6288  		nr =3D depth;
bae4ec13640b09 Mel Gorman        2021-01-25  6289  	}
60588bfa223ff6 Cheng Jian        2019-12-13  6290  =

29b51054eca8c8 Mel Gorman        2021-10-11  6291  	cpumask_and(cpus, sched=
_domain_span(sd), p->cpus_ptr);
29b51054eca8c8 Mel Gorman        2021-10-11  6292  =

56498cfb045d71 Mel Gorman        2021-08-04  6293  	for_each_cpu_wrap(cpu, =
cpus, target + 1) {
29b51054eca8c8 Mel Gorman        2021-10-11  6294  		if (--nr < 0) {
29b51054eca8c8 Mel Gorman        2021-10-11  6295  			depth =3D clamp(depth=
 - 1, 1, sis_min_cores * sched_smt_weight);
b1168d8cf90943 Mel Gorman        2021-06-18  6296  			break;
29b51054eca8c8 Mel Gorman        2021-10-11  6297  		}
b1168d8cf90943 Mel Gorman        2021-06-18  6298  =

c722f35b513f80 Rik van Riel      2021-03-26  6299  		if (has_idle_core) {
9fe1f127b91331 Mel Gorman        2021-01-27  6300  			i =3D select_idle_cor=
e(p, cpu, cpus, &idle_cpu);
9fe1f127b91331 Mel Gorman        2021-01-27  6301  			if ((unsigned int)i <=
 nr_cpumask_bits)
b1168d8cf90943 Mel Gorman        2021-06-18  6302  				break;
9fe1f127b91331 Mel Gorman        2021-01-27  6303  		} else {
97886d9dcd8682 Aubrey Li         2021-03-24  6304  			idle_cpu =3D __select=
_idle_cpu(cpu, p);
9fe1f127b91331 Mel Gorman        2021-01-27  6305  			if ((unsigned int)idl=
e_cpu < nr_cpumask_bits)
10e2f1acd0106c Peter Zijlstra    2016-05-09  6306  				break;
10e2f1acd0106c Peter Zijlstra    2016-05-09  6307  		}
9fe1f127b91331 Mel Gorman        2021-01-27  6308  	}
10e2f1acd0106c Peter Zijlstra    2016-05-09  6309  =

29b51054eca8c8 Mel Gorman        2021-10-11  6310  	if ((unsigned int)idle_=
cpu < nr_cpumask_bits && has_idle_core)
02dbb7246c5bbb Gautham R. Shenoy 2021-05-11  6311  		set_idle_cores(target,=
 false);
9fe1f127b91331 Mel Gorman        2021-01-27  6312  =

29b51054eca8c8 Mel Gorman        2021-10-11  6313  	if (sched_feat(SIS_DEPT=
H)) {
29b51054eca8c8 Mel Gorman        2021-10-11  6314  		if (idle_cpu)
29b51054eca8c8 Mel Gorman        2021-10-11  6315  			depth =3D min_t(int, =
depth + 1, sd->span_weight / sched_smt_weight);
29b51054eca8c8 Mel Gorman        2021-10-11  6316  		if (this_sd->sis_scan_=
depth !=3D depth)
29b51054eca8c8 Mel Gorman        2021-10-11  6317  			this_sd->sis_scan_dep=
th =3D depth;
b1168d8cf90943 Mel Gorman        2021-06-18  6318  	}
10e2f1acd0106c Peter Zijlstra    2016-05-09  6319  =

9fe1f127b91331 Mel Gorman        2021-01-27  6320  	return idle_cpu;
10e2f1acd0106c Peter Zijlstra    2016-05-09  6321  }
10e2f1acd0106c Peter Zijlstra    2016-05-09  6322  =


:::::: The code at line 6287 was first introduced by commit
:::::: 8335aa1277b644c3a94dd911e475d1b06c6aa5ee sched/fair: Make select_idl=
e_cpu() proportional to cores

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Mel Gorman <mgorman@techsingularity.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0670398126033305131==--

