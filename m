Content-Type: multipart/mixed; boundary="===============3524674701482282915=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kdave-btrfs-devel:for-next-20220307 108/147] fs/btrfs/scrub.c:3146 scrub_raid56_data_stripe_for_parity() error: we previously assumed 'bioc' could be null (see line 3138)
Date: Tue, 08 Mar 2022 16:42:12 +0300
Message-ID: <20220308134212.GL3315@kadam>
In-Reply-To: <202203081837.zOttrQRN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3524674701482282915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 04:09:54PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/kdave/btrfs-devel.git for-next-20220307
> head:   912dedd70aeb485247c507115704ea7d137d758b
> commit: 80cd926eefca522182ee3cf04d8e9984073d34d1 [108/147] btrfs: refacto=
r scrub_raid56_parity()
> config: i386-randconfig-m021-20220307 (https://download.01.org/0day-ci/ar=
chive/20220308/202203081837.zOttrQRN-lkp(a)intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> fs/btrfs/scrub.c:3171 scrub_raid56_data_stripe_for_parity() error: uninit=
ialized symbol 'extent_start'.
> fs/btrfs/scrub.c:3172 scrub_raid56_data_stripe_for_parity() error: uninit=
ialized symbol 'extent_size'.
> =

> Old smatch warnings:
> fs/btrfs/scrub.c:3419 scrub_simple_mirror() error: uninitialized symbol '=
ret'.
> =

> vim +/bioc +3146 fs/btrfs/scrub.c
> =

> 093741d4cda2cb4 Qu Wenruo     2022-02-18  3021  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3022  static int scrub_raid56_d=
ata_stripe_for_parity(struct scrub_ctx *sctx,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3023  					       struct scrub_=
parity *sparity,
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3024  					       struct map_lo=
okup *map,
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3025  					       struct btrfs_=
device *sdev,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3026  					       struct btrfs_=
path *path,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3027  					       u64 logical)
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3028  {
> fb456252d3d9c05 Jeff Mahoney  2016-06-22  3029  	struct btrfs_fs_info *fs=
_info =3D sctx->fs_info;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3030  	struct btrfs_root *exten=
t_root =3D btrfs_extent_root(fs_info, logical);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3031  	struct btrfs_root *csum_=
root =3D btrfs_csum_root(fs_info, logical);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3032  	struct btrfs_key key;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3033  	u64 extent_start;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3034  	u64 extent_size;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3035  	int ret;
> 2522dbe86b54ff0 Qu Wenruo     2021-12-14  3036  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3037  	ASSERT(map->type & BTRFS=
_BLOCK_GROUP_RAID56_MASK);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3038  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3039  	/* Path should not be po=
pulated */
> 80cd926eefca522 Qu Wenruo     2022-02-18  3040  	ASSERT(!path->nodes[0]);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3041  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3042  	if (btrfs_fs_incompat(fs=
_info, SKINNY_METADATA))
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3043  		key.type =3D BTRFS_META=
DATA_ITEM_KEY;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3044  	else
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3045  		key.type =3D BTRFS_EXTE=
NT_ITEM_KEY;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3046  	key.objectid =3D logical;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3047  	key.offset =3D (u64)-1;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3048  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3049  	ret =3D btrfs_search_slo=
t(NULL, extent_root, &key, path, 0, 0);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3050  	if (ret < 0)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3051  		return ret;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3052  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3053  	if (ret > 0) {
> 80cd926eefca522 Qu Wenruo     2022-02-18  3054  		ret =3D btrfs_previous_=
extent_item(extent_root, path, 0);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3055  		if (ret < 0)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3056  			return ret;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3057  		if (ret > 0) {
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3058  			btrfs_release_path(pat=
h);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3059  			ret =3D btrfs_search_s=
lot(NULL, extent_root, &key, path,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3060  						0, 0);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3061  			if (ret < 0)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3062  				return ret;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3063  		}
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3064  	}
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3065  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3066  	while (1) {
> 80cd926eefca522 Qu Wenruo     2022-02-18  3067  		struct btrfs_io_context=
 *bioc =3D NULL;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3068  		struct btrfs_device *ex=
tent_dev;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3069  		struct btrfs_extent_ite=
m *ei;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3070  		struct extent_buffer *l;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3071  		int slot;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3072  		u64 mapped_length;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3073  		u64 extent_flags;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3074  		u64 extent_gen;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3075  		u64 extent_physical;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3076  		u64 extent_mirror_num;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3077  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3078  		l =3D path->nodes[0];
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3079  		slot =3D path->slots[0];
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3080  		if (slot >=3D btrfs_hea=
der_nritems(l)) {
> 80cd926eefca522 Qu Wenruo     2022-02-18  3081  			ret =3D btrfs_next_lea=
f(extent_root, path);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3082  			if (ret =3D=3D 0)
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3083  				continue;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3084  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3085  			/* No more extent item=
s or error, exit */
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3086  			break;

Oops.  I misread what Smatch was doing.  It's this break that it's
complaining about.  "ret" is negative and "extent_start" is uninitialized
on the first iteration through the loop.

The goto would not trigger the warning.


> 5a6ac9eacb49143 Miao Xie      2014-11-06  3087  		}
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3088  		btrfs_item_key_to_cpu(l=
, &key, slot);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3089  =

> d7cad2389560f32 Zhao Lei      2015-07-22  3090  		if (key.type !=3D BTRFS=
_EXTENT_ITEM_KEY &&
> d7cad2389560f32 Zhao Lei      2015-07-22  3091  		    key.type !=3D BTRFS=
_METADATA_ITEM_KEY)
> d7cad2389560f32 Zhao Lei      2015-07-22  3092  			goto next;
> d7cad2389560f32 Zhao Lei      2015-07-22  3093  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3094  		if (key.type =3D=3D BTR=
FS_METADATA_ITEM_KEY)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3095  			extent_size =3D fs_inf=
o->nodesize;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3096  		else
> 80cd926eefca522 Qu Wenruo     2022-02-18  3097  			extent_size =3D key.of=
fset;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3098  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3099  		if (key.objectid + exte=
nt_size <=3D logical)
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3100  			goto next;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3101  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3102  		/* Beyond this data str=
ipe */
> 80cd926eefca522 Qu Wenruo     2022-02-18  3103  		if (key.objectid >=3D l=
ogical + map->stripe_len)
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3104  			break;

On this break "ret" is zero so it wouldn't trigger an error.

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3105  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3106  		ei =3D btrfs_item_ptr(l=
, slot, struct btrfs_extent_item);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3107  		extent_flags =3D btrfs_=
extent_flags(l, ei);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3108  		extent_gen =3D btrfs_ex=
tent_generation(l, ei);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3109  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3110  		if ((extent_flags & BTR=
FS_EXTENT_FLAG_TREE_BLOCK) &&
> 80cd926eefca522 Qu Wenruo     2022-02-18  3111  		    (key.objectid < log=
ical || key.objectid + extent_size >
> 80cd926eefca522 Qu Wenruo     2022-02-18  3112  		     logical + map->str=
ipe_len)) {
> 5d163e0e68ce743 Jeff Mahoney  2016-09-20  3113  			btrfs_err(fs_info,
> 5d163e0e68ce743 Jeff Mahoney  2016-09-20  3114  				  "scrub: tree block =
%llu spanning stripes, ignored. logical=3D%llu",
> 80cd926eefca522 Qu Wenruo     2022-02-18  3115  				  key.objectid, logic=
al);
> 9799d2c32bef6fb Zhao Lei      2015-08-25  3116  			spin_lock(&sctx->stat_=
lock);
> 9799d2c32bef6fb Zhao Lei      2015-08-25  3117  			sctx->stat.uncorrectab=
le_errors++;
> 9799d2c32bef6fb Zhao Lei      2015-08-25  3118  			spin_unlock(&sctx->sta=
t_lock);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3119  			goto next;
> =

> This goto next is what triggers the uninitialized variable warnings for
> extent_start and extent_size.

No.  This is fine.

> =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3120  		}
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3121  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3122  		extent_start =3D key.ob=
jectid;

And anything after this is fine.

regards,
dan carpenter

> 80cd926eefca522 Qu Wenruo     2022-02-18  3123  		ASSERT(extent_size <=3D=
 U32_MAX);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3124  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3125  		/* Truncate the range i=
nside the data stripe */
> 80cd926eefca522 Qu Wenruo     2022-02-18  3126  		if (extent_start < logi=
cal) {
> 80cd926eefca522 Qu Wenruo     2022-02-18  3127  			extent_size -=3D logic=
al - extent_start;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3128  			extent_start =3D logic=
al;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3129  		}
> 80cd926eefca522 Qu Wenruo     2022-02-18  3130  		if (extent_start + exte=
nt_size > logical + map->stripe_len)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3131  			extent_size =3D logica=
l + map->stripe_len - extent_start;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3132  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3133  		scrub_parity_mark_secto=
rs_data(sparity, extent_start, extent_size);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3134  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3135  		mapped_length =3D exten=
t_size;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3136  		ret =3D btrfs_map_block=
(fs_info, BTRFS_MAP_READ, extent_start,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3137  				      &mapped_length,=
 &bioc, 0);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3138  		if (!ret && (!bioc || m=
apped_length < extent_size))
> 4a770891d9ddf94 Omar Sandoval 2015-06-19  3139  			ret =3D -EIO;
> 4a770891d9ddf94 Omar Sandoval 2015-06-19  3140  		if (ret) {
> 4c6646117912397 Qu Wenruo     2021-09-15  3141  			btrfs_put_bioc(bioc);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3142  			scrub_parity_mark_sect=
ors_error(sparity, extent_start,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3143  							extent_size);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3144  			break;
> 4a770891d9ddf94 Omar Sandoval 2015-06-19  3145  		}
> 4c6646117912397 Qu Wenruo     2021-09-15  3146  		extent_physical =3D bio=
c->stripes[0].physical;
> 4c6646117912397 Qu Wenruo     2021-09-15  3147  		extent_mirror_num =3D b=
ioc->mirror_num;
> 4c6646117912397 Qu Wenruo     2021-09-15  3148  		extent_dev =3D bioc->st=
ripes[0].dev;
> 4c6646117912397 Qu Wenruo     2021-09-15  3149  		btrfs_put_bioc(bioc);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3150  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3151  		ret =3D btrfs_lookup_cs=
ums_range(csum_root, extent_start,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3152  					       extent_start =
+ extent_size - 1,
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3153  					       &sctx->csum_l=
ist, 1);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3154  		if (ret)
> 80cd926eefca522 Qu Wenruo     2022-02-18  3155  			break;
> 6fa96d72f79a155 Zhao Lei      2015-07-21  3156  =

> 80cd926eefca522 Qu Wenruo     2022-02-18  3157  		ret =3D scrub_extent_fo=
r_parity(sparity, extent_start,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3158  					      extent_size, e=
xtent_physical,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3159  					      extent_dev, ex=
tent_flags,
> 80cd926eefca522 Qu Wenruo     2022-02-18  3160  					      extent_gen, ex=
tent_mirror_num);
> 6fa96d72f79a155 Zhao Lei      2015-07-21  3161  		scrub_free_csums(sctx);
> 6fa96d72f79a155 Zhao Lei      2015-07-21  3162  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3163  		if (ret)
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3164  			break;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3165  =

> 5a6ac9eacb49143 Miao Xie      2014-11-06  3166  		cond_resched();
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3167  next:
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3168  		path->slots[0]++;
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3169  	}
> 80cd926eefca522 Qu Wenruo     2022-02-18  3170  	if (ret < 0)
> 80cd926eefca522 Qu Wenruo     2022-02-18 @3171  		scrub_parity_mark_secto=
rs_error(sparity, extent_start,
> 80cd926eefca522 Qu Wenruo     2022-02-18 @3172  						extent_size);
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3173  	btrfs_release_path(path);
> 80cd926eefca522 Qu Wenruo     2022-02-18  3174  	return ret;
> 80cd926eefca522 Qu Wenruo     2022-02-18  3175  }
> 5a6ac9eacb49143 Miao Xie      2014-11-06  3176  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3524674701482282915==--

