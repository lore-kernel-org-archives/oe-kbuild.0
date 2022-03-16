Content-Type: multipart/mixed; boundary="===============8702233653448590511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kunit: split resource API from test.h into new resource.h
Date: Thu, 17 Mar 2022 05:41:43 +0800
Message-ID: <202203170501.cCagiYT2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8702233653448590511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220316024432.1454366-1-dlatypov@google.com>
References: <20220316024432.1454366-1-dlatypov@google.com>
TO: Daniel Latypov <dlatypov@google.com>
TO: brendanhiggins(a)google.com
TO: davidgow(a)google.com
CC: linux-kernel(a)vger.kernel.org
CC: kunit-dev(a)googlegroups.com
CC: linux-kselftest(a)vger.kernel.org
CC: skhan(a)linuxfoundation.org
CC: Daniel Latypov <dlatypov@google.com>

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 09688c0166e76ce2fb85e86b9d99be8b0084cdf9]

url:    https://github.com/0day-ci/linux/commits/Daniel-Latypov/kunit-split=
-resource-API-from-test-h-into-new-resource-h/20220316-104559
base:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-c002-20220313 (https://download.01.org/0day-ci/archi=
ve/20220317/202203170501.cCagiYT2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/132662b59a0f2d3d7b21c94ff=
6829725a6b606f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Latypov/kunit-split-resourc=
e-API-from-test-h-into-new-resource-h/20220316-104559
        git checkout 132662b59a0f2d3d7b21c94ff6829725a6b606f5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> include/kunit/resource.h:125:3: warning: Argument to kfree() is the addr=
ess of a local stack variable, which is not memory allocated by malloc() [c=
lang-analyzer-unix.Malloc]
                   kfree(res);
                   ^
   lib/kunit/kunit-test.c:333:2: note: Assuming '__left' is not equal to '_=
_right'
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:1063:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:700:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:690:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:601:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:580:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:483:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   lib/kunit/kunit-test.c:333:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:1063:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:700:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:690:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:601:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:579:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:479:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   lib/kunit/kunit-test.c:333:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_EQ(test,
           ^
   include/kunit/test.h:1063:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:700:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:690:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:601:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:574:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   lib/kunit/kunit-test.c:337:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:1085:2: note: expanded from macro 'KUNIT_EXPECT_PTR=
_EQ'
           KUNIT_BINARY_PTR_EQ_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:722:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_ASSERTION'
           KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,                         =
       \
           ^
   include/kunit/test.h:712:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:601:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:579:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:479:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   lib/kunit/kunit-test.c:337:2: note: Loop condition is false.  Exiting lo=
op
           KUNIT_EXPECT_PTR_EQ(test, res1.data, (void *)&ctx);
           ^
   include/kunit/test.h:1085:2: note: expanded from macro 'KUNIT_EXPECT_PTR=
_EQ'
           KUNIT_BINARY_PTR_EQ_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:722:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_ASSERTION'
           KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,                         =
       \
           ^
   include/kunit/test.h:712:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:601:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:574:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \

vim +125 include/kunit/resource.h

132662b59a0f2d3 Daniel Latypov 2022-03-15  112  =

132662b59a0f2d3 Daniel Latypov 2022-03-15  113  /*
132662b59a0f2d3 Daniel Latypov 2022-03-15  114   * Called when refcount rea=
ches zero via kunit_put_resource();
132662b59a0f2d3 Daniel Latypov 2022-03-15  115   * should not be called dir=
ectly.
132662b59a0f2d3 Daniel Latypov 2022-03-15  116   */
132662b59a0f2d3 Daniel Latypov 2022-03-15  117  static inline void kunit_re=
lease_resource(struct kref *kref)
132662b59a0f2d3 Daniel Latypov 2022-03-15  118  {
132662b59a0f2d3 Daniel Latypov 2022-03-15  119  	struct kunit_resource *res=
 =3D container_of(kref, struct kunit_resource,
132662b59a0f2d3 Daniel Latypov 2022-03-15  120  						  refcount);
132662b59a0f2d3 Daniel Latypov 2022-03-15  121  =

132662b59a0f2d3 Daniel Latypov 2022-03-15  122  	/* If free function is def=
ined, resource was dynamically allocated. */
132662b59a0f2d3 Daniel Latypov 2022-03-15  123  	if (res->free) {
132662b59a0f2d3 Daniel Latypov 2022-03-15  124  		res->free(res);
132662b59a0f2d3 Daniel Latypov 2022-03-15 @125  		kfree(res);
132662b59a0f2d3 Daniel Latypov 2022-03-15  126  	}
132662b59a0f2d3 Daniel Latypov 2022-03-15  127  }
132662b59a0f2d3 Daniel Latypov 2022-03-15  128  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8702233653448590511==--

