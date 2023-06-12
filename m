Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B3881F
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 20:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686600258; x=1718136258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KWBYFQrzfODCG5RPWvCrPxYz9Sp1YsfRa5sFGduhBEY=;
  b=Dzb46Ho34VhzDj7Da7be//DPIqjicSnZjofMCXmp2gHo/h9IThrLcJJB
   OFPQe9QbLH965miiQd9V9pN58LLZkLbQf6CpdC/rN405oO/nl+HRcXN3a
   WwbnQRsJ9/qTNFLony/MV3oD9V/JwMUAaBuzlWue3I/+akrx3AydJwxfY
   jK2Doke9ZMQVmmlTSv1xWHgyVZNmNFjzS9vy4gHBZZrsZar1UlopA71fK
   UERYAhhuz8IFzrKIOtSuQDnEodfCDUCE8YjEzRmgi8zvPHGr0gmSDZ+BI
   T6SCUSkdA3T0Bmv6tRP2TCl7i7NhS1jhdZOssFzVvHYf1f5X+Bb+B2NDh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358147050"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="358147050"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 13:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711352431"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="711352431"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 13:04:05 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8nlk-0000ea-2F;
	Mon, 12 Jun 2023 20:04:04 +0000
Date: Tue, 13 Jun 2023 04:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 447/486]
 fs/xfs/libxfs/xfs_refcount.c:2126 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 2067)
Message-ID: <202306130323.5jha3KO8-lkp@intel.com>
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
head:   95a529011812eb85f080eba486dcf05a2beb153d
commit: 565f9b5d43bff0bfeb83aa1a8468c3a69562b8dd [447/486] xfs: refcover CoW leftovers in the realtime volume
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: m68k-randconfig-m041-20230611 (https://download.01.org/0day-ci/archive/20230613/202306130323.5jha3KO8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306130323.5jha3KO8-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:2126 xfs_refcount_recover_group_cow_leftovers() error: we previously assumed 'pag' could be null (see line 2067)

vim +/pag +2126 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  2042  
174edb0e46e520 Darrick J. Wong 2016-10-03  2043  /* Find and remove leftover CoW reservations. */
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2044  static int
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2045  xfs_refcount_recover_group_cow_leftovers(
174edb0e46e520 Darrick J. Wong 2016-10-03  2046  	struct xfs_mount		*mp,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2047  	struct xfs_perag		*pag,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2048  	struct xfs_rtgroup		*rtg)
174edb0e46e520 Darrick J. Wong 2016-10-03  2049  {
174edb0e46e520 Darrick J. Wong 2016-10-03  2050  	struct xfs_trans		*tp;
174edb0e46e520 Darrick J. Wong 2016-10-03  2051  	struct xfs_btree_cur		*cur;
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2052  	struct xfs_buf			*agbp = NULL;
174edb0e46e520 Darrick J. Wong 2016-10-03  2053  	struct xfs_refcount_recovery	*rr, *n;
174edb0e46e520 Darrick J. Wong 2016-10-03  2054  	struct list_head		debris;
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2055  	union xfs_btree_irec		low = {
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2056  		.rc.rc_domain		= XFS_REFC_DOMAIN_COW,
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2057  	};
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2058  	union xfs_btree_irec		high = {
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2059  		.rc.rc_domain		= XFS_REFC_DOMAIN_COW,
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2060  		.rc.rc_startblock	= -1U,
5ac8eb3b4a2cb3 Darrick J. Wong 2023-05-24  2061  	};
174edb0e46e520 Darrick J. Wong 2016-10-03  2062  	xfs_fsblock_t			fsb;
174edb0e46e520 Darrick J. Wong 2016-10-03  2063  	int				error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2064  
f1fdc820784067 Darrick J. Wong 2022-10-27  2065  	/* reflink filesystems mustn't have AGs larger than 2^31-1 blocks */
8b972158afcaa6 Darrick J. Wong 2022-10-10  2066  	BUILD_BUG_ON(XFS_MAX_CRC_AG_BLOCKS >= XFS_REFC_COWFLAG);
565f9b5d43bff0 Darrick J. Wong 2023-03-06 @2067  	if (pag && mp->m_sb.sb_agblocks > XFS_MAX_CRC_AG_BLOCKS)
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2068  		return -EOPNOTSUPP;
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2069  
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2070  	/* rtreflink filesystems can't have rtgroups larger than 2^31-1 blocks */
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2071  	BUILD_BUG_ON(XFS_MAX_RGBLOCKS >= XFS_REFC_COWFLAG);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2072  	if (rtg && mp->m_sb.sb_rgblocks >= XFS_MAX_RGBLOCKS)
174edb0e46e520 Darrick J. Wong 2016-10-03  2073  		return -EOPNOTSUPP;
174edb0e46e520 Darrick J. Wong 2016-10-03  2074  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2075  	INIT_LIST_HEAD(&debris);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2076  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2077  	/*
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2078  	 * In this first part, we use an empty transaction to gather up
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2079  	 * all the leftover CoW extents so that we can subsequently
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2080  	 * delete them.  The empty transaction is used to avoid
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2081  	 * a buffer lock deadlock if there happens to be a loop in the
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2082  	 * refcountbt because we're allowed to re-grab a buffer that is
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2083  	 * already attached to our transaction.  When we're done
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2084  	 * recording the CoW debris we cancel the (empty) transaction
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2085  	 * and everything goes away cleanly.
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2086  	 */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2087  	error = xfs_trans_alloc_empty(mp, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2088  	if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2089  		return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2090  
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2091  	if (rtg) {
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2092  		xfs_rtgroup_lock(NULL, rtg, XFS_RTGLOCK_REFCOUNT);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2093  		cur = xfs_rtrefcountbt_init_cursor(mp, tp, rtg,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2094  				rtg->rtg_refcountip);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2095  	} else {
08d3e84feeb8cb Dave Chinner    2022-07-07  2096  		error = xfs_alloc_read_agf(pag, tp, 0, &agbp);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2097  		if (error)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2098  			goto out_trans;
a81a06211fb43d Dave Chinner    2021-06-02  2099  		cur = xfs_refcountbt_init_cursor(mp, tp, agbp, pag);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2100  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2101  
174edb0e46e520 Darrick J. Wong 2016-10-03  2102  	/* Find all the leftover CoW staging extents. */
174edb0e46e520 Darrick J. Wong 2016-10-03  2103  	error = xfs_btree_query_range(cur, &low, &high,
174edb0e46e520 Darrick J. Wong 2016-10-03  2104  			xfs_refcount_recover_extent, &debris);
ef97ef26d263fb Darrick J. Wong 2018-07-19  2105  	xfs_btree_del_cursor(cur, error);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2106  	if (agbp)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2107  		xfs_trans_brelse(tp, agbp);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2108  	else
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2109  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_REFCOUNT);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2110  	xfs_trans_cancel(tp);
ef97ef26d263fb Darrick J. Wong 2018-07-19  2111  	if (error)
ef97ef26d263fb Darrick J. Wong 2018-07-19  2112  		goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  2113  
174edb0e46e520 Darrick J. Wong 2016-10-03  2114  	/* Now iterate the list to free the leftovers */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2115  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  2116  		/* Set up transaction. */
174edb0e46e520 Darrick J. Wong 2016-10-03  2117  		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0, 0, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2118  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2119  			goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  2120  
174edb0e46e520 Darrick J. Wong 2016-10-03  2121  		/* Free the orphan record */
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2122  		if (rtg)
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2123  			fsb = xfs_rgbno_to_rtb(mp, rtg->rtg_rgno,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2124  					rr->rr_rrec.rc_startblock);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2125  		else
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10 @2126  			fsb = XFS_AGB_TO_FSB(mp, pag->pag_agno,
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2127  					rr->rr_rrec.rc_startblock);
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2128  		xfs_refcount_free_cow_extent(tp, rtg != NULL, fsb,
174edb0e46e520 Darrick J. Wong 2016-10-03  2129  				rr->rr_rrec.rc_blockcount);
174edb0e46e520 Darrick J. Wong 2016-10-03  2130  
174edb0e46e520 Darrick J. Wong 2016-10-03  2131  		/* Free the block. */
7dfee17b13e502 Dave Chinner    2023-06-05  2132  		error = xfs_free_extent_later(tp, fsb,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2133  				rr->rr_rrec.rc_blockcount, NULL,
565f9b5d43bff0 Darrick J. Wong 2023-03-06  2134  				rtg != NULL ? XFS_FREE_EXTENT_REALTIME : 0);
7dfee17b13e502 Dave Chinner    2023-06-05  2135  		if (error)
7dfee17b13e502 Dave Chinner    2023-06-05  2136  			goto out_trans;
174edb0e46e520 Darrick J. Wong 2016-10-03  2137  
174edb0e46e520 Darrick J. Wong 2016-10-03  2138  		error = xfs_trans_commit(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2139  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2140  			goto out_free;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2141  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2142  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2143  		kfree(rr);
6f97077ff6ef28 Darrick J. Wong 2016-10-10  2144  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2145  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2146  	return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2147  out_trans:
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2148  	xfs_trans_cancel(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2149  out_free:
174edb0e46e520 Darrick J. Wong 2016-10-03  2150  	/* Free the leftover list */
174edb0e46e520 Darrick J. Wong 2016-10-03  2151  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  2152  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2153  		kfree(rr);
174edb0e46e520 Darrick J. Wong 2016-10-03  2154  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2155  	return error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2156  }
49db55eca5665e Darrick J. Wong 2018-01-16  2157  

:::::: The code at line 2126 was first introduced by commit
:::::: 9a50ee4f8db6e4dd0d8d757b7adaf0591776860a xfs: track cow/shared record domains explicitly in xfs_refcount_irec

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
