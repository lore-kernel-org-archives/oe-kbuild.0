Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD226AAD
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679058071; x=1710594071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOSdt1gdRJM1NLPixLK1msGIdsmBnaJO1u+tb/IRLoU=;
  b=h0hR4LkVjG1naYg6gpcf/JRrJYCKL7N40pjJcMxnb/8+y3cV601CVuNV
   87VJ0tn6IWMlAZ2kZC6yt8vQs7dazKes/wPidHEnb0KK0ALJYyFxUf0IW
   /Ik6bgbPKhJt24eiudkHoGlqwVpAavcJ3/12Oxhy4fxRAb4nKfnFJNcEc
   bXq0T2qL21xouPUHuhnVAB23MSTjZjM9l3maJKbmfp3quLoGbJBnzn2be
   aHzuXxjk/5AJevmwFBsmdsfA71T9Zh/IDn9vU6OD+sO5WIWGYko0I5heD
   ygBd2V3FLihURgjgz1yhPU3aLsqs0rKQ8gR2e5fdnwawQOxkCvxrlRxjK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317908601"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="317908601"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 06:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854433287"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854433287"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 06:01:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd9hj-0009MQ-2k;
	Fri, 17 Mar 2023 13:01:07 +0000
Date: Fri, 17 Mar 2023 21:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 225/274] fs/xfs/xfs_xchgrange.c:666
 xfs_xchg_range_grab_log_assist() warn: missing error code 'error'
Message-ID: <202303172023.A0OI1fhT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   67bb67e9a9941400f950d75d77991bf99c54ed05
commit: 3861d241500e2d503f78e16de2d14654d18c4e0f [225/274] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230317/202303172023.A0OI1fhT-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303172023.A0OI1fhT-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_xchgrange.c:666 xfs_xchg_range_grab_log_assist() warn: missing error code 'error'

vim +/error +666 fs/xfs/xfs_xchgrange.c

3861d241500e2d Darrick J. Wong 2023-03-06  629  
3861d241500e2d Darrick J. Wong 2023-03-06  630  /*
3861d241500e2d Darrick J. Wong 2023-03-06  631   * Get permission to use log-assisted atomic exchange of file extents.
3861d241500e2d Darrick J. Wong 2023-03-06  632   *
3861d241500e2d Darrick J. Wong 2023-03-06  633   * Callers must hold the IOLOCK and MMAPLOCK of both files.  They must not be
3861d241500e2d Darrick J. Wong 2023-03-06  634   * running any transactions or hold any ILOCKS.  If @use_logging is set after a
3861d241500e2d Darrick J. Wong 2023-03-06  635   * successful return, callers must call xfs_xchg_range_rele_log_assist after
3861d241500e2d Darrick J. Wong 2023-03-06  636   * the exchange is completed.
3861d241500e2d Darrick J. Wong 2023-03-06  637   */
3861d241500e2d Darrick J. Wong 2023-03-06  638  int
3861d241500e2d Darrick J. Wong 2023-03-06  639  xfs_xchg_range_grab_log_assist(
3861d241500e2d Darrick J. Wong 2023-03-06  640  	struct xfs_mount	*mp,
3861d241500e2d Darrick J. Wong 2023-03-06  641  	bool			force,
3861d241500e2d Darrick J. Wong 2023-03-06  642  	bool			*use_logging)
3861d241500e2d Darrick J. Wong 2023-03-06  643  {
3861d241500e2d Darrick J. Wong 2023-03-06  644  	int			error = 0;
3861d241500e2d Darrick J. Wong 2023-03-06  645  
3861d241500e2d Darrick J. Wong 2023-03-06  646  	/*
3861d241500e2d Darrick J. Wong 2023-03-06  647  	 * Protect ourselves from an idle log clearing the atomic swapext
3861d241500e2d Darrick J. Wong 2023-03-06  648  	 * log incompat feature bit.
3861d241500e2d Darrick J. Wong 2023-03-06  649  	 */
3861d241500e2d Darrick J. Wong 2023-03-06  650  	xlog_use_incompat_feat(mp->m_log, XLOG_INCOMPAT_FEAT_SWAPEXT);
3861d241500e2d Darrick J. Wong 2023-03-06  651  	*use_logging = true;
3861d241500e2d Darrick J. Wong 2023-03-06  652  
3861d241500e2d Darrick J. Wong 2023-03-06  653  	/*
3861d241500e2d Darrick J. Wong 2023-03-06  654  	 * If log-assisted swapping is already enabled, the caller can use the
3861d241500e2d Darrick J. Wong 2023-03-06  655  	 * log assisted swap functions with the log-incompat reference we got.
3861d241500e2d Darrick J. Wong 2023-03-06  656  	 */
3861d241500e2d Darrick J. Wong 2023-03-06  657  	if (xfs_sb_version_haslogswapext(&mp->m_sb))
3861d241500e2d Darrick J. Wong 2023-03-06  658  		return 0;
3861d241500e2d Darrick J. Wong 2023-03-06  659  
3861d241500e2d Darrick J. Wong 2023-03-06  660  	/*
3861d241500e2d Darrick J. Wong 2023-03-06  661  	 * If the caller doesn't /require/ log-assisted swapping, drop the
3861d241500e2d Darrick J. Wong 2023-03-06  662  	 * log-incompat feature protection and exit.  The caller cannot use
3861d241500e2d Darrick J. Wong 2023-03-06  663  	 * log assisted swapping.
3861d241500e2d Darrick J. Wong 2023-03-06  664  	 */
3861d241500e2d Darrick J. Wong 2023-03-06  665  	if (!force)
3861d241500e2d Darrick J. Wong 2023-03-06 @666  		goto drop_incompat;
3861d241500e2d Darrick J. Wong 2023-03-06  667  
3861d241500e2d Darrick J. Wong 2023-03-06  668  	/*
3861d241500e2d Darrick J. Wong 2023-03-06  669  	 * Caller requires log-assisted swapping but the fs feature set isn't
3861d241500e2d Darrick J. Wong 2023-03-06  670  	 * rich enough to support it.  Bail out.
3861d241500e2d Darrick J. Wong 2023-03-06  671  	 */
3861d241500e2d Darrick J. Wong 2023-03-06  672  	if (!xfs_swapext_supported(mp)) {
3861d241500e2d Darrick J. Wong 2023-03-06  673  		error = -EOPNOTSUPP;
3861d241500e2d Darrick J. Wong 2023-03-06  674  		goto drop_incompat;
3861d241500e2d Darrick J. Wong 2023-03-06  675  	}
3861d241500e2d Darrick J. Wong 2023-03-06  676  
3861d241500e2d Darrick J. Wong 2023-03-06  677  	error = xfs_add_incompat_log_feature(mp,
3861d241500e2d Darrick J. Wong 2023-03-06  678  			XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
3861d241500e2d Darrick J. Wong 2023-03-06  679  	if (error)
3861d241500e2d Darrick J. Wong 2023-03-06  680  		goto drop_incompat;
3861d241500e2d Darrick J. Wong 2023-03-06  681  
3861d241500e2d Darrick J. Wong 2023-03-06  682  	xfs_warn_mount(mp, XFS_OPSTATE_WARNED_SWAPEXT,
3861d241500e2d Darrick J. Wong 2023-03-06  683   "EXPERIMENTAL atomic file range swap feature in use. Use at your own risk!");
3861d241500e2d Darrick J. Wong 2023-03-06  684  
3861d241500e2d Darrick J. Wong 2023-03-06  685  	return 0;
3861d241500e2d Darrick J. Wong 2023-03-06  686  drop_incompat:
3861d241500e2d Darrick J. Wong 2023-03-06  687  	xlog_drop_incompat_feat(mp->m_log, XLOG_INCOMPAT_FEAT_SWAPEXT);
3861d241500e2d Darrick J. Wong 2023-03-06  688  	*use_logging = false;
3861d241500e2d Darrick J. Wong 2023-03-06  689  	return error;
3861d241500e2d Darrick J. Wong 2023-03-06  690  }
3861d241500e2d Darrick J. Wong 2023-03-06  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
