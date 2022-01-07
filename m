Content-Type: multipart/mixed; boundary="===============1224203258076799674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] btrfs: introduce dedicated helper to scrub simple-mirror based range
Date: Sat, 08 Jan 2022 05:30:35 +0800
Message-ID: <202201080544.TLYM1kb2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1224203258076799674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-m001-20220107 (https://download.01.org/0day-ci/ar=
chive/20220108/202201080544.TLYM1kb2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/scrub.c:3439 scrub_simple_mirror() error: uninitialized symbol 're=
t'.

vim +/ret +3439 fs/btrfs/scrub.c

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
--===============1224203258076799674==--

