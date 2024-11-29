Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B34E156C72
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 06:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732861102; cv=none; b=ffgnKrw1DgT8U96nnOfi9DqsU4mmNQO8cfTzE2gJ9gpKacYX1pbBaVtOh6VrB5Y0/QK+RLhgEGetOhuV32Y4qU7+TmosdcAqcshQ07LI7aE2huD54G3L9jHT21nx8XQArg48UvzaqlLC29QEfNIrs4+ZslD8rYvvLROx9QP8QhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732861102; c=relaxed/simple;
	bh=y1MftWDu8k157NpJ8U6XXL0kWLokSrLZVR9daGFpF3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFgbWmzfm4OGiJZ++eWl3wEuaupLZInJcDacbalY3sIjvHutYKD3EsNTX//YolT2MPh1nhUW8/BW4/w6jmT3QTSUgvWBkC2BuLaq4LdBVBtGssAzneYZog5tsKx3ror+FumsYvQ+DHnjWj+EJGN99NvR+Osq70XbVTkas/nV2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It25zOIS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It25zOIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732861100; x=1764397100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1MftWDu8k157NpJ8U6XXL0kWLokSrLZVR9daGFpF3s=;
  b=It25zOISgBQx/MhBeusrLIsvjzgDmxS8YZ4dtWMxf1DMz/GoUGF7pNve
   HXAHcnR6GMj9NWqLVEuDMYEWIa41gutuvW5K44R0CD3jqoVKtmVoLbkKP
   OSec1TY+AOxMzPVk54e+GKLf38ngBbiwps87BgyFGms9IyZ3CUJURXxze
   Xz4vo0nEKOaG9b06SC2C10WbJOoX+pCP7VLqsDRDU0oGKMapdhCMRDj2x
   lCJivYgTzcV0OI1/HQgI1kS8rYhrXQbOAfPukUVq86+PBEALvqnMtNQQ9
   mjYVr0Bq/cDtdYiIi/OJvigPWTxpSBu/Zm5V24ifN8fsqjncuTT/bAk2E
   Q==;
X-CSE-ConnectionGUID: IKExvUCJQ1S3CjuJ7sazmA==
X-CSE-MsgGUID: hE5ZvsFrQMKXSdNMxvO/JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32461541"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="32461541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:18:17 -0800
X-CSE-ConnectionGUID: S+LYiAyDR9mo3f4TSGfIdw==
X-CSE-MsgGUID: QWgrU4jmRTGvMEhjx6+/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="93257388"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 22:18:16 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuKT-00003j-1y;
	Fri, 29 Nov 2024 06:18:13 +0000
Date: Fri, 29 Nov 2024 14:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:defrag-freespace 258/258] fs/xfs/xfs_bmap_util.c:2328
 xfs_map_free_rt_extent() warn: missing error code 'error'
Message-ID: <202411291429.a3CqZypn-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git defrag-freespace
head:   3a05c9546fce4d9c2d8b2a40f0538e8bb8941926
commit: 456cb26b1542e21901f9f9adcb5a5b6f8f4a9071 [258/258] xfs: implement FALLOC_FL_MAP_FREE for realtime files
:::::: branch date: 28 hours ago
:::::: commit date: 10 days ago
config: nios2-randconfig-r071-20241119 (https://download.01.org/0day-ci/archive/20241129/202411291429.a3CqZypn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411291429.a3CqZypn-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:2328 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_bmap_util.c:1834 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
fs/xfs/xfs_bmap_util.c:2103 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +2328 fs/xfs/xfs_bmap_util.c

456cb26b1542e2 Darrick J. Wong 2024-10-15  2292  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2293  /* Find a free extent in this rtgroup and map it into the file. */
456cb26b1542e2 Darrick J. Wong 2024-10-15  2294  STATIC int
456cb26b1542e2 Darrick J. Wong 2024-10-15  2295  xfs_map_free_rt_extent(
456cb26b1542e2 Darrick J. Wong 2024-10-15  2296  	struct xfs_inode	*ip,
456cb26b1542e2 Darrick J. Wong 2024-10-15  2297  	struct xfs_rtgroup	*rtg,
456cb26b1542e2 Darrick J. Wong 2024-10-15  2298  	xfs_rtxnum_t		*cursor,
456cb26b1542e2 Darrick J. Wong 2024-10-15  2299  	xfs_rtxnum_t		end_rtx)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2300  {
456cb26b1542e2 Darrick J. Wong 2024-10-15  2301  	struct xfs_bmbt_irec	irec;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2302  	struct xfs_mount	*mp = ip->i_mount;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2303  	struct xfs_trans	*tp;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2304  	loff_t			endpos;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2305  	xfs_rtxlen_t		len_rtx;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2306  	xfs_extlen_t		free_len;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2307  	int			error;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2308  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2309  	if (fatal_signal_pending(current))
456cb26b1542e2 Darrick J. Wong 2024-10-15  2310  		return -EINTR;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2311  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2312  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
456cb26b1542e2 Darrick J. Wong 2024-10-15  2313  			&tp);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2314  	if (error)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2315  		return error;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2316  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2317  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_BITMAP);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2318  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2319  	error = xfs_rtallocate_find_freesp(tp, rtg, cursor, end_rtx, &len_rtx);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2320  	if (error)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2321  		goto out_rtglock;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2322  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2323  	/*
456cb26b1542e2 Darrick J. Wong 2024-10-15  2324  	 * If off_rtx is beyond the end of the rt device or is past what the
456cb26b1542e2 Darrick J. Wong 2024-10-15  2325  	 * user asked for, bail out.
456cb26b1542e2 Darrick J. Wong 2024-10-15  2326  	 */
456cb26b1542e2 Darrick J. Wong 2024-10-15  2327  	if (*cursor >= end_rtx)
456cb26b1542e2 Darrick J. Wong 2024-10-15 @2328  		goto out_rtglock;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2329  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2330  	free_len = xfs_rtxlen_to_extlen(mp, len_rtx);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2331  	error = xfs_map_free_reserve_more(tp, ip, &free_len);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2332  	if (error)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2333  		goto out_rtglock;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2334  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2335  	error = xfs_map_free_rtgroup_extent(tp, ip, rtg, *cursor, len_rtx,
456cb26b1542e2 Darrick J. Wong 2024-10-15  2336  			&irec);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2337  	if (error == -EAGAIN) {
456cb26b1542e2 Darrick J. Wong 2024-10-15  2338  		/*
456cb26b1542e2 Darrick J. Wong 2024-10-15  2339  		 * The allocator was busy and told us to try again.  The
456cb26b1542e2 Darrick J. Wong 2024-10-15  2340  		 * transaction could be dirty due to a nrext64 upgrade, so
456cb26b1542e2 Darrick J. Wong 2024-10-15  2341  		 * commit the transaction and try again without advancing
456cb26b1542e2 Darrick J. Wong 2024-10-15  2342  		 * the cursor.
456cb26b1542e2 Darrick J. Wong 2024-10-15  2343  		 *
456cb26b1542e2 Darrick J. Wong 2024-10-15  2344  		 * XXX do we fail to unlock something here?
456cb26b1542e2 Darrick J. Wong 2024-10-15  2345  		 */
456cb26b1542e2 Darrick J. Wong 2024-10-15  2346  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2347  		error = xfs_trans_commit(tp);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2348  		xfs_iunlock(ip, XFS_ILOCK_EXCL);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2349  		return error;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2350  	}
456cb26b1542e2 Darrick J. Wong 2024-10-15  2351  	if (error)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2352  		goto out_cancel;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2353  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2354  	/* Update isize if needed. */
456cb26b1542e2 Darrick J. Wong 2024-10-15  2355  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2356  	if (endpos > i_size_read(VFS_I(ip))) {
456cb26b1542e2 Darrick J. Wong 2024-10-15  2357  		i_size_write(VFS_I(ip), endpos);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2358  		ip->i_disk_size = endpos;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2359  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2360  	}
456cb26b1542e2 Darrick J. Wong 2024-10-15  2361  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2362  	error = xfs_trans_commit(tp);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2363  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2364  	if (error)
456cb26b1542e2 Darrick J. Wong 2024-10-15  2365  		return error;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2366  
456cb26b1542e2 Darrick J. Wong 2024-10-15  2367  	ASSERT(xfs_blen_to_rtxoff(mp, irec.br_blockcount) == 0);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2368  	*cursor += xfs_extlen_to_rtxlen(mp, irec.br_blockcount);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2369  	return 0;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2370  out_rtglock:
456cb26b1542e2 Darrick J. Wong 2024-10-15  2371  	xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2372  out_cancel:
456cb26b1542e2 Darrick J. Wong 2024-10-15  2373  	xfs_trans_cancel(tp);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2374  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
456cb26b1542e2 Darrick J. Wong 2024-10-15  2375  	return error;
456cb26b1542e2 Darrick J. Wong 2024-10-15  2376  }
456cb26b1542e2 Darrick J. Wong 2024-10-15  2377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
