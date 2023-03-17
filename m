Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B1F62D
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 04:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679027219; x=1710563219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBGRAs2fGiyjM6Tc8YCJ2jPqLTh8YW0ojNd7sjmyerY=;
  b=Jl1knscWP0wBWoryMhFgu6VHe73dcaAJuY13jyBDrUilThAkXrk6TtEi
   t+oXhwOkdekmla3eFiz/QLbgp19vAxkriknVM8kmo6Pf7LXQvT4PFsx+f
   umpxCpbX/ruH21IZvpcHdSg02O9aYbdVvXjecqr4iGid02tNfQH+krhP0
   IDP+26cn8ftGINLPgCccdbYFJS8Gk581HVwE+mDapwP8bQzUt+Zh8HH7/
   CqgkUL5Kt0mb6Bx9ffmzI2jKb28aa5ZVrxso5CH+aF5uyLf+0kHJ0rgq+
   v8UnZAHbPX2I++q3KZhpxx3P1xWvsda5gjIYoepwDAJdjtjW6/jJ8T6BC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335669104"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="335669104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 21:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710377308"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="710377308"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 21:26:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd1g8-00095W-0G;
	Fri, 17 Mar 2023 04:26:56 +0000
Date: Fri, 17 Mar 2023 12:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 182/274] fs/xfs/xfs_buf.h:397
 xfs_buftarg_bdev() warn: bitwise AND condition is false here
Message-ID: <202303171245.T2favzbi-lkp@intel.com>
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
commit: df57501f309978750154508eaa05cbffd6521627 [182/274] xfs: support in-memory buffer cache targets
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171245.T2favzbi-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303171245.T2favzbi-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.h:397 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:421 xfs_buftarg_flush() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:405 xfs_getsize_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:413 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:413 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:397 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:421 xfs_buftarg_flush() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:397 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:413 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:434 xfs_buftarg_zeroout() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:1638 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2012 xfs_free_buftarg() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_log.c:3615 xlog_verify_tail_lsn() warn: inconsistent indenting
fs/xfs/xfs_buf.c:745 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 727)

vim +397 fs/xfs/xfs_buf.h

d808f617ad00a4 fs/xfs/linux-2.6/xfs_buf.h Dave Chinner    2010-02-02  393  
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  394  static inline struct block_device *
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  395  xfs_buftarg_bdev(struct xfs_buftarg *btp)
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  396  {
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @397  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  398  		return NULL;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  399  	return btp->bt_bdev;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  400  }
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  401  
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  402  static inline unsigned int
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  403  xfs_getsize_buftarg(struct xfs_buftarg *btp)
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  404  {
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @405  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  406  		return SECTOR_SIZE;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  407  	return block_size(btp->bt_bdev);
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  408  }
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  409  
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  410  static inline bool
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  411  xfs_readonly_buftarg(struct xfs_buftarg *btp)
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  412  {
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @413  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  414  		return false;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  415  	return bdev_read_only(btp->bt_bdev);
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  416  }
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  417  
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  418  static inline int
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  419  xfs_buftarg_flush(struct xfs_buftarg *btp)
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  420  {
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @421  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  422  		return 0;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  423  	return blkdev_issue_flush(btp->bt_bdev);
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  424  }
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  425  
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  426  static inline int
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  427  xfs_buftarg_zeroout(
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  428  	struct xfs_buftarg	*btp,
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  429  	sector_t		sector,
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  430  	sector_t		nr_sects,
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  431  	gfp_t			gfp_mask,
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  432  	unsigned		flags)
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  433  {
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @434  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
df57501f309978 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  435  		return -EOPNOTSUPP;
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  436  	return blkdev_issue_zeroout(btp->bt_bdev, sector, nr_sects, gfp_mask,
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  437  			flags);
65157700a64ac5 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  438  }
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.h Nathan Scott    2006-01-11  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
