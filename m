Content-Type: multipart/mixed; boundary="===============3983722820516489887=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/kfence/kfence_test.c:160:2: warning: Value stored to 'cur' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 18 Jul 2022 23:28:49 +0800
Message-ID: <202207182352.JAnLryQa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3983722820516489887==
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
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: e41ba1115a351dd037c21ac75660638219d51485 s390: add support for KFEN=
CE
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220717 (https://download.01.org/0day-ci/arch=
ive/20220718/202207182352.JAnLryQa-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f=
8fbf61284839c739807c2da2e2505661eb)
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
                                  ^
   mm/kfence/report.c:189:43: note: Left side of '&&' is false
           if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
                                                    ^
   mm/kfence/report.c:189:6: note: Taking false branch
           if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
               ^
   arch/s390/include/asm/bug.h:54:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   mm/kfence/report.c:189:6: note: Taking false branch
           if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
               ^
   arch/s390/include/asm/bug.h:58:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   mm/kfence/report.c:189:2: note: Taking false branch
           if (WARN_ON(type !=3D KFENCE_ERROR_INVALID && !meta))
           ^
   mm/kfence/report.c:192:6: note: 'meta' is null
           if (meta)
               ^~~~
   mm/kfence/report.c:192:2: note: Taking false branch
           if (meta)
           ^
   mm/kfence/report.c:203:2: note: Dereference of null pointer
           lockdep_off();
           ^
   include/linux/lockdep.h:171:2: note: expanded from macro 'lockdep_off'
           current->lockdep_recursion +=3D LOCKDEP_OFF;      \
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
   27 warnings generated.
   arch/s390/include/asm/preempt.h:100:29: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count +=3D val;
                                      ^
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
   mm/kfence/kfence_test.c:667:2: note: Calling 'rcu_read_lock'
           rcu_read_lock();
           ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:685:2: note: Calling '__rcu_read_lock'
           __rcu_read_lock();
           ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:68:2: note: Calling '__preempt_count_add'
           preempt_disable();
           ^
   include/linux/preempt.h:177:2: note: expanded from macro 'preempt_disabl=
e'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:170:29: note: expanded from macro 'preempt_count=
_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:162:32: note: expanded from macro 'preempt_count=
_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:100:29: note: Dereference of null pointer
           S390_lowcore.preempt_count +=3D val;
                                      ^
>> mm/kfence/kfence_test.c:160:2: warning: Value stored to 'cur' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:160:2: note: Value stored to 'cur' is never read
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kfence/kfence_test.c:160:9: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
                  ^
   mm/kfence/kfence_test.c:391:2: note: Calling 'test_free'
           test_free(expect.addr); /* Double-free. */
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
   mm/kfence/kfence_test.c:391:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr); /* Double-free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:392:26: note: Calling 'report_matches'
           KUNIT_EXPECT_TRUE(test, report_matches(&expect));
                                   ^
   include/kunit/test.h:1313:48: note: expanded from macro 'KUNIT_EXPECT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
                                                         ^~~~~~~~~
   include/kunit/test.h:829:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:823:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:811:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:773:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:100:2: note: Taking false branch
           if (!report_available())
           ^
   mm/kfence/kfence_test.c:108:2: note: Control jumps to 'case KFENCE_ERROR=
_INVALID_FREE:'  at line 124
           switch (r->type) {
           ^
   mm/kfence/kfence_test.c:126:3: note:  Execution continues on line 129
                   break;
                   ^
   mm/kfence/kfence_test.c:132:6: note: Assuming 'cur' is null
           if (cur)
               ^~~
   mm/kfence/kfence_test.c:132:2: note: Taking false branch
           if (cur)
           ^
   mm/kfence/kfence_test.c:139:2: note: Control jumps to 'case KFENCE_ERROR=
_INVALID_FREE:'  at line 155
           switch (r->type) {
           ^
   mm/kfence/kfence_test.c:157:3: note:  Execution continues on line 160
                   break;
                   ^
   mm/kfence/kfence_test.c:160:9: note: Use of memory after it is freed
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
                  ^                                  ~~~~~~~~~~~~
   mm/kfence/kfence_test.c:376:2: warning: Use of memory after it is freed =
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
           ^         ~~~~~~~~~~~
   mm/kfence/kfence_test.c:408:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           test_free(buf); /* No error. */
           ^         ~~~
   mm/kfence/kfence_test.c:407:2: note: Calling 'test_free'
           test_free(expect.addr); /* Invalid address free. */
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
   mm/kfence/kfence_test.c:407:2: note: Returning; memory was released
           test_free(expect.addr); /* Invalid address free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:408:2: note: Use of memory after it is freed
           test_free(buf); /* No error. */
           ^         ~~~
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

bc8fbc5f305aec Marco Elver   2021-02-25  173  /* =3D=3D=3D=3D=3D Test cases=
 =3D=3D=3D=3D=3D */
bc8fbc5f305aec Marco Elver   2021-02-25  174  =

bc8fbc5f305aec Marco Elver   2021-02-25  175  #define TEST_PRIV_WANT_MEMCAC=
HE ((void *)1)
bc8fbc5f305aec Marco Elver   2021-02-25  176  =

bc8fbc5f305aec Marco Elver   2021-02-25  177  /* Cache used by tests; if NU=
LL, allocate from kmalloc instead. */
bc8fbc5f305aec Marco Elver   2021-02-25  178  static struct kmem_cache *tes=
t_cache;
bc8fbc5f305aec Marco Elver   2021-02-25  179  =

bc8fbc5f305aec Marco Elver   2021-02-25  180  static size_t setup_test_cach=
e(struct kunit *test, size_t size, slab_flags_t flags,
bc8fbc5f305aec Marco Elver   2021-02-25  181  			       void (*ctor)(void *=
))
bc8fbc5f305aec Marco Elver   2021-02-25  182  {
bc8fbc5f305aec Marco Elver   2021-02-25  183  	if (test->priv !=3D TEST_PRI=
V_WANT_MEMCACHE)
bc8fbc5f305aec Marco Elver   2021-02-25  184  		return size;
bc8fbc5f305aec Marco Elver   2021-02-25  185  =

bc8fbc5f305aec Marco Elver   2021-02-25  186  	kunit_info(test, "%s: size=
=3D%zu, ctor=3D%ps\n", __func__, size, ctor);
bc8fbc5f305aec Marco Elver   2021-02-25  187  =

bc8fbc5f305aec Marco Elver   2021-02-25  188  	/*
bc8fbc5f305aec Marco Elver   2021-02-25  189  	 * Use SLAB_NOLEAKTRACE to p=
revent merging with existing caches. Any
bc8fbc5f305aec Marco Elver   2021-02-25  190  	 * other flag in SLAB_NEVER_=
MERGE also works. Use SLAB_ACCOUNT to
bc8fbc5f305aec Marco Elver   2021-02-25  191  	 * allocate via memcg, if en=
abled.
bc8fbc5f305aec Marco Elver   2021-02-25  192  	 */
bc8fbc5f305aec Marco Elver   2021-02-25  193  	flags |=3D SLAB_NOLEAKTRACE =
| SLAB_ACCOUNT;
bc8fbc5f305aec Marco Elver   2021-02-25  194  	test_cache =3D kmem_cache_cr=
eate("test", size, 1, flags, ctor);
bc8fbc5f305aec Marco Elver   2021-02-25  195  	KUNIT_ASSERT_TRUE_MSG(test, =
test_cache, "could not create cache");
bc8fbc5f305aec Marco Elver   2021-02-25  196  =

bc8fbc5f305aec Marco Elver   2021-02-25  197  	return size;
bc8fbc5f305aec Marco Elver   2021-02-25  198  }
bc8fbc5f305aec Marco Elver   2021-02-25  199  =

bc8fbc5f305aec Marco Elver   2021-02-25  200  static void test_cache_destro=
y(void)
bc8fbc5f305aec Marco Elver   2021-02-25  201  {
bc8fbc5f305aec Marco Elver   2021-02-25  202  	if (!test_cache)
bc8fbc5f305aec Marco Elver   2021-02-25  203  		return;
bc8fbc5f305aec Marco Elver   2021-02-25  204  =

bc8fbc5f305aec Marco Elver   2021-02-25  205  	kmem_cache_destroy(test_cach=
e);
bc8fbc5f305aec Marco Elver   2021-02-25  206  	test_cache =3D NULL;
bc8fbc5f305aec Marco Elver   2021-02-25  207  }
bc8fbc5f305aec Marco Elver   2021-02-25  208  =

bc8fbc5f305aec Marco Elver   2021-02-25  209  static inline size_t kmalloc_=
cache_alignment(size_t size)
bc8fbc5f305aec Marco Elver   2021-02-25  210  {
588c7fa022d7b2 Hyeonggon Yoo 2021-06-28  211  	return kmalloc_caches[kmallo=
c_type(GFP_KERNEL)][__kmalloc_index(size, false)]->align;
bc8fbc5f305aec Marco Elver   2021-02-25  212  }
bc8fbc5f305aec Marco Elver   2021-02-25  213  =

bc8fbc5f305aec Marco Elver   2021-02-25  214  /* Must always inline to matc=
h stack trace against caller. */
bc8fbc5f305aec Marco Elver   2021-02-25  215  static __always_inline void t=
est_free(void *ptr)
bc8fbc5f305aec Marco Elver   2021-02-25  216  {
bc8fbc5f305aec Marco Elver   2021-02-25  217  	if (test_cache)
bc8fbc5f305aec Marco Elver   2021-02-25  218  		kmem_cache_free(test_cache,=
 ptr);
bc8fbc5f305aec Marco Elver   2021-02-25  219  	else
bc8fbc5f305aec Marco Elver   2021-02-25 @220  		kfree(ptr);
bc8fbc5f305aec Marco Elver   2021-02-25  221  }
bc8fbc5f305aec Marco Elver   2021-02-25  222  =


:::::: The code at line 160 was first introduced by commit
:::::: f99e12b21b84feb1fd9d845a15096772f1659461 kfence: add function to mas=
k address bits

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3983722820516489887==--

