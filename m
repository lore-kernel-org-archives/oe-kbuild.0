Content-Type: multipart/mixed; boundary="===============7165517001296200603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [oracle-dtrace:v2/5.17-rc2 8/10] fs/eventpoll.c:1224:3: warning: Value stored to 'key' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Feb 2022 21:16:03 +0800
Message-ID: <202202102101.ROZp3MW9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7165517001296200603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nick Alcock <nick.alcock@oracle.com>
CC: Kris Van Hees <kris.van.hees@oracle.com>
CC: Tomas Jedlicka <tomas.jedlicka@oracle.com>
CC: Eugene Loh <eugene.loh@oracle.com>
CC: David Mc Lean <david.mclean@oracle.com>
CC: Vincent Lim <vincent.lim@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/5.17-rc2
head:   a5b4aef71c1689eb071137a0d9bad70c4a0a3472
commit: c6e92f354335ab7bbcec46ccbc9fc81ae123900a [8/10] waitfd: new syscall=
 implementing waitpid() over fds
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20210/202202102101.ROZp3MW9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/oracle/dtrace-linux-kernel/commit/c6e92f354335=
ab7bbcec46ccbc9fc81ae123900a
        git remote add oracle-dtrace https://github.com/oracle/dtrace-linux=
-kernel
        git fetch --no-tags oracle-dtrace v2/5.17-rc2
        git checkout c6e92f354335ab7bbcec46ccbc9fc81ae123900a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~
   fs/gfs2/dir.c:2170:2: note: Taking false branch
           if (!dent) {
           ^
   fs/gfs2/dir.c:2177:6: note: Calling 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
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
   fs/gfs2/dir.c:2177:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2177:2: note: Taking false branch
           if (IS_ERR(dent))
           ^
   fs/gfs2/dir.c:2180:6: note: Assuming field 'save_loc' is not equal to 0
           if (da->save_loc) {
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2180:2: note: Taking true branch
           if (da->save_loc) {
           ^
   fs/gfs2/dir.c:2181:10: note: Assigned value is garbage or undefined
                   da->bh =3D bh;
                          ^ ~~
   fs/gfs2/dir.c:2184:3: warning: 1st function call argument is an uninitia=
lized value [clang-analyzer-core.CallAndMessage]
                   brelse(bh);
                   ^      ~~
   fs/gfs2/dir.c:2163:2: note: 'bh' declared without an initial value
           struct buffer_head *bh;
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/dir.c:2169:9: note: Calling 'gfs2_dirent_search'
           dent =3D gfs2_dirent_search(inode, name, gfs2_dirent_find_space,=
 &bh);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/gfs2/dir.c:815:6: note: Assuming the condition is false
           if (ip->i_diskflags & GFS2_DIF_EXHASH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/dir.c:815:2: note: Taking false branch
           if (ip->i_diskflags & GFS2_DIF_EXHASH) {
           ^
   fs/gfs2/dir.c:848:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   fs/gfs2/dir.c:848:2: note: Taking true branch
           if (error)
           ^
   fs/gfs2/dir.c:849:3: note: Returning without writing to '*pbh'
                   return ERR_PTR(error);
                   ^
   fs/gfs2/dir.c:2169:9: note: Returning from 'gfs2_dirent_search'
           dent =3D gfs2_dirent_search(inode, name, gfs2_dirent_find_space,=
 &bh);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/gfs2/dir.c:2170:6: note: Assuming 'dent' is non-null
           if (!dent) {
               ^~~~~
   fs/gfs2/dir.c:2170:2: note: Taking false branch
           if (!dent) {
           ^
   fs/gfs2/dir.c:2177:6: note: Calling 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
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
   fs/gfs2/dir.c:2177:6: note: Returning from 'IS_ERR'
           if (IS_ERR(dent))
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2177:2: note: Taking false branch
           if (IS_ERR(dent))
           ^
   fs/gfs2/dir.c:2180:6: note: Assuming field 'save_loc' is 0
           if (da->save_loc) {
               ^~~~~~~~~~~~
   fs/gfs2/dir.c:2180:2: note: Taking false branch
           if (da->save_loc) {
           ^
   fs/gfs2/dir.c:2184:3: note: 1st function call argument is an uninitializ=
ed value
                   brelse(bh);
                   ^      ~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> fs/eventpoll.c:1224:3: warning: Value stored to 'key' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   key =3D (void *)epi->fixed_event;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   fs/eventpoll.c:1224:3: note: Value stored to 'key' is never read
                   key =3D (void *)epi->fixed_event;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   fs/eventfd.c:285:8: warning: Value stored to 'res' is never read [clang-=
analyzer-deadcode.DeadStores]
                   for (res =3D 0;;) {
                        ^     ~
   fs/eventfd.c:285:8: note: Value stored to 'res' is never read
                   for (res =3D 0;;) {
                        ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/userfaultfd.c:986:14: warning: Access to field 'flags' results in a d=
ereference of a null pointer (loaded from variable 'new') [clang-analyzer-c=
ore.NullDereference]
                           O_RDWR | (new->flags & UFFD_SHARED_FCNTL_FLAGS),=
 inode);
                                     ^
   fs/userfaultfd.c:1169:6: note: Assuming the condition is false
           if (!userfaultfd_is_initialized(ctx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1169:2: note: Taking false branch
           if (!userfaultfd_is_initialized(ctx))
           ^
   fs/userfaultfd.c:1172:2: note: Loop condition is true.  Entering loop bo=
dy
           for (;;) {
           ^
   fs/userfaultfd.c:1173:7: note: Assuming the condition is false
                   if (count < sizeof(msg))
                       ^~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1173:3: note: Taking false branch
                   if (count < sizeof(msg))
                   ^
   fs/userfaultfd.c:1175:10: note: Calling 'userfaultfd_ctx_read'
                   _ret =3D userfaultfd_ctx_read(ctx, no_wait, &msg, inode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1009:2: note: 'fork_nctx' initialized to a null pointer=
 value
           struct userfaultfd_ctx *fork_nctx =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/userfaultfd.c:1014:2: note: Loop condition is true.  Entering loop bo=
dy
           for (;;) {
           ^
   fs/userfaultfd.c:1015:3: note: Taking false branch
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:137:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   WARN_ON_ONCE(is_special_task_state(state_value));       \
                   ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/userfaultfd.c:1015:3: note: Loop condition is false.  Exiting loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:210:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:136:2: note: expanded from macro 'debug_normal_sta=
te_change'
           do {                                                            \
           ^
   fs/userfaultfd.c:1015:3: note: Loop condition is false.  Exiting loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:152:40: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, v=
alue); } while (0)
                                          ^
   include/linux/kcsan-checks.h:264:20: note: expanded from macro 'kcsan_mb'
   #define kcsan_mb()      do { } while (0)
                           ^
   fs/userfaultfd.c:1015:3: note: Loop condition is false.  Exiting loop
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:211:3: note: expanded from macro 'set_current_stat=
e'
                   smp_store_mb(current->__state, (state_value));          \
                   ^
   include/asm-generic/barrier.h:152:52: note: expanded from macro 'smp_sto=
re_mb'
   #define smp_store_mb(var, value)  do { kcsan_mb(); __smp_store_mb(var, v=
alue); } while (0)
                                                      ^
   arch/x86/include/asm/barrier.h:61:47: note: expanded from macro '__smp_s=
tore_mb'
   #define __smp_store_mb(var, value) do { (void)xchg(&var, value); } while=
 (0)
                                                 ^
   include/linux/atomic/atomic-instrumented.h:1884:2: note: expanded from m=
acro 'xchg'
           kcsan_mb(); \

vim +/key +1224 fs/eventpoll.c

a218cc4914209a Roman Penyaev      2019-03-07  1118  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1119  /*
7699acd1341c63 Davide Libenzi     2007-05-10  1120   * This is the callback=
 that is passed to the wait queue wakeup
bf6a41db7726e6 Daniel Baluta      2011-01-30  1121   * mechanism. It is cal=
led by the stored file descriptors when they
7699acd1341c63 Davide Libenzi     2007-05-10  1122   * have events to repor=
t.
a218cc4914209a Roman Penyaev      2019-03-07  1123   *
a6c67fee9cf095 Randy Dunlap       2021-03-01  1124   * This callback takes =
a read lock in order not to contend with concurrent
a6c67fee9cf095 Randy Dunlap       2021-03-01  1125   * events from another =
file descriptor, thus all modifications to ->rdllist
a218cc4914209a Roman Penyaev      2019-03-07  1126   * or ->ovflist are loc=
kless.  Read lock is paired with the write lock from
a218cc4914209a Roman Penyaev      2019-03-07  1127   * ep_scan_ready_list()=
, which stops all list modifications and guarantees
a218cc4914209a Roman Penyaev      2019-03-07  1128   * that lists state is =
seen correctly.
a218cc4914209a Roman Penyaev      2019-03-07  1129   *
a218cc4914209a Roman Penyaev      2019-03-07  1130   * Another thing worth =
to mention is that ep_poll_callback() can be called
a218cc4914209a Roman Penyaev      2019-03-07  1131   * concurrently for the=
 same @epi from different CPUs if poll table was inited
a218cc4914209a Roman Penyaev      2019-03-07  1132   * with several wait qu=
eues entries.  Plural wakeup from different CPUs of a
a218cc4914209a Roman Penyaev      2019-03-07  1133   * single wait queue is=
 serialized by wq.lock, but the case when multiple wait
a218cc4914209a Roman Penyaev      2019-03-07  1134   * queues are used shou=
ld be detected accordingly.  This is detected using
a218cc4914209a Roman Penyaev      2019-03-07  1135   * cmpxchg() operation.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1136   */
ac6424b981bce1 Ingo Molnar        2017-06-20  1137  static int ep_poll_call=
back(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1138  {
7699acd1341c63 Davide Libenzi     2007-05-10  1139  	int pwake =3D 0;
7699acd1341c63 Davide Libenzi     2007-05-10  1140  	struct epitem *epi =3D=
 ep_item_from_wait(wait);
7699acd1341c63 Davide Libenzi     2007-05-10  1141  	struct eventpoll *ep =
=3D epi->ep;
3ad6f93e98d6df Al Viro            2017-07-03  1142  	__poll_t pollflags =3D=
 key_to_poll(key);
a218cc4914209a Roman Penyaev      2019-03-07  1143  	unsigned long flags;
df0108c5da561c Jason Baron        2016-01-20  1144  	int ewake =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1145  =

a218cc4914209a Roman Penyaev      2019-03-07  1146  	read_lock_irqsave(&ep-=
>lock, flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1147  =

bf3b9f6372c45b Sridhar Samudrala  2017-03-24  1148  	ep_set_busy_poll_napi_=
id(epi);
bf3b9f6372c45b Sridhar Samudrala  2017-03-24  1149  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1150  	/*
7699acd1341c63 Davide Libenzi     2007-05-10  1151  	 * If the event mask d=
oes not contain any poll(2) event, we consider the
7699acd1341c63 Davide Libenzi     2007-05-10  1152  	 * descriptor to be di=
sabled. This condition is likely the effect of the
7699acd1341c63 Davide Libenzi     2007-05-10  1153  	 * EPOLLONESHOT bit th=
at disables the descriptor when an event is received,
7699acd1341c63 Davide Libenzi     2007-05-10  1154  	 * until the next EPOL=
L_CTL_MOD will be issued.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1155  	 */
7699acd1341c63 Davide Libenzi     2007-05-10  1156  	if (!(epi->event.event=
s & ~EP_PRIVATE_BITS))
d47de16c722196 Davide Libenzi     2007-05-15  1157  		goto out_unlock;
d47de16c722196 Davide Libenzi     2007-05-15  1158  =

2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1159  	/*
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1160  	 * Check the events co=
ming with the callback. At this stage, not
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1161  	 * every device report=
s the events in the "key" parameter of the
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1162  	 * callback. We need t=
o be able to handle both cases here, hence the
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1163  	 * test for "key" !=3D=
 NULL before the event match test.
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1164  	 */
3ad6f93e98d6df Al Viro            2017-07-03  1165  	if (pollflags && !(pol=
lflags & epi->event.events))
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1166  		goto out_unlock;
2dfa4eeab0fc7e Davide Libenzi     2009-03-31  1167  =

d47de16c722196 Davide Libenzi     2007-05-15  1168  	/*
bf6a41db7726e6 Daniel Baluta      2011-01-30  1169  	 * If we are transferr=
ing events to userspace, we can hold no locks
d47de16c722196 Davide Libenzi     2007-05-15  1170  	 * (because we're acce=
ssing user memory, and because of linux f_op->poll()
bf6a41db7726e6 Daniel Baluta      2011-01-30  1171  	 * semantics). All the=
 events that happen during that period of time are
d47de16c722196 Davide Libenzi     2007-05-15  1172  	 * chained in ep->ovfl=
ist and requeued later on.
d47de16c722196 Davide Libenzi     2007-05-15  1173  	 */
c5a282e9635e9c Davidlohr Bueso    2019-01-03  1174  	if (READ_ONCE(ep->ovfl=
ist) !=3D EP_UNACTIVE_PTR) {
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1175  		if (chain_epi_lockles=
s(epi))
c3e320b61581ef Roman Penyaev      2019-03-07  1176  			ep_pm_stay_awake_rcu=
(epi);
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1177  	} else if (!ep_is_link=
ed(epi)) {
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1178  		/* In the usual case,=
 add event to ready list. */
0c54a6a44bf3d4 Khazhismel Kumykov 2020-05-07  1179  		if (list_add_tail_loc=
kless(&epi->rdllink, &ep->rdllist))
eea1d585917c53 Eric Wong          2013-04-30  1180  			ep_pm_stay_awake_rcu=
(epi);
4d7e30d98939a0 Arve Hj=C3=B8nnev=C3=A5g     2012-05-01  1181  	}
7699acd1341c63 Davide Libenzi     2007-05-10  1182  =

7699acd1341c63 Davide Libenzi     2007-05-10  1183  	/*
7699acd1341c63 Davide Libenzi     2007-05-10  1184  	 * Wake up ( if active=
 ) both the eventpoll wait list and the ->poll()
7699acd1341c63 Davide Libenzi     2007-05-10  1185  	 * wait list.
7699acd1341c63 Davide Libenzi     2007-05-10  1186  	 */
df0108c5da561c Jason Baron        2016-01-20  1187  	if (waitqueue_active(&=
ep->wq)) {
b6a515c8a0f6c2 Jason Baron        2016-02-05  1188  		if ((epi->event.event=
s & EPOLLEXCLUSIVE) &&
3ad6f93e98d6df Al Viro            2017-07-03  1189  					!(pollflags & POLL=
FREE)) {
3ad6f93e98d6df Al Viro            2017-07-03  1190  			switch (pollflags & =
EPOLLINOUT_BITS) {
a9a08845e9acbd Linus Torvalds     2018-02-11  1191  			case EPOLLIN:
a9a08845e9acbd Linus Torvalds     2018-02-11  1192  				if (epi->event.even=
ts & EPOLLIN)
b6a515c8a0f6c2 Jason Baron        2016-02-05  1193  					ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1194  				break;
a9a08845e9acbd Linus Torvalds     2018-02-11  1195  			case EPOLLOUT:
a9a08845e9acbd Linus Torvalds     2018-02-11  1196  				if (epi->event.even=
ts & EPOLLOUT)
b6a515c8a0f6c2 Jason Baron        2016-02-05  1197  					ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1198  				break;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1199  			case 0:
df0108c5da561c Jason Baron        2016-01-20  1200  				ewake =3D 1;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1201  				break;
b6a515c8a0f6c2 Jason Baron        2016-02-05  1202  			}
b6a515c8a0f6c2 Jason Baron        2016-02-05  1203  		}
a218cc4914209a Roman Penyaev      2019-03-07  1204  		wake_up(&ep->wq);
df0108c5da561c Jason Baron        2016-01-20  1205  	}
7699acd1341c63 Davide Libenzi     2007-05-10  1206  	if (waitqueue_active(&=
ep->poll_wait))
7699acd1341c63 Davide Libenzi     2007-05-10  1207  		pwake++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1208  =

d47de16c722196 Davide Libenzi     2007-05-15  1209  out_unlock:
a218cc4914209a Roman Penyaev      2019-03-07  1210  	read_unlock_irqrestore=
(&ep->lock, flags);
7699acd1341c63 Davide Libenzi     2007-05-10  1211  =

7699acd1341c63 Davide Libenzi     2007-05-10  1212  	/* We have to call thi=
s outside the lock */
7699acd1341c63 Davide Libenzi     2007-05-10  1213  	if (pwake)
efcdd350d1f8a9 Jason Baron        2020-04-06  1214  		ep_poll_safewake(ep, =
epi);
7699acd1341c63 Davide Libenzi     2007-05-10  1215  =

138e4ad67afd5c Oleg Nesterov      2017-09-01  1216  	if (!(epi->event.event=
s & EPOLLEXCLUSIVE))
138e4ad67afd5c Oleg Nesterov      2017-09-01  1217  		ewake =3D 1;
138e4ad67afd5c Oleg Nesterov      2017-09-01  1218  =

c6e92f354335ab Nick Alcock        2018-11-14  1219  	/*
c6e92f354335ab Nick Alcock        2018-11-14  1220  	 * If this fd type has=
 a hardwired event which should override the key
c6e92f354335ab Nick Alcock        2018-11-14  1221  	 * (e.g. if it is wait=
ing on a non-file waitqueue), jam it in here.
c6e92f354335ab Nick Alcock        2018-11-14  1222  	 */
c6e92f354335ab Nick Alcock        2018-11-14  1223  	if (epi->fixed_event)
c6e92f354335ab Nick Alcock        2018-11-14 @1224  		key =3D (void *)epi->=
fixed_event;
c6e92f354335ab Nick Alcock        2018-11-14  1225  =

3ad6f93e98d6df Al Viro            2017-07-03  1226  	if (pollflags & POLLFR=
EE) {
138e4ad67afd5c Oleg Nesterov      2017-09-01  1227  		/*
138e4ad67afd5c Oleg Nesterov      2017-09-01  1228  		 * If we race with ep=
_remove_wait_queue() it can miss
138e4ad67afd5c Oleg Nesterov      2017-09-01  1229  		 * ->whead =3D NULL a=
nd do another remove_wait_queue() after
138e4ad67afd5c Oleg Nesterov      2017-09-01  1230  		 * us, so we can't us=
e __remove_wait_queue().
138e4ad67afd5c Oleg Nesterov      2017-09-01  1231  		 */
138e4ad67afd5c Oleg Nesterov      2017-09-01  1232  		list_del_init(&wait->=
entry);
138e4ad67afd5c Oleg Nesterov      2017-09-01  1233  		/*
138e4ad67afd5c Oleg Nesterov      2017-09-01  1234  		 * ->whead !=3D NULL =
protects us from the race with ep_free()
138e4ad67afd5c Oleg Nesterov      2017-09-01  1235  		 * or ep_remove(), ep=
_remove_wait_queue() takes whead->lock
138e4ad67afd5c Oleg Nesterov      2017-09-01  1236  		 * held by the caller=
. Once we nullify it, nothing protects
138e4ad67afd5c Oleg Nesterov      2017-09-01  1237  		 * ep/epi or even wai=
t.
138e4ad67afd5c Oleg Nesterov      2017-09-01  1238  		 */
138e4ad67afd5c Oleg Nesterov      2017-09-01  1239  		smp_store_release(&ep=
_pwq_from_wait(wait)->whead, NULL);
138e4ad67afd5c Oleg Nesterov      2017-09-01  1240  	}
df0108c5da561c Jason Baron        2016-01-20  1241  =

138e4ad67afd5c Oleg Nesterov      2017-09-01  1242  	return ewake;
7699acd1341c63 Davide Libenzi     2007-05-10  1243  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1244  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7165517001296200603==--

