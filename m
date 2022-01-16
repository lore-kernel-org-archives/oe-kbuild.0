Content-Type: multipart/mixed; boundary="===============3348106988319224484=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/kfence/kfence_test.c:149:2: warning: Value stored to 'cur' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 16 Jan 2022 12:28:41 +0800
Message-ID: <202201161230.x9blJFjl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3348106988319224484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Liu Shixin <liushixin2@huawei.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a33f5c380c4bd3fa5278d690421b72052456d9fe
commit: 47513f243b452a5e21180dcf3d6ac1c57e1781a6 riscv: Enable KFENCE for r=
iscv64
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220116 (https://download.01.org/0day-ci/arc=
hive/20220116/202201161230.x9blJFjl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D47513f243b452a5e21180dcf3d6ac1c57e1781a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 47513f243b452a5e21180dcf3d6ac1c57e1781a6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/rcu/rcuscale.c:443:5: note: Memory is released
                                   kfree(rhp); /* Because we are stopping. =
*/
                                   ^~~~~~~~~~
   kernel/rcu/rcuscale.c:453:8: note: 'started' is false
                   if (!started &&
                        ^~~~~~~
   kernel/rcu/rcuscale.c:453:7: note: Left side of '&&' is true
                   if (!started &&
                       ^
   kernel/rcu/rcuscale.c:454:7: note: Assuming the condition is false
                       atomic_read(&n_rcu_scale_writer_started) >=3D nrealw=
riters)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   kernel/rcu/rcuscale.c:453:3: note: Taking false branch
                   if (!started &&
                   ^
   kernel/rcu/rcuscale.c:456:8: note: 'done' is false
                   if (!done && i >=3D MIN_MEAS) {
                        ^~~~
   kernel/rcu/rcuscale.c:456:7: note: Left side of '&&' is true
                   if (!done && i >=3D MIN_MEAS) {
                       ^
   kernel/rcu/rcuscale.c:456:16: note: 'i' is < MIN_MEAS
                   if (!done && i >=3D MIN_MEAS) {
                                ^
   kernel/rcu/rcuscale.c:456:3: note: Taking false branch
                   if (!done && i >=3D MIN_MEAS) {
                   ^
   kernel/rcu/rcuscale.c:480:7: note: 'done' is false
                   if (done && !alldone &&
                       ^~~~
   kernel/rcu/rcuscale.c:480:12: note: Left side of '&&' is false
                   if (done && !alldone &&
                            ^
   kernel/rcu/rcuscale.c:483:7: note: 'started' is false
                   if (started && !alldone && i < MAX_MEAS - 1)
                       ^~~~~~~
   kernel/rcu/rcuscale.c:483:15: note: Left side of '&&' is false
                   if (started && !alldone && i < MAX_MEAS - 1)
                               ^
   kernel/rcu/rcuscale.c:486:11: note: Assuming the condition is true
           } while (!torture_must_stop());
                    ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:426:2: note: Loop condition is true. Execution con=
tinues on line 427
           do {
           ^
   kernel/rcu/rcuscale.c:427:7: note: Assuming 'writer_holdoff' is 0
                   if (writer_holdoff)
                       ^~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:427:3: note: Taking false branch
                   if (writer_holdoff)
                   ^
   kernel/rcu/rcuscale.c:431:7: note: Assuming 'gp_async' is true
                   if (gp_async) {
                       ^~~~~~~~
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
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> mm/kfence/kfence_test.c:149:2: warning: Value stored to 'cur' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)r->addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:149:2: note: Value stored to 'cur' is never read
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)r->addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kfence/kfence_test.c:364:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           READ_ONCE(*expect.addr);
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
   mm/kfence/kfence_test.c:363:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:206:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:206:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:209:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:363:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:364:2: note: Left side of '||' is true
           READ_ONCE(*expect.addr);
           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   mm/kfence/kfence_test.c:364:2: note: Taking false branch
           READ_ONCE(*expect.addr);
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
   mm/kfence/kfence_test.c:364:2: note: Loop condition is false.  Exiting l=
oop
           READ_ONCE(*expect.addr);
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
   mm/kfence/kfence_test.c:364:2: note: Use of memory after it is freed
           READ_ONCE(*expect.addr);
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
   mm/kfence/kfence_test.c:379:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           test_free(expect.addr); /* Double-free. */
           ^         ~~~~~~~~~~~
   mm/kfence/kfence_test.c:378:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:206:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:206:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:209:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:378:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:379:2: note: Use of memory after it is freed
           test_free(expect.addr); /* Double-free. */
--
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:206:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:209:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:395:2: note: Returning; memory was released
           test_free(expect.addr); /* Invalid address free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:396:2: note: Use of memory after it is freed
           test_free(buf); /* No error. */
           ^         ~~~
   mm/kfence/kfence_test.c:657:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:776:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
   mm/kfence/kfence_test.c:650:2: note: Assuming 'test_cache' is non-null
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1224:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:650:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1224:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:656:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:206:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:206:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:209:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:656:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:657:2: note: Use of memory after it is freed
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:776:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
>> mm/kfence/kfence_test.c:691:10: warning: Array access (from variable 'bu=
f') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                   buf[i] =3D i + 1;
                   ~~~    ^
   mm/kfence/kfence_test.c:679:2: note: 'expect.addr' initialized to a null=
 pointer value
           const struct expect_report expect =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:685:2: note: 'buf' initialized to a null pointer=
 value
           char *buf =3D expect.addr;
           ^~~~~~~~~
   mm/kfence/kfence_test.c:688:2: note: Assuming 'test_cache' is non-null
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1243:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:750:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:742:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:688:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1243:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:750:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:742:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:689:2: note: Assuming '__left' is not equal to '=
__right'
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:781:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:689:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:689:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \

vim +/cur +149 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver 2021-02-25   81  =

bc8fbc5f305aec Marco Elver 2021-02-25   82  /* Check observed report matche=
s information in @r. */
bc8fbc5f305aec Marco Elver 2021-02-25   83  static bool report_matches(cons=
t struct expect_report *r)
bc8fbc5f305aec Marco Elver 2021-02-25   84  {
bc8fbc5f305aec Marco Elver 2021-02-25   85  	bool ret =3D false;
bc8fbc5f305aec Marco Elver 2021-02-25   86  	unsigned long flags;
bc8fbc5f305aec Marco Elver 2021-02-25   87  	typeof(observed.lines) expect;
bc8fbc5f305aec Marco Elver 2021-02-25   88  	const char *end;
bc8fbc5f305aec Marco Elver 2021-02-25   89  	char *cur;
bc8fbc5f305aec Marco Elver 2021-02-25   90  =

bc8fbc5f305aec Marco Elver 2021-02-25   91  	/* Doubled-checked locking. */
bc8fbc5f305aec Marco Elver 2021-02-25   92  	if (!report_available())
bc8fbc5f305aec Marco Elver 2021-02-25   93  		return false;
bc8fbc5f305aec Marco Elver 2021-02-25   94  =

bc8fbc5f305aec Marco Elver 2021-02-25   95  	/* Generate expected report co=
ntents. */
bc8fbc5f305aec Marco Elver 2021-02-25   96  =

bc8fbc5f305aec Marco Elver 2021-02-25   97  	/* Title */
bc8fbc5f305aec Marco Elver 2021-02-25   98  	cur =3D expect[0];
bc8fbc5f305aec Marco Elver 2021-02-25   99  	end =3D &expect[0][sizeof(expe=
ct[0]) - 1];
bc8fbc5f305aec Marco Elver 2021-02-25  100  	switch (r->type) {
bc8fbc5f305aec Marco Elver 2021-02-25  101  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver 2021-02-25  102  		cur +=3D scnprintf(cur, end -=
 cur, "BUG: KFENCE: out-of-bounds %s",
bc8fbc5f305aec Marco Elver 2021-02-25  103  				 get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  104  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  105  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver 2021-02-25  106  		cur +=3D scnprintf(cur, end -=
 cur, "BUG: KFENCE: use-after-free %s",
bc8fbc5f305aec Marco Elver 2021-02-25  107  				 get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  108  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  109  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver 2021-02-25  110  		cur +=3D scnprintf(cur, end -=
 cur, "BUG: KFENCE: memory corruption");
bc8fbc5f305aec Marco Elver 2021-02-25  111  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  112  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver 2021-02-25  113  		cur +=3D scnprintf(cur, end -=
 cur, "BUG: KFENCE: invalid %s",
bc8fbc5f305aec Marco Elver 2021-02-25  114  				 get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  115  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  116  	case KFENCE_ERROR_INVALID_FREE:
bc8fbc5f305aec Marco Elver 2021-02-25  117  		cur +=3D scnprintf(cur, end -=
 cur, "BUG: KFENCE: invalid free");
bc8fbc5f305aec Marco Elver 2021-02-25  118  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  119  	}
bc8fbc5f305aec Marco Elver 2021-02-25  120  =

bc8fbc5f305aec Marco Elver 2021-02-25  121  	scnprintf(cur, end - cur, " in=
 %pS", r->fn);
bc8fbc5f305aec Marco Elver 2021-02-25  122  	/* The exact offset won't matc=
h, remove it; also strip module name. */
bc8fbc5f305aec Marco Elver 2021-02-25  123  	cur =3D strchr(expect[0], '+');
bc8fbc5f305aec Marco Elver 2021-02-25  124  	if (cur)
bc8fbc5f305aec Marco Elver 2021-02-25  125  		*cur =3D '\0';
bc8fbc5f305aec Marco Elver 2021-02-25  126  =

bc8fbc5f305aec Marco Elver 2021-02-25  127  	/* Access information */
bc8fbc5f305aec Marco Elver 2021-02-25  128  	cur =3D expect[1];
bc8fbc5f305aec Marco Elver 2021-02-25  129  	end =3D &expect[1][sizeof(expe=
ct[1]) - 1];
bc8fbc5f305aec Marco Elver 2021-02-25  130  =

bc8fbc5f305aec Marco Elver 2021-02-25  131  	switch (r->type) {
bc8fbc5f305aec Marco Elver 2021-02-25  132  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver 2021-02-25  133  		cur +=3D scnprintf(cur, end -=
 cur, "Out-of-bounds %s at", get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  134  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  135  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver 2021-02-25  136  		cur +=3D scnprintf(cur, end -=
 cur, "Use-after-free %s at", get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  137  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  138  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver 2021-02-25  139  		cur +=3D scnprintf(cur, end -=
 cur, "Corrupted memory at");
bc8fbc5f305aec Marco Elver 2021-02-25  140  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  141  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver 2021-02-25  142  		cur +=3D scnprintf(cur, end -=
 cur, "Invalid %s at", get_access_type(r));
bc8fbc5f305aec Marco Elver 2021-02-25  143  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  144  	case KFENCE_ERROR_INVALID_FREE:
bc8fbc5f305aec Marco Elver 2021-02-25  145  		cur +=3D scnprintf(cur, end -=
 cur, "Invalid free of");
bc8fbc5f305aec Marco Elver 2021-02-25  146  		break;
bc8fbc5f305aec Marco Elver 2021-02-25  147  	}
bc8fbc5f305aec Marco Elver 2021-02-25  148  =

35beccf0926d42 Marco Elver 2021-02-25 @149  	cur +=3D scnprintf(cur, end - =
cur, " 0x%p", (void *)r->addr);
bc8fbc5f305aec Marco Elver 2021-02-25  150  =

bc8fbc5f305aec Marco Elver 2021-02-25  151  	spin_lock_irqsave(&observed.lo=
ck, flags);
bc8fbc5f305aec Marco Elver 2021-02-25  152  	if (!report_available())
bc8fbc5f305aec Marco Elver 2021-02-25  153  		goto out; /* A new report is =
being captured. */
bc8fbc5f305aec Marco Elver 2021-02-25  154  =

bc8fbc5f305aec Marco Elver 2021-02-25  155  	/* Finally match expected outp=
ut to what we actually observed. */
bc8fbc5f305aec Marco Elver 2021-02-25  156  	ret =3D strstr(observed.lines[=
0], expect[0]) && strstr(observed.lines[1], expect[1]);
bc8fbc5f305aec Marco Elver 2021-02-25  157  out:
bc8fbc5f305aec Marco Elver 2021-02-25  158  	spin_unlock_irqrestore(&observ=
ed.lock, flags);
bc8fbc5f305aec Marco Elver 2021-02-25  159  	return ret;
bc8fbc5f305aec Marco Elver 2021-02-25  160  }
bc8fbc5f305aec Marco Elver 2021-02-25  161  =


:::::: The code at line 149 was first introduced by commit
:::::: 35beccf0926d42ee0d56e41979ec8cdf814c4769 kfence: report sensitive in=
formation based on no_hash_pointers

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3348106988319224484==--

