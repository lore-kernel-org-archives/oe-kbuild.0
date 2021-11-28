Content-Type: multipart/mixed; boundary="===============5478233157837926061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/zoned.c:1072 btrfs_load_block_group_zone_info() error: uninitialized symbol 'ret'.
Date: Sun, 28 Nov 2021 12:27:41 +0800
Message-ID: <202111281205.4YuM17PU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5478233157837926061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Naohiro Aota <naohiro.aota@wdc.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Anand Jain <anand.jain@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 08e11a3db098f4ba0cfee46d7ab449cba43dea1b btrfs: zoned: load zone's =
allocation offset
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-m001-20211116 (https://download.01.org/0day-ci/ar=
chive/20211128/202111281205.4YuM17PU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/zoned.c:1072 btrfs_load_block_group_zone_info() error: uninitializ=
ed symbol 'ret'.

Old smatch warnings:
fs/btrfs/zoned.c:303 btrfs_get_dev_zone_info() warn: should 'zone_sectors <=
< 9' be a 64 bit type?
fs/btrfs/zoned.c:367 btrfs_get_dev_zone_info() warn: should 'sb_zone << (zo=
ne_info->zone_size_shift - 9)' be a 64 bit type?
fs/btrfs/zoned.c:683 btrfs_sb_log_location_bdev() warn: should 'sb_zone << =
zone_sectors_shift' be a 64 bit type?
fs/btrfs/zoned.c:788 btrfs_reset_sb_log_zones() warn: should 'sb_zone << zo=
ne_sectors_shift' be a 64 bit type?

vim +/ret +1072 fs/btrfs/zoned.c

08e11a3db098f4 Naohiro Aota 2021-02-04   929  =

08e11a3db098f4 Naohiro Aota 2021-02-04   930  int btrfs_load_block_group_zo=
ne_info(struct btrfs_block_group *cache)
08e11a3db098f4 Naohiro Aota 2021-02-04   931  {
08e11a3db098f4 Naohiro Aota 2021-02-04   932  	struct btrfs_fs_info *fs_inf=
o =3D cache->fs_info;
08e11a3db098f4 Naohiro Aota 2021-02-04   933  	struct extent_map_tree *em_t=
ree =3D &fs_info->mapping_tree;
08e11a3db098f4 Naohiro Aota 2021-02-04   934  	struct extent_map *em;
08e11a3db098f4 Naohiro Aota 2021-02-04   935  	struct map_lookup *map;
08e11a3db098f4 Naohiro Aota 2021-02-04   936  	struct btrfs_device *device;
08e11a3db098f4 Naohiro Aota 2021-02-04   937  	u64 logical =3D cache->start;
08e11a3db098f4 Naohiro Aota 2021-02-04   938  	u64 length =3D cache->length;
08e11a3db098f4 Naohiro Aota 2021-02-04   939  	u64 physical =3D 0;
08e11a3db098f4 Naohiro Aota 2021-02-04   940  	int ret;
08e11a3db098f4 Naohiro Aota 2021-02-04   941  	int i;
08e11a3db098f4 Naohiro Aota 2021-02-04   942  	unsigned int nofs_flag;
08e11a3db098f4 Naohiro Aota 2021-02-04   943  	u64 *alloc_offsets =3D NULL;
08e11a3db098f4 Naohiro Aota 2021-02-04   944  	u32 num_sequential =3D 0, nu=
m_conventional =3D 0;
08e11a3db098f4 Naohiro Aota 2021-02-04   945  =

08e11a3db098f4 Naohiro Aota 2021-02-04   946  	if (!btrfs_is_zoned(fs_info))
08e11a3db098f4 Naohiro Aota 2021-02-04   947  		return 0;
08e11a3db098f4 Naohiro Aota 2021-02-04   948  =

08e11a3db098f4 Naohiro Aota 2021-02-04   949  	/* Sanity check */
08e11a3db098f4 Naohiro Aota 2021-02-04   950  	if (!IS_ALIGNED(length, fs_i=
nfo->zone_size)) {
08e11a3db098f4 Naohiro Aota 2021-02-04   951  		btrfs_err(fs_info,
08e11a3db098f4 Naohiro Aota 2021-02-04   952  		"zoned: block group %llu le=
n %llu unaligned to zone size %llu",
08e11a3db098f4 Naohiro Aota 2021-02-04   953  			  logical, length, fs_info=
->zone_size);
08e11a3db098f4 Naohiro Aota 2021-02-04   954  		return -EIO;
08e11a3db098f4 Naohiro Aota 2021-02-04   955  	}
08e11a3db098f4 Naohiro Aota 2021-02-04   956  =

08e11a3db098f4 Naohiro Aota 2021-02-04   957  	/* Get the chunk mapping */
08e11a3db098f4 Naohiro Aota 2021-02-04   958  	read_lock(&em_tree->lock);
08e11a3db098f4 Naohiro Aota 2021-02-04   959  	em =3D lookup_extent_mapping=
(em_tree, logical, length);
08e11a3db098f4 Naohiro Aota 2021-02-04   960  	read_unlock(&em_tree->lock);
08e11a3db098f4 Naohiro Aota 2021-02-04   961  =

08e11a3db098f4 Naohiro Aota 2021-02-04   962  	if (!em)
08e11a3db098f4 Naohiro Aota 2021-02-04   963  		return -EINVAL;
08e11a3db098f4 Naohiro Aota 2021-02-04   964  =

08e11a3db098f4 Naohiro Aota 2021-02-04   965  	map =3D em->map_lookup;
08e11a3db098f4 Naohiro Aota 2021-02-04   966  =

08e11a3db098f4 Naohiro Aota 2021-02-04   967  	alloc_offsets =3D kcalloc(ma=
p->num_stripes, sizeof(*alloc_offsets), GFP_NOFS);
08e11a3db098f4 Naohiro Aota 2021-02-04   968  	if (!alloc_offsets) {
08e11a3db098f4 Naohiro Aota 2021-02-04   969  		free_extent_map(em);
08e11a3db098f4 Naohiro Aota 2021-02-04   970  		return -ENOMEM;
08e11a3db098f4 Naohiro Aota 2021-02-04   971  	}
08e11a3db098f4 Naohiro Aota 2021-02-04   972  =

08e11a3db098f4 Naohiro Aota 2021-02-04   973  	for (i =3D 0; i < map->num_s=
tripes; i++) {
08e11a3db098f4 Naohiro Aota 2021-02-04   974  		bool is_sequential;
08e11a3db098f4 Naohiro Aota 2021-02-04   975  		struct blk_zone zone;
08e11a3db098f4 Naohiro Aota 2021-02-04   976  =

08e11a3db098f4 Naohiro Aota 2021-02-04   977  		device =3D map->stripes[i].=
dev;
08e11a3db098f4 Naohiro Aota 2021-02-04   978  		physical =3D map->stripes[i=
].physical;
08e11a3db098f4 Naohiro Aota 2021-02-04   979  =

08e11a3db098f4 Naohiro Aota 2021-02-04   980  		if (device->bdev =3D=3D NUL=
L) {
08e11a3db098f4 Naohiro Aota 2021-02-04   981  			alloc_offsets[i] =3D WP_MI=
SSING_DEV;
08e11a3db098f4 Naohiro Aota 2021-02-04   982  			continue;
08e11a3db098f4 Naohiro Aota 2021-02-04   983  		}
08e11a3db098f4 Naohiro Aota 2021-02-04   984  =

08e11a3db098f4 Naohiro Aota 2021-02-04   985  		is_sequential =3D btrfs_dev=
_is_sequential(device, physical);
08e11a3db098f4 Naohiro Aota 2021-02-04   986  		if (is_sequential)
08e11a3db098f4 Naohiro Aota 2021-02-04   987  			num_sequential++;
08e11a3db098f4 Naohiro Aota 2021-02-04   988  		else
08e11a3db098f4 Naohiro Aota 2021-02-04   989  			num_conventional++;
08e11a3db098f4 Naohiro Aota 2021-02-04   990  =

08e11a3db098f4 Naohiro Aota 2021-02-04   991  		if (!is_sequential) {
08e11a3db098f4 Naohiro Aota 2021-02-04   992  			alloc_offsets[i] =3D WP_CO=
NVENTIONAL;
08e11a3db098f4 Naohiro Aota 2021-02-04   993  			continue;
08e11a3db098f4 Naohiro Aota 2021-02-04   994  		}
08e11a3db098f4 Naohiro Aota 2021-02-04   995  =

08e11a3db098f4 Naohiro Aota 2021-02-04   996  		/*
08e11a3db098f4 Naohiro Aota 2021-02-04   997  		 * This zone will be used f=
or allocation, so mark this zone
08e11a3db098f4 Naohiro Aota 2021-02-04   998  		 * non-empty.
08e11a3db098f4 Naohiro Aota 2021-02-04   999  		 */
08e11a3db098f4 Naohiro Aota 2021-02-04  1000  		btrfs_dev_clear_zone_empty(=
device, physical);
08e11a3db098f4 Naohiro Aota 2021-02-04  1001  =

08e11a3db098f4 Naohiro Aota 2021-02-04  1002  		/*
08e11a3db098f4 Naohiro Aota 2021-02-04  1003  		 * The group is mapped to a=
 sequential zone. Get the zone write
08e11a3db098f4 Naohiro Aota 2021-02-04  1004  		 * pointer to determine the=
 allocation offset within the zone.
08e11a3db098f4 Naohiro Aota 2021-02-04  1005  		 */
08e11a3db098f4 Naohiro Aota 2021-02-04  1006  		WARN_ON(!IS_ALIGNED(physica=
l, fs_info->zone_size));
08e11a3db098f4 Naohiro Aota 2021-02-04  1007  		nofs_flag =3D memalloc_nofs=
_save();
08e11a3db098f4 Naohiro Aota 2021-02-04  1008  		ret =3D btrfs_get_dev_zone(=
device, physical, &zone);
08e11a3db098f4 Naohiro Aota 2021-02-04  1009  		memalloc_nofs_restore(nofs_=
flag);
08e11a3db098f4 Naohiro Aota 2021-02-04  1010  		if (ret =3D=3D -EIO || ret =
=3D=3D -EOPNOTSUPP) {
08e11a3db098f4 Naohiro Aota 2021-02-04  1011  			ret =3D 0;
08e11a3db098f4 Naohiro Aota 2021-02-04  1012  			alloc_offsets[i] =3D WP_MI=
SSING_DEV;
08e11a3db098f4 Naohiro Aota 2021-02-04  1013  			continue;
08e11a3db098f4 Naohiro Aota 2021-02-04  1014  		} else if (ret) {
08e11a3db098f4 Naohiro Aota 2021-02-04  1015  			goto out;
08e11a3db098f4 Naohiro Aota 2021-02-04  1016  		}
08e11a3db098f4 Naohiro Aota 2021-02-04  1017  =

08e11a3db098f4 Naohiro Aota 2021-02-04  1018  		switch (zone.cond) {
08e11a3db098f4 Naohiro Aota 2021-02-04  1019  		case BLK_ZONE_COND_OFFLINE:
08e11a3db098f4 Naohiro Aota 2021-02-04  1020  		case BLK_ZONE_COND_READONLY:
08e11a3db098f4 Naohiro Aota 2021-02-04  1021  			btrfs_err(fs_info,
08e11a3db098f4 Naohiro Aota 2021-02-04  1022  		"zoned: offline/readonly zo=
ne %llu on device %s (devid %llu)",
08e11a3db098f4 Naohiro Aota 2021-02-04  1023  				  physical >> device->zon=
e_info->zone_size_shift,
08e11a3db098f4 Naohiro Aota 2021-02-04  1024  				  rcu_str_deref(device->n=
ame), device->devid);
08e11a3db098f4 Naohiro Aota 2021-02-04  1025  			alloc_offsets[i] =3D WP_MI=
SSING_DEV;
08e11a3db098f4 Naohiro Aota 2021-02-04  1026  			break;
08e11a3db098f4 Naohiro Aota 2021-02-04  1027  		case BLK_ZONE_COND_EMPTY:
08e11a3db098f4 Naohiro Aota 2021-02-04  1028  			alloc_offsets[i] =3D 0;
08e11a3db098f4 Naohiro Aota 2021-02-04  1029  			break;
08e11a3db098f4 Naohiro Aota 2021-02-04  1030  		case BLK_ZONE_COND_FULL:
08e11a3db098f4 Naohiro Aota 2021-02-04  1031  			alloc_offsets[i] =3D fs_in=
fo->zone_size;
08e11a3db098f4 Naohiro Aota 2021-02-04  1032  			break;
08e11a3db098f4 Naohiro Aota 2021-02-04  1033  		default:
08e11a3db098f4 Naohiro Aota 2021-02-04  1034  			/* Partially used zone */
08e11a3db098f4 Naohiro Aota 2021-02-04  1035  			alloc_offsets[i] =3D
08e11a3db098f4 Naohiro Aota 2021-02-04  1036  					((zone.wp - zone.start) =
<< SECTOR_SHIFT);
08e11a3db098f4 Naohiro Aota 2021-02-04  1037  			break;
08e11a3db098f4 Naohiro Aota 2021-02-04  1038  		}
08e11a3db098f4 Naohiro Aota 2021-02-04  1039  	}
08e11a3db098f4 Naohiro Aota 2021-02-04  1040  =

08e11a3db098f4 Naohiro Aota 2021-02-04  1041  	if (num_conventional > 0) {
08e11a3db098f4 Naohiro Aota 2021-02-04  1042  		/*
08e11a3db098f4 Naohiro Aota 2021-02-04  1043  		 * Since conventional zones=
 do not have a write pointer, we
08e11a3db098f4 Naohiro Aota 2021-02-04  1044  		 * cannot determine alloc_o=
ffset from the pointer
08e11a3db098f4 Naohiro Aota 2021-02-04  1045  		 */
08e11a3db098f4 Naohiro Aota 2021-02-04  1046  		ret =3D -EINVAL;
08e11a3db098f4 Naohiro Aota 2021-02-04  1047  		goto out;
08e11a3db098f4 Naohiro Aota 2021-02-04  1048  	}
08e11a3db098f4 Naohiro Aota 2021-02-04  1049  =

08e11a3db098f4 Naohiro Aota 2021-02-04  1050  	switch (map->type & BTRFS_BL=
OCK_GROUP_PROFILE_MASK) {
08e11a3db098f4 Naohiro Aota 2021-02-04  1051  	case 0: /* single */
08e11a3db098f4 Naohiro Aota 2021-02-04  1052  		cache->alloc_offset =3D all=
oc_offsets[0];
08e11a3db098f4 Naohiro Aota 2021-02-04  1053  		break;
08e11a3db098f4 Naohiro Aota 2021-02-04  1054  	case BTRFS_BLOCK_GROUP_DUP:
08e11a3db098f4 Naohiro Aota 2021-02-04  1055  	case BTRFS_BLOCK_GROUP_RAID1:
08e11a3db098f4 Naohiro Aota 2021-02-04  1056  	case BTRFS_BLOCK_GROUP_RAID0:
08e11a3db098f4 Naohiro Aota 2021-02-04  1057  	case BTRFS_BLOCK_GROUP_RAID1=
0:
08e11a3db098f4 Naohiro Aota 2021-02-04  1058  	case BTRFS_BLOCK_GROUP_RAID5:
08e11a3db098f4 Naohiro Aota 2021-02-04  1059  	case BTRFS_BLOCK_GROUP_RAID6:
08e11a3db098f4 Naohiro Aota 2021-02-04  1060  		/* non-single profiles are =
not supported yet */
08e11a3db098f4 Naohiro Aota 2021-02-04  1061  	default:
08e11a3db098f4 Naohiro Aota 2021-02-04  1062  		btrfs_err(fs_info, "zoned: =
profile %s not yet supported",
08e11a3db098f4 Naohiro Aota 2021-02-04  1063  			  btrfs_bg_type_to_raid_na=
me(map->type));
08e11a3db098f4 Naohiro Aota 2021-02-04  1064  		ret =3D -EINVAL;
08e11a3db098f4 Naohiro Aota 2021-02-04  1065  		goto out;
08e11a3db098f4 Naohiro Aota 2021-02-04  1066  	}
08e11a3db098f4 Naohiro Aota 2021-02-04  1067  =

08e11a3db098f4 Naohiro Aota 2021-02-04  1068  out:
08e11a3db098f4 Naohiro Aota 2021-02-04  1069  	kfree(alloc_offsets);
08e11a3db098f4 Naohiro Aota 2021-02-04  1070  	free_extent_map(em);
08e11a3db098f4 Naohiro Aota 2021-02-04  1071  =

08e11a3db098f4 Naohiro Aota 2021-02-04 @1072  	return ret;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5478233157837926061==--

