Content-Type: multipart/mixed; boundary="===============7094532414442372972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kunit: Rework kunit_resource allocation policy
Date: Sun, 20 Mar 2022 23:52:32 +0800
Message-ID: <202203202343.fPluqjlg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7094532414442372972==
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
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220320/202203202343.fPluqjlg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f26=
7efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1e8a349a7a1c6a46c24b09755=
471e053d1f04c8d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Gow/kunit-Rework-kunit_resou=
rce-allocation-policy/20220319-135701
        git checkout 1e8a349a7a1c6a46c24b09755471e053d1f04c8d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/sched.h:1628:2: note: Loop condition is false.  Exiting lo=
op
           BUILD_BUG_ON_NOT_POWER_OF_2(TASK_REPORT_MAX);
           ^
   include/linux/build_bug.h:23:2: note: expanded from macro 'BUILD_BUG_ON_=
NOT_POWER_OF_2'
           BUILD_BUG_ON((n) =3D=3D 0 || (((n) & ((n) - 1)) !=3D 0))
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   include/linux/sched.h:1630:6: note: Assuming the condition is false
           if (tsk_state =3D=3D TASK_IDLE)
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:1630:2: note: Taking false branch
           if (tsk_state =3D=3D TASK_IDLE)
           ^
   include/linux/sched.h:1633:9: note: Calling 'fls'
           return fls(state);
                  ^~~~~~~~~~
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
   include/linux/sched.h:1633:9: note: Returning from 'fls'
           return fls(state);
                  ^~~~~~~~~~
   include/linux/sched.h:1633:2: note: Returning the value 32
           return fls(state);
           ^~~~~~~~~~~~~~~~~
   fs/proc/array.c:142:26: note: Returning from 'task_state_index'
           return task_state_array[task_state_index(tsk)];
                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/proc/array.c:142:2: note: Undefined or garbage value returned to call=
er
           return task_state_array[task_state_index(tsk)];
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
>> include/kunit/test.h:412:6: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           if (res->free)
               ^
   lib/kunit/test.c:285:6: note: Assuming 'pass' is false
           if (pass)
               ^~~~
   lib/kunit/test.c:285:2: note: Taking false branch
           if (pass)
           ^
   lib/kunit/test.c:293:2: note: Calling 'kunit_fail'
           kunit_fail(test, assert);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:250:6: note: Assuming 'stream' is non-null
           if (!stream) {
               ^~~~~~~
   lib/kunit/test.c:250:2: note: Taking false branch
           if (!stream) {
           ^
   lib/kunit/test.c:260:2: note: Calling 'kunit_print_string_stream'
           kunit_print_string_stream(test, stream);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:226:6: note: Assuming the condition is false
           if (string_stream_is_empty(stream))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:226:2: note: Taking false branch
           if (string_stream_is_empty(stream))
           ^
   lib/kunit/test.c:230:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   lib/kunit/test.c:230:2: note: Taking false branch
           if (!buf) {
           ^
   lib/kunit/test.c:238:3: note: Loop condition is false.  Exiting loop
                   kunit_err(test, "%s", buf);
                   ^
   include/kunit/test.h:850:2: note: expanded from macro 'kunit_err'
           kunit_printk(KERN_ERR, test, fmt, ##__VA_ARGS__)
           ^
   include/kunit/test.h:815:2: note: expanded from macro 'kunit_printk'
           kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
           ^
   include/kunit/test.h:809:3: note: expanded from macro 'kunit_log'
                   printk(lvl fmt, ##__VA_ARGS__);                         \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   lib/kunit/test.c:238:3: note: Loop condition is false.  Exiting loop
                   kunit_err(test, "%s", buf);
                   ^
   include/kunit/test.h:850:2: note: expanded from macro 'kunit_err'
           kunit_printk(KERN_ERR, test, fmt, ##__VA_ARGS__)
           ^
   include/kunit/test.h:815:2: note: expanded from macro 'kunit_printk'
           kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
           ^
   include/kunit/test.h:808:2: note: expanded from macro 'kunit_log'
           do {                                                            \
           ^
   lib/kunit/test.c:239:3: note: Calling 'kunit_kfree'
                   kunit_kfree(test, buf);
                   ^~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:708:2: note: Calling 'kunit_remove_resource'
           kunit_remove_resource(test, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:634:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&test->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   lib/kunit/test.c:634:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&test->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   lib/kunit/test.c:637:2: note: Calling 'kunit_put_resource'
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:436:2: note: Calling 'kref_put'
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'kunit_release_resource'
                   release(kref);

vim +412 include/kunit/test.h

d4cdd146d0db90 Alan Maguire 2020-05-29  401  =

d4cdd146d0db90 Alan Maguire 2020-05-29  402  /*
d4cdd146d0db90 Alan Maguire 2020-05-29  403   * Called when refcount reache=
s zero via kunit_put_resources();
d4cdd146d0db90 Alan Maguire 2020-05-29  404   * should not be called direct=
ly.
d4cdd146d0db90 Alan Maguire 2020-05-29  405   */
d4cdd146d0db90 Alan Maguire 2020-05-29  406  static inline void kunit_relea=
se_resource(struct kref *kref)
d4cdd146d0db90 Alan Maguire 2020-05-29  407  {
d4cdd146d0db90 Alan Maguire 2020-05-29  408  	struct kunit_resource *res =
=3D container_of(kref, struct kunit_resource,
d4cdd146d0db90 Alan Maguire 2020-05-29  409  						  refcount);
d4cdd146d0db90 Alan Maguire 2020-05-29  410  =

d4cdd146d0db90 Alan Maguire 2020-05-29  411  	/* If free function is define=
d, resource was dynamically allocated. */
1e8a349a7a1c6a David Gow    2022-03-19 @412  	if (res->free)
d4cdd146d0db90 Alan Maguire 2020-05-29  413  		res->free(res);
1e8a349a7a1c6a David Gow    2022-03-19  414  =

1e8a349a7a1c6a David Gow    2022-03-19  415  	/* 'res' is valid here, as if=
 should_free is set, res->free may not free
1e8a349a7a1c6a David Gow    2022-03-19  416  	 * 'res' itself, just res->da=
ta
1e8a349a7a1c6a David Gow    2022-03-19  417  	 */
1e8a349a7a1c6a David Gow    2022-03-19  418  	if (res->should_free)
d4cdd146d0db90 Alan Maguire 2020-05-29  419  		kfree(res);
d4cdd146d0db90 Alan Maguire 2020-05-29  420  }
d4cdd146d0db90 Alan Maguire 2020-05-29  421  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7094532414442372972==--

