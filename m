Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9266C1509A6
	for <oe-kbuild@lists.linux.dev>; Tue,  7 May 2024 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715080773; cv=none; b=C3p1svpIqgZokYHnP7e79IkSlZeMVBBc78Q/ukknjB7DuS+D8X2DOJbkrtdFacmhbNoONZtLeEnyMMBiFose8ztxYZ4rEPjdQ73KK5vpw0Z0UWJMPWLC5YMvL01V0nfgst9kngCE7R7iUSP3I6zVlfLZJu3HnUtNvvM8y9gx3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715080773; c=relaxed/simple;
	bh=oZ/cfrEI2DzFvA7+mMJODAmMTkg6clDeTzKNid6url4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROZErDfgEN0CoCth82hbKejOM+TTOpgaJra70BX4TckpKAi2SiFTBwN9DsW9vcaBpOuLVLG5n5gX/+H3ZN3N8D+eJfBj8OJ3QuW5YsaxRbrP38P6B8U0VARn8HdAWIiIvZSIMxJKOiwlSfDqDPgiTAR+IH+o39gP+P0g2O3yZa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtOpUIbT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtOpUIbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715080771; x=1746616771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZ/cfrEI2DzFvA7+mMJODAmMTkg6clDeTzKNid6url4=;
  b=RtOpUIbTJ92qPUyLGtkl8hGhrex8APA6r1BmZQ1rQOzl9DWw5ghtJg5H
   Oc8xCL+7lH/mJYzLlFAUUT3tN2VCONVd8e1ipIaMFGQZFkxRWjK7UcCpq
   IwJh4HOkBOCZPpjPSgg2WUrUzR+1AIwi61no5jgJUoomNqRm05s4pa2RF
   GNrA4hCSCcheWB2c7NrCEcDIbOsZgDdAGcadg8eahKwIi4U5xtJD9FxrH
   fINTis4aQj+Q4eBikRxdVj+zXsUypl7ZxK5IBWv3cZ+zjxL5vp5JYd1Qh
   m8a31YGzC9ApfoHApOcPTlxXjU/+NNCu4T4lGfMTtK2raH4FMB1mPn+sO
   w==;
X-CSE-ConnectionGUID: sWp5L7m5SOSVwSKQ0jLnsw==
X-CSE-MsgGUID: o5F8fQ94QwWu5PcCuMRebA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21472286"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="21472286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 04:19:30 -0700
X-CSE-ConnectionGUID: 804N4zKiR+KvrvgaD1eqYQ==
X-CSE-MsgGUID: oyDuiJGMRMq9qalx5Yb4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="33316262"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2024 04:19:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Ir0-0001qu-1b;
	Tue, 07 May 2024 11:19:26 +0000
Date: Tue, 7 May 2024 19:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned 44/55] fs/xfs/xfs_zone_gc.c:200:33-34: WARNING
 opportunity for min()
Message-ID: <202405071932.0aH0EnbV-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   2073b21e25895a611d09adb6d56922b1c013e031
commit: f7841e27057069451de4e7758d9703a7293faa60 [44/55] xfs: support zoned RT devices
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-053-20240507 (https://download.01.org/0day-ci/archive/20240507/202405071932.0aH0EnbV-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405071932.0aH0EnbV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_gc.c:200:33-34: WARNING opportunity for min()

vim +200 fs/xfs/xfs_zone_gc.c

f7841e27057069 Christoph Hellwig 2024-04-10  168  
f7841e27057069 Christoph Hellwig 2024-04-10  169  static int
f7841e27057069 Christoph Hellwig 2024-04-10  170  xfs_zone_gc_query(
f7841e27057069 Christoph Hellwig 2024-04-10  171  	struct xfs_mount	*mp,
f7841e27057069 Christoph Hellwig 2024-04-10  172  	struct xfs_zone_gc_iter	*iter)
f7841e27057069 Christoph Hellwig 2024-04-10  173  {
f7841e27057069 Christoph Hellwig 2024-04-10  174  	struct xfs_rtgroup	*rtg = iter->victim_rtg;
f7841e27057069 Christoph Hellwig 2024-04-10  175  	struct xfs_rmap_irec	ri_low = { };
f7841e27057069 Christoph Hellwig 2024-04-10  176  	struct xfs_rmap_irec	ri_high;
f7841e27057069 Christoph Hellwig 2024-04-10  177  	struct xfs_btree_cur	*cur;
f7841e27057069 Christoph Hellwig 2024-04-10  178  	struct xfs_trans	*tp;
f7841e27057069 Christoph Hellwig 2024-04-10  179  	int			error;
f7841e27057069 Christoph Hellwig 2024-04-10  180  
f7841e27057069 Christoph Hellwig 2024-04-10  181  	ASSERT(iter->next_startblock <= rtg->rtg_blockcount);
f7841e27057069 Christoph Hellwig 2024-04-10  182  	if (iter->next_startblock == rtg->rtg_blockcount)
f7841e27057069 Christoph Hellwig 2024-04-10  183  		goto done;
f7841e27057069 Christoph Hellwig 2024-04-10  184  
f7841e27057069 Christoph Hellwig 2024-04-10  185  	ASSERT(iter->next_startblock < rtg->rtg_blockcount);
f7841e27057069 Christoph Hellwig 2024-04-10  186  	ri_low.rm_startblock = iter->next_startblock;
f7841e27057069 Christoph Hellwig 2024-04-10  187  	memset(&ri_high, 0xFF, sizeof(ri_high));
f7841e27057069 Christoph Hellwig 2024-04-10  188  
f7841e27057069 Christoph Hellwig 2024-04-10  189  	iter->rec_idx = 0;
f7841e27057069 Christoph Hellwig 2024-04-10  190  	iter->rec_count = 0;
f7841e27057069 Christoph Hellwig 2024-04-10  191  
f7841e27057069 Christoph Hellwig 2024-04-10  192  	error = xfs_trans_alloc_empty(mp, &tp);
f7841e27057069 Christoph Hellwig 2024-04-10  193  	if (error)
f7841e27057069 Christoph Hellwig 2024-04-10  194  		return error;
f7841e27057069 Christoph Hellwig 2024-04-10  195  
f7841e27057069 Christoph Hellwig 2024-04-10  196  	xfs_rtgroup_lock(tp, rtg, XFS_RTGLOCK_RMAP);
f7841e27057069 Christoph Hellwig 2024-04-10  197  	cur = xfs_rtrmapbt_init_cursor(mp, tp, rtg, rtg->rtg_rmapip);
f7841e27057069 Christoph Hellwig 2024-04-10  198  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
f7841e27057069 Christoph Hellwig 2024-04-10  199  			xfs_zone_gc_query_cb, iter);
f7841e27057069 Christoph Hellwig 2024-04-10 @200  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
f7841e27057069 Christoph Hellwig 2024-04-10  201  	xfs_trans_cancel(tp);
f7841e27057069 Christoph Hellwig 2024-04-10  202  
f7841e27057069 Christoph Hellwig 2024-04-10  203  	if (error < 0)
f7841e27057069 Christoph Hellwig 2024-04-10  204  		return error;
f7841e27057069 Christoph Hellwig 2024-04-10  205  
f7841e27057069 Christoph Hellwig 2024-04-10  206  	if (error == 0) {
f7841e27057069 Christoph Hellwig 2024-04-10  207  		/*
f7841e27057069 Christoph Hellwig 2024-04-10  208  		 * We finished iterating through the zone.
f7841e27057069 Christoph Hellwig 2024-04-10  209  		 */
f7841e27057069 Christoph Hellwig 2024-04-10  210  		iter->next_startblock = rtg->rtg_blockcount;
f7841e27057069 Christoph Hellwig 2024-04-10  211  		if (iter->rec_count == 0)
f7841e27057069 Christoph Hellwig 2024-04-10  212  			goto done;
f7841e27057069 Christoph Hellwig 2024-04-10  213  	}
f7841e27057069 Christoph Hellwig 2024-04-10  214  
f7841e27057069 Christoph Hellwig 2024-04-10  215  	return 0;
f7841e27057069 Christoph Hellwig 2024-04-10  216  done:
f7841e27057069 Christoph Hellwig 2024-04-10  217  	xfs_rtgroup_rele(iter->victim_rtg);
f7841e27057069 Christoph Hellwig 2024-04-10  218  	iter->victim_rtg = NULL;
f7841e27057069 Christoph Hellwig 2024-04-10  219  	return 0;
f7841e27057069 Christoph Hellwig 2024-04-10  220  }
f7841e27057069 Christoph Hellwig 2024-04-10  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
