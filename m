Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A2A20
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680273528; x=1711809528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRy4U2FYvTPIDnYM003AwFvVVR1YJtIPvrU9EoDSgGQ=;
  b=aaboY1gb61rAq/KVFjdyJQdBXgIc1/6cwGfz1e3tJ2yn7AFeIPpdAAx6
   Pc8trSY86KM0mFXiEiodPpjazobmECVtYTuwzk9++mYNkHCIT/6OldirU
   kQ8oy71p2JwCTlUbpwPtTHfADiJT3v+UBho8mAMb3lNCSWh5MGPriFW7b
   nkuLZGgAymGY2aJQo93MtPAa1sjPugtGP21P85Wtxbi1Mba4RUJN1Jm3W
   Mf9lPx2bD7OH5MSQwi4/rIJEkPc3SWvOGPhjyzXBRkWC25I8xbeuN6mJL
   PJsQ3LD4xjVbyJ4x4oBqyH7Ldgu8OLp+Qmn2aggMG+3KbVPtibRk3itHF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343128130"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343128130"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 07:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859349307"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859349307"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2023 07:38:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piFtp-000Ls2-34;
	Fri, 31 Mar 2023 14:38:41 +0000
Date: Fri, 31 Mar 2023 22:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] virtio-blk: migrate to the latest patchset version
Message-ID: <202303312211.z4EdyM5A-lkp@intel.com>
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
In-Reply-To: <20230330214953.1088216-2-dmitry.fomichev@wdc.com>
References: <20230330214953.1088216-2-dmitry.fomichev@wdc.com>
TO: Dmitry Fomichev <dmitry.fomichev@wdc.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: linux-block@vger.kernel.org
TO: "Michael S. Tsirkin" <mst@redhat.com>
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
TO: Stefan Hajnoczi <stefanha@gmail.com>
TO: Hannes Reinecke <hare@suse.de>
TO: Sam Li <faithilikerun@gmail.com>
CC: virtio-dev@lists.oasis-open.org
CC: virtualization@lists.linux-foundation.org
CC: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Fomichev/virtio-blk-migrate-to-the-latest-patchset-version/20230331-055052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230330214953.1088216-2-dmitry.fomichev%40wdc.com
patch subject: [PATCH v2 1/2] virtio-blk: migrate to the latest patchset version
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: parisc-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303312211.z4EdyM5A-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303312211.z4EdyM5A-lkp@intel.com/

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
3e640fa381af05 Dmitry Fomichev 2023-03-30  782  	u32 v, wg;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  783  	u8 model;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  784  	int ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  785  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  786  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  787  		     zoned.model, &model);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  788  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  789  	switch (model) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  790  	case VIRTIO_BLK_Z_NONE:
3e640fa381af05 Dmitry Fomichev 2023-03-30  791  	case VIRTIO_BLK_Z_HA:
3e640fa381af05 Dmitry Fomichev 2023-03-30  792  		/* Present the host-aware device as non-zoned */
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
3e640fa381af05 Dmitry Fomichev 2023-03-30  808  	disk_set_max_open_zones(vblk->disk, v);
3e640fa381af05 Dmitry Fomichev 2023-03-30  809  	dev_dbg(&vdev->dev, "max open zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  810  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  811  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  812  		     zoned.max_active_zones, &v);
3e640fa381af05 Dmitry Fomichev 2023-03-30  813  	disk_set_max_active_zones(vblk->disk, v);
3e640fa381af05 Dmitry Fomichev 2023-03-30  814  	dev_dbg(&vdev->dev, "max active zones = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  815  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  816  	virtio_cread(vdev, struct virtio_blk_config,
3e640fa381af05 Dmitry Fomichev 2023-03-30  817  		     zoned.write_granularity, &wg);
3e640fa381af05 Dmitry Fomichev 2023-03-30  818  	if (!wg) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  819  		dev_warn(&vdev->dev, "zero write granularity reported\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  820  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  821  	}
3e640fa381af05 Dmitry Fomichev 2023-03-30  822  	blk_queue_physical_block_size(q, wg);
3e640fa381af05 Dmitry Fomichev 2023-03-30  823  	blk_queue_io_min(q, wg);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  824  
3e640fa381af05 Dmitry Fomichev 2023-03-30  825  	dev_dbg(&vdev->dev, "write granularity = %u\n", wg);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  826  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  827  	/*
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  828  	 * virtio ZBD specification doesn't require zones to be a power of
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  829  	 * two sectors in size, but the code in this driver expects that.
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  830  	 */
3e640fa381af05 Dmitry Fomichev 2023-03-30  831  	virtio_cread(vdev, struct virtio_blk_config, zoned.zone_sectors,
3e640fa381af05 Dmitry Fomichev 2023-03-30  832  		     &vblk->zone_sectors);
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
3e640fa381af05 Dmitry Fomichev 2023-03-30  855  		if ((v << SECTOR_SHIFT) < wg) {
3e640fa381af05 Dmitry Fomichev 2023-03-30  856  			dev_err(&vdev->dev,
3e640fa381af05 Dmitry Fomichev 2023-03-30  857  				"write granularity %u exceeds max_append_sectors %u limit\n",
3e640fa381af05 Dmitry Fomichev 2023-03-30  858  				wg, v);
3e640fa381af05 Dmitry Fomichev 2023-03-30  859  			return -ENODEV;
3e640fa381af05 Dmitry Fomichev 2023-03-30  860  		}
3e640fa381af05 Dmitry Fomichev 2023-03-30  861  
3e640fa381af05 Dmitry Fomichev 2023-03-30  862  		blk_queue_max_zone_append_sectors(q, v);
3e640fa381af05 Dmitry Fomichev 2023-03-30  863  		dev_dbg(&vdev->dev, "max append sectors = %u\n", v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  864  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  865  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  866  	return ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  867  }
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
