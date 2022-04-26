Content-Type: multipart/mixed; boundary="===============5271996479602043782=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 942/9999] kernel/bpf/bpf_struct_ops.c:30:8: warning: Excessive padding in 'struct bpf_struct_ops_map' (32 padding bytes, where 0 is optimal).
Date: Wed, 27 Apr 2022 05:39:10 +0800
Message-ID: <202204270543.deNjXy1k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5271996479602043782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: 372b24bad2a8e7994d0360c870f6e981e3f4bb8f [942/9999] ANDROID: GKI: A=
dd OEM data to mutex/rwsem
:::::: branch date: 4 weeks ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220425 (https://download.01.org/0day-ci/archi=
ve/20220427/202204270543.deNjXy1k-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/372b24bad2a8e79=
94d0360c870f6e981e3f4bb8f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 372b24bad2a8e7994d0360c870f6e981e3f4bb8f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:517:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/dma/sf-pdma/sf-pdma.c:59:6: warning: Access to field 'desc' resu=
lts in a dereference of a null pointer (loaded from variable 'chan') [clang=
-analyzer-core.NullDereference]
           if (chan->desc && !chan->desc->in_use) {
               ^
   drivers/dma/sf-pdma/sf-pdma.c:95:30: note: Calling 'to_sf_pdma_chan'
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Left side of '&&' is false
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Taking false branch
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:303:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/dma/sf-pdma/sf-pdma.c:44:9: note: Loop condition is false.  Exit=
ing loop
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
                  ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:301:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/dma/sf-pdma/sf-pdma.c:44:2: note: Returning pointer, which parti=
cipates in a condition later
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:44:2: note: Returning pointer
           return container_of(dchan, struct sf_pdma_chan, vchan.chan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:95:30: note: Returning from 'to_sf_pdma_ch=
an'
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:95:2: note: 'chan' initialized here
           struct sf_pdma_chan *chan =3D to_sf_pdma_chan(dchan);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:98:6: note: Assuming 'chan' is null
           if (chan && (!len || !dest || !src)) {
               ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:98:11: note: Left side of '&&' is false
           if (chan && (!len || !dest || !src)) {
                    ^
   drivers/dma/sf-pdma/sf-pdma.c:104:28: note: Passing null pointer value v=
ia 1st parameter 'chan'
           desc =3D sf_pdma_alloc_desc(chan);
                                     ^~~~
   drivers/dma/sf-pdma/sf-pdma.c:104:9: note: Calling 'sf_pdma_alloc_desc'
           desc =3D sf_pdma_alloc_desc(chan);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:57:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/sf-pdma/sf-pdma.c:57:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/sf-pdma/sf-pdma.c:59:6: note: Access to field 'desc' results=
 in a dereference of a null pointer (loaded from variable 'chan')
           if (chan->desc && !chan->desc->in_use) {
               ^~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> kernel/bpf/bpf_struct_ops.c:30:8: warning: Excessive padding in 'struct =
bpf_struct_ops_map' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   map, =

   lock, =

   st_ops, =

   progs, =

   image, =

   uvalue, =

   kvalue, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bpf_struct_ops_map {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c:30:8: note: Excessive padding in 'struct bpf=
_struct_ops_map' (32 padding bytes, where 0 is optimal). Optimal fields ord=
er: map, lock, st_ops, progs, image, uvalue, kvalue, consider reordering th=
e fields or adding explicit padding members
   struct bpf_struct_ops_map {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   kernel/events/core.c:3700:35: warning: Access to field 'ctx' results in =
a dereference of a null pointer (loaded from variable 'event') [clang-analy=
zer-core.NullDereference]
           struct perf_event_context *ctx =3D event->ctx;
                                            ^
   kernel/events/core.c:13112:2: note: Calling 'perf_cgroup_switch'
           perf_cgroup_switch(task, PERF_CGROUP_SWOUT | PERF_CGROUP_SWIN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:812:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:202:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:158:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   kernel/events/core.c:812:2: note: Assuming the condition is false
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:203:7: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:812:2: note: Taking false branch
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:203:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   kernel/events/core.c:812:2: note: Loop condition is false.  Exiting loop
           local_irq_save(flags);
           ^
   include/linux/irqflags.h:201:2: note: expanded from macro 'local_irq_sav=
e'
           do {                                            \
           ^
   kernel/events/core.c:814:9: note: Loop condition is false.  Exiting loop
           list =3D this_cpu_ptr(&cgrp_cpuctx_list);
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
   kernel/events/core.c:815:2: note: Left side of '&&' is false
           list_for_each_entry(cpuctx, list, cgrp_cpuctx_entry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   kernel/events/core.c:815:2: note: Taking false branch
           list_for_each_entry(cpuctx, list, cgrp_cpuctx_entry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'

vim +30 kernel/bpf/bpf_struct_ops.c

85d33df357b6346 Martin KaFai Lau 2020-01-08  29  =

85d33df357b6346 Martin KaFai Lau 2020-01-08 @30  struct bpf_struct_ops_map {
85d33df357b6346 Martin KaFai Lau 2020-01-08  31  	struct bpf_map map;
85d33df357b6346 Martin KaFai Lau 2020-01-08  32  	const struct bpf_struct_o=
ps *st_ops;
85d33df357b6346 Martin KaFai Lau 2020-01-08  33  	/* protect map_update */
85d33df357b6346 Martin KaFai Lau 2020-01-08  34  	struct mutex lock;
85d33df357b6346 Martin KaFai Lau 2020-01-08  35  	/* progs has all the bpf_=
prog that is populated
85d33df357b6346 Martin KaFai Lau 2020-01-08  36  	 * to the func ptr of the=
 kernel's struct
85d33df357b6346 Martin KaFai Lau 2020-01-08  37  	 * (in kvalue.data).
85d33df357b6346 Martin KaFai Lau 2020-01-08  38  	 */
85d33df357b6346 Martin KaFai Lau 2020-01-08  39  	struct bpf_prog **progs;
85d33df357b6346 Martin KaFai Lau 2020-01-08  40  	/* image is a page that h=
as all the trampolines
85d33df357b6346 Martin KaFai Lau 2020-01-08  41  	 * that stores the func a=
rgs before calling the bpf_prog.
85d33df357b6346 Martin KaFai Lau 2020-01-08  42  	 * A PAGE_SIZE "image" is=
 enough to store all trampoline for
85d33df357b6346 Martin KaFai Lau 2020-01-08  43  	 * "progs[]".
85d33df357b6346 Martin KaFai Lau 2020-01-08  44  	 */
85d33df357b6346 Martin KaFai Lau 2020-01-08  45  	void *image;
85d33df357b6346 Martin KaFai Lau 2020-01-08  46  	/* uvalue->data stores th=
e kernel struct
85d33df357b6346 Martin KaFai Lau 2020-01-08  47  	 * (e.g. tcp_congestion_o=
ps) that is more useful
85d33df357b6346 Martin KaFai Lau 2020-01-08  48  	 * to userspace than the =
kvalue.  For example,
85d33df357b6346 Martin KaFai Lau 2020-01-08  49  	 * the bpf_prog's id is s=
tored instead of the kernel
85d33df357b6346 Martin KaFai Lau 2020-01-08  50  	 * address of a func ptr.
85d33df357b6346 Martin KaFai Lau 2020-01-08  51  	 */
85d33df357b6346 Martin KaFai Lau 2020-01-08  52  	struct bpf_struct_ops_val=
ue *uvalue;
85d33df357b6346 Martin KaFai Lau 2020-01-08  53  	/* kvalue.data stores the=
 actual kernel's struct
85d33df357b6346 Martin KaFai Lau 2020-01-08  54  	 * (e.g. tcp_congestion_o=
ps) that will be
85d33df357b6346 Martin KaFai Lau 2020-01-08  55  	 * registered to the kern=
el subsystem.
85d33df357b6346 Martin KaFai Lau 2020-01-08  56  	 */
85d33df357b6346 Martin KaFai Lau 2020-01-08  57  	struct bpf_struct_ops_val=
ue kvalue;
85d33df357b6346 Martin KaFai Lau 2020-01-08  58  };
85d33df357b6346 Martin KaFai Lau 2020-01-08  59  =


:::::: The code at line 30 was first introduced by commit
:::::: 85d33df357b634649ddbe0a20fd2d0fc5732c3cb bpf: Introduce BPF_MAP_TYPE=
_STRUCT_OPS

:::::: TO: Martin KaFai Lau <kafai@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5271996479602043782==--

