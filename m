Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A12372
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 01:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679794767; x=1711330767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ReKxeDSez1Jq6T252Oa80S68gYLBaspIT2EEn20WZAY=;
  b=LOgjpr/V5BxsN2vZm2kdYqxH1WsGvu9ub1GAxLHgJI+0rx6JYs90dDny
   x+2CLgCzeE5FwgBybg+69oeVyj0i2ZaxIYe/5kEnj7AkUjaM+/U23PyLP
   ImJqVLsUmxcSO8WFgJBa3em3wEBk6EGMECTSV4uzLT18oIm/HGOQQJBy3
   RHRgjMNDbVypDi5LKrPX7OcmOFUTb6BucG8c0aFIUIJZlcs9UjtHYw87i
   ovTzEyCFNvGX0xVPB/4GOMpdZquTyKZuNWwRkJUMkIqB+uWNlA2pPzJWF
   qCsodsH5p7mTPMAWKyw9CUDEa63U5o12Yom1IR305qKWi5egu72tW25l2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="323917720"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="323917720"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 18:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="685593568"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="685593568"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2023 18:39:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgFLx-000Gnb-0W;
	Sun, 26 Mar 2023 01:39:25 +0000
Date: Sun, 26 Mar 2023 09:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 246/287] fs/xfs/xfs_rtalloc.c:1552
 xfs_rtfile_convert_one() warn: missing error code 'error'
Message-ID: <202303260959.tQV2vson-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: 88d3de0890a01c4e858eb498cfe5ccfa846c9915 [246/287] xfs: make atomic extent swapping support realtime files
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260959.tQV2vson-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303260959.tQV2vson-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1552 xfs_rtfile_convert_one() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:332 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:847 xfs_growfs_rt_alloc() warn: missing unwind goto?
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/error +1552 fs/xfs/xfs_rtalloc.c

88d3de0890a01c Darrick J. Wong 2023-03-06  1512  
88d3de0890a01c Darrick J. Wong 2023-03-06  1513  /*
88d3de0890a01c Darrick J. Wong 2023-03-06  1514   * Find an unwritten extent in the given file range, zero it, and convert the
88d3de0890a01c Darrick J. Wong 2023-03-06  1515   * mapping to written.  Adjust the scan cursor on the way out.
88d3de0890a01c Darrick J. Wong 2023-03-06  1516   */
88d3de0890a01c Darrick J. Wong 2023-03-06  1517  STATIC int
88d3de0890a01c Darrick J. Wong 2023-03-06  1518  xfs_rtfile_convert_one(
88d3de0890a01c Darrick J. Wong 2023-03-06  1519  	struct xfs_inode	*ip,
88d3de0890a01c Darrick J. Wong 2023-03-06  1520  	xfs_fileoff_t		*offp,
88d3de0890a01c Darrick J. Wong 2023-03-06  1521  	xfs_fileoff_t		endoff)
88d3de0890a01c Darrick J. Wong 2023-03-06  1522  {
88d3de0890a01c Darrick J. Wong 2023-03-06  1523  	struct xfs_bmbt_irec	irec;
88d3de0890a01c Darrick J. Wong 2023-03-06  1524  	struct xfs_mount	*mp = ip->i_mount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1525  	struct xfs_trans	*tp;
88d3de0890a01c Darrick J. Wong 2023-03-06  1526  	unsigned int		resblks;
88d3de0890a01c Darrick J. Wong 2023-03-06  1527  	int			nmap;
88d3de0890a01c Darrick J. Wong 2023-03-06  1528  	int			error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1529  
88d3de0890a01c Darrick J. Wong 2023-03-06  1530  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1531  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1532  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1533  		return error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1534  
88d3de0890a01c Darrick J. Wong 2023-03-06  1535  	xfs_ilock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1536  	xfs_trans_ijoin(tp, ip, 0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1537  
88d3de0890a01c Darrick J. Wong 2023-03-06  1538  	/*
88d3de0890a01c Darrick J. Wong 2023-03-06  1539  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
88d3de0890a01c Darrick J. Wong 2023-03-06  1540  	 * to an rt extent boundary...
88d3de0890a01c Darrick J. Wong 2023-03-06  1541  	 */
88d3de0890a01c Darrick J. Wong 2023-03-06  1542  retry:
88d3de0890a01c Darrick J. Wong 2023-03-06  1543  	nmap = 1;
88d3de0890a01c Darrick J. Wong 2023-03-06  1544  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1545  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1546  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1547  	ASSERT(nmap == 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1548  	ASSERT(irec.br_startoff == *offp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1549  	if (!xfs_rtfile_want_conversion(mp, &irec)) {
88d3de0890a01c Darrick J. Wong 2023-03-06  1550  		*offp = irec.br_startoff + irec.br_blockcount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1551  		if (*offp >= endoff)
88d3de0890a01c Darrick J. Wong 2023-03-06 @1552  			goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1553  		goto retry;
88d3de0890a01c Darrick J. Wong 2023-03-06  1554  	}
88d3de0890a01c Darrick J. Wong 2023-03-06  1555  
88d3de0890a01c Darrick J. Wong 2023-03-06  1556  	/*
88d3de0890a01c Darrick J. Wong 2023-03-06  1557  	 * ...make sure this partially unwritten rt extent gets converted to a
88d3de0890a01c Darrick J. Wong 2023-03-06  1558  	 * zeroed written extent that we can remap.
88d3de0890a01c Darrick J. Wong 2023-03-06  1559  	 */
88d3de0890a01c Darrick J. Wong 2023-03-06  1560  	nmap = 1;
88d3de0890a01c Darrick J. Wong 2023-03-06  1561  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
88d3de0890a01c Darrick J. Wong 2023-03-06  1562  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
88d3de0890a01c Darrick J. Wong 2023-03-06  1563  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1564  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1565  	ASSERT(nmap == 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1566  	if (irec.br_state != XFS_EXT_NORM) {
88d3de0890a01c Darrick J. Wong 2023-03-06  1567  		ASSERT(0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1568  		error = -EIO;
88d3de0890a01c Darrick J. Wong 2023-03-06  1569  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1570  	}
88d3de0890a01c Darrick J. Wong 2023-03-06  1571  	error = xfs_trans_commit(tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1572  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1573  		goto out_unlock;
88d3de0890a01c Darrick J. Wong 2023-03-06  1574  
88d3de0890a01c Darrick J. Wong 2023-03-06  1575  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1576  	*offp = irec.br_startoff + irec.br_blockcount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1577  	return 0;
88d3de0890a01c Darrick J. Wong 2023-03-06  1578  
88d3de0890a01c Darrick J. Wong 2023-03-06  1579  out_cancel:
88d3de0890a01c Darrick J. Wong 2023-03-06  1580  	xfs_trans_cancel(tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1581  out_unlock:
88d3de0890a01c Darrick J. Wong 2023-03-06  1582  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1583  	return error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1584  }
88d3de0890a01c Darrick J. Wong 2023-03-06  1585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
