Content-Type: multipart/mixed; boundary="===============9144110261361072414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/include/asm/spinlock.h:24:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 18 Mar 2022 13:07:36 +0800
Message-ID: <202203181309.E0l1DZXg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9144110261361072414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   551acdc3c3d2b6bc97f11e31dcf960bc36343bfc
commit: 531ae4b06a737ed5539cd75dc6f6b9a28f900bba locking/rtmutex: Split API=
 from implementation
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220317 (https://download.01.org/0day-ci/arc=
hive/20220318/202203181309.E0l1DZXg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
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
                                                ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:6: note: Assuming 'dividend_size' is not equal to 0
           if (!dividend_size)
               ^~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:2: note: Taking false branch
           if (!dividend_size)
           ^
   lib/mpi/mpih-div.c:49:4: note: Left side of '&&' is false
                           && (UDIV_TIME - (2 * UMUL_TIME + 6)) * dividend_=
size > UDIV_TIME) {
                           ^
   lib/mpi/mpih-div.c:122:3: note: Taking true branch
                   if (UDIV_NEEDS_NORMALIZATION) {
                   ^
   lib/mpi/mpih-div.c:125:26: note: Calling 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32, which pa=
rticipates in a condition later
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:125:26: note: Returning from 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:125:4: note: The value 32 is assigned to 'normalizati=
on_steps'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:126:8: note: 'normalization_steps' is 32
                           if (normalization_steps) {
                               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:126:4: note: Taking true branch
                           if (normalization_steps) {
                           ^
   lib/mpi/mpih-div.c:127:18: note: Assigned value is garbage or undefined
                                   divisor_limb <<=3D normalization_steps;
                                                ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:202:12: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
                   return 1 / dsize;
                          ~~^~~~~~~
   lib/mpi/mpih-div.c:194:2: note: Control jumps to 'case 0:' @line 195
           switch (dsize) {
           ^
   lib/mpi/mpih-div.c:202:12: note: Division by zero
                   return 1 / dsize;
                          ~~^~~~~~~
   lib/mpi/mpih-div.c:475:18: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                                   divisor_limb <<=3D normalization_steps;
                                                ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:387:6: note: Assuming 'dividend_size' is not equal to=
 0
           if (!dividend_size)
               ^~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:387:2: note: Taking false branch
           if (!dividend_size)
           ^
   lib/mpi/mpih-div.c:399:4: note: Left side of '&&' is false
                           && (UDIV_TIME - (2 * UMUL_TIME + 6)) * dividend_=
size > UDIV_TIME) {
                           ^
   lib/mpi/mpih-div.c:470:3: note: Taking true branch
                   if (UDIV_NEEDS_NORMALIZATION) {
                   ^
   lib/mpi/mpih-div.c:473:26: note: Calling 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32, which pa=
rticipates in a condition later
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:473:26: note: Returning from 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:473:4: note: The value 32 is assigned to 'normalizati=
on_steps'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:474:8: note: 'normalization_steps' is 32
                           if (normalization_steps) {
                               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:474:4: note: Taking true branch
                           if (normalization_steps) {
                           ^
   lib/mpi/mpih-div.c:475:18: note: Assigned value is garbage or undefined
                                   divisor_limb <<=3D normalization_steps;
                                                ^   ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9144110261361072414==--

