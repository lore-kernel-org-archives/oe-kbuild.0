Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE11A36B
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726461056; cv=none; b=oxhnuVeCTxA0PWrILpz65Ns6exC+hfkU6CDJWyABXnKw6PYNwoBcwnzlzQOeAzsIf06W0L53lvf4ZODErODo98iihc6vB8Bw1csYPuoYJHrBEHv1BzT9YihTqc7xooLn8Wen9GYYW5YUc2waBiExaogspQBVLBgt6Sn21yEb+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726461056; c=relaxed/simple;
	bh=rgz6iaE8RjGprS2R6uBSTiR9mlnK2xT2OfuKeTX8fLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMBhzPsDmGwVwoMe7hdK2lku7RsVvr1sWcgwW7UzTtDuPM70AxJpg/z8RpfDBJGL/NGBD+S82UMh7fmgAT75/LF34Bd593HPiGsVqFq5ZKXXKMQpHiu4hHdwOya4Rd9+2/dZZnWsGtHnnXKUtJUOmb21odIibMlH5L/yYDcchCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X32BFOfA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X32BFOfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726461054; x=1757997054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgz6iaE8RjGprS2R6uBSTiR9mlnK2xT2OfuKeTX8fLc=;
  b=X32BFOfAFOTdMA8t+9w1Jnu+h3t+ntgeLzlpo/Q01/mpqZg7VthGU9Hh
   sXDegvbtSddC4zmHJxZ2KTe8+nfa2jnvoGfrnp6990oO+jMCSSN7MqCvO
   I7UWK0RE/jJ2IB9HM146JaY2qzOm+Jm0qfX90k9hLZ6hAsREPoGQZXndy
   8oJTA+5dGp3REshpZ0EE/qdKcaHamrGpg2A7msleaQZo+GxVaYuYfFNKy
   95sMveDGwBFq4pmRZxHfzH4w1h/843F+sApuE3yJPKv4bwhdnLSL8vvCm
   c9Yrmv13Pl7BXMUoivudn77yyndWrA3QCEwwkOU98ZTIFYoMrAXmRYpUg
   g==;
X-CSE-ConnectionGUID: /zQV9fEnSgaw1CQZfEVBAw==
X-CSE-MsgGUID: WPNvCFBQSHqVOzHp74I3+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25377492"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25377492"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 21:30:53 -0700
X-CSE-ConnectionGUID: XvZDqZyETGOahJF0rxRV7Q==
X-CSE-MsgGUID: PI6thL64RgyB+56xMKNh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73143258"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2024 21:30:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq3Nx-0009Ny-17;
	Mon, 16 Sep 2024 04:30:49 +0000
Date: Mon, 16 Sep 2024 12:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:timestats-hoist 232/236] fs/xfs/xfs_bmap_util.c:2320
 xfs_map_free_rt_extent() warn: missing error code 'error'
Message-ID: <202409161233.ClaiS0yN-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   e0113e1c58f36eff53a0e8a6c8dc095eb648e579
commit: 74cedeb64e3c1d3aa7320ca1ea2b15083ea3b40e [232/236] xfs: implement FALLOC_FL_MAP_FREE for realtime files
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161233.ClaiS0yN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409161233.ClaiS0yN-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:2320 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_bmap_util.c:1824 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
fs/xfs/xfs_bmap_util.c:2094 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +2320 fs/xfs/xfs_bmap_util.c

74cedeb64e3c1d Darrick J. Wong 2024-08-15  2284  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2285  /* Find a free extent in this rtgroup and map it into the file. */
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2286  STATIC int
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2287  xfs_map_free_rt_extent(
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2288  	struct xfs_inode	*ip,
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2289  	struct xfs_rtgroup	*rtg,
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2290  	xfs_rtxnum_t		*cursor,
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2291  	xfs_rtxnum_t		end_rtx)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2292  {
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2293  	struct xfs_bmbt_irec	irec;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2294  	struct xfs_mount	*mp = ip->i_mount;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2295  	struct xfs_trans	*tp;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2296  	loff_t			endpos;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2297  	xfs_rtxlen_t		len_rtx;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2298  	xfs_extlen_t		free_len;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2299  	int			error;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2300  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2301  	if (fatal_signal_pending(current))
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2302  		return -EINTR;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2303  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2304  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2305  			&tp);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2306  	if (error)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2307  		return error;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2308  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2309  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_BITMAP);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2310  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2311  	error = xfs_rtallocate_find_freesp(tp, rtg, cursor, end_rtx, &len_rtx);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2312  	if (error)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2313  		goto out_rtglock;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2314  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2315  	/*
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2316  	 * If off_rtx is beyond the end of the rt device or is past what the
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2317  	 * user asked for, bail out.
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2318  	 */
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2319  	if (*cursor >= end_rtx)
74cedeb64e3c1d Darrick J. Wong 2024-08-15 @2320  		goto out_rtglock;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2321  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2322  	free_len = xfs_rtxlen_to_extlen(mp, len_rtx);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2323  	error = xfs_map_free_reserve_more(tp, ip, &free_len);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2324  	if (error)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2325  		goto out_rtglock;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2326  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2327  	xfs_rtgroup_trans_join(tp, rtg, XFS_RTGLOCK_BITMAP);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2328  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2329  	error = xfs_map_free_rtgroup_extent(tp, ip, rtg, *cursor, len_rtx,
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2330  			&irec);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2331  	if (error)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2332  		goto out_cancel;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2333  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2334  	/* Update isize if needed. */
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2335  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2336  	if (endpos > i_size_read(VFS_I(ip))) {
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2337  		i_size_write(VFS_I(ip), endpos);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2338  		ip->i_disk_size = endpos;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2339  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2340  	}
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2341  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2342  	error = xfs_trans_commit(tp);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2343  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2344  	if (error)
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2345  		return error;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2346  
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2347  	ASSERT(xfs_rtb_to_rtxoff(mp, irec.br_blockcount) == 0);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2348  	*cursor += xfs_extlen_to_rtxlen(mp, irec.br_blockcount);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2349  	return 0;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2350  out_rtglock:
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2351  	xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_BITMAP);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2352  out_cancel:
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2353  	xfs_trans_cancel(tp);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2354  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2355  	return error;
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2356  }
74cedeb64e3c1d Darrick J. Wong 2024-08-15  2357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
