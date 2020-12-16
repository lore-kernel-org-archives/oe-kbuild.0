Content-Type: multipart/mixed; boundary="===============9033410641857634103=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] btrfs: Make btrfs_direct_write atomic with respect to inode_lock
Date: Wed, 16 Dec 2020 09:06:27 +0800
Message-ID: <202012160944.IVwRKt88-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9033410641857634103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <49ff9bfb8ef20e7a9c6e26fd54bc9f4508c9ccb4.1608053602.git.rgold=
wyn@suse.com>
References: <49ff9bfb8ef20e7a9c6e26fd54bc9f4508c9ccb4.1608053602.git.rgoldw=
yn@suse.com>
TO: Goldwyn Rodrigues <rgoldwyn@suse.de>
TO: linux-fsdevel(a)vger.kernel.org
TO: linux-btrfs(a)vger.kernel.org
CC: darrick.wong(a)oracle.com
CC: hch(a)infradead.org
CC: nborisov(a)suse.com
CC: Goldwyn Rodrigues <rgoldwyn@suse.com>

Hi Goldwyn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20201215]
[cannot apply to xfs-linux/for-next v5.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Goldwyn-Rodrigues/Fix-lock=
ing-for-btrfs-direct-writes/20201216-021312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20201215 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/file.c:1865 __btrfs_buffered_write() error: uninitialized symbol '=
ret'.

vim +/ret +1865 fs/btrfs/file.c

b8d8e1fd570a194 Goldwyn Rodrigues  2020-09-24  1640  =

af84b6141d8301b Goldwyn Rodrigues  2020-12-15  1641  static noinline ssize_=
t __btrfs_buffered_write(struct kiocb *iocb,
e4af400a9c5081e Goldwyn Rodrigues  2018-06-17  1642  					       struct iov=
_iter *i)
39279cc3d2704cf Chris Mason        2007-06-12  1643  {
e4af400a9c5081e Goldwyn Rodrigues  2018-06-17  1644  	struct file *file =3D=
 iocb->ki_filp;
af84b6141d8301b Goldwyn Rodrigues  2020-12-15  1645  	loff_t pos =3D iocb->=
ki_pos;
496ad9aa8ef4480 Al Viro            2013-01-23  1646  	struct inode *inode =
=3D file_inode(file);
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1647  	struct btrfs_fs_info =
*fs_info =3D btrfs_sb(inode->i_sb);
11c65dccf70be9a Josef Bacik        2010-05-23  1648  	struct page **pages =
=3D NULL;
364ecf3651e0862 Qu Wenruo          2017-02-27  1649  	struct extent_changes=
et *data_reserved =3D NULL;
7ee9e4405f264e9 Josef Bacik        2013-06-21  1650  	u64 release_bytes =3D=
 0;
376cc685cb3b43a Miao Xie           2013-12-10  1651  	u64 lockstart;
376cc685cb3b43a Miao Xie           2013-12-10  1652  	u64 lockend;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1653  	size_t num_written =
=3D 0;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1654  	int nrptrs;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1655  	ssize_t ret;
7ee9e4405f264e9 Josef Bacik        2013-06-21  1656  	bool only_release_met=
adata =3D false;
b6316429af7f365 Josef Bacik        2011-09-30  1657  	bool force_page_uptod=
ate =3D false;
5e8b9ef30392bb8 Goldwyn Rodrigues  2020-09-24  1658  	loff_t old_isize =3D =
i_size_read(inode);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1659  =

af84b6141d8301b Goldwyn Rodrigues  2020-12-15  1660  	lockdep_assert_held(&=
inode->i_rwsem);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1661  =

09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1662  	nrptrs =3D min(DIV_RO=
UND_UP(iov_iter_count(i), PAGE_SIZE),
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1663  			PAGE_SIZE / (sizeof=
(struct page *)));
142349f541d0bb6 Wu Fengguang       2011-12-16  1664  	nrptrs =3D min(nrptrs=
, current->nr_dirtied_pause - current->nr_dirtied);
142349f541d0bb6 Wu Fengguang       2011-12-16  1665  	nrptrs =3D max(nrptrs=
, 8);
31e818fe7375d60 David Sterba       2015-02-20  1666  	pages =3D kmalloc_arr=
ay(nrptrs, sizeof(struct page *), GFP_KERNEL);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1667  	if (!pages) {
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1668  		ret =3D -ENOMEM;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1669  		goto out;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1670  	}
ab93dbecfba72bb Chris Mason        2009-10-01  1671  =

d0215f3e5ebb580 Josef Bacik        2011-01-25  1672  	while (iov_iter_count=
(i) > 0) {
c67d970f0ea8dcc Filipe Manana      2019-09-30  1673  		struct extent_state =
*cached_state =3D NULL;
7073017aeb98db3 Johannes Thumshirn 2018-12-05  1674  		size_t offset =3D of=
fset_in_page(pos);
2e78c927d79333f Chandan Rajendra   2016-01-21  1675  		size_t sector_offset;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1676  		size_t write_bytes =
=3D min(iov_iter_count(i),
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1677  					 nrptrs * (size_t=
)PAGE_SIZE -
8c2383c3dd2cb5b Chris Mason        2007-06-18  1678  					 offset);
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1679  		size_t num_pages;
7ee9e4405f264e9 Josef Bacik        2013-06-21  1680  		size_t reserve_bytes;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1681  		size_t dirty_pages;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1682  		size_t copied;
2e78c927d79333f Chandan Rajendra   2016-01-21  1683  		size_t dirty_sectors;
2e78c927d79333f Chandan Rajendra   2016-01-21  1684  		size_t num_sectors;
79f015f216539df Goldwyn Rodrigues  2017-10-16  1685  		int extents_locked;
39279cc3d2704cf Chris Mason        2007-06-12  1686  =

914ee295af418e9 Xin Zhong          2010-12-09  1687  		/*
914ee295af418e9 Xin Zhong          2010-12-09  1688  		 * Fault pages befor=
e locking them in prepare_pages
914ee295af418e9 Xin Zhong          2010-12-09  1689  		 * to avoid recursiv=
e lock
914ee295af418e9 Xin Zhong          2010-12-09  1690  		 */
d0215f3e5ebb580 Josef Bacik        2011-01-25  1691  		if (unlikely(iov_ite=
r_fault_in_readable(i, write_bytes))) {
914ee295af418e9 Xin Zhong          2010-12-09  1692  			ret =3D -EFAULT;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1693  			break;
914ee295af418e9 Xin Zhong          2010-12-09  1694  		}
914ee295af418e9 Xin Zhong          2010-12-09  1695  =

a0e248bb502d516 Filipe Manana      2019-10-11  1696  		only_release_metadat=
a =3D false;
da17066c40472c2 Jeff Mahoney       2016-06-15  1697  		sector_offset =3D po=
s & (fs_info->sectorsize - 1);
d9d8b2a51a404c2 Qu Wenruo          2015-09-08  1698  =

364ecf3651e0862 Qu Wenruo          2017-02-27  1699  		extent_changeset_rel=
ease(data_reserved);
36ea6f3e931391c Nikolay Borisov    2020-06-03  1700  		ret =3D btrfs_check_=
data_free_space(BTRFS_I(inode),
36ea6f3e931391c Nikolay Borisov    2020-06-03  1701  						  &data_reserved=
, pos,
364ecf3651e0862 Qu Wenruo          2017-02-27  1702  						  write_bytes);
c6887cd11149d73 Josef Bacik        2016-03-25  1703  		if (ret < 0) {
d9d8b2a51a404c2 Qu Wenruo          2015-09-08  1704  			/*
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1705  			 * If we don't have=
 to COW@the offset, reserve
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1706  			 * metadata only. w=
rite_bytes may get smaller than
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1707  			 * requested here.
d9d8b2a51a404c2 Qu Wenruo          2015-09-08  1708  			 */
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1709  			if (btrfs_check_noc=
ow_lock(BTRFS_I(inode), pos,
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1710  						   &write_bytes)=
 > 0)
7ee9e4405f264e9 Josef Bacik        2013-06-21  1711  				only_release_metad=
ata =3D true;
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1712  			else
d0215f3e5ebb580 Josef Bacik        2011-01-25  1713  				break;
c6887cd11149d73 Josef Bacik        2016-03-25  1714  		}
1832a6d5ee3b1af Chris Mason        2007-12-21  1715  =

eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1716  		num_pages =3D DIV_RO=
UND_UP(write_bytes + offset, PAGE_SIZE);
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1717  		WARN_ON(num_pages > =
nrptrs);
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1718  		reserve_bytes =3D ro=
und_up(write_bytes + sector_offset,
eefa45f59379282 Goldwyn Rodrigues  2020-09-25  1719  					 fs_info->sectors=
ize);
8b62f87bad9cf06 Josef Bacik        2017-10-19  1720  		WARN_ON(reserve_byte=
s =3D=3D 0);
9f3db423f98c5c6 Nikolay Borisov    2017-02-20  1721  		ret =3D btrfs_delall=
oc_reserve_metadata(BTRFS_I(inode),
9f3db423f98c5c6 Nikolay Borisov    2017-02-20  1722  				reserve_bytes);
7ee9e4405f264e9 Josef Bacik        2013-06-21  1723  		if (ret) {
7ee9e4405f264e9 Josef Bacik        2013-06-21  1724  			if (!only_release_m=
etadata)
25ce28caaa1ddc2 Nikolay Borisov    2020-06-03  1725  				btrfs_free_reserve=
d_data_space(BTRFS_I(inode),
bc42bda22345efd Qu Wenruo          2017-02-27  1726  						data_reserved, p=
os,
d9d8b2a51a404c2 Qu Wenruo          2015-09-08  1727  						write_bytes);
8257b2dc3c1a105 Miao Xie           2014-03-06  1728  			else
38d37aa9c329382 Qu Wenruo          2020-06-24  1729  				btrfs_check_nocow_=
unlock(BTRFS_I(inode));
7ee9e4405f264e9 Josef Bacik        2013-06-21  1730  			break;
7ee9e4405f264e9 Josef Bacik        2013-06-21  1731  		}
7ee9e4405f264e9 Josef Bacik        2013-06-21  1732  =

7ee9e4405f264e9 Josef Bacik        2013-06-21  1733  		release_bytes =3D re=
serve_bytes;
376cc685cb3b43a Miao Xie           2013-12-10  1734  again:
4a64001f0047956 Josef Bacik        2011-01-25  1735  		/*
4a64001f0047956 Josef Bacik        2011-01-25  1736  		 * This is going to =
setup the pages array with the number of
4a64001f0047956 Josef Bacik        2011-01-25  1737  		 * pages we want, so=
 we don't really need to worry about the
4a64001f0047956 Josef Bacik        2011-01-25  1738  		 * contents of pages=
 from loop to loop
4a64001f0047956 Josef Bacik        2011-01-25  1739  		 */
b37392ea86761e9 Miao Xie           2013-12-10  1740  		ret =3D prepare_page=
s(inode, pages, num_pages,
b37392ea86761e9 Miao Xie           2013-12-10  1741  				    pos, write_byt=
es,
b6316429af7f365 Josef Bacik        2011-09-30  1742  				    force_page_upt=
odate);
8b62f87bad9cf06 Josef Bacik        2017-10-19  1743  		if (ret) {
8b62f87bad9cf06 Josef Bacik        2017-10-19  1744  			btrfs_delalloc_rele=
ase_extents(BTRFS_I(inode),
8702ba9396bf7bb Qu Wenruo          2019-10-14  1745  						       reserve_b=
ytes);
d0215f3e5ebb580 Josef Bacik        2011-01-25  1746  			break;
8b62f87bad9cf06 Josef Bacik        2017-10-19  1747  		}
39279cc3d2704cf Chris Mason        2007-06-12  1748  =

79f015f216539df Goldwyn Rodrigues  2017-10-16  1749  		extents_locked =3D l=
ock_and_cleanup_extent_if_need(
79f015f216539df Goldwyn Rodrigues  2017-10-16  1750  				BTRFS_I(inode), pa=
ges,
2cff578cfceba88 Nikolay Borisov    2017-02-20  1751  				num_pages, pos, wr=
ite_bytes, &lockstart,
2e78c927d79333f Chandan Rajendra   2016-01-21  1752  				&lockend, &cached_=
state);
79f015f216539df Goldwyn Rodrigues  2017-10-16  1753  		if (extents_locked <=
 0) {
79f015f216539df Goldwyn Rodrigues  2017-10-16  1754  			if (extents_locked =
=3D=3D -EAGAIN)
376cc685cb3b43a Miao Xie           2013-12-10  1755  				goto again;
8b62f87bad9cf06 Josef Bacik        2017-10-19  1756  			btrfs_delalloc_rele=
ase_extents(BTRFS_I(inode),
8702ba9396bf7bb Qu Wenruo          2019-10-14  1757  						       reserve_b=
ytes);
79f015f216539df Goldwyn Rodrigues  2017-10-16  1758  			ret =3D extents_loc=
ked;
376cc685cb3b43a Miao Xie           2013-12-10  1759  			break;
376cc685cb3b43a Miao Xie           2013-12-10  1760  		}
376cc685cb3b43a Miao Xie           2013-12-10  1761  =

ee22f0c4ec428e7 Zhao Lei           2016-01-06  1762  		copied =3D btrfs_cop=
y_from_user(pos, write_bytes, pages, i);
b1bf862e9dad431 Chris Mason        2011-02-28  1763  =

0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1764  		num_sectors =3D BTRF=
S_BYTES_TO_BLKS(fs_info, reserve_bytes);
56244ef151c3cd1 Chris Mason        2016-05-16  1765  		dirty_sectors =3D ro=
und_up(copied + sector_offset,
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1766  					fs_info->sectorsi=
ze);
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1767  		dirty_sectors =3D BT=
RFS_BYTES_TO_BLKS(fs_info, dirty_sectors);
56244ef151c3cd1 Chris Mason        2016-05-16  1768  =

b1bf862e9dad431 Chris Mason        2011-02-28  1769  		/*
b1bf862e9dad431 Chris Mason        2011-02-28  1770  		 * if we have troubl=
e faulting in the pages, fall
b1bf862e9dad431 Chris Mason        2011-02-28  1771  		 * back to one page =
at a time
b1bf862e9dad431 Chris Mason        2011-02-28  1772  		 */
b1bf862e9dad431 Chris Mason        2011-02-28  1773  		if (copied < write_b=
ytes)
b1bf862e9dad431 Chris Mason        2011-02-28  1774  			nrptrs =3D 1;
b1bf862e9dad431 Chris Mason        2011-02-28  1775  =

b6316429af7f365 Josef Bacik        2011-09-30  1776  		if (copied =3D=3D 0)=
 {
b6316429af7f365 Josef Bacik        2011-09-30  1777  			force_page_uptodate=
 =3D true;
56244ef151c3cd1 Chris Mason        2016-05-16  1778  			dirty_sectors =3D 0;
b1bf862e9dad431 Chris Mason        2011-02-28  1779  			dirty_pages =3D 0;
b6316429af7f365 Josef Bacik        2011-09-30  1780  		} else {
b6316429af7f365 Josef Bacik        2011-09-30  1781  			force_page_uptodate=
 =3D false;
ed6078f70335f15 David Sterba       2014-06-05  1782  			dirty_pages =3D DIV=
_ROUND_UP(copied + offset,
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1783  						   PAGE_SIZE);
b6316429af7f365 Josef Bacik        2011-09-30  1784  		}
914ee295af418e9 Xin Zhong          2010-12-09  1785  =

2e78c927d79333f Chandan Rajendra   2016-01-21  1786  		if (num_sectors > di=
rty_sectors) {
8b8b08cbfb9021a Chris Mason        2016-07-19  1787  			/* release everythi=
ng except the sectors we dirtied */
265fdfa6ce0a79d David Sterba       2020-07-01  1788  			release_bytes -=3D =
dirty_sectors << fs_info->sectorsize_bits;
485290a734f1427 Qu Wenruo          2015-10-29  1789  			if (only_release_me=
tadata) {
691fa059673b3b3 Nikolay Borisov    2017-02-20  1790  				btrfs_delalloc_rel=
ease_metadata(BTRFS_I(inode),
43b18595d6603cb Qu Wenruo          2017-12-12  1791  							release_bytes, =
true);
485290a734f1427 Qu Wenruo          2015-10-29  1792  			} else {
485290a734f1427 Qu Wenruo          2015-10-29  1793  				u64 __pos;
485290a734f1427 Qu Wenruo          2015-10-29  1794  =

da17066c40472c2 Jeff Mahoney       2016-06-15  1795  				__pos =3D round_do=
wn(pos,
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1796  						   fs_info->sect=
orsize) +
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1797  					(dirty_pages << P=
AGE_SHIFT);
86d52921a2ba51a Nikolay Borisov    2020-06-03  1798  				btrfs_delalloc_rel=
ease_space(BTRFS_I(inode),
bc42bda22345efd Qu Wenruo          2017-02-27  1799  						data_reserved, _=
_pos,
43b18595d6603cb Qu Wenruo          2017-12-12  1800  						release_bytes, t=
rue);
914ee295af418e9 Xin Zhong          2010-12-09  1801  			}
485290a734f1427 Qu Wenruo          2015-10-29  1802  		}
914ee295af418e9 Xin Zhong          2010-12-09  1803  =

2e78c927d79333f Chandan Rajendra   2016-01-21  1804  		release_bytes =3D ro=
und_up(copied + sector_offset,
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1805  					fs_info->sectorsi=
ze);
376cc685cb3b43a Miao Xie           2013-12-10  1806  =

088545f6e442605 Nikolay Borisov    2020-06-03  1807  		ret =3D btrfs_dirty_=
pages(BTRFS_I(inode), pages,
088545f6e442605 Nikolay Borisov    2020-06-03  1808  					dirty_pages, pos,=
 copied,
aa8c1a41a1e6108 Goldwyn Rodrigues  2020-10-14  1809  					&cached_state, on=
ly_release_metadata);
c67d970f0ea8dcc Filipe Manana      2019-09-30  1810  =

c67d970f0ea8dcc Filipe Manana      2019-09-30  1811  		/*
c67d970f0ea8dcc Filipe Manana      2019-09-30  1812  		 * If we have not lo=
cked the extent range, because the range's
c67d970f0ea8dcc Filipe Manana      2019-09-30  1813  		 * start offset is >=
=3D i_size, we might still have a non-NULL
c67d970f0ea8dcc Filipe Manana      2019-09-30  1814  		 * cached extent sta=
te, acquired while marking the extent range
c67d970f0ea8dcc Filipe Manana      2019-09-30  1815  		 * as delalloc throu=
gh btrfs_dirty_pages(). Therefore free any
c67d970f0ea8dcc Filipe Manana      2019-09-30  1816  		 * possible cached e=
xtent state to avoid a memory leak.
c67d970f0ea8dcc Filipe Manana      2019-09-30  1817  		 */
79f015f216539df Goldwyn Rodrigues  2017-10-16  1818  		if (extents_locked)
376cc685cb3b43a Miao Xie           2013-12-10  1819  			unlock_extent_cache=
d(&BTRFS_I(inode)->io_tree,
e43bbe5e16d87b4 David Sterba       2017-12-12  1820  					     lockstart, l=
ockend, &cached_state);
c67d970f0ea8dcc Filipe Manana      2019-09-30  1821  		else
c67d970f0ea8dcc Filipe Manana      2019-09-30  1822  			free_extent_state(c=
ached_state);
c67d970f0ea8dcc Filipe Manana      2019-09-30  1823  =

8702ba9396bf7bb Qu Wenruo          2019-10-14  1824  		btrfs_delalloc_relea=
se_extents(BTRFS_I(inode), reserve_bytes);
f1de968376340c9 Miao Xie           2014-01-09  1825  		if (ret) {
d0215f3e5ebb580 Josef Bacik        2011-01-25  1826  			btrfs_drop_pages(pa=
ges, num_pages);
d0215f3e5ebb580 Josef Bacik        2011-01-25  1827  			break;
f1de968376340c9 Miao Xie           2014-01-09  1828  		}
39279cc3d2704cf Chris Mason        2007-06-12  1829  =

7ee9e4405f264e9 Josef Bacik        2013-06-21  1830  		release_bytes =3D 0;
8257b2dc3c1a105 Miao Xie           2014-03-06  1831  		if (only_release_met=
adata)
38d37aa9c329382 Qu Wenruo          2020-06-24  1832  			btrfs_check_nocow_u=
nlock(BTRFS_I(inode));
8257b2dc3c1a105 Miao Xie           2014-03-06  1833  =

f1de968376340c9 Miao Xie           2014-01-09  1834  		btrfs_drop_pages(pag=
es, num_pages);
f1de968376340c9 Miao Xie           2014-01-09  1835  =

d0215f3e5ebb580 Josef Bacik        2011-01-25  1836  		cond_resched();
d0215f3e5ebb580 Josef Bacik        2011-01-25  1837  =

d0e1d66b5aa1ec9 Namjae Jeon        2012-12-11  1838  		balance_dirty_pages_=
ratelimited(inode->i_mapping);
cb843a6f513a1a9 Chris Mason        2008-10-03  1839  =

914ee295af418e9 Xin Zhong          2010-12-09  1840  		pos +=3D copied;
914ee295af418e9 Xin Zhong          2010-12-09  1841  		num_written +=3D cop=
ied;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1842  	}
39279cc3d2704cf Chris Mason        2007-06-12  1843  =

d0215f3e5ebb580 Josef Bacik        2011-01-25  1844  	kfree(pages);
d0215f3e5ebb580 Josef Bacik        2011-01-25  1845  =

7ee9e4405f264e9 Josef Bacik        2013-06-21  1846  	if (release_bytes) {
8257b2dc3c1a105 Miao Xie           2014-03-06  1847  		if (only_release_met=
adata) {
38d37aa9c329382 Qu Wenruo          2020-06-24  1848  			btrfs_check_nocow_u=
nlock(BTRFS_I(inode));
691fa059673b3b3 Nikolay Borisov    2017-02-20  1849  			btrfs_delalloc_rele=
ase_metadata(BTRFS_I(inode),
43b18595d6603cb Qu Wenruo          2017-12-12  1850  					release_bytes, tr=
ue);
8257b2dc3c1a105 Miao Xie           2014-03-06  1851  		} else {
86d52921a2ba51a Nikolay Borisov    2020-06-03  1852  			btrfs_delalloc_rele=
ase_space(BTRFS_I(inode),
86d52921a2ba51a Nikolay Borisov    2020-06-03  1853  					data_reserved,
0b246afa62b0cf5 Jeff Mahoney       2016-06-22  1854  					round_down(pos, f=
s_info->sectorsize),
43b18595d6603cb Qu Wenruo          2017-12-12  1855  					release_bytes, tr=
ue);
7ee9e4405f264e9 Josef Bacik        2013-06-21  1856  		}
8257b2dc3c1a105 Miao Xie           2014-03-06  1857  	}
7ee9e4405f264e9 Josef Bacik        2013-06-21  1858  =

364ecf3651e0862 Qu Wenruo          2017-02-27  1859  	extent_changeset_free=
(data_reserved);
5e8b9ef30392bb8 Goldwyn Rodrigues  2020-09-24  1860  	if (num_written > 0) {
5e8b9ef30392bb8 Goldwyn Rodrigues  2020-09-24  1861  		pagecache_isize_exte=
nded(inode, old_isize, iocb->ki_pos);
5e8b9ef30392bb8 Goldwyn Rodrigues  2020-09-24  1862  		iocb->ki_pos +=3D nu=
m_written;
5e8b9ef30392bb8 Goldwyn Rodrigues  2020-09-24  1863  	}
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1864  out:
d0215f3e5ebb580 Josef Bacik        2011-01-25 @1865  	return num_written ? =
num_written : ret;
39279cc3d2704cf Chris Mason        2007-06-12  1866  }
d0215f3e5ebb580 Josef Bacik        2011-01-25  1867  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9033410641857634103==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9033410641857634103==--

