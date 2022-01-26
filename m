Content-Type: multipart/mixed; boundary="===============2227451218612979248=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1591/1734] fs/btrfs/scrub.c:3678 scrub_stripe() error: uninitialized symbol 'offset'.
Date: Thu, 27 Jan 2022 00:59:53 +0800
Message-ID: <202201270045.iXLGJa5t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2227451218612979248==
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
commit: fa676286533c1c414da23d5ef8ae452c7f66e9b7 [1591/1734] btrfs: use scr=
ub_simple_mirror() to handle RAID56 data stripe scrub
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220127/202201270045.iXLGJa5t-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/scrub.c:3678 scrub_stripe() error: uninitialized symbol 'offset'.
fs/btrfs/scrub.c:3680 scrub_stripe() error: uninitialized symbol 'physical_=
end'.

Old smatch warnings:
fs/btrfs/scrub.c:3439 scrub_simple_mirror() error: uninitialized symbol 're=
t'.

vim +/offset +3678 fs/btrfs/scrub.c

38d2dda468be859 Qu Wenruo       2022-01-07  3512  =

d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3513  static noinline_for_stack=
 int scrub_stripe(struct scrub_ctx *sctx,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3514  					   struct btrfs_bloc=
k_group *bg,
a36cf8b8933e4a7 Stefan Behrens  2012-11-02  3515  					   struct map_lookup=
 *map,
a36cf8b8933e4a7 Stefan Behrens  2012-11-02  3516  					   struct btrfs_devi=
ce *scrub_dev,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3517  					   int stripe_index,=
 u64 dev_extent_len)
a2de733c78fa7af Arne Jansen     2011-03-08  3518  {
2522dbe86b54ff0 Qu Wenruo       2021-12-14  3519  	struct btrfs_path *path;
fb456252d3d9c05 Jeff Mahoney    2016-06-22  3520  	struct btrfs_fs_info *fs=
_info =3D sctx->fs_info;
29cbcf401793f4e Josef Bacik     2021-11-05  3521  	struct btrfs_root *root;
fc28b25e1f42865 Josef Bacik     2021-11-05  3522  	struct btrfs_root *csum_=
root;
e7786c3ae517b2c Arne Jansen     2011-05-28  3523  	struct blk_plug plug;
b5b99b1e02969dd Qu Wenruo       2022-01-07  3524  	const u64 profile =3D ma=
p->type & BTRFS_BLOCK_GROUP_PROFILE_MASK;
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3525  	const u64 chunk_logical =
=3D bg->start;
a2de733c78fa7af Arne Jansen     2011-03-08  3526  	int ret;
a2de733c78fa7af Arne Jansen     2011-03-08  3527  	u64 nstripes;
a2de733c78fa7af Arne Jansen     2011-03-08  3528  	u64 physical;
a2de733c78fa7af Arne Jansen     2011-03-08  3529  	u64 logical;
625f1c8dc66d778 Liu Bo          2013-04-27  3530  	u64 logic_end;
3b080b2564287be Wang Shilong    2014-04-01  3531  	u64 physical_end;
fa676286533c1c4 Qu Wenruo       2022-01-07  3532  	u64 increment;	/* The lo=
gical increment after finishing one stripe */
fa676286533c1c4 Qu Wenruo       2022-01-07  3533  	u64 offset;	/* Offset in=
side the chunk */
5a6ac9eacb49143 Miao Xie        2014-11-06  3534  	u64 stripe_logical;
5a6ac9eacb49143 Miao Xie        2014-11-06  3535  	u64 stripe_end;
3b080b2564287be Wang Shilong    2014-04-01  3536  	int stop_loop =3D 0;
53b381b3abeb86f David Woodhouse 2013-01-29  3537  =

a2de733c78fa7af Arne Jansen     2011-03-08  3538  	path =3D btrfs_alloc_pat=
h();
a2de733c78fa7af Arne Jansen     2011-03-08  3539  	if (!path)
a2de733c78fa7af Arne Jansen     2011-03-08  3540  		return -ENOMEM;
a2de733c78fa7af Arne Jansen     2011-03-08  3541  =

b5d67f64f9bc656 Stefan Behrens  2012-03-27  3542  	/*
fa676286533c1c4 Qu Wenruo       2022-01-07  3543  	 * Work on commit root. =
The related disk blocks are static as
b5d67f64f9bc656 Stefan Behrens  2012-03-27  3544  	 * long as COW is applie=
d. This means, it is save to rewrite
b5d67f64f9bc656 Stefan Behrens  2012-03-27  3545  	 * them to repair disk e=
rrors without any race conditions
b5d67f64f9bc656 Stefan Behrens  2012-03-27  3546  	 */
a2de733c78fa7af Arne Jansen     2011-03-08  3547  	path->search_commit_root=
 =3D 1;
a2de733c78fa7af Arne Jansen     2011-03-08  3548  	path->skip_locking =3D 1;
dcf62b204c06ac2 Qu Wenruo       2021-12-14  3549  	path->reada =3D READA_FO=
RWARD;
a2de733c78fa7af Arne Jansen     2011-03-08  3550  =

d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3551  	wait_event(sctx->list_wa=
it,
b6bfebc13218f1f Stefan Behrens  2012-11-02  3552  		   atomic_read(&sctx->b=
ios_in_flight) =3D=3D 0);
cb7ab02156e4ba9 Wang Shilong    2013-12-04  3553  	scrub_blocked_if_needed(=
fs_info);
a2de733c78fa7af Arne Jansen     2011-03-08  3554  =

fa676286533c1c4 Qu Wenruo       2022-01-07  3555  	root =3D btrfs_extent_ro=
ot(fs_info, bg->start);
fa676286533c1c4 Qu Wenruo       2022-01-07  3556  	csum_root =3D btrfs_csum=
_root(fs_info, bg->start);
fc28b25e1f42865 Josef Bacik     2021-11-05  3557  =

a2de733c78fa7af Arne Jansen     2011-03-08  3558  	/*
fa676286533c1c4 Qu Wenruo       2022-01-07  3559  	 * Collect all data csum=
s for the stripe to avoid seeking during
a2de733c78fa7af Arne Jansen     2011-03-08  3560  	 * the scrub. This might=
 currently (crc32) end up to be about 1MB
a2de733c78fa7af Arne Jansen     2011-03-08  3561  	 */
e7786c3ae517b2c Arne Jansen     2011-05-28  3562  	blk_start_plug(&plug);
a2de733c78fa7af Arne Jansen     2011-03-08  3563  =

de17addce7a20db Naohiro Aota    2021-02-04  3564  	if (sctx->is_dev_replace=
 &&
fa676286533c1c4 Qu Wenruo       2022-01-07  3565  	    btrfs_dev_is_sequent=
ial(sctx->wr_tgtdev,
fa676286533c1c4 Qu Wenruo       2022-01-07  3566  				    map->stripes[stri=
pe_index].physical)) {
de17addce7a20db Naohiro Aota    2021-02-04  3567  		mutex_lock(&sctx->wr_lo=
ck);
fa676286533c1c4 Qu Wenruo       2022-01-07  3568  		sctx->write_pointer =3D=
 map->stripes[stripe_index].physical;
de17addce7a20db Naohiro Aota    2021-02-04  3569  		mutex_unlock(&sctx->wr_=
lock);
de17addce7a20db Naohiro Aota    2021-02-04  3570  		sctx->flush_all_writes =
=3D true;
de17addce7a20db Naohiro Aota    2021-02-04  3571  	}
de17addce7a20db Naohiro Aota    2021-02-04  3572  =

b5b99b1e02969dd Qu Wenruo       2022-01-07  3573  	/*
b5b99b1e02969dd Qu Wenruo       2022-01-07  3574  	 * There used to be a bi=
g double loop to handle all profiles using the
b5b99b1e02969dd Qu Wenruo       2022-01-07  3575  	 * same routine, which g=
rows larger and more gross over time.
b5b99b1e02969dd Qu Wenruo       2022-01-07  3576  	 *
b5b99b1e02969dd Qu Wenruo       2022-01-07  3577  	 * So here we handle eac=
h profile differently, so simpler profiles
b5b99b1e02969dd Qu Wenruo       2022-01-07  3578  	 * have simpler scrubing=
 function.
b5b99b1e02969dd Qu Wenruo       2022-01-07  3579  	 */
b5b99b1e02969dd Qu Wenruo       2022-01-07  3580  	if (!(profile & (BTRFS_B=
LOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10 |
b5b99b1e02969dd Qu Wenruo       2022-01-07  3581  			 BTRFS_BLOCK_GROUP_RAI=
D56_MASK))) {
b5b99b1e02969dd Qu Wenruo       2022-01-07  3582  		/*
b5b99b1e02969dd Qu Wenruo       2022-01-07  3583  		 * Above check rules ou=
t all complex profile, the remaining
b5b99b1e02969dd Qu Wenruo       2022-01-07  3584  		 * profiles are SINGLE|=
DUP|RAID1|RAID1C*, which is simple
b5b99b1e02969dd Qu Wenruo       2022-01-07  3585  		 * mirrored duplication=
 without stripe.
b5b99b1e02969dd Qu Wenruo       2022-01-07  3586  		 *
b5b99b1e02969dd Qu Wenruo       2022-01-07  3587  		 * Only @phsyical and @=
mirror_num needs to calculated using
b5b99b1e02969dd Qu Wenruo       2022-01-07  3588  		 * @stripe_index.
b5b99b1e02969dd Qu Wenruo       2022-01-07  3589  		 */
b5b99b1e02969dd Qu Wenruo       2022-01-07  3590  		ret =3D scrub_simple_mi=
rror(sctx, root, csum_root, bg, map,
b5b99b1e02969dd Qu Wenruo       2022-01-07  3591  				bg->start, bg->length=
, scrub_dev,
b5b99b1e02969dd Qu Wenruo       2022-01-07  3592  				map->stripes[stripe_i=
ndex].physical,
b5b99b1e02969dd Qu Wenruo       2022-01-07  3593  				stripe_index + 1);
b5b99b1e02969dd Qu Wenruo       2022-01-07  3594  		goto out;
b5b99b1e02969dd Qu Wenruo       2022-01-07  3595  	}
38d2dda468be859 Qu Wenruo       2022-01-07  3596  	if (profile & (BTRFS_BLO=
CK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10)) {
38d2dda468be859 Qu Wenruo       2022-01-07  3597  		ret =3D scrub_simple_st=
ripe(sctx, root, csum_root, bg, map,
38d2dda468be859 Qu Wenruo       2022-01-07  3598  					  scrub_dev, stripe_=
index);
38d2dda468be859 Qu Wenruo       2022-01-07  3599  		goto out;
38d2dda468be859 Qu Wenruo       2022-01-07  3600  	}
38d2dda468be859 Qu Wenruo       2022-01-07  3601  =

38d2dda468be859 Qu Wenruo       2022-01-07  3602  	/* Only RAID56 goes thro=
ugh the old code */
38d2dda468be859 Qu Wenruo       2022-01-07  3603  	ASSERT(map->type & BTRFS=
_BLOCK_GROUP_RAID56_MASK);
fa676286533c1c4 Qu Wenruo       2022-01-07  3604  =

fa676286533c1c4 Qu Wenruo       2022-01-07  3605  	physical =3D map->stripe=
s[stripe_index].physical;
fa676286533c1c4 Qu Wenruo       2022-01-07  3606  	offset =3D 0;
fa676286533c1c4 Qu Wenruo       2022-01-07  3607  	nstripes =3D div64_u64(d=
ev_extent_len, map->stripe_len);
fa676286533c1c4 Qu Wenruo       2022-01-07  3608  	get_raid56_logic_offset(=
physical, stripe_index, map, &offset, NULL);
fa676286533c1c4 Qu Wenruo       2022-01-07  3609  	increment =3D map->strip=
e_len * nr_data_stripes(map);
fa676286533c1c4 Qu Wenruo       2022-01-07  3610  =

fa676286533c1c4 Qu Wenruo       2022-01-07  3611  	logical =3D chunk_logica=
l + offset;
fa676286533c1c4 Qu Wenruo       2022-01-07  3612  	physical_end =3D physica=
l + nstripes * map->stripe_len;
fa676286533c1c4 Qu Wenruo       2022-01-07  3613  	get_raid56_logic_offset(=
physical_end, stripe_index, map, &logic_end,
fa676286533c1c4 Qu Wenruo       2022-01-07  3614  				NULL);
fa676286533c1c4 Qu Wenruo       2022-01-07  3615  	logic_end +=3D chunk_log=
ical;
fa676286533c1c4 Qu Wenruo       2022-01-07  3616  =

a2de733c78fa7af Arne Jansen     2011-03-08  3617  	ret =3D 0;
a2de733c78fa7af Arne Jansen     2011-03-08  3618  	/*
fa676286533c1c4 Qu Wenruo       2022-01-07  3619  	 * Due to the rotation, =
for RAID56 it's better to iterate each stripe
fa676286533c1c4 Qu Wenruo       2022-01-07  3620  	 * using their physical =
offset.
a2de733c78fa7af Arne Jansen     2011-03-08  3621  	 */
fa676286533c1c4 Qu Wenruo       2022-01-07  3622  	while (physical < physic=
al_end) {
fa676286533c1c4 Qu Wenruo       2022-01-07  3623  		ret =3D get_raid56_logi=
c_offset(physical, stripe_index, map,
fa676286533c1c4 Qu Wenruo       2022-01-07  3624  					      &logical, &str=
ipe_logical);
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3625  		logical +=3D chunk_logi=
cal;
f2f66a2f886383f Zhao Lei        2015-07-21  3626  		if (ret) {
fa676286533c1c4 Qu Wenruo       2022-01-07  3627  			/* It is parity strip =
*/
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3628  			stripe_logical +=3D ch=
unk_logical;
a0dd59de3c73fbb Zhao Lei        2015-07-21  3629  			stripe_end =3D stripe_=
logical + increment;
f2f66a2f886383f Zhao Lei        2015-07-21  3630  			ret =3D scrub_raid56_p=
arity(sctx, map, scrub_dev,
2522dbe86b54ff0 Qu Wenruo       2021-12-14  3631  						  stripe_logical,
f2f66a2f886383f Zhao Lei        2015-07-21  3632  						  stripe_end);
f2f66a2f886383f Zhao Lei        2015-07-21  3633  			if (ret)
f2f66a2f886383f Zhao Lei        2015-07-21  3634  				goto out;
a2de733c78fa7af Arne Jansen     2011-03-08  3635  			goto next;
a2de733c78fa7af Arne Jansen     2011-03-08  3636  		}
a2de733c78fa7af Arne Jansen     2011-03-08  3637  =

a2de733c78fa7af Arne Jansen     2011-03-08  3638  		/*
fa676286533c1c4 Qu Wenruo       2022-01-07  3639  		 * Now we're@data st=
ripes, scrub each extents in the range.
fa676286533c1c4 Qu Wenruo       2022-01-07  3640  		 *
fa676286533c1c4 Qu Wenruo       2022-01-07  3641  		 * At this stage, if we=
 ignore the repair part, each data stripe
fa676286533c1c4 Qu Wenruo       2022-01-07  3642  		 * is no different than=
 SINGLE profile.
fa676286533c1c4 Qu Wenruo       2022-01-07  3643  		 * We can reuse scrub_s=
imple_mirror() here, as the repair part
fa676286533c1c4 Qu Wenruo       2022-01-07  3644  		 * is still based on @m=
irror_num.
3b080b2564287be Wang Shilong    2014-04-01  3645  		 */
fa676286533c1c4 Qu Wenruo       2022-01-07  3646  		ret =3D scrub_simple_mi=
rror(sctx, root, csum_root, bg, map,
fa676286533c1c4 Qu Wenruo       2022-01-07  3647  					  logical, map->stri=
pe_len,
fa676286533c1c4 Qu Wenruo       2022-01-07  3648  					  scrub_dev, physica=
l, 1);
fa676286533c1c4 Qu Wenruo       2022-01-07  3649  		if (ret < 0)
5a6ac9eacb49143 Miao Xie        2014-11-06  3650  			goto out;
a2de733c78fa7af Arne Jansen     2011-03-08  3651  next:
a2de733c78fa7af Arne Jansen     2011-03-08  3652  		logical +=3D increment;
a2de733c78fa7af Arne Jansen     2011-03-08  3653  		physical +=3D map->stri=
pe_len;
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3654  		spin_lock(&sctx->stat_l=
ock);
625f1c8dc66d778 Liu Bo          2013-04-27  3655  		if (stop_loop)
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3656  			sctx->stat.last_physic=
al =3D map->stripes[stripe_index].physical +
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3657  						   dev_extent_len;
625f1c8dc66d778 Liu Bo          2013-04-27  3658  		else
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3659  			sctx->stat.last_physic=
al =3D physical;
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3660  		spin_unlock(&sctx->stat=
_lock);
625f1c8dc66d778 Liu Bo          2013-04-27  3661  		if (stop_loop)
625f1c8dc66d778 Liu Bo          2013-04-27  3662  			break;
a2de733c78fa7af Arne Jansen     2011-03-08  3663  	}
ff023aac31198e8 Stefan Behrens  2012-11-06  3664  out:
a2de733c78fa7af Arne Jansen     2011-03-08  3665  	/* push queued extents */
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  3666  	scrub_submit(sctx);
3fb99303c64e31f David Sterba    2017-05-16  3667  	mutex_lock(&sctx->wr_loc=
k);
ff023aac31198e8 Stefan Behrens  2012-11-06  3668  	scrub_wr_submit(sctx);
3fb99303c64e31f David Sterba    2017-05-16  3669  	mutex_unlock(&sctx->wr_l=
ock);
a2de733c78fa7af Arne Jansen     2011-03-08  3670  =

e7786c3ae517b2c Arne Jansen     2011-05-28  3671  	blk_finish_plug(&plug);
a2de733c78fa7af Arne Jansen     2011-03-08  3672  	btrfs_free_path(path);
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3673  =

7db1c5d14dcd521 Naohiro Aota    2021-02-04  3674  	if (sctx->is_dev_replace=
 && ret >=3D 0) {
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3675  		int ret2;
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3676  =

2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3677  		ret2 =3D sync_write_poi=
nter_for_zoned(sctx,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15 @3678  				chunk_logical + offse=
t,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  3679  				map->stripes[stripe_i=
ndex].physical,
7db1c5d14dcd521 Naohiro Aota    2021-02-04 @3680  				physical_end);
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3681  		if (ret2)
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3682  			ret =3D ret2;
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3683  	}
7db1c5d14dcd521 Naohiro Aota    2021-02-04  3684  =

a2de733c78fa7af Arne Jansen     2011-03-08  3685  	return ret < 0 ? ret : 0;
a2de733c78fa7af Arne Jansen     2011-03-08  3686  }
a2de733c78fa7af Arne Jansen     2011-03-08  3687  =


:::::: The code@line 3678 was first introduced by commit
:::::: 2ae8ae3d3def4c3ba73a58cc2531c42f0916f14e btrfs: scrub: cleanup the a=
rgument list of scrub_stripe()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2227451218612979248==--

