Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ECC4C3D0
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661640; cv=none; b=ErFo+bD2YMLj574sq/B8IeDGswmWfPCgRY3uuJfC9+OS6RaG/JqRT5ZgMdL7c8W46JZPYgoU2Cb26IqFQEgYWd1W6qOrHs1gnMG4sjCJCz0dQ3WtUw9dL1sU6MbvQ2MGr4HMtDD+h3ngxj5wHX+10ZqHByuYv95s0HkmShl428w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661640; c=relaxed/simple;
	bh=OqRRnup58CsmXuXkgbxWfDkzpv0dfzz5yile3IWo7Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtAEx2LSftW4h7QN3aXb0Ld5P9fGO7cbfUTA9HGL3h2exP0TD1RntGJwbPl4X1Ny4lntggu8klmYz2z+Zu4estTPxzUyXMqxyvAL1puOd0e6oilpBI+HQL3aykmzyoX1IY6Dn6PA3PlDmXpLylyLU505WdfIQaEMLTD8AGiRcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jytt2igQ; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jytt2igQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705661638; x=1737197638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqRRnup58CsmXuXkgbxWfDkzpv0dfzz5yile3IWo7Dc=;
  b=jytt2igQ6VFkD0Sgc802C5njUSo32KyZ4uTtlDbiDDdA6iK9Cd+XUcWb
   AvYMUOAnotW/zd+qPx7Durf/h6NdoGGY3B9EpTFY2aDq4xSPLAIxvRDn9
   BDpb3K7BRzruiOwvR/GDCigvyadsvegQKjaQQ4MoB8HmeWcJ86I0mE2K/
   NzAvspKg45Ay0aroF4KBT4V9ohA8+ppPSIxmoxmBEsBT0064TYXc4sKa+
   C4Omc38/hXteFJ2Xi4Qy+PPj6BetEtA3lPT3mPhcEQvTXRvnjru8eu2Xc
   wof9RSV9VOoZzaIS+S9ltI9HZmvaznfXDG7+lh4QuvZ0JJKPeT7aBb0oE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404484185"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="404484185"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 02:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928377356"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="928377356"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 02:53:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQmVV-0003wS-2V;
	Fri, 19 Jan 2024 10:53:53 +0000
Date: Fri, 19 Jan 2024 18:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 209/370] fs/xfs/xfs_buf_mem.c:124
 xmbuf_alloc() warn: missing error code 'error'
Message-ID: <202401191812.feAbH0et-lkp@intel.com>
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
head:   47566740a753390604b54a9f3786737c56ab4d7b
commit: e9fac4aaae33bd311c3925cc81cd7b9e43ba53a2 [209/370] xfs: support in-memory buffer cache targets
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191812.feAbH0et-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401191812.feAbH0et-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_buf_mem.c:124 xmbuf_alloc() warn: missing error code 'error'

vim +/error +124 fs/xfs/xfs_buf_mem.c

e9fac4aaae33bd Darrick J. Wong 2024-01-09   58  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   59  /*
e9fac4aaae33bd Darrick J. Wong 2024-01-09   60   * Allocate a buffer cache target for a memory-backed file and set up the
e9fac4aaae33bd Darrick J. Wong 2024-01-09   61   * buffer target.
e9fac4aaae33bd Darrick J. Wong 2024-01-09   62   */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   63  int
e9fac4aaae33bd Darrick J. Wong 2024-01-09   64  xmbuf_alloc(
e9fac4aaae33bd Darrick J. Wong 2024-01-09   65  	struct xfs_mount	*mp,
e9fac4aaae33bd Darrick J. Wong 2024-01-09   66  	const char		*descr,
e9fac4aaae33bd Darrick J. Wong 2024-01-09   67  	struct xmbuf		**xmbp)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   68  {
e9fac4aaae33bd Darrick J. Wong 2024-01-09   69  	struct file		*file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   70  	struct inode		*inode;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   71  	struct xmbuf		*xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   72  	int			error;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   73  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   74  	xmb = kzalloc(sizeof(*xmb), GFP_KERNEL);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   75  	if (!xmb)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   76  		return -ENOMEM;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   77  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   78  	file = shmem_kernel_file_setup(descr, 0, 0);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   79  	if (IS_ERR(file)) {
e9fac4aaae33bd Darrick J. Wong 2024-01-09   80  		error = PTR_ERR(file);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   81  		goto out_xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   82  	}
e9fac4aaae33bd Darrick J. Wong 2024-01-09   83  	xmb->file = file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   84  	inode = file_inode(xmb->file);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   85  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   86  	/* private file, private locking */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   87  	lockdep_set_class(&inode->i_rwsem, &xmbuf_i_mutex_key);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   88  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   89  	/* no highmem so we can use page_address */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   90  	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   91  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   92  	/* all writes are below EOF */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   93  	i_size_write(inode, inode->i_sb->s_maxbytes);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   94  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   95  	trace_xmbuf_create(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   96  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   97  	error = xfs_buf_cache_init(&xmb->bcache);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   98  	if (error)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   99  		goto out_file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  100  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  101  	/* Initialize buffer target */
e9fac4aaae33bd Darrick J. Wong 2024-01-09  102  	xmb->target.bt_mount = mp;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  103  	xmb->target.bt_dev = (dev_t)-1U;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  104  	xmb->target.bt_file = xmb->file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  105  	xmb->target.bt_flags |= XFS_BUFTARG_MEM;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  106  	xmb->target.bt_cache = &xmb->bcache;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  107  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  108  	xmb->target.bt_meta_sectorsize = XMBUF_BLOCKSIZE;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  109  	xmb->target.bt_meta_sectormask = XMBUF_BLOCKSIZE - 1;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  110  	xmb->target.bt_logical_sectorsize = XMBUF_BLOCKSIZE;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  111  	xmb->target.bt_logical_sectormask = XMBUF_BLOCKSIZE - 1;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  112  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  113  	/*
e9fac4aaae33bd Darrick J. Wong 2024-01-09  114  	 * Buffer IO error rate limiting. Limit it to no more than 10 messages
e9fac4aaae33bd Darrick J. Wong 2024-01-09  115  	 * per 30 seconds so as to not spam logs too much on repeated errors.
e9fac4aaae33bd Darrick J. Wong 2024-01-09  116  	 */
e9fac4aaae33bd Darrick J. Wong 2024-01-09  117  	ratelimit_state_init(&xmb->target.bt_ioerror_rl, 30 * HZ,
e9fac4aaae33bd Darrick J. Wong 2024-01-09  118  			     DEFAULT_RATELIMIT_BURST);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  119  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  120  	if (list_lru_init(&xmb->target.bt_lru))
e9fac4aaae33bd Darrick J. Wong 2024-01-09  121  		goto out_bcache;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  122  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  123  	if (percpu_counter_init(&xmb->target.bt_io_count, 0, GFP_KERNEL))
e9fac4aaae33bd Darrick J. Wong 2024-01-09 @124  		goto out_lru;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  125  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  126  	*xmbp = xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  127  	return 0;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  128  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  129  out_lru:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  130  	list_lru_destroy(&xmb->target.bt_lru);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  131  out_bcache:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  132  	xfs_buf_cache_destroy(&xmb->bcache);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  133  out_file:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  134  	xmbuf_close(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  135  out_xmb:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  136  	kfree(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  137  	return error;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  138  }
e9fac4aaae33bd Darrick J. Wong 2024-01-09  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
