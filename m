Content-Type: multipart/mixed; boundary="===============4519142497793585914=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1589/1734] fs/btrfs/scrub.c:3439 scrub_simple_mirror() error: uninitialized symbol 'ret'.
Date: Wed, 26 Jan 2022 21:46:39 +0800
Message-ID: <202201262100.aK94YOSk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4519142497793585914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: b5b99b1e02969ddd0950356ae1561a73bc377021 [1589/1734] btrfs: introdu=
ce dedicated helper to scrub simple-mirror based range
:::::: branch date: 33 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220126/202201262100.aK94YOSk-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/scrub.c:3439 scrub_simple_mirror() error: uninitialized symbol 're=
t'.

vim +/ret +3439 fs/btrfs/scrub.c

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
--===============4519142497793585914==--

