Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FF7494
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679077699; x=1710613699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqE2Glze1BG1J2JvgDkaP8ZX5lDolzN6BwP4yhA5OvE=;
  b=VcFn/Mr8y12xT3gTiA8b9zob8NXFCEEWBbKbpvbBYFChI8kN0nbKzI4l
   jGSsW1kWtdKBwVQX7xNKaBHqm1Hc/4Bo69WkcHaXV/Da2jrfC762cjINN
   A3ApqNSOv5RUV90YvjF+GSQG0znicE+vw0F8NKSwXoZLx7wDZDe/FVig6
   oBThI38BbyGZru/WiODLxwp3jXZU/laOAaD7KubbNKWa2xpVuXeSMzrbM
   JFVg+uV/Lzvn0paPhvBbG0i2rH+nGKmWryhGDEpR16aqDI1Ew5+1nIOod
   WqrLq7fFLFDbuJiUdf1DGCuEznL9Dtq6YLUgTAZQB1z7N9hU2+NtOKhER
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="317989086"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="317989086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630365332"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630365332"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 11:28:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdEoK-0009Wo-12;
	Fri, 17 Mar 2023 18:28:16 +0000
Date: Sat, 18 Mar 2023 02:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 352/501] fs/xfs/libxfs/xfs_sb.c:347
 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount >
 ((-1))) => (0-u32max > u32max)'
Message-ID: <202303180210.T1ZAOfEq-lkp@intel.com>
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
head:   0575173bd35d9a7418eaa4ead4126d1c7fe9961c
commit: 1a92e67b4c16d668ef337244a15a60f09fa310a6 [352/501] xfs: define the format of rt groups
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180210.T1ZAOfEq-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303180210.T1ZAOfEq-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_sb.c:347 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount > ((-1))) => (0-u32max > u32max)'

vim +347 fs/xfs/libxfs/xfs_sb.c

eca383fcd63b45 Darrick J. Wong 2018-07-29  306  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  307  static int
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  308  xfs_validate_sb_rtgroups(
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  309  	struct xfs_mount	*mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  310  	struct xfs_sb		*sbp)
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  311  {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  312  	uint64_t		groups;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  313  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  314  	if (!(sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  315  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  316  "Realtime groups require metadata directory tree.");
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  317  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  318  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  319  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  320  	if (sbp->sb_rgblocks > XFS_MAX_RGBLOCKS) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  321  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  322  "Realtime group size (%u) must be less than %u.",
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  323  			 sbp->sb_rgblocks, XFS_MAX_RGBLOCKS);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  324  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  325  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  326  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  327  	if (sbp->sb_rextsize == 0) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  328  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  329  "Realtime extent size must not be zero.");
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  330  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  331  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  332  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  333  	if (sbp->sb_rgblocks % sbp->sb_rextsize != 0) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  334  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  335  "Realtime group size (%u) must be an even multiple of extent size (%u).",
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  336  			 sbp->sb_rgblocks, sbp->sb_rextsize);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  337  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  338  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  339  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  340  	if (sbp->sb_rgblocks < (sbp->sb_rextsize << 1)) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  341  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  342  "Realtime group size (%u) must be greater than 1 rt extent.",
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  343  			 sbp->sb_rgblocks);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  344  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  345  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  346  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06 @347  	if (sbp->sb_rgcount > XFS_MAX_RGNUMBER) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  348  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  349  "Realtime groups (%u) must be less than %u.",
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  350  			 sbp->sb_rgcount, XFS_MAX_RGNUMBER);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  351  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  352  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  353  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  354  	groups = howmany_64(sbp->sb_rblocks, sbp->sb_rgblocks);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  355  	if (groups != sbp->sb_rgcount) {
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  356  		xfs_warn(mp,
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  357  "Realtime groups (%u) do not cover the entire rt section; need (%llu) groups.",
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  358  			sbp->sb_rgcount, groups);
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  359  		return -EINVAL;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  360  	}
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  361  
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  362  	return 0;
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  363  }
1a92e67b4c16d6 Darrick J. Wong 2023-03-06  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
