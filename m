Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A6316E877
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762597; cv=none; b=R0nbprqgHOC42xavo5rU8n8walHsY4fHV+1kPN6Vb/XGOjRKm6lbJN0AwaF8sdqTF2R0CdHLTQ5zgemji1Rw2xOKKhY3gvQRnEWv3sLnhrWZ2Z2riOMr0lCTLAhcxTnHHTQPGNOfClnlqQDjxaMMbM+kGC4Bsh1uJROohYHhLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762597; c=relaxed/simple;
	bh=nB3hp+2XMf74oUOdlZS350UCpxiJB3f2uY9bYgjmYNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQqmHzE5zoT8uxqJ6ESPHsoMyCRHPfyzBfUlll588R6rttDBBrcXpuY30cuHj0CpadjkBJvwImZNLc3zHP6cI9UY3l7ZlBn3hW9usr+SA9TGJ3xVgRkbBocC4BT86hJ0m+1nrriLa2Qly1kPI0yQ0LbnSF9MiBXer1rpyUMWztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHcTvpuy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHcTvpuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712762596; x=1744298596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nB3hp+2XMf74oUOdlZS350UCpxiJB3f2uY9bYgjmYNI=;
  b=WHcTvpuybjPv0W5oZRFryVfWfLcg6IaBE2nHuiCy+Kinp183aEplG+oZ
   bcAJ4qoeBugNXHdpLpQUchuuZ7uaUeeuyFbakMYFzmqwWQoqgQjBhZCUY
   VrJd3wjxadgfdKBcDKjUwRqjJuvCc9VEF21/tfHFova82MXHbxU7Ib7mP
   tzrzC19Dg4CZZ83IcGav/I/h9gMf9v2622LOWHgY9zVMtCwOIaxKiGalI
   r6oK08YmdWVeb9WQLwWBxM8Hp/nZZzeQkSaqPMTrVxvkp2bfCE154vxs1
   JfgGua3lf0WvT6pOIIXjio01bILwJFCBwBSUcpIoPenHgAvKZSvdxyHYq
   A==;
X-CSE-ConnectionGUID: b8/MGrHUTVyIY5M/tDDNuQ==
X-CSE-MsgGUID: U+0OydlqQBC5BSJD3etq6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19559856"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19559856"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:23:16 -0700
X-CSE-ConnectionGUID: 1rGI3LS1QNChmMDkkKFWww==
X-CSE-MsgGUID: QK6YCxLcQrGofWOX8ARpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43852836"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 08:23:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruZn5-0007WU-2E;
	Wed, 10 Apr 2024 15:23:11 +0000
Date: Wed, 10 Apr 2024 23:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:timestats-hoist 445/457] fs/xfs/xfs_bmap_util.c:1823
 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
Message-ID: <202404102346.P2kP55zW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   ed4cedcef505729c94212031f8ed784a5fd81ac5
commit: d228af407b64a712f8c858b00b3014b2df2c5586 [445/457] xfs: support reflink with force align enabled
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240410 (https://download.01.org/0day-ci/archive/20240410/202404102346.P2kP55zW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404102346.P2kP55zW-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1823 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_bmap_util.c:1988 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +1823 fs/xfs/xfs_bmap_util.c

8ff235eaba14273 Darrick J. Wong 2024-02-20  1783  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1784  /*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1785   * Find an unwritten extent in the given file range, zero it, and convert the
8ff235eaba14273 Darrick J. Wong 2024-02-20  1786   * mapping to written.  Adjust the scan cursor on the way out.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1787   */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1788  STATIC int
8ff235eaba14273 Darrick J. Wong 2024-02-20  1789  xfs_convert_rtbigalloc_mapping(
8ff235eaba14273 Darrick J. Wong 2024-02-20  1790  	struct xfs_inode	*ip,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1791  	xfs_fileoff_t		*offp,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1792  	xfs_fileoff_t		endoff)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1793  {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1794  	struct xfs_bmbt_irec	irec;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1795  	struct xfs_mount	*mp = ip->i_mount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1796  	struct xfs_trans	*tp;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1797  	unsigned int		resblks;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1798  	int			nmap;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1799  	int			error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1800  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1801  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1802  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1803  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1804  		return error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1805  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1806  	xfs_ilock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1807  	xfs_trans_ijoin(tp, ip, 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1808  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1809  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1810  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
8ff235eaba14273 Darrick J. Wong 2024-02-20  1811  	 * to an allocation unit...
8ff235eaba14273 Darrick J. Wong 2024-02-20  1812  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1813  retry:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1814  	nmap = 1;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1815  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1816  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1817  		goto out_cancel;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1818  	ASSERT(nmap == 1);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1819  	ASSERT(irec.br_startoff == *offp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1820  	if (!xfs_want_convert_rtbigalloc_mapping(mp, &irec)) {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1821  		*offp = irec.br_startoff + irec.br_blockcount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1822  		if (*offp >= endoff)
8ff235eaba14273 Darrick J. Wong 2024-02-20 @1823  			goto out_cancel;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1824  		goto retry;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1825  	}
8ff235eaba14273 Darrick J. Wong 2024-02-20  1826  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1827  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1828  	 * ...then write zeroes to the space and change the mapping state to
8ff235eaba14273 Darrick J. Wong 2024-02-20  1829  	 * written.  This consolidates the mappings for this allocation unit.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1830  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1831  	nmap = 1;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1832  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1833  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1834  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1835  		goto out_cancel;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1836  	error = xfs_trans_commit(tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1837  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1838  		goto out_unlock;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1839  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1840  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1841  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1842  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1843  	 * If an unwritten mapping was returned, something is very wrong.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1844  	 * If no mapping was returned, then bmapi_write thought it performed
8ff235eaba14273 Darrick J. Wong 2024-02-20  1845  	 * a short allocation, which should be impossible since we previously
8ff235eaba14273 Darrick J. Wong 2024-02-20  1846  	 * queried the mapping and haven't cycled locks since then.  Either
8ff235eaba14273 Darrick J. Wong 2024-02-20  1847  	 * way, fail the operation.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1848  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1849  	if (nmap == 0 || irec.br_state != XFS_EXT_NORM) {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1850  		ASSERT(nmap != 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1851  		ASSERT(irec.br_state == XFS_EXT_NORM);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1852  		return -EIO;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1853  	}
8ff235eaba14273 Darrick J. Wong 2024-02-20  1854  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1855  	/* Advance the cursor to the end of the mapping returned. */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1856  	*offp = irec.br_startoff + irec.br_blockcount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1857  	return 0;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1858  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1859  out_cancel:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1860  	xfs_trans_cancel(tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1861  out_unlock:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1862  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1863  	return error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1864  }
8ff235eaba14273 Darrick J. Wong 2024-02-20  1865  

:::::: The code at line 1823 was first introduced by commit
:::::: 8ff235eaba14273f9449b61e15961671c8d5ad31 xfs: convert partially written rt file extents to completely written

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
