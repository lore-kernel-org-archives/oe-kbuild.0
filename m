Content-Type: multipart/mixed; boundary="===============7883376802508048060=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/include/asm/atomic.h:224:17: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 03 Jul 2022 16:41:33 +0800
Message-ID: <202207031604.ybu2peOd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7883376802508048060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/include/asm/atomic.h:224:17: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Eric W. Biederman" <ebiederm@xmission.com>
CC: Alexey Gladkov <legion@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69cb6c6556ad89620547318439d6be8bb1629a5a
commit: 32342701b4ba57a6fd77e8aca2f65f68c0fa1da6 ucounts: Use atomic_long_s=
ub_return for clarity
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220625 (https://download.01.org/0day-ci/archi=
ve/20220703/202207031604.ybu2peOd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7dd=
b428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D32342701b4ba57a6fd77e8aca2f65f68c0fa1da6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 32342701b4ba57a6fd77e8aca2f65f68c0fa1da6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/jfs/jfs_imap.c:1081:7: note: Assuming 'inofreefwd' is >=3D 0
                   if (inofreefwd >=3D 0) {
                       ^~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1081:3: note: Taking true branch
                   if (inofreefwd >=3D 0) {
                   ^
   fs/jfs/jfs_imap.c:1083:8: note: Assuming 'inofreefwd' is not equal to 'f=
wd'
                           if (inofreefwd =3D=3D fwd)
                               ^~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1083:4: note: Taking false branch
                           if (inofreefwd =3D=3D fwd)
                           ^
   fs/jfs/jfs_imap.c:1085:13: note: Assuming 'inofreefwd' is not equal to '=
back'
                           else if (inofreefwd =3D=3D back)
                                    ^~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1085:9: note: Taking false branch
                           else if (inofreefwd =3D=3D back)
                                ^
   fs/jfs/jfs_imap.c:1088:10: note: Assuming 'rc' is 0
                                   if ((rc =3D
                                        ^~
   fs/jfs/jfs_imap.c:1088:5: note: Taking false branch
                                   if ((rc =3D
                                   ^
   fs/jfs/jfs_imap.c:1093:11: note: Assuming 'ciagp' is not equal to null
                           assert(ciagp !=3D NULL);
                                  ^
   fs/jfs/jfs_debug.h:30:8: note: expanded from macro 'assert'
           if (!(p)) {     \
                 ^
   fs/jfs/jfs_imap.c:1093:4: note: Taking false branch
                           assert(ciagp !=3D NULL);
                           ^
   fs/jfs/jfs_debug.h:30:2: note: expanded from macro 'assert'
           if (!(p)) {     \
           ^
   fs/jfs/jfs_imap.c:1093:4: note: Loop condition is false.  Exiting loop
                           assert(ciagp !=3D NULL);
                           ^
   fs/jfs/jfs_debug.h:29:19: note: expanded from macro 'assert'
   #define assert(p) do {  \
                     ^
   fs/jfs/jfs_imap.c:1096:7: note: Assuming 'inofreeback' is >=3D 0
                   if (inofreeback >=3D 0) {
                       ^~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1096:3: note: Taking true branch
                   if (inofreeback >=3D 0) {
                   ^
   fs/jfs/jfs_imap.c:1097:8: note: Assuming 'inofreeback' is not equal to '=
fwd'
                           if (inofreeback =3D=3D fwd)
                               ^~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1097:4: note: Taking false branch
                           if (inofreeback =3D=3D fwd)
                           ^
   fs/jfs/jfs_imap.c:1099:13: note: Assuming 'inofreeback' is equal to 'bac=
k'
                           else if (inofreeback =3D=3D back)
                                    ^~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1099:9: note: Taking true branch
                           else if (inofreeback =3D=3D back)
                                ^
   fs/jfs/jfs_imap.c:1100:28: note: Access to field 'data' results in a der=
eference of a null pointer (loaded from variable 'bmp')
                                   diagp =3D (struct iag *) bmp->data;
                                                          ^~~
   fs/jfs/jfs_imap.c:1258:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D txCommit(tid, 1, &iplist[0], COMMIT_FORCE);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:1258:2: note: Value stored to 'rc' is never read
           rc =3D txCommit(tid, 1, &iplist[0], COMMIT_FORCE);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:2460:3: warning: Value stored to 'blkno' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   blkno =3D IAGTOLBLK(iagno, sbi->l2nbperpage);
                   ^
   fs/jfs/jfs_imap.c:2460:3: note: Value stored to 'blkno' is never read
   fs/jfs/jfs_imap.c:2582:3: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   rc =3D txCommit(tid, 1, &iplist[0], COMMIT_FORCE);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_imap.c:2582:3: note: Value stored to 'rc' is never read
                   rc =3D txCommit(tid, 1, &iplist[0], COMMIT_FORCE);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
>> arch/arm/include/asm/atomic.h:224:17: warning: Use of memory after it is=
 freed [clang-analyzer-unix.Malloc]
   ATOMIC_OPS(sub, -=3D, sub)
                   ^
   kernel/ucount.c:317:2: note: Loop condition is true.  Entering loop body
           for (iter =3D ucounts; iter; iter =3D iter->ns->ucounts) {
           ^
   kernel/ucount.c:318:14: note: Left side of '||' is false
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/ucount.c:318:14: note: Left side of '||' is false
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/ucount.c:318:14: note: Left side of '||' is true
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/ucount.c:318:14: note: Taking false branch
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   kernel/ucount.c:318:14: note: Loop condition is false.  Exiting loop
                   long max =3D READ_ONCE(iter->ns->ucount_max[type]);
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   kernel/ucount.c:320:7: note: Assuming 'new' is >=3D 0
                   if (new < 0 || new > max)
                       ^~~~~~~
   kernel/ucount.c:320:7: note: Left side of '||' is false
   kernel/ucount.c:320:18: note: Assuming 'new' is <=3D 'max'
                   if (new < 0 || new > max)
                                  ^~~~~~~~~
   kernel/ucount.c:320:3: note: Taking false branch
                   if (new < 0 || new > max)
                   ^
   kernel/ucount.c:322:7: note: 'iter' is equal to 'ucounts'
                   if (iter =3D=3D ucounts)
                       ^~~~
   kernel/ucount.c:322:3: note: Taking true branch
                   if (iter =3D=3D ucounts)
                   ^
   kernel/ucount.c:328:7: note: Assuming 'new' is equal to 1
                   if (new !=3D 1)
                       ^~~~~~~~
   kernel/ucount.c:328:3: note: Taking false branch
                   if (new !=3D 1)
                   ^
   kernel/ucount.c:330:8: note: Calling 'get_ucounts'

vim +224 arch/arm/include/asm/atomic.h

db38ee874c4871 Will Deacon    2014-02-21  217  =

aee9a55452f037 Peter Zijlstra 2014-03-23  218  #define ATOMIC_OPS(op, c_op,=
 asm_op)					\
aee9a55452f037 Peter Zijlstra 2014-03-23  219  	ATOMIC_OP(op, c_op, asm_op)=
					\
6da068c1beba68 Peter Zijlstra 2016-04-18  220  	ATOMIC_OP_RETURN(op, c_op, =
asm_op)				\
6da068c1beba68 Peter Zijlstra 2016-04-18  221  	ATOMIC_FETCH_OP(op, c_op, a=
sm_op)
aee9a55452f037 Peter Zijlstra 2014-03-23  222  =

aee9a55452f037 Peter Zijlstra 2014-03-23  223  ATOMIC_OPS(add, +=3D, add)
aee9a55452f037 Peter Zijlstra 2014-03-23 @224  ATOMIC_OPS(sub, -=3D, sub)
aee9a55452f037 Peter Zijlstra 2014-03-23  225  =


:::::: The code at line 224 was first introduced by commit
:::::: aee9a55452f0371258e18b41649ce650ff344090 locking,arch,arm: Fold atom=
ic_ops

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7883376802508048060==--

