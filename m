Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9D1CD31
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724500865; cv=none; b=DqfaS7qHPrxlLw65Gj6DsJhMj6VaqWMmd8unZ/pc+4UvQphPxw01WpPomXWnk1hx72gBV1dBHksvpt7N89x20wXz7/MgXF9/0rAuP5Cmyb9KgcAz/NQPCdRKJj8LS7kqRRXsAMegorjgq91g8eWiYX5J4WW/opBk5vv5hwueshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724500865; c=relaxed/simple;
	bh=JzF++jaw/IYxvwmowSIRKaaV5y9UehJJhhRQzg1Mm+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yu7xKZa4IwQR/YZx14m97HEtHRJJh5VEQbbnz2FpphluQQcp5OWgQUN2Kbz3vadu+lgfBr7CNf/McV84acmvjZZR+pYOOP2xDZQOThfIms9dzFxs6/qfSLNdYyTEyBI9wee+g6DU7ce1nJ8j6aWvlzgBwlAozJdUnmvb4KG9gwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALboOX0x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALboOX0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724500863; x=1756036863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzF++jaw/IYxvwmowSIRKaaV5y9UehJJhhRQzg1Mm+Q=;
  b=ALboOX0xlzRq4e7MWsKySztZcjIVG4Jj2K0ivAshgopJN5WMHw2G6ChK
   Cm0ojdGeYZYUhf0DCBKQ2X9xAOwD12agPz/zOR8b6j3eKO9v6bo0Am9U5
   zUrJfosBfM+IXEBH1tTMZtw1RhswoOsQmOJCqwACp0RZEmW8QTM8Frfwa
   cb7Erd08EvqZn/RTGo5Gya4WPKiMpo2FE57/9c2v2qMCDJvOBO4eVMdNu
   l7Ub3nCJAh60aRoKicjAG3y8+ssPMIaJwT475K89kc14WHzKIXt+iYciH
   qHhPdZp6hbgz27WOXf8n4Xtq+h7VbVUmr4gkMB41hf125gwWmr5sTEIoL
   g==;
X-CSE-ConnectionGUID: b4vJY7mLRB+w4rxEZC2NeQ==
X-CSE-MsgGUID: 5ozu6IOXS22cwf1z6N4gwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="33594477"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="33594477"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 05:01:02 -0700
X-CSE-ConnectionGUID: Nz4cPYGTT6eWgb0SoV+SpA==
X-CSE-MsgGUID: NZkYu9zYQleg38VURvg97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="62047378"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Aug 2024 05:01:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shpRz-000ESJ-2f;
	Sat, 24 Aug 2024 12:00:59 +0000
Date: Sat, 24 Aug 2024 20:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:timestats-hoist 100/245] fs/xfs/xfs_rtalloc.c:1193
 xfs_growfs_rt_prep_groups() warn: impossible condition '(*new_rgcount >
 ((-1))) => (0-u32max > u32max)'
Message-ID: <202408241901.LJlWgc9z-lkp@intel.com>
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
head:   2672953f103abef74446981c20b0286f4b3f402f
commit: 50687b5f73722168fcd203c3ae91fa617c147262 [100/245] xfs: grow the realtime section when realtime groups are enabled
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241901.LJlWgc9z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241901.LJlWgc9z-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1193 xfs_growfs_rt_prep_groups() warn: impossible condition '(*new_rgcount > ((-1))) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:328 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.

vim +1193 fs/xfs/xfs_rtalloc.c

cbc2a83deda4f8 Christoph Hellwig 2024-08-15  1176  
50687b5f737221 Darrick J. Wong   2024-08-15  1177  /*
50687b5f737221 Darrick J. Wong   2024-08-15  1178   * Compute the new number of rt groups and ensure that /rtgroups exists.
50687b5f737221 Darrick J. Wong   2024-08-15  1179   *
50687b5f737221 Darrick J. Wong   2024-08-15  1180   * Changing the rtgroup size is not allowed (even if the rt volume hasn't yet
50687b5f737221 Darrick J. Wong   2024-08-15  1181   * been initialized) because the userspace ABI doesn't support it.
50687b5f737221 Darrick J. Wong   2024-08-15  1182   */
50687b5f737221 Darrick J. Wong   2024-08-15  1183  static int
50687b5f737221 Darrick J. Wong   2024-08-15  1184  xfs_growfs_rt_prep_groups(
50687b5f737221 Darrick J. Wong   2024-08-15  1185  	struct xfs_mount	*mp,
50687b5f737221 Darrick J. Wong   2024-08-15  1186  	xfs_rfsblock_t		rblocks,
50687b5f737221 Darrick J. Wong   2024-08-15  1187  	xfs_extlen_t		rextsize,
50687b5f737221 Darrick J. Wong   2024-08-15  1188  	xfs_rgnumber_t		*new_rgcount)
50687b5f737221 Darrick J. Wong   2024-08-15  1189  {
50687b5f737221 Darrick J. Wong   2024-08-15  1190  	int			error;
50687b5f737221 Darrick J. Wong   2024-08-15  1191  
50687b5f737221 Darrick J. Wong   2024-08-15  1192  	*new_rgcount = howmany_64(rblocks, mp->m_sb.sb_rgextents * rextsize);
50687b5f737221 Darrick J. Wong   2024-08-15 @1193  	if (*new_rgcount > XFS_MAX_RGNUMBER)
50687b5f737221 Darrick J. Wong   2024-08-15  1194  		return -EINVAL;
50687b5f737221 Darrick J. Wong   2024-08-15  1195  
50687b5f737221 Darrick J. Wong   2024-08-15  1196  	/* Make sure the /rtgroups dir has been created */
50687b5f737221 Darrick J. Wong   2024-08-15  1197  	if (!mp->m_rtdirip) {
50687b5f737221 Darrick J. Wong   2024-08-15  1198  		struct xfs_trans	*tp;
50687b5f737221 Darrick J. Wong   2024-08-15  1199  
50687b5f737221 Darrick J. Wong   2024-08-15  1200  		error = xfs_trans_alloc_empty(mp, &tp);
50687b5f737221 Darrick J. Wong   2024-08-15  1201  		if (error)
50687b5f737221 Darrick J. Wong   2024-08-15  1202  			return error;
50687b5f737221 Darrick J. Wong   2024-08-15  1203  		error = xfs_rtginode_load_parent(tp);
50687b5f737221 Darrick J. Wong   2024-08-15  1204  		xfs_trans_cancel(tp);
50687b5f737221 Darrick J. Wong   2024-08-15  1205  
50687b5f737221 Darrick J. Wong   2024-08-15  1206  		if (error == -ENOENT)
50687b5f737221 Darrick J. Wong   2024-08-15  1207  			error = xfs_rtginode_mkdir_parent(mp);
50687b5f737221 Darrick J. Wong   2024-08-15  1208  		if (error)
50687b5f737221 Darrick J. Wong   2024-08-15  1209  			return error;
50687b5f737221 Darrick J. Wong   2024-08-15  1210  	}
50687b5f737221 Darrick J. Wong   2024-08-15  1211  
50687b5f737221 Darrick J. Wong   2024-08-15  1212  	return 0;
50687b5f737221 Darrick J. Wong   2024-08-15  1213  }
50687b5f737221 Darrick J. Wong   2024-08-15  1214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
