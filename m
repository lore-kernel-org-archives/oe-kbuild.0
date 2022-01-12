Content-Type: multipart/mixed; boundary="===============0922868104576912696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:bio_alloc-cleanup 12/13] fs/ntfs3/fsntfs.c:1606 ntfs_bio_fill_1() warn: variable dereferenced before check 'bio' (see line 1591)
Date: Thu, 13 Jan 2022 02:42:53 +0800
Message-ID: <202201130220.4VMJf0mm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0922868104576912696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git bio_alloc-cleanup
head:   152c964c974a6e3bf0dd15a8d100c075087d5186
commit: a2021f00ad0fa0638974d4302683c84dd05d25e2 [12/13] block: pass a bloc=
k_device and opf to bio_alloc
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: ia64-randconfig-m031-20220112 (https://download.01.org/0day-ci/arch=
ive/20220113/202201130220.4VMJf0mm-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ntfs3/fsntfs.c:1606 ntfs_bio_fill_1() warn: variable dereferenced before=
 check 'bio' (see line 1591)

Old smatch warnings:
fs/ntfs3/fsntfs.c:771 ntfs_clear_mft_tail() error: uninitialized symbol 'er=
r'.
fs/ntfs3/fsntfs.c:1227 ntfs_read_run_nb() error: uninitialized symbol 'clen=
'.
fs/ntfs3/fsntfs.c:1228 ntfs_read_run_nb() error: uninitialized symbol 'idx'.

vim +/bio +1606 fs/ntfs3/fsntfs.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1541  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1542  /*
e8b8e97f91b80f Kari Argillander   2021-08-03  1543   * ntfs_bio_fill_1 - He=
lper for ntfs_loadlog_and_replay().
e8b8e97f91b80f Kari Argillander   2021-08-03  1544   *
e8b8e97f91b80f Kari Argillander   2021-08-03  1545   * Fill on-disk logfile=
 range by (-1)
e8b8e97f91b80f Kari Argillander   2021-08-03  1546   * this means empty log=
file.
82cae269cfa953 Konstantin Komarov 2021-08-13  1547   */
82cae269cfa953 Konstantin Komarov 2021-08-13  1548  int ntfs_bio_fill_1(str=
uct ntfs_sb_info *sbi, const struct runs_tree *run)
82cae269cfa953 Konstantin Komarov 2021-08-13  1549  {
82cae269cfa953 Konstantin Komarov 2021-08-13  1550  	int err =3D 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1551  	struct super_block *sb=
 =3D sbi->sb;
82cae269cfa953 Konstantin Komarov 2021-08-13  1552  	struct block_device *b=
dev =3D sb->s_bdev;
82cae269cfa953 Konstantin Komarov 2021-08-13  1553  	u8 cluster_bits =3D sb=
i->cluster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1554  	struct bio *new, *bio =
=3D NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1555  	CLST lcn, clen;
82cae269cfa953 Konstantin Komarov 2021-08-13  1556  	u64 lbo, len;
82cae269cfa953 Konstantin Komarov 2021-08-13  1557  	size_t run_idx;
82cae269cfa953 Konstantin Komarov 2021-08-13  1558  	struct page *fill;
82cae269cfa953 Konstantin Komarov 2021-08-13  1559  	void *kaddr;
82cae269cfa953 Konstantin Komarov 2021-08-13  1560  	struct blk_plug plug;
82cae269cfa953 Konstantin Komarov 2021-08-13  1561  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1562  	fill =3D alloc_page(GF=
P_KERNEL);
82cae269cfa953 Konstantin Komarov 2021-08-13  1563  	if (!fill)
82cae269cfa953 Konstantin Komarov 2021-08-13  1564  		return -ENOMEM;
82cae269cfa953 Konstantin Komarov 2021-08-13  1565  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1566  	kaddr =3D kmap_atomic(=
fill);
82cae269cfa953 Konstantin Komarov 2021-08-13  1567  	memset(kaddr, -1, PAGE=
_SIZE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1568  	kunmap_atomic(kaddr);
82cae269cfa953 Konstantin Komarov 2021-08-13  1569  	flush_dcache_page(fill=
);
82cae269cfa953 Konstantin Komarov 2021-08-13  1570  	lock_page(fill);
82cae269cfa953 Konstantin Komarov 2021-08-13  1571  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1572  	if (!run_lookup_entry(=
run, 0, &lcn, &clen, &run_idx)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1573  		err =3D -ENOENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  1574  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1575  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1576  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1577  	/*
e8b8e97f91b80f Kari Argillander   2021-08-03  1578  	 * TODO: Try blkdev_is=
sue_write_same.
82cae269cfa953 Konstantin Komarov 2021-08-13  1579  	 */
82cae269cfa953 Konstantin Komarov 2021-08-13  1580  	blk_start_plug(&plug);
82cae269cfa953 Konstantin Komarov 2021-08-13  1581  	do {
82cae269cfa953 Konstantin Komarov 2021-08-13  1582  		lbo =3D (u64)lcn << c=
luster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1583  		len =3D (u64)clen << =
cluster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1584  new_bio:
a2021f00ad0fa0 Christoph Hellwig  2022-01-12  1585  		new =3D bio_alloc(bde=
v, BIO_MAX_VECS, REQ_OP_WRITE, GFP_NOFS);
82cae269cfa953 Konstantin Komarov 2021-08-13  1586  		if (bio) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1587  			bio_chain(bio, new);
82cae269cfa953 Konstantin Komarov 2021-08-13  1588  			submit_bio(bio);
82cae269cfa953 Konstantin Komarov 2021-08-13  1589  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1590  		bio =3D new;
82cae269cfa953 Konstantin Komarov 2021-08-13 @1591  		bio->bi_iter.bi_secto=
r =3D lbo >> 9;
82cae269cfa953 Konstantin Komarov 2021-08-13  1592  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1593  		for (;;) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1594  			u32 add =3D len > PA=
GE_SIZE ? PAGE_SIZE : len;
82cae269cfa953 Konstantin Komarov 2021-08-13  1595  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1596  			if (bio_add_page(bio=
, fill, add, 0) < add)
82cae269cfa953 Konstantin Komarov 2021-08-13  1597  				goto new_bio;
82cae269cfa953 Konstantin Komarov 2021-08-13  1598  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1599  			lbo +=3D add;
82cae269cfa953 Konstantin Komarov 2021-08-13  1600  			if (len <=3D add)
82cae269cfa953 Konstantin Komarov 2021-08-13  1601  				break;
82cae269cfa953 Konstantin Komarov 2021-08-13  1602  			len -=3D add;
82cae269cfa953 Konstantin Komarov 2021-08-13  1603  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1604  	} while (run_get_entry=
(run, ++run_idx, NULL, &lcn, &clen));
82cae269cfa953 Konstantin Komarov 2021-08-13  1605  =

82cae269cfa953 Konstantin Komarov 2021-08-13 @1606  	if (bio) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1607  		if (!err)
82cae269cfa953 Konstantin Komarov 2021-08-13  1608  			err =3D submit_bio_w=
ait(bio);
82cae269cfa953 Konstantin Komarov 2021-08-13  1609  		bio_put(bio);
82cae269cfa953 Konstantin Komarov 2021-08-13  1610  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1611  	blk_finish_plug(&plug);
82cae269cfa953 Konstantin Komarov 2021-08-13  1612  out:
82cae269cfa953 Konstantin Komarov 2021-08-13  1613  	unlock_page(fill);
82cae269cfa953 Konstantin Komarov 2021-08-13  1614  	put_page(fill);
82cae269cfa953 Konstantin Komarov 2021-08-13  1615  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1616  	return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1617  }
82cae269cfa953 Konstantin Komarov 2021-08-13  1618  =


:::::: The code@line 1606 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initializatio=
n of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0922868104576912696==--

