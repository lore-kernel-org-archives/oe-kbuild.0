Content-Type: multipart/mixed; boundary="===============0922873986753638457=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:larp_cleanupv4_pptrs 35/35] fs/xfs/xfs_ioctl.c:1756 xfs_ioc_get_parent_pointer() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Thu, 12 May 2022 11:22:21 +0800
Message-ID: <202205121128.R82udPf8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0922873986753638457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git larp_cleanupv4_ppt=
rs
head:   3d7771d8177638d5d115404cbee0b9a77cf0bb4c
commit: 3d7771d8177638d5d115404cbee0b9a77cf0bb4c [35/35] xfs: Add parent po=
inter ioctl
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-m031-20220509 (https://download.01.org/0day-ci/arch=
ive/20220512/202205121128.R82udPf8-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_ioctl.c:1756 xfs_ioc_get_parent_pointer() warn: maybe return -EF=
AULT instead of the bytes remaining?

vim +1756 fs/xfs/xfs_ioctl.c

36fd6e863cb732 Darrick J. Wong   2017-10-17  1677  =

3d7771d8177638 Allison Henderson 2022-05-10  1678  /*
3d7771d8177638 Allison Henderson 2022-05-10  1679   * IOCTL routine to get =
the parent pointers of an inode and return it to user
3d7771d8177638 Allison Henderson 2022-05-10  1680   * space.  Caller must p=
ass a buffer space containing a struct xfs_pptr_info,
3d7771d8177638 Allison Henderson 2022-05-10  1681   * followed by a region =
large enough to contain an array of struct
3d7771d8177638 Allison Henderson 2022-05-10  1682   * xfs_parent_ptr of a s=
ize specified in pi_ptrs_size.  If the inode contains
3d7771d8177638 Allison Henderson 2022-05-10  1683   * more parent pointers =
than can fit in the buffer space, caller may re-call
3d7771d8177638 Allison Henderson 2022-05-10  1684   * the function using th=
e returned pi_cursor to resume iteration.  The
3d7771d8177638 Allison Henderson 2022-05-10  1685   * number of xfs_parent_=
ptr returned will be stored in pi_ptrs_used.
3d7771d8177638 Allison Henderson 2022-05-10  1686   *
3d7771d8177638 Allison Henderson 2022-05-10  1687   * Returns 0 on success =
or non-zero on failure
3d7771d8177638 Allison Henderson 2022-05-10  1688   */
3d7771d8177638 Allison Henderson 2022-05-10  1689  STATIC int
3d7771d8177638 Allison Henderson 2022-05-10  1690  xfs_ioc_get_parent_point=
er(
3d7771d8177638 Allison Henderson 2022-05-10  1691  	struct file			*filp,
3d7771d8177638 Allison Henderson 2022-05-10  1692  	void				__user *arg)
3d7771d8177638 Allison Henderson 2022-05-10  1693  {
3d7771d8177638 Allison Henderson 2022-05-10  1694  	struct xfs_pptr_info		*=
ppi =3D NULL;
3d7771d8177638 Allison Henderson 2022-05-10  1695  	int				error =3D 0;
3d7771d8177638 Allison Henderson 2022-05-10  1696  	struct xfs_inode		*ip =
=3D XFS_I(file_inode(filp));
3d7771d8177638 Allison Henderson 2022-05-10  1697  	struct xfs_mount		*mp =
=3D ip->i_mount;
3d7771d8177638 Allison Henderson 2022-05-10  1698  =

3d7771d8177638 Allison Henderson 2022-05-10  1699  	if (!capable(CAP_SYS_AD=
MIN))
3d7771d8177638 Allison Henderson 2022-05-10  1700  		return -EPERM;
3d7771d8177638 Allison Henderson 2022-05-10  1701  =

3d7771d8177638 Allison Henderson 2022-05-10  1702  	/* Allocate an xfs_pptr=
_info to put the user data */
3d7771d8177638 Allison Henderson 2022-05-10  1703  	ppi =3D kmem_alloc(size=
of(struct xfs_pptr_info), 0);
3d7771d8177638 Allison Henderson 2022-05-10  1704  	if (!ppi)
3d7771d8177638 Allison Henderson 2022-05-10  1705  		return -ENOMEM;
3d7771d8177638 Allison Henderson 2022-05-10  1706  =

3d7771d8177638 Allison Henderson 2022-05-10  1707  	/* Copy the data from t=
he user */
3d7771d8177638 Allison Henderson 2022-05-10  1708  	error =3D copy_from_use=
r(ppi, arg, sizeof(struct xfs_pptr_info));
3d7771d8177638 Allison Henderson 2022-05-10  1709  	if (error)
3d7771d8177638 Allison Henderson 2022-05-10  1710  		goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1711  =

3d7771d8177638 Allison Henderson 2022-05-10  1712  	/* Check size of buffer=
 requested by user */
3d7771d8177638 Allison Henderson 2022-05-10  1713  	if (XFS_PPTR_INFO_SIZEO=
F(ppi->pi_ptrs_size) > XFS_XATTR_LIST_MAX) {
3d7771d8177638 Allison Henderson 2022-05-10  1714  		error =3D -ENOMEM;
3d7771d8177638 Allison Henderson 2022-05-10  1715  		goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1716  	}
3d7771d8177638 Allison Henderson 2022-05-10  1717  =

3d7771d8177638 Allison Henderson 2022-05-10  1718  	/*
3d7771d8177638 Allison Henderson 2022-05-10  1719  	 * Now that we know how=
 big the trailing buffer is, expand
3d7771d8177638 Allison Henderson 2022-05-10  1720  	 * our kernel xfs_pptr_=
info to be the same size
3d7771d8177638 Allison Henderson 2022-05-10  1721  	 */
3d7771d8177638 Allison Henderson 2022-05-10  1722  	ppi =3D krealloc(ppi, X=
FS_PPTR_INFO_SIZEOF(ppi->pi_ptrs_size),
3d7771d8177638 Allison Henderson 2022-05-10  1723  		       GFP_NOFS | __GF=
P_NOFAIL);
3d7771d8177638 Allison Henderson 2022-05-10  1724  	if (!ppi)
3d7771d8177638 Allison Henderson 2022-05-10  1725  		return -ENOMEM;
3d7771d8177638 Allison Henderson 2022-05-10  1726  =

3d7771d8177638 Allison Henderson 2022-05-10  1727  	if (ppi->pi_flags !=3D =
0 && ppi->pi_flags !=3D XFS_PPTR_IFLAG_HANDLE) {
3d7771d8177638 Allison Henderson 2022-05-10  1728  		error =3D -EINVAL;
3d7771d8177638 Allison Henderson 2022-05-10  1729  		goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1730  	}
3d7771d8177638 Allison Henderson 2022-05-10  1731  =

3d7771d8177638 Allison Henderson 2022-05-10  1732  	if (ppi->pi_flags =3D=
=3D XFS_PPTR_IFLAG_HANDLE) {
3d7771d8177638 Allison Henderson 2022-05-10  1733  		error =3D xfs_iget(mp,=
 NULL, ppi->pi_handle.ha_fid.fid_ino,
3d7771d8177638 Allison Henderson 2022-05-10  1734  				0, 0, &ip);
3d7771d8177638 Allison Henderson 2022-05-10  1735  		if (error)
3d7771d8177638 Allison Henderson 2022-05-10  1736  			goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1737  	}
3d7771d8177638 Allison Henderson 2022-05-10  1738  =

3d7771d8177638 Allison Henderson 2022-05-10  1739  	if (ip->i_ino =3D=3D mp=
->m_sb.sb_rootino)
3d7771d8177638 Allison Henderson 2022-05-10  1740  		ppi->pi_flags |=3D XFS=
_PPTR_OFLAG_ROOT;
3d7771d8177638 Allison Henderson 2022-05-10  1741  =

3d7771d8177638 Allison Henderson 2022-05-10  1742  	/* Get the parent point=
ers */
3d7771d8177638 Allison Henderson 2022-05-10  1743  	error =3D xfs_attr_get_=
parent_pointer(ip, ppi);
3d7771d8177638 Allison Henderson 2022-05-10  1744  =

3d7771d8177638 Allison Henderson 2022-05-10  1745  	if (error)
3d7771d8177638 Allison Henderson 2022-05-10  1746  		goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1747  =

3d7771d8177638 Allison Henderson 2022-05-10  1748  	/* Copy the parent poin=
ters back to the user */
3d7771d8177638 Allison Henderson 2022-05-10  1749  	error =3D copy_to_user(=
arg, ppi,
3d7771d8177638 Allison Henderson 2022-05-10  1750  			XFS_PPTR_INFO_SIZEOF(=
ppi->pi_ptrs_size));
3d7771d8177638 Allison Henderson 2022-05-10  1751  	if (error)
3d7771d8177638 Allison Henderson 2022-05-10  1752  		goto out;
3d7771d8177638 Allison Henderson 2022-05-10  1753  =

3d7771d8177638 Allison Henderson 2022-05-10  1754  out:
3d7771d8177638 Allison Henderson 2022-05-10  1755  	kmem_free(ppi);
3d7771d8177638 Allison Henderson 2022-05-10 @1756  	return error;
3d7771d8177638 Allison Henderson 2022-05-10  1757  }
3d7771d8177638 Allison Henderson 2022-05-10  1758  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0922873986753638457==--

