Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2CA5E
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrZzxY/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702427299; x=1733963299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1UPoEybXXKoVYFjVl/vG2Uc5NlJfVOlQP9EkI25qGOQ=;
  b=nrZzxY/wQmBWEcLVemghx2oQlHKDx9GMklAv90HR+Va7ZuluRI22/N9f
   XiYthrPWlL2hqTAARln/HDNnhE7ElkecRWCZbwayj+k1POhDX7ghqns2C
   wFl2t07219DTxW+ecp75NFIHXtlHgMn+QNU7ZY/U7jwNcpvl52WAH2Hux
   nrscWppXJ07T3Zi2SFeXh9jbbNLYyjrjeiNBa/rMMg30O8Dlt54z3sbDc
   EAUOaJAeH6psQqEMXzDrM9sMmVoNvbvvF5le3I4DeK7KWAz4JuW0rNeSV
   SIXHIXLsT3MZ2Jgt+98VsbMeBO1Ni+XPAgCZb9n71uVuBWbHXOeTbPt7F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392068172"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="392068172"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1020915460"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1020915460"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2023 16:28:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDD6i-000Jtz-09;
	Wed, 13 Dec 2023 00:28:12 +0000
Date: Wed, 13 Dec 2023 08:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 155/205]
 fs/xfs/xfs_xchgrange.c:589:11-12: WARNING opportunity for max()
Message-ID: <202312130827.g4o7KEHX-lkp@intel.com>
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
head:   ae5732f1c245c24e63c885992c35f723f36f79ff
commit: 6bcbdc56bcd1a52709a65aa1dd422f4fb9add400 [155/205] xfs: bind the xfs-specific extent swap code to the vfs-generic file exchange code
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-102-20231212 (https://download.01.org/0day-ci/archive/20231213/202312130827.g4o7KEHX-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130827.g4o7KEHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312130827.g4o7KEHX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:589:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:590:11-12: WARNING opportunity for max()

vim +589 fs/xfs/xfs_xchgrange.c

6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  551  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  552  /*
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  553   * Obtain a quota reservation to make sure we don't hit EDQUOT.  We can skip
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  554   * this if quota enforcement is disabled or if both inodes' dquots are the
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  555   * same.  The qretry structure must be initialized to zeroes before the first
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  556   * call to this function.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  557   */
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  558  STATIC int
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  559  xfs_xchg_range_reserve_quota(
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  560  	struct xfs_trans		*tp,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  561  	const struct xfs_swapext_req	*req,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  562  	unsigned int			*qretry)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  563  {
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  564  	int64_t				ddelta, rdelta;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  565  	int				ip1_error = 0;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  566  	int				error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  567  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  568  	/*
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  569  	 * Don't bother with a quota reservation if we're not enforcing them
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  570  	 * or the two inodes have the same dquots.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  571  	 */
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  572  	if (!XFS_IS_QUOTA_ON(tp->t_mountp) || req->ip1 == req->ip2 ||
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  573  	    (req->ip1->i_udquot == req->ip2->i_udquot &&
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  574  	     req->ip1->i_gdquot == req->ip2->i_gdquot &&
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  575  	     req->ip1->i_pdquot == req->ip2->i_pdquot))
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  576  		return 0;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  577  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  578  	*qretry = 0;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  579  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  580  	/*
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  581  	 * For each file, compute the net gain in the number of regular blocks
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  582  	 * that will be mapped into that file and reserve that much quota.  The
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  583  	 * quota counts must be able to absorb at least that much space.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  584  	 */
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  585  	ddelta = req->ip2_bcount - req->ip1_bcount;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  586  	rdelta = req->ip2_rtbcount - req->ip1_rtbcount;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  587  	if (ddelta > 0 || rdelta > 0) {
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  588  		error = xfs_trans_reserve_quota_nblks(tp, req->ip1,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06 @589  				ddelta > 0 ? ddelta : 0,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  590  				rdelta > 0 ? rdelta : 0,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  591  				false);
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  592  		if (error == -EDQUOT || error == -ENOSPC) {
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  593  			/*
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  594  			 * Save this error and see what happens if we try to
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  595  			 * reserve quota for ip2.  Then report both.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  596  			 */
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  597  			*qretry |= QRETRY_IP1;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  598  			ip1_error = error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  599  			error = 0;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  600  		}
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  601  		if (error)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  602  			return error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  603  	}
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  604  	if (ddelta < 0 || rdelta < 0) {
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  605  		error = xfs_trans_reserve_quota_nblks(tp, req->ip2,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  606  				ddelta < 0 ? -ddelta : 0,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  607  				rdelta < 0 ? -rdelta : 0,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  608  				false);
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  609  		if (error == -EDQUOT || error == -ENOSPC)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  610  			*qretry |= QRETRY_IP2;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  611  		if (error)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  612  			return error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  613  	}
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  614  	if (ip1_error)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  615  		return ip1_error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  616  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  617  	/*
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  618  	 * For each file, forcibly reserve the gross gain in mapped blocks so
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  619  	 * that we don't trip over any quota block reservation assertions.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  620  	 * We must reserve the gross gain because the quota code subtracts from
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  621  	 * bcount the number of blocks that we unmap; it does not add that
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  622  	 * quantity back to the quota block reservation.
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  623  	 */
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  624  	error = xfs_trans_reserve_quota_nblks(tp, req->ip1, req->ip1_bcount,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  625  			req->ip1_rtbcount, true);
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  626  	if (error)
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  627  		return error;
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  628  
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  629  	return xfs_trans_reserve_quota_nblks(tp, req->ip2, req->ip2_bcount,
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  630  			req->ip2_rtbcount, true);
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  631  }
6bcbdc56bcd1a5 Darrick J. Wong 2023-03-06  632  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
