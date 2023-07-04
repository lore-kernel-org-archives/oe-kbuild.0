Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F666FCE
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688494144; x=1720030144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xkcm4Lfgl4MmMd8bVfsKLqW+SYtR78u5vI5Ey3S8oQI=;
  b=MftVQsRsWgg/OLOXLGSIdP22hh5mbUrAuGjJIeyIeemD7uU0gdBQ52py
   rEcmbtp4CRJaISx/7o+I2xKbmZQ6oRcTPytNjMlljwU8dxJNm2QvQwHvL
   fER1qRqZCc5EF/YTJGal8sVlCBJhSlaum7Rek44h0oMrTMhhNv7H4uNY4
   6DnzUBqr6nU6NaFjjxNm/nrWryY0lusTs6n+15JdQ9JKZG03+3Dj22o/Q
   CN298qYT6ppv8cGPj3WzCqMYRdtzCfTDwguOCN7TtMiQ8K86DoWkkWXnU
   b+2e+DYnzPx9yNFiMkmVwxrxdSwOsCGWNTi+NpciKZD+cQAYBEZzW9g5O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="426854655"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="426854655"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 11:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784290517"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="784290517"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 11:09:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGkST-000IQJ-2E;
	Tue, 04 Jul 2023 18:09:01 +0000
Date: Wed, 5 Jul 2023 02:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 120/217] fs/xfs/xfs_buf.h:398
 xfs_buftarg_bdev() warn: bitwise AND condition is false here
Message-ID: <202307050125.YvygxTK9-lkp@intel.com>
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
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: e0e756bfec358aba5cd1ee9ec473e521788f9d51 [120/217] xfs: support in-memory buffer cache targets
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050125.YvygxTK9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050125.YvygxTK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307050125.YvygxTK9-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.h:398 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:406 xfs_getsize_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:414 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:414 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:398 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:422 xfs_buftarg_flush() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:398 xfs_buftarg_bdev() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:414 xfs_readonly_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:435 xfs_buftarg_zeroout() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:1637 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2011 xfs_free_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.h:422 xfs_buftarg_flush() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_log.c:1978 xlog_write_iclog() warn: inconsistent returns '&iclog->ic_sema'.
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting
fs/xfs/xfs_log.c:3263 xfs_log_force() warn: inconsistent returns '&log->l_icloglock'.
fs/xfs/xfs_log.c:3361 xlog_force_lsn() warn: inconsistent returns '&log->l_icloglock'.
fs/xfs/xfs_log.c:3598 xlog_verify_tail_lsn() warn: inconsistent indenting
fs/xfs/xfs_buf.c:744 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 726)
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +398 fs/xfs/xfs_buf.h

d808f617ad00a4 fs/xfs/linux-2.6/xfs_buf.h Dave Chinner    2010-02-02  394  
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  395  static inline struct block_device *
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  396  xfs_buftarg_bdev(struct xfs_buftarg *btp)
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  397  {
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @398  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  399  		return NULL;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  400  	return btp->bt_bdev;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  401  }
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  402  
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  403  static inline unsigned int
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  404  xfs_getsize_buftarg(struct xfs_buftarg *btp)
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  405  {
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @406  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  407  		return SECTOR_SIZE;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  408  	return block_size(btp->bt_bdev);
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  409  }
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  410  
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  411  static inline bool
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  412  xfs_readonly_buftarg(struct xfs_buftarg *btp)
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  413  {
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @414  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  415  		return false;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  416  	return bdev_read_only(btp->bt_bdev);
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  417  }
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  418  
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  419  static inline int
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  420  xfs_buftarg_flush(struct xfs_buftarg *btp)
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  421  {
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @422  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  423  		return 0;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  424  	return blkdev_issue_flush(btp->bt_bdev);
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  425  }
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  426  
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  427  static inline int
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  428  xfs_buftarg_zeroout(
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  429  	struct xfs_buftarg	*btp,
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  430  	sector_t		sector,
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  431  	sector_t		nr_sects,
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  432  	gfp_t			gfp_mask,
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  433  	unsigned		flags)
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  434  {
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06 @435  	if (btp->bt_flags & XFS_BUFTARG_XFILE)
e0e756bfec358a fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-06  436  		return -EOPNOTSUPP;
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  437  	return blkdev_issue_zeroout(btp->bt_bdev, sector, nr_sects, gfp_mask,
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  438  			flags);
64c017af52cd75 fs/xfs/xfs_buf.h           Darrick J. Wong 2023-03-10  439  }
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.h Nathan Scott    2006-01-11  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
