Content-Type: multipart/mixed; boundary="===============7625884685819690823=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/host1x/intr.c:29:2: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]
Date: Mon, 18 Apr 2022 19:55:48 +0800
Message-ID: <202204181914.BwtVKdyD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7625884685819690823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>

Hi Dave,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 12fc11bce6f29a73eb3d61ab4e76a9ece3da1f1d Merge tag 'drm/tegra/for-5=
.13-rc1' of ssh://git.freedesktop.org/git/tegra/linux into drm-next
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220418/202204181914.BwtVKdyD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D12fc11bce6f29a73eb3d61ab4e76a9ece3da1f1d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 12fc11bce6f29a73eb3d61ab4e76a9ece3da1f1d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/locking/rtmutex.c:299:30: note: Passing null pointer value via 1s=
t parameter 'left'
           return rt_mutex_waiter_less(__node_2_pi_waiter(a), __node_2_pi_w=
aiter(b));
                                       ^
   kernel/locking/rtmutex.c:295:2: note: expanded from macro '__node_2_pi_w=
aiter'
           rb_entry((node), struct rt_mutex_waiter, pi_tree_entry)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rbtree.h:38:37: note: expanded from macro 'rb_entry'
   #define rb_entry(ptr, type, member) container_of(ptr, type, member)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:707:41: note: expanded from macro 'container_of'
   #define container_of(ptr, type, member) ({                              \
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:299:9: note: Calling 'rt_mutex_waiter_less'
           return rt_mutex_waiter_less(__node_2_pi_waiter(a), __node_2_pi_w=
aiter(b));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/locking/rtmutex.c:236:6: note: Access to field 'prio' results in =
a dereference of a null pointer (loaded from variable 'left')
           if (left->prio < right->prio)
               ^~~~
   kernel/locking/rtmutex.c:287:6: warning: Access to field '__rb_parent_co=
lor' results in a dereference of a null pointer [clang-analyzer-core.NullDe=
reference]
           if (RB_EMPTY_NODE(&waiter->tree_entry))
               ^
   include/linux/rbtree.h:44:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^
   kernel/locking/rtmutex.c:1894:6: note: Assuming the condition is true
           if (rt_mutex_owner(lock) !=3D current) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1894:2: note: Taking true branch
           if (rt_mutex_owner(lock) !=3D current) {
           ^
   kernel/locking/rtmutex.c:1895:23: note: Passing value via 2nd parameter =
'waiter'
                   remove_waiter(lock, waiter);
                                       ^~~~~~
   kernel/locking/rtmutex.c:1895:3: note: Calling 'remove_waiter'
                   remove_waiter(lock, waiter);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1050:24: note: Assuming pointer value is null
           bool is_top_waiter =3D (waiter =3D=3D rt_mutex_top_waiter(lock));
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1054:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:305:11: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks && !lockdep_is_held(l));    \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:119:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/locking/rtmutex.c:1054:2: note: Left side of '&&' is false
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:305:23: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks && !lockdep_is_held(l));    \
                                       ^
   kernel/locking/rtmutex.c:1054:2: note: Taking false branch
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:305:3: note: expanded from macro 'lockdep_assert=
_held'
                   WARN_ON(debug_locks && !lockdep_is_held(l));    \
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/locking/rtmutex.c:1054:2: note: Loop condition is false.  Exiting=
 loop
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:304:32: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)  do {                            \
                                   ^
   kernel/locking/rtmutex.c:1057:25: note: Passing null pointer value via 2=
nd parameter 'waiter'
           rt_mutex_dequeue(lock, waiter);
                                  ^~~~~~
   kernel/locking/rtmutex.c:1057:2: note: Calling 'rt_mutex_dequeue'
           rt_mutex_dequeue(lock, waiter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:287:6: note: Access to field '__rb_parent_color=
' results in a dereference of a null pointer
           if (RB_EMPTY_NODE(&waiter->tree_entry))
               ^
   include/linux/rbtree.h:44:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/host1x/intr.c:29:2: warning: Attempt to free released memory=
 [clang-analyzer-unix.Malloc]
           kfree(container_of(kref, struct host1x_waitlist, refcount));
           ^
   drivers/gpu/host1x/intr.c:257:6: note: Assuming the condition is true
           if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) =
=3D=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:257:2: note: Taking true branch
           if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) =
=3D=3D
           ^
   drivers/gpu/host1x/intr.c:260:3: note: Calling 'kref_put'
                   kref_put(&waiter->refcount, waiter_release);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/host1x/intr.c:29:8: note: Loop condition is false.  Exiting =
loop
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/host1x/intr.c:29:2: note: Memory is released
           kfree(container_of(kref, struct host1x_waitlist, refcount));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:260:3: note: Returning; memory was released
                   kref_put(&waiter->refcount, waiter_release);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:264:6: note: Assuming 'flush' is false
           if (flush) {
               ^~~~~
   drivers/gpu/host1x/intr.c:264:2: note: Taking false branch
           if (flush) {
           ^
   drivers/gpu/host1x/intr.c:270:2: note: Calling 'kref_put'
           kref_put(&waiter->refcount, waiter_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
--
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/crypto/keembay/ocs-aes.c:1154:3: warning: 1st function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   iowrite8(enc_a[i],
                   ^
   include/asm-generic/io.h:743:18: note: expanded from macro 'iowrite8'
   #define iowrite8 iowrite8
                    ^
   drivers/crypto/keembay/ocs-aes.c:1327:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/crypto/keembay/ocs-aes.c:1327:2: note: Taking false branch
           if (rc)
           ^
   drivers/crypto/keembay/ocs-aes.c:1369:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/crypto/keembay/ocs-aes.c:1369:2: note: Taking false branch
           if (rc)
           ^
   drivers/crypto/keembay/ocs-aes.c:1379:2: note: Calling 'ocs_aes_ccm_do_a=
data'
           ocs_aes_ccm_do_adata(aes_dev, adata_dma_list, adata_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1164:6: note: Assuming 'adata_size' is =
not equal to 0
           if (!adata_size) {
               ^~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1164:2: note: Taking false branch
           if (!adata_size) {
           ^
   drivers/crypto/keembay/ocs-aes.c:1176:2: note: Calling 'ocs_aes_ccm_writ=
e_adata_len'
           ocs_aes_ccm_write_adata_len(aes_dev, adata_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1141:6: note: Assuming 'adata_len' is <=
 65280
           if (adata_len < 65280) {
               ^~~~~~~~~~~~~~~~~
   drivers/crypto/keembay/ocs-aes.c:1141:2: note: Taking true branch
           if (adata_len < 65280) {
           ^
   drivers/crypto/keembay/ocs-aes.c:1153:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/crypto/keembay/ocs-aes.c:1153:23: note: The value 1 is assigned =
to 'i'
           for (i =3D 0; i < len; i++)
                                ^~~
   drivers/crypto/keembay/ocs-aes.c:1153:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < len; i++)
           ^
   drivers/crypto/keembay/ocs-aes.c:1154:3: note: 1st function call argumen=
t is an uninitialized value
                   iowrite8(enc_a[i],
                   ^        ~~~~~~~~
   include/asm-generic/io.h:743:18: note: expanded from macro 'iowrite8'
   #define iowrite8 iowrite8
                    ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/gpu/host1x/intr.c:29:2: warning: Attempt to free released memory=
 [clang-analyzer-unix.Malloc]
           kfree(container_of(kref, struct host1x_waitlist, refcount));
           ^
   drivers/gpu/host1x/intr.c:257:6: note: Assuming the condition is true
           if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) =
=3D=3D
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:257:2: note: Taking true branch
           if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) =
=3D=3D
           ^
   drivers/gpu/host1x/intr.c:260:3: note: Calling 'kref_put'
                   kref_put(&waiter->refcount, waiter_release);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/host1x/intr.c:29:8: note: Loop condition is false.  Exiting =
loop
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/host1x/intr.c:29:2: note: Memory is released
           kfree(container_of(kref, struct host1x_waitlist, refcount));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:260:3: note: Returning; memory was released
                   kref_put(&waiter->refcount, waiter_release);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:264:6: note: Assuming 'flush' is false
           if (flush) {
               ^~~~~
   drivers/gpu/host1x/intr.c:264:2: note: Taking false branch
           if (flush) {
           ^
   drivers/gpu/host1x/intr.c:270:2: note: Calling 'kref_put'
           kref_put(&waiter->refcount, waiter_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \

vim +29 drivers/gpu/host1x/intr.c

7ede0b0bf3e259 Terje Bergstrom 2013-03-22  26  =

7ede0b0bf3e259 Terje Bergstrom 2013-03-22  27  static void waiter_release(s=
truct kref *kref)
7ede0b0bf3e259 Terje Bergstrom 2013-03-22  28  {
7ede0b0bf3e259 Terje Bergstrom 2013-03-22 @29  	kfree(container_of(kref, st=
ruct host1x_waitlist, refcount));
7ede0b0bf3e259 Terje Bergstrom 2013-03-22  30  }
7ede0b0bf3e259 Terje Bergstrom 2013-03-22  31  =


:::::: The code at line 29 was first introduced by commit
:::::: 7ede0b0bf3e2595d40d6195b6fe4c4dcef438830 gpu: host1x: Add syncpoint =
wait and interrupts

:::::: TO: Terje Bergstrom <tbergstrom@nvidia.com>
:::::: CC: Thierry Reding <thierry.reding@avionic-design.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7625884685819690823==--

