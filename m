Content-Type: multipart/mixed; boundary="===============1410657216147999073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/host1x/intr.c:29:2: warning: Attempt to free released memory [clang-analyzer-unix.Malloc]
Date: Fri, 19 Nov 2021 09:56:17 +0800
Message-ID: <202111190906.JwwSV8tP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1410657216147999073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Nick,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8d0112ac6fd001f95aabb084ec2ccaa3637bc344
commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14 scripts/Makefile.clang: de=
fault to LLVM_IAS=3D1
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20211118 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df12b034afeb3a977bbb1c6584dedc0f3dc666f14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/locking/rtmutex.c:235:6: note: Access to field 'prio' results in =
a dereference of a null pointer (loaded from variable 'left')
           if (left->prio < right->prio)
               ^~~~
   kernel/locking/rtmutex.c:285:6: warning: Access to field '__rb_parent_co=
lor' results in a dereference of a null pointer [clang-analyzer-core.NullDe=
reference]
           if (RB_EMPTY_NODE(&waiter->tree_entry))
               ^
   include/linux/rbtree.h:44:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^
   kernel/locking/rtmutex.c:1764:6: note: Assuming the condition is true
           if (rt_mutex_owner(lock) !=3D current) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1764:2: note: Taking true branch
           if (rt_mutex_owner(lock) !=3D current) {
           ^
   kernel/locking/rtmutex.c:1765:23: note: Passing value via 2nd parameter =
'waiter'
                   remove_waiter(lock, waiter);
                                       ^~~~~~
   kernel/locking/rtmutex.c:1765:3: note: Calling 'remove_waiter'
                   remove_waiter(lock, waiter);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1042:24: note: Assuming pointer value is null
           bool is_top_waiter =3D (waiter =3D=3D rt_mutex_top_waiter(lock));
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1046:2: note: 'debug_locks' is 0
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:310:11: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                           ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/locking/rtmutex.c:1046:2: note: Left side of '&&' is false
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:310:23: note: expanded from macro 'lockdep_asser=
t_held'
                   WARN_ON(debug_locks &&                                  \
                                       ^
   kernel/locking/rtmutex.c:1046:2: note: Taking false branch
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:310:3: note: expanded from macro 'lockdep_assert=
_held'
                   WARN_ON(debug_locks &&                                  \
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/locking/rtmutex.c:1046:2: note: Loop condition is false.  Exiting=
 loop
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:309:32: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)  do {                                    \
                                   ^
   kernel/locking/rtmutex.c:1049:25: note: Passing null pointer value via 2=
nd parameter 'waiter'
           rt_mutex_dequeue(lock, waiter);
                                  ^~~~~~
   kernel/locking/rtmutex.c:1049:2: note: Calling 'rt_mutex_dequeue'
           rt_mutex_dequeue(lock, waiter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:285:6: note: Access to field '__rb_parent_color=
' results in a dereference of a null pointer
           if (RB_EMPTY_NODE(&waiter->tree_entry))
               ^
   include/linux/rbtree.h:44:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/gpu/host1x/intr.c:29:8: note: Loop condition is false.  Exiting =
loop
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:7: note: Assuming 'div' is >=3D 'min_div'
           if ((div < min_div) || (div > max_div))
                ^~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:6: note: Left side of '||' is false
           if ((div < min_div) || (div > max_div))
               ^
   drivers/spi/spi-stm32.c:444:26: note: Assuming 'div' is <=3D 'max_div'
           if ((div < min_div) || (div > max_div))
                                   ^~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:2: note: Taking false branch
           if ((div < min_div) || (div > max_div))
           ^
   drivers/spi/spi-stm32.c:448:6: note: Assuming the condition is false
           if (div & (div - 1))
               ^~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:448:2: note: Taking false branch
           if (div & (div - 1))
           ^
   drivers/spi/spi-stm32.c:451:3: note: The value 4294967295 is assigned to=
 'mbrdiv'
                   mbrdiv =3D fls(div) - 1;
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:453:38: note: The result of the left shift is un=
defined due to shifting by '4294967295', which is greater or equal to the w=
idth of type 'int'
           spi->cur_speed =3D spi->clk_rate / (1 << mbrdiv);
                                               ^  ~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/misc/kgdbts.c:709:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:709:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, buf);
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:714:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(get_buf, "#");
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1075:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, opt);
           ^~~~~~
   drivers/misc/kgdbts.c:1146:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1146:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(config, kmessage);
                   ^~~~~~
   drivers/misc/kgdbts.c:1155:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(config, kmessage);
           ^~~~~~
   drivers/misc/kgdbts.c:1155:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(config, kmessage);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/asn1_encoder.c:167:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   lib/asn1_encoder.c:167:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/soc/ixp4xx/ixp4xx-npe.c:684:22: warning: Value stored to 'np' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/soc/ixp4xx/ixp4xx-npe.c:684:22: note: Value stored to 'np' durin=
g its initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/regulator/qcom_spmi-regulator.c:401:8: warning: Excessive paddin=
g in 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   supply, =

   ocp, =

   base, =

   force_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:401:8: note: Excessive padding i=
n 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). Optim=
al fields order: name, supply, ocp, base, force_type, consider reordering t=
he fields or adding explicit padding members
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1159:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1159:2: note: Value stored to 'r=
et' is never read
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   lib/rhashtable.c:1090:8: note: Calling 'rhashtable_init'
           err =3D rhashtable_init(&hlt->ht, params);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/rhashtable.c:1021:7: note: Assuming field 'key_len' is not equal to 0
           if ((!params->key_len && !params->obj_hashfn) ||
                ^~~~~~~~~~~~~~~~
   lib/rhashtable.c:1021:24: note: Left side of '&&' is false
           if ((!params->key_len && !params->obj_hashfn) ||
                                 ^
   lib/rhashtable.c:1022:7: note: Assuming field 'obj_hashfn' is null
--
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:176:3: note: expanded from macro 'raw_local_irq=
_restore'
                   raw_check_bogus_irq_restore();          \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:156:16: note: expanded from macro 'raw_check_bo=
gus_irq_restore'
                   if (unlikely(!arch_irqs_disabled()))    \
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/input/joystick/cobra.c:72:2: note: Taking false branch
           local_irq_restore(flags);
           ^
   include/linux/irqflags.h:238:39: note: expanded from macro 'local_irq_re=
store'
   #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } wh=
ile (0)
                                         ^
   include/linux/irqflags.h:176:3: note: expanded from macro 'raw_local_irq=
_restore'
                   raw_check_bogus_irq_restore();          \
                   ^
   include/linux/irqflags.h:156:3: note: expanded from macro 'raw_check_bog=
us_irq_restore'
                   if (unlikely(!arch_irqs_disabled()))    \
                   ^
   drivers/input/joystick/cobra.c:72:2: note: Loop condition is false.  Exi=
ting loop
           local_irq_restore(flags);
           ^
   include/linux/irqflags.h:238:39: note: expanded from macro 'local_irq_re=
store'
   #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } wh=
ile (0)
                                         ^
   include/linux/irqflags.h:176:3: note: expanded from macro 'raw_local_irq=
_restore'
                   raw_check_bogus_irq_restore();          \
                   ^
   include/linux/irqflags.h:155:2: note: expanded from macro 'raw_check_bog=
us_irq_restore'
           do {                                            \
           ^
   drivers/input/joystick/cobra.c:72:2: note: Loop condition is false.  Exi=
ting loop
           local_irq_restore(flags);
           ^
   include/linux/irqflags.h:238:39: note: expanded from macro 'local_irq_re=
store'
   #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } wh=
ile (0)
                                         ^
   include/linux/irqflags.h:174:2: note: expanded from macro 'raw_local_irq=
_restore'
           do {                                            \
           ^
   drivers/input/joystick/cobra.c:72:2: note: Loop condition is false.  Exi=
ting loop
           local_irq_restore(flags);
           ^
   include/linux/irqflags.h:238:34: note: expanded from macro 'local_irq_re=
store'
   #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } wh=
ile (0)
                                    ^
   drivers/input/joystick/cobra.c:76:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < 2; i++) {
           ^
   drivers/input/joystick/cobra.c:78:3: note: Taking true branch
                   if (r[i] !=3D COBRA_LENGTH) continue;
                   ^
   drivers/input/joystick/cobra.c:78:29: note:  Execution continues on line=
 76
                   if (r[i] !=3D COBRA_LENGTH) continue;
                                             ^
   drivers/input/joystick/cobra.c:76:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < 2; i++) {
           ^
   drivers/input/joystick/cobra.c:78:3: note: Taking true branch
                   if (r[i] !=3D COBRA_LENGTH) continue;
                   ^
   drivers/input/joystick/cobra.c:78:29: note:  Execution continues on line=
 76
                   if (r[i] !=3D COBRA_LENGTH) continue;
                                             ^
   drivers/input/joystick/cobra.c:76:2: note: Loop condition is false. Exec=
ution continues on line 91
           for (i =3D 0; i < 2; i++) {
           ^
   drivers/input/joystick/cobra.c:91:2: note: Returning without writing to =
'*data'
           return ret;
           ^
   drivers/input/joystick/cobra.c:159:18: note: Returning from 'cobra_read_=
packet'
           cobra->exists =3D cobra_read_packet(gameport, data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/joystick/cobra.c:161:7: note: The value 0 is assigned to '=
i'
           for (i =3D 0; i < 2; i++)
                ^~~~~
   drivers/input/joystick/cobra.c:161:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < 2; i++)
           ^
   drivers/input/joystick/cobra.c:162:28: note: The right operand of '&' is=
 a garbage value
                   if ((cobra->exists >> i) & data[i] & 1) {
                                            ^ ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> arch/arm/mach-rpc/ecard.c:640:5: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy((char *)ec->card_desc, incd.d.str=
ing);
                                   ^~~~~~
   arch/arm/mach-rpc/ecard.c:640:5: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
                                   strcpy((char *)ec->card_desc, incd.d.str=
ing);
                                   ^~~~~~
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   arch/arm/include/asm/atomic.h:224:1: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
   ATOMIC_OPS(sub, -=3D, sub)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^
   arch/arm/include/asm/atomic.h:193:8: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           val =3D v->counter;                                             =
  \
                 ^
   drivers/usb/class/usbtmc.c:2479:2: note: Loop condition is false. Execut=
ion continues on line 2488
           list_for_each(elem, &data->file_list) {
           ^
   include/linux/list.h:571:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
           ^
   drivers/usb/class/usbtmc.c:2489:2: note: Calling 'usbtmc_free_int'
           usbtmc_free_int(data);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/class/usbtmc.c:2340:6: note: Assuming field 'iin_ep_present'=
 is not equal to 0
           if (!data->iin_ep_present || !data->iin_urb)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/usb/class/usbtmc.c:2340:6: note: Left side of '||' is false
   drivers/usb/class/usbtmc.c:2340:31: note: Assuming field 'iin_urb' is no=
n-null
           if (!data->iin_ep_present || !data->iin_urb)
                                        ^~~~~~~~~~~~~~
   drivers/usb/class/usbtmc.c:2340:2: note: Taking false branch
           if (!data->iin_ep_present || !data->iin_urb)
           ^
   drivers/usb/class/usbtmc.c:2347:2: note: Calling 'kref_put'
           kref_put(&data->kref, usbtmc_delete);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'usbtmc_delete'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/usb/class/usbtmc.c:157:36: note: Left side of '&&' is false
           struct usbtmc_device_data *data =3D to_usbtmc_data(kref);
                                             ^
   drivers/usb/class/usbtmc.c:114:27: note: expanded from macro 'to_usbtmc_=
data'
   #define to_usbtmc_data(d) container_of(d, struct usbtmc_device_data, kre=
f)
                             ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/class/usbtmc.c:157:36: note: Taking false branch
           struct usbtmc_device_data *data =3D to_usbtmc_data(kref);
                                             ^
   drivers/usb/class/usbtmc.c:114:27: note: expanded from macro 'to_usbtmc_=
data'
   #define to_usbtmc_data(d) container_of(d, struct usbtmc_device_data, kre=
f)
                             ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
--
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/configfs.c:890:2: note: 'gi' initialized to a null po=
inter value
           struct gadget_info *gi =3D container_of(to_config_group(os_desc_=
ci),
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/configfs.c:892:2: note: 'cdev' initialized to a null =
pointer value
           struct usb_composite_dev *cdev =3D &gi->cdev;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/configfs.c:894:3: note: Left side of '&&' is false
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/configfs.c:894:3: note: Taking false branch
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/usb/gadget/configfs.c:894:3: note: Loop condition is false.  Exi=
ting loop
                   container_of(to_config_group(usb_cfg_ci),
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/usb/gadget/configfs.c:900:2: note: Access to field 'next' result=
s in a dereference of a null pointer
           list_for_each_entry(c, &cdev->configs, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/arm/kernel/atags_compat.c:200:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   arch/arm/kernel/atags_compat.c:200:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpio/gpiolib.c:550:8: warning: Null pointer passed as 1st argume=
nt to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (!strcmp(gc->label, hog->chip_label))
                        ^
   drivers/gpio/gpiolib.c:574:33: note: Assuming field 'parent' is null
           struct fwnode_handle *fwnode =3D gc->parent ? dev_fwnode(gc->par=
ent) : NULL;
                                          ^~~~~~~~~~
   drivers/gpio/gpiolib.c:574:33: note: '?' condition is false
   drivers/gpio/gpiolib.c:586:6: note: Assuming 'gdev' is non-null
           if (!gdev)
               ^~~~~
   drivers/gpio/gpiolib.c:586:2: note: Taking false branch
           if (!gdev)
           ^
   drivers/gpio/gpiolib.c:593:2: note: Calling 'of_gpio_dev_init'
           of_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.h:40:1: note: Returning without writing to 'gc->=
label'
   }
   ^
   drivers/gpio/gpiolib.c:593:2: note: Returning from 'of_gpio_dev_init'
           of_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:594:2: note: Calling 'acpi_gpio_dev_init'
           acpi_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-acpi.h:63:89: note: Returning without writing to 'g=
c->label'
   static inline void acpi_gpio_dev_init(struct gpio_chip *gc, struct gpio_=
device *gdev) { }
                                                                           =
                ^
   drivers/gpio/gpiolib.c:594:2: note: Returning from 'acpi_gpio_dev_init'
           acpi_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:600:21: note: Value assigned to field 'label'
           gdev->dev.fwnode =3D dev_fwnode(&gdev->dev) ?: fwnode;
                              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:600:21: note: '?' condition is true
   drivers/gpio/gpiolib.c:603:6: note: Assuming field 'id' is >=3D 0
           if (gdev->id < 0) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:603:2: note: Taking false branch
           if (gdev->id < 0) {
           ^
   drivers/gpio/gpiolib.c:609:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpio/gpiolib.c:609:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpio/gpiolib.c:613:6: note: Assuming field 'parent' is null
           if (gc->parent && gc->parent->driver)
               ^~~~~~~~~~
   drivers/gpio/gpiolib.c:613:17: note: Left side of '&&' is false
           if (gc->parent && gc->parent->driver)
                          ^
   drivers/gpio/gpiolib.c:615:11: note: Assuming field 'owner' is null
           else if (gc->owner)
                    ^~~~~~~~~
   drivers/gpio/gpiolib.c:615:7: note: Taking false branch
           else if (gc->owner)
                ^
   drivers/gpio/gpiolib.c:622:6: note: Assuming field 'descs' is non-null
           if (!gdev->descs) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:622:2: note: Taking false branch
           if (!gdev->descs) {
           ^
   drivers/gpio/gpiolib.c:627:6: note: Assuming field 'ngpio' is not equal =
to 0
           if (gc->ngpio =3D=3D 0) {
               ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:627:2: note: Taking false branch
           if (gc->ngpio =3D=3D 0) {
           ^
   drivers/gpio/gpiolib.c:633:6: note: Assuming field 'ngpio' is <=3D FASTP=
ATH_NGPIO
           if (gc->ngpio > FASTPATH_NGPIO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:633:2: note: Taking false branch
           if (gc->ngpio > FASTPATH_NGPIO)
           ^
   drivers/gpio/gpiolib.c:637:30: note: Assuming pointer value is null
           gdev->label =3D kstrdup_const(gc->label ?: "unknown", GFP_KERNEL=
);
                                       ^~~~~~~~~
   drivers/gpio/gpiolib.c:637:30: note: '?' condition is false
   drivers/gpio/gpiolib.c:638:6: note: Assuming field 'label' is non-null
           if (!gdev->label) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:638:2: note: Taking false branch
           if (!gdev->label) {
           ^
   drivers/gpio/gpiolib.c:646:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&gpio_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpio/gpiolib.c:646:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&gpio_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
--
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/spi/spi-bcm-qspi.c:727:2: note: Loop condition is false. Executi=
on continues on line 749
           for (slot =3D 0; slot < slots; slot++) {
           ^
   drivers/spi/spi-bcm-qspi.c:749:2: note: The value of 'tp' is assigned to=
 field 'trans_pos'
           qspi->trans_pos =3D tp;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:970:3: note: Returning from 'read_from_hw'
                   read_from_hw(qspi, slots);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:961:9: note: Assuming field 'byte' is < field=
 'len'
           while (qspi->trans_pos.byte < trans->len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:961:2: note: Loop condition is true.  Enterin=
g loop body
           while (qspi->trans_pos.byte < trans->len) {
           ^
   drivers/spi/spi-bcm-qspi.c:964:11: note: Calling 'write_to_hw'
                   slots =3D write_to_hw(qspi, spi);
                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:790:2: note: Null pointer value stored to 'tp=
.trans'
           tp =3D qspi->trans_pos;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:791:35: note: Passing null pointer value via =
3rd parameter 'trans'
           bcm_qspi_update_parms(qspi, spi, tp.trans);
                                            ^~~~~~~~
   drivers/spi/spi-bcm-qspi.c:791:2: note: Calling 'bcm_qspi_update_parms'
           bcm_qspi_update_parms(qspi, spi, tp.trans);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-bcm-qspi.c:618:16: note: Access to field 'speed_hz' resu=
lts in a dereference of a null pointer (loaded from variable 'trans')
           xp.speed_hz =3D trans->speed_hz;
                         ^~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   drivers/usb/serial/oti6858.c:410:2: warning: Value stored to 'divisor' i=
s never read [clang-analyzer-deadcode.DeadStores]
           divisor =3D priv->pending_setup.divisor;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/oti6858.c:410:2: note: Value stored to 'divisor' is n=
ever read
           divisor =3D priv->pending_setup.divisor;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   drivers/gpu/host1x/cdma.c:558:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:558:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/host1x/job.c:185:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:599:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:14: note: Assuming 'i' is < field 'num_relo=
cs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:121:14: note: 'phys_addr' declared without an i=
nitial value
                   dma_addr_t phys_addr, *phys;
                              ^~~~~~~~~
   drivers/gpu/host1x/job.c:125:7: note: Assuming field 'bo' is non-null
                   if (!reloc->target.bo) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:125:3: note: Taking false branch
                   if (!reloc->target.bo) {
                   ^
   drivers/gpu/host1x/job.c:142:7: note: Assuming 'domain' is non-null
                   if (!domain || client->group)
                       ^~~~~~~
   drivers/gpu/host1x/job.c:142:7: note: Left side of '||' is false
   drivers/gpu/host1x/job.c:142:18: note: Assuming field 'group' is null
                   if (!domain || client->group)
                                  ^~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:142:3: note: Taking false branch
                   if (!domain || client->group)
                   ^
   drivers/gpu/host1x/job.c:148:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:153:7: note: Assuming 'sgt' is null
                   if (sgt) {
                       ^~~
   drivers/gpu/host1x/job.c:153:3: note: Taking false branch
                   if (sgt) {
                   ^
   drivers/gpu/host1x/job.c:185:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   drivers/gpu/host1x/job.c:265:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:599:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:14: note: Assuming 'i' is >=3D field 'num_r=
elocs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:2: note: Loop condition is false. Execution=
 continues on line 195
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:195:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
           ^
   drivers/gpu/host1x/job.c:198:14: note: Assuming 'i' is < field 'num_gath=
ers'
           for (i =3D 0; i < job->num_gathers; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:198:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_gathers; i++) {
           ^
   drivers/gpu/host1x/job.c:202:3: note: 'phys_addr' declared without an in=
itial value
                   dma_addr_t phys_addr;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:210:7: note: Assuming field 'bo' is non-null
                   if (!g->bo) {
                       ^~~~~~
   drivers/gpu/host1x/job.c:210:3: note: Taking false branch
                   if (!g->bo) {
                   ^
   drivers/gpu/host1x/job.c:220:7: note: Assuming the condition is false
                   if (!iommu_get_domain_for_dev(host->dev))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:220:3: note: Taking false branch
                   if (!iommu_get_domain_for_dev(host->dev))
                   ^
   drivers/gpu/host1x/job.c:226:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
--
   fs/overlayfs/export.c:813:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:817:12: note: Assuming the condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:817:11: note: '?' condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                    ^
   fs/overlayfs/export.c:819:4: note: Calling 'ovl_lower_fh_to_d'
                    ovl_lower_fh_to_d(sb, fh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:708:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:708:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:711:6: note: Left side of '||' is false
           if (!d_is_dir(origin.dentry) ||
               ^
   fs/overlayfs/export.c:712:6: note: Assuming the condition is false
               !(origin.dentry->d_flags & DCACHE_DISCONNECTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:711:2: note: Taking false branch
           if (!d_is_dir(origin.dentry) ||
           ^
   fs/overlayfs/export.c:726:6: note: Assuming field 'indexdir' is null
           if (ofs->indexdir) {
               ^~~~~~~~~~~~~
   fs/overlayfs/export.c:726:2: note: Taking false branch
           if (ofs->indexdir) {
           ^
   fs/overlayfs/export.c:736:6: note: 'index' is null
           if (index && d_is_dir(index)) {
               ^~~~~
   fs/overlayfs/export.c:736:12: note: Left side of '&&' is false
           if (index && d_is_dir(index)) {
                     ^
   fs/overlayfs/export.c:749:2: note: Taking true branch
           if (d_is_dir(origin.dentry)) {
           ^
   fs/overlayfs/export.c:753:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/overlayfs/export.c:753:3: note: Taking false branch
                   if (err)
                   ^
   fs/overlayfs/export.c:756:6: note: 'index' is null
           if (index) {
               ^~~~~
   fs/overlayfs/export.c:756:2: note: Taking false branch
           if (index) {
           ^
   fs/overlayfs/export.c:763:11: note: Calling 'ovl_get_dentry'
           dentry =3D ovl_get_dentry(sb, NULL, &origin, index);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:654:34: note: 'upper' is null
           const struct ovl_layer *layer =3D upper ? &ofs->layers[0] : lowe=
rpath->layer;
                                           ^~~~~
   fs/overlayfs/export.c:654:34: note: '?' condition is false
   fs/overlayfs/export.c:655:24: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                 ^
   fs/overlayfs/export.c:655:34: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                           ^
   fs/overlayfs/export.c:655:2: note: 'real' initialized to a null pointer =
value
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
           ^~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:661:16: note: Passing null pointer value via 1st p=
arameter 'dentry'
           if (!d_is_dir(real))
                         ^~~~
   fs/overlayfs/export.c:661:7: note: Calling 'd_is_dir'
           if (!d_is_dir(real))
                ^~~~~~~~~~~~~~
   include/linux/dcache.h:420:22: note: Passing null pointer value via 1st =
parameter 'dentry'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                               ^~~~~~
   include/linux/dcache.h:420:9: note: Calling 'd_can_lookup'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:410:24: note: Passing null pointer value via 1st =
parameter 'dentry'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                                 ^~~~~~
   include/linux/dcache.h:410:9: note: Calling '__d_entry_type'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:395:9: note: Access to field 'd_flags' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (8 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/rc/sunxi-cir.c:143:9: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
                  ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                                          ^
   drivers/media/rc/sunxi-cir.c:246:9: note: Calling 'sunxi_ir_hw_init'
           return sunxi_ir_hw_init(dev);
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:179:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/media/rc/sunxi-cir.c:179:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/rc/sunxi-cir.c:183:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/media/rc/sunxi-cir.c:183:2: note: Taking false branch
           if (ret) {
           ^
   drivers/media/rc/sunxi-cir.c:189:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/media/rc/sunxi-cir.c:189:2: note: Taking false branch
           if (ret) {
           ^
   drivers/media/rc/sunxi-cir.c:195:2: note: Loop condition is false.  Exit=
ing loop
           writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/media/rc/sunxi-cir.c:198:2: note: Calling 'sunxi_ir_set_timeout'
           sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:26: note: Calling 'clk_get_rate'
           unsigned int base_clk =3D clk_get_rate(ir->clk);
                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:26: note: Returning from 'clk_get_rate'
           unsigned int base_clk =3D clk_get_rate(ir->clk);
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:2: note: 'base_clk' initialized to 0
           unsigned int base_clk =3D clk_get_rate(ir->clk);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:161:2: note: Taking false branch
           dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", it=
hr);
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/media/rc/sunxi-cir.c:161:2: note: Loop condition is false.  Exit=
ing loop
           dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", it=
hr);
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/media/rc/sunxi-cir.c:164:2: note: Loop condition is false.  Exit=
ing loop
           writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/media/rc/sunxi-cir.c:167:39: note: Passing the value 0 via 1st p=
arameter 'base_clk'
           rc_dev->timeout =3D sunxi_ithr_to_usec(base_clk, ithr);
                                                ^~~~~~~~
   drivers/media/rc/sunxi-cir.c:167:20: note: Calling 'sunxi_ithr_to_usec'
           rc_dev->timeout =3D sunxi_ithr_to_usec(base_clk, ithr);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:143:9: note: '__d' initialized to 0
           return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
                  ^
   include/linux/math.h:88:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(divisor) __d =3D divisor;                  \
--
   drivers/spi/spi-imx.c:623:23: note: Assigned value is garbage or undefin=
ed
           spi_imx->spi_bus_clk =3D clk;
                                ^ ~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   mm/mmap.c:2006:2: warning: Value stored to 'gap_end' is never read [clan=
g-analyzer-deadcode.DeadStores]
           gap_end =3D ULONG_MAX;  /* Only for VM_BUG_ON below */
           ^
   mm/mmap.c:2006:2: note: Value stored to 'gap_end' is never read
   mm/mmap.c:3276:3: warning: Value stored to 'faulted_in_anon_vma' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3276:3: note: Value stored to 'faulted_in_anon_vma' is never r=
ead
                   faulted_in_anon_vma =3D false;
                   ^                     ~~~~~
   mm/mmap.c:3718:2: warning: Value stored to 'ret' is never read [clang-an=
alyzer-deadcode.DeadStores]
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmap.c:3718:2: note: Value stored to 'ret' is never read
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   mm/mmu_gather.c:85:3: warning: Value stored to 'batch' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   mm/mmu_gather.c:85:3: note: Value stored to 'batch' is never read
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iommu/iova.c:64:29: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           iovad->dma_32bit_pfn =3D 1UL << (32 - iova_shift(iovad));
                                      ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:56:10: note: Assuming the condition is false
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
                   ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/iommu/iova.c:56:9: note: Left side of '||' is false
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
                  ^
   drivers/iommu/iova.c:56:2: note: Taking false branch
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/iommu/iova.c:56:2: note: Loop condition is false.  Exiting loop
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/iommu/iova.c:58:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&iovad->iova_rbtree_lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/iommu/iova.c:64:29: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           iovad->dma_32bit_pfn =3D 1UL << (32 - iova_shift(iovad));
                                      ^  ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iova.c:247:14: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   align_mask <<=3D fls_long(size - 1);
                              ^
   drivers/iommu/iova.c:503:6: note: 'iova_pfn' is 0
           if (iova_pfn)
               ^~~~~~~~
   drivers/iommu/iova.c:503:2: note: Taking false branch
           if (iova_pfn)
           ^
   drivers/iommu/iova.c:507:13: note: Calling 'alloc_iova'
           new_iova =3D alloc_iova(iovad, size, limit_pfn, true);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:379:6: note: Assuming 'new_iova' is non-null
           if (!new_iova)
               ^~~~~~~~~
   drivers/iommu/iova.c:379:2: note: Taking false branch
           if (!new_iova)
           ^
   drivers/iommu/iova.c:382:8: note: Calling '__alloc_and_insert_iova_range'
           ret =3D __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:246:6: note: 'size_aligned' is true
           if (size_aligned)
               ^~~~~~~~~~~~
   drivers/iommu/iova.c:246:2: note: Taking true branch
           if (size_aligned)
           ^
   drivers/iommu/iova.c:247:18: note: Calling 'fls_long'
                   align_mask <<=3D fls_long(size - 1);
                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:187:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:188:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:188:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:188:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   drivers/iommu/iova.c:247:18: note: Returning from 'fls_long'
                   align_mask <<=3D fls_long(size - 1);
                                  ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:247:14: note: Assigned value is garbage or undefined
                   align_mask <<=3D fls_long(size - 1);
                              ^   ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_st=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride =3D 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_strid=
e' is never read
                   min_stride =3D 0;
--
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/usb/serial/garmin_gps.c:934:2: note: Loop condition is false.  E=
xiting loop
           dev_dbg(&port->dev, "%s - mode=3D%d state=3D%d flags=3D0x%X\n",
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/usb/serial/garmin_gps.c:938:2: note: Calling 'garmin_clear'
           garmin_clear(garmin_data_p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:856:2: note: Calling 'pkt_clear'
           pkt_clear(garmin_data_p);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/usb/serial/garmin_gps.c:321:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&garmin_data_p->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:325:3: note: Memory is released
                   kfree(result);
                   ^~~~~~~~~~~~~
   drivers/usb/serial/garmin_gps.c:322:2: note: Loop condition is true.  En=
tering loop body
           while (!list_empty(&garmin_data_p->pktlist)) {
           ^
   drivers/usb/serial/garmin_gps.c:324:3: note: Calling 'list_del'
                   list_del(&result->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (8 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/w1/masters/mxc_w1.c:117:10: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           clkrate /=3D clkdiv;
           ~~~~~~~~^~~~~~~~~
   drivers/w1/masters/mxc_w1.c:100:6: note: Assuming 'mdev' is non-null
           if (!mdev)
               ^~~~~
   drivers/w1/masters/mxc_w1.c:100:2: note: Taking false branch
           if (!mdev)
           ^
   drivers/w1/masters/mxc_w1.c:104:6: note: Calling 'IS_ERR'
           if (IS_ERR(mdev->clk))
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:104:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mdev->clk))
               ^~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:104:2: note: Taking false branch
           if (IS_ERR(mdev->clk))
           ^
   drivers/w1/masters/mxc_w1.c:107:8: note: Calling 'clk_prepare_enable'
           err =3D clk_prepare_enable(mdev->clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:950:8: note: Calling 'clk_prepare'
           ret =3D clk_prepare(clk);
                 ^~~~~~~~~~~~~~~~
   include/linux/clk.h:273:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   include/linux/clk.h:274:2: note: Returning zero, which participates in a=
 condition later
           return 0;
           ^~~~~~~~
   include/linux/clk.h:950:8: note: Returning from 'clk_prepare'
           ret =3D clk_prepare(clk);
                 ^~~~~~~~~~~~~~~~
   include/linux/clk.h:951:6: note: 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:951:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:953:8: note: Calling 'clk_enable'
           ret =3D clk_enable(clk);
                 ^~~~~~~~~~~~~~~
   include/linux/clk.h:865:2: note: Returning zero, which participates in a=
 condition later
           return 0;
           ^~~~~~~~
   include/linux/clk.h:953:8: note: Returning from 'clk_enable'
           ret =3D clk_enable(clk);
                 ^~~~~~~~~~~~~~~
   include/linux/clk.h:954:6: note: 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:954:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:957:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:107:8: note: Returning from 'clk_prepare_ena=
ble'
           err =3D clk_prepare_enable(mdev->clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:108:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/w1/masters/mxc_w1.c:108:2: note: Taking false branch
           if (err)
           ^
   drivers/w1/masters/mxc_w1.c:112:6: note: 'clkrate' is < 10000000
           if (clkrate < 10000000)
               ^~~~~~~
   drivers/w1/masters/mxc_w1.c:112:2: note: Taking true branch
           if (clkrate < 10000000)
           ^
   drivers/w1/masters/mxc_w1.c:116:11: note: Left side of '||' is true
           clkdiv =3D DIV_ROUND_CLOSEST(clkrate, 1000000);
                    ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   drivers/w1/masters/mxc_w1.c:116:2: note: The value 0 is assigned to 'clk=
div'
           clkdiv =3D DIV_ROUND_CLOSEST(clkrate, 1000000);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:117:10: note: Division by zero
           clkrate /=3D clkdiv;
           ~~~~~~~~^~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (4 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2788:7: note: Assuming the condition =
is false
                   if (!the_hcd_pdev[i]) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2788:3: note: Taking false branch
                   if (!the_hcd_pdev[i]) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2786:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2786:2: note: Loop condition is false=
. Execution continues on line 2795
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2795:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2795:2: note: Loop condition is false=
. Execution continues on line 2804
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2804:2: note: Loop condition is false=
. Execution continues on line 2820
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2821:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2821:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2824:6: note: Assuming 'retval' is >=
=3D 0
           if (retval < 0)
               ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2824:2: note: Taking false branch
           if (retval < 0)
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is < fiel=
d 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2829:7: note: Assuming 'retval' is >=
=3D 0
                   if (retval < 0) {
                       ^~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2829:3: note: Taking false branch
                   if (retval < 0) {
                   ^
   drivers/usb/gadget/udc/dummy_hcd.c:2827:14: note: Assuming 'i' is >=3D f=
ield 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2827:2: note: Loop condition is false=
. Execution continues on line 2836
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2836:7: note: The value 0 is assigned=
 to 'i'
           for (i =3D 0; i < mod_data.num; i++) {
                ^~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2836:14: note: Assuming 'i' is < fiel=
d 'num'
           for (i =3D 0; i < mod_data.num; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/dummy_hcd.c:2836:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < mod_data.num; i++) {
           ^
   drivers/usb/gadget/udc/dummy_hcd.c:2837:8: note: Access to field 'hs_hcd=
' results in a dereference of a null pointer
                   if (!dum[i]->hs_hcd ||
                        ^~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/firmware/arm_scpi.c:943:23: warning: Value stored to 'cl' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct mbox_client *cl =3D &pchan->cl;
                                       ^~   ~~~~~~~~~~
   drivers/firmware/arm_scpi.c:943:23: note: Value stored to 'cl' during it=
s initialization is never read
                   struct mbox_client *cl =3D &pchan->cl;
                                       ^~   ~~~~~~~~~~
>> drivers/firmware/arm_scpi.c:944:23: warning: Value stored to 'shmem' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct device_node *shmem =3D of_parse_phandle(np, "shme=
m", idx);
                                       ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/firmware/arm_scpi.c:944:23: note: Value stored to 'shmem' during=
 its initialization is never read
                   struct device_node *shmem =3D of_parse_phandle(np, "shme=
m", idx);
                                       ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/hid/hid-picolcd_fb.c:152:14: warning: The left expression of the=
 compound assignment is an uninitialized value. The computed value will als=
o be garbage [clang-analyzer-core.uninitialized.Assign]
                                   tdata[i] <<=3D 1;
                                            ^
   drivers/hid/hid-picolcd_fb.c:437:2: note: Calling 'picolcd_fb_update'
           picolcd_fb_update(info);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is not =
equal to 0
           if (!fbdata->ready && fbdata->picolcd)
               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
           if (!fbdata->ready && fbdata->picolcd)
                              ^
   drivers/hid/hid-picolcd_fb.c:247:2: note: Loop condition is true.  Enter=
ing loop body
           for (chip =3D 0; chip < 4; chip++)
           ^
   drivers/hid/hid-picolcd_fb.c:248:3: note: Loop condition is true.  Enter=
ing loop body
                   for (tile =3D 0; tile < 8; tile++) {
                   ^
   drivers/hid/hid-picolcd_fb.c:249:8: note: Assuming field 'force' is 0
                           if (!fbdata->force && !picolcd_fb_update_tile(
                               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:249:8: note: Left side of '&&' is true
   drivers/hid/hid-picolcd_fb.c:249:27: note: Calling 'picolcd_fb_update_ti=
le'
                           if (!fbdata->force && !picolcd_fb_update_tile(
                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:6: note: Assuming 'bpp' is equal to 1
           if (bpp =3D=3D 1) {
               ^~~~~~~~
   drivers/hid/hid-picolcd_fb.c:148:2: note: Taking true branch
           if (bpp =3D=3D 1) {
           ^
   drivers/hid/hid-picolcd_fb.c:149:3: note: Loop condition is true.  Enter=
ing loop body
                   for (b =3D 7; b >=3D 0; b--) {
                   ^
   drivers/hid/hid-picolcd_fb.c:151:9: note: The value 0 is assigned to 'i'
                           for (i =3D 0; i < 64; i++) {
                                ^~~~~
   drivers/hid/hid-picolcd_fb.c:151:4: note: Loop condition is true.  Enter=
ing loop body
                           for (i =3D 0; i < 64; i++) {
                           ^
   drivers/hid/hid-picolcd_fb.c:152:14: note: The left expression of the co=
mpound assignment is an uninitialized value. The computed value will also b=
e garbage
                                   tdata[i] <<=3D 1;
                                   ~~~~~~~~ ^
   drivers/hid/hid-picolcd_fb.c:160:14: warning: The left expression of the=
 compound assignment is an uninitialized value. The computed value will als=
o be garbage [clang-analyzer-core.uninitialized.Assign]
                                   tdata[i] <<=3D 1;
                                            ^
   drivers/hid/hid-picolcd_fb.c:437:2: note: Calling 'picolcd_fb_update'
           picolcd_fb_update(info);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/hid/hid-picolcd_fb.c:234:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&fbdata->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/hid/hid-picolcd_fb.c:235:6: note: Assuming field 'ready' is not =
equal to 0
           if (!fbdata->ready && fbdata->picolcd)
               ^~~~~~~~~~~~~~
   drivers/hid/hid-picolcd_fb.c:235:21: note: Left side of '&&' is false
--
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1627:6: note: Returning from 'IS_ERR'
           if (IS_ERR(cell))
               ^~~~~~~~~~~~
   drivers/nvmem/core.c:1627:2: note: Taking false branch
           if (IS_ERR(cell))
           ^
   drivers/nvmem/core.c:1631:8: note: Calling 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1423:6: note: Assuming 'nvmem' is non-null
           if (!nvmem)
               ^~~~~~
   drivers/nvmem/core.c:1423:2: note: Taking false branch
           if (!nvmem)
           ^
   drivers/nvmem/core.c:1427:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/nvmem/core.c:1427:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1430:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1394:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1394:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1430:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1431:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1431:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1631:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1633:6: note: Calling 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1633:6: note: Returning from 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   drivers/nvmem/core.c:1633:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1640:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1640:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1643:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/iommu/mtk_iommu_v1.c:384:3: warning: Value stored to 'fwspec' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   fwspec =3D dev_iommu_fwspec_get(dev);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:384:3: note: Value stored to 'fwspec' is ne=
ver read
                   fwspec =3D dev_iommu_fwspec_get(dev);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/i2c/busses/i2c-riic.c:359:38: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           brl -=3D t->scl_fall_ns / (1000000000 / rate);
                                    ~~~~~~~~~~~^~~~~~
   drivers/i2c/busses/i2c-riic.c:297:6: note: Assuming field 'bus_freq_hz' =
is <=3D I2C_MAX_FAST_MODE_FREQ
           if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:297:2: note: Taking false branch
           if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
           ^
   drivers/i2c/busses/i2c-riic.c:305:9: note: Calling 'clk_get_rate'
           rate =3D clk_get_rate(riic->clk);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/i2c/busses/i2c-riic.c:305:9: note: Returning from 'clk_get_rate'
           rate =3D clk_get_rate(riic->clk);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:305:2: note: The value 0 is assigned to 'r=
ate'
           rate =3D clk_get_rate(riic->clk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:324:2: note: Loop condition is true.  Ente=
ring loop body
           for (cks =3D 0; cks < 7; cks++) {
           ^
   drivers/i2c/busses/i2c-riic.c:330:7: note: Assuming the condition is true
                   if (brl <=3D (0x1F + 3))
                       ^~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:330:3: note: Taking true branch
                   if (brl <=3D (0x1F + 3))
                   ^
   drivers/i2c/busses/i2c-riic.c:331:4: note:  Execution continues on line =
337
                           break;
                           ^
   drivers/i2c/busses/i2c-riic.c:337:2: note: Taking false branch
           if (brl > (0x1F + 3)) {
           ^
   drivers/i2c/busses/i2c-riic.c:347:6: note: 'cks' is equal to 0
           if (cks =3D=3D 0) {
               ^~~
   drivers/i2c/busses/i2c-riic.c:347:2: note: Taking true branch
           if (cks =3D=3D 0) {
           ^
   drivers/i2c/busses/i2c-riic.c:359:38: note: Division by zero
           brl -=3D t->scl_fall_ns / (1000000000 / rate);
                                    ~~~~~~~~~~~^~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
--
                   ^
   drivers/staging/emxx_udc/emxx_udc.c:2689:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2692:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2692:6: note: Assuming pointer value=
 is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2692:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2693:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, " *** %s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2741:11: warning: Access to field 'd=
ev' results in a dereference of a null pointer (loaded from field 'udc') [c=
lang-analyzer-core.NullDereference]
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2732:6: note: Assuming '_ep' is non-=
null
           if (!_ep) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2732:2: note: Taking false branch
           if (!_ep) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Left side of '&&' is f=
alse
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Taking false branch
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2740:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2740:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2741:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
>> drivers/staging/emxx_udc/emxx_udc.c:2754:3: warning: Value stored to 'da=
ta' is never read [clang-analyzer-deadcode.DeadStores]
                   data =3D _nbu2ss_readl(&preg->EP0_LENGTH) & EP0_LDATA;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2754:3: note: Value stored to 'data'=
 is never read
                   data =3D _nbu2ss_readl(&preg->EP0_LENGTH) & EP0_LDATA;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2757:3: warning: Value stored to 'da=
ta' is never read [clang-analyzer-deadcode.DeadStores]
                   data =3D _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_=
LEN_DCNT)
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2757:3: note: Value stored to 'data'=
 is never read
                   data =3D _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_=
LEN_DCNT)
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: warning: Access to field 'd=
ev' results in a dereference of a null pointer (loaded from field 'udc') [c=
lang-analyzer-core.NullDereference]
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:6: note: Assuming '_ep' is non-=
null
           if (!_ep) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:2: note: Taking false branch
           if (!_ep) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Left side of '&&' is f=
alse
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Taking false branch
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2782:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2782:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   lib/vsprintf.c:358:22: warning: The left operand of '=3D=3D' is a garbag=
e value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else while (buf[-1] =3D=3D '0')
                               ^
   lib/vsprintf.c:379:6: note: Assuming 'num' is > 9
           if (num <=3D 9) {
               ^~~~~~~~
   lib/vsprintf.c:379:2: note: Taking false branch
           if (num <=3D 9) {
           ^
   lib/vsprintf.c:383:9: note: Calling 'put_dec'
                   len =3D put_dec(tmp, num) - tmp;
                         ^~~~~~~~~~~~~~~~~
   lib/vsprintf.c:335:6: note: Assuming the condition is false
           if (n < 100*1000*1000)
--
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
   drivers/usb/misc/ftdi-elan.c:565:3: warning: Value stored to 'work_delay=
_in_msec' is never read [clang-analyzer-deadcode.DeadStores]
                   work_delay_in_msec =3D 10;
                   ^                    ~~
   drivers/usb/misc/ftdi-elan.c:565:3: note: Value stored to 'work_delay_in=
_msec' is never read
                   work_delay_in_msec =3D 10;
                   ^                    ~~
   Suppressed 6 warnings (4 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/usb/misc/iowarrior.c:508:2: warning: Value stored to 'io_res' is=
 never read [clang-analyzer-deadcode.DeadStores]
           io_res =3D 0;
           ^        ~
   drivers/usb/misc/iowarrior.c:508:2: note: Value stored to 'io_res' is ne=
ver read
           io_res =3D 0;
           ^        ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/binfmt_elf_fdpic.c:333:2: warning: Value stored to 'retval' is never =
read [clang-analyzer-deadcode.DeadStores]
           retval =3D -ENOEXEC;
           ^        ~~~~~~~~
   fs/binfmt_elf_fdpic.c:333:2: note: Value stored to 'retval' is never read
           retval =3D -ENOEXEC;
           ^        ~~~~~~~~
>> fs/binfmt_elf_fdpic.c:335:3: warning: Value stored to 'stack_size' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   stack_size =3D 131072UL; /* same as exec.c's default com=
mit */
                   ^            ~~~~~~~~
   fs/binfmt_elf_fdpic.c:335:3: note: Value stored to 'stack_size' is never=
 read
                   stack_size =3D 131072UL; /* same as exec.c's default com=
mit */
                   ^            ~~~~~~~~
   fs/binfmt_elf_fdpic.c:772:2: warning: Value stored to 'load_addr' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           load_addr =3D params->load_addr;
           ^           ~~~~~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:772:2: note: Value stored to 'load_addr' is never =
read
           load_addr =3D params->load_addr;
           ^           ~~~~~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:773:2: warning: Value stored to 'seg' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           seg =3D loadmap->segs;
           ^     ~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:773:2: note: Value stored to 'seg' is never read
           seg =3D loadmap->segs;
           ^     ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/rtc/rtc-abx80x.c:534:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-abx80x.c:534:3: note: Value stored to 'status' is never =
read
                   status &=3D ~ABX8XX_STATUS_BLF;
                   ^         ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   fs/locks.c:2589:3: warning: Value stored to 'cmd' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                   cmd =3D F_GETLK64;
                   ^
   fs/locks.c:2589:3: note: Value stored to 'cmd' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mmc/host/vub300.c:1610:4: warning: Value stored to 'result' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           result =3D usb_reset_device(vub300->udev);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/vub300.c:1610:4: note: Value stored to 'result' is neve=
r read
                           result =3D usb_reset_device(vub300->udev);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
>> drivers/spi/spi-lantiq-ssc.c:284:17: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
                   brt =3D spi_clk / max_speed_hz - 1;
                                 ^
   drivers/spi/spi-lantiq-ssc.c:816:2: note: Calling 'hw_setup_transfer'
           hw_setup_transfer(spi, spidev, t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:433:2: note: 'speed_hz' initialized here
           unsigned int speed_hz =3D t->speed_hz;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:437:6: note: Assuming 'bits_per_word' is no=
t equal to field 'bits_per_word'
           if (bits_per_word !=3D spi->bits_per_word ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:437:42: note: Left side of '||' is true
           if (bits_per_word !=3D spi->bits_per_word ||
                                                   ^
   drivers/spi/spi-lantiq-ssc.c:440:26: note: Passing value via 2nd paramet=
er 'max_speed_hz'
                   hw_setup_speed_hz(spi, speed_hz);
                                          ^~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:440:3: note: Calling 'hw_setup_speed_hz'
                   hw_setup_speed_hz(spi, speed_hz);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:281:6: note: Assuming 'max_speed_hz' is <=
=3D 'spi_clk'
           if (max_speed_hz > spi_clk)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-lantiq-ssc.c:281:2: note: Taking false branch
           if (max_speed_hz > spi_clk)
           ^
   drivers/spi/spi-lantiq-ssc.c:284:17: note: Division by zero
                   brt =3D spi_clk / max_speed_hz - 1;
                         ~~~~~~~~^~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   lib/xarray.c:2029:18: warning: Value stored to 'node' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   lib/xarray.c:2029:18: note: Value stored to 'node' during its initializa=
tion is never read
           struct xa_node *node =3D xas->xa_node;
                           ^~~~   ~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/hid/hid-kye.c:684:6: warning: Access to field 'maxfield' results=
 in a dereference of an undefined pointer value (loaded from variable 'repo=
rt') [clang-analyzer-core.NullDereference]
           if (report->maxfield < 1 || report->field[0]->report_count < 7) {
--
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/regulator/helpers.c:963:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           sel <<=3D ffs(rdev->desc->ramp_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:951:14: note: Assuming field 'n_ramp_values'=
 is not equal to 0
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/regulator/helpers.c:951:14: note: Left side of '||' is false
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                       ^
   drivers/regulator/helpers.c:951:44: note: Assuming field 'ramp_delay_tab=
le' is non-null
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                                                     ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/regulator/helpers.c:951:6: note: Taking false branch
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/regulator/helpers.c:951:2: note: Taking false branch
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
           ^
   drivers/regulator/helpers.c:957:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/helpers.c:957:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/helpers.c:963:6: note: Assigned value is garbage or un=
defined
           sel <<=3D ffs(rdev->desc->ramp_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   fs/autofs/dev-ioctl.c:519:34: warning: Although the value stored to 'dev=
id' is used in the enclosing expression, the value is never actually read f=
rom 'devid' [clang-analyzer-deadcode.DeadStores]
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   fs/autofs/dev-ioctl.c:519:34: note: Although the value stored to 'devid'=
 is used in the enclosing expression, the value is never actually read from=
 'devid'
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/overlayfs/super.c:1809:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D -EINVAL;
           ^     ~~~~~~~
   fs/overlayfs/super.c:1809:2: note: Value stored to 'err' is never read
           err =3D -EINVAL;
           ^     ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/overlayfs/namei.c:55:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, post);
           ^~~~~~
   fs/overlayfs/namei.c:55:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(buf, post);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/configfs/symlink.c:70:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s,"../");
                   ^~~~~~
   fs/configfs/symlink.c:70:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(s,"../");
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/gpu/host1x/intr.c:29:8: note: Loop condition is false.  Exiting =
loop
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'waiter_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:29:8: note: Left side of '&&' is false
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/host1x/intr.c:29:8: note: Taking false branch
           kfree(container_of(kref, struct host1x_waitlist, refcount));
                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
--
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   drivers/spi/spi-stm32.c:449:12: note: Returning from 'fls'
                   mbrdiv =3D fls(div);
                            ^~~~~~~~
   drivers/spi/spi-stm32.c:449:3: note: The value 32 is assigned to 'mbrdiv'
                   mbrdiv =3D fls(div);
                   ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:453:38: note: The result of the left shift is un=
defined due to shifting by '32', which is greater or equal to the width of =
type 'int'
           spi->cur_speed =3D spi->clk_rate / (1 << mbrdiv);
                                               ^  ~~~~~~
   drivers/spi/spi-stm32.c:453:38: warning: The result of the left shift is=
 undefined due to shifting by '4294967295', which is greater or equal to th=
e width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           spi->cur_speed =3D spi->clk_rate / (1 << mbrdiv);
                                               ^
   drivers/spi/spi-stm32.c:1649:6: note: Assuming field 'len' is not equal =
to 0
           if (transfer->len =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:1649:2: note: Taking false branch
           if (transfer->len =3D=3D 0)
           ^
   drivers/spi/spi-stm32.c:1654:16: note: Assuming field 'tx_buf' is null
           spi->tx_len =3D spi->tx_buf ? transfer->len : 0;
                         ^~~~~~~~~~~
   drivers/spi/spi-stm32.c:1654:16: note: '?' condition is false
   drivers/spi/spi-stm32.c:1655:16: note: Assuming field 'rx_buf' is null
           spi->rx_len =3D spi->rx_buf ? transfer->len : 0;
                         ^~~~~~~~~~~
   drivers/spi/spi-stm32.c:1655:16: note: '?' condition is false
   drivers/spi/spi-stm32.c:1657:21: note: Assuming field 'can_dma' is null
           spi->cur_usedma =3D (master->can_dma &&
                              ^~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:1657:37: note: Left side of '&&' is false
           spi->cur_usedma =3D (master->can_dma &&
                                              ^
   drivers/spi/spi-stm32.c:1660:8: note: Calling 'stm32_spi_transfer_one_se=
tup'
           ret =3D stm32_spi_transfer_one_setup(spi, spi_dev, transfer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:1573:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&spi->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/spi/spi-stm32.c:1573:2: note: Loop condition is false.  Exiting =
loop
           spin_lock_irqsave(&spi->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/spi/spi-stm32.c:1581:8: note: Calling 'stm32_spi_prepare_mbr'
           mbr =3D stm32_spi_prepare_mbr(spi, transfer->speed_hz,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:7: note: Assuming 'div' is >=3D 'min_div'
           if ((div < min_div) || (div > max_div))
                ^~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:6: note: Left side of '||' is false
           if ((div < min_div) || (div > max_div))
               ^
   drivers/spi/spi-stm32.c:444:26: note: Assuming 'div' is <=3D 'max_div'
           if ((div < min_div) || (div > max_div))
                                   ^~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:444:2: note: Taking false branch
           if ((div < min_div) || (div > max_div))
           ^
   drivers/spi/spi-stm32.c:448:6: note: Assuming the condition is false
           if (div & (div - 1))
               ^~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:448:2: note: Taking false branch
           if (div & (div - 1))
           ^
   drivers/spi/spi-stm32.c:451:3: note: The value 4294967295 is assigned to=
 'mbrdiv'
                   mbrdiv =3D fls(div) - 1;
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32.c:453:38: note: The result of the left shift is un=
defined due to shifting by '4294967295', which is greater or equal to the w=
idth of type 'int'
           spi->cur_speed =3D spi->clk_rate / (1 << mbrdiv);
                                               ^  ~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> arch/arm/mach-rpc/ecard.c:640:5: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcpy((char *)ec->card_desc, incd.d.str=
ing);
                                   ^~~~~~
   arch/arm/mach-rpc/ecard.c:640:5: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
                                   strcpy((char *)ec->card_desc, incd.d.str=
ing);
                                   ^~~~~~
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/gpu/drm/virtio/virtgpu_vq.c:180:6: warning: Access to field 'res=
p_size' results in a dereference of a null pointer (loaded from variable 'v=
buf') [clang-analyzer-core.NullDereference]
           if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
               ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:1122:10: note: Calling 'virtio_gpu_a=
lloc_cursor'
           cur_p =3D virtio_gpu_alloc_cursor(vgdev, &vbuf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:132:6: note: Calling 'IS_ERR'
           if (IS_ERR(vbuf)) {
               ^~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:132:6: note: Returning from 'IS_ERR'
           if (IS_ERR(vbuf)) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:132:2: note: Taking true branch
           if (IS_ERR(vbuf)) {
           ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:133:3: note: Null pointer value stor=
ed to 'vbuf'
                   *vbuffer_p =3D NULL;
                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:1122:10: note: Returning from 'virti=
o_gpu_alloc_cursor'
           cur_p =3D virtio_gpu_alloc_cursor(vgdev, &vbuf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:1124:33: note: Passing null pointer =
value via 2nd parameter 'vbuf'
           virtio_gpu_queue_cursor(vgdev, vbuf);
                                          ^~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:1124:2: note: Calling 'virtio_gpu_qu=
eue_cursor'
           virtio_gpu_queue_cursor(vgdev, vbuf);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:463:6: note: Assuming the condition =
is true
           if (!drm_dev_enter(vgdev->ddev, &idx)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:463:2: note: Taking true branch
           if (!drm_dev_enter(vgdev->ddev, &idx)) {
           ^
   drivers/gpu/drm/virtio/virtgpu_vq.c:464:20: note: Passing null pointer v=
alue via 2nd parameter 'vbuf'
                   free_vbuf(vgdev, vbuf);
                                    ^~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:464:3: note: Calling 'free_vbuf'
                   free_vbuf(vgdev, vbuf);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_vq.c:180:6: note: Access to field 'resp_s=
ize' results in a dereference of a null pointer (loaded from variable 'vbuf=
')
           if (vbuf->resp_size > MAX_INLINE_RESP_SIZE)
--
                   ^
   drivers/mfd/wm831x-irq.c:531:21: note: The result of the left shift is u=
ndefined due to shifting by '4294967295', which is greater or equal to the =
width of type 'int'
                           while (!(ret & 1 << (i - WM831X_IRQ_GPIO_1))) {
                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:261:4: warning: Value stored to 'cnt' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:261:4: note: Value stored to 'cnt' is n=
ever read
                           cnt -=3D read;
                           ^      ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: warning: Value stored to 'offset=
' is never read [clang-analyzer-deadcode.DeadStores]
                           offset +=3D read;
                           ^         ~~~~
   drivers/video/fbdev/core/fbcvt.c:262:4: note: Value stored to 'offset' i=
s never read
                           offset +=3D read;
                           ^         ~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   14 warnings generated.
   Suppressed 14 warnings (8 in non-user code, 6 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   6 warnings generated.
>> drivers/gpio/gpiolib.c:550:8: warning: Null pointer passed as 1st argume=
nt to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (!strcmp(gc->label, hog->chip_label))
                        ^
   drivers/gpio/gpiolib.c:574:33: note: Assuming field 'parent' is null
           struct fwnode_handle *fwnode =3D gc->parent ? dev_fwnode(gc->par=
ent) : NULL;
                                          ^~~~~~~~~~
   drivers/gpio/gpiolib.c:574:33: note: '?' condition is false
   drivers/gpio/gpiolib.c:586:6: note: Assuming 'gdev' is non-null
           if (!gdev)
               ^~~~~
   drivers/gpio/gpiolib.c:586:2: note: Taking false branch
           if (!gdev)
           ^
   drivers/gpio/gpiolib.c:593:2: note: Calling 'of_gpio_dev_init'
           of_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-of.h:40:1: note: Returning without writing to 'gc->=
label'
   }
   ^
   drivers/gpio/gpiolib.c:593:2: note: Returning from 'of_gpio_dev_init'
           of_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:594:2: note: Calling 'acpi_gpio_dev_init'
           acpi_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib-acpi.h:63:89: note: Returning without writing to 'g=
c->label'
   static inline void acpi_gpio_dev_init(struct gpio_chip *gc, struct gpio_=
device *gdev) { }
                                                                           =
                ^
   drivers/gpio/gpiolib.c:594:2: note: Returning from 'acpi_gpio_dev_init'
           acpi_gpio_dev_init(gc, gdev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:600:21: note: Value assigned to field 'label'
           gdev->dev.fwnode =3D dev_fwnode(&gdev->dev) ?: fwnode;
                              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:600:21: note: '?' condition is true
   drivers/gpio/gpiolib.c:603:6: note: Assuming field 'id' is >=3D 0
           if (gdev->id < 0) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:603:2: note: Taking false branch
           if (gdev->id < 0) {
           ^
   drivers/gpio/gpiolib.c:609:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpio/gpiolib.c:609:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpio/gpiolib.c:613:6: note: Assuming field 'parent' is null
           if (gc->parent && gc->parent->driver)
               ^~~~~~~~~~
   drivers/gpio/gpiolib.c:613:17: note: Left side of '&&' is false
           if (gc->parent && gc->parent->driver)
                          ^
   drivers/gpio/gpiolib.c:615:11: note: Assuming field 'owner' is null
           else if (gc->owner)
                    ^~~~~~~~~
   drivers/gpio/gpiolib.c:615:7: note: Taking false branch
           else if (gc->owner)
                ^
   drivers/gpio/gpiolib.c:622:6: note: Assuming field 'descs' is non-null
           if (!gdev->descs) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:622:2: note: Taking false branch
           if (!gdev->descs) {
           ^
   drivers/gpio/gpiolib.c:627:6: note: Assuming field 'ngpio' is not equal =
to 0
           if (gc->ngpio =3D=3D 0) {
               ^~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:627:2: note: Taking false branch
           if (gc->ngpio =3D=3D 0) {
           ^
   drivers/gpio/gpiolib.c:633:6: note: Assuming field 'ngpio' is <=3D FASTP=
ATH_NGPIO
           if (gc->ngpio > FASTPATH_NGPIO)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpiolib.c:633:2: note: Taking false branch
           if (gc->ngpio > FASTPATH_NGPIO)
           ^
   drivers/gpio/gpiolib.c:637:30: note: Assuming pointer value is null
           gdev->label =3D kstrdup_const(gc->label ?: "unknown", GFP_KERNEL=
);
                                       ^~~~~~~~~
   drivers/gpio/gpiolib.c:637:30: note: '?' condition is false
   drivers/gpio/gpiolib.c:638:6: note: Assuming field 'label' is non-null
           if (!gdev->label) {
               ^~~~~~~~~~~~
   drivers/gpio/gpiolib.c:638:2: note: Taking false branch
           if (!gdev->label) {
           ^
   drivers/gpio/gpiolib.c:646:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&gpio_lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/gpio/gpiolib.c:646:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&gpio_lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
--
                         ^
   drivers/video/fbdev/smscufx.c:1112:2: note: Taking false branch
           if (dev->urbs.count > 0)
           ^
   drivers/video/fbdev/smscufx.c:1115:2: note: Taking false branch
           pr_debug("freeing ufx_data %p", dev);
           ^
   include/linux/printk.h:471:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/video/fbdev/smscufx.c:1115:2: note: Loop condition is false.  Ex=
iting loop
           pr_debug("freeing ufx_data %p", dev);
           ^
   include/linux/printk.h:471:2: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:162:2: note: expanded from macro 'dynamic_=
pr_debug'
           _dynamic_func_call(fmt, __dynamic_pr_debug,             \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/video/fbdev/smscufx.c:1117:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1731:2: note: Returning; memory was releas=
ed
           kref_put(&dev->kref, ufx_free); /* ref for framebuffer */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/smscufx.c:1732:2: note: Calling 'kref_put'
           kref_put(&dev->kref, ufx_free); /* last ref from kref_init */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Calling 'refcount_dec_and_test'
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:333:9: note: Calling '__refcount_dec_and_test'
           return __refcount_dec_and_test(r, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:315:9: note: Calling '__refcount_sub_and_test'
           return __refcount_sub_and_test(1, r, oldp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:272:12: note: Calling 'atomic_fetch_sub_release'
           int old =3D atomic_fetch_sub_release(i, &r->refs);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/atomic-instrumented.h:168:9: note: Calling 'arch_ato=
mic_fetch_sub'
           return arch_atomic_fetch_sub_release(i, v);
                  ^
   include/linux/atomic-arch-fallback.h:296:39: note: expanded from macro '=
arch_atomic_fetch_sub_release'
   #define arch_atomic_fetch_sub_release arch_atomic_fetch_sub
                                         ^
   arch/arm/include/asm/atomic.h:224:1: note: Loop condition is false.  Exi=
ting loop
   ATOMIC_OPS(sub, -=3D, sub)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^
   arch/arm/include/asm/atomic.h:192:2: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           raw_local_irq_save(flags);                                      \
           ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   arch/arm/include/asm/atomic.h:224:1: note: Use of memory after it is fre=
ed
   ATOMIC_OPS(sub, -=3D, sub)
   ^
   arch/arm/include/asm/atomic.h:221:2: note: expanded from macro 'ATOMIC_O=
PS'
           ATOMIC_FETCH_OP(op, c_op, asm_op)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/atomic.h:193:8: note: expanded from macro 'ATOMIC_F=
ETCH_OP'
           val =3D v->counter;                                             =
  \
                 ^~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/host1x/cdma.c:558:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:558:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/host1x/job.c:185:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:599:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:14: note: Assuming 'i' is < field 'num_relo=
cs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:121:14: note: 'phys_addr' declared without an i=
nitial value
                   dma_addr_t phys_addr, *phys;
                              ^~~~~~~~~
   drivers/gpu/host1x/job.c:125:7: note: Assuming field 'bo' is non-null
                   if (!reloc->target.bo) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:125:3: note: Taking false branch
                   if (!reloc->target.bo) {
                   ^
   drivers/gpu/host1x/job.c:142:7: note: Assuming 'domain' is non-null
                   if (!domain || client->group)
                       ^~~~~~~
   drivers/gpu/host1x/job.c:142:7: note: Left side of '||' is false
   drivers/gpu/host1x/job.c:142:18: note: Assuming field 'group' is null
                   if (!domain || client->group)
                                  ^~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:142:3: note: Taking false branch
                   if (!domain || client->group)
                   ^
   drivers/gpu/host1x/job.c:148:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:153:7: note: Assuming 'sgt' is null
                   if (sgt) {
                       ^~~
   drivers/gpu/host1x/job.c:153:3: note: Taking false branch
                   if (sgt) {
                   ^
   drivers/gpu/host1x/job.c:185:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   drivers/gpu/host1x/job.c:265:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:599:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:14: note: Assuming 'i' is >=3D field 'num_r=
elocs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:119:2: note: Loop condition is false. Execution=
 continues on line 195
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:195:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
           ^
   drivers/gpu/host1x/job.c:198:14: note: Assuming 'i' is < field 'num_gath=
ers'
           for (i =3D 0; i < job->num_gathers; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:198:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_gathers; i++) {
           ^
   drivers/gpu/host1x/job.c:202:3: note: 'phys_addr' declared without an in=
itial value
                   dma_addr_t phys_addr;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:210:7: note: Assuming field 'bo' is non-null
                   if (!g->bo) {
                       ^~~~~~
   drivers/gpu/host1x/job.c:210:3: note: Taking false branch
                   if (!g->bo) {
                   ^
   drivers/gpu/host1x/job.c:220:7: note: Assuming the condition is false
                   if (!iommu_get_domain_for_dev(host->dev))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:220:3: note: Taking false branch
                   if (!iommu_get_domain_for_dev(host->dev))
                   ^
   drivers/gpu/host1x/job.c:226:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
--
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   crypto/testmgr.c:607:3: note: Loop condition is false. Execution continu=
es on line 614
                   while (offset + partitions[i].length + TESTMGR_POISON_LE=
N >
                   ^
   crypto/testmgr.c:617:7: note: 'out_divs' is null
                   if (out_divs)
                       ^~~~~~~~
   crypto/testmgr.c:617:3: note: Taking false branch
                   if (out_divs)
                   ^
   crypto/testmgr.c:620:7: note: 'data' is non-null
                   if (data) {
                       ^~~~
   crypto/testmgr.c:620:3: note: Taking true branch
                   if (data) {
                   ^
   crypto/testmgr.c:623:15: note: Assuming '__UNIQUE_ID___x247' is >=3D '__=
UNIQUE_ID___y248'
                           copy_len =3D min(partitions[i].length, data->cou=
nt);
                                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   crypto/testmgr.c:623:15: note: '?' condition is false
                           copy_len =3D min(partitions[i].length, data->cou=
nt);
                                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   crypto/testmgr.c:625:16: note: Assuming 'copied' is equal to 'copy_len'
                           if (WARN_ON(copied !=3D copy_len))
                                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/testmgr.c:625:8: note: Taking false branch
                           if (WARN_ON(copied !=3D copy_len))
                               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/testmgr.c:625:4: note: Taking false branch
                           if (WARN_ON(copied !=3D copy_len))
                           ^
   crypto/testmgr.c:600:14: note: Assuming 'i' is < field 'nents'
           for (i =3D 0; i < tsgl->nents; i++) {
                       ^~~~~~~~~~~~~~~
   crypto/testmgr.c:600:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < tsgl->nents; i++) {
           ^
   crypto/testmgr.c:601:25: note: Access to field 'offset' results in a der=
eference of an undefined pointer value (loaded from field 'div')
                   unsigned int offset =3D partitions[i].div->offset;
                                         ^             ~~~
   crypto/testmgr.c:1056:3: warning: Value stored to 'p' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   p +=3D scnprintf(p, end - p, " key_offset=3D%u", cfg->ke=
y_offset);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   crypto/testmgr.c:1056:3: note: Value stored to 'p' is never read
                   p +=3D scnprintf(p, end - p, " key_offset=3D%u", cfg->ke=
y_offset);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/soc/ixp4xx/ixp4xx-npe.c:684:22: warning: Value stored to 'np' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   drivers/soc/ixp4xx/ixp4xx-npe.c:684:22: note: Value stored to 'np' durin=
g its initialization is never read
           struct device_node *np =3D dev->of_node;
                               ^~   ~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/regulator/bcm590xx-regulator.c:140:8: warning: Excessive padding=
 in 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   vin_name, =

   volt_table, =

   linear_ranges, =

   n_voltages, =

   n_linear_ranges, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/regulator/bcm590xx-regulator.c:140:8: note: Excessive padding in=
 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). Optimal fiel=
ds order: name, vin_name, volt_table, linear_ranges, n_voltages, n_linear_r=
anges, consider reordering the fields or adding explicit padding members
   struct bcm590xx_info {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
--
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/base/regmap/regmap.c:1499:11: note: Taking false branch
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/base/regmap/regmap.c:1499:11: note: Loop condition is false.  Ex=
iting loop
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:546:20: note: expanded from macro 'list_first_entry=
_or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
                             ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/base/regmap/regmap.c:1502:3: note: Calling 'list_del'
                   list_del(&async->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/iommu/iova.c:64:29: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           iovad->dma_32bit_pfn =3D 1UL << (32 - iova_shift(iovad));
                                      ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:56:10: note: Assuming the condition is false
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
                   ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/iommu/iova.c:56:9: note: Left side of '||' is false
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
                  ^
   drivers/iommu/iova.c:56:2: note: Taking false branch
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/iommu/iova.c:56:2: note: Loop condition is false.  Exiting loop
           BUG_ON((granule > PAGE_SIZE) || !is_power_of_2(granule));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/iommu/iova.c:58:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&iovad->iova_rbtree_lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/iommu/iova.c:64:29: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           iovad->dma_32bit_pfn =3D 1UL << (32 - iova_shift(iovad));
                                      ^  ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iova.c:247:14: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   align_mask <<=3D fls_long(size - 1);
                              ^
   drivers/iommu/iova.c:503:6: note: 'iova_pfn' is 0
           if (iova_pfn)
               ^~~~~~~~
   drivers/iommu/iova.c:503:2: note: Taking false branch
           if (iova_pfn)
           ^
   drivers/iommu/iova.c:507:13: note: Calling 'alloc_iova'
           new_iova =3D alloc_iova(iovad, size, limit_pfn, true);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:379:6: note: Assuming 'new_iova' is non-null
           if (!new_iova)
               ^~~~~~~~~
   drivers/iommu/iova.c:379:2: note: Taking false branch
           if (!new_iova)
           ^
   drivers/iommu/iova.c:382:8: note: Calling '__alloc_and_insert_iova_range'
           ret =3D __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:246:6: note: 'size_aligned' is true
           if (size_aligned)
               ^~~~~~~~~~~~
   drivers/iommu/iova.c:246:2: note: Taking true branch
           if (size_aligned)
           ^
   drivers/iommu/iova.c:247:18: note: Calling 'fls_long'
                   align_mask <<=3D fls_long(size - 1);
                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:187:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:188:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:188:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:188:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   drivers/iommu/iova.c:247:18: note: Returning from 'fls_long'
                   align_mask <<=3D fls_long(size - 1);
                                  ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:247:14: note: Assigned value is garbage or undefined
                   align_mask <<=3D fls_long(size - 1);
                              ^   ~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   11 warnings generated.
   mm/memory.c:297:2: warning: Value stored to 'pud' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           pud =3D pud_offset(p4d, start);
--
   5 warnings generated.
   drivers/tty/serial/uartlite.c:368:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret =3D uart_in32(ULITE_CONTROL, port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/uartlite.c:368:2: note: Value stored to 'ret' is neve=
r read
           ret =3D uart_in32(ULITE_CONTROL, port);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/tty/serial/mxs-auart.c:1134:3: warning: Value stored to 'istat' =
is never read [clang-analyzer-deadcode.DeadStores]
                   istat &=3D ~AUART_INTR_TXIS;
                   ^        ~~~~~~~~~~~~~~~~
   drivers/tty/serial/mxs-auart.c:1134:3: note: Value stored to 'istat' is =
never read
                   istat &=3D ~AUART_INTR_TXIS;
                   ^        ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/rc/sunxi-cir.c:143:9: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
                  ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                                          ^
   drivers/media/rc/sunxi-cir.c:246:9: note: Calling 'sunxi_ir_hw_init'
           return sunxi_ir_hw_init(dev);
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:179:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/media/rc/sunxi-cir.c:179:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/rc/sunxi-cir.c:183:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/media/rc/sunxi-cir.c:183:2: note: Taking false branch
           if (ret) {
           ^
   drivers/media/rc/sunxi-cir.c:189:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/media/rc/sunxi-cir.c:189:2: note: Taking false branch
           if (ret) {
           ^
   drivers/media/rc/sunxi-cir.c:195:2: note: Loop condition is false.  Exit=
ing loop
           writel(REG_CTL_MD, ir->base + SUNXI_IR_CTL_REG);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/media/rc/sunxi-cir.c:198:2: note: Calling 'sunxi_ir_set_timeout'
           sunxi_ir_set_timeout(ir->rc, ir->rc->timeout);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:26: note: Calling 'clk_get_rate'
           unsigned int base_clk =3D clk_get_rate(ir->clk);
                                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:26: note: Returning from 'clk_get_rate'
           unsigned int base_clk =3D clk_get_rate(ir->clk);
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:157:2: note: 'base_clk' initialized to 0
           unsigned int base_clk =3D clk_get_rate(ir->clk);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:161:2: note: Taking false branch
           dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", it=
hr);
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/media/rc/sunxi-cir.c:161:2: note: Loop condition is false.  Exit=
ing loop
           dev_dbg(rc_dev->dev.parent, "setting idle threshold to %u\n", it=
hr);
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/media/rc/sunxi-cir.c:164:2: note: Loop condition is false.  Exit=
ing loop
           writel(REG_CIR_NTHR(SUNXI_IR_RXNOISE) | REG_CIR_ITHR(ithr),
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/media/rc/sunxi-cir.c:167:39: note: Passing the value 0 via 1st p=
arameter 'base_clk'
           rc_dev->timeout =3D sunxi_ithr_to_usec(base_clk, ithr);
                                                ^~~~~~~~
   drivers/media/rc/sunxi-cir.c:167:20: note: Calling 'sunxi_ithr_to_usec'
           rc_dev->timeout =3D sunxi_ithr_to_usec(base_clk, ithr);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/sunxi-cir.c:143:9: note: '__d' initialized to 0
           return DIV_ROUND_CLOSEST(USEC_PER_SEC * (ithr + 1),
                  ^
   include/linux/math.h:88:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(divisor) __d =3D divisor;                  \
--
   fs/overlayfs/export.c:817:12: note: Assuming the condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:817:11: note: '?' condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                    ^
   fs/overlayfs/export.c:819:4: note: Calling 'ovl_lower_fh_to_d'
                    ovl_lower_fh_to_d(sb, fh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:708:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:708:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:711:6: note: Left side of '||' is false
           if (!d_is_dir(origin.dentry) ||
               ^
   fs/overlayfs/export.c:712:6: note: Assuming the condition is false
               !(origin.dentry->d_flags & DCACHE_DISCONNECTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:711:2: note: Taking false branch
           if (!d_is_dir(origin.dentry) ||
           ^
   fs/overlayfs/export.c:726:6: note: Assuming field 'indexdir' is null
           if (ofs->indexdir) {
               ^~~~~~~~~~~~~
   fs/overlayfs/export.c:726:2: note: Taking false branch
           if (ofs->indexdir) {
           ^
   fs/overlayfs/export.c:736:6: note: 'index' is null
           if (index && d_is_dir(index)) {
               ^~~~~
   fs/overlayfs/export.c:736:12: note: Left side of '&&' is false
           if (index && d_is_dir(index)) {
                     ^
   fs/overlayfs/export.c:749:2: note: Taking true branch
           if (d_is_dir(origin.dentry)) {
           ^
   fs/overlayfs/export.c:753:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/overlayfs/export.c:753:3: note: Taking false branch
                   if (err)
                   ^
   fs/overlayfs/export.c:756:6: note: 'index' is null
           if (index) {
               ^~~~~
   fs/overlayfs/export.c:756:2: note: Taking false branch
           if (index) {
           ^
   fs/overlayfs/export.c:763:11: note: Calling 'ovl_get_dentry'
           dentry =3D ovl_get_dentry(sb, NULL, &origin, index);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:654:34: note: 'upper' is null
           const struct ovl_layer *layer =3D upper ? &ofs->layers[0] : lowe=
rpath->layer;
                                           ^~~~~
   fs/overlayfs/export.c:654:34: note: '?' condition is false
   fs/overlayfs/export.c:655:24: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                 ^
   fs/overlayfs/export.c:655:34: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                           ^
   fs/overlayfs/export.c:655:2: note: 'real' initialized to a null pointer =
value
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
           ^~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:661:16: note: Passing null pointer value via 1st p=
arameter 'dentry'
           if (!d_is_dir(real))
                         ^~~~
   fs/overlayfs/export.c:661:7: note: Calling 'd_is_dir'
           if (!d_is_dir(real))
                ^~~~~~~~~~~~~~
   include/linux/dcache.h:420:22: note: Passing null pointer value via 1st =
parameter 'dentry'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                               ^~~~~~
   include/linux/dcache.h:420:9: note: Calling 'd_can_lookup'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:410:24: note: Passing null pointer value via 1st =
parameter 'dentry'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                                 ^~~~~~
   include/linux/dcache.h:410:9: note: Calling '__d_entry_type'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:395:9: note: Access to field 'd_flags' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/w1/masters/mxc_w1.c:117:10: warning: Division by zero [clang-ana=
lyzer-core.DivideZero]
           clkrate /=3D clkdiv;
           ~~~~~~~~^~~~~~~~~
   drivers/w1/masters/mxc_w1.c:100:6: note: Assuming 'mdev' is non-null
           if (!mdev)
               ^~~~~
   drivers/w1/masters/mxc_w1.c:100:2: note: Taking false branch
           if (!mdev)
           ^
   drivers/w1/masters/mxc_w1.c:104:6: note: Calling 'IS_ERR'
           if (IS_ERR(mdev->clk))
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:104:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mdev->clk))
               ^~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:104:2: note: Taking false branch
           if (IS_ERR(mdev->clk))
           ^
   drivers/w1/masters/mxc_w1.c:107:8: note: Calling 'clk_prepare_enable'
           err =3D clk_prepare_enable(mdev->clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:950:8: note: Calling 'clk_prepare'
           ret =3D clk_prepare(clk);
                 ^~~~~~~~~~~~~~~~
   include/linux/clk.h:273:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:132:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__, 0); might_resched(); } wh=
ile (0)
           ^
   include/linux/clk.h:274:2: note: Returning zero, which participates in a=
 condition later
           return 0;
           ^~~~~~~~
   include/linux/clk.h:950:8: note: Returning from 'clk_prepare'
           ret =3D clk_prepare(clk);
                 ^~~~~~~~~~~~~~~~
   include/linux/clk.h:951:6: note: 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:951:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:953:8: note: Calling 'clk_enable'
           ret =3D clk_enable(clk);
                 ^~~~~~~~~~~~~~~
   include/linux/clk.h:865:2: note: Returning zero, which participates in a=
 condition later
           return 0;
           ^~~~~~~~
   include/linux/clk.h:953:8: note: Returning from 'clk_enable'
           ret =3D clk_enable(clk);
                 ^~~~~~~~~~~~~~~
   include/linux/clk.h:954:6: note: 'ret' is 0
           if (ret)
               ^~~
   include/linux/clk.h:954:2: note: Taking false branch
           if (ret)
           ^
   include/linux/clk.h:957:2: note: Returning zero (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:107:8: note: Returning from 'clk_prepare_ena=
ble'
           err =3D clk_prepare_enable(mdev->clk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:108:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/w1/masters/mxc_w1.c:108:2: note: Taking false branch
           if (err)
           ^
   drivers/w1/masters/mxc_w1.c:112:6: note: 'clkrate' is < 10000000
           if (clkrate < 10000000)
               ^~~~~~~
   drivers/w1/masters/mxc_w1.c:112:2: note: Taking true branch
           if (clkrate < 10000000)
           ^
   drivers/w1/masters/mxc_w1.c:116:11: note: Left side of '||' is true
           clkdiv =3D DIV_ROUND_CLOSEST(clkrate, 1000000);
                    ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   drivers/w1/masters/mxc_w1.c:116:2: note: The value 0 is assigned to 'clk=
div'
           clkdiv =3D DIV_ROUND_CLOSEST(clkrate, 1000000);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/mxc_w1.c:117:10: note: Division by zero
           clkrate /=3D clkdiv;
           ~~~~~~~~^~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   drivers/hwmon/lm73.c:72:2: note: Taking false branch
           if (status < 0)
           ^
   drivers/hwmon/lm73.c:76:10: note: Assuming '__UNIQUE_ID___x278' is <=3D =
'__UNIQUE_ID___y279'
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                   ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm73.c:76:10: note: '?' condition is false
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                   ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm73.c:76:10: note: '__UNIQUE_ID___x280' is < '__UNIQUE_ID=
___y281'
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                   ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm73.c:76:10: note: '?' condition is true
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                   ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm73.c:76:62: note: The result of the left shift is undefi=
ned because the left operand is negative
           value =3D clamp_val(temp / 250, LM73_TEMP_MIN, LM73_TEMP_MAX) <<=
 5;
                                                                       ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/binfmt_elf_fdpic.c:333:2: warning: Value stored to 'retval' is never =
read [clang-analyzer-deadcode.DeadStores]
           retval =3D -ENOEXEC;
           ^        ~~~~~~~~
   fs/binfmt_elf_fdpic.c:333:2: note: Value stored to 'retval' is never read
           retval =3D -ENOEXEC;
           ^        ~~~~~~~~
>> fs/binfmt_elf_fdpic.c:335:3: warning: Value stored to 'stack_size' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   stack_size =3D 131072UL; /* same as exec.c's default com=
mit */
                   ^            ~~~~~~~~
   fs/binfmt_elf_fdpic.c:335:3: note: Value stored to 'stack_size' is never=
 read
                   stack_size =3D 131072UL; /* same as exec.c's default com=
mit */
                   ^            ~~~~~~~~
   fs/binfmt_elf_fdpic.c:772:2: warning: Value stored to 'load_addr' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           load_addr =3D params->load_addr;
           ^           ~~~~~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:772:2: note: Value stored to 'load_addr' is never =
read
           load_addr =3D params->load_addr;
           ^           ~~~~~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:773:2: warning: Value stored to 'seg' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           seg =3D loadmap->segs;
           ^     ~~~~~~~~~~~~~
   fs/binfmt_elf_fdpic.c:773:2: note: Value stored to 'seg' is never read
           seg =3D loadmap->segs;
           ^     ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-cherry.c:42:6: note: Assuming the condition is false
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-cherry.c:42:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER)
           ^
   drivers/hid/hid-cherry.c:45:2: note: Control jumps to 'case 771:'  at li=
ne 48
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-cherry.c:48:14: note: Calling 'hid_map_usage_clear'
           case 0x303: ch_map_key_clear(KEY_PROG3);        break;
                       ^
   drivers/hid/hid-cherry.c:36:29: note: expanded from macro 'ch_map_key_cl=
ear'
   #define ch_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
--
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:557:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:540:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:557:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:540:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1007:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:557:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:541:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/i2c/busses/i2c-riic.c:359:38: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           brl -=3D t->scl_fall_ns / (1000000000 / rate);
                                    ~~~~~~~~~~~^~~~~~
   drivers/i2c/busses/i2c-riic.c:297:6: note: Assuming field 'bus_freq_hz' =
is <=3D I2C_MAX_FAST_MODE_FREQ
           if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:297:2: note: Taking false branch
           if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
           ^
   drivers/i2c/busses/i2c-riic.c:305:9: note: Calling 'clk_get_rate'
           rate =3D clk_get_rate(riic->clk);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/clk.h:882:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/i2c/busses/i2c-riic.c:305:9: note: Returning from 'clk_get_rate'
           rate =3D clk_get_rate(riic->clk);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:305:2: note: The value 0 is assigned to 'r=
ate'
           rate =3D clk_get_rate(riic->clk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:324:2: note: Loop condition is true.  Ente=
ring loop body
           for (cks =3D 0; cks < 7; cks++) {
           ^
   drivers/i2c/busses/i2c-riic.c:330:7: note: Assuming the condition is true
                   if (brl <=3D (0x1F + 3))
                       ^~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-riic.c:330:3: note: Taking true branch
                   if (brl <=3D (0x1F + 3))
                   ^
   drivers/i2c/busses/i2c-riic.c:331:4: note:  Execution continues on line =
337
                           break;
                           ^
   drivers/i2c/busses/i2c-riic.c:337:2: note: Taking false branch
           if (brl > (0x1F + 3)) {
           ^
   drivers/i2c/busses/i2c-riic.c:347:6: note: 'cks' is equal to 0
           if (cks =3D=3D 0) {
               ^~~
   drivers/i2c/busses/i2c-riic.c:347:2: note: Taking true branch
           if (cks =3D=3D 0) {
           ^
   drivers/i2c/busses/i2c-riic.c:359:38: note: Division by zero
           brl -=3D t->scl_fall_ns / (1000000000 / rate);
                                    ~~~~~~~~~~~^~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/autofs/root.c:562:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:562:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           ^
   drivers/hid/hid-samsung.c:105:2: note: Assuming 'hid_debug' is 0
           dbg_hid("samsung wireless keyboard/mouse input mapping event [0x=
%x]\n",
           ^
   include/linux/hid.h:1208:6: note: expanded from macro 'dbg_hid'
           if (hid_debug)                                                  \
               ^~~~~~~~~
   drivers/hid/hid-samsung.c:105:2: note: Taking false branch
           dbg_hid("samsung wireless keyboard/mouse input mapping event [0x=
%x]\n",
           ^
   include/linux/hid.h:1208:2: note: expanded from macro 'dbg_hid'
           if (hid_debug)                                                  \
           ^
   drivers/hid/hid-samsung.c:105:2: note: Loop condition is false.  Exiting=
 loop
           dbg_hid("samsung wireless keyboard/mouse input mapping event [0x=
%x]\n",
           ^
   include/linux/hid.h:1206:32: note: expanded from macro 'dbg_hid'
   #define dbg_hid(fmt, ...)                                               \
                                                                           ^
   drivers/hid/hid-samsung.c:108:2: note: Control jumps to 'case 561:'  at =
line 120
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-samsung.c:120:14: note: Calling 'hid_map_usage_clear'
           case 0x231: samsung_kbd_mouse_map_key_clear(KEY_STOP); break;
                       ^
   drivers/hid/hid-samsung.c:93:2: note: expanded from macro 'samsung_kbd_m=
ouse_map_key_clear'
           hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:557:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:540:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:557:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:540:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1007:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:557:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:541:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/iommu/mtk_iommu_v1.c:384:3: warning: Value stored to 'fwspec' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   fwspec =3D dev_iommu_fwspec_get(dev);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/mtk_iommu_v1.c:384:3: note: Value stored to 'fwspec' is ne=
ver read
                   fwspec =3D dev_iommu_fwspec_get(dev);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   10 warnings generated.
   drivers/bcma/driver_mips.c:129:12: warning: The result of the left shift=
 is undefined due to shifting by '63', which is greater or equal to the wid=
th of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   if ((1 << bcma_core_mips_irqflag(core)) =
=3D=3D
                                          ^
   drivers/bcma/driver_mips.c:305:6: note: Assuming field 'setup_done' is 0
           if (mcore->setup_done)
               ^~~~~~~~~~~~~~~~~
   drivers/bcma/driver_mips.c:305:2: note: Taking false branch
           if (mcore->setup_done)
           ^
   drivers/bcma/driver_mips.c:308:2: note: Taking false branch
           bcma_debug(bus, "Initializing MIPS core...\n");
           ^
   drivers/bcma/bcma_private.h:19:2: note: expanded from macro 'bcma_debug'
           dev_dbg((bus)->dev, "bus%d: " fmt, (bus)->num, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/bcma/driver_mips.c:308:2: note: Loop condition is false.  Exitin=
g loop
           bcma_debug(bus, "Initializing MIPS core...\n");
           ^
   drivers/bcma/bcma_private.h:19:2: note: expanded from macro 'bcma_debug'
           dev_dbg((bus)->dev, "bus%d: " fmt, (bus)->num, ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/bcma/driver_mips.c:314:2: note: Control jumps to 'case 21248:'  =
at line 339
           switch (bus->chipinfo.id) {
           ^
   drivers/bcma/driver_mips.c:340:3: note: Calling 'bcma_core_mips_set_irq_=
name'
                   bcma_core_mips_set_irq_name(bus, 1, BCMA_CORE_PCIE, 0);
--
                   ^
   drivers/staging/emxx_udc/emxx_udc.c:2689:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2692:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2692:6: note: Assuming pointer value=
 is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2692:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2693:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, " *** %s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2741:11: warning: Access to field 'd=
ev' results in a dereference of a null pointer (loaded from field 'udc') [c=
lang-analyzer-core.NullDereference]
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2732:6: note: Assuming '_ep' is non-=
null
           if (!_ep) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2732:2: note: Taking false branch
           if (!_ep) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Left side of '&&' is f=
alse
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Taking false branch
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2737:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2740:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2740:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2741:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
>> drivers/staging/emxx_udc/emxx_udc.c:2754:3: warning: Value stored to 'da=
ta' is never read [clang-analyzer-deadcode.DeadStores]
                   data =3D _nbu2ss_readl(&preg->EP0_LENGTH) & EP0_LDATA;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2754:3: note: Value stored to 'data'=
 is never read
                   data =3D _nbu2ss_readl(&preg->EP0_LENGTH) & EP0_LDATA;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2757:3: warning: Value stored to 'da=
ta' is never read [clang-analyzer-deadcode.DeadStores]
                   data =3D _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_=
LEN_DCNT)
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2757:3: note: Value stored to 'data'=
 is never read
                   data =3D _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_=
LEN_DCNT)
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: warning: Access to field 'd=
ev' results in a dereference of a null pointer (loaded from field 'udc') [c=
lang-analyzer-core.NullDereference]
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:6: note: Assuming '_ep' is non-=
null
           if (!_ep) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2774:2: note: Taking false branch
           if (!_ep) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Left side of '&&' is f=
alse
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Taking false branch
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2779:7: note: Loop condition is fals=
e.  Exiting loop
           ep =3D container_of(_ep, struct nbu2ss_ep, ep);
                ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
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
   drivers/staging/emxx_udc/emxx_udc.c:2782:6: note: Assuming 'udc' is null
           if (!udc) {
               ^~~~
   drivers/staging/emxx_udc/emxx_udc.c:2782:2: note: Taking true branch
           if (!udc) {
           ^
   drivers/staging/emxx_udc/emxx_udc.c:2783:11: note: Access to field 'dev'=
 results in a dereference of a null pointer (loaded from field 'udc')
                   dev_err(ep->udc->dev, "%s, bad udc\n", __func__);
                           ^
   include/linux/dev_printk.h:112:11: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
                    ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +29 drivers/gpu/host1x/intr.c

7ede0b0bf3e2595 Terje Bergstrom 2013-03-22  26  =

7ede0b0bf3e2595 Terje Bergstrom 2013-03-22  27  static void waiter_release(=
struct kref *kref)
7ede0b0bf3e2595 Terje Bergstrom 2013-03-22  28  {
7ede0b0bf3e2595 Terje Bergstrom 2013-03-22 @29  	kfree(container_of(kref, s=
truct host1x_waitlist, refcount));
7ede0b0bf3e2595 Terje Bergstrom 2013-03-22  30  }
7ede0b0bf3e2595 Terje Bergstrom 2013-03-22  31  =


:::::: The code at line 29 was first introduced by commit
:::::: 7ede0b0bf3e2595d40d6195b6fe4c4dcef438830 gpu: host1x: Add syncpoint =
wait and interrupts

:::::: TO: Terje Bergstrom <tbergstrom@nvidia.com>
:::::: CC: Thierry Reding <thierry.reding@avionic-design.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1410657216147999073==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
dI8BAA==
--===============1410657216147999073==--

