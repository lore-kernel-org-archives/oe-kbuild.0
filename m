Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9366D19
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067854; x=1710603854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRaycc+7orhG5Dm3YxIXtLTMIerAG6lye90m7h5XZYA=;
  b=GVM7I1Y3mJ9ljQ/D4pqNbmO0/eMczeiCoeQQDZVNkS8kA6NJ+Ek42HYB
   rRJu4822dtuTv9trP92YjMNbOGdKEDpt8MNOv+VGCjOJDPqdyztN6zycn
   s1Xd7s5XDGQFQOftrvhw2UFLKpgE9mzglcrSfFT00234JtVGrN7Yjz9g2
   JqcZbf7eMm81CFpqcEzxxqbqSg8QYQN/iJ8aqps8Y7lGSoCpbKs5sgUnT
   GSo+CCmtPgU2r18K71cPul+IBb9xQvU1LiR2lyhhnZ9L+aM1pdJjLHeKx
   peruq0a3WNO2eYinLlF8U37YH05IwVwVt+vlk13MDuid+9WnUIoWOsfzY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318688055"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="318688055"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="710530979"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="710530979"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 08:44:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdCFX-0009Re-32;
	Fri, 17 Mar 2023 15:44:11 +0000
Date: Fri, 17 Mar 2023 23:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 272/274] fs/xfs/xfs_buf.c:327
 xfs_buf_free() warn: bitwise AND condition is false here
Message-ID: <202303172342.ADsIQSWr-lkp@intel.com>
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
commit: 6e9bb84130cdd2e0e6b8edbb639eed401bbcd4f7 [272/274] xfs: map xfile pages directly into xfs_buf
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303172342.ADsIQSWr-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303172342.ADsIQSWr-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:327 xfs_buf_free() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:794 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 776)
fs/xfs/xfs_buf.c:1701 _xfs_buf_ioapply() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2075 xfs_free_buftarg() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:2558 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here

vim +327 fs/xfs/xfs_buf.c

298f3422450663 fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  315  
25a409572b5f6e fs/xfs/xfs_buf.c           Christoph Hellwig 2019-10-24  316  static void
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  317  xfs_buf_free(
e82226138b20d4 fs/xfs/xfs_buf.c           Dave Chinner      2020-12-16  318  	struct xfs_buf		*bp)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  319  {
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_buf.c Christoph Hellwig 2009-12-14  320  	trace_xfs_buf_free(bp, _RET_IP_);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  321  
430cbeb86fdcbb fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2010-12-02  322  	ASSERT(list_empty(&bp->b_lru));
430cbeb86fdcbb fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2010-12-02  323  
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06  324  	if (xfs_buf_is_vmapped(bp))
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06  325  		vm_unmap_ram(bp->b_addr, bp->b_page_count);
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06  326  
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06 @327  	if (bp->b_flags & _XBF_DIRECT_MAP)
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06  328  		xfile_buf_unmap_pages(bp);
6e9bb84130cdd2 fs/xfs/xfs_buf.c           Darrick J. Wong   2023-03-06  329  	else if (bp->b_flags & _XBF_PAGES)
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  330  		xfs_buf_free_pages(bp);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  331  	else if (bp->b_flags & _XBF_KMEM)
0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  332  		kmem_free(bp->b_addr);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  333  
298f3422450663 fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  334  	call_rcu(&bp->b_rcu, xfs_buf_free_callback);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  335  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  336  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
