Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0741DF24A
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278809; cv=none; b=MFvj0OpSTPnr7wyX9EGYWdxEoXBFPVSEVapMhZIAScVGQKEs5i5OkaJTP2k8I1LQgfofaLxa62oCdmzWDV2p9WmysM3sKKvUvJsYgAYys5HKk0VyakGCfZ0xrrV4LtyYTpm1oqgxARXKcirhAuBV18XgRGTQmWs130rOXGxz3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278809; c=relaxed/simple;
	bh=nurx9Nh7fqq8XZGO5gV1mclOh+m3f0PiT32OUXJqQ4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iO77qfjNe7eSB3fIgcnxbP7B5EPWiwvOhrQhKX7hbrx7qm6gZVmn9PWQndxhpGI5+d23yA8serWSvdkST4U9ZFCR48fr9H0umKyo+mdjZNsAQYe+d2VStxnIshyC+LSehf8YcWa3fUNE5VLUdq/oBbUmf7UEeoaQR0r1p5vP0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqFmmsjV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqFmmsjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732278807; x=1763814807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nurx9Nh7fqq8XZGO5gV1mclOh+m3f0PiT32OUXJqQ4s=;
  b=kqFmmsjVYgYB47DEA8GJ0HZRekVAGxvPSZaCi8FMt1BqV87LxfcqET2r
   2S9xnl7N9GJIhMbatrtT3gPl0ZyGT+YoH7fL5q32V033dWnDUWgTkPwxX
   IJQQ9ODELH8sO5aUwPmGnwB/lzdkOUXxR/OhfV+fVOYorCsrgLgh2Ih0m
   FdIIE8LFR054MFh1t2T/uZ019IwithlhL5dfP9xut7cb8xtnzBSbfkJMp
   3qO4Ysb4Tft8yPcbRJqwoatu7ZmOpDkSnn/S5biPvbJihf07soRUIDCBx
   KWBVapVekfHDplCTbUuXAfGk0+wcoTuilBqiDk1YIBkQDqR4jGRCAiiEd
   A==;
X-CSE-ConnectionGUID: Y41+VANuQ1u+RfBHVw4IhQ==
X-CSE-MsgGUID: O7S3US26RamfYRdD1LwHFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32583974"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32583974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 04:33:25 -0800
X-CSE-ConnectionGUID: ewyQr02IQgOD3XhauFSvSg==
X-CSE-MsgGUID: OhSQMj9CTjSOQi/POwVhTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90732161"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 04:33:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tESqf-0003tr-1S;
	Fri, 22 Nov 2024 12:33:21 +0000
Date: Fri, 22 Nov 2024 20:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/scrub/rtsummary.c:288 xchk_rtsum_compare() warn: missing
 error code? 'error'
Message-ID: <202411222034.c3kvpXzY-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 04f0c3269b41f28c041980a30514850453ded251 xfs: check rt summary file geometry more thoroughly
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r071-20241122 (https://download.01.org/0day-ci/archive/20241122/202411222034.c3kvpXzY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411222034.c3kvpXzY-lkp@intel.com/

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
04f0c3269b41f2 Darrick J. Wong 2023-12-15  226  	struct xfs_iext_cursor	icur;
526aab5f5790e2 Darrick J. Wong 2023-08-10  227  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  228  	struct xfs_mount	*mp = sc->mp;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  229  	struct xfs_inode	*ip = sc->ip;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  230  	struct xchk_rtsummary	*rts = sc->buf;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  231  	xfs_fileoff_t		off = 0;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  232  	xfs_fileoff_t		endoff;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  233  	xfs_rtsumoff_t		sumoff = 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  234  	int			error = 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  235  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  236  	rts->args.mp = sc->mp;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  237  	rts->args.tp = sc->tp;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  238  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  239  	/* Mappings may not cross or lie beyond EOF. */
04f0c3269b41f2 Darrick J. Wong 2023-12-15  240  	endoff = XFS_B_TO_FSB(mp, ip->i_disk_size);
04f0c3269b41f2 Darrick J. Wong 2023-12-15  241  	if (xfs_iext_lookup_extent(ip, &ip->i_df, endoff, &icur, &map)) {
04f0c3269b41f2 Darrick J. Wong 2023-12-15  242  		xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, endoff);
04f0c3269b41f2 Darrick J. Wong 2023-12-15  243  		return 0;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  244  	}
04f0c3269b41f2 Darrick J. Wong 2023-12-15  245  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  246  	while (off < endoff) {
04f0c3269b41f2 Darrick J. Wong 2023-12-15  247  		int		nmap = 1;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  248  
526aab5f5790e2 Darrick J. Wong 2023-08-10  249  		if (xchk_should_terminate(sc, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  250  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  251  		if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
526aab5f5790e2 Darrick J. Wong 2023-08-10  252  			return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  253  
526aab5f5790e2 Darrick J. Wong 2023-08-10  254  		/* Make sure we have a written extent. */
04f0c3269b41f2 Darrick J. Wong 2023-12-15  255  		error = xfs_bmapi_read(ip, off, endoff - off, &map, &nmap,
526aab5f5790e2 Darrick J. Wong 2023-08-10  256  				XFS_DATA_FORK);
526aab5f5790e2 Darrick J. Wong 2023-08-10  257  		if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, off, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  258  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  259  
526aab5f5790e2 Darrick J. Wong 2023-08-10  260  		if (nmap != 1 || !xfs_bmap_is_written_extent(&map)) {
526aab5f5790e2 Darrick J. Wong 2023-08-10  261  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, off);
526aab5f5790e2 Darrick J. Wong 2023-08-10  262  			return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  263  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  264  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  265  		off += map.br_blockcount;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  266  	}
04f0c3269b41f2 Darrick J. Wong 2023-12-15  267  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  268  	for (off = 0; off < endoff; off++) {
04f0c3269b41f2 Darrick J. Wong 2023-12-15  269  		union xfs_suminfo_raw	*ondisk_info;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  270  
526aab5f5790e2 Darrick J. Wong 2023-08-10  271  		/* Read a block's worth of ondisk rtsummary file. */
04f0c3269b41f2 Darrick J. Wong 2023-12-15  272  		error = xfs_rtsummary_read_buf(&rts->args, off);
526aab5f5790e2 Darrick J. Wong 2023-08-10  273  		if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, off, &error))
526aab5f5790e2 Darrick J. Wong 2023-08-10  274  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  275  
526aab5f5790e2 Darrick J. Wong 2023-08-10  276  		/* Read a block's worth of computed rtsummary file. */
04f0c3269b41f2 Darrick J. Wong 2023-12-15  277  		error = xfsum_copyout(sc, sumoff, rts->words, mp->m_blockwsize);
526aab5f5790e2 Darrick J. Wong 2023-08-10  278  		if (error) {
04f0c3269b41f2 Darrick J. Wong 2023-12-15  279  			xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  280  			return error;
526aab5f5790e2 Darrick J. Wong 2023-08-10  281  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  282  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  283  		ondisk_info = xfs_rsumblock_infoptr(&rts->args, 0);
04f0c3269b41f2 Darrick J. Wong 2023-12-15  284  		if (memcmp(ondisk_info, rts->words,
04f0c3269b41f2 Darrick J. Wong 2023-12-15  285  					mp->m_blockwsize << XFS_WORDLOG) != 0) {
526aab5f5790e2 Darrick J. Wong 2023-08-10  286  			xchk_fblock_set_corrupt(sc, XFS_DATA_FORK, off);
04f0c3269b41f2 Darrick J. Wong 2023-12-15  287  			xfs_rtbuf_cache_relse(&rts->args);
04f0c3269b41f2 Darrick J. Wong 2023-12-15 @288  			return error;
04f0c3269b41f2 Darrick J. Wong 2023-12-15  289  		}
526aab5f5790e2 Darrick J. Wong 2023-08-10  290  
04f0c3269b41f2 Darrick J. Wong 2023-12-15  291  		xfs_rtbuf_cache_relse(&rts->args);
526aab5f5790e2 Darrick J. Wong 2023-08-10  292  		sumoff += mp->m_blockwsize;
526aab5f5790e2 Darrick J. Wong 2023-08-10  293  	}
526aab5f5790e2 Darrick J. Wong 2023-08-10  294  
526aab5f5790e2 Darrick J. Wong 2023-08-10  295  	return 0;
526aab5f5790e2 Darrick J. Wong 2023-08-10  296  }
526aab5f5790e2 Darrick J. Wong 2023-08-10  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
