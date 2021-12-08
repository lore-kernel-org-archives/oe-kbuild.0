Content-Type: multipart/mixed; boundary="===============1706922628501886357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] btrfs: zoned: free zone_cache when freeing zone_info
Date: Thu, 09 Dec 2021 06:11:28 +0800
Message-ID: <202112090657.BflsS2SD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1706922628501886357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <f3ea96654bb7f39afb15555dece992f2a8479608.1638879879.git.johan=
nes.thumshirn@wdc.com>
References: <f3ea96654bb7f39afb15555dece992f2a8479608.1638879879.git.johann=
es.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Johannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20211208]
[cannot apply to v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Johannes-Thumshirn/btrfs-z=
oned-free-zone_cache-when-freeing-zone_info/20211207-215928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211209/202112090657.BflsS2SD-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/zoned.c:597 btrfs_get_dev_zone_info() warn: possible memory leak o=
f 'zone_info'

Old smatch warnings:
fs/btrfs/zoned.c:169 sb_zone_number() error: uninitialized symbol 'zone'.
fs/btrfs/zoned.c:1452 btrfs_load_block_group_zone_info() error: uninitializ=
ed symbol 'ret'.

vim +/zone_info +597 fs/btrfs/zoned.c

7365104236ade0b Naohiro Aota       2021-02-04  347  =

1c0066baa869433 Naohiro Aota       2021-11-11  348  int btrfs_get_dev_zone_=
info(struct btrfs_device *device, bool populate_cache)
5b316468983dfa9 Naohiro Aota       2020-11-10  349  {
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  350  	struct btrfs_fs_info *=
fs_info =3D device->fs_info;
5b316468983dfa9 Naohiro Aota       2020-11-10  351  	struct btrfs_zoned_dev=
ice_info *zone_info =3D NULL;
5b316468983dfa9 Naohiro Aota       2020-11-10  352  	struct block_device *b=
dev =3D device->bdev;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  353  	struct request_queue *=
queue =3D bdev_get_queue(bdev);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  354  	unsigned int max_activ=
e_zones;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  355  	unsigned int nactive;
5b316468983dfa9 Naohiro Aota       2020-11-10  356  	sector_t nr_sectors;
5b316468983dfa9 Naohiro Aota       2020-11-10  357  	sector_t sector =3D 0;
5b316468983dfa9 Naohiro Aota       2020-11-10  358  	struct blk_zone *zones=
 =3D NULL;
5b316468983dfa9 Naohiro Aota       2020-11-10  359  	unsigned int i, nrepor=
ted =3D 0, nr_zones;
d734492a14a2da6 Naohiro Aota       2021-03-03  360  	sector_t zone_sectors;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  361  	char *model, *emulated;
5b316468983dfa9 Naohiro Aota       2020-11-10  362  	int ret;
5b316468983dfa9 Naohiro Aota       2020-11-10  363  =

3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  364  	/*
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  365  	 * Cannot use btrfs_is=
_zoned here, since fs_info::zone_size might not
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  366  	 * yet be set.
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  367  	 */
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  368  	if (!btrfs_fs_incompat=
(fs_info, ZONED))
5b316468983dfa9 Naohiro Aota       2020-11-10  369  		return 0;
5b316468983dfa9 Naohiro Aota       2020-11-10  370  =

5b316468983dfa9 Naohiro Aota       2020-11-10  371  	if (device->zone_info)
5b316468983dfa9 Naohiro Aota       2020-11-10  372  		return 0;
5b316468983dfa9 Naohiro Aota       2020-11-10  373  =

5b316468983dfa9 Naohiro Aota       2020-11-10  374  	zone_info =3D kzalloc(=
sizeof(*zone_info), GFP_KERNEL);
5b316468983dfa9 Naohiro Aota       2020-11-10  375  	if (!zone_info)
5b316468983dfa9 Naohiro Aota       2020-11-10  376  		return -ENOMEM;
5b316468983dfa9 Naohiro Aota       2020-11-10  377  =

3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  378  	if (!bdev_is_zoned(bde=
v)) {
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  379  		if (!fs_info->zone_si=
ze) {
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  380  			ret =3D calculate_em=
ulated_zone_size(fs_info);
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  381  			if (ret)
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  382  				goto out;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  383  		}
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  384  =

3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  385  		ASSERT(fs_info->zone_=
size);
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  386  		zone_sectors =3D fs_i=
nfo->zone_size >> SECTOR_SHIFT;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  387  	} else {
5b316468983dfa9 Naohiro Aota       2020-11-10  388  		zone_sectors =3D bdev=
_zone_sectors(bdev);
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  389  	}
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  390  =

5b316468983dfa9 Naohiro Aota       2020-11-10  391  	/* Check if it's power=
 of 2 (see is_power_of_2) */
5b316468983dfa9 Naohiro Aota       2020-11-10  392  	ASSERT(zone_sectors !=
=3D 0 && (zone_sectors & (zone_sectors - 1)) =3D=3D 0);
5b316468983dfa9 Naohiro Aota       2020-11-10  393  	zone_info->zone_size =
=3D zone_sectors << SECTOR_SHIFT;
53b74fa990bf76f Naohiro Aota       2021-04-08  394  =

53b74fa990bf76f Naohiro Aota       2021-04-08  395  	/* We reject devices w=
ith a zone size larger than 8GB */
53b74fa990bf76f Naohiro Aota       2021-04-08  396  	if (zone_info->zone_si=
ze > BTRFS_MAX_ZONE_SIZE) {
53b74fa990bf76f Naohiro Aota       2021-04-08  397  		btrfs_err_in_rcu(fs_i=
nfo,
53b74fa990bf76f Naohiro Aota       2021-04-08  398  		"zoned: %s: zone size=
 %llu larger than supported maximum %llu",
53b74fa990bf76f Naohiro Aota       2021-04-08  399  				 rcu_str_deref(devi=
ce->name),
53b74fa990bf76f Naohiro Aota       2021-04-08  400  				 zone_info->zone_si=
ze, BTRFS_MAX_ZONE_SIZE);
53b74fa990bf76f Naohiro Aota       2021-04-08  401  		ret =3D -EINVAL;
53b74fa990bf76f Naohiro Aota       2021-04-08  402  		goto out;
53b74fa990bf76f Naohiro Aota       2021-04-08  403  	}
53b74fa990bf76f Naohiro Aota       2021-04-08  404  =

53b74fa990bf76f Naohiro Aota       2021-04-08  405  	nr_sectors =3D bdev_nr=
_sectors(bdev);
5b316468983dfa9 Naohiro Aota       2020-11-10  406  	zone_info->zone_size_s=
hift =3D ilog2(zone_info->zone_size);
5b316468983dfa9 Naohiro Aota       2020-11-10  407  	zone_info->nr_zones =
=3D nr_sectors >> ilog2(zone_sectors);
5b316468983dfa9 Naohiro Aota       2020-11-10  408  	if (!IS_ALIGNED(nr_sec=
tors, zone_sectors))
5b316468983dfa9 Naohiro Aota       2020-11-10  409  		zone_info->nr_zones++;
5b316468983dfa9 Naohiro Aota       2020-11-10  410  =

ea6f8ddcde63812 Naohiro Aota       2021-08-19  411  	max_active_zones =3D q=
ueue_max_active_zones(queue);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  412  	if (max_active_zones &=
& max_active_zones < BTRFS_MIN_ACTIVE_ZONES) {
ea6f8ddcde63812 Naohiro Aota       2021-08-19  413  		btrfs_err_in_rcu(fs_i=
nfo,
ea6f8ddcde63812 Naohiro Aota       2021-08-19  414  "zoned: %s: max active =
zones %u is too small, need@least %u active zones",
ea6f8ddcde63812 Naohiro Aota       2021-08-19  415  				 rcu_str_deref(devi=
ce->name), max_active_zones,
ea6f8ddcde63812 Naohiro Aota       2021-08-19  416  				 BTRFS_MIN_ACTIVE_Z=
ONES);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  417  		ret =3D -EINVAL;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  418  		goto out;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  419  	}
ea6f8ddcde63812 Naohiro Aota       2021-08-19  420  	zone_info->max_active_=
zones =3D max_active_zones;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  421  =

5b316468983dfa9 Naohiro Aota       2020-11-10  422  	zone_info->seq_zones =
=3D bitmap_zalloc(zone_info->nr_zones, GFP_KERNEL);
5b316468983dfa9 Naohiro Aota       2020-11-10  423  	if (!zone_info->seq_zo=
nes) {
5b316468983dfa9 Naohiro Aota       2020-11-10  424  		ret =3D -ENOMEM;
5b316468983dfa9 Naohiro Aota       2020-11-10  425  		goto out;
5b316468983dfa9 Naohiro Aota       2020-11-10  426  	}
5b316468983dfa9 Naohiro Aota       2020-11-10  427  =

5b316468983dfa9 Naohiro Aota       2020-11-10  428  	zone_info->empty_zones=
 =3D bitmap_zalloc(zone_info->nr_zones, GFP_KERNEL);
5b316468983dfa9 Naohiro Aota       2020-11-10  429  	if (!zone_info->empty_=
zones) {
5b316468983dfa9 Naohiro Aota       2020-11-10  430  		ret =3D -ENOMEM;
5b316468983dfa9 Naohiro Aota       2020-11-10  431  		goto out;
5b316468983dfa9 Naohiro Aota       2020-11-10  432  	}
5b316468983dfa9 Naohiro Aota       2020-11-10  433  =

ea6f8ddcde63812 Naohiro Aota       2021-08-19  434  	zone_info->active_zone=
s =3D bitmap_zalloc(zone_info->nr_zones, GFP_KERNEL);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  435  	if (!zone_info->active=
_zones) {
ea6f8ddcde63812 Naohiro Aota       2021-08-19  436  		ret =3D -ENOMEM;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  437  		goto out;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  438  	}
ea6f8ddcde63812 Naohiro Aota       2021-08-19  439  =

5b316468983dfa9 Naohiro Aota       2020-11-10  440  	zones =3D kcalloc(BTRF=
S_REPORT_NR_ZONES, sizeof(struct blk_zone), GFP_KERNEL);
5b316468983dfa9 Naohiro Aota       2020-11-10  441  	if (!zones) {
5b316468983dfa9 Naohiro Aota       2020-11-10  442  		ret =3D -ENOMEM;
5b316468983dfa9 Naohiro Aota       2020-11-10  443  		goto out;
5b316468983dfa9 Naohiro Aota       2020-11-10  444  	}
5b316468983dfa9 Naohiro Aota       2020-11-10  445  =

1c0066baa869433 Naohiro Aota       2021-11-11  446  	/*
1c0066baa869433 Naohiro Aota       2021-11-11  447  	 * Enable zone cache o=
nly for a zoned device. On a non-zoned device, we
1c0066baa869433 Naohiro Aota       2021-11-11  448  	 * fill the zone info =
with emulated CONVENTIONAL zones, so no need to
1c0066baa869433 Naohiro Aota       2021-11-11  449  	 * use the cache.
1c0066baa869433 Naohiro Aota       2021-11-11  450  	 */
1c0066baa869433 Naohiro Aota       2021-11-11  451  	if (populate_cache && =
bdev_is_zoned(device->bdev)) {
1c0066baa869433 Naohiro Aota       2021-11-11  452  		zone_info->zone_cache=
 =3D vzalloc(sizeof(struct blk_zone) *
1c0066baa869433 Naohiro Aota       2021-11-11  453  						zone_info->nr_zon=
es);
1c0066baa869433 Naohiro Aota       2021-11-11  454  		if (!zone_info->zone_=
cache) {
1c0066baa869433 Naohiro Aota       2021-11-11  455  			btrfs_err_in_rcu(dev=
ice->fs_info,
1c0066baa869433 Naohiro Aota       2021-11-11  456  				"zoned: failed to a=
llocate zone cache for %s",
1c0066baa869433 Naohiro Aota       2021-11-11  457  				rcu_str_deref(devic=
e->name));
1c0066baa869433 Naohiro Aota       2021-11-11  458  			ret =3D -ENOMEM;
1c0066baa869433 Naohiro Aota       2021-11-11  459  			goto out;
1c0066baa869433 Naohiro Aota       2021-11-11  460  		}
1c0066baa869433 Naohiro Aota       2021-11-11  461  	}
1c0066baa869433 Naohiro Aota       2021-11-11  462  =

1c0066baa869433 Naohiro Aota       2021-11-11  463  	device->zone_info =3D =
zone_info;
1c0066baa869433 Naohiro Aota       2021-11-11  464  =

5b316468983dfa9 Naohiro Aota       2020-11-10  465  	/* Get zones type */
ea6f8ddcde63812 Naohiro Aota       2021-08-19  466  	nactive =3D 0;
5b316468983dfa9 Naohiro Aota       2020-11-10  467  	while (sector < nr_sec=
tors) {
5b316468983dfa9 Naohiro Aota       2020-11-10  468  		nr_zones =3D BTRFS_RE=
PORT_NR_ZONES;
5b316468983dfa9 Naohiro Aota       2020-11-10  469  		ret =3D btrfs_get_dev=
_zones(device, sector << SECTOR_SHIFT, zones,
5b316468983dfa9 Naohiro Aota       2020-11-10  470  					  &nr_zones);
5b316468983dfa9 Naohiro Aota       2020-11-10  471  		if (ret)
5b316468983dfa9 Naohiro Aota       2020-11-10  472  			goto out;
5b316468983dfa9 Naohiro Aota       2020-11-10  473  =

5b316468983dfa9 Naohiro Aota       2020-11-10  474  		for (i =3D 0; i < nr_=
zones; i++) {
5b316468983dfa9 Naohiro Aota       2020-11-10  475  			if (zones[i].type =
=3D=3D BLK_ZONE_TYPE_SEQWRITE_REQ)
5b316468983dfa9 Naohiro Aota       2020-11-10  476  				__set_bit(nreported=
, zone_info->seq_zones);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  477  			switch (zones[i].con=
d) {
ea6f8ddcde63812 Naohiro Aota       2021-08-19  478  			case BLK_ZONE_COND_E=
MPTY:
5b316468983dfa9 Naohiro Aota       2020-11-10  479  				__set_bit(nreported=
, zone_info->empty_zones);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  480  				break;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  481  			case BLK_ZONE_COND_I=
MP_OPEN:
ea6f8ddcde63812 Naohiro Aota       2021-08-19  482  			case BLK_ZONE_COND_E=
XP_OPEN:
ea6f8ddcde63812 Naohiro Aota       2021-08-19  483  			case BLK_ZONE_COND_C=
LOSED:
ea6f8ddcde63812 Naohiro Aota       2021-08-19  484  				__set_bit(nreported=
, zone_info->active_zones);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  485  				nactive++;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  486  				break;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  487  			}
5b316468983dfa9 Naohiro Aota       2020-11-10  488  			nreported++;
5b316468983dfa9 Naohiro Aota       2020-11-10  489  		}
5b316468983dfa9 Naohiro Aota       2020-11-10  490  		sector =3D zones[nr_z=
ones - 1].start + zones[nr_zones - 1].len;
5b316468983dfa9 Naohiro Aota       2020-11-10  491  	}
5b316468983dfa9 Naohiro Aota       2020-11-10  492  =

5b316468983dfa9 Naohiro Aota       2020-11-10  493  	if (nreported !=3D zon=
e_info->nr_zones) {
5b316468983dfa9 Naohiro Aota       2020-11-10  494  		btrfs_err_in_rcu(devi=
ce->fs_info,
5b316468983dfa9 Naohiro Aota       2020-11-10  495  				 "inconsistent numb=
er of zones on %s (%u/%u)",
5b316468983dfa9 Naohiro Aota       2020-11-10  496  				 rcu_str_deref(devi=
ce->name), nreported,
5b316468983dfa9 Naohiro Aota       2020-11-10  497  				 zone_info->nr_zone=
s);
5b316468983dfa9 Naohiro Aota       2020-11-10  498  		ret =3D -EIO;
5b316468983dfa9 Naohiro Aota       2020-11-10  499  		goto out;
5b316468983dfa9 Naohiro Aota       2020-11-10  500  	}
5b316468983dfa9 Naohiro Aota       2020-11-10  501  =

ea6f8ddcde63812 Naohiro Aota       2021-08-19  502  	if (max_active_zones) {
ea6f8ddcde63812 Naohiro Aota       2021-08-19  503  		if (nactive > max_act=
ive_zones) {
ea6f8ddcde63812 Naohiro Aota       2021-08-19  504  			btrfs_err_in_rcu(dev=
ice->fs_info,
ea6f8ddcde63812 Naohiro Aota       2021-08-19  505  			"zoned: %u active zo=
nes on %s exceeds max_active_zones %u",
ea6f8ddcde63812 Naohiro Aota       2021-08-19  506  					 nactive, rcu_str_=
deref(device->name),
ea6f8ddcde63812 Naohiro Aota       2021-08-19  507  					 max_active_zones);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  508  			ret =3D -EIO;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  509  			goto out;
ea6f8ddcde63812 Naohiro Aota       2021-08-19  510  		}
ea6f8ddcde63812 Naohiro Aota       2021-08-19  511  		atomic_set(&zone_info=
->active_zones_left,
ea6f8ddcde63812 Naohiro Aota       2021-08-19  512  			   max_active_zones =
- nactive);
ea6f8ddcde63812 Naohiro Aota       2021-08-19  513  	}
ea6f8ddcde63812 Naohiro Aota       2021-08-19  514  =

12659251ca5df05 Naohiro Aota       2020-11-10  515  	/* Validate superblock=
 log */
12659251ca5df05 Naohiro Aota       2020-11-10  516  	nr_zones =3D BTRFS_NR_=
SB_LOG_ZONES;
12659251ca5df05 Naohiro Aota       2020-11-10  517  	for (i =3D 0; i < BTRF=
S_SUPER_MIRROR_MAX; i++) {
12659251ca5df05 Naohiro Aota       2020-11-10  518  		u32 sb_zone;
12659251ca5df05 Naohiro Aota       2020-11-10  519  		u64 sb_wp;
12659251ca5df05 Naohiro Aota       2020-11-10  520  		int sb_pos =3D BTRFS_=
NR_SB_LOG_ZONES * i;
12659251ca5df05 Naohiro Aota       2020-11-10  521  =

12659251ca5df05 Naohiro Aota       2020-11-10  522  		sb_zone =3D sb_zone_n=
umber(zone_info->zone_size_shift, i);
12659251ca5df05 Naohiro Aota       2020-11-10  523  		if (sb_zone + 1 >=3D =
zone_info->nr_zones)
12659251ca5df05 Naohiro Aota       2020-11-10  524  			continue;
12659251ca5df05 Naohiro Aota       2020-11-10  525  =

5b434df8778771d Naohiro Aota       2021-05-27  526  		ret =3D btrfs_get_dev=
_zones(device,
5b434df8778771d Naohiro Aota       2021-05-27  527  					  zone_start_physi=
cal(sb_zone, zone_info),
12659251ca5df05 Naohiro Aota       2020-11-10  528  					  &zone_info->sb_z=
ones[sb_pos],
12659251ca5df05 Naohiro Aota       2020-11-10  529  					  &nr_zones);
12659251ca5df05 Naohiro Aota       2020-11-10  530  		if (ret)
12659251ca5df05 Naohiro Aota       2020-11-10  531  			goto out;
12659251ca5df05 Naohiro Aota       2020-11-10  532  =

12659251ca5df05 Naohiro Aota       2020-11-10  533  		if (nr_zones !=3D BTR=
FS_NR_SB_LOG_ZONES) {
12659251ca5df05 Naohiro Aota       2020-11-10  534  			btrfs_err_in_rcu(dev=
ice->fs_info,
12659251ca5df05 Naohiro Aota       2020-11-10  535  	"zoned: failed to read=
 super block log zone info at devid %llu zone %u",
12659251ca5df05 Naohiro Aota       2020-11-10  536  					 device->devid, sb=
_zone);
12659251ca5df05 Naohiro Aota       2020-11-10  537  			ret =3D -EUCLEAN;
12659251ca5df05 Naohiro Aota       2020-11-10  538  			goto out;
12659251ca5df05 Naohiro Aota       2020-11-10  539  		}
12659251ca5df05 Naohiro Aota       2020-11-10  540  =

12659251ca5df05 Naohiro Aota       2020-11-10  541  		/*
1a9fd4172d5c8ba David Sterba       2021-05-21  542  		 * If zones[0] is con=
ventional, always use the beginning of the
12659251ca5df05 Naohiro Aota       2020-11-10  543  		 * zone to record sup=
erblock. No need to validate in that case.
12659251ca5df05 Naohiro Aota       2020-11-10  544  		 */
12659251ca5df05 Naohiro Aota       2020-11-10  545  		if (zone_info->sb_zon=
es[BTRFS_NR_SB_LOG_ZONES * i].type =3D=3D
12659251ca5df05 Naohiro Aota       2020-11-10  546  		    BLK_ZONE_TYPE_CON=
VENTIONAL)
12659251ca5df05 Naohiro Aota       2020-11-10  547  			continue;
12659251ca5df05 Naohiro Aota       2020-11-10  548  =

12659251ca5df05 Naohiro Aota       2020-11-10  549  		ret =3D sb_write_poin=
ter(device->bdev,
12659251ca5df05 Naohiro Aota       2020-11-10  550  				       &zone_info->=
sb_zones[sb_pos], &sb_wp);
12659251ca5df05 Naohiro Aota       2020-11-10  551  		if (ret !=3D -ENOENT =
&& ret) {
12659251ca5df05 Naohiro Aota       2020-11-10  552  			btrfs_err_in_rcu(dev=
ice->fs_info,
12659251ca5df05 Naohiro Aota       2020-11-10  553  			"zoned: super block =
log zone corrupted devid %llu zone %u",
12659251ca5df05 Naohiro Aota       2020-11-10  554  					 device->devid, sb=
_zone);
12659251ca5df05 Naohiro Aota       2020-11-10  555  			ret =3D -EUCLEAN;
12659251ca5df05 Naohiro Aota       2020-11-10  556  			goto out;
12659251ca5df05 Naohiro Aota       2020-11-10  557  		}
12659251ca5df05 Naohiro Aota       2020-11-10  558  	}
12659251ca5df05 Naohiro Aota       2020-11-10  559  =

12659251ca5df05 Naohiro Aota       2020-11-10  560  =

5b316468983dfa9 Naohiro Aota       2020-11-10  561  	kfree(zones);
5b316468983dfa9 Naohiro Aota       2020-11-10  562  =

3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  563  	switch (bdev_zoned_mod=
el(bdev)) {
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  564  	case BLK_ZONED_HM:
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  565  		model =3D "host-manag=
ed zoned";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  566  		emulated =3D "";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  567  		break;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  568  	case BLK_ZONED_HA:
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  569  		model =3D "host-aware=
 zoned";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  570  		emulated =3D "";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  571  		break;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  572  	case BLK_ZONED_NONE:
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  573  		model =3D "regular";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  574  		emulated =3D "emulate=
d ";
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  575  		break;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  576  	default:
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  577  		/* Just in case */
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  578  		btrfs_err_in_rcu(fs_i=
nfo, "zoned: unsupported model %d on %s",
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  579  				 bdev_zoned_model(b=
dev),
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  580  				 rcu_str_deref(devi=
ce->name));
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  581  		ret =3D -EOPNOTSUPP;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  582  		goto out_free_zone_in=
fo;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  583  	}
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  584  =

3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  585  	btrfs_info_in_rcu(fs_i=
nfo,
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  586  		"%s block device %s, =
%u %szones of %llu bytes",
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  587  		model, rcu_str_deref(=
device->name), zone_info->nr_zones,
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  588  		emulated, zone_info->=
zone_size);
5b316468983dfa9 Naohiro Aota       2020-11-10  589  =

5b316468983dfa9 Naohiro Aota       2020-11-10  590  	return 0;
5b316468983dfa9 Naohiro Aota       2020-11-10  591  =

5b316468983dfa9 Naohiro Aota       2020-11-10  592  out:
5b316468983dfa9 Naohiro Aota       2020-11-10  593  	kfree(zones);
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  594  out_free_zone_info:
0a2a39576fa1dd6 Johannes Thumshirn 2021-12-07  595  	btrfs_destroy_dev_zone=
_info(device);
5b316468983dfa9 Naohiro Aota       2020-11-10  596  =

5b316468983dfa9 Naohiro Aota       2020-11-10 @597  	return ret;
5b316468983dfa9 Naohiro Aota       2020-11-10  598  }
5b316468983dfa9 Naohiro Aota       2020-11-10  599  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1706922628501886357==--

