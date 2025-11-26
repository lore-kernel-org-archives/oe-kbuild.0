Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66331F956
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764120712; cv=none; b=QLetOLbDT9NXRoty6OaEgjHoNvvDp7cQeHermdi7Y6kIrJwO/SdhEifP6B4btLiS3hOr0v1CgYkcfnq7u4cEKkptdphhscoIRn5lPWLVA+pUtrirzgIITn7qWko5/hw2avGCvNSzWsHvAK/yipApzWRhaXKwCdCz7RtsjeKqhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764120712; c=relaxed/simple;
	bh=E6Wd6ckck/Mdbx2KTSeWTlgFSrFYKti0eHP2z1wE0BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxVFJbMVeFfCV6lX2BThlab3IXWt3Y4Z+my/kilalikMEFkdjL2vcNZGAaBhsIh5VZfHX9CuMU+Q1zTCEtgF4zSuu35hsMA8YqHJCtwIkquvBrdbKsNmsMHzY65plDNqP8Pk2JmO2VBkotPVdHVl7j2U2LJWFmLF5fM79be/FUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu3hMWdU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu3hMWdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764120711; x=1795656711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6Wd6ckck/Mdbx2KTSeWTlgFSrFYKti0eHP2z1wE0BM=;
  b=Gu3hMWdUSWrZsxdYcou9a71a1KtnkeRD9MKP9T77584DqmwOCogZqb71
   x+5lgH7xvx/yHYVotdvKZ6ta3+Wf3PVk2FmXqshA+YNRT5pZTkL2JmLKp
   LitUMmUm3/K0HiwrdMV9Q3rQUmXyCLGaTjsVLxVdJwZW0tDhwSe/b0CHI
   g67bPXhomTYh3G81Vl/zcLIdfZQHK8JZkpn6UDESODHiEWLdKSmTRFYFn
   VcsQ4U3hQnFyUOobiPRzySPYebiHzP/Qv/D7zcCKl/aw3OutTkSQU5pTn
   lWeu6XgjQKMs+1vN1NJNJNg9MxkMGGboBovX9e59/VX75L0nc5KBsFmcg
   w==;
X-CSE-ConnectionGUID: 3Auk5zQtS76eK42Xfk369Q==
X-CSE-MsgGUID: xK5emDMSQ+KxmvhXRWS+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77261557"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="77261557"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 17:31:49 -0800
X-CSE-ConnectionGUID: 2CiFMmJmT72Jrq4aQvDHxg==
X-CSE-MsgGUID: U2azb60pTEqWJb9NSh0+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="191947250"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2025 17:31:47 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO4Nk-000000000bd-47Uv;
	Wed, 26 Nov 2025 01:31:44 +0000
Date: Wed, 26 Nov 2025 02:31:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5]
 fs/xfs/libxfs/xfs_attr_remote.c:556:1: warning: no previous prototype for
 'xfs_attr_rmtval_stale'
Message-ID: <202511260234.iwRdNUrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 821e0951b4b3e16bf2e0b336f23f66c4499acc33 [5/5] xfs: refactor remote attr value buffer invalidation
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 2 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511260234.iwRdNUrE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260234.iwRdNUrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511260234.iwRdNUrE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_attr_remote.c:32:1: warning: no previous prototype for 'xfs_attr3_rmt_blocks' [-Wmissing-prototypes]
      32 | xfs_attr3_rmt_blocks(
         | ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_remote.c:365:1: warning: no previous prototype for 'xfs_attr_rmtval_get' [-Wmissing-prototypes]
     365 | xfs_attr_rmtval_get(
         | ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_remote.c:431:1: warning: no previous prototype for 'xfs_attr_rmtval_set' [-Wmissing-prototypes]
     431 | xfs_attr_rmtval_set(
         | ^~~~~~~~~~~~~~~~~~~
>> fs/xfs/libxfs/xfs_attr_remote.c:556:1: warning: no previous prototype for 'xfs_attr_rmtval_stale' [-Wmissing-prototypes]
     556 | xfs_attr_rmtval_stale(
         | ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_remote.c:585:1: warning: no previous prototype for 'xfs_attr_rmtval_remove' [-Wmissing-prototypes]
     585 | xfs_attr_rmtval_remove(
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/xfs_attr_rmtval_stale +556 fs/xfs/libxfs/xfs_attr_remote.c

95920cd6ce1c9c fs/xfs/xfs_attr_remote.c        Dave Chinner    2013-04-03  553  
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  554  /* Mark stale any incore buffers for the remote value. */
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  555  int
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05 @556  xfs_attr_rmtval_stale(
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  557  	struct xfs_inode	*ip,
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  558  	struct xfs_bmbt_irec	*map,
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  559  	xfs_buf_flags_t		incore_flags)
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  560  {
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  561  	struct xfs_mount	*mp = ip->i_mount;
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  562  	struct xfs_buf		*bp;
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  563  
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  564  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  565  
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  566  	ASSERT((map->br_startblock != DELAYSTARTBLOCK) &&
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  567  	       (map->br_startblock != HOLESTARTBLOCK));
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  568  
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  569  	bp = xfs_buf_incore(mp->m_ddev_targp,
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  570  			XFS_FSB_TO_DADDR(mp, map->br_startblock),
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  571  			XFS_FSB_TO_BB(mp, map->br_blockcount), incore_flags);
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  572  	if (bp) {
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  573  		xfs_buf_stale(bp);
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  574  		xfs_buf_relse(bp);
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  575  	}
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  576  
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  577  	return 0;
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  578  }
821e0951b4b3e1 fs/xfs/libxfs/xfs_attr_remote.c Darrick J. Wong 2022-10-05  579  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
