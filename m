Content-Type: multipart/mixed; boundary="===============8406424680546239317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kcsan/debugfs.c:65:36: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 08 Jun 2022 06:37:36 +0800
Message-ID: <202206080602.zHPLDPOz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8406424680546239317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/kcsan/debugfs.c:65:36: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: e37b3dd063a1a68e28a7cfaf77c84c472112e330 s390: enable KCSAN
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-c005-20220606 (https://download.01.org/0day-ci/arch=
ive/20220608/202206080602.zHPLDPOz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436=
efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De37b3dd063a1a68e28a7cfaf77c84c472112e330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e37b3dd063a1a68e28a7cfaf77c84c472112e330
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           int mode =3D current->seccomp.mode;
                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:1324:13: note: Dereference of null pointer
           int mode =3D current->seccomp.mode;
                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:1348:9: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
           return current->seccomp.mode;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:1348:9: note: Dereference of null pointer
           return current->seccomp.mode;
                  ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:1363:17: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           spin_lock_irq(&current->sighand->siglock);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:1988:1: note: Calling '__do_sys_seccomp'
   SYSCALL_DEFINE3(seccomp, unsigned int, op, unsigned int, flags,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/syscall_wrapper.h:157:14: note: expanded from macr=
o '__SYSCALL_DEFINEx'
                   long ret =3D __do_sys##name(SYSCALL_PT_ARGS(x, regs,    =
                  \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   note: expanded from here
   kernel/seccomp.c:1991:9: note: Calling 'do_seccomp'
           return do_seccomp(op, flags, uargs);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/seccomp.c:1966:2: note: Control jumps to 'case 0:'  at line 1967
           switch (op) {
           ^
   kernel/seccomp.c:1968:7: note: Assuming 'flags' is equal to 0
                   if (flags !=3D 0 || uargs !=3D NULL)
                       ^~~~~~~~~~
   kernel/seccomp.c:1968:7: note: Left side of '||' is false
   kernel/seccomp.c:1968:21: note: Assuming 'uargs' is equal to NULL
                   if (flags !=3D 0 || uargs !=3D NULL)
                                     ^~~~~~~~~~~~~
   kernel/seccomp.c:1968:3: note: Taking false branch
                   if (flags !=3D 0 || uargs !=3D NULL)
                   ^
   kernel/seccomp.c:1970:10: note: Calling 'seccomp_set_mode_strict'
                   return seccomp_set_mode_strict();
                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/seccomp.c:1363:17: note: Dereference of null pointer
           spin_lock_irq(&current->sighand->siglock);
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/seccomp.c:2306:14: warning: Value stored to 'new' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *new =3D names;
                       ^~~   ~~~~~
   kernel/seccomp.c:2306:14: note: Value stored to 'new' during its initial=
ization is never read
           const char *new =3D names;
                       ^~~   ~~~~~
   kernel/seccomp.c:2307:14: warning: Value stored to 'old' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           const char *old =3D old_names;
                       ^~~   ~~~~~~~~~
   kernel/seccomp.c:2307:14: note: Value stored to 'old' during its initial=
ization is never read
           const char *old =3D old_names;
                       ^~~   ~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> kernel/kcsan/debugfs.c:65:36: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           const struct kcsan_ctx ctx_save =3D current->kcsan_ctx;
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/kcsan/debugfs.c:228:17: note: Assuming the condition is false
           int read_len =3D count < (sizeof(kbuf) - 1) ? count : (sizeof(kb=
uf) - 1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/debugfs.c:228:17: note: '?' condition is false
   kernel/kcsan/debugfs.c:230:2: note: Taking false branch
           if (copy_from_user(kbuf, buf, read_len))
           ^
   kernel/kcsan/debugfs.c:235:6: note: Assuming the condition is false
           if (!strcmp(arg, "on")) {
               ^~~~~~~~~~~~~~~~~~
   kernel/kcsan/debugfs.c:235:2: note: Taking false branch
           if (!strcmp(arg, "on")) {
           ^
   kernel/kcsan/debugfs.c:237:13: note: Assuming the condition is false
           } else if (!strcmp(arg, "off")) {
                      ^~~~~~~~~~~~~~~~~~~
   kernel/kcsan/debugfs.c:237:9: note: Taking false branch
           } else if (!strcmp(arg, "off")) {
                  ^
   kernel/kcsan/debugfs.c:239:9: note: Taking true branch
           } else if (str_has_prefix(arg, "microbench=3D")) {
                  ^
   kernel/kcsan/debugfs.c:242:7: note: Assuming the condition is false
                   if (kstrtoul(&arg[strlen("microbench=3D")], 0, &iters))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/debugfs.c:242:3: note: Taking false branch
                   if (kstrtoul(&arg[strlen("microbench=3D")], 0, &iters))
                   ^
   kernel/kcsan/debugfs.c:244:3: note: Calling 'microbenchmark'
                   microbenchmark(iters);
                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/debugfs.c:65:36: note: Dereference of null pointer
           const struct kcsan_ctx ctx_save =3D current->kcsan_ctx;
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/s390/include/asm/preempt.h:77:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/kcsan/report.c:642:32: note: Calling 'prepare_access_info'
           const struct access_info ai =3D prepare_access_info(ptr, size, a=
ccess_type);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/kcsan/report.c:585:15: note: Calling 'preempt_count'
                   .task_pid       =3D in_task() ? task_pid_nr(current) : -=
1,
                                     ^
   include/linux/preempt.h:100:23: note: expanded from macro 'in_task'
   #define in_task()               (!(in_nmi() | in_hardirq() | in_serving_=
softirq()))
                                      ^~~~~~~~
   include/linux/preempt.h:97:20: note: expanded from macro 'in_nmi'
   #define in_nmi()                (nmi_count())
                                    ^~~~~~~~~~~
   include/linux/preempt.h:80:22: note: expanded from macro 'nmi_count'
   #define nmi_count()     (preempt_count() & NMI_MASK)
                            ^~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:77:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count);
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
   arch/s390/include/asm/preempt.h:77:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count);
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
   arch/s390/include/asm/preempt.h:77:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   arch/s390/include/asm/preempt.h:77:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:77:9: note: Loop condition is false.  Ex=
iting loop
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:77:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>> kernel/kcsan/report.c:409:22: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
                   print_verbose_info(current);
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/kcsan/report.c:343:6: note: Assuming the condition is false
           if (skip_report(KCSAN_VALUE_CHANGE_TRUE, stack_entries[skipnr]))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/report.c:343:2: note: Taking false branch
           if (skip_report(KCSAN_VALUE_CHANGE_TRUE, stack_entries[skipnr]))
           ^
   kernel/kcsan/report.c:346:6: note: Assuming 'other_info' is null
           if (other_info) {
               ^~~~~~~~~~
   kernel/kcsan/report.c:346:2: note: Taking false branch
           if (other_info) {
           ^
   kernel/kcsan/report.c:356:6: note: Assuming the condition is false
           if (rate_limit_report(this_frame, other_frame))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/report.c:356:2: note: Taking false branch
           if (rate_limit_report(this_frame, other_frame))
           ^
   kernel/kcsan/report.c:361:6: note: 'other_info' is null
           if (other_info) {
               ^~~~~~~~~~
   kernel/kcsan/report.c:361:2: note: Taking false branch
           if (other_info) {
           ^
   kernel/kcsan/report.c:381:6: note: 'other_info' is null
           if (other_info) {
               ^~~~~~~~~~
   kernel/kcsan/report.c:381:2: note: Taking false branch
           if (other_info) {
           ^
   kernel/kcsan/report.c:408:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_KCSAN_VERBOSE))
           ^
   kernel/kcsan/report.c:409:22: note: Dereference of null pointer
                   print_verbose_info(current);
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/kcsan/report.c:463:42: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           const bool is_running =3D task_is_running(current);
                                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/kcsan/report.c:517:2: note: Loop condition is false.  Exiting loop
           raw_spin_lock_irqsave(&report_lock, *flags);
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/kcsan/report.c:532:2: note: Assuming field 'size' is 0
           WARN_ON(other_info->ai.size);
           ^
   arch/s390/include/asm/bug.h:53:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(x);                      \
                                ^~~~
   kernel/kcsan/report.c:532:2: note: Taking false branch
           WARN_ON(other_info->ai.size);
           ^
   arch/s390/include/asm/bug.h:54:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   kernel/kcsan/report.c:532:2: note: Taking false branch
           WARN_ON(other_info->ai.size);
           ^
   arch/s390/include/asm/bug.h:58:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   kernel/kcsan/report.c:537:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_KCSAN_VERBOSE))
           ^
   kernel/kcsan/report.c:538:3: note: Calling 'set_other_info_task_blocking'
                   set_other_info_task_blocking(flags, ai, other_info);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/report.c:463:26: note: Left side of '||' is false
           const bool is_running =3D task_is_running(current);
                                   ^
   include/linux/sched.h:116:33: note: expanded from macro 'task_is_running'
   #define task_is_running(task)           (READ_ONCE((task)->__state) =3D=
=3D TASK_RUNNING)
                                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:2728:2: note: Taking true branch
           if (!(gup_flags & FOLL_FAST_ONLY))
           ^
   mm/gup.c:2729:20: note: Dereference of null pointer
                   might_lock_read(&current->mm->mmap_lock);
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/lockdep.h:581:17: note: expanded from macro 'might_lock_re=
ad'
           lock_acquire(&(lock)->dep_map, 0, 0, 1, 1, NULL, _THIS_IP_);    \
                          ^~~~
   mm/gup.c:2970:31: warning: Dereference of null pointer [clang-analyzer-c=
ore.NullDereference]
           return __gup_longterm_locked(current->mm, start, nr_pages,
                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/gup.c:2966:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
               ^
   include/asm-generic/bug.h:104:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   mm/gup.c:2966:6: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/gup.c:2966:2: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
           ^
   mm/gup.c:2970:31: note: Dereference of null pointer
           return __gup_longterm_locked(current->mm, start, nr_pages,
                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/gup.c:3015:33: warning: Dereference of null pointer [clang-analyzer-c=
ore.NullDereference]
           return __get_user_pages_locked(current->mm, start, nr_pages,
                                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/gup.c:3007:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
               ^
   include/asm-generic/bug.h:104:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   mm/gup.c:3007:6: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/gup.c:3007:2: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
           ^
   mm/gup.c:3011:6: note: Assuming the condition is true
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
               ^
   include/asm-generic/bug.h:104:23: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                ^~~~~~~~~~~~
   mm/gup.c:3011:6: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   mm/gup.c:3011:2: note: Taking false branch
           if (WARN_ON_ONCE(gup_flags & FOLL_GET))
           ^
   mm/gup.c:3015:33: note: Dereference of null pointer
           return __get_user_pages_locked(current->mm, start, nr_pages,
                                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> kernel/kcsan/kcsan_test.c:178:3: warning: Value stored to 'cur' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   cur +=3D scnprintf(cur, end - cur, "%ps / %ps",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/kcsan_test.c:178:3: note: Value stored to 'cur' is never re=
ad
                   cur +=3D scnprintf(cur, end - cur, "%ps / %ps",
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/kcsan_test.c:220:5: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy(cur, "<none>");
                                   ^~~~~~
   kernel/kcsan/kcsan_test.c:220:5: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
                                   strcpy(cur, "<none>");
                                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   fs/xfs/xfs_extent_busy.c:575:2: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           DEFINE_WAIT             (wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/xfs_extent_busy.c:575:2: note: Dereference of null pointer
           DEFINE_WAIT             (wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/xfs_extent_busy.c:597:2: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           DEFINE_WAIT             (wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/xfs/xfs_extent_busy.c:597:2: note: Dereference of null pointer
           DEFINE_WAIT             (wait);
           ^
   include/linux/wait.h:1153:27: note: expanded from macro 'DEFINE_WAIT'
   #define DEFINE_WAIT(name) DEFINE_WAIT_FUNC(name, autoremove_wake_functio=
n)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   arch/s390/include/asm/preempt.h:77:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/signal.c:2899:2: note: Calling 'cgroup_threadgroup_change_begin'
           cgroup_threadgroup_change_begin(tsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:722:2: note: Calling 'percpu_down_read'
           percpu_down_read(&cgroup_threadgroup_rwsem);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:49:2: note: Loop condition is false.  Exiti=
ng loop
           might_sleep();
           ^
   include/linux/kernel.h:175:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:109:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
--
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/s390/include/asm/preempt.h:77:9: note: Loop condition is false.  Ex=
iting loop
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/s390/include/asm/preempt.h:77:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/s390/include/asm/preempt.h:100:29: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count +=3D val;
                                      ^
   kernel/kcsan/core.c:266:2: note: Taking false branch
           if (is_atomic(ptr, size, type, ctx))
           ^
   kernel/kcsan/core.c:269:6: note: Loop condition is false.  Exiting loop
           if (this_cpu_dec_return(kcsan_skip) >=3D 0)
               ^
   include/linux/percpu-defs.h:524:34: note: expanded from macro 'this_cpu_=
dec_return'
   #define this_cpu_dec_return(pcp)        this_cpu_add_return(pcp, -1)
                                           ^
   include/linux/percpu-defs.h:512:39: note: expanded from macro 'this_cpu_=
add_return'
   #define this_cpu_add_return(pcp, val)   __pcpu_size_call_return2(this_cp=
u_add_return_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:334:2: note: expanded from macro '__pcpu_siz=
e_call_return2'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/kcsan/core.c:269:6: note: Control jumps to 'case 8:'  at line 269
           if (this_cpu_dec_return(kcsan_skip) >=3D 0)
               ^
   include/linux/percpu-defs.h:524:34: note: expanded from macro 'this_cpu_=
dec_return'
   #define this_cpu_dec_return(pcp)        this_cpu_add_return(pcp, -1)
                                           ^
   include/linux/percpu-defs.h:512:39: note: expanded from macro 'this_cpu_=
add_return'
   #define this_cpu_add_return(pcp, val)   __pcpu_size_call_return2(this_cp=
u_add_return_, pcp, val)
                                           ^
   include/linux/percpu-defs.h:335:2: note: expanded from macro '__pcpu_siz=
e_call_return2'
           switch(sizeof(variable)) {                                      \
           ^
   kernel/kcsan/core.c:269:6: note: Calling '__preempt_count_add'
           if (this_cpu_dec_return(kcsan_skip) >=3D 0)
               ^
   include/linux/percpu-defs.h:524:34: note: expanded from macro 'this_cpu_=
dec_return'
   #define this_cpu_dec_return(pcp)        this_cpu_add_return(pcp, -1)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:512:39: note: expanded from macro 'this_cpu_=
add_return'
   #define this_cpu_add_return(pcp, val)   __pcpu_size_call_return2(this_cp=
u_add_return_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:339:24: note: expanded from macro '__pcpu_si=
ze_call_return2'
           case 8: pscr2_ret__ =3D stem##8(variable, __VA_ARGS__); break;  =
  \
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:32:2: note: expanded from macro 'arch_thi=
s_cpu_to_op_simple'
           preempt_disable_notrace();                                      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:230:2: note: expanded from macro 'preempt_disabl=
e_notrace'
           __preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:167:31: note: expanded from macro '__preempt_cou=
nt_inc'
   #define __preempt_count_inc() __preempt_count_add(1)
                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:100:29: note: Dereference of null pointer
           S390_lowcore.preempt_count +=3D val;
                                      ^
>> kernel/kcsan/core.c:301:2: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:188:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   kernel/kcsan/core.c:298:7: note: '?' condition is false
                             (IS_ENABLED(CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE)=
 ?
                              ^
   include/linux/kconfig.h:73:53: note: expanded from macro 'IS_ENABLED'
   #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
                                                       ^
   include/linux/kconfig.h:57:27: note: expanded from macro 'IS_MODULE'
   #define IS_MODULE(option) __is_defined(option##_MODULE)
                             ^
   include/linux/kconfig.h:41:27: note: expanded from macro '__is_defined'
   #define __is_defined(x)                 ___is_defined(x)
                                           ^
   include/linux/kconfig.h:42:29: note: expanded from macro '___is_defined'
   #define ___is_defined(val)              ____is_defined(__ARG_PLACEHOLDER=
_##val)
                                           ^
   include/linux/kconfig.h:43:72: note: expanded from macro '____is_defined'
   #define ____is_defined(arg1_or_junk)    __take_second_arg(arg1_or_junk 1=
, 0)
                                                                           =
  ^
   kernel/kcsan/core.c:301:2: note: Loop condition is false.  Exiting loop
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/kcsan/core.c:301:2: note: Control jumps to 'case 8:'  at line 301
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   kernel/kcsan/core.c:301:2: note: Loop condition is false.  Exiting loop
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^
   note: expanded from here
   include/asm-generic/percpu.h:342:36: note: expanded from macro 'this_cpu=
_write_8'
   #define this_cpu_write_8(pcp, val)      this_cpu_generic_to_op(pcp, val,=
 =3D)
                                           ^
   include/asm-generic/percpu.h:147:2: note: expanded from macro 'this_cpu_=
generic_to_op'
           raw_local_irq_save(__flags);                                    \
           ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   kernel/kcsan/core.c:301:2: note: Loop condition is false.  Exiting loop
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^
   note: expanded from here
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:72:3: note: expanded from macro 'raw_cpu_ge=
neric_to_op'
           *raw_cpu_ptr(&(pcp)) op val;                                    \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/kcsan/core.c:301:2: note: Dereference of null pointer
           this_cpu_write(kcsan_skip, skip_count);
           ^
   include/linux/percpu-defs.h:508:34: note: expanded from macro 'this_cpu_=
write'
   #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_=
, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:380:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 8: stem##8(variable, __VA_ARGS__);break;           \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:188:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
>> kernel/kcsan/core.c:314:15: warning: Value stored to 'skew_delay_order' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int skew_delay_order =3D
                        ^~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:314:15: note: Value stored to 'skew_delay_order' dur=
ing its initialization is never read
           unsigned int skew_delay_order =3D
                        ^~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:442:22: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           kcsan_save_irqtrace(current);
                               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/kcsan/core.c:405:24: note: Assuming the condition is false
           const bool is_write =3D (type & KCSAN_ACCESS_WRITE) !=3D 0;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:406:25: note: Assuming the condition is true
           const bool is_assert =3D (type & KCSAN_ACCESS_ASSERT) !=3D 0;
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:420:6: note: Assuming the condition is false
           if (!kcsan_is_enabled())
               ^~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:420:2: note: Taking false branch
           if (!kcsan_is_enabled())
           ^
   kernel/kcsan/core.c:429:7: note: 'is_assert' is true
           if (!is_assert && kcsan_is_atomic_special(ptr))
                ^~~~~~~~~
   kernel/kcsan/core.c:429:17: note: Left side of '&&' is false
           if (!is_assert && kcsan_is_atomic_special(ptr))
                          ^
   kernel/kcsan/core.c:432:2: note: Taking false branch
           if (!check_encodable((unsigned long)ptr, size)) {
           ^
   kernel/kcsan/core.c:442:22: note: Dereference of null pointer
           kcsan_save_irqtrace(current);
                               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/uio/uio.c:568:26: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   drivers/uio/uio.c:568:26: note: Dereference of null pointer
           DECLARE_WAITQUEUE(wait, current);
                                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/wait.h:55:63: note: expanded from macro 'DECLARE_WAITQUEUE'
           struct wait_queue_entry name =3D __WAITQUEUE_INITIALIZER(name, t=
sk)
                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/wait.h:50:13: note: expanded from macro '__WAITQUEUE_INITI=
ALIZER'
           .private        =3D tsk,                                        =
          \
                             ^~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/leds/leds-pca9532.c:516:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:516:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 20 warnings (7 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +65 kernel/kcsan/debugfs.c

dfd402a4c4baae Marco Elver    2019-11-14  57  =

dfd402a4c4baae Marco Elver    2019-11-14  58  /*
dfd402a4c4baae Marco Elver    2019-11-14  59   * The microbenchmark allows =
benchmarking KCSAN core runtime only. To run
dfd402a4c4baae Marco Elver    2019-11-14  60   * multiple threads, pipe 'mi=
crobench=3D<iters>' from multiple tasks into the
a312013578e477 Marco Elver    2020-02-06  61   * debugfs file. This will no=
t generate any conflicts, and tests fast-path only.
dfd402a4c4baae Marco Elver    2019-11-14  62   */
a312013578e477 Marco Elver    2020-02-06  63  static noinline void microben=
chmark(unsigned long iters)
dfd402a4c4baae Marco Elver    2019-11-14  64  {
44656d3dc4f0dc Marco Elver    2020-02-25 @65  	const struct kcsan_ctx ctx_s=
ave =3D current->kcsan_ctx;
44656d3dc4f0dc Marco Elver    2020-02-25  66  	const bool was_enabled =3D R=
EAD_ONCE(kcsan_enabled);
09b1b13461e12e Heiko Carstens 2021-07-29  67  	u64 cycles;
dfd402a4c4baae Marco Elver    2019-11-14  68  =

44656d3dc4f0dc Marco Elver    2020-02-25  69  	/* We may have been called f=
rom an atomic region; reset context. */
44656d3dc4f0dc Marco Elver    2020-02-25  70  	memset(&current->kcsan_ctx, =
0, sizeof(current->kcsan_ctx));
44656d3dc4f0dc Marco Elver    2020-02-25  71  	/*
44656d3dc4f0dc Marco Elver    2020-02-25  72  	 * Disable to benchmark fast=
-path for all accesses, and (expected
44656d3dc4f0dc Marco Elver    2020-02-25  73  	 * negligible) call into slo=
w-path, but never set up watchpoints.
44656d3dc4f0dc Marco Elver    2020-02-25  74  	 */
44656d3dc4f0dc Marco Elver    2020-02-25  75  	WRITE_ONCE(kcsan_enabled, fa=
lse);
44656d3dc4f0dc Marco Elver    2020-02-25  76  =

178a1877d782c0 Marco Elver    2020-07-31  77  	pr_info("%s begin | iters: %=
lu\n", __func__, iters);
dfd402a4c4baae Marco Elver    2019-11-14  78  =

dfd402a4c4baae Marco Elver    2019-11-14  79  	cycles =3D get_cycles();
dfd402a4c4baae Marco Elver    2019-11-14  80  	while (iters--) {
44656d3dc4f0dc Marco Elver    2020-02-25  81  		unsigned long addr =3D iter=
s & ((PAGE_SIZE << 8) - 1);
44656d3dc4f0dc Marco Elver    2020-02-25  82  		int type =3D !(iters & 0x7f=
) ? KCSAN_ACCESS_ATOMIC :
44656d3dc4f0dc Marco Elver    2020-02-25  83  				(!(iters & 0xf) ? KCSAN_A=
CCESS_WRITE : 0);
44656d3dc4f0dc Marco Elver    2020-02-25  84  		__kcsan_check_access((void =
*)addr, sizeof(long), type);
dfd402a4c4baae Marco Elver    2019-11-14  85  	}
dfd402a4c4baae Marco Elver    2019-11-14  86  	cycles =3D get_cycles() - cy=
cles;
dfd402a4c4baae Marco Elver    2019-11-14  87  =

178a1877d782c0 Marco Elver    2020-07-31  88  	pr_info("%s end   | cycles: =
%llu\n", __func__, cycles);
44656d3dc4f0dc Marco Elver    2020-02-25  89  =

44656d3dc4f0dc Marco Elver    2020-02-25  90  	WRITE_ONCE(kcsan_enabled, wa=
s_enabled);
44656d3dc4f0dc Marco Elver    2020-02-25  91  	/* restore context */
44656d3dc4f0dc Marco Elver    2020-02-25  92  	current->kcsan_ctx =3D ctx_s=
ave;
dfd402a4c4baae Marco Elver    2019-11-14  93  }
dfd402a4c4baae Marco Elver    2019-11-14  94  =


:::::: The code at line 65 was first introduced by commit
:::::: 44656d3dc4f0dc20010d054f27397a4a1469fabf kcsan: Add current->state t=
o implicitly atomic accesses

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8406424680546239317==--

