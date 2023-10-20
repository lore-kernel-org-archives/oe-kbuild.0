Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B81A71B
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Oct 2023 23:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0y0VSkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697844637; x=1729380637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcR3tenIQN9d77ajR92EksEwxMaAzExUCZ18pwF9ATI=;
  b=K0y0VSkZSWM09WyVYtjbpZ2yPIU9XqQcpTMd5wb49pLnvWN6RWKj6KIS
   /dP+cF4Fq86diM94kfKCEm0xATiQz5EJYFV9VrOOO9A4iKkSgEXXI9lYW
   nr/zVogho5y0XtlEoRhc2wSANNIrhndP2lz2hvtLy6w+weWNIJbgSZ2Dq
   Fyq6zqzCU9WqflKEcc3zsUv/okybHkO9666izfPwGLTE4qDu/eT68knyR
   71PzwIgGQzDgb4YibnnE9PMK0k2isDBA+B9RB+AS9gXFfxT2QzMk2PQ2l
   r5exeSiqh+0ht4szGh43pizayO3EelKCeTE4b1in5bbH/hpFlsP79IehW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376968675"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="376968675"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848234962"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="848234962"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 16:30:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtywq-00046k-2y;
	Fri, 20 Oct 2023 23:30:32 +0000
Date: Sat, 21 Oct 2023 07:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 83/172] fs/xfs/libxfs/xfs_rmap.c:277
 xfs_rmap_check_irec() warn: bitwise AND condition is false here
Message-ID: <202310210741.P9MWWx6z-lkp@intel.com>
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
head:   b906f6a9d64e5a914bcc5e69a08dd27e99361afd
commit: 2b827256b6c1c99c1833167ca6c2abbc857c7d04 [83/172] xfs: create a shadow rmap btree during rmap repair
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20231017 (https://download.01.org/0day-ci/archive/20231021/202310210741.P9MWWx6z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210741.P9MWWx6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310210741.P9MWWx6z-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_rmap.c:277 xfs_rmap_check_irec() warn: bitwise AND condition is false here
fs/xfs/libxfs/xfs_rmap.c:290 xfs_rmap_complain_bad_rec() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/libxfs/xfs_rmap.c:992 xfs_rmap_map() warn: always true condition '(ltrec.rm_blockcount + len + gtrec.rm_blockcount <= (~0)) => (0-u32max <= u32max)'

vim +277 fs/xfs/libxfs/xfs_rmap.c

c4e34172da26cb Darrick J. Wong 2023-04-11  270  
57edac971cfd75 Darrick J. Wong 2023-03-06  271  /* Simple checks for rmap records. */
57edac971cfd75 Darrick J. Wong 2023-03-06  272  xfs_failaddr_t
57edac971cfd75 Darrick J. Wong 2023-03-06  273  xfs_rmap_check_irec(
57edac971cfd75 Darrick J. Wong 2023-03-06  274  	struct xfs_btree_cur		*cur,
57edac971cfd75 Darrick J. Wong 2023-03-06  275  	const struct xfs_rmap_irec	*irec)
57edac971cfd75 Darrick J. Wong 2023-03-06  276  {
2b827256b6c1c9 Darrick J. Wong 2023-03-06 @277  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
2b827256b6c1c9 Darrick J. Wong 2023-03-06  278  		return xfs_rmap_check_perag_irec(cur->bc_mem.pag, irec);
57edac971cfd75 Darrick J. Wong 2023-03-06  279  	return xfs_rmap_check_perag_irec(cur->bc_ag.pag, irec);
57edac971cfd75 Darrick J. Wong 2023-03-06  280  }
57edac971cfd75 Darrick J. Wong 2023-03-06  281  
ee12eaaa435a7b Darrick J. Wong 2023-04-11  282  static inline int
ee12eaaa435a7b Darrick J. Wong 2023-04-11  283  xfs_rmap_complain_bad_rec(
ee12eaaa435a7b Darrick J. Wong 2023-04-11  284  	struct xfs_btree_cur		*cur,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  285  	xfs_failaddr_t			fa,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  286  	const struct xfs_rmap_irec	*irec)
ee12eaaa435a7b Darrick J. Wong 2023-04-11  287  {
ee12eaaa435a7b Darrick J. Wong 2023-04-11  288  	struct xfs_mount		*mp = cur->bc_mp;
ee12eaaa435a7b Darrick J. Wong 2023-04-11  289  
2b827256b6c1c9 Darrick J. Wong 2023-03-06 @290  	if (cur->bc_flags & XFS_BTREE_IN_XFILE)
2b827256b6c1c9 Darrick J. Wong 2023-03-06  291  		xfs_warn(mp,
2b827256b6c1c9 Darrick J. Wong 2023-03-06  292   "In-Memory Reverse Mapping BTree record corruption detected at %pS!", fa);
2b827256b6c1c9 Darrick J. Wong 2023-03-06  293  	else
ee12eaaa435a7b Darrick J. Wong 2023-04-11  294  		xfs_warn(mp,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  295   "Reverse Mapping BTree record corruption in AG %d detected at %pS!",
ee12eaaa435a7b Darrick J. Wong 2023-04-11  296  			cur->bc_ag.pag->pag_agno, fa);
ee12eaaa435a7b Darrick J. Wong 2023-04-11  297  	xfs_warn(mp,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  298  		"Owner 0x%llx, flags 0x%x, start block 0x%x block count 0x%x",
ee12eaaa435a7b Darrick J. Wong 2023-04-11  299  		irec->rm_owner, irec->rm_flags, irec->rm_startblock,
ee12eaaa435a7b Darrick J. Wong 2023-04-11  300  		irec->rm_blockcount);
32d6fdfa27ce50 Darrick J. Wong 2023-03-06  301  	xfs_btree_mark_sick(cur);
ee12eaaa435a7b Darrick J. Wong 2023-04-11  302  	return -EFSCORRUPTED;
ee12eaaa435a7b Darrick J. Wong 2023-04-11  303  }
ee12eaaa435a7b Darrick J. Wong 2023-04-11  304  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
