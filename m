Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43015990C
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732088234; cv=none; b=R2HmmAWQvdyBY8AsZ25ZmFE13UVxoTtfPMwcH6qAd5zYlLp32R4bfhSR0xfx6u2VnvfZcM1Pdou5F5ttfseelnVKZ0rHcNQbmiXxSt96kX83Qy29RIzXoDC2Ea87DXbvQl3vpNUM2hGe/HrxhrWzLlTgShWFEkG/0PWmbzqjI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732088234; c=relaxed/simple;
	bh=5Ui4dC+lu+9MikpvnfdINboKgRfB6dK15b6g8Gx2qhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2PZC2qkluC98vgaA5l8M1SDX9BqX6OCpODyn4gLGGz+UF8gjoWPFfFUgVj5vLf1+hVCj5kOEbbtS9v4HtgYg3fMIF+226OxtfVPw8lDULEsahkDNwbaD4bec4tixx5hpv06p1u4TzAmmGGzlo5qBqf/zgSMz04peFaZnPgXjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqNe4VTj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqNe4VTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732088233; x=1763624233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Ui4dC+lu+9MikpvnfdINboKgRfB6dK15b6g8Gx2qhI=;
  b=BqNe4VTjFyBFgcgGApXB5sa5qYX5hBr+0PB0unCxkxJPypQbLYWJcrs6
   VTc860ifZgAUsJwo+/XhzXw26ENv2iy6mowJGwv24aksuBvQi6fDYaery
   LpO6RoJMQWdS/4q1qcAaGulQzULl03ENg1M72c1vls4kjAFmzlJCB1Duf
   mMaodOHTYl7dUrpoz7Tb+3SEmbFSxz6010vMnspJItaymnq/UrVVxa2FM
   2DmUzibrTH88xjbxj5t5FE6wb4+lDvHcyH1BdRzODnY8n0HJqYqkDfjlk
   U3IRiZK+eCfBcPKPZYGdgpqFdLXxwgO5Ur4ZzamHVp0+MU4GaGWSEZloj
   Q==;
X-CSE-ConnectionGUID: OZrH+g8FQ66qzgDmTswcGA==
X-CSE-MsgGUID: Kxy/cwUcTVi0oZ8eJNh7Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35912876"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="35912876"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 23:37:13 -0800
X-CSE-ConnectionGUID: rVDXpgbZTvKaSOewCy+ZwQ==
X-CSE-MsgGUID: EtF7FTPlS5iuaSAbqsV6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89938814"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2024 23:37:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDfGu-0000eB-2g;
	Wed, 20 Nov 2024 07:37:08 +0000
Date: Wed, 20 Nov 2024 15:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:defrag-freespace 258/258] fs/xfs/xfs_bmap_util.c:2328
 xfs_map_free_rt_extent() warn: missing error code 'error'
Message-ID: <202411201512.7BYMxM7f-lkp@intel.com>
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
head:   456cb26b1542e21901f9f9adcb5a5b6f8f4a9071
commit: 456cb26b1542e21901f9f9adcb5a5b6f8f4a9071 [258/258] xfs: implement FALLOC_FL_MAP_FREE for realtime files
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: nios2-randconfig-r071-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201512.7BYMxM7f-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411201512.7BYMxM7f-lkp@intel.com/

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
