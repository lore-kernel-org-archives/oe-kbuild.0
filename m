Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE685358367
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 23:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481058; cv=none; b=l5o/Xz7FrCdLD1rm3PQTkWXLxiBb+ovWMzNYBzQygSo1+bT7tJ6TlC7YvdYn44z3qEjX+MPRIsijD3yu8q9ZwYAtINVgVFZPPcYaZaaf8cbzwhy0aCYrp2fhK4eQ1iJAj/AQcU/9G91mklvAg1jvu5jafBo+nP/FlVCfSffSotI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481058; c=relaxed/simple;
	bh=1QLhDzXFopOyeG6RZKMIz0H/PEigIg8ElxgsL0HSEjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a0mb9AOyFD0U9q72/lfWLZiotSHDuj/oLxL4EWLJ0o2TZSNYZGHfvfaIxehlFpFV03XOJkPL+DPYEYzdv4+8lyfJaXgCh3biPX3m4VNzHBLLcsstNv6jppwaOcrk3kCWTP4ZDjZkLriwafAf03ngsRfbmQURxfYZbZ7qdhkWhzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSY1Zfmu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSY1Zfmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781481057; x=1813017057;
  h=date:from:to:cc:subject:message-id;
  bh=1QLhDzXFopOyeG6RZKMIz0H/PEigIg8ElxgsL0HSEjM=;
  b=GSY1ZfmuzeAj9esOE1qKXpLJvo6osygFcqHRJNnBEAeZiLvCtbqKchLc
   hYWJvxbPc8eM48dJf9Edl8Qy8deFCqXGzGZRQO75rTMj66ilrrwwZQzhc
   kpGk+3Vx4SGEKB6PFJmlvPThheTvxMCsPmxHEMhhppHFt00RpttIhh2Iy
   gaYrMb3ey3rOUU7deoi+V+XUhEilzW3mf9ESwNA0uZxHnxamR+T1BvwL3
   2GcVxqY0JpjuzsGRVo/v0czF5aILZfe+s/VRfg5ZVeoVlXn3poQwYzlXv
   5DjCDQrqkMr/xR4Ov9RSizK5O3rQrHfJfJRVi9aZqyeTdbkokfRZIKcgR
   A==;
X-CSE-ConnectionGUID: xZIIT982RWeIMCHTvGk0SA==
X-CSE-MsgGUID: AoTbIPy+QcSK6C2SqcqgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82283848"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82283848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 16:50:57 -0700
X-CSE-ConnectionGUID: fAFEAQSqQaqk1GQslnS44w==
X-CSE-MsgGUID: X0tlRpSYTCyC36r3JR0+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271395501"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2026 16:50:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYubM-00000000RHw-3Qkn;
	Sun, 14 Jun 2026 23:50:52 +0000
Date: Mon, 15 Jun 2026 07:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_icache.c:579 xfs_iget_cache_hit() warn: missing
 unwind goto?
Message-ID: <202606150757.lDYm2HHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: dcfa98bb5f7816aec787e74871982b06607ba9cb xfs: move some code out of xfs_iget_recycle
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150757.lDYm2HHu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dcfa98bb5f78 ("xfs: move some code out of xfs_iget_recycle")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606150757.lDYm2HHu-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_icache.c:579 xfs_iget_cache_hit() warn: missing unwind goto?

vim +579 fs/xfs/xfs_icache.c

d4d12c02bf5f76 Dave Chinner      2023-06-05  493  
33479e0542df06 Dave Chinner      2012-10-08  494  /*
33479e0542df06 Dave Chinner      2012-10-08  495   * Check the validity of the inode we just found it the cache
33479e0542df06 Dave Chinner      2012-10-08  496   */
33479e0542df06 Dave Chinner      2012-10-08  497  static int
33479e0542df06 Dave Chinner      2012-10-08  498  xfs_iget_cache_hit(
33479e0542df06 Dave Chinner      2012-10-08  499  	struct xfs_perag	*pag,
33479e0542df06 Dave Chinner      2012-10-08  500  	struct xfs_inode	*ip,
33479e0542df06 Dave Chinner      2012-10-08  501  	xfs_ino_t		ino,
33479e0542df06 Dave Chinner      2012-10-08  502  	int			flags,
33479e0542df06 Dave Chinner      2012-10-08  503  	int			lock_flags) __releases(RCU)
33479e0542df06 Dave Chinner      2012-10-08  504  {
33479e0542df06 Dave Chinner      2012-10-08  505  	struct inode		*inode = VFS_I(ip);
33479e0542df06 Dave Chinner      2012-10-08  506  	struct xfs_mount	*mp = ip->i_mount;
33479e0542df06 Dave Chinner      2012-10-08  507  	int			error;
33479e0542df06 Dave Chinner      2012-10-08  508  
33479e0542df06 Dave Chinner      2012-10-08  509  	/*
33479e0542df06 Dave Chinner      2012-10-08  510  	 * check for re-use of an inode within an RCU grace period due to the
33479e0542df06 Dave Chinner      2012-10-08  511  	 * radix tree nodes not being updated yet. We monitor for this by
33479e0542df06 Dave Chinner      2012-10-08  512  	 * setting the inode number to zero before freeing the inode structure.
33479e0542df06 Dave Chinner      2012-10-08  513  	 * If the inode has been reallocated and set up, then the inode number
33479e0542df06 Dave Chinner      2012-10-08  514  	 * will not match, so check for that, too.
33479e0542df06 Dave Chinner      2012-10-08  515  	 */
33479e0542df06 Dave Chinner      2012-10-08  516  	spin_lock(&ip->i_flags_lock);
77b4d2861e8381 Darrick J. Wong   2021-06-18  517  	if (ip->i_ino != ino)
77b4d2861e8381 Darrick J. Wong   2021-06-18  518  		goto out_skip;
33479e0542df06 Dave Chinner      2012-10-08  519  
33479e0542df06 Dave Chinner      2012-10-08  520  	/*
33479e0542df06 Dave Chinner      2012-10-08  521  	 * If we are racing with another cache hit that is currently
33479e0542df06 Dave Chinner      2012-10-08  522  	 * instantiating this inode or currently recycling it out of
ff7bebeb91f8cc Darrick J. Wong   2021-06-18  523  	 * reclaimable state, wait for the initialisation to complete
33479e0542df06 Dave Chinner      2012-10-08  524  	 * before continuing.
33479e0542df06 Dave Chinner      2012-10-08  525  	 *
ab23a7768739a2 Dave Chinner      2021-08-06  526  	 * If we're racing with the inactivation worker we also want to wait.
ab23a7768739a2 Dave Chinner      2021-08-06  527  	 * If we're creating a new file, it's possible that the worker
ab23a7768739a2 Dave Chinner      2021-08-06  528  	 * previously marked the inode as free on disk but hasn't finished
ab23a7768739a2 Dave Chinner      2021-08-06  529  	 * updating the incore state yet.  The AGI buffer will be dirty and
ab23a7768739a2 Dave Chinner      2021-08-06  530  	 * locked to the icreate transaction, so a synchronous push of the
ab23a7768739a2 Dave Chinner      2021-08-06  531  	 * inodegc workers would result in deadlock.  For a regular iget, the
ab23a7768739a2 Dave Chinner      2021-08-06  532  	 * worker is running already, so we might as well wait.
ab23a7768739a2 Dave Chinner      2021-08-06  533  	 *
33479e0542df06 Dave Chinner      2012-10-08  534  	 * XXX(hch): eventually we should do something equivalent to
33479e0542df06 Dave Chinner      2012-10-08  535  	 *	     wait_on_inode to wait for these flags to be cleared
33479e0542df06 Dave Chinner      2012-10-08  536  	 *	     instead of polling for it.
33479e0542df06 Dave Chinner      2012-10-08  537  	 */
ab23a7768739a2 Dave Chinner      2021-08-06  538  	if (ip->i_flags & (XFS_INEW | XFS_IRECLAIM | XFS_INACTIVATING))
77b4d2861e8381 Darrick J. Wong   2021-06-18  539  		goto out_skip;
33479e0542df06 Dave Chinner      2012-10-08  540  
ab23a7768739a2 Dave Chinner      2021-08-06  541  	if (ip->i_flags & XFS_NEED_INACTIVE) {
ab23a7768739a2 Dave Chinner      2021-08-06  542  		/* Unlinked inodes cannot be re-grabbed. */
ab23a7768739a2 Dave Chinner      2021-08-06  543  		if (VFS_I(ip)->i_nlink == 0) {
ab23a7768739a2 Dave Chinner      2021-08-06  544  			error = -ENOENT;
ab23a7768739a2 Dave Chinner      2021-08-06  545  			goto out_error;
ab23a7768739a2 Dave Chinner      2021-08-06  546  		}
ab23a7768739a2 Dave Chinner      2021-08-06  547  		goto out_inodegc_flush;
ab23a7768739a2 Dave Chinner      2021-08-06  548  	}
ab23a7768739a2 Dave Chinner      2021-08-06  549  
33479e0542df06 Dave Chinner      2012-10-08  550  	/*
afca6c5b2595fc Dave Chinner      2018-04-17  551  	 * Check the inode free state is valid. This also detects lookup
afca6c5b2595fc Dave Chinner      2018-04-17  552  	 * racing with unlinks.
33479e0542df06 Dave Chinner      2012-10-08  553  	 */
afca6c5b2595fc Dave Chinner      2018-04-17  554  	error = xfs_iget_check_free_state(ip, flags);
afca6c5b2595fc Dave Chinner      2018-04-17  555  	if (error)
33479e0542df06 Dave Chinner      2012-10-08  556  		goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  557  
77b4d2861e8381 Darrick J. Wong   2021-06-18  558  	/* Skip inodes that have no vfs state. */
77b4d2861e8381 Darrick J. Wong   2021-06-18  559  	if ((flags & XFS_IGET_INCORE) &&
77b4d2861e8381 Darrick J. Wong   2021-06-18  560  	    (ip->i_flags & XFS_IRECLAIMABLE))
77b4d2861e8381 Darrick J. Wong   2021-06-18  561  		goto out_skip;
378f681c4b588c Darrick J. Wong   2017-06-19  562  
77b4d2861e8381 Darrick J. Wong   2021-06-18  563  	/* The inode fits the selection criteria; process it. */
77b4d2861e8381 Darrick J. Wong   2021-06-18  564  	if (ip->i_flags & XFS_IRECLAIMABLE) {
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  565  		/*
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  566  		 * We need to make it look like the inode is being reclaimed to
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  567  		 * prevent the actual reclaim workers from stomping over us
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  568  		 * while we recycle the inode.  We can't clear the radix tree
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  569  		 * tag yet as it requires pag_ici_lock to be held exclusive.
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  570  		 */
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  571  		if (!xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
28b4b0596343d1 Long Li           2022-11-17  572  			goto out_skip;
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  573  		ip->i_flags |= XFS_IRECLAIM;
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  574  		spin_unlock(&ip->i_flags_lock);
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  575  		rcu_read_unlock();
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  576  
dcfa98bb5f7816 Christoph Hellwig 2025-11-24  577  		error = xfs_iget_recycle(pag, ip);
ff7bebeb91f8cc Darrick J. Wong   2021-06-18  578  		if (error)
ff7bebeb91f8cc Darrick J. Wong   2021-06-18 @579  			return error;
33479e0542df06 Dave Chinner      2012-10-08  580  	} else {
33479e0542df06 Dave Chinner      2012-10-08  581  		/* If the VFS inode is being torn down, pause and try again. */
77b4d2861e8381 Darrick J. Wong   2021-06-18  582  		if (!igrab(inode))
77b4d2861e8381 Darrick J. Wong   2021-06-18  583  			goto out_skip;
33479e0542df06 Dave Chinner      2012-10-08  584  
33479e0542df06 Dave Chinner      2012-10-08  585  		/* We've got a live one. */
33479e0542df06 Dave Chinner      2012-10-08  586  		spin_unlock(&ip->i_flags_lock);
33479e0542df06 Dave Chinner      2012-10-08  587  		rcu_read_unlock();
33479e0542df06 Dave Chinner      2012-10-08  588  		trace_xfs_iget_hit(ip);
33479e0542df06 Dave Chinner      2012-10-08  589  	}
33479e0542df06 Dave Chinner      2012-10-08  590  
33479e0542df06 Dave Chinner      2012-10-08  591  	if (lock_flags != 0)
33479e0542df06 Dave Chinner      2012-10-08  592  		xfs_ilock(ip, lock_flags);
33479e0542df06 Dave Chinner      2012-10-08  593  
378f681c4b588c Darrick J. Wong   2017-06-19  594  	if (!(flags & XFS_IGET_INCORE))
dae2f8ed7992e8 Ira Weiny         2020-04-30  595  		xfs_iflags_clear(ip, XFS_ISTALE);
ff6d6af2351cae Bill O'Donnell    2015-10-12  596  	XFS_STATS_INC(mp, xs_ig_found);
33479e0542df06 Dave Chinner      2012-10-08  597  
33479e0542df06 Dave Chinner      2012-10-08  598  	return 0;
33479e0542df06 Dave Chinner      2012-10-08  599  
77b4d2861e8381 Darrick J. Wong   2021-06-18  600  out_skip:
77b4d2861e8381 Darrick J. Wong   2021-06-18  601  	trace_xfs_iget_skip(ip);
77b4d2861e8381 Darrick J. Wong   2021-06-18  602  	XFS_STATS_INC(mp, xs_ig_frecycle);
77b4d2861e8381 Darrick J. Wong   2021-06-18  603  	error = -EAGAIN;
33479e0542df06 Dave Chinner      2012-10-08  604  out_error:
33479e0542df06 Dave Chinner      2012-10-08  605  	spin_unlock(&ip->i_flags_lock);
33479e0542df06 Dave Chinner      2012-10-08  606  	rcu_read_unlock();
33479e0542df06 Dave Chinner      2012-10-08  607  	return error;
ab23a7768739a2 Dave Chinner      2021-08-06  608  
ab23a7768739a2 Dave Chinner      2021-08-06  609  out_inodegc_flush:
ab23a7768739a2 Dave Chinner      2021-08-06  610  	spin_unlock(&ip->i_flags_lock);
ab23a7768739a2 Dave Chinner      2021-08-06  611  	rcu_read_unlock();
ab23a7768739a2 Dave Chinner      2021-08-06  612  	/*
ab23a7768739a2 Dave Chinner      2021-08-06  613  	 * Do not wait for the workers, because the caller could hold an AGI
ab23a7768739a2 Dave Chinner      2021-08-06  614  	 * buffer lock.  We're just going to sleep in a loop anyway.
ab23a7768739a2 Dave Chinner      2021-08-06  615  	 */
ab23a7768739a2 Dave Chinner      2021-08-06  616  	if (xfs_is_inodegc_enabled(mp))
ab23a7768739a2 Dave Chinner      2021-08-06  617  		xfs_inodegc_queue_all(mp);
ab23a7768739a2 Dave Chinner      2021-08-06  618  	return -EAGAIN;
33479e0542df06 Dave Chinner      2012-10-08  619  }
33479e0542df06 Dave Chinner      2012-10-08  620  

:::::: The code at line 579 was first introduced by commit
:::::: ff7bebeb91f8cc2e26e7dabbf301da5ec0e9328c xfs: refactor the inode recycling code

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
