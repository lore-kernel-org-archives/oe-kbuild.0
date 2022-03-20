Content-Type: multipart/mixed; boundary="===============2077654984043050652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kunit: Rework kunit_resource allocation policy
Date: Sun, 20 Mar 2022 13:03:04 +0800
Message-ID: <202203201240.n4S4nyak-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2077654984043050652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220319055600.3471875-1-davidgow@google.com>
References: <20220319055600.3471875-1-davidgow@google.com>
TO: David Gow <davidgow@google.com>
TO: Brendan Higgins <brendanhiggins@google.com>
TO: Daniel Latypov <dlatypov@google.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: David Gow <davidgow@google.com>
CC: kunit-dev(a)googlegroups.com
CC: linux-kselftest(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi David,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc8 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Gow/kunit-Rework-kun=
it_resource-allocation-policy/20220319-135701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
34e047aa16c0123bbae8e2f6df33e5ecc1f56601
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-c002-20220318 (https://download.01.org/0day-ci/archi=
ve/20220320/202203201240.n4S4nyak-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e=
4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/1e8a349a7a1c6a46c24b09755=
471e053d1f04c8d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Gow/kunit-Rework-kunit_resou=
rce-allocation-policy/20220319-135701
        git checkout 1e8a349a7a1c6a46c24b09755471e053d1f04c8d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/kunit/test.h:418:6: note: Assuming field 'should_free' is true
           if (res->should_free)
               ^~~~~~~~~~~~~~~~
   include/kunit/test.h:418:2: note: Taking true branch
           if (res->should_free)
           ^
   include/kunit/test.h:419:3: note: Argument to kfree() is the address of =
a local stack variable, which is not memory allocated by malloc()
                   kfree(res);
                   ^     ~~~
   lib/kunit/kunit-test.c:187:9: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
                                                     res->data));
                                                     ^
   include/kunit/test.h:1719:47: note: expanded from macro 'KUNIT_ASSERT_FA=
LSE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                        ^~~~~~~~~
   include/kunit/test.h:938:47: note: expanded from macro 'KUNIT_FALSE_ASSE=
RTION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                        ^~~~~~~~~
   include/kunit/test.h:932:10: note: expanded from macro 'KUNIT_FALSE_MSG_=
ASSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:909:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:871:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   lib/kunit/kunit-test.c:175:31: note: Calling 'kunit_alloc_and_get_resour=
ce'
           struct kunit_resource *res =3D kunit_alloc_and_get_resource(
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:544:6: note: Assuming 'res' is non-null
           if (!res)
               ^~~~
   include/kunit/test.h:544:2: note: Taking false branch
           if (!res)
           ^
   include/kunit/test.h:550:6: note: Assuming 'ret' is 0
           if (!ret) {
               ^~~~
   include/kunit/test.h:550:2: note: Taking true branch
           if (!ret) {
           ^
   lib/kunit/kunit-test.c:175:31: note: Returning from 'kunit_alloc_and_get=
_resource'
           struct kunit_resource *res =3D kunit_alloc_and_get_resource(
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:182:2: note: Calling 'kunit_put_resource'
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:436:2: note: Calling 'kref_put'
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'kunit_release_resource'
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/test.h:412:6: note: Assuming field 'free' is null
           if (res->free)
               ^~~~~~~~~
   include/kunit/test.h:412:2: note: Taking false branch
           if (res->free)
           ^
   include/kunit/test.h:418:6: note: Assuming field 'should_free' is true
           if (res->should_free)
               ^~~~~~~~~~~~~~~~
   include/kunit/test.h:418:2: note: Taking true branch
           if (res->should_free)
           ^
   include/kunit/test.h:419:3: note: Memory is released
                   kfree(res);
                   ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/test.h:436:2: note: Returning; memory was released
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:182:2: note: Returning; memory was released via 1=
st parameter
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/kunit-test.c:187:9: note: Use of memory after it is freed
                                                     res->data));
                                                     ^
   include/kunit/test.h:1719:47: note: expanded from macro 'KUNIT_ASSERT_FA=
LSE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                        ^~~~~~~~~
   include/kunit/test.h:938:47: note: expanded from macro 'KUNIT_FALSE_ASSE=
RTION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                        ^~~~~~~~~
   include/kunit/test.h:932:10: note: expanded from macro 'KUNIT_FALSE_MSG_=
ASSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:909:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:871:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
>> lib/kunit/kunit-test.c:337:2: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:1473:2: note: expanded from macro 'KUNIT_EXPECT_PTR=
_EQ'
           KUNIT_BINARY_PTR_EQ_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1110:2: note: expanded from macro 'KUNIT_BINARY_PTR=
_EQ_ASSERTION'
           KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,                         =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1100:2: note: expanded from macro 'KUNIT_BINARY_PTR=
_EQ_MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:964:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
           ^                     ~~~~~~
   lib/kunit/kunit-test.c:334:4: note: Calling 'kunit_add_named_resource'
                           kunit_add_named_resource(test, NULL, NULL, &res1,
                           ^
   include/kunit/test.h:1451:53: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/kunit/test.h:1090:11: note: expanded from macro 'KUNIT_BINARY_EQ=
_ASSERTION'
                                         left,                             =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1082:9: note: expanded from macro 'KUNIT_BINARY_EQ_=
MSG_ASSERTION'
                                       left,                               =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:993:9: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
                                       left, =3D=3D, right,                =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:964:25: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                  ^~~~
   include/kunit/test.h:497:7: note: 'name' is non-null
           if (!name)
                ^~~~
   include/kunit/test.h:497:2: note: Taking false branch
           if (!name)
           ^
   include/kunit/test.h:501:6: note: Assuming 'existing' is non-null
           if (existing) {
               ^~~~~~~~
   include/kunit/test.h:501:2: note: Taking true branch
           if (existing) {
           ^
   include/kunit/test.h:503:3: note: Returning without writing to 'res->dat=
a'
                   return -EEXIST;
                   ^
   lib/kunit/kunit-test.c:334:4: note: Returning from 'kunit_add_named_reso=
urce'
                           kunit_add_named_resource(test, NULL, NULL, &res1,
                           ^
   include/kunit/test.h:1451:53: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/kunit/test.h:1090:11: note: expanded from macro 'KUNIT_BINARY_EQ=
_ASSERTION'
                                         left,                             =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1082:9: note: expanded from macro 'KUNIT_BINARY_EQ_=
MSG_ASSERTION'
                                       left,                               =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:993:9: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
                                       left, =3D=3D, right,                =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:964:25: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                  ^~~~
   lib/kunit/kunit-test.c:333:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:1451:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:1088:2: note: expanded from macro 'KUNIT_BINARY_EQ_=
ASSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:1078:2: note: expanded from macro 'KUNIT_BINARY_EQ_=
MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:967:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:867:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   lib/kunit/kunit-test.c:333:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:1451:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:1088:2: note: expanded from macro 'KUNIT_BINARY_EQ_=
ASSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:1078:2: note: expanded from macro 'KUNIT_BINARY_EQ_=
MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \

vim +337 lib/kunit/kunit-test.c

d4cdd146d0db90 Alan Maguire 2020-05-29  327  =

725aca95859566 Alan Maguire 2020-05-29  328  static void kunit_resource_tes=
t_named(struct kunit *test)
725aca95859566 Alan Maguire 2020-05-29  329  {
725aca95859566 Alan Maguire 2020-05-29  330  	struct kunit_resource res1, r=
es2, *found =3D NULL;
725aca95859566 Alan Maguire 2020-05-29  331  	struct kunit_test_resource_co=
ntext ctx;
725aca95859566 Alan Maguire 2020-05-29  332  =

725aca95859566 Alan Maguire 2020-05-29  333  	KUNIT_EXPECT_EQ(test,
725aca95859566 Alan Maguire 2020-05-29  334  			kunit_add_named_resource(te=
st, NULL, NULL, &res1,
725aca95859566 Alan Maguire 2020-05-29  335  						 "resource_1", &ctx),
725aca95859566 Alan Maguire 2020-05-29  336  			0);
725aca95859566 Alan Maguire 2020-05-29 @337  	KUNIT_EXPECT_PTR_EQ(test, res=
1.data, (void *)&ctx);
725aca95859566 Alan Maguire 2020-05-29  338  =

725aca95859566 Alan Maguire 2020-05-29  339  	KUNIT_EXPECT_EQ(test,
725aca95859566 Alan Maguire 2020-05-29  340  			kunit_add_named_resource(te=
st, NULL, NULL, &res1,
725aca95859566 Alan Maguire 2020-05-29  341  						 "resource_1", &ctx),
725aca95859566 Alan Maguire 2020-05-29  342  			-EEXIST);
725aca95859566 Alan Maguire 2020-05-29  343  =

725aca95859566 Alan Maguire 2020-05-29  344  	KUNIT_EXPECT_EQ(test,
725aca95859566 Alan Maguire 2020-05-29  345  			kunit_add_named_resource(te=
st, NULL, NULL, &res2,
725aca95859566 Alan Maguire 2020-05-29  346  						 "resource_2", &ctx),
725aca95859566 Alan Maguire 2020-05-29  347  			0);
725aca95859566 Alan Maguire 2020-05-29  348  =

725aca95859566 Alan Maguire 2020-05-29  349  	found =3D kunit_find_named_re=
source(test, "resource_1");
725aca95859566 Alan Maguire 2020-05-29  350  =

725aca95859566 Alan Maguire 2020-05-29  351  	KUNIT_EXPECT_PTR_EQ(test, fou=
nd, &res1);
725aca95859566 Alan Maguire 2020-05-29  352  =

725aca95859566 Alan Maguire 2020-05-29  353  	if (found)
725aca95859566 Alan Maguire 2020-05-29  354  		kunit_put_resource(&res1);
725aca95859566 Alan Maguire 2020-05-29  355  =

725aca95859566 Alan Maguire 2020-05-29  356  	KUNIT_EXPECT_EQ(test, kunit_d=
estroy_named_resource(test, "resource_2"),
725aca95859566 Alan Maguire 2020-05-29  357  			0);
725aca95859566 Alan Maguire 2020-05-29  358  =

725aca95859566 Alan Maguire 2020-05-29  359  	kunit_cleanup(test);
725aca95859566 Alan Maguire 2020-05-29  360  =

725aca95859566 Alan Maguire 2020-05-29  361  	KUNIT_EXPECT_TRUE(test, list_=
empty(&test->resources));
725aca95859566 Alan Maguire 2020-05-29  362  }
725aca95859566 Alan Maguire 2020-05-29  363  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2077654984043050652==--

