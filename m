Content-Type: multipart/mixed; boundary="===============6434534062965016936=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:djwong-wtf 349/351] fs/xfs/xfs_bmap_util.c:1372 xfs_map_free_extent() warn: missing error code 'error'
Date: Sat, 19 Mar 2022 08:44:09 +0800
Message-ID: <202203190831.AYu7l0vX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6434534062965016936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t djwong-wtf
head:   baa8d54bb35559f0bc36ec9e9933bec9ab23e25f
commit: b82670045aab66d3d66eca40f277354c3da07f1c [349/351] xfs: fallocate f=
ree space into a file
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: openrisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/=
archive/20220319/202203190831.AYu7l0vX-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1372 xfs_map_free_extent() warn: missing error code =
'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:430 xfs_buftarg_zeroout() warn: bitwise AND condition is f=
alse here

vim +/error +1372 fs/xfs/xfs_bmap_util.c

b82670045aab66 Darrick J. Wong 2022-01-06  1340  =

b82670045aab66 Darrick J. Wong 2022-01-06  1341  /* Find a free extent in t=
his AG and map it into the file. */
b82670045aab66 Darrick J. Wong 2022-01-06  1342  STATIC int
b82670045aab66 Darrick J. Wong 2022-01-06  1343  xfs_map_free_extent(
b82670045aab66 Darrick J. Wong 2022-01-06  1344  	struct xfs_inode	*ip,
b82670045aab66 Darrick J. Wong 2022-01-06  1345  	struct xfs_perag	*pag,
b82670045aab66 Darrick J. Wong 2022-01-06  1346  	xfs_agblock_t		*cursor,
b82670045aab66 Darrick J. Wong 2022-01-06  1347  	xfs_agblock_t		end_agbno,
b82670045aab66 Darrick J. Wong 2022-01-06  1348  	xfs_agblock_t		*last_enos=
pc_agbno)
b82670045aab66 Darrick J. Wong 2022-01-06  1349  {
b82670045aab66 Darrick J. Wong 2022-01-06  1350  	struct xfs_bmbt_irec	irec;
b82670045aab66 Darrick J. Wong 2022-01-06  1351  	struct xfs_mount	*mp =3D =
ip->i_mount;
b82670045aab66 Darrick J. Wong 2022-01-06  1352  	struct xfs_trans	*tp;
b82670045aab66 Darrick J. Wong 2022-01-06  1353  	xfs_off_t		endpos;
b82670045aab66 Darrick J. Wong 2022-01-06  1354  	xfs_fsblock_t		fsbno;
b82670045aab66 Darrick J. Wong 2022-01-06  1355  	xfs_extlen_t		len;
b82670045aab66 Darrick J. Wong 2022-01-06  1356  	int			error;
b82670045aab66 Darrick J. Wong 2022-01-06  1357  =

b82670045aab66 Darrick J. Wong 2022-01-06  1358  	if (fatal_signal_pending(=
current))
b82670045aab66 Darrick J. Wong 2022-01-06  1359  		return -EINTR;
b82670045aab66 Darrick J. Wong 2022-01-06  1360  =

b82670045aab66 Darrick J. Wong 2022-01-06  1361  	error =3D xfs_trans_alloc=
_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
b82670045aab66 Darrick J. Wong 2022-01-06  1362  			&tp);
b82670045aab66 Darrick J. Wong 2022-01-06  1363  	if (error)
b82670045aab66 Darrick J. Wong 2022-01-06  1364  		return error;
b82670045aab66 Darrick J. Wong 2022-01-06  1365  =

b82670045aab66 Darrick J. Wong 2022-01-06  1366  	error =3D xfs_alloc_find_=
freesp(tp, pag, cursor, end_agbno, &len);
b82670045aab66 Darrick J. Wong 2022-01-06  1367  	if (error)
b82670045aab66 Darrick J. Wong 2022-01-06  1368  		goto out_cancel;
b82670045aab66 Darrick J. Wong 2022-01-06  1369  =

b82670045aab66 Darrick J. Wong 2022-01-06  1370  	/* Bail out if the cursor=
 is beyond what we asked for. */
b82670045aab66 Darrick J. Wong 2022-01-06  1371  	if (*cursor >=3D end_agbn=
o)
b82670045aab66 Darrick J. Wong 2022-01-06 @1372  		goto out_cancel;
b82670045aab66 Darrick J. Wong 2022-01-06  1373  =

b82670045aab66 Darrick J. Wong 2022-01-06  1374  	error =3D xfs_map_free_re=
serve_more(tp, ip, &len);
b82670045aab66 Darrick J. Wong 2022-01-06  1375  	if (error)
b82670045aab66 Darrick J. Wong 2022-01-06  1376  		goto out_cancel;
b82670045aab66 Darrick J. Wong 2022-01-06  1377  =

b82670045aab66 Darrick J. Wong 2022-01-06  1378  	fsbno =3D XFS_AGB_TO_FSB(=
mp, pag->pag_agno, *cursor);
b82670045aab66 Darrick J. Wong 2022-01-06  1379  	do {
b82670045aab66 Darrick J. Wong 2022-01-06  1380  		error =3D xfs_bmapi_free=
sp(tp, ip, fsbno, len, &irec);
b82670045aab66 Darrick J. Wong 2022-01-06  1381  		if (error =3D=3D -EAGAIN=
) {
b82670045aab66 Darrick J. Wong 2022-01-06  1382  			/* Failed to map space =
but were told to try again. */
b82670045aab66 Darrick J. Wong 2022-01-06  1383  			error =3D xfs_trans_com=
mit(tp);
b82670045aab66 Darrick J. Wong 2022-01-06  1384  			goto out;
b82670045aab66 Darrick J. Wong 2022-01-06  1385  		}
b82670045aab66 Darrick J. Wong 2022-01-06  1386  		if (error !=3D -ENOSPC)
b82670045aab66 Darrick J. Wong 2022-01-06  1387  			break;
b82670045aab66 Darrick J. Wong 2022-01-06  1388  		/*
b82670045aab66 Darrick J. Wong 2022-01-06  1389  		 * If we can't get the s=
pace, try asking for successively less
b82670045aab66 Darrick J. Wong 2022-01-06  1390  		 * space in case we're b=
umping up against per-AG metadata
b82670045aab66 Darrick J. Wong 2022-01-06  1391  		 * reservation limits...
b82670045aab66 Darrick J. Wong 2022-01-06  1392  		 */
b82670045aab66 Darrick J. Wong 2022-01-06  1393  		len >>=3D 1;
b82670045aab66 Darrick J. Wong 2022-01-06  1394  	} while (len > 0);
b82670045aab66 Darrick J. Wong 2022-01-06  1395  	if (error =3D=3D -ENOSPC =
&& *last_enospc_agbno !=3D *cursor) {
b82670045aab66 Darrick J. Wong 2022-01-06  1396  		/*
b82670045aab66 Darrick J. Wong 2022-01-06  1397  		 * ...but even that migh=
t not work if an AGFL fixup allocated
b82670045aab66 Darrick J. Wong 2022-01-06  1398  		 * the block at *cursor.=
  The first time this happens, remember
b82670045aab66 Darrick J. Wong 2022-01-06  1399  		 * that we ran out of sp=
ace here, and try again.
b82670045aab66 Darrick J. Wong 2022-01-06  1400  		 */
b82670045aab66 Darrick J. Wong 2022-01-06  1401  		*last_enospc_agbno =3D *=
cursor;
b82670045aab66 Darrick J. Wong 2022-01-06  1402  		error =3D 0;
b82670045aab66 Darrick J. Wong 2022-01-06  1403  		goto out_cancel;
b82670045aab66 Darrick J. Wong 2022-01-06  1404  	}
b82670045aab66 Darrick J. Wong 2022-01-06  1405  	if (error)
b82670045aab66 Darrick J. Wong 2022-01-06  1406  		goto out_cancel;
b82670045aab66 Darrick J. Wong 2022-01-06  1407  =

b82670045aab66 Darrick J. Wong 2022-01-06  1408  	/* Update isize if needed=
. */
b82670045aab66 Darrick J. Wong 2022-01-06  1409  	endpos =3D XFS_FSB_TO_B(m=
p, irec.br_startoff + irec.br_blockcount);
b82670045aab66 Darrick J. Wong 2022-01-06  1410  	if (endpos > i_size_read(=
VFS_I(ip))) {
b82670045aab66 Darrick J. Wong 2022-01-06  1411  		i_size_write(VFS_I(ip), =
endpos);
b82670045aab66 Darrick J. Wong 2022-01-06  1412  		ip->i_disk_size =3D endp=
os;
b82670045aab66 Darrick J. Wong 2022-01-06  1413  		xfs_trans_log_inode(tp, =
ip, XFS_ILOG_CORE);
b82670045aab66 Darrick J. Wong 2022-01-06  1414  	}
b82670045aab66 Darrick J. Wong 2022-01-06  1415  =

b82670045aab66 Darrick J. Wong 2022-01-06  1416  	error =3D xfs_trans_commi=
t(tp);
b82670045aab66 Darrick J. Wong 2022-01-06  1417  	xfs_iunlock(ip, XFS_ILOCK=
_EXCL);
b82670045aab66 Darrick J. Wong 2022-01-06  1418  	if (error)
b82670045aab66 Darrick J. Wong 2022-01-06  1419  		return error;
b82670045aab66 Darrick J. Wong 2022-01-06  1420  =

b82670045aab66 Darrick J. Wong 2022-01-06  1421  	*cursor +=3D irec.br_bloc=
kcount;
b82670045aab66 Darrick J. Wong 2022-01-06  1422  	return 0;
b82670045aab66 Darrick J. Wong 2022-01-06  1423  out_cancel:
b82670045aab66 Darrick J. Wong 2022-01-06  1424  	xfs_trans_cancel(tp);
b82670045aab66 Darrick J. Wong 2022-01-06  1425  out:
b82670045aab66 Darrick J. Wong 2022-01-06  1426  	xfs_iunlock(ip, XFS_ILOCK=
_EXCL);
b82670045aab66 Darrick J. Wong 2022-01-06  1427  	return error;
b82670045aab66 Darrick J. Wong 2022-01-06  1428  }
b82670045aab66 Darrick J. Wong 2022-01-06  1429  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6434534062965016936==--

