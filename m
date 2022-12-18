Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB003D6B
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Dec 2022 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671380483; x=1702916483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwVKrX5ARe7gAJEjuNgXoUYEXfp1dM/JmtwV5uRgMiA=;
  b=NRIFbXvjY0yyNiZsdOO4GqXnxO6FSBMgCEf/GTCnAXkRYnPZniM74bSw
   gMt2UtU0xOK5BFUjjO1I0uNLRt9JMvZpwS2ZSd6+cPVyVUniYMBrokQ48
   YxcUpOx2QcJQo+1yDhwxuvGkP47NRqMPTt6URhobQL2SDNM17wo+930bk
   N/vaEnaADv4PGrOh9kT2bh9mHVuh8D3IOFVfSKpvIJfTg/N4T/5qUO4Ud
   f0ZJZ03YrJ8L02TFWxs7JlTr8Ivfs+NbSZ/HMHV6W0WvyEdO0awVbeVdk
   372wrswoG8Nu3hQbee4CGmI4A2XmMWBWb88WfgFOWElSSBDvV7MlJhPK8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="317907346"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="317907346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2022 08:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="643762780"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; 
   d="scan'208";a="643762780"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Dec 2022 08:21:21 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6wPg-0008MO-31;
	Sun, 18 Dec 2022 16:21:20 +0000
Date: Mon, 19 Dec 2022 00:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:vectorized-scrub 448/556]
 fs/xfs/libxfs/xfs_rmap.c:2664:25: warning: Parameter 'bmap' can be declared
 as pointer to const [constParameter]
Message-ID: <202212190044.Ih3lRU0v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_rmap.c:2664:25: warning: Parameter 'bmap' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   957abd6304af2759b5e5564977f40272364cf712
commit: d82babf5bb08b1a0da5436c5e68beccc600a85fc [448/556] xfs: clean up rmap log intent item tracepoint callsites
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d82babf5bb08b1a0da5436c5e68beccc600a85fc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_rmap.c:2664:25: warning: Parameter 'bmap' can be declared as pointer to const [constParameter]
    struct xfs_bmbt_irec  *bmap)
                           ^
   fs/xfs/libxfs/xfs_format.h:470:4: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^
   fs/xfs/libxfs/xfs_format.h:470:4: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
      ^

vim +/bmap +2664 fs/xfs/libxfs/xfs_rmap.c

9c19464469556a Darrick J. Wong 2016-08-03  2653  
9c19464469556a Darrick J. Wong 2016-08-03  2654  /*
9c19464469556a Darrick J. Wong 2016-08-03  2655   * Record a rmap intent; the list is kept sorted first by AG and then by
9c19464469556a Darrick J. Wong 2016-08-03  2656   * increasing age.
9c19464469556a Darrick J. Wong 2016-08-03  2657   */
bc46ac64713f11 Darrick J. Wong 2019-08-26  2658  static void
9c19464469556a Darrick J. Wong 2016-08-03  2659  __xfs_rmap_add(
0f37d1780c3d86 Brian Foster    2018-08-01  2660  	struct xfs_trans		*tp,
9c19464469556a Darrick J. Wong 2016-08-03  2661  	enum xfs_rmap_intent_type	type,
c8ce540db5f67d Darrick J. Wong 2017-06-16  2662  	uint64_t			owner,
9c19464469556a Darrick J. Wong 2016-08-03  2663  	int				whichfork,
9c19464469556a Darrick J. Wong 2016-08-03 @2664  	struct xfs_bmbt_irec		*bmap)
9c19464469556a Darrick J. Wong 2016-08-03  2665  {
9c19464469556a Darrick J. Wong 2016-08-03  2666  	struct xfs_rmap_intent		*ri;
9c19464469556a Darrick J. Wong 2016-08-03  2667  
f3c799c22c661e Darrick J. Wong 2021-10-12  2668  	ri = kmem_cache_alloc(xfs_rmap_intent_cache, GFP_NOFS | __GFP_NOFAIL);
9c19464469556a Darrick J. Wong 2016-08-03  2669  	INIT_LIST_HEAD(&ri->ri_list);
9c19464469556a Darrick J. Wong 2016-08-03  2670  	ri->ri_type = type;
9c19464469556a Darrick J. Wong 2016-08-03  2671  	ri->ri_owner = owner;
9c19464469556a Darrick J. Wong 2016-08-03  2672  	ri->ri_whichfork = whichfork;
9c19464469556a Darrick J. Wong 2016-08-03  2673  	ri->ri_bmap = *bmap;
9c19464469556a Darrick J. Wong 2016-08-03  2674  
d82babf5bb08b1 Darrick J. Wong 2022-07-14  2675  	trace_xfs_rmap_defer(tp->t_mountp, ri);
d82babf5bb08b1 Darrick J. Wong 2022-07-14  2676  
271522804b92f6 Darrick J. Wong 2022-10-14  2677  	xfs_rmap_update_get_group(tp->t_mountp, ri);
0f37d1780c3d86 Brian Foster    2018-08-01  2678  	xfs_defer_add(tp, XFS_DEFER_OPS_TYPE_RMAP, &ri->ri_list);
9c19464469556a Darrick J. Wong 2016-08-03  2679  }
9c19464469556a Darrick J. Wong 2016-08-03  2680  

:::::: The code at line 2664 was first introduced by commit
:::::: 9c19464469556a0cd342fc40a24926ab46d7d243 xfs: propagate bmap updates to rmapbt

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
