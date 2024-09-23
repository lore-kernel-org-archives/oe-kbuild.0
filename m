Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB72E419
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727131972; cv=none; b=kqrpkcLsG29P8HFKpA2ItrX25TqO5+dOo746L96GU46Rc/l32RIddS+MIvCwdbxW0h+yhZj/jD9tSy5nQ09dA8lBZ23W6i5JSZP/rr3AiXRKb7irm9IJJlFqRmXQr3xwLetVS2Guz0T3cBgycsLYYWliYpszwbvNN6DsKaihc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727131972; c=relaxed/simple;
	bh=oA4GotzI1cgOIlGnNKfVPWKxen8SElbSGMGzj8YLjvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7FNvy5SCyfLR6PsMwCxLF+qIsVucp8g0EGL2ERkV2lzzK9L+kWAjbmpmtRzuLRFO3tR7TjTqxXRcQSErGIdrwzNfn0A/6wgD+WBOj9ytSIvf33jwznPEcxhK+qf4KPuRzUJqbeRP3uMzcwFG+HDKytbANgIO6Q7mf0GxxYi30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/gfTjGG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/gfTjGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727131970; x=1758667970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oA4GotzI1cgOIlGnNKfVPWKxen8SElbSGMGzj8YLjvs=;
  b=j/gfTjGGzESNun0rzjU80Gnx4lqvG7Q62HtRe1xTymvvSs4Duv48YdO3
   3sCgpyvAfQclaxKOrB9sEwCa7cur8NmvvHYoYObGYeMLMB+ksjlSnCv3Q
   2D41S8+vFbeiryLoddRICN6IgN7RNwjkbWItfiKzRCS/2BpNlsq9F1iSt
   xfOK9S/EVcnxVVNiWU4POmwns3OP0uYbsn2DmsgwWd8uZxEpnia2Q3n6w
   45yYraRZn7qBaCjqYXNFRYTg5pjAzztZeZbLbSTt/yf/AFgvOhQTBwESy
   adQ1/kzVpJ7jfUe/95oee1/FayFuSjgzlXkIYuRKbteUKzWjBV0I/yYz8
   Q==;
X-CSE-ConnectionGUID: 2cYph4fOQRCdCfDG+cS+Tw==
X-CSE-MsgGUID: wQJq5cVqR7C462THpjXnLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36673772"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="36673772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:52:49 -0700
X-CSE-ConnectionGUID: kvnN1htnRwiKUQVpmyrVwg==
X-CSE-MsgGUID: qPmtw2cJTj6SwEXZu4zJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71212304"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2024 15:52:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssrvB-000HfB-31;
	Mon, 23 Sep 2024 22:52:45 +0000
Date: Tue, 24 Sep 2024 06:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-generic-group-rebase 29/206] fs/xfs/xfs_iwalk.c:661
 xfs_iwalk_threaded() error: uninitialized symbol 'pag'.
Message-ID: <202409240645.lsGhUcUd-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-generic-group-rebase
head:   6e8f580a439f77db93742b852ff2e51d70ebdebb
commit: 49fd69b209296047b1f3dd73f7749ae7e6da1947 [29/206] xfs: switch perag iteration from the for_each macros to a while based iterator
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r072-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240645.lsGhUcUd-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409240645.lsGhUcUd-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_iwalk.c:661 xfs_iwalk_threaded() error: uninitialized symbol 'pag'.

vim +/pag +661 fs/xfs/xfs_iwalk.c

40786717c88c2d Darrick J. Wong   2019-07-03  634  
40786717c88c2d Darrick J. Wong   2019-07-03  635  /*
40786717c88c2d Darrick J. Wong   2019-07-03  636   * Walk all the inodes in the filesystem using multiple threads to process each
40786717c88c2d Darrick J. Wong   2019-07-03  637   * AG.
40786717c88c2d Darrick J. Wong   2019-07-03  638   */
40786717c88c2d Darrick J. Wong   2019-07-03  639  int
40786717c88c2d Darrick J. Wong   2019-07-03  640  xfs_iwalk_threaded(
40786717c88c2d Darrick J. Wong   2019-07-03  641  	struct xfs_mount	*mp,
40786717c88c2d Darrick J. Wong   2019-07-03  642  	xfs_ino_t		startino,
13d59a2a61cbbb Darrick J. Wong   2019-07-03  643  	unsigned int		flags,
40786717c88c2d Darrick J. Wong   2019-07-03  644  	xfs_iwalk_fn		iwalk_fn,
40786717c88c2d Darrick J. Wong   2019-07-03  645  	unsigned int		inode_records,
3e5a428b264eca Darrick J. Wong   2019-07-03  646  	bool			polled,
40786717c88c2d Darrick J. Wong   2019-07-03  647  	void			*data)
40786717c88c2d Darrick J. Wong   2019-07-03  648  {
49fd69b2092960 Christoph Hellwig 2024-09-20  649  	xfs_agnumber_t		start_agno = XFS_INO_TO_AGNO(mp, startino);
40786717c88c2d Darrick J. Wong   2019-07-03  650  	struct xfs_pwork_ctl	pctl;
6f4118fc6482b1 Dave Chinner      2021-06-02  651  	struct xfs_perag	*pag;
40786717c88c2d Darrick J. Wong   2019-07-03  652  	int			error;
40786717c88c2d Darrick J. Wong   2019-07-03  653  
49fd69b2092960 Christoph Hellwig 2024-09-20  654  	ASSERT(start_agno < mp->m_sb.sb_agcount);
13d59a2a61cbbb Darrick J. Wong   2019-07-03  655  	ASSERT(!(flags & ~XFS_IWALK_FLAGS_ALL));
40786717c88c2d Darrick J. Wong   2019-07-03  656  
f83d436aef5def Darrick J. Wong   2021-01-22  657  	error = xfs_pwork_init(mp, &pctl, xfs_iwalk_ag_work, "xfs_iwalk");
40786717c88c2d Darrick J. Wong   2019-07-03  658  	if (error)
40786717c88c2d Darrick J. Wong   2019-07-03  659  		return error;
40786717c88c2d Darrick J. Wong   2019-07-03  660  
49fd69b2092960 Christoph Hellwig 2024-09-20 @661  	while ((pag = xfs_perag_next_from(mp, pag, start_agno))) {
40786717c88c2d Darrick J. Wong   2019-07-03  662  		struct xfs_iwalk_ag	*iwag;
40786717c88c2d Darrick J. Wong   2019-07-03  663  
40786717c88c2d Darrick J. Wong   2019-07-03  664  		if (xfs_pwork_ctl_want_abort(&pctl))
40786717c88c2d Darrick J. Wong   2019-07-03  665  			break;
40786717c88c2d Darrick J. Wong   2019-07-03  666  
10634530f7ba94 Dave Chinner      2024-01-16  667  		iwag = kzalloc(sizeof(struct xfs_iwalk_ag),
10634530f7ba94 Dave Chinner      2024-01-16  668  				GFP_KERNEL | __GFP_NOFAIL);
40786717c88c2d Darrick J. Wong   2019-07-03  669  		iwag->mp = mp;
6f4118fc6482b1 Dave Chinner      2021-06-02  670  
6f4118fc6482b1 Dave Chinner      2021-06-02  671  		/*
9b2e5a234c89f0 Darrick J. Wong   2023-04-11  672  		 * perag is being handed off to async work, so take a passive
6f4118fc6482b1 Dave Chinner      2021-06-02  673  		 * reference for the async work to release.
6f4118fc6482b1 Dave Chinner      2021-06-02  674  		 */
9b2e5a234c89f0 Darrick J. Wong   2023-04-11  675  		iwag->pag = xfs_perag_hold(pag);
40786717c88c2d Darrick J. Wong   2019-07-03  676  		iwag->iwalk_fn = iwalk_fn;
40786717c88c2d Darrick J. Wong   2019-07-03  677  		iwag->data = data;
40786717c88c2d Darrick J. Wong   2019-07-03  678  		iwag->startino = startino;
40786717c88c2d Darrick J. Wong   2019-07-03  679  		iwag->sz_recs = xfs_iwalk_prefetch(inode_records);
27c14b5daa8286 Darrick J. Wong   2020-11-14  680  		iwag->lastino = NULLFSINO;
40786717c88c2d Darrick J. Wong   2019-07-03  681  		xfs_pwork_queue(&pctl, &iwag->pwork);
da1b013902b283 Christoph Hellwig 2024-09-22  682  		startino = XFS_AGINO_TO_INO(mp, pag_agno(pag) + 1, 0);
d4b1214ce3ed65 Christoph Hellwig 2024-09-22  683  		if (flags & XFS_IWALK_SAME_AG)
13d59a2a61cbbb Darrick J. Wong   2019-07-03  684  			break;
40786717c88c2d Darrick J. Wong   2019-07-03  685  	}
6f4118fc6482b1 Dave Chinner      2021-06-02  686  	if (pag)
c4d5660afbdcd3 Dave Chinner      2023-02-13  687  		xfs_perag_rele(pag);
3e5a428b264eca Darrick J. Wong   2019-07-03  688  	if (polled)
3e5a428b264eca Darrick J. Wong   2019-07-03  689  		xfs_pwork_poll(&pctl);
40786717c88c2d Darrick J. Wong   2019-07-03  690  	return xfs_pwork_destroy(&pctl);
40786717c88c2d Darrick J. Wong   2019-07-03  691  }
40786717c88c2d Darrick J. Wong   2019-07-03  692  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
