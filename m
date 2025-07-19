Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7AD1AAC9
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752905983; cv=none; b=gd3/rZ0GttBZx0NhmLML0kTBn6Wid4dmotYzkVJQ4JBgWmcXPWhUKwgAgG8U8euI/UQ0Ytk+vBwRsXQ6YanYF3k/inn85WTBqEEri6NMjXyt+6yztUjuFOp91i54oafnuUD3Y6UBco249jNdAI8EuhqYBJJBew24JGPauRjHeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752905983; c=relaxed/simple;
	bh=FUQazbfPa8h4dvdItQOuJrSe/yFpf4zRxHCuzzb1ghA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CB5JVIfdALhVJt/BvB1eEzOuzuP2dLWEmYnkKVBXQ+zAwX3SU3G0/pt3HvQc/V4PvSyO8rm15fLhOWe8LxQMvwZpeh4td/HnJ3v92JZCzSXOYlInGOs2mVCtCFWI1mwZ8GL/oXKOAjWa14TiTKJB4vjX+5iEJKtK5KP4CQYSmso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNckZhSD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNckZhSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752905981; x=1784441981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUQazbfPa8h4dvdItQOuJrSe/yFpf4zRxHCuzzb1ghA=;
  b=DNckZhSDSmDcMP+LqHoXZvoj1jyAzs9o7ROW7lNZ0FGvibXXRQgYkSbI
   8HXIjSwWkXQuzTlqbA1+235aTE/9ddfzVnLjyc3FPpdqECApMGAIQWtLv
   q1c5vRTtuHYhdLNcoP+pBRNr87deRiZiuzdpw2MRys4A5eYlVySuGsP9l
   EQQwfcfN583ArhU5ZP44lMcubJRJrHOtzyFrgcLMrjV9qZj6hD2TeOg+5
   awgkDtDG6gTEi4B6TUVQMZWEfEc8iVJIVNN7JLaYZJgx9HI4t65uAHgDU
   IciTCwU7ewzjf4iihKi+21hwf8t9WTw9yGY/jL994fEqSEhtLAOT3TTjf
   Q==;
X-CSE-ConnectionGUID: lS9Pfa0ZTUasmYZpIdObSw==
X-CSE-MsgGUID: TkMH4wwyRnO6j9lf9HZY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58857307"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="58857307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 23:19:40 -0700
X-CSE-ConnectionGUID: sRlPceEkQmizLNawNoGBdQ==
X-CSE-MsgGUID: 93QukeI1Tu+L+M8GSSUVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="195474387"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 23:19:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud0v3-000FHL-10;
	Sat, 19 Jul 2025 06:19:37 +0000
Date: Sat, 19 Jul 2025 14:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xfs-linux:next-merge 30/40] fs/xfs/xfs_rtalloc.c:1691
 xfs_rtmount_inodes() error: uninitialized symbol 'error'.
Message-ID: <202507191441.DGmls6Eq-lkp@intel.com>
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
CC: linux-xfs@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git next-merge
head:   414d21d65b8e15f2b45aa6d61fa277c7068a5d81
commit: e967dc40d5017671e5e278aea858516440aa068a [30/40] xfs: return the allocated transaction from xfs_trans_alloc_empty
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: arc-randconfig-r073-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191441.DGmls6Eq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507191441.DGmls6Eq-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1691 xfs_rtmount_inodes() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:333 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/error +1691 fs/xfs/xfs_rtalloc.c

65b1231b8cea7f Darrick J. Wong   2024-11-03  1660  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1661  /*
355e3532132b48 Omar Sandoval     2018-12-12  1662   * Get the bitmap and summary inodes and the summary cache into the mount
355e3532132b48 Omar Sandoval     2018-12-12  1663   * structure at mount time.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1664   */
dcf606914334c6 Darrick J. Wong   2024-11-03  1665  int
^1da177e4c3f41 Linus Torvalds    2005-04-16  1666  xfs_rtmount_inodes(
dcf606914334c6 Darrick J. Wong   2024-11-03  1667  	struct xfs_mount	*mp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1668  {
dcf606914334c6 Darrick J. Wong   2024-11-03  1669  	struct xfs_trans	*tp;
87fe4c34a383d5 Darrick J. Wong   2024-11-03  1670  	struct xfs_rtgroup	*rtg = NULL;
dcf606914334c6 Darrick J. Wong   2024-11-03  1671  	int			error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1672  
e967dc40d50176 Christoph Hellwig 2025-07-16  1673  	tp = xfs_trans_alloc_empty(mp);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1674  	if (xfs_has_rtgroups(mp) && mp->m_sb.sb_rgcount > 0) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1675  		error = xfs_rtginode_load_parent(tp);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1676  		if (error)
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1677  			goto out_cancel;
65b1231b8cea7f Darrick J. Wong   2024-11-03  1678  	}
65b1231b8cea7f Darrick J. Wong   2024-11-03  1679  
65b1231b8cea7f Darrick J. Wong   2024-11-03  1680  	while ((rtg = xfs_rtgroup_next(mp, rtg))) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1681  		error = xfs_rtmount_rtg(mp, tp, rtg);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1682  		if (error) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1683  			xfs_rtgroup_rele(rtg);
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1684  			xfs_rtunmount_inodes(mp);
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1685  			break;
65b1231b8cea7f Darrick J. Wong   2024-11-03  1686  		}
65b1231b8cea7f Darrick J. Wong   2024-11-03  1687  	}
87fe4c34a383d5 Darrick J. Wong   2024-11-03  1688  
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1689  out_cancel:
dcf606914334c6 Darrick J. Wong   2024-11-03  1690  	xfs_trans_cancel(tp);
9e13975bb0620c Darrick J. Wong   2022-11-06 @1691  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1692  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1693  

:::::: The code at line 1691 was first introduced by commit
:::::: 9e13975bb0620c2bfa1a4d2943e7eb8514f7708e xfs: load rtbitmap and rtsummary extent mapping btrees at mount time

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
