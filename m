Content-Type: multipart/mixed; boundary="===============6729617433211085734=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 03/13] perf/x86/amd: add AMD Fam19h Branch Sampling support
Date: Wed, 08 Dec 2021 23:22:46 +0800
Message-ID: <202112082317.3QE5iOQk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6729617433211085734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201010217.886919-4-eranian@google.com>
References: <20211201010217.886919-4-eranian@google.com>
TO: Stephane Eranian <eranian@google.com>
TO: linux-kernel(a)vger.kernel.org
CC: peterz(a)infradead.org
CC: kim.phillips(a)amd.com
CC: acme(a)redhat.com
CC: jolsa(a)redhat.com
CC: songliubraving(a)fb.com
CC: mpe(a)ellerman.id.au
CC: maddy(a)linux.ibm.com

Hi Stephane,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/perf/core]
[also build test WARNING on tip/x86/core rafael-pm/linux-next v5.16-rc4 nex=
t-20211207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephane-Eranian/perf-x86-=
amd-Add-AMD-Fam19h-Branch-Sampling-support/20211201-090506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git a9f4a6e=
92b3b319296fb078da2615f618f6cd80c
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c007-20211128 (https://download.01.org/0day-ci/ar=
chive/20211208/202112082317.3QE5iOQk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c6b0817d81501a8bc31ddd706=
7697dba4408d75f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephane-Eranian/perf-x86-amd-Add-=
AMD-Fam19h-Branch-Sampling-support/20211201-090506
        git checkout c6b0817d81501a8bc31ddd7067697dba4408d75f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                          ~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/proc/proc_sysctl.c:1056:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/proc/proc_sysctl.c:1056:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   fs/proc/proc_sysctl.c:1214:3: warning: Value stored to 'link' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1214:3: note: Value stored to 'link' is never read
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   fs/kernfs/dir.c:672:6: warning: Value stored to 'gen' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           u32 gen =3D kernfs_id_gen(id);
               ^~~   ~~~~~~~~~~~~~~~~~
   fs/kernfs/dir.c:672:6: note: Value stored to 'gen' during its initializa=
tion is never read
           u32 gen =3D kernfs_id_gen(id);
               ^~~   ~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   fs/kernfs/symlink.c:76:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s, "../");
                   ^~~~~~
   fs/kernfs/symlink.c:76:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(s, "../");
                   ^~~~~~
   11 warnings generated.
   kernel/sched/core.c:5250:34: warning: Branch condition evaluates to a ga=
rbage value [clang-analyzer-core.uninitialized.Branch]
           if (sched_feat(LATENCY_WARN) && resched_latency)
                                           ^~~~~~~~~~~~~~~
   kernel/sched/core.c:5229:18: note: Loop condition is false.  Exiting loop
           struct rq *rq =3D cpu_rq(cpu);
                           ^
   kernel/sched/sched.h:1365:24: note: expanded from macro 'cpu_rq'
   #define cpu_rq(cpu)             (&per_cpu(runqueues, (cpu)))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/sched/core.c:5233:2: note: 'resched_latency' declared without an =
initial value
           u64 resched_latency;
           ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5244:6: note: Assuming the condition is false
           if (sched_feat(LATENCY_WARN))
               ^
   kernel/sched/sched.h:1964:24: note: expanded from macro 'sched_feat'
   #define sched_feat(x) (sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5244:2: note: Taking false branch
           if (sched_feat(LATENCY_WARN))
           ^
   kernel/sched/core.c:5250:6: note: Assuming the condition is true
           if (sched_feat(LATENCY_WARN) && resched_latency)
               ^
   kernel/sched/sched.h:1964:24: note: expanded from macro 'sched_feat'
   #define sched_feat(x) (sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:5250:6: note: Left side of '&&' is true
           if (sched_feat(LATENCY_WARN) && resched_latency)
               ^
   kernel/sched/sched.h:1964:23: note: expanded from macro 'sched_feat'
   #define sched_feat(x) (sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
                         ^
   kernel/sched/core.c:5250:34: note: Branch condition evaluates to a garba=
ge value
           if (sched_feat(LATENCY_WARN) && resched_latency)
                                           ^~~~~~~~~~~~~~~
   kernel/sched/core.c:6253:3: warning: Value stored to 'rq' is never read =
[clang-analyzer-deadcode.DeadStores]
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6253:3: note: Value stored to 'rq' is never read
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9288:3: warning: Value stored to 'ptr' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ptr =3D (unsigned long)kzalloc(ptr, GFP_NOWAIT);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9288:3: note: Value stored to 'ptr' is never read
                   ptr =3D (unsigned long)kzalloc(ptr, GFP_NOWAIT);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (2 in non-user code, 6 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> arch/x86/events/amd/core.c:682:3: warning: Value stored to 'hwc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:682:3: note: Value stored to 'hwc' is never r=
ead
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   arch/x86/events/amd/ibs.c:669:37: warning: The left operand of '&' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (check_rip && (ibs_data.regs[2] & IBS_RIP_INVALID)) {
                                              ^
   arch/x86/events/amd/ibs.c:720:13: note: Calling 'perf_ibs_handle_irq'
           handled +=3D perf_ibs_handle_irq(&perf_ibs_op, regs);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:587:30: note: Loop condition is false.  Exitin=
g loop
           struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
                                       ^
   include/linux/percpu-defs.h:265:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr)       raw_cpu_ptr(ptr)
                                   ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/x86/events/amd/ibs.c:598:6: note: Assuming the condition is false
           if (!test_bit(IBS_STARTED, pcpu->state)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:598:2: note: Taking false branch
           if (!test_bit(IBS_STARTED, pcpu->state)) {
           ^
   arch/x86/events/amd/ibs.c:612:19: note: Assuming 'event' is non-null
           if (WARN_ON_ONCE(!event))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   arch/x86/events/amd/ibs.c:612:6: note: Taking false branch
           if (WARN_ON_ONCE(!event))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   arch/x86/events/amd/ibs.c:612:2: note: Taking false branch
           if (WARN_ON_ONCE(!event))
           ^
   arch/x86/events/amd/ibs.c:619:6: note: Assuming the condition is false
           if (!(*buf++ & perf_ibs->valid_mask))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:619:2: note: Taking false branch
           if (!(*buf++ & perf_ibs->valid_mask))
           ^
   arch/x86/events/amd/ibs.c:623:2: note: Calling 'perf_ibs_event_update'
           perf_ibs_event_update(perf_ibs, event, config);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:361:2: note: Loop condition is false. Executio=
n continues on line 361
           while (!perf_event_try_update(event, count, 64)) {
           ^
   arch/x86/events/amd/ibs.c:623:2: note: Returning from 'perf_ibs_event_up=
date'
           perf_ibs_event_update(perf_ibs, event, config);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:625:7: note: Calling 'perf_ibs_set_period'
           if (!perf_ibs_set_period(perf_ibs, hwc, &period))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:316:13: note: Calling 'perf_event_set_period'
           overflow =3D perf_event_set_period(hwc, 1<<4, perf_ibs->max_peri=
od, period);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   arch/x86/events/amd/ibs.c:114:6: note: Assuming the condition is true
           if (unlikely(left <=3D -period)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/ibs.c:114:2: note: Taking true branch
           if (unlikely(left <=3D -period)) {
           ^
   arch/x86/events/amd/ibs.c:121:15: note: Assuming 'left' is >=3D 'min'
           if (unlikely(left < (s64)min)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   arch/x86/events/amd/ibs.c:121:15: note: 'left' is >=3D 'min'
           if (unlikely(left < (s64)min)) {
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^

vim +/hwc +682 arch/x86/events/amd/core.c

c6b0817d81501a8 Stephane Eranian 2021-11-30  672  =

c6b0817d81501a8 Stephane Eranian 2021-11-30  673  static void amd_pmu_enabl=
e_all(int added)
c6b0817d81501a8 Stephane Eranian 2021-11-30  674  {
c6b0817d81501a8 Stephane Eranian 2021-11-30  675  	struct cpu_hw_events *cp=
uc =3D this_cpu_ptr(&cpu_hw_events);
c6b0817d81501a8 Stephane Eranian 2021-11-30  676  	struct hw_perf_event *hw=
c;
c6b0817d81501a8 Stephane Eranian 2021-11-30  677  	int idx;
c6b0817d81501a8 Stephane Eranian 2021-11-30  678  =

c6b0817d81501a8 Stephane Eranian 2021-11-30  679  	amd_brs_enable_all();
c6b0817d81501a8 Stephane Eranian 2021-11-30  680  =

c6b0817d81501a8 Stephane Eranian 2021-11-30  681  	for (idx =3D 0; idx < x8=
6_pmu.num_counters; idx++) {
c6b0817d81501a8 Stephane Eranian 2021-11-30 @682  		hwc =3D &cpuc->events[i=
dx]->hw;
c6b0817d81501a8 Stephane Eranian 2021-11-30  683  =

c6b0817d81501a8 Stephane Eranian 2021-11-30  684  		/* only activate events=
 which are marked as active */
c6b0817d81501a8 Stephane Eranian 2021-11-30  685  		if (!test_bit(idx, cpuc=
->active_mask))
c6b0817d81501a8 Stephane Eranian 2021-11-30  686  			continue;
c6b0817d81501a8 Stephane Eranian 2021-11-30  687  =

c6b0817d81501a8 Stephane Eranian 2021-11-30  688  		amd_pmu_enable_event(cp=
uc->events[idx]);
c6b0817d81501a8 Stephane Eranian 2021-11-30  689  	}
c6b0817d81501a8 Stephane Eranian 2021-11-30  690  }
c6b0817d81501a8 Stephane Eranian 2021-11-30  691  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6729617433211085734==--

