Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AB2D8777
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706833; cv=none; b=EX6HTIIvgIGl08xErm+wqhq2XKNiVnOn7wIQKCUnRQ9odcx9wIV7c9XK1tp+K365RaYJuTHAoAZdGldU/MAfoJuNpqYzZ1SqhLSiHpr/+ePiEuO6LkyooF5yz2248DcxR61fDThvq2oo4krMw7sBBxxJt5jEqz0YJijl674RBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706833; c=relaxed/simple;
	bh=A6CcjwCA99h+ziZRWRw3/GvRQjRDxrrFz6YhqM9WRHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fu95D2yuuS+jkQIqhorqwEJY+fOWLBEqpX9lwT3f2rawoC8kfIQGel4EKNi2CqKLPH3wN2Qy/gFrfoINCj10C6xrmQWuvCqz5+BgCvoA7OgYOKVGQ2/pxpJvyYgUGIf4jABd0oGO03hwfdzC02AlIuojSgHDPZvx5XiapLSkw+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByNV0838; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByNV0838"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758706828; x=1790242828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6CcjwCA99h+ziZRWRw3/GvRQjRDxrrFz6YhqM9WRHg=;
  b=ByNV0838ByDU3Z2nVivH3j7rrcaKM2rCGL1Ekhx9KLzhi1JLjJMzbkD/
   4ZaBZsjIaMW6MRD3RUF9WbnClXJ0IDr2hSdXcIzYbemnpnipTjIGqAhxe
   oYPt5I9br/5vsXTcRmOGpYszC6L9yu3kXJBmLLSy7vwPJJ4oMiaRkpG0A
   ZRAMdp1wJyk0p5Aq20BGJwHIXbNaktkHkaWqmmBHdNiRL5fz+tTJdP/Sp
   NDw/YOlKbf3zqRjLIi6i9bus1xrh6hyrykbu/psZxs27z87n/92rSbXS+
   vaaRz9AewqLLlD5vJvVNDHrmtb8A9MNIQ0oM8nLvXhBDKAMNHoOwR2un7
   Q==;
X-CSE-ConnectionGUID: wGRZmErcTCaMZcCoc67UAw==
X-CSE-MsgGUID: nGRX6P50TS6LIsEQ/mvGbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63625230"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="63625230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 02:40:27 -0700
X-CSE-ConnectionGUID: b0yY5pgHTFuRbLYJ6SGzTw==
X-CSE-MsgGUID: wIoDZoGSQ9aWfubgSdnTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176825582"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 02:40:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Lyk-00040f-2T;
	Wed, 24 Sep 2025 09:40:02 +0000
Date: Wed, 24 Sep 2025 17:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:cap-analysis 7/13] fs/xfs/xfs_qm.c:332
 xfs_qm_dqattach_one() warn: address of NULL pointer 'dqp'
Message-ID: <202509241747.PtqBRxAZ-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git cap-analysis
head:   f0fefaa266b6cdc474b78bb5842ee7959505e166
commit: 2c48097f247c64fa211cee7ef387fcd0e8e04c14 [7/13] xfs: remove xfs_dqunlock and friends
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250924/202509241747.PtqBRxAZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509241747.PtqBRxAZ-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_qm.c:332 xfs_qm_dqattach_one() warn: address of NULL pointer 'dqp'
fs/xfs/xfs_qm.c:1976 xfs_qm_vop_dqalloc() warn: address of NULL pointer 'gq'
fs/xfs/xfs_qm.c:1994 xfs_qm_vop_dqalloc() warn: address of NULL pointer 'pq'
fs/xfs/xfs_qm.c:1954 xfs_qm_vop_dqalloc() warn: address of NULL pointer 'uq'

vim +/dqp +332 fs/xfs/xfs_qm.c

^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  290  
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  291  STATIC int
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  292  xfs_qm_dqattach_one(
aefe69a45d8490 fs/xfs/xfs_qm.c       Pavel Reichl            2019-11-12  293  	struct xfs_inode	*ip,
1a7ed271653a4f fs/xfs/xfs_qm.c       Darrick J. Wong         2020-07-15  294  	xfs_dqtype_t		type,
4882c19d2a77c4 fs/xfs/xfs_qm.c       Darrick J. Wong         2018-05-04  295  	bool			doalloc,
aefe69a45d8490 fs/xfs/xfs_qm.c       Pavel Reichl            2019-11-12  296  	struct xfs_dquot	**IO_idqpp)
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  297  {
aefe69a45d8490 fs/xfs/xfs_qm.c       Pavel Reichl            2019-11-12  298  	struct xfs_dquot	*dqp;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  299  	int			error;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  300  
3fed24fffc76dd fs/xfs/xfs_qm.c       Matthew Wilcox (Oracle  2024-02-19  301) 	xfs_assert_ilocked(ip, XFS_ILOCK_EXCL);
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  302  	error = 0;
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  303  
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  304  	/*
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  305  	 * See if we already have it in the inode itself. IO_idqpp is &i_udquot
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  306  	 * or &i_gdquot. This made the code look weird, but made the logic a lot
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  307  	 * simpler.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  308  	 */
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  309  	dqp = *IO_idqpp;
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  310  	if (dqp) {
0b1b213fcf3a84 fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-12-14  311  		trace_xfs_dqattach_found(dqp);
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  312  		return 0;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  313  	}
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  314  
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  315  	/*
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  316  	 * Find the dquot from somewhere. This bumps the reference count of
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  317  	 * dquot and returns it locked.  This can return ENOENT if dquot didn't
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  318  	 * exist on disk and we didn't ask it to allocate; ESRCH if quotas got
3c353375761d81 fs/xfs/xfs_qm.c       Dave Chinner            2014-05-05  319  	 * turned off suddenly.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  320  	 */
4882c19d2a77c4 fs/xfs/xfs_qm.c       Darrick J. Wong         2018-05-04  321  	error = xfs_qm_dqget_inode(ip, type, doalloc, &dqp);
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  322  	if (error)
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  323  		return error;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  324  
0b1b213fcf3a84 fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-12-14  325  	trace_xfs_dqattach_get(dqp);
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  326  
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  327  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  328  	 * dqget may have dropped and re-acquired the ilock, but it guarantees
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  329  	 * that the dquot returned is the one that should go in the inode.
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  330  	 */
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  331  	*IO_idqpp = dqp;
2c48097f247c64 fs/xfs/xfs_qm.c       Christoph Hellwig       2025-09-18 @332  	mutex_unlock(&dqp->q_qlock);
8e9b6e7fa4544e fs/xfs/quota/xfs_qm.c Christoph Hellwig       2009-02-08  333  	return 0;
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  334  }
^1da177e4c3f41 fs/xfs/quota/xfs_qm.c Linus Torvalds          2005-04-16  335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
