Content-Type: multipart/mixed; boundary="===============1959766523437931784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/raid10.c:1707:39: warning: Uninitialized variable: first_r10bio [uninitvar]
Date: Wed, 26 May 2021 23:08:09 +0800
Message-ID: <202105262304.IuSQ5jj9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1959766523437931784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xiao Ni <xni@redhat.com>
CC: Song Liu <songliubraving@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ad9f25d338605d26acedcaf3ba5fab5ca26f1c10
commit: 254c271da0712ea8914f187588e0f81f7678ee2f md/raid10: improve discard=
 request for far layout
date:   9 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 weeks ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/md/raid10.c:
>> drivers/md/raid10.c:1707:39: warning: Uninitialized variable: first_r10b=
io [uninitvar]
     r10_bio->master_bio =3D (struct bio *)first_r10bio;
                                         ^

vim +1707 drivers/md/raid10.c

d30588b2731fb0 Xiao Ni 2021-02-04  1573  =

d30588b2731fb0 Xiao Ni 2021-02-04  1574  /*
d30588b2731fb0 Xiao Ni 2021-02-04  1575   * There are some limitations to h=
andle discard bio
d30588b2731fb0 Xiao Ni 2021-02-04  1576   * 1st, the discard size is bigger=
 than stripe_size*2.
d30588b2731fb0 Xiao Ni 2021-02-04  1577   * 2st, if the discard bio spans r=
eshape progress, we use the old way to
d30588b2731fb0 Xiao Ni 2021-02-04  1578   * handle discard bio
d30588b2731fb0 Xiao Ni 2021-02-04  1579   */
d30588b2731fb0 Xiao Ni 2021-02-04  1580  static int raid10_handle_discard(s=
truct mddev *mddev, struct bio *bio)
d30588b2731fb0 Xiao Ni 2021-02-04  1581  {
d30588b2731fb0 Xiao Ni 2021-02-04  1582  	struct r10conf *conf =3D mddev->p=
rivate;
d30588b2731fb0 Xiao Ni 2021-02-04  1583  	struct geom *geo =3D &conf->geo;
254c271da0712e Xiao Ni 2021-02-04  1584  	int far_copies =3D geo->far_copie=
s;
254c271da0712e Xiao Ni 2021-02-04  1585  	bool first_copy =3D true;
254c271da0712e Xiao Ni 2021-02-04  1586  	struct r10bio *r10_bio, *first_r1=
0bio;
d30588b2731fb0 Xiao Ni 2021-02-04  1587  	struct bio *split;
d30588b2731fb0 Xiao Ni 2021-02-04  1588  	int disk;
d30588b2731fb0 Xiao Ni 2021-02-04  1589  	sector_t chunk;
d30588b2731fb0 Xiao Ni 2021-02-04  1590  	unsigned int stripe_size;
d30588b2731fb0 Xiao Ni 2021-02-04  1591  	unsigned int stripe_data_disks;
d30588b2731fb0 Xiao Ni 2021-02-04  1592  	sector_t split_size;
d30588b2731fb0 Xiao Ni 2021-02-04  1593  	sector_t bio_start, bio_end;
d30588b2731fb0 Xiao Ni 2021-02-04  1594  	sector_t first_stripe_index, last=
_stripe_index;
d30588b2731fb0 Xiao Ni 2021-02-04  1595  	sector_t start_disk_offset;
d30588b2731fb0 Xiao Ni 2021-02-04  1596  	unsigned int start_disk_index;
d30588b2731fb0 Xiao Ni 2021-02-04  1597  	sector_t end_disk_offset;
d30588b2731fb0 Xiao Ni 2021-02-04  1598  	unsigned int end_disk_index;
d30588b2731fb0 Xiao Ni 2021-02-04  1599  	unsigned int remainder;
d30588b2731fb0 Xiao Ni 2021-02-04  1600  =

d30588b2731fb0 Xiao Ni 2021-02-04  1601  	if (test_bit(MD_RECOVERY_RESHAPE,=
 &mddev->recovery))
d30588b2731fb0 Xiao Ni 2021-02-04  1602  		return -EAGAIN;
d30588b2731fb0 Xiao Ni 2021-02-04  1603  =

d30588b2731fb0 Xiao Ni 2021-02-04  1604  	wait_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1605  =

d30588b2731fb0 Xiao Ni 2021-02-04  1606  	/*
d30588b2731fb0 Xiao Ni 2021-02-04  1607  	 * Check reshape again to avoid r=
eshape happens after checking
d30588b2731fb0 Xiao Ni 2021-02-04  1608  	 * MD_RECOVERY_RESHAPE and before=
 wait_barrier
d30588b2731fb0 Xiao Ni 2021-02-04  1609  	 */
d30588b2731fb0 Xiao Ni 2021-02-04  1610  	if (test_bit(MD_RECOVERY_RESHAPE,=
 &mddev->recovery))
d30588b2731fb0 Xiao Ni 2021-02-04  1611  		goto out;
d30588b2731fb0 Xiao Ni 2021-02-04  1612  =

d30588b2731fb0 Xiao Ni 2021-02-04  1613  	if (geo->near_copies)
d30588b2731fb0 Xiao Ni 2021-02-04  1614  		stripe_data_disks =3D geo->raid_=
disks / geo->near_copies +
d30588b2731fb0 Xiao Ni 2021-02-04  1615  					geo->raid_disks % geo->near_c=
opies;
d30588b2731fb0 Xiao Ni 2021-02-04  1616  	else
d30588b2731fb0 Xiao Ni 2021-02-04  1617  		stripe_data_disks =3D geo->raid_=
disks;
d30588b2731fb0 Xiao Ni 2021-02-04  1618  =

d30588b2731fb0 Xiao Ni 2021-02-04  1619  	stripe_size =3D stripe_data_disks=
 << geo->chunk_shift;
d30588b2731fb0 Xiao Ni 2021-02-04  1620  =

d30588b2731fb0 Xiao Ni 2021-02-04  1621  	bio_start =3D bio->bi_iter.bi_sec=
tor;
d30588b2731fb0 Xiao Ni 2021-02-04  1622  	bio_end =3D bio_end_sector(bio);
d30588b2731fb0 Xiao Ni 2021-02-04  1623  =

d30588b2731fb0 Xiao Ni 2021-02-04  1624  	/*
d30588b2731fb0 Xiao Ni 2021-02-04  1625  	 * Maybe one discard bio is small=
er than strip size or across one
d30588b2731fb0 Xiao Ni 2021-02-04  1626  	 * stripe and discard region is l=
arger than one stripe size. For far
d30588b2731fb0 Xiao Ni 2021-02-04  1627  	 * offset layout, if the discard =
region is not aligned with stripe
d30588b2731fb0 Xiao Ni 2021-02-04  1628  	 * size, there is hole when we su=
bmit discard bio to member disk.
d30588b2731fb0 Xiao Ni 2021-02-04  1629  	 * For simplicity, we only handle=
 discard bio which discard region
d30588b2731fb0 Xiao Ni 2021-02-04  1630  	 * is bigger than stripe_size * 2
d30588b2731fb0 Xiao Ni 2021-02-04  1631  	 */
d30588b2731fb0 Xiao Ni 2021-02-04  1632  	if (bio_sectors(bio) < stripe_siz=
e*2)
d30588b2731fb0 Xiao Ni 2021-02-04  1633  		goto out;
d30588b2731fb0 Xiao Ni 2021-02-04  1634  =

d30588b2731fb0 Xiao Ni 2021-02-04  1635  	/*
d30588b2731fb0 Xiao Ni 2021-02-04  1636  	 * Keep bio aligned with strip si=
ze.
d30588b2731fb0 Xiao Ni 2021-02-04  1637  	 */
d30588b2731fb0 Xiao Ni 2021-02-04  1638  	div_u64_rem(bio_start, stripe_siz=
e, &remainder);
d30588b2731fb0 Xiao Ni 2021-02-04  1639  	if (remainder) {
d30588b2731fb0 Xiao Ni 2021-02-04  1640  		split_size =3D stripe_size - rem=
ainder;
d30588b2731fb0 Xiao Ni 2021-02-04  1641  		split =3D bio_split(bio, split_s=
ize, GFP_NOIO, &conf->bio_split);
d30588b2731fb0 Xiao Ni 2021-02-04  1642  		bio_chain(split, bio);
d30588b2731fb0 Xiao Ni 2021-02-04  1643  		allow_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1644  		/* Resend the fist split part */
d30588b2731fb0 Xiao Ni 2021-02-04  1645  		submit_bio_noacct(split);
d30588b2731fb0 Xiao Ni 2021-02-04  1646  		wait_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1647  	}
d30588b2731fb0 Xiao Ni 2021-02-04  1648  	div_u64_rem(bio_end, stripe_size,=
 &remainder);
d30588b2731fb0 Xiao Ni 2021-02-04  1649  	if (remainder) {
d30588b2731fb0 Xiao Ni 2021-02-04  1650  		split_size =3D bio_sectors(bio) =
- remainder;
d30588b2731fb0 Xiao Ni 2021-02-04  1651  		split =3D bio_split(bio, split_s=
ize, GFP_NOIO, &conf->bio_split);
d30588b2731fb0 Xiao Ni 2021-02-04  1652  		bio_chain(split, bio);
d30588b2731fb0 Xiao Ni 2021-02-04  1653  		allow_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1654  		/* Resend the second split part =
*/
d30588b2731fb0 Xiao Ni 2021-02-04  1655  		submit_bio_noacct(bio);
d30588b2731fb0 Xiao Ni 2021-02-04  1656  		bio =3D split;
d30588b2731fb0 Xiao Ni 2021-02-04  1657  		wait_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1658  	}
d30588b2731fb0 Xiao Ni 2021-02-04  1659  =

d30588b2731fb0 Xiao Ni 2021-02-04  1660  	bio_start =3D bio->bi_iter.bi_sec=
tor;
d30588b2731fb0 Xiao Ni 2021-02-04  1661  	bio_end =3D bio_end_sector(bio);
d30588b2731fb0 Xiao Ni 2021-02-04  1662  =

d30588b2731fb0 Xiao Ni 2021-02-04  1663  	/*
d30588b2731fb0 Xiao Ni 2021-02-04  1664  	 * Raid10 uses chunk as the unit =
to store data. It's similar like raid0.
d30588b2731fb0 Xiao Ni 2021-02-04  1665  	 * One stripe contains the chunks=
 from all member disk (one chunk from
d30588b2731fb0 Xiao Ni 2021-02-04  1666  	 * one disk at the same HBA addre=
ss). For layout detail, see 'man md 4'
d30588b2731fb0 Xiao Ni 2021-02-04  1667  	 */
d30588b2731fb0 Xiao Ni 2021-02-04  1668  	chunk =3D bio_start >> geo->chunk=
_shift;
d30588b2731fb0 Xiao Ni 2021-02-04  1669  	chunk *=3D geo->near_copies;
d30588b2731fb0 Xiao Ni 2021-02-04  1670  	first_stripe_index =3D chunk;
d30588b2731fb0 Xiao Ni 2021-02-04  1671  	start_disk_index =3D sector_div(f=
irst_stripe_index, geo->raid_disks);
d30588b2731fb0 Xiao Ni 2021-02-04  1672  	if (geo->far_offset)
d30588b2731fb0 Xiao Ni 2021-02-04  1673  		first_stripe_index *=3D geo->far=
_copies;
d30588b2731fb0 Xiao Ni 2021-02-04  1674  	start_disk_offset =3D (bio_start =
& geo->chunk_mask) +
d30588b2731fb0 Xiao Ni 2021-02-04  1675  				(first_stripe_index << geo->ch=
unk_shift);
d30588b2731fb0 Xiao Ni 2021-02-04  1676  =

d30588b2731fb0 Xiao Ni 2021-02-04  1677  	chunk =3D bio_end >> geo->chunk_s=
hift;
d30588b2731fb0 Xiao Ni 2021-02-04  1678  	chunk *=3D geo->near_copies;
d30588b2731fb0 Xiao Ni 2021-02-04  1679  	last_stripe_index =3D chunk;
d30588b2731fb0 Xiao Ni 2021-02-04  1680  	end_disk_index =3D sector_div(las=
t_stripe_index, geo->raid_disks);
d30588b2731fb0 Xiao Ni 2021-02-04  1681  	if (geo->far_offset)
d30588b2731fb0 Xiao Ni 2021-02-04  1682  		last_stripe_index *=3D geo->far_=
copies;
d30588b2731fb0 Xiao Ni 2021-02-04  1683  	end_disk_offset =3D (bio_end & ge=
o->chunk_mask) +
d30588b2731fb0 Xiao Ni 2021-02-04  1684  				(last_stripe_index << geo->chu=
nk_shift);
d30588b2731fb0 Xiao Ni 2021-02-04  1685  =

254c271da0712e Xiao Ni 2021-02-04  1686  retry_discard:
254c271da0712e Xiao Ni 2021-02-04  1687  	r10_bio =3D mempool_alloc(&conf->=
r10bio_pool, GFP_NOIO);
254c271da0712e Xiao Ni 2021-02-04  1688  	r10_bio->mddev =3D mddev;
254c271da0712e Xiao Ni 2021-02-04  1689  	r10_bio->state =3D 0;
254c271da0712e Xiao Ni 2021-02-04  1690  	r10_bio->sectors =3D 0;
254c271da0712e Xiao Ni 2021-02-04  1691  	memset(r10_bio->devs, 0, sizeof(r=
10_bio->devs[0]) * geo->raid_disks);
254c271da0712e Xiao Ni 2021-02-04  1692  	wait_blocked_dev(mddev, r10_bio);
254c271da0712e Xiao Ni 2021-02-04  1693  =

254c271da0712e Xiao Ni 2021-02-04  1694  	/*
254c271da0712e Xiao Ni 2021-02-04  1695  	 * For far layout it needs more t=
han one r10bio to cover all regions.
254c271da0712e Xiao Ni 2021-02-04  1696  	 * Inspired by raid10_sync_reques=
t, we can use the first r10bio->master_bio
254c271da0712e Xiao Ni 2021-02-04  1697  	 * to record the discard bio. Oth=
er r10bio->master_bio record the first
254c271da0712e Xiao Ni 2021-02-04  1698  	 * r10bio. The first r10bio only =
release after all other r10bios finish.
254c271da0712e Xiao Ni 2021-02-04  1699  	 * The discard bio returns only f=
irst r10bio finishes
254c271da0712e Xiao Ni 2021-02-04  1700  	 */
254c271da0712e Xiao Ni 2021-02-04  1701  	if (first_copy) {
254c271da0712e Xiao Ni 2021-02-04  1702  		r10_bio->master_bio =3D bio;
254c271da0712e Xiao Ni 2021-02-04  1703  		set_bit(R10BIO_Discard, &r10_bio=
->state);
254c271da0712e Xiao Ni 2021-02-04  1704  		first_copy =3D false;
254c271da0712e Xiao Ni 2021-02-04  1705  		first_r10bio =3D r10_bio;
254c271da0712e Xiao Ni 2021-02-04  1706  	} else
254c271da0712e Xiao Ni 2021-02-04 @1707  		r10_bio->master_bio =3D (struct =
bio *)first_r10bio;
254c271da0712e Xiao Ni 2021-02-04  1708  =

d30588b2731fb0 Xiao Ni 2021-02-04  1709  	rcu_read_lock();
d30588b2731fb0 Xiao Ni 2021-02-04  1710  	for (disk =3D 0; disk < geo->raid=
_disks; disk++) {
d30588b2731fb0 Xiao Ni 2021-02-04  1711  		struct md_rdev *rdev =3D rcu_der=
eference(conf->mirrors[disk].rdev);
d30588b2731fb0 Xiao Ni 2021-02-04  1712  		struct md_rdev *rrdev =3D rcu_de=
reference(
d30588b2731fb0 Xiao Ni 2021-02-04  1713  			conf->mirrors[disk].replacement=
);
d30588b2731fb0 Xiao Ni 2021-02-04  1714  =

d30588b2731fb0 Xiao Ni 2021-02-04  1715  		r10_bio->devs[disk].bio =3D NULL;
d30588b2731fb0 Xiao Ni 2021-02-04  1716  		r10_bio->devs[disk].repl_bio =3D=
 NULL;
d30588b2731fb0 Xiao Ni 2021-02-04  1717  =

d30588b2731fb0 Xiao Ni 2021-02-04  1718  		if (rdev && (test_bit(Faulty, &r=
dev->flags)))
d30588b2731fb0 Xiao Ni 2021-02-04  1719  			rdev =3D NULL;
d30588b2731fb0 Xiao Ni 2021-02-04  1720  		if (rrdev && (test_bit(Faulty, &=
rrdev->flags)))
d30588b2731fb0 Xiao Ni 2021-02-04  1721  			rrdev =3D NULL;
d30588b2731fb0 Xiao Ni 2021-02-04  1722  		if (!rdev && !rrdev)
d30588b2731fb0 Xiao Ni 2021-02-04  1723  			continue;
d30588b2731fb0 Xiao Ni 2021-02-04  1724  =

d30588b2731fb0 Xiao Ni 2021-02-04  1725  		if (rdev) {
d30588b2731fb0 Xiao Ni 2021-02-04  1726  			r10_bio->devs[disk].bio =3D bio;
d30588b2731fb0 Xiao Ni 2021-02-04  1727  			atomic_inc(&rdev->nr_pending);
d30588b2731fb0 Xiao Ni 2021-02-04  1728  		}
d30588b2731fb0 Xiao Ni 2021-02-04  1729  		if (rrdev) {
d30588b2731fb0 Xiao Ni 2021-02-04  1730  			r10_bio->devs[disk].repl_bio =
=3D bio;
d30588b2731fb0 Xiao Ni 2021-02-04  1731  			atomic_inc(&rrdev->nr_pending);
d30588b2731fb0 Xiao Ni 2021-02-04  1732  		}
d30588b2731fb0 Xiao Ni 2021-02-04  1733  	}
d30588b2731fb0 Xiao Ni 2021-02-04  1734  	rcu_read_unlock();
d30588b2731fb0 Xiao Ni 2021-02-04  1735  =

d30588b2731fb0 Xiao Ni 2021-02-04  1736  	atomic_set(&r10_bio->remaining, 1=
);
d30588b2731fb0 Xiao Ni 2021-02-04  1737  	for (disk =3D 0; disk < geo->raid=
_disks; disk++) {
d30588b2731fb0 Xiao Ni 2021-02-04  1738  		sector_t dev_start, dev_end;
d30588b2731fb0 Xiao Ni 2021-02-04  1739  		struct bio *mbio, *rbio =3D NULL;
d30588b2731fb0 Xiao Ni 2021-02-04  1740  		struct md_rdev *rdev =3D rcu_der=
eference(conf->mirrors[disk].rdev);
d30588b2731fb0 Xiao Ni 2021-02-04  1741  		struct md_rdev *rrdev =3D rcu_de=
reference(
d30588b2731fb0 Xiao Ni 2021-02-04  1742  			conf->mirrors[disk].replacement=
);
d30588b2731fb0 Xiao Ni 2021-02-04  1743  =

d30588b2731fb0 Xiao Ni 2021-02-04  1744  		/*
d30588b2731fb0 Xiao Ni 2021-02-04  1745  		 * Now start to calculate the st=
art and end address for each disk.
d30588b2731fb0 Xiao Ni 2021-02-04  1746  		 * The space between dev_start a=
nd dev_end is the discard region.
d30588b2731fb0 Xiao Ni 2021-02-04  1747  		 *
d30588b2731fb0 Xiao Ni 2021-02-04  1748  		 * For dev_start, it needs to co=
nsider three conditions:
d30588b2731fb0 Xiao Ni 2021-02-04  1749  		 * 1st, the disk is before start=
_disk, you can imagine the disk in
d30588b2731fb0 Xiao Ni 2021-02-04  1750  		 * the next stripe. So the dev_s=
tart is the start address of next
d30588b2731fb0 Xiao Ni 2021-02-04  1751  		 * stripe.
d30588b2731fb0 Xiao Ni 2021-02-04  1752  		 * 2st, the disk is after start_=
disk, it means the disk is at the
d30588b2731fb0 Xiao Ni 2021-02-04  1753  		 * same stripe of first disk
d30588b2731fb0 Xiao Ni 2021-02-04  1754  		 * 3st, the first disk itself, w=
e can use start_disk_offset directly
d30588b2731fb0 Xiao Ni 2021-02-04  1755  		 */
d30588b2731fb0 Xiao Ni 2021-02-04  1756  		if (disk < start_disk_index)
d30588b2731fb0 Xiao Ni 2021-02-04  1757  			dev_start =3D (first_stripe_ind=
ex + 1) * mddev->chunk_sectors;
d30588b2731fb0 Xiao Ni 2021-02-04  1758  		else if (disk > start_disk_index)
d30588b2731fb0 Xiao Ni 2021-02-04  1759  			dev_start =3D first_stripe_inde=
x * mddev->chunk_sectors;
d30588b2731fb0 Xiao Ni 2021-02-04  1760  		else
d30588b2731fb0 Xiao Ni 2021-02-04  1761  			dev_start =3D start_disk_offset;
d30588b2731fb0 Xiao Ni 2021-02-04  1762  =

d30588b2731fb0 Xiao Ni 2021-02-04  1763  		if (disk < end_disk_index)
d30588b2731fb0 Xiao Ni 2021-02-04  1764  			dev_end =3D (last_stripe_index =
+ 1) * mddev->chunk_sectors;
d30588b2731fb0 Xiao Ni 2021-02-04  1765  		else if (disk > end_disk_index)
d30588b2731fb0 Xiao Ni 2021-02-04  1766  			dev_end =3D last_stripe_index *=
 mddev->chunk_sectors;
d30588b2731fb0 Xiao Ni 2021-02-04  1767  		else
d30588b2731fb0 Xiao Ni 2021-02-04  1768  			dev_end =3D end_disk_offset;
d30588b2731fb0 Xiao Ni 2021-02-04  1769  =

d30588b2731fb0 Xiao Ni 2021-02-04  1770  		/*
d30588b2731fb0 Xiao Ni 2021-02-04  1771  		 * It only handles discard bio w=
hich size is >=3D stripe size, so
d30588b2731fb0 Xiao Ni 2021-02-04  1772  		 * dev_end > dev_start all the t=
ime
d30588b2731fb0 Xiao Ni 2021-02-04  1773  		 */
d30588b2731fb0 Xiao Ni 2021-02-04  1774  		if (r10_bio->devs[disk].bio) {
d30588b2731fb0 Xiao Ni 2021-02-04  1775  			mbio =3D bio_clone_fast(bio, GF=
P_NOIO, &mddev->bio_set);
d30588b2731fb0 Xiao Ni 2021-02-04  1776  			mbio->bi_end_io =3D raid10_end_=
discard_request;
d30588b2731fb0 Xiao Ni 2021-02-04  1777  			mbio->bi_private =3D r10_bio;
d30588b2731fb0 Xiao Ni 2021-02-04  1778  			r10_bio->devs[disk].bio =3D mbi=
o;
d30588b2731fb0 Xiao Ni 2021-02-04  1779  			r10_bio->devs[disk].devnum =3D =
disk;
d30588b2731fb0 Xiao Ni 2021-02-04  1780  			atomic_inc(&r10_bio->remaining);
d30588b2731fb0 Xiao Ni 2021-02-04  1781  			md_submit_discard_bio(mddev, rd=
ev, mbio,
d30588b2731fb0 Xiao Ni 2021-02-04  1782  					dev_start + choose_data_offse=
t(r10_bio, rdev),
d30588b2731fb0 Xiao Ni 2021-02-04  1783  					dev_end - dev_start);
d30588b2731fb0 Xiao Ni 2021-02-04  1784  			bio_endio(mbio);
d30588b2731fb0 Xiao Ni 2021-02-04  1785  		}
d30588b2731fb0 Xiao Ni 2021-02-04  1786  		if (r10_bio->devs[disk].repl_bio=
) {
d30588b2731fb0 Xiao Ni 2021-02-04  1787  			rbio =3D bio_clone_fast(bio, GF=
P_NOIO, &mddev->bio_set);
d30588b2731fb0 Xiao Ni 2021-02-04  1788  			rbio->bi_end_io =3D raid10_end_=
discard_request;
d30588b2731fb0 Xiao Ni 2021-02-04  1789  			rbio->bi_private =3D r10_bio;
d30588b2731fb0 Xiao Ni 2021-02-04  1790  			r10_bio->devs[disk].repl_bio =
=3D rbio;
d30588b2731fb0 Xiao Ni 2021-02-04  1791  			r10_bio->devs[disk].devnum =3D =
disk;
d30588b2731fb0 Xiao Ni 2021-02-04  1792  			atomic_inc(&r10_bio->remaining);
d30588b2731fb0 Xiao Ni 2021-02-04  1793  			md_submit_discard_bio(mddev, rr=
dev, rbio,
d30588b2731fb0 Xiao Ni 2021-02-04  1794  					dev_start + choose_data_offse=
t(r10_bio, rrdev),
d30588b2731fb0 Xiao Ni 2021-02-04  1795  					dev_end - dev_start);
d30588b2731fb0 Xiao Ni 2021-02-04  1796  			bio_endio(rbio);
d30588b2731fb0 Xiao Ni 2021-02-04  1797  		}
d30588b2731fb0 Xiao Ni 2021-02-04  1798  	}
d30588b2731fb0 Xiao Ni 2021-02-04  1799  =

254c271da0712e Xiao Ni 2021-02-04  1800  	if (!geo->far_offset && --far_cop=
ies) {
254c271da0712e Xiao Ni 2021-02-04  1801  		first_stripe_index +=3D geo->str=
ide >> geo->chunk_shift;
254c271da0712e Xiao Ni 2021-02-04  1802  		start_disk_offset +=3D geo->stri=
de;
254c271da0712e Xiao Ni 2021-02-04  1803  		last_stripe_index +=3D geo->stri=
de >> geo->chunk_shift;
254c271da0712e Xiao Ni 2021-02-04  1804  		end_disk_offset +=3D geo->stride;
254c271da0712e Xiao Ni 2021-02-04  1805  		atomic_inc(&first_r10bio->remain=
ing);
254c271da0712e Xiao Ni 2021-02-04  1806  		raid_end_discard_bio(r10_bio);
254c271da0712e Xiao Ni 2021-02-04  1807  		wait_barrier(conf);
254c271da0712e Xiao Ni 2021-02-04  1808  		goto retry_discard;
d30588b2731fb0 Xiao Ni 2021-02-04  1809  	}
d30588b2731fb0 Xiao Ni 2021-02-04  1810  =

254c271da0712e Xiao Ni 2021-02-04  1811  	raid_end_discard_bio(r10_bio);
254c271da0712e Xiao Ni 2021-02-04  1812  =

d30588b2731fb0 Xiao Ni 2021-02-04  1813  	return 0;
d30588b2731fb0 Xiao Ni 2021-02-04  1814  out:
d30588b2731fb0 Xiao Ni 2021-02-04  1815  	allow_barrier(conf);
d30588b2731fb0 Xiao Ni 2021-02-04  1816  	return -EAGAIN;
d30588b2731fb0 Xiao Ni 2021-02-04  1817  }
d30588b2731fb0 Xiao Ni 2021-02-04  1818  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1959766523437931784==--

