Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D8FC19
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFemGSIA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705127260; x=1736663260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOAsPwugogNdMXH3KWGAl2lywU3aaaj5hVZmZmNu204=;
  b=RFemGSIAwDczz7fd9kX8gDtUGT7hXSp6iWqI1LTg6pm5A9drqSutfFc4
   r9FGags6d9e8KTEvHpSe8qF5zG2Ma1dQ60R8gcdIjwCdy3H1z/o9hRoV+
   GfEIZvu1Ch7SFFFFu2JELMoAnBkyfCYzsEu9adgRD4qKeZRsLBHDsa9yP
   CdkVnPbc7W1EqMUXcRgZag7ehDJgJE+eEFMhvxtrup2pLJ3iuUcu/8fid
   oCN5MUgHkO1lkyPPmDy8dMDaq//CEi/gHXTgNJ4tGtOBEH7sURLKoF+vc
   UNLS0kltlKzEhL0V3XhI9mDhVK+jTDen9V9xiAZZ2TR9/F/OCcW0XuZOp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="399034840"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="399034840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="31611504"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 22:27:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXUT-000AAv-0K;
	Sat, 13 Jan 2024 06:27:33 +0000
Date: Sat, 13 Jan 2024 14:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfiles-wtf 202/614] fs/xfs/xfs_buf.c:316 xfs_buf_free()
 warn: bitwise AND condition is false here
Message-ID: <202401131434.kXyv7oGL-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfiles-wtf
head:   b2d76ab4cf06faba959c4f2291472d3c068e10bc
commit: a75aab466f29c3f9dfcbd3f330eedf3912c40859 [202/614] xfs: support in-memory buffer cache targets
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131434.kXyv7oGL-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401131434.kXyv7oGL-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_buf.c:316 xfs_buf_free() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:629 xfs_buf_find_insert() warn: bitwise AND condition is false here
fs/xfs/xfs_buf.c:989 xfs_buf_get_uncached() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:752 xfs_buf_get_map() error: we previously assumed 'bp' could be null (see line 734)
fs/xfs/xfs_buf.c:1625 _xfs_buf_ioapply() warn: bitwise AND condition is false here

vim +316 fs/xfs/xfs_buf.c

298f3422450663 fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  307  
25a409572b5f6e fs/xfs/xfs_buf.c           Christoph Hellwig 2019-10-24  308  static void
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  309  xfs_buf_free(
e82226138b20d4 fs/xfs/xfs_buf.c           Dave Chinner      2020-12-16  310  	struct xfs_buf		*bp)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  311  {
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_buf.c Christoph Hellwig 2009-12-14  312  	trace_xfs_buf_free(bp, _RET_IP_);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  313  
430cbeb86fdcbb fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2010-12-02  314  	ASSERT(list_empty(&bp->b_lru));
430cbeb86fdcbb fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2010-12-02  315  
a75aab466f29c3 fs/xfs/xfs_buf.c           Darrick J. Wong   2024-01-09 @316  	if (bp->b_target->bt_flags & XFS_BUFTARG_MEM)
a75aab466f29c3 fs/xfs/xfs_buf.c           Darrick J. Wong   2024-01-09  317  		xfbuf_unmap_pages(bp);
a75aab466f29c3 fs/xfs/xfs_buf.c           Darrick J. Wong   2024-01-09  318  	else if (bp->b_flags & _XBF_PAGES)
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  319  		xfs_buf_free_pages(bp);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  320  	else if (bp->b_flags & _XBF_KMEM)
0e6e847ffe3743 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2011-03-26  321  		kmem_free(bp->b_addr);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  322  
298f3422450663 fs/xfs/xfs_buf.c           Dave Chinner      2022-07-14  323  	call_rcu(&bp->b_rcu, xfs_buf_free_callback);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  324  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  325  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
