Content-Type: multipart/mixed; boundary="===============1954269712116170584=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/bfq-cgroup.c:670:6: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 10 Mar 2022 14:11:26 +0800
Message-ID: <202203101417.mDOaT6at-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1954269712116170584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Valente <paolo.valente@linaro.org>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
commit: d29bd41428cfff9b582c248db14a47e2be8457a8 block, bfq: reset last_bfq=
q_created on group change
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220309 (https://download.01.org/0day-ci/arc=
hive/20220310/202203101417.mDOaT6at-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd29bd41428cfff9b582c248db14a47e2be8457a8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d29bd41428cfff9b582c248db14a47e2be8457a8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/fscache/cookie.c:276:6: note: Assuming 'aux_data' is null
           if (!aux_data || !aux_data_len) {
               ^~~~~~~~~
   fs/fscache/cookie.c:276:16: note: Left side of '||' is true
           if (!aux_data || !aux_data_len) {
                         ^
   fs/fscache/cookie.c:277:3: note: Null pointer value stored to 'aux_data'
                   aux_data =3D NULL;
                   ^~~~~~~~~~~~~~~
   fs/fscache/cookie.c:281:2: note: Loop condition is false.  Exiting loop
           fscache_stat(&fscache_n_acquires);
           ^
   fs/fscache/internal.h:276:28: note: expanded from macro 'fscache_stat'
   #define fscache_stat(stat) do {} while (0)
                              ^
   fs/fscache/cookie.c:284:6: note: Assuming 'parent' is non-null
           if (!parent) {
               ^~~~~~~
   fs/fscache/cookie.c:284:2: note: Taking false branch
           if (!parent) {
           ^
   fs/fscache/cookie.c:291:9: note: Assuming the condition is false
           BUG_ON(!def->name[0]);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/fscache/cookie.c:291:2: note: Taking false branch
           BUG_ON(!def->name[0]);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fscache/cookie.c:291:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!def->name[0]);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fscache/cookie.c:293:9: note: Assuming field 'type' is not equal to 0
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/fscache/cookie.c:293:48: note: Left side of '&&' is false
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
                                                         ^
   fs/fscache/cookie.c:293:2: note: Taking false branch
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/fscache/cookie.c:293:2: note: Loop condition is false.  Exiting loop
           BUG_ON(def->type =3D=3D FSCACHE_COOKIE_TYPE_INDEX &&
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/fscache/cookie.c:298:7: note: Passing null pointer value via 5th para=
meter 'aux_data'
                                            aux_data, aux_data_len,
                                            ^~~~~~~~
   fs/fscache/cookie.c:296:14: note: Calling 'fscache_alloc_cookie'
           candidate =3D fscache_alloc_cookie(parent, def,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/cookie.c:150:6: note: Assuming 'cookie' is non-null
           if (!cookie)
               ^~~~~~~
   fs/fscache/cookie.c:150:2: note: Taking false branch
           if (!cookie)
           ^
   fs/fscache/cookie.c:156:2: note: Taking false branch
           if (fscache_set_key(cookie, index_key, index_key_len) < 0)
           ^
   fs/fscache/cookie.c:159:6: note: Assuming the condition is true
           if (cookie->aux_len <=3D sizeof(cookie->inline_aux)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/cookie.c:159:2: note: Taking true branch
           if (cookie->aux_len <=3D sizeof(cookie->inline_aux)) {
           ^
   fs/fscache/cookie.c:160:3: note: Null pointer passed as 2nd argument to =
memory copy function
                   memcpy(cookie->inline_aux, aux_data, cookie->aux_len);
                   ^                          ~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
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
   16 warnings generated.
>> block/bfq-cgroup.c:670:6: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
               entity->parent->last_bfqq_created =3D=3D bfqq)
               ^
   block/bfq-cgroup.c:892:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&bfqd->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   block/bfq-cgroup.c:892:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&bfqd->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   block/bfq-cgroup.c:894:6: note: Assuming 'entity' is non-null
           if (!entity) /* root group */
               ^~~~~~~
   block/bfq-cgroup.c:894:2: note: Taking false branch
           if (!entity) /* root group */
           ^
   block/bfq-cgroup.c:901:2: note: Loop condition is true.  Entering loop b=
ody
           for (i =3D 0; i < BFQ_IOPRIO_CLASSES; i++) {
           ^
   block/bfq-cgroup.c:916:3: note: Calling 'bfq_reparent_active_queues'
                   bfq_reparent_active_queues(bfqd, bfqg, st, i);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:866:2: note: Loop condition is true.  Entering loop b=
ody
           while ((entity =3D bfq_entity_of(rb_first(active))))
           ^
   block/bfq-cgroup.c:867:3: note: Calling 'bfq_reparent_leaf_entity'
                   bfq_reparent_leaf_entity(bfqd, entity, ioprio_class);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:836:2: note: Loop condition is false. Execution conti=
nues on line 848
           while (child_entity->my_sched_data) { /* leaf not reached yet */
           ^
   block/bfq-cgroup.c:849:2: note: Calling 'bfq_bfqq_move'
           bfq_bfqq_move(bfqd, bfqq, bfqd->root_group);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:659:6: note: Assuming 'bfqq' is not equal to field 'i=
n_service_queue'
           if (bfqq =3D=3D bfqd->in_service_queue)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:659:2: note: Taking false branch
           if (bfqq =3D=3D bfqd->in_service_queue)
           ^
   block/bfq-cgroup.c:663:6: note: Assuming the condition is false
           if (bfq_bfqq_busy(bfqq))
               ^~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:663:2: note: Taking false branch
           if (bfq_bfqq_busy(bfqq))
           ^
   block/bfq-cgroup.c:665:11: note: Assuming field 'on_st_or_in_serv' is fa=
lse
           else if (entity->on_st_or_in_serv)
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:665:7: note: Taking false branch
           else if (entity->on_st_or_in_serv)
                ^
   block/bfq-cgroup.c:667:20: note: Calling 'bfqq_group'
           bfqg_and_blkg_put(bfqq_group(bfqq));
                             ^~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:312:9: note: Assuming 'group_entity' is non-null
           return group_entity ? container_of(group_entity, struct bfq_grou=
p,
                  ^~~~~~~~~~~~
   block/bfq-cgroup.c:312:9: note: '?' condition is true
   block/bfq-cgroup.c:312:24: note: Left side of '&&' is false
           return group_entity ? container_of(group_entity, struct bfq_grou=
p,
                                 ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   block/bfq-cgroup.c:312:24: note: Taking false branch
           return group_entity ? container_of(group_entity, struct bfq_grou=
p,
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   block/bfq-cgroup.c:312:24: note: Loop condition is false.  Exiting loop
           return group_entity ? container_of(group_entity, struct bfq_grou=
p,
                                 ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'

vim +670 block/bfq-cgroup.c

ea25da48086d3b Paolo Valente 2017-04-19  627  =

ea25da48086d3b Paolo Valente 2017-04-19  628  /**
ea25da48086d3b Paolo Valente 2017-04-19  629   * bfq_bfqq_move - migrate @b=
fqq to @bfqg.
ea25da48086d3b Paolo Valente 2017-04-19  630   * @bfqd: queue descriptor.
ea25da48086d3b Paolo Valente 2017-04-19  631   * @bfqq: the queue to move.
ea25da48086d3b Paolo Valente 2017-04-19  632   * @bfqg: the group to move t=
o.
ea25da48086d3b Paolo Valente 2017-04-19  633   *
ea25da48086d3b Paolo Valente 2017-04-19  634   * Move @bfqq to @bfqg, deact=
ivating it from its old group and reactivating
ea25da48086d3b Paolo Valente 2017-04-19  635   * it on the new one.  Avoid =
putting the entity on the old group idle tree.
ea25da48086d3b Paolo Valente 2017-04-19  636   *
8f9bebc33dd718 Paolo Valente 2017-06-05  637   * Must be called under the s=
cheduler lock, to make sure that the blkg
8f9bebc33dd718 Paolo Valente 2017-06-05  638   * owning @bfqg does not disa=
ppear (see comments in
8f9bebc33dd718 Paolo Valente 2017-06-05  639   * bfq_bic_update_cgroup on g=
uaranteeing the consistency of blkg
8f9bebc33dd718 Paolo Valente 2017-06-05  640   * objects).
ea25da48086d3b Paolo Valente 2017-04-19  641   */
ea25da48086d3b Paolo Valente 2017-04-19  642  void bfq_bfqq_move(struct bfq=
_data *bfqd, struct bfq_queue *bfqq,
ea25da48086d3b Paolo Valente 2017-04-19  643  		   struct bfq_group *bfqg)
ea25da48086d3b Paolo Valente 2017-04-19  644  {
ea25da48086d3b Paolo Valente 2017-04-19  645  	struct bfq_entity *entity =
=3D &bfqq->entity;
ea25da48086d3b Paolo Valente 2017-04-19  646  =

fd1bb3ae54a9a2 Paolo Valente 2020-03-21  647  	/*
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  648  	 * Get extra reference to pr=
event bfqq from being freed in
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  649  	 * next possible expire or d=
eactivate.
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  650  	 */
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  651  	bfqq->ref++;
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  652  =

ea25da48086d3b Paolo Valente 2017-04-19  653  	/* If bfqq is empty, then bf=
q_bfqq_expire also invokes
ea25da48086d3b Paolo Valente 2017-04-19  654  	 * bfq_del_bfqq_busy, thereb=
y removing bfqq and its entity
ea25da48086d3b Paolo Valente 2017-04-19  655  	 * from data structures rela=
ted to current group. Otherwise we
ea25da48086d3b Paolo Valente 2017-04-19  656  	 * need to remove bfqq expli=
citly with bfq_deactivate_bfqq, as
ea25da48086d3b Paolo Valente 2017-04-19  657  	 * we do below.
ea25da48086d3b Paolo Valente 2017-04-19  658  	 */
ea25da48086d3b Paolo Valente 2017-04-19  659  	if (bfqq =3D=3D bfqd->in_ser=
vice_queue)
ea25da48086d3b Paolo Valente 2017-04-19  660  		bfq_bfqq_expire(bfqd, bfqd-=
>in_service_queue,
ea25da48086d3b Paolo Valente 2017-04-19  661  				false, BFQQE_PREEMPTED);
ea25da48086d3b Paolo Valente 2017-04-19  662  =

ea25da48086d3b Paolo Valente 2017-04-19  663  	if (bfq_bfqq_busy(bfqq))
ea25da48086d3b Paolo Valente 2017-04-19  664  		bfq_deactivate_bfqq(bfqd, b=
fqq, false, false);
33a16a9804688b Paolo Valente 2020-02-03  665  	else if (entity->on_st_or_in=
_serv)
ea25da48086d3b Paolo Valente 2017-04-19  666  		bfq_put_idle_entity(bfq_ent=
ity_service_tree(entity), entity);
8f9bebc33dd718 Paolo Valente 2017-06-05  667  	bfqg_and_blkg_put(bfqq_group=
(bfqq));
ea25da48086d3b Paolo Valente 2017-04-19  668  =

d29bd41428cfff Paolo Valente 2021-10-15  669  	if (entity->parent &&
d29bd41428cfff Paolo Valente 2021-10-15 @670  	    entity->parent->last_bfq=
q_created =3D=3D bfqq)
d29bd41428cfff Paolo Valente 2021-10-15  671  		entity->parent->last_bfqq_c=
reated =3D NULL;
d29bd41428cfff Paolo Valente 2021-10-15  672  	else if (bfqd->last_bfqq_cre=
ated =3D=3D bfqq)
d29bd41428cfff Paolo Valente 2021-10-15  673  		bfqd->last_bfqq_created =3D=
 NULL;
d29bd41428cfff Paolo Valente 2021-10-15  674  =

ea25da48086d3b Paolo Valente 2017-04-19  675  	entity->parent =3D bfqg->my_=
entity;
ea25da48086d3b Paolo Valente 2017-04-19  676  	entity->sched_data =3D &bfqg=
->sched_data;
8f9bebc33dd718 Paolo Valente 2017-06-05  677  	/* pin down bfqg and its ass=
ociated blkg  */
8f9bebc33dd718 Paolo Valente 2017-06-05  678  	bfqg_and_blkg_get(bfqg);
ea25da48086d3b Paolo Valente 2017-04-19  679  =

ea25da48086d3b Paolo Valente 2017-04-19  680  	if (bfq_bfqq_busy(bfqq)) {
8cacc5ab3eacf5 Paolo Valente 2019-03-12  681  		if (unlikely(!bfqd->nonrot_=
with_queueing))
ea25da48086d3b Paolo Valente 2017-04-19  682  			bfq_pos_tree_add_move(bfqd=
, bfqq);
ea25da48086d3b Paolo Valente 2017-04-19  683  		bfq_activate_bfqq(bfqd, bfq=
q);
ea25da48086d3b Paolo Valente 2017-04-19  684  	}
ea25da48086d3b Paolo Valente 2017-04-19  685  =

ea25da48086d3b Paolo Valente 2017-04-19  686  	if (!bfqd->in_service_queue =
&& !bfqd->rq_in_driver)
ea25da48086d3b Paolo Valente 2017-04-19  687  		bfq_schedule_dispatch(bfqd);
fd1bb3ae54a9a2 Paolo Valente 2020-03-21  688  	/* release extra ref taken a=
bove, bfqq may happen to be freed now */
ecedd3d7e19911 Paolo Valente 2020-02-03  689  	bfq_put_queue(bfqq);
ea25da48086d3b Paolo Valente 2017-04-19  690  }
ea25da48086d3b Paolo Valente 2017-04-19  691  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1954269712116170584==--

