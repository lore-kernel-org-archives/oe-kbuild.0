Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09941C9DC9
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028591; cv=none; b=Pq8aTMG1qOTx0Zljk4bY5baJqfusFOmhrGztO2gamquxrG0G7kx5UdoViKCEYiYthHqeO+u8M0sHh2Ir+CwKQODhrQcQCJ78OpieoDH1B9LzDdMKGfrx22ByVy5OX739ud0bT0c9MB3i8fx+aMs9hNkxIKp9viOHF4CzLdLtcj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028591; c=relaxed/simple;
	bh=2BZ4W1rSB88pBhd7jSTHxEYrqIueGAjUecORj0YxNbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgGMTcgATdORw9su55BM858I/Q3d2xUYIEWO5wTcZuIcQSWvEWQ0jMnXHB1AEhJhED4HHEnB/ERzO5BjCDqEZ3JkGhI9jL1NytLeRHp2pkFnJSXORADxaOPGvLlgJ3h3dw4vDHJ6dTkADTf8GSkIKOPCQwtug4xQ0t9m95rWFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWsMKyWe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWsMKyWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723028590; x=1754564590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2BZ4W1rSB88pBhd7jSTHxEYrqIueGAjUecORj0YxNbA=;
  b=GWsMKyWe9H5d5jH7SoO3+I4AUHLDmMAv69Z5Mz9CcQEvpbJZDfiu0Vk7
   Fd+CC01gzmkHJ3bz4vs3Ydbv1Ls2zXafNYDuUpqq6zNF+8bszlDF2xIQ6
   EFxJ6dMv5DE8u4Pune1LDEHeCzQGXoLz3s6ZYIdgVkAr2Mkyg6GqTXtQf
   oeAjYBLmdSMiNQoWDB9XfrB0J6boB76ukkBzGXHUOZyn/Q8w2+N9L5JJJ
   5b6u7MWsCdecIzSpSjqJTxjtl9qChbThsXgylX7V2rorh89cW0KicKMvN
   Ma43mv4Xq0aTgPWGkgzSbTjk3EH8LYOUwrEsUG87fx9/A8hmlkfKKKilA
   A==;
X-CSE-ConnectionGUID: a3tejG0qTGq/HJmsd9XnHA==
X-CSE-MsgGUID: 22bR+6Q2TYeKukR0Ou2lMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24967147"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="24967147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:03:09 -0700
X-CSE-ConnectionGUID: E7h+nig0QWmqcRmZyFNJkg==
X-CSE-MsgGUID: S/kG2gKbS8K8WHYnElePcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56483487"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2024 04:03:09 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbeRe-0005JI-0e;
	Wed, 07 Aug 2024 11:03:06 +0000
Date: Wed, 7 Aug 2024 19:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-per-rtg-bitmap-rebase 48/60] fs/xfs/xfs_rtalloc.c:1157
 xfs_growfs_rt_prep_rtgs() error: uninitialized symbol 'error'.
Message-ID: <202408071825.AfsI6d6W-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap-rebase
head:   a6af886fd0b4ff036a3e9fcc4b9cb0b8db41a36c
commit: fd68ff6669695c8885e8bea955960c089bbefd49 [48/60] xfs: grow the realtime section when realtime groups are enabled
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071825.AfsI6d6W-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408071825.AfsI6d6W-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1157 xfs_growfs_rt_prep_rtgs() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:328 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:1237 xfs_growfs_rt() warn: impossible condition '(new_rgcount > ((-1))) => (0-u32max > u32max)'

vim +/error +1157 fs/xfs/xfs_rtalloc.c

c15015f912ca17 Christoph Hellwig 2024-08-04  1121  
fd68ff6669695c Darrick J. Wong   2024-08-04  1122  /*
fd68ff6669695c Darrick J. Wong   2024-08-04  1123   * Compute the new number of rt groups.
fd68ff6669695c Darrick J. Wong   2024-08-04  1124   *
fd68ff6669695c Darrick J. Wong   2024-08-04  1125   * Changing the rtgroup size is not allowed (even if the rt volume hasn't yet
fd68ff6669695c Darrick J. Wong   2024-08-04  1126   * been initialized) because the userspace ABI doesn't support it.
fd68ff6669695c Darrick J. Wong   2024-08-04  1127   */
fd68ff6669695c Darrick J. Wong   2024-08-04  1128  static int
fd68ff6669695c Darrick J. Wong   2024-08-04  1129  xfs_growfs_rt_prep_rtgs(
fd68ff6669695c Darrick J. Wong   2024-08-04  1130  	struct xfs_mount	*mp,
fd68ff6669695c Darrick J. Wong   2024-08-04  1131  	xfs_rfsblock_t		rblocks,
fd68ff6669695c Darrick J. Wong   2024-08-04  1132  	xfs_extlen_t		rextsize)
fd68ff6669695c Darrick J. Wong   2024-08-04  1133  {
fd68ff6669695c Darrick J. Wong   2024-08-04  1134  	int			error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1135  
fd68ff6669695c Darrick J. Wong   2024-08-04  1136  	/* Set up the realtime superblock if we're adding a new rt section. */
fd68ff6669695c Darrick J. Wong   2024-08-04  1137  	if (xfs_has_rtsb(mp) && mp->m_sb.sb_rblocks == 0) {
fd68ff6669695c Darrick J. Wong   2024-08-04  1138  		error = xfs_growfs_rt_init_super(mp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1139  		if (error)
fd68ff6669695c Darrick J. Wong   2024-08-04  1140  			return error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1141  	}
fd68ff6669695c Darrick J. Wong   2024-08-04  1142  
fd68ff6669695c Darrick J. Wong   2024-08-04  1143  	/* Make sure the /rtgroups dir has been created */
fd68ff6669695c Darrick J. Wong   2024-08-04  1144  	if (!mp->m_rtdirip) {
fd68ff6669695c Darrick J. Wong   2024-08-04  1145  		struct xfs_trans	*tp;
fd68ff6669695c Darrick J. Wong   2024-08-04  1146  
fd68ff6669695c Darrick J. Wong   2024-08-04  1147  		error = xfs_trans_alloc_empty(mp, &tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1148  		if (error)
fd68ff6669695c Darrick J. Wong   2024-08-04  1149  			return error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1150  		error = xfs_rtginode_load_parent(tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1151  		xfs_trans_cancel(tp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1152  
fd68ff6669695c Darrick J. Wong   2024-08-04  1153  		if (error == -ENOENT)
fd68ff6669695c Darrick J. Wong   2024-08-04  1154  			error = xfs_rtginode_mkdir_parent(mp);
fd68ff6669695c Darrick J. Wong   2024-08-04  1155  	}
fd68ff6669695c Darrick J. Wong   2024-08-04  1156  
fd68ff6669695c Darrick J. Wong   2024-08-04 @1157  	return error;
fd68ff6669695c Darrick J. Wong   2024-08-04  1158  }
fd68ff6669695c Darrick J. Wong   2024-08-04  1159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
