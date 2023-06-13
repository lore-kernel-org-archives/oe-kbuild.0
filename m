Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D917C7
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jun 2023 01:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686620368; x=1718156368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITy6JgupByJS4+dL6Llvhms9U8fJX6KQwVmDju9fwfM=;
  b=T4KqFSyx9P5iDji8H13OOd6FVn8J8qh5cC3w+MgYNIVHv7x5aSS4hbyH
   N6+31JeDsxgO6X5aa/4jwkfnaqPqYrJqmsbocfMy3/Jml22zuAhcle+Ou
   ARRHlIznEzjqXenboU+YbMe+f2AT/MDWgAJMH7lbVoDuIGaNBndH+OE74
   8kVjU/om6zQVhqc5CwXzf1G8/5mY+UWBhvxIjcCHzRQkyaePBohqfSsfH
   TnjAvAS+f4vWPunyVixmfRB2QK+yc8I/pRiYyiFnOy0nnIP/OIiMInWwL
   2nAtvO5lXMXRgoSi+U9weJaRWbrMIKOB5KY6vTQPBl6FUzX4Tig6h0j2v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342891320"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="342891320"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 18:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041572022"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="1041572022"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2023 18:39:25 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8t0H-0000uK-0X;
	Tue, 13 Jun 2023 01:39:25 +0000
Date: Tue, 13 Jun 2023 09:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:djwong-wtf 492/493] fs/xfs/xfs_bmap_util.c:1359
 xfs_map_free_extent() warn: missing error code 'error'
Message-ID: <202306130907.lg5vfZIu-lkp@intel.com>
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
head:   c2205c1c1f0b7765a8efc05e9f5e8a4195505137
commit: b290db360a0bbdc55017c631d74d6010227dfbf4 [492/493] xfs: fallocate free space into a file
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: m68k-randconfig-m041-20230611 (https://download.01.org/0day-ci/archive/20230613/202306130907.lg5vfZIu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306130907.lg5vfZIu-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:450 xfs_buftarg_zeroout() warn: bitwise AND condition is false here

vim +/error +1359 fs/xfs/xfs_bmap_util.c

b290db360a0bbd Darrick J. Wong 2023-03-06  1327  
b290db360a0bbd Darrick J. Wong 2023-03-06  1328  /* Find a free extent in this AG and map it into the file. */
b290db360a0bbd Darrick J. Wong 2023-03-06  1329  STATIC int
b290db360a0bbd Darrick J. Wong 2023-03-06  1330  xfs_map_free_extent(
b290db360a0bbd Darrick J. Wong 2023-03-06  1331  	struct xfs_inode	*ip,
b290db360a0bbd Darrick J. Wong 2023-03-06  1332  	struct xfs_perag	*pag,
b290db360a0bbd Darrick J. Wong 2023-03-06  1333  	xfs_agblock_t		*cursor,
b290db360a0bbd Darrick J. Wong 2023-03-06  1334  	xfs_agblock_t		end_agbno,
b290db360a0bbd Darrick J. Wong 2023-03-06  1335  	xfs_agblock_t		*last_enospc_agbno)
b290db360a0bbd Darrick J. Wong 2023-03-06  1336  {
b290db360a0bbd Darrick J. Wong 2023-03-06  1337  	struct xfs_bmbt_irec	irec;
b290db360a0bbd Darrick J. Wong 2023-03-06  1338  	struct xfs_mount	*mp = ip->i_mount;
b290db360a0bbd Darrick J. Wong 2023-03-06  1339  	struct xfs_trans	*tp;
b290db360a0bbd Darrick J. Wong 2023-03-06  1340  	xfs_off_t		endpos;
b290db360a0bbd Darrick J. Wong 2023-03-06  1341  	xfs_fsblock_t		fsbno;
b290db360a0bbd Darrick J. Wong 2023-03-06  1342  	xfs_extlen_t		len;
b290db360a0bbd Darrick J. Wong 2023-03-06  1343  	int			error;
b290db360a0bbd Darrick J. Wong 2023-03-06  1344  
b290db360a0bbd Darrick J. Wong 2023-03-06  1345  	if (fatal_signal_pending(current))
b290db360a0bbd Darrick J. Wong 2023-03-06  1346  		return -EINTR;
b290db360a0bbd Darrick J. Wong 2023-03-06  1347  
b290db360a0bbd Darrick J. Wong 2023-03-06  1348  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
b290db360a0bbd Darrick J. Wong 2023-03-06  1349  			&tp);
b290db360a0bbd Darrick J. Wong 2023-03-06  1350  	if (error)
b290db360a0bbd Darrick J. Wong 2023-03-06  1351  		return error;
b290db360a0bbd Darrick J. Wong 2023-03-06  1352  
b290db360a0bbd Darrick J. Wong 2023-03-06  1353  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &len);
b290db360a0bbd Darrick J. Wong 2023-03-06  1354  	if (error)
b290db360a0bbd Darrick J. Wong 2023-03-06  1355  		goto out_cancel;
b290db360a0bbd Darrick J. Wong 2023-03-06  1356  
b290db360a0bbd Darrick J. Wong 2023-03-06  1357  	/* Bail out if the cursor is beyond what we asked for. */
b290db360a0bbd Darrick J. Wong 2023-03-06  1358  	if (*cursor >= end_agbno)
b290db360a0bbd Darrick J. Wong 2023-03-06 @1359  		goto out_cancel;
b290db360a0bbd Darrick J. Wong 2023-03-06  1360  
b290db360a0bbd Darrick J. Wong 2023-03-06  1361  	error = xfs_map_free_reserve_more(tp, ip, &len);
b290db360a0bbd Darrick J. Wong 2023-03-06  1362  	if (error)
b290db360a0bbd Darrick J. Wong 2023-03-06  1363  		goto out_cancel;
b290db360a0bbd Darrick J. Wong 2023-03-06  1364  
b290db360a0bbd Darrick J. Wong 2023-03-06  1365  	fsbno = XFS_AGB_TO_FSB(mp, pag->pag_agno, *cursor);
b290db360a0bbd Darrick J. Wong 2023-03-06  1366  	do {
b290db360a0bbd Darrick J. Wong 2023-03-06  1367  		error = xfs_bmapi_freesp(tp, ip, fsbno, len, &irec);
b290db360a0bbd Darrick J. Wong 2023-03-06  1368  		if (error == -EAGAIN) {
b290db360a0bbd Darrick J. Wong 2023-03-06  1369  			/* Failed to map space but were told to try again. */
b290db360a0bbd Darrick J. Wong 2023-03-06  1370  			error = xfs_trans_commit(tp);
b290db360a0bbd Darrick J. Wong 2023-03-06  1371  			goto out;
b290db360a0bbd Darrick J. Wong 2023-03-06  1372  		}
b290db360a0bbd Darrick J. Wong 2023-03-06  1373  		if (error != -ENOSPC)
b290db360a0bbd Darrick J. Wong 2023-03-06  1374  			break;
b290db360a0bbd Darrick J. Wong 2023-03-06  1375  		/*
b290db360a0bbd Darrick J. Wong 2023-03-06  1376  		 * If we can't get the space, try asking for successively less
b290db360a0bbd Darrick J. Wong 2023-03-06  1377  		 * space in case we're bumping up against per-AG metadata
b290db360a0bbd Darrick J. Wong 2023-03-06  1378  		 * reservation limits...
b290db360a0bbd Darrick J. Wong 2023-03-06  1379  		 */
b290db360a0bbd Darrick J. Wong 2023-03-06  1380  		len >>= 1;
b290db360a0bbd Darrick J. Wong 2023-03-06  1381  	} while (len > 0);
b290db360a0bbd Darrick J. Wong 2023-03-06  1382  	if (error == -ENOSPC && *last_enospc_agbno != *cursor) {
b290db360a0bbd Darrick J. Wong 2023-03-06  1383  		/*
b290db360a0bbd Darrick J. Wong 2023-03-06  1384  		 * ...but even that might not work if an AGFL fixup allocated
b290db360a0bbd Darrick J. Wong 2023-03-06  1385  		 * the block at *cursor.  The first time this happens, remember
b290db360a0bbd Darrick J. Wong 2023-03-06  1386  		 * that we ran out of space here, and try again.
b290db360a0bbd Darrick J. Wong 2023-03-06  1387  		 */
b290db360a0bbd Darrick J. Wong 2023-03-06  1388  		*last_enospc_agbno = *cursor;
b290db360a0bbd Darrick J. Wong 2023-03-06  1389  		error = 0;
b290db360a0bbd Darrick J. Wong 2023-03-06  1390  		goto out_cancel;
b290db360a0bbd Darrick J. Wong 2023-03-06  1391  	}
b290db360a0bbd Darrick J. Wong 2023-03-06  1392  	if (error)
b290db360a0bbd Darrick J. Wong 2023-03-06  1393  		goto out_cancel;
b290db360a0bbd Darrick J. Wong 2023-03-06  1394  
b290db360a0bbd Darrick J. Wong 2023-03-06  1395  	/* Update isize if needed. */
b290db360a0bbd Darrick J. Wong 2023-03-06  1396  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
b290db360a0bbd Darrick J. Wong 2023-03-06  1397  	if (endpos > i_size_read(VFS_I(ip))) {
b290db360a0bbd Darrick J. Wong 2023-03-06  1398  		i_size_write(VFS_I(ip), endpos);
b290db360a0bbd Darrick J. Wong 2023-03-06  1399  		ip->i_disk_size = endpos;
b290db360a0bbd Darrick J. Wong 2023-03-06  1400  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
b290db360a0bbd Darrick J. Wong 2023-03-06  1401  	}
b290db360a0bbd Darrick J. Wong 2023-03-06  1402  
b290db360a0bbd Darrick J. Wong 2023-03-06  1403  	error = xfs_trans_commit(tp);
b290db360a0bbd Darrick J. Wong 2023-03-06  1404  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
b290db360a0bbd Darrick J. Wong 2023-03-06  1405  	if (error)
b290db360a0bbd Darrick J. Wong 2023-03-06  1406  		return error;
b290db360a0bbd Darrick J. Wong 2023-03-06  1407  
b290db360a0bbd Darrick J. Wong 2023-03-06  1408  	*cursor += irec.br_blockcount;
b290db360a0bbd Darrick J. Wong 2023-03-06  1409  	return 0;
b290db360a0bbd Darrick J. Wong 2023-03-06  1410  out_cancel:
b290db360a0bbd Darrick J. Wong 2023-03-06  1411  	xfs_trans_cancel(tp);
b290db360a0bbd Darrick J. Wong 2023-03-06  1412  out:
b290db360a0bbd Darrick J. Wong 2023-03-06  1413  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
b290db360a0bbd Darrick J. Wong 2023-03-06  1414  	return error;
b290db360a0bbd Darrick J. Wong 2023-03-06  1415  }
b290db360a0bbd Darrick J. Wong 2023-03-06  1416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
