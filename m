Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813BCEC9
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 03:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683776593; x=1715312593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNbKfFsc75DWyUZ8Azp5KZ/UrcUh9lWBYCVn/+hsR48=;
  b=OmUrsdT7PUoKBZAETkQtYLnZzDq3fWUM6sLqHIo1KOByj6Syu4qhc+/X
   mwU7vxL+pMtMX6sftNEdaOvC4DqAHmFxYAYUWhmq4oxUeE3DEWhT8dNin
   yAMCAu23+G8tw7ZS6w+nAyuR3oBWSU81ZFEbI7kXUdJFB0cEOeTN4vs+e
   8Z6RnhN0VOA4kosR3od10JD079eftjEYlcBweZmDmn9YoYlXJxEfRL2bn
   S1dP8bPYh40IbVKILDJp42tC+2BPjnTbgQabHSozVGuCJ1QA4vlDnQJ5w
   SLZBtvvW92SSrlGMBmhTVjfweuNB3NjYduyejbtYOGiT88RwDGelPUDQL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850023"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="347850023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 20:42:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789202258"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="789202258"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 May 2023 20:42:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwxCd-0003kW-38;
	Thu, 11 May 2023 03:42:51 +0000
Date: Thu, 11 May 2023 11:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 505/544]
 fs/xfs/libxfs/xfs_refcount.c:2121 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 2058)
Message-ID: <202305111126.XMjmVEDO-lkp@intel.com>
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
head:   41a11a682e8c2e7d39d583c45a6b8856afc037c8
commit: 94009f3ed913061aa9a27df6f35422744a63a3f0 [505/544] xfs: refcover CoW leftovers in the realtime volume
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111126.XMjmVEDO-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305111126.XMjmVEDO-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:2121 xfs_refcount_recover_group_cow_leftovers() error: we previously assumed 'pag' could be null (see line 2058)

vim +/pag +2121 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  2038  
174edb0e46e520 Darrick J. Wong 2016-10-03  2039  /* Find and remove leftover CoW reservations. */
94009f3ed91306 Darrick J. Wong 2023-03-06  2040  static int
94009f3ed91306 Darrick J. Wong 2023-03-06  2041  xfs_refcount_recover_group_cow_leftovers(
174edb0e46e520 Darrick J. Wong 2016-10-03  2042  	struct xfs_mount		*mp,
94009f3ed91306 Darrick J. Wong 2023-03-06  2043  	struct xfs_perag		*pag,
94009f3ed91306 Darrick J. Wong 2023-03-06  2044  	struct xfs_rtgroup		*rtg)
174edb0e46e520 Darrick J. Wong 2016-10-03  2045  {
174edb0e46e520 Darrick J. Wong 2016-10-03  2046  	struct xfs_trans		*tp;
174edb0e46e520 Darrick J. Wong 2016-10-03  2047  	struct xfs_btree_cur		*cur;
94009f3ed91306 Darrick J. Wong 2023-03-06  2048  	struct xfs_buf			*agbp = NULL;
174edb0e46e520 Darrick J. Wong 2016-10-03  2049  	struct xfs_refcount_recovery	*rr, *n;
174edb0e46e520 Darrick J. Wong 2016-10-03  2050  	struct list_head		debris;
174edb0e46e520 Darrick J. Wong 2016-10-03  2051  	union xfs_btree_irec		low;
174edb0e46e520 Darrick J. Wong 2016-10-03  2052  	union xfs_btree_irec		high;
174edb0e46e520 Darrick J. Wong 2016-10-03  2053  	xfs_fsblock_t			fsb;
174edb0e46e520 Darrick J. Wong 2016-10-03  2054  	int				error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2055  
f1fdc820784067 Darrick J. Wong 2022-10-27  2056  	/* reflink filesystems mustn't have AGs larger than 2^31-1 blocks */
8b972158afcaa6 Darrick J. Wong 2022-10-10  2057  	BUILD_BUG_ON(XFS_MAX_CRC_AG_BLOCKS >= XFS_REFC_COWFLAG);
94009f3ed91306 Darrick J. Wong 2023-03-06 @2058  	if (pag && mp->m_sb.sb_agblocks > XFS_MAX_CRC_AG_BLOCKS)
94009f3ed91306 Darrick J. Wong 2023-03-06  2059  		return -EOPNOTSUPP;
94009f3ed91306 Darrick J. Wong 2023-03-06  2060  
94009f3ed91306 Darrick J. Wong 2023-03-06  2061  	/* rtreflink filesystems can't have rtgroups larger than 2^31-1 blocks */
94009f3ed91306 Darrick J. Wong 2023-03-06  2062  	BUILD_BUG_ON(XFS_MAX_RGBLOCKS >= XFS_REFC_COWFLAG);
94009f3ed91306 Darrick J. Wong 2023-03-06  2063  	if (rtg && mp->m_sb.sb_rgblocks >= XFS_MAX_RGBLOCKS)
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
94009f3ed91306 Darrick J. Wong 2023-03-06  2082  	if (rtg) {
94009f3ed91306 Darrick J. Wong 2023-03-06  2083  		xfs_rtgroup_lock(NULL, rtg, XFS_RTGLOCK_REFCOUNT);
94009f3ed91306 Darrick J. Wong 2023-03-06  2084  		cur = xfs_rtrefcountbt_init_cursor(mp, tp, rtg,
94009f3ed91306 Darrick J. Wong 2023-03-06  2085  				rtg->rtg_refcountip);
94009f3ed91306 Darrick J. Wong 2023-03-06  2086  	} else {
08d3e84feeb8cb Dave Chinner    2022-07-07  2087  		error = xfs_alloc_read_agf(pag, tp, 0, &agbp);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2088  		if (error)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2089  			goto out_trans;
a81a06211fb43d Dave Chinner    2021-06-02  2090  		cur = xfs_refcountbt_init_cursor(mp, tp, agbp, pag);
94009f3ed91306 Darrick J. Wong 2023-03-06  2091  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2092  
174edb0e46e520 Darrick J. Wong 2016-10-03  2093  	/* Find all the leftover CoW staging extents. */
174edb0e46e520 Darrick J. Wong 2016-10-03  2094  	memset(&low, 0, sizeof(low));
174edb0e46e520 Darrick J. Wong 2016-10-03  2095  	memset(&high, 0, sizeof(high));
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2096  	low.rc.rc_domain = high.rc.rc_domain = XFS_REFC_DOMAIN_COW;
174edb0e46e520 Darrick J. Wong 2016-10-03  2097  	high.rc.rc_startblock = -1U;
174edb0e46e520 Darrick J. Wong 2016-10-03  2098  	error = xfs_btree_query_range(cur, &low, &high,
174edb0e46e520 Darrick J. Wong 2016-10-03  2099  			xfs_refcount_recover_extent, &debris);
ef97ef26d263fb Darrick J. Wong 2018-07-19  2100  	xfs_btree_del_cursor(cur, error);
94009f3ed91306 Darrick J. Wong 2023-03-06  2101  	if (agbp)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2102  		xfs_trans_brelse(tp, agbp);
94009f3ed91306 Darrick J. Wong 2023-03-06  2103  	else
94009f3ed91306 Darrick J. Wong 2023-03-06  2104  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_REFCOUNT);
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
94009f3ed91306 Darrick J. Wong 2023-03-06  2117  		if (rtg)
94009f3ed91306 Darrick J. Wong 2023-03-06  2118  			fsb = xfs_rgbno_to_rtb(mp, rtg->rtg_rgno,
94009f3ed91306 Darrick J. Wong 2023-03-06  2119  					rr->rr_rrec.rc_startblock);
94009f3ed91306 Darrick J. Wong 2023-03-06  2120  		else
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10 @2121  			fsb = XFS_AGB_TO_FSB(mp, pag->pag_agno,
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2122  					rr->rr_rrec.rc_startblock);
94009f3ed91306 Darrick J. Wong 2023-03-06  2123  		xfs_refcount_free_cow_extent(tp, rtg != NULL, fsb,
174edb0e46e520 Darrick J. Wong 2016-10-03  2124  				rr->rr_rrec.rc_blockcount);
174edb0e46e520 Darrick J. Wong 2016-10-03  2125  
174edb0e46e520 Darrick J. Wong 2016-10-03  2126  		/* Free the block. */
b890b8dbcbfdd6 Darrick J. Wong 2023-03-06  2127  		xfs_free_extent_later(tp, fsb, rr->rr_rrec.rc_blockcount, NULL,
94009f3ed91306 Darrick J. Wong 2023-03-06  2128  				rtg != NULL ? XFS_FREE_EXTENT_REALTIME : 0);
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
