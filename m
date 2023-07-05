Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C7A3D
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 03:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688529530; x=1720065530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0tRjJgC2FeRCGCeUmgZT+w52/gJOxt/EsCfDhfP91oA=;
  b=JhGQHm98WUEosazBy+FQ2nWpcrp4ih2ElY5pegXMIQlhMdqg7/BFGmPA
   JqT9BGCIAOqTA67M9SaVxUVupJ3adHb2t5Ln9dCrH0sopHSRDlfEvKlT0
   aZJQQHwWBSlJ8g99eVAQgS4kADoTe6H4cLZkZPKxMTCgrC/Liga3i7MJR
   h+F6+SbLicupbaT9JO5i5a2hUijyq+mRkoEvr5ouAmqM7M3KnPOsYzpjS
   P8CM16U+BWj/s2p5RwqImsYzeC5rTQvblvFJMo69g1JmqJUzpv5eIJgEn
   slLhduBKTOkYnCSSfdWbzZ5+blov2ZvhvNoa0+fj/KFfbrcAAkvHzkXvA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342832723"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="342832723"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 20:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843149553"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="843149553"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 20:58:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGtfC-0000Kc-20;
	Wed, 05 Jul 2023 03:58:46 +0000
Date: Wed, 5 Jul 2023 11:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 166/217] fs/xfs/xfs_xchgrange.c:666
 xfs_xchg_range_grab_log_assist() warn: missing error code 'error'
Message-ID: <202307051158.UjG46D3c-lkp@intel.com>
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
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 4885e2ac7dc43f02ff2a18bbec51e198086ab318 [166/217] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230705/202307051158.UjG46D3c-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051158.UjG46D3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307051158.UjG46D3c-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_xchgrange.c:666 xfs_xchg_range_grab_log_assist() warn: missing error code 'error'

vim +/error +666 fs/xfs/xfs_xchgrange.c

4885e2ac7dc43f Darrick J. Wong 2023-03-06  629  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  630  /*
4885e2ac7dc43f Darrick J. Wong 2023-03-06  631   * Get permission to use log-assisted atomic exchange of file extents.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  632   *
4885e2ac7dc43f Darrick J. Wong 2023-03-06  633   * Callers must hold the IOLOCK and MMAPLOCK of both files.  They must not be
4885e2ac7dc43f Darrick J. Wong 2023-03-06  634   * running any transactions or hold any ILOCKS.  If @use_logging is set after a
4885e2ac7dc43f Darrick J. Wong 2023-03-06  635   * successful return, callers must call xfs_xchg_range_rele_log_assist after
4885e2ac7dc43f Darrick J. Wong 2023-03-06  636   * the exchange is completed.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  637   */
4885e2ac7dc43f Darrick J. Wong 2023-03-06  638  int
4885e2ac7dc43f Darrick J. Wong 2023-03-06  639  xfs_xchg_range_grab_log_assist(
4885e2ac7dc43f Darrick J. Wong 2023-03-06  640  	struct xfs_mount	*mp,
4885e2ac7dc43f Darrick J. Wong 2023-03-06  641  	bool			force,
4885e2ac7dc43f Darrick J. Wong 2023-03-06  642  	bool			*use_logging)
4885e2ac7dc43f Darrick J. Wong 2023-03-06  643  {
4885e2ac7dc43f Darrick J. Wong 2023-03-06  644  	int			error = 0;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  645  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  646  	/*
4885e2ac7dc43f Darrick J. Wong 2023-03-06  647  	 * Protect ourselves from an idle log clearing the atomic swapext
4885e2ac7dc43f Darrick J. Wong 2023-03-06  648  	 * log incompat feature bit.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  649  	 */
4885e2ac7dc43f Darrick J. Wong 2023-03-06  650  	xlog_use_incompat_feat(mp->m_log, XLOG_INCOMPAT_FEAT_SWAPEXT);
4885e2ac7dc43f Darrick J. Wong 2023-03-06  651  	*use_logging = true;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  652  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  653  	/*
4885e2ac7dc43f Darrick J. Wong 2023-03-06  654  	 * If log-assisted swapping is already enabled, the caller can use the
4885e2ac7dc43f Darrick J. Wong 2023-03-06  655  	 * log assisted swap functions with the log-incompat reference we got.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  656  	 */
4885e2ac7dc43f Darrick J. Wong 2023-03-06  657  	if (xfs_sb_version_haslogswapext(&mp->m_sb))
4885e2ac7dc43f Darrick J. Wong 2023-03-06  658  		return 0;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  659  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  660  	/*
4885e2ac7dc43f Darrick J. Wong 2023-03-06  661  	 * If the caller doesn't /require/ log-assisted swapping, drop the
4885e2ac7dc43f Darrick J. Wong 2023-03-06  662  	 * log-incompat feature protection and exit.  The caller cannot use
4885e2ac7dc43f Darrick J. Wong 2023-03-06  663  	 * log assisted swapping.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  664  	 */
4885e2ac7dc43f Darrick J. Wong 2023-03-06  665  	if (!force)
4885e2ac7dc43f Darrick J. Wong 2023-03-06 @666  		goto drop_incompat;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  667  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  668  	/*
4885e2ac7dc43f Darrick J. Wong 2023-03-06  669  	 * Caller requires log-assisted swapping but the fs feature set isn't
4885e2ac7dc43f Darrick J. Wong 2023-03-06  670  	 * rich enough to support it.  Bail out.
4885e2ac7dc43f Darrick J. Wong 2023-03-06  671  	 */
4885e2ac7dc43f Darrick J. Wong 2023-03-06  672  	if (!xfs_swapext_supported(mp)) {
4885e2ac7dc43f Darrick J. Wong 2023-03-06  673  		error = -EOPNOTSUPP;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  674  		goto drop_incompat;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  675  	}
4885e2ac7dc43f Darrick J. Wong 2023-03-06  676  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  677  	error = xfs_add_incompat_log_feature(mp,
4885e2ac7dc43f Darrick J. Wong 2023-03-06  678  			XFS_SB_FEAT_INCOMPAT_LOG_SWAPEXT);
4885e2ac7dc43f Darrick J. Wong 2023-03-06  679  	if (error)
4885e2ac7dc43f Darrick J. Wong 2023-03-06  680  		goto drop_incompat;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  681  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  682  	xfs_warn_mount(mp, XFS_OPSTATE_WARNED_SWAPEXT,
4885e2ac7dc43f Darrick J. Wong 2023-03-06  683   "EXPERIMENTAL atomic file range swap feature in use. Use at your own risk!");
4885e2ac7dc43f Darrick J. Wong 2023-03-06  684  
4885e2ac7dc43f Darrick J. Wong 2023-03-06  685  	return 0;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  686  drop_incompat:
4885e2ac7dc43f Darrick J. Wong 2023-03-06  687  	xlog_drop_incompat_feat(mp->m_log, XLOG_INCOMPAT_FEAT_SWAPEXT);
4885e2ac7dc43f Darrick J. Wong 2023-03-06  688  	*use_logging = false;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  689  	return error;
4885e2ac7dc43f Darrick J. Wong 2023-03-06  690  }
4885e2ac7dc43f Darrick J. Wong 2023-03-06  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
