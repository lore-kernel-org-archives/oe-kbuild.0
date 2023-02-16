Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075233E6
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676579507; x=1708115507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HC5ihLGlFctC/YjZEbNTPAr8nsutb9kWbA+OMvAosb0=;
  b=M3HnRK9k5BCiv/j/LjAiUzbZTdAiEoOTejgYBq86NatoO9wRurLpzVdT
   jvLI+H/FI2l6BIMOoXE+xjRhbeat+93xAqIILUTBn+eHFxzFIl9QW1KcU
   MrUbvjwZj2n5sUMxF550q2Yc9Ip9BSWzcsMNdLbh4Br9Fg0RKaxzKhL5/
   r7M+aPIUuty9egjUDSOjpIM6liEVpLQKQu4DMYY2efcKqI2+x9N6LpZrE
   lBItuRYNZ9gpg0Qz8BPZ3q1yQDdRW56xuLUCRkv9Hnx6HKCNW3ogb3wsX
   Pcdr0YmRuC2OgZLJgqIQuiuTS4Nv4o7BwAD9AB6iBCIWGfowZyzGpc3/T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333189553"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333189553"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="647854694"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="647854694"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Feb 2023 12:31:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSkuo-000AYu-2V;
	Thu, 16 Feb 2023 20:31:38 +0000
Date: Fri, 17 Feb 2023 04:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:djwong-wtf 503/504] fs/xfs/xfs_bmap_util.c:1359
 xfs_map_free_extent() warn: missing error code 'error'
Message-ID: <202302170445.PkkeBp8h-lkp@intel.com>
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
head:   9f2ad4c9837c2ce55c9c2fe80640ad15a95e8f77
commit: c19a7a3e998c7d5d3c48524fb0934697d58a6e2a [503/504] xfs: fallocate free space into a file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170445.PkkeBp8h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302170445.PkkeBp8h-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +1359 fs/xfs/xfs_bmap_util.c

c19a7a3e998c7d Darrick J. Wong 2022-07-14  1327  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1328  /* Find a free extent in this AG and map it into the file. */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1329  STATIC int
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1330  xfs_map_free_extent(
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1331  	struct xfs_inode	*ip,
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1332  	struct xfs_perag	*pag,
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1333  	xfs_agblock_t		*cursor,
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1334  	xfs_agblock_t		end_agbno,
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1335  	xfs_agblock_t		*last_enospc_agbno)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1336  {
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1337  	struct xfs_bmbt_irec	irec;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1338  	struct xfs_mount	*mp = ip->i_mount;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1339  	struct xfs_trans	*tp;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1340  	xfs_off_t		endpos;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1341  	xfs_fsblock_t		fsbno;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1342  	xfs_extlen_t		len;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1343  	int			error;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1344  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1345  	if (fatal_signal_pending(current))
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1346  		return -EINTR;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1347  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1348  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1349  			&tp);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1350  	if (error)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1351  		return error;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1352  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1353  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &len);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1354  	if (error)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1355  		goto out_cancel;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1356  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1357  	/* Bail out if the cursor is beyond what we asked for. */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1358  	if (*cursor >= end_agbno)
c19a7a3e998c7d Darrick J. Wong 2022-07-14 @1359  		goto out_cancel;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1360  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1361  	error = xfs_map_free_reserve_more(tp, ip, &len);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1362  	if (error)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1363  		goto out_cancel;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1364  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1365  	fsbno = XFS_AGB_TO_FSB(mp, pag->pag_agno, *cursor);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1366  	do {
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1367  		error = xfs_bmapi_freesp(tp, ip, fsbno, len, &irec);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1368  		if (error == -EAGAIN) {
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1369  			/* Failed to map space but were told to try again. */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1370  			error = xfs_trans_commit(tp);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1371  			goto out;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1372  		}
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1373  		if (error != -ENOSPC)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1374  			break;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1375  		/*
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1376  		 * If we can't get the space, try asking for successively less
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1377  		 * space in case we're bumping up against per-AG metadata
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1378  		 * reservation limits...
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1379  		 */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1380  		len >>= 1;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1381  	} while (len > 0);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1382  	if (error == -ENOSPC && *last_enospc_agbno != *cursor) {
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1383  		/*
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1384  		 * ...but even that might not work if an AGFL fixup allocated
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1385  		 * the block at *cursor.  The first time this happens, remember
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1386  		 * that we ran out of space here, and try again.
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1387  		 */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1388  		*last_enospc_agbno = *cursor;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1389  		error = 0;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1390  		goto out_cancel;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1391  	}
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1392  	if (error)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1393  		goto out_cancel;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1394  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1395  	/* Update isize if needed. */
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1396  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1397  	if (endpos > i_size_read(VFS_I(ip))) {
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1398  		i_size_write(VFS_I(ip), endpos);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1399  		ip->i_disk_size = endpos;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1400  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1401  	}
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1402  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1403  	error = xfs_trans_commit(tp);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1404  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1405  	if (error)
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1406  		return error;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1407  
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1408  	*cursor += irec.br_blockcount;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1409  	return 0;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1410  out_cancel:
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1411  	xfs_trans_cancel(tp);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1412  out:
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1413  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1414  	return error;
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1415  }
c19a7a3e998c7d Darrick J. Wong 2022-07-14  1416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
