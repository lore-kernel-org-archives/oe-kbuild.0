Content-Type: multipart/mixed; boundary="===============7429523230033238124=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.17/block 47/67] block/bfq-iosched.c:631:11: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 28 Nov 2021 08:44:36 +0800
Message-ID: <202111280850.yCY1JxwS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7429523230033238124==
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
head:   a77f46727daa3febf99663ab1a43c86cf3c2b957
commit: 3d7a7c45e29d5d1f5a9622557acb47443e8b6e28 [47/67] bfq: Limit number =
of requests consumed by each cgroup
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20211127 (https://download.01.org/0day-ci/arc=
hive/20211128/202111280850.yCY1JxwS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3D3d7a7c45e29d5d1f5a9622557acb47443e8b6e28
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/ker=
nel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-5.17/block
        git checkout 3d7a7c45e29d5d1f5a9622557acb47443e8b6e28
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^
   net/decnet/dn_route.c:875:6: note: 'fi' is null
           if (fi) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/decnet/dn_route.c:875:2: note: '?' condition is false
           if (fi) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/decnet/dn_route.c:875:2: note: Taking false branch
           if (fi) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_route.c:883:6: note: Assuming 'dev' is equal to null
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/decnet/dn_route.c:883:18: note: Left side of '&&' is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
                           ^
   net/decnet/dn_route.c:883:2: note: '?' condition is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/decnet/dn_route.c:883:6: note: 'dev' is equal to null
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/decnet/dn_route.c:883:18: note: Left side of '&&' is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
                           ^
   net/decnet/dn_route.c:883:2: note: '?' condition is false
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/decnet/dn_route.c:883:2: note: Taking false branch
           if (dev !=3D NULL && rt->n =3D=3D NULL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/decnet/dn_route.c:890:39: note: Access to field 'mtu' results in a d=
ereference of a null pointer (loaded from field 'dev')
           if (dst_metric(&rt->dst, RTAX_MTU) > rt->dst.dev->mtu)
                                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> block/bfq-iosched.c:631:11: warning: Division by zero [clang-analyzer-co=
re.DivideZero]
                   limit =3D DIV_ROUND_CLOSEST(limit * entity->weight, wsum=
);
                           ^
   include/linux/math.h:92:26: note: expanded from macro 'DIV_ROUND_CLOSEST'
                   (((__x) + ((__d) / 2)) / (__d)) :       \
                    ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   block/bfq-iosched.c:583:6: note: Assuming field 'on_st_or_in_serv' is tr=
ue
           if (!entity->on_st_or_in_serv)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/bfq-iosched.c:583:2: note: '?' condition is false
           if (!entity->on_st_or_in_serv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   block/bfq-iosched.c:583:15: note: Field 'on_st_or_in_serv' is true
           if (!entity->on_st_or_in_serv)
                        ^
   block/bfq-iosched.c:583:2: note: '?' condition is false
           if (!entity->on_st_or_in_serv)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   block/bfq-iosched.c:583:2: note: Taking false branch
           if (!entity->on_st_or_in_serv)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   block/bfq-iosched.c:588:6: note: Assuming 'depth' is <=3D 16
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   block/bfq-iosched.c:588:2: note: '?' condition is false
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   block/bfq-iosched.c:588:6: note: 'depth' is <=3D 16
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   block/bfq-iosched.c:588:2: note: '?' condition is false
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   block/bfq-iosched.c:588:2: note: Taking false branch
           if (depth > BFQ_LIMIT_INLINE_DEPTH) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
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

vim +631 block/bfq-iosched.c

3d7a7c45e29d5d Jan Kara 2021-11-25  569  =

3d7a7c45e29d5d Jan Kara 2021-11-25  570  #ifdef CONFIG_BFQ_GROUP_IOSCHED
3d7a7c45e29d5d Jan Kara 2021-11-25  571  static bool bfqq_request_over_limi=
t(struct bfq_queue *bfqq, int limit)
3d7a7c45e29d5d Jan Kara 2021-11-25  572  {
3d7a7c45e29d5d Jan Kara 2021-11-25  573  	struct bfq_data *bfqd =3D bfqq->b=
fqd;
3d7a7c45e29d5d Jan Kara 2021-11-25  574  	struct bfq_entity *entity =3D &bf=
qq->entity;
3d7a7c45e29d5d Jan Kara 2021-11-25  575  	struct bfq_entity *inline_entitie=
s[BFQ_LIMIT_INLINE_DEPTH];
3d7a7c45e29d5d Jan Kara 2021-11-25  576  	struct bfq_entity **entities =3D =
inline_entities;
3d7a7c45e29d5d Jan Kara 2021-11-25  577  	int depth, level;
3d7a7c45e29d5d Jan Kara 2021-11-25  578  	int class_idx =3D bfqq->ioprio_cl=
ass - 1;
3d7a7c45e29d5d Jan Kara 2021-11-25  579  	struct bfq_sched_data *sched_data;
3d7a7c45e29d5d Jan Kara 2021-11-25  580  	unsigned long wsum;
3d7a7c45e29d5d Jan Kara 2021-11-25  581  	bool ret =3D false;
3d7a7c45e29d5d Jan Kara 2021-11-25  582  =

3d7a7c45e29d5d Jan Kara 2021-11-25  583  	if (!entity->on_st_or_in_serv)
3d7a7c45e29d5d Jan Kara 2021-11-25  584  		return false;
3d7a7c45e29d5d Jan Kara 2021-11-25  585  =

3d7a7c45e29d5d Jan Kara 2021-11-25  586  	/* +1 for bfqq entity, root cgrou=
p not included */
3d7a7c45e29d5d Jan Kara 2021-11-25  587  	depth =3D bfqg_to_blkg(bfqq_group=
(bfqq))->blkcg->css.cgroup->level + 1;
3d7a7c45e29d5d Jan Kara 2021-11-25  588  	if (depth > BFQ_LIMIT_INLINE_DEPT=
H) {
3d7a7c45e29d5d Jan Kara 2021-11-25  589  		entities =3D kmalloc_array(depth=
, sizeof(*entities), GFP_NOIO);
3d7a7c45e29d5d Jan Kara 2021-11-25  590  		if (!entities)
3d7a7c45e29d5d Jan Kara 2021-11-25  591  			return false;
3d7a7c45e29d5d Jan Kara 2021-11-25  592  	}
3d7a7c45e29d5d Jan Kara 2021-11-25  593  =

3d7a7c45e29d5d Jan Kara 2021-11-25  594  	spin_lock_irq(&bfqd->lock);
3d7a7c45e29d5d Jan Kara 2021-11-25  595  	sched_data =3D entity->sched_data;
3d7a7c45e29d5d Jan Kara 2021-11-25  596  	/* Gather our ancestors as we nee=
d to traverse them in reverse order */
3d7a7c45e29d5d Jan Kara 2021-11-25  597  	level =3D 0;
3d7a7c45e29d5d Jan Kara 2021-11-25  598  	for_each_entity(entity) {
3d7a7c45e29d5d Jan Kara 2021-11-25  599  		/*
3d7a7c45e29d5d Jan Kara 2021-11-25  600  		 * If at some level entity is no=
t even active, allow request
3d7a7c45e29d5d Jan Kara 2021-11-25  601  		 * queueing so that BFQ knows th=
ere's work to do and activate
3d7a7c45e29d5d Jan Kara 2021-11-25  602  		 * entities.
3d7a7c45e29d5d Jan Kara 2021-11-25  603  		 */
3d7a7c45e29d5d Jan Kara 2021-11-25  604  		if (!entity->on_st_or_in_serv)
3d7a7c45e29d5d Jan Kara 2021-11-25  605  			goto out;
3d7a7c45e29d5d Jan Kara 2021-11-25  606  		/* Uh, more parents than cgroup =
subsystem thinks? */
3d7a7c45e29d5d Jan Kara 2021-11-25  607  		if (WARN_ON_ONCE(level >=3D dept=
h))
3d7a7c45e29d5d Jan Kara 2021-11-25  608  			break;
3d7a7c45e29d5d Jan Kara 2021-11-25  609  		entities[level++] =3D entity;
3d7a7c45e29d5d Jan Kara 2021-11-25  610  	}
3d7a7c45e29d5d Jan Kara 2021-11-25  611  	WARN_ON_ONCE(level !=3D depth);
3d7a7c45e29d5d Jan Kara 2021-11-25  612  	for (level--; level >=3D 0; level=
--) {
3d7a7c45e29d5d Jan Kara 2021-11-25  613  		entity =3D entities[level];
3d7a7c45e29d5d Jan Kara 2021-11-25  614  		if (level > 0) {
3d7a7c45e29d5d Jan Kara 2021-11-25  615  			wsum =3D bfq_entity_service_tre=
e(entity)->wsum;
3d7a7c45e29d5d Jan Kara 2021-11-25  616  		} else {
3d7a7c45e29d5d Jan Kara 2021-11-25  617  			int i;
3d7a7c45e29d5d Jan Kara 2021-11-25  618  			/*
3d7a7c45e29d5d Jan Kara 2021-11-25  619  			 * For bfqq itself we take into=
 account service trees
3d7a7c45e29d5d Jan Kara 2021-11-25  620  			 * of all higher priority class=
es and multiply their
3d7a7c45e29d5d Jan Kara 2021-11-25  621  			 * weights so that low prio que=
ue from higher class
3d7a7c45e29d5d Jan Kara 2021-11-25  622  			 * gets more requests than high=
 prio queue from lower
3d7a7c45e29d5d Jan Kara 2021-11-25  623  			 * class.
3d7a7c45e29d5d Jan Kara 2021-11-25  624  			 */
3d7a7c45e29d5d Jan Kara 2021-11-25  625  			wsum =3D 0;
3d7a7c45e29d5d Jan Kara 2021-11-25  626  			for (i =3D 0; i <=3D class_idx;=
 i++) {
3d7a7c45e29d5d Jan Kara 2021-11-25  627  				wsum =3D wsum * IOPRIO_BE_NR +
3d7a7c45e29d5d Jan Kara 2021-11-25  628  					sched_data->service_tree[i].w=
sum;
3d7a7c45e29d5d Jan Kara 2021-11-25  629  			}
3d7a7c45e29d5d Jan Kara 2021-11-25  630  		}
3d7a7c45e29d5d Jan Kara 2021-11-25 @631  		limit =3D DIV_ROUND_CLOSEST(limi=
t * entity->weight, wsum);
3d7a7c45e29d5d Jan Kara 2021-11-25  632  		if (entity->allocated >=3D limit=
) {
3d7a7c45e29d5d Jan Kara 2021-11-25  633  			bfq_log_bfqq(bfqq->bfqd, bfqq,
3d7a7c45e29d5d Jan Kara 2021-11-25  634  				"too many requests: allocated =
%d limit %d level %d",
3d7a7c45e29d5d Jan Kara 2021-11-25  635  				entity->allocated, limit, leve=
l);
3d7a7c45e29d5d Jan Kara 2021-11-25  636  			ret =3D true;
3d7a7c45e29d5d Jan Kara 2021-11-25  637  			break;
3d7a7c45e29d5d Jan Kara 2021-11-25  638  		}
3d7a7c45e29d5d Jan Kara 2021-11-25  639  	}
3d7a7c45e29d5d Jan Kara 2021-11-25  640  out:
3d7a7c45e29d5d Jan Kara 2021-11-25  641  	spin_unlock_irq(&bfqd->lock);
3d7a7c45e29d5d Jan Kara 2021-11-25  642  	if (entities !=3D inline_entities)
3d7a7c45e29d5d Jan Kara 2021-11-25  643  		kfree(entities);
3d7a7c45e29d5d Jan Kara 2021-11-25  644  	return ret;
3d7a7c45e29d5d Jan Kara 2021-11-25  645  }
3d7a7c45e29d5d Jan Kara 2021-11-25  646  #else
3d7a7c45e29d5d Jan Kara 2021-11-25  647  static bool bfqq_request_over_limi=
t(struct bfq_queue *bfqq, int limit)
3d7a7c45e29d5d Jan Kara 2021-11-25  648  {
3d7a7c45e29d5d Jan Kara 2021-11-25  649  	return false;
3d7a7c45e29d5d Jan Kara 2021-11-25  650  }
3d7a7c45e29d5d Jan Kara 2021-11-25  651  #endif
3d7a7c45e29d5d Jan Kara 2021-11-25  652  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7429523230033238124==--

