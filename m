Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43C1104
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 08:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688459866; x=1719995866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFeXVAEpTcmxOsQCgEuQe/uWNTlA7huyPDpdEo2f+Zk=;
  b=gWlxSDfZAlotueBUlh7/uBH8GLMG6a9vFKKz8Y2S7Z0cmpaIHvorh2nx
   zixarJVqNmgdaJ2gPJjr0ZYnWHWPD6SQx/Z9wUY6rtF8VHTAA4FPItB+9
   3KF3J6451kcpwRMhFvAAPTmw2spNWhioeCdmnytIULd3bSV/+IRTRzQpN
   fPw4cR3UFM16F4TnoWiDPF5GfeSxbyrq3b/SI5yIgKCEt4AuuGhLKxaIt
   UXiAbRLz1jHuy4CybsXRRO52SUvQKlbHodyEz0u8RptPok4hsrQ7rcj9m
   4tGAfVxr1qH0U4Savu5BVPCeX22iE6HsWfNa31IE3KP9PAFGUwoFdNMKp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343406614"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="343406614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 01:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892795485"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="892795485"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jul 2023 01:37:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGbXb-000I8R-00;
	Tue, 04 Jul 2023 08:37:43 +0000
Date: Tue, 4 Jul 2023 16:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:vectorized-scrub 455/513]
 fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202307041659.8Xz4EbwO-lkp@intel.com>
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
commit: 611aaa20406150b786b16500dc33848909bdb4e4 [455/513] xfs: prepare refcount functions to deal with rtrefcountbt
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041659.8Xz4EbwO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041659.8Xz4EbwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307041659.8Xz4EbwO-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:161 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:171 xfs_refcount_check_rtgroup_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:140 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:150 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +161 fs/xfs/libxfs/xfs_refcount.c

2b30cc0bf0589d Darrick J. Wong 2023-04-11  155  
611aaa20406150 Darrick J. Wong 2023-03-06  156  static inline xfs_failaddr_t
611aaa20406150 Darrick J. Wong 2023-03-06  157  xfs_refcount_check_rtgroup_irec(
611aaa20406150 Darrick J. Wong 2023-03-06  158  	struct xfs_rtgroup		*rtg,
611aaa20406150 Darrick J. Wong 2023-03-06  159  	const struct xfs_refcount_irec	*irec)
611aaa20406150 Darrick J. Wong 2023-03-06  160  {
611aaa20406150 Darrick J. Wong 2023-03-06 @161  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
611aaa20406150 Darrick J. Wong 2023-03-06  162  		return __this_address;
611aaa20406150 Darrick J. Wong 2023-03-06  163  
611aaa20406150 Darrick J. Wong 2023-03-06  164  	if (!xfs_refcount_check_domain(irec))
611aaa20406150 Darrick J. Wong 2023-03-06  165  		return __this_address;
611aaa20406150 Darrick J. Wong 2023-03-06  166  
611aaa20406150 Darrick J. Wong 2023-03-06  167  	/* check for valid extent range, including overflow */
611aaa20406150 Darrick J. Wong 2023-03-06  168  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
611aaa20406150 Darrick J. Wong 2023-03-06  169  		return __this_address;
611aaa20406150 Darrick J. Wong 2023-03-06  170  
611aaa20406150 Darrick J. Wong 2023-03-06 @171  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
611aaa20406150 Darrick J. Wong 2023-03-06  172  		return __this_address;
611aaa20406150 Darrick J. Wong 2023-03-06  173  
611aaa20406150 Darrick J. Wong 2023-03-06  174  	return NULL;
611aaa20406150 Darrick J. Wong 2023-03-06  175  }
611aaa20406150 Darrick J. Wong 2023-03-06  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
