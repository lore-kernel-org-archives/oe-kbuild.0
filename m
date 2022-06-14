Content-Type: multipart/mixed; boundary="===============5550257824240698935=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/trace/events/osnoise.h:9:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 14 Jun 2022 11:08:27 +0800
Message-ID: <202206141106.JGcedLVH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5550257824240698935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: include/t=
race/events/osnoise.h:9:1: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: bce29ac9ce0bb0b0b146b687ab978378c21e9078 trace: Add osnoise tracer
date:   12 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220611 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141106.JGcedLVH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6466c9=
abf3674bade1f6ee859f24ebc7aaf9cd88)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbce29ac9ce0bb0b0b146b687ab978378c21e9078
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bce29ac9ce0bb0b0b146b687ab978378c21e9078
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   include/trace/events/sched.h:699:1: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
   DECLARE_TRACE(pelt_dl_tp,
   ^
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/sched/pelt.c:378:2: note: Taking true branch
           if (___update_load_sum(now, &rq->avg_dl,
           ^
   kernel/sched/pelt.c:384:3: note: Calling 'trace_pelt_dl_tp'
                   trace_pelt_dl_tp(rq);
                   ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:699:1: note: Taking true branch
   DECLARE_TRACE(pelt_dl_tp,
   ^
   include/linux/tracepoint.h:409:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:237:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/sched.h:699:1: note: Dereference of null pointer
   DECLARE_TRACE(pelt_dl_tp,
   ^
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:240:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   include/trace/events/sched.h:711:1: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
   DECLARE_TRACE(pelt_se_tp,
   ^
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/sched/pelt.c:312:41: note: Assuming field 'on_rq' is not equal to=
 0
           if (___update_load_sum(now, &se->avg, !!se->on_rq, se_runnable(s=
e),
                                                  ^~~~~~~~~~
   kernel/sched/pelt.c:313:5: note: Assuming 'se' is not equal to field 'cu=
rr'
                                   cfs_rq->curr =3D=3D se)) {
                                   ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:312:2: note: Taking true branch
           if (___update_load_sum(now, &se->avg, !!se->on_rq, se_runnable(s=
e),
           ^
   kernel/sched/pelt.c:317:3: note: Calling 'trace_pelt_se_tp'
                   trace_pelt_se_tp(se);
                   ^~~~~~~~~~~~~~~~~~~~
   include/trace/events/sched.h:711:1: note: Taking true branch
   DECLARE_TRACE(pelt_se_tp,
   ^
   include/linux/tracepoint.h:409:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:237:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/sched.h:711:1: note: Dereference of null pointer
   DECLARE_TRACE(pelt_se_tp,
   ^
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:240:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> include/trace/events/osnoise.h:9:1: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
   TRACE_EVENT(thread_noise,
   ^
   include/linux/tracepoint.h:543:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/trace/trace_osnoise.c:689:6: note: Assuming field 'sampling' is t=
rue
           if (!osn_var->sampling)
               ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:689:2: note: Taking false branch
           if (!osn_var->sampling)
           ^
   kernel/trace/trace_osnoise.c:694:2: note: Calling 'trace_thread_noise'
           trace_thread_noise(t, osn_var->thread.arrival_time, duration);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/osnoise.h:9:1: note: Taking true branch
   TRACE_EVENT(thread_noise,
   ^
   include/linux/tracepoint.h:543:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:409:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:237:3: note: expanded from macro '__DECLARE_T=
RACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/osnoise.h:9:1: note: Dereference of null pointer
   TRACE_EVENT(thread_noise,
   ^
   include/linux/tracepoint.h:543:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:410:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:240:18: note: expanded from macro '__DECLARE_=
TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:139:31: note: expanded from macro 'TP_CONDITI=
ON'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:178:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   kernel/trace/trace_osnoise.c:108:9: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
           return this_cpu_ptr(&per_cpu_osnoise_var);
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
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   kernel/trace/trace_osnoise.c:709:38: note: Calling 'this_cpu_osn_var'
           struct osnoise_variables *osn_var =3D this_cpu_osn_var();
                                               ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:108:9: note: Loop condition is false.  Exit=
ing loop
           return this_cpu_ptr(&per_cpu_osnoise_var);
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
   kernel/trace/trace_osnoise.c:108:9: note: Dereference of null pointer
           return this_cpu_ptr(&per_cpu_osnoise_var);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))

vim +9 include/trace/events/osnoise.h

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22   7  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22   8  #include <linux/t=
racepoint.h>
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  @9  TRACE_EVENT(threa=
d_noise,
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  10  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  11  	TP_PROTO(struct =
task_struct *t, u64 start, u64 duration),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  12  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  13  	TP_ARGS(t, start=
, duration),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  14  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  15  	TP_STRUCT__entry(
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  16  		__array(	char,	=
	comm,	TASK_COMM_LEN)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  17  		__field(	u64,		=
start	)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  18  		__field(	u64,		=
duration)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  19  		__field(	pid_t,=
		pid	)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  20  	),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  21  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  22  	TP_fast_assign(
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  23  		memcpy(__entry-=
>comm, t->comm, TASK_COMM_LEN);
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  24  		__entry->pid =
=3D t->pid;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  25  		__entry->start =
=3D start;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  26  		__entry->durati=
on =3D duration;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  27  	),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  28  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  29  	TP_printk("%8s:%=
d start %llu.%09u duration %llu ns",
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  30  		__entry->comm,
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  31  		__entry->pid,
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  32  		__print_ns_to_s=
ecs(__entry->start),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  33  		__print_ns_with=
out_secs(__entry->start),
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  34  		__entry->durati=
on)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  35  );
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  36  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5550257824240698935==--

