Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178907493
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1opqfDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702263510; x=1733799510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6gXIJ3lQr7H/8xNcMNJMjAQBKNbYrisrMtCN581WOQY=;
  b=m1opqfDUkWx+1K7FwcBfnnHD6YHY/ud7LpCa666qD++c1jljp+SyCbG9
   7SFAcxV7yndXuj4gXJqLOACePMs3qR3b+USgyxowWSUhIHuWJD5grnc1e
   BcxX8Jm7J0Uk4Mo5jFUFgIFK+P4+KvpXhC8QKZEylaKZSN2GeiMmIY9wK
   feayJjbgcUevdIAAZ67PrbxBYf1mtZKkzDJZj4s1bIwVUIEp296dZhV4E
   P0w6QIv8z61vVUqsUuPtVpIwDcl1o33Yxl9IViN6/w3sqN3KOUpqDyfKD
   P+XYt1RggJRXsPHYyl5YC2GYkGVVlOutQpg9a8ZqE7GC0p2Im1pK+bcE4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379583320"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="379583320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 18:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="772871285"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="772871285"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2023 18:58:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCWUz-000HZg-1f;
	Mon, 11 Dec 2023 02:58:25 +0000
Date: Mon, 11 Dec 2023 10:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 61/205] fs/xfs/scrub/rtsummary.c:288
 xchk_rtsum_compare() warn: missing error code? 'error'
Message-ID: <202312111046.AVIXqABS-lkp@intel.com>
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
head:   ae5732f1c245c24e63c885992c35f723f36f79ff
commit: 47301ab5762a101097a4c924722ffdb4f36776a2 [61/205] xfs: check rt summary file geometry more thoroughly
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111046.AVIXqABS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111046.AVIXqABS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312111046.AVIXqABS-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/rtsummary.c:288 xchk_rtsum_compare() warn: missing error code? 'error'

vim +/error +288 fs/xfs/scrub/rtsummary.c

526aab5f5790e2 Darrick J. Wong 2023-08-10  219  
526aab5f5790e2 Darrick J. Wong 2023-08-10  220  /* Compare the rtsummary file against the one we computed. */
526aab5f5790e2 Darrick J. Wong 2023-08-10  221  STATIC int
526aab5f5790e2 Darrick J. Wong 2023-08-10  222  xchk_rtsum_compare(
526aab5f5790e2 Darrick J. Wong 2023-08-10  223  	struct xfs_scrub	*sc)
526aab5f5790e2 Darrick J. Wong 2023-08-10  224  {
526aab5f5790e2 Darrick J. Wong 2023-08-10  225  	struct xfs_bmbt_irec	map;
47301ab5762a10 Darrick J. Wong 2023-10-13  226  	struct xfs_iext_cursor	icur;
526aab5f5790e2 Darrick J. Wong 2023-08-10  227  
47301ab5762a10 Darrick J. Wong 2023-10-13  228  	struct xfs_mount	*mp = sc->mp;
47301ab5762a10 Darrick J. Wong 2023-10-13  229  	struct xfs_inode	*ip = sc->ip;
47301ab5762a10 Darrick J. Wong 2023-10-13  230  	struct xchk_rtsummary	*rts = sc->buf;
47301ab5762a10 Darrick J. Wong 2023-10-13  231  	xfs_fileoff_t		off = 0;
47301ab5762a10 Darrick J. Wong 2023-10-13  232  	xfs_fileoff_t		endoff;
47301ab5762a10 Darrick J. Wong 2023-10-13  233  	xfs_rtsumoff_t		sumoff = 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  234  	int			error = 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  235  
47301ab5762a10 Darrick J. Wong 2023-10-13  236  	rts->args.mp = sc->mp;
47301ab5762a10 Darrick J. Wong 2023-10-13  237  	rts->args.tp = sc->tp;
47301ab5762a10 Darrick J. Wong 2023-10-13  238  
47301ab5762a10 Darrick J. Wong 2023-10-13  239  	/* Mappings may not cross or lie beyond EOF. */
47301ab5762a10 Darrick J. Wong 2023-10-13  240  	endoff = XFS_B_TO_FSB(mp, ip->i_disk_size);
47301ab5762a10 Darrick J. Wong 2023-10-13  241  	if (xfs_iext_lookup_extent(ip, &ip->i_df, endoff, &icur, &map)) {
47301ab5762a10 Darrick J. Wong 2023-10-13  242  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, endoff);
47301ab5762a10 Darrick J. Wong 2023-10-13  243  		return 0;
47301ab5762a10 Darrick J. Wong 2023-10-13  244  	}
47301ab5762a10 Darrick J. Wong 2023-10-13  245  
47301ab5762a10 Darrick J. Wong 2023-10-13  246  	while (off < endoff) {
47301ab5762a10 Darrick J. Wong 2023-10-13  247  		int		nmap = 1;
47301ab5762a10 Darrick J. Wong 2023-10-13  248  
526aab5f5790e2 Darrick J. Wong 2023-08-10  249  		if (xchk_should_terminate(sc, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  250  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  251  		if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
526aab5f5790e2 Darrick J. Wong 2023-08-10  252  			return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  253  
526aab5f5790e2 Darrick J. Wong 2023-08-10  254  		/* Make sure we have a written extent. */
47301ab5762a10 Darrick J. Wong 2023-10-13  255  		error = xfs_bmapi_read(ip, off, endoff - off, &map, &nmap,
526aab5f5790e2 Darrick J. Wong 2023-08-10  256  				XFS_DATA_FORK);
526aab5f5790e2 Darrick J. Wong 2023-08-10  257  		if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, off, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  258  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  259  
526aab5f5790e2 Darrick J. Wong 2023-08-10  260  		if (nmap != 1 || !xfs_bmap_is_written_extent(&map)) {
526aab5f5790e2 Darrick J. Wong 2023-08-10  261  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, off);
526aab5f5790e2 Darrick J. Wong 2023-08-10  262  			return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  263  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  264  
47301ab5762a10 Darrick J. Wong 2023-10-13  265  		off += map.br_blockcount;
47301ab5762a10 Darrick J. Wong 2023-10-13  266  	}
47301ab5762a10 Darrick J. Wong 2023-10-13  267  
47301ab5762a10 Darrick J. Wong 2023-10-13  268  	for (off = 0; off < endoff; off++) {
47301ab5762a10 Darrick J. Wong 2023-10-13  269  		union xfs_suminfo_raw	*ondisk_info;
47301ab5762a10 Darrick J. Wong 2023-10-13  270  
526aab5f5790e2 Darrick J. Wong 2023-08-10  271  		/* Read a block's worth of ondisk rtsummary file. */
47301ab5762a10 Darrick J. Wong 2023-10-13  272  		error = xfs_rtsummary_read_buf(&rts->args, off);
526aab5f5790e2 Darrick J. Wong 2023-08-10  273  		if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, off, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  274  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  275  
526aab5f5790e2 Darrick J. Wong 2023-08-10  276  		/* Read a block's worth of computed rtsummary file. */
47301ab5762a10 Darrick J. Wong 2023-10-13  277  		error = xfsum_copyout(sc, sumoff, rts->words, mp->m_blockwsize);
526aab5f5790e2 Darrick J. Wong 2023-08-10  278  		if (error) {
47301ab5762a10 Darrick J. Wong 2023-10-13  279  			xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  280  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  281  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  282  
47301ab5762a10 Darrick J. Wong 2023-10-13  283  		ondisk_info = xfs_rsumblock_infoptr(&rts->args, 0);
47301ab5762a10 Darrick J. Wong 2023-10-13  284  		if (memcmp(ondisk_info, rts->words,
47301ab5762a10 Darrick J. Wong 2023-10-13  285  					mp->m_blockwsize << XFS_WORDLOG) != 0) {
526aab5f5790e2 Darrick J. Wong 2023-08-10  286  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, off);
47301ab5762a10 Darrick J. Wong 2023-10-13  287  			xfs_rtbuf_cache_relse(&rts->args);
47301ab5762a10 Darrick J. Wong 2023-10-13 @288  			return error;
47301ab5762a10 Darrick J. Wong 2023-10-13  289  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  290  
47301ab5762a10 Darrick J. Wong 2023-10-13  291  		xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  292  		sumoff += mp->m_blockwsize;
526aab5f5790e2 Darrick J. Wong 2023-08-10  293  	}
526aab5f5790e2 Darrick J. Wong 2023-08-10  294  
526aab5f5790e2 Darrick J. Wong 2023-08-10  295  	return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  296  }
526aab5f5790e2 Darrick J. Wong 2023-08-10  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
