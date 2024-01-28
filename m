Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D7F3C489
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706482131; cv=none; b=iEw/T6boj8vu1OEmXu1VKVD/L/9gn4xJTWSdGhc6j10a/0kaEhXJXQmXVkLMsRXFencwteuQV7M93Kemg2BRFQQpMetoNmj89FRPgc3cbWSN7Wqo8O6883qZUHbPiCVqjUBrjOVtWtDpaGbfhjdW6lc2nNrpAvnXxcxACUA9y9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706482131; c=relaxed/simple;
	bh=XVDTlq23YPhi+itMSraWHEkpLek7765Z6zYRSeUx190=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJ+2TTIi0PlnHpG7RYZURBeqmXLgYTqkQW5enwvy9RoPNWIGtiVglU95Pdzwe0vxg7XNLEieYlFykJRvhRRqBOfp4WkeJeOyGtLwmYLJ9Cp10F6FXojWsjhj8UBru8/U0k3OCaLwLzpOdAYmzd4cFulF0/R3ce3ZG2+gypBbfk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xnsax5Xw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xnsax5Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706482129; x=1738018129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XVDTlq23YPhi+itMSraWHEkpLek7765Z6zYRSeUx190=;
  b=Xnsax5XwQ8fF7jeWMDkZd3wG5WpYxCQtx5m7uxXzG0+w/bcNpwR+zlnv
   3g/wu1643WVuUSIYhpGUTzIcneFu01wcRUgeIe36YbARe+q+ktOnwLfHV
   ZzMaou5eMfY2uoBpD6sp0WdxoWAao0EYsUZq6ps9eKI7qaHYbjtZNAQZY
   qqpnVmhi8qiGsbpsCOq6QssEfAJLmVR4tc3MvSPxn9AP4ME1on7z17Yl/
   uvyoMlBAcMImDBn9629diQ7cWG3h3ZgxSoI9erZiT9aIthpRTxuW3EZcH
   NoOmQW5Q6ntxSV8+5f/Vk11xc2X9rep7sqfSdDaKMby1jyeCLgGGLhBAZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="24278910"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="24278910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 14:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="21915868"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2024 14:48:47 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUDxF-0003pQ-1I;
	Sun, 28 Jan 2024 22:48:45 +0000
Date: Mon, 29 Jan 2024 06:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-block:blk-limits-base 11/14] drivers/block/virtio_blk.c:733
 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.
Message-ID: <202401290645.4aNZKJn6-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/block.git blk-limits-base
head:   4d7fb37939d83dc5a4dff97d7f58084eb00f0e0c
commit: c0e735657ca285d89614975ffc148f53114d345a [11/14] virtio_blk: pass queue_limits to blk_mq_alloc_disk
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290645.4aNZKJn6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401290645.4aNZKJn6-lkp@intel.com/

New smatch warnings:
drivers/block/virtio_blk.c:733 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/block/virtio_blk.c:738 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:743 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:758 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:775 virtblk_read_zoned_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:852 virtblk_getgeo() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:927 virtblk_update_capacity() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:975 init_vq() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1259 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1281 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1289 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1318 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1324 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1331 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1334 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1338 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1343 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1362 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1376 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1390 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +733 drivers/block/virtio_blk.c

95bfec41bd3d39 Dmitry Fomichev   2022-10-15  722  
c0e735657ca285 Christoph Hellwig 2024-01-22  723  static int virtblk_read_zoned_limits(struct virtio_blk *vblk,
c0e735657ca285 Christoph Hellwig 2024-01-22  724  		struct queue_limits *lim)
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  725  {
c0e735657ca285 Christoph Hellwig 2024-01-22  726  	struct virtio_device *vdev = vblk->vdev;
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  727  	u32 v, wg;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  728  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  729  	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  730  
c0e735657ca285 Christoph Hellwig 2024-01-22  731  	lim->zoned = true;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  732  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15 @733  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  734  		     zoned.max_open_zones, &v);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  735  	disk_set_max_open_zones(vblk->disk, v);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  736  	dev_dbg(&vdev->dev, "max open zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  737  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  738  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  739  		     zoned.max_active_zones, &v);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  740  	disk_set_max_active_zones(vblk->disk, v);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  741  	dev_dbg(&vdev->dev, "max active zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  742  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  743  	virtio_cread(vdev, struct virtio_blk_config,
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  744  		     zoned.write_granularity, &wg);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  745  	if (!wg) {
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  746  		dev_warn(&vdev->dev, "zero write granularity reported\n");
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  747  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  748  	}
c0e735657ca285 Christoph Hellwig 2024-01-22  749  	lim->physical_block_size = wg;
c0e735657ca285 Christoph Hellwig 2024-01-22  750  	lim->io_min = wg;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  751  
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  752  	dev_dbg(&vdev->dev, "write granularity = %u\n", wg);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  753  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  754  	/*
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  755  	 * virtio ZBD specification doesn't require zones to be a power of
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  756  	 * two sectors in size, but the code in this driver expects that.
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  757  	 */
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  758  	virtio_cread(vdev, struct virtio_blk_config, zoned.zone_sectors,
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  759  		     &vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  760  	if (vblk->zone_sectors == 0 || !is_power_of_2(vblk->zone_sectors)) {
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  761  		dev_err(&vdev->dev,
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  762  			"zoned device with non power of two zone size %u\n",
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  763  			vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  764  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  765  	}
c0e735657ca285 Christoph Hellwig 2024-01-22  766  	lim->chunk_sectors = vblk->zone_sectors;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  767  	dev_dbg(&vdev->dev, "zone sectors = %u\n", vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  768  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  769  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_DISCARD)) {
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  770  		dev_warn(&vblk->vdev->dev,
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  771  			 "ignoring negotiated F_DISCARD for zoned device\n");
c0e735657ca285 Christoph Hellwig 2024-01-22  772  		lim->max_hw_discard_sectors = 0;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  773  	}
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  774  
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  775  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  776  		     zoned.max_append_sectors, &v);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  777  	if (!v) {
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  778  		dev_warn(&vdev->dev, "zero max_append_sectors reported\n");
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  779  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  780  	}
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  781  	if ((v << SECTOR_SHIFT) < wg) {
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  782  		dev_err(&vdev->dev,
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  783  			"write granularity %u exceeds max_append_sectors %u limit\n",
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  784  			wg, v);
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  785  		return -ENODEV;
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  786  	}
c0e735657ca285 Christoph Hellwig 2024-01-22  787  	lim->max_zone_append_sectors = v;
f1ba4e674febf5 Dmitry Fomichev   2023-03-30  788  	dev_dbg(&vdev->dev, "max append sectors = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  789  
c0e735657ca285 Christoph Hellwig 2024-01-22  790  	return 0;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  791  }
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  792  #else
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  793  /*
c0e735657ca285 Christoph Hellwig 2024-01-22  794   * Zoned block device support is not configured in this kernel, host-managed
c0e735657ca285 Christoph Hellwig 2024-01-22  795   * zoned devices can't be supported.
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  796   */
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  797  #define virtblk_report_zones       NULL
c0e735657ca285 Christoph Hellwig 2024-01-22  798  static inline int virtblk_read_zoned_limits(struct virtio_blk *vblk,
c0e735657ca285 Christoph Hellwig 2024-01-22  799  		struct queue_limits *lim)
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  800  {
c0e735657ca285 Christoph Hellwig 2024-01-22  801  	dev_err(&vblk->vdev->dev,
10805eb5d6d15f Dmitry Fomichev   2023-03-30  802  		"virtio_blk: zoned devices are not supported");
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  803  	return -EOPNOTSUPP;
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  804  }
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  805  #endif /* CONFIG_BLK_DEV_ZONED */
95bfec41bd3d39 Dmitry Fomichev   2022-10-15  806  

:::::: The code at line 733 was first introduced by commit
:::::: 95bfec41bd3d39b7659cba65b72080420bf5691e virtio-blk: add support for zoned block devices

:::::: TO: Dmitry Fomichev <dmitry.fomichev@wdc.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
