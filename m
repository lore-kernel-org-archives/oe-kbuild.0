Content-Type: multipart/mixed; boundary="===============2764127303200933312=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [goldwynr:iomap 27/33] fs/btrfs/file.c:1517 btrfs_buffered_iomap_begin() error: dereferencing freed memory 'bi'
Date: Thu, 30 Dec 2021 23:23:31 +0800
Message-ID: <202112302317.OJzUYuIb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2764127303200933312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>

tree:   https://github.com/goldwynr/linux iomap
head:   30c74a8c201365178cae26d0d7aefa120c3245ab
commit: f3623890897fee87c24f37ae01a2f1a5c35a39d9 [27/33] btrfs: use srcmap =
for read-before-write cases
:::::: branch date: 18 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-m031-20211228 (https://download.01.org/0day-ci/arch=
ive/20211230/202112302317.OJzUYuIb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/file.c:1517 btrfs_buffered_iomap_begin() error: dereferencing free=
d memory 'bi'

vim +/bi +1517 fs/btrfs/file.c

e95dc238df949a Goldwyn Rodrigues 2021-05-11  1489  =

b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1490  static int btrfs_buffere=
d_iomap_begin(struct inode *inode, loff_t pos,
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1491  		loff_t length, unsigne=
d flags, struct iomap *iomap,
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1492  		struct iomap *srcmap)
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1493  {
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1494  	int ret;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1495  	size_t write_bytes =3D =
length;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1496  	struct btrfs_fs_info *f=
s_info =3D btrfs_sb(inode->i_sb);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1497  	size_t sector_offset =
=3D pos & (fs_info->sectorsize - 1);
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1498  	struct btrfs_iomap *bi;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1499  	loff_t end =3D pos + le=
ngth;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1500  =

f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1501  	bi =3D kzalloc(sizeof(s=
truct btrfs_iomap), GFP_NOFS);
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1502  	if (!bi)
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1503  		return -ENOMEM;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1504  =

f3623890897fee Goldwyn Rodrigues 2021-04-21  1505  	if ((pos & (PAGE_SIZE -=
 1) || end & (PAGE_SIZE - 1))) {
f3623890897fee Goldwyn Rodrigues 2021-04-21  1506  		loff_t isize =3D i_siz=
e_read(inode);
f3623890897fee Goldwyn Rodrigues 2021-04-21  1507  		if (pos >=3D isize) {
f3623890897fee Goldwyn Rodrigues 2021-04-21  1508  			srcmap->addr =3D IOMA=
P_NULL_ADDR;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1509  			srcmap->type =3D IOMA=
P_HOLE;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1510  			srcmap->offset =3D is=
ize;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1511  			srcmap->length =3D en=
d - isize;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1512  		} else {
f3623890897fee Goldwyn Rodrigues 2021-04-21  1513  			bi->em =3D btrfs_get_=
extent(BTRFS_I(inode), NULL, 0,
f3623890897fee Goldwyn Rodrigues 2021-04-21  1514  					pos - sector_offset=
, length);
f3623890897fee Goldwyn Rodrigues 2021-04-21  1515  			if (IS_ERR(bi->em)) {
f3623890897fee Goldwyn Rodrigues 2021-04-21  1516  				kfree(bi);
f3623890897fee Goldwyn Rodrigues 2021-04-21 @1517  				return PTR_ERR(bi->e=
m);
f3623890897fee Goldwyn Rodrigues 2021-04-21  1518  			}
f3623890897fee Goldwyn Rodrigues 2021-04-21  1519  			btrfs_em_to_iomap(ino=
de, bi->em, srcmap,
f3623890897fee Goldwyn Rodrigues 2021-04-21  1520  					pos - sector_offset=
);
f3623890897fee Goldwyn Rodrigues 2021-04-21  1521  		}
f3623890897fee Goldwyn Rodrigues 2021-04-21  1522  	}
f3623890897fee Goldwyn Rodrigues 2021-04-21  1523  =

f3623890897fee Goldwyn Rodrigues 2021-04-21  1524  	if ((srcmap->type !=3D =
IOMAP_HOLE) &&
f3623890897fee Goldwyn Rodrigues 2021-04-21  1525  			(end > srcmap->offset=
 + srcmap->length))
f3623890897fee Goldwyn Rodrigues 2021-04-21  1526  			write_bytes =3D srcma=
p->offset + srcmap->length - pos;
f3623890897fee Goldwyn Rodrigues 2021-04-21  1527  =

f3623890897fee Goldwyn Rodrigues 2021-04-21  1528  =

b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1529  	ret =3D btrfs_check_dat=
a_free_space(BTRFS_I(inode),
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1530  			&bi->data_reserved, p=
os, write_bytes);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1531  	if (ret < 0) {
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1532  		/*
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1533  		 * If we don't have to=
 COW@the offset, reserve
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1534  		 * metadata only. writ=
e_bytes may get smaller than
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1535  		 * requested here.
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1536  		 */
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1537  		if (btrfs_check_nocow_=
lock(BTRFS_I(inode), pos,
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1538  					&write_bytes) > 0)
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1539  			bi->metadata_only =3D=
 true;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1540  		else
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1541  			return ret;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1542  	}
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1543  =

b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1544  	bi->reserved_bytes =3D =
round_up(write_bytes + sector_offset,
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1545  			fs_info->sectorsize);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1546  	WARN_ON(bi->reserved_by=
tes =3D=3D 0);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1547  	ret =3D btrfs_delalloc_=
reserve_metadata(BTRFS_I(inode),
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1548  			bi->reserved_bytes);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1549  	if (ret) {
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1550  		if (!bi->metadata_only)
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1551  			btrfs_free_reserved_d=
ata_space(BTRFS_I(inode),
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1552  					bi->data_reserved, =
pos,
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1553  					write_bytes);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1554  		else
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1555  			btrfs_check_nocow_unl=
ock(BTRFS_I(inode));
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1556  		return ret;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1557  	}
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1558  =

b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1559  	if (pos < inode->i_size=
) {
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1560  		bi->lockstart =3D roun=
d_down(pos, fs_info->sectorsize);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1561  		bi->lockend =3D round_=
up(pos + write_bytes, fs_info->sectorsize) - 1;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1562  		btrfs_lock_and_flush_o=
rdered_range(BTRFS_I(inode),
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1563  				bi->lockstart, bi->l=
ockend,
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1564  				&bi->cached_state);
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1565  		bi->extents_locked =3D=
 true;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1566  	}
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1567  =

f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1568  	iomap->private =3D bi;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1569  	iomap->length =3D round=
_up(write_bytes + sector_offset,
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1570  			         fs_info->sec=
torsize);
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1571  	iomap->offset =3D round=
_down(pos, fs_info->sectorsize);
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1572  	iomap->addr =3D IOMAP_N=
ULL_ADDR;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1573  	iomap->type =3D IOMAP_D=
ELALLOC;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1574  	iomap->bdev =3D fs_info=
->fs_devices->latest_dev->bdev;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1575  	iomap->page_ops =3D &bt=
rfs_iomap_page_ops;
f4ecee4435f363 Goldwyn Rodrigues 2021-04-21  1576  =

b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1577  	return 0;
b192ee8d4db510 Goldwyn Rodrigues 2021-04-21  1578  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2764127303200933312==--

