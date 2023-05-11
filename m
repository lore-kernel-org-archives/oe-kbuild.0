Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E063F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 03:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683775975; x=1715311975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrLa7ktnMeMv7j134oVmn3/XI1RDVaSz7p21Csql7qM=;
  b=iOc40BVgGpXOP077k0J0q7Ag5/Q6WIMKEqBUJGLxdDEVfSAHvkyd7IfG
   DXfVBkOlRPEcjDs3ai6WKKP48F6ELS6sOF75i+Uef3Z6bXZ8vhNN5MUJs
   vLwWVT17ioP0E5zlDuplRElZYIaCO1kSNpzbug9TZrp1za0c4o46rnmYs
   Jm10lsFar22SarhJeb3UaXvZvfyo1/ETxhY5ISURt5Su+yvAu2BwFsbU2
   E+SLTM7aAIaULsRQu6J7TWdmPHK24nNQC9i6qMSt2eQvpgWWlpSyWp5sY
   d4JC6jRRc1SDy+jk4Cu+EGwN/FdJJ4242TWSOgPVkkTzRc6JSEtKg0fuL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334857491"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="334857491"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 20:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823802206"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="823802206"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2023 20:32:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwx2x-0003kO-2u;
	Thu, 11 May 2023 03:32:51 +0000
Date: Thu, 11 May 2023 11:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:djwong-wtf 550/551] fs/xfs/xfs_bmap_util.c:1359
 xfs_map_free_extent() warn: missing error code 'error'
Message-ID: <202305111129.2jubbUkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   75566dbd7f7fd612d267138945ab62d3909df62f
commit: 73bc6f853c0f4d9c98df25d1700225b6eb30ef00 [550/551] xfs: fallocate free space into a file
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111129.2jubbUkO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305111129.2jubbUkO-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'
fs/xfs/xfs_bmap_util.c:1505 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:450 xfs_buftarg_zeroout() warn: bitwise AND condition is false here

vim +/error +1359 fs/xfs/xfs_bmap_util.c

73bc6f853c0f4d Darrick J. Wong 2023-03-06  1327  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1328  /* Find a free extent in this AG and map it into the file. */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1329  STATIC int
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1330  xfs_map_free_extent(
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1331  	struct xfs_inode	*ip,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1332  	struct xfs_perag	*pag,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1333  	xfs_agblock_t		*cursor,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1334  	xfs_agblock_t		end_agbno,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1335  	xfs_agblock_t		*last_enospc_agbno)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1336  {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1337  	struct xfs_bmbt_irec	irec;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1338  	struct xfs_mount	*mp = ip->i_mount;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1339  	struct xfs_trans	*tp;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1340  	xfs_off_t		endpos;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1341  	xfs_fsblock_t		fsbno;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1342  	xfs_extlen_t		len;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1343  	int			error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1344  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1345  	if (fatal_signal_pending(current))
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1346  		return -EINTR;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1347  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1348  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1349  			&tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1350  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1351  		return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1352  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1353  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &len);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1354  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1355  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1356  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1357  	/* Bail out if the cursor is beyond what we asked for. */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1358  	if (*cursor >= end_agbno)
73bc6f853c0f4d Darrick J. Wong 2023-03-06 @1359  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1360  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1361  	error = xfs_map_free_reserve_more(tp, ip, &len);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1362  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1363  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1364  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1365  	fsbno = XFS_AGB_TO_FSB(mp, pag->pag_agno, *cursor);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1366  	do {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1367  		error = xfs_bmapi_freesp(tp, ip, fsbno, len, &irec);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1368  		if (error == -EAGAIN) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1369  			/* Failed to map space but were told to try again. */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1370  			error = xfs_trans_commit(tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1371  			goto out;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1372  		}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1373  		if (error != -ENOSPC)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1374  			break;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1375  		/*
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1376  		 * If we can't get the space, try asking for successively less
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1377  		 * space in case we're bumping up against per-AG metadata
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1378  		 * reservation limits...
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1379  		 */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1380  		len >>= 1;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1381  	} while (len > 0);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1382  	if (error == -ENOSPC && *last_enospc_agbno != *cursor) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1383  		/*
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1384  		 * ...but even that might not work if an AGFL fixup allocated
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1385  		 * the block at *cursor.  The first time this happens, remember
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1386  		 * that we ran out of space here, and try again.
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1387  		 */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1388  		*last_enospc_agbno = *cursor;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1389  		error = 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1390  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1391  	}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1392  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1393  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1394  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1395  	/* Update isize if needed. */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1396  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1397  	if (endpos > i_size_read(VFS_I(ip))) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1398  		i_size_write(VFS_I(ip), endpos);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1399  		ip->i_disk_size = endpos;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1400  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1401  	}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1402  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1403  	error = xfs_trans_commit(tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1404  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1405  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1406  		return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1407  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1408  	*cursor += irec.br_blockcount;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1409  	return 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1410  out_cancel:
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1411  	xfs_trans_cancel(tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1412  out:
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1413  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1414  	return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1415  }
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1416  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1417  /*
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1418   * Allocate all free physical space between off and len and map it to this
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1419   * regular non-realtime file.
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1420   */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1421  int
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1422  xfs_map_free_space(
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1423  	struct xfs_inode	*ip,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1424  	xfs_off_t		off,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1425  	xfs_off_t		len)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1426  {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1427  	struct xfs_mount	*mp = ip->i_mount;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1428  	struct xfs_perag	*pag = NULL;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1429  	xfs_daddr_t		off_daddr = BTOBB(off);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1430  	xfs_daddr_t		end_daddr = BTOBBT(off + len);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1431  	xfs_fsblock_t		off_fsb = XFS_DADDR_TO_FSB(mp, off_daddr);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1432  	xfs_fsblock_t		end_fsb = XFS_DADDR_TO_FSB(mp, end_daddr);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1433  	xfs_agnumber_t		off_agno = XFS_FSB_TO_AGNO(mp, off_fsb);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1434  	xfs_agnumber_t		end_agno = XFS_FSB_TO_AGNO(mp, end_fsb);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1435  	xfs_agnumber_t		agno;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1436  	int			error = 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1437  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1438  	trace_xfs_map_free_space(ip, off, len);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1439  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1440  	agno = off_agno;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1441  	for_each_perag_range(mp, agno, end_agno, pag) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1442  		xfs_agblock_t	off_agbno = 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1443  		xfs_agblock_t	end_agbno;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1444  		xfs_agblock_t	last_enospc_agbno = NULLAGBLOCK;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1445  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1446  		end_agbno = xfs_ag_block_count(mp, pag->pag_agno);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1447  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1448  		if (pag->pag_agno == off_agno)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1449  			off_agbno = XFS_FSB_TO_AGBNO(mp, off_fsb);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1450  		if (pag->pag_agno == end_agno)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1451  			end_agbno = XFS_FSB_TO_AGBNO(mp, end_fsb);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1452  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1453  		while (off_agbno < end_agbno) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1454  			error = xfs_map_free_extent(ip, pag, &off_agbno,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1455  					end_agbno, &last_enospc_agbno);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1456  			if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1457  				goto out;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1458  		}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1459  	}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1460  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1461  out:
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1462  	if (pag)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1463  		xfs_perag_rele(pag);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1464  	if (error == -ENOSPC)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1465  		return 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1466  	return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1467  }
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1468  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1469  #ifdef CONFIG_XFS_RT
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1470  STATIC int
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1471  xfs_map_free_rt_extent(
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1472  	struct xfs_inode	*ip,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1473  	xfs_rtxnum_t		*cursor,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1474  	xfs_rtxnum_t		end_rtx)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1475  {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1476  	struct xfs_bmbt_irec	irec;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1477  	struct xfs_mount	*mp = ip->i_mount;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1478  	struct xfs_trans	*tp;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1479  	xfs_off_t		endpos;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1480  	xfs_rtblock_t		rtbno;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1481  	xfs_rtxnum_t		add;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1482  	xfs_rtxlen_t		len_rtx;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1483  	xfs_extlen_t		len;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1484  	uint32_t		mod;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1485  	int			error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1486  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1487  	if (fatal_signal_pending(current))
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1488  		return -EINTR;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1489  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1490  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1491  			&tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1492  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1493  		return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1494  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1495  	xfs_rtbitmap_lock(tp, mp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1496  	error = xfs_rtalloc_find_freesp(tp, cursor, end_rtx, &len_rtx);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1497  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1498  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1499  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1500  	/*
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1501  	 * If off_rtx is beyond the end of the rt device or is past what the
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1502  	 * user asked for, bail out.
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1503  	 */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1504  	if (*cursor >= end_rtx)
73bc6f853c0f4d Darrick J. Wong 2023-03-06 @1505  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1506  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1507  	len = xfs_rtx_to_rtb(mp, len_rtx);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1508  	error = xfs_map_free_reserve_more(tp, ip, &len);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1509  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1510  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1511  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1512  	rtbno = xfs_rtx_to_rtb(mp, *cursor);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1513  	error = xfs_bmapi_freesp(tp, ip, rtbno, len, &irec);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1514  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1515  		goto out_cancel;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1516  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1517  	/* Update isize if needed. */
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1518  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1519  	if (endpos > i_size_read(VFS_I(ip))) {
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1520  		i_size_write(VFS_I(ip), endpos);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1521  		ip->i_disk_size = endpos;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1522  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1523  	}
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1524  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1525  	error = xfs_trans_commit(tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1526  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1527  	if (error)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1528  		return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1529  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1530  	add = xfs_rtb_to_rtx(mp, irec.br_blockcount, &mod);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1531  	if (mod)
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1532  		return -EFSCORRUPTED;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1533  
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1534  	*cursor += add;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1535  	return 0;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1536  out_cancel:
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1537  	xfs_trans_cancel(tp);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1538  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1539  	return error;
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1540  }
73bc6f853c0f4d Darrick J. Wong 2023-03-06  1541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
