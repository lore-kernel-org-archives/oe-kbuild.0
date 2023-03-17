Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB257F3
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679038264; x=1710574264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5Ycm/qPp8fSWlmtoM3QNXsJEySpoThFbf169tj7jQw=;
  b=Qdac6cD/FTWNnQLSZm3NCuAnOUdWlT+3BGUzkid7mYeAYn1/2vt/izuC
   cNYsoMF6TySnW8laAAx5akSnA00Hbw16wyqBjyks5t6J/AyDddYN1HEep
   nIiFVuXFkEQ7ws8dWMp8TNwAiu9rdPlI5znv+XiLVEDtU84TI2EccMRmf
   7zQcU2wqiF2EZFeCGXXtbt5+MFz5K0LHAOcqe4msgJIkX4unStx6wsDBS
   wEy9uXU8ovKSflM6Kax9fxDiK2d9fbWt9qCNTPHZut6WpBAwGzUcL+NyB
   35Y46eyCIkkrGFJXxPJC51nJYbSBhd0u+U20QNvbw6gInEnPBU+8rK15Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400783453"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="400783453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 00:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710409097"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="710409097"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 00:31:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd4YG-0009BE-0d;
	Fri, 17 Mar 2023 07:31:00 +0000
Date: Fri, 17 Mar 2023 15:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 185/274] fs/xfs/xfs_health.c:511
 xfs_btree_mark_sick() warn: bitwise AND condition is false here
Message-ID: <202303171552.nXhSeyBh-lkp@intel.com>
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
commit: ae51167d499b9ebb1db39a608b3948f43d6fad28 [185/274] xfs: support in-memory btrees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171552.nXhSeyBh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303171552.nXhSeyBh-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_health.c:511 xfs_btree_mark_sick() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2495 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:163 __xfs_btree_check_lblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:88 xfs_btree_check_lblock_siblings() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:232 __xfs_btree_check_sblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:118 xfs_btree_check_sblock_siblings() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:294 xfs_btree_check_lptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:308 xfs_btree_check_sptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:324 xfs_btree_check_ptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:484 xfs_btree_del_cursor() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:498 xfs_btree_buftarg() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:508 xfs_btree_bbsize() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:995 xfs_btree_readahead_lblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1023 xfs_btree_readahead_sblock() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1086 xfs_btree_ptr_to_daddr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1295 xfs_btree_init_block_cur() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1337 xfs_btree_buf_to_ptr() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:1878 xfs_btree_check_block_owner() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:745 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 727)
fs/xfs/xfs_buf.c:1638 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2012 xfs_free_buftarg() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_btree.c:486 xfs_btree_del_cursor() warn: bitwise AND condition is false here

vim +511 fs/xfs/xfs_health.c

63aada3d098b77 Darrick J. Wong 2023-03-06  503  
63aada3d098b77 Darrick J. Wong 2023-03-06  504  /* Record observations of btree corruption with the health tracking system. */
63aada3d098b77 Darrick J. Wong 2023-03-06  505  void
63aada3d098b77 Darrick J. Wong 2023-03-06  506  xfs_btree_mark_sick(
63aada3d098b77 Darrick J. Wong 2023-03-06  507  	struct xfs_btree_cur		*cur)
63aada3d098b77 Darrick J. Wong 2023-03-06  508  {
63aada3d098b77 Darrick J. Wong 2023-03-06  509  	unsigned int			mask;
63aada3d098b77 Darrick J. Wong 2023-03-06  510  
ae51167d499b9e Darrick J. Wong 2023-03-06 @511  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
ae51167d499b9e Darrick J. Wong 2023-03-06  512  		return;
ae51167d499b9e Darrick J. Wong 2023-03-06  513  
63aada3d098b77 Darrick J. Wong 2023-03-06  514  	switch (cur->bc_btnum) {
63aada3d098b77 Darrick J. Wong 2023-03-06  515  	case XFS_BTNUM_BMAP:
63aada3d098b77 Darrick J. Wong 2023-03-06  516  		xfs_bmap_mark_sick(cur->bc_ino.ip, cur->bc_ino.whichfork);
63aada3d098b77 Darrick J. Wong 2023-03-06  517  		return;
63aada3d098b77 Darrick J. Wong 2023-03-06  518  	case XFS_BTNUM_BNO:
63aada3d098b77 Darrick J. Wong 2023-03-06  519  		mask = XFS_SICK_AG_BNOBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  520  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  521  	case XFS_BTNUM_CNT:
63aada3d098b77 Darrick J. Wong 2023-03-06  522  		mask = XFS_SICK_AG_CNTBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  523  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  524  	case XFS_BTNUM_INO:
63aada3d098b77 Darrick J. Wong 2023-03-06  525  		mask = XFS_SICK_AG_INOBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  526  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  527  	case XFS_BTNUM_FINO:
63aada3d098b77 Darrick J. Wong 2023-03-06  528  		mask = XFS_SICK_AG_FINOBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  529  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  530  	case XFS_BTNUM_RMAP:
63aada3d098b77 Darrick J. Wong 2023-03-06  531  		mask = XFS_SICK_AG_RMAPBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  532  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  533  	case XFS_BTNUM_REFC:
63aada3d098b77 Darrick J. Wong 2023-03-06  534  		mask = XFS_SICK_AG_REFCNTBT;
63aada3d098b77 Darrick J. Wong 2023-03-06  535  		break;
63aada3d098b77 Darrick J. Wong 2023-03-06  536  	default:
63aada3d098b77 Darrick J. Wong 2023-03-06  537  		ASSERT(0);
63aada3d098b77 Darrick J. Wong 2023-03-06  538  		return;
63aada3d098b77 Darrick J. Wong 2023-03-06  539  	}
63aada3d098b77 Darrick J. Wong 2023-03-06  540  
63aada3d098b77 Darrick J. Wong 2023-03-06  541  	xfs_ag_mark_sick(cur->bc_ag.pag, mask);
63aada3d098b77 Darrick J. Wong 2023-03-06  542  }
a7408201d76488 Darrick J. Wong 2023-03-06  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
