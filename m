Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CAB4F1E2
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkoxrDZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701980636; x=1733516636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=utfSVM7OW8pyhOH24wLqgJpMXgAzi2n8omqHYu3E4hw=;
  b=QkoxrDZCzaO28OM3qW6JF5Sd3J+meOTXGS96eBaQbDb9kR1S3uhPSuSt
   FrzMaLl68CAkdsFjupMD38aAKS+L/7uCsHTAkW+8RLk+b0iAcOMMBbFFL
   5eqOp3Gstr/5HPqEJ9StAVs0Fd0/2LQ32ODOLk2N0ayfHSDygnVYpPp/b
   8GWJoFeSZrLvuQojLobzr00TQb98+QnTqARVQLHsFWdKVMxJCrLH5KUYK
   1Wq89gv92JbWir7Ubmookhq0CJKpPu/Xdd6D3RQugv/RDyRmceXHvJB6B
   D6ZT8+FBiGi6kNOvxSYb+zM1y/f/kEISt5G7WEokZlVE2+6VQEaAD/avI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1167049"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1167049"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 12:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="13233084"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2023 12:23:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBKuV-000Cn8-0A;
	Thu, 07 Dec 2023 20:23:51 +0000
Date: Fri, 8 Dec 2023 04:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:rmap-intent-cleanups 333/401]
 fs/xfs/scrub/metapath.c:436 xchk_metapath_ilock_parent_and_child() warn:
 ignoring unreachable code.
Message-ID: <202312080422.9zFpu5OY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   7ff89344add81f9b99dfaac68fbc05bfc3ed37b1
commit: 8669eaf29ef3d48291237fe2fb6622d94a578ca4 [333/401] xfs: repair metadata directory file path connectivity
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20231207 (https://download.01.org/0day-ci/archive/20231208/202312080422.9zFpu5OY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080422.9zFpu5OY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312080422.9zFpu5OY-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/metapath.c:436 xchk_metapath_ilock_parent_and_child() warn: ignoring unreachable code.

Old smatch warnings:
fs/xfs/scrub/metapath.c:210 xchk_metapath_ilock_both() warn: ignoring unreachable code.

vim +436 fs/xfs/scrub/metapath.c

8669eaf29ef3d4 Darrick J. Wong 2023-08-18  409  
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  410  /*
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  411   * Take the ILOCK on the metadata directory parent and a bad child, if one is
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  412   * supplied.  We do not know that the metadata directory is not corrupt, so we
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  413   * lock the parent and try to lock the child.  Returns 0 if successful, or
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  414   * -EINTR to abort the repair.  The lock state of @dp is not recorded in @mpath.
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  415   */
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  416  STATIC int
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  417  xchk_metapath_ilock_parent_and_child(
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  418  	struct xchk_metapath	*mpath,
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  419  	struct xfs_inode	*ip)
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  420  {
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  421  	struct xfs_scrub	*sc = mpath->sc;
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  422  	int			error = 0;
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  423  
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  424  	while (true) {
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  425  		xfs_ilock(mpath->dp, XFS_ILOCK_EXCL);
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  426  		if (!ip || xfs_ilock_nowait(ip, XFS_ILOCK_EXCL))
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  427  			return 0;
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  428  		xfs_iunlock(mpath->dp, XFS_ILOCK_EXCL);
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  429  
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  430  		if (xchk_should_terminate(sc, &error))
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  431  			return error;
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  432  
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  433  		delay(1);
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  434  	}
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  435  
8669eaf29ef3d4 Darrick J. Wong 2023-08-18 @436  	ASSERT(0);
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  437  	return -EINTR;
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  438  }
8669eaf29ef3d4 Darrick J. Wong 2023-08-18  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
