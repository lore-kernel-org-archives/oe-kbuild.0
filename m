Content-Type: multipart/mixed; boundary="===============3367350741769997426=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2228/3296] drivers/md/dm-raid.c:3686 raid_status() error: uninitialized symbol 'recovery'.
Date: Sun, 25 Jul 2021 12:09:57 +0800
Message-ID: <202107251250.1t4DMJwe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3367350741769997426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tushar Sugandhi <tusharsu@linux.microsoft.com>
CC: Mike Snitzer <snitzer@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   90d856e71443a2fcacca8e7539bac44d9cb3f7ab
commit: fdac9de80c2e66d6df999ac810382c66b0cb2830 [2228/3296] dm: update tar=
get status functions to support IMA measurement
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001-20210724 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/md/dm-raid.c:3686 raid_status() error: uninitialized symbol 'recove=
ry'.

Old smatch warnings:
drivers/md/dm-raid.c:1336 parse_raid_params() warn: potential spectre issue=
 'rs->dev' [w]

vim +/recovery +3686 drivers/md/dm-raid.c

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3509  =

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3510  static void raid_sta=
tus(struct dm_target *ti, status_type_t type,
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3511  			unsigned int stat=
us_flags, char *result, unsigned int maxlen)
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3512  {
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3513  	struct raid_set *rs=
 =3D ti->private;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3514  	struct mddev *mddev=
 =3D &rs->md;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3515  	struct r5conf *conf=
 =3D mddev->private;
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3516  	int i, max_nr_strip=
es =3D conf ? conf->max_nr_stripes : 0;
67143510a7e363 Heinz Mauelshagen     2017-12-02  3517  	unsigned long recov=
ery;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3518  	unsigned int raid_p=
aram_cnt =3D 1; /* at least 1 for chunksize */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3519  	unsigned int sz =3D=
 0;
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3520  	unsigned int rebuil=
d_writemostly_count =3D 0;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3521  	sector_t progress, =
resync_max_sectors, resync_mismatches;
53be73a5d75f47 Heinz Mauelshagen     2019-10-01  3522  	enum sync_state sta=
te;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3523  	struct raid_type *r=
t;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3524  =

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3525  	switch (type) {
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3526  	case STATUSTYPE_INF=
O:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3527  		/* *Should* always=
 succeed */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3528  		rt =3D get_raid_ty=
pe_by_ll(mddev->new_level, mddev->new_layout);
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3529  		if (!rt)
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3530  			return;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3531  =

9dbd1aa3a81c61 Heinz Mauelshagen     2016-06-13  3532  		DMEMIT("%s %d ", r=
t->name, mddev->raid_disks);
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3533  =

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3534  		/* Access most rec=
ent mddev properties for status output */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3535  		smp_rmb();
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3536  		/* Get sensible ma=
x sectors even if raid set not yet started */
4286325b4b0dc9 Mike Snitzer          2016-06-02  3537  		resync_max_sectors=
 =3D test_bit(RT_FLAG_RS_PRERESUMED, &rs->runtime_flags) ?
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3538  				      mddev->res=
ync_max_sectors : mddev->dev_sectors;
53be73a5d75f47 Heinz Mauelshagen     2019-10-01  3539  		recovery =3D rs->m=
d.recovery;
53be73a5d75f47 Heinz Mauelshagen     2019-10-01  3540  		state =3D decipher=
_sync_action(mddev, recovery);
53be73a5d75f47 Heinz Mauelshagen     2019-10-01  3541  		progress =3D rs_ge=
t_progress(rs, recovery, state, resync_max_sectors);
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3542  		resync_mismatches =
=3D (mddev->last_sync_action && !strcasecmp(mddev->last_sync_action, "check=
")) ?
9dbd1aa3a81c61 Heinz Mauelshagen     2016-06-13  3543  				    atomic64_rea=
d(&mddev->resync_mismatches) : 0;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3544  =

c63ede3b4211e1 Heinz Mauelshagen     2017-01-14  3545  		/* HM FIXME: do we=
 want another state char for raid0? It shows 'D'/'A'/'-' now */
c63ede3b4211e1 Heinz Mauelshagen     2017-01-14  3546  		for (i =3D 0; i < =
rs->raid_disks; i++)
242ea5ad11a03f Heinz Mauelshagen     2017-12-02  3547  			DMEMIT(__raid_dev=
_status(rs, &rs->dev[i].rdev));
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3548  =

2e727c3ca1beff Jonathan E Brassow    2011-10-31  3549  		/*
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3550  		 * In-sync/Reshape=
 ratio:
2e727c3ca1beff Jonathan E Brassow    2011-10-31  3551  		 *  The in-sync ra=
tio shows the progress of:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3552  		 *   - Initializin=
g the raid set
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3553  		 *   - Rebuilding =
a subset of devices of the raid set
2e727c3ca1beff Jonathan E Brassow    2011-10-31  3554  		 *  The user can d=
istinguish between the two by referring
2e727c3ca1beff Jonathan E Brassow    2011-10-31  3555  		 *  to the status =
characters.
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3556  		 *
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3557  		 *  The reshape ra=
tio shows the progress of
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3558  		 *  changing the r=
aid layout or the number of
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3559  		 *  disks of a rai=
d set
2e727c3ca1beff Jonathan E Brassow    2011-10-31  3560  		 */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3561  		DMEMIT(" %llu/%llu=
", (unsigned long long) progress,
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3562  				     (unsigned l=
ong long) resync_max_sectors);
9d09e663d5502c NeilBrown             2011-01-13  3563  =

be83651f0050ca Jonathan Brassow      2013-04-24  3564  		/*
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3565  		 * v1.5.0+:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3566  		 *
be83651f0050ca Jonathan Brassow      2013-04-24  3567  		 * Sync action:
6cf2a73cb2bc42 Mauro Carvalho Chehab 2019-06-18  3568  		 *   See Documenta=
tion/admin-guide/device-mapper/dm-raid.rst for
be83651f0050ca Jonathan Brassow      2013-04-24  3569  		 *   information o=
n each of these states.
be83651f0050ca Jonathan Brassow      2013-04-24  3570  		 */
53be73a5d75f47 Heinz Mauelshagen     2019-10-01  3571  		DMEMIT(" %s", sync=
_str(state));
be83651f0050ca Jonathan Brassow      2013-04-24  3572  =

be83651f0050ca Jonathan Brassow      2013-04-24  3573  		/*
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3574  		 * v1.5.0+:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3575  		 *
be83651f0050ca Jonathan Brassow      2013-04-24  3576  		 * resync_mismatch=
es/mismatch_cnt
be83651f0050ca Jonathan Brassow      2013-04-24  3577  		 *   This field sh=
ows the number of discrepancies found when
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3578  		 *   performing a =
"check" of the raid set.
be83651f0050ca Jonathan Brassow      2013-04-24  3579  		 */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3580  		DMEMIT(" %llu", (u=
nsigned long long) resync_mismatches);
9d09e663d5502c NeilBrown             2011-01-13  3581  =

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3582  		/*
9b6e54232992a2 Mike Snitzer          2016-06-02  3583  		 * v1.9.0+:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3584  		 *
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3585  		 * data_offset (ne=
eded for out of space reshaping)
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3586  		 *   This field sh=
ows the data offset into the data
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3587  		 *   image LV wher=
e the first stripes data starts.
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3588  		 *
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3589  		 * We keep data_of=
fset equal on all raid disks of the set,
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3590  		 * so retrieving i=
t from the first raid disk is sufficient.
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3591  		 */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3592  		DMEMIT(" %llu", (u=
nsigned long long) rs->dev[0].rdev.data_offset);
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3593  =

63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3594  		/*
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3595  		 * v1.10.0+:
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3596  		 */
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3597  		DMEMIT(" %s", test=
_bit(__CTR_FLAG_JOURNAL_DEV, &rs->ctr_flags) ?
242ea5ad11a03f Heinz Mauelshagen     2017-12-02  3598  			      __raid_dev_=
status(rs, &rs->journal_dev.rdev) : "-");
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3599  		break;
9d09e663d5502c NeilBrown             2011-01-13  3600  =

3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3601  	case STATUSTYPE_TAB=
LE:
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3602  		/* Report the tabl=
e line string you would use to construct this raid set */
9d09e663d5502c NeilBrown             2011-01-13  3603  =

43f3952a51f819 Heinz Mauelshagen     2019-12-19  3604  		/*
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3605  		 * Count any rebui=
ld or writemostly argument pairs and subtract the
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3606  		 * hweight count b=
eing added below of any rebuild and writemostly ctr flags.
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3607  		 */
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3608  		for (i =3D 0; i < =
rs->raid_disks; i++) {
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3609  			rebuild_writemost=
ly_count +=3D (test_bit(i, (void *) rs->rebuild_disks) ? 2 : 0) +
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3610  						     (test_bit=
(WriteMostly, &rs->dev[i].rdev.flags) ? 2 : 0);
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3611  		}
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3612  		rebuild_writemostl=
y_count -=3D (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags) ? 2 : 0) +
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3613  					     (test_bit(=
__CTR_FLAG_WRITE_MOSTLY, &rs->ctr_flags) ? 2 : 0);
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3614  		/* Calculate raid =
parameter count based on ^ rebuild/writemostly argument counts and ctr flag=
s set. */
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3615  		raid_param_cnt +=
=3D rebuild_writemostly_count +
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3616  				  hweight32(rs->=
ctr_flags & CTR_FLAG_OPTIONS_NO_ARGS) +
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3617  				  hweight32(rs->=
ctr_flags & CTR_FLAG_OPTIONS_ONE_ARG) * 2;
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3618  		/* Emit table line=
 */
4464e36e06470e Heinz Mauelshagen     2017-03-18  3619  		/* This has to be =
in the documented order for userspace! */
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3620  		DMEMIT("%s %u %u",=
 rs->raid_type->name, raid_param_cnt, mddev->new_chunk_sectors);
4286325b4b0dc9 Mike Snitzer          2016-06-02  3621  		if (test_bit(__CTR=
_FLAG_SYNC, &rs->ctr_flags))
3fa6cf38211619 Mike Snitzer          2016-06-02  3622  			DMEMIT(" %s", dm_=
raid_arg_name_by_flag(CTR_FLAG_SYNC));
4464e36e06470e Heinz Mauelshagen     2017-03-18  3623  		if (test_bit(__CTR=
_FLAG_NOSYNC, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3624  			DMEMIT(" %s", dm_=
raid_arg_name_by_flag(CTR_FLAG_NOSYNC));
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3625  		if (test_bit(__CTR=
_FLAG_REBUILD, &rs->ctr_flags))
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3626  			for (i =3D 0; i <=
 rs->raid_disks; i++)
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3627  				if (test_bit(i, =
(void *) rs->rebuild_disks))
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3628  					DMEMIT(" %s %u"=
, dm_raid_arg_name_by_flag(CTR_FLAG_REBUILD), i);
4464e36e06470e Heinz Mauelshagen     2017-03-18  3629  		if (test_bit(__CTR=
_FLAG_DAEMON_SLEEP, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3630  			DMEMIT(" %s %lu",=
 dm_raid_arg_name_by_flag(CTR_FLAG_DAEMON_SLEEP),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3631  					  mddev->bitmap=
_info.daemon_sleep);
4464e36e06470e Heinz Mauelshagen     2017-03-18  3632  		if (test_bit(__CTR=
_FLAG_MIN_RECOVERY_RATE, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3633  			DMEMIT(" %s %d", =
dm_raid_arg_name_by_flag(CTR_FLAG_MIN_RECOVERY_RATE),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3634  					 mddev->sync_sp=
eed_min);
4464e36e06470e Heinz Mauelshagen     2017-03-18  3635  		if (test_bit(__CTR=
_FLAG_MAX_RECOVERY_RATE, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3636  			DMEMIT(" %s %d", =
dm_raid_arg_name_by_flag(CTR_FLAG_MAX_RECOVERY_RATE),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3637  					 mddev->sync_sp=
eed_max);
43f3952a51f819 Heinz Mauelshagen     2019-12-19  3638  		if (test_bit(__CTR=
_FLAG_WRITE_MOSTLY, &rs->ctr_flags))
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3639  			for (i =3D 0; i <=
 rs->raid_disks; i++)
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3640  				if (test_bit(Wri=
teMostly, &rs->dev[i].rdev.flags))
3fa6cf38211619 Mike Snitzer          2016-06-02  3641  					DMEMIT(" %s %d"=
, dm_raid_arg_name_by_flag(CTR_FLAG_WRITE_MOSTLY),
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3642  					       rs->dev[=
i].rdev.raid_disk);
4286325b4b0dc9 Mike Snitzer          2016-06-02  3643  		if (test_bit(__CTR=
_FLAG_MAX_WRITE_BEHIND, &rs->ctr_flags))
3fa6cf38211619 Mike Snitzer          2016-06-02  3644  			DMEMIT(" %s %lu",=
 dm_raid_arg_name_by_flag(CTR_FLAG_MAX_WRITE_BEHIND),
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3645  					  mddev->bitmap=
_info.max_write_behind);
4464e36e06470e Heinz Mauelshagen     2017-03-18  3646  		if (test_bit(__CTR=
_FLAG_STRIPE_CACHE, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3647  			DMEMIT(" %s %d", =
dm_raid_arg_name_by_flag(CTR_FLAG_STRIPE_CACHE),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3648  					 max_nr_stripes=
);
4464e36e06470e Heinz Mauelshagen     2017-03-18  3649  		if (test_bit(__CTR=
_FLAG_REGION_SIZE, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3650  			DMEMIT(" %s %llu"=
, dm_raid_arg_name_by_flag(CTR_FLAG_REGION_SIZE),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3651  					   (unsigned lo=
ng long) to_sector(mddev->bitmap_info.chunksize));
4464e36e06470e Heinz Mauelshagen     2017-03-18  3652  		if (test_bit(__CTR=
_FLAG_RAID10_COPIES, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3653  			DMEMIT(" %s %d", =
dm_raid_arg_name_by_flag(CTR_FLAG_RAID10_COPIES),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3654  					 raid10_md_layo=
ut_to_copies(mddev->layout));
4464e36e06470e Heinz Mauelshagen     2017-03-18  3655  		if (test_bit(__CTR=
_FLAG_RAID10_FORMAT, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3656  			DMEMIT(" %s %s", =
dm_raid_arg_name_by_flag(CTR_FLAG_RAID10_FORMAT),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3657  					 raid10_md_layo=
ut_to_format(mddev->layout));
4464e36e06470e Heinz Mauelshagen     2017-03-18  3658  		if (test_bit(__CTR=
_FLAG_DELTA_DISKS, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3659  			DMEMIT(" %s %d", =
dm_raid_arg_name_by_flag(CTR_FLAG_DELTA_DISKS),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3660  					 max(rs->delta_=
disks, mddev->delta_disks));
4464e36e06470e Heinz Mauelshagen     2017-03-18  3661  		if (test_bit(__CTR=
_FLAG_DATA_OFFSET, &rs->ctr_flags))
4464e36e06470e Heinz Mauelshagen     2017-03-18  3662  			DMEMIT(" %s %llu"=
, dm_raid_arg_name_by_flag(CTR_FLAG_DATA_OFFSET),
4464e36e06470e Heinz Mauelshagen     2017-03-18  3663  					   (unsigned lo=
ng long) rs->data_offset);
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3664  		if (test_bit(__CTR=
_FLAG_JOURNAL_DEV, &rs->ctr_flags))
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3665  			DMEMIT(" %s %s", =
dm_raid_arg_name_by_flag(CTR_FLAG_JOURNAL_DEV),
63c32ed4afc2af Heinz Mauelshagen     2016-11-30  3666  					__get_dev_name(=
rs->journal_dev.dev));
6e53636fe81465 Heinz Mauelshagen     2017-03-22  3667  		if (test_bit(__CTR=
_FLAG_JOURNAL_MODE, &rs->ctr_flags))
6e53636fe81465 Heinz Mauelshagen     2017-03-22  3668  			DMEMIT(" %s %s", =
dm_raid_arg_name_by_flag(CTR_FLAG_JOURNAL_MODE),
6e53636fe81465 Heinz Mauelshagen     2017-03-22  3669  					 md_journal_mod=
e_to_dm_raid(rs->journal_dev.mode));
3a1c1ef2fd6208 Heinz Mauelshagen     2016-05-19  3670  		DMEMIT(" %d", rs->=
raid_disks);
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3671  		for (i =3D 0; i < =
rs->raid_disks; i++)
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3672  			DMEMIT(" %s %s", =
__get_dev_name(rs->dev[i].meta_dev),
7a7c330fc26652 Heinz Mauelshagen     2016-06-30  3673  					 __get_dev_name=
(rs->dev[i].data_dev));
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3674  		break;
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3675  =

fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3676  	case STATUSTYPE_IMA:
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3677  		rt =3D get_raid_ty=
pe_by_ll(mddev->new_level, mddev->new_layout);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3678  		if (!rt)
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3679  			return;
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3680  =

fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3681  		DMEMIT_TARGET_NAME=
_VERSION(ti->type);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3682  		DMEMIT(",raid_type=
=3D%s,raid_disks=3D%d", rt->name, mddev->raid_disks);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3683  =

fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3684  		/* Access most rec=
ent mddev properties for status output */
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3685  		smp_rmb();
fdac9de80c2e66 Tushar Sugandhi       2021-07-12 @3686  		state =3D decipher=
_sync_action(mddev, recovery);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3687  		DMEMIT(",raid_stat=
e=3D%s", sync_str(state));
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3688  =

fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3689  		for (i =3D 0; i < =
rs->raid_disks; i++) {
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3690  			DMEMIT(",raid_dev=
ice_%d_status=3D", i);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3691  			DMEMIT(__raid_dev=
_status(rs, &rs->dev[i].rdev));
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3692  		}
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3693  =

fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3694  		if (rt_is_raid456(=
rt)) {
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3695  			DMEMIT(",journal_=
dev_mode=3D");
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3696  			switch (rs->journ=
al_dev.mode) {
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3697  			case R5C_JOURNAL_=
MODE_WRITE_THROUGH:
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3698  				DMEMIT("%s",
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3699  				       _raid456_=
journal_mode[R5C_JOURNAL_MODE_WRITE_THROUGH].param);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3700  				break;
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3701  			case R5C_JOURNAL_=
MODE_WRITE_BACK:
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3702  				DMEMIT("%s",
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3703  				       _raid456_=
journal_mode[R5C_JOURNAL_MODE_WRITE_BACK].param);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3704  				break;
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3705  			default:
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3706  				DMEMIT("invalid"=
);
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3707  				break;
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3708  			}
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3709  		}
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3710  		DMEMIT(";");
fdac9de80c2e66 Tushar Sugandhi       2021-07-12  3711  		break;
9d09e663d5502c NeilBrown             2011-01-13  3712  	}
9d09e663d5502c NeilBrown             2011-01-13  3713  }
9d09e663d5502c NeilBrown             2011-01-13  3714  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3367350741769997426==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
P0QG8NbOegIA
--===============3367350741769997426==--

