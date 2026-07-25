Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2F4315A
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785021626; cv=none; b=UbcJ9XmgmjDOGbYELWqNENyOb8l9iIhP2KdKZceKXABWi3pl4icMN/zilLIaxCDat1p65XLIsdr1Ll0nQvLKqovC1Atk8irriECqAh4tHA30kITjim1xcfGYM8pyu2W5FTUa0rR4/nzY8ElKjJunaWmMzzO/QZr/LpRIq7ij2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785021626; c=relaxed/simple;
	bh=yJ9/83syhyqh6nSmedt1f8U4Jx32iddxM1Ft2FZFYiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XQpw1K54dpBFVG3BweJehiQ54ZNJZ3s4sv60CHXFXcg6h91e2hgCX3XPxOrS5ojIa1SXKSn2z+e44tq7OyZKSwxHe2ayfdBUAFJwxT9MEXhbgDKxu9B8OHnFggmI/PdZZfWsEhQq2fXc0sN075/CFpCFALleRvfj83gm84g65QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5MOR6TT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5MOR6TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785021624; x=1816557624;
  h=date:from:to:cc:subject:message-id;
  bh=yJ9/83syhyqh6nSmedt1f8U4Jx32iddxM1Ft2FZFYiY=;
  b=T5MOR6TTCNKPo5UkRNZ4VfxVSEOFBirHB29JSKReJE1g4k/G1JwWYn7f
   QmTl4x4ThaX/LkWV2/UbuQMG+kWQQd0bbfxA5wOy2yznjprbvkPSBQapu
   Fsx0BKpdSJ3CQJHmHNOISwFn7SWIvDxlqJTEQpbU1VjRPyxmNzBGG1+XF
   5Z/kopZMMiohR2gyh7QKlijcTV16uUzoMJM5NQTztvcvlUau5+nSH0rXC
   OL/TQsIRbLDSUqAhurlwI5PpPByUurPsqvrvEGtAMkLNWXY2aRI/gUBDb
   tk8oL3oNgF1sI2y89GXIM6morxx2/vF+bGZpTvMReIB2FhtofxZsWG6br
   w==;
X-CSE-ConnectionGUID: ks+gsF8qQPySiG68ztp3rQ==
X-CSE-MsgGUID: Pf34lJa2R1aedNqCd+Loiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89313134"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="89313134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 16:20:23 -0700
X-CSE-ConnectionGUID: iD1NCWK8RDivZIj16/DxQg==
X-CSE-MsgGUID: HQEICoE4RuOUgmLSJC2gyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="255120453"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jul 2026 16:20:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnlfH-00000000c83-3WFM;
	Sat, 25 Jul 2026 23:20:19 +0000
Date: Sun, 26 Jul 2026 07:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:6.18/linux 1/1] fs/xfs/scrub/quota.c:259
 xchk_quota_item() warn: inconsistent returns '&dq->q_qlock'.
Message-ID: <202607260640.ROWROdpm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: 3b0c3414b308e6822cda90bf99f7eac94d4cca2b [1/1] xfs: scrub: unlock dquot before early return in quota scrub
:::::: branch date: 9 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260640.ROWROdpm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260640.ROWROdpm-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/quota.c:259 xchk_quota_item() warn: inconsistent returns '&dq->q_qlock'.

vim +259 fs/xfs/scrub/quota.c

774b5c0a515289 Darrick J. Wong 2023-12-15  137  
c2fc338c87a31f Darrick J. Wong 2017-10-17  138  /* Scrub the fields in an individual quota item. */
554ba965407e90 Darrick J. Wong 2018-05-04  139  STATIC int
c517b3aa02cff1 Darrick J. Wong 2018-07-19  140  xchk_quota_item(
21d7500929c8a0 Darrick J. Wong 2023-12-15  141  	struct xchk_quota_info	*sqi,
21d7500929c8a0 Darrick J. Wong 2023-12-15  142  	struct xfs_dquot	*dq)
c2fc338c87a31f Darrick J. Wong 2017-10-17  143  {
1d8a748a8aa94a Darrick J. Wong 2018-07-19  144  	struct xfs_scrub	*sc = sqi->sc;
c2fc338c87a31f Darrick J. Wong 2017-10-17  145  	struct xfs_mount	*mp = sc->mp;
c2fc338c87a31f Darrick J. Wong 2017-10-17  146  	struct xfs_quotainfo	*qi = mp->m_quotainfo;
c2fc338c87a31f Darrick J. Wong 2017-10-17  147  	xfs_fileoff_t		offset;
c2fc338c87a31f Darrick J. Wong 2017-10-17  148  	xfs_ino_t		fs_icount;
8ef34723eff088 Darrick J. Wong 2019-11-05  149  	int			error = 0;
8ef34723eff088 Darrick J. Wong 2019-11-05  150  
8ef34723eff088 Darrick J. Wong 2019-11-05  151  	if (xchk_should_terminate(sc, &error))
0a713bd41ea2b1 Darrick J. Wong 2022-11-06  152  		return error;
c2fc338c87a31f Darrick J. Wong 2017-10-17  153  
7d1f0e167a067e Darrick J. Wong 2023-12-15  154  	/*
7d1f0e167a067e Darrick J. Wong 2023-12-15  155  	 * We want to validate the bmap record for the storage backing this
7d1f0e167a067e Darrick J. Wong 2023-12-15  156  	 * dquot, so we need to lock the dquot and the quota file.  For quota
7d1f0e167a067e Darrick J. Wong 2023-12-15  157  	 * operations, the locking order is first the ILOCK and then the dquot.
7d1f0e167a067e Darrick J. Wong 2023-12-15  158  	 * However, dqiterate gave us a locked dquot, so drop the dquot lock to
7d1f0e167a067e Darrick J. Wong 2023-12-15  159  	 * get the ILOCK.
7d1f0e167a067e Darrick J. Wong 2023-12-15  160  	 */
7d1f0e167a067e Darrick J. Wong 2023-12-15  161  	xfs_dqunlock(dq);
7d1f0e167a067e Darrick J. Wong 2023-12-15  162  	xchk_ilock(sc, XFS_ILOCK_SHARED);
7d1f0e167a067e Darrick J. Wong 2023-12-15  163  	xfs_dqlock(dq);
7d1f0e167a067e Darrick J. Wong 2023-12-15  164  
c2fc338c87a31f Darrick J. Wong 2017-10-17  165  	/*
554ba965407e90 Darrick J. Wong 2018-05-04  166  	 * Except for the root dquot, the actual dquot we got must either have
554ba965407e90 Darrick J. Wong 2018-05-04  167  	 * the same or higher id as we saw before.
c2fc338c87a31f Darrick J. Wong 2017-10-17  168  	 */
c51df7334167e4 Darrick J. Wong 2020-07-14  169  	offset = dq->q_id / qi->qi_dqperchunk;
c51df7334167e4 Darrick J. Wong 2020-07-14  170  	if (dq->q_id && dq->q_id <= sqi->last_id)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  171  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  172  
c51df7334167e4 Darrick J. Wong 2020-07-14  173  	sqi->last_id = dq->q_id;
554ba965407e90 Darrick J. Wong 2018-05-04  174  
7d1f0e167a067e Darrick J. Wong 2023-12-15  175  	error = xchk_quota_item_bmap(sc, dq, offset);
7d1f0e167a067e Darrick J. Wong 2023-12-15  176  	xchk_iunlock(sc, XFS_ILOCK_SHARED);
3b0c3414b308e6 hongao          2026-03-12  177  	if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, offset, &error)) {
3b0c3414b308e6 hongao          2026-03-12  178  		mutex_unlock(&dq->q_qlock);
7d1f0e167a067e Darrick J. Wong 2023-12-15  179  		return error;
3b0c3414b308e6 hongao          2026-03-12  180  	}
7d1f0e167a067e Darrick J. Wong 2023-12-15  181  
c2fc338c87a31f Darrick J. Wong 2017-10-17  182  	/*
c2fc338c87a31f Darrick J. Wong 2017-10-17  183  	 * Warn if the hard limits are larger than the fs.
c2fc338c87a31f Darrick J. Wong 2017-10-17  184  	 * Administrators can do this, though in production this seems
c2fc338c87a31f Darrick J. Wong 2017-10-17  185  	 * suspect, which is why we flag it for review.
c2fc338c87a31f Darrick J. Wong 2017-10-17  186  	 *
c2fc338c87a31f Darrick J. Wong 2017-10-17  187  	 * Complain about corruption if the soft limit is greater than
c2fc338c87a31f Darrick J. Wong 2017-10-17  188  	 * the hard limit.
c2fc338c87a31f Darrick J. Wong 2017-10-17  189  	 */
d3537cf93e5e2f Darrick J. Wong 2020-07-14  190  	if (dq->q_blk.hardlimit > mp->m_sb.sb_dblocks)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  191  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
d3537cf93e5e2f Darrick J. Wong 2020-07-14  192  	if (dq->q_blk.softlimit > dq->q_blk.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  193  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  194  
d3537cf93e5e2f Darrick J. Wong 2020-07-14  195  	if (dq->q_ino.hardlimit > M_IGEO(mp)->maxicount)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  196  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
d3537cf93e5e2f Darrick J. Wong 2020-07-14  197  	if (dq->q_ino.softlimit > dq->q_ino.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  198  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  199  
d3537cf93e5e2f Darrick J. Wong 2020-07-14  200  	if (dq->q_rtb.hardlimit > mp->m_sb.sb_rblocks)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  201  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
d3537cf93e5e2f Darrick J. Wong 2020-07-14  202  	if (dq->q_rtb.softlimit > dq->q_rtb.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  203  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  204  
c2fc338c87a31f Darrick J. Wong 2017-10-17  205  	/* Check the resource counts. */
c2fc338c87a31f Darrick J. Wong 2017-10-17  206  	fs_icount = percpu_counter_sum(&mp->m_icount);
c2fc338c87a31f Darrick J. Wong 2017-10-17  207  
c2fc338c87a31f Darrick J. Wong 2017-10-17  208  	/*
c2fc338c87a31f Darrick J. Wong 2017-10-17  209  	 * Check that usage doesn't exceed physical limits.  However, on
c2fc338c87a31f Darrick J. Wong 2017-10-17  210  	 * a reflink filesystem we're allowed to exceed physical space
c2fc338c87a31f Darrick J. Wong 2017-10-17  211  	 * if there are no quota limits.
c2fc338c87a31f Darrick J. Wong 2017-10-17  212  	 */
ebd9027d088b3a Dave Chinner    2021-08-18  213  	if (xfs_has_reflink(mp)) {
be37d40c1ba0b5 Darrick J. Wong 2020-07-14  214  		if (mp->m_sb.sb_dblocks < dq->q_blk.count)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  215  			xchk_fblock_set_warning(sc, XFS_DATA_FORK,
c2fc338c87a31f Darrick J. Wong 2017-10-17  216  					offset);
48bc170f2cb543 Darrick J. Wong 2024-11-20  217  		if (mp->m_sb.sb_rblocks < dq->q_rtb.count)
48bc170f2cb543 Darrick J. Wong 2024-11-20  218  			xchk_fblock_set_warning(sc, XFS_DATA_FORK,
48bc170f2cb543 Darrick J. Wong 2024-11-20  219  					offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  220  	} else {
be37d40c1ba0b5 Darrick J. Wong 2020-07-14  221  		if (mp->m_sb.sb_dblocks < dq->q_blk.count)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  222  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK,
c2fc338c87a31f Darrick J. Wong 2017-10-17  223  					offset);
48bc170f2cb543 Darrick J. Wong 2024-11-20  224  		if (mp->m_sb.sb_rblocks < dq->q_rtb.count)
48bc170f2cb543 Darrick J. Wong 2024-11-20  225  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK,
48bc170f2cb543 Darrick J. Wong 2024-11-20  226  					offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  227  	}
48bc170f2cb543 Darrick J. Wong 2024-11-20  228  	if (dq->q_ino.count > fs_icount)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  229  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, offset);
c2fc338c87a31f Darrick J. Wong 2017-10-17  230  
c2fc338c87a31f Darrick J. Wong 2017-10-17  231  	/*
c2fc338c87a31f Darrick J. Wong 2017-10-17  232  	 * We can violate the hard limits if the admin suddenly sets a
c2fc338c87a31f Darrick J. Wong 2017-10-17  233  	 * lower limit than the actual usage.  However, we flag it for
c2fc338c87a31f Darrick J. Wong 2017-10-17  234  	 * admin review.
c2fc338c87a31f Darrick J. Wong 2017-10-17  235  	 */
c51df7334167e4 Darrick J. Wong 2020-07-14  236  	if (dq->q_id == 0)
c51df7334167e4 Darrick J. Wong 2020-07-14  237  		goto out;
c51df7334167e4 Darrick J. Wong 2020-07-14  238  
d3537cf93e5e2f Darrick J. Wong 2020-07-14  239  	if (dq->q_blk.hardlimit != 0 &&
be37d40c1ba0b5 Darrick J. Wong 2020-07-14  240  	    dq->q_blk.count > dq->q_blk.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  241  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
c51df7334167e4 Darrick J. Wong 2020-07-14  242  
d3537cf93e5e2f Darrick J. Wong 2020-07-14  243  	if (dq->q_ino.hardlimit != 0 &&
be37d40c1ba0b5 Darrick J. Wong 2020-07-14  244  	    dq->q_ino.count > dq->q_ino.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  245  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
c51df7334167e4 Darrick J. Wong 2020-07-14  246  
d3537cf93e5e2f Darrick J. Wong 2020-07-14  247  	if (dq->q_rtb.hardlimit != 0 &&
be37d40c1ba0b5 Darrick J. Wong 2020-07-14  248  	    dq->q_rtb.count > dq->q_rtb.hardlimit)
c517b3aa02cff1 Darrick J. Wong 2018-07-19  249  		xchk_fblock_set_warning(sc, XFS_DATA_FORK, offset);
554ba965407e90 Darrick J. Wong 2018-05-04  250  
774b5c0a515289 Darrick J. Wong 2023-12-15  251  	xchk_quota_item_timer(sc, offset, &dq->q_blk);
774b5c0a515289 Darrick J. Wong 2023-12-15  252  	xchk_quota_item_timer(sc, offset, &dq->q_ino);
774b5c0a515289 Darrick J. Wong 2023-12-15  253  	xchk_quota_item_timer(sc, offset, &dq->q_rtb);
774b5c0a515289 Darrick J. Wong 2023-12-15  254  
c51df7334167e4 Darrick J. Wong 2020-07-14  255  out:
8ef34723eff088 Darrick J. Wong 2019-11-05  256  	if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
05237032fdec14 Darrick J. Wong 2021-03-22  257  		return -ECANCELED;
8ef34723eff088 Darrick J. Wong 2019-11-05  258  
554ba965407e90 Darrick J. Wong 2018-05-04 @259  	return 0;
c2fc338c87a31f Darrick J. Wong 2017-10-17  260  }
c2fc338c87a31f Darrick J. Wong 2017-10-17  261  

:::::: The code at line 259 was first introduced by commit
:::::: 554ba965407e90fed381a93f230b6ca675cfcd07 xfs: refactor dquot iteration

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
