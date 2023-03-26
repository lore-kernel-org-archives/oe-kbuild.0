Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EAC62F
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679804671; x=1711340671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GYBHTxhc+OehkR3fo6CBU398RSY9bnVt1A+z7IhJ1A=;
  b=FhH4d2pP61twFk+Fp42ZIXG4m/yMxNO+y2MDY/qcZEI0biAz9eMigEcD
   b4ocx+8t8XZLt7uxWGr4aznLYPZLUpDq/BRAJ33XYRyETtl7GbUE/3CtB
   fUukmhXyts/sjRXTyqkI1NhNch0rRafClJ+eUiBQiHP7FVYPDFYTnC0EC
   IIouDtbcWewTVmlXmUsuVE7m0ZfF5cgEMI4obT3YVwnV/vrFM2LkvO1bB
   CALe1mjx5hky1QXk942PfaP8334HdhvIhre+TCiqeavTYm3IAaDu4lZOd
   P97nXCOOVRYkhdAcCRT8XeqAygshajDkZNWjBKbpUmbZl4c1MKeKRLEhc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="320446671"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="320446671"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="793909529"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="793909529"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2023 21:24:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgHvg-000GsJ-1k;
	Sun, 26 Mar 2023 04:24:28 +0000
Date: Sun, 26 Mar 2023 12:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 284/287]
 fs/xfs/scrub/agheader_repair.c:1098 xrep_iunlink_walk_ondisk_bucket() error:
 we previously assumed 'ip' could be null (see line 1080)
Message-ID: <202303261247.AXq3cYVl-lkp@intel.com>
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
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: 78232351d457263c866639a51b28b1fabadafd4f [284/287] xfs: repair AGI unlinked inode bucket lists
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303261247.AXq3cYVl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303261247.AXq3cYVl-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/agheader_repair.c:1098 xrep_iunlink_walk_ondisk_bucket() error: we previously assumed 'ip' could be null (see line 1080)
fs/xfs/scrub/agheader_repair.c:1445 xrep_iunlink_relink_next() error: we previously assumed 'ip' could be null (see line 1424)
fs/xfs/scrub/agheader_repair.c:1511 xrep_iunlink_relink_prev() error: we previously assumed 'ip' could be null (see line 1486)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/ip +1098 fs/xfs/scrub/agheader_repair.c

78232351d45726 Darrick J. Wong 2023-03-06  1053  
78232351d45726 Darrick J. Wong 2023-03-06  1054  /*
78232351d45726 Darrick J. Wong 2023-03-06  1055   * Walk an AGI unlinked bucket's list to load incore any unlinked inodes that
78232351d45726 Darrick J. Wong 2023-03-06  1056   * still existed at mount time.  This can happen if iunlink processing fails
78232351d45726 Darrick J. Wong 2023-03-06  1057   * during log recovery.
78232351d45726 Darrick J. Wong 2023-03-06  1058   */
78232351d45726 Darrick J. Wong 2023-03-06  1059  STATIC int
78232351d45726 Darrick J. Wong 2023-03-06  1060  xrep_iunlink_walk_ondisk_bucket(
78232351d45726 Darrick J. Wong 2023-03-06  1061  	struct xrep_agi		*ragi,
78232351d45726 Darrick J. Wong 2023-03-06  1062  	unsigned int		bucket)
78232351d45726 Darrick J. Wong 2023-03-06  1063  {
78232351d45726 Darrick J. Wong 2023-03-06  1064  	struct xfs_scrub	*sc = ragi->sc;
78232351d45726 Darrick J. Wong 2023-03-06  1065  	struct xfs_inode	*ip;
78232351d45726 Darrick J. Wong 2023-03-06  1066  	struct xfs_agi		*agi = sc->sa.agi_bp->b_addr;
78232351d45726 Darrick J. Wong 2023-03-06  1067  	xfs_agino_t		prev_agino = NULLAGINO;
78232351d45726 Darrick J. Wong 2023-03-06  1068  	xfs_agino_t		next_agino;
78232351d45726 Darrick J. Wong 2023-03-06  1069  	int			error = 0;
78232351d45726 Darrick J. Wong 2023-03-06  1070  
78232351d45726 Darrick J. Wong 2023-03-06  1071  	next_agino = be32_to_cpu(agi->agi_unlinked[bucket]);
78232351d45726 Darrick J. Wong 2023-03-06  1072  	while (next_agino != NULLAGINO) {
78232351d45726 Darrick J. Wong 2023-03-06  1073  		if (xchk_should_terminate(ragi->sc, &error))
78232351d45726 Darrick J. Wong 2023-03-06  1074  			return error;
78232351d45726 Darrick J. Wong 2023-03-06  1075  
78232351d45726 Darrick J. Wong 2023-03-06  1076  		trace_xrep_iunlink_walk_ondisk_bucket(sc->sa.pag, bucket,
78232351d45726 Darrick J. Wong 2023-03-06  1077  				prev_agino, next_agino);
78232351d45726 Darrick J. Wong 2023-03-06  1078  
78232351d45726 Darrick J. Wong 2023-03-06  1079  		ip = xfs_iunlink_lookup(sc->sa.pag, next_agino);
78232351d45726 Darrick J. Wong 2023-03-06 @1080  		if (!ip) {
78232351d45726 Darrick J. Wong 2023-03-06  1081  			/*
78232351d45726 Darrick J. Wong 2023-03-06  1082  			 * This unlinked inode wasn't incore.  Try to load it
78232351d45726 Darrick J. Wong 2023-03-06  1083  			 * and link it into the incore list.
78232351d45726 Darrick J. Wong 2023-03-06  1084  			 */
78232351d45726 Darrick J. Wong 2023-03-06  1085  			error = xrep_iunlink_reload_inode(ragi, prev_agino,
78232351d45726 Darrick J. Wong 2023-03-06  1086  					next_agino, &ip);
78232351d45726 Darrick J. Wong 2023-03-06  1087  			if (error) {
78232351d45726 Darrick J. Wong 2023-03-06  1088  				/*
78232351d45726 Darrick J. Wong 2023-03-06  1089  				 * Inode cannot be resuscitated?  Terminate the
78232351d45726 Darrick J. Wong 2023-03-06  1090  				 * chain.  We have other ways to find the rest
78232351d45726 Darrick J. Wong 2023-03-06  1091  				 * of the inode(s) that might have been in this
78232351d45726 Darrick J. Wong 2023-03-06  1092  				 * chain.
78232351d45726 Darrick J. Wong 2023-03-06  1093  				 */
78232351d45726 Darrick J. Wong 2023-03-06  1094  				break;
78232351d45726 Darrick J. Wong 2023-03-06  1095  			}
78232351d45726 Darrick J. Wong 2023-03-06  1096  		}
78232351d45726 Darrick J. Wong 2023-03-06  1097  
78232351d45726 Darrick J. Wong 2023-03-06 @1098  		next_agino = ip->i_next_unlinked;
78232351d45726 Darrick J. Wong 2023-03-06  1099  	}
78232351d45726 Darrick J. Wong 2023-03-06  1100  
78232351d45726 Darrick J. Wong 2023-03-06  1101  	return 0;
78232351d45726 Darrick J. Wong 2023-03-06  1102  }
78232351d45726 Darrick J. Wong 2023-03-06  1103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
