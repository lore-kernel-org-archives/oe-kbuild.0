Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3997C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688452901; x=1719988901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4s4te4FL6dEn04BGBYJe1lskDEALcPQXg8ImDvyk3s=;
  b=YisdZf7ffOHmoYVUTDMO7L14h9vm9HuiWPV5cP1F+9y1/MjKs8RrwGAZ
   M7Jmnkhpwib9HzkUHapuWSVMogs8uiFway6yA6rltEZxRtvZWtqe1sbHo
   UdVoceOeHDkjjFA/sbGOmuixH/QHpWywABwCAfwXdshppe5kfsqES1iRy
   455iCn/HMEjFX4LFkaZk/6/8AVkGxMMZx3f210+wHjT1TWqtGrmFc8tDs
   YUGjUFewo2S66XAk26NYuz823DoF7ituW6ZPzTFod2tVk77nhhuHCqGYn
   2jK2oCzpkQzHbvh2oumb3f2paWuHykW7lhcbeK/Fqh8EiIHGgTaLXzu3y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426734265"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="426734265"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 23:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="721994442"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="721994442"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2023 23:41:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGZjG-000I0l-1L;
	Tue, 04 Jul 2023 06:41:38 +0000
Date: Tue, 4 Jul 2023 14:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 214/217]
 fs/xfs/scrub/agheader_repair.c:1101 xrep_iunlink_walk_ondisk_bucket() error:
 we previously assumed 'ip' could be null (see line 1083)
Message-ID: <202307041403.pyWFxRxd-lkp@intel.com>
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
commit: 6b123c302cdd25d18d8dcccc07ae427595641067 [214/217] xfs: repair AGI unlinked inode bucket lists
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041403.pyWFxRxd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041403.pyWFxRxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307041403.pyWFxRxd-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/agheader_repair.c:1101 xrep_iunlink_walk_ondisk_bucket() error: we previously assumed 'ip' could be null (see line 1083)
fs/xfs/scrub/agheader_repair.c:1448 xrep_iunlink_relink_next() error: we previously assumed 'ip' could be null (see line 1427)
fs/xfs/scrub/agheader_repair.c:1514 xrep_iunlink_relink_prev() error: we previously assumed 'ip' could be null (see line 1489)

vim +/ip +1101 fs/xfs/scrub/agheader_repair.c

6b123c302cdd25 Darrick J. Wong 2023-03-06  1056  
6b123c302cdd25 Darrick J. Wong 2023-03-06  1057  /*
6b123c302cdd25 Darrick J. Wong 2023-03-06  1058   * Walk an AGI unlinked bucket's list to load incore any unlinked inodes that
6b123c302cdd25 Darrick J. Wong 2023-03-06  1059   * still existed at mount time.  This can happen if iunlink processing fails
6b123c302cdd25 Darrick J. Wong 2023-03-06  1060   * during log recovery.
6b123c302cdd25 Darrick J. Wong 2023-03-06  1061   */
6b123c302cdd25 Darrick J. Wong 2023-03-06  1062  STATIC int
6b123c302cdd25 Darrick J. Wong 2023-03-06  1063  xrep_iunlink_walk_ondisk_bucket(
6b123c302cdd25 Darrick J. Wong 2023-03-06  1064  	struct xrep_agi		*ragi,
6b123c302cdd25 Darrick J. Wong 2023-03-06  1065  	unsigned int		bucket)
6b123c302cdd25 Darrick J. Wong 2023-03-06  1066  {
6b123c302cdd25 Darrick J. Wong 2023-03-06  1067  	struct xfs_scrub	*sc = ragi->sc;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1068  	struct xfs_inode	*ip;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1069  	struct xfs_agi		*agi = sc->sa.agi_bp->b_addr;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1070  	xfs_agino_t		prev_agino = NULLAGINO;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1071  	xfs_agino_t		next_agino;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1072  	int			error = 0;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1073  
6b123c302cdd25 Darrick J. Wong 2023-03-06  1074  	next_agino = be32_to_cpu(agi->agi_unlinked[bucket]);
6b123c302cdd25 Darrick J. Wong 2023-03-06  1075  	while (next_agino != NULLAGINO) {
6b123c302cdd25 Darrick J. Wong 2023-03-06  1076  		if (xchk_should_terminate(ragi->sc, &error))
6b123c302cdd25 Darrick J. Wong 2023-03-06  1077  			return error;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1078  
6b123c302cdd25 Darrick J. Wong 2023-03-06  1079  		trace_xrep_iunlink_walk_ondisk_bucket(sc->sa.pag, bucket,
6b123c302cdd25 Darrick J. Wong 2023-03-06  1080  				prev_agino, next_agino);
6b123c302cdd25 Darrick J. Wong 2023-03-06  1081  
6b123c302cdd25 Darrick J. Wong 2023-03-06  1082  		ip = xfs_iunlink_lookup(sc->sa.pag, next_agino);
6b123c302cdd25 Darrick J. Wong 2023-03-06 @1083  		if (!ip) {
6b123c302cdd25 Darrick J. Wong 2023-03-06  1084  			/*
6b123c302cdd25 Darrick J. Wong 2023-03-06  1085  			 * This unlinked inode wasn't incore.  Try to load it
6b123c302cdd25 Darrick J. Wong 2023-03-06  1086  			 * and link it into the incore list.
6b123c302cdd25 Darrick J. Wong 2023-03-06  1087  			 */
6b123c302cdd25 Darrick J. Wong 2023-03-06  1088  			error = xrep_iunlink_reload_inode(ragi, prev_agino,
6b123c302cdd25 Darrick J. Wong 2023-03-06  1089  					next_agino, &ip);
6b123c302cdd25 Darrick J. Wong 2023-03-06  1090  			if (error) {
6b123c302cdd25 Darrick J. Wong 2023-03-06  1091  				/*
6b123c302cdd25 Darrick J. Wong 2023-03-06  1092  				 * Inode cannot be resuscitated?  Terminate the
6b123c302cdd25 Darrick J. Wong 2023-03-06  1093  				 * chain.  We have other ways to find the rest
6b123c302cdd25 Darrick J. Wong 2023-03-06  1094  				 * of the inode(s) that might have been in this
6b123c302cdd25 Darrick J. Wong 2023-03-06  1095  				 * chain.
6b123c302cdd25 Darrick J. Wong 2023-03-06  1096  				 */
6b123c302cdd25 Darrick J. Wong 2023-03-06  1097  				break;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1098  			}
6b123c302cdd25 Darrick J. Wong 2023-03-06  1099  		}
6b123c302cdd25 Darrick J. Wong 2023-03-06  1100  
6b123c302cdd25 Darrick J. Wong 2023-03-06 @1101  		next_agino = ip->i_next_unlinked;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1102  	}
6b123c302cdd25 Darrick J. Wong 2023-03-06  1103  
6b123c302cdd25 Darrick J. Wong 2023-03-06  1104  	return 0;
6b123c302cdd25 Darrick J. Wong 2023-03-06  1105  }
6b123c302cdd25 Darrick J. Wong 2023-03-06  1106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
