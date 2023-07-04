Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90981625
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 03:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688442215; x=1719978215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mfw4wN+eL90kXmRBCidC6PQGdPo65MmZs4LBDrkagJk=;
  b=HQ0cQxto4I4X6cSUiTFrTDEE4vuEQT1kBzjsWJOYC46zI/upPx7VO+oG
   zvpuz7Gyvad9wte4qGZ5Mr/49TLo/nAXVj5XTDNwEmOZdIt2LKxXVw67P
   ERg4Uziiphb5jMoIpzyg8H+Sfx18hlCiwc1+EvLk9OVuH907pXlb6Gz2w
   b956Co/qoiAyxTEHc/MA+CBcUcFj1o2mFaqY5DNJrdVdhK8PA6Y7TLZsV
   t6ZDNE5jTUvlpyAefmRzTR5yCCbRTkRxs9lfzWUdkLJk9PcPfHrBTyYYk
   gTWSPlj4Yu6G1ISZyJFbzZJwLd+qJsCfOL6sN/AZN4VAy8F7dtvqVnRE5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393763755"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="393763755"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 20:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892726114"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="892726114"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Jul 2023 20:43:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGWws-000HqK-31;
	Tue, 04 Jul 2023 03:43:30 +0000
Date: Tue, 4 Jul 2023 11:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 360/513] fs/xfs/libxfs/xfs_sb.c:350
 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount >
 ((-1))) => (0-u32max > u32max)'
Message-ID: <202307041156.E1BZk12b-lkp@intel.com>
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
head:   4d957d5fd4dc29d4f948807700f12587ca2feb2f
commit: f71dd05b2c4ad7de4c4ee5c3db3eaba43d46ccb1 [360/513] xfs: define the format of rt groups
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041156.E1BZk12b-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041156.E1BZk12b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307041156.E1BZk12b-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_sb.c:350 xfs_validate_sb_rtgroups() warn: impossible condition '(sbp->sb_rgcount > ((-1))) => (0-u32max > u32max)'

vim +350 fs/xfs/libxfs/xfs_sb.c

eca383fcd63b45 Darrick J. Wong 2018-07-29  309  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  310  static int
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  311  xfs_validate_sb_rtgroups(
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  312  	struct xfs_mount	*mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  313  	struct xfs_sb		*sbp)
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  314  {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  315  	uint64_t		groups;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  316  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  317  	if (!(sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_METADIR)) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  318  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  319  "Realtime groups require metadata directory tree.");
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  320  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  321  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  322  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  323  	if (sbp->sb_rgblocks > XFS_MAX_RGBLOCKS) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  324  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  325  "Realtime group size (%u) must be less than %u.",
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  326  			 sbp->sb_rgblocks, XFS_MAX_RGBLOCKS);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  327  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  328  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  329  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  330  	if (sbp->sb_rextsize == 0) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  331  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  332  "Realtime extent size must not be zero.");
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  333  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  334  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  335  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  336  	if (sbp->sb_rgblocks % sbp->sb_rextsize != 0) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  337  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  338  "Realtime group size (%u) must be an even multiple of extent size (%u).",
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  339  			 sbp->sb_rgblocks, sbp->sb_rextsize);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  340  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  341  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  342  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  343  	if (sbp->sb_rgblocks < (sbp->sb_rextsize << 1)) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  344  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  345  "Realtime group size (%u) must be greater than 1 rt extent.",
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  346  			 sbp->sb_rgblocks);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  347  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  348  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  349  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06 @350  	if (sbp->sb_rgcount > XFS_MAX_RGNUMBER) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  351  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  352  "Realtime groups (%u) must be less than %u.",
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  353  			 sbp->sb_rgcount, XFS_MAX_RGNUMBER);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  354  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  355  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  356  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  357  	groups = howmany_64(sbp->sb_rblocks, sbp->sb_rgblocks);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  358  	if (groups != sbp->sb_rgcount) {
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  359  		xfs_warn(mp,
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  360  "Realtime groups (%u) do not cover the entire rt section; need (%llu) groups.",
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  361  			sbp->sb_rgcount, groups);
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  362  		return -EINVAL;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  363  	}
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  364  
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  365  	return 0;
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  366  }
f71dd05b2c4ad7 Darrick J. Wong 2023-03-06  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
