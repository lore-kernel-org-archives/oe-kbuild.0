Content-Type: multipart/mixed; boundary="===============7078701122447599588=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/lib/test_unwind.c:214:25: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 28 May 2022 23:13:59 +0800
Message-ID: <202205282332.S4113AQu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7078701122447599588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Sven Schnelle <svens@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 58d4a785da45984ff7cf3046d5c3c35002c9d721 s390/lib: use call_on_stac=
k() macro
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/arch=
ive/20220528/202205282332.S4113AQu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D58d4a785da45984ff7cf3046d5c3c35002c9d721
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58d4a785da45984ff7cf3046d5c3c35002c9d721
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   arch/s390/include/asm/stacktrace.h:40:2: note: Taking false branch
           if (regs)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/s390/include/asm/stacktrace.h:42:14: note: Dereference of null poin=
ter
           if (task =3D=3D current)
                       ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/include/asm/unwind.h:63:17: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           task =3D task ?: current;
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/lib/test_unwind.c:51:6: note: Assuming 'bt' is non-null
           if (!bt) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/s390/lib/test_unwind.c:51:2: note: '?' condition is false
           if (!bt) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/s390/lib/test_unwind.c:51:7: note: 'bt' is non-null
           if (!bt) {
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
   arch/s390/lib/test_unwind.c:51:2: note: '?' condition is false
           if (!bt) {
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
   arch/s390/lib/test_unwind.c:51:2: note: Taking false branch
           if (!bt) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/s390/lib/test_unwind.c:59:2: note: Calling 'unwind_start'
           unwind_for_each_frame(&state, task, regs, sp) {
           ^
   arch/s390/include/asm/unwind.h:74:7: note: expanded from macro 'unwind_f=
or_each_frame'
           for (unwind_start(state, task, regs, first_frame);      \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/unwind.h:63:9: note: '?' condition is false
           task =3D task ?: current;
                  ^
   arch/s390/include/asm/unwind.h:63:17: note: Dereference of null pointer
           task =3D task ?: current;
                          ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> arch/s390/lib/test_unwind.c:214:25: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
                   rc =3D call_on_stack(1, S390_lowcore.nodat_stack,
                                         ^
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is true
           struct unwindme *u =3D READ_ONCE(unwindme);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   arch/s390/lib/test_unwind.c:232:23: note: '?' condition is true
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
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
   arch/s390/lib/test_unwind.c:232:23: note: Left side of '||' is false
           struct unwindme *u =3D READ_ONCE(unwindme);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'

vim +214 arch/s390/lib/test_unwind.c

badbf397907982 Ilya Leoshkevich 2019-10-17  204  =

badbf397907982 Ilya Leoshkevich 2019-10-17  205  /* This function must appe=
ar in the backtrace. */
badbf397907982 Ilya Leoshkevich 2019-10-17  206  static noinline int unwind=
me_func2(struct unwindme *u)
badbf397907982 Ilya Leoshkevich 2019-10-17  207  {
f22b9c219a798e Heiko Carstens   2020-12-13  208  	unsigned long flags;
7868249fbbc812 Vasily Gorbik    2019-11-22  209  	int rc;
7868249fbbc812 Vasily Gorbik    2019-11-22  210  =

7868249fbbc812 Vasily Gorbik    2019-11-22  211  	if (u->flags & UWM_SWITCH=
_STACK) {
f22b9c219a798e Heiko Carstens   2020-12-13  212  		local_irq_save(flags);
f22b9c219a798e Heiko Carstens   2020-12-13  213  		local_mcck_disable();
58d4a785da4598 Heiko Carstens   2021-07-05 @214  		rc =3D call_on_stack(1, =
S390_lowcore.nodat_stack,
58d4a785da4598 Heiko Carstens   2021-07-05  215  				   int, unwindme_func3=
, struct unwindme *, u);
f22b9c219a798e Heiko Carstens   2020-12-13  216  		local_mcck_enable();
f22b9c219a798e Heiko Carstens   2020-12-13  217  		local_irq_restore(flags);
7868249fbbc812 Vasily Gorbik    2019-11-22  218  		return rc;
7868249fbbc812 Vasily Gorbik    2019-11-22  219  	} else {
badbf397907982 Ilya Leoshkevich 2019-10-17  220  		return unwindme_func3(u);
badbf397907982 Ilya Leoshkevich 2019-10-17  221  	}
7868249fbbc812 Vasily Gorbik    2019-11-22  222  }
badbf397907982 Ilya Leoshkevich 2019-10-17  223  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7078701122447599588==--

