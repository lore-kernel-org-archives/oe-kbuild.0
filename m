Content-Type: multipart/mixed; boundary="===============3035383349623705585=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] btrfs: introduce dedicated helper to scrub simple-mirror based range
Date: Sun, 09 Jan 2022 02:44:05 +0800
Message-ID: <202201090238.jMvq9rxL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3035383349623705585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220107023430.28288-3-wqu@suse.com>
References: <20220107023430.28288-3-wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>

Hi Qu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20220107]
[cannot apply to v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-refactor-s=
crub-entrances-for-each-profile/20220107-103545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201090238.jMvq9rxL-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f8636fcdd5f4ab273a4104075=
6d783403a2eb055
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qu-Wenruo/btrfs-refactor-scrub-ent=
rances-for-each-profile/20220107-103545
        git checkout f8636fcdd5f4ab273a41040756d783403a2eb055
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/btrfs/scrub.c:3741:4: note: Taking true branch
                           if (flags & BTRFS_EXTENT_FLAG_DATA) {
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
   fs/btrfs/scrub.c:2565:11: note: Assuming '__UNIQUE_ID___x974' is >=3D '_=
_UNIQUE_ID___y975'
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
                   ^
   fs/btrfs/scrub.c:2754:3: note: Value stored to 'stripe_nr' is never read
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

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3304  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3305  /*
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3306   * Scrub one range which can onl=
y has simple mirror based profile.
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3307   * (Including all range in SINGL=
E/DUP/RAID1/RAID1C*, and each stripe in
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3308   *  RAID0/RAID10).
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3309   *
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3310   * Since we may need to handle a=
 subset of block group, we need @logical_start
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3311   * and @logical_length parameter.
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3312   */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3313  static int scrub_simple_mirror(s=
truct scrub_ctx *sctx,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3314  				struct btrfs_root *extent_ro=
ot,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3315  				struct btrfs_root *csum_root,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3316  				struct btrfs_block_group *bg,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3317  				struct map_lookup *map,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3318  				u64 logical_start, u64 logic=
al_length,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3319  				struct btrfs_device *device,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3320  				u64 physical, int mirror_num)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3321  {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3322  	struct btrfs_fs_info *fs_info =
=3D sctx->fs_info;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3323  	const u64 logical_end =3D logic=
al_start + logical_length;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3324  	/* An artificial limit, inherit=
 from old scrub behavior */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3325  	const u32 max_length =3D SZ_64K;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3326  	struct btrfs_path path =3D {};
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3327  	u64 cur_logical =3D logical_sta=
rt;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3328  	int ret;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3329  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3330  	/* The range must be inside the=
 bg */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3331  	ASSERT(logical_start >=3D bg->s=
tart &&
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3332  	       logical_end <=3D bg->sta=
rt + bg->length);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3333  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3334  	path.search_commit_root =3D 1;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3335  	path.skip_locking =3D 1;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3336  	/* Go through each */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3337  	while (cur_logical < logical_en=
d) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3338  		int cur_mirror =3D mirror_num;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3339  		struct btrfs_device *target_de=
v =3D device;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3340  		u64 extent_start;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3341  		u64 extent_len;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3342  		u64 extent_flags;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3343  		u64 extent_gen;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3344  		u64 scrub_len;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3345  		u64 cur_physical;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3346  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3347  		/* Canceled ? */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3348  		if (atomic_read(&fs_info->scru=
b_cancel_req) ||
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3349  		    atomic_read(&sctx->cancel_=
req)) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3350  			ret =3D -ECANCELED;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3351  			break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3352  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3353  		/* Paused ? */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3354  		if (atomic_read(&fs_info->scru=
b_pause_req)) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3355  			/* Push queued extents */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3356  			sctx->flush_all_writes =3D tr=
ue;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3357  			scrub_submit(sctx);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3358  			mutex_lock(&sctx->wr_lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3359  			scrub_wr_submit(sctx);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3360  			mutex_unlock(&sctx->wr_lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3361  			wait_event(sctx->list_wait,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3362  				   atomic_read(&sctx->bios_i=
n_flight) =3D=3D 0);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3363  			sctx->flush_all_writes =3D fa=
lse;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3364  			scrub_blocked_if_needed(fs_in=
fo);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3365  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3366  		/* Block group removed? */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3367  		spin_lock(&bg->lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3368  		if (bg->removed) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3369  			spin_unlock(&bg->lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3370  			ret =3D 0;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3371  			break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3372  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3373  		spin_unlock(&bg->lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3374  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3375  		ret =3D find_first_extent_item=
(extent_root, &path, cur_logical,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3376  					     logical_end - cur_logi=
cal);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3377  		if (ret > 0) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3378  			/* No more extent, just updat=
e the accounting */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3379  			sctx->stat.last_physical =3D =
physical + logical_length;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3380  			ret =3D 0;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3381  			break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3382  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3383  		if (ret < 0)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3384  			break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3385  		get_extent_info(&path, &extent=
_start, &extent_len,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3386  				&extent_flags, &extent_gen);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3387  		/* Skip hole range which doesn=
't have any extent */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3388  		cur_logical =3D max(extent_sta=
rt, cur_logical);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3389  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3390  		/*
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3391  		 * Scrub len has three limits:
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3392  		 * - Extent size limit
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3393  		 * - Scrub range limit
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3394  		 *   This is especially impora=
tant for RAID0/RAID10 to reuse
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3395  		 *   this function
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3396  		 * - Max scrub size limit
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3397  		 */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3398  		scrub_len =3D min(min(extent_s=
tart + extent_len,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3399  				    logical_end), cur_logica=
l + max_length) -
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3400  			    cur_logical;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3401  		cur_physical =3D cur_logical -=
 logical_start + physical;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3402  =

f8636fcdd5f4ab Qu Wenruo 2022-01-07  3403  		if (sctx->is_dev_replace)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3404  			scrub_remap_extent(fs_info, c=
ur_logical, scrub_len,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3405  					   &cur_physical, &target_d=
ev, &cur_mirror);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3406  		if (extent_flags & BTRFS_EXTEN=
T_FLAG_DATA) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3407  			ret =3D btrfs_lookup_csums_ra=
nge(csum_root, cur_logical,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3408  					cur_logical + scrub_len - 1,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3409  					&sctx->csum_list, 1);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3410  			if (ret)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3411  				break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3412  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3413  		if ((extent_flags & BTRFS_EXTE=
NT_FLAG_TREE_BLOCK) &&
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3414  		    does_range_cross_boundary(=
extent_start, extent_len,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3415  			    		      logical_start, lo=
gical_length)) {
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3416  			btrfs_err(fs_info,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3417  "scrub: tree block %llu spanning=
 boundaries, ignored. boundary=3D[%llu, %llu)",
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3418  				  extent_start, logical_star=
t, logical_end);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3419  			spin_lock(&sctx->stat_lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3420  			sctx->stat.uncorrectable_erro=
rs++;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3421  			spin_unlock(&sctx->stat_lock);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3422  			cur_logical +=3D scrub_len;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3423  			continue;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3424  		}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3425  		ret =3D scrub_extent(sctx, map=
, cur_logical, scrub_len, cur_physical,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3426  				   target_dev, extent_flags,=
 extent_gen,
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3427  				   cur_mirror, cur_logical -=
 logical_start +
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3428  				   physical);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3429  		scrub_free_csums(sctx);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3430  		if (ret)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3431  			break;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3432  		if (sctx->is_dev_replace)
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3433  			sync_replace_for_zoned(sctx);
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3434  		cur_logical +=3D scrub_len;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3435  		/* Don't hold CPU for too long=
 time */
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3436  		cond_resched();
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3437  	}
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3438  	btrfs_release_path(&path);
f8636fcdd5f4ab Qu Wenruo 2022-01-07 @3439  	return ret;
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3440  }
f8636fcdd5f4ab Qu Wenruo 2022-01-07  3441  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3035383349623705585==--

