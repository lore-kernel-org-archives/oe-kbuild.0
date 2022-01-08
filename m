Content-Type: multipart/mixed; boundary="===============2774827472956764467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/4] btrfs: use scrub_simple_mirror() to handle RAID56 data stripe scrub
Date: Sat, 08 Jan 2022 10:53:55 +0800
Message-ID: <202201081052.DLHF46ku-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2774827472956764467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220107023430.28288-5-wqu@suse.com>
References: <20220107023430.28288-5-wqu@suse.com>
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
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-m001-20220107 (https://download.01.org/0day-ci/ar=
chive/20220108/202201081052.DLHF46ku-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

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

38e821991b4eb7 Qu Wenruo       2022-01-07  3512  =

d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3513  static noinline_for_stack =
int scrub_stripe(struct scrub_ctx *sctx,
471a5e456ff42e Qu Wenruo       2021-12-15  3514  					   struct btrfs_block=
_group *bg,
a36cf8b8933e4a Stefan Behrens  2012-11-02  3515  					   struct map_lookup =
*map,
a36cf8b8933e4a Stefan Behrens  2012-11-02  3516  					   struct btrfs_devic=
e *scrub_dev,
471a5e456ff42e Qu Wenruo       2021-12-15  3517  					   int stripe_index, =
u64 dev_extent_len)
a2de733c78fa7a Arne Jansen     2011-03-08  3518  {
69765031000981 Qu Wenruo       2021-12-14  3519  	struct btrfs_path *path;
fb456252d3d9c0 Jeff Mahoney    2016-06-22  3520  	struct btrfs_fs_info *fs_=
info =3D sctx->fs_info;
29cbcf401793f4 Josef Bacik     2021-11-05  3521  	struct btrfs_root *root;
fc28b25e1f4286 Josef Bacik     2021-11-05  3522  	struct btrfs_root *csum_r=
oot;
e7786c3ae517b2 Arne Jansen     2011-05-28  3523  	struct blk_plug plug;
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3524  	const u64 profile =3D map=
->type & BTRFS_BLOCK_GROUP_PROFILE_MASK;
471a5e456ff42e Qu Wenruo       2021-12-15  3525  	const u64 chunk_logical =
=3D bg->start;
a2de733c78fa7a Arne Jansen     2011-03-08  3526  	int ret;
a2de733c78fa7a Arne Jansen     2011-03-08  3527  	u64 nstripes;
a2de733c78fa7a Arne Jansen     2011-03-08  3528  	u64 physical;
a2de733c78fa7a Arne Jansen     2011-03-08  3529  	u64 logical;
625f1c8dc66d77 Liu Bo          2013-04-27  3530  	u64 logic_end;
3b080b2564287b Wang Shilong    2014-04-01  3531  	u64 physical_end;
179313bb55be37 Qu Wenruo       2022-01-07  3532  	u64 increment;	/* The log=
ical increment after finishing one stripe */
179313bb55be37 Qu Wenruo       2022-01-07  3533  	u64 offset;	/* Offset ins=
ide the chunk */
5a6ac9eacb4914 Miao Xie        2014-11-06  3534  	u64 stripe_logical;
5a6ac9eacb4914 Miao Xie        2014-11-06  3535  	u64 stripe_end;
3b080b2564287b Wang Shilong    2014-04-01  3536  	int stop_loop =3D 0;
53b381b3abeb86 David Woodhouse 2013-01-29  3537  =

a2de733c78fa7a Arne Jansen     2011-03-08  3538  	path =3D btrfs_alloc_path=
();
a2de733c78fa7a Arne Jansen     2011-03-08  3539  	if (!path)
a2de733c78fa7a Arne Jansen     2011-03-08  3540  		return -ENOMEM;
a2de733c78fa7a Arne Jansen     2011-03-08  3541  =

b5d67f64f9bc65 Stefan Behrens  2012-03-27  3542  	/*
179313bb55be37 Qu Wenruo       2022-01-07  3543  	 * Work on commit root. T=
he related disk blocks are static as
b5d67f64f9bc65 Stefan Behrens  2012-03-27  3544  	 * long as COW is applied=
. This means, it is save to rewrite
b5d67f64f9bc65 Stefan Behrens  2012-03-27  3545  	 * them to repair disk er=
rors without any race conditions
b5d67f64f9bc65 Stefan Behrens  2012-03-27  3546  	 */
a2de733c78fa7a Arne Jansen     2011-03-08  3547  	path->search_commit_root =
=3D 1;
a2de733c78fa7a Arne Jansen     2011-03-08  3548  	path->skip_locking =3D 1;
889fc56fa40f9d Qu Wenruo       2021-12-14  3549  	path->reada =3D READA_FOR=
WARD;
a2de733c78fa7a Arne Jansen     2011-03-08  3550  =

d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3551  	wait_event(sctx->list_wai=
t,
b6bfebc13218f1 Stefan Behrens  2012-11-02  3552  		   atomic_read(&sctx->bi=
os_in_flight) =3D=3D 0);
cb7ab02156e4ba Wang Shilong    2013-12-04  3553  	scrub_blocked_if_needed(f=
s_info);
a2de733c78fa7a Arne Jansen     2011-03-08  3554  =

179313bb55be37 Qu Wenruo       2022-01-07  3555  	root =3D btrfs_extent_roo=
t(fs_info, bg->start);
179313bb55be37 Qu Wenruo       2022-01-07  3556  	csum_root =3D btrfs_csum_=
root(fs_info, bg->start);
fc28b25e1f4286 Josef Bacik     2021-11-05  3557  =

a2de733c78fa7a Arne Jansen     2011-03-08  3558  	/*
179313bb55be37 Qu Wenruo       2022-01-07  3559  	 * Collect all data csums=
 for the stripe to avoid seeking during
a2de733c78fa7a Arne Jansen     2011-03-08  3560  	 * the scrub. This might =
currently (crc32) end up to be about 1MB
a2de733c78fa7a Arne Jansen     2011-03-08  3561  	 */
e7786c3ae517b2 Arne Jansen     2011-05-28  3562  	blk_start_plug(&plug);
a2de733c78fa7a Arne Jansen     2011-03-08  3563  =

de17addce7a20d Naohiro Aota    2021-02-04  3564  	if (sctx->is_dev_replace =
&&
179313bb55be37 Qu Wenruo       2022-01-07  3565  	    btrfs_dev_is_sequenti=
al(sctx->wr_tgtdev,
179313bb55be37 Qu Wenruo       2022-01-07  3566  				    map->stripes[strip=
e_index].physical)) {
de17addce7a20d Naohiro Aota    2021-02-04  3567  		mutex_lock(&sctx->wr_loc=
k);
179313bb55be37 Qu Wenruo       2022-01-07  3568  		sctx->write_pointer =3D =
map->stripes[stripe_index].physical;
de17addce7a20d Naohiro Aota    2021-02-04  3569  		mutex_unlock(&sctx->wr_l=
ock);
de17addce7a20d Naohiro Aota    2021-02-04  3570  		sctx->flush_all_writes =
=3D true;
de17addce7a20d Naohiro Aota    2021-02-04  3571  	}
de17addce7a20d Naohiro Aota    2021-02-04  3572  =

f8636fcdd5f4ab Qu Wenruo       2022-01-07  3573  	/*
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3574  	 * There used to be a big=
 double loop to handle all profiles using the
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3575  	 * same routine, which gr=
ows larger and more gross over time.
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3576  	 *
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3577  	 * So here we handle each=
 profile differently, so simpler profiles
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3578  	 * have simpler scrubing =
function.
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3579  	 */
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3580  	if (!(profile & (BTRFS_BL=
OCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10 |
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3581  			 BTRFS_BLOCK_GROUP_RAID=
56_MASK))) {
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3582  		/*
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3583  		 * Above check rules out=
 all complex profile, the remaining
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3584  		 * profiles are SINGLE|D=
UP|RAID1|RAID1C*, which is simple
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3585  		 * mirrored duplication =
without stripe.
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3586  		 *
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3587  		 * Only @phsyical and @m=
irror_num needs to calculated using
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3588  		 * @stripe_index.
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3589  		 */
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3590  		ret =3D scrub_simple_mir=
ror(sctx, root, csum_root, bg, map,
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3591  				bg->start, bg->length,=
 scrub_dev,
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3592  				map->stripes[stripe_in=
dex].physical,
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3593  				stripe_index + 1);
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3594  		goto out;
f8636fcdd5f4ab Qu Wenruo       2022-01-07  3595  	}
38e821991b4eb7 Qu Wenruo       2022-01-07  3596  	if (profile & (BTRFS_BLOC=
K_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10)) {
38e821991b4eb7 Qu Wenruo       2022-01-07  3597  		ret =3D scrub_simple_str=
ipe(sctx, root, csum_root, bg, map,
38e821991b4eb7 Qu Wenruo       2022-01-07  3598  					  scrub_dev, stripe_i=
ndex);
38e821991b4eb7 Qu Wenruo       2022-01-07  3599  		goto out;
38e821991b4eb7 Qu Wenruo       2022-01-07  3600  	}
38e821991b4eb7 Qu Wenruo       2022-01-07  3601  =

38e821991b4eb7 Qu Wenruo       2022-01-07  3602  	/* Only RAID56 goes throu=
gh the old code */
38e821991b4eb7 Qu Wenruo       2022-01-07  3603  	ASSERT(map->type & BTRFS_=
BLOCK_GROUP_RAID56_MASK);
179313bb55be37 Qu Wenruo       2022-01-07  3604  =

179313bb55be37 Qu Wenruo       2022-01-07  3605  	physical =3D map->stripes=
[stripe_index].physical;
179313bb55be37 Qu Wenruo       2022-01-07  3606  	offset =3D 0;
179313bb55be37 Qu Wenruo       2022-01-07  3607  	nstripes =3D div64_u64(de=
v_extent_len, map->stripe_len);
179313bb55be37 Qu Wenruo       2022-01-07  3608  	get_raid56_logic_offset(p=
hysical, stripe_index, map, &offset, NULL);
179313bb55be37 Qu Wenruo       2022-01-07  3609  	increment =3D map->stripe=
_len * nr_data_stripes(map);
179313bb55be37 Qu Wenruo       2022-01-07  3610  =

179313bb55be37 Qu Wenruo       2022-01-07  3611  	logical =3D chunk_logical=
 + offset;
179313bb55be37 Qu Wenruo       2022-01-07  3612  	physical_end =3D physical=
 + nstripes * map->stripe_len;
179313bb55be37 Qu Wenruo       2022-01-07  3613  	get_raid56_logic_offset(p=
hysical_end, stripe_index, map, &logic_end,
179313bb55be37 Qu Wenruo       2022-01-07  3614  				NULL);
179313bb55be37 Qu Wenruo       2022-01-07  3615  	logic_end +=3D chunk_logi=
cal;
179313bb55be37 Qu Wenruo       2022-01-07  3616  =

a2de733c78fa7a Arne Jansen     2011-03-08  3617  	ret =3D 0;
a2de733c78fa7a Arne Jansen     2011-03-08  3618  	/*
179313bb55be37 Qu Wenruo       2022-01-07  3619  	 * Due to the rotation, f=
or RAID56 it's better to iterate each stripe
179313bb55be37 Qu Wenruo       2022-01-07  3620  	 * using their physical o=
ffset.
a2de733c78fa7a Arne Jansen     2011-03-08  3621  	 */
179313bb55be37 Qu Wenruo       2022-01-07  3622  	while (physical < physica=
l_end) {
179313bb55be37 Qu Wenruo       2022-01-07  3623  		ret =3D get_raid56_logic=
_offset(physical, stripe_index, map,
179313bb55be37 Qu Wenruo       2022-01-07  3624  					      &logical, &stri=
pe_logical);
471a5e456ff42e Qu Wenruo       2021-12-15  3625  		logical +=3D chunk_logic=
al;
f2f66a2f886383 Zhao Lei        2015-07-21  3626  		if (ret) {
179313bb55be37 Qu Wenruo       2022-01-07  3627  			/* It is parity strip */
471a5e456ff42e Qu Wenruo       2021-12-15  3628  			stripe_logical +=3D chu=
nk_logical;
a0dd59de3c73fb Zhao Lei        2015-07-21  3629  			stripe_end =3D stripe_l=
ogical + increment;
f2f66a2f886383 Zhao Lei        2015-07-21  3630  			ret =3D scrub_raid56_pa=
rity(sctx, map, scrub_dev,
69765031000981 Qu Wenruo       2021-12-14  3631  						  stripe_logical,
f2f66a2f886383 Zhao Lei        2015-07-21  3632  						  stripe_end);
f2f66a2f886383 Zhao Lei        2015-07-21  3633  			if (ret)
f2f66a2f886383 Zhao Lei        2015-07-21  3634  				goto out;
a2de733c78fa7a Arne Jansen     2011-03-08  3635  			goto next;
a2de733c78fa7a Arne Jansen     2011-03-08  3636  		}
a2de733c78fa7a Arne Jansen     2011-03-08  3637  =

a2de733c78fa7a Arne Jansen     2011-03-08  3638  		/*
179313bb55be37 Qu Wenruo       2022-01-07  3639  		 * Now we're@data str=
ipes, scrub each extents in the range.
179313bb55be37 Qu Wenruo       2022-01-07  3640  		 *
179313bb55be37 Qu Wenruo       2022-01-07  3641  		 * At this stage, if we =
ignore the repair part, each data stripe
179313bb55be37 Qu Wenruo       2022-01-07  3642  		 * is no different than =
SINGLE profile.
179313bb55be37 Qu Wenruo       2022-01-07  3643  		 * We can reuse scrub_si=
mple_mirror() here, as the repair part
179313bb55be37 Qu Wenruo       2022-01-07  3644  		 * is still based on @mi=
rror_num.
3b080b2564287b Wang Shilong    2014-04-01  3645  		 */
179313bb55be37 Qu Wenruo       2022-01-07  3646  		ret =3D scrub_simple_mir=
ror(sctx, root, csum_root, bg, map,
179313bb55be37 Qu Wenruo       2022-01-07  3647  					  logical, map->strip=
e_len,
179313bb55be37 Qu Wenruo       2022-01-07  3648  					  scrub_dev, physical=
, 1);
179313bb55be37 Qu Wenruo       2022-01-07  3649  		if (ret < 0)
5a6ac9eacb4914 Miao Xie        2014-11-06  3650  			goto out;
a2de733c78fa7a Arne Jansen     2011-03-08  3651  next:
a2de733c78fa7a Arne Jansen     2011-03-08  3652  		logical +=3D increment;
a2de733c78fa7a Arne Jansen     2011-03-08  3653  		physical +=3D map->strip=
e_len;
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3654  		spin_lock(&sctx->stat_lo=
ck);
625f1c8dc66d77 Liu Bo          2013-04-27  3655  		if (stop_loop)
471a5e456ff42e Qu Wenruo       2021-12-15  3656  			sctx->stat.last_physica=
l =3D map->stripes[stripe_index].physical +
471a5e456ff42e Qu Wenruo       2021-12-15  3657  						   dev_extent_len;
625f1c8dc66d77 Liu Bo          2013-04-27  3658  		else
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3659  			sctx->stat.last_physica=
l =3D physical;
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3660  		spin_unlock(&sctx->stat_=
lock);
625f1c8dc66d77 Liu Bo          2013-04-27  3661  		if (stop_loop)
625f1c8dc66d77 Liu Bo          2013-04-27  3662  			break;
a2de733c78fa7a Arne Jansen     2011-03-08  3663  	}
ff023aac31198e Stefan Behrens  2012-11-06  3664  out:
a2de733c78fa7a Arne Jansen     2011-03-08  3665  	/* push queued extents */
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  3666  	scrub_submit(sctx);
3fb99303c64e31 David Sterba    2017-05-16  3667  	mutex_lock(&sctx->wr_lock=
);
ff023aac31198e Stefan Behrens  2012-11-06  3668  	scrub_wr_submit(sctx);
3fb99303c64e31 David Sterba    2017-05-16  3669  	mutex_unlock(&sctx->wr_lo=
ck);
a2de733c78fa7a Arne Jansen     2011-03-08  3670  =

e7786c3ae517b2 Arne Jansen     2011-05-28  3671  	blk_finish_plug(&plug);
a2de733c78fa7a Arne Jansen     2011-03-08  3672  	btrfs_free_path(path);
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3673  =

7db1c5d14dcd52 Naohiro Aota    2021-02-04  3674  	if (sctx->is_dev_replace =
&& ret >=3D 0) {
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3675  		int ret2;
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3676  =

471a5e456ff42e Qu Wenruo       2021-12-15  3677  		ret2 =3D sync_write_poin=
ter_for_zoned(sctx,
471a5e456ff42e Qu Wenruo       2021-12-15 @3678  				chunk_logical + offset,
471a5e456ff42e Qu Wenruo       2021-12-15  3679  				map->stripes[stripe_in=
dex].physical,
7db1c5d14dcd52 Naohiro Aota    2021-02-04 @3680  				physical_end);
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3681  		if (ret2)
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3682  			ret =3D ret2;
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3683  	}
7db1c5d14dcd52 Naohiro Aota    2021-02-04  3684  =

a2de733c78fa7a Arne Jansen     2011-03-08  3685  	return ret < 0 ? ret : 0;
a2de733c78fa7a Arne Jansen     2011-03-08  3686  }
a2de733c78fa7a Arne Jansen     2011-03-08  3687  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2774827472956764467==--

