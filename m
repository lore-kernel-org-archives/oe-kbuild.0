Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31821859F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733401582; cv=none; b=rXzeD5yK++XZhJaGUdOE0T9Ai+l1EBc1zlguivghA33qFIl8ZwRZ+vYjpoi+pGjYP1mSaRWqLdNmQxpAkzuTy/on/IZknVlDJ/XoMCvoy+8g1KDiZco9f0V7gqkwWa2nnsnZk2b19zp6fMAJJRRW06GXRvn2Zd4YrsD66qu64ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733401582; c=relaxed/simple;
	bh=i5eDpZGaSvGup5JDjlkJ2tH5x/Xb50EcGNYYS/6gYnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=keqvNVB019veEnQOiQ9madhM0kTtQSLc0FtEMUHhDgghA7PmIA6o5TPN9Ln0/PkpAkIuL+aOGv5bZoenkfM9f5odDOviFSsjOxzdUSUb0S5eKhl1/5/A/O4tvNZCl3vYYrJgr6ZYuHoxnRAGBjnxS41sPN2KpAmLjsH7VIfbuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sy3IP+q0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy3IP+q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733401580; x=1764937580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5eDpZGaSvGup5JDjlkJ2tH5x/Xb50EcGNYYS/6gYnA=;
  b=Sy3IP+q0Qf9760bJUaZlI0LIKhaW3gZBwhti4VeTh7yqdkSGbENP4rd2
   V6XfBWFKBmrsp684kdh5hhW2U4c9DNXW/cn2QAAkyr/n/BNb9xIkUz6BC
   mPHCo4spTxgyH3e0XTySX6Q+F1f3sy1c+oPrXZ5az8MCd4NmCqn+SFNUE
   86HnE5Z3Q+6mSVLNdW1kUDDxZwHsn9ANSCZ7lEbwfaHZXBz3zZO1T2bh8
   TEL7PovfF2uESafr6LLbyt+58/JXGjJIDxRbg8RFgSo75/cIUeXKG18q4
   BT/M95fS1MuvByXbkRwOAqFxKzJ+gTscfb0rm7v8Bmm/Jk3/jBu4zDh7L
   g==;
X-CSE-ConnectionGUID: IZ1chx2DQzmhZ35+oLWnLw==
X-CSE-MsgGUID: UM6SfQFPRySlpdwrMjEgQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33628382"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33628382"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:26:20 -0800
X-CSE-ConnectionGUID: VRnEHSd9QLqaY8N8VK0JXA==
X-CSE-MsgGUID: jFhXU8EvTh2GaewUYrl3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="94520321"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2024 04:26:19 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJAvw-0004B2-1Z;
	Thu, 05 Dec 2024 12:26:16 +0000
Date: Thu, 5 Dec 2024 20:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:health-monitoring 147/163] fs/xfs/xfs_bmap_util.c:2319
 xfs_map_free_rt_extent() warn: missing error code 'error'
Message-ID: <202412052026.wFDbO6zj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   3ef6d3267cdc0cf4ed98d255efb948c8d404eaf9
commit: ab8b9bee7619fb50a2298dee8d3fa549139d5193 [147/163] xfs: implement FALLOC_FL_MAP_FREE for realtime files
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052026.wFDbO6zj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412052026.wFDbO6zj-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:2319 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_bmap_util.c:1825 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
fs/xfs/xfs_bmap_util.c:2094 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +2319 fs/xfs/xfs_bmap_util.c

ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2283  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2284  /* Find a free extent in this rtgroup and map it into the file. */
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2285  STATIC int
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2286  xfs_map_free_rt_extent(
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2287  	struct xfs_inode	*ip,
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2288  	struct xfs_rtgroup	*rtg,
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2289  	xfs_rtxnum_t		*cursor,
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2290  	xfs_rtxnum_t		end_rtx)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2291  {
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2292  	struct xfs_bmbt_irec	irec;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2293  	struct xfs_mount	*mp = ip->i_mount;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2294  	struct xfs_trans	*tp;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2295  	loff_t			endpos;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2296  	xfs_rtxlen_t		len_rtx;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2297  	xfs_extlen_t		free_len;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2298  	int			error;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2299  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2300  	if (fatal_signal_pending(current))
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2301  		return -EINTR;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2302  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2303  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2304  			&tp);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2305  	if (error)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2306  		return error;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2307  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2308  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_BITMAP);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2309  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2310  	error = xfs_rtallocate_find_freesp(tp, rtg, cursor, end_rtx, &len_rtx);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2311  	if (error)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2312  		goto out_rtglock;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2313  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2314  	/*
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2315  	 * If off_rtx is beyond the end of the rt device or is past what the
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2316  	 * user asked for, bail out.
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2317  	 */
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2318  	if (*cursor >= end_rtx)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20 @2319  		goto out_rtglock;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2320  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2321  	free_len = xfs_rtxlen_to_extlen(mp, len_rtx);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2322  	error = xfs_map_free_reserve_more(tp, ip, &free_len);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2323  	if (error)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2324  		goto out_rtglock;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2325  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2326  	error = xfs_map_free_rtgroup_extent(tp, ip, rtg, *cursor, len_rtx,
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2327  			&irec);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2328  	if (error == -EAGAIN) {
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2329  		/*
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2330  		 * The allocator was busy and told us to try again.  The
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2331  		 * transaction could be dirty due to a nrext64 upgrade, so
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2332  		 * commit the transaction and try again without advancing
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2333  		 * the cursor.
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2334  		 *
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2335  		 * XXX do we fail to unlock something here?
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2336  		 */
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2337  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2338  		error = xfs_trans_commit(tp);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2339  		xfs_iunlock(ip, XFS_ILOCK_EXCL);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2340  		return error;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2341  	}
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2342  	if (error)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2343  		goto out_cancel;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2344  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2345  	/* Update isize if needed. */
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2346  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2347  	if (endpos > i_size_read(VFS_I(ip))) {
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2348  		i_size_write(VFS_I(ip), endpos);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2349  		ip->i_disk_size = endpos;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2350  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2351  	}
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2352  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2353  	error = xfs_trans_commit(tp);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2354  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2355  	if (error)
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2356  		return error;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2357  
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2358  	ASSERT(xfs_blen_to_rtxoff(mp, irec.br_blockcount) == 0);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2359  	*cursor += xfs_extlen_to_rtxlen(mp, irec.br_blockcount);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2360  	return 0;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2361  out_rtglock:
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2362  	xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2363  out_cancel:
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2364  	xfs_trans_cancel(tp);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2365  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2366  	return error;
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2367  }
ab8b9bee7619fb5 Darrick J. Wong 2024-11-20  2368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
