Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8679EB
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679089344; x=1710625344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtWkU87PKGAJPZmJESJzUO3bHcNFGQNjuWkrCswQyOw=;
  b=HNxDiCh1VabrQUX6tFBE+RpZqmSecyHhdFhaCsmfBuYbvFnPncE4KDIr
   bK5YEJvkGbFdmRz150XZ1yCMFqRn8kAYEmJShWUAtvjPQ4LI40WyvpYW9
   0s/O9xPleQIVsQbZIcq4smkk7QZ3wLWiSTebkfgUbpvpSX5y3wMyVi0MK
   cScCsaqdb9O8eTr2/cRRYlucf+VQMgwLPr0i9365RdmzWsURr0AieDR1S
   n6ttSI1p46Gr7NWj5zpCSPJmhoOJjMCFBHpU7Uu1ShXfgPCm4k3EXlbh+
   Sg/sFtIOP8isbXuLxqP9XTQONCStiP+LGZIoWCXlpVlQ13fi/yNf8A6D4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340725199"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340725199"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744686538"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744686538"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 14:42:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdHq7-0009aS-20;
	Fri, 17 Mar 2023 21:42:19 +0000
Date: Sat, 18 Mar 2023 05:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 448/501]
 fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202303180551.L8gyDz7R-lkp@intel.com>
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
commit: 920801eeb88261304c231405cf093633e041d6e3 [448/501] xfs: prepare refcount functions to deal with rtrefcountbt
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180551.L8gyDz7R-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303180551.L8gyDz7R-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:171 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:140 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:150 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +161 fs/xfs/libxfs/xfs_refcount.c

491feafe7bd3d5 Darrick J. Wong 2023-03-06  155  
920801eeb88261 Darrick J. Wong 2023-03-06  156  static inline xfs_failaddr_t
920801eeb88261 Darrick J. Wong 2023-03-06  157  xfs_refcount_check_rtgroup_irec(
920801eeb88261 Darrick J. Wong 2023-03-06  158  	struct xfs_rtgroup		*rtg,
920801eeb88261 Darrick J. Wong 2023-03-06  159  	const struct xfs_refcount_irec	*irec)
920801eeb88261 Darrick J. Wong 2023-03-06  160  {
920801eeb88261 Darrick J. Wong 2023-03-06 @161  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
920801eeb88261 Darrick J. Wong 2023-03-06  162  		return __this_address;
920801eeb88261 Darrick J. Wong 2023-03-06  163  
920801eeb88261 Darrick J. Wong 2023-03-06  164  	if (!xfs_refcount_check_domain(irec))
920801eeb88261 Darrick J. Wong 2023-03-06  165  		return __this_address;
920801eeb88261 Darrick J. Wong 2023-03-06  166  
920801eeb88261 Darrick J. Wong 2023-03-06  167  	/* check for valid extent range, including overflow */
920801eeb88261 Darrick J. Wong 2023-03-06  168  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
920801eeb88261 Darrick J. Wong 2023-03-06  169  		return __this_address;
920801eeb88261 Darrick J. Wong 2023-03-06  170  
920801eeb88261 Darrick J. Wong 2023-03-06 @171  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
920801eeb88261 Darrick J. Wong 2023-03-06  172  		return __this_address;
920801eeb88261 Darrick J. Wong 2023-03-06  173  
920801eeb88261 Darrick J. Wong 2023-03-06  174  	return NULL;
920801eeb88261 Darrick J. Wong 2023-03-06  175  }
920801eeb88261 Darrick J. Wong 2023-03-06  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
