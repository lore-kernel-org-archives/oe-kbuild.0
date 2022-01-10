Content-Type: multipart/mixed; boundary="===============3013214071729582336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 10 Jan 2022 23:15:46 +0800
Message-ID: <202201102309.jPnMcMSS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3013214071729582336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   9 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220107 (https://download.01.org/0day-ci/archi=
ve/20220110/202201102309.jPnMcMSS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           skb_setup_tx_timestamp(skb, sockc->tsflags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2607:39: note: Passing value via 3rd parameter 'tx_fl=
ags'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2607:2: note: Calling '_sock_tx_timestamp'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2589:6: note: Assuming 'tsflags' is not equal to 0
           if (unlikely(tsflags)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2589:2: note: Taking true branch
           if (unlikely(tsflags)) {
           ^
   include/net/sock.h:2591:7: note: Assuming the condition is true
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2591:7: note: Left side of '&&' is true
   include/net/sock.h:2591:44: note: Assuming 'tskey' is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                            ^~~~~
   include/net/sock.h:2591:7: note: Assuming pointer value is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2591:50: note: Left side of '&&' is false
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                                  ^
   include/net/sock.h:2595:6: note: Assuming the condition is false
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2595:2: note: Taking true branch
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
           ^
   include/net/sock.h:2596:13: note: Dereference of null pointer (loaded fr=
om variable 'tx_flags')
                   *tx_flags |=3D SKBTX_WIFI_STATUS;
                    ~~~~~~~~ ^
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
   5 warnings generated.
   include/net/dst_metadata.h:74:18: warning: Access to field 'type' result=
s in a dereference of a null pointer (loaded from variable 'a') [clang-anal=
yzer-core.NullDereference]
           if (!a !=3D !b || a->type !=3D b->type)
                           ^
   net/core/dev.c:6338:37: note: Calling 'dev_gro_receive'
           ret =3D napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:6049:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))
           ^

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3013214071729582336==--

