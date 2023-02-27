Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A828E1
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Feb 2023 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677530163; x=1709066163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuK9KG39Ido/txhdo74UUlNFlZHz6ileoGcGEB2V9W0=;
  b=RELIl0ju5YhLkbedcGIWnDpW9tuA0qh2yw5NO1gN7KHm1PSSnOsAWGRL
   vAo64xDZM6lFUc76t/HXxI8coyii+sPR5eeD8JTXNUFZqHQ+CQg+GIpve
   63Qq53Vc8cByTCW0/slg4uOPE7SfnnEiWeWRMBTOGKc5FQijvLRYJ8w8F
   V9AWrVYm67hOXo2QmmcN5CxnnPrWPL2dSnJ89TdOikHZbxQZO9eeg/LFt
   mYVtGwJ4QWSaEracJXN8IctHZa+7cOB2ny4Ptd3cNRV26yp9PoZ/2ltTc
   bn6PWGMOe4rkMdjCn56TPMAuPTcO9nq3E7sZJv6oM9DI7vfNGSIOU62Ae
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317761909"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="317761909"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="706318319"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="706318319"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Feb 2023 12:36:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWkE2-0004lt-34;
	Mon, 27 Feb 2023 20:35:58 +0000
Date: Tue, 28 Feb 2023 04:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/virtio_blk.c:708:9: sparse: sparse: no generic
 selection for 'restricted __le32 virtio_cread_v'
Message-ID: <202302280446.iJuW5NR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/block/virtio_blk.c:708:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Michael S. Tsirkin" <mst@redhat.com>

Hi Michael,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   982818426a0ffaf93b0621826ed39a84be3d7d62
commit: b16a1756c716235891e298beabd68f3cd6bb5952 virtio_blk: mark all zone fields LE
date:   12 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 days ago
config: nios2-randconfig-s053-20230226 (https://download.01.org/0day-ci/archive/20230228/202302280446.iJuW5NR5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b16a1756c716235891e298beabd68f3cd6bb5952
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b16a1756c716235891e298beabd68f3cd6bb5952
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/block/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302280446.iJuW5NR5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/virtio_blk.c:708:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
>> drivers/block/virtio_blk.c:708:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> drivers/block/virtio_blk.c:708:9: sparse:    bad type *
>> drivers/block/virtio_blk.c:708:9: sparse:    unsigned int *
>> drivers/block/virtio_blk.c:708:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/block/virtio_blk.c:714:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/block/virtio_blk.c:714:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/block/virtio_blk.c:714:9: sparse:    bad type *
   drivers/block/virtio_blk.c:714:9: sparse:    unsigned int *
   drivers/block/virtio_blk.c:714:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/block/virtio_blk.c:719:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/block/virtio_blk.c:719:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/block/virtio_blk.c:719:9: sparse:    bad type *
   drivers/block/virtio_blk.c:719:9: sparse:    unsigned int *
   drivers/block/virtio_blk.c:719:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/block/virtio_blk.c:734:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/block/virtio_blk.c:734:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/block/virtio_blk.c:734:9: sparse:    bad type *
   drivers/block/virtio_blk.c:734:9: sparse:    unsigned int *
   drivers/block/virtio_blk.c:734:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/block/virtio_blk.c:752:17: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/block/virtio_blk.c:752:17: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/block/virtio_blk.c:752:17: sparse:    bad type *
   drivers/block/virtio_blk.c:752:17: sparse:    unsigned int *
   drivers/block/virtio_blk.c:752:17: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/block/virtio_blk.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +708 drivers/block/virtio_blk.c

95bfec41bd3d39 Dmitry Fomichev 2022-10-15  674  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  675  static int virtblk_probe_zoned_device(struct virtio_device *vdev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  676  				       struct virtio_blk *vblk,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  677  				       struct request_queue *q)
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  678  {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  679  	u32 v;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  680  	u8 model;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  681  	int ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  682  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  683  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  684  		     zoned.model, &model);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  685  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  686  	switch (model) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  687  	case VIRTIO_BLK_Z_NONE:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  688  		return 0;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  689  	case VIRTIO_BLK_Z_HM:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  690  		break;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  691  	case VIRTIO_BLK_Z_HA:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  692  		/*
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  693  		 * Present the host-aware device as a regular drive.
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  694  		 * TODO It is possible to add an option to make it appear
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  695  		 * in the system as a zoned drive.
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  696  		 */
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  697  		return 0;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  698  	default:
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  699  		dev_err(&vdev->dev, "unsupported zone model %d\n", model);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  700  		return -EINVAL;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  701  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  702  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  703  	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  704  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  705  	disk_set_zoned(vblk->disk, BLK_ZONED_HM);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  706  	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  707  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15 @708  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  709  		     zoned.max_open_zones, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  710  	disk_set_max_open_zones(vblk->disk, le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  711  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  712  	dev_dbg(&vdev->dev, "max open zones = %u\n", le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  713  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  714  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  715  		     zoned.max_active_zones, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  716  	disk_set_max_active_zones(vblk->disk, le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  717  	dev_dbg(&vdev->dev, "max active zones = %u\n", le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  718  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  719  	virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  720  		     zoned.write_granularity, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  721  	if (!v) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  722  		dev_warn(&vdev->dev, "zero write granularity reported\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  723  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  724  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  725  	blk_queue_physical_block_size(q, le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  726  	blk_queue_io_min(q, le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  727  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  728  	dev_dbg(&vdev->dev, "write granularity = %u\n", le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  729  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  730  	/*
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  731  	 * virtio ZBD specification doesn't require zones to be a power of
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  732  	 * two sectors in size, but the code in this driver expects that.
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  733  	 */
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  734  	virtio_cread(vdev, struct virtio_blk_config, zoned.zone_sectors, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  735  	vblk->zone_sectors = le32_to_cpu(v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  736  	if (vblk->zone_sectors == 0 || !is_power_of_2(vblk->zone_sectors)) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  737  		dev_err(&vdev->dev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  738  			"zoned device with non power of two zone size %u\n",
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  739  			vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  740  		return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  741  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  742  	dev_dbg(&vdev->dev, "zone sectors = %u\n", vblk->zone_sectors);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  743  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  744  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_DISCARD)) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  745  		dev_warn(&vblk->vdev->dev,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  746  			 "ignoring negotiated F_DISCARD for zoned device\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  747  		blk_queue_max_discard_sectors(q, 0);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  748  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  749  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  750  	ret = blk_revalidate_disk_zones(vblk->disk, NULL);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  751  	if (!ret) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  752  		virtio_cread(vdev, struct virtio_blk_config,
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  753  			     zoned.max_append_sectors, &v);
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  754  		if (!v) {
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  755  			dev_warn(&vdev->dev, "zero max_append_sectors reported\n");
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  756  			return -ENODEV;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  757  		}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  758  		blk_queue_max_zone_append_sectors(q, le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  759  		dev_dbg(&vdev->dev, "max append sectors = %u\n", le32_to_cpu(v));
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  760  	}
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  761  
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  762  	return ret;
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  763  }
95bfec41bd3d39 Dmitry Fomichev 2022-10-15  764  

:::::: The code at line 708 was first introduced by commit
:::::: 95bfec41bd3d39b7659cba65b72080420bf5691e virtio-blk: add support for zoned block devices

:::::: TO: Dmitry Fomichev <dmitry.fomichev@wdc.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
