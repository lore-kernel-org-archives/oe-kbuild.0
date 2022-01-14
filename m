Content-Type: multipart/mixed; boundary="===============1434914993049318571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC v2] perf: Rewrite core context handling
Date: Sat, 15 Jan 2022 05:48:56 +0800
Message-ID: <202201150516.CCZxTJTq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1434914993049318571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220113134743.1292-1-ravi.bangoria@amd.com>
References: <20220113134743.1292-1-ravi.bangoria@amd.com>
TO: Ravi Bangoria <ravi.bangoria@amd.com>

Hi Ravi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/perf/core]
[also build test WARNING on powerpc/next tip/sched/core v5.16 next-20220114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ravi-Bangoria/perf-Rewrite=
-core-context-handling/20220113-215022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git a9f4a6e=
92b3b319296fb078da2615f618f6cd80c
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archi=
ve/20220115/202201150516.CCZxTJTq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d10219=
78b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/f7cf7134e405062bf0f22c3ba=
5637241c4c4d06a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ravi-Bangoria/perf-Rewrite-core-co=
ntext-handling/20220113-215022
        git checkout f7cf7134e405062bf0f22c3ba5637241c4c4d06a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:3752:2: note: Loop condition is true.  Entering loo=
p body
           while (event_heap.nr) {
           ^
   kernel/events/core.c:3753:9: note: Calling 'merge_sched_in'
                   ret =3D func(*evt, data);
                         ^~~~~~~~~~~~~~~~
   kernel/events/core.c:3792:35: note: Assuming pointer value is null
           struct perf_event_context *ctx =3D event->ctx;
                                            ^~~~~~~~~~
   kernel/events/core.c:3795:6: note: Assuming field 'state' is > PERF_EVEN=
T_STATE_OFF
           if (event->state <=3D PERF_EVENT_STATE_OFF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:3795:2: note: Taking false branch
           if (event->state <=3D PERF_EVENT_STATE_OFF)
           ^
   kernel/events/core.c:3798:6: note: Assuming the condition is true
           if (!event_filter_match(event))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:3798:2: note: Taking true branch
           if (!event_filter_match(event))
           ^
   kernel/events/core.c:3799:3: note: Returning zero, which participates in=
 a condition later
                   return 0;
                   ^~~~~~~~
   kernel/events/core.c:3753:9: note: Returning from 'merge_sched_in'
                   ret =3D func(*evt, data);
                         ^~~~~~~~~~~~~~~~
   kernel/events/core.c:3754:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   kernel/events/core.c:3754:3: note: Taking false branch
                   if (ret)
                   ^
   kernel/events/core.c:3758:3: note: Taking false branch
                   if (*evt)
                   ^
   kernel/events/core.c:3761:4: note: Calling 'min_heap_pop'
                           min_heap_pop(&event_heap, &perf_min_heap);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/min_heap.h:84:16: note: Assuming field 'nr' is > 0
           if (WARN_ONCE(heap->nr <=3D 0, "Popping an empty heap"))
                         ^
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   include/linux/min_heap.h:84:6: note: '__ret_do_once' is false
           if (WARN_ONCE(heap->nr <=3D 0, "Popping an empty heap"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/min_heap.h:84:6: note: Left side of '&&' is false
           if (WARN_ONCE(heap->nr <=3D 0, "Popping an empty heap"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   include/linux/min_heap.h:84:6: note: Taking false branch
           if (WARN_ONCE(heap->nr <=3D 0, "Popping an empty heap"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   include/linux/min_heap.h:84:2: note: Taking false branch
           if (WARN_ONCE(heap->nr <=3D 0, "Popping an empty heap"))
           ^
   include/linux/min_heap.h:90:2: note: Value assigned to 'event_heap.nr', =
which participates in a condition later
           min_heapify(heap, 0, func);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:3761:4: note: Returning from 'min_heap_pop'
                           min_heap_pop(&event_heap, &perf_min_heap);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:3752:2: note: Loop condition is true.  Entering loo=
p body
           while (event_heap.nr) {
           ^
   kernel/events/core.c:3753:14: note: Passing null pointer value via 1st p=
arameter 'event'
                   ret =3D func(*evt, data);
                              ^~~~
   kernel/events/core.c:3753:9: note: Calling 'merge_sched_in'
                   ret =3D func(*evt, data);
                         ^~~~~~~~~~~~~~~~
   kernel/events/core.c:3792:35: note: Access to field 'ctx' results in a d=
ereference of a null pointer (loaded from variable 'event')
           struct perf_event_context *ctx =3D event->ctx;
                                            ^~~~~
>> kernel/events/core.c:4277:2: warning: Value stored to 'task_ctx' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           task_ctx =3D cpuctx->task_ctx;
           ^          ~~~~~~~~~~~~~~~~
   kernel/events/core.c:4277:2: note: Value stored to 'task_ctx' is never r=
ead
           task_ctx =3D cpuctx->task_ctx;
           ^          ~~~~~~~~~~~~~~~~
   kernel/events/core.c:4777:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D -EINVAL;
           ^     ~~~~~~~
   kernel/events/core.c:4777:2: note: Value stored to 'err' is never read
           err =3D -EINVAL;
           ^     ~~~~~~~
   kernel/events/core.c:10439:13: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^
   kernel/events/core.c:10454:39: note: Calling 'perf_event_addr_filters'
           struct perf_addr_filters_head *ifh =3D perf_event_addr_filters(e=
vent);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/perf_event.h:1475:6: note: Assuming field 'parent' is null
           if (event->parent)
               ^~~~~~~~~~~~~
   include/linux/perf_event.h:1475:2: note: Taking false branch
           if (event->parent)
           ^
   include/linux/perf_event.h:1478:2: note: Returning without writing to 'e=
vent->addr_filters.nr_file_filters', which participates in a condition later
           return ifh;
           ^
   kernel/events/core.c:10454:39: note: Returning from 'perf_event_addr_fil=
ters'
           struct perf_addr_filters_head *ifh =3D perf_event_addr_filters(e=
vent);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   kernel/events/core.c:10455:29: note: Left side of '||' is false
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
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
   kernel/events/core.c:10455:29: note: Left side of '||' is false
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
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
   kernel/events/core.c:10455:29: note: Left side of '||' is true
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
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
   kernel/events/core.c:10455:29: note: Taking false branch
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/events/core.c:10455:29: note: Loop condition is false.  Exiting l=
oop
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \

vim +/task_ctx +4277 kernel/events/core.c

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4257  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4258  sta=
tic bool perf_rotate_context(struct perf_cpu_pmu_context *cpc)
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4259  {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4260  	st=
ruct perf_cpu_context *cpuctx =3D this_cpu_ptr(&cpu_context);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4261  	st=
ruct perf_event_pmu_context *cpu_epc, *task_epc =3D NULL;
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4262  	st=
ruct perf_event *cpu_event =3D NULL, *task_event =3D NULL;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01  4263  	st=
ruct perf_event_context *task_ctx =3D NULL;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01  4264  	in=
t cpu_rotate, task_rotate;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4265  	st=
ruct pmu *pmu;
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4266  =

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4267  	/*
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4268  	 *=
 Since we run this from IRQ context, nobody can install new
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4269  	 *=
 events, thus the event count values are stable.
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4270  	 */
7fc23a53807970 kernel/perf_counter.c Peter Zijlstra   2009-05-08  4271  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4272  	cp=
u_epc =3D &cpc->epc;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4273  	pm=
u =3D cpu_epc->pmu;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4274  	ta=
sk_epc =3D cpc->task_epc;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4275  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4276  	cp=
u_rotate =3D cpu_epc->rotate_necessary;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01 @4277  	ta=
sk_ctx =3D cpuctx->task_ctx;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4278  	ta=
sk_rotate =3D task_epc ? task_epc->rotate_necessary : 0;
9717e6cd3db22e kernel/perf_event.c   Peter Zijlstra   2010-01-28  4279  =

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4280  	if=
 (!(cpu_rotate || task_rotate))
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4281  		r=
eturn false;
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4282  =

facc43071cc0d4 kernel/events/core.c  Peter Zijlstra   2011-04-09  4283  	pe=
rf_ctx_lock(cpuctx, cpuctx->task_ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4284  	pe=
rf_pmu_disable(pmu);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4285  =

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4286  	if=
 (task_rotate)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4287  		t=
ask_event =3D ctx_event_to_rotate(task_epc);
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4288  	if=
 (cpu_rotate)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4289  		c=
pu_event =3D ctx_event_to_rotate(cpu_epc);
8703a7cfe148f7 kernel/events/core.c  Peter Zijlstra   2017-11-13  4290  =

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4291  	/*
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4292  	 *=
 As per the order given at ctx_resched() first 'pop' task flexible
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4293  	 *=
 and then, if needed CPU flexible.
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4294  	 */
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4295  	if=
 (task_event || (task_epc && cpu_event)) {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4296  		u=
pdate_context_time(task_epc->ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4297  		_=
_pmu_ctx_sched_out(task_epc, EVENT_FLEXIBLE);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4298  	}
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar      2008-12-21  4299  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4300  	if=
 (cpu_event) {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4301  		u=
pdate_context_time(&cpuctx->ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4302  		_=
_pmu_ctx_sched_out(cpu_epc, EVENT_FLEXIBLE);
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4303  		r=
otate_ctx(&cpuctx->ctx, cpu_event);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4304  		_=
_pmu_ctx_sched_in(&cpuctx->ctx, pmu);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4305  	}
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner  2008-12-04  4306  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4307  	if=
 (task_event)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4308  		r=
otate_ctx(task_epc->ctx, task_event);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4309  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4310  	if=
 (task_event || (task_epc && cpu_event))
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4311  		_=
_pmu_ctx_sched_in(task_epc->ctx, pmu);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4312  =

f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4313  	pe=
rf_pmu_enable(pmu);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4314  	pe=
rf_ctx_unlock(cpuctx, cpuctx->task_ctx);
9e6302056f8029 kernel/events/core.c  Stephane Eranian 2013-04-03  4315  =

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4316  	re=
turn true;
e9d2b064149ff7 kernel/perf_event.c   Peter Zijlstra   2010-09-17  4317  }
e9d2b064149ff7 kernel/perf_event.c   Peter Zijlstra   2010-09-17  4318  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1434914993049318571==--

