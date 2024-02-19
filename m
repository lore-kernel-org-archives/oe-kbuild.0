Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705145A796
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708382786; cv=none; b=BJzD2I3FMKtzZTZH5b0zY5aLZ0cAl0m2oOAZIqi1dO8zOH3IXffhiaHy/PrmK0w1Gfoobatm33d1Fyi6n0D3IrgkKww4FAE0whoDn1Ug0N1OXUBQEWIaHxy6ZXkFI6C6JCz3a9zUAUnrIlT3eyZeyvN9cEMpDE0kGSzF7RLKfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708382786; c=relaxed/simple;
	bh=/wlEom3Sc/k153028TzGS8w7J16aXREWk9IAoPwiaSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reQ4qfSwql3lhd9VpRPn7O6htU8zHXsjiHhnKuhR/DIOw+lz8Y+o/fT0gAQCO7C6x6ioLYVj99pOTKaO5jorRXniJSktrIg/i/XYLF7xe93FJ7wWY35vYS4onaj+M7znUuanhC6RiFcGg1tv0A61RR7OXLHbcqyfkNNDQ6WZsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnH2qXFy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnH2qXFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708382784; x=1739918784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wlEom3Sc/k153028TzGS8w7J16aXREWk9IAoPwiaSA=;
  b=gnH2qXFyDW6se1DlCPO0ntGDYFVT3Jum+KMNdwcy3UUCdVavDZ8VE/VL
   ztEZalD3gQFWp/BOv/D3mXSPXhbOoImjkEd+XpNH+qLVVpFdWayZ5HDks
   dKEJg+HTfcPB2QWtSG1YGrge5l08y4/uspZE8kmxEHPmohl9x8EQc/QC5
   9iV0tW/F+GdRI5+fzI6RTa6B7mnu49DTObw9FV7hchZatvm8BA6/axla5
   KzsNzxk3D0J3tKSDH9hv97dO/8I7O2O2RdVaSLyxQU/zuZnT91gqlTw87
   kZXbkeTdXwQ0C3kriC5z/EZHo3LRU8r8SLLtb0015jzEapA32CEgzv+D3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="6295254"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="6295254"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 14:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827059506"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="827059506"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Feb 2024 14:46:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcCOw-00047K-01;
	Mon, 19 Feb 2024 22:46:18 +0000
Date: Tue, 20 Feb 2024 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned-zwp 34/37] fs/xfs/xfs_zone_alloc.c:1487
 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max
Message-ID: <202402200642.qU42U8Q8-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-zwp
head:   f24bc80ab52b7ee42fc7bf25c58ea582b7879fd0
commit: 6998648bf0e3fce2d2d3e0f5e092dbd64712cf1c [34/37] xfs: support zoned RT devices
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200642.qU42U8Q8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402200642.qU42U8Q8-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_zone_alloc.c:1487 xfs_zone_gc_data_alloc() error: buffer overflow 'data->scratch' 2 <= s32max

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +1487 fs/xfs/xfs_zone_alloc.c

6998648bf0e3fc Christoph Hellwig 2024-02-14  1455  
6998648bf0e3fc Christoph Hellwig 2024-02-14  1456  static struct xfs_zone_gc_data *
6998648bf0e3fc Christoph Hellwig 2024-02-14  1457  xfs_zone_gc_data_alloc(
6998648bf0e3fc Christoph Hellwig 2024-02-14  1458  	struct xfs_mount	*mp)
6998648bf0e3fc Christoph Hellwig 2024-02-14  1459  {
6998648bf0e3fc Christoph Hellwig 2024-02-14  1460  	struct xfs_zone_gc_data	*data;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1461  	int i;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1462  
6998648bf0e3fc Christoph Hellwig 2024-02-14  1463  	data = kzalloc(sizeof(*data), GFP_KERNEL);
6998648bf0e3fc Christoph Hellwig 2024-02-14  1464  	if (!data)
6998648bf0e3fc Christoph Hellwig 2024-02-14  1465  		return NULL;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1466  
6998648bf0e3fc Christoph Hellwig 2024-02-14  1467  	/*
6998648bf0e3fc Christoph Hellwig 2024-02-14  1468  	 * We actually only need a single bio_vec.  It would be nice to have
6998648bf0e3fc Christoph Hellwig 2024-02-14  1469  	 * a flag that only allocates the inline bvecs and not the separate
6998648bf0e3fc Christoph Hellwig 2024-02-14  1470  	 * bvec pool.
6998648bf0e3fc Christoph Hellwig 2024-02-14  1471  	 */
6998648bf0e3fc Christoph Hellwig 2024-02-14  1472  	if (bioset_init(&data->bio_set, 4, offsetof(struct xfs_gc_bio, bio),
6998648bf0e3fc Christoph Hellwig 2024-02-14  1473  			BIOSET_NEED_BVECS))
6998648bf0e3fc Christoph Hellwig 2024-02-14  1474  		goto out_free_data;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1475  	for (i = 0; i < XFS_ZONE_GC_NR_SCRATCH; i++) {
6998648bf0e3fc Christoph Hellwig 2024-02-14  1476  		data->scratch[i].folio =
6998648bf0e3fc Christoph Hellwig 2024-02-14  1477  			folio_alloc(GFP_KERNEL, get_order(XFS_GC_CHUNK_SIZE));
6998648bf0e3fc Christoph Hellwig 2024-02-14  1478  		if (!data->scratch[i].folio)
6998648bf0e3fc Christoph Hellwig 2024-02-14  1479  			goto out_free_scratch;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1480  	}
6998648bf0e3fc Christoph Hellwig 2024-02-14  1481  	spin_lock_init(&data->list_lock);
6998648bf0e3fc Christoph Hellwig 2024-02-14  1482  	data->mp = mp;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1483  	return data;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1484  
6998648bf0e3fc Christoph Hellwig 2024-02-14  1485  out_free_scratch:
6998648bf0e3fc Christoph Hellwig 2024-02-14  1486  	while (--i > 0)
6998648bf0e3fc Christoph Hellwig 2024-02-14 @1487  		folio_put(data->scratch[i].folio);
6998648bf0e3fc Christoph Hellwig 2024-02-14  1488  	bioset_exit(&data->bio_set);
6998648bf0e3fc Christoph Hellwig 2024-02-14  1489  out_free_data:
6998648bf0e3fc Christoph Hellwig 2024-02-14  1490  	kfree(data);
6998648bf0e3fc Christoph Hellwig 2024-02-14  1491  	return NULL;
6998648bf0e3fc Christoph Hellwig 2024-02-14  1492  }
6998648bf0e3fc Christoph Hellwig 2024-02-14  1493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
