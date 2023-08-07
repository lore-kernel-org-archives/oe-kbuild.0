Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1B392
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 02:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691375908; x=1722911908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IkG2yzK4YBTj8Tr8fqzl2v5u6tyZYd7kaxuOq0RoKs=;
  b=ldGQD6p74VPCDltAnOb66y6Zk4xT3rJs0YyUr6Wi7yklUBpUuOVX0f4x
   EqNKUauBfk0uir0YiMCWDEhjk4oDXY2h7Ds3UlXW77lCnKIQVxWQNrv24
   vW7GINTDVAQ6/+vb4Wj8IZa3xY15ZHZv70USorCr3TaTikk3OwqrgQWSr
   RoDHo4CrOqVFuS6xvRqFTQ6bU+NV2eCYkE4WzVF64RKUTv/Gz4aZPPirR
   JpOnueCoa+Q++WqLeol1LgAK/icWfD4Ll5dVyRwFl5th8aIx0EqkKgEOy
   TaBYG2RZgBmDXYakGF7OnM1RSm20JlTUQ29M6ayYv3YbUPhz215feMEi3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="360522286"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="360522286"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 19:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="904553937"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="904553937"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2023 19:38:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSq8Y-0004Uh-0q;
	Mon, 07 Aug 2023 02:38:26 +0000
Date: Mon, 7 Aug 2023 10:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:djwong-wtf 509/510] fs/xfs/xfs_bmap_util.c:1505
 xfs_map_free_rt_extent() warn: missing error code 'error'
Message-ID: <202308071043.K0mvspzv-lkp@intel.com>
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
head:   b4b732d27b8ac9e8db0b841af516cd4906ed3376
commit: a7107bda4b584348eba0da75db0678a72b04a3c4 [509/510] xfs: fallocate free space into a file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-m031-20230807 (https://download.01.org/0day-ci/archive/20230807/202308071043.K0mvspzv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308071043.K0mvspzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308071043.K0mvspzv-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1505 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:453 xfs_buftarg_zeroout() warn: bitwise AND condition is false here
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +1505 fs/xfs/xfs_bmap_util.c

a7107bda4b5843 Darrick J. Wong 2023-03-06  1468  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1469  #ifdef CONFIG_XFS_RT
a7107bda4b5843 Darrick J. Wong 2023-03-06  1470  STATIC int
a7107bda4b5843 Darrick J. Wong 2023-03-06  1471  xfs_map_free_rt_extent(
a7107bda4b5843 Darrick J. Wong 2023-03-06  1472  	struct xfs_inode	*ip,
a7107bda4b5843 Darrick J. Wong 2023-03-06  1473  	xfs_rtxnum_t		*cursor,
a7107bda4b5843 Darrick J. Wong 2023-03-06  1474  	xfs_rtxnum_t		end_rtx)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1475  {
a7107bda4b5843 Darrick J. Wong 2023-03-06  1476  	struct xfs_bmbt_irec	irec;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1477  	struct xfs_mount	*mp = ip->i_mount;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1478  	struct xfs_trans	*tp;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1479  	xfs_off_t		endpos;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1480  	xfs_rtblock_t		rtbno;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1481  	xfs_rtxnum_t		add;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1482  	xfs_rtxlen_t		len_rtx;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1483  	xfs_extlen_t		len;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1484  	uint32_t		mod;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1485  	int			error;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1486  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1487  	if (fatal_signal_pending(current))
a7107bda4b5843 Darrick J. Wong 2023-03-06  1488  		return -EINTR;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1489  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1490  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
a7107bda4b5843 Darrick J. Wong 2023-03-06  1491  			&tp);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1492  	if (error)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1493  		return error;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1494  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1495  	xfs_rtbitmap_lock(tp, mp);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1496  	error = xfs_rtalloc_find_freesp(tp, cursor, end_rtx, &len_rtx);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1497  	if (error)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1498  		goto out_cancel;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1499  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1500  	/*
a7107bda4b5843 Darrick J. Wong 2023-03-06  1501  	 * If off_rtx is beyond the end of the rt device or is past what the
a7107bda4b5843 Darrick J. Wong 2023-03-06  1502  	 * user asked for, bail out.
a7107bda4b5843 Darrick J. Wong 2023-03-06  1503  	 */
a7107bda4b5843 Darrick J. Wong 2023-03-06  1504  	if (*cursor >= end_rtx)
a7107bda4b5843 Darrick J. Wong 2023-03-06 @1505  		goto out_cancel;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1506  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1507  	len = xfs_rtx_to_rtb(mp, len_rtx);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1508  	error = xfs_map_free_reserve_more(tp, ip, &len);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1509  	if (error)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1510  		goto out_cancel;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1511  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1512  	rtbno = xfs_rtx_to_rtb(mp, *cursor);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1513  	error = xfs_bmapi_freesp(tp, ip, rtbno, len, &irec);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1514  	if (error)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1515  		goto out_cancel;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1516  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1517  	/* Update isize if needed. */
a7107bda4b5843 Darrick J. Wong 2023-03-06  1518  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1519  	if (endpos > i_size_read(VFS_I(ip))) {
a7107bda4b5843 Darrick J. Wong 2023-03-06  1520  		i_size_write(VFS_I(ip), endpos);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1521  		ip->i_disk_size = endpos;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1522  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1523  	}
a7107bda4b5843 Darrick J. Wong 2023-03-06  1524  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1525  	error = xfs_trans_commit(tp);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1526  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1527  	if (error)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1528  		return error;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1529  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1530  	add = xfs_rtb_to_rtx(mp, irec.br_blockcount, &mod);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1531  	if (mod)
a7107bda4b5843 Darrick J. Wong 2023-03-06  1532  		return -EFSCORRUPTED;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1533  
a7107bda4b5843 Darrick J. Wong 2023-03-06  1534  	*cursor += add;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1535  	return 0;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1536  out_cancel:
a7107bda4b5843 Darrick J. Wong 2023-03-06  1537  	xfs_trans_cancel(tp);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1538  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
a7107bda4b5843 Darrick J. Wong 2023-03-06  1539  	return error;
a7107bda4b5843 Darrick J. Wong 2023-03-06  1540  }
a7107bda4b5843 Darrick J. Wong 2023-03-06  1541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
