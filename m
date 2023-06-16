Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47F2E0F7
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 23:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686957901; x=1718493901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEzwyF6IVD2xfZvkTIB962d1RYUJib5Tq9J7/WcxTVk=;
  b=TG3LQvZdRDeJD5pQ72GFdMDd16Qa/F+tFVP6A3Ik9bDd1i4DVap3cOxM
   v9oc+QrlWDeeMS7CbELG05aQbAK4BBPId+xaEsQxVlyykm5lHjTVC9fA0
   accsA5c6YbiyHlrGApqpqP974PcOM0Fq1rPx2yv4dhZfczMkg6HHm81QC
   zEBgvshpGLgUwyMHYRyExyRmtlggZzYDp+loog4vbWdMgeWfSniswu8y0
   l48qU+eULH1A084VkSy5xfNnUdwYr3yJJseKGbNehmBJDyvimk631+1tT
   1HhOJg5KhBJW12k59lAt5/Gi6YMA7/qimTiI6J7mc+PQHh6Lj1/cNM3tl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="339667672"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="339667672"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 16:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="778324093"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="778324093"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2023 16:24:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAIoM-0001uS-2b;
	Fri, 16 Jun 2023 23:24:58 +0000
Date: Sat, 17 Jun 2023 07:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 161/202] fs/xfs/xfs_rtalloc.c:1552
 xfs_rtfile_convert_one() warn: missing error code 'error'
Message-ID: <202306170709.yzj6aBnP-lkp@intel.com>
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
head:   9f2fc0e8ef147d9fd9c6af47c4ab87427e0d2d19
commit: 31fe3ca50677bd3b5f6d472bab77af46434dd62d [161/202] xfs: make atomic extent swapping support realtime files
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: mips-randconfig-m041-20230615 (https://download.01.org/0day-ci/archive/20230617/202306170709.yzj6aBnP-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170709.yzj6aBnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306170709.yzj6aBnP-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1552 xfs_rtfile_convert_one() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:332 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:847 xfs_growfs_rt_alloc() warn: missing unwind goto?

vim +/error +1552 fs/xfs/xfs_rtalloc.c

31fe3ca50677bd Darrick J. Wong 2023-03-06  1512  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1513  /*
31fe3ca50677bd Darrick J. Wong 2023-03-06  1514   * Find an unwritten extent in the given file range, zero it, and convert the
31fe3ca50677bd Darrick J. Wong 2023-03-06  1515   * mapping to written.  Adjust the scan cursor on the way out.
31fe3ca50677bd Darrick J. Wong 2023-03-06  1516   */
31fe3ca50677bd Darrick J. Wong 2023-03-06  1517  STATIC int
31fe3ca50677bd Darrick J. Wong 2023-03-06  1518  xfs_rtfile_convert_one(
31fe3ca50677bd Darrick J. Wong 2023-03-06  1519  	struct xfs_inode	*ip,
31fe3ca50677bd Darrick J. Wong 2023-03-06  1520  	xfs_fileoff_t		*offp,
31fe3ca50677bd Darrick J. Wong 2023-03-06  1521  	xfs_fileoff_t		endoff)
31fe3ca50677bd Darrick J. Wong 2023-03-06  1522  {
31fe3ca50677bd Darrick J. Wong 2023-03-06  1523  	struct xfs_bmbt_irec	irec;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1524  	struct xfs_mount	*mp = ip->i_mount;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1525  	struct xfs_trans	*tp;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1526  	unsigned int		resblks;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1527  	int			nmap;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1528  	int			error;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1529  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1530  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1531  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1532  	if (error)
31fe3ca50677bd Darrick J. Wong 2023-03-06  1533  		return error;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1534  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1535  	xfs_ilock(ip, XFS_ILOCK_EXCL);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1536  	xfs_trans_ijoin(tp, ip, 0);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1537  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1538  	/*
31fe3ca50677bd Darrick J. Wong 2023-03-06  1539  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
31fe3ca50677bd Darrick J. Wong 2023-03-06  1540  	 * to an rt extent boundary...
31fe3ca50677bd Darrick J. Wong 2023-03-06  1541  	 */
31fe3ca50677bd Darrick J. Wong 2023-03-06  1542  retry:
31fe3ca50677bd Darrick J. Wong 2023-03-06  1543  	nmap = 1;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1544  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1545  	if (error)
31fe3ca50677bd Darrick J. Wong 2023-03-06  1546  		goto out_cancel;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1547  	ASSERT(nmap == 1);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1548  	ASSERT(irec.br_startoff == *offp);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1549  	if (!xfs_rtfile_want_conversion(mp, &irec)) {
31fe3ca50677bd Darrick J. Wong 2023-03-06  1550  		*offp = irec.br_startoff + irec.br_blockcount;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1551  		if (*offp >= endoff)
31fe3ca50677bd Darrick J. Wong 2023-03-06 @1552  			goto out_cancel;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1553  		goto retry;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1554  	}
31fe3ca50677bd Darrick J. Wong 2023-03-06  1555  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1556  	/*
31fe3ca50677bd Darrick J. Wong 2023-03-06  1557  	 * ...make sure this partially unwritten rt extent gets converted to a
31fe3ca50677bd Darrick J. Wong 2023-03-06  1558  	 * zeroed written extent that we can remap.
31fe3ca50677bd Darrick J. Wong 2023-03-06  1559  	 */
31fe3ca50677bd Darrick J. Wong 2023-03-06  1560  	nmap = 1;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1561  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
31fe3ca50677bd Darrick J. Wong 2023-03-06  1562  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1563  	if (error)
31fe3ca50677bd Darrick J. Wong 2023-03-06  1564  		goto out_cancel;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1565  	ASSERT(nmap == 1);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1566  	if (irec.br_state != XFS_EXT_NORM) {
31fe3ca50677bd Darrick J. Wong 2023-03-06  1567  		ASSERT(0);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1568  		error = -EIO;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1569  		goto out_cancel;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1570  	}
31fe3ca50677bd Darrick J. Wong 2023-03-06  1571  	error = xfs_trans_commit(tp);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1572  	if (error)
31fe3ca50677bd Darrick J. Wong 2023-03-06  1573  		goto out_unlock;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1574  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1575  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1576  	*offp = irec.br_startoff + irec.br_blockcount;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1577  	return 0;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1578  
31fe3ca50677bd Darrick J. Wong 2023-03-06  1579  out_cancel:
31fe3ca50677bd Darrick J. Wong 2023-03-06  1580  	xfs_trans_cancel(tp);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1581  out_unlock:
31fe3ca50677bd Darrick J. Wong 2023-03-06  1582  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
31fe3ca50677bd Darrick J. Wong 2023-03-06  1583  	return error;
31fe3ca50677bd Darrick J. Wong 2023-03-06  1584  }
31fe3ca50677bd Darrick J. Wong 2023-03-06  1585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
