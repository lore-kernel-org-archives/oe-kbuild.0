Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F679DDD
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646819; cv=none; b=gSaj8WJA/Svh3yuG2k/MMZcHC3EMktngv4BXnbCteNao3c7/G5gS3GYp4WJKbkd/Y1uQr5GLHvSR7xwMcYEbHgN4gYQ8XPNU8sg0qowkThQh5holK3UQaaxGhJxxZu2WQ4pCYw7YvlLai1+a4revCK+0GjvPXNjRM3/bHge2GAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646819; c=relaxed/simple;
	bh=/ymKaGBAapvELjZNuGMdO7pOer4o03y6iTn4z12Jco8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAUp0LE1erdAguklzimYgUP/fsFL5U7qkSUlHMJ0xF0rtMlA60A//hbeb+NVI4zVu8Ak+5VW10A/Ti2J0OYVWsqpxDTCNGuYj++8stD/1RjSWldKGzUxBpsxNGRAimjpj2rGONgENipU/wMrvOamqy+gAvzjXMmztKECRgaifHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJ/5bufl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJ/5bufl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706646817; x=1738182817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ymKaGBAapvELjZNuGMdO7pOer4o03y6iTn4z12Jco8=;
  b=SJ/5buflu5jepRxKr8ZUIDySQnUJ8tesrKRQTBxxm6ELdOVhMVxTzY1E
   bw87BTV4znAFe4ikrt44Y6hHBYEVn5Q/7oZ96pzaaTEOxnPv56idmgENa
   AXI0OZjJToxgGYobicq9rw+t/WsQCtn0w7uEsPMRMeEKlmHSDtybjtwMn
   /my5evUiSFpM9JT6LFxYCKfhGwu1UqIyjC3tLzjXsij/DgMkUIjoXHiN7
   pV/jk/dXMaZELRQg3XjNSDWOxIbp9MN0IRnDTdfFyIoWUsD+KNYkDzaMN
   z1mBYnn2IPu9RVETzWJIkJYg2SDd88BqnJE4iM1cBDa3/ElfBQ6PAzDwH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="16782100"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="16782100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 12:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788319243"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="788319243"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 12:33:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUunT-0000nq-1y;
	Tue, 30 Jan 2024 20:33:31 +0000
Date: Wed, 31 Jan 2024 04:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned 79/79] fs/xfs/xfs_zone_alloc.c:969:33-34: WARNING
 opportunity for min()
Message-ID: <202401310404.UVmBzLDD-lkp@intel.com>
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
head:   06a31b9f398cc5f6a12f4ee2d83e38a6eebb211c
commit: 06a31b9f398cc5f6a12f4ee2d83e38a6eebb211c [79/79] xfs: implement a new low-level GC mechanism
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-101-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310404.UVmBzLDD-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401310404.UVmBzLDD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_alloc.c:969:33-34: WARNING opportunity for min()

vim +969 fs/xfs/xfs_zone_alloc.c

171a28db673ea7 Christoph Hellwig 2023-12-07  934  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  935  static int
06a31b9f398cc5 Christoph Hellwig 2024-01-21  936  xfs_zone_gc_query(
06a31b9f398cc5 Christoph Hellwig 2024-01-21  937  	struct xfs_rtgroup	*rtg,
06a31b9f398cc5 Christoph Hellwig 2024-01-21  938  	struct xfs_zone_gc_data	*data)
06a31b9f398cc5 Christoph Hellwig 2024-01-21  939  {
06a31b9f398cc5 Christoph Hellwig 2024-01-21  940  	struct xfs_mount	*mp = rtg->rtg_mount;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  941  	struct xfs_rmap_irec	ri_low = { };
06a31b9f398cc5 Christoph Hellwig 2024-01-21  942  	struct xfs_rmap_irec	ri_high;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  943  	struct xfs_btree_cur	*cur;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  944  	struct xfs_trans	*tp;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  945  	int			error;
ea09e168e2d08d Christoph Hellwig 2024-01-16  946  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  947  	ASSERT(data->next_startblock <= rtg->rtg_blockcount);
06a31b9f398cc5 Christoph Hellwig 2024-01-21  948  	if (data->next_startblock == rtg->rtg_blockcount) {
06a31b9f398cc5 Christoph Hellwig 2024-01-21  949  		data->done = true;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  950  		return 0;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  951  	}
06a31b9f398cc5 Christoph Hellwig 2024-01-21  952  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  953  	ASSERT(data->next_startblock < rtg->rtg_blockcount);
06a31b9f398cc5 Christoph Hellwig 2024-01-21  954  	ri_low.rm_startblock = data->next_startblock;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  955  	memset(&ri_high, 0xFF, sizeof(ri_high));
6bffaa3a8300ca Hans Holmberg     2023-12-20  956  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  957  	data->rec_idx = 0;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  958  	data->rec_count = 0;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  959  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  960  	error = xfs_trans_alloc_empty(mp, &tp);
171a28db673ea7 Christoph Hellwig 2023-12-07  961  	if (error)
171a28db673ea7 Christoph Hellwig 2023-12-07  962  		return error;
171a28db673ea7 Christoph Hellwig 2023-12-07  963  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  964  	xfs_rtgroup_lock(tp, rtg, XFS_RTGLOCK_RMAP);
06a31b9f398cc5 Christoph Hellwig 2024-01-21  965  	cur = xfs_rtrmapbt_init_cursor(mp, tp, rtg, rtg->rtg_rmapip);
06a31b9f398cc5 Christoph Hellwig 2024-01-21  966  	cur->bc_ino.flags = 0;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  967  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
06a31b9f398cc5 Christoph Hellwig 2024-01-21  968  			xfs_zone_gc_query_cb, data);
06a31b9f398cc5 Christoph Hellwig 2024-01-21 @969  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
06a31b9f398cc5 Christoph Hellwig 2024-01-21  970  	xfs_trans_cancel(tp);
171a28db673ea7 Christoph Hellwig 2023-12-07  971  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  972  	if (error < 0)
06a31b9f398cc5 Christoph Hellwig 2024-01-21  973  		return error;
6bffaa3a8300ca Hans Holmberg     2023-12-20  974  
06a31b9f398cc5 Christoph Hellwig 2024-01-21  975  	if (error == 0) {
06a31b9f398cc5 Christoph Hellwig 2024-01-21  976  		/*
06a31b9f398cc5 Christoph Hellwig 2024-01-21  977  		 * We finished iterating through the zone.
06a31b9f398cc5 Christoph Hellwig 2024-01-21  978  		 */
06a31b9f398cc5 Christoph Hellwig 2024-01-21  979  		data->next_startblock = rtg->rtg_blockcount;
06a31b9f398cc5 Christoph Hellwig 2024-01-21  980  		if (data->rec_count == 0)
06a31b9f398cc5 Christoph Hellwig 2024-01-21  981  			data->done = true;
6bffaa3a8300ca Hans Holmberg     2023-12-20  982  	}
06a31b9f398cc5 Christoph Hellwig 2024-01-21  983  
171a28db673ea7 Christoph Hellwig 2023-12-07  984  	return 0;
171a28db673ea7 Christoph Hellwig 2023-12-07  985  }
171a28db673ea7 Christoph Hellwig 2023-12-07  986  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
