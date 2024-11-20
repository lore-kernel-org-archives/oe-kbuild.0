Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789212E5B
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 04:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732076268; cv=none; b=u1qP90N978I4LcsqmwKW8HQ2qBwnAvMFyIfo6oSWZjRE65Knca7yCulQS2YUAX2YpMxGJXwJcdSIwPNjzM/eLsVHsvwTmrtmBoAfrpqjQee27xhNMcNeZwHf+8pfzn+ATGUIv4fTMdn20k88fBYVCgSTauGRJWguCoEfOQ1GTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732076268; c=relaxed/simple;
	bh=byFnPy3b134pL351L+7MsiBFkvONMXDZ4QwofLCGQ8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6B8OY3MauUDzet33/TWulqJbfJ3SVNVFQoVHd0/z5pjiJ7imBKCVyVkJziRT3eMWv7NhGkm9FopFcBDYWTfcpjJOmscpmZ4nRkHIm11yro4AQL4TIun2ftph1yX9A62ecfCYmrAYYiLxo+EX6WUluv1gtOSjhRS/wGm6QZzGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0WkxmPU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0WkxmPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732076267; x=1763612267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=byFnPy3b134pL351L+7MsiBFkvONMXDZ4QwofLCGQ8Q=;
  b=I0WkxmPUySXqVpGgUK9cMBtFPbuqDGmzbvtqCypPEmiRJSChosm02oU7
   7wCWYDn99MvXsFYu/zAC7xRoisSxgAWqWoZ+BudnmMeTLJUS3dzbwLeDx
   RTymJHV82+mKIWqdQpdRB5Cjol4unOTtU5f6KVLcHiZcHJkdHwoaeeYPf
   /RS5HzuQWpSQkaMPLvONYi7PfBmKSBymbomW/dF5GfuxCjehjOOuM+dMU
   ufl57wGcVQFKqyCKRRBFFkLl0YVwXp3CqMKDuQRz/U397Nq14SB2MpwFq
   hQ+dTuTxNyIe2mI1GWwiMuA8hsb+b7IzZvRJSKiCWIFJkSN44C/F8voKH
   g==;
X-CSE-ConnectionGUID: TT/tX666QcOT9zaDrEe7JA==
X-CSE-MsgGUID: AEcxweCzQSCvol7Zp+h3+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32248864"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="32248864"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 20:17:46 -0800
X-CSE-ConnectionGUID: MnNL2GSJQbWNQEz75cDeAg==
X-CSE-MsgGUID: 9SuWsfPET+6Yr8AgttkJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90176523"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 20:17:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDc9u-0000Tp-37;
	Wed, 20 Nov 2024 04:17:42 +0000
Date: Wed, 20 Nov 2024 12:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:defrag-freespace 239/258] fs/xfs/xfs_bmap_util.c:1829
 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
Message-ID: <202411201240.VLL10nFQ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git defrag-freespace
head:   456cb26b1542e21901f9f9adcb5a5b6f8f4a9071
commit: a06fea92fe58a36c7057bc7e2313f95ad3d59a57 [239/258] xfs: convert partially written rt file extents to completely written
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: nios2-randconfig-r071-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201240.VLL10nFQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411201240.VLL10nFQ-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1829 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/error +1829 fs/xfs/xfs_bmap_util.c

a06fea92fe58a3 Darrick J. Wong 2024-10-15  1789  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1790  /*
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1791   * Find an unwritten extent in the given file range, zero it, and convert the
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1792   * mapping to written.  Adjust the scan cursor on the way out.
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1793   */
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1794  STATIC int
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1795  xfs_convert_rtbigalloc_mapping(
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1796  	struct xfs_inode	*ip,
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1797  	xfs_fileoff_t		*offp,
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1798  	xfs_fileoff_t		endoff)
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1799  {
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1800  	struct xfs_bmbt_irec	irec;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1801  	struct xfs_mount	*mp = ip->i_mount;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1802  	struct xfs_trans	*tp;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1803  	unsigned int		resblks;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1804  	int			nmap;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1805  	int			error;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1806  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1807  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1808  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1809  	if (error)
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1810  		return error;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1811  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1812  	xfs_ilock(ip, XFS_ILOCK_EXCL);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1813  	xfs_trans_ijoin(tp, ip, 0);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1814  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1815  	/*
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1816  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1817  	 * to an allocation unit...
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1818  	 */
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1819  retry:
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1820  	nmap = 1;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1821  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1822  	if (error)
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1823  		goto out_cancel;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1824  	ASSERT(nmap == 1);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1825  	ASSERT(irec.br_startoff == *offp);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1826  	if (!xfs_want_convert_rtbigalloc_mapping(mp, &irec)) {
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1827  		*offp = irec.br_startoff + irec.br_blockcount;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1828  		if (*offp >= endoff)
a06fea92fe58a3 Darrick J. Wong 2024-10-15 @1829  			goto out_cancel;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1830  		goto retry;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1831  	}
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1832  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1833  	/*
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1834  	 * ...then write zeroes to the space and change the mapping state to
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1835  	 * written.  This consolidates the mappings for this allocation unit.
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1836  	 */
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1837  	nmap = 1;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1838  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1839  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1840  	if (error)
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1841  		goto out_cancel;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1842  	error = xfs_trans_commit(tp);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1843  	if (error)
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1844  		goto out_unlock;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1845  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1846  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1847  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1848  	/*
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1849  	 * If an unwritten mapping was returned, something is very wrong.
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1850  	 * If no mapping was returned, then bmapi_write thought it performed
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1851  	 * a short allocation, which should be impossible since we previously
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1852  	 * queried the mapping and haven't cycled locks since then.  Either
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1853  	 * way, fail the operation.
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1854  	 */
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1855  	if (nmap == 0 || irec.br_state != XFS_EXT_NORM) {
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1856  		ASSERT(nmap != 0);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1857  		ASSERT(irec.br_state == XFS_EXT_NORM);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1858  		return -EIO;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1859  	}
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1860  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1861  	/* Advance the cursor to the end of the mapping returned. */
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1862  	*offp = irec.br_startoff + irec.br_blockcount;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1863  	return 0;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1864  
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1865  out_cancel:
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1866  	xfs_trans_cancel(tp);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1867  out_unlock:
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1868  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1869  	return error;
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1870  }
a06fea92fe58a3 Darrick J. Wong 2024-10-15  1871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
