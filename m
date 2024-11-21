Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA90274068
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173149; cv=none; b=Q/hGvzc15OVERlHtfN9BTL1CvoLEOPdfmwcRwFtmGHy8W1v2NC6Edrk7XwZspUhm3+J2Qqc3Ji4eiVJpMNd59G5vULabfQ5dxyeWVJc43yl0kp5BbuN5u2/jvJmdzX1jaMjRyrmMx/QpseMpRNyUWgPVDVV6WtpTTfzbjjMcggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173149; c=relaxed/simple;
	bh=xsbr9qUAAOKvMGkIZSBC00FfsCxM6wppR0G9i9/hShU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSXeuqUdztZYt+GowxpPyeqPRUlMv/FnR3voe+1cGM+f92GQIsV5ShJWuxcIQqt6TYkFaIK3sLXQOCpjAENKQvjvn+2e6MeKWcjCn0floGlK1PdytdgHG0Tjy/VjVbk+V2AD56wXPw43XBsw1hE627HfeIbucu086TfbIbHv5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnW2qVW5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnW2qVW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732173148; x=1763709148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsbr9qUAAOKvMGkIZSBC00FfsCxM6wppR0G9i9/hShU=;
  b=lnW2qVW5U7jD2ZJD0lDZCq/YC7k4JGjqxjxmuxh2tEExsue6MX3WAkpn
   HfMpJ8QRvezLpQ2vx0LOG+oVH027sKnJ1CvbjdR7OtAutmRNm5ruv1yVP
   8KK3Z9vVcizOX7OJP+matCbYbsX+c3wikovdSUp+q4zt9ff6v6o1nzoLv
   Ghyrj1h2lXVd6l2n5LdeQasQvCiWc0pP6fXfuwJa02AxcsnFHaouafQ1Y
   i7iYqXmWRF6Zas0M9YeinIb5sxYSJsLK+ajay8BU5iZwjWLTZHCjIESbV
   t4QaAuMjO5MFC4vlYAgDFMEdx/jWfp2fqNZ4kSjgvLk/mnNcmHYX+UQQb
   A==;
X-CSE-ConnectionGUID: Lm0W94f0QxKa7PMQ0WRBmA==
X-CSE-MsgGUID: x2LtB5V5Q/OFdyE6Oa4uQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31632744"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="31632744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 23:12:16 -0800
X-CSE-ConnectionGUID: zRTNT92xTJ+v22Kk4o0p8Q==
X-CSE-MsgGUID: CRFwvvkfQ4qlP03MkD/gMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="121027013"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2024 23:12:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE1MK-0002Yi-2t;
	Thu, 21 Nov 2024 07:12:12 +0000
Date: Thu, 21 Nov 2024 15:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_exchrange.c:114:11-12: WARNING opportunity for max()
Message-ID: <202411211500.WbW2jbuy-lkp@intel.com>
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
head:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
commit: 42672471f938cdab2573f32ce23915b78f0578f4 xfs: bind together the front and back ends of the file range exchange code
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-104-20241115 (https://download.01.org/0day-ci/archive/20241121/202411211500.WbW2jbuy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411211500.WbW2jbuy-lkp@intel.com/

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
