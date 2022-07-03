Content-Type: multipart/mixed; boundary="===============6582553941817069140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/bfq-iosched.c:631:11: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 03 Jul 2022 22:47:02 +0800
Message-ID: <202207032249.nYpcQ5V6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6582553941817069140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: block/bfq=
-iosched.c:631:11: warning: Division by zero [clang-analyzer-core.DivideZer=
o]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Michal Koutn=C3=BD" <mkoutny@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69cb6c6556ad89620547318439d6be8bb1629a5a
commit: 76f1df88bbc2f984eb0418cc90de0a8384e63604 bfq: Limit number of reque=
sts consumed by each cgroup
date:   7 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220625 (https://download.01.org/0day-ci/archi=
ve/20220703/202207032249.nYpcQ5V6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7dd=
b428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D76f1df88bbc2f984eb0418cc90de0a8384e63604
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 76f1df88bbc2f984eb0418cc90de0a8384e63604
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (bio_add_page(bio, page, length, 0) < length) {
           ^
   fs/mpage.c:641:2: note: Assuming the condition is true
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/mpage.c:641:2: note: Taking false branch
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/mpage.c:641:2: note: Loop condition is false.  Exiting loop
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/mpage.c:644:6: note: 'boundary' is 0
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
               ^~~~~~~~
   fs/mpage.c:644:6: note: Left side of '||' is false
   fs/mpage.c:644:19: note: 'first_unmapped' is equal to 'blocks_per_page'
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
                            ^~~~~~~~~~~~~~
   fs/mpage.c:644:2: note: Taking false branch
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
           ^
   fs/mpage.c:651:26: note: Assigned value is garbage or undefined
                   mpd->last_block_in_bio =3D blocks[blocks_per_page - 1];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/gud/gud_pipe.c:596:33: warning: Access to field 'width' =
results in a dereference of a null pointer (loaded from variable 'fb') [cla=
ng-analyzer-core.NullDereference]
                           drm_rect_init(&damage, 0, 0, fb->width, fb->heig=
ht);
                                                        ^~
   drivers/gpu/drm/gud/gud_pipe.c:566:2: note: 'fb' initialized here
           struct drm_framebuffer *fb =3D state->fb;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:571:6: note: Assuming field 'mode_changed=
' is false
           if (crtc->state->mode_changed || !crtc->state->enable) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:571:6: note: Left side of '||' is false
   drivers/gpu/drm/gud/gud_pipe.c:571:35: note: Assuming field 'enable' is =
true
           if (crtc->state->mode_changed || !crtc->state->enable) {
                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:571:2: note: Taking false branch
           if (crtc->state->mode_changed || !crtc->state->enable) {
           ^
   drivers/gpu/drm/gud/gud_pipe.c:582:6: note: Assuming the condition is fa=
lse
           if (!drm_dev_enter(drm, &idx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:582:2: note: Taking false branch
           if (!drm_dev_enter(drm, &idx))
           ^
   drivers/gpu/drm/gud/gud_pipe.c:585:6: note: Assuming field 'fb' is non-n=
ull
           if (!old_state->fb)
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:585:2: note: Taking false branch
           if (!old_state->fb)
           ^
   drivers/gpu/drm/gud/gud_pipe.c:588:6: note: Assuming 'fb' is null
           if (fb && (crtc->state->mode_changed || crtc->state->connectors_=
changed))
               ^~
   drivers/gpu/drm/gud/gud_pipe.c:588:9: note: Left side of '&&' is false
           if (fb && (crtc->state->mode_changed || crtc->state->connectors_=
changed))
                  ^
   drivers/gpu/drm/gud/gud_pipe.c:591:6: note: Assuming field 'active_chang=
ed' is false
           if (crtc->state->active_changed)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:591:2: note: Taking false branch
           if (crtc->state->active_changed)
           ^
   drivers/gpu/drm/gud/gud_pipe.c:594:6: note: Assuming the condition is tr=
ue
           if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:594:2: note: Taking true branch
           if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
           ^
   drivers/gpu/drm/gud/gud_pipe.c:595:7: note: Assuming the condition is tr=
ue
                   if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_pipe.c:595:3: note: Taking true branch
                   if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
                   ^
   drivers/gpu/drm/gud/gud_pipe.c:596:33: note: Access to field 'width' res=
ults in a dereference of a null pointer (loaded from variable 'fb')
                           drm_rect_init(&damage, 0, 0, fb->width, fb->heig=
ht);
                                                        ^~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   block/bfq-iosched.c:607:7: note: '__ret_do_once' is false
                   if (WARN_ON_ONCE(level >=3D depth))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   block/bfq-iosched.c:607:7: note: Left side of '&&' is false
                   if (WARN_ON_ONCE(level >=3D depth))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   block/bfq-iosched.c:607:7: note: Taking false branch
                   if (WARN_ON_ONCE(level >=3D depth))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6582553941817069140==--

