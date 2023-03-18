Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57263B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 03:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679110352; x=1710646352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRF3uFGCxvaBVEQUg9DZm2ewcXQfWdOoz32Js/uMX7s=;
  b=hAsrr3HDR2cBlV0GXGCF+JFPZBMNYs23wFZpbTYiT+G8MkJP9F9Nebim
   f2tFvqssXy5jhTxeaAtdUxUDKQMrBxRch3xd4doJ6uqLgIcr6Ppe1Tt2E
   RBky1fLWYERo84bwHnOFeHmctOin4Q9ICCFWCHfHB5FyAZwdwfB/0ZEK1
   DsF1v9nNYvQv3QiU7FTmdul6rpy9wRI1hGYb5g2XUkxoWvdkTjXrAVTtH
   VwHdlbK3IhewppcjIVMV22J4GLmYuNjXD5WuGWO4chefQ05Ks9X+GA4DH
   c9Zg5HC72jXPiIPMwzoPSJqeZcX9kingqw7ZXI4KUiJYyrnlI6BQCG9b3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337109121"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337109121"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 20:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673784701"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="673784701"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 20:32:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdNJ0-0009ly-0F;
	Sat, 18 Mar 2023 03:32:30 +0000
Date: Sat, 18 Mar 2023 11:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:djwong-wtf 507/508] fs/xfs/xfs_bmap_util.c:1359
 xfs_map_free_extent() warn: missing error code 'error'
Message-ID: <202303181154.TIQzFk7R-lkp@intel.com>
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
head:   41909af7f21d1455bbc2842b9f104d9cccdb872f
commit: 77b9587945b6a594ccfc85a26f9cf17ebb94f295 [507/508] xfs: fallocate free space into a file
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230318/202303181154.TIQzFk7R-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303181154.TIQzFk7R-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:449 xfs_buftarg_zeroout() warn: bitwise AND condition is false here

vim +/error +1359 fs/xfs/xfs_bmap_util.c

77b9587945b6a5 Darrick J. Wong 2023-03-06  1327  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1328  /* Find a free extent in this AG and map it into the file. */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1329  STATIC int
77b9587945b6a5 Darrick J. Wong 2023-03-06  1330  xfs_map_free_extent(
77b9587945b6a5 Darrick J. Wong 2023-03-06  1331  	struct xfs_inode	*ip,
77b9587945b6a5 Darrick J. Wong 2023-03-06  1332  	struct xfs_perag	*pag,
77b9587945b6a5 Darrick J. Wong 2023-03-06  1333  	xfs_agblock_t		*cursor,
77b9587945b6a5 Darrick J. Wong 2023-03-06  1334  	xfs_agblock_t		end_agbno,
77b9587945b6a5 Darrick J. Wong 2023-03-06  1335  	xfs_agblock_t		*last_enospc_agbno)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1336  {
77b9587945b6a5 Darrick J. Wong 2023-03-06  1337  	struct xfs_bmbt_irec	irec;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1338  	struct xfs_mount	*mp = ip->i_mount;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1339  	struct xfs_trans	*tp;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1340  	xfs_off_t		endpos;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1341  	xfs_fsblock_t		fsbno;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1342  	xfs_extlen_t		len;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1343  	int			error;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1344  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1345  	if (fatal_signal_pending(current))
77b9587945b6a5 Darrick J. Wong 2023-03-06  1346  		return -EINTR;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1347  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1348  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
77b9587945b6a5 Darrick J. Wong 2023-03-06  1349  			&tp);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1350  	if (error)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1351  		return error;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1352  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1353  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &len);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1354  	if (error)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1355  		goto out_cancel;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1356  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1357  	/* Bail out if the cursor is beyond what we asked for. */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1358  	if (*cursor >= end_agbno)
77b9587945b6a5 Darrick J. Wong 2023-03-06 @1359  		goto out_cancel;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1360  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1361  	error = xfs_map_free_reserve_more(tp, ip, &len);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1362  	if (error)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1363  		goto out_cancel;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1364  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1365  	fsbno = XFS_AGB_TO_FSB(mp, pag->pag_agno, *cursor);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1366  	do {
77b9587945b6a5 Darrick J. Wong 2023-03-06  1367  		error = xfs_bmapi_freesp(tp, ip, fsbno, len, &irec);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1368  		if (error == -EAGAIN) {
77b9587945b6a5 Darrick J. Wong 2023-03-06  1369  			/* Failed to map space but were told to try again. */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1370  			error = xfs_trans_commit(tp);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1371  			goto out;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1372  		}
77b9587945b6a5 Darrick J. Wong 2023-03-06  1373  		if (error != -ENOSPC)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1374  			break;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1375  		/*
77b9587945b6a5 Darrick J. Wong 2023-03-06  1376  		 * If we can't get the space, try asking for successively less
77b9587945b6a5 Darrick J. Wong 2023-03-06  1377  		 * space in case we're bumping up against per-AG metadata
77b9587945b6a5 Darrick J. Wong 2023-03-06  1378  		 * reservation limits...
77b9587945b6a5 Darrick J. Wong 2023-03-06  1379  		 */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1380  		len >>= 1;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1381  	} while (len > 0);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1382  	if (error == -ENOSPC && *last_enospc_agbno != *cursor) {
77b9587945b6a5 Darrick J. Wong 2023-03-06  1383  		/*
77b9587945b6a5 Darrick J. Wong 2023-03-06  1384  		 * ...but even that might not work if an AGFL fixup allocated
77b9587945b6a5 Darrick J. Wong 2023-03-06  1385  		 * the block at *cursor.  The first time this happens, remember
77b9587945b6a5 Darrick J. Wong 2023-03-06  1386  		 * that we ran out of space here, and try again.
77b9587945b6a5 Darrick J. Wong 2023-03-06  1387  		 */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1388  		*last_enospc_agbno = *cursor;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1389  		error = 0;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1390  		goto out_cancel;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1391  	}
77b9587945b6a5 Darrick J. Wong 2023-03-06  1392  	if (error)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1393  		goto out_cancel;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1394  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1395  	/* Update isize if needed. */
77b9587945b6a5 Darrick J. Wong 2023-03-06  1396  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1397  	if (endpos > i_size_read(VFS_I(ip))) {
77b9587945b6a5 Darrick J. Wong 2023-03-06  1398  		i_size_write(VFS_I(ip), endpos);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1399  		ip->i_disk_size = endpos;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1400  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1401  	}
77b9587945b6a5 Darrick J. Wong 2023-03-06  1402  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1403  	error = xfs_trans_commit(tp);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1404  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1405  	if (error)
77b9587945b6a5 Darrick J. Wong 2023-03-06  1406  		return error;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1407  
77b9587945b6a5 Darrick J. Wong 2023-03-06  1408  	*cursor += irec.br_blockcount;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1409  	return 0;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1410  out_cancel:
77b9587945b6a5 Darrick J. Wong 2023-03-06  1411  	xfs_trans_cancel(tp);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1412  out:
77b9587945b6a5 Darrick J. Wong 2023-03-06  1413  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
77b9587945b6a5 Darrick J. Wong 2023-03-06  1414  	return error;
77b9587945b6a5 Darrick J. Wong 2023-03-06  1415  }
77b9587945b6a5 Darrick J. Wong 2023-03-06  1416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
