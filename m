Content-Type: multipart/mixed; boundary="===============5104560128573372695=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:delayed_attrs_v26_extended 28/30] fs/xfs/xfs_ioctl.c:1753 xfs_ioc_get_parent_pointer() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Tue, 25 Jan 2022 08:26:31 +0800
Message-ID: <202201250715.EbP8D1XT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5104560128573372695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v26_=
extended
head:   19459f5cfa422b0a6a9cd3898892e43ecb49f8f3
commit: 38f492d29e0c25066170d87572b7ade7bf2af72b [28/30] xfs: Add parent po=
inter ioctl
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: nios2-randconfig-m031-20220124 (https://download.01.org/0day-ci/arc=
hive/20220125/202201250715.EbP8D1XT-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_ioctl.c:1753 xfs_ioc_get_parent_pointer() warn: maybe return -EF=
AULT instead of the bytes remaining?

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +1753 fs/xfs/xfs_ioctl.c

36fd6e863cb732 Darrick J. Wong   2017-10-17  1674  =

38f492d29e0c25 Allison Henderson 2021-07-23  1675  /*
38f492d29e0c25 Allison Henderson 2021-07-23  1676   * IOCTL routine to get =
the parent pointers of an inode and return it to user
38f492d29e0c25 Allison Henderson 2021-07-23  1677   * space.  Caller must p=
ass a buffer space containing a struct xfs_pptr_info,
38f492d29e0c25 Allison Henderson 2021-07-23  1678   * followed by a region =
large enough to contain an array of struct
38f492d29e0c25 Allison Henderson 2021-07-23  1679   * xfs_parent_ptr of a s=
ize specified in pi_ptrs_size.  If the inode contains
38f492d29e0c25 Allison Henderson 2021-07-23  1680   * more parent pointers =
than can fit in the buffer space, caller may re-call
38f492d29e0c25 Allison Henderson 2021-07-23  1681   * the function using th=
e returned pi_cursor to resume iteration.  The
38f492d29e0c25 Allison Henderson 2021-07-23  1682   * number of xfs_parent_=
ptr returned will be stored in pi_ptrs_used.
38f492d29e0c25 Allison Henderson 2021-07-23  1683   *
38f492d29e0c25 Allison Henderson 2021-07-23  1684   * Returns 0 on success =
or non-zero on failure
38f492d29e0c25 Allison Henderson 2021-07-23  1685   */
38f492d29e0c25 Allison Henderson 2021-07-23  1686  STATIC int
38f492d29e0c25 Allison Henderson 2021-07-23  1687  xfs_ioc_get_parent_point=
er(
38f492d29e0c25 Allison Henderson 2021-07-23  1688  	struct file			*filp,
38f492d29e0c25 Allison Henderson 2021-07-23  1689  	void				__user *arg)
38f492d29e0c25 Allison Henderson 2021-07-23  1690  {
38f492d29e0c25 Allison Henderson 2021-07-23  1691  	struct xfs_pptr_info		*=
ppi =3D NULL;
38f492d29e0c25 Allison Henderson 2021-07-23  1692  	int				error =3D 0;
38f492d29e0c25 Allison Henderson 2021-07-23  1693  	struct xfs_inode		*ip =
=3D XFS_I(file_inode(filp));
38f492d29e0c25 Allison Henderson 2021-07-23  1694  	struct xfs_mount		*mp =
=3D ip->i_mount;
38f492d29e0c25 Allison Henderson 2021-07-23  1695  =

38f492d29e0c25 Allison Henderson 2021-07-23  1696  	if (!capable(CAP_SYS_AD=
MIN))
38f492d29e0c25 Allison Henderson 2021-07-23  1697  		return -EPERM;
38f492d29e0c25 Allison Henderson 2021-07-23  1698  =

38f492d29e0c25 Allison Henderson 2021-07-23  1699  	/* Allocate an xfs_pptr=
_info to put the user data */
38f492d29e0c25 Allison Henderson 2021-07-23  1700  	ppi =3D kmem_alloc(size=
of(struct xfs_pptr_info), 0);
38f492d29e0c25 Allison Henderson 2021-07-23  1701  	if (!ppi)
38f492d29e0c25 Allison Henderson 2021-07-23  1702  		return -ENOMEM;
38f492d29e0c25 Allison Henderson 2021-07-23  1703  =

38f492d29e0c25 Allison Henderson 2021-07-23  1704  	/* Copy the data from t=
he user */
38f492d29e0c25 Allison Henderson 2021-07-23  1705  	error =3D copy_from_use=
r(ppi, arg, sizeof(struct xfs_pptr_info));
38f492d29e0c25 Allison Henderson 2021-07-23  1706  	if (error)
38f492d29e0c25 Allison Henderson 2021-07-23  1707  		goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1708  =

38f492d29e0c25 Allison Henderson 2021-07-23  1709  	/* Check size of buffer=
 requested by user */
38f492d29e0c25 Allison Henderson 2021-07-23  1710  	if (XFS_PPTR_INFO_SIZEO=
F(ppi->pi_ptrs_size) > XFS_XATTR_LIST_MAX) {
38f492d29e0c25 Allison Henderson 2021-07-23  1711  		error =3D -ENOMEM;
38f492d29e0c25 Allison Henderson 2021-07-23  1712  		goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1713  	}
38f492d29e0c25 Allison Henderson 2021-07-23  1714  =

38f492d29e0c25 Allison Henderson 2021-07-23  1715  	/*
38f492d29e0c25 Allison Henderson 2021-07-23  1716  	 * Now that we know how=
 big the trailing buffer is, expand
38f492d29e0c25 Allison Henderson 2021-07-23  1717  	 * our kernel xfs_pptr_=
info to be the same size
38f492d29e0c25 Allison Henderson 2021-07-23  1718  	 */
38f492d29e0c25 Allison Henderson 2021-07-23  1719  	ppi =3D krealloc(ppi, X=
FS_PPTR_INFO_SIZEOF(ppi->pi_ptrs_size),
38f492d29e0c25 Allison Henderson 2021-07-23  1720  		       GFP_NOFS | __GF=
P_NOFAIL);
38f492d29e0c25 Allison Henderson 2021-07-23  1721  	if (!ppi)
38f492d29e0c25 Allison Henderson 2021-07-23  1722  		return -ENOMEM;
38f492d29e0c25 Allison Henderson 2021-07-23  1723  =

38f492d29e0c25 Allison Henderson 2021-07-23  1724  	if (ppi->pi_flags !=3D =
0 && ppi->pi_flags !=3D XFS_PPTR_IFLAG_HANDLE) {
38f492d29e0c25 Allison Henderson 2021-07-23  1725  		error =3D -EINVAL;
38f492d29e0c25 Allison Henderson 2021-07-23  1726  		goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1727  	}
38f492d29e0c25 Allison Henderson 2021-07-23  1728  =

38f492d29e0c25 Allison Henderson 2021-07-23  1729  	if (ppi->pi_flags =3D=
=3D XFS_PPTR_IFLAG_HANDLE) {
38f492d29e0c25 Allison Henderson 2021-07-23  1730  		error =3D xfs_iget(mp,=
 NULL, ppi->pi_handle.ha_fid.fid_ino,
38f492d29e0c25 Allison Henderson 2021-07-23  1731  				0, 0, &ip);
38f492d29e0c25 Allison Henderson 2021-07-23  1732  		if (error)
38f492d29e0c25 Allison Henderson 2021-07-23  1733  			goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1734  	}
38f492d29e0c25 Allison Henderson 2021-07-23  1735  =

38f492d29e0c25 Allison Henderson 2021-07-23  1736  	if (ip->i_ino =3D=3D mp=
->m_sb.sb_rootino)
38f492d29e0c25 Allison Henderson 2021-07-23  1737  		ppi->pi_flags |=3D XFS=
_PPTR_OFLAG_ROOT;
38f492d29e0c25 Allison Henderson 2021-07-23  1738  =

38f492d29e0c25 Allison Henderson 2021-07-23  1739  	/* Get the parent point=
ers */
38f492d29e0c25 Allison Henderson 2021-07-23  1740  	error =3D xfs_attr_get_=
parent_pointer(ip, ppi);
38f492d29e0c25 Allison Henderson 2021-07-23  1741  =

38f492d29e0c25 Allison Henderson 2021-07-23  1742  	if (error)
38f492d29e0c25 Allison Henderson 2021-07-23  1743  		goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1744  =

38f492d29e0c25 Allison Henderson 2021-07-23  1745  	/* Copy the parent poin=
ters back to the user */
38f492d29e0c25 Allison Henderson 2021-07-23  1746  	error =3D copy_to_user(=
arg, ppi,
38f492d29e0c25 Allison Henderson 2021-07-23  1747  			XFS_PPTR_INFO_SIZEOF(=
ppi->pi_ptrs_size));
38f492d29e0c25 Allison Henderson 2021-07-23  1748  	if (error)
38f492d29e0c25 Allison Henderson 2021-07-23  1749  		goto out;
38f492d29e0c25 Allison Henderson 2021-07-23  1750  =

38f492d29e0c25 Allison Henderson 2021-07-23  1751  out:
38f492d29e0c25 Allison Henderson 2021-07-23  1752  	kmem_free(ppi);
38f492d29e0c25 Allison Henderson 2021-07-23 @1753  	return error;
38f492d29e0c25 Allison Henderson 2021-07-23  1754  }
38f492d29e0c25 Allison Henderson 2021-07-23  1755  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5104560128573372695==--

