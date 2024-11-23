Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36C1DFD8
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732365046; cv=none; b=A3cA1ywwM8M+ImHbu42+k7nzB2vGihj59NNUoh5dRXEORGENJMMoNXLPJOqa6t+7TnvGL/j3Ld2jCN/F07PMUmfJOrb66wHiVVZBqVUBfk+y5aPbPOYyu4hCOr9B/BSHQe9rRAjYNpLcd/9mq/12AYr5VRB4aWrLiV1f7+IgObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732365046; c=relaxed/simple;
	bh=xsF0pAKkM0CffRWy+57yytqQIV0SMgyYPAcg9HcPSF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGBh0cjB0+NarChBrG0n6DRWaW7tNQW9iCMX8o+9sZo27Zoo74xkHb+2nZIvZjUbmCwWRFZsD0/KcQxeA2seHDqnM0BFhJWJIag/vfKSdHOHH08+ah0ln/txDwJsJQq+uM5ER129A51UmaWxTEIIaUyhUdxf783VDu7V6teyoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDeiMfk+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDeiMfk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732365044; x=1763901044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsF0pAKkM0CffRWy+57yytqQIV0SMgyYPAcg9HcPSF0=;
  b=eDeiMfk+1gdImDIlkGHn1SfLrWN2MMuMyLIsJHnn9HUkvFJZBfg4hXyf
   Z+Fj9DhrdHDnRKBpa2Y5l1NnLUC/dnRogu6h2ePqfQfyqCy3uMFnBDz95
   c4c/pcuY0KYwT041iAzZqzuqVGZkLvcZRgixW/B1l30nQGQ58IAiXCjcf
   DyEWE8pwUgkLe/Yj4xlOBBdUYs9Czg++0zdWcOvF0R3PIVmMdC3LRHzMg
   2AEYBjiCXG9IE3YxLJFuEOfanwws83NbfLjIrMHYyXlGDjsUfouFsX0fl
   TC/ShGgvmUwkqW6e6eGTdZmuOHNqygDGJ5jGlkLzkoC8dzPonoD0f4el5
   g==;
X-CSE-ConnectionGUID: uJSsNLRzTK2OkU+zfT8Ffg==
X-CSE-MsgGUID: BR9OhHR5TN2FPFzO7VDqoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36176741"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="36176741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 04:30:44 -0800
X-CSE-ConnectionGUID: DBnR6pXbTfGDmN2grOrCPg==
X-CSE-MsgGUID: 2CCIno1KQ9CKpy4c0l7C9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90806822"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Nov 2024 04:30:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEpHc-0004ct-15;
	Sat, 23 Nov 2024 12:30:40 +0000
Date: Sat, 23 Nov 2024 20:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned 89/98] fs/xfs/xfs_fsops.c:346 xfs_growfs_data()
 warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <202411232011.Zes6bDSz-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1d218c27f2f5a8c87669b49292f1fd3432112426
commit: a37a349d7a21f1c61dc54c5771a81aee04a265cd [89/98] xfs: don't allow growfs of the data device with internal RT device
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241123/202411232011.Zes6bDSz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411232011.Zes6bDSz-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_fsops.c:346 xfs_growfs_data() warn: inconsistent returns '&mp->m_growlock'.

vim +346 fs/xfs/xfs_fsops.c

83a7f86e39ff5d Dave Chinner        2018-05-13  292  
^1da177e4c3f41 Linus Torvalds      2005-04-16  293  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  294   * protected versions of growfs function acquire and release locks on the mount
^1da177e4c3f41 Linus Torvalds      2005-04-16  295   * point - exported through ioctls: XFS_IOC_FSGROWFSDATA, XFS_IOC_FSGROWFSLOG,
^1da177e4c3f41 Linus Torvalds      2005-04-16  296   * XFS_IOC_FSGROWFSRT
^1da177e4c3f41 Linus Torvalds      2005-04-16  297   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  int
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  xfs_growfs_data(
87444b8c267a5c Dave Chinner        2018-05-13  300  	struct xfs_mount	*mp,
87444b8c267a5c Dave Chinner        2018-05-13  301  	struct xfs_growfs_data	*in)
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  {
87444b8c267a5c Dave Chinner        2018-05-13  303  	int			error = 0;
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  304  
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  305  	if (!capable(CAP_SYS_ADMIN))
2451337dd04390 Dave Chinner        2014-06-25  306  		return -EPERM;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  307  	if (!mutex_trylock(&mp->m_growlock))
2451337dd04390 Dave Chinner        2014-06-25  308  		return -EWOULDBLOCK;
87444b8c267a5c Dave Chinner        2018-05-13  309  
a37a349d7a21f1 Christoph Hellwig   2024-11-22  310  	/* we can't grow the data section when an internal RT section exists */
a37a349d7a21f1 Christoph Hellwig   2024-11-22  311  	if (in->newblocks != mp->m_sb.sb_dblocks && mp->m_sb.sb_rtstart)
a37a349d7a21f1 Christoph Hellwig   2024-11-22  312  		return -EINVAL;
a37a349d7a21f1 Christoph Hellwig   2024-11-22  313  
87444b8c267a5c Dave Chinner        2018-05-13  314  	/* update imaxpct separately to the physical grow of the filesystem */
87444b8c267a5c Dave Chinner        2018-05-13  315  	if (in->imaxpct != mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  316  		error = xfs_growfs_imaxpct(mp, in->imaxpct);
87444b8c267a5c Dave Chinner        2018-05-13  317  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  318  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  319  	}
87444b8c267a5c Dave Chinner        2018-05-13  320  
87444b8c267a5c Dave Chinner        2018-05-13  321  	if (in->newblocks != mp->m_sb.sb_dblocks) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  322  		error = xfs_growfs_data_private(mp, in);
87444b8c267a5c Dave Chinner        2018-05-13  323  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  324  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  325  	}
87444b8c267a5c Dave Chinner        2018-05-13  326  
87444b8c267a5c Dave Chinner        2018-05-13  327  	/* Post growfs calculations needed to reflect new state in operations */
87444b8c267a5c Dave Chinner        2018-05-13  328  	if (mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  329  		uint64_t icount = mp->m_sb.sb_dblocks * mp->m_sb.sb_imax_pct;
87444b8c267a5c Dave Chinner        2018-05-13  330  		do_div(icount, 100);
ef325959993edd Darrick J. Wong     2019-06-05  331  		M_IGEO(mp)->maxicount = XFS_FSB_TO_INO(mp, icount);
87444b8c267a5c Dave Chinner        2018-05-13  332  	} else
ef325959993edd Darrick J. Wong     2019-06-05  333  		M_IGEO(mp)->maxicount = 0;
87444b8c267a5c Dave Chinner        2018-05-13  334  
83a7f86e39ff5d Dave Chinner        2018-05-13  335  	/* Update secondary superblocks now the physical grow has completed */
b16817b66b6c97 Dave Chinner        2018-05-13  336  	error = xfs_update_secondary_sbs(mp);
83a7f86e39ff5d Dave Chinner        2018-05-13  337  
87444b8c267a5c Dave Chinner        2018-05-13  338  out_error:
527851124d10f9 Christoph Hellwig   2015-02-16  339  	/*
527851124d10f9 Christoph Hellwig   2015-02-16  340  	 * Increment the generation unconditionally, the error could be from
527851124d10f9 Christoph Hellwig   2015-02-16  341  	 * updating the secondary superblocks, in which case the new size
527851124d10f9 Christoph Hellwig   2015-02-16  342  	 * is live already.
527851124d10f9 Christoph Hellwig   2015-02-16  343  	 */
527851124d10f9 Christoph Hellwig   2015-02-16  344  	mp->m_generation++;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  345  	mutex_unlock(&mp->m_growlock);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @346  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  348  

:::::: The code at line 346 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
