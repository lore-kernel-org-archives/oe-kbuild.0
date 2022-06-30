Content-Type: multipart/mixed; boundary="===============1464559439177311342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/bfq-cgroup.c:670:6: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 01 Jul 2022 06:27:06 +0800
Message-ID: <202207010623.OxutEnVC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1464559439177311342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/bfq=
-cgroup.c:670:6: warning: Use of memory after it is freed [clang-analyzer-u=
nix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Valente <paolo.valente@linaro.org>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1a0e93df1e107dc766fdf86ae88076efd9f376e6
commit: d29bd41428cfff9b582c248db14a47e2be8457a8 block, bfq: reset last_bfq=
q_created on group change
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220625 (https://download.01.org/0day-ci/archi=
ve/20220701/202207010623.OxutEnVC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7dd=
b428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd29bd41428cfff9b582c248db14a47e2be8457a8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d29bd41428cfff9b582c248db14a47e2be8457a8
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/hfs/bnode.c:381:6: note: Assuming the condition is false
           if (off !=3D sizeof(struct hfs_bnode_desc))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:381:2: note: Taking false branch
           if (off !=3D sizeof(struct hfs_bnode_desc))
           ^
   fs/hfs/bnode.c:383:14: note: Assuming 'i' is <=3D field 'num_recs'
           for (i =3D 1; i <=3D node->num_recs; off =3D next_off, i++) {
                       ^~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:383:2: note: Loop condition is true.  Entering loop body
           for (i =3D 1; i <=3D node->num_recs; off =3D next_off, i++) {
           ^
   fs/hfs/bnode.c:386:7: note: Assuming 'next_off' is > 'off'
                   if (next_off <=3D off ||
                       ^~~~~~~~~~~~~~~
   fs/hfs/bnode.c:386:7: note: Left side of '||' is false
   fs/hfs/bnode.c:387:7: note: Assuming 'next_off' is <=3D field 'node_size'
                       next_off > tree->node_size ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:386:7: note: Left side of '||' is false
                   if (next_off <=3D off ||
                       ^
   fs/hfs/bnode.c:388:7: note: Assuming the condition is false
                       next_off & 1)
                       ^~~~~~~~~~~~
   fs/hfs/bnode.c:386:3: note: Taking false branch
                   if (next_off <=3D off ||
                   ^
   fs/hfs/bnode.c:391:13: note: Field 'type' is equal to HFS_NODE_INDEX
                   if (node->type !=3D HFS_NODE_INDEX &&
                             ^
   fs/hfs/bnode.c:391:36: note: Left side of '&&' is false
                   if (node->type !=3D HFS_NODE_INDEX &&
                                                    ^
   fs/hfs/bnode.c:394:14: note: Calling 'hfs_bnode_read_u8'
                   key_size =3D hfs_bnode_read_u8(node, off) + 1;
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:55:2: note: 'data' declared without an initial value
           u8 data;
           ^~~~~~~
   fs/hfs/bnode.c:57:2: note: Calling 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:30:2: note: Loop condition is true.  Entering loop body
           for (bytes_read =3D 0; bytes_read < len; bytes_read +=3D bytes_t=
o_read) {
           ^
   fs/hfs/bnode.c:31:7: note: Assuming 'pagenum' is >=3D field 'pages_per_b=
node'
                   if (pagenum >=3D node->tree->pages_per_bnode)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:31:3: note: Taking true branch
                   if (pagenum >=3D node->tree->pages_per_bnode)
                   ^
   fs/hfs/bnode.c:32:4: note:  Execution continues on line 31
                           break;
                           ^
   fs/hfs/bnode.c:43:1: note: Returning without writing to '*buf'
   }
   ^
   fs/hfs/bnode.c:57:2: note: Returning from 'hfs_bnode_read'
           hfs_bnode_read(node, &data, off, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:58:2: note: Undefined or garbage value returned to caller
           return data;
           ^      ~~~~
   fs/hfs/bnode.c:179:4: warning: Value stored to 'tmp' is never read [clan=
g-analyzer-deadcode.DeadStores]
                           tmp =3D hfs_bnode_read_u8(node, key_off);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/hfs/bnode.c:179:4: note: Value stored to 'tmp' is never read
                           tmp =3D hfs_bnode_read_u8(node, key_off);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   block/bfq-wf2q.c:263:7: warning: Access to field 'my_sched_data' results=
 in a dereference of a null pointer (loaded from variable 'entity') [clang-=
analyzer-core.NullDereference]
           if (!entity->my_sched_data)
                ^
   block/bfq-wf2q.c:1508:2: note: 'entity' initialized to a null pointer va=
lue
           struct bfq_entity *entity =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:6: note: Assuming the condition is false
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:2: note: Taking false branch
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
           ^
   block/bfq-wf2q.c:1521:2: note: Loop condition is false. Execution contin=
ues on line 1582
           for (; sd ; sd =3D entity->my_sched_data) {
           ^
   block/bfq-wf2q.c:1582:28: note: Passing null pointer value via 1st param=
eter 'entity'
           bfqq =3D bfq_entity_to_bfqq(entity);
                                     ^~~~~~
   block/bfq-wf2q.c:1582:9: note: Calling 'bfq_entity_to_bfqq'
           bfqq =3D bfq_entity_to_bfqq(entity);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:263:7: note: Access to field 'my_sched_data' results in=
 a dereference of a null pointer (loaded from variable 'entity')
           if (!entity->my_sched_data)
                ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
   block/bfq-cgroup.c:663:6: note: Assuming the condition is true
           if (bfq_bfqq_busy(bfqq))
               ^~~~~~~~~~~~~~~~~~~
   block/bfq-cgroup.c:663:2: note: Taking true branch
           if (bfq_bfqq_busy(bfqq))
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
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1464559439177311342==--

