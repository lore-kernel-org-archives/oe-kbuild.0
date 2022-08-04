Content-Type: multipart/mixed; boundary="===============3946142316658047514=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-writecache.c:1554 writecache_map() warn: inconsistent returns '&wc->lock'.
Date: Fri, 05 Aug 2022 03:25:58 +0800
Message-ID: <202208050301.roHRxc6O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3946142316658047514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mikulas Patocka <mpatocka@redhat.com>
CC: Mike Snitzer <snitzer@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
commit: df699cc16ea5ef93a917676dcdd4376e02860ad5 dm writecache: report inva=
lid return from writecache_map helpers
date:   12 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 12 months ago
config: arc-randconfig-m041-20220804 (https://download.01.org/0day-ci/archi=
ve/20220805/202208050301.roHRxc6O-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/md/dm-writecache.c:1554 writecache_map() warn: inconsistent returns=
 '&wc->lock'.

vim +1554 drivers/md/dm-writecache.c

15cb6f39dbaf39 Mike Snitzer    2021-07-12  1483  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1484  static int writecache_map(=
struct dm_target *ti, struct bio *bio)
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1485  {
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1486  	struct dm_writecache *wc =
=3D ti->private;
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1487  	enum wc_map_op map_op;
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1488  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1489  	bio->bi_private =3D NULL;
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1490  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1491  	wc_lock(wc);
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1492  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1493  	if (unlikely(bio->bi_opf =
& REQ_PREFLUSH)) {
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1494  		map_op =3D writecache_ma=
p_flush(wc, bio);
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1495  		goto done;
dcd195071f22d4 Mikulas Patocka 2020-01-15  1496  	}
dcd195071f22d4 Mikulas Patocka 2020-01-15  1497  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1498  	bio->bi_iter.bi_sector =
=3D dm_target_offset(ti, bio->bi_iter.bi_sector);
dcd195071f22d4 Mikulas Patocka 2020-01-15  1499  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1500  	if (unlikely((((unsigned)=
bio->bi_iter.bi_sector | bio_sectors(bio)) &
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1501  				(wc->block_size / 512 =
- 1)) !=3D 0)) {
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1502  		DMERR("I/O is not aligne=
d, sector %llu, size %u, block size %u",
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1503  		      (unsigned long lon=
g)bio->bi_iter.bi_sector,
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1504  		      bio->bi_iter.bi_si=
ze, wc->block_size);
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1505  		map_op =3D WC_MAP_ERROR;
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1506  		goto done;
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1507  	}
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1508  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1509  	if (unlikely(bio_op(bio) =
=3D=3D REQ_OP_DISCARD)) {
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1510  		map_op =3D writecache_ma=
p_discard(wc, bio);
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1511  		goto done;
48debafe4f2fea Mikulas Patocka 2018-03-08  1512  	}
48debafe4f2fea Mikulas Patocka 2018-03-08  1513  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1514  	if (bio_data_dir(bio) =3D=
=3D READ)
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1515  		map_op =3D writecache_ma=
p_read(wc, bio);
48debafe4f2fea Mikulas Patocka 2018-03-08  1516  	else
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1517  		map_op =3D writecache_ma=
p_write(wc, bio);
15cb6f39dbaf39 Mike Snitzer    2021-07-12  1518  done:
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1519  	switch (map_op) {
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1520  	case WC_MAP_REMAP_ORIGIN:
5c0de3d72f8c05 Mikulas Patocka 2021-06-28  1521  		if (likely(wc->pause !=
=3D 0)) {
5c0de3d72f8c05 Mikulas Patocka 2021-06-28  1522  			if (bio_op(bio) =3D=3D =
REQ_OP_WRITE) {
95b88f4d71cb95 Mikulas Patocka 2021-06-25  1523  				dm_iot_io_begin(&wc->i=
ot, 1);
95b88f4d71cb95 Mikulas Patocka 2021-06-25  1524  				bio->bi_private =3D (v=
oid *)2;
95b88f4d71cb95 Mikulas Patocka 2021-06-25  1525  			}
5c0de3d72f8c05 Mikulas Patocka 2021-06-28  1526  		}
48debafe4f2fea Mikulas Patocka 2018-03-08  1527  		bio_set_dev(bio, wc->dev=
->bdev);
48debafe4f2fea Mikulas Patocka 2018-03-08  1528  		wc_unlock(wc);
48debafe4f2fea Mikulas Patocka 2018-03-08  1529  		return DM_MAPIO_REMAPPED;
48debafe4f2fea Mikulas Patocka 2018-03-08  1530  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1531  	case WC_MAP_REMAP:
48debafe4f2fea Mikulas Patocka 2018-03-08  1532  		/* make sure that writec=
ache_end_io decrements bio_in_progress: */
48debafe4f2fea Mikulas Patocka 2018-03-08  1533  		bio->bi_private =3D (voi=
d *)1;
48debafe4f2fea Mikulas Patocka 2018-03-08  1534  		atomic_inc(&wc->bio_in_p=
rogress[bio_data_dir(bio)]);
48debafe4f2fea Mikulas Patocka 2018-03-08  1535  		wc_unlock(wc);
48debafe4f2fea Mikulas Patocka 2018-03-08  1536  		return DM_MAPIO_REMAPPED;
48debafe4f2fea Mikulas Patocka 2018-03-08  1537  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1538  	case WC_MAP_SUBMIT:
48debafe4f2fea Mikulas Patocka 2018-03-08  1539  		wc_unlock(wc);
48debafe4f2fea Mikulas Patocka 2018-03-08  1540  		bio_endio(bio);
48debafe4f2fea Mikulas Patocka 2018-03-08  1541  		return DM_MAPIO_SUBMITTE=
D;
48debafe4f2fea Mikulas Patocka 2018-03-08  1542  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1543  	case WC_MAP_RETURN:
48debafe4f2fea Mikulas Patocka 2018-03-08  1544  		wc_unlock(wc);
48debafe4f2fea Mikulas Patocka 2018-03-08  1545  		return DM_MAPIO_SUBMITTE=
D;
48debafe4f2fea Mikulas Patocka 2018-03-08  1546  =

cdd4d7832d51e0 Mike Snitzer    2021-07-12  1547  	case WC_MAP_ERROR:
48debafe4f2fea Mikulas Patocka 2018-03-08  1548  		wc_unlock(wc);
48debafe4f2fea Mikulas Patocka 2018-03-08  1549  		bio_io_error(bio);
48debafe4f2fea Mikulas Patocka 2018-03-08  1550  		return DM_MAPIO_SUBMITTE=
D;
df699cc16ea5ef Mikulas Patocka 2021-07-27  1551  =

df699cc16ea5ef Mikulas Patocka 2021-07-27  1552  	default:
df699cc16ea5ef Mikulas Patocka 2021-07-27  1553  		BUG();
df699cc16ea5ef Mikulas Patocka 2021-07-27 @1554  		return -1;
48debafe4f2fea Mikulas Patocka 2018-03-08  1555  	}
cdd4d7832d51e0 Mike Snitzer    2021-07-12  1556  }
48debafe4f2fea Mikulas Patocka 2018-03-08  1557  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3946142316658047514==--

