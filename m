Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562413A244
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730072102; cv=none; b=On+kZlp4iWCsg+sy9y+1SofwC5aHowNeEFjNwdwynAYZ1Vv7Oli+UncXwIu3KHTWRmAZfY+hr5TJwgeto58YFBdYRAVdj8SXZQO/nNv+L7HjiZBBcWoVfiJRQa/xGrkjuY+Le5+YjQdaZTxB1rXle9g2icQv+t7fFaIHce+wvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730072102; c=relaxed/simple;
	bh=zO0yKavtyGDKSJjc2yBaZMVwdunYz1RJlY2SJcYV44g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFmReyE6hx44JUyoVZ2TUgeaWs6U95kgGOj+EbsypcBU3lm9iNtoi/ciycip+Ikfs1EfzOj6BsQFQ4MO7LqObOqCK017eMQuFSCbN1FdaIieqZheVAC7+6ozHCEPB0YGBkrVz5ggunYb7ICT3w9KqbUdzv5TC4bSSmk4FrQQS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAFvRDMM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAFvRDMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730072100; x=1761608100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zO0yKavtyGDKSJjc2yBaZMVwdunYz1RJlY2SJcYV44g=;
  b=mAFvRDMMHfV2P7Bepa+DCDkaEGpWCpVRKJoGCn6BGeR1UiT4gIbTSXH4
   DzK8Y/QN4kC0ZkcZhKNrLvzdfUBHbWEpYYXcsFOrAFHPxyIx2K9NLGSFT
   H6bEKQfFlhLQqhChwT6V2s0nAoh3HXE24pQ5I/Vw6hpGdoXdqMFi0J8K4
   13rFtRp/3m4fU8s1THBVUeMzPBKiYTbn1V5uTGfT1dxjk/a2eUEDtM34J
   LD8OQA5EmHOHPRAF69cwPjkR+P3qcdeNNLbBn+epRcwja5rN6xe46CQzx
   I2P3WWMkeup9LgTJX4ECbVKDLxs2qdVqmQiGlggox22YLy8Y9+MFjIqJw
   w==;
X-CSE-ConnectionGUID: mwKnDbPWTWSSklUUofqRRQ==
X-CSE-MsgGUID: 2q0HAXjDRgqge/Lj2UL/cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29121354"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="29121354"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 16:35:00 -0700
X-CSE-ConnectionGUID: vb2TYKcLSmiBfRozDIH7Xw==
X-CSE-MsgGUID: rwaPNqeqSoWBqk4pguepnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="86554003"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 16:34:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Cme-000b58-16;
	Sun, 27 Oct 2024 23:34:56 +0000
Date: Mon, 28 Oct 2024 07:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned 32/46] fs/xfs/xfs_zone_gc.c:439:33-34: WARNING
 opportunity for min()
Message-ID: <202410280737.tWbSQyhz-lkp@intel.com>
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
head:   79473ee0b7f1157cefef5e4b180fa14e30641d36
commit: 579e1d3d43db665e6d4e6c24418cf9d2e1f4384d [32/46] xfs: support zoned RT devices
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-r061-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280737.tWbSQyhz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410280737.tWbSQyhz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_gc.c:439:33-34: WARNING opportunity for min()
--
>> fs/xfs/xfs_zone_alloc.c:551:58-61: ERROR: invalid reference to the index variable of the iterator on line 544

vim +439 fs/xfs/xfs_zone_gc.c

579e1d3d43db66 Christoph Hellwig 2024-05-31  406  
579e1d3d43db66 Christoph Hellwig 2024-05-31  407  static int
579e1d3d43db66 Christoph Hellwig 2024-05-31  408  xfs_zone_gc_query(
579e1d3d43db66 Christoph Hellwig 2024-05-31  409  	struct xfs_mount	*mp,
579e1d3d43db66 Christoph Hellwig 2024-05-31  410  	struct xfs_zone_gc_iter	*iter)
579e1d3d43db66 Christoph Hellwig 2024-05-31  411  {
579e1d3d43db66 Christoph Hellwig 2024-05-31  412  	struct xfs_rtgroup	*rtg = iter->victim_rtg;
579e1d3d43db66 Christoph Hellwig 2024-05-31  413  	struct xfs_rmap_irec	ri_low = { };
579e1d3d43db66 Christoph Hellwig 2024-05-31  414  	struct xfs_rmap_irec	ri_high;
579e1d3d43db66 Christoph Hellwig 2024-05-31  415  	struct xfs_btree_cur	*cur;
579e1d3d43db66 Christoph Hellwig 2024-05-31  416  	struct xfs_trans	*tp;
579e1d3d43db66 Christoph Hellwig 2024-05-31  417  	int			error;
579e1d3d43db66 Christoph Hellwig 2024-05-31  418  
579e1d3d43db66 Christoph Hellwig 2024-05-31  419  	ASSERT(iter->next_startblock <= rtg->rtg_extents);
579e1d3d43db66 Christoph Hellwig 2024-05-31  420  	if (iter->next_startblock == rtg->rtg_extents)
579e1d3d43db66 Christoph Hellwig 2024-05-31  421  		goto done;
579e1d3d43db66 Christoph Hellwig 2024-05-31  422  
579e1d3d43db66 Christoph Hellwig 2024-05-31  423  	ASSERT(iter->next_startblock < rtg->rtg_extents);
579e1d3d43db66 Christoph Hellwig 2024-05-31  424  	ri_low.rm_startblock = iter->next_startblock;
579e1d3d43db66 Christoph Hellwig 2024-05-31  425  	memset(&ri_high, 0xFF, sizeof(ri_high));
579e1d3d43db66 Christoph Hellwig 2024-05-31  426  
579e1d3d43db66 Christoph Hellwig 2024-05-31  427  	iter->rec_idx = 0;
579e1d3d43db66 Christoph Hellwig 2024-05-31  428  	iter->rec_count = 0;
579e1d3d43db66 Christoph Hellwig 2024-05-31  429  
579e1d3d43db66 Christoph Hellwig 2024-05-31  430  	error = xfs_trans_alloc_empty(mp, &tp);
579e1d3d43db66 Christoph Hellwig 2024-05-31  431  	if (error)
579e1d3d43db66 Christoph Hellwig 2024-05-31  432  		return error;
579e1d3d43db66 Christoph Hellwig 2024-05-31  433  
579e1d3d43db66 Christoph Hellwig 2024-05-31  434  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_RMAP);
579e1d3d43db66 Christoph Hellwig 2024-05-31  435  	xfs_rtgroup_trans_join(tp, rtg, XFS_RTGLOCK_RMAP);
579e1d3d43db66 Christoph Hellwig 2024-05-31  436  	cur = xfs_rtrmapbt_init_cursor(tp, rtg);
579e1d3d43db66 Christoph Hellwig 2024-05-31  437  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
579e1d3d43db66 Christoph Hellwig 2024-05-31  438  			xfs_zone_gc_query_cb, iter);
579e1d3d43db66 Christoph Hellwig 2024-05-31 @439  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
579e1d3d43db66 Christoph Hellwig 2024-05-31  440  	xfs_trans_cancel(tp);
579e1d3d43db66 Christoph Hellwig 2024-05-31  441  
579e1d3d43db66 Christoph Hellwig 2024-05-31  442  	if (error < 0)
579e1d3d43db66 Christoph Hellwig 2024-05-31  443  		return error;
579e1d3d43db66 Christoph Hellwig 2024-05-31  444  
579e1d3d43db66 Christoph Hellwig 2024-05-31  445  	/*
579e1d3d43db66 Christoph Hellwig 2024-05-31  446  	 * Sort the rmap records by inode number and increasing offset to
579e1d3d43db66 Christoph Hellwig 2024-05-31  447  	 * defragment the mappings.
579e1d3d43db66 Christoph Hellwig 2024-05-31  448  	 *
579e1d3d43db66 Christoph Hellwig 2024-05-31  449  	 * This could be further enhanced by an even bigger look ahead window,
579e1d3d43db66 Christoph Hellwig 2024-05-31  450  	 * but that's better left until we have better detection of changes to
579e1d3d43db66 Christoph Hellwig 2024-05-31  451  	 * inode mapping to avoid the potential of GCing already dead data.
579e1d3d43db66 Christoph Hellwig 2024-05-31  452  	 */
579e1d3d43db66 Christoph Hellwig 2024-05-31  453  	sort(iter->recs, iter->rec_count, sizeof(iter->recs[0]),
579e1d3d43db66 Christoph Hellwig 2024-05-31  454  		xfs_zone_gc_rmap_rec_cmp, NULL);
579e1d3d43db66 Christoph Hellwig 2024-05-31  455  
579e1d3d43db66 Christoph Hellwig 2024-05-31  456  	if (error == 0) {
579e1d3d43db66 Christoph Hellwig 2024-05-31  457  		/*
579e1d3d43db66 Christoph Hellwig 2024-05-31  458  		 * We finished iterating through the zone.
579e1d3d43db66 Christoph Hellwig 2024-05-31  459  		 */
579e1d3d43db66 Christoph Hellwig 2024-05-31  460  		iter->next_startblock = rtg->rtg_extents;
579e1d3d43db66 Christoph Hellwig 2024-05-31  461  		if (iter->rec_count == 0)
579e1d3d43db66 Christoph Hellwig 2024-05-31  462  			goto done;
579e1d3d43db66 Christoph Hellwig 2024-05-31  463  	}
579e1d3d43db66 Christoph Hellwig 2024-05-31  464  
579e1d3d43db66 Christoph Hellwig 2024-05-31  465  	return 0;
579e1d3d43db66 Christoph Hellwig 2024-05-31  466  done:
579e1d3d43db66 Christoph Hellwig 2024-05-31  467  	xfs_rtgroup_rele(iter->victim_rtg);
579e1d3d43db66 Christoph Hellwig 2024-05-31  468  	iter->victim_rtg = NULL;
579e1d3d43db66 Christoph Hellwig 2024-05-31  469  	return 0;
579e1d3d43db66 Christoph Hellwig 2024-05-31  470  }
579e1d3d43db66 Christoph Hellwig 2024-05-31  471  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
