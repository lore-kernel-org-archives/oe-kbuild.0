Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47F1940B3
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733376588; cv=none; b=LmcP59CTMB5Ob8I2QBGf/b0AFvaOfhthjfUGfAWEk88jgpvVAxJj1MFjoCgGKIpHEClFCG2U7MFFpv13OdOD+cy0nF+z0prT/hZieaf8Giep/HMRzrYT6KSnCR0mNiBcFeeYA+IGO6Asj0f0DbAbec4p5QbchpnJuDBQsGq1As4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733376588; c=relaxed/simple;
	bh=dQx/H2DhhNYARje6ZNKzK2L8TpSBoHd78ovH6WGmoog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jv7lxPdFBBieQ8x8SO3W4dQMIwiJuoMv863zzMSGNvS44SD2r5o/VVii2jVz/XLOK87tRJd7kHt3aMqwMeLIHYV2LtvbaHW1Xo8umR951TbakhkjFTja45wUTj7yQJvlI4Nauq0Y95Ddczz2Qotk4K8dBOdcLY0Nfdr8AnrlKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MW5vRM13; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MW5vRM13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733376586; x=1764912586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQx/H2DhhNYARje6ZNKzK2L8TpSBoHd78ovH6WGmoog=;
  b=MW5vRM135r5RyQ4onmIeRHQqwL0Hjag3cqbm6uQEv+gzAz4sZAUiWmlg
   IL/tAlPzlUCWX31WGOyf56xILUyi3/LrjJSXK4+8yzFq4lhy8Wauyyo+y
   613CJPsO4U9dy8dV5CjnDPq+G10+h5h3vP+YEwMgimiul0fRXUx/Ljnxs
   /w2jxq6Xdv2EFmnRiK2vl6lrsJU2B6efbGhCi1Zc9f2opemgt5Tv/1Znb
   kV2oW31/YPqJGwo9742vylAqlW34wCAgsb4vDW10yd0n/giiMg78R6D7H
   0U4U79S2t6CeHt04pjPsp9lhUyPVawnsKEFSWrbt2VO4mT1M2YmL3NfxG
   g==;
X-CSE-ConnectionGUID: elj5HLF1QaSlDNqMzoIhxQ==
X-CSE-MsgGUID: q0DdSyCJR7ai/pb4XXVGOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56147752"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56147752"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:29:43 -0800
X-CSE-ConnectionGUID: oYaMh8XGSAGNBsYAyvyMcA==
X-CSE-MsgGUID: Y8CQbqd+SMenHButrlJUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124904045"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 21:29:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ4Ql-0003qN-1d;
	Thu, 05 Dec 2024 05:29:39 +0000
Date: Thu, 5 Dec 2024 13:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:report-refcounts 128/143] fs/xfs/xfs_bmap_util.c:1820
 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
Message-ID: <202412051344.RmBiwQ8E-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   b6530fc93bc9507787a4db38da2f230a0a5c12c8
commit: 88ac22817f41544506e27809f675262b0b5601ec [128/143] xfs: convert partially written rt file extents to completely written
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051344.RmBiwQ8E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412051344.RmBiwQ8E-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_bmap_util.c:1820 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'

vim +/error +1820 fs/xfs/xfs_bmap_util.c

88ac22817f41544 Darrick J. Wong 2024-11-20  1780  
88ac22817f41544 Darrick J. Wong 2024-11-20  1781  /*
88ac22817f41544 Darrick J. Wong 2024-11-20  1782   * Find an unwritten extent in the given file range, zero it, and convert the
88ac22817f41544 Darrick J. Wong 2024-11-20  1783   * mapping to written.  Adjust the scan cursor on the way out.
88ac22817f41544 Darrick J. Wong 2024-11-20  1784   */
88ac22817f41544 Darrick J. Wong 2024-11-20  1785  STATIC int
88ac22817f41544 Darrick J. Wong 2024-11-20  1786  xfs_convert_rtbigalloc_mapping(
88ac22817f41544 Darrick J. Wong 2024-11-20  1787  	struct xfs_inode	*ip,
88ac22817f41544 Darrick J. Wong 2024-11-20  1788  	xfs_fileoff_t		*offp,
88ac22817f41544 Darrick J. Wong 2024-11-20  1789  	xfs_fileoff_t		endoff)
88ac22817f41544 Darrick J. Wong 2024-11-20  1790  {
88ac22817f41544 Darrick J. Wong 2024-11-20  1791  	struct xfs_bmbt_irec	irec;
88ac22817f41544 Darrick J. Wong 2024-11-20  1792  	struct xfs_mount	*mp = ip->i_mount;
88ac22817f41544 Darrick J. Wong 2024-11-20  1793  	struct xfs_trans	*tp;
88ac22817f41544 Darrick J. Wong 2024-11-20  1794  	unsigned int		resblks;
88ac22817f41544 Darrick J. Wong 2024-11-20  1795  	int			nmap;
88ac22817f41544 Darrick J. Wong 2024-11-20  1796  	int			error;
88ac22817f41544 Darrick J. Wong 2024-11-20  1797  
88ac22817f41544 Darrick J. Wong 2024-11-20  1798  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
88ac22817f41544 Darrick J. Wong 2024-11-20  1799  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
88ac22817f41544 Darrick J. Wong 2024-11-20  1800  	if (error)
88ac22817f41544 Darrick J. Wong 2024-11-20  1801  		return error;
88ac22817f41544 Darrick J. Wong 2024-11-20  1802  
88ac22817f41544 Darrick J. Wong 2024-11-20  1803  	xfs_ilock(ip, XFS_ILOCK_EXCL);
88ac22817f41544 Darrick J. Wong 2024-11-20  1804  	xfs_trans_ijoin(tp, ip, 0);
88ac22817f41544 Darrick J. Wong 2024-11-20  1805  
88ac22817f41544 Darrick J. Wong 2024-11-20  1806  	/*
88ac22817f41544 Darrick J. Wong 2024-11-20  1807  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
88ac22817f41544 Darrick J. Wong 2024-11-20  1808  	 * to an allocation unit...
88ac22817f41544 Darrick J. Wong 2024-11-20  1809  	 */
88ac22817f41544 Darrick J. Wong 2024-11-20  1810  retry:
88ac22817f41544 Darrick J. Wong 2024-11-20  1811  	nmap = 1;
88ac22817f41544 Darrick J. Wong 2024-11-20  1812  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
88ac22817f41544 Darrick J. Wong 2024-11-20  1813  	if (error)
88ac22817f41544 Darrick J. Wong 2024-11-20  1814  		goto out_cancel;
88ac22817f41544 Darrick J. Wong 2024-11-20  1815  	ASSERT(nmap == 1);
88ac22817f41544 Darrick J. Wong 2024-11-20  1816  	ASSERT(irec.br_startoff == *offp);
88ac22817f41544 Darrick J. Wong 2024-11-20  1817  	if (!xfs_want_convert_rtbigalloc_mapping(mp, &irec)) {
88ac22817f41544 Darrick J. Wong 2024-11-20  1818  		*offp = irec.br_startoff + irec.br_blockcount;
88ac22817f41544 Darrick J. Wong 2024-11-20  1819  		if (*offp >= endoff)
88ac22817f41544 Darrick J. Wong 2024-11-20 @1820  			goto out_cancel;
88ac22817f41544 Darrick J. Wong 2024-11-20  1821  		goto retry;
88ac22817f41544 Darrick J. Wong 2024-11-20  1822  	}
88ac22817f41544 Darrick J. Wong 2024-11-20  1823  
88ac22817f41544 Darrick J. Wong 2024-11-20  1824  	/*
88ac22817f41544 Darrick J. Wong 2024-11-20  1825  	 * ...then write zeroes to the space and change the mapping state to
88ac22817f41544 Darrick J. Wong 2024-11-20  1826  	 * written.  This consolidates the mappings for this allocation unit.
88ac22817f41544 Darrick J. Wong 2024-11-20  1827  	 */
88ac22817f41544 Darrick J. Wong 2024-11-20  1828  	nmap = 1;
88ac22817f41544 Darrick J. Wong 2024-11-20  1829  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
88ac22817f41544 Darrick J. Wong 2024-11-20  1830  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
88ac22817f41544 Darrick J. Wong 2024-11-20  1831  	if (error)
88ac22817f41544 Darrick J. Wong 2024-11-20  1832  		goto out_cancel;
88ac22817f41544 Darrick J. Wong 2024-11-20  1833  	error = xfs_trans_commit(tp);
88ac22817f41544 Darrick J. Wong 2024-11-20  1834  	if (error)
88ac22817f41544 Darrick J. Wong 2024-11-20  1835  		goto out_unlock;
88ac22817f41544 Darrick J. Wong 2024-11-20  1836  
88ac22817f41544 Darrick J. Wong 2024-11-20  1837  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88ac22817f41544 Darrick J. Wong 2024-11-20  1838  
88ac22817f41544 Darrick J. Wong 2024-11-20  1839  	/*
88ac22817f41544 Darrick J. Wong 2024-11-20  1840  	 * If an unwritten mapping was returned, something is very wrong.
88ac22817f41544 Darrick J. Wong 2024-11-20  1841  	 * If no mapping was returned, then bmapi_write thought it performed
88ac22817f41544 Darrick J. Wong 2024-11-20  1842  	 * a short allocation, which should be impossible since we previously
88ac22817f41544 Darrick J. Wong 2024-11-20  1843  	 * queried the mapping and haven't cycled locks since then.  Either
88ac22817f41544 Darrick J. Wong 2024-11-20  1844  	 * way, fail the operation.
88ac22817f41544 Darrick J. Wong 2024-11-20  1845  	 */
88ac22817f41544 Darrick J. Wong 2024-11-20  1846  	if (nmap == 0 || irec.br_state != XFS_EXT_NORM) {
88ac22817f41544 Darrick J. Wong 2024-11-20  1847  		ASSERT(nmap != 0);
88ac22817f41544 Darrick J. Wong 2024-11-20  1848  		ASSERT(irec.br_state == XFS_EXT_NORM);
88ac22817f41544 Darrick J. Wong 2024-11-20  1849  		return -EIO;
88ac22817f41544 Darrick J. Wong 2024-11-20  1850  	}
88ac22817f41544 Darrick J. Wong 2024-11-20  1851  
88ac22817f41544 Darrick J. Wong 2024-11-20  1852  	/* Advance the cursor to the end of the mapping returned. */
88ac22817f41544 Darrick J. Wong 2024-11-20  1853  	*offp = irec.br_startoff + irec.br_blockcount;
88ac22817f41544 Darrick J. Wong 2024-11-20  1854  	return 0;
88ac22817f41544 Darrick J. Wong 2024-11-20  1855  
88ac22817f41544 Darrick J. Wong 2024-11-20  1856  out_cancel:
88ac22817f41544 Darrick J. Wong 2024-11-20  1857  	xfs_trans_cancel(tp);
88ac22817f41544 Darrick J. Wong 2024-11-20  1858  out_unlock:
88ac22817f41544 Darrick J. Wong 2024-11-20  1859  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88ac22817f41544 Darrick J. Wong 2024-11-20  1860  	return error;
88ac22817f41544 Darrick J. Wong 2024-11-20  1861  }
88ac22817f41544 Darrick J. Wong 2024-11-20  1862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
