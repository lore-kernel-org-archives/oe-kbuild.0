Content-Type: multipart/mixed; boundary="===============2698605113500136283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 03 Jun 2022 10:19:22 +0800
Message-ID: <202206031034.W27549iK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2698605113500136283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/md/dm-kcopyd.c:494:3: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]"
:::::: =


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
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220603/202206031034.W27549iK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
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
   fs/ext4/namei.c:1602:8: note: Assuming 'retval' is not equal to 0
                           if (retval) {
                               ^~~~~~
   fs/ext4/namei.c:1602:4: note: Taking true branch
                           if (retval) {
                           ^
   fs/ext4/namei.c:1605:5: note: Control jumps to line 1660
                                   goto cleanup_and_exit;
                                   ^
   fs/ext4/namei.c:1660:2: note: Loop condition is false. Execution continu=
es on line 1662
           for (; ra_ptr < ra_max; ra_ptr++)
           ^
   fs/ext4/namei.c:1662:2: note: Returning pointer (loaded from 'ret'), whi=
ch participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ext4/namei.c:1680:7: note: Returning from '__ext4_find_entry'
           bh =3D __ext4_find_entry(dir, &fname, res_dir, inlined);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:1683:2: note: Returning pointer (loaded from 'bh'), whic=
h participates in a condition later
           return bh;
           ^~~~~~~~~
   fs/ext4/namei.c:3979:11: note: Returning from 'ext4_find_entry'
           new.bh =3D ext4_find_entry(new.dir, &new.dentry->d_name,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/namei.c:3981:2: note: Taking false branch
           if (IS_ERR(new.bh)) {
           ^
   fs/ext4/namei.c:3988:6: note: Assuming field 'bh' is non-null
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
               ^~~~~~~
   fs/ext4/namei.c:3988:6: note: Left side of '||' is false
   fs/ext4/namei.c:3988:17: note: Access to field 'inode' results in a dere=
ference of a null pointer (loaded from field 'de')
           if (!new.bh || le32_to_cpu(new.de->inode) !=3D new.inode->i_ino)
                          ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   2 warnings generated.
   block/bfq-iosched.c:5133:20: warning: Access to field 'burst_size' resul=
ts in a dereference of a null pointer (loaded from field 'bfqd') [clang-ana=
lyzer-core.NullDereference]
                   if (bfqq->bic && bfqq->bfqd->burst_size > 0)
                                    ^
   block/bfq-iosched.c:6827:2: note: Loop condition is true.  Entering loop=
 body
           for (i =3D 0; i < 2; i++)
           ^
   block/bfq-iosched.c:6828:3: note: Loop condition is true.  Entering loop=
 body
                   for (j =3D 0; j < IOPRIO_NR_LEVELS; j++)
                   ^
--
   drivers/nvmem/core.c:1431:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/nvmem/core.c:1431:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1434:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1398:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1398:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1399:3: note: Returning without writing to '*len'
                   return rc;
                   ^
   drivers/nvmem/core.c:1434:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1435:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1435:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1437:3: note: Returning without writing to '*len'
                   return ERR_PTR(rc);
                   ^
   drivers/nvmem/core.c:1545:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, &len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1546:2: note: Taking false branch
           if (IS_ERR(buf)) {
           ^
   drivers/nvmem/core.c:1550:10: note: The left operand of '!=3D' is a garb=
age value
           if (len !=3D count) {
               ~~~ ^
   drivers/nvmem/core.c:1647:11: warning: The left operand of '>' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (*len > max_len) {
                    ^
   drivers/nvmem/core.c:1698:2: note: 'len' declared without an initial val=
ue
           size_t len;
           ^~~~~~~~~~
   drivers/nvmem/core.c:1702:8: note: Calling 'nvmem_cell_read_variable_com=
mon'
           buf =3D nvmem_cell_read_variable_common(dev, cell_id, sizeof(*va=
l), &len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/nvmem/core.c:1631:2: note: Taking false branch
           if (IS_ERR(cell))
           ^
   drivers/nvmem/core.c:1635:8: note: Calling 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1427:6: note: Assuming 'nvmem' is non-null
           if (!nvmem)
               ^~~~~~
   drivers/nvmem/core.c:1427:2: note: Taking false branch
           if (!nvmem)
           ^
   drivers/nvmem/core.c:1431:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/nvmem/core.c:1431:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1434:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1398:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1398:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1434:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell, buf, len);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1435:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1435:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1635:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1637:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1644:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1644:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1647:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
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
   3 warnings generated.
   drivers/media/dvb-frontends/stv0910.c:692:4: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:692:4: note: Value stored to 'stat=
us' is never read
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:698:4: warning: Value stored to 's=
tatus' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0910.c:698:4: note: Value stored to 'stat=
us' is never read
                           status =3D write_reg(state, RSTV0910_P2_ERRCTRL1=
 +
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/dvb-frontends/stv6111.c:473:2: warning: Value stored to 'i=
cp' is never read [clang-analyzer-deadcode.DeadStores]
           icp =3D 0;
           ^     ~
   drivers/media/dvb-frontends/stv6111.c:473:2: note: Value stored to 'icp'=
 is never read
           icp =3D 0;
           ^     ~
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   drivers/media/dvb-frontends/mxl5xx.c:190:28: warning: The right operand =
of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResul=
t]
                   if (DMA_INTR_PROT_WR_CMP & val)
                                            ^
   drivers/media/dvb-frontends/mxl5xx.c:665:6: note: Assuming 're_tune' is =
true
           if (re_tune) {
               ^~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:665:2: note: Taking true branch
           if (re_tune) {
           ^
   drivers/media/dvb-frontends/mxl5xx.c:666:7: note: Calling 'set_parameter=
s'
                   r =3D set_parameters(fe);
                       ^~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:6: note: Assuming field 'freque=
ncy' is >=3D 950000
           if (p->frequency < 950000 || p->frequency > 2150000)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:6: note: Left side of '||' is f=
alse
   drivers/media/dvb-frontends/mxl5xx.c:445:31: note: Assuming field 'frequ=
ency' is <=3D 2150000
           if (p->frequency < 950000 || p->frequency > 2150000)
                                        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:445:2: note: Taking false branch
           if (p->frequency < 950000 || p->frequency > 2150000)
           ^
   drivers/media/dvb-frontends/mxl5xx.c:447:6: note: Assuming field 'symbol=
_rate' is >=3D 1000000
           if (p->symbol_rate < 1000000 || p->symbol_rate > 45000000)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/mxl5xx.c:447:6: note: Left side of '||' is f=
alse
   drivers/media/dvb-frontends/mxl5xx.c:447:34: note: Assuming field 'symbo=
l_rate' is <=3D 45000000
--
   drivers/md/bcache/movinggc.c:233:9: note: Assuming 'sectors_to_move' is =
<=3D 'reserve_sectors'
           while (sectors_to_move > reserve_sectors) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/movinggc.c:233:2: note: Loop condition is false. Execu=
tion continues on line 238
           while (sectors_to_move > reserve_sectors) {
           ^
   drivers/md/bcache/movinggc.c:238:9: note: '_r' is false
           while (heap_pop(&ca->heap, b, bucket_cmp))
                  ^
   drivers/md/bcache/util.h:101:6: note: expanded from macro 'heap_pop'
           if (_r) {                                                       \
               ^~
   drivers/md/bcache/movinggc.c:238:9: note: Taking false branch
           while (heap_pop(&ca->heap, b, bucket_cmp))
                  ^
   drivers/md/bcache/util.h:101:2: note: expanded from macro 'heap_pop'
           if (_r) {                                                       \
           ^
   drivers/md/bcache/movinggc.c:238:2: note: Loop condition is false. Execu=
tion continues on line 241
           while (heap_pop(&ca->heap, b, bucket_cmp))
           ^
   drivers/md/bcache/movinggc.c:245:2: note: Calling 'read_moving'
           read_moving(c);
           ^~~~~~~~~~~~~~
   drivers/md/bcache/movinggc.c:137:9: note: Assuming the condition is true
           while (!test_bit(CACHE_SET_STOPPING, &c->flags)) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/movinggc.c:137:2: note: Loop condition is true.  Enter=
ing loop body
           while (!test_bit(CACHE_SET_STOPPING, &c->flags)) {
           ^
   drivers/md/bcache/movinggc.c:139:10: note: The result of the left shift =
is undefined because the left operand is negative
                                              &MAX_KEY, moving_pred);
                                               ^
   include/uapi/linux/bcache.h:81:24: note: expanded from macro 'MAX_KEY'
   #define MAX_KEY                         KEY(MAX_KEY_INODE, MAX_KEY_OFFSE=
T, 0)
                                               ^~~~~~~~~~~~~
   include/uapi/linux/bcache.h:79:31: note: expanded from macro 'MAX_KEY_IN=
ODE'
   #define MAX_KEY_INODE                   (~(~0 << 20))
                                              ~~ ^
   include/uapi/linux/bcache.h:73:51: note: expanded from macro 'KEY'
           .high =3D (1ULL << 63) | ((__u64) (size) << 20) | (inode),      =
  \
                                                            ^~~~~
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
   1 warning generated.
   mm/memblock.c:1185:36: warning: The result of the '<<' expression is und=
efined [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   *idx =3D (u32)idx_a | (u64)idx_b << 32;
                                                       ~~~~~~~~~~~^~~~~
   mm/memblock.c:1123:16: note: Assuming the condition is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
                         ^
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
                                   ^
   fs/gfs2/glock.c:617:2: note: Loop condition is false.  Exiting loop
           GLOCK_BUG_ON(gl, gl->gl_state =3D=3D gl->gl_target);
           ^
   fs/gfs2/glock.h:211:28: note: expanded from macro 'GLOCK_BUG_ON'
   #define GLOCK_BUG_ON(gl,x) do { if (unlikely(x)) {              \
                              ^
   fs/gfs2/glock.c:618:7: note: 'target' is not equal to LM_ST_UNLOCKED
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
                ^~~~~~
   fs/gfs2/glock.c:618:7: note: Left side of '||' is false
   fs/gfs2/glock.c:618:35: note: Assuming 'target' is equal to LM_ST_DEFERR=
ED
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
                                            ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:618:6: note: Left side of '&&' is true
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
               ^
   fs/gfs2/glock.c:619:6: note: Assuming field 'go_inval' is null
               glops->go_inval) {
               ^~~~~~~~~~~~~~~
   fs/gfs2/glock.c:618:6: note: Assuming pointer value is null
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:618:2: note: Taking false branch
           if ((target =3D=3D LM_ST_UNLOCKED || target =3D=3D LM_ST_DEFERRE=
D) &&
           ^
   fs/gfs2/glock.c:631:2: note: '?' condition is true
           set_bit(GLF_BLOCKING, &gl->gl_flags);
           ^
   arch/arm/include/asm/bitops.h:189:25: note: expanded from macro 'set_bit'
   #define set_bit(nr,p)                   ATOMIC_BITOP(set_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_B=
ITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(n=
r,p))
            ^
   fs/gfs2/glock.c:632:11: note: Field 'gl_req' is not equal to LM_ST_UNLOC=
KED
           if ((gl->gl_req =3D=3D LM_ST_UNLOCKED) ||
                    ^
   fs/gfs2/glock.c:632:6: note: Left side of '||' is false
           if ((gl->gl_req =3D=3D LM_ST_UNLOCKED) ||
               ^
   fs/gfs2/glock.c:633:7: note: Assuming field 'gl_state' is not equal to L=
M_ST_EXCLUSIVE
               (gl->gl_state =3D=3D LM_ST_EXCLUSIVE) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:632:6: note: Left side of '||' is false
           if ((gl->gl_req =3D=3D LM_ST_UNLOCKED) ||
               ^
   fs/gfs2/glock.c:632:2: note: Taking false branch
           if ((gl->gl_req =3D=3D LM_ST_UNLOCKED) ||
           ^
   fs/gfs2/glock.c:637:6: note: Assuming field 'go_sync' is null
           if (glops->go_sync) {
               ^~~~~~~~~~~~~~
   fs/gfs2/glock.c:637:2: note: Taking false branch
           if (glops->go_sync) {
           ^
   fs/gfs2/glock.c:651:6: note: Assuming the condition is true
           if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   fs/gfs2/glock.c:651:2: note: Taking true branch
           if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags)) {
           ^
   fs/gfs2/glock.c:659:8: note: Assuming the condition is false
                   if ((atomic_read(&gl->gl_ail_count) !=3D 0) &&
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:659:45: note: Left side of '&&' is false
                   if ((atomic_read(&gl->gl_ail_count) !=3D 0) &&
                                                             ^
   fs/gfs2/glock.c:665:23: note: 'target' is equal to LM_ST_DEFERRED
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                                       ^~~~~~
   fs/gfs2/glock.c:665:23: note: '?' condition is true
   fs/gfs2/glock.c:665:3: note: Called function pointer is null (null deref=
erence)
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                   ^~~~~~~~~~~~~~~
   include/linux/jhash.h:127:5: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   b +=3D k[1];
                     ^
   fs/gfs2/glock.c:1556:10: note: Calling 'gfs2_glock_get'
           error =3D gfs2_glock_get(sdp, number, glops, CREATE, &gl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:1032:7: note: Calling 'find_insert_glock'
           gl =3D find_insert_glock(&name, NULL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:976:26: note: Calling 'glock_waitqueue'
           wait_queue_head_t *wq =3D glock_waitqueue(name);
                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:107:13: note: Calling 'jhash2'
           u32 hash =3D jhash2((u32 *)name, ht_parms.key_len / 4, 0);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:125:2: note: Loop condition is true.  Entering loo=
p body
           while (length > 3) {
           ^
   include/linux/jhash.h:127:5: note: Assigned value is garbage or undefined
                   b +=3D k[1];
                     ^  ~~~~
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
   sound/core/oss/mixer_oss.c:1067:3: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, ptr->name);
                   ^~~~~~
   sound/core/oss/mixer_oss.c:1067:3: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
                   strcpy(str, ptr->name);
                   ^~~~~~
   1 warning generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   sound/core/oss/pcm_oss.c:849:6: note: Assuming field 'params' is not equ=
al to 0
           if (!runtime->oss.params)
               ^~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:849:2: note: Taking false branch
           if (!runtime->oss.params)
           ^
   sound/core/oss/pcm_oss.c:854:6: note: Assuming 'sw_params' is non-null
           if (!sw_params || !params || !sparams) {
               ^~~~~~~~~~
   sound/core/oss/pcm_oss.c:854:6: note: Left side of '||' is false
   sound/core/oss/pcm_oss.c:854:20: note: Assuming 'params' is non-null
           if (!sw_params || !params || !sparams) {
                             ^~~~~~~
   sound/core/oss/pcm_oss.c:854:6: note: Left side of '||' is false
           if (!sw_params || !params || !sparams) {
               ^
   sound/core/oss/pcm_oss.c:854:31: note: Assuming 'sparams' is non-null
           if (!sw_params || !params || !sparams) {
                                        ^~~~~~~~
   sound/core/oss/pcm_oss.c:854:2: note: Taking false branch
           if (!sw_params || !params || !sparams) {
           ^
   sound/core/oss/pcm_oss.c:859:6: note: Assuming the condition is false
           if (atomic_read(&substream->mmap_count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/oss/pcm_oss.c:859:2: note: Taking false branch
           if (atomic_read(&substream->mmap_count))
           ^
   sound/core/oss/pcm_oss.c:868:2: note: Taking false branch
           if (atomic_read(&substream->mmap_count))
           ^
   sound/core/oss/pcm_oss.c:872:7: note: Assuming 'direct' is not equal to 0
                   if (!direct)
                       ^~~~~~~
   sound/core/oss/pcm_oss.c:872:3: note: Taking false branch
                   if (!direct)
                   ^
   sound/core/oss/pcm_oss.c:876:6: note: 'err' is >=3D 0
           if (err < 0) {

vim +494 drivers/md/dm-kcopyd.c

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2698605113500136283==--

