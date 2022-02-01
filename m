Content-Type: multipart/mixed; boundary="===============8872564065286105788=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/include/asm/spinlock.h:24:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 01 Feb 2022 21:25:36 +0800
Message-ID: <202202012114.Gf0Lurwz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8872564065286105788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 531ae4b06a737ed5539cd75dc6f6b9a28f900bba locking/rtmutex: Split API=
 from implementation
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220121 (https://download.01.org/0day-ci/arc=
hive/20220201/202202012114.Gf0Lurwz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D531ae4b06a737ed5539cd75dc6f6b9a28f900bba
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 531ae4b06a737ed5539cd75dc6f6b9a28f900bba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^
   fs/ext4/indirect.c:1254:3: note: Taking false branch
                   if (n =3D=3D 1) {
                   ^
   fs/ext4/indirect.c:1265:17: note: Calling 'ext4_find_shared'
                   partial =3D p =3D ext4_find_shared(inode, n, offsets, ch=
ain, &nr);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/ext4/indirect.c:795:18: note: 'k' is <=3D 1
           for (k =3D depth; k > 1 && !offsets[k-1]; k--)
                           ^
   fs/ext4/indirect.c:795:24: note: Left side of '&&' is false
           for (k =3D depth; k > 1 && !offsets[k-1]; k--)
                                 ^
   fs/ext4/indirect.c:797:12: note: Calling 'ext4_get_branch'
           partial =3D ext4_get_branch(inode, k, offsets, chain, &err);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/indirect.c:155:25: note: Left side of '&&' is false
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                  ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
                          ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/ext4/indirect.c:155:25: note: Taking false branch
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                  ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
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
   fs/ext4/indirect.c:155:25: note: Loop condition is false.  Exiting loop
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                  ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
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
   fs/ext4/indirect.c:155:47: note: The right operand of '+' is a garbage v=
alue
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                                        ^ ~~~~~~~~
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (4 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> arch/riscv/include/asm/spinlock.h:24:2: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           smp_store_release(&lock->lock, 0);
           ^
   include/asm-generic/barrier.h:138:33: note: expanded from macro 'smp_sto=
re_release'
   #define smp_store_release(p, v) __smp_store_release(p, v)
                                   ^
   arch/riscv/include/asm/barrier.h:34:2: note: expanded from macro '__smp_=
store_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   kernel/locking/rtmutex_api.c:419:2: note: Loop condition is false.  Exit=
ing loop
           raw_spin_lock_irqsave(&task->pi_lock, flags);
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/locking/rtmutex_api.c:422:6: note: Assuming 'waiter' is non-null
           if (!waiter || rt_mutex_waiter_equal(waiter, task_to_waiter(task=
))) {
               ^~~~~~~
   kernel/locking/rtmutex_api.c:422:6: note: Left side of '||' is false
   kernel/locking/rtmutex_api.c:422:2: note: Taking false branch
           if (!waiter || rt_mutex_waiter_equal(waiter, task_to_waiter(task=
))) {
           ^
   kernel/locking/rtmutex_api.c:427:2: note: Loop condition is false.  Exit=
ing loop
           raw_spin_unlock_irqrestore(&task->pi_lock, flags);
           ^
   include/linux/spinlock.h:288:2: note: expanded from macro 'raw_spin_unlo=
ck_irqrestore'
           do {                                                    \
           ^
   kernel/locking/rtmutex_api.c:432:2: note: Calling 'rt_mutex_adjust_prio_=
chain'
           rt_mutex_adjust_prio_chain(task, RT_MUTEX_MIN_CHAINWALK, NULL,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:466:6: note: Assuming the condition is false
           if (++depth > max_lock_depth) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:466:2: note: Taking false branch
           if (++depth > max_lock_depth) {
           ^
   kernel/locking/rtmutex.c:510:6: note: Assuming 'waiter' is non-null
           if (!waiter)
               ^~~~~~~
   kernel/locking/rtmutex.c:510:2: note: Taking false branch
           if (!waiter)
           ^
   kernel/locking/rtmutex.c:517:6: note: 'orig_waiter' is null
           if (orig_waiter && !rt_mutex_owner(orig_lock))
               ^~~~~~~~~~~
   kernel/locking/rtmutex.c:517:18: note: Left side of '&&' is false
           if (orig_waiter && !rt_mutex_owner(orig_lock))
                           ^
   kernel/locking/rtmutex.c:529:6: note: Assuming 'next_lock' is equal to f=
ield 'lock'
           if (next_lock !=3D waiter->lock)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:529:2: note: Taking false branch
           if (next_lock !=3D waiter->lock)
           ^
   kernel/locking/rtmutex.c:537:6: note: 'top_waiter' is null
           if (top_waiter) {
               ^~~~~~~~~~
   kernel/locking/rtmutex.c:537:2: note: Taking false branch
           if (top_waiter) {
           ^
   kernel/locking/rtmutex.c:561:6: note: Calling 'rt_mutex_waiter_equal'
           if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:274:6: note: Assuming 'left->prio' is not equal=
 to 'right->prio'
           if (left->prio !=3D right->prio)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:274:2: note: Taking true branch
           if (left->prio !=3D right->prio)
           ^
   kernel/locking/rtmutex.c:275:3: note: Returning without writing to 'left=
->lock'
                   return 0;
                   ^
   kernel/locking/rtmutex.c:275:3: note: Returning zero, which participates=
 in a condition later
                   return 0;
                   ^~~~~~~~
   kernel/locking/rtmutex.c:561:6: note: Returning from 'rt_mutex_waiter_eq=
ual'
           if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:561:2: note: Taking false branch
           if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
           ^
   kernel/locking/rtmutex.c:571:2: note: Value assigned to 'lock'
           lock =3D waiter->lock;
           ^~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:577:6: note: Assuming the condition is false
           if (!raw_spin_trylock(&lock->wait_lock)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:577:2: note: Taking false branch
           if (!raw_spin_trylock(&lock->wait_lock)) {
           ^
   kernel/locking/rtmutex.c:592:6: note: Assuming 'lock' is equal to 'orig_=
lock'
           if (lock =3D=3D orig_lock || rt_mutex_owner(lock) =3D=3D top_tas=
k) {
               ^~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:592:24: note: Left side of '||' is true

vim +24 arch/riscv/include/asm/spinlock.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  21  =

fab957c11efe2f Palmer Dabbelt 2017-07-10  22  static inline void arch_spin_=
unlock(arch_spinlock_t *lock)
fab957c11efe2f Palmer Dabbelt 2017-07-10  23  {
0123f4d76ca63b Andrea Parri   2018-03-09 @24  	smp_store_release(&lock->loc=
k, 0);
fab957c11efe2f Palmer Dabbelt 2017-07-10  25  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  26  =


:::::: The code at line 24 was first introduced by commit
:::::: 0123f4d76ca63b7b895f40089be0ce4809e392d8 riscv/spinlock: Strengthen =
implementations with fences

:::::: TO: Andrea Parri <parri.andrea@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8872564065286105788==--

