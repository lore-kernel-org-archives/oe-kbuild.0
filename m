Content-Type: multipart/mixed; boundary="===============5250627697504659274=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:axboe/linux-block/for-next 14/27] fs/io-wq.c:1058:3: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 12 Feb 2022 18:39:06 +0800
Message-ID: <202202121637.Gfbmvobl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5250627697504659274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Hao Xu <haoxu@linux.alibaba.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-ne=
xt
head:   9c63ffcf47865ad2d20e09d6d6531c4611674cf1
commit: 785d7c2aaac454a6c36028e424f18405c999acac [14/27] io-wq: decouple wo=
rk_list protection from the big wqe->lock
:::::: branch date: 11 hours ago
:::::: commit date: 16 hours ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220212/202202121637.Gfbmvobl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/785d7c2aaac454a=
6c36028e424f18405c999acac
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-next
        git checkout 785d7c2aaac454a6c36028e424f18405c999acac
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   while (!err && left) {
                          ^
   kernel/sysctl.c:1440:3: note: Loop condition is true.  Entering loop body
                   while (!err && left) {
                   ^
   kernel/sysctl.c:1447:10: note: Calling 'proc_get_long'
                           err =3D proc_get_long(&p, &left, &val_a, &neg, t=
r_a,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sysctl.c:411:2: note: Taking false branch
           if (!*size)
           ^
   kernel/sysctl.c:415:6: note: Assuming the condition is false
           if (len > TMPBUFLEN - 1)
               ^~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:415:2: note: Taking false branch
           if (len > TMPBUFLEN - 1)
           ^
   kernel/sysctl.c:422:6: note: Assuming the condition is false
           if (*p =3D=3D '-' && *size > 1) {
               ^~~~~~~~~
   kernel/sysctl.c:422:16: note: Left side of '&&' is false
           if (*p =3D=3D '-' && *size > 1) {
                         ^
   kernel/sysctl.c:426:3: note: The value 0 is assigned to 'neg', which par=
ticipates in a condition later
                   *neg =3D false;
                   ^~~~~~~~~~~~
   kernel/sysctl.c:427:2: note: Taking false branch
           if (!isdigit(*p))
           ^
   kernel/sysctl.c:430:2: note: Taking false branch
           if (strtoul_lenient(p, &p, 0, val))
           ^
   kernel/sysctl.c:438:6: note: Assuming the condition is false
           if (len =3D=3D TMPBUFLEN - 1)
               ^~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:438:2: note: Taking false branch
           if (len =3D=3D TMPBUFLEN - 1)
           ^
   kernel/sysctl.c:441:6: note: Assuming the condition is false
           if (len < *size && perm_tr_len && !memchr(perm_tr, *p, perm_tr_l=
en))
               ^~~~~~~~~~~
   kernel/sysctl.c:441:18: note: Left side of '&&' is false
           if (len < *size && perm_tr_len && !memchr(perm_tr, *p, perm_tr_l=
en))
                           ^
   kernel/sysctl.c:444:6: note: 'tr' is non-null
           if (tr && (len < *size))
               ^~
   kernel/sysctl.c:444:6: note: Left side of '&&' is true
   kernel/sysctl.c:444:2: note: Taking false branch
           if (tr && (len < *size))
           ^
   kernel/sysctl.c:450:2: note: Returning without writing to '*tr'
           return 0;
           ^
   kernel/sysctl.c:450:2: note: Returning zero, which participates in a con=
dition later
           return 0;
           ^~~~~~~~
   kernel/sysctl.c:1447:10: note: Returning from 'proc_get_long'
                           err =3D proc_get_long(&p, &left, &val_a, &neg, t=
r_a,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/sysctl.c:1454:9: note: Assuming 'left' is <=3D 1
                           if ((left <=3D 1) && skipped) {
                                ^~~~~~~~~
   kernel/sysctl.c:1454:8: note: Left side of '&&' is true
                           if ((left <=3D 1) && skipped) {
                               ^
   kernel/sysctl.c:1454:23: note: 'skipped' is 0
                           if ((left <=3D 1) && skipped) {
                                              ^~~~~~~
   kernel/sysctl.c:1454:4: note: Taking false branch
                           if ((left <=3D 1) && skipped) {
                           ^
   kernel/sysctl.c:1459:8: note: 'err' is 0
                           if (err)
                               ^~~
   kernel/sysctl.c:1459:4: note: Taking false branch
                           if (err)
                           ^
   kernel/sysctl.c:1461:8: note: Assuming 'val_a' is < 'bitmap_len'
                           if (val_a >=3D bitmap_len || neg) {
                               ^~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:1461:8: note: Left side of '||' is false
   kernel/sysctl.c:1461:31: note: 'neg' is false
                           if (val_a >=3D bitmap_len || neg) {
                                                      ^~~
   kernel/sysctl.c:1461:4: note: Taking false branch
                           if (val_a >=3D bitmap_len || neg) {
                           ^
   kernel/sysctl.c:1467:8: note: Assuming 'left' is 0
                           if (left) {
                               ^~~~
   kernel/sysctl.c:1467:4: note: Taking false branch
                           if (left) {
                           ^
   kernel/sysctl.c:1472:10: note: The left operand of '=3D=3D' is a garbage=
 value
                           if (c =3D=3D '-') {
                               ~ ^
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/io-wq.c:1058:3: warning: The expression is an uninitialized value. Th=
e computed value will also be garbage [clang-analyzer-core.uninitialized.As=
sign]
                   match->nr_pending++;
                   ^
   fs/io-wq.c:979:2: note: Calling 'io_wqe_enqueue'
           io_wqe_enqueue(wqe, work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:933:6: note: Assuming the condition is false
           if (test_bit(IO_WQ_BIT_EXIT, &wqe->wq->state) ||
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/io-wq.c:933:6: note: Left side of '||' is false
           if (test_bit(IO_WQ_BIT_EXIT, &wqe->wq->state) ||
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/io-wq.c:934:7: note: Assuming the condition is false
               (work->flags & IO_WQ_WORK_CANCEL)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:933:2: note: Taking false branch
           if (test_bit(IO_WQ_BIT_EXIT, &wqe->wq->state) ||
           ^
   fs/io-wq.c:940:2: note: Calling 'io_wqe_insert_work'
           io_wqe_insert_work(wqe, work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:902:6: note: Assuming the condition is false
           if (!io_wq_is_hashed(work)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:902:2: note: Taking false branch
           if (!io_wq_is_hashed(work)) {
           ^
   fs/io-wq.c:911:6: note: Assuming 'tail' is non-null
           if (!tail)
               ^~~~~
   fs/io-wq.c:911:2: note: Taking false branch
           if (!tail)
           ^
   fs/io-wq.c:914:2: note: Calling 'wq_list_add_after'
           wq_list_add_after(&work->list, &tail->list, &acct->work_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.h:51:6: note: Assuming 'next' is non-null
           if (!next)
               ^~~~~
   fs/io-wq.h:51:2: note: Taking false branch
           if (!next)
           ^
   fs/io-wq.h:53:1: note: Returning without writing to 'list->first', which=
 participates in a condition later
   }
   ^
   fs/io-wq.c:914:2: note: Returning from 'wq_list_add_after'
           wq_list_add_after(&work->list, &tail->list, &acct->work_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:940:2: note: Returning from 'io_wqe_insert_work'
           io_wqe_insert_work(wqe, work);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:946:14: note: Assuming the condition is true
           do_create =3D !io_wqe_activate_free_worker(wqe, acct);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:951:6: note: 'do_create' is true
           if (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
               ^~~~~~~~~
   fs/io-wq.c:951:6: note: Left side of '&&' is true
   fs/io-wq.c:951:21: note: Assuming the condition is false
           if (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:951:20: note: Left side of '||' is false
           if (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
                             ^
   fs/io-wq.c:952:6: note: Assuming the condition is true
               !atomic_read(&acct->nr_running))) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:951:2: note: Taking true branch
           if (do_create && ((work_flags & IO_WQ_WORK_CONCURRENT) ||
           ^
   fs/io-wq.c:956:3: note: Taking false branch
                   if (likely(did_create))
                   ^
   fs/io-wq.c:960:7: note: Assuming field 'nr_workers' is 0
                   if (acct->nr_workers) {
                       ^~~~~~~~~~~~~~~~
   fs/io-wq.c:960:3: note: Taking false branch
                   if (acct->nr_workers) {
                   ^
   fs/io-wq.c:971:3: note: Calling 'io_acct_cancel_pending_work'
                   io_acct_cancel_pending_work(wqe, acct, &match);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:1051:2: note: Loop condition is true.  Entering loop body
           wq_list_for_each(node, prev, &acct->work_list) {
           ^
   fs/io-wq.h:33:2: note: expanded from macro 'wq_list_for_each'
           for (pos =3D (head)->first, prv =3D NULL; pos; prv =3D pos, pos =
=3D (pos)->next)
           ^
   fs/io-wq.c:1053:8: note: Calling 'io_wq_work_match_item'
                   if (!match->fn(work, match->data))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io-wq.c:919:9: note: Assuming 'work' is equal to 'data'
           return work =3D=3D data;
                  ^~~~~~~~~~~~
   fs/io-wq.c:919:2: note: Returning the value 1, which participates in a c=
ondition later

vim +1058 fs/io-wq.c

204361a77f40186 Pavel Begunkov 2020-08-23  1042  =

3146cba99aa284b Jens Axboe     2021-09-01  1043  static bool io_acct_cancel=
_pending_work(struct io_wqe *wqe,
3146cba99aa284b Jens Axboe     2021-09-01  1044  					struct io_wqe_acct *a=
cct,
2293b4195800f88 Pavel Begunkov 2020-03-07  1045  					struct io_cb_cancel_d=
ata *match)
771b53d033e8663 Jens Axboe     2019-10-22  1046  {
6206f0e180d4edd Jens Axboe     2019-11-26  1047  	struct io_wq_work_node *n=
ode, *prev;
771b53d033e8663 Jens Axboe     2019-10-22  1048  	struct io_wq_work *work;
f95dc207b93da9c Jens Axboe     2021-08-31  1049  =

785d7c2aaac454a Hao Xu         2022-02-06  1050  	raw_spin_lock(&acct->lock=
);
f95dc207b93da9c Jens Axboe     2021-08-31  1051  	wq_list_for_each(node, pr=
ev, &acct->work_list) {
6206f0e180d4edd Jens Axboe     2019-11-26  1052  		work =3D container_of(no=
de, struct io_wq_work, list);
4f26bda1522c35d Pavel Begunkov 2020-06-15  1053  		if (!match->fn(work, mat=
ch->data))
4f26bda1522c35d Pavel Begunkov 2020-06-15  1054  			continue;
204361a77f40186 Pavel Begunkov 2020-08-23  1055  		io_wqe_remove_pending(wq=
e, work, prev);
785d7c2aaac454a Hao Xu         2022-02-06  1056  		raw_spin_unlock(&acct->l=
ock);
e9fd939654f1765 Pavel Begunkov 2020-03-04  1057  		io_run_cancel(work, wqe);
4f26bda1522c35d Pavel Begunkov 2020-06-15 @1058  		match->nr_pending++;
4f26bda1522c35d Pavel Begunkov 2020-06-15  1059  		/* not safe to continue =
after unlock */
3146cba99aa284b Jens Axboe     2021-09-01  1060  		return true;
3146cba99aa284b Jens Axboe     2021-09-01  1061  	}
785d7c2aaac454a Hao Xu         2022-02-06  1062  	raw_spin_unlock(&acct->lo=
ck);
3146cba99aa284b Jens Axboe     2021-09-01  1063  =

3146cba99aa284b Jens Axboe     2021-09-01  1064  	return false;
3146cba99aa284b Jens Axboe     2021-09-01  1065  }
3146cba99aa284b Jens Axboe     2021-09-01  1066  =


:::::: The code at line 1058 was first introduced by commit
:::::: 4f26bda1522c35d2701fc219368c7101c17005c1 io-wq: add an option to can=
cel all matched reqs

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5250627697504659274==--

