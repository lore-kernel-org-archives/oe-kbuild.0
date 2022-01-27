Content-Type: multipart/mixed; boundary="===============3362565137979752484=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/include/asm/spinlock.h:24:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 27 Jan 2022 12:37:53 +0800
Message-ID: <202201271222.3cRzpgZJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3362565137979752484==
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
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 531ae4b06a737ed5539cd75dc6f6b9a28f900bba locking/rtmutex: Split API=
 from implementation
date:   5 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220121 (https://download.01.org/0day-ci/arc=
hive/20220127/202201271222.3cRzpgZJ-lkp(a)intel.com/config)
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
                                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:752:5: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                                   strcat(kernel_debug_string, ",");
                                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:777:5: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(client_debug_string,
                                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:777:5: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                                   strcat(client_debug_string,
                                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:779:5: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(client_debug_string, ",");
                                   ^~~~~~
   fs/orangefs/orangefs-debugfs.c:779:5: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
                                   strcat(client_debug_string, ",");
                                   ^~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   lib/mpi/ec.c:396:2: warning: Value stored to 'cy' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           cy +=3D mpihelp_add_n(b0, b0, a3, LIMB_SIZE_HALF_448);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/ec.c:396:2: note: Value stored to 'cy' is never read
           cy +=3D mpihelp_add_n(b0, b0, a3, LIMB_SIZE_HALF_448);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/ec.c:410:2: warning: Value stored to 'cy' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           cy +=3D mpihelp_add_n(b1, b1, a3, LIMB_SIZE_HALF_448);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/ec.c:410:2: note: Value stored to 'cy' is never read
           cy +=3D mpihelp_add_n(b1, b1, a3, LIMB_SIZE_HALF_448);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
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

fab957c11efe2f4 Palmer Dabbelt 2017-07-10  21  =

fab957c11efe2f4 Palmer Dabbelt 2017-07-10  22  static inline void arch_spin=
_unlock(arch_spinlock_t *lock)
fab957c11efe2f4 Palmer Dabbelt 2017-07-10  23  {
0123f4d76ca63b7 Andrea Parri   2018-03-09 @24  	smp_store_release(&lock->lo=
ck, 0);
fab957c11efe2f4 Palmer Dabbelt 2017-07-10  25  }
fab957c11efe2f4 Palmer Dabbelt 2017-07-10  26  =


:::::: The code at line 24 was first introduced by commit
:::::: 0123f4d76ca63b7b895f40089be0ce4809e392d8 riscv/spinlock: Strengthen =
implementations with fences

:::::: TO: Andrea Parri <parri.andrea@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3362565137979752484==--

