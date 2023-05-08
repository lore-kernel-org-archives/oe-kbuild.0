Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB117F3
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683562899; x=1715098899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSTQc/j3awGFlHOsilkDRckkaTKC9us6XYbf/82KQIU=;
  b=VMSJjWZc9WuXB6oV0PByMlXKl8mMIsRYuZdXYsNdZ1eW5cdOA19Vue6k
   ObCrcI1zn6XVS5M9EeLAmwLeiZNJMwgx9lsL1BOMAbZNbaQ4KJrrzBYa+
   GlCzOWy1dC7xsxvzUoTS9rXHNmz9TsAFEBiw/YyV1i1qp6JrXFCDiH9zi
   Ha+NQ2TOI0pCkEFwKPFmrGnw4pTN0oCnCKeunSGcniHU4YABNqXJwM84B
   xvB3uhFkSVQAurqWHYmqK2VDhd99wsw3yFmtASqkCGXeeh+YmRresNjAF
   5RgFKaa5gwLQ4vCiaSnUL0bLjZcGbhN7DYT7zhFxEPgrwYduDW1/fJ9VG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348519727"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="348519727"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 09:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676105984"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="676105984"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 09:21:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw3cG-0001JN-0P;
	Mon, 08 May 2023 16:21:36 +0000
Date: Tue, 9 May 2023 00:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 778/1074] fs/xfs/scrub/fscounters.c:459
 xchk_fscounters() warn: ignoring unreachable code.
Message-ID: <202305090010.ON5yT635-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   52025ebbb518a2d876b8aba191b348ffb1cf368b
commit: 2d5f38a31980d7090f5bf91021488dc61a0ba8ee [778/1074] xfs: disable reaping in fscounters scrub
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago
config: ia64-randconfig-m031-20230507 (https://download.01.org/0day-ci/archive/20230509/202305090010.ON5yT635-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305090010.ON5yT635-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/fscounters.c:459 xchk_fscounters() warn: ignoring unreachable code.

vim +459 fs/xfs/scrub/fscounters.c

75efa57d0bf5fc Darrick J. Wong 2019-04-25  416  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  417  /* Check the superblock counters. */
75efa57d0bf5fc Darrick J. Wong 2019-04-25  418  int
75efa57d0bf5fc Darrick J. Wong 2019-04-25  419  xchk_fscounters(
75efa57d0bf5fc Darrick J. Wong 2019-04-25  420  	struct xfs_scrub	*sc)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  421  {
75efa57d0bf5fc Darrick J. Wong 2019-04-25  422  	struct xfs_mount	*mp = sc->mp;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  423  	struct xchk_fscounters	*fsc = sc->buf;
e74331d6fa2c21 Darrick J. Wong 2022-11-06  424  	int64_t			icount, ifree, fdblocks, frextents;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  425  	int			error;
75efa57d0bf5fc Darrick J. Wong 2019-04-25  426  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  427  	/* Snapshot the percpu counters. */
75efa57d0bf5fc Darrick J. Wong 2019-04-25  428  	icount = percpu_counter_sum(&mp->m_icount);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  429  	ifree = percpu_counter_sum(&mp->m_ifree);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  430  	fdblocks = percpu_counter_sum(&mp->m_fdblocks);
e74331d6fa2c21 Darrick J. Wong 2022-11-06  431  	frextents = percpu_counter_sum(&mp->m_frextents);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  432  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  433  	/* No negative values, please! */
e74331d6fa2c21 Darrick J. Wong 2022-11-06  434  	if (icount < 0 || ifree < 0 || fdblocks < 0 || frextents < 0)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  435  		xchk_set_corrupt(sc);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  436  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  437  	/* See if icount is obviously wrong. */
75efa57d0bf5fc Darrick J. Wong 2019-04-25  438  	if (icount < fsc->icount_min || icount > fsc->icount_max)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  439  		xchk_set_corrupt(sc);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  440  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  441  	/* See if fdblocks is obviously wrong. */
75efa57d0bf5fc Darrick J. Wong 2019-04-25  442  	if (fdblocks > mp->m_sb.sb_dblocks)
75efa57d0bf5fc Darrick J. Wong 2019-04-25  443  		xchk_set_corrupt(sc);
75efa57d0bf5fc Darrick J. Wong 2019-04-25  444  
e74331d6fa2c21 Darrick J. Wong 2022-11-06  445  	/* See if frextents is obviously wrong. */
e74331d6fa2c21 Darrick J. Wong 2022-11-06  446  	if (frextents > mp->m_sb.sb_rextents)
e74331d6fa2c21 Darrick J. Wong 2022-11-06  447  		xchk_set_corrupt(sc);
e74331d6fa2c21 Darrick J. Wong 2022-11-06  448  
2d5f38a31980d7 Darrick J. Wong 2023-05-02  449  	/*
2d5f38a31980d7 Darrick J. Wong 2023-05-02  450  	 * XXX: We can't quiesce percpu counter updates, so exit early.
2d5f38a31980d7 Darrick J. Wong 2023-05-02  451  	 * This can be re-enabled when we gain exclusive freeze functionality.
2d5f38a31980d7 Darrick J. Wong 2023-05-02  452  	 */
2d5f38a31980d7 Darrick J. Wong 2023-05-02  453  	return 0;
2d5f38a31980d7 Darrick J. Wong 2023-05-02  454  
75efa57d0bf5fc Darrick J. Wong 2019-04-25  455  	/*
75efa57d0bf5fc Darrick J. Wong 2019-04-25  456  	 * If ifree exceeds icount by more than the minimum variance then
75efa57d0bf5fc Darrick J. Wong 2019-04-25  457  	 * something's probably wrong with the counters.
75efa57d0bf5fc Darrick J. Wong 2019-04-25  458  	 */
75efa57d0bf5fc Darrick J. Wong 2019-04-25 @459  	if (ifree > icount && ifree - icount > XCHK_FSCOUNT_MIN_VARIANCE)

:::::: The code at line 459 was first introduced by commit
:::::: 75efa57d0bf5fcf650a183f0ce0dc011ba8c4bc8 xfs: add online scrub for superblock counters

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
