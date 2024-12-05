Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85611187
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388273; cv=none; b=P7FvtWWxaY9BhSnxR3dCsndV69lktmC3WB3EtDRYklyBjiid4za8zNDxjjTnDZ3/8IqUzs0sawwQ39vsHFwQjBFLph3Mmiv9igHA8ejG4mRA1rq+GYthQrV2r/2rTiCd2BpSMvccAaApzYeHYbIL8e+CZREcEGoVX21q29Y4p8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388273; c=relaxed/simple;
	bh=EHjjlAsbHZQiJSNmR7G6/EcpGO6be+12LBF1FPZYTT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipr9F0wCnpBckAqADtugkHZuJGvm4D8BkuBOHwnRg76Q9iVoSGGtAKYUcyhpEbl+GyRcjfeCzkUQ4h/wUDYRnjFy3BVsX9ZzlIODyExNEC3hduc6EjLjyoc+akPu9GitrmPnb9dPKN/qql3JtAUl9737FtCAVvuEx8D61eHvefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrAB+N+u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrAB+N+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733388272; x=1764924272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHjjlAsbHZQiJSNmR7G6/EcpGO6be+12LBF1FPZYTT8=;
  b=QrAB+N+u2omJYTAnEky5TtpWl7zep8524bMSL3B/WDm0vd30DsifTrpy
   mAqWxL15ocDdsZ6NbkJjHp2mkr7SMeypR8W3K7cT9D3MJ0a5XAEcvOsnH
   pdsQZlJJxnZcRqzb8jG00c4RJlHQSW5+oXsktGibOtRo/8XNQEW8E412L
   6d6YEL8V1E4iw/PQI2MDjZBKg7x+d6E8lLT8ujQf041zxFJ2b2yTF/BD0
   zRmMpFFOPWADxr8KJXYZj+VIL7iSd0VqSSYWTvPjuyJCDh8K2f5aiTszX
   FUNmeYLHCqfi1sTer76Y+LtgTug6xx9bx1ECzu1REVGjayXYBnO4c7Z0f
   w==;
X-CSE-ConnectionGUID: ecBVPkgeT6Cb186JtDFPHA==
X-CSE-MsgGUID: Q0vY7tZLRlW47Dv+7R+alQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51104412"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51104412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:44:31 -0800
X-CSE-ConnectionGUID: Tgh2Fz3DQw+P1pfk3isHvQ==
X-CSE-MsgGUID: Yp0VwHjQQ1iFObw4giM8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93917516"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2024 00:44:30 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ7TH-0003z3-2l;
	Thu, 05 Dec 2024 08:44:27 +0000
Date: Thu, 5 Dec 2024 16:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:health-monitoring 146/163] fs/xfs/xfs_bmap_util.c:2094
 xfs_map_free_extent() warn: missing error code 'error'
Message-ID: <202412051654.UTzlh6bp-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   3ef6d3267cdc0cf4ed98d255efb948c8d404eaf9
commit: eff21deec6e88fcbd702c5cf4eaae352fbf08202 [146/163] xfs: add an ioctl to map free space into a file
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051654.UTzlh6bp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412051654.UTzlh6bp-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:2094 xfs_map_free_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_bmap_util.c:1825 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'

vim +/error +2094 fs/xfs/xfs_bmap_util.c

eff21deec6e88fc Darrick J. Wong 2024-11-20  2063  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2064  /* Find a free extent in this AG and map it into the file. */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2065  STATIC int
eff21deec6e88fc Darrick J. Wong 2024-11-20  2066  xfs_map_free_extent(
eff21deec6e88fc Darrick J. Wong 2024-11-20  2067  	struct xfs_inode	*ip,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2068  	struct xfs_perag	*pag,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2069  	xfs_agblock_t		*cursor,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2070  	xfs_agblock_t		end_agbno,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2071  	xfs_agblock_t		*last_enospc_agbno)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2072  {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2073  	struct xfs_bmbt_irec	irec;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2074  	struct xfs_mount	*mp = ip->i_mount;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2075  	struct xfs_trans	*tp;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2076  	loff_t			endpos;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2077  	xfs_extlen_t		free_len, map_len;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2078  	int			error;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2079  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2080  	if (fatal_signal_pending(current))
eff21deec6e88fc Darrick J. Wong 2024-11-20  2081  		return -EINTR;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2082  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2083  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2084  			&tp);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2085  	if (error)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2086  		return error;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2087  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2088  	error = xfs_alloc_find_freesp(tp, pag, cursor, end_agbno, &free_len);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2089  	if (error)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2090  		goto out_cancel;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2091  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2092  	/* Bail out if the cursor is beyond what we asked for. */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2093  	if (*cursor >= end_agbno)
eff21deec6e88fc Darrick J. Wong 2024-11-20 @2094  		goto out_cancel;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2095  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2096  	error = xfs_map_free_reserve_more(tp, ip, &free_len);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2097  	if (error)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2098  		goto out_cancel;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2099  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2100  	map_len = free_len;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2101  	do {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2102  		error = xfs_map_free_ag_extent(tp, ip, pag, *cursor, map_len,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2103  				&irec);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2104  		if (error == -EAGAIN) {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2105  			/* Failed to map space but were told to try again. */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2106  			error = xfs_trans_commit(tp);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2107  			goto out;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2108  		}
eff21deec6e88fc Darrick J. Wong 2024-11-20  2109  		if (error != -ENOSPC)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2110  			break;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2111  		/*
eff21deec6e88fc Darrick J. Wong 2024-11-20  2112  		 * If we can't get the space, try asking for successively less
eff21deec6e88fc Darrick J. Wong 2024-11-20  2113  		 * space in case we're bumping up against per-AG metadata
eff21deec6e88fc Darrick J. Wong 2024-11-20  2114  		 * reservation limits.
eff21deec6e88fc Darrick J. Wong 2024-11-20  2115  		 */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2116  		map_len >>= 1;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2117  	} while (map_len > 0);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2118  	if (error == -ENOSPC) {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2119  		if (*last_enospc_agbno != *cursor) {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2120  			/*
eff21deec6e88fc Darrick J. Wong 2024-11-20  2121  			 * However, backing off on the size of the mapping
eff21deec6e88fc Darrick J. Wong 2024-11-20  2122  			 * request might not work if an AGFL fixup allocated
eff21deec6e88fc Darrick J. Wong 2024-11-20  2123  			 * the block at *cursor.  The first time this happens,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2124  			 * remember that we ran out of space here, and try
eff21deec6e88fc Darrick J. Wong 2024-11-20  2125  			 * again.
eff21deec6e88fc Darrick J. Wong 2024-11-20  2126  			 */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2127  			*last_enospc_agbno = *cursor;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2128  		} else {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2129  			/*
eff21deec6e88fc Darrick J. Wong 2024-11-20  2130  			 * If we hit this a second time on the same extent,
eff21deec6e88fc Darrick J. Wong 2024-11-20  2131  			 * then it's likely that we're bumping up against
eff21deec6e88fc Darrick J. Wong 2024-11-20  2132  			 * per-AG space reservation limits.  Skip to the next
eff21deec6e88fc Darrick J. Wong 2024-11-20  2133  			 * extent.
eff21deec6e88fc Darrick J. Wong 2024-11-20  2134  			 */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2135  			*cursor += free_len;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2136  		}
eff21deec6e88fc Darrick J. Wong 2024-11-20  2137  		error = 0;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2138  		goto out_cancel;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2139  	}
eff21deec6e88fc Darrick J. Wong 2024-11-20  2140  	if (error)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2141  		goto out_cancel;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2142  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2143  	/* Update isize if needed. */
eff21deec6e88fc Darrick J. Wong 2024-11-20  2144  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2145  	if (endpos > i_size_read(VFS_I(ip))) {
eff21deec6e88fc Darrick J. Wong 2024-11-20  2146  		i_size_write(VFS_I(ip), endpos);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2147  		ip->i_disk_size = endpos;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2148  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2149  	}
eff21deec6e88fc Darrick J. Wong 2024-11-20  2150  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2151  	error = xfs_trans_commit(tp);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2152  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2153  	if (error)
eff21deec6e88fc Darrick J. Wong 2024-11-20  2154  		return error;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2155  
eff21deec6e88fc Darrick J. Wong 2024-11-20  2156  	*cursor += irec.br_blockcount;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2157  	return 0;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2158  out_cancel:
eff21deec6e88fc Darrick J. Wong 2024-11-20  2159  	xfs_trans_cancel(tp);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2160  out:
eff21deec6e88fc Darrick J. Wong 2024-11-20  2161  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
eff21deec6e88fc Darrick J. Wong 2024-11-20  2162  	return error;
eff21deec6e88fc Darrick J. Wong 2024-11-20  2163  }
eff21deec6e88fc Darrick J. Wong 2024-11-20  2164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
