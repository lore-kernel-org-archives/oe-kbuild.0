Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5792119
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VP4JnEM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697367216; x=1728903216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y11IuVEF3yyncVfQrQvA9BlKj2cKgBmw4oKkcQ3D98U=;
  b=VP4JnEM5BBKYCHaG/lOngNCGTK3Mtmpv7gf0+PTlrx4Tk31/RJSs3F6c
   FaKkKs4kW88hVAPFb+3+iSNfEIBjUrQP/11/PE+7qyt6JHcOCkwY+AIYH
   MRT7dX5q5ULFgHmjBa6FXFbZ9Z8YRha5Qd8ec+6iZffFs7ggqpszpr7Sn
   oDtmpEGKtSXTOUGlEETqyZ98kyGtE2hU1eCgX/yN6/4vli8um3tJnCDAD
   xRIqsOu7J5r1rFOH4+Yd6/wmJo4xSY7VaXUXCnCt7Rm2UP2gOMwLAC6md
   4H7pt6rph/hKvVV3eKv6f7fhtYTdvvScTf1GHJ2e1mWP8zJAG0HVWdRHN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382609326"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="382609326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 03:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790465570"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790465570"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 03:53:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrykR-0007LB-1H;
	Sun, 15 Oct 2023 10:53:27 +0000
Date: Sun, 15 Oct 2023 18:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:rmap-intent-cleanups 332/378] fs/xfs/libxfs/xfs_sb.c:351
 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount >
 ((-1))) => (0-u32max > u32max)'
Message-ID: <202310151808.OhguRZij-lkp@intel.com>
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
head:   4f11ae79fe2c7b68aad643bb5e37bb8638aea46c
commit: 6a8ce9ecce69fd08d21a1f683dc5f3128730857a [332/378] xfs: define the format of rt groups
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231015/202310151808.OhguRZij-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151808.OhguRZij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310151808.OhguRZij-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_sb.c:351 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount > ((-1))) => (0-u32max > u32max)'

vim +351 fs/xfs/libxfs/xfs_sb.c

eca383fcd63b45 Darrick J. Wong 2018-07-29  310  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  311  static int
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  312  xfs_validate_sb_rtgroups(
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  313  	struct xfs_mount	*mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  314  	struct xfs_sb		*sbp)
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  315  {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  316  	uint64_t		groups;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  317  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  318  	if (!(sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  319  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  320  "Realtime groups require metadata directory tree.");
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  321  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  322  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  323  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  324  	if (sbp->sb_rgblocks > XFS_MAX_RGBLOCKS) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  325  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  326  "Realtime group size (%u) must be less than %u.",
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  327  			 sbp->sb_rgblocks, XFS_MAX_RGBLOCKS);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  328  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  329  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  330  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  331  	if (sbp->sb_rextsize == 0) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  332  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  333  "Realtime extent size must not be zero.");
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  334  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  335  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  336  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  337  	if (sbp->sb_rgblocks % sbp->sb_rextsize != 0) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  338  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  339  "Realtime group size (%u) must be an even multiple of extent size (%u).",
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  340  			 sbp->sb_rgblocks, sbp->sb_rextsize);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  341  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  342  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  343  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  344  	if (sbp->sb_rgblocks < (sbp->sb_rextsize << 1)) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  345  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  346  "Realtime group size (%u) must be greater than 1 rt extent.",
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  347  			 sbp->sb_rgblocks);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  348  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  349  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  350  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06 @351  	if (sbp->sb_rgcount > XFS_MAX_RGNUMBER) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  352  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  353  "Realtime groups (%u) must be less than %u.",
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  354  			 sbp->sb_rgcount, XFS_MAX_RGNUMBER);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  355  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  356  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  357  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  358  	groups = howmany_64(sbp->sb_rblocks, sbp->sb_rgblocks);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  359  	if (groups != sbp->sb_rgcount) {
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  360  		xfs_warn(mp,
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  361  "Realtime groups (%u) do not cover the entire rt section; need (%llu) groups.",
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  362  			sbp->sb_rgcount, groups);
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  363  		return -EINVAL;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  364  	}
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  365  
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  366  	return 0;
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  367  }
6a8ce9ecce69fd Darrick J. Wong 2023-03-06  368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
