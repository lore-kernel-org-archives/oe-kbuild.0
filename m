Content-Type: multipart/mixed; boundary="===============4461867170761585414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/kfence/kfence_test.c:160:2: warning: Value stored to 'cur' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 14 Jun 2022 12:35:19 +0800
Message-ID: <202206141207.ZpVKOd0h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4461867170761585414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 mm/kfence/kfence_test.c:160:2: warning: Value stored to 'cur' is never rea=
d [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: e41ba1115a351dd037c21ac75660638219d51485 s390: add support for KFEN=
CE
date:   11 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141207.ZpVKOd0h-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d37826=
8ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De41ba1115a351dd037c21ac75660638219d51485
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e41ba1115a351dd037c21ac75660638219d51485
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                 ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/fscache/fsdef.c:82:2: note: Assuming the condition is true
           _enter("{%s},,%hu", netfs->name, datalen);
           ^
   fs/fscache/internal.h:394:6: note: expanded from macro '_enter'
           if (__do_kdebug(ENTER))                 \
               ^~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:427:2: note: expanded from macro '__do_kdebug'
           ___do_kdebug(FSCACHE_DEBUG_LEVEL, POINT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:425:2: note: expanded from macro '___do_kdebug'
           ____do_kdebug(LEVEL, POINT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:422:2: note: expanded from macro '____do_kdebug'
           unlikely((fscache_debug & \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/fscache/fsdef.c:82:2: note: Taking false branch
           _enter("{%s},,%hu", netfs->name, datalen);
           ^
   fs/fscache/internal.h:394:2: note: expanded from macro '_enter'
           if (__do_kdebug(ENTER))                 \
           ^
   fs/fscache/fsdef.c:82:2: note: Loop condition is false.  Exiting loop
           _enter("{%s},,%hu", netfs->name, datalen);
           ^
   fs/fscache/internal.h:392:28: note: expanded from macro '_enter'
   #define _enter(FMT, ...)                        \
                                                   ^
   fs/fscache/fsdef.c:84:6: note: Assuming the condition is false
           if (datalen !=3D sizeof(version)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/fsdef.c:84:2: note: Taking false branch
           if (datalen !=3D sizeof(version)) {
           ^
   fs/fscache/fsdef.c:90:6: note: Assuming 'version' is equal to field 'ver=
sion'
           if (version !=3D netfs->version) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/fsdef.c:90:2: note: Taking false branch
           if (version !=3D netfs->version) {
           ^
   fs/fscache/fsdef.c:95:2: note: Assuming the condition is false
           _leave(" =3D OKAY");
           ^
   fs/fscache/internal.h:400:6: note: expanded from macro '_leave'
           if (__do_kdebug(LEAVE))                 \
               ^~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:427:2: note: expanded from macro '__do_kdebug'
           ___do_kdebug(FSCACHE_DEBUG_LEVEL, POINT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:425:2: note: expanded from macro '___do_kdebug'
           ____do_kdebug(LEVEL, POINT)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:422:2: note: expanded from macro '____do_kdebug'
           unlikely((fscache_debug & \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/fscache/fsdef.c:95:2: note: Taking true branch
           _leave(" =3D OKAY");
           ^
   fs/fscache/internal.h:400:2: note: expanded from macro '_leave'
           if (__do_kdebug(LEAVE))                 \
           ^
   fs/fscache/fsdef.c:95:2: note: Dereference of null pointer
           _leave(" =3D OKAY");
           ^
   fs/fscache/internal.h:401:3: note: expanded from macro '_leave'
                   kleave(FMT, ##__VA_ARGS__);     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/internal.h:381:26: note: expanded from macro 'kleave'
   #define kleave(FMT, ...) dbgprintk("<=3D=3D %s()"FMT"", __func__, ##__VA=
_ARGS__)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/fscache/internal.h:378:40: note: expanded from macro 'dbgprintk'
           printk(KERN_DEBUG "[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS=
__)
                                                 ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
>> mm/kfence/kfence_test.c:160:2: warning: Value stored to 'cur' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:160:2: note: Value stored to 'cur' is never read
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kfence/kfence_test.c:376:2: warning: Use of memory after it is freed =
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
   mm/kfence/kfence_test.c:375:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:217:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:217:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:220:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:375:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:376:2: note: Left side of '||' is true
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
   mm/kfence/kfence_test.c:376:2: note: Taking false branch
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
   mm/kfence/kfence_test.c:376:2: note: Loop condition is false.  Exiting l=
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
   mm/kfence/kfence_test.c:376:2: note: Use of memory after it is freed
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
   mm/kfence/kfence_test.c:391:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           test_free(expect.addr); /* Double-free. */
           ^         ~~~~~~~~~~~
   mm/kfence/kfence_test.c:390:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:217:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:217:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:220:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:390:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:391:2: note: Use of memory after it is freed
           test_free(expect.addr); /* Double-free. */
--
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:217:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:220:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:407:2: note: Returning; memory was released
           test_free(expect.addr); /* Invalid address free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:408:2: note: Use of memory after it is freed
           test_free(buf); /* No error. */
           ^         ~~~
   mm/kfence/kfence_test.c:669:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1353:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:990:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:980:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:866:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
   mm/kfence/kfence_test.c:662:2: note: Assuming 'test_cache' is non-null
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1313:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:829:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:821:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:811:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:773:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:662:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1313:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:829:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:821:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:810:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:769:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:668:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:217:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:217:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:220:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:668:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:669:2: note: Use of memory after it is freed
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1353:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:990:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:980:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:866:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
>> mm/kfence/kfence_test.c:703:10: warning: Array access (from variable 'bu=
f') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                   buf[i] =3D i + 1;
                   ~~~    ^
   mm/kfence/kfence_test.c:691:2: note: 'expect.addr' initialized to a null=
 pointer value
           const struct expect_report expect =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:697:2: note: 'buf' initialized to a null pointer=
 value
           char *buf =3D expect.addr;
           ^~~~~~~~~
   mm/kfence/kfence_test.c:700:2: note: Assuming 'test_cache' is non-null
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1332:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:840:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:832:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:811:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:773:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:700:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1332:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:840:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:832:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:810:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:769:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:701:2: note: Assuming '__left' is not equal to '=
__right'
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1353:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:990:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:980:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:870:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:773:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:701:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1353:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:990:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:980:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:869:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:769:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:701:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1353:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:990:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:980:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \

vim +/cur +160 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver   2021-02-25   88  =

bc8fbc5f305aec Marco Elver   2021-02-25   89  /* Check observed report matc=
hes information in @r. */
bc8fbc5f305aec Marco Elver   2021-02-25   90  static bool report_matches(co=
nst struct expect_report *r)
bc8fbc5f305aec Marco Elver   2021-02-25   91  {
f99e12b21b84fe Sven Schnelle 2021-07-28   92  	unsigned long addr =3D (unsi=
gned long)r->addr;
bc8fbc5f305aec Marco Elver   2021-02-25   93  	bool ret =3D false;
bc8fbc5f305aec Marco Elver   2021-02-25   94  	unsigned long flags;
bc8fbc5f305aec Marco Elver   2021-02-25   95  	typeof(observed.lines) expec=
t;
bc8fbc5f305aec Marco Elver   2021-02-25   96  	const char *end;
bc8fbc5f305aec Marco Elver   2021-02-25   97  	char *cur;
bc8fbc5f305aec Marco Elver   2021-02-25   98  =

bc8fbc5f305aec Marco Elver   2021-02-25   99  	/* Doubled-checked locking. =
*/
bc8fbc5f305aec Marco Elver   2021-02-25  100  	if (!report_available())
bc8fbc5f305aec Marco Elver   2021-02-25  101  		return false;
bc8fbc5f305aec Marco Elver   2021-02-25  102  =

bc8fbc5f305aec Marco Elver   2021-02-25  103  	/* Generate expected report =
contents. */
bc8fbc5f305aec Marco Elver   2021-02-25  104  =

bc8fbc5f305aec Marco Elver   2021-02-25  105  	/* Title */
bc8fbc5f305aec Marco Elver   2021-02-25  106  	cur =3D expect[0];
bc8fbc5f305aec Marco Elver   2021-02-25  107  	end =3D &expect[0][sizeof(ex=
pect[0]) - 1];
bc8fbc5f305aec Marco Elver   2021-02-25  108  	switch (r->type) {
bc8fbc5f305aec Marco Elver   2021-02-25  109  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver   2021-02-25  110  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: out-of-bounds %s",
bc8fbc5f305aec Marco Elver   2021-02-25  111  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  112  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  113  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver   2021-02-25  114  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: use-after-free %s",
bc8fbc5f305aec Marco Elver   2021-02-25  115  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  116  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  117  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver   2021-02-25  118  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: memory corruption");
bc8fbc5f305aec Marco Elver   2021-02-25  119  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  120  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver   2021-02-25  121  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: invalid %s",
bc8fbc5f305aec Marco Elver   2021-02-25  122  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  123  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  124  	case KFENCE_ERROR_INVALID_FR=
EE:
bc8fbc5f305aec Marco Elver   2021-02-25  125  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: invalid free");
bc8fbc5f305aec Marco Elver   2021-02-25  126  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  127  	}
bc8fbc5f305aec Marco Elver   2021-02-25  128  =

bc8fbc5f305aec Marco Elver   2021-02-25  129  	scnprintf(cur, end - cur, " =
in %pS", r->fn);
bc8fbc5f305aec Marco Elver   2021-02-25  130  	/* The exact offset won't ma=
tch, remove it; also strip module name. */
bc8fbc5f305aec Marco Elver   2021-02-25  131  	cur =3D strchr(expect[0], '+=
');
bc8fbc5f305aec Marco Elver   2021-02-25  132  	if (cur)
bc8fbc5f305aec Marco Elver   2021-02-25  133  		*cur =3D '\0';
bc8fbc5f305aec Marco Elver   2021-02-25  134  =

bc8fbc5f305aec Marco Elver   2021-02-25  135  	/* Access information */
bc8fbc5f305aec Marco Elver   2021-02-25  136  	cur =3D expect[1];
bc8fbc5f305aec Marco Elver   2021-02-25  137  	end =3D &expect[1][sizeof(ex=
pect[1]) - 1];
bc8fbc5f305aec Marco Elver   2021-02-25  138  =

bc8fbc5f305aec Marco Elver   2021-02-25  139  	switch (r->type) {
bc8fbc5f305aec Marco Elver   2021-02-25  140  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver   2021-02-25  141  		cur +=3D scnprintf(cur, end=
 - cur, "Out-of-bounds %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  142  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  143  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  144  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver   2021-02-25  145  		cur +=3D scnprintf(cur, end=
 - cur, "Use-after-free %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  146  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  147  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  148  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver   2021-02-25  149  		cur +=3D scnprintf(cur, end=
 - cur, "Corrupted memory at");
bc8fbc5f305aec Marco Elver   2021-02-25  150  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  151  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver   2021-02-25  152  		cur +=3D scnprintf(cur, end=
 - cur, "Invalid %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  153  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  154  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  155  	case KFENCE_ERROR_INVALID_FR=
EE:
bc8fbc5f305aec Marco Elver   2021-02-25  156  		cur +=3D scnprintf(cur, end=
 - cur, "Invalid free of");
bc8fbc5f305aec Marco Elver   2021-02-25  157  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  158  	}
bc8fbc5f305aec Marco Elver   2021-02-25  159  =

f99e12b21b84fe Sven Schnelle 2021-07-28 @160  	cur +=3D scnprintf(cur, end =
- cur, " 0x%p", (void *)addr);
bc8fbc5f305aec Marco Elver   2021-02-25  161  =

bc8fbc5f305aec Marco Elver   2021-02-25  162  	spin_lock_irqsave(&observed.=
lock, flags);
bc8fbc5f305aec Marco Elver   2021-02-25  163  	if (!report_available())
bc8fbc5f305aec Marco Elver   2021-02-25  164  		goto out; /* A new report i=
s being captured. */
bc8fbc5f305aec Marco Elver   2021-02-25  165  =

bc8fbc5f305aec Marco Elver   2021-02-25  166  	/* Finally match expected ou=
tput to what we actually observed. */
bc8fbc5f305aec Marco Elver   2021-02-25  167  	ret =3D strstr(observed.line=
s[0], expect[0]) && strstr(observed.lines[1], expect[1]);
bc8fbc5f305aec Marco Elver   2021-02-25  168  out:
bc8fbc5f305aec Marco Elver   2021-02-25  169  	spin_unlock_irqrestore(&obse=
rved.lock, flags);
bc8fbc5f305aec Marco Elver   2021-02-25  170  	return ret;
bc8fbc5f305aec Marco Elver   2021-02-25  171  }
bc8fbc5f305aec Marco Elver   2021-02-25  172  =


:::::: The code at line 160 was first introduced by commit
:::::: f99e12b21b84feb1fd9d845a15096772f1659461 kfence: add function to mas=
k address bits

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4461867170761585414==--

