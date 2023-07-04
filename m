Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398563F
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688446657; x=1719982657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/18ks5uLAQvNlRrwtd+gUVeUR2z+P9X7IRavofHiH6A=;
  b=KEVZTUw0s7QrtwAZjdSs5qTQE/bxIyIIqIE+LNfeojaG5R/o5OUhJ5Fg
   t7INWfNhJE+EyJ5xi2TyNYmGRDWKbw6BwcfgQIq1FQlZZPg8fnk4pPpHa
   3TAdqA2duejFYMGaxtTeduJ3dhIp7rfNt3GrgWdoD1p72e0UYLcdAFb9P
   vgLt/Fr0PLrBH0OBbJKEk82+ukyMIXUhiCCzEOHhO+PU2qyf4CK3V0/7D
   ED9hQJY+K1oV7Z7m7tbjl6NnQZOlyBre0Eoce1RLT8OSkQrfVvQAB0Adc
   kdVP3c55EgtD5YCrdqqmOnZNeF3JoQp6qConC5GWxS6zEy6OKXiQ7n+XG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393773110"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="393773110"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 21:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718786353"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="718786353"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 21:57:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGY6Y-000Hst-0G;
	Tue, 04 Jul 2023 04:57:34 +0000
Date: Tue, 4 Jul 2023 12:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 176/217] fs/xfs/xfs_rtalloc.c:1552
 xfs_rtfile_convert_one() warn: missing error code 'error'
Message-ID: <202307041230.tkrP8QWa-lkp@intel.com>
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
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 9f149ea10dfaa30a48bdfff3bf2a4b5b4bdccc27 [176/217] xfs: make atomic extent swapping support realtime files
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041230.tkrP8QWa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041230.tkrP8QWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307041230.tkrP8QWa-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1552 xfs_rtfile_convert_one() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:332 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:847 xfs_growfs_rt_alloc() warn: missing unwind goto?

vim +/error +1552 fs/xfs/xfs_rtalloc.c

9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1512  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1513  /*
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1514   * Find an unwritten extent in the given file range, zero it, and convert the
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1515   * mapping to written.  Adjust the scan cursor on the way out.
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1516   */
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1517  STATIC int
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1518  xfs_rtfile_convert_one(
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1519  	struct xfs_inode	*ip,
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1520  	xfs_fileoff_t		*offp,
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1521  	xfs_fileoff_t		endoff)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1522  {
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1523  	struct xfs_bmbt_irec	irec;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1524  	struct xfs_mount	*mp = ip->i_mount;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1525  	struct xfs_trans	*tp;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1526  	unsigned int		resblks;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1527  	int			nmap;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1528  	int			error;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1529  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1530  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1531  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1532  	if (error)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1533  		return error;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1534  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1535  	xfs_ilock(ip, XFS_ILOCK_EXCL);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1536  	xfs_trans_ijoin(tp, ip, 0);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1537  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1538  	/*
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1539  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1540  	 * to an rt extent boundary...
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1541  	 */
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1542  retry:
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1543  	nmap = 1;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1544  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1545  	if (error)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1546  		goto out_cancel;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1547  	ASSERT(nmap == 1);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1548  	ASSERT(irec.br_startoff == *offp);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1549  	if (!xfs_rtfile_want_conversion(mp, &irec)) {
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1550  		*offp = irec.br_startoff + irec.br_blockcount;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1551  		if (*offp >= endoff)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06 @1552  			goto out_cancel;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1553  		goto retry;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1554  	}
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1555  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1556  	/*
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1557  	 * ...make sure this partially unwritten rt extent gets converted to a
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1558  	 * zeroed written extent that we can remap.
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1559  	 */
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1560  	nmap = 1;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1561  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1562  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1563  	if (error)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1564  		goto out_cancel;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1565  	ASSERT(nmap == 1);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1566  	if (irec.br_state != XFS_EXT_NORM) {
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1567  		ASSERT(0);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1568  		error = -EIO;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1569  		goto out_cancel;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1570  	}
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1571  	error = xfs_trans_commit(tp);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1572  	if (error)
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1573  		goto out_unlock;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1574  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1575  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1576  	*offp = irec.br_startoff + irec.br_blockcount;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1577  	return 0;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1578  
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1579  out_cancel:
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1580  	xfs_trans_cancel(tp);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1581  out_unlock:
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1582  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1583  	return error;
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1584  }
9f149ea10dfaa3 Darrick J. Wong 2023-03-06  1585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
