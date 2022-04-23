Content-Type: multipart/mixed; boundary="===============3850704974220490750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-cleanup-part3 153/174] fs/btrfs/scrub.c:3416:9: warning: Uninitialized variable: ret [uninitvar]
Date: Sun, 24 Apr 2022 01:20:03 +0800
Message-ID: <202204240138.uYaIT5HG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3850704974220490750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: David Sterba <dsterba@suse.com>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-cleanup-part3
head:   50401c1bd218c77092656710b2fc11b3b246679f
commit: a5a1b794bfc6bb041a95bc86869a8c4540f193dd [153/174] btrfs: introduce=
 dedicated helper to scrub simple-mirror based range
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a5a1b794bfc6bb041a95bc86869a8c4540f193dd
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/btrfs/scrub.c:1220:13: warning: Parameter 'raid_map' can be declared =
with const [constParameter]
          u64 *raid_map,
               ^
>> fs/btrfs/scrub.c:3416:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   fs/btrfs/scrub.c:3314:21: note: Assuming condition is false
    while (cur_logical < logical_end) {
                       ^
   fs/btrfs/scrub.c:3416:9: note: Uninitialized variable: ret
    return ret;
           ^

vim +3416 fs/btrfs/scrub.c

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3281  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3282  /*
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3283   * Scrub one range which can o=
nly has simple mirror based profile.
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3284   * (Including all range in SIN=
GLE/DUP/RAID1/RAID1C*, and each stripe in
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3285   *  RAID0/RAID10).
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3286   *
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3287   * Since we may need to handle=
 a subset of block group, we need @logical_start
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3288   * and @logical_length paramet=
er.
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3289   */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3290  static int scrub_simple_mirror=
(struct scrub_ctx *sctx,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3291  				struct btrfs_root *extent_=
root,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3292  				struct btrfs_root *csum_ro=
ot,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3293  				struct btrfs_block_group *=
bg,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3294  				struct map_lookup *map,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3295  				u64 logical_start, u64 log=
ical_length,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3296  				struct btrfs_device *devic=
e,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3297  				u64 physical, int mirror_n=
um)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3298  {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3299  	struct btrfs_fs_info *fs_info=
 =3D sctx->fs_info;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3300  	const u64 logical_end =3D log=
ical_start + logical_length;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3301  	/* An artificial limit, inher=
it from old scrub behavior */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3302  	const u32 max_length =3D SZ_6=
4K;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3303  	struct btrfs_path path =3D {};
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3304  	u64 cur_logical =3D logical_s=
tart;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3305  	int ret;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3306  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3307  	/* The range must be inside t=
he bg */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3308  	ASSERT(logical_start >=3D bg-=
>start &&
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3309  	       logical_end <=3D bg->s=
tart + bg->length);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3310  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3311  	path.search_commit_root =3D 1;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3312  	path.skip_locking =3D 1;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3313  	/* Go through each extent ite=
ms inside the logical range */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3314  	while (cur_logical < logical_=
end) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3315  		int cur_mirror =3D mirror_nu=
m;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3316  		struct btrfs_device *target_=
dev =3D device;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3317  		u64 extent_start;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3318  		u64 extent_len;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3319  		u64 extent_flags;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3320  		u64 extent_gen;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3321  		u64 scrub_len;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3322  		u64 cur_physical;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3323  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3324  		/* Canceled ? */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3325  		if (atomic_read(&fs_info->sc=
rub_cancel_req) ||
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3326  		    atomic_read(&sctx->cance=
l_req)) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3327  			ret =3D -ECANCELED;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3328  			break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3329  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3330  		/* Paused ? */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3331  		if (atomic_read(&fs_info->sc=
rub_pause_req)) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3332  			/* Push queued extents */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3333  			sctx->flush_all_writes =3D =
true;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3334  			scrub_submit(sctx);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3335  			mutex_lock(&sctx->wr_lock);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3336  			scrub_wr_submit(sctx);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3337  			mutex_unlock(&sctx->wr_lock=
);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3338  			wait_event(sctx->list_wait,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3339  				   atomic_read(&sctx->bios=
_in_flight) =3D=3D 0);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3340  			sctx->flush_all_writes =3D =
false;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3341  			scrub_blocked_if_needed(fs_=
info);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3342  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3343  		/* Block group removed? */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3344  		spin_lock(&bg->lock);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3345  		if (bg->removed) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3346  			spin_unlock(&bg->lock);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3347  			ret =3D 0;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3348  			break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3349  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3350  		spin_unlock(&bg->lock);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3351  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3352  		ret =3D find_first_extent_it=
em(extent_root, &path, cur_logical,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3353  					     logical_end - cur_lo=
gical);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3354  		if (ret > 0) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3355  			/* No more extent, just upd=
ate the accounting */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3356  			sctx->stat.last_physical =
=3D physical + logical_length;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3357  			ret =3D 0;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3358  			break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3359  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3360  		if (ret < 0)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3361  			break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3362  		get_extent_info(&path, &exte=
nt_start, &extent_len,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3363  				&extent_flags, &extent_gen=
);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3364  		/* Skip hole range which doe=
sn't have any extent */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3365  		cur_logical =3D max(extent_s=
tart, cur_logical);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3366  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3367  		/*
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3368  		 * Scrub len has three limit=
s:
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3369  		 * - Extent size limit
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3370  		 * - Scrub range limit
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3371  		 *   This is especially impo=
ratant for RAID0/RAID10 to reuse
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3372  		 *   this function
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3373  		 * - Max scrub size limit
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3374  		 */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3375  		scrub_len =3D min(min(extent=
_start + extent_len,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3376  				    logical_end), cur_logi=
cal + max_length) -
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3377  			    cur_logical;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3378  		cur_physical =3D cur_logical=
 - logical_start + physical;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3379  =

a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3380  		if (sctx->is_dev_replace)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3381  			scrub_remap_extent(fs_info,=
 cur_logical, scrub_len,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3382  					   &cur_physical, &target=
_dev, &cur_mirror);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3383  		if (extent_flags & BTRFS_EXT=
ENT_FLAG_DATA) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3384  			ret =3D btrfs_lookup_csums_=
range(csum_root, cur_logical,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3385  					cur_logical + scrub_len -=
 1,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3386  					&sctx->csum_list, 1);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3387  			if (ret)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3388  				break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3389  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3390  		if ((extent_flags & BTRFS_EX=
TENT_FLAG_TREE_BLOCK) &&
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3391  		    does_range_cross_boundar=
y(extent_start, extent_len,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3392  					      logical_start, logi=
cal_length)) {
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3393  			btrfs_err(fs_info,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3394  "scrub: tree block %llu spanni=
ng boundaries, ignored. boundary=3D[%llu, %llu)",
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3395  				  extent_start, logical_st=
art, logical_end);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3396  			spin_lock(&sctx->stat_lock);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3397  			sctx->stat.uncorrectable_er=
rors++;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3398  			spin_unlock(&sctx->stat_loc=
k);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3399  			cur_logical +=3D scrub_len;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3400  			continue;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3401  		}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3402  		ret =3D scrub_extent(sctx, m=
ap, cur_logical, scrub_len, cur_physical,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3403  				   target_dev, extent_flag=
s, extent_gen,
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3404  				   cur_mirror, cur_logical=
 - logical_start +
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3405  				   physical);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3406  		scrub_free_csums(sctx);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3407  		if (ret)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3408  			break;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3409  		if (sctx->is_dev_replace)
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3410  			sync_replace_for_zoned(sctx=
);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3411  		cur_logical +=3D scrub_len;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3412  		/* Don't hold CPU for too lo=
ng time */
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3413  		cond_resched();
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3414  	}
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3415  	btrfs_release_path(&path);
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11 @3416  	return ret;
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3417  }
a5a1b794bfc6bb04 Qu Wenruo 2022-03-11  3418  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3850704974220490750==--

