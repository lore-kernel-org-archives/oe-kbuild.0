Content-Type: multipart/mixed; boundary="===============6791393348424923275=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:wip-fscrypt 53/64] fs/ceph/file.c:1896 ceph_sync_write() error: uninitialized symbol 'assert_ver'.
Date: Wed, 25 May 2022 00:24:27 +0800
Message-ID: <202205250038.pULlmpTX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6791393348424923275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: ceph-devel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Xiubo Li <xiubli@redhat.com>

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   9ab30a676da19ce5d83364306a03d643dd446aca
commit: 6341655663fe166fd30acca6b4e692d2fafb02e5 [53/64] ceph: add read/mod=
ify/write to ceph_sync_write
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: microblaze-randconfig-m031-20220524 (https://download.01.org/0day-c=
i/archive/20220525/202205250038.pULlmpTX-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ceph/file.c:1896 ceph_sync_write() error: uninitialized symbol 'assert_v=
er'.

Old smatch warnings:
fs/ceph/file.c:146 iter_get_bvecs_alloc() warn: Please consider using kvcal=
loc instead of kvmalloc_array
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/assert_ver +1896 fs/ceph/file.c

e8344e668915a74 majianpeng         2013-09-12  1542  =

e8344e668915a74 majianpeng         2013-09-12  1543  /*
e8344e668915a74 majianpeng         2013-09-12  1544   * Synchronous write, =
straight from __user pointer or user pages.
e8344e668915a74 majianpeng         2013-09-12  1545   *
e8344e668915a74 majianpeng         2013-09-12  1546   * If write spans obje=
ct boundary, just do multiple writes.  (For a
e8344e668915a74 majianpeng         2013-09-12  1547   * correct atomic writ=
e, we should e.g. take write locks on all
e8344e668915a74 majianpeng         2013-09-12  1548   * objects, rollback o=
n failure, etc.)
e8344e668915a74 majianpeng         2013-09-12  1549   */
06fee30f6a31f10 Yan, Zheng         2014-07-28  1550  static ssize_t
5dda377cf0a6bd4 Yan, Zheng         2015-04-30  1551  ceph_sync_write(struct=
 kiocb *iocb, struct iov_iter *from, loff_t pos,
5dda377cf0a6bd4 Yan, Zheng         2015-04-30  1552  		struct ceph_snap_con=
text *snapc)
e8344e668915a74 majianpeng         2013-09-12  1553  {
e8344e668915a74 majianpeng         2013-09-12  1554  	struct file *file =3D=
 iocb->ki_filp;
e8344e668915a74 majianpeng         2013-09-12  1555  	struct inode *inode =
=3D file_inode(file);
e8344e668915a74 majianpeng         2013-09-12  1556  	struct ceph_inode_inf=
o *ci =3D ceph_inode(inode);
e8344e668915a74 majianpeng         2013-09-12  1557  	struct ceph_fs_client=
 *fsc =3D ceph_inode_to_client(inode);
6341655663fe166 Jeff Layton        2021-01-27  1558  	struct ceph_osd_clien=
t *osdc =3D &fsc->client->osdc;
e8344e668915a74 majianpeng         2013-09-12  1559  	struct ceph_osd_reque=
st *req;
e8344e668915a74 majianpeng         2013-09-12  1560  	struct page **pages;
e8344e668915a74 majianpeng         2013-09-12  1561  	u64 len;
e8344e668915a74 majianpeng         2013-09-12  1562  	int num_pages;
e8344e668915a74 majianpeng         2013-09-12  1563  	int written =3D 0;
e8344e668915a74 majianpeng         2013-09-12  1564  	int ret;
efb0ca765ac6f49 Yan, Zheng         2017-05-22  1565  	bool check_caps =3D f=
alse;
fac02ddf910814c Arnd Bergmann      2018-07-13  1566  	struct timespec64 mti=
me =3D current_time(inode);
4908b822b300d2d Al Viro            2014-04-03  1567  	size_t count =3D iov_=
iter_count(from);
e8344e668915a74 majianpeng         2013-09-12  1568  =

e8344e668915a74 majianpeng         2013-09-12  1569  	if (ceph_snap(file_in=
ode(file)) !=3D CEPH_NOSNAP)
e8344e668915a74 majianpeng         2013-09-12  1570  		return -EROFS;
e8344e668915a74 majianpeng         2013-09-12  1571  =

1c0a9c2d9783604 Yan, Zheng         2017-08-16  1572  	dout("sync_write on f=
ile %p %lld~%u snapc %p seq %lld\n",
1c0a9c2d9783604 Yan, Zheng         2017-08-16  1573  	     file, pos, (unsi=
gned)count, snapc, snapc->seq);
e8344e668915a74 majianpeng         2013-09-12  1574  =

e450f4d1a5d633d zhengbin           2019-02-01  1575  	ret =3D filemap_write=
_and_wait_range(inode->i_mapping,
e450f4d1a5d633d zhengbin           2019-02-01  1576  					   pos, pos + cou=
nt - 1);
e8344e668915a74 majianpeng         2013-09-12  1577  	if (ret < 0)
e8344e668915a74 majianpeng         2013-09-12  1578  		return ret;
e8344e668915a74 majianpeng         2013-09-12  1579  =

400e1286c0ec3fd Jeff Layton        2021-12-07  1580  	ceph_fscache_invalida=
te(inode, false);
e8344e668915a74 majianpeng         2013-09-12  1581  	ret =3D invalidate_in=
ode_pages2_range(inode->i_mapping,
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1582  					    pos >> PAGE_S=
HIFT,
e450f4d1a5d633d zhengbin           2019-02-01  1583  					    (pos + count =
- 1) >> PAGE_SHIFT);
e8344e668915a74 majianpeng         2013-09-12  1584  	if (ret < 0)
e8344e668915a74 majianpeng         2013-09-12  1585  		dout("invalidate_ino=
de_pages2_range returned %d\n", ret);
e8344e668915a74 majianpeng         2013-09-12  1586  =

4908b822b300d2d Al Viro            2014-04-03  1587  	while ((len =3D iov_i=
ter_count(from)) > 0) {
e8344e668915a74 majianpeng         2013-09-12  1588  		size_t left;
e8344e668915a74 majianpeng         2013-09-12  1589  		int n;
6341655663fe166 Jeff Layton        2021-01-27  1590  		u64 write_pos =3D po=
s;
6341655663fe166 Jeff Layton        2021-01-27  1591  		u64 write_len =3D le=
n;
6341655663fe166 Jeff Layton        2021-01-27  1592  		u64 objnum, objoff;
6341655663fe166 Jeff Layton        2021-01-27  1593  		u32 xlen;
6341655663fe166 Jeff Layton        2021-01-27  1594  		u64 assert_ver;
6341655663fe166 Jeff Layton        2021-01-27  1595  		bool rmw;
6341655663fe166 Jeff Layton        2021-01-27  1596  		bool first, last;
6341655663fe166 Jeff Layton        2021-01-27  1597  		struct iov_iter save=
d_iter =3D *from;
6341655663fe166 Jeff Layton        2021-01-27  1598  		size_t off;
e8344e668915a74 majianpeng         2013-09-12  1599  =

6341655663fe166 Jeff Layton        2021-01-27  1600  		ceph_fscrypt_adjust_=
off_and_len(inode, &write_pos, &write_len);
6341655663fe166 Jeff Layton        2021-01-27  1601  =

6341655663fe166 Jeff Layton        2021-01-27  1602  		/* clamp the length =
to the end of first object */
6341655663fe166 Jeff Layton        2021-01-27  1603  		ceph_calc_file_objec=
t_mapping(&ci->i_layout, write_pos,
6341655663fe166 Jeff Layton        2021-01-27  1604  						write_len, &objn=
um, &objoff,
6341655663fe166 Jeff Layton        2021-01-27  1605  						&xlen);
6341655663fe166 Jeff Layton        2021-01-27  1606  		write_len =3D xlen;
6341655663fe166 Jeff Layton        2021-01-27  1607  =

6341655663fe166 Jeff Layton        2021-01-27  1608  		/* adjust len downwa=
rd if it goes beyond current object */
6341655663fe166 Jeff Layton        2021-01-27  1609  		if (pos + len > writ=
e_pos + write_len)
6341655663fe166 Jeff Layton        2021-01-27  1610  			len =3D write_pos +=
 write_len - pos;
6341655663fe166 Jeff Layton        2021-01-27  1611  =

6341655663fe166 Jeff Layton        2021-01-27  1612  		/*
6341655663fe166 Jeff Layton        2021-01-27  1613  		 * If we had to adju=
st the length or position to align with a
6341655663fe166 Jeff Layton        2021-01-27  1614  		 * crypto block, the=
n we must do a read/modify/write cycle. We
6341655663fe166 Jeff Layton        2021-01-27  1615  		 * use a version ass=
ertion to redrive the thing if something
6341655663fe166 Jeff Layton        2021-01-27  1616  		 * changes in betwee=
n.
6341655663fe166 Jeff Layton        2021-01-27  1617  		 */
6341655663fe166 Jeff Layton        2021-01-27  1618  		first =3D pos !=3D w=
rite_pos;
6341655663fe166 Jeff Layton        2021-01-27  1619  		last =3D (pos + len)=
 !=3D (write_pos + write_len);
6341655663fe166 Jeff Layton        2021-01-27  1620  		rmw =3D first || las=
t;
6341655663fe166 Jeff Layton        2021-01-27  1621  =

6341655663fe166 Jeff Layton        2021-01-27  1622  		dout("sync_write ino=
 %llx %lld~%llu adjusted %lld~%llu -- %srmw\n",
6341655663fe166 Jeff Layton        2021-01-27  1623  		     ci->i_vino.ino,=
 pos, len, write_pos, write_len, rmw ? "" : "no ");
6341655663fe166 Jeff Layton        2021-01-27  1624  =

6341655663fe166 Jeff Layton        2021-01-27  1625  		/*
6341655663fe166 Jeff Layton        2021-01-27  1626  		 * The data is empla=
ced into the page as it would be if it were in
6341655663fe166 Jeff Layton        2021-01-27  1627  		 * an array of pagec=
ache pages.
6341655663fe166 Jeff Layton        2021-01-27  1628  		 */
6341655663fe166 Jeff Layton        2021-01-27  1629  		num_pages =3D calc_p=
ages_for(write_pos, write_len);
6341655663fe166 Jeff Layton        2021-01-27  1630  		pages =3D ceph_alloc=
_page_vector(num_pages, GFP_KERNEL);
6341655663fe166 Jeff Layton        2021-01-27  1631  		if (IS_ERR(pages)) {
6341655663fe166 Jeff Layton        2021-01-27  1632  			ret =3D PTR_ERR(pag=
es);
6341655663fe166 Jeff Layton        2021-01-27  1633  			break;
6341655663fe166 Jeff Layton        2021-01-27  1634  		}
6341655663fe166 Jeff Layton        2021-01-27  1635  =

6341655663fe166 Jeff Layton        2021-01-27  1636  		/* Do we need to pre=
load the pages? */
6341655663fe166 Jeff Layton        2021-01-27  1637  		if (rmw) {
6341655663fe166 Jeff Layton        2021-01-27  1638  			u64 first_pos =3D w=
rite_pos;
6341655663fe166 Jeff Layton        2021-01-27  1639  			u64 last_pos =3D (w=
rite_pos + write_len) - CEPH_FSCRYPT_BLOCK_SIZE;
6341655663fe166 Jeff Layton        2021-01-27  1640  			u64 read_len =3D CE=
PH_FSCRYPT_BLOCK_SIZE;
6341655663fe166 Jeff Layton        2021-01-27  1641  			struct ceph_osd_req=
_op *op;
6341655663fe166 Jeff Layton        2021-01-27  1642  =

6341655663fe166 Jeff Layton        2021-01-27  1643  			/* We should only n=
eed to do this for encrypted inodes */
6341655663fe166 Jeff Layton        2021-01-27  1644  			WARN_ON_ONCE(!IS_EN=
CRYPTED(inode));
6341655663fe166 Jeff Layton        2021-01-27  1645  =

6341655663fe166 Jeff Layton        2021-01-27  1646  			/* No need to do tw=
o reads if first and last blocks are same */
6341655663fe166 Jeff Layton        2021-01-27  1647  			if (first && last_p=
os =3D=3D first_pos)
6341655663fe166 Jeff Layton        2021-01-27  1648  				last =3D false;
6341655663fe166 Jeff Layton        2021-01-27  1649  =

6341655663fe166 Jeff Layton        2021-01-27  1650  			/*
6341655663fe166 Jeff Layton        2021-01-27  1651  			 * Allocate a read =
request for one or two extents, depending
6341655663fe166 Jeff Layton        2021-01-27  1652  			 * on how the reque=
st was aligned.
6341655663fe166 Jeff Layton        2021-01-27  1653  			 */
6341655663fe166 Jeff Layton        2021-01-27  1654  			req =3D ceph_osdc_n=
ew_request(osdc, &ci->i_layout,
6341655663fe166 Jeff Layton        2021-01-27  1655  					ci->i_vino, first=
 ? first_pos : last_pos,
6341655663fe166 Jeff Layton        2021-01-27  1656  					&read_len, 0, (fi=
rst && last) ? 2 : 1,
6341655663fe166 Jeff Layton        2021-01-27  1657  					CEPH_OSD_OP_SPARS=
E_READ, CEPH_OSD_FLAG_READ,
6341655663fe166 Jeff Layton        2021-01-27  1658  					NULL, ci->i_trunc=
ate_seq,
6341655663fe166 Jeff Layton        2021-01-27  1659  					ci->i_truncate_si=
ze, false);
e8344e668915a74 majianpeng         2013-09-12  1660  			if (IS_ERR(req)) {
6341655663fe166 Jeff Layton        2021-01-27  1661  				ceph_release_page_=
vector(pages, num_pages);
e8344e668915a74 majianpeng         2013-09-12  1662  				ret =3D PTR_ERR(re=
q);
eab87235c0f5979 Al Viro            2014-04-03  1663  				break;
e8344e668915a74 majianpeng         2013-09-12  1664  			}
e8344e668915a74 majianpeng         2013-09-12  1665  =

6341655663fe166 Jeff Layton        2021-01-27  1666  			/* Something is mis=
aligned! */
6341655663fe166 Jeff Layton        2021-01-27  1667  			if (read_len !=3D C=
EPH_FSCRYPT_BLOCK_SIZE) {
6341655663fe166 Jeff Layton        2021-01-27  1668  				ceph_osdc_put_requ=
est(req);
6341655663fe166 Jeff Layton        2021-01-27  1669  				ceph_release_page_=
vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1670  				ret =3D -EIO;
6341655663fe166 Jeff Layton        2021-01-27  1671  				break;
6341655663fe166 Jeff Layton        2021-01-27  1672  			}
6341655663fe166 Jeff Layton        2021-01-27  1673  =

6341655663fe166 Jeff Layton        2021-01-27  1674  			/* Add extent for f=
irst block? */
6341655663fe166 Jeff Layton        2021-01-27  1675  			op =3D &req->r_ops[=
0];
6341655663fe166 Jeff Layton        2021-01-27  1676  =

6341655663fe166 Jeff Layton        2021-01-27  1677  			if (first) {
6341655663fe166 Jeff Layton        2021-01-27  1678  				osd_req_op_extent_=
osd_data_pages(req, 0, pages,
6341655663fe166 Jeff Layton        2021-01-27  1679  							 CEPH_FSCRYPT_B=
LOCK_SIZE,
6341655663fe166 Jeff Layton        2021-01-27  1680  							 offset_in_page=
(first_pos),
6341655663fe166 Jeff Layton        2021-01-27  1681  							 false, false);
6341655663fe166 Jeff Layton        2021-01-27  1682  				/* We only expect =
a single extent here */
6341655663fe166 Jeff Layton        2021-01-27  1683  				ret =3D __ceph_all=
oc_sparse_ext_map(op, 1);
6341655663fe166 Jeff Layton        2021-01-27  1684  				if (ret) {
6341655663fe166 Jeff Layton        2021-01-27  1685  					ceph_osdc_put_req=
uest(req);
6341655663fe166 Jeff Layton        2021-01-27  1686  					ceph_release_page=
_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1687  					break;
6341655663fe166 Jeff Layton        2021-01-27  1688  				}
6341655663fe166 Jeff Layton        2021-01-27  1689  			}
6341655663fe166 Jeff Layton        2021-01-27  1690  =

6341655663fe166 Jeff Layton        2021-01-27  1691  			/* Add extent for l=
ast block */
6341655663fe166 Jeff Layton        2021-01-27  1692  			if (last) {
6341655663fe166 Jeff Layton        2021-01-27  1693  				/* Init the other =
extent if first extent has been used */
6341655663fe166 Jeff Layton        2021-01-27  1694  				if (first) {
6341655663fe166 Jeff Layton        2021-01-27  1695  					op =3D &req->r_op=
s[1];
6341655663fe166 Jeff Layton        2021-01-27  1696  					osd_req_op_extent=
_init(req, 1, CEPH_OSD_OP_SPARSE_READ,
6341655663fe166 Jeff Layton        2021-01-27  1697  							last_pos, CEPH_=
FSCRYPT_BLOCK_SIZE,
6341655663fe166 Jeff Layton        2021-01-27  1698  							ci->i_truncate_=
size,
6341655663fe166 Jeff Layton        2021-01-27  1699  							ci->i_truncate_=
seq);
6341655663fe166 Jeff Layton        2021-01-27  1700  				}
6341655663fe166 Jeff Layton        2021-01-27  1701  =

6341655663fe166 Jeff Layton        2021-01-27  1702  				ret =3D __ceph_all=
oc_sparse_ext_map(op, 1);
6341655663fe166 Jeff Layton        2021-01-27  1703  				if (ret) {
6341655663fe166 Jeff Layton        2021-01-27  1704  					ceph_osdc_put_req=
uest(req);
6341655663fe166 Jeff Layton        2021-01-27  1705  					ceph_release_page=
_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1706  					break;
6341655663fe166 Jeff Layton        2021-01-27  1707  				}
6341655663fe166 Jeff Layton        2021-01-27  1708  =

6341655663fe166 Jeff Layton        2021-01-27  1709  				osd_req_op_extent_=
osd_data_pages(req, first ? 1 : 0,
6341655663fe166 Jeff Layton        2021-01-27  1710  							&pages[num_page=
s - 1],
6341655663fe166 Jeff Layton        2021-01-27  1711  							CEPH_FSCRYPT_BL=
OCK_SIZE,
6341655663fe166 Jeff Layton        2021-01-27  1712  							offset_in_page(=
last_pos),
6341655663fe166 Jeff Layton        2021-01-27  1713  							false, false);
6341655663fe166 Jeff Layton        2021-01-27  1714  			}
6341655663fe166 Jeff Layton        2021-01-27  1715  =

6341655663fe166 Jeff Layton        2021-01-27  1716  			ret =3D ceph_osdc_s=
tart_request(osdc, req, false);
6341655663fe166 Jeff Layton        2021-01-27  1717  			if (!ret)
6341655663fe166 Jeff Layton        2021-01-27  1718  				ret =3D ceph_osdc_=
wait_request(osdc, req);
6341655663fe166 Jeff Layton        2021-01-27  1719  =

6341655663fe166 Jeff Layton        2021-01-27  1720  			/* FIXME: length fi=
eld is wrong if there are 2 extents */
6341655663fe166 Jeff Layton        2021-01-27  1721  			ceph_update_read_me=
trics(&fsc->mdsc->metric,
6341655663fe166 Jeff Layton        2021-01-27  1722  						 req->r_start_la=
tency,
6341655663fe166 Jeff Layton        2021-01-27  1723  						 req->r_end_late=
ncy,
6341655663fe166 Jeff Layton        2021-01-27  1724  						 read_len, ret);
6341655663fe166 Jeff Layton        2021-01-27  1725  =

6341655663fe166 Jeff Layton        2021-01-27  1726  			/* Ok if object is =
not already present */
6341655663fe166 Jeff Layton        2021-01-27  1727  			if (ret =3D=3D -ENO=
ENT) {
6341655663fe166 Jeff Layton        2021-01-27  1728  				/*
6341655663fe166 Jeff Layton        2021-01-27  1729  				 * If there is no =
object, then we can't assert
6341655663fe166 Jeff Layton        2021-01-27  1730  				 * on its version.=
 Set it to 0, and we'll use an
6341655663fe166 Jeff Layton        2021-01-27  1731  				 * exclusive creat=
e instead.
6341655663fe166 Jeff Layton        2021-01-27  1732  				 */
6341655663fe166 Jeff Layton        2021-01-27  1733  				ceph_osdc_put_requ=
est(req);
6341655663fe166 Jeff Layton        2021-01-27  1734  				assert_ver =3D 0;
6341655663fe166 Jeff Layton        2021-01-27  1735  				ret =3D 0;
6341655663fe166 Jeff Layton        2021-01-27  1736  =

6341655663fe166 Jeff Layton        2021-01-27  1737  				/*
6341655663fe166 Jeff Layton        2021-01-27  1738  				 * zero out the so=
on-to-be uncopied parts of the
6341655663fe166 Jeff Layton        2021-01-27  1739  				 * first and last =
pages.
6341655663fe166 Jeff Layton        2021-01-27  1740  				 */
6341655663fe166 Jeff Layton        2021-01-27  1741  				if (first)
6341655663fe166 Jeff Layton        2021-01-27  1742  					zero_user_segment=
(pages[0], 0,
6341655663fe166 Jeff Layton        2021-01-27  1743  							  offset_in_pag=
e(first_pos));
6341655663fe166 Jeff Layton        2021-01-27  1744  				if (last)
6341655663fe166 Jeff Layton        2021-01-27  1745  					zero_user_segment=
(pages[num_pages - 1],
6341655663fe166 Jeff Layton        2021-01-27  1746  							  offset_in_pag=
e(last_pos),
6341655663fe166 Jeff Layton        2021-01-27  1747  							  PAGE_SIZE);
6341655663fe166 Jeff Layton        2021-01-27  1748  			} else {
6341655663fe166 Jeff Layton        2021-01-27  1749  				if (ret < 0) {
6341655663fe166 Jeff Layton        2021-01-27  1750  					ceph_osdc_put_req=
uest(req);
6341655663fe166 Jeff Layton        2021-01-27  1751  					ceph_release_page=
_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1752  					break;
6341655663fe166 Jeff Layton        2021-01-27  1753  				}
6341655663fe166 Jeff Layton        2021-01-27  1754  =

6341655663fe166 Jeff Layton        2021-01-27  1755  				op =3D &req->r_ops=
[0];
6341655663fe166 Jeff Layton        2021-01-27  1756  				if (op->extent.spa=
rse_ext_cnt =3D=3D 0) {
6341655663fe166 Jeff Layton        2021-01-27  1757  					if (first)
6341655663fe166 Jeff Layton        2021-01-27  1758  						zero_user_segmen=
t(pages[0], 0,
6341655663fe166 Jeff Layton        2021-01-27  1759  								  offset_in_pa=
ge(first_pos));
6341655663fe166 Jeff Layton        2021-01-27  1760  					else
6341655663fe166 Jeff Layton        2021-01-27  1761  						zero_user_segmen=
t(pages[num_pages - 1],
6341655663fe166 Jeff Layton        2021-01-27  1762  								  offset_in_pa=
ge(last_pos),
6341655663fe166 Jeff Layton        2021-01-27  1763  								  PAGE_SIZE);
6341655663fe166 Jeff Layton        2021-01-27  1764  				} else if (op->ext=
ent.sparse_ext_cnt !=3D 1 ||
6341655663fe166 Jeff Layton        2021-01-27  1765  					   ceph_sparse_ex=
t_map_end(op) !=3D
6341655663fe166 Jeff Layton        2021-01-27  1766  						CEPH_FSCRYPT_BLO=
CK_SIZE) {
6341655663fe166 Jeff Layton        2021-01-27  1767  					ret =3D -EIO;
6341655663fe166 Jeff Layton        2021-01-27  1768  					ceph_osdc_put_req=
uest(req);
6341655663fe166 Jeff Layton        2021-01-27  1769  					ceph_release_page=
_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1770  					break;
6341655663fe166 Jeff Layton        2021-01-27  1771  				}
6341655663fe166 Jeff Layton        2021-01-27  1772  =

6341655663fe166 Jeff Layton        2021-01-27  1773  				if (first && last)=
 {
6341655663fe166 Jeff Layton        2021-01-27  1774  					op =3D &req->r_op=
s[1];
6341655663fe166 Jeff Layton        2021-01-27  1775  					if (op->extent.sp=
arse_ext_cnt =3D=3D 0) {
6341655663fe166 Jeff Layton        2021-01-27  1776  						zero_user_segmen=
t(pages[num_pages - 1],
6341655663fe166 Jeff Layton        2021-01-27  1777  								  offset_in_pa=
ge(last_pos),
6341655663fe166 Jeff Layton        2021-01-27  1778  								  PAGE_SIZE);
6341655663fe166 Jeff Layton        2021-01-27  1779  					} else if (op->ex=
tent.sparse_ext_cnt !=3D 1 ||
6341655663fe166 Jeff Layton        2021-01-27  1780  						   ceph_sparse_e=
xt_map_end(op) !=3D
6341655663fe166 Jeff Layton        2021-01-27  1781  							CEPH_FSCRYPT_BL=
OCK_SIZE) {
6341655663fe166 Jeff Layton        2021-01-27  1782  						ret =3D -EIO;
6341655663fe166 Jeff Layton        2021-01-27  1783  						ceph_osdc_put_re=
quest(req);
6341655663fe166 Jeff Layton        2021-01-27  1784  						ceph_release_pag=
e_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1785  						break;
6341655663fe166 Jeff Layton        2021-01-27  1786  					}
6341655663fe166 Jeff Layton        2021-01-27  1787  				}
6341655663fe166 Jeff Layton        2021-01-27  1788  =

6341655663fe166 Jeff Layton        2021-01-27  1789  				/* Grab assert ver=
sion. It must be non-zero. */
6341655663fe166 Jeff Layton        2021-01-27  1790  				assert_ver =3D req=
->r_version;
6341655663fe166 Jeff Layton        2021-01-27  1791  				WARN_ON_ONCE(ret >=
 0 && assert_ver =3D=3D 0);
6341655663fe166 Jeff Layton        2021-01-27  1792  =

6341655663fe166 Jeff Layton        2021-01-27  1793  				ceph_osdc_put_requ=
est(req);
6341655663fe166 Jeff Layton        2021-01-27  1794  				if (first) {
6341655663fe166 Jeff Layton        2021-01-27  1795  					ret =3D ceph_fscr=
ypt_decrypt_block_inplace(inode,
6341655663fe166 Jeff Layton        2021-01-27  1796  							pages[0],
6341655663fe166 Jeff Layton        2021-01-27  1797  							CEPH_FSCRYPT_BL=
OCK_SIZE,
6341655663fe166 Jeff Layton        2021-01-27  1798  							offset_in_page(=
first_pos),
6341655663fe166 Jeff Layton        2021-01-27  1799  							first_pos >> CE=
PH_FSCRYPT_BLOCK_SHIFT);
6341655663fe166 Jeff Layton        2021-01-27  1800  					if (ret < 0) {
6341655663fe166 Jeff Layton        2021-01-27  1801  						ceph_release_pag=
e_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1802  						break;
6341655663fe166 Jeff Layton        2021-01-27  1803  					}
6341655663fe166 Jeff Layton        2021-01-27  1804  				}
6341655663fe166 Jeff Layton        2021-01-27  1805  				if (last) {
6341655663fe166 Jeff Layton        2021-01-27  1806  					ret =3D ceph_fscr=
ypt_decrypt_block_inplace(inode,
6341655663fe166 Jeff Layton        2021-01-27  1807  							pages[num_pages=
 - 1],
6341655663fe166 Jeff Layton        2021-01-27  1808  							CEPH_FSCRYPT_BL=
OCK_SIZE,
6341655663fe166 Jeff Layton        2021-01-27  1809  							offset_in_page(=
last_pos),
6341655663fe166 Jeff Layton        2021-01-27  1810  							last_pos >> CEP=
H_FSCRYPT_BLOCK_SHIFT);
6341655663fe166 Jeff Layton        2021-01-27  1811  					if (ret < 0) {
6341655663fe166 Jeff Layton        2021-01-27  1812  						ceph_release_pag=
e_vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1813  						break;
6341655663fe166 Jeff Layton        2021-01-27  1814  					}
6341655663fe166 Jeff Layton        2021-01-27  1815  				}
6341655663fe166 Jeff Layton        2021-01-27  1816  			}
124e68e74099090 Sage Weil          2009-10-06  1817  		}
e8344e668915a74 majianpeng         2013-09-12  1818  =

e8344e668915a74 majianpeng         2013-09-12  1819  		left =3D len;
54f371cad7e715f Jeff Layton        2021-01-25  1820  		off =3D offset_in_pa=
ge(pos);
e8344e668915a74 majianpeng         2013-09-12  1821  		for (n =3D 0; n < nu=
m_pages; n++) {
54f371cad7e715f Jeff Layton        2021-01-25  1822  			size_t plen =3D min=
_t(size_t, left, PAGE_SIZE - off);
54f371cad7e715f Jeff Layton        2021-01-25  1823  =

6341655663fe166 Jeff Layton        2021-01-27  1824  			/* copy the data */
54f371cad7e715f Jeff Layton        2021-01-25  1825  			ret =3D copy_page_f=
rom_iter(pages[n], off, plen, from);
e8344e668915a74 majianpeng         2013-09-12  1826  			if (ret !=3D plen) {
e8344e668915a74 majianpeng         2013-09-12  1827  				ret =3D -EFAULT;
e8344e668915a74 majianpeng         2013-09-12  1828  				break;
e8344e668915a74 majianpeng         2013-09-12  1829  			}
6341655663fe166 Jeff Layton        2021-01-27  1830  			off =3D 0;
e8344e668915a74 majianpeng         2013-09-12  1831  			left -=3D ret;
e8344e668915a74 majianpeng         2013-09-12  1832  		}
6341655663fe166 Jeff Layton        2021-01-27  1833  		if (ret < 0) {
6341655663fe166 Jeff Layton        2021-01-27  1834  			dout("sync_write wr=
ite failed with %d\n", ret);
6341655663fe166 Jeff Layton        2021-01-27  1835  			ceph_release_page_v=
ector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1836  			break;
6341655663fe166 Jeff Layton        2021-01-27  1837  		}
e8344e668915a74 majianpeng         2013-09-12  1838  =

6341655663fe166 Jeff Layton        2021-01-27  1839  		if (IS_ENCRYPTED(ino=
de)) {
6341655663fe166 Jeff Layton        2021-01-27  1840  			ret =3D ceph_fscryp=
t_encrypt_pages(inode, pages,
6341655663fe166 Jeff Layton        2021-01-27  1841  							 write_pos, wri=
te_len,
6341655663fe166 Jeff Layton        2021-01-27  1842  							 GFP_KERNEL);
124e68e74099090 Sage Weil          2009-10-06  1843  			if (ret < 0) {
6341655663fe166 Jeff Layton        2021-01-27  1844  				dout("encryption f=
ailed with %d\n", ret);
124e68e74099090 Sage Weil          2009-10-06  1845  				ceph_release_page_=
vector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1846  				break;
6341655663fe166 Jeff Layton        2021-01-27  1847  			}
124e68e74099090 Sage Weil          2009-10-06  1848  		}
124e68e74099090 Sage Weil          2009-10-06  1849  =

6341655663fe166 Jeff Layton        2021-01-27  1850  		req =3D ceph_osdc_ne=
w_request(osdc, &ci->i_layout,
6341655663fe166 Jeff Layton        2021-01-27  1851  					    ci->i_vino, w=
rite_pos, &write_len,
6341655663fe166 Jeff Layton        2021-01-27  1852  					    rmw ? 1 : 0, =
rmw ? 2 : 1,
6341655663fe166 Jeff Layton        2021-01-27  1853  					    CEPH_OSD_OP_W=
RITE,
6341655663fe166 Jeff Layton        2021-01-27  1854  					    CEPH_OSD_FLAG=
_WRITE,
6341655663fe166 Jeff Layton        2021-01-27  1855  					    snapc, ci->i_=
truncate_seq,
6341655663fe166 Jeff Layton        2021-01-27  1856  					    ci->i_truncat=
e_size, false);
6341655663fe166 Jeff Layton        2021-01-27  1857  		if (IS_ERR(req)) {
6341655663fe166 Jeff Layton        2021-01-27  1858  			ret =3D PTR_ERR(req=
);
6341655663fe166 Jeff Layton        2021-01-27  1859  			ceph_release_page_v=
ector(pages, num_pages);
6341655663fe166 Jeff Layton        2021-01-27  1860  			break;
6341655663fe166 Jeff Layton        2021-01-27  1861  		}
6341655663fe166 Jeff Layton        2021-01-27  1862  =

6341655663fe166 Jeff Layton        2021-01-27  1863  		dout("sync_write wri=
te op %lld~%llu\n", write_pos, write_len);
6341655663fe166 Jeff Layton        2021-01-27  1864  		osd_req_op_extent_os=
d_data_pages(req, rmw ? 1 : 0, pages, write_len,
6341655663fe166 Jeff Layton        2021-01-27  1865  						 offset_in_page(=
write_pos), false,
6341655663fe166 Jeff Layton        2021-01-27  1866  						 true);
26be88087ae8a04 Alex Elder         2013-04-15  1867  		req->r_inode =3D ino=
de;
6341655663fe166 Jeff Layton        2021-01-27  1868  		req->r_mtime =3D mti=
me;
e8344e668915a74 majianpeng         2013-09-12  1869  =

6341655663fe166 Jeff Layton        2021-01-27  1870  		/* Set up the assert=
ion */
6341655663fe166 Jeff Layton        2021-01-27  1871  		if (rmw) {
6341655663fe166 Jeff Layton        2021-01-27  1872  			/*
6341655663fe166 Jeff Layton        2021-01-27  1873  			 * Set up the asser=
tion. If we don't have a version number,
6341655663fe166 Jeff Layton        2021-01-27  1874  			 * then the object =
doesn't exist yet. Use an exclusive create
6341655663fe166 Jeff Layton        2021-01-27  1875  			 * instead of a ver=
sion assertion in that case.
6341655663fe166 Jeff Layton        2021-01-27  1876  			 */
6341655663fe166 Jeff Layton        2021-01-27  1877  			if (assert_ver) {
6341655663fe166 Jeff Layton        2021-01-27  1878  				osd_req_op_init(re=
q, 0, CEPH_OSD_OP_ASSERT_VER, 0);
6341655663fe166 Jeff Layton        2021-01-27  1879  				req->r_ops[0].asse=
rt_ver.ver =3D assert_ver;
6341655663fe166 Jeff Layton        2021-01-27  1880  			} else {
6341655663fe166 Jeff Layton        2021-01-27  1881  				osd_req_op_init(re=
q, 0, CEPH_OSD_OP_CREATE,
6341655663fe166 Jeff Layton        2021-01-27  1882  						CEPH_OSD_OP_FLAG=
_EXCL);
6341655663fe166 Jeff Layton        2021-01-27  1883  			}
6341655663fe166 Jeff Layton        2021-01-27  1884  		}
124e68e74099090 Sage Weil          2009-10-06  1885  =

6341655663fe166 Jeff Layton        2021-01-27  1886  		ret =3D ceph_osdc_st=
art_request(osdc, req, false);
26be88087ae8a04 Alex Elder         2013-04-15  1887  		if (!ret)
6341655663fe166 Jeff Layton        2021-01-27  1888  			ret =3D ceph_osdc_w=
ait_request(osdc, req);
124e68e74099090 Sage Weil          2009-10-06  1889  =

8ae99ae2b40766a Xiubo Li           2021-03-22  1890  		ceph_update_write_me=
trics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05a Xiubo Li           2021-05-13  1891  					  req->r_end_late=
ncy, len, ret);
124e68e74099090 Sage Weil          2009-10-06  1892  		ceph_osdc_put_reques=
t(req);
26544c623e741ac Jeff Layton        2017-04-04  1893  		if (ret !=3D 0) {
6341655663fe166 Jeff Layton        2021-01-27  1894  			dout("sync_write os=
d write returned %d\n", ret);
6341655663fe166 Jeff Layton        2021-01-27  1895  			/* Version changed!=
 Must re-do the rmw cycle */
6341655663fe166 Jeff Layton        2021-01-27 @1896  			if ((assert_ver && =
(ret =3D=3D -ERANGE || ret =3D=3D -EOVERFLOW)) ||
6341655663fe166 Jeff Layton        2021-01-27  1897  			     (!assert_ver &=
& ret =3D=3D -EEXIST)) {
6341655663fe166 Jeff Layton        2021-01-27  1898  				/* We should only =
ever see this on a rmw */
6341655663fe166 Jeff Layton        2021-01-27  1899  				WARN_ON_ONCE(!rmw);
6341655663fe166 Jeff Layton        2021-01-27  1900  =

6341655663fe166 Jeff Layton        2021-01-27  1901  				/* The version sho=
uld never go backward */
6341655663fe166 Jeff Layton        2021-01-27  1902  				WARN_ON_ONCE(ret =
=3D=3D -EOVERFLOW);
6341655663fe166 Jeff Layton        2021-01-27  1903  =

6341655663fe166 Jeff Layton        2021-01-27  1904  				*from =3D saved_it=
er;
6341655663fe166 Jeff Layton        2021-01-27  1905  =

6341655663fe166 Jeff Layton        2021-01-27  1906  				/* FIXME: limit nu=
mber of times we loop? */
6341655663fe166 Jeff Layton        2021-01-27  1907  				continue;
6341655663fe166 Jeff Layton        2021-01-27  1908  			}
26544c623e741ac Jeff Layton        2017-04-04  1909  			ceph_set_error_writ=
e(ci);
26544c623e741ac Jeff Layton        2017-04-04  1910  			break;
26544c623e741ac Jeff Layton        2017-04-04  1911  		}
26544c623e741ac Jeff Layton        2017-04-04  1912  		ceph_clear_error_wri=
te(ci);
124e68e74099090 Sage Weil          2009-10-06  1913  		pos +=3D len;
124e68e74099090 Sage Weil          2009-10-06  1914  		written +=3D len;
6341655663fe166 Jeff Layton        2021-01-27  1915  		dout("sync_write wri=
tten %d\n", written);
e8344e668915a74 majianpeng         2013-09-12  1916  		if (pos > i_size_rea=
d(inode)) {
124e68e74099090 Sage Weil          2009-10-06  1917  			check_caps =3D ceph=
_inode_set_size(inode, pos);
124e68e74099090 Sage Weil          2009-10-06  1918  			if (check_caps)
e8344e668915a74 majianpeng         2013-09-12  1919  				ceph_check_caps(ce=
ph_inode(inode),
e8344e668915a74 majianpeng         2013-09-12  1920  						CHECK_CAPS_AUTHO=
NLY,
124e68e74099090 Sage Weil          2009-10-06  1921  						NULL);
e8344e668915a74 majianpeng         2013-09-12  1922  		}
26544c623e741ac Jeff Layton        2017-04-04  1923  =

e8344e668915a74 majianpeng         2013-09-12  1924  	}
e8344e668915a74 majianpeng         2013-09-12  1925  =

e8344e668915a74 majianpeng         2013-09-12  1926  	if (ret !=3D -EOLDSNA=
PC && written > 0) {
ee7289bfadda5f4 majianpeng         2013-08-21  1927  		ret =3D written;
e8344e668915a74 majianpeng         2013-09-12  1928  		iocb->ki_pos =3D pos;
124e68e74099090 Sage Weil          2009-10-06  1929  	}
6341655663fe166 Jeff Layton        2021-01-27  1930  	dout("sync_write retu=
rning %d\n", ret);
124e68e74099090 Sage Weil          2009-10-06  1931  	return ret;
124e68e74099090 Sage Weil          2009-10-06  1932  }
124e68e74099090 Sage Weil          2009-10-06  1933  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6791393348424923275==--

