Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E057F6
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jul 2023 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688524064; x=1720060064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d0uUxSFmgsSTWIvW640EdDP0N81Ya59DCh0rRfs2HZg=;
  b=KhbE8PUu5qc3ipVwh5xorXR67B+tbV4OfWztrNZmmD+3z2IWvhIB6fs/
   RnMX4ngsANCR3mmt7FFwpnuiEywsNETy/YCH6otzdDLhXayRq5e24/L9L
   GgGmmBOFo9pD2wbpsGYRQ3jVU8aJWHRqHv900jKdCj+uQicr8WnB1afHT
   uzYXqiRREgaSyJ6+GkyT+uLdnQftBK9lkKeJ2lKrRyY2OCBqmxt6mRxwp
   e4ZdEBRobZgRhJQwFbx7Unj6qLqr+B+893U1yA4+eTs5C5c49d3K8Ut5e
   Rd7KSSeExNJ1xfebioLVy8a+HVp7WWa/Yj7TfssLVtpkTms/OJQJWvoBE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="366714192"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366714192"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 19:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="832341503"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="832341503"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2023 19:27:42 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGsF3-0000De-1d;
	Wed, 05 Jul 2023 02:27:41 +0000
Date: Wed, 5 Jul 2023 10:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 127/217] fs/xfs/libxfs/xfs_rmap.c:277
 xfs_rmap_check_irec() warn: bitwise AND condition is false here
Message-ID: <202307051005.7exlZdIb-lkp@intel.com>
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
commit: e2fef4a15270326f3c56e6af0b20c96577787d40 [127/217] xfs: create a shadow rmap btree during rmap repair
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230705/202307051005.7exlZdIb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051005.7exlZdIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307051005.7exlZdIb-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_rmap.c:277 xfs_rmap_check_irec() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_rmap.c:290 xfs_rmap_complain_bad_rec() warn: bitwise AND condition is false here

vim +277 fs/xfs/libxfs/xfs_rmap.c

c4e34172da26cb Darrick J. Wong 2023-04-11  270  
a92c14f67470b7 Darrick J. Wong 2023-03-06  271  /* Simple checks for rmap records. */
a92c14f67470b7 Darrick J. Wong 2023-03-06  272  xfs_failaddr_t
a92c14f67470b7 Darrick J. Wong 2023-03-06  273  xfs_rmap_check_irec(
a92c14f67470b7 Darrick J. Wong 2023-03-06  274  	struct xfs_btree_cur		*cur,
a92c14f67470b7 Darrick J. Wong 2023-03-06  275  	const struct xfs_rmap_irec	*irec)
a92c14f67470b7 Darrick J. Wong 2023-03-06  276  {
e2fef4a1527032 Darrick J. Wong 2023-03-06 @277  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
e2fef4a1527032 Darrick J. Wong 2023-03-06  278  		return xfs_rmap_check_perag_irec(cur->bc_mem.pag, irec);
a92c14f67470b7 Darrick J. Wong 2023-03-06  279  	return xfs_rmap_check_perag_irec(cur->bc_ag.pag, irec);
a92c14f67470b7 Darrick J. Wong 2023-03-06  280  }
a92c14f67470b7 Darrick J. Wong 2023-03-06  281  
ee12eaaa435a7b Darrick J. Wong 2023-04-11  282  static inline int
ee12eaaa435a7b Darrick J. Wong 2023-04-11  283  xfs_rmap_complain_bad_rec(
ee12eaaa435a7b Darrick J. Wong 2023-04-11  284  	struct xfs_btree_cur		*cur,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  285  	xfs_failaddr_t			fa,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  286  	const struct xfs_rmap_irec	*irec)
ee12eaaa435a7b Darrick J. Wong 2023-04-11  287  {
ee12eaaa435a7b Darrick J. Wong 2023-04-11  288  	struct xfs_mount		*mp = cur->bc_mp;
ee12eaaa435a7b Darrick J. Wong 2023-04-11  289  
e2fef4a1527032 Darrick J. Wong 2023-03-06 @290  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
e2fef4a1527032 Darrick J. Wong 2023-03-06  291  		xfs_warn(mp,
e2fef4a1527032 Darrick J. Wong 2023-03-06  292   "In-Memory Reverse Mapping BTree record corruption detected at %pS!", fa);
e2fef4a1527032 Darrick J. Wong 2023-03-06  293  	else
ee12eaaa435a7b Darrick J. Wong 2023-04-11  294  		xfs_warn(mp,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  295   "Reverse Mapping BTree record corruption in AG %d detected at %pS!",
ee12eaaa435a7b Darrick J. Wong 2023-04-11  296  			cur->bc_ag.pag->pag_agno, fa);
ee12eaaa435a7b Darrick J. Wong 2023-04-11  297  	xfs_warn(mp,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  298  		"Owner 0x%llx, flags 0x%x, start block 0x%x block count 0x%x",
ee12eaaa435a7b Darrick J. Wong 2023-04-11  299  		irec->rm_owner, irec->rm_flags, irec->rm_startblock,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  300  		irec->rm_blockcount);
260cdc846a3986 Darrick J. Wong 2023-03-06  301  	xfs_btree_mark_sick(cur);
ee12eaaa435a7b Darrick J. Wong 2023-04-11  302  	return -EFSCORRUPTED;
ee12eaaa435a7b Darrick J. Wong 2023-04-11  303  }
ee12eaaa435a7b Darrick J. Wong 2023-04-11  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
