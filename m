Content-Type: multipart/mixed; boundary="===============5114058014186838814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:shuah/linux-kselftest/kunit 26/31] include/kunit/resource.h:329:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 13 May 2022 17:30:11 +0800
Message-ID: <202205131732.V99OuHYj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5114058014186838814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Gow <davidgow@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://github.com/ammarfaizi2/linux-block shuah/linux-kselftest/ku=
nit
head:   9660209d9418f2295d31fea0d32e313e9b2c1200
commit: ad69172ec930075d25e14220841dd96375088d28 [26/31] kunit: Rework kuni=
t_resource allocation policy
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-c002-20220512 (https://download.01.org/0day-ci/archi=
ve/20220513/202205131732.V99OuHYj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519da=
cab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/ad69172ec930075=
d25e14220841dd96375088d28
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block shuah/linux-kselftest/kunit
        git checkout ad69172ec930075d25e14220841dd96375088d28
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           =
              ^
   lib/kunit/kunit-test.c:378:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:607:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   lib/kunit/kunit-test.c:385:2: note: Taking true branch
           KUNIT_EXPECT_PTR_EQ(test, found, &res1);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:651:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:515:2: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
           ^
   lib/kunit/kunit-test.c:385:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_PTR_EQ(test, found, &res1);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:651:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:514:87: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, assert_type, pass, assert_class, INITIALIZ=
ER, fmt, ...) do { \
                                                                           =
              ^
   lib/kunit/kunit-test.c:385:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_PTR_EQ(test, found, &res1);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:651:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:607:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   lib/kunit/kunit-test.c:387:6: note: Assuming 'found' is non-null
           if (found)
               ^~~~~
   lib/kunit/kunit-test.c:387:2: note: Taking true branch
           if (found)
           ^
   lib/kunit/kunit-test.c:388:3: note: Calling 'kunit_put_resource'
                   kunit_put_resource(&res1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/resource.h:138:2: note: Calling 'kref_put'
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'kunit_release_resource'
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/resource.h:114:6: note: Assuming field 'free' is null
           if (res->free)
               ^~~~~~~~~
   include/kunit/resource.h:114:2: note: Taking false branch
           if (res->free)
           ^
   include/kunit/resource.h:120:6: note: Assuming field 'should_kfree' is t=
rue
           if (res->should_kfree)
               ^~~~~~~~~~~~~~~~~
   include/kunit/resource.h:120:2: note: Taking true branch
           if (res->should_kfree)
           ^
   include/kunit/resource.h:121:3: note: Argument to kfree() is the address=
 of a local stack variable, which is not memory allocated by malloc()
                   kfree(res);
                   ^     ~~~
>> include/kunit/resource.h:329:9: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
           return res->name && strcmp(res->name, match_name) =3D=3D 0;
                  ^
   lib/kunit/kunit-test.c:367:2: note: Assuming '__left' is not equal to '_=
_right'
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:619:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:515:17: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
               ~~~~~~~~~~~^~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/kunit/kunit-test.c:367:2: note: Taking true branch
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:515:2: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
           ^
   lib/kunit/kunit-test.c:367:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:514:87: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, assert_type, pass, assert_class, INITIALIZ=
ER, fmt, ...) do { \
                                                                           =
              ^
   lib/kunit/kunit-test.c:367:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:607:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   lib/kunit/kunit-test.c:371:2: note: Taking true branch
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:651:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:515:2: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
           ^
   lib/kunit/kunit-test.c:371:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/resource.h:329:9: note: Use of memory after it is freed
           return res->name && strcmp(res->name, match_name) =3D=3D 0;
                  ^~~~~~~~~
   lib/kunit/kunit-test.c:187:9: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
                                                     res->data));
                                                     ^
   include/kunit/test.h:1051:31: note: expanded from macro 'KUNIT_ASSERT_FA=
LSE'
           KUNIT_ASSERT_FALSE_MSG(test, condition, NULL)
                                        ^~~~~~~~~
   include/kunit/test.h:1056:7: note: expanded from macro 'KUNIT_ASSERT_FAL=
SE_MSG'
                                     condition,                            =
       \
                                     ^~~~~~~~~
   include/kunit/test.h:580:10: note: expanded from macro 'KUNIT_FALSE_MSG_=
ASSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:562:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:515:17: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/kunit/kunit-test.c:175:31: note: Calling 'kunit_alloc_and_get_resour=
ce'
           struct kunit_resource *res =3D kunit_alloc_and_get_resource(
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/resource.h:247:6: note: Assuming 'res' is non-null
           if (!res)
               ^~~~
   include/kunit/resource.h:247:2: note: Taking false branch
           if (!res)
           ^
   include/kunit/resource.h:253:6: note: Assuming 'ret' is 0
           if (!ret) {
               ^~~~
   include/kunit/resource.h:253:2: note: Taking true branch
           if (!ret) {
           ^
   lib/kunit/kunit-test.c:175:31: note: Returning from 'kunit_alloc_and_get=
_resource'
           struct kunit_resource *res =3D kunit_alloc_and_get_resource(
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:182:2: note: Calling 'kunit_put_resource'
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/resource.h:138:2: note: Calling 'kref_put'
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'kunit_release_resource'
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/resource.h:114:6: note: Assuming field 'free' is non-null
           if (res->free)
               ^~~~~~~~~
   include/kunit/resource.h:114:2: note: Taking true branch
           if (res->free)
           ^
   include/kunit/resource.h:120:6: note: Assuming field 'should_kfree' is t=
rue
           if (res->should_kfree)
               ^~~~~~~~~~~~~~~~~
   include/kunit/resource.h:120:2: note: Taking true branch
           if (res->should_kfree)
           ^
   include/kunit/resource.h:121:3: note: Memory is released
                   kfree(res);
                   ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/resource.h:138:2: note: Returning; memory was released
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:182:2: note: Returning; memory was released via 1=
st parameter
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:187:9: note: Use of memory after it is freed
                                                     res->data));
                                                     ^
   include/kunit/test.h:1051:31: note: expanded from macro 'KUNIT_ASSERT_FA=
LSE'
           KUNIT_ASSERT_FALSE_MSG(test, condition, NULL)
                                        ^~~~~~~~~
   include/kunit/test.h:1056:7: note: expanded from macro 'KUNIT_ASSERT_FAL=
SE_MSG'
                                     condition,                            =
       \
                                     ^~~~~~~~~
   include/kunit/test.h:580:10: note: expanded from macro 'KUNIT_FALSE_MSG_=
ASSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:562:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:515:17: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
>> lib/kunit/kunit-test.c:371:2: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:778:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ'
           KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:781:2: note: expanded from macro 'KUNIT_EXPECT_PTR_=
EQ_MSG'
           KUNIT_BINARY_PTR_ASSERTION(test,                                =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:651:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:609:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           const typeof(left) __left =3D (left);                           =
         \
           ^                           ~~~~~~
   lib/kunit/kunit-test.c:368:4: note: Calling 'kunit_add_named_resource'
                           kunit_add_named_resource(test, NULL, NULL, &res1,
                           ^
   include/kunit/test.h:757:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/kunit/test.h:762:8: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
                                      left, =3D=3D, right,                 =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:640:9: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
                                       left, op, right,                    =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:609:31: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           const typeof(left) __left =3D (left);                           =
         \
                                        ^~~~
   include/kunit/resource.h:200:7: note: 'name' is non-null
           if (!name)
                ^~~~
   include/kunit/resource.h:200:2: note: Taking false branch
           if (!name)
           ^
   include/kunit/resource.h:204:6: note: Assuming 'existing' is non-null
           if (existing) {
               ^~~~~~~~
   include/kunit/resource.h:204:2: note: Taking true branch
           if (existing) {
           ^
   include/kunit/resource.h:206:3: note: Returning without writing to 'res-=
>data'
                   return -EEXIST;
                   ^
   lib/kunit/kunit-test.c:368:4: note: Returning from 'kunit_add_named_reso=
urce'
                           kunit_add_named_resource(test, NULL, NULL, &res1,
                           ^
   include/kunit/test.h:757:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/kunit/test.h:762:8: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
                                      left, =3D=3D, right,                 =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:640:9: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
                                       left, op, right,                    =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:609:31: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           const typeof(left) __left =3D (left);                           =
         \
                                        ^~~~
   lib/kunit/kunit-test.c:367:2: note: Taking true branch
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:515:2: note: expanded from macro 'KUNIT_ASSERTION'
           if (unlikely(!(pass))) {                                        =
       \
           ^
   lib/kunit/kunit-test.c:367:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
           ^
   include/kunit/test.h:760:2: note: expanded from macro 'KUNIT_EXPECT_EQ_M=
SG'
           KUNIT_BINARY_INT_ASSERTION(test,                                =
       \
           ^
   include/kunit/test.h:636:2: note: expanded from macro 'KUNIT_BINARY_INT_=
ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:617:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:514:87: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, assert_type, pass, assert_class, INITIALIZ=
ER, fmt, ...) do { \
                                                                           =
              ^
   lib/kunit/kunit-test.c:367:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:757:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)

vim +329 include/kunit/resource.h

61695f8c5d5190 Daniel Latypov 2022-03-28  318  =

61695f8c5d5190 Daniel Latypov 2022-03-28  319  /**
61695f8c5d5190 Daniel Latypov 2022-03-28  320   * kunit_resource_name_match=
() - Match a resource with the same name.
61695f8c5d5190 Daniel Latypov 2022-03-28  321   * @test: Test case to which=
 the resource belongs.
61695f8c5d5190 Daniel Latypov 2022-03-28  322   * @res: The resource.
61695f8c5d5190 Daniel Latypov 2022-03-28  323   * @match_name: The name to =
match against.
61695f8c5d5190 Daniel Latypov 2022-03-28  324   */
61695f8c5d5190 Daniel Latypov 2022-03-28  325  static inline bool kunit_res=
ource_name_match(struct kunit *test,
61695f8c5d5190 Daniel Latypov 2022-03-28  326  					     struct kunit_resou=
rce *res,
61695f8c5d5190 Daniel Latypov 2022-03-28  327  					     void *match_name)
61695f8c5d5190 Daniel Latypov 2022-03-28  328  {
61695f8c5d5190 Daniel Latypov 2022-03-28 @329  	return res->name && strcmp(=
res->name, match_name) =3D=3D 0;
61695f8c5d5190 Daniel Latypov 2022-03-28  330  }
61695f8c5d5190 Daniel Latypov 2022-03-28  331  =


:::::: The code at line 329 was first introduced by commit
:::::: 61695f8c5d5190db11aece403304f06d22c90597 kunit: split resource API f=
rom test.h into new resource.h

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5114058014186838814==--

