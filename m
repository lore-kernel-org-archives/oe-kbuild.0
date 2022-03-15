Content-Type: multipart/mixed; boundary="===============4907495989219578732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8478/11953] lib/stackinit_kunit.c:259:8: warning: Excessive padding in 'struct test_big_hole' (124 padding bytes, where 60 is optimal).
Date: Tue, 15 Mar 2022 15:46:07 +0800
Message-ID: <202203151502.kyJFS2EG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4907495989219578732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 8d60400704e503ded9f0c2ea32c2303d22955888 [8478/11953] lib: stackini=
t: Convert to KUnit
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-c004-20220302 (https://download.01.org/0day-ci/arch=
ive/20220315/202203151502.kyJFS2EG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D8d60400704e503ded9f0c2ea32c2303d22955888
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8d60400704e503ded9f0c2ea32c2303d22955888
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/rcu/rcuscale.c:431:3: note: Taking true branch
                   if (gp_async) {
                   ^
   kernel/rcu/rcuscale.c:433:9: note: 'rhp' is non-null
                           if (!rhp)
                                ^~~
   kernel/rcu/rcuscale.c:433:4: note: Taking false branch
                           if (!rhp)
                           ^
   kernel/rcu/rcuscale.c:435:8: note: 'rhp' is non-null
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                               ^~~
   kernel/rcu/rcuscale.c:435:8: note: Left side of '&&' is true
   kernel/rcu/rcuscale.c:435:27: note: Loop condition is false.  Exiting lo=
op
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
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
   kernel/rcu/rcuscale.c:435:15: note: Assuming the condition is false
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:435:4: note: Taking false branch
                           if (rhp && atomic_read(this_cpu_ptr(&n_async_inf=
light)) < gp_async_max) {
                           ^
   kernel/rcu/rcuscale.c:439:15: note: Assuming the condition is false
                           } else if (!kthread_should_stop()) {
                                      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:439:11: note: Taking false branch
                           } else if (!kthread_should_stop()) {
                                  ^
   kernel/rcu/rcuscale.c:443:5: note: Attempt to free released memory
                                   kfree(rhp); /* Because we are stopping. =
*/
                                   ^~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   134 warnings generated.
>> lib/stackinit_kunit.c:259:8: warning: Excessive padding in 'struct test_=
big_hole' (124 padding bytes, where 60 is optimal). =

   Optimal fields order: =

   four, =

   one, =

   two, =

   three, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct test_big_hole {
   ~~~~~~~^~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:259:8: note: Excessive padding in 'struct test_big=
_hole' (124 padding bytes, where 60 is optimal). Optimal fields order: four=
, one, two, three, consider reordering the fields or adding explicit paddin=
g members
   struct test_big_hole {
   ~~~~~~~^~~~~~~~~~~~~~~
>> lib/stackinit_kunit.c:333:1: warning: Address of stack memory associated=
 with local variable 'var' is still referred to by the global variable 'fil=
l_start' upon returning to the caller.  This will be a dangling reference [=
clang-analyzer-core.StackAddressEscape]
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/stackinit_kunit.c:333:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:333:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:333:1: note: Calling 'leaf_u8_zero'
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:163:12: note: expanded from macro '\DEFINE_TEST_DR=
IVER'
           ignored =3D leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/stackinit_kunit.c:333:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:223:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/stackinit_kunit.c:333:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:223:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/stackinit_kunit.c:333:1: note: Address of stack memory associated wi=
th local variable 'var' is still referred to by the global variable 'fill_s=
tart' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
>> lib/stackinit_kunit.c:333:1: warning: Address of stack memory associated=
 with local variable 'var' is still referred to by the global variable 'tar=
get_start' upon returning to the caller.  This will be a dangling reference=
 [clang-analyzer-core.StackAddressEscape]
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/stackinit_kunit.c:333:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:333:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:333:1: note: Calling 'leaf_u8_zero'
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:163:12: note: expanded from macro '\DEFINE_TEST_DR=
IVER'
           ignored =3D leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/stackinit_kunit.c:333:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:223:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/stackinit_kunit.c:333:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:223:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/stackinit_kunit.c:333:1: note: Address of stack memory associated wi=
th local variable 'var' is still referred to by the global variable 'target=
_start' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
--
                   ^
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
   lib/stackinit_kunit.c:343:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:343:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:343:1: note: Calling 'leaf_u8_none'
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:163:12: note: expanded from macro '\DEFINE_TEST_DR=
IVER'
           ignored =3D leaf_ ##name((unsigned long)&ignored, 1,      \
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   lib/stackinit_kunit.c:343:1: note: 'fill' is true
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:223:6: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
               ^~~~
   lib/stackinit_kunit.c:343:1: note: Taking true branch
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:223:2: note: expanded from macro 'DEFINE_TEST'
           if (fill) {                                             \
           ^
   lib/stackinit_kunit.c:343:1: note: Address of stack memory associated wi=
th local variable 'var' is still referred to by the global variable 'target=
_start' upon returning to the caller.  This will be a dangling reference
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:237:2: note: expanded from macro 'DEFINE_TEST'
           return (int)buf[0] | (int)buf[sizeof(buf) - 1];         \
           ^
>> lib/stackinit_kunit.c:343:1: warning: Undefined or garbage value returne=
d to caller [clang-analyzer-core.uninitialized.UndefReturn]
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:204:3: note: expanded from macro 'DEFINE_TEST'
                   return DO_NOTHING_RETURN_ ## which(ptr);        \
                   ^
   lib/stackinit_kunit.c:343:1: note: Taking false branch
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/stackinit_kunit.c:343:1: note: Loop condition is false.  Exiting loop
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/stackinit_kunit.c:343:1: note: Loop condition is true.  Entering loo=
p body
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:166:2: note: expanded from macro '\DEFINE_TEST_DRI=
VER'
           for (sum =3D 0, i =3D 0; i < target_size; i++)              \
           ^
   lib/stackinit_kunit.c:343:1: note: Assuming the condition is false
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:167:11: note: expanded from macro '\DEFINE_TEST_DR=
IVER'
                   sum +=3D (check_buf[i] !=3D 0xFF);                  \
                           ^~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: Loop condition is false. Execution co=
ntinues on line 343
   DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   ^
   lib/stackinit_kunit.c:309:3: note: expanded from macro 'DEFINE_SCALAR_TE=
STS'
                   DEFINE_SCALAR_TEST(u8, init, xfail);            \
                   ^
   lib/stackinit_kunit.c:305:3: note: expanded from macro 'DEFINE_SCALAR_TE=
ST'
                   DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
                   ^
   lib/stackinit_kunit.c:238:10: note: expanded from macro 'DEFINE_TEST'
   }                                                               \
                                                                   ^
   lib/stackinit_kunit.c:166:2: note: expanded from macro '\DEFINE_TEST_DRI=
VER'
           for (sum =3D 0, i =3D 0; i < target_size; i++)              \
           ^

vim +259 lib/stackinit_kunit.c

50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  257  =

f9398f15605a501 lib/test_stackinit.c  Kees Cook 2021-07-23  258  /* Trigger=
 unhandled padding in a structure. */
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23 @259  struct tes=
t_big_hole {
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  260  	u8 one;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  261  	u8 two;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  262  	u8 three;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  263  	/* 61 byt=
e padding hole here. */
f9398f15605a501 lib/test_stackinit.c  Kees Cook 2021-07-23  264  	u8 four _=
_aligned(64);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  265  } __aligne=
d(64);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  266  =

50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  267  struct tes=
t_trailing_hole {
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  268  	char *one;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  269  	char *two;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  270  	char *thr=
ee;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  271  	char four;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  272  	/* "sizeo=
f(unsigned long) - 1" byte padding hole here. */
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  273  };
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  274  =

50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  275  /* Test if=
 STRUCTLEAK is clearing structs with __user fields. */
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  276  struct tes=
t_user {
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  277  	u8 one;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  278  	unsigned =
long two;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  279  	char __us=
er *three;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  280  	unsigned =
long four;
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  281  };
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  282  =

8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  283  #define AL=
WAYS_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  284  #define AL=
WAYS_FAIL	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  285  =

8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  286  #ifdef CON=
FIG_INIT_STACK_NONE
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  287  # define U=
SER_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  288  # define B=
YREF_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  289  # define S=
TRONG_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  290  #elif defi=
ned(CONFIG_GCC_PLUGIN_STRUCTLEAK_USER)
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  291  # define U=
SER_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  292  # define B=
YREF_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  293  # define S=
TRONG_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  294  #elif defi=
ned(CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF)
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  295  # define U=
SER_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  296  # define B=
YREF_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  297  # define S=
TRONG_PASS	XFAIL
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  298  #else
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  299  # define U=
SER_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  300  # define B=
YREF_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  301  # define S=
TRONG_PASS	WANT_SUCCESS
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  302  #endif
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  303  =

a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  304  #define DE=
FINE_SCALAR_TEST(name, init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  305  		DEFINE_T=
EST(name ## _ ## init, name, SCALAR,	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  306  			    ini=
t, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  307  =

a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  308  #define DE=
FINE_SCALAR_TESTS(init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  309  		DEFINE_S=
CALAR_TEST(u8, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  310  		DEFINE_S=
CALAR_TEST(u16, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  311  		DEFINE_S=
CALAR_TEST(u32, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  312  		DEFINE_S=
CALAR_TEST(u64, init, xfail);		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  313  		DEFINE_T=
EST(char_array_ ## init, unsigned char,	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  314  			    STR=
ING, init, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  315  =

a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  316  #define DE=
FINE_STRUCT_TEST(name, init, xfail)			\
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  317  		DEFINE_T=
EST(name ## _ ## init,			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  318  			    str=
uct test_ ## name, STRUCT, init, \
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  319  			    xfa=
il)
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  320  =

a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  321  #define DE=
FINE_STRUCT_TESTS(init, xfail)			\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  322  		DEFINE_S=
TRUCT_TEST(small_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  323  		DEFINE_S=
TRUCT_TEST(big_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  324  		DEFINE_S=
TRUCT_TEST(trailing_hole, init, xfail);	\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  325  		DEFINE_S=
TRUCT_TEST(packed, init, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  326  =

8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  327  #define DE=
FINE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  328  		DEFINE_S=
TRUCT_TESTS(base ## _ ## partial,	\
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  329  				    xf=
ail);			\
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  330  		DEFINE_S=
TRUCT_TESTS(base ## _ ## all, xfail)
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  331  =

50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  332  /* These s=
hould be fully initialized all the time! */
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16 @333  DEFINE_SCA=
LAR_TESTS(zero, ALWAYS_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  334  DEFINE_STR=
UCT_TESTS(zero, ALWAYS_PASS);
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  335  /* Struct =
initializers: padding may be left uninitialized. */
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  336  DEFINE_STR=
UCT_INITIALIZER_TESTS(static, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  337  DEFINE_STR=
UCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  338  DEFINE_STR=
UCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  339  DEFINE_STR=
UCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  340  DEFINE_STR=
UCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  341  DEFINE_STR=
UCT_TESTS(assigned_copy, ALWAYS_FAIL);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  342  /* No init=
ialization without compiler instrumentation. */
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16 @343  DEFINE_SCA=
LAR_TESTS(none, STRONG_PASS);
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  344  DEFINE_STR=
UCT_TESTS(none, BYREF_PASS);
a8fc576d4af2f23 lib/test_stackinit.c  Kees Cook 2021-07-23  345  /* Initial=
ization of members with __user attribute. */
8d60400704e503d lib/stackinit_kunit.c Kees Cook 2022-02-16  346  DEFINE_TES=
T(user, struct test_user, STRUCT, none, USER_PASS);
50ceaa95ea09703 lib/test_stackinit.c  Kees Cook 2019-01-23  347  =


:::::: The code@line 259 was first introduced by commit
:::::: 50ceaa95ea09703722b30b4afa617c972071cd7f lib: Introduce test_stackin=
it module

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4907495989219578732==--

