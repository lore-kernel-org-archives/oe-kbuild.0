Content-Type: multipart/mixed; boundary="===============9184004116910116322=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:x86/wip.ibt 2/15] fs/eventpoll.c:1303:26: warning: The right operand of '>' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 17 Jan 2022 14:33:53 +0800
Message-ID: <202201171415.W4YAFAWN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9184004116910116322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x8=
6/wip.ibt
head:   7b31f08c5f3fb5f3cfd75deb24787569f35315d5
commit: f348a305ec94fcc9a5ac3aefb53dbf2269f26e18 [2/15] x86: Annotate _THIS=
_IP_
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20117/202201171415.W4YAFAWN-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a31=
75c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3Df348a305ec94fcc9a5ac3aefb53dbf2269f26e18
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout f348a305ec94fcc9a5ac3aefb53dbf2269f26e18
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   ipc/sem.c:741:13: note: Taking false branch
                   int idx =3D array_index_nospec(sop->sem_num, sma->sem_ns=
ems);
                             ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   ipc/sem.c:741:13: note: Loop condition is false.  Exiting loop
                   int idx =3D array_index_nospec(sop->sem_num, sma->sem_ns=
ems);
                             ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   ipc/sem.c:747:7: note: Assuming 'sem_op' is not equal to 0
                   if (!sem_op && result)
                       ^~~~~~~
   ipc/sem.c:747:15: note: Left side of '&&' is false
                   if (!sem_op && result)
                               ^
   ipc/sem.c:751:7: note: Assuming 'result' is >=3D 0
                   if (result < 0)
                       ^~~~~~~~~~
   ipc/sem.c:751:3: note: Taking false branch
                   if (result < 0)
                   ^
   ipc/sem.c:754:7: note: Assuming 'result' is <=3D SEMVMX
                   if (result > SEMVMX)
                       ^~~~~~~~~~~~~~~
   ipc/sem.c:754:3: note: Taking false branch
                   if (result > SEMVMX)
                   ^
   ipc/sem.c:757:7: note: Assuming the condition is true
                   if (sop->sem_flg & SEM_UNDO) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:757:3: note: Taking true branch
                   if (sop->sem_flg & SEM_UNDO) {
                   ^
   ipc/sem.c:758:15: note: Access to field 'semadj' results in a dereferenc=
e of a null pointer (loaded from variable 'un')
                           int undo =3D un->semadj[sop->sem_num] - sem_op;
                                      ^~
   ipc/sem.c:769:3: warning: Value stored to 'result' is never read [clang-=
analyzer-deadcode.DeadStores]
                   result =3D curr->semval;
                   ^        ~~~~~~~~~~~~
   ipc/sem.c:769:3: note: Value stored to 'result' is never read
                   result =3D curr->semval;
                   ^        ~~~~~~~~~~~~
   ipc/sem.c:1433:2: warning: Value stored to 'err' is never read [clang-an=
alyzer-deadcode.DeadStores]
           err =3D -EACCES;
           ^     ~~~~~~~
   ipc/sem.c:1433:2: note: Value stored to 'err' is never read
           err =3D -EACCES;
           ^     ~~~~~~~
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
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
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
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
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
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
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
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/eventpoll.c:1325:2: note: Loop condition is false.  Exiting loop
--
   fs/reiserfs/journal.c:4316:21: note: Use of memory after it is freed
           list_for_each_safe(entry, safe, &journal->j_journal_list) {
                              ^
   include/linux/list.h:600:31: note: expanded from macro 'list_for_each_sa=
fe'
           for (pos =3D (head)->next, n =3D pos->next; pos !=3D (head); \
                                        ^~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   18 warnings generated.
   net/ipv6/route.c:568:6: warning: Access to field 'nh' results in a deref=
erence of a null pointer (loaded from variable 'f6i') [clang-analyzer-core.=
NullDereference]
           if (unlikely(f6i->nh)) {
               ^
   include/linux/compiler.h:78:41: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                              ^~
   net/ipv6/route.c:527:2: note: 'f6i' initialized here
           struct fib6_info *f6i =3D res->f6i;
           ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:531:6: note: Assuming 'oif' is not equal to 0
           if (!oif && ipv6_addr_any(saddr)) {
               ^~~~
   net/ipv6/route.c:531:11: note: Left side of '&&' is false
           if (!oif && ipv6_addr_any(saddr)) {
                    ^
   net/ipv6/route.c:543:20: note: Assuming pointer value is null
           for (spf6i =3D f6i; spf6i; spf6i =3D rcu_dereference(spf6i->fib6=
_next)) {
                             ^~~~~
   net/ipv6/route.c:543:2: note: Loop condition is false. Execution continu=
es on line 562
           for (spf6i =3D f6i; spf6i; spf6i =3D rcu_dereference(spf6i->fib6=
_next)) {
           ^
   net/ipv6/route.c:562:6: note: 'oif' is not equal to 0
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
               ^~~
   net/ipv6/route.c:562:6: note: Left side of '&&' is true
   net/ipv6/route.c:562:13: note: Assuming the condition is false
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:562:2: note: Taking false branch
           if (oif && flags & RT6_LOOKUP_F_IFACE) {
           ^
   net/ipv6/route.c:568:6: note: Access to field 'nh' results in a derefere=
nce of a null pointer (loaded from variable 'f6i')
           if (unlikely(f6i->nh)) {
               ^
   include/linux/compiler.h:78:41: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                              ^~
>> net/ipv6/route.c:3424:9: warning: Dereference of null pointer (loaded fr=
om variable '_dev') [clang-analyzer-core.NullDereference]
                   *_dev =3D dev =3D res.nh->fib_nh_dev;
                    ~~~~ ^
   net/ipv6/route.c:3384:27: note: Assuming '_dev' is null
           struct net_device *dev =3D _dev ? *_dev : NULL;
                                    ^~~~
   net/ipv6/route.c:3384:27: note: '?' condition is false
   net/ipv6/route.c:3389:6: note: Assuming field 'fc_table' is 0
           if (cfg->fc_table) {
               ^~~~~~~~~~~~~
   net/ipv6/route.c:3389:2: note: Taking false branch
           if (cfg->fc_table) {
           ^
   net/ipv6/route.c:3401:6: note: 'err' is < 0
           if (err < 0) {
               ^~~
   net/ipv6/route.c:3401:2: note: Taking true branch
           if (err < 0) {
           ^
   net/ipv6/route.c:3408:7: note: Assuming 'err' is 0
                   if (err || res.fib6_flags & RTF_REJECT ||
                       ^~~
   net/ipv6/route.c:3408:7: note: Left side of '||' is false
   net/ipv6/route.c:3408:14: note: Assuming the condition is false
                   if (err || res.fib6_flags & RTF_REJECT ||
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3408:7: note: Left side of '||' is false
                   if (err || res.fib6_flags & RTF_REJECT ||
                       ^
   net/ipv6/route.c:3409:7: note: Assuming field 'nhc_gw_family' is 0
                       res.nh->fib_nh_gw_family)
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3408:3: note: Taking false branch
                   if (err || res.fib6_flags & RTF_REJECT ||
                   ^
   net/ipv6/route.c:3412:7: note: 'err' is 0
                   if (err)
                       ^~~
   net/ipv6/route.c:3412:3: note: Taking false branch
                   if (err)
                   ^
   net/ipv6/route.c:3416:6: note: Assuming field 'fc_ifindex' is equal to 0
                                    cfg->fc_ifindex !=3D 0, NULL, flags);
                                    ^~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3420:6: note: 'dev' is null
           if (dev) {
               ^~~
   net/ipv6/route.c:3420:2: note: Taking false branch
           if (dev) {
           ^
   net/ipv6/route.c:3424:9: note: Dereference of null pointer (loaded from =
variable '_dev')
                   *_dev =3D dev =3D res.nh->fib_nh_dev;
                    ~~~~ ^
   net/ipv6/route.c:3631:24: warning: Access to field 'ifindex' results in =
a dereference of a null pointer (loaded from variable 'dev') [clang-analyze=
r-core.NullDereference]
           fib6_nh->fib_nh_oif =3D dev->ifindex;
                                 ^
   net/ipv6/route.c:3715:6: note: Assuming the condition is false
           if (cfg->fc_flags & RTF_PCPU) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3715:2: note: Taking false branch
           if (cfg->fc_flags & RTF_PCPU) {
           ^
   net/ipv6/route.c:3721:6: note: Assuming the condition is false
           if (cfg->fc_flags & RTF_CACHE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3721:2: note: Taking false branch
           if (cfg->fc_flags & RTF_CACHE) {
           ^
   net/ipv6/route.c:3726:6: note: Assuming the condition is false
           if (cfg->fc_type > RTN_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3726:2: note: Taking false branch
           if (cfg->fc_type > RTN_MAX) {
           ^
   net/ipv6/route.c:3731:6: note: Assuming field 'fc_dst_len' is <=3D 128
           if (cfg->fc_dst_len > 128) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3731:2: note: Taking false branch
           if (cfg->fc_dst_len > 128) {
           ^
   net/ipv6/route.c:3735:6: note: Assuming field 'fc_src_len' is <=3D 128
           if (cfg->fc_src_len > 128) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:3735:2: note: Taking false branch
           if (cfg->fc_src_len > 128) {
           ^
   net/ipv6/route.c:3740:6: note: Assuming field 'fc_src_len' is 0
           if (cfg->fc_src_len) {
               ^~~~~~~~~~~~~~~
   net/ipv6/route.c:3740:2: note: Taking false branch
           if (cfg->fc_src_len) {
           ^
   net/ipv6/route.c:3746:6: note: Assuming field 'fc_nh_id' is 0
           if (cfg->fc_nh_id) {
               ^~~~~~~~~~~~~
   net/ipv6/route.c:3746:2: note: Taking false branch
           if (cfg->fc_nh_id) {
           ^
   net/ipv6/route.c:3758:6: note: Assuming field 'nlh' is null
           if (cfg->fc_nlinfo.nlh &&
               ^~~~~~~~~~~~~~~~~~

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9184004116910116322==--

