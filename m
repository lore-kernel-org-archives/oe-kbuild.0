Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA85C96
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734161857; cv=none; b=WXG+zk7BquhtjRaw/Juph4BP47Xky4HxVrqnf6w78aliO+UYrBy17jpsYFiYdKzrPyWp1sYrb90365ju/sFm5BCHiVpEnSBNYcyFgfahiFyK1XQyQBtzFum8WSVXLezay82S0DCZ5Mlwv/tDQGNUNQxCyq8o7bzJn5z4sG35UV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734161857; c=relaxed/simple;
	bh=600U7oJHqhaUl9zVGgSyk9d7OySL5PTeXccTF9yU2Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOwkMS9gi3GgZS7D0G9zrSC3UQr4EblwxkuUL5sj56zbtUkGSoh5PQP3bUObBbTTY5/s3Qd3CnY5Qp+Hs96tqunsPr/WGPl27hlArjFKmbKP/YOnC0d/ZeGu3MsXRxi1iT1VZSQ5Jobu1qtXL/beiwQgf5KKiNBp/4ZYWth0tAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYtZaJgh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYtZaJgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734161854; x=1765697854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=600U7oJHqhaUl9zVGgSyk9d7OySL5PTeXccTF9yU2Yc=;
  b=AYtZaJghZDUGXBTaVeCQAyU3ByE1T9hA8Qd+Q9uc6525ikppw80OJ2ve
   VZ3iXoT8yzXGZIZGRi4LbfZID9GHjjzj6vSpxUcnytJLPFAnE5mqPSp9g
   zuktpz39f6lQDeYDKgO2Ez4w1iYyxWNdUyuuTgbc7rcO4A7VvIzw0nBHd
   EOBVcJ8ivzc7rZYQ2ye3MrxpquWaWte3B+/dpRKDBmIdESFsRVhYyNInj
   HdyhmCi1VVE9H4DPAzWKaZjVIYbCZMoX33G5JMUpyiEv27Px/nowVgBGP
   zpPYCQaCXSCAEtBDv4QO4slGMkR2iUqfKZpn3DrfSiHNBiwa0ctfqRcyO
   Q==;
X-CSE-ConnectionGUID: ydEz9XyqQxWWeNdkJIu7sA==
X-CSE-MsgGUID: n6rG9HNpSb2WTXw/dXJcuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="60010911"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="60010911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 23:37:34 -0800
X-CSE-ConnectionGUID: rNUo8mwXSfGRaaBQS7JHQg==
X-CSE-MsgGUID: +UUN8nGoTiGj6jNxeaYjNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="96651663"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2024 23:37:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMMiQ-000CmR-1R;
	Sat, 14 Dec 2024 07:37:30 +0000
Date: Sat, 14 Dec 2024 15:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_exchrange.c:114:11-12: WARNING opportunity for max()
Message-ID: <202412141541.LHLhngdU-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: 42672471f938cdab2573f32ce23915b78f0578f4 xfs: bind together the front and back ends of the file range exchange code
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: csky-randconfig-r053-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141541.LHLhngdU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412141541.LHLhngdU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_exchrange.c:114:11-12: WARNING opportunity for max()
   fs/xfs/xfs_exchrange.c:115:11-12: WARNING opportunity for max()

vim +114 fs/xfs/xfs_exchrange.c

42672471f938cd Darrick J. Wong 2024-04-15   76  
42672471f938cd Darrick J. Wong 2024-04-15   77  /*
42672471f938cd Darrick J. Wong 2024-04-15   78   * Obtain a quota reservation to make sure we don't hit EDQUOT.  We can skip
42672471f938cd Darrick J. Wong 2024-04-15   79   * this if quota enforcement is disabled or if both inodes' dquots are the
42672471f938cd Darrick J. Wong 2024-04-15   80   * same.  The qretry structure must be initialized to zeroes before the first
42672471f938cd Darrick J. Wong 2024-04-15   81   * call to this function.
42672471f938cd Darrick J. Wong 2024-04-15   82   */
42672471f938cd Darrick J. Wong 2024-04-15   83  STATIC int
42672471f938cd Darrick J. Wong 2024-04-15   84  xfs_exchrange_reserve_quota(
42672471f938cd Darrick J. Wong 2024-04-15   85  	struct xfs_trans		*tp,
42672471f938cd Darrick J. Wong 2024-04-15   86  	const struct xfs_exchmaps_req	*req,
42672471f938cd Darrick J. Wong 2024-04-15   87  	unsigned int			*qretry)
42672471f938cd Darrick J. Wong 2024-04-15   88  {
42672471f938cd Darrick J. Wong 2024-04-15   89  	int64_t				ddelta, rdelta;
42672471f938cd Darrick J. Wong 2024-04-15   90  	int				ip1_error = 0;
42672471f938cd Darrick J. Wong 2024-04-15   91  	int				error;
42672471f938cd Darrick J. Wong 2024-04-15   92  
42672471f938cd Darrick J. Wong 2024-04-15   93  	/*
42672471f938cd Darrick J. Wong 2024-04-15   94  	 * Don't bother with a quota reservation if we're not enforcing them
42672471f938cd Darrick J. Wong 2024-04-15   95  	 * or the two inodes have the same dquots.
42672471f938cd Darrick J. Wong 2024-04-15   96  	 */
42672471f938cd Darrick J. Wong 2024-04-15   97  	if (!XFS_IS_QUOTA_ON(tp->t_mountp) || req->ip1 == req->ip2 ||
42672471f938cd Darrick J. Wong 2024-04-15   98  	    (req->ip1->i_udquot == req->ip2->i_udquot &&
42672471f938cd Darrick J. Wong 2024-04-15   99  	     req->ip1->i_gdquot == req->ip2->i_gdquot &&
42672471f938cd Darrick J. Wong 2024-04-15  100  	     req->ip1->i_pdquot == req->ip2->i_pdquot))
42672471f938cd Darrick J. Wong 2024-04-15  101  		return 0;
42672471f938cd Darrick J. Wong 2024-04-15  102  
42672471f938cd Darrick J. Wong 2024-04-15  103  	*qretry = 0;
42672471f938cd Darrick J. Wong 2024-04-15  104  
42672471f938cd Darrick J. Wong 2024-04-15  105  	/*
42672471f938cd Darrick J. Wong 2024-04-15  106  	 * For each file, compute the net gain in the number of regular blocks
42672471f938cd Darrick J. Wong 2024-04-15  107  	 * that will be mapped into that file and reserve that much quota.  The
42672471f938cd Darrick J. Wong 2024-04-15  108  	 * quota counts must be able to absorb at least that much space.
42672471f938cd Darrick J. Wong 2024-04-15  109  	 */
42672471f938cd Darrick J. Wong 2024-04-15  110  	ddelta = req->ip2_bcount - req->ip1_bcount;
42672471f938cd Darrick J. Wong 2024-04-15  111  	rdelta = req->ip2_rtbcount - req->ip1_rtbcount;
42672471f938cd Darrick J. Wong 2024-04-15  112  	if (ddelta > 0 || rdelta > 0) {
42672471f938cd Darrick J. Wong 2024-04-15  113  		error = xfs_trans_reserve_quota_nblks(tp, req->ip1,
42672471f938cd Darrick J. Wong 2024-04-15 @114  				ddelta > 0 ? ddelta : 0,
42672471f938cd Darrick J. Wong 2024-04-15  115  				rdelta > 0 ? rdelta : 0,
42672471f938cd Darrick J. Wong 2024-04-15  116  				false);
42672471f938cd Darrick J. Wong 2024-04-15  117  		if (error == -EDQUOT || error == -ENOSPC) {
42672471f938cd Darrick J. Wong 2024-04-15  118  			/*
42672471f938cd Darrick J. Wong 2024-04-15  119  			 * Save this error and see what happens if we try to
42672471f938cd Darrick J. Wong 2024-04-15  120  			 * reserve quota for ip2.  Then report both.
42672471f938cd Darrick J. Wong 2024-04-15  121  			 */
42672471f938cd Darrick J. Wong 2024-04-15  122  			*qretry |= QRETRY_IP1;
42672471f938cd Darrick J. Wong 2024-04-15  123  			ip1_error = error;
42672471f938cd Darrick J. Wong 2024-04-15  124  			error = 0;
42672471f938cd Darrick J. Wong 2024-04-15  125  		}
42672471f938cd Darrick J. Wong 2024-04-15  126  		if (error)
42672471f938cd Darrick J. Wong 2024-04-15  127  			return error;
42672471f938cd Darrick J. Wong 2024-04-15  128  	}
42672471f938cd Darrick J. Wong 2024-04-15  129  	if (ddelta < 0 || rdelta < 0) {
42672471f938cd Darrick J. Wong 2024-04-15  130  		error = xfs_trans_reserve_quota_nblks(tp, req->ip2,
42672471f938cd Darrick J. Wong 2024-04-15  131  				ddelta < 0 ? -ddelta : 0,
42672471f938cd Darrick J. Wong 2024-04-15  132  				rdelta < 0 ? -rdelta : 0,
42672471f938cd Darrick J. Wong 2024-04-15  133  				false);
42672471f938cd Darrick J. Wong 2024-04-15  134  		if (error == -EDQUOT || error == -ENOSPC)
42672471f938cd Darrick J. Wong 2024-04-15  135  			*qretry |= QRETRY_IP2;
42672471f938cd Darrick J. Wong 2024-04-15  136  		if (error)
42672471f938cd Darrick J. Wong 2024-04-15  137  			return error;
42672471f938cd Darrick J. Wong 2024-04-15  138  	}
42672471f938cd Darrick J. Wong 2024-04-15  139  	if (ip1_error)
42672471f938cd Darrick J. Wong 2024-04-15  140  		return ip1_error;
42672471f938cd Darrick J. Wong 2024-04-15  141  
42672471f938cd Darrick J. Wong 2024-04-15  142  	/*
42672471f938cd Darrick J. Wong 2024-04-15  143  	 * For each file, forcibly reserve the gross gain in mapped blocks so
42672471f938cd Darrick J. Wong 2024-04-15  144  	 * that we don't trip over any quota block reservation assertions.
42672471f938cd Darrick J. Wong 2024-04-15  145  	 * We must reserve the gross gain because the quota code subtracts from
42672471f938cd Darrick J. Wong 2024-04-15  146  	 * bcount the number of blocks that we unmap; it does not add that
42672471f938cd Darrick J. Wong 2024-04-15  147  	 * quantity back to the quota block reservation.
42672471f938cd Darrick J. Wong 2024-04-15  148  	 */
42672471f938cd Darrick J. Wong 2024-04-15  149  	error = xfs_trans_reserve_quota_nblks(tp, req->ip1, req->ip1_bcount,
42672471f938cd Darrick J. Wong 2024-04-15  150  			req->ip1_rtbcount, true);
42672471f938cd Darrick J. Wong 2024-04-15  151  	if (error)
42672471f938cd Darrick J. Wong 2024-04-15  152  		return error;
42672471f938cd Darrick J. Wong 2024-04-15  153  
42672471f938cd Darrick J. Wong 2024-04-15  154  	return xfs_trans_reserve_quota_nblks(tp, req->ip2, req->ip2_bcount,
42672471f938cd Darrick J. Wong 2024-04-15  155  			req->ip2_rtbcount, true);
42672471f938cd Darrick J. Wong 2024-04-15  156  }
42672471f938cd Darrick J. Wong 2024-04-15  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
