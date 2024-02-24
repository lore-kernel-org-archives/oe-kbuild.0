Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755B17581
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708767277; cv=none; b=aGm7YQ/U0LdZP7OsJPFR7tOnLTM92WTMOHxvr6z7iizvnyRAedfj9pjNbenOPYtduMLZCHCXDdTib+rCYKHDNZo0+YVTH8Qh8BUR/fOp8JcJISN4iC3uzk8stumWkVs1tjGvwd0u73m66sSl2VUexo4G3El/t23CFnLpAstnPkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708767277; c=relaxed/simple;
	bh=EgECPGniSzHXah34S+MaROrKZzo8IpQs8ftfTx8EYaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqvLB0kz36AVuzt5cpjnE95DOl/K/HHfGr+x4fKDhMVYSjrtLnJFIhIamryiexTeX+vnnIVPRtiYDqzkj1WTrcl5m6KXbjRU6xb75hqQ92YKrkBmNhWxCX6U80mDjBc0iqjiF4HA4iLQ8wRnBGGDTN7l/my5HgUfKRzx2n9Zt8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiatPXC4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiatPXC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708767274; x=1740303274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EgECPGniSzHXah34S+MaROrKZzo8IpQs8ftfTx8EYaY=;
  b=ZiatPXC4J3mYYhDHrichNKFjKhP51FtFyw9AWDSK+GCmGnlXdkiR5Uky
   p7VOto5Nbl8Wtrw7NTD1icS1OHMUbzurHPLFQq9p8ihU63CrwwTmFkg6E
   K1vS1cg7aFffx8SNmuw89CFhqoR7MwnjFvoCuCsjFE4fGHRiTxw2Vl/iO
   AWqQcCRZjjKOSLGrzGxJX4z/ameGKLQGaAtuwl6yK9e+mboB4kTiS52p0
   1lh5x+u8Qs6LdrKYxe+6hhaqirwZVoIpyYPwxXdsFZxFCug0lkWCgqphJ
   bvtvHLqbYVLC6mIM6psDi4UCWaU2BfWhESe3wWYHOL20VoAu3OYKrhcsi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6886053"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6886053"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 01:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6082062"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2024 01:34:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdoQQ-0008QC-0g;
	Sat, 24 Feb 2024 09:34:30 +0000
Date: Sat, 24 Feb 2024 17:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:vectorized-scrub 169/290]
 fs/xfs/xfs_exchrange.c:554:11-12: WARNING opportunity for max()
Message-ID: <202402241758.of2kcBiC-lkp@intel.com>
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
head:   99aa1a17c8c616e4c031f7b1b136867f3fcca633
commit: e7f0dcdd13caeaf3e4a002169d3c1080d949090b [169/290] xfs: bind together the front and back ends of the file range exchange code
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241758.of2kcBiC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402241758.of2kcBiC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_exchrange.c:554:11-12: WARNING opportunity for max()
   fs/xfs/xfs_exchrange.c:555:11-12: WARNING opportunity for max()

vim +554 fs/xfs/xfs_exchrange.c

e7f0dcdd13caea Darrick J. Wong 2024-01-09  516  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  517  /*
e7f0dcdd13caea Darrick J. Wong 2024-01-09  518   * Obtain a quota reservation to make sure we don't hit EDQUOT.  We can skip
e7f0dcdd13caea Darrick J. Wong 2024-01-09  519   * this if quota enforcement is disabled or if both inodes' dquots are the
e7f0dcdd13caea Darrick J. Wong 2024-01-09  520   * same.  The qretry structure must be initialized to zeroes before the first
e7f0dcdd13caea Darrick J. Wong 2024-01-09  521   * call to this function.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  522   */
e7f0dcdd13caea Darrick J. Wong 2024-01-09  523  STATIC int
e7f0dcdd13caea Darrick J. Wong 2024-01-09  524  xfs_exchrange_reserve_quota(
e7f0dcdd13caea Darrick J. Wong 2024-01-09  525  	struct xfs_trans		*tp,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  526  	const struct xfs_exchmaps_req	*req,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  527  	unsigned int			*qretry)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  528  {
e7f0dcdd13caea Darrick J. Wong 2024-01-09  529  	int64_t				ddelta, rdelta;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  530  	int				ip1_error = 0;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  531  	int				error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  532  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  533  	/*
e7f0dcdd13caea Darrick J. Wong 2024-01-09  534  	 * Don't bother with a quota reservation if we're not enforcing them
e7f0dcdd13caea Darrick J. Wong 2024-01-09  535  	 * or the two inodes have the same dquots.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  536  	 */
e7f0dcdd13caea Darrick J. Wong 2024-01-09  537  	if (!XFS_IS_QUOTA_ON(tp->t_mountp) || req->ip1 == req->ip2 ||
e7f0dcdd13caea Darrick J. Wong 2024-01-09  538  	    (req->ip1->i_udquot == req->ip2->i_udquot &&
e7f0dcdd13caea Darrick J. Wong 2024-01-09  539  	     req->ip1->i_gdquot == req->ip2->i_gdquot &&
e7f0dcdd13caea Darrick J. Wong 2024-01-09  540  	     req->ip1->i_pdquot == req->ip2->i_pdquot))
e7f0dcdd13caea Darrick J. Wong 2024-01-09  541  		return 0;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  542  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  543  	*qretry = 0;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  544  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  545  	/*
e7f0dcdd13caea Darrick J. Wong 2024-01-09  546  	 * For each file, compute the net gain in the number of regular blocks
e7f0dcdd13caea Darrick J. Wong 2024-01-09  547  	 * that will be mapped into that file and reserve that much quota.  The
e7f0dcdd13caea Darrick J. Wong 2024-01-09  548  	 * quota counts must be able to absorb at least that much space.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  549  	 */
e7f0dcdd13caea Darrick J. Wong 2024-01-09  550  	ddelta = req->ip2_bcount - req->ip1_bcount;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  551  	rdelta = req->ip2_rtbcount - req->ip1_rtbcount;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  552  	if (ddelta > 0 || rdelta > 0) {
e7f0dcdd13caea Darrick J. Wong 2024-01-09  553  		error = xfs_trans_reserve_quota_nblks(tp, req->ip1,
e7f0dcdd13caea Darrick J. Wong 2024-01-09 @554  				ddelta > 0 ? ddelta : 0,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  555  				rdelta > 0 ? rdelta : 0,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  556  				false);
e7f0dcdd13caea Darrick J. Wong 2024-01-09  557  		if (error == -EDQUOT || error == -ENOSPC) {
e7f0dcdd13caea Darrick J. Wong 2024-01-09  558  			/*
e7f0dcdd13caea Darrick J. Wong 2024-01-09  559  			 * Save this error and see what happens if we try to
e7f0dcdd13caea Darrick J. Wong 2024-01-09  560  			 * reserve quota for ip2.  Then report both.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  561  			 */
e7f0dcdd13caea Darrick J. Wong 2024-01-09  562  			*qretry |= QRETRY_IP1;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  563  			ip1_error = error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  564  			error = 0;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  565  		}
e7f0dcdd13caea Darrick J. Wong 2024-01-09  566  		if (error)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  567  			return error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  568  	}
e7f0dcdd13caea Darrick J. Wong 2024-01-09  569  	if (ddelta < 0 || rdelta < 0) {
e7f0dcdd13caea Darrick J. Wong 2024-01-09  570  		error = xfs_trans_reserve_quota_nblks(tp, req->ip2,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  571  				ddelta < 0 ? -ddelta : 0,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  572  				rdelta < 0 ? -rdelta : 0,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  573  				false);
e7f0dcdd13caea Darrick J. Wong 2024-01-09  574  		if (error == -EDQUOT || error == -ENOSPC)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  575  			*qretry |= QRETRY_IP2;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  576  		if (error)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  577  			return error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  578  	}
e7f0dcdd13caea Darrick J. Wong 2024-01-09  579  	if (ip1_error)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  580  		return ip1_error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  581  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  582  	/*
e7f0dcdd13caea Darrick J. Wong 2024-01-09  583  	 * For each file, forcibly reserve the gross gain in mapped blocks so
e7f0dcdd13caea Darrick J. Wong 2024-01-09  584  	 * that we don't trip over any quota block reservation assertions.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  585  	 * We must reserve the gross gain because the quota code subtracts from
e7f0dcdd13caea Darrick J. Wong 2024-01-09  586  	 * bcount the number of blocks that we unmap; it does not add that
e7f0dcdd13caea Darrick J. Wong 2024-01-09  587  	 * quantity back to the quota block reservation.
e7f0dcdd13caea Darrick J. Wong 2024-01-09  588  	 */
e7f0dcdd13caea Darrick J. Wong 2024-01-09  589  	error = xfs_trans_reserve_quota_nblks(tp, req->ip1, req->ip1_bcount,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  590  			req->ip1_rtbcount, true);
e7f0dcdd13caea Darrick J. Wong 2024-01-09  591  	if (error)
e7f0dcdd13caea Darrick J. Wong 2024-01-09  592  		return error;
e7f0dcdd13caea Darrick J. Wong 2024-01-09  593  
e7f0dcdd13caea Darrick J. Wong 2024-01-09  594  	return xfs_trans_reserve_quota_nblks(tp, req->ip2, req->ip2_bcount,
e7f0dcdd13caea Darrick J. Wong 2024-01-09  595  			req->ip2_rtbcount, true);
e7f0dcdd13caea Darrick J. Wong 2024-01-09  596  }
e7f0dcdd13caea Darrick J. Wong 2024-01-09  597  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
