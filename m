Content-Type: multipart/mixed; boundary="===============2054660165721444817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 22 May 2022 23:22:44 +0800
Message-ID: <202205222334.TUx9D4Qj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2054660165721444817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220518 (https://download.01.org/0day-ci/archi=
ve/20220522/202205222334.TUx9D4Qj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/virtio/virtio_balloon.c:288:25: note: Assuming 'num' is <=3D fie=
ld 'num_pfns'
           for (vb->num_pfns =3D 0; vb->num_pfns < num;
                                  ^~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_balloon.c:288:2: note: Loop condition is false. Ex=
ecution continues on line 298
           for (vb->num_pfns =3D 0; vb->num_pfns < num;
           ^
   drivers/virtio/virtio_balloon.c:304:10: note: Field 'num_pfns' is equal =
to 0
           if (vb->num_pfns !=3D 0)
                   ^
   drivers/virtio/virtio_balloon.c:304:2: note: Taking false branch
           if (vb->num_pfns !=3D 0)
           ^
   drivers/virtio/virtio_balloon.c:306:2: note: Calling 'release_pages_ball=
oon'
           release_pages_balloon(vb, &pages);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_balloon.c:266:2: note: Assigned value is garbage o=
r undefined
           list_for_each_entry_safe(page, next, pages, lru) {
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
   drivers/md/dm-kcopyd.c:246:10: warning: Access to field 'next' results i=
n a dereference of a null pointer (loaded from variable 'pl') [clang-analyz=
er-core.NullDereference]
                   next =3D pl->next;
                          ^
   drivers/md/dm-kcopyd.c:913:6: note: Assuming 'kc' is non-null
           if (!kc)
               ^~~
   drivers/md/dm-kcopyd.c:913:2: note: Taking false branch
           if (!kc)
           ^
   drivers/md/dm-kcopyd.c:916:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_init(&kc->job_lock);
           ^
   include/linux/spinlock.h:352:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/md/dm-kcopyd.c:924:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/md/dm-kcopyd.c:924:2: note: Taking false branch
           if (r)
           ^
   drivers/md/dm-kcopyd.c:927:2: note: Loop condition is false.  Exiting lo=
op
           INIT_WORK(&kc->kcopyd_work, do_work);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/md/dm-kcopyd.c:929:6: note: Assuming field 'kcopyd_wq' is non-nu=
ll
           if (!kc->kcopyd_wq) {
               ^~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:929:2: note: Taking false branch
           if (!kc->kcopyd_wq) {
           ^
   drivers/md/dm-kcopyd.c:939:6: note: Calling 'client_reserve_pages'
           r =3D client_reserve_pages(kc, reserve_pages);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:309:20: note: 'pl' initialized to a null pointer =
value
           struct page_list *pl =3D NULL, *next;
                             ^~
   drivers/md/dm-kcopyd.c:311:14: note: Assuming 'i' is >=3D 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:311:2: note: Loop condition is false. Execution c=
ontinues on line 322
           for (i =3D 0; i < nr_pages; i++) {
           ^
   drivers/md/dm-kcopyd.c:323:23: note: Passing null pointer value via 2nd =
parameter 'pl'
           kcopyd_put_pages(kc, pl);
                                ^~
   drivers/md/dm-kcopyd.c:323:2: note: Calling 'kcopyd_put_pages'
           kcopyd_put_pages(kc, pl);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:246:10: note: Access to field 'next' results in a=
 dereference of a null pointer (loaded from variable 'pl')
                   next =3D pl->next;
                          ^~
>> drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
                   kcopyd_put_pages(kc, job->pages);
                   ^
   drivers/md/dm-kcopyd.c:662:2: note: Calling 'process_jobs'
           process_jobs(&kc->complete_jobs, kc, run_complete_job);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Assuming field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
               ^~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Calling 'kcopyd_put_pages'
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:7: note: Assuming field 'nr_free_pages' is >=
=3D field 'nr_reserved_pages'
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:248:3: note: Taking true branch
                   if (kc->nr_free_pages >=3D kc->nr_reserved_pages)
                   ^
   drivers/md/dm-kcopyd.c:249:4: note: Calling 'free_pl'
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:234:2: note: Memory is released
           kfree(pl);
           ^~~~~~~~~
   drivers/md/dm-kcopyd.c:249:4: note: Returning; memory was released via 1=
st parameter
                           free_pl(pl);
                           ^~~~~~~~~~~
   drivers/md/dm-kcopyd.c:245:2: note: Loop condition is false.  Exiting lo=
op
           do {
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Returning; memory was released via 2=
nd parameter
                   kcopyd_put_pages(kc, job->pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:6: note: Assuming 'job' is not equal to field=
 'master_job'
           if (job->master_job =3D=3D job) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:499:2: note: Taking false branch
           if (job->master_job =3D=3D job) {
           ^
   drivers/md/dm-kcopyd.c:505:2: note: Taking false branch
           if (atomic_dec_and_test(&kc->nr_jobs))
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Returning; memory was released
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:615:7: note: 'r' is >=3D 0
                   if (r < 0) {
                       ^
   drivers/md/dm-kcopyd.c:615:3: note: Taking false branch
                   if (r < 0) {
                   ^
   drivers/md/dm-kcopyd.c:626:7: note: 'r' is <=3D 0
                   if (r > 0) {
                       ^
   drivers/md/dm-kcopyd.c:626:3: note: Taking false branch
                   if (r > 0) {
                   ^
   drivers/md/dm-kcopyd.c:611:2: note: Loop condition is true.  Entering lo=
op body
           while ((job =3D pop(jobs, kc))) {
           ^
   drivers/md/dm-kcopyd.c:613:7: note: Calling 'run_complete_job'
                   r =3D fn(job);
                       ^~~~~~~
   drivers/md/dm-kcopyd.c:493:11: note: Field 'pages' is non-null
           if (job->pages && job->pages !=3D &zero_page_list)
                    ^
   drivers/md/dm-kcopyd.c:493:6: note: Left side of '&&' is true
           if (job->pages && job->pages !=3D &zero_page_list)
               ^
   drivers/md/dm-kcopyd.c:493:20: note: Assuming the condition is true
           if (job->pages && job->pages !=3D &zero_page_list)
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-kcopyd.c:493:2: note: Taking true branch
           if (job->pages && job->pages !=3D &zero_page_list)
           ^
   drivers/md/dm-kcopyd.c:494:3: note: Use of memory after it is freed
                   kcopyd_put_pages(kc, job->pages);
                   ^                    ~~~~~~~~~~
   11 warnings generated.
   kernel/sched/core.c:5463:16: warning: Value stored to 'preempt_disable_i=
p' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:5463:16: note: Value stored to 'preempt_disable_ip' =
during its initialization is never read
           unsigned long preempt_disable_ip =3D get_preempt_disable_ip(curr=
ent);
                         ^~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sched/core.c:6287:3: warning: Value stored to 'rq' is never read =
[clang-analyzer-deadcode.DeadStores]
                   rq =3D context_switch(rq, prev, next, &rf);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2671:2: warning: Argument to kfree() is the address of the =
local variable 'iovstack', which is not memory allocated by malloc() [clang=
-analyzer-unix.Malloc]
           kfree(iov);
           ^
   net/socket.c:2859:1: note: Calling '__do_sys_recvmmsg'
   SYSCALL_DEFINE5(recvmmsg, int, fd, struct mmsghdr __user *, mmsg,
   ^
   include/linux/syscalls.h:220:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
   #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/socket.c:2863:2: note: Taking false branch
           if (flags & MSG_CMSG_COMPAT)
           ^
   net/socket.c:2866:9: note: Calling '__sys_recvmmsg'
           return __sys_recvmmsg(fd, mmsg, vlen, flags, timeout, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2836:6: note: Assuming 'timeout' is null
           if (timeout && get_timespec64(&timeout_sys, timeout))
               ^~~~~~~
   net/socket.c:2836:14: note: Left side of '&&' is false
           if (timeout && get_timespec64(&timeout_sys, timeout))
                       ^
   net/socket.c:2839:6: note: 'timeout32' is null
           if (timeout32 && get_old_timespec32(&timeout_sys, timeout32))
               ^~~~~~~~~
   net/socket.c:2839:16: note: Left side of '&&' is false
           if (timeout32 && get_old_timespec32(&timeout_sys, timeout32))
                         ^
   net/socket.c:2842:7: note: 'timeout' is null
           if (!timeout && !timeout32)
                ^~~~~~~
   net/socket.c:2842:6: note: Left side of '&&' is true
           if (!timeout && !timeout32)
               ^
   net/socket.c:2842:19: note: 'timeout32' is null
           if (!timeout && !timeout32)
                            ^~~~~~~~~
   net/socket.c:2842:2: note: Taking true branch
           if (!timeout && !timeout32)
           ^
   net/socket.c:2843:10: note: Calling 'do_recvmmsg'
                   return do_recvmmsg(fd, mmsg, vlen, flags, NULL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2729:6: note: 'timeout' is null
           if (timeout &&
               ^~~~~~~
   net/socket.c:2729:14: note: Left side of '&&' is false
           if (timeout &&
                       ^
   net/socket.c:2737:7: note: 'sock' is non-null
           if (!sock)
                ^~~~
   net/socket.c:2737:2: note: Taking false branch
           if (!sock)
           ^
   net/socket.c:2740:13: note: Assuming the condition is false
           if (likely(!(flags & MSG_ERRQUEUE))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   net/socket.c:2740:2: note: Taking false branch
           if (likely(!(flags & MSG_ERRQUEUE))) {
           ^
   net/socket.c:2751:9: note: Assuming 'datagrams' is < 'vlen'
           while (datagrams < vlen) {
                  ^~~~~~~~~~~~~~~~
   net/socket.c:2751:2: note: Loop condition is true.  Entering loop body
           while (datagrams < vlen) {
           ^
   net/socket.c:2755:3: note: Taking false branch
                   if (MSG_CMSG_COMPAT & flags) {
                   ^
   net/socket.c:2764:10: note: Calling '___sys_recvmsg'
                           err =3D ___sys_recvmsg(sock,
                                 ^~~~~~~~~~~~~~~~~~~~
   net/socket.c:2667:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/socket.c:2667:2: note: Taking false branch
           if (err < 0)
           ^
   net/socket.c:2671:2: note: Argument to kfree() is the address of the loc=
al variable 'iovstack', which is not memory allocated by malloc()
           kfree(iov);
           ^     ~~~
   net/socket.c:2749:2: warning: Value stored to 'compat_entry' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           compat_entry =3D (struct compat_mmsghdr __user *)mmsg;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:2749:2: note: Value stored to 'compat_entry' is never read
           compat_entry =3D (struct compat_mmsghdr __user *)mmsg;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
>> drivers/md/dm-stats.c:174:2: warning: Attempt to free released memory [c=
lang-analyzer-unix.Malloc]
           kfree(s->histogram_boundaries);
           ^
   drivers/md/dm-stats.c:212:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:215:16: note: Assuming 'ni' is >=3D field 'n_entri=
es'
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                                ^~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:215:3: note: Loop condition is false. Execution co=
ntinues on line 228
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:228:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Memory is released
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:177:2: note: Loop condition is true.  Entering loo=
p body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:177:2: note: Loop condition is false. Execution co=
ntinues on line 181
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/md/dm-stats.c:228:3: note: Returning; memory was released
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:212:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stats->list)) {
           ^
   drivers/md/dm-stats.c:215:3: note: Loop condition is false. Execution co=
ntinues on line 228
                   for (ni =3D 0; ni < s->n_entries; ni++) {
                   ^
   drivers/md/dm-stats.c:228:3: note: Calling 'dm_stat_free'
                   dm_stat_free(&s->rcu_head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-stats.c:174:2: note: Attempt to free released memory
           kfree(s->histogram_boundaries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   crypto/poly1305_generic.c:49:4: warning: Value stored to 'src' is never =
read [clang-analyzer-deadcode.DeadStores]
                           src +=3D POLY1305_BLOCK_SIZE;
                           ^
   crypto/poly1305_generic.c:49:4: note: Value stored to 'src' is never read
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/tuners/tda18271-fe.c:473:2: warning: Value stored to 'bcal=
' is never read [clang-analyzer-deadcode.DeadStores]
           bcal =3D 0;
           ^      ~
   drivers/media/tuners/tda18271-fe.c:473:2: note: Value stored to 'bcal' i=
s never read
           bcal =3D 0;

vim +494 drivers/md/dm-kcopyd.c

b673c3a8192e28 drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  475  =

^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  476  /*
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  477   *=
 These three functions process 1 item from the corresponding
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  478   *=
 job list.
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  479   *
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  480   *=
 They return:
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  481   *=
 < 0: error
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  482   *=
   0: success
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  483   *=
 > 0: can't process yet.
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  484   */
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  485  st=
atic int run_complete_job(struct kcopyd_job *job)
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  486  {
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  487  	v=
oid *context =3D job->context;
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  488  	i=
nt read_err =3D job->read_err;
4cdc1d1fa5c5ac drivers/md/kcopyd.c    Alasdair G Kergon 2008-03-28  489  	u=
nsigned long write_err =3D job->write_err;
eb69aca5d3370b drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  490  	d=
m_kcopyd_notify_fn fn =3D job->fn;
eb69aca5d3370b drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  491  	s=
truct dm_kcopyd_client *kc =3D job->kc;
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  492  =

7f06965390e4a1 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-10-31  493  	i=
f (job->pages && job->pages !=3D &zero_page_list)
138728dc96529f drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27 @494  		=
kcopyd_put_pages(kc, job->pages);
c6ea41fbbe08f2 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  495  	/*
c6ea41fbbe08f2 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  496  	 =
* If this is the master job, the sub jobs have already
c6ea41fbbe08f2 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  497  	 =
* completed so we can free everything.
c6ea41fbbe08f2 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  498  	 =
*/
d5ffebdd797a7c drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  499  	i=
f (job->master_job =3D=3D job) {
d5ffebdd797a7c drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  500  		=
mutex_destroy(&job->lock);
6f1c819c219f78 drivers/md/dm-kcopyd.c Kent Overstreet   2018-05-20  501  		=
mempool_free(job, &kc->job_pool);
d5ffebdd797a7c drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  502  	}
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  503  	f=
n(read_err, write_err, context);
138728dc96529f drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  504  =

138728dc96529f drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  505  	i=
f (atomic_dec_and_test(&kc->nr_jobs))
138728dc96529f drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  506  		=
wake_up(&kc->destroyq);
138728dc96529f drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  507  =

784c9a29e99eb4 drivers/md/dm-kcopyd.c John Pittman      2018-08-06  508  	c=
ond_resched();
784c9a29e99eb4 drivers/md/dm-kcopyd.c John Pittman      2018-08-06  509  =

^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  510  	r=
eturn 0;
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  511  }
^1da177e4c3f41 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  512  =


:::::: The code at line 494 was first introduced by commit
:::::: 138728dc96529f20dfe970c470e51885a60e329f [PATCH] dm snapshot: fix kc=
opyd destructor

:::::: TO: Alasdair G Kergon <agk@redhat.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2054660165721444817==--

