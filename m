Content-Type: multipart/mixed; boundary="===============5900709846325369591=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kcsan/core.c:301:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 07 Jun 2022 05:09:21 +0800
Message-ID: <202206070457.hUCwqBHt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5900709846325369591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/kcsan/core.c:301:2: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: e37b3dd063a1a68e28a7cfaf77c84c472112e330 s390: enable KCSAN
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-c005-20220606 (https://download.01.org/0day-ci/arch=
ive/20220607/202206070457.hUCwqBHt-lkp(a)intel.com/config)
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
   27 warnings generated.
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
   fs/inode.c:1838:2: note: Taking false branch
           if (!atime_needs_update(path, inode))
           ^
   fs/inode.c:1841:7: note: Calling 'sb_start_write_trylock'
           if (!sb_start_write_trylock(inode->i_sb))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:1838:9: note: Calling '__sb_start_write_trylock'
           return __sb_start_write_trylock(sb, SB_FREEZE_WRITE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:1768:9: note: Calling 'percpu_down_read_trylock'
           return percpu_down_read_trylock(sb->s_writers.rw_sem + level - 1=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-rwsem.h:77:2: note: Loop condition is false.  Exiti=
ng loop
           preempt_disable();
           ^
   include/linux/preempt.h:175:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   include/linux/percpu-rwsem.h:81:2: note: Taking false branch
           if (likely(rcu_sync_is_idle(&sem->rss)))
           ^
   include/linux/percpu-rwsem.h:85:2: note: Calling 'should_resched'
           preempt_enable();
           ^
   include/linux/preempt.h:195:15: note: expanded from macro 'preempt_enabl=
e'
           if (unlikely(preempt_count_dec_and_test())) \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:160:27: note: expanded from macro 'preempt_count=
_dec_and_test'
           ({ preempt_count_sub(1); should_resched(0); })
                                    ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/s390/include/asm/preempt.h:115:18: note: Calling 'preempt_count'
           return unlikely(preempt_count() =3D=3D preempt_offset &&
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/s390/include/asm/preempt.h:77:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
           list_for_each_entry(p, &MSDOS_I(inode)->cache_lru, cache_list) {
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
   fs/fat/cache.c:90:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, &MSDOS_I(inode)->cache_lru, cache_list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/fat/cache.c:92:7: note: Assuming 'fclus' is >=3D field 'fcluster'
                   if (p->fcluster <=3D fclus && hit->fcluster < p->fcluste=
r) {
                       ^~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:92:7: note: Left side of '&&' is true
   fs/fat/cache.c:92:31: note: Assuming 'hit->fcluster' is < 'p->fcluster'
                   if (p->fcluster <=3D fclus && hit->fcluster < p->fcluste=
r) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:92:3: note: Taking true branch
                   if (p->fcluster <=3D fclus && hit->fcluster < p->fcluste=
r) {
                   ^
   fs/fat/cache.c:94:8: note: Assuming the condition is false
                           if ((hit->fcluster + hit->nr_contig) < fclus) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:94:4: note: Taking false branch
                           if ((hit->fcluster + hit->nr_contig) < fclus) {
                           ^
   fs/fat/cache.c:98:5: note:  Execution continues on line 102
                                   break;
                                   ^
   fs/fat/cache.c:102:6: note: Assuming the condition is false
           if (hit !=3D &nohit) {
               ^~~~~~~~~~~~~
   fs/fat/cache.c:102:2: note: Taking false branch
           if (hit !=3D &nohit) {
           ^
   fs/fat/cache.c:114:2: note: Returning without writing to 'cid->nr_contig'
           return offset;
           ^
   fs/fat/cache.c:247:6: note: Returning from 'fat_cache_lookup'
           if (fat_cache_lookup(inode, cluster, &cid, fclus, dclus) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:247:6: note: Assuming the condition is false
           if (fat_cache_lookup(inode, cluster, &cid, fclus, dclus) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:247:2: note: Taking false branch
           if (fat_cache_lookup(inode, cluster, &cid, fclus, dclus) < 0) {
           ^
   fs/fat/cache.c:256:2: note: Loop condition is true.  Entering loop body
           while (*fclus < cluster) {
           ^
   fs/fat/cache.c:258:7: note: Assuming the condition is false
                   if (*fclus > limit) {
                       ^~~~~~~~~~~~~~
   fs/fat/cache.c:258:3: note: Taking false branch
                   if (*fclus > limit) {
                   ^
   fs/fat/cache.c:267:7: note: Assuming 'nr' is >=3D 0
                   if (nr < 0)
                       ^~~~~~
   fs/fat/cache.c:267:3: note: Taking false branch
                   if (nr < 0)
                   ^
   fs/fat/cache.c:269:12: note: Assuming 'nr' is not equal to FAT_ENT_FREE
                   else if (nr =3D=3D FAT_ENT_FREE) {
                            ^~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:269:8: note: Taking false branch
                   else if (nr =3D=3D FAT_ENT_FREE) {
                        ^
   fs/fat/cache.c:275:14: note: Assuming 'nr' is not equal to FAT_ENT_EOF
                   } else if (nr =3D=3D FAT_ENT_EOF) {
                              ^~~~~~~~~~~~~~~~~
   fs/fat/cache.c:275:10: note: Taking false branch
                   } else if (nr =3D=3D FAT_ENT_EOF) {
                          ^
   fs/fat/cache.c:281:8: note: Calling 'cache_contiguous'
                   if (!cache_contiguous(&cid, *dclus))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/cache.c:213:2: note: The expression is an uninitialized value. Th=
e computed value will also be garbage
           cid->nr_contig++;
           ^~~~~~~~~~~~~~
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
                                          ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   block/blk-cgroup.c:1043:27: note: Loop condition is false.  Exiting loop
                   struct blkcg_gq *blkg =3D hlist_entry(blkcg->blkg_list.f=
irst,
                                           ^
   include/linux/list.h:972:40: note: expanded from macro 'hlist_entry'
   #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                          ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   block/blk-cgroup.c:1047:7: note: Calling 'need_resched'
                   if (need_resched() || !spin_trylock(&q->queue_lock)) {
                       ^~~~~~~~~~~~~~
   include/linux/sched.h:1999:18: note: Dereference of null pointer
           return unlikely(tif_need_resched());
                           ^
   include/linux/thread_info.h:166:28: note: expanded from macro 'tif_need_=
resched'
   #define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
                              ^
   include/linux/thread_info.h:132:22: note: expanded from macro 'test_thre=
ad_flag'
           test_ti_thread_flag(current_thread_info(), flag)
                               ^
   include/linux/thread_info.h:24:54: note: expanded from macro 'current_th=
read_info'
   #define current_thread_info() ((struct thread_info *)current)
                                                        ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/sched/signal.h:354:22: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           set_tsk_thread_flag(current, TIF_SIGPENDING);
                               ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   block/blk-cgroup.c:632:2: note: Taking false branch
           if (IS_ERR(bdev))
           ^
   block/blk-cgroup.c:641:2: note: Taking true branch
           if (IS_ERR(blkg)) {
           ^
   block/blk-cgroup.c:643:3: note: Control jumps to line 714
                   goto fail_unlock;
                   ^
   block/blk-cgroup.c:724:6: note: Assuming the condition is true
           if (ret =3D=3D -EBUSY) {
               ^~~~~~~~~~~~~
   block/blk-cgroup.c:724:2: note: Taking true branch
           if (ret =3D=3D -EBUSY) {
           ^
   block/blk-cgroup.c:726:9: note: Calling 'restart_syscall'
                   ret =3D restart_syscall();
                         ^~~~~~~~~~~~~~~~~
   include/linux/sched/signal.h:354:22: note: Dereference of null pointer
           set_tsk_thread_flag(current, TIF_SIGPENDING);
                               ^
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (6 in non-user code, 4 with check filters).
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
   21 warnings generated.
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
   lib/random32.c:402:32: note: Loop condition is false.  Exiting loop
           struct siprand_state *state =3D get_cpu_ptr(&net_rand_state);
                                         ^
   include/linux/percpu-defs.h:293:2: note: expanded from macro 'get_cpu_pt=
r'
           preempt_disable();                                              \
           ^
   include/linux/preempt.h:175:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   lib/random32.c:402:32: note: Loop condition is false.  Exiting loop
           struct siprand_state *state =3D get_cpu_ptr(&net_rand_state);
                                         ^
   include/linux/percpu-defs.h:294:2: note: expanded from macro 'get_cpu_pt=
r'
           this_cpu_ptr(var);                                              \
           ^
   include/linux/percpu-defs.h:248:2: note: expanded from macro 'this_cpu_p=
tr'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   lib/random32.c:405:9: note: Assuming the condition is false
           while (bytes >=3D sizeof(u32)) {
                  ^~~~~~~~~~~~~~~~~~~~
   lib/random32.c:405:2: note: Loop condition is false. Execution continues=
 on line 411
           while (bytes >=3D sizeof(u32)) {
           ^
   lib/random32.c:411:6: note: Assuming 'bytes' is <=3D 0
           if (bytes > 0) {
               ^~~~~~~~~
   lib/random32.c:411:2: note: Taking false branch
           if (bytes > 0) {
           ^
   lib/random32.c:419:2: note: Calling 'should_resched'
           put_cpu_ptr(&net_rand_state);
           ^
   include/linux/percpu-defs.h:300:2: note: expanded from macro 'put_cpu_pt=
r'
           preempt_enable();                                               \
           ^~~~~~~~~~~~~~~~
   include/linux/preempt.h:195:15: note: expanded from macro 'preempt_enabl=
e'
           if (unlikely(preempt_count_dec_and_test())) \
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:160:27: note: expanded from macro 'preempt_count=
_dec_and_test'
           ({ preempt_count_sub(1); should_resched(0); })
                                    ^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/s390/include/asm/preempt.h:115:18: note: Calling 'preempt_count'
           return unlikely(preempt_count() =3D=3D preempt_offset &&
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
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
   arch/s390/include/asm/preempt.h:77:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \

vim +301 kernel/kcsan/core.c

cd290ec24633f5 Marco Elver 2020-08-21  294  =

dfd402a4c4baae Marco Elver 2019-11-14  295  static inline void reset_kcsan_=
skip(void)
dfd402a4c4baae Marco Elver 2019-11-14  296  {
80d4c477521660 Marco Elver 2020-02-07  297  	long skip_count =3D kcsan_skip=
_watch -
dfd402a4c4baae Marco Elver 2019-11-14  298  			  (IS_ENABLED(CONFIG_KCSAN_S=
KIP_WATCH_RANDOMIZE) ?
cd290ec24633f5 Marco Elver 2020-08-21  299  				   kcsan_prandom_u32_max(kc=
san_skip_watch) :
dfd402a4c4baae Marco Elver 2019-11-14  300  				   0);
dfd402a4c4baae Marco Elver 2019-11-14 @301  	this_cpu_write(kcsan_skip, ski=
p_count);
dfd402a4c4baae Marco Elver 2019-11-14  302  }
dfd402a4c4baae Marco Elver 2019-11-14  303  =

5c361425744d1e Marco Elver 2020-01-07  304  static __always_inline bool kcs=
an_is_enabled(void)
dfd402a4c4baae Marco Elver 2019-11-14  305  {
dfd402a4c4baae Marco Elver 2019-11-14  306  	return READ_ONCE(kcsan_enabled=
) && get_ctx()->disable_count =3D=3D 0;
dfd402a4c4baae Marco Elver 2019-11-14  307  }
dfd402a4c4baae Marco Elver 2019-11-14  308  =

cd290ec24633f5 Marco Elver 2020-08-21  309  /* Introduce delay depending on=
 context and configuration. */
cd290ec24633f5 Marco Elver 2020-08-21  310  static void delay_access(int ty=
pe)
dfd402a4c4baae Marco Elver 2019-11-14  311  {
80d4c477521660 Marco Elver 2020-02-07  312  	unsigned int delay =3D in_task=
() ? kcsan_udelay_task : kcsan_udelay_interrupt;
106a307fd0a762 Marco Elver 2020-07-24  313  	/* For certain access types, s=
kew the random delay to be longer. */
106a307fd0a762 Marco Elver 2020-07-24 @314  	unsigned int skew_delay_order =
=3D
106a307fd0a762 Marco Elver 2020-07-24  315  		(type & (KCSAN_ACCESS_COMPOUN=
D | KCSAN_ACCESS_ASSERT)) ? 1 : 0;
106a307fd0a762 Marco Elver 2020-07-24  316  =

cd290ec24633f5 Marco Elver 2020-08-21  317  	delay -=3D IS_ENABLED(CONFIG_K=
CSAN_DELAY_RANDOMIZE) ?
cd290ec24633f5 Marco Elver 2020-08-21  318  			       kcsan_prandom_u32_max=
(delay >> skew_delay_order) :
cd290ec24633f5 Marco Elver 2020-08-21  319  			       0;
cd290ec24633f5 Marco Elver 2020-08-21  320  	udelay(delay);
dfd402a4c4baae Marco Elver 2019-11-14  321  }
dfd402a4c4baae Marco Elver 2019-11-14  322  =


:::::: The code at line 301 was first introduced by commit
:::::: dfd402a4c4baae42398ce9180ff424d589b8bffc kcsan: Add Kernel Concurren=
cy Sanitizer infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5900709846325369591==--

