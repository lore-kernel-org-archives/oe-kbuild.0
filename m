Content-Type: multipart/mixed; boundary="===============8751407556315231586=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/stackinit_kunit.c:259:8: warning: Excessive padding in 'struct test_big_hole' (124 padding bytes, where 60 is optimal).
Date: Mon, 28 Mar 2022 20:05:48 +0800
Message-ID: <202203282058.10uS3Sxv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8751407556315231586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to=
 KUnit
date:   7 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220328/202203282058.10uS3Sxv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D02788ebcf521fe78c24eb221fd1ed7f86792c330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 02788ebcf521fe78c24eb221fd1ed7f86792c330
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   mm/slab.c:3855:2: note: Loop condition is false.  Exiting loop
           check_irq_on();
           ^
   mm/slab.c:2127:24: note: expanded from macro 'check_irq_on'
   #define check_irq_on()  do { } while(0)
                           ^
   mm/slab.c:3860:7: note: 'prev' is non-null
           if (!prev)
                ^~~~
   mm/slab.c:3860:2: note: Taking false branch
           if (!prev)
           ^
   mm/slab.c:3863:2: note: Loop condition is true.  Entering loop body
           for_each_online_cpu(cpu) {
           ^
   include/linux/cpumask.h:815:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   mm/slab.c:3867:28: note: Loop condition is false.  Exiting loop
                   struct array_cache *ac =3D per_cpu_ptr(prev, cpu);
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
   mm/slab.c:3872:3: note: Calling 'free_block'
                   free_block(cachep, ac->entry, ac->avail, node, &list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:3332:14: note: Assuming 'i' is >=3D 'nr_objects'
           for (i =3D 0; i < nr_objects; i++) {
                       ^~~~~~~~~~~~~~
   mm/slab.c:3332:2: note: Loop condition is false. Execution continues on =
line 3357
           for (i =3D 0; i < nr_objects; i++) {
           ^
   mm/slab.c:3357:9: note: Assuming field 'free_objects' is <=3D field 'fre=
e_limit'
           while (n->free_objects > n->free_limit && !list_empty(&n->slabs_=
free)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:3357:41: note: Left side of '&&' is false
           while (n->free_objects > n->free_limit && !list_empty(&n->slabs_=
free)) {
                                                  ^
   mm/slab.c:3872:3: note: Returning from 'free_block'
                   free_block(cachep, ac->entry, ac->avail, node, &list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:3874:3: note: Calling 'slabs_destroy'
                   slabs_destroy(cachep, &list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:1648:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(slab, n, list, slab_list) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
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
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
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

50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  257  =

f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23  258  /* Trigger =
unhandled padding in a structure. */
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23 @259  struct test=
_big_hole {
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  260  	u8 one;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  261  	u8 two;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  262  	u8 three;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  263  	/* 61 byte=
 padding hole here. */
f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23  264  	u8 four __=
aligned(64);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  265  } __aligned=
(64);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  266  =

50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  267  struct test=
_trailing_hole {
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  268  	char *one;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  269  	char *two;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  270  	char *thre=
e;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  271  	char four;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  272  	/* "sizeof=
(unsigned long) - 1" byte padding hole here. */
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  273  };
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  274  =

50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  275  /* Test if =
STRUCTLEAK is clearing structs with __user fields. */
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  276  struct test=
_user {
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  277  	u8 one;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  278  	unsigned l=
ong two;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  279  	char __use=
r *three;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  280  	unsigned l=
ong four;
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  281  };
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  282  =

02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  283  #define ALW=
AYS_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  284  #define ALW=
AYS_FAIL	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  285  =

02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  286  #ifdef CONF=
IG_INIT_STACK_NONE
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  287  # define US=
ER_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  288  # define BY=
REF_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  289  # define ST=
RONG_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  290  #elif defin=
ed(CONFIG_GCC_PLUGIN_STRUCTLEAK_USER)
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  291  # define US=
ER_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  292  # define BY=
REF_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  293  # define ST=
RONG_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  294  #elif defin=
ed(CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF)
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  295  # define US=
ER_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  296  # define BY=
REF_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  297  # define ST=
RONG_PASS	XFAIL
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  298  #else
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  299  # define US=
ER_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  300  # define BY=
REF_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  301  # define ST=
RONG_PASS	WANT_SUCCESS
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  302  #endif
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  303  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  304  #define DEF=
INE_SCALAR_TEST(name, init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  305  		DEFINE_TE=
ST(name ## _ ## init, name, SCALAR,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  306  			    init=
, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  307  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  308  #define DEF=
INE_SCALAR_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  309  		DEFINE_SC=
ALAR_TEST(u8, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  310  		DEFINE_SC=
ALAR_TEST(u16, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  311  		DEFINE_SC=
ALAR_TEST(u32, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  312  		DEFINE_SC=
ALAR_TEST(u64, init, xfail);		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  313  		DEFINE_TE=
ST(char_array_ ## init, unsigned char,	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  314  			    STRI=
NG, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  315  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  316  #define DEF=
INE_STRUCT_TEST(name, init, xfail)			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  317  		DEFINE_TE=
ST(name ## _ ## init,			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  318  			    stru=
ct test_ ## name, STRUCT, init, \
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  319  			    xfai=
l)
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  320  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  321  #define DEF=
INE_STRUCT_TESTS(init, xfail)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  322  		DEFINE_ST=
RUCT_TEST(small_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  323  		DEFINE_ST=
RUCT_TEST(big_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  324  		DEFINE_ST=
RUCT_TEST(trailing_hole, init, xfail);	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  325  		DEFINE_ST=
RUCT_TEST(packed, init, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  326  =

02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  327  #define DEF=
INE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  328  		DEFINE_ST=
RUCT_TESTS(base ## _ ## partial,	\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  329  				    xfa=
il);			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  330  		DEFINE_ST=
RUCT_TESTS(base ## _ ## all, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  331  =

50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  332  /* These sh=
ould be fully initialized all the time! */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16 @333  DEFINE_SCAL=
AR_TESTS(zero, ALWAYS_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  334  DEFINE_STRU=
CT_TESTS(zero, ALWAYS_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  335  /* Struct i=
nitializers: padding may be left uninitialized. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  336  DEFINE_STRU=
CT_INITIALIZER_TESTS(static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  337  DEFINE_STRU=
CT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  338  DEFINE_STRU=
CT_INITIALIZER_TESTS(runtime, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  339  DEFINE_STRU=
CT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  340  DEFINE_STRU=
CT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  341  DEFINE_STRU=
CT_TESTS(assigned_copy, ALWAYS_FAIL);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  342  /* No initi=
alization without compiler instrumentation. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16 @343  DEFINE_SCAL=
AR_TESTS(none, STRONG_PASS);
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  344  DEFINE_STRU=
CT_TESTS(none, BYREF_PASS);
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  345  /* Initiali=
zation of members with __user attribute. */
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  346  DEFINE_TEST=
(user, struct test_user, STRUCT, none, USER_PASS);
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  347  =


:::::: The code@line 259 was first introduced by commit
:::::: 50ceaa95ea09703722b30b4afa617c972071cd7f lib: Introduce test_stackin=
it module

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8751407556315231586==--

