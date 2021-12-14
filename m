Content-Type: multipart/mixed; boundary="===============1773290586689146936=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.17/block 47/90] block/bfq-iosched.c:631:11: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Tue, 14 Dec 2021 08:22:02 +0800
Message-ID: <202112140819.J39hWlei-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1773290586689146936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Michal Koutn=C3=BD" <mkoutny@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.17/block
head:   0ba4566cd8a4e645b542e6ddbe3dd26c85ad2408
commit: 76f1df88bbc2f984eb0418cc90de0a8384e63604 [47/90] bfq: Limit number =
of requests consumed by each cgroup
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20211212 (https://download.01.org/0day-ci/arc=
hive/20211214/202112140819.J39hWlei-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3D76f1df88bbc2f984eb0418cc90de0a8384e63604
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/ker=
nel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-5.17/block
        git checkout 76f1df88bbc2f984eb0418cc90de0a8384e63604
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3347:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(device)) {
                       ^~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3347:3: note: Taking true branch
                   if (IS_ERR(device)) {
                   ^
   fs/btrfs/extent_io.c:3349:4: note: Control jumps to line 3356
                           goto error;
                           ^
   fs/btrfs/extent_io.c:3356:2: note: Null pointer value stored to 'bio_ctr=
l.bio'
           bio_ctrl->bio =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3407:10: note: Returning from 'alloc_new_bio'
                           ret =3D alloc_new_bio(inode, bio_ctrl, wbc, opf,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3411:8: note: 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~
   fs/btrfs/extent_io.c:3411:4: note: Taking false branch
                           if (ret < 0)
                           ^
   fs/btrfs/extent_io.c:3418:3: note: Taking false branch
                   if (bio_flags & EXTENT_BIO_COMPRESSED)
                   ^
   fs/btrfs/extent_io.c:3423:12: note: Calling 'btrfs_bio_add_page'
                           added =3D btrfs_bio_add_page(bio_ctrl, page,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3211:2: note: 'bio' initialized to a null pointer v=
alue
           struct bio *bio =3D bio_ctrl->bio;
           ^~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3212:17: note: Dereference of null pointer
           u32 bio_size =3D bio->bi_iter.bi_size;
                          ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:5698:4: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent_io.c:5698:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/usb/dwc2/hcd.c:2893:2: warning: Value stored to 'qspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:2893:2: note: Value stored to 'qspcavail' is neve=
r read
           qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:2895:2: warning: Value stored to 'fspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:2895:2: note: Value stored to 'fspcavail' is neve=
r read
           fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3023:2: warning: Value stored to 'qspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3023:2: note: Value stored to 'qspcavail' is neve=
r read
           qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3025:2: warning: Value stored to 'fspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3025:2: note: Value stored to 'fspcavail' is neve=
r read
           fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3083:3: warning: Value stored to 'qspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3083:3: note: Value stored to 'qspcavail' is neve=
r read
                   qspcavail =3D (tx_status & TXSTS_QSPCAVAIL_MASK) >>
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3085:3: warning: Value stored to 'fspcavail' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3085:3: note: Value stored to 'fspcavail' is neve=
r read
                   fspcavail =3D (tx_status & TXSTS_FSPCAVAIL_MASK) >>
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3682:4: warning: Value stored to 'hprt0' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           hprt0 =3D dwc2_read_hprt0(hsotg);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:3682:4: note: Value stored to 'hprt0' is never re=
ad
                           hprt0 =3D dwc2_read_hprt0(hsotg);
                           ^       ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:5679:2: warning: Value stored to 'hprt0' is never=
 read [clang-analyzer-deadcode.DeadStores]
           hprt0 =3D dwc2_readl(hsotg, HPRT0);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.c:5679:2: note: Value stored to 'hprt0' is never re=
ad
           hprt0 =3D dwc2_readl(hsotg, HPRT0);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   11 warnings generated.
>> block/bfq-iosched.c:631:11: warning: Division by zero [clang-analyzer-co=
re.DivideZero]
                   limit =3D DIV_ROUND_CLOSEST(limit * entity->weight, wsum=
);
                           ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                                          ^
   block/bfq-iosched.c:672:27: note: Assuming 'bic' is non-null
           struct bfq_queue *bfqq =3D bic ? bic_to_bfqq(bic, op_is_sync(op)=
) : NULL;
                                    ^~~
   block/bfq-iosched.c:672:27: note: '?' condition is true
   block/bfq-iosched.c:677:6: note: Assuming the condition is true
           if (op_is_sync(op) && !op_is_write(op)) {
               ^~~~~~~~~~~~~~
   block/bfq-iosched.c:677:6: note: Left side of '&&' is true
   block/bfq-iosched.c:677:24: note: Assuming the condition is true
           if (op_is_sync(op) && !op_is_write(op)) {
                                 ^~~~~~~~~~~~~~~~
   block/bfq-iosched.c:677:2: note: Taking true branch
           if (op_is_sync(op) && !op_is_write(op)) {
           ^
   block/bfq-iosched.c:689:6: note: Assuming 'bfqq' is non-null
           if (bfqq && bfqq_request_over_limit(bfqq, limit))
               ^~~~
   block/bfq-iosched.c:689:6: note: Left side of '&&' is true
   block/bfq-iosched.c:689:14: note: Calling 'bfqq_request_over_limit'
           if (bfqq && bfqq_request_over_limit(bfqq, limit))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:583:6: note: Assuming field 'on_st_or_in_serv' is tr=
ue
           if (!entity->on_st_or_in_serv)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:583:2: note: Taking false branch
           if (!entity->on_st_or_in_serv)
           ^
   block/bfq-iosched.c:588:6: note: Assuming 'depth' is <=3D BFQ_LIMIT_INLI=
NE_DEPTH
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:588:2: note: Taking false branch
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
           ^
   block/bfq-iosched.c:598:2: note: Loop condition is true.  Entering loop =
body
           for_each_entity(entity) {
           ^
   block/bfq-iosched.h:1028:2: note: expanded from macro 'for_each_entity'
           for (; entity ; entity =3D entity->parent)
           ^
   block/bfq-iosched.c:604:7: note: Assuming field 'on_st_or_in_serv' is tr=
ue
                   if (!entity->on_st_or_in_serv)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-iosched.c:604:3: note: Taking false branch
                   if (!entity->on_st_or_in_serv)
                   ^
   block/bfq-iosched.c:607:20: note: Assuming 'level' is < 'depth'
                   if (WARN_ON_ONCE(level >=3D depth))
                                    ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   block/bfq-iosched.c:607:7: note: Taking false branch
                   if (WARN_ON_ONCE(level >=3D depth))
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   block/bfq-iosched.c:607:3: note: Taking false branch
                   if (WARN_ON_ONCE(level >=3D depth))
                   ^
   block/bfq-iosched.c:598:2: note: Loop condition is false. Execution cont=
inues on line 611
           for_each_entity(entity) {
           ^
   block/bfq-iosched.h:1028:2: note: expanded from macro 'for_each_entity'
           for (; entity ; entity =3D entity->parent)
           ^
   block/bfq-iosched.c:611:15: note: Assuming 'level' is equal to 'depth'
           WARN_ON_ONCE(level !=3D depth);
                        ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   block/bfq-iosched.c:611:2: note: Taking false branch
           WARN_ON_ONCE(level !=3D depth);
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   block/bfq-iosched.c:612:2: note: Loop condition is true.  Entering loop =
body
           for (level--; level >=3D 0; level--) {
           ^
   block/bfq-iosched.c:614:7: note: 'level' is <=3D 0
                   if (level > 0) {
                       ^~~~~
   block/bfq-iosched.c:614:3: note: Taking false branch
                   if (level > 0) {
                   ^
   block/bfq-iosched.c:625:4: note: The value 0 is assigned to 'wsum'
                           wsum =3D 0;
                           ^~~~~~~~
   block/bfq-iosched.c:626:16: note: Assuming 'i' is > 'class_idx'
                           for (i =3D 0; i <=3D class_idx; i++) {
                                       ^~~~~~~~~~~~~~
   block/bfq-iosched.c:626:4: note: Loop condition is false. Execution cont=
inues on line 631
                           for (i =3D 0; i <=3D class_idx; i++) {

vim +631 block/bfq-iosched.c

76f1df88bbc2f9 Jan Kara 2021-11-25  569  =

76f1df88bbc2f9 Jan Kara 2021-11-25  570  #ifdef CONFIG_BFQ_GROUP_IOSCHED
76f1df88bbc2f9 Jan Kara 2021-11-25  571  static bool bfqq_request_over_limi=
t(struct bfq_queue *bfqq, int limit)
76f1df88bbc2f9 Jan Kara 2021-11-25  572  {
76f1df88bbc2f9 Jan Kara 2021-11-25  573  	struct bfq_data *bfqd =3D bfqq->b=
fqd;
76f1df88bbc2f9 Jan Kara 2021-11-25  574  	struct bfq_entity *entity =3D &bf=
qq->entity;
76f1df88bbc2f9 Jan Kara 2021-11-25  575  	struct bfq_entity *inline_entitie=
s[BFQ_LIMIT_INLINE_DEPTH];
76f1df88bbc2f9 Jan Kara 2021-11-25  576  	struct bfq_entity **entities =3D =
inline_entities;
76f1df88bbc2f9 Jan Kara 2021-11-25  577  	int depth, level;
76f1df88bbc2f9 Jan Kara 2021-11-25  578  	int class_idx =3D bfqq->ioprio_cl=
ass - 1;
76f1df88bbc2f9 Jan Kara 2021-11-25  579  	struct bfq_sched_data *sched_data;
76f1df88bbc2f9 Jan Kara 2021-11-25  580  	unsigned long wsum;
76f1df88bbc2f9 Jan Kara 2021-11-25  581  	bool ret =3D false;
76f1df88bbc2f9 Jan Kara 2021-11-25  582  =

76f1df88bbc2f9 Jan Kara 2021-11-25  583  	if (!entity->on_st_or_in_serv)
76f1df88bbc2f9 Jan Kara 2021-11-25  584  		return false;
76f1df88bbc2f9 Jan Kara 2021-11-25  585  =

76f1df88bbc2f9 Jan Kara 2021-11-25  586  	/* +1 for bfqq entity, root cgrou=
p not included */
76f1df88bbc2f9 Jan Kara 2021-11-25  587  	depth =3D bfqg_to_blkg(bfqq_group=
(bfqq))->blkcg->css.cgroup->level + 1;
76f1df88bbc2f9 Jan Kara 2021-11-25  588  	if (depth > BFQ_LIMIT_INLINE_DEPT=
H) {
76f1df88bbc2f9 Jan Kara 2021-11-25  589  		entities =3D kmalloc_array(depth=
, sizeof(*entities), GFP_NOIO);
76f1df88bbc2f9 Jan Kara 2021-11-25  590  		if (!entities)
76f1df88bbc2f9 Jan Kara 2021-11-25  591  			return false;
76f1df88bbc2f9 Jan Kara 2021-11-25  592  	}
76f1df88bbc2f9 Jan Kara 2021-11-25  593  =

76f1df88bbc2f9 Jan Kara 2021-11-25  594  	spin_lock_irq(&bfqd->lock);
76f1df88bbc2f9 Jan Kara 2021-11-25  595  	sched_data =3D entity->sched_data;
76f1df88bbc2f9 Jan Kara 2021-11-25  596  	/* Gather our ancestors as we nee=
d to traverse them in reverse order */
76f1df88bbc2f9 Jan Kara 2021-11-25  597  	level =3D 0;
76f1df88bbc2f9 Jan Kara 2021-11-25  598  	for_each_entity(entity) {
76f1df88bbc2f9 Jan Kara 2021-11-25  599  		/*
76f1df88bbc2f9 Jan Kara 2021-11-25  600  		 * If at some level entity is no=
t even active, allow request
76f1df88bbc2f9 Jan Kara 2021-11-25  601  		 * queueing so that BFQ knows th=
ere's work to do and activate
76f1df88bbc2f9 Jan Kara 2021-11-25  602  		 * entities.
76f1df88bbc2f9 Jan Kara 2021-11-25  603  		 */
76f1df88bbc2f9 Jan Kara 2021-11-25  604  		if (!entity->on_st_or_in_serv)
76f1df88bbc2f9 Jan Kara 2021-11-25  605  			goto out;
76f1df88bbc2f9 Jan Kara 2021-11-25  606  		/* Uh, more parents than cgroup =
subsystem thinks? */
76f1df88bbc2f9 Jan Kara 2021-11-25  607  		if (WARN_ON_ONCE(level >=3D dept=
h))
76f1df88bbc2f9 Jan Kara 2021-11-25  608  			break;
76f1df88bbc2f9 Jan Kara 2021-11-25  609  		entities[level++] =3D entity;
76f1df88bbc2f9 Jan Kara 2021-11-25  610  	}
76f1df88bbc2f9 Jan Kara 2021-11-25  611  	WARN_ON_ONCE(level !=3D depth);
76f1df88bbc2f9 Jan Kara 2021-11-25  612  	for (level--; level >=3D 0; level=
--) {
76f1df88bbc2f9 Jan Kara 2021-11-25  613  		entity =3D entities[level];
76f1df88bbc2f9 Jan Kara 2021-11-25  614  		if (level > 0) {
76f1df88bbc2f9 Jan Kara 2021-11-25  615  			wsum =3D bfq_entity_service_tre=
e(entity)->wsum;
76f1df88bbc2f9 Jan Kara 2021-11-25  616  		} else {
76f1df88bbc2f9 Jan Kara 2021-11-25  617  			int i;
76f1df88bbc2f9 Jan Kara 2021-11-25  618  			/*
76f1df88bbc2f9 Jan Kara 2021-11-25  619  			 * For bfqq itself we take into=
 account service trees
76f1df88bbc2f9 Jan Kara 2021-11-25  620  			 * of all higher priority class=
es and multiply their
76f1df88bbc2f9 Jan Kara 2021-11-25  621  			 * weights so that low prio que=
ue from higher class
76f1df88bbc2f9 Jan Kara 2021-11-25  622  			 * gets more requests than high=
 prio queue from lower
76f1df88bbc2f9 Jan Kara 2021-11-25  623  			 * class.
76f1df88bbc2f9 Jan Kara 2021-11-25  624  			 */
76f1df88bbc2f9 Jan Kara 2021-11-25  625  			wsum =3D 0;
76f1df88bbc2f9 Jan Kara 2021-11-25  626  			for (i =3D 0; i <=3D class_idx;=
 i++) {
76f1df88bbc2f9 Jan Kara 2021-11-25  627  				wsum =3D wsum * IOPRIO_BE_NR +
76f1df88bbc2f9 Jan Kara 2021-11-25  628  					sched_data->service_tree[i].w=
sum;
76f1df88bbc2f9 Jan Kara 2021-11-25  629  			}
76f1df88bbc2f9 Jan Kara 2021-11-25  630  		}
76f1df88bbc2f9 Jan Kara 2021-11-25 @631  		limit =3D DIV_ROUND_CLOSEST(limi=
t * entity->weight, wsum);
76f1df88bbc2f9 Jan Kara 2021-11-25  632  		if (entity->allocated >=3D limit=
) {
76f1df88bbc2f9 Jan Kara 2021-11-25  633  			bfq_log_bfqq(bfqq->bfqd, bfqq,
76f1df88bbc2f9 Jan Kara 2021-11-25  634  				"too many requests: allocated =
%d limit %d level %d",
76f1df88bbc2f9 Jan Kara 2021-11-25  635  				entity->allocated, limit, leve=
l);
76f1df88bbc2f9 Jan Kara 2021-11-25  636  			ret =3D true;
76f1df88bbc2f9 Jan Kara 2021-11-25  637  			break;
76f1df88bbc2f9 Jan Kara 2021-11-25  638  		}
76f1df88bbc2f9 Jan Kara 2021-11-25  639  	}
76f1df88bbc2f9 Jan Kara 2021-11-25  640  out:
76f1df88bbc2f9 Jan Kara 2021-11-25  641  	spin_unlock_irq(&bfqd->lock);
76f1df88bbc2f9 Jan Kara 2021-11-25  642  	if (entities !=3D inline_entities)
76f1df88bbc2f9 Jan Kara 2021-11-25  643  		kfree(entities);
76f1df88bbc2f9 Jan Kara 2021-11-25  644  	return ret;
76f1df88bbc2f9 Jan Kara 2021-11-25  645  }
76f1df88bbc2f9 Jan Kara 2021-11-25  646  #else
76f1df88bbc2f9 Jan Kara 2021-11-25  647  static bool bfqq_request_over_limi=
t(struct bfq_queue *bfqq, int limit)
76f1df88bbc2f9 Jan Kara 2021-11-25  648  {
76f1df88bbc2f9 Jan Kara 2021-11-25  649  	return false;
76f1df88bbc2f9 Jan Kara 2021-11-25  650  }
76f1df88bbc2f9 Jan Kara 2021-11-25  651  #endif
76f1df88bbc2f9 Jan Kara 2021-11-25  652  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1773290586689146936==--

