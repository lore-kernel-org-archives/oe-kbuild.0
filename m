Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B1199
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Oct 2023 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LatEnhxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698284210; x=1729820210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UREjTlqP77rAQMyWaFDCQu2Hb4GoPhz4J16GAcEBZsY=;
  b=LatEnhxanHPXhPAbYH+uz520EAk9xp+cLdvm3sHD1aaRuejezA7GU2EP
   siQsI63RMLmzEff7L2TcKJlz7qKKdrdUbsONDHUGeIybkoboZk/A65AOh
   pQcGcImo7ynV6exAVJVKEfZGQvf4ShKuB260btCtBUHq1A8lSHe8p2P/l
   iKP9U27Lc5bAzymzg8X5WF5bkCBeJpcJw1xFXoucPeu2j4WMxsxMleg7L
   bqgI781ZKjELX66VfDtNHWVbqpiTW5toZC7TV5xQ5V225J/xYnwJ9ek9D
   W11BNzGvNxsmWx6kmRhQoFgnFQWH0Hog912l8Uo+ylUTiADDgpacftJY2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386317459"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="386317459"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 18:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902737779"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="902737779"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2023 18:34:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvpIj-0009Kk-1W;
	Thu, 26 Oct 2023 01:36:45 +0000
Date: Thu, 26 Oct 2023 09:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 76/172] fs/xfs/xfs_buf.h:401
 xfs_buftarg_bdev() warn: bitwise AND condition is false here
Message-ID: <202310260909.fkmq0TUn-lkp@intel.com>
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
head:   b906f6a9d64e5a914bcc5e69a08dd27e99361afd
commit: 4938bf7f9cc82febd92bb0bfa5a2b8a5884f36e5 [76/172] xfs: support in-memory buffer cache targets
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231026/202310260909.fkmq0TUn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310260909.fkmq0TUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310260909.fkmq0TUn-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.h:401 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:438 xfs_buftarg_zeroout() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:1641 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2017 xfs_free_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:425 xfs_buftarg_flush() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:409 xfs_getsize_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:417 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:417 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:401 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:425 xfs_buftarg_flush() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:401 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:417 xfs_readonly_buftarg() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:748 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 730)
fs/xfs/xfs_log.c:1961 xlog_write_iclog() warn: inconsistent returns '&iclog->ic_sema'.
fs/xfs/xfs_log.c:3246 xfs_log_force() warn: inconsistent returns '&log->l_icloglock'.
fs/xfs/xfs_log.c:3344 xlog_force_lsn() warn: inconsistent returns '&log->l_icloglock'.

vim +401 fs/xfs/xfs_buf.h

d808f617ad00a4 fs/xfs/linux-2.6/xfs_buf.h Dave Chinner    2010-02-02  397  
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  398  static inline struct block_device *
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  399  xfs_buftarg_bdev(struct xfs_buftarg *btp)
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  400  {
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @401  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  402  		return NULL;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  403  	return btp->bt_bdev;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  404  }
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  405  
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  406  static inline unsigned int
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  407  xfs_getsize_buftarg(struct xfs_buftarg *btp)
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  408  {
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @409  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  410  		return SECTOR_SIZE;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  411  	return block_size(btp->bt_bdev);
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  412  }
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  413  
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  414  static inline bool
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  415  xfs_readonly_buftarg(struct xfs_buftarg *btp)
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  416  {
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @417  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  418  		return false;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  419  	return bdev_read_only(btp->bt_bdev);
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  420  }
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  421  
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  422  static inline int
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  423  xfs_buftarg_flush(struct xfs_buftarg *btp)
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  424  {
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @425  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  426  		return 0;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  427  	return blkdev_issue_flush(btp->bt_bdev);
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  428  }
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  429  
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  430  static inline int
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  431  xfs_buftarg_zeroout(
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  432  	struct xfs_buftarg	*btp,
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  433  	sector_t		sector,
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  434  	sector_t		nr_sects,
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  435  	gfp_t			gfp_mask,
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  436  	unsigned		flags)
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  437  {
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @438  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
4938bf7f9cc82f fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  439  		return -EOPNOTSUPP;
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  440  	return blkdev_issue_zeroout(btp->bt_bdev, sector, nr_sects, gfp_mask,
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  441  			flags);
365b5eacdf8141 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  442  }
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.h Nathan Scott    2006-01-11  443  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
