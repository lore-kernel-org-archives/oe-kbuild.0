Content-Type: multipart/mixed; boundary="===============2554836457171368078=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1589/1734] fs/btrfs/scrub.c:3439:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Wed, 26 Jan 2022 12:56:33 +0800
Message-ID: <202201261205.VZBLOgrq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2554836457171368078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: b5b99b1e02969ddd0950356ae1561a73bc377021 [1589/1734] btrfs: introdu=
ce dedicated helper to scrub simple-mirror based range
:::::: branch date: 24 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201261205.VZBLOgrq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db5b99b1e02969ddd0950356ae1561a73bc377021
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b5b99b1e02969ddd0950356ae1561a73bc377021
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   fs/btrfs/scrub.c:3746:9: note: Assuming 'ret' is 0
                                   if (ret)
                                       ^~~
   fs/btrfs/scrub.c:3746:5: note: Taking false branch
                                   if (ret)
                                   ^
   fs/btrfs/scrub.c:3750:10: note: Calling 'scrub_extent'
                           ret =3D scrub_extent(sctx, map, extent_logical, =
extent_len,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   fs/btrfs/scrub.c:2541:2: note: Taking true branch
           if (flags & BTRFS_EXTENT_FLAG_DATA) {
           ^
   fs/btrfs/scrub.c:2542:3: note: Taking false branch
                   if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK)
                   ^
   fs/btrfs/scrub.c:2564:2: note: Loop condition is true.  Entering loop bo=
dy
           while (len) {
           ^
   fs/btrfs/scrub.c:2565:11: note: Assuming '__UNIQUE_ID___x1411' is >=3D '=
__UNIQUE_ID___y1412'
                   u32 l =3D min(len, blocksize);
                           ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/btrfs/scrub.c:2565:11: note: '?' condition is false
                   u32 l =3D min(len, blocksize);
                           ^
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
   fs/btrfs/scrub.c:2568:3: note: Taking true branch
                   if (flags & BTRFS_EXTENT_FLAG_DATA) {
                   ^
   fs/btrfs/scrub.c:2570:16: note: Calling 'scrub_find_csum'
                           have_csum =3D scrub_find_csum(sctx, logical, csu=
m);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2491:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&sctx->csum_list)) {
           ^
   fs/btrfs/scrub.c:2499:7: note: Assuming 'logical' is >=3D field 'bytenr'
                   if (sum->bytenr > logical)
                       ^~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2499:3: note: Taking false branch
                   if (sum->bytenr > logical)
                   ^
   fs/btrfs/scrub.c:2508:7: note: Assuming the condition is true
                   if (sum->bytenr + sum->len <=3D logical) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2508:3: note: Taking true branch
                   if (sum->bytenr + sum->len <=3D logical) {
                   ^
   fs/btrfs/scrub.c:2509:4: note: Calling 'drop_csum_range'
                           drop_csum_range(sctx, sum);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2473:2: note: Memory is released
           kfree(sum);
           ^~~~~~~~~~
   fs/btrfs/scrub.c:2509:4: note: Returning; memory was released
                           drop_csum_range(sctx, sum);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2510:4: note:  Execution continues on line 2491
                           continue;
                           ^
   fs/btrfs/scrub.c:2491:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&sctx->csum_list)) {
           ^
   fs/btrfs/scrub.c:2499:7: note: Use of memory after it is freed
                   if (sum->bytenr > logical)
                       ^~~~~~~~~~~
   fs/btrfs/scrub.c:2754:3: warning: Value stored to 'stripe_nr' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   stripe_nr =3D div_u64_rem(stripe_nr, map->num_stripes, &=
rot);
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/scrub.c:2754:3: note: Value stored to 'stripe_nr' is never read
                   stripe_nr =3D div_u64_rem(stripe_nr, map->num_stripes, &=
rot);
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/scrub.c:3104:3: warning: Value stored to 'stop_loop' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   stop_loop =3D 0;
                   ^           ~
   fs/btrfs/scrub.c:3104:3: note: Value stored to 'stop_loop' is never read
                   stop_loop =3D 0;
                   ^           ~
>> fs/btrfs/scrub.c:3439:2: warning: Undefined or garbage value returned to=
 caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   fs/btrfs/scrub.c:3488:6: note: Assuming the condition is false
           if (map->type & BTRFS_BLOCK_GROUP_RAID0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:3488:2: note: Taking false branch
           if (map->type & BTRFS_BLOCK_GROUP_RAID0) {
           ^
   fs/btrfs/scrub.c:3491:13: note: Assuming the condition is false
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID10) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:3491:9: note: Taking false branch
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID10) {
                  ^
   fs/btrfs/scrub.c:3496:13: note: Assuming the condition is false
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID1_MASK) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:3496:9: note: Taking false branch
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID1_MASK) {
                  ^
   fs/btrfs/scrub.c:3498:13: note: Assuming the condition is false
           } else if (map->type & BTRFS_BLOCK_GROUP_DUP) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:3498:9: note: Taking false branch
           } else if (map->type & BTRFS_BLOCK_GROUP_DUP) {
                  ^
   fs/btrfs/scrub.c:3500:13: note: Assuming the condition is false
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:3500:9: note: Taking false branch
           } else if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
                  ^
   fs/btrfs/scrub.c:3507:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/scrub.c:3507:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/scrub.c:3521:2: note: Taking false branch
           if (map->type & BTRFS_BLOCK_GROUP_RAID56_MASK) {
           ^
   fs/btrfs/scrub.c:3528:2: note: Loop condition is false.  Exiting loop
           wait_event(sctx->list_wait,
           ^
   include/linux/wait.h:342:2: note: expanded from macro 'wait_event'
           might_sleep();                                                  =
        \
           ^
   include/linux/kernel.h:129:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   fs/btrfs/scrub.c:3529:6: note: Assuming the condition is false
                      atomic_read(&sctx->bios_in_flight) =3D=3D 0);
                      ^
   include/linux/wait.h:343:6: note: expanded from macro 'wait_event'
           if (condition)                                                  =
        \
               ^~~~~~~~~
   fs/btrfs/scrub.c:3528:2: note: Taking false branch
           wait_event(sctx->list_wait,
           ^
   include/linux/wait.h:343:2: note: expanded from macro 'wait_event'
           if (condition)                                                  =
        \
           ^
   fs/btrfs/scrub.c:3528:2: note: '?' condition is false
           wait_event(sctx->list_wait,
           ^
   include/linux/wait.h:345:2: note: expanded from macro 'wait_event'
           __wait_event(wq_head, condition);                               =
        \
           ^
   include/linux/wait.h:325:64: note: expanded from macro '__wait_event'
           (void)___wait_event(wq_head, condition, TASK_UNINTERRUPTIBLE, 0,=
 0,     \
                                                                         ^
   fs/btrfs/scrub.c:3528:2: note: Loop condition is true.  Entering loop bo=
dy
           wait_event(sctx->list_wait,
           ^
   include/linux/wait.h:345:2: note: expanded from macro 'wait_event'
           __wait_event(wq_head, condition);                               =
        \
           ^
   include/linux/wait.h:325:8: note: expanded from macro '__wait_event'
           (void)___wait_event(wq_head, condition, TASK_UNINTERRUPTIBLE, 0,=
 0,     \
                 ^
   include/linux/wait.h:307:2: note: expanded from macro '___wait_event'
           for (;;) {                                                      =
        \
           ^
   fs/btrfs/scrub.c:3529:6: note: Assuming the condition is true
                      atomic_read(&sctx->bios_in_flight) =3D=3D 0);
                      ^
   include/linux/wait.h:345:24: note: expanded from macro 'wait_event'
           __wait_event(wq_head, condition);                               =
        \
                                 ^~~~~~~~~
   include/linux/wait.h:325:31: note: expanded from macro '__wait_event'
           (void)___wait_event(wq_head, condition, TASK_UNINTERRUPTIBLE, 0,=
 0,     \
                                        ^~~~~~~~~
   include/linux/wait.h:310:7: note: expanded from macro '___wait_event'
                   if (condition)                                          =
        \
                       ^~~~~~~~~
   fs/btrfs/scrub.c:3528:2: note: Taking true branch
           wait_event(sctx->list_wait,
           ^
   include/linux/wait.h:345:2: note: expanded from macro 'wait_event'
           __wait_event(wq_head, condition);                               =
        \

vim +3439 fs/btrfs/scrub.c

b5b99b1e02969d Qu Wenruo 2022-01-07  3304  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3305  /*
b5b99b1e02969d Qu Wenruo 2022-01-07  3306   * Scrub one range which can onl=
y has simple mirror based profile.
b5b99b1e02969d Qu Wenruo 2022-01-07  3307   * (Including all range in SINGL=
E/DUP/RAID1/RAID1C*, and each stripe in
b5b99b1e02969d Qu Wenruo 2022-01-07  3308   *  RAID0/RAID10).
b5b99b1e02969d Qu Wenruo 2022-01-07  3309   *
b5b99b1e02969d Qu Wenruo 2022-01-07  3310   * Since we may need to handle a=
 subset of block group, we need @logical_start
b5b99b1e02969d Qu Wenruo 2022-01-07  3311   * and @logical_length parameter.
b5b99b1e02969d Qu Wenruo 2022-01-07  3312   */
b5b99b1e02969d Qu Wenruo 2022-01-07  3313  static int scrub_simple_mirror(s=
truct scrub_ctx *sctx,
b5b99b1e02969d Qu Wenruo 2022-01-07  3314  				struct btrfs_root *extent_ro=
ot,
b5b99b1e02969d Qu Wenruo 2022-01-07  3315  				struct btrfs_root *csum_root,
b5b99b1e02969d Qu Wenruo 2022-01-07  3316  				struct btrfs_block_group *bg,
b5b99b1e02969d Qu Wenruo 2022-01-07  3317  				struct map_lookup *map,
b5b99b1e02969d Qu Wenruo 2022-01-07  3318  				u64 logical_start, u64 logic=
al_length,
b5b99b1e02969d Qu Wenruo 2022-01-07  3319  				struct btrfs_device *device,
b5b99b1e02969d Qu Wenruo 2022-01-07  3320  				u64 physical, int mirror_num)
b5b99b1e02969d Qu Wenruo 2022-01-07  3321  {
b5b99b1e02969d Qu Wenruo 2022-01-07  3322  	struct btrfs_fs_info *fs_info =
=3D sctx->fs_info;
b5b99b1e02969d Qu Wenruo 2022-01-07  3323  	const u64 logical_end =3D logic=
al_start + logical_length;
b5b99b1e02969d Qu Wenruo 2022-01-07  3324  	/* An artificial limit, inherit=
 from old scrub behavior */
b5b99b1e02969d Qu Wenruo 2022-01-07  3325  	const u32 max_length =3D SZ_64K;
b5b99b1e02969d Qu Wenruo 2022-01-07  3326  	struct btrfs_path path =3D {};
b5b99b1e02969d Qu Wenruo 2022-01-07  3327  	u64 cur_logical =3D logical_sta=
rt;
b5b99b1e02969d Qu Wenruo 2022-01-07  3328  	int ret;
b5b99b1e02969d Qu Wenruo 2022-01-07  3329  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3330  	/* The range must be inside the=
 bg */
b5b99b1e02969d Qu Wenruo 2022-01-07  3331  	ASSERT(logical_start >=3D bg->s=
tart &&
b5b99b1e02969d Qu Wenruo 2022-01-07  3332  	       logical_end <=3D bg->sta=
rt + bg->length);
b5b99b1e02969d Qu Wenruo 2022-01-07  3333  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3334  	path.search_commit_root =3D 1;
b5b99b1e02969d Qu Wenruo 2022-01-07  3335  	path.skip_locking =3D 1;
b5b99b1e02969d Qu Wenruo 2022-01-07  3336  	/* Go through each */
b5b99b1e02969d Qu Wenruo 2022-01-07  3337  	while (cur_logical < logical_en=
d) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3338  		int cur_mirror =3D mirror_num;
b5b99b1e02969d Qu Wenruo 2022-01-07  3339  		struct btrfs_device *target_de=
v =3D device;
b5b99b1e02969d Qu Wenruo 2022-01-07  3340  		u64 extent_start;
b5b99b1e02969d Qu Wenruo 2022-01-07  3341  		u64 extent_len;
b5b99b1e02969d Qu Wenruo 2022-01-07  3342  		u64 extent_flags;
b5b99b1e02969d Qu Wenruo 2022-01-07  3343  		u64 extent_gen;
b5b99b1e02969d Qu Wenruo 2022-01-07  3344  		u64 scrub_len;
b5b99b1e02969d Qu Wenruo 2022-01-07  3345  		u64 cur_physical;
b5b99b1e02969d Qu Wenruo 2022-01-07  3346  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3347  		/* Canceled ? */
b5b99b1e02969d Qu Wenruo 2022-01-07  3348  		if (atomic_read(&fs_info->scru=
b_cancel_req) ||
b5b99b1e02969d Qu Wenruo 2022-01-07  3349  		    atomic_read(&sctx->cancel_=
req)) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3350  			ret =3D -ECANCELED;
b5b99b1e02969d Qu Wenruo 2022-01-07  3351  			break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3352  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3353  		/* Paused ? */
b5b99b1e02969d Qu Wenruo 2022-01-07  3354  		if (atomic_read(&fs_info->scru=
b_pause_req)) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3355  			/* Push queued extents */
b5b99b1e02969d Qu Wenruo 2022-01-07  3356  			sctx->flush_all_writes =3D tr=
ue;
b5b99b1e02969d Qu Wenruo 2022-01-07  3357  			scrub_submit(sctx);
b5b99b1e02969d Qu Wenruo 2022-01-07  3358  			mutex_lock(&sctx->wr_lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3359  			scrub_wr_submit(sctx);
b5b99b1e02969d Qu Wenruo 2022-01-07  3360  			mutex_unlock(&sctx->wr_lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3361  			wait_event(sctx->list_wait,
b5b99b1e02969d Qu Wenruo 2022-01-07  3362  				   atomic_read(&sctx->bios_i=
n_flight) =3D=3D 0);
b5b99b1e02969d Qu Wenruo 2022-01-07  3363  			sctx->flush_all_writes =3D fa=
lse;
b5b99b1e02969d Qu Wenruo 2022-01-07  3364  			scrub_blocked_if_needed(fs_in=
fo);
b5b99b1e02969d Qu Wenruo 2022-01-07  3365  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3366  		/* Block group removed? */
b5b99b1e02969d Qu Wenruo 2022-01-07  3367  		spin_lock(&bg->lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3368  		if (bg->removed) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3369  			spin_unlock(&bg->lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3370  			ret =3D 0;
b5b99b1e02969d Qu Wenruo 2022-01-07  3371  			break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3372  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3373  		spin_unlock(&bg->lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3374  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3375  		ret =3D find_first_extent_item=
(extent_root, &path, cur_logical,
b5b99b1e02969d Qu Wenruo 2022-01-07  3376  					     logical_end - cur_logi=
cal);
b5b99b1e02969d Qu Wenruo 2022-01-07  3377  		if (ret > 0) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3378  			/* No more extent, just updat=
e the accounting */
b5b99b1e02969d Qu Wenruo 2022-01-07  3379  			sctx->stat.last_physical =3D =
physical + logical_length;
b5b99b1e02969d Qu Wenruo 2022-01-07  3380  			ret =3D 0;
b5b99b1e02969d Qu Wenruo 2022-01-07  3381  			break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3382  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3383  		if (ret < 0)
b5b99b1e02969d Qu Wenruo 2022-01-07  3384  			break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3385  		get_extent_info(&path, &extent=
_start, &extent_len,
b5b99b1e02969d Qu Wenruo 2022-01-07  3386  				&extent_flags, &extent_gen);
b5b99b1e02969d Qu Wenruo 2022-01-07  3387  		/* Skip hole range which doesn=
't have any extent */
b5b99b1e02969d Qu Wenruo 2022-01-07  3388  		cur_logical =3D max(extent_sta=
rt, cur_logical);
b5b99b1e02969d Qu Wenruo 2022-01-07  3389  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3390  		/*
b5b99b1e02969d Qu Wenruo 2022-01-07  3391  		 * Scrub len has three limits:
b5b99b1e02969d Qu Wenruo 2022-01-07  3392  		 * - Extent size limit
b5b99b1e02969d Qu Wenruo 2022-01-07  3393  		 * - Scrub range limit
b5b99b1e02969d Qu Wenruo 2022-01-07  3394  		 *   This is especially impora=
tant for RAID0/RAID10 to reuse
b5b99b1e02969d Qu Wenruo 2022-01-07  3395  		 *   this function
b5b99b1e02969d Qu Wenruo 2022-01-07  3396  		 * - Max scrub size limit
b5b99b1e02969d Qu Wenruo 2022-01-07  3397  		 */
b5b99b1e02969d Qu Wenruo 2022-01-07  3398  		scrub_len =3D min(min(extent_s=
tart + extent_len,
b5b99b1e02969d Qu Wenruo 2022-01-07  3399  				    logical_end), cur_logica=
l + max_length) -
b5b99b1e02969d Qu Wenruo 2022-01-07  3400  			    cur_logical;
b5b99b1e02969d Qu Wenruo 2022-01-07  3401  		cur_physical =3D cur_logical -=
 logical_start + physical;
b5b99b1e02969d Qu Wenruo 2022-01-07  3402  =

b5b99b1e02969d Qu Wenruo 2022-01-07  3403  		if (sctx->is_dev_replace)
b5b99b1e02969d Qu Wenruo 2022-01-07  3404  			scrub_remap_extent(fs_info, c=
ur_logical, scrub_len,
b5b99b1e02969d Qu Wenruo 2022-01-07  3405  					   &cur_physical, &target_d=
ev, &cur_mirror);
b5b99b1e02969d Qu Wenruo 2022-01-07  3406  		if (extent_flags & BTRFS_EXTEN=
T_FLAG_DATA) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3407  			ret =3D btrfs_lookup_csums_ra=
nge(csum_root, cur_logical,
b5b99b1e02969d Qu Wenruo 2022-01-07  3408  					cur_logical + scrub_len - 1,
b5b99b1e02969d Qu Wenruo 2022-01-07  3409  					&sctx->csum_list, 1);
b5b99b1e02969d Qu Wenruo 2022-01-07  3410  			if (ret)
b5b99b1e02969d Qu Wenruo 2022-01-07  3411  				break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3412  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3413  		if ((extent_flags & BTRFS_EXTE=
NT_FLAG_TREE_BLOCK) &&
b5b99b1e02969d Qu Wenruo 2022-01-07  3414  		    does_range_cross_boundary(=
extent_start, extent_len,
b5b99b1e02969d Qu Wenruo 2022-01-07  3415  					      logical_start, logica=
l_length)) {
b5b99b1e02969d Qu Wenruo 2022-01-07  3416  			btrfs_err(fs_info,
b5b99b1e02969d Qu Wenruo 2022-01-07  3417  "scrub: tree block %llu spanning=
 boundaries, ignored. boundary=3D[%llu, %llu)",
b5b99b1e02969d Qu Wenruo 2022-01-07  3418  				  extent_start, logical_star=
t, logical_end);
b5b99b1e02969d Qu Wenruo 2022-01-07  3419  			spin_lock(&sctx->stat_lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3420  			sctx->stat.uncorrectable_erro=
rs++;
b5b99b1e02969d Qu Wenruo 2022-01-07  3421  			spin_unlock(&sctx->stat_lock);
b5b99b1e02969d Qu Wenruo 2022-01-07  3422  			cur_logical +=3D scrub_len;
b5b99b1e02969d Qu Wenruo 2022-01-07  3423  			continue;
b5b99b1e02969d Qu Wenruo 2022-01-07  3424  		}
b5b99b1e02969d Qu Wenruo 2022-01-07  3425  		ret =3D scrub_extent(sctx, map=
, cur_logical, scrub_len, cur_physical,
b5b99b1e02969d Qu Wenruo 2022-01-07  3426  				   target_dev, extent_flags,=
 extent_gen,
b5b99b1e02969d Qu Wenruo 2022-01-07  3427  				   cur_mirror, cur_logical -=
 logical_start +
b5b99b1e02969d Qu Wenruo 2022-01-07  3428  				   physical);
b5b99b1e02969d Qu Wenruo 2022-01-07  3429  		scrub_free_csums(sctx);
b5b99b1e02969d Qu Wenruo 2022-01-07  3430  		if (ret)
b5b99b1e02969d Qu Wenruo 2022-01-07  3431  			break;
b5b99b1e02969d Qu Wenruo 2022-01-07  3432  		if (sctx->is_dev_replace)
b5b99b1e02969d Qu Wenruo 2022-01-07  3433  			sync_replace_for_zoned(sctx);
b5b99b1e02969d Qu Wenruo 2022-01-07  3434  		cur_logical +=3D scrub_len;
b5b99b1e02969d Qu Wenruo 2022-01-07  3435  		/* Don't hold CPU for too long=
 time */
b5b99b1e02969d Qu Wenruo 2022-01-07  3436  		cond_resched();
b5b99b1e02969d Qu Wenruo 2022-01-07  3437  	}
b5b99b1e02969d Qu Wenruo 2022-01-07  3438  	btrfs_release_path(&path);
b5b99b1e02969d Qu Wenruo 2022-01-07 @3439  	return ret;
b5b99b1e02969d Qu Wenruo 2022-01-07  3440  }
b5b99b1e02969d Qu Wenruo 2022-01-07  3441  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2554836457171368078==--

