Content-Type: multipart/mixed; boundary="===============1541142531643049977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/include/asm/atomic.h:29:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 27 Jan 2022 03:53:15 +0800
Message-ID: <202201270357.mq4gkY77-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1541142531643049977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 78525c74d9e7d1a6ce69bd4388f045f6e474a20b netfs, 9p, afs, ceph: Use =
folios
date:   3 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220127/202201270357.mq4gkY77-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D78525c74d9e7d1a6ce69bd4388f045f6e474a20b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 78525c74d9e7d1a6ce69bd4388f045f6e474a20b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   kernel/time/posix-cpu-timers.c:979:7: note: Left side of '||' is true
           if (!READ_ONCE(pct->timers_active) || pct->expiry_active)
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/time/posix-cpu-timers.c:979:7: note: Taking false branch
           if (!READ_ONCE(pct->timers_active) || pct->expiry_active)
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   kernel/time/posix-cpu-timers.c:979:7: note: Loop condition is false.  Ex=
iting loop
           if (!READ_ONCE(pct->timers_active) || pct->expiry_active)
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   kernel/time/posix-cpu-timers.c:979:6: note: Assuming the condition is tr=
ue
           if (!READ_ONCE(pct->timers_active) || pct->expiry_active)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/posix-cpu-timers.c:979:37: note: Left side of '||' is true
           if (!READ_ONCE(pct->timers_active) || pct->expiry_active)
                                              ^
   kernel/time/posix-cpu-timers.c:1274:3: note: Returning from 'check_proce=
ss_timers'
                   check_process_timers(tsk, &firing);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/posix-cpu-timers.c:1258:2: note: Loop condition is false.  E=
xiting loop
           do {
           ^
   kernel/time/posix-cpu-timers.c:1324:2: note: Assigned value is garbage o=
r undefined
           list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   2 warnings generated.
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> arch/x86/include/asm/atomic.h:29:9: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           return __READ_ONCE((v)->counter);
                  ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   fs/netfs/read_helper.c:1097:6: note: Assuming the condition is false
           if (aop_flags & AOP_FLAG_NOFS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:1097:2: note: Taking false branch
           if (aop_flags & AOP_FLAG_NOFS)
           ^
   fs/netfs/read_helper.c:1101:6: note: Assuming 'folio' is non-null
           if (!folio)
               ^~~~~~
   fs/netfs/read_helper.c:1101:2: note: Taking false branch
           if (!folio)
           ^
   fs/netfs/read_helper.c:1104:6: note: Assuming field 'check_write_begin' =
is non-null
           if (ops->check_write_begin) {
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:1104:2: note: Taking true branch
           if (ops->check_write_begin) {
           ^
   fs/netfs/read_helper.c:1107:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   fs/netfs/read_helper.c:1107:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   fs/netfs/read_helper.c:1115:2: note: Taking false branch
           if (folio_test_uptodate(folio))
           ^
   fs/netfs/read_helper.c:1122:6: note: Assuming the condition is true
           if (!ops->is_cache_enabled(inode) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:1122:6: note: Left side of '&&' is true
   fs/netfs/read_helper.c:1122:2: note: Taking false branch
           if (!ops->is_cache_enabled(inode) &&
           ^
   fs/netfs/read_helper.c:1129:9: note: Calling 'netfs_alloc_read_request'
           rreq =3D netfs_alloc_read_request(ops, netfs_priv, file);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:48:6: note: Assuming 'rreq' is non-null
           if (rreq) {
               ^~~~
   fs/netfs/read_helper.c:48:2: note: Taking true branch
           if (rreq) {
           ^
   fs/netfs/read_helper.c:55:3: note: Loop condition is false.  Exiting loop
                   INIT_WORK(&rreq->work, netfs_rreq_work);
                   ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   fs/netfs/read_helper.c:1129:9: note: Returning from 'netfs_alloc_read_re=
quest'
           rreq =3D netfs_alloc_read_request(ops, netfs_priv, file);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:1130:7: note: 'rreq' is non-null
           if (!rreq)
                ^~~~
   fs/netfs/read_helper.c:1130:2: note: Taking false branch
           if (!rreq)
           ^
   fs/netfs/read_helper.c:1139:6: note: Assuming field 'begin_cache_operati=
on' is null
           if (ops->begin_cache_operation) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:1139:2: note: Taking false branch
           if (ops->begin_cache_operation) {
           ^
   fs/netfs/read_helper.c:1157:2: note: Loop condition is true.  Entering l=
oop body
           while (readahead_folio(&ractl))
           ^
   fs/netfs/read_helper.c:1157:2: note: Loop condition is false. Execution =
continues on line 1160
   fs/netfs/read_helper.c:1162:3: note: Taking true branch
                   if (!netfs_rreq_submit_slice(rreq, &debug_index))
                   ^
   fs/netfs/read_helper.c:1163:4: note:  Execution continues on line 1171
                           break;
                           ^
   fs/netfs/read_helper.c:1171:2: note: Loop condition is true.  Entering l=
oop body
           for (;;) {
           ^
   fs/netfs/read_helper.c:1172:3: note: Loop condition is false.  Exiting l=
oop
                   wait_var_event(&rreq->nr_rd_ops, atomic_read(&rreq->nr_r=
d_ops) =3D=3D 1);
                   ^
   include/linux/wait_bit.h:275:2: note: expanded from macro 'wait_var_even=
t'
           might_sleep();                                                  \
           ^
   include/linux/kernel.h:129:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   fs/netfs/read_helper.c:1172:3: note: Taking true branch
                   wait_var_event(&rreq->nr_rd_ops, atomic_read(&rreq->nr_r=
d_ops) =3D=3D 1);
                   ^
   include/linux/wait_bit.h:276:2: note: expanded from macro 'wait_var_even=
t'
           if (condition)                                                  \
           ^

vim +29 arch/x86/include/asm/atomic.h

5abbbbf0b0cd4ab Brian Gerst    2010-01-07  11  =

5abbbbf0b0cd4ab Brian Gerst    2010-01-07  12  /*
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  13   * Atomic operations that C =
can't guarantee us.  Useful for
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  14   * resource counting etc..
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  15   */
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  16  =

5abbbbf0b0cd4ab Brian Gerst    2010-01-07  17  /**
8bf705d130396e6 Dmitry Vyukov  2018-01-29  18   * arch_atomic_read - read a=
tomic variable
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  19   * @v: pointer of type atomi=
c_t
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  20   *
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  21   * Atomically reads the valu=
e of @v.
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  22   */
8bf705d130396e6 Dmitry Vyukov  2018-01-29  23  static __always_inline int a=
rch_atomic_read(const atomic_t *v)
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  24  {
ac605bee0bfab40 Dmitry Vyukov  2018-01-29  25  	/*
ac605bee0bfab40 Dmitry Vyukov  2018-01-29  26  	 * Note for KASAN: we delib=
erately don't use READ_ONCE_NOCHECK() here,
ac605bee0bfab40 Dmitry Vyukov  2018-01-29  27  	 * it's non-inlined functio=
n that increases binary size and stack usage.
ac605bee0bfab40 Dmitry Vyukov  2018-01-29  28  	 */
37f8173dd84936e Peter Zijlstra 2020-01-24 @29  	return __READ_ONCE((v)->cou=
nter);
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  30  }
5abbbbf0b0cd4ab Brian Gerst    2010-01-07  31  =


:::::: The code at line 29 was first introduced by commit
:::::: 37f8173dd84936ea78000ed1cad24f8b18d48ebb locking/atomics: Flip fallb=
acks and instrumentation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1541142531643049977==--

