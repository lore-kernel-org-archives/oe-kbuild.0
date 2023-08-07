Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2527392
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 02:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691375308; x=1722911308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPiaxKuug4yk7C96mZDGf0EeNWwnIDSupYHliQ+Yqdo=;
  b=Qlojg1MuKyBKJzmiyVtdMK12hFbLhPLZig4Vg/i4rVcBvwlO5Czk1eAN
   K3PURad1T0ay2SKg/oxi658NxQcroucNfNoXi8GB+LXOPyQ95DUxmCbgO
   pyCX3yuLAqjY5SEUmLKM54K/LGtp7qQC9NsYcMWPyp0pZhoCDeb7WerS6
   ok1QFPAUnH1uz+JT/f8vBPH2r3UNsEStGxxIE7RMCinsLAQeq97LzonaB
   QyflAXJlfLmPGqzTgtmi7nc7bH4EA/KWmA8NowhImei03XEp3CYkMtUNE
   Ggx4e7linzCNPtV5qdvqSGeF8hTi/tllydE4y0ZKgDl+gN6JzLoU141HC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="360520274"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="360520274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 19:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="820836126"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="820836126"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2023 19:28:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSpys-0004UR-08;
	Mon, 07 Aug 2023 02:28:26 +0000
Date: Mon, 7 Aug 2023 10:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 195/198]
 fs/xfs/scrub/agheader_repair.c:1101 xrep_iunlink_walk_ondisk_bucket() error:
 we previously assumed 'ip' could be null (see line 1083)
Message-ID: <202308071020.cF23y82h-lkp@intel.com>
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
head:   627ea4d1b15ea69698ec5b3a106d5bcd998f388f
commit: ef17644a1634000ae26e589a9d79ceabe1f2f4e7 [195/198] xfs: repair AGI unlinked inode bucket lists
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230807 (https://download.01.org/0day-ci/archive/20230807/202308071020.cF23y82h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308071020.cF23y82h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308071020.cF23y82h-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/agheader_repair.c:1101 xrep_iunlink_walk_ondisk_bucket() error: we previously assumed 'ip' could be null (see line 1083)
fs/xfs/scrub/agheader_repair.c:1448 xrep_iunlink_relink_next() error: we previously assumed 'ip' could be null (see line 1427)
fs/xfs/scrub/agheader_repair.c:1514 xrep_iunlink_relink_prev() error: we previously assumed 'ip' could be null (see line 1489)

vim +/ip +1101 fs/xfs/scrub/agheader_repair.c

ef17644a163400 Darrick J. Wong 2023-03-06  1056  
ef17644a163400 Darrick J. Wong 2023-03-06  1057  /*
ef17644a163400 Darrick J. Wong 2023-03-06  1058   * Walk an AGI unlinked bucket's list to load incore any unlinked inodes that
ef17644a163400 Darrick J. Wong 2023-03-06  1059   * still existed at mount time.  This can happen if iunlink processing fails
ef17644a163400 Darrick J. Wong 2023-03-06  1060   * during log recovery.
ef17644a163400 Darrick J. Wong 2023-03-06  1061   */
ef17644a163400 Darrick J. Wong 2023-03-06  1062  STATIC int
ef17644a163400 Darrick J. Wong 2023-03-06  1063  xrep_iunlink_walk_ondisk_bucket(
ef17644a163400 Darrick J. Wong 2023-03-06  1064  	struct xrep_agi		*ragi,
ef17644a163400 Darrick J. Wong 2023-03-06  1065  	unsigned int		bucket)
ef17644a163400 Darrick J. Wong 2023-03-06  1066  {
ef17644a163400 Darrick J. Wong 2023-03-06  1067  	struct xfs_scrub	*sc = ragi->sc;
ef17644a163400 Darrick J. Wong 2023-03-06  1068  	struct xfs_inode	*ip;
ef17644a163400 Darrick J. Wong 2023-03-06  1069  	struct xfs_agi		*agi = sc->sa.agi_bp->b_addr;
ef17644a163400 Darrick J. Wong 2023-03-06  1070  	xfs_agino_t		prev_agino = NULLAGINO;
ef17644a163400 Darrick J. Wong 2023-03-06  1071  	xfs_agino_t		next_agino;
ef17644a163400 Darrick J. Wong 2023-03-06  1072  	int			error = 0;
ef17644a163400 Darrick J. Wong 2023-03-06  1073  
ef17644a163400 Darrick J. Wong 2023-03-06  1074  	next_agino = be32_to_cpu(agi->agi_unlinked[bucket]);
ef17644a163400 Darrick J. Wong 2023-03-06  1075  	while (next_agino != NULLAGINO) {
ef17644a163400 Darrick J. Wong 2023-03-06  1076  		if (xchk_should_terminate(ragi->sc, &error))
ef17644a163400 Darrick J. Wong 2023-03-06  1077  			return error;
ef17644a163400 Darrick J. Wong 2023-03-06  1078  
ef17644a163400 Darrick J. Wong 2023-03-06  1079  		trace_xrep_iunlink_walk_ondisk_bucket(sc->sa.pag, bucket,
ef17644a163400 Darrick J. Wong 2023-03-06  1080  				prev_agino, next_agino);
ef17644a163400 Darrick J. Wong 2023-03-06  1081  
ef17644a163400 Darrick J. Wong 2023-03-06  1082  		ip = xfs_iunlink_lookup(sc->sa.pag, next_agino);
ef17644a163400 Darrick J. Wong 2023-03-06 @1083  		if (!ip) {
ef17644a163400 Darrick J. Wong 2023-03-06  1084  			/*
ef17644a163400 Darrick J. Wong 2023-03-06  1085  			 * This unlinked inode wasn't incore.  Try to load it
ef17644a163400 Darrick J. Wong 2023-03-06  1086  			 * and link it into the incore list.
ef17644a163400 Darrick J. Wong 2023-03-06  1087  			 */
ef17644a163400 Darrick J. Wong 2023-03-06  1088  			error = xrep_iunlink_reload_inode(ragi, prev_agino,
ef17644a163400 Darrick J. Wong 2023-03-06  1089  					next_agino, &ip);
ef17644a163400 Darrick J. Wong 2023-03-06  1090  			if (error) {
ef17644a163400 Darrick J. Wong 2023-03-06  1091  				/*
ef17644a163400 Darrick J. Wong 2023-03-06  1092  				 * Inode cannot be resuscitated?  Terminate the
ef17644a163400 Darrick J. Wong 2023-03-06  1093  				 * chain.  We have other ways to find the rest
ef17644a163400 Darrick J. Wong 2023-03-06  1094  				 * of the inode(s) that might have been in this
ef17644a163400 Darrick J. Wong 2023-03-06  1095  				 * chain.
ef17644a163400 Darrick J. Wong 2023-03-06  1096  				 */
ef17644a163400 Darrick J. Wong 2023-03-06  1097  				break;
ef17644a163400 Darrick J. Wong 2023-03-06  1098  			}
ef17644a163400 Darrick J. Wong 2023-03-06  1099  		}
ef17644a163400 Darrick J. Wong 2023-03-06  1100  
ef17644a163400 Darrick J. Wong 2023-03-06 @1101  		next_agino = ip->i_next_unlinked;
ef17644a163400 Darrick J. Wong 2023-03-06  1102  	}
ef17644a163400 Darrick J. Wong 2023-03-06  1103  
ef17644a163400 Darrick J. Wong 2023-03-06  1104  	return 0;
ef17644a163400 Darrick J. Wong 2023-03-06  1105  }
ef17644a163400 Darrick J. Wong 2023-03-06  1106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
