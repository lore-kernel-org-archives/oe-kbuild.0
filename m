Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E32623
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679099848; x=1710635848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrFXNlw5A0N1M+YIovFpIZnv3/FeqBXmC4WWV3jCSeg=;
  b=EBJHvqlwiyb9rzH5S46Y/2UCfKb/qgFBWx4KpmXjqFiM07kTH9R+Sm+b
   zUGgo3LdZc67R2L/nIVg+w38WKEXDrBIwCJw1hnAgvvjagp4rJyiVNrcM
   RMg30QXW8kRvKLeL9P2SQ1RUYbCgBgFrh/Q2Em5TWVNzMpsFaS98xE4d4
   eso2dpT/qj6llYETNADllk/OsbixrLaOeX+6/L+9jKRf3FfpduSAY+NX2
   yR1D35+mPUxBrSt5nRdc1I1agAZbDC96lzST7qGDX1e5tL/YD0ax64dVZ
   digmlyD7R1URnRCTonXZm3dHIoPO4kYPyoLXyoof9tQzCvjBeTePFkrVS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326754203"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="326754203"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 17:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657756192"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="657756192"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Mar 2023 17:37:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdKZZ-0009gk-27;
	Sat, 18 Mar 2023 00:37:25 +0000
Date: Sat, 18 Mar 2023 08:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 463/501]
 fs/xfs/libxfs/xfs_refcount.c:2121 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 2058)
Message-ID: <202303180842.vLmwtNZe-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   0575173bd35d9a7418eaa4ead4126d1c7fe9961c
commit: 1acdcd32165e82fd2246be172b757cfd5ecb856c [463/501] xfs: refcover CoW leftovers in the realtime volume
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180842.vLmwtNZe-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303180842.vLmwtNZe-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:2121 xfs_refcount_recover_group_cow_leftovers() error: we previously assumed 'pag' could be null (see line 2058)

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:163 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:173 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:142 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:152 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +/pag +2121 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  2038  
174edb0e46e520 Darrick J. Wong 2016-10-03  2039  /* Find and remove leftover CoW reservations. */
1acdcd32165e82 Darrick J. Wong 2023-03-06  2040  static int
1acdcd32165e82 Darrick J. Wong 2023-03-06  2041  xfs_refcount_recover_group_cow_leftovers(
174edb0e46e520 Darrick J. Wong 2016-10-03  2042  	struct xfs_mount		*mp,
1acdcd32165e82 Darrick J. Wong 2023-03-06  2043  	struct xfs_perag		*pag,
1acdcd32165e82 Darrick J. Wong 2023-03-06  2044  	struct xfs_rtgroup		*rtg)
174edb0e46e520 Darrick J. Wong 2016-10-03  2045  {
174edb0e46e520 Darrick J. Wong 2016-10-03  2046  	struct xfs_trans		*tp;
174edb0e46e520 Darrick J. Wong 2016-10-03  2047  	struct xfs_btree_cur		*cur;
1acdcd32165e82 Darrick J. Wong 2023-03-06  2048  	struct xfs_buf			*agbp = NULL;
174edb0e46e520 Darrick J. Wong 2016-10-03  2049  	struct xfs_refcount_recovery	*rr, *n;
174edb0e46e520 Darrick J. Wong 2016-10-03  2050  	struct list_head		debris;
174edb0e46e520 Darrick J. Wong 2016-10-03  2051  	union xfs_btree_irec		low;
174edb0e46e520 Darrick J. Wong 2016-10-03  2052  	union xfs_btree_irec		high;
174edb0e46e520 Darrick J. Wong 2016-10-03  2053  	xfs_fsblock_t			fsb;
174edb0e46e520 Darrick J. Wong 2016-10-03  2054  	int				error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2055  
f1fdc820784067 Darrick J. Wong 2022-10-27  2056  	/* reflink filesystems mustn't have AGs larger than 2^31-1 blocks */
8b972158afcaa6 Darrick J. Wong 2022-10-10  2057  	BUILD_BUG_ON(XFS_MAX_CRC_AG_BLOCKS >= XFS_REFC_COWFLAG);
1acdcd32165e82 Darrick J. Wong 2023-03-06 @2058  	if (pag && mp->m_sb.sb_agblocks > XFS_MAX_CRC_AG_BLOCKS)
1acdcd32165e82 Darrick J. Wong 2023-03-06  2059  		return -EOPNOTSUPP;
1acdcd32165e82 Darrick J. Wong 2023-03-06  2060  
1acdcd32165e82 Darrick J. Wong 2023-03-06  2061  	/* rtreflink filesystems can't have rtgroups larger than 2^31-1 blocks */
1acdcd32165e82 Darrick J. Wong 2023-03-06  2062  	BUILD_BUG_ON(XFS_MAX_RGBLOCKS >= XFS_REFC_COWFLAG);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2063  	if (rtg && mp->m_sb.sb_rgblocks >= XFS_MAX_RGBLOCKS)
174edb0e46e520 Darrick J. Wong 2016-10-03  2064  		return -EOPNOTSUPP;
174edb0e46e520 Darrick J. Wong 2016-10-03  2065  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2066  	INIT_LIST_HEAD(&debris);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2067  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2068  	/*
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2069  	 * In this first part, we use an empty transaction to gather up
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2070  	 * all the leftover CoW extents so that we can subsequently
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2071  	 * delete them.  The empty transaction is used to avoid
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2072  	 * a buffer lock deadlock if there happens to be a loop in the
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2073  	 * refcountbt because we're allowed to re-grab a buffer that is
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2074  	 * already attached to our transaction.  When we're done
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2075  	 * recording the CoW debris we cancel the (empty) transaction
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2076  	 * and everything goes away cleanly.
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2077  	 */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2078  	error = xfs_trans_alloc_empty(mp, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2079  	if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2080  		return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2081  
1acdcd32165e82 Darrick J. Wong 2023-03-06  2082  	if (rtg) {
1acdcd32165e82 Darrick J. Wong 2023-03-06  2083  		xfs_rtgroup_lock(NULL, rtg, XFS_RTGLOCK_REFCOUNT);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2084  		cur = xfs_rtrefcountbt_init_cursor(mp, tp, rtg,
1acdcd32165e82 Darrick J. Wong 2023-03-06  2085  				rtg->rtg_refcountip);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2086  	} else {
08d3e84feeb8cb Dave Chinner    2022-07-07  2087  		error = xfs_alloc_read_agf(pag, tp, 0, &agbp);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2088  		if (error)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2089  			goto out_trans;
a81a06211fb43d Dave Chinner    2021-06-02  2090  		cur = xfs_refcountbt_init_cursor(mp, tp, agbp, pag);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2091  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2092  
174edb0e46e520 Darrick J. Wong 2016-10-03  2093  	/* Find all the leftover CoW staging extents. */
174edb0e46e520 Darrick J. Wong 2016-10-03  2094  	memset(&low, 0, sizeof(low));
174edb0e46e520 Darrick J. Wong 2016-10-03  2095  	memset(&high, 0, sizeof(high));
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2096  	low.rc.rc_domain = high.rc.rc_domain = XFS_REFC_DOMAIN_COW;
174edb0e46e520 Darrick J. Wong 2016-10-03  2097  	high.rc.rc_startblock = -1U;
174edb0e46e520 Darrick J. Wong 2016-10-03  2098  	error = xfs_btree_query_range(cur, &low, &high,
174edb0e46e520 Darrick J. Wong 2016-10-03  2099  			xfs_refcount_recover_extent, &debris);
ef97ef26d263fb Darrick J. Wong 2018-07-19  2100  	xfs_btree_del_cursor(cur, error);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2101  	if (agbp)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2102  		xfs_trans_brelse(tp, agbp);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2103  	else
1acdcd32165e82 Darrick J. Wong 2023-03-06  2104  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_REFCOUNT);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2105  	xfs_trans_cancel(tp);
ef97ef26d263fb Darrick J. Wong 2018-07-19  2106  	if (error)
ef97ef26d263fb Darrick J. Wong 2018-07-19  2107  		goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  2108  
174edb0e46e520 Darrick J. Wong 2016-10-03  2109  	/* Now iterate the list to free the leftovers */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2110  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  2111  		/* Set up transaction. */
174edb0e46e520 Darrick J. Wong 2016-10-03  2112  		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0, 0, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2113  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2114  			goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  2115  
174edb0e46e520 Darrick J. Wong 2016-10-03  2116  		/* Free the orphan record */
1acdcd32165e82 Darrick J. Wong 2023-03-06  2117  		if (rtg)
1acdcd32165e82 Darrick J. Wong 2023-03-06  2118  			fsb = xfs_rgbno_to_rtb(mp, rtg->rtg_rgno,
1acdcd32165e82 Darrick J. Wong 2023-03-06  2119  					rr->rr_rrec.rc_startblock);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2120  		else
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10 @2121  			fsb = XFS_AGB_TO_FSB(mp, pag->pag_agno,
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2122  					rr->rr_rrec.rc_startblock);
1acdcd32165e82 Darrick J. Wong 2023-03-06  2123  		xfs_refcount_free_cow_extent(tp, rtg != NULL, fsb,
174edb0e46e520 Darrick J. Wong 2016-10-03  2124  				rr->rr_rrec.rc_blockcount);
174edb0e46e520 Darrick J. Wong 2016-10-03  2125  
174edb0e46e520 Darrick J. Wong 2016-10-03  2126  		/* Free the block. */
4ebc9223d82d75 Darrick J. Wong 2023-03-06  2127  		xfs_free_extent_later(tp, fsb, rr->rr_rrec.rc_blockcount, NULL,
1acdcd32165e82 Darrick J. Wong 2023-03-06  2128  				rtg != NULL ? XFS_FREE_EXTENT_REALTIME : 0);
174edb0e46e520 Darrick J. Wong 2016-10-03  2129  
174edb0e46e520 Darrick J. Wong 2016-10-03  2130  		error = xfs_trans_commit(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2131  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2132  			goto out_free;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2133  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2134  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2135  		kfree(rr);
6f97077ff6ef28 Darrick J. Wong 2016-10-10  2136  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2137  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2138  	return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2139  out_trans:
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2140  	xfs_trans_cancel(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2141  out_free:
174edb0e46e520 Darrick J. Wong 2016-10-03  2142  	/* Free the leftover list */
174edb0e46e520 Darrick J. Wong 2016-10-03  2143  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  2144  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2145  		kfree(rr);
174edb0e46e520 Darrick J. Wong 2016-10-03  2146  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2147  	return error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2148  }
49db55eca5665e Darrick J. Wong 2018-01-16  2149  

:::::: The code at line 2121 was first introduced by commit
:::::: 9a50ee4f8db6e4dd0d8d757b7adaf0591776860a xfs: track cow/shared record domains explicitly in xfs_refcount_irec

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
