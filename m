Content-Type: multipart/mixed; boundary="===============5956722969750261651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 349/435] drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 26 Nov 2021 10:39:09 +0800
Message-ID: <202111261030.u0uugLZq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5956722969750261651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   b8280145cf2a894c873fdf91fb2af474c52ac6cc
commit: 03c658df11da330714e3557b11bdc2172b6ee9f0 [349/435] linux/container_=
of.h: switch to static_assert
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20211122 (https://download.01.org/0day-ci/arc=
hive/20211126/202111261030.u0uugLZq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb=
321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/hnaz/linux-mm/commit/03c658df11da330714e3557b1=
1bdc2172b6ee9f0
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout 03c658df11da330714e3557b11bdc2172b6ee9f0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/core/datagram.c:254:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   net/core/datagram.c:254:2: note: Taking true branch
           if (error)
           ^
   net/core/datagram.c:255:3: note: Control jumps to line 282
                   goto no_packet;
                   ^
   net/core/datagram.c:283:2: note: Returning without writing to '*last'
           return NULL;
           ^
   net/core/datagram.c:283:2: note: Returning null pointer, which participa=
tes in a condition later
           return NULL;
           ^~~~~~~~~~~
   net/core/datagram.c:297:9: note: Returning from '__skb_try_recv_datagram'
                   skb =3D __skb_try_recv_datagram(sk, sk_queue, flags, off=
, err,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/core/datagram.c:299:7: note: 'skb' is null
                   if (skb)
                       ^~~
   net/core/datagram.c:299:3: note: Taking false branch
                   if (skb)
                   ^
   net/core/datagram.c:302:7: note: Assuming the condition is false
                   if (*err !=3D -EAGAIN)
                       ^~~~~~~~~~~~~~~
   net/core/datagram.c:302:3: note: Taking false branch
                   if (*err !=3D -EAGAIN)
                   ^
   net/core/datagram.c:304:11: note: Assuming 'timeo' is not equal to 0
           } while (timeo &&
                    ^~~~~
   net/core/datagram.c:304:11: note: Left side of '&&' is true
   net/core/datagram.c:305:5: note: 5th function call argument is an uninit=
ialized value
                    !__skb_wait_for_more_packets(sk, sk_queue, err,
                     ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
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
   drivers/md/dm-kcopyd.c:505:6: note: Assuming the condition is false
           if (atomic_dec_and_test(&kc->nr_jobs))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/bluetooth/smp.c:859:2: warning: Null pointer passed as 1st argument =
to memory set function [clang-analyzer-unix.cstring.NullArg]

vim +494 drivers/md/dm-kcopyd.c

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  302  =

d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  303  /*
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  304   =
* Allocate and reserve nr_pages for the use of a specific client.
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  305   =
*/
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  306  s=
tatic int client_reserve_pages(struct dm_kcopyd_client *kc, unsigned nr_pag=
es)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  307  {
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  308  	=
unsigned i;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  309  	=
struct page_list *pl =3D NULL, *next;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  310  =

d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  311  	=
for (i =3D 0; i < nr_pages; i++) {
f99b55eec795bd0 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  312  	=
	next =3D alloc_pl(GFP_KERNEL);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  313  	=
	if (!next) {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  314  	=
		if (pl)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  315  	=
			drop_pages(pl);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  316  	=
		return -ENOMEM;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  317  	=
	}
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  318  	=
	next->next =3D pl;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  319  	=
	pl =3D next;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  320  	}
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  321  =

d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  322  	=
kc->nr_reserved_pages +=3D nr_pages;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16 @323  	=
kcopyd_put_pages(kc, pl);
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  324  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  325  	=
return 0;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  326  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  327  =

eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  328  s=
tatic void client_free_pages(struct dm_kcopyd_client *kc)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  329  {
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  330  	=
BUG_ON(kc->nr_free_pages !=3D kc->nr_reserved_pages);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  331  	=
drop_pages(kc->pages);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  332  	=
kc->pages =3D NULL;
d04714580f12379 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  333  	=
kc->nr_free_pages =3D kc->nr_reserved_pages =3D 0;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  334  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  335  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  336  /=
*-----------------------------------------------------------------
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  337   =
* kcopyd_jobs need to be allocated by the *clients* of kcopyd,
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  338   =
* for this reason we use a mempool to prevent the client from
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  339   =
* ever having to do io (which could cause a deadlock).
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  340   =
*---------------------------------------------------------------*/
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  341  s=
truct kcopyd_job {
eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  342  	=
struct dm_kcopyd_client *kc;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  343  	=
struct list_head list;
db2351eb22e42c5 drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  344  	=
unsigned flags;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  345  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  346  	=
/*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  347  	=
 * Error state of the job.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  348  	=
 */
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  349  	=
int read_err;
4cdc1d1fa5c5ac1 drivers/md/kcopyd.c    Alasdair G Kergon 2008-03-28  350  	=
unsigned long write_err;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  351  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  352  	=
/*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  353  	=
 * Either READ or WRITE
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  354  	=
 */
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  355  	=
int rw;
22a1ceb1e6a7fbc drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  356  	=
struct dm_io_region source;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  357  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  358  	=
/*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  359  	=
 * The destinations for the transfer.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  360  	=
 */
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  361  	=
unsigned int num_dests;
eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  362  	=
struct dm_io_region dests[DM_KCOPYD_MAX_REGIONS];
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  363  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  364  	=
struct page_list *pages;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  365  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  366  	=
/*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  367  	=
 * Set this to ensure you are notified when the job has
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  368  	=
 * completed.  'context' is for callback to use.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  369  	=
 */
eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  370  	=
dm_kcopyd_notify_fn fn;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  371  	=
void *context;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  372  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  373  	=
/*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  374  	=
 * These fields are only used if the job has been split
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  375  	=
 * into more manageable parts.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  376  	=
 */
def5b5b26e6d978 drivers/md/kcopyd.c    Matthias Kaehlcke 2007-10-19  377  	=
struct mutex lock;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  378  	=
atomic_t sub_jobs;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  379  	=
sector_t progress;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  380  	=
sector_t write_offset;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  381  =

c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  382  	=
struct kcopyd_job *master_job;
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  383  };
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  384  =

e18b890bb0881bb drivers/md/kcopyd.c    Christoph Lameter 2006-12-06  385  s=
tatic struct kmem_cache *_job_cache;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  386  =

945fa4d283a3a47 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  387  i=
nt __init dm_kcopyd_init(void)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  388  {
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  389  	=
_job_cache =3D kmem_cache_create("kcopyd_job",
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  390  	=
			sizeof(struct kcopyd_job) * (SPLIT_COUNT + 1),
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  391  	=
			__alignof__(struct kcopyd_job), 0, NULL);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  392  	=
if (!_job_cache)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  393  	=
	return -ENOMEM;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  394  =

7f06965390e4a10 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-10-31  395  	=
zero_page_list.next =3D &zero_page_list;
7f06965390e4a10 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-10-31  396  	=
zero_page_list.page =3D ZERO_PAGE(0);
7f06965390e4a10 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-10-31  397  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  398  	=
return 0;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  399  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  400  =

945fa4d283a3a47 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  401  v=
oid dm_kcopyd_exit(void)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  402  {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  403  	=
kmem_cache_destroy(_job_cache);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  404  	=
_job_cache =3D NULL;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  405  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  406  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  407  /*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  408   =
* Functions to push and pop a job onto the head of a given job
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  409   =
* list.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  410   =
*/
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  411  s=
tatic struct kcopyd_job *pop_io_job(struct list_head *jobs,
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  412  	=
			     struct dm_kcopyd_client *kc)
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  413  {
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  414  	=
struct kcopyd_job *job;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  415  =

b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  416  	=
/*
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  417  	=
 * For I/O jobs, pop any read, any write without sequential write
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  418  	=
 * constraint and sequential writes that are at the right position.
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  419  	=
 */
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  420  	=
list_for_each_entry(job, jobs, list) {
db2351eb22e42c5 drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  421  	=
	if (job->rw =3D=3D READ || !(job->flags & BIT(DM_KCOPYD_WRITE_SEQ))) {
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  422  	=
		list_del(&job->list);
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  423  	=
		return job;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  424  	=
	}
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  425  =

b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  426  	=
	if (job->write_offset =3D=3D job->master_job->write_offset) {
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  427  	=
		job->master_job->write_offset +=3D job->source.count;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  428  	=
		list_del(&job->list);
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  429  	=
		return job;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  430  	=
	}
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  431  	}
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  432  =

b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  433  	=
return NULL;
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  434  }
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  435  =

8c0cbc2f79bb222 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  436  s=
tatic struct kcopyd_job *pop(struct list_head *jobs,
8c0cbc2f79bb222 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  437  	=
		      struct dm_kcopyd_client *kc)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  438  {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  439  	=
struct kcopyd_job *job =3D NULL;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  440  =

6bcd658f2a2a13f drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  441  	=
spin_lock_irq(&kc->job_lock);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  442  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  443  	=
if (!list_empty(jobs)) {
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  444  	=
	if (jobs =3D=3D &kc->io_jobs)
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  445  	=
		job =3D pop_io_job(jobs, kc);
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  446  	=
	else {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  447  	=
		job =3D list_entry(jobs->next, struct kcopyd_job, list);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  448  	=
		list_del(&job->list);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  449  	=
	}
b73c67c2cbb0004 drivers/md/dm-kcopyd.c Damien Le Moal    2017-05-08  450  	}
6bcd658f2a2a13f drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  451  	=
spin_unlock_irq(&kc->job_lock);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  452  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  453  	=
return job;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  454  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  455  =

028867ac28e51af drivers/md/kcopyd.c    Alasdair G Kergon 2007-07-12  456  s=
tatic void push(struct list_head *jobs, struct kcopyd_job *job)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  457  {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  458  	=
unsigned long flags;
8c0cbc2f79bb222 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  459  	=
struct dm_kcopyd_client *kc =3D job->kc;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  460  =

8c0cbc2f79bb222 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  461  	=
spin_lock_irqsave(&kc->job_lock, flags);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  462  	=
list_add_tail(&job->list, jobs);
8c0cbc2f79bb222 drivers/md/kcopyd.c    Mikulas Patocka   2008-04-24  463  	=
spin_unlock_irqrestore(&kc->job_lock, flags);
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  464  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  465  =

b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  466  =

b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  467  s=
tatic void push_head(struct list_head *jobs, struct kcopyd_job *job)
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  468  {
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  469  	=
struct dm_kcopyd_client *kc =3D job->kc;
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  470  =

6bcd658f2a2a13f drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  471  	=
spin_lock_irq(&kc->job_lock);
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  472  	=
list_add(&job->list, jobs);
6bcd658f2a2a13f drivers/md/dm-kcopyd.c Mikulas Patocka   2021-05-26  473  	=
spin_unlock_irq(&kc->job_lock);
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  474  }
b673c3a8192e28f drivers/md/dm-kcopyd.c Kazuo Ito         2008-10-21  475  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  476  /*
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  477   =
* These three functions process 1 item from the corresponding
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  478   =
* job list.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  479   *
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  480   =
* They return:
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  481   =
* < 0: error
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  482   =
*   0: success
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  483   =
* > 0: can't process yet.
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  484   =
*/
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  485  s=
tatic int run_complete_job(struct kcopyd_job *job)
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  486  {
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  487  	=
void *context =3D job->context;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  488  	=
int read_err =3D job->read_err;
4cdc1d1fa5c5ac1 drivers/md/kcopyd.c    Alasdair G Kergon 2008-03-28  489  	=
unsigned long write_err =3D job->write_err;
eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  490  	=
dm_kcopyd_notify_fn fn =3D job->fn;
eb69aca5d3370b8 drivers/md/kcopyd.c    Heinz Mauelshagen 2008-04-24  491  	=
struct dm_kcopyd_client *kc =3D job->kc;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  492  =

7f06965390e4a10 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-10-31  493  	=
if (job->pages && job->pages !=3D &zero_page_list)
138728dc96529f2 drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27 @494  	=
	kcopyd_put_pages(kc, job->pages);
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  495  	=
/*
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  496  	=
 * If this is the master job, the sub jobs have already
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  497  	=
 * completed so we can free everything.
c6ea41fbbe08f27 drivers/md/dm-kcopyd.c Mikulas Patocka   2011-05-29  498  	=
 */
d5ffebdd797a7c1 drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  499  	=
if (job->master_job =3D=3D job) {
d5ffebdd797a7c1 drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  500  	=
	mutex_destroy(&job->lock);
6f1c819c219f784 drivers/md/dm-kcopyd.c Kent Overstreet   2018-05-20  501  	=
	mempool_free(job, &kc->job_pool);
d5ffebdd797a7c1 drivers/md/dm-kcopyd.c Mike Snitzer      2018-01-05  502  	}
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  503  	=
fn(read_err, write_err, context);
138728dc96529f2 drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  504  =

138728dc96529f2 drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  505  	=
if (atomic_dec_and_test(&kc->nr_jobs))
138728dc96529f2 drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  506  	=
	wake_up(&kc->destroyq);
138728dc96529f2 drivers/md/kcopyd.c    Alasdair G Kergon 2006-03-27  507  =

784c9a29e99eb40 drivers/md/dm-kcopyd.c John Pittman      2018-08-06  508  	=
cond_resched();
784c9a29e99eb40 drivers/md/dm-kcopyd.c John Pittman      2018-08-06  509  =

^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  510  	=
return 0;
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  511  }
^1da177e4c3f415 drivers/md/kcopyd.c    Linus Torvalds    2005-04-16  512  =


:::::: The code at line 494 was first introduced by commit
:::::: 138728dc96529f20dfe970c470e51885a60e329f [PATCH] dm snapshot: fix kc=
opyd destructor

:::::: TO: Alasdair G Kergon <agk@redhat.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5956722969750261651==--

