Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877B620
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682215440; x=1713751440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aUi0h2Lyq0biFwSoVtM/UwGCKU7PepoHDCjgcnOPgRU=;
  b=fFjwZ3AK3ItitKmyxSMwN8/TN5R5T2J1g/uW+rTBd/2646imIWtHEwD7
   uu0xOI0YIP7JM/2mkrlo+05lGqT99ps0uG6jSqcxuIg8V3hnb/oytgWqr
   0ttuqp+eGaDxsOTj8isi6hC/CaaE9w5KuIqLDQBNeUgy46YubhEr8a2OX
   RzZ6XGVsLjYpLpKtXv6CNBLzXugT6jBAg7wN2vfTu0dznbaYk8uikLp5n
   rRYzM81bX2zhviZni/kZ5l6Home8laTeqahJW4ibLRDvtoV/QqXgEnpV+
   RbaZjf5ZMb9KS8NMODlHqV32XcLRArexB7z7K3D00WZqDeiCFJ3N22AK9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="344979438"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="344979438"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 19:03:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="695333830"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="695333830"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 19:03:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqP53-000hcu-27;
	Sun, 23 Apr 2023 02:03:57 +0000
Date: Sun, 23 Apr 2023 10:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/virtio_blk.c:806 virtblk_probe_zoned_device() error:
 uninitialized symbol 'virtio_cread_v'.
Message-ID: <202304230919.sHzj2796-lkp@intel.com>
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
TO: Dmitry Fomichev <dmitry.fomichev@wdc.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2caeeb9d4a1bccd923b7918427f9e9ef7151ddd8
commit: f1ba4e674febf5c0e9f725a75ca43b7722b4e963 virtio-blk: fix to match virtio spec
date:   3 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: csky-randconfig-m031-20230423 (https://download.01.org/0day-ci/archive/20230423/202304230919.sHzj2796-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304230919.sHzj2796-lkp@intel.com/

New smatch warnings:
drivers/block/virtio_blk.c:806 virtblk_probe_zoned_device() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/block/virtio_blk.c:811 virtblk_probe_zoned_device() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:816 virtblk_probe_zoned_device() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:831 virtblk_probe_zoned_device() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:849 virtblk_probe_zoned_device() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:943 virtblk_getgeo() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1018 virtblk_update_capacity() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1067 init_vq() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1342 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1430 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1438 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1468 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1474 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1481 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1484 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1488 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1493 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1512 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1527 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1542 virtblk_probe() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +806 drivers/block/virtio_blk.c

95bfec41bd3d39 Dmitry Fomichev 2022-10-15  777  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  778  static int virtblk_probe_zoned_device(struct virtio_device *vdev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  779  				       struct virtio_blk *vblk,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  780  				       struct request_queue *q)
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  781  {
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  782  	u32 v, wg;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  783  	u8 model;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  784  	int ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  785  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  786  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  787  		     zoned.model, &model);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  788  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  789  	switch (model) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  790  	case VIRTIO_BLK_Z_NONE:
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  791  	case VIRTIO_BLK_Z_HA:
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  792  		/* Present the host-aware device as non-zoned */
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  793  		return 0;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  794  	case VIRTIO_BLK_Z_HM:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  795  		break;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  796  	default:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  797  		dev_err(&vdev->dev, "unsupported zone model %d\n", model);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  798  		return -EINVAL;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  799  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  800  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  801  	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  802  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  803  	disk_set_zoned(vblk->disk, BLK_ZONED_HM);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  804  	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  805  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15 @806  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  807  		     zoned.max_open_zones, &v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  808  	disk_set_max_open_zones(vblk->disk, v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  809  	dev_dbg(&vdev->dev, "max open zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  810  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  811  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  812  		     zoned.max_active_zones, &v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  813  	disk_set_max_active_zones(vblk->disk, v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  814  	dev_dbg(&vdev->dev, "max active zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  815  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  816  	virtio_cread(vdev, struct virtio_blk_config,
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  817  		     zoned.write_granularity, &wg);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  818  	if (!wg) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  819  		dev_warn(&vdev->dev, "zero write granularity reported\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  820  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  821  	}
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  822  	blk_queue_physical_block_size(q, wg);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  823  	blk_queue_io_min(q, wg);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  824  
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  825  	dev_dbg(&vdev->dev, "write granularity = %u\n", wg);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  826  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  827  	/*
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  828  	 * virtio ZBD specification doesn't require zones to be a power of
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  829  	 * two sectors in size, but the code in this driver expects that.
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  830  	 */
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  831  	virtio_cread(vdev, struct virtio_blk_config, zoned.zone_sectors,
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  832  		     &vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  833  	if (vblk->zone_sectors == 0 || !is_power_of_2(vblk->zone_sectors)) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  834  		dev_err(&vdev->dev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  835  			"zoned device with non power of two zone size %u\n",
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  836  			vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  837  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  838  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  839  	dev_dbg(&vdev->dev, "zone sectors = %u\n", vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  840  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  841  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_DISCARD)) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  842  		dev_warn(&vblk->vdev->dev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  843  			 "ignoring negotiated F_DISCARD for zoned device\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  844  		blk_queue_max_discard_sectors(q, 0);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  845  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  846  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  847  	ret = blk_revalidate_disk_zones(vblk->disk, NULL);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  848  	if (!ret) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  849  		virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  850  			     zoned.max_append_sectors, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  851  		if (!v) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  852  			dev_warn(&vdev->dev, "zero max_append_sectors reported\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  853  			return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  854  		}
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  855  		if ((v << SECTOR_SHIFT) < wg) {
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  856  			dev_err(&vdev->dev,
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  857  				"write granularity %u exceeds max_append_sectors %u limit\n",
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  858  				wg, v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  859  			return -ENODEV;
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  860  		}
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  861  
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  862  		blk_queue_max_zone_append_sectors(q, v);
f1ba4e674febf5 Dmitry Fomichev 2023-03-30  863  		dev_dbg(&vdev->dev, "max append sectors = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  864  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  865  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  866  	return ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  867  }
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  868  

:::::: The code at line 806 was first introduced by commit
:::::: 95bfec41bd3d39b7659cba65b72080420bf5691e virtio-blk: add support for zoned block devices

:::::: TO: Dmitry Fomichev <dmitry.fomichev@wdc.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
