Content-Type: multipart/mixed; boundary="===============5612887986947018150=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kcsan/core.c:269:6: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 16 Jul 2022 19:46:15 +0800
Message-ID: <202207161950.kWigBVJg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5612887986947018150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 kernel/kcsan/core.c:269:6: warning: Dereference of null pointer [clang-ana=
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
head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
commit: e37b3dd063a1a68e28a7cfaf77c84c472112e330 s390: enable KCSAN
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220712 (https://download.01.org/0day-ci/arch=
ive/20220716/202207161950.kWigBVJg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4=
ac3c489a8c8cccdad1f74b9308c350a9e0)
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
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   kernel/kcsan/core.c:759:26: note: Calling 'get_ctx'
           struct kcsan_ctx *ctx =3D get_ctx();
                                   ^~~~~~~~~
   kernel/kcsan/core.c:202:9: note: Calling 'preempt_count'
           return in_task() ? &current->kcsan_ctx : raw_cpu_ptr(&kcsan_cpu_=
ctx);
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Loop condition is false.  Ex=
iting loop
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
>> kernel/kcsan/core.c:269:6: warning: Dereference of null pointer [clang-a=
nalyzer-core.NullDereference]
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
   include/linux/percpu-defs.h:339:24: note: expanded from macro '__pcpu_si=
ze_call_return2'
           case 8: pscr2_ret__ =3D stem##8(variable, __VA_ARGS__); break;  =
  \
                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:110:41: note: expanded from macro 'this_c=
pu_add_return_8'
   #define this_cpu_add_return_8(pcp, val) arch_this_cpu_add_return(pcp, va=
l, "laag")
                                           ^
   arch/s390/include/asm/percpu.h:98:2: note: expanded from macro 'arch_thi=
s_cpu_add_return'
           preempt_disable_notrace();                                      \
           ^
   include/linux/preempt.h:228:35: note: expanded from macro 'preempt_disab=
le_notrace'
   #define preempt_disable_notrace() \
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
   include/linux/percpu-defs.h:339:24: note: expanded from macro '__pcpu_si=
ze_call_return2'
           case 8: pscr2_ret__ =3D stem##8(variable, __VA_ARGS__); break;  =
  \
                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   arch/s390/include/asm/percpu.h:99:10: note: expanded from macro 'arch_th=
is_cpu_add_return'
           ptr__ =3D raw_cpu_ptr(&(pcp));                                  =
  \
                   ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/kcsan/core.c:269:6: note: Dereference of null pointer
           if (this_cpu_dec_return(kcsan_skip) >=3D 0)
               ^
   include/linux/percpu-defs.h:524:34: note: expanded from macro 'this_cpu_=
dec_return'
   #define this_cpu_dec_return(pcp)        this_cpu_add_return(pcp, -1)
--
           const bool is_assert =3D (type & KCSAN_ACCESS_ASSERT) !=3D 0;
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:418:2: note: Calling 'reset_kcsan_skip'
           reset_kcsan_skip();
           ^~~~~~~~~~~~~~~~~~
   kernel/kcsan/core.c:298:7: note: '?' condition is true
                             (IS_ENABLED(CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE)=
 ?
                              ^
   include/linux/kconfig.h:73:28: note: expanded from macro 'IS_ENABLED'
   #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
                              ^
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
   #define __or(x, y)                      ___or(x, y)
                                           ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
   #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
                                           ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
   #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1=
, y)
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   arch/s390/mm/hugetlbpage.c:158:7: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:91:26: note: expanded from macro 'MACHINE_=
HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_NX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:158:7: note: Dereference of null pointer
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:91:26: note: expanded from macro 'MACHINE_=
HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_NX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:259:6: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           if (MACHINE_HAS_EDAT1 && size =3D=3D PMD_SIZE)
               ^
   arch/s390/include/asm/setup.h:84:28: note: expanded from macro 'MACHINE_=
HAS_EDAT1'
   #define MACHINE_HAS_EDAT1       (S390_lowcore.machine_flags & MACHINE_FL=
AG_EDAT1)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:259:6: note: Dereference of null pointer
           if (MACHINE_HAS_EDAT1 && size =3D=3D PMD_SIZE)
               ^
   arch/s390/include/asm/setup.h:84:28: note: expanded from macro 'MACHINE_=
HAS_EDAT1'
   #define MACHINE_HAS_EDAT1       (S390_lowcore.machine_flags & MACHINE_FL=
AG_EDAT1)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:276:19: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           info.low_limit =3D current->mm->mmap_base;
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:276:19: note: Dereference of null pointer
           info.low_limit =3D current->mm->mmap_base;
                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:294:20: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           info.high_limit =3D current->mm->mmap_base;
                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/mm/hugetlbpage.c:293:19: note: Assuming '__UNIQUE_ID___x272' i=
s <=3D '__UNIQUE_ID___y273'
           info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
                            ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   arch/s390/mm/hugetlbpage.c:293:19: note: '?' condition is false
           info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
                            ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
--
                                          ^
   include/linux/smp.h:265:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   include/linux/smp.h:258:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/asm-generic/bug.h:180:46: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ~~~~~^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:173:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/scftorture.c:296:6: note: Assuming 'scfcp' is non-null
           if (likely(scfcp) && WARN_ONCE(smp_processor_id() !=3D scfcp->sc=
fc_cpu, "%s: Wanted CPU %d got CPU %d\n", __func__, scfcp->scfc_cpu, smp_pr=
ocessor_id())) {
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   kernel/scftorture.c:296:6: note: Left side of '&&' is true
           if (likely(scfcp) && WARN_ONCE(smp_processor_id() !=3D scfcp->sc=
fc_cpu, "%s: Wanted CPU %d got CPU %d\n", __func__, scfcp->scfc_cpu, smp_pr=
ocessor_id())) {
               ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   kernel/scftorture.c:296:33: note: Dereference of null pointer
           if (likely(scfcp) && WARN_ONCE(smp_processor_id() !=3D scfcp->sc=
fc_cpu, "%s: Wanted CPU %d got CPU %d\n", __func__, scfcp->scfc_cpu, smp_pr=
ocessor_id())) {
                                          ^
   include/linux/smp.h:265:29: note: expanded from macro 'smp_processor_id'
   # define smp_processor_id() __smp_processor_id()
                               ^
   include/linux/smp.h:258:31: note: expanded from macro '__smp_processor_i=
d'
   #define __smp_processor_id(x) raw_smp_processor_id(x)
                                 ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/asm-generic/bug.h:180:46: note: expanded from macro 'WARN_ONCE'
   #define WARN_ONCE(condition, format...) WARN(condition, format)
                                           ~~~~~^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:173:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/scftorture.c:408:36: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           WARN_ON_ONCE(set_cpus_allowed_ptr(current, cpumask_of(cpu)));
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ~~~~~~~~^~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/scftorture.c:406:2: note: Assuming 'verbose' is 0
           VERBOSE_SCFTORTOUT("scftorture_invoker %d: task started", scfp->=
cpu);
           ^
   kernel/scftorture.c:45:11: note: expanded from macro 'VERBOSE_SCFTORTOUT'
           do { if (verbose) pr_alert(SCFTORT_FLAG s, ## x); } while (0)
                    ^~~~~~~
   kernel/scftorture.c:406:2: note: Taking false branch
           VERBOSE_SCFTORTOUT("scftorture_invoker %d: task started", scfp->=
cpu);
           ^
   kernel/scftorture.c:45:7: note: expanded from macro 'VERBOSE_SCFTORTOUT'
           do { if (verbose) pr_alert(SCFTORT_FLAG s, ## x); } while (0)
                ^
   kernel/scftorture.c:406:2: note: Loop condition is false.  Exiting loop
           VERBOSE_SCFTORTOUT("scftorture_invoker %d: task started", scfp->=
cpu);
           ^
   kernel/scftorture.c:45:2: note: expanded from macro 'VERBOSE_SCFTORTOUT'
           do { if (verbose) pr_alert(SCFTORT_FLAG s, ## x); } while (0)
           ^
   kernel/scftorture.c:408:36: note: Dereference of null pointer
           WARN_ON_ONCE(set_cpus_allowed_ptr(current, cpumask_of(cpu)));
                                             ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ~~~~~~~~^~~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   arch/s390/include/asm/preempt.h:17:9: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is false
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Left side of '||' is true
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Taking false branch
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Loop condition is false.  Ex=
iting loop
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   arch/s390/include/asm/preempt.h:17:9: note: Dereference of null pointer
           return READ_ONCE(S390_lowcore.preempt_count) & ~PREEMPT_NEED_RES=
CHED;
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
   kernel/kcsan/report.c:532:2: note: Assuming field 'size' is not equal to=
 0
           WARN_ON(other_info->ai.size);
           ^
   include/asm-generic/bug.h:166:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
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
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/kcsan/report.c:463:26: note: Left side of '||' is false
           const bool is_running =3D task_is_running(current);
                                   ^
   include/linux/sched.h:116:33: note: expanded from macro 'task_is_running'
   #define task_is_running(task)           (READ_ONCE((task)->__state) =3D=
=3D TASK_RUNNING)
                                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
           ^
   fs/fs_context.c:265:13: note: Left side of '&&' is false
           fc->cred        =3D get_current_cred();
                             ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   fs/fs_context.c:265:13: note: Loop condition is false.  Exiting loop
           fc->cred        =3D get_current_cred();
                             ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   fs/fs_context.c:265:13: note: Dereference of null pointer
           fc->cred        =3D get_current_cred();
                             ^
   include/linux/cred.h:331:12: note: expanded from macro 'get_current_cred'
           (get_cred(current_cred()))
                     ^~~~~~~~~~~~~~
   include/linux/cred.h:299:28: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/rcupdate.h:587:31: note: expanded from macro 'rcu_derefere=
nce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:398:35: note: expanded from macro '__rcu_derefe=
rence_protected'
           ((typeof(*p) __force __kernel *)(p)); \
                                            ^
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/autofs/autofs_i.h:148:14: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
                    task_pgrp(current) =3D=3D sbi->oz_pgrp);
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/autofs/root.c:729:7: note: Calling 'autofs_oz_mode'
           if (!autofs_oz_mode(sbi))
                ^~~~~~~~~~~~~~~~~~~
   fs/autofs/autofs_i.h:147:11: note: Assuming the condition is false
           return ((sbi->flags & AUTOFS_SBI_CATATONIC) ||
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/autofs/autofs_i.h:147:10: note: Left side of '||' is false
           return ((sbi->flags & AUTOFS_SBI_CATATONIC) ||
                   ^
   fs/autofs/autofs_i.h:148:14: note: Dereference of null pointer
                    task_pgrp(current) =3D=3D sbi->oz_pgrp);
                              ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/autofs/root.c:562:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:562:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (4 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   kernel/torture.c:92:2: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
           set_current_state(TASK_UNINTERRUPTIBLE);
           ^
   include/linux/sched.h:143:3: note: expanded from macro 'set_current_stat=
e'
                   current->task_state_change =3D _THIS_IP_;         \
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/torture.c:761:2: note: Assuming 'verbose' is 0
           VERBOSE_TOROUT_STRING("torture_stutter task started");
           ^
   include/linux/torture.h:36:6: note: expanded from macro 'VERBOSE_TOROUT_=
STRING'
           if (verbose) {                                                  =
        \
               ^~~~~~~
   kernel/torture.c:761:2: note: Taking false branch
           VERBOSE_TOROUT_STRING("torture_stutter task started");
           ^
   include/linux/torture.h:36:2: note: expanded from macro 'VERBOSE_TOROUT_=
STRING'
           if (verbose) {                                                  =
        \
           ^
   kernel/torture.c:761:2: note: Loop condition is false.  Exiting loop
           VERBOSE_TOROUT_STRING("torture_stutter task started");
           ^
   include/linux/torture.h:34:34: note: expanded from macro 'VERBOSE_TOROUT=
_STRING'
   #define VERBOSE_TOROUT_STRING(s) \
                                    ^
   kernel/torture.c:763:7: note: Assuming the condition is true
                   if (!torture_must_stop() && stutter > 1) {
                       ^~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:763:7: note: Left side of '&&' is true
   kernel/torture.c:763:31: note: Assuming 'stutter' is > 1
                   if (!torture_must_stop() && stutter > 1) {
                                               ^~~~~~~~~~~
   kernel/torture.c:763:3: note: Taking true branch
                   if (!torture_must_stop() && stutter > 1) {
                   ^
   kernel/torture.c:765:8: note: Assuming 'stutter' is <=3D 2
                           if (stutter > 2) {
                               ^~~~~~~~~~~
   kernel/torture.c:765:4: note: Taking false branch
                           if (stutter > 2) {
                           ^
   kernel/torture.c:771:4: note: Left side of '||' is false
                           WRITE_ONCE(stutter_pause_test, 2);
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   kernel/torture.c:771:4: note: Left side of '||' is false
                           WRITE_ONCE(stutter_pause_test, 2);
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   kernel/torture.c:771:4: note: Left side of '||' is true
                           WRITE_ONCE(stutter_pause_test, 2);
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
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
   kernel/torture.c:771:4: note: Taking false branch
                           WRITE_ONCE(stutter_pause_test, 2);
                           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'

vim +269 kernel/kcsan/core.c

dfd402a4c4baae4 Marco Elver 2019-11-14  255  =

1e6ee2f0fe8ae68 Marco Elver 2020-02-04  256  static __always_inline bool
757a4cefde76697 Marco Elver 2020-03-25  257  should_watch(const volatile vo=
id *ptr, size_t size, int type, struct kcsan_ctx *ctx)
dfd402a4c4baae4 Marco Elver 2019-11-14  258  {
dfd402a4c4baae4 Marco Elver 2019-11-14  259  	/*
dfd402a4c4baae4 Marco Elver 2019-11-14  260  	 * Never set up watchpoints w=
hen memory operations are atomic.
dfd402a4c4baae4 Marco Elver 2019-11-14  261  	 *
dfd402a4c4baae4 Marco Elver 2019-11-14  262  	 * Need to check this first, =
before kcsan_skip check below: (1) atomics
dfd402a4c4baae4 Marco Elver 2019-11-14  263  	 * should not count towards s=
kipped instructions, and (2) to actually
dfd402a4c4baae4 Marco Elver 2019-11-14  264  	 * decrement kcsan_atomic_nex=
t for consecutive instruction stream.
dfd402a4c4baae4 Marco Elver 2019-11-14  265  	 */
757a4cefde76697 Marco Elver 2020-03-25  266  	if (is_atomic(ptr, size, type=
, ctx))
dfd402a4c4baae4 Marco Elver 2019-11-14  267  		return false;
dfd402a4c4baae4 Marco Elver 2019-11-14  268  =

dfd402a4c4baae4 Marco Elver 2019-11-14 @269  	if (this_cpu_dec_return(kcsan=
_skip) >=3D 0)
dfd402a4c4baae4 Marco Elver 2019-11-14  270  		return false;
dfd402a4c4baae4 Marco Elver 2019-11-14  271  =

dfd402a4c4baae4 Marco Elver 2019-11-14  272  	/*
dfd402a4c4baae4 Marco Elver 2019-11-14  273  	 * NOTE: If we get here, kcsa=
n_skip must always be reset in slow path
dfd402a4c4baae4 Marco Elver 2019-11-14  274  	 * via reset_kcsan_skip() to =
avoid underflow.
dfd402a4c4baae4 Marco Elver 2019-11-14  275  	 */
dfd402a4c4baae4 Marco Elver 2019-11-14  276  =

dfd402a4c4baae4 Marco Elver 2019-11-14  277  	/* this operation should be w=
atched */
dfd402a4c4baae4 Marco Elver 2019-11-14  278  	return true;
dfd402a4c4baae4 Marco Elver 2019-11-14  279  }
dfd402a4c4baae4 Marco Elver 2019-11-14  280  =

cd290ec24633f51 Marco Elver 2020-08-21  281  /*
71a076f4a61a6c7 Marco Elver 2020-11-24  282   * Returns a pseudo-random num=
ber in interval [0, ep_ro). Simple linear
71a076f4a61a6c7 Marco Elver 2020-11-24  283   * congruential generator, usi=
ng constants from "Numerical Recipes".
cd290ec24633f51 Marco Elver 2020-08-21  284   */
cd290ec24633f51 Marco Elver 2020-08-21  285  static u32 kcsan_prandom_u32_m=
ax(u32 ep_ro)
cd290ec24633f51 Marco Elver 2020-08-21  286  {
71a076f4a61a6c7 Marco Elver 2020-11-24  287  	u32 state =3D this_cpu_read(k=
csan_rand_state);
71a076f4a61a6c7 Marco Elver 2020-11-24  288  =

71a076f4a61a6c7 Marco Elver 2020-11-24  289  	state =3D 1664525 * state + 1=
013904223;
71a076f4a61a6c7 Marco Elver 2020-11-24  290  	this_cpu_write(kcsan_rand_sta=
te, state);
cd290ec24633f51 Marco Elver 2020-08-21  291  =

71a076f4a61a6c7 Marco Elver 2020-11-24  292  	return state % ep_ro;
cd290ec24633f51 Marco Elver 2020-08-21  293  }
cd290ec24633f51 Marco Elver 2020-08-21  294  =

dfd402a4c4baae4 Marco Elver 2019-11-14  295  static inline void reset_kcsan=
_skip(void)
dfd402a4c4baae4 Marco Elver 2019-11-14  296  {
80d4c4775216602 Marco Elver 2020-02-07  297  	long skip_count =3D kcsan_ski=
p_watch -
dfd402a4c4baae4 Marco Elver 2019-11-14  298  			  (IS_ENABLED(CONFIG_KCSAN_=
SKIP_WATCH_RANDOMIZE) ?
cd290ec24633f51 Marco Elver 2020-08-21  299  				   kcsan_prandom_u32_max(k=
csan_skip_watch) :
dfd402a4c4baae4 Marco Elver 2019-11-14  300  				   0);
dfd402a4c4baae4 Marco Elver 2019-11-14  301  	this_cpu_write(kcsan_skip, sk=
ip_count);
dfd402a4c4baae4 Marco Elver 2019-11-14  302  }
dfd402a4c4baae4 Marco Elver 2019-11-14  303  =

5c361425744d1e3 Marco Elver 2020-01-07  304  static __always_inline bool kc=
san_is_enabled(void)
dfd402a4c4baae4 Marco Elver 2019-11-14  305  {
dfd402a4c4baae4 Marco Elver 2019-11-14  306  	return READ_ONCE(kcsan_enable=
d) && get_ctx()->disable_count =3D=3D 0;
dfd402a4c4baae4 Marco Elver 2019-11-14  307  }
dfd402a4c4baae4 Marco Elver 2019-11-14  308  =

cd290ec24633f51 Marco Elver 2020-08-21  309  /* Introduce delay depending o=
n context and configuration. */
cd290ec24633f51 Marco Elver 2020-08-21  310  static void delay_access(int t=
ype)
dfd402a4c4baae4 Marco Elver 2019-11-14  311  {
80d4c4775216602 Marco Elver 2020-02-07  312  	unsigned int delay =3D in_tas=
k() ? kcsan_udelay_task : kcsan_udelay_interrupt;
106a307fd0a762e Marco Elver 2020-07-24  313  	/* For certain access types, =
skew the random delay to be longer. */
106a307fd0a762e Marco Elver 2020-07-24 @314  	unsigned int skew_delay_order=
 =3D
106a307fd0a762e Marco Elver 2020-07-24  315  		(type & (KCSAN_ACCESS_COMPOU=
ND | KCSAN_ACCESS_ASSERT)) ? 1 : 0;
106a307fd0a762e Marco Elver 2020-07-24  316  =

cd290ec24633f51 Marco Elver 2020-08-21  317  	delay -=3D IS_ENABLED(CONFIG_=
KCSAN_DELAY_RANDOMIZE) ?
cd290ec24633f51 Marco Elver 2020-08-21  318  			       kcsan_prandom_u32_ma=
x(delay >> skew_delay_order) :
cd290ec24633f51 Marco Elver 2020-08-21  319  			       0;
cd290ec24633f51 Marco Elver 2020-08-21  320  	udelay(delay);
dfd402a4c4baae4 Marco Elver 2019-11-14  321  }
dfd402a4c4baae4 Marco Elver 2019-11-14  322  =


:::::: The code at line 269 was first introduced by commit
:::::: dfd402a4c4baae42398ce9180ff424d589b8bffc kcsan: Add Kernel Concurren=
cy Sanitizer infrastructure

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5612887986947018150==--

