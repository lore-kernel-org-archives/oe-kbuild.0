Content-Type: multipart/mixed; boundary="===============2568433128822794356=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15 5484/5549] fs/proc/task_mmu.c:964:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 25 Mar 2022 14:42:34 +0800
Message-ID: <202203251403.lFJXoAYX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2568433128822794356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Michel Lespinasse <michel@lespinasse.org>
CC: Todd Kjos <tkjos@google.com>
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.15
head:   928b638950a7caa5615fd2255d8543dc57bcd493
commit: 67cc8ce9a649a8407c8e815d03b88761c4ddfe67 [5484/5549] FROMLIST: mm: =
rcu safe vma freeing
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20325/202203251403.lFJXoAYX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/67cc8ce9a649a84=
07c8e815d03b88761c4ddfe67
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.15
        git checkout 67cc8ce9a649a8407c8e815d03b88761c4ddfe67
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:285:2: note: Taking false branch
           if (flags & CLONE_NEWNET)
           ^
   kernel/nsproxy.c:289:6: note: Assuming the condition is false
           if (flags & CLONE_NEWTIME)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:289:2: note: Taking false branch
           if (flags & CLONE_NEWTIME)
           ^
   kernel/nsproxy.c:293:2: note: Returning zero, which participates in a co=
ndition later
           return 0;
           ^~~~~~~~
   kernel/nsproxy.c:544:9: note: Returning from 'check_setns_flags'
                   err =3D check_setns_flags(flags);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:548:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:548:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:551:8: note: Calling 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:317:6: note: Calling 'IS_ERR'
           if (IS_ERR(nsset->nsproxy))
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:317:6: note: Returning from 'IS_ERR'
           if (IS_ERR(nsset->nsproxy))
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:317:2: note: Taking true branch
           if (IS_ERR(nsset->nsproxy))
           ^
   kernel/nsproxy.c:318:3: note: Returning value, which participates in a c=
ondition later
                   return PTR_ERR(nsset->nsproxy);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:551:8: note: Returning from 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:552:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:552:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:555:6: note: Assuming the condition is true
           if (proc_ns_file(file))
               ^~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:555:2: note: Taking true branch
           if (proc_ns_file(file))
           ^
   kernel/nsproxy.c:556:29: note: Passing null pointer value via 2nd parame=
ter 'ns'
                   err =3D validate_ns(&nsset, ns);
                                             ^~
   kernel/nsproxy.c:556:9: note: Calling 'validate_ns'
                   err =3D validate_ns(&nsset, ns);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:346:9: note: Access to field 'ops' results in a derefer=
ence of a null pointer (loaded from variable 'ns')
           return ns->ops->install(nsset, ns);
                  ^~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/proc/task_mmu.c:964:28: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           show_vma_header_prefix(m, priv->mm->mmap->vm_start,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:878:6: note: Assuming field 'task' is non-null
           if (!priv->task)
               ^~~~~~~~~~~
   fs/proc/task_mmu.c:878:2: note: Taking false branch
           if (!priv->task)
           ^
   fs/proc/task_mmu.c:882:6: note: Assuming 'mm' is non-null
           if (!mm || !mmget_not_zero(mm)) {
               ^~~
   fs/proc/task_mmu.c:882:6: note: Left side of '||' is false
   fs/proc/task_mmu.c:882:14: note: Calling 'mmget_not_zero'
           if (!mm || !mmget_not_zero(mm)) {
                       ^~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:75:9: note: Calling 'atomic_inc_not_zero'
           return atomic_inc_not_zero(&mm->mm_users);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:578:9: note: Calling 'arch_at=
omic_inc_not_zero'
           return arch_atomic_inc_not_zero(v);
                  ^
   include/linux/atomic/atomic-arch-fallback.h:1201:34: note: expanded from=
 macro 'arch_atomic_inc_not_zero'
   #define arch_atomic_inc_not_zero arch_atomic_inc_not_zero
                                    ^
   include/linux/atomic/atomic-arch-fallback.h:1199:9: note: Calling 'arch_=
atomic_add_unless'
           return arch_atomic_add_unless(v, 1, 0);
                  ^
   include/linux/atomic/atomic-arch-fallback.h:1185:32: note: expanded from=
 macro 'arch_atomic_add_unless'
   #define arch_atomic_add_unless arch_atomic_add_unless
                                  ^
   include/linux/atomic/atomic-arch-fallback.h:1183:9: note: Assuming the c=
ondition is true
           return arch_atomic_fetch_add_unless(v, a, u) !=3D u;
                  ^
   include/linux/atomic/atomic-arch-fallback.h:1167:38: note: expanded from=
 macro 'arch_atomic_fetch_add_unless'
   #define arch_atomic_fetch_add_unless arch_atomic_fetch_add_unless
                                        ^
   include/linux/atomic/atomic-arch-fallback.h:1183:2: note: Returning the =
value 1, which participates in a condition later
           return arch_atomic_fetch_add_unless(v, a, u) !=3D u;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:1199:9: note: Returning from=
 'arch_atomic_add_unless'
           return arch_atomic_add_unless(v, 1, 0);
                  ^
   include/linux/atomic/atomic-arch-fallback.h:1185:32: note: expanded from=
 macro 'arch_atomic_add_unless'
   #define arch_atomic_add_unless arch_atomic_add_unless
                                  ^
   include/linux/atomic/atomic-arch-fallback.h:1199:2: note: Returning the =
value 1, which participates in a condition later
           return arch_atomic_add_unless(v, 1, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:578:9: note: Returning from '=
arch_atomic_inc_not_zero'
           return arch_atomic_inc_not_zero(v);
                  ^
   include/linux/atomic/atomic-arch-fallback.h:1201:34: note: expanded from=
 macro 'arch_atomic_inc_not_zero'
   #define arch_atomic_inc_not_zero arch_atomic_inc_not_zero
                                    ^
   include/linux/atomic/atomic-instrumented.h:578:2: note: Returning the va=
lue 1, which participates in a condition later
           return arch_atomic_inc_not_zero(v);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:75:9: note: Returning from 'atomic_inc_not_zero'
           return atomic_inc_not_zero(&mm->mm_users);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched/mm.h:75:2: note: Returning the value 1, which partic=
ipates in a condition later
           return atomic_inc_not_zero(&mm->mm_users);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:882:14: note: Returning from 'mmget_not_zero'
           if (!mm || !mmget_not_zero(mm)) {
                       ^~~~~~~~~~~~~~~~~~
   fs/proc/task_mmu.c:882:2: note: Taking false branch
           if (!mm || !mmget_not_zero(mm)) {
           ^
   fs/proc/task_mmu.c:889:8: note: Calling 'mmap_read_lock_killable'
           ret =3D mmap_read_lock_killable(mm);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:179:2: note: Calling '__mmap_lock_trace_start_=
locking'
           __mmap_lock_trace_start_locking(mm, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:36:2: note: Taking false branch
           if (tracepoint_enabled(mmap_lock_start_locking))
           ^
   include/linux/mmap_lock.h:38:1: note: Returning without writing to 'mm->=
.mmap', which participates in a condition later
   }
   ^
   include/linux/mmap_lock.h:38:1: note: Returning without writing to 'mm->=
.mmap'
   include/linux/mmap_lock.h:179:2: note: Returning from '__mmap_lock_trace=
_start_locking'
           __mmap_lock_trace_start_locking(mm, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:180:10: note: Value assigned to field 'mmap', =
which participates in a condition later
           error =3D down_read_killable(&mm->mmap_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:180:10: note: Value assigned to field 'mmap'
           error =3D down_read_killable(&mm->mmap_lock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:181:48: note: Assuming 'error' is 0, which par=
ticipates in a condition later
           __mmap_lock_trace_acquire_returned(mm, false, !error);
                                                         ^~~~~~
   include/linux/mmap_lock.h:181:2: note: Calling '__mmap_lock_trace_acquir=
e_returned'
           __mmap_lock_trace_acquire_returned(mm, false, !error);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmap_lock.h:43:2: note: Taking false branch
           if (tracepoint_enabled(mmap_lock_acquire_returned))
           ^
--
                   ^
   fs/gfs2/super.c:371:10: note: Loop condition is false.  Exiting loop
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   fs/gfs2/super.c:374:3: note: Memory is released
                   kfree(lfcc);
                   ^~~~~~~~~~~
   fs/gfs2/super.c:370:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&list)) {
           ^
   fs/gfs2/super.c:371:10: note: Left side of '&&' is false
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/gfs2/super.c:371:10: note: Taking false branch
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   fs/gfs2/super.c:371:10: note: Loop condition is false.  Exiting loop
                   lfcc =3D list_first_entry(&list, struct lfcc, list);
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   fs/gfs2/super.c:372:3: note: Calling 'list_del'
                   list_del(&lfcc->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> arch/x86/mm/pat/memtype.c:1098:24: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
   arch/x86/mm/pat/memtype.c:1092:6: note: Assuming 'vma' is null
           if (vma && !(vma->vm_flags & VM_PAT))
               ^~~
   arch/x86/mm/pat/memtype.c:1092:10: note: Left side of '&&' is false
           if (vma && !(vma->vm_flags & VM_PAT))
                   ^
   arch/x86/mm/pat/memtype.c:1097:6: note: Assuming 'paddr' is 0
           if (!paddr && !size) {
               ^~~~~~
   arch/x86/mm/pat/memtype.c:1097:6: note: Left side of '&&' is true
   arch/x86/mm/pat/memtype.c:1097:16: note: Assuming 'size' is 0
           if (!paddr && !size) {
                         ^~~~~
   arch/x86/mm/pat/memtype.c:1097:2: note: Taking true branch
           if (!paddr && !size) {
           ^
   arch/x86/mm/pat/memtype.c:1098:24: note: Dereference of null pointer
                   if (follow_phys(vma, vma->vm_start, 0, &prot, &paddr)) {
                                        ^~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/skbuff.h:2067:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   drivers/block/aoe/aoechr.c:164:2: note: Control jumps to 'case MINOR_REV=
ALIDATE:'  at line 174
           switch ((unsigned long) filp->private_data) {
           ^
   drivers/block/aoe/aoechr.c:175:9: note: Calling 'revalidate'
                   ret =3D revalidate(buf, cnt);
                         ^~~~~~~~~~~~~~~~~~~~
   drivers/block/aoe/aoechr.c:88:6: note: Assuming the condition is false
           if (size >=3D sizeof buf)
               ^~~~~~~~~~~~~~~~~~
   drivers/block/aoe/aoechr.c:88:2: note: Taking false branch
           if (size >=3D sizeof buf)
           ^
   drivers/block/aoe/aoechr.c:91:6: note: Assuming the condition is false
           if (copy_from_user(buf, str, size))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/aoe/aoechr.c:91:2: note: Taking false branch
           if (copy_from_user(buf, str, size))
           ^
   drivers/block/aoe/aoechr.c:95:6: note: Assuming 'n' is equal to 2
           if (n !=3D 2) {
               ^~~~~~
   drivers/block/aoe/aoechr.c:95:2: note: Taking false branch
           if (n !=3D 2) {
           ^
   drivers/block/aoe/aoechr.c:100:6: note: Assuming 'd' is non-null
           if (!d)
               ^~
   drivers/block/aoe/aoechr.c:100:2: note: Taking false branch
           if (!d)
           ^
   drivers/block/aoe/aoechr.c:102:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&d->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/block/aoe/aoechr.c:102:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_irqsave(&d->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/block/aoe/aoechr.c:111:6: note: Assuming 'skb' is non-null
           if (!skb && !msleep_interruptible(250)) {
               ^~~~
   drivers/block/aoe/aoechr.c:111:11: note: Left side of '&&' is false

vim +964 fs/proc/task_mmu.c

258f669e7e88c1 Vlastimil Babka       2018-08-21  867  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  868  static int show_smaps=
_rollup(struct seq_file *m, void *v)
258f669e7e88c1 Vlastimil Babka       2018-08-21  869  {
258f669e7e88c1 Vlastimil Babka       2018-08-21  870  	struct proc_maps_pri=
vate *priv =3D m->private;
258f669e7e88c1 Vlastimil Babka       2018-08-21  871  	struct mem_size_stat=
s mss;
258f669e7e88c1 Vlastimil Babka       2018-08-21  872  	struct mm_struct *mm;
258f669e7e88c1 Vlastimil Babka       2018-08-21  873  	struct vm_area_struc=
t *vma;
258f669e7e88c1 Vlastimil Babka       2018-08-21  874  	unsigned long last_v=
ma_end =3D 0;
258f669e7e88c1 Vlastimil Babka       2018-08-21  875  	int ret =3D 0;
258f669e7e88c1 Vlastimil Babka       2018-08-21  876  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  877  	priv->task =3D get_p=
roc_task(priv->inode);
258f669e7e88c1 Vlastimil Babka       2018-08-21  878  	if (!priv->task)
258f669e7e88c1 Vlastimil Babka       2018-08-21  879  		return -ESRCH;
258f669e7e88c1 Vlastimil Babka       2018-08-21  880  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  881  	mm =3D priv->mm;
258f669e7e88c1 Vlastimil Babka       2018-08-21  882  	if (!mm || !mmget_no=
t_zero(mm)) {
258f669e7e88c1 Vlastimil Babka       2018-08-21  883  		ret =3D -ESRCH;
258f669e7e88c1 Vlastimil Babka       2018-08-21  884  		goto out_put_task;
258f669e7e88c1 Vlastimil Babka       2018-08-21  885  	}
258f669e7e88c1 Vlastimil Babka       2018-08-21  886  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  887  	memset(&mss, 0, size=
of(mss));
258f669e7e88c1 Vlastimil Babka       2018-08-21  888  =

d8ed45c5dcd455 Michel Lespinasse     2020-06-08  889  	ret =3D mmap_read_lo=
ck_killable(mm);
a26a9781554857 Konstantin Khlebnikov 2019-07-11  890  	if (ret)
a26a9781554857 Konstantin Khlebnikov 2019-07-11  891  		goto out_put_mm;
a26a9781554857 Konstantin Khlebnikov 2019-07-11  892  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  893  	hold_task_mempolicy(=
priv);
258f669e7e88c1 Vlastimil Babka       2018-08-21  894  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  895  	for (vma =3D priv->m=
m->mmap; vma;) {
03b4b1149308b0 Chinwen Chang         2020-10-13  896  		smap_gather_stats(v=
ma, &mss, 0);
258f669e7e88c1 Vlastimil Babka       2018-08-21  897  		last_vma_end =3D vm=
a->vm_end;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  898  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  899  		/*
ff9f47f6f00cfe Chinwen Chang         2020-10-13  900  		 * Release mmap_loc=
k temporarily if someone wants to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  901  		 * access it for wr=
ite request.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  902  		 */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  903  		if (mmap_lock_is_co=
ntended(mm)) {
ff9f47f6f00cfe Chinwen Chang         2020-10-13  904  			mmap_read_unlock(m=
m);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  905  			ret =3D mmap_read_=
lock_killable(mm);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  906  			if (ret) {
ff9f47f6f00cfe Chinwen Chang         2020-10-13  907  				release_task_memp=
olicy(priv);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  908  				goto out_put_mm;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  909  			}
ff9f47f6f00cfe Chinwen Chang         2020-10-13  910  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  911  			/*
ff9f47f6f00cfe Chinwen Chang         2020-10-13  912  			 * After dropping =
the lock, there are four cases to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  913  			 * consider. See t=
he following example for explanation.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  914  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  915  			 *   +------+-----=
-+-----------+
ff9f47f6f00cfe Chinwen Chang         2020-10-13  916  			 *   | VMA1 | VMA2=
 | VMA3      |
ff9f47f6f00cfe Chinwen Chang         2020-10-13  917  			 *   +------+-----=
-+-----------+
ff9f47f6f00cfe Chinwen Chang         2020-10-13  918  			 *   |      |     =
 |           |
ff9f47f6f00cfe Chinwen Chang         2020-10-13  919  			 *  4k     8k     =
16k         400k
ff9f47f6f00cfe Chinwen Chang         2020-10-13  920  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  921  			 * Suppose we drop=
 the lock after reading VMA2 due to
ff9f47f6f00cfe Chinwen Chang         2020-10-13  922  			 * contention, the=
n we get:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  923  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  924  			 *	last_vma_end =
=3D 16k
ff9f47f6f00cfe Chinwen Chang         2020-10-13  925  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  926  			 * 1) VMA2 is free=
d, but VMA3 exists:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  927  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  928  			 *    find_vma(mm,=
 16k - 1) will return VMA3.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  929  			 *    In this case=
, just continue from VMA3.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  930  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  931  			 * 2) VMA2 still e=
xists:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  932  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  933  			 *    find_vma(mm,=
 16k - 1) will return VMA2.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  934  			 *    Iterate the =
loop like the original one.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  935  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  936  			 * 3) No more VMAs=
 can be found:
ff9f47f6f00cfe Chinwen Chang         2020-10-13  937  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  938  			 *    find_vma(mm,=
 16k - 1) will return NULL.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  939  			 *    No more thin=
gs to do, just break.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  940  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  941  			 * 4) (last_vma_en=
d - 1) is the middle of a vma (VMA'):
ff9f47f6f00cfe Chinwen Chang         2020-10-13  942  			 *
ff9f47f6f00cfe Chinwen Chang         2020-10-13  943  			 *    find_vma(mm,=
 16k - 1) will return VMA' whose range
ff9f47f6f00cfe Chinwen Chang         2020-10-13  944  			 *    contains las=
t_vma_end.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  945  			 *    Iterate VMA'=
 from last_vma_end.
ff9f47f6f00cfe Chinwen Chang         2020-10-13  946  			 */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  947  			vma =3D find_vma(m=
m, last_vma_end - 1);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  948  			/* Case 3 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  949  			if (!vma)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  950  				break;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  951  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  952  			/* Case 1 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  953  			if (vma->vm_start =
>=3D last_vma_end)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  954  				continue;
ff9f47f6f00cfe Chinwen Chang         2020-10-13  955  =

ff9f47f6f00cfe Chinwen Chang         2020-10-13  956  			/* Case 4 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  957  			if (vma->vm_end > =
last_vma_end)
ff9f47f6f00cfe Chinwen Chang         2020-10-13  958  				smap_gather_stats=
(vma, &mss, last_vma_end);
ff9f47f6f00cfe Chinwen Chang         2020-10-13  959  		}
ff9f47f6f00cfe Chinwen Chang         2020-10-13  960  		/* Case 2 above */
ff9f47f6f00cfe Chinwen Chang         2020-10-13  961  		vma =3D vma->vm_nex=
t;
258f669e7e88c1 Vlastimil Babka       2018-08-21  962  	}
258f669e7e88c1 Vlastimil Babka       2018-08-21  963  =

258f669e7e88c1 Vlastimil Babka       2018-08-21 @964  	show_vma_header_pref=
ix(m, priv->mm->mmap->vm_start,
258f669e7e88c1 Vlastimil Babka       2018-08-21  965  			       last_vma_en=
d, 0, 0, 0, 0);
258f669e7e88c1 Vlastimil Babka       2018-08-21  966  	seq_pad(m, ' ');
258f669e7e88c1 Vlastimil Babka       2018-08-21  967  	seq_puts(m, "[rollup=
]\n");
258f669e7e88c1 Vlastimil Babka       2018-08-21  968  =

ee2ad71b0756e9 Luigi Semenzato       2019-07-11  969  	__show_smap(m, &mss,=
 true);
258f669e7e88c1 Vlastimil Babka       2018-08-21  970  =

258f669e7e88c1 Vlastimil Babka       2018-08-21  971  	release_task_mempoli=
cy(priv);
d8ed45c5dcd455 Michel Lespinasse     2020-06-08  972  	mmap_read_unlock(mm);
258f669e7e88c1 Vlastimil Babka       2018-08-21  973  =

a26a9781554857 Konstantin Khlebnikov 2019-07-11  974  out_put_mm:
a26a9781554857 Konstantin Khlebnikov 2019-07-11  975  	mmput(mm);
258f669e7e88c1 Vlastimil Babka       2018-08-21  976  out_put_task:
258f669e7e88c1 Vlastimil Babka       2018-08-21  977  	put_task_struct(priv=
->task);
258f669e7e88c1 Vlastimil Babka       2018-08-21  978  	priv->task =3D NULL;
258f669e7e88c1 Vlastimil Babka       2018-08-21  979  =

493b0e9d945fa9 Daniel Colascione     2017-09-06  980  	return ret;
e070ad49f31155 Mauricio Lin          2005-09-03  981  }
d1be35cb6f9697 Andrei Vagin          2018-04-10  982  #undef SEQ_PUT_DEC
e070ad49f31155 Mauricio Lin          2005-09-03  983  =


:::::: The code at line 964 was first introduced by commit
:::::: 258f669e7e88c18edbc23fe5ce00a476b924551f mm: /proc/pid/smaps_rollup:=
 convert to single value seq_file

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2568433128822794356==--

