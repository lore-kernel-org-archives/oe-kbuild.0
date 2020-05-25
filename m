Content-Type: multipart/mixed; boundary="===============2318961266469936650=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [djwong-xfs:repair-metadata-atomically 126/229] fs/xfs/xfs_qm.c:1399:6: warning: The if condition is the same as the previous if condition [duplicateCondition]
Date: Mon, 25 May 2020 15:43:42 +0800
Message-ID: <202005251530.FSl7Qq7k%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2318961266469936650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t repair-metadata-atomically
head:   d334005df02786c9f288f2c7060603e9680946b5
commit: 9d81ac3b1eeab4e8fc2561d27fdff1f76f223b30 [126/229] xfs: implement l=
ive quotacheck as part of quota repair
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        git checkout 9d81ac3b1eeab4e8fc2561d27fdff1f76f223b30
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/xfs/xfs_qm.c:1399:6: warning: The if condition is the same as the pre=
vious if condition [duplicateCondition]
    if (error) {
        ^
   fs/xfs/xfs_qm.c:1389:6: note: First condition
    if (error)
        ^
   fs/xfs/xfs_qm.c:1399:6: note: Second condition
    if (error) {
        ^
   fs/xfs/xfs_buf.h:278:38: warning: Clarify calculation precedence for '&'=
 and '?'. [clarifyCalculation]
    bool wait =3D bp->b_flags & XBF_ASYNC ? false : true;
                                        ^
   fs/xfs/xfs_qm.c:933:34: warning: Clarify calculation precedence for '&' =
and '?'. [clarifyCalculation]
    type =3D flags & XFS_QMOPT_UQUOTA ? XFS_DQ_USER :
                                    ^
   fs/xfs/xfs_qm.c:934:29: warning: Clarify calculation precedence for '&' =
and '?'. [clarifyCalculation]
     (flags & XFS_QMOPT_PQUOTA ? XFS_DQ_PROJ : XFS_DQ_GROUP);
                               ^
   fs/xfs/xfs_qm.c:1623:6: warning: Either the condition 'qi!=3DNULL' is re=
dundant or there is possible null pointer dereference: qi. [nullPointerRedu=
ndantCheck]
    if (qi->qi_uquotaip) {
        ^
   fs/xfs/xfs_qm.c:736:2: note: Assuming that condition 'qi!=3DNULL' is not=
 redundant
    ASSERT(qi !=3D NULL);
    ^
   fs/xfs/xfs_qm.c:735:9: note: Assignment 'qi=3Dmp->m_quotainfo', assigned=
 value is 0
    qi =3D mp->m_quotainfo;
           ^
   fs/xfs/xfs_qm.c:740:27: note: Calling function 'xfs_qm_destroy_quotainos=
', 1st argument 'qi' value is 0
    xfs_qm_destroy_quotainos(qi);
                             ^
   fs/xfs/xfs_qm.c:1623:6: note: Null pointer dereference
    if (qi->qi_uquotaip) {
        ^
   fs/xfs/xfs_qm.c:1623:6: warning: Null pointer dereference: qi [ctunullpo=
inter]
    if (qi->qi_uquotaip) {
        ^
   fs/xfs/xfs_qm.c:736:2: note: Assuming that condition 'qi!=3DNULL' is not=
 redundant
   =

    ^
   fs/xfs/xfs_qm.c:735:9: note: Assignment 'qi=3Dmp->m_quotainfo', assigned=
 value is 0
   =

           ^
   fs/xfs/xfs_qm.c:740:26: note: Calling function xfs_qm_destroy_quotainos,=
 1st argument is null
    xfs_qm_destroy_quotainos(qi);
                            ^
   fs/xfs/xfs_qm.c:1623:6: note: Dereferencing argument qi that is null
    if (qi->qi_uquotaip) {
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3D9d81ac3b1eeab4e8fc2561d27fdff1f76f223b30
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git remote update djwong-xfs
git checkout 9d81ac3b1eeab4e8fc2561d27fdff1f76f223b30
vim +1399 fs/xfs/xfs_qm.c

9d81ac3b1eeab4 fs/xfs/xfs_qm.c       Darrick J. Wong     2020-02-19  1336  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1337  =
/*
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1338  =
 * Walk thru all the filesystem inodes and construct a consistent view
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1339  =
 * of the disk quota world. If the quotacheck fails, disable quotas.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1340  =
 */
eb866bbf095ec6 fs/xfs/xfs_qm.c       Jie Liu             2014-07-24  1341  =
STATIC int
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1342  =
xfs_qm_quotacheck(
9d81ac3b1eeab4 fs/xfs/xfs_qm.c       Darrick J. Wong     2020-02-19  1343  =
	struct xfs_mount	*mp)
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1344  {
9d81ac3b1eeab4 fs/xfs/xfs_qm.c       Darrick J. Wong     2020-02-19  1345  =
	int			error;
43ff2122e6492b fs/xfs/xfs_qm.c       Christoph Hellwig   2012-04-23  1346  =
	LIST_HEAD		(buffer_list);
9d81ac3b1eeab4 fs/xfs/xfs_qm.c       Darrick J. Wong     2020-02-19  1347  =
	uint			flags;
113a56835d938d fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-06-27  1348  =
	struct xfs_inode	*uip =3D mp->m_quotainfo->qi_uquotaip;
113a56835d938d fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-06-27  1349  =
	struct xfs_inode	*gip =3D mp->m_quotainfo->qi_gquotaip;
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1350  =
	struct xfs_inode	*pip =3D mp->m_quotainfo->qi_pquotaip;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1351  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1352  =
	flags =3D 0;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1353  =

92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1354  =
	ASSERT(uip || gip || pip);
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1355  =
	ASSERT(XFS_IS_QUOTA_RUNNING(mp));
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1356  =

0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1357  =
	xfs_notice(mp, "Quotacheck needed: Please wait.");
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1358  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1359  =
	/*
c8ad20ffeb592d fs/xfs/quota/xfs_qm.c Nathan Scott        2005-06-21  1360  =
	 * First we go thru all the dquots on disk, USR and GRP/PRJ, and reset
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1361  =
	 * their counters to zero. We need a clean slate.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1362  =
	 * We don't log our changes till later.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1363  =
	 */
8a7b8a89a3ae5b fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-04-20  1364  =
	if (uip) {
28b9060bd80851 fs/xfs/xfs_qm.c       Darrick J. Wong     2018-05-04  1365  =
		error =3D xfs_qm_reset_dqcounts_buf(mp, uip, XFS_QMOPT_UQUOTA,
43ff2122e6492b fs/xfs/xfs_qm.c       Christoph Hellwig   2012-04-23  1366  =
					 &buffer_list);
8a7b8a89a3ae5b fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-04-20  1367  =
		if (error)
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1368  =
			goto error_return;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1369  =
		flags |=3D XFS_UQUOTA_CHKD;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1370  =
	}
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1371  =

8a7b8a89a3ae5b fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-04-20  1372  =
	if (gip) {
28b9060bd80851 fs/xfs/xfs_qm.c       Darrick J. Wong     2018-05-04  1373  =
		error =3D xfs_qm_reset_dqcounts_buf(mp, gip, XFS_QMOPT_GQUOTA,
43ff2122e6492b fs/xfs/xfs_qm.c       Christoph Hellwig   2012-04-23  1374  =
					 &buffer_list);
8a7b8a89a3ae5b fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-04-20  1375  =
		if (error)
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1376  =
			goto error_return;
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1377  =
		flags |=3D XFS_GQUOTA_CHKD;
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1378  =
	}
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1379  =

92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1380  =
	if (pip) {
28b9060bd80851 fs/xfs/xfs_qm.c       Darrick J. Wong     2018-05-04  1381  =
		error =3D xfs_qm_reset_dqcounts_buf(mp, pip, XFS_QMOPT_PQUOTA,
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1382  =
					 &buffer_list);
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1383  =
		if (error)
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1384  =
			goto error_return;
92f8ff73f18672 fs/xfs/xfs_qm.c       Chandra Seetharaman 2013-07-11  1385  =
		flags |=3D XFS_PQUOTA_CHKD;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1386  =
	}
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1387  =

9d81ac3b1eeab4 fs/xfs/xfs_qm.c       Darrick J. Wong     2020-02-19  1388  =
	error =3D xfs_qm_quotacheck_walk_and_flush(mp, false, &buffer_list);
7dce11dbac54fc fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-06-23  1389  =
	if (error)
ebd126a651f83c fs/xfs/xfs_qm.c       Darrick J. Wong     2019-07-02  1390  =
		goto error_return;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1391  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1392  =
	/*
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1393  =
	 * We can get this error if we couldn't do a dquot allocation inside
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1394  =
	 * xfs_qm_dqusage_adjust (via bulkstat). We don't care about the
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1395  =
	 * dirty dquots that might be cached, we just want to get rid of them
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1396  =
	 * and turn quotaoff. The dquots won't be attached to any of the inodes
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1397  =
	 * at this point (because we intentionally didn't in dqget_noattach).
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1398  =
	 */
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16 @1399  =
	if (error) {
8112e9dc6d1494 fs/xfs/quota/xfs_qm.c Christoph Hellwig   2010-04-20  1400  =
		xfs_qm_dqpurge_all(mp, XFS_QMOPT_QUOTALL);
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1401  =
		goto error_return;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1402  =
	}
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1403  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1404  =
	/*
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1405  =
	 * If one type of quotas is off, then it will lose its
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1406  =
	 * quotachecked status, since we won't be doing accounting for
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1407  =
	 * that type anymore.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1408  =
	 */
4177af3a8a6f11 fs/xfs/xfs_qm.c       Chandra Seetharaman 2012-01-23  1409  =
	mp->m_qflags &=3D ~XFS_ALL_QUOTA_CHKD;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1410  =
	mp->m_qflags |=3D flags;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1411  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1412  =
 error_return:
20e8a063786050 fs/xfs/xfs_qm.c       Brian Foster        2017-04-21  1413  =
	xfs_buf_delwri_cancel(&buffer_list);
43ff2122e6492b fs/xfs/xfs_qm.c       Christoph Hellwig   2012-04-23  1414  =

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1415  =
	if (error) {
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1416  =
		xfs_warn(mp,
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1417  =
	"Quotacheck: Unsuccessful (Error %d): Disabling quotas.",
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1418  =
			error);
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1419  =
		/*
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1420  =
		 * We must turn off quotas.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1421  =
		 */
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1422  =
		ASSERT(mp->m_quotainfo !=3D NULL);
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1423  =
		xfs_qm_destroy_quotainfo(mp);
31d5577b35d839 fs/xfs/quota/xfs_qm.c David Chinner       2008-04-10  1424  =
		if (xfs_mount_reset_sbqflags(mp)) {
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1425  =
			xfs_warn(mp,
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1426  =
				"Quotacheck: Failed to reset quota flags.");
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1427  =
		}
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1428  =
	} else
0b932cccbdc09a fs/xfs/quota/xfs_qm.c Dave Chinner        2011-03-07  1429  =
		xfs_notice(mp, "Quotacheck: Done.");
d99831ff393ff2 fs/xfs/xfs_qm.c       Eric Sandeen        2014-06-22  1430  =
	return error;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1431  }
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds      2005-04-16  1432  =


:::::: The code at line 1399 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2318961266469936650==--

