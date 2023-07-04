Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161F863C1
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688486589; x=1720022589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ebUTqm3Z4arA6OU2+yfw2+SYoewM5hco563IhbTjY6Q=;
  b=BQHxVB2JYGEf3FHyPSqV5P1wZUofXrsvtY2rBl460jHiLlpYIfdXijD4
   me3ps/JiR8XtmV/v+H4lv336yFEJqvvW9yajsuNTI/1BSBSTbEphialV8
   oEFgR3/A6TFmPeSlZtkUWFtNFHcG3oVgkYBhZDDH3SFeF4centcFRO/Dd
   iy6zYLcjFzlCn5nlKW5NKGR+j5ACS2w4QLxnXb8l9xrI17oaR+XBZbm0w
   x285wwzyxdsxKRnOEWVOAJveghL3bmlkPVJ/ETwYW1UYs37euOXcQx4BP
   k2Vi7aJgejqGzmjxoYMVUX9QGzF5GeoIqJBRPaY0ojHybvuhysA0Swp3c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360629839"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360629839"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788897653"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788897653"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 09:02:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGiUU-000ILh-1U;
	Tue, 04 Jul 2023 16:02:58 +0000
Date: Wed, 5 Jul 2023 00:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:rename-child-lock-fixes 519/527]
 fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code
 'error'
Message-ID: <202307042349.dH77Mnja-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rename-child-lock-fixes
head:   c16a758618d7d97bbef9eb9c6cbbdf7cecee1fe3
commit: 31ac2efa11235657393e0c80de346d1deb3f41f0 [519/527] xfs: fallocate free space into a file
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307042349.dH77Mnja-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042349.dH77Mnja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307042349.dH77Mnja-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'
fs/xfs/xfs_bmap_util.c:1505 xfs_map_free_rt_extent() warn: missing error code 'error'

vim +/error +1359 fs/xfs/xfs_bmap_util.c

31ac2efa112356 Darrick J. Wong 2023-03-06  1327  
31ac2efa112356 Darrick J. Wong 2023-03-06  1328  /* Find a free extent in this AG and map it into the file. */
31ac2efa112356 Darrick J. Wong 2023-03-06  1329  STATIC int
31ac2efa112356 Darrick J. Wong 2023-03-06  1330  xfs_map_free_extent(
31ac2efa112356 Darrick J. Wong 2023-03-06  1331  	struct xfs_inode	*ip,
31ac2efa112356 Darrick J. Wong 2023-03-06  1332  	struct xfs_perag	*pag,
31ac2efa112356 Darrick J. Wong 2023-03-06  1333  	xfs_agblock_t		*cursor,
31ac2efa112356 Darrick J. Wong 2023-03-06  1334  	xfs_agblock_t		end_agbno,
31ac2efa112356 Darrick J. Wong 2023-03-06  1335  	xfs_agblock_t		*last_enospc_agbno)
31ac2efa112356 Darrick J. Wong 2023-03-06  1336  {
31ac2efa112356 Darrick J. Wong 2023-03-06  1337  	struct xfs_bmbt_irec	irec;
31ac2efa112356 Darrick J. Wong 2023-03-06  1338  	struct xfs_mount	*mp = ip->i_mount;
31ac2efa112356 Darrick J. Wong 2023-03-06  1339  	struct xfs_trans	*tp;
31ac2efa112356 Darrick J. Wong 2023-03-06  1340  	xfs_off_t		endpos;
31ac2efa112356 Darrick J. Wong 2023-03-06  1341  	xfs_fsblock_t		fsbno;
31ac2efa112356 Darrick J. Wong 2023-03-06  1342  	xfs_extlen_t		len;
31ac2efa112356 Darrick J. Wong 2023-03-06  1343  	int			error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1344  
31ac2efa112356 Darrick J. Wong 2023-03-06  1345  	if (fatal_signal_pending(current))
31ac2efa112356 Darrick J. Wong 2023-03-06  1346  		return -EINTR;
31ac2efa112356 Darrick J. Wong 2023-03-06  1347  
31ac2efa112356 Darrick J. Wong 2023-03-06  1348  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
31ac2efa112356 Darrick J. Wong 2023-03-06  1349  			&tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1350  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1351  		return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1352  
31ac2efa112356 Darrick J. Wong 2023-03-06  1353  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &len);
31ac2efa112356 Darrick J. Wong 2023-03-06  1354  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1355  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1356  
31ac2efa112356 Darrick J. Wong 2023-03-06  1357  	/* Bail out if the cursor is beyond what we asked for. */
31ac2efa112356 Darrick J. Wong 2023-03-06  1358  	if (*cursor >= end_agbno)
31ac2efa112356 Darrick J. Wong 2023-03-06 @1359  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1360  
31ac2efa112356 Darrick J. Wong 2023-03-06  1361  	error = xfs_map_free_reserve_more(tp, ip, &len);
31ac2efa112356 Darrick J. Wong 2023-03-06  1362  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1363  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1364  
31ac2efa112356 Darrick J. Wong 2023-03-06  1365  	fsbno = XFS_AGB_TO_FSB(mp, pag->pag_agno, *cursor);
31ac2efa112356 Darrick J. Wong 2023-03-06  1366  	do {
31ac2efa112356 Darrick J. Wong 2023-03-06  1367  		error = xfs_bmapi_freesp(tp, ip, fsbno, len, &irec);
31ac2efa112356 Darrick J. Wong 2023-03-06  1368  		if (error == -EAGAIN) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1369  			/* Failed to map space but were told to try again. */
31ac2efa112356 Darrick J. Wong 2023-03-06  1370  			error = xfs_trans_commit(tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1371  			goto out;
31ac2efa112356 Darrick J. Wong 2023-03-06  1372  		}
31ac2efa112356 Darrick J. Wong 2023-03-06  1373  		if (error != -ENOSPC)
31ac2efa112356 Darrick J. Wong 2023-03-06  1374  			break;
31ac2efa112356 Darrick J. Wong 2023-03-06  1375  		/*
31ac2efa112356 Darrick J. Wong 2023-03-06  1376  		 * If we can't get the space, try asking for successively less
31ac2efa112356 Darrick J. Wong 2023-03-06  1377  		 * space in case we're bumping up against per-AG metadata
31ac2efa112356 Darrick J. Wong 2023-03-06  1378  		 * reservation limits...
31ac2efa112356 Darrick J. Wong 2023-03-06  1379  		 */
31ac2efa112356 Darrick J. Wong 2023-03-06  1380  		len >>= 1;
31ac2efa112356 Darrick J. Wong 2023-03-06  1381  	} while (len > 0);
31ac2efa112356 Darrick J. Wong 2023-03-06  1382  	if (error == -ENOSPC && *last_enospc_agbno != *cursor) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1383  		/*
31ac2efa112356 Darrick J. Wong 2023-03-06  1384  		 * ...but even that might not work if an AGFL fixup allocated
31ac2efa112356 Darrick J. Wong 2023-03-06  1385  		 * the block at *cursor.  The first time this happens, remember
31ac2efa112356 Darrick J. Wong 2023-03-06  1386  		 * that we ran out of space here, and try again.
31ac2efa112356 Darrick J. Wong 2023-03-06  1387  		 */
31ac2efa112356 Darrick J. Wong 2023-03-06  1388  		*last_enospc_agbno = *cursor;
31ac2efa112356 Darrick J. Wong 2023-03-06  1389  		error = 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1390  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1391  	}
31ac2efa112356 Darrick J. Wong 2023-03-06  1392  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1393  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1394  
31ac2efa112356 Darrick J. Wong 2023-03-06  1395  	/* Update isize if needed. */
31ac2efa112356 Darrick J. Wong 2023-03-06  1396  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
31ac2efa112356 Darrick J. Wong 2023-03-06  1397  	if (endpos > i_size_read(VFS_I(ip))) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1398  		i_size_write(VFS_I(ip), endpos);
31ac2efa112356 Darrick J. Wong 2023-03-06  1399  		ip->i_disk_size = endpos;
31ac2efa112356 Darrick J. Wong 2023-03-06  1400  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
31ac2efa112356 Darrick J. Wong 2023-03-06  1401  	}
31ac2efa112356 Darrick J. Wong 2023-03-06  1402  
31ac2efa112356 Darrick J. Wong 2023-03-06  1403  	error = xfs_trans_commit(tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1404  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31ac2efa112356 Darrick J. Wong 2023-03-06  1405  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1406  		return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1407  
31ac2efa112356 Darrick J. Wong 2023-03-06  1408  	*cursor += irec.br_blockcount;
31ac2efa112356 Darrick J. Wong 2023-03-06  1409  	return 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1410  out_cancel:
31ac2efa112356 Darrick J. Wong 2023-03-06  1411  	xfs_trans_cancel(tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1412  out:
31ac2efa112356 Darrick J. Wong 2023-03-06  1413  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31ac2efa112356 Darrick J. Wong 2023-03-06  1414  	return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1415  }
31ac2efa112356 Darrick J. Wong 2023-03-06  1416  
31ac2efa112356 Darrick J. Wong 2023-03-06  1417  /*
31ac2efa112356 Darrick J. Wong 2023-03-06  1418   * Allocate all free physical space between off and len and map it to this
31ac2efa112356 Darrick J. Wong 2023-03-06  1419   * regular non-realtime file.
31ac2efa112356 Darrick J. Wong 2023-03-06  1420   */
31ac2efa112356 Darrick J. Wong 2023-03-06  1421  int
31ac2efa112356 Darrick J. Wong 2023-03-06  1422  xfs_map_free_space(
31ac2efa112356 Darrick J. Wong 2023-03-06  1423  	struct xfs_inode	*ip,
31ac2efa112356 Darrick J. Wong 2023-03-06  1424  	xfs_off_t		off,
31ac2efa112356 Darrick J. Wong 2023-03-06  1425  	xfs_off_t		len)
31ac2efa112356 Darrick J. Wong 2023-03-06  1426  {
31ac2efa112356 Darrick J. Wong 2023-03-06  1427  	struct xfs_mount	*mp = ip->i_mount;
31ac2efa112356 Darrick J. Wong 2023-03-06  1428  	struct xfs_perag	*pag = NULL;
31ac2efa112356 Darrick J. Wong 2023-03-06  1429  	xfs_daddr_t		off_daddr = BTOBB(off);
31ac2efa112356 Darrick J. Wong 2023-03-06  1430  	xfs_daddr_t		end_daddr = BTOBBT(off + len);
31ac2efa112356 Darrick J. Wong 2023-03-06  1431  	xfs_fsblock_t		off_fsb = XFS_DADDR_TO_FSB(mp, off_daddr);
31ac2efa112356 Darrick J. Wong 2023-03-06  1432  	xfs_fsblock_t		end_fsb = XFS_DADDR_TO_FSB(mp, end_daddr);
31ac2efa112356 Darrick J. Wong 2023-03-06  1433  	xfs_agnumber_t		off_agno = XFS_FSB_TO_AGNO(mp, off_fsb);
31ac2efa112356 Darrick J. Wong 2023-03-06  1434  	xfs_agnumber_t		end_agno = XFS_FSB_TO_AGNO(mp, end_fsb);
31ac2efa112356 Darrick J. Wong 2023-03-06  1435  	xfs_agnumber_t		agno;
31ac2efa112356 Darrick J. Wong 2023-03-06  1436  	int			error = 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1437  
31ac2efa112356 Darrick J. Wong 2023-03-06  1438  	trace_xfs_map_free_space(ip, off, len);
31ac2efa112356 Darrick J. Wong 2023-03-06  1439  
31ac2efa112356 Darrick J. Wong 2023-03-06  1440  	agno = off_agno;
31ac2efa112356 Darrick J. Wong 2023-03-06  1441  	for_each_perag_range(mp, agno, end_agno, pag) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1442  		xfs_agblock_t	off_agbno = 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1443  		xfs_agblock_t	end_agbno;
31ac2efa112356 Darrick J. Wong 2023-03-06  1444  		xfs_agblock_t	last_enospc_agbno = NULLAGBLOCK;
31ac2efa112356 Darrick J. Wong 2023-03-06  1445  
31ac2efa112356 Darrick J. Wong 2023-03-06  1446  		end_agbno = xfs_ag_block_count(mp, pag->pag_agno);
31ac2efa112356 Darrick J. Wong 2023-03-06  1447  
31ac2efa112356 Darrick J. Wong 2023-03-06  1448  		if (pag->pag_agno == off_agno)
31ac2efa112356 Darrick J. Wong 2023-03-06  1449  			off_agbno = XFS_FSB_TO_AGBNO(mp, off_fsb);
31ac2efa112356 Darrick J. Wong 2023-03-06  1450  		if (pag->pag_agno == end_agno)
31ac2efa112356 Darrick J. Wong 2023-03-06  1451  			end_agbno = XFS_FSB_TO_AGBNO(mp, end_fsb);
31ac2efa112356 Darrick J. Wong 2023-03-06  1452  
31ac2efa112356 Darrick J. Wong 2023-03-06  1453  		while (off_agbno < end_agbno) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1454  			error = xfs_map_free_extent(ip, pag, &off_agbno,
31ac2efa112356 Darrick J. Wong 2023-03-06  1455  					end_agbno, &last_enospc_agbno);
31ac2efa112356 Darrick J. Wong 2023-03-06  1456  			if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1457  				goto out;
31ac2efa112356 Darrick J. Wong 2023-03-06  1458  		}
31ac2efa112356 Darrick J. Wong 2023-03-06  1459  	}
31ac2efa112356 Darrick J. Wong 2023-03-06  1460  
31ac2efa112356 Darrick J. Wong 2023-03-06  1461  out:
31ac2efa112356 Darrick J. Wong 2023-03-06  1462  	if (pag)
31ac2efa112356 Darrick J. Wong 2023-03-06  1463  		xfs_perag_rele(pag);
31ac2efa112356 Darrick J. Wong 2023-03-06  1464  	if (error == -ENOSPC)
31ac2efa112356 Darrick J. Wong 2023-03-06  1465  		return 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1466  	return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1467  }
31ac2efa112356 Darrick J. Wong 2023-03-06  1468  
31ac2efa112356 Darrick J. Wong 2023-03-06  1469  #ifdef CONFIG_XFS_RT
31ac2efa112356 Darrick J. Wong 2023-03-06  1470  STATIC int
31ac2efa112356 Darrick J. Wong 2023-03-06  1471  xfs_map_free_rt_extent(
31ac2efa112356 Darrick J. Wong 2023-03-06  1472  	struct xfs_inode	*ip,
31ac2efa112356 Darrick J. Wong 2023-03-06  1473  	xfs_rtxnum_t		*cursor,
31ac2efa112356 Darrick J. Wong 2023-03-06  1474  	xfs_rtxnum_t		end_rtx)
31ac2efa112356 Darrick J. Wong 2023-03-06  1475  {
31ac2efa112356 Darrick J. Wong 2023-03-06  1476  	struct xfs_bmbt_irec	irec;
31ac2efa112356 Darrick J. Wong 2023-03-06  1477  	struct xfs_mount	*mp = ip->i_mount;
31ac2efa112356 Darrick J. Wong 2023-03-06  1478  	struct xfs_trans	*tp;
31ac2efa112356 Darrick J. Wong 2023-03-06  1479  	xfs_off_t		endpos;
31ac2efa112356 Darrick J. Wong 2023-03-06  1480  	xfs_rtblock_t		rtbno;
31ac2efa112356 Darrick J. Wong 2023-03-06  1481  	xfs_rtxnum_t		add;
31ac2efa112356 Darrick J. Wong 2023-03-06  1482  	xfs_rtxlen_t		len_rtx;
31ac2efa112356 Darrick J. Wong 2023-03-06  1483  	xfs_extlen_t		len;
31ac2efa112356 Darrick J. Wong 2023-03-06  1484  	uint32_t		mod;
31ac2efa112356 Darrick J. Wong 2023-03-06  1485  	int			error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1486  
31ac2efa112356 Darrick J. Wong 2023-03-06  1487  	if (fatal_signal_pending(current))
31ac2efa112356 Darrick J. Wong 2023-03-06  1488  		return -EINTR;
31ac2efa112356 Darrick J. Wong 2023-03-06  1489  
31ac2efa112356 Darrick J. Wong 2023-03-06  1490  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
31ac2efa112356 Darrick J. Wong 2023-03-06  1491  			&tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1492  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1493  		return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1494  
31ac2efa112356 Darrick J. Wong 2023-03-06  1495  	xfs_rtbitmap_lock(tp, mp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1496  	error = xfs_rtalloc_find_freesp(tp, cursor, end_rtx, &len_rtx);
31ac2efa112356 Darrick J. Wong 2023-03-06  1497  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1498  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1499  
31ac2efa112356 Darrick J. Wong 2023-03-06  1500  	/*
31ac2efa112356 Darrick J. Wong 2023-03-06  1501  	 * If off_rtx is beyond the end of the rt device or is past what the
31ac2efa112356 Darrick J. Wong 2023-03-06  1502  	 * user asked for, bail out.
31ac2efa112356 Darrick J. Wong 2023-03-06  1503  	 */
31ac2efa112356 Darrick J. Wong 2023-03-06  1504  	if (*cursor >= end_rtx)
31ac2efa112356 Darrick J. Wong 2023-03-06 @1505  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1506  
31ac2efa112356 Darrick J. Wong 2023-03-06  1507  	len = xfs_rtx_to_rtb(mp, len_rtx);
31ac2efa112356 Darrick J. Wong 2023-03-06  1508  	error = xfs_map_free_reserve_more(tp, ip, &len);
31ac2efa112356 Darrick J. Wong 2023-03-06  1509  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1510  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1511  
31ac2efa112356 Darrick J. Wong 2023-03-06  1512  	rtbno = xfs_rtx_to_rtb(mp, *cursor);
31ac2efa112356 Darrick J. Wong 2023-03-06  1513  	error = xfs_bmapi_freesp(tp, ip, rtbno, len, &irec);
31ac2efa112356 Darrick J. Wong 2023-03-06  1514  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1515  		goto out_cancel;
31ac2efa112356 Darrick J. Wong 2023-03-06  1516  
31ac2efa112356 Darrick J. Wong 2023-03-06  1517  	/* Update isize if needed. */
31ac2efa112356 Darrick J. Wong 2023-03-06  1518  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
31ac2efa112356 Darrick J. Wong 2023-03-06  1519  	if (endpos > i_size_read(VFS_I(ip))) {
31ac2efa112356 Darrick J. Wong 2023-03-06  1520  		i_size_write(VFS_I(ip), endpos);
31ac2efa112356 Darrick J. Wong 2023-03-06  1521  		ip->i_disk_size = endpos;
31ac2efa112356 Darrick J. Wong 2023-03-06  1522  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
31ac2efa112356 Darrick J. Wong 2023-03-06  1523  	}
31ac2efa112356 Darrick J. Wong 2023-03-06  1524  
31ac2efa112356 Darrick J. Wong 2023-03-06  1525  	error = xfs_trans_commit(tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1526  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31ac2efa112356 Darrick J. Wong 2023-03-06  1527  	if (error)
31ac2efa112356 Darrick J. Wong 2023-03-06  1528  		return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1529  
31ac2efa112356 Darrick J. Wong 2023-03-06  1530  	add = xfs_rtb_to_rtx(mp, irec.br_blockcount, &mod);
31ac2efa112356 Darrick J. Wong 2023-03-06  1531  	if (mod)
31ac2efa112356 Darrick J. Wong 2023-03-06  1532  		return -EFSCORRUPTED;
31ac2efa112356 Darrick J. Wong 2023-03-06  1533  
31ac2efa112356 Darrick J. Wong 2023-03-06  1534  	*cursor += add;
31ac2efa112356 Darrick J. Wong 2023-03-06  1535  	return 0;
31ac2efa112356 Darrick J. Wong 2023-03-06  1536  out_cancel:
31ac2efa112356 Darrick J. Wong 2023-03-06  1537  	xfs_trans_cancel(tp);
31ac2efa112356 Darrick J. Wong 2023-03-06  1538  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31ac2efa112356 Darrick J. Wong 2023-03-06  1539  	return error;
31ac2efa112356 Darrick J. Wong 2023-03-06  1540  }
31ac2efa112356 Darrick J. Wong 2023-03-06  1541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
