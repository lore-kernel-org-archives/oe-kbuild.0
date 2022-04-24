Content-Type: multipart/mixed; boundary="===============7005178458325624033=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/eventpoll.c:1303:26: warning: The right operand of '>' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 24 Apr 2022 11:12:59 +0800
Message-ID: <202204241103.fw5ROdBp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7005178458325624033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f39359260e39fc45008c1140a84497ffde193fa7
commit: 80d7476fa20a3cc83f76b3b02a7575891d1e7511 kcsan: Turn barrier instru=
mentation into macros
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220421 (https://download.01.org/0day-ci/arc=
hive/20220424/202204241103.fw5ROdBp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D80d7476fa20a3cc83f76b3b02a7575891d1e7511
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 80d7476fa20a3cc83f76b3b02a7575891d1e7511
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/locking/rtmutex.c:651:6: note: 'orig_waiter' is null
           if (orig_waiter && !rt_mutex_owner(orig_lock))
               ^~~~~~~~~~~
   kernel/locking/rtmutex.c:651:18: note: Left side of '&&' is false
           if (orig_waiter && !rt_mutex_owner(orig_lock))
                           ^
   kernel/locking/rtmutex.c:663:6: note: Assuming 'next_lock' is equal to f=
ield 'lock'
           if (next_lock !=3D waiter->lock)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:663:2: note: Taking false branch
           if (next_lock !=3D waiter->lock)
           ^
   kernel/locking/rtmutex.c:688:36: note: Left side of '&&' is false
           if (IS_ENABLED(CONFIG_PREEMPT_RT) && waiter->ww_ctx && detect_de=
adlock)
                                             ^
   kernel/locking/rtmutex.c:696:6: note: 'top_waiter' is null
           if (top_waiter) {
               ^~~~~~~~~~
   kernel/locking/rtmutex.c:696:2: note: Taking false branch
           if (top_waiter) {
           ^
   kernel/locking/rtmutex.c:720:2: note: Taking false branch
           if (rt_mutex_waiter_equal(waiter, task_to_waiter(task))) {
           ^
   kernel/locking/rtmutex.c:736:6: note: Assuming the condition is false
           if (!raw_spin_trylock(&lock->wait_lock)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:736:2: note: Taking false branch
           if (!raw_spin_trylock(&lock->wait_lock)) {
           ^
   kernel/locking/rtmutex.c:751:6: note: Assuming 'lock' is not equal to 'o=
rig_lock'
           if (lock =3D=3D orig_lock || rt_mutex_owner(lock) =3D=3D top_tas=
k) {
               ^~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:751:6: note: Left side of '||' is false
   kernel/locking/rtmutex.c:751:27: note: Assuming the condition is false
           if (lock =3D=3D orig_lock || rt_mutex_owner(lock) =3D=3D top_tas=
k) {
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:751:2: note: Taking false branch
           if (lock =3D=3D orig_lock || rt_mutex_owner(lock) =3D=3D top_tas=
k) {
           ^
   kernel/locking/rtmutex.c:776:7: note: 'requeue' is true
           if (!requeue) {
                ^~~~~~~
   kernel/locking/rtmutex.c:776:2: note: Taking false branch
           if (!requeue) {
           ^
   kernel/locking/rtmutex.c:859:6: note: Assuming the condition is false
           if (!rt_mutex_owner(lock)) {
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:859:2: note: Taking false branch
           if (!rt_mutex_owner(lock)) {
           ^
   kernel/locking/rtmutex.c:876:2: note: Taking false branch
           if (waiter =3D=3D rt_mutex_top_waiter(lock)) {
           ^
   kernel/locking/rtmutex.c:887:13: note: Assuming 'prerequeue_top_waiter' =
is equal to 'waiter'
           } else if (prerequeue_top_waiter =3D=3D waiter) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:887:9: note: Taking true branch
           } else if (prerequeue_top_waiter =3D=3D waiter) {
                  ^
   kernel/locking/rtmutex.c:900:3: note: Calling 'rt_mutex_enqueue_pi'
                   rt_mutex_enqueue_pi(task, waiter);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:423:2: note: Calling 'rb_add_cached'
           rb_add_cached(&waiter->pi_tree_entry, &task->pi_waiters, __pi_wa=
iter_less);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   include/linux/rbtree.h:172:2: note: Loop condition is true.  Entering lo=
op body
           while (*link) {
           ^
   include/linux/rbtree.h:174:7: note: Calling '__pi_waiter_less'
                   if (less(node, parent)) {
                       ^~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:417:30: note: Passing null pointer value via 1s=
t parameter 'left'
           return rt_mutex_waiter_less(__node_2_pi_waiter(a), __node_2_pi_w=
aiter(b));
                                       ^
   kernel/locking/rtmutex.c:412:2: note: expanded from macro '__node_2_pi_w=
aiter'
           rb_entry((node), struct rt_mutex_waiter, pi_tree_entry)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rbtree.h:28:37: note: expanded from macro 'rb_entry'
   #define rb_entry(ptr, type, member) container_of(ptr, type, member)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:17:41: note: expanded from macro 'container=
_of'
   #define container_of(ptr, type, member) ({                              \
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:417:9: note: Calling 'rt_mutex_waiter_less'
           return rt_mutex_waiter_less(__node_2_pi_waiter(a), __node_2_pi_w=
aiter(b));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/locking/rtmutex.c:313:6: note: Access to field 'prio' results in =
a dereference of a null pointer (loaded from variable 'left')
           if (left->prio < right->prio)
               ^~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> fs/eventpoll.c:1303:26: warning: The right operand of '>' is a garbage v=
alue due to array index out of bounds [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
           if (++path_count[nests] > path_limits[nests])
                                   ^
   fs/eventpoll.c:1321:6: note: Assuming 'depth' is <=3D EP_MAX_NESTS
           if (depth > EP_MAX_NESTS) /* too deep nesting */
               ^~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:1321:2: note: Taking false branch
           if (depth > EP_MAX_NESTS) /* too deep nesting */
           ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is false
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is false
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is false
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/eventpoll.c:1325:2: note: Left side of '||' is true
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   fs/eventpoll.c:1325:2: note: Taking false branch
           hlist_for_each_entry_rcu(epi, refs, fllink) {
           ^
   include/linux/rculist.h:706:30: note: expanded from macro 'hlist_for_eac=
h_entry_rcu'
                pos =3D hlist_entry_safe(rcu_dereference_raw(hlist_first_rc=
u(head)),\
                                       ^
   include/linux/rcupdate.h:404:25: note: expanded from macro 'rcu_derefere=
nce_raw'
           typeof(p) ________p1 =3D READ_ONCE(p); \
                                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/eventpoll.c:1325:2: note: Loop condition is false.  Exiting loop

vim +1303 fs/eventpoll.c

28d82dc1c4edbc Jason Baron 2012-01-12  1296  =

28d82dc1c4edbc Jason Baron 2012-01-12  1297  static int path_count_inc(int =
nests)
28d82dc1c4edbc Jason Baron 2012-01-12  1298  {
93dc6107a76dae Jason Baron 2012-03-16  1299  	/* Allow an arbitrary number =
of depth 1 paths */
93dc6107a76dae Jason Baron 2012-03-16  1300  	if (nests =3D=3D 0)
93dc6107a76dae Jason Baron 2012-03-16  1301  		return 0;
93dc6107a76dae Jason Baron 2012-03-16  1302  =

28d82dc1c4edbc Jason Baron 2012-01-12 @1303  	if (++path_count[nests] > pat=
h_limits[nests])
28d82dc1c4edbc Jason Baron 2012-01-12  1304  		return -1;
28d82dc1c4edbc Jason Baron 2012-01-12  1305  	return 0;
28d82dc1c4edbc Jason Baron 2012-01-12  1306  }
28d82dc1c4edbc Jason Baron 2012-01-12  1307  =


:::::: The code at line 1303 was first introduced by commit
:::::: 28d82dc1c4edbc352129f97f4ca22624d1fe61de epoll: limit paths

:::::: TO: Jason Baron <jbaron@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7005178458325624033==--

