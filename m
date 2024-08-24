Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A314D708
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481720; cv=none; b=tck4Hb1hVX2OQAd1TJt4L3xQtAuw6zLer15MjqTSkZaInZo2W2Uhmng8uJT/hlHgNiPCARbx8GZu3OrYUIsaheiVOeGKxfsO59+cclKOuImURb8MrSyPPJkl5GE3vGuIi+MgOtH1HUaYizTwSHfDoF+GLXv+j5pMe9P5qAgCMkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481720; c=relaxed/simple;
	bh=jxxfDeVSrjH5Aa0+rVCPkyHWXFN4njP0DKo8II1XOOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fpgZ1mi8hhY8ZNBVPuW/75ilCucyx1enlQtgtKPyheKkI5spAK9ayEUEaLfkaaK+Rt3pvHCp4N/zUa+LtTN7riBovPbuoTE/F2NftsWpqz/Js4S+2NV6pQT6/dAlOHynPrf4ffg9pCYjMyiHORQKGAVD1P3wg3Xn5u+1PMWp7Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4STQZjp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4STQZjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724481718; x=1756017718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxxfDeVSrjH5Aa0+rVCPkyHWXFN4njP0DKo8II1XOOc=;
  b=B4STQZjpRJ+ISxFIgNpBEA1tgtSGHKXYsLwurvtB2lPaJBLTVJa9XgnH
   vPRt8pv11ktwVMc/A2aQOAe+2/P1muqMQ1fdKqpg2QBlMFPaOEx/titXO
   ujJAg4PST+geL3/GIO0SzOyTSaRTPhi+7uMeAeOa5XehBf+C+k/lc9yTp
   +BZ3KzDFodScQ+dxGOkn4Zkid86ap1pWNMN33AaaO++MGqQj201Lb96A0
   OhpB39Tank3QZczJmK7YU2++JYigxV0UQeeCfvdJxAytsZ3gz3A1ADnG3
   3nJR95IXitf7yyksGvT4m88vKzA14gVITw4KE7hPHNHbQxP+X0/UyRp0m
   g==;
X-CSE-ConnectionGUID: 2m+XeUyDRyWGhN9YO53Xrw==
X-CSE-MsgGUID: AfY7SGskQ6uUoEc3LnJe+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26762419"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="26762419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 23:41:58 -0700
X-CSE-ConnectionGUID: OUufS/OLTNqARM/DR8hpBg==
X-CSE-MsgGUID: Ncmm/8TRSwaeg1+pEVZeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="62725197"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2024 23:41:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shkTB-000EJb-3C;
	Sat, 24 Aug 2024 06:41:54 +0000
Date: Sat, 24 Aug 2024 14:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:timestats-hoist 77/245] fs/xfs/xfs_fsmap.c:826
 xfs_getfsmap_rtdev_rtbitmap() error: uninitialized symbol 'error'.
Message-ID: <202408241445.ziBTqGS9-lkp@intel.com>
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
head:   2672953f103abef74446981c20b0286f4b3f402f
commit: 2f7a595d954c43742bb9dc4259d8cc3c7fed7c6a [77/245] xfs: move RT bitmap and summary information to the rtgroup
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241445.ziBTqGS9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241445.ziBTqGS9-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_fsmap.c:826 xfs_getfsmap_rtdev_rtbitmap() error: uninitialized symbol 'error'.

vim +/error +826 fs/xfs/xfs_fsmap.c

07d879a6b79484 Darrick J. Wong   2024-08-07  742  
07d879a6b79484 Darrick J. Wong   2024-08-07  743  /* Execute a getfsmap query against the realtime device rtbitmap. */
07d879a6b79484 Darrick J. Wong   2024-08-07  744  STATIC int
07d879a6b79484 Darrick J. Wong   2024-08-07  745  xfs_getfsmap_rtdev_rtbitmap(
07d879a6b79484 Darrick J. Wong   2024-08-07  746  	struct xfs_trans		*tp,
07d879a6b79484 Darrick J. Wong   2024-08-07  747  	const struct xfs_fsmap		*keys,
07d879a6b79484 Darrick J. Wong   2024-08-07  748  	struct xfs_getfsmap_info	*info)
07d879a6b79484 Darrick J. Wong   2024-08-07  749  {
07d879a6b79484 Darrick J. Wong   2024-08-07  750  	struct xfs_mount		*mp = tp->t_mountp;
2f7a595d954c43 Christoph Hellwig 2024-08-15  751  	xfs_rtblock_t			start_rtbno, end_rtbno;
2f7a595d954c43 Christoph Hellwig 2024-08-15  752  	xfs_rtxnum_t			start_rtx, end_rtx;
2f7a595d954c43 Christoph Hellwig 2024-08-15  753  	xfs_rgnumber_t			rgno, end_rgno;
2f7a595d954c43 Christoph Hellwig 2024-08-15  754  	struct xfs_rtgroup		*rtg;
07d879a6b79484 Darrick J. Wong   2024-08-07  755  	uint64_t			eofs;
07d879a6b79484 Darrick J. Wong   2024-08-07  756  	int				error;
07d879a6b79484 Darrick J. Wong   2024-08-07  757  
2f7a595d954c43 Christoph Hellwig 2024-08-15  758  	eofs = XFS_FSB_TO_BB(mp, mp->m_sb.sb_rblocks);
07d879a6b79484 Darrick J. Wong   2024-08-07  759  	if (keys[0].fmr_physical >= eofs)
07d879a6b79484 Darrick J. Wong   2024-08-07  760  		return 0;
07d879a6b79484 Darrick J. Wong   2024-08-07  761  
07d879a6b79484 Darrick J. Wong   2024-08-07  762  	info->missing_owner = XFS_FMR_OWN_UNKNOWN;
07d879a6b79484 Darrick J. Wong   2024-08-07  763  
07d879a6b79484 Darrick J. Wong   2024-08-07  764  	/* Adjust the low key if we are continuing from where we left off. */
2f7a595d954c43 Christoph Hellwig 2024-08-15  765  	start_rtbno = xfs_daddr_to_rtb(mp,
2f7a595d954c43 Christoph Hellwig 2024-08-15  766  			keys[0].fmr_physical + keys[0].fmr_length);
07d879a6b79484 Darrick J. Wong   2024-08-07  767  	if (keys[0].fmr_length > 0) {
2f7a595d954c43 Christoph Hellwig 2024-08-15  768  		info->low_daddr = XFS_FSB_TO_BB(mp, start_rtbno);
07d879a6b79484 Darrick J. Wong   2024-08-07  769  		if (info->low_daddr >= eofs)
07d879a6b79484 Darrick J. Wong   2024-08-07  770  			return 0;
07d879a6b79484 Darrick J. Wong   2024-08-07  771  	}
2f7a595d954c43 Christoph Hellwig 2024-08-15  772  	start_rtx = xfs_rtb_to_rtx(mp, start_rtbno);
2f7a595d954c43 Christoph Hellwig 2024-08-15  773  	rgno = xfs_rtb_to_rgno(mp, start_rtbno);
2f7a595d954c43 Christoph Hellwig 2024-08-15  774  	trace_xfs_fsmap_low_key_linear(mp, info->dev, start_rtbno);
07d879a6b79484 Darrick J. Wong   2024-08-07  775  
2f7a595d954c43 Christoph Hellwig 2024-08-15  776  	end_rtbno = xfs_daddr_to_rtb(mp, min(eofs - 1, keys[1].fmr_physical));
2f7a595d954c43 Christoph Hellwig 2024-08-15  777  	end_rgno = xfs_rtb_to_rgno(mp, end_rtbno);
2f7a595d954c43 Christoph Hellwig 2024-08-15  778  	trace_xfs_fsmap_high_key_linear(mp, info->dev, end_rtbno);
07d879a6b79484 Darrick J. Wong   2024-08-07  779  
2f7a595d954c43 Christoph Hellwig 2024-08-15  780  	end_rtx = -1ULL;
07d879a6b79484 Darrick J. Wong   2024-08-07  781  
2f7a595d954c43 Christoph Hellwig 2024-08-15  782  	for_each_rtgroup_range(mp, rgno, end_rgno, rtg) {
2f7a595d954c43 Christoph Hellwig 2024-08-15  783  		if (rgno == end_rgno)
2f7a595d954c43 Christoph Hellwig 2024-08-15  784  			end_rtx = xfs_rtb_to_rtx(mp,
2f7a595d954c43 Christoph Hellwig 2024-08-15  785  					end_rtbno + mp->m_sb.sb_rextsize - 1);
2f7a595d954c43 Christoph Hellwig 2024-08-15  786  
2f7a595d954c43 Christoph Hellwig 2024-08-15  787  		info->rtg = rtg;
2f7a595d954c43 Christoph Hellwig 2024-08-15  788  		xfs_rtgroup_lock(rtg, XFS_RTGLOCK_BITMAP_SHARED);
2f7a595d954c43 Christoph Hellwig 2024-08-15  789  		error = xfs_rtalloc_query_range(rtg, tp, start_rtx, end_rtx,
2f7a595d954c43 Christoph Hellwig 2024-08-15  790  				xfs_getfsmap_rtdev_rtbitmap_helper, info);
07d879a6b79484 Darrick J. Wong   2024-08-07  791  		if (error)
2f7a595d954c43 Christoph Hellwig 2024-08-15  792  			break;
07d879a6b79484 Darrick J. Wong   2024-08-07  793  
07d879a6b79484 Darrick J. Wong   2024-08-07  794  		/*
2f7a595d954c43 Christoph Hellwig 2024-08-15  795  		 * Report any gaps at the end of the rtbitmap by simulating a
2f7a595d954c43 Christoph Hellwig 2024-08-15  796  		 * zero-length free extent starting at the rtx after the end
2f7a595d954c43 Christoph Hellwig 2024-08-15  797  		 * of the query range.
07d879a6b79484 Darrick J. Wong   2024-08-07  798  		 */
2f7a595d954c43 Christoph Hellwig 2024-08-15  799  		if (rgno == end_rgno) {
2f7a595d954c43 Christoph Hellwig 2024-08-15  800  			struct xfs_rtalloc_rec	ahigh = {
2f7a595d954c43 Christoph Hellwig 2024-08-15  801  				.ar_startext	= min(end_rtx + 1,
2f7a595d954c43 Christoph Hellwig 2024-08-15  802  						      rtg->rtg_extents),
2f7a595d954c43 Christoph Hellwig 2024-08-15  803  			};
07d879a6b79484 Darrick J. Wong   2024-08-07  804  
2f7a595d954c43 Christoph Hellwig 2024-08-15  805  			info->last = true;
2f7a595d954c43 Christoph Hellwig 2024-08-15  806  			error = xfs_getfsmap_rtdev_rtbitmap_helper(rtg, tp,
2f7a595d954c43 Christoph Hellwig 2024-08-15  807  					&ahigh, info);
07d879a6b79484 Darrick J. Wong   2024-08-07  808  			if (error)
2f7a595d954c43 Christoph Hellwig 2024-08-15  809  				break;
2f7a595d954c43 Christoph Hellwig 2024-08-15  810  		}
2f7a595d954c43 Christoph Hellwig 2024-08-15  811  
2f7a595d954c43 Christoph Hellwig 2024-08-15  812  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP_SHARED);
2f7a595d954c43 Christoph Hellwig 2024-08-15  813  		info->rtg = NULL;
2f7a595d954c43 Christoph Hellwig 2024-08-15  814  		start_rtx = 0;
2f7a595d954c43 Christoph Hellwig 2024-08-15  815  	}
2f7a595d954c43 Christoph Hellwig 2024-08-15  816  
2f7a595d954c43 Christoph Hellwig 2024-08-15  817  	if (info->rtg) {
2f7a595d954c43 Christoph Hellwig 2024-08-15  818  		xfs_rtgroup_unlock(info->rtg, XFS_RTGLOCK_BITMAP_SHARED);
2f7a595d954c43 Christoph Hellwig 2024-08-15  819  		xfs_rtgroup_rele(info->rtg);
2f7a595d954c43 Christoph Hellwig 2024-08-15  820  		info->rtg = NULL;
2f7a595d954c43 Christoph Hellwig 2024-08-15  821  	} else if (rtg) {
2f7a595d954c43 Christoph Hellwig 2024-08-15  822  		/* loop termination case */
2f7a595d954c43 Christoph Hellwig 2024-08-15  823  		xfs_rtgroup_rele(rtg);
2f7a595d954c43 Christoph Hellwig 2024-08-15  824  	}
2f7a595d954c43 Christoph Hellwig 2024-08-15  825  
07d879a6b79484 Darrick J. Wong   2024-08-07 @826  	return error;
07d879a6b79484 Darrick J. Wong   2024-08-07  827  }
07d879a6b79484 Darrick J. Wong   2024-08-07  828  #endif /* CONFIG_XFS_RT */
07d879a6b79484 Darrick J. Wong   2024-08-07  829  

:::::: The code at line 826 was first introduced by commit
:::::: 07d879a6b79484ba5c403e00abae6c52ac63ad6e xfs: rearrange xfs_fsmap.c a little bit

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
