Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D220F8
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679047686; x=1710583686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CD9olCTy97B1yym3sXlIqEy+NdqfWfVI29rKLJyL3PU=;
  b=gt3p3xg0220mNWzK2AoE0Vlj+6u+DPCFpLyKiEmYkY6HkkXA2YDcytXe
   sgriadANpIB6weF12bCC7jBKSN+dl1W6pY1BBY7srh49/N5Lv3LWB10JP
   os0dcUb8rUGcGMRLW/erytQdlv3qCfHFCjJ0SXYdQH4ryG1EOvy7yIIwo
   voE57BrPg3+pio3A0NHD/5ZR42r1McvHde2NHJ8gHkNETaBig2hyI3Idu
   oEFGkX2PKwc1UZRV3iGWK/n1gl7LqKLjUPytxvIhM21lR8XQ0UonuE8PB
   XkMOiPUyL60uR3Uzm55CRBA8Tm9GXYGxynJh9WQGh31sTFU0+yTVrLvL5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424500010"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424500010"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 03:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="680256313"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="680256313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 03:08:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd70F-0009HI-2r;
	Fri, 17 Mar 2023 10:08:03 +0000
Date: Fri, 17 Mar 2023 18:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 189/274] fs/xfs/libxfs/xfs_rmap.c:277
 xfs_rmap_check_irec() warn: bitwise AND condition is false here
Message-ID: <202303171714.q9NOZ8O8-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   67bb67e9a9941400f950d75d77991bf99c54ed05
commit: 78f3cfa5918eaef99311a2d0bc4c972272e2d7b0 [189/274] xfs: create a shadow rmap btree during rmap repair
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171714.q9NOZ8O8-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303171714.q9NOZ8O8-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_rmap.c:277 xfs_rmap_check_irec() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_rmap.c:290 xfs_rmap_complain_bad_rec() warn: bitwise AND condition is false here

vim +277 fs/xfs/libxfs/xfs_rmap.c

89da01fd626957 Darrick J. Wong 2023-03-06  270  
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  271  /* Simple checks for rmap records. */
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  272  xfs_failaddr_t
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  273  xfs_rmap_check_irec(
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  274  	struct xfs_btree_cur		*cur,
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  275  	const struct xfs_rmap_irec	*irec)
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  276  {
78f3cfa5918eae Darrick J. Wong 2023-03-06 @277  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
78f3cfa5918eae Darrick J. Wong 2023-03-06  278  		return xfs_rmap_check_perag_irec(cur->bc_mem.pag, irec);
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  279  	return xfs_rmap_check_perag_irec(cur->bc_ag.pag, irec);
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  280  }
7b9fd340aa3d57 Darrick J. Wong 2023-03-06  281  
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  282  static inline int
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  283  xfs_rmap_complain_bad_rec(
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  284  	struct xfs_btree_cur		*cur,
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  285  	xfs_failaddr_t			fa,
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  286  	const struct xfs_rmap_irec	*irec)
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  287  {
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  288  	struct xfs_mount		*mp = cur->bc_mp;
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  289  
78f3cfa5918eae Darrick J. Wong 2023-03-06 @290  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
78f3cfa5918eae Darrick J. Wong 2023-03-06  291  		xfs_warn(mp,
78f3cfa5918eae Darrick J. Wong 2023-03-06  292   "In-Memory Reverse Mapping BTree record corruption detected at %pS!", fa);
78f3cfa5918eae Darrick J. Wong 2023-03-06  293  	else
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  294  		xfs_warn(mp,
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  295   "Reverse Mapping BTree record corruption in AG %d detected at %pS!",
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  296  			cur->bc_ag.pag->pag_agno, fa);
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  297  	xfs_warn(mp,
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  298  		"Owner 0x%llx, flags 0x%x, start block 0x%x block count 0x%x",
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  299  		irec->rm_owner, irec->rm_flags, irec->rm_startblock,
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  300  		irec->rm_blockcount);
63aada3d098b77 Darrick J. Wong 2023-03-06  301  	xfs_btree_mark_sick(cur);
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  302  	return -EFSCORRUPTED;
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  303  }
b6e8d98f34c8a2 Darrick J. Wong 2023-03-06  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
