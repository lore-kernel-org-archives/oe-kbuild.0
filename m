Content-Type: multipart/mixed; boundary="===============8850295127322741131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:reserve-rt-metadata-space 153/219] fs/xfs/scrub/repair.c:1819:15: warning: %d in format string (no. 2) requires 'int' but the argument type is 'unsigned int'.
Date: Sat, 19 Dec 2020 23:59:28 +0800
Message-ID: <202012192326.Lz8BX94k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8850295127322741131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t reserve-rt-metadata-space
head:   207e1ccd65605924e87691251452a581587d26d2
commit: 2abf21a89e265202ca879cbca962109544b3a557 [153/219] xfs: move orphan=
 files to the orphanage
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> fs/xfs/scrub/repair.c:1819:15: warning: %d in format string (no. 2) requ=
ires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_s=
int]
     xname.len =3D snprintf(fname, sizeof(fname), "%llu.%d",
                 ^
   fs/xfs/scrub/repair.c:270:6: warning: Uninitialized variable: freelen [u=
ninitvar]
        freelen >=3D aglen) {
        ^

vim +1819 fs/xfs/scrub/repair.c

2abf21a89e26520 Darrick J. Wong 2020-11-17  1782  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1783  /*
2abf21a89e26520 Darrick J. Wong 2020-11-17  1784   * Move the current file =
to the orphanage.  The caller must not hold any locks
2abf21a89e26520 Darrick J. Wong 2020-11-17  1785   * on the orphanage and m=
ust not hold the ILOCK on sc->ip.  sc->ip and
2abf21a89e26520 Darrick J. Wong 2020-11-17  1786   * sc->orphanage must not=
 be joined to the transaction.  The function returns
2abf21a89e26520 Darrick J. Wong 2020-11-17  1787   * with both inodes joine=
d, ILOCKed, and dirty.
2abf21a89e26520 Darrick J. Wong 2020-11-17  1788   */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1789  int
2abf21a89e26520 Darrick J. Wong 2020-11-17  1790  xrep_move_to_orphanage(
2abf21a89e26520 Darrick J. Wong 2020-11-17  1791  	struct xfs_scrub	*sc)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1792  {
2abf21a89e26520 Darrick J. Wong 2020-11-17  1793  	struct xfs_name		xname;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1794  	unsigned char		fname[MAX=
NAMELEN + 1];
2abf21a89e26520 Darrick J. Wong 2020-11-17  1795  	struct xfs_inode	*dp =3D=
 sc->orphanage;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1796  	struct xfs_mount	*mp =3D=
 sc->mp;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1797  	xfs_ino_t		ino;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1798  	unsigned int		incr =3D 0;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1799  	unsigned int		linkres, d=
otdotres;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1800  	int			error;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1801  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1802  	/* No orphanage?  We can=
't fix this. */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1803  	if (!sc->orphanage)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1804  		return -EFSCORRUPTED;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1805  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1806  	/* Try to grab the IOLOC=
K on the orphanage. */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1807  	error =3D xchk_ilock_inv=
erted(sc->orphanage, XFS_IOLOCK_EXCL);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1808  	if (error)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1809  		return error;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1810  	sc->orphanage_ilock_flag=
s |=3D XFS_IOLOCK_EXCL;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1811  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1812  	xname.name =3D fname;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1813  	xname.len =3D snprintf(f=
name, sizeof(fname), "%llu", sc->ip->i_ino);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1814  	xname.type =3D xfs_mode_=
to_ftype(VFS_I(sc->ip)->i_mode);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1815  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1816  	/* Make sure the filenam=
e is unique in the lost+found. */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1817  	error =3D xfs_dir_lookup=
(sc->tp, dp, &xname, &ino, NULL);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1818  	while (error =3D=3D 0 &&=
 incr < 10000) {
2abf21a89e26520 Darrick J. Wong 2020-11-17 @1819  		xname.len =3D snprintf(=
fname, sizeof(fname), "%llu.%d",
2abf21a89e26520 Darrick J. Wong 2020-11-17  1820  				sc->ip->i_ino, ++incr=
);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1821  		error =3D xfs_dir_looku=
p(sc->tp, dp, &xname, &ino, NULL);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1822  	}
2abf21a89e26520 Darrick J. Wong 2020-11-17  1823  	if (error =3D=3D 0) {
2abf21a89e26520 Darrick J. Wong 2020-11-17  1824  		/* We already have 10,0=
00 entries in the orphanage? */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1825  		return -EFSCORRUPTED;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1826  	}
2abf21a89e26520 Darrick J. Wong 2020-11-17  1827  	if (error !=3D -ENOENT)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1828  		return error;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1829  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1830  	trace_xrep_move_orphanag=
e(sc->ip, &xname, dp->i_ino);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1831  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1832  	/*
2abf21a89e26520 Darrick J. Wong 2020-11-17  1833  	 * Reserve enough space =
to add a directory entry to the orphanage and
2abf21a89e26520 Darrick J. Wong 2020-11-17  1834  	 * update the dotdot ent=
ry.
2abf21a89e26520 Darrick J. Wong 2020-11-17  1835  	 */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1836  	linkres =3D XFS_LINK_SPA=
CE_RES(mp, xname.len);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1837  	dotdotres =3D XFS_RENAME=
_SPACE_RES(mp, 2);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1838  	error =3D xfs_trans_rese=
rve_more(sc->tp, linkres + dotdotres, 0);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1839  	if (error)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1840  		return error;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1841  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1842  	xfs_lock_two_inodes(dp, =
XFS_ILOCK_EXCL, sc->ip, XFS_ILOCK_EXCL);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1843  	sc->ilock_flags |=3D XFS=
_ILOCK_EXCL;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1844  	sc->orphanage_ilock_flag=
s |=3D XFS_ILOCK_EXCL;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1845  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1846  	xfs_trans_ijoin(sc->tp, =
dp, 0);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1847  	xfs_trans_ijoin(sc->tp, =
sc->ip, 0);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1848  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1849  	/*
2abf21a89e26520 Darrick J. Wong 2020-11-17  1850  	 * Create the new name i=
n the orphanage, and bump the link count of
2abf21a89e26520 Darrick J. Wong 2020-11-17  1851  	 * the orphanage if we j=
ust added a directory.
2abf21a89e26520 Darrick J. Wong 2020-11-17  1852  	 */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1853  	error =3D xfs_dir_create=
name(sc->tp, dp, &xname, sc->ip->i_ino,
2abf21a89e26520 Darrick J. Wong 2020-11-17  1854  			linkres);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1855  	if (error)
2abf21a89e26520 Darrick J. Wong 2020-11-17  1856  		return error;
2abf21a89e26520 Darrick J. Wong 2020-11-17  1857  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1858  	xfs_trans_ichgtime(sc->t=
p, dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1859  	if (S_ISDIR(VFS_I(sc->ip=
)->i_mode))
2abf21a89e26520 Darrick J. Wong 2020-11-17  1860  		xfs_bumplink(sc->tp, dp=
);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1861  	xfs_trans_log_inode(sc->=
tp, dp, XFS_ILOG_CORE);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1862  =

2abf21a89e26520 Darrick J. Wong 2020-11-17  1863  	/* Replace the dotdot en=
try. */
2abf21a89e26520 Darrick J. Wong 2020-11-17  1864  	return xfs_dir_replace(s=
c->tp, sc->ip, &xfs_name_dotdot, dp->i_ino,
2abf21a89e26520 Darrick J. Wong 2020-11-17  1865  			dotdotres);
2abf21a89e26520 Darrick J. Wong 2020-11-17  1866  }
2abf21a89e26520 Darrick J. Wong 2020-11-17  1867  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8850295127322741131==--

