Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F24A28
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730938787; cv=none; b=EPXiwFoYCbFNeGsCxCVUKM3A5Rr7A05R/WBG1iTZeTZnP0HBnqioUXiB3tehwW8hnbsL2JonF6YT7esLCPe1/p3ALSvTx94fO3tkq8ZEEbYReMsNhUQt7b4u/8d6zKqTEzgukTMjs1tTxF69KUGdFsUaj5aIAFCbme/YfsHSguQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730938787; c=relaxed/simple;
	bh=MMmoVGb7HR0O9EiMSkqK8sOUBNNdsn2xgTC4ZP747vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwUurntN/3njK2pit3VhLxCFfg8e5zP0BBB/SF1U5GACwB71uPQtO2JFq8gwHn15UJT7ViSC23VjtLSScRNtVnZmX9AT6e1xaZyGPh8Y32VOOXS7hHGv00EPkDwGUgV0vcarOdC44gAAdlfBsPHKAQHwty+Z6vsNZQ6D764Bm5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoY0GnMd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoY0GnMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730938786; x=1762474786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMmoVGb7HR0O9EiMSkqK8sOUBNNdsn2xgTC4ZP747vw=;
  b=DoY0GnMdHp4ZVIOAxePHKVoN3Fd+SlDlrfFu1YQxjluCotjqG6YBx6Rn
   MGN8J482GdObO5qlqoFCLtuagmfBjXyZ+ywD25sx4KIAVNMv6ksYGGk0K
   hqqIQLgGNKfZR7spiwau7yFsdZCTfc+fmINwhFRonQeZSMmk5N7GG3TCk
   cIvuysD0WCqtBWPLW59cZuTFRjmcjIKlCykDuQTjVMtGsPPGeRKDl+iLW
   byr2dPw3DxvfPSPhwkbN4/ZNXLRuMcisXYIpbelLtwM9yxV7el22WoEhV
   onNZ6v5obex4zcCVS8xYICf5NaRHbJEPXXeCf2M/Br5Dx7lXTxKlXsLsJ
   A==;
X-CSE-ConnectionGUID: +jCOktxYS+qSxFDD0yP/XA==
X-CSE-MsgGUID: 7UUHd0f7QoWqsqcKRS5AGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30533059"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30533059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 16:19:45 -0800
X-CSE-ConnectionGUID: k71s5EtvRLKNOxUK99hOIQ==
X-CSE-MsgGUID: O50Gh8tlRQGeVV9As5PTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="115638183"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2024 16:19:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qFQ-000pYk-2h;
	Thu, 07 Nov 2024 00:19:40 +0000
Date: Thu, 7 Nov 2024 08:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1344/16464] block/bdev.c:829 bdev_open_by_dev()
 warn: possible memory leak of 'handle'
Message-ID: <202411070817.MsBLoDva-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Li Lingfeng <lilingfeng3@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8edd62f80cd8e00a4ecb15f57010d8fdbff12e16
commit: 498bc4954a0850611dc7b0193bc5c5a31479aecf [1344/16464] block: Add config option to not allow writing to mounted devices
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070817.MsBLoDva-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411070817.MsBLoDva-lkp@intel.com/

smatch warnings:
block/bdev.c:829 bdev_open_by_dev() warn: possible memory leak of 'handle'

vim +/handle +829 block/bdev.c

498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  784  
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  785  /**
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  786   * bdev_open_by_dev - open a block device by device number
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  787   * @dev: device number of block device to open
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  788   * @mode: open mode (BLK_OPEN_*)
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  789   * @holder: exclusive holder identifier
0718afd47f70cf block/bdev.c   Christoph Hellwig 2023-06-01  790   * @hops: holder operations
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  791   *
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  792   * Open the block device described by device number @dev. If @holder is not
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  793   * %NULL, the block device is opened with exclusive access.  Exclusive opens may
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  794   * nest for the same @holder.
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  795   *
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  796   * Use this interface ONLY if you really do not have anything better - i.e. when
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  797   * you are behind a truly sucky interface and all you are given is a device
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  798   * number.  Everything else should use bdev_open_by_path().
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  799   *
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  800   * CONTEXT:
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  801   * Might sleep.
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  802   *
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  803   * RETURNS:
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  804   * Handle with a reference to the block_device on success, ERR_PTR(-errno) on
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  805   * failure.
d4d77629953eab fs/block_dev.c Tejun Heo         2010-11-13  806   */
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  807  struct bdev_handle *bdev_open_by_dev(dev_t dev, blk_mode_t mode, void *holder,
0718afd47f70cf block/bdev.c   Christoph Hellwig 2023-06-01  808  				     const struct blk_holder_ops *hops)
^1da177e4c3f41 fs/block_dev.c Linus Torvalds    2005-04-16  809  {
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  810  	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  811  					     GFP_KERNEL);
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  812  	struct block_device *bdev;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  813  	bool unblock_events = true;
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  814  	struct gendisk *disk;
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  815  	int ret;
e5c7fb400227df fs/block_dev.c Christoph Hellwig 2020-08-31  816  
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  817  	if (!handle)
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  818  		return ERR_PTR(-ENOMEM);
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  819  
7918f0f6fdafa1 fs/block_dev.c Christoph Hellwig 2020-11-23  820  	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  821  			MAJOR(dev), MINOR(dev),
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  822  			((mode & BLK_OPEN_READ) ? DEVCG_ACC_READ : 0) |
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  823  			((mode & BLK_OPEN_WRITE) ? DEVCG_ACC_WRITE : 0));
e5c7fb400227df fs/block_dev.c Christoph Hellwig 2020-08-31  824  	if (ret)
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  825  		goto free_handle;
4e7b5671c6a883 fs/block_dev.c Christoph Hellwig 2020-11-23  826  
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  827  	/* Blocking writes requires exclusive opener */
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  828  	if (mode & BLK_OPEN_RESTRICT_WRITES && !holder)
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08 @829  		return ERR_PTR(-EINVAL);
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  830  
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  831  	bdev = blkdev_get_no_open(dev);
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  832  	if (!bdev) {
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  833  		ret = -ENXIO;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  834  		goto free_handle;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  835  	}
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  836  	disk = bdev->bd_disk;
e5c7fb400227df fs/block_dev.c Christoph Hellwig 2020-08-31  837  
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  838  	if (holder) {
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  839  		mode |= BLK_OPEN_EXCL;
0718afd47f70cf block/bdev.c   Christoph Hellwig 2023-06-01  840  		ret = bd_prepare_to_claim(bdev, holder, hops);
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  841  		if (ret)
37c3fc9abb25cd fs/block_dev.c Christoph Hellwig 2020-11-25  842  			goto put_blkdev;
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  843  	} else {
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  844  		if (WARN_ON_ONCE(mode & BLK_OPEN_EXCL)) {
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  845  			ret = -EIO;
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  846  			goto put_blkdev;
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  847  		}
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  848  	}
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  849  
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  850  	disk_block_events(disk);
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  851  
a8698707a1835b fs/block_dev.c Christoph Hellwig 2021-05-25  852  	mutex_lock(&disk->open_mutex);
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  853  	ret = -ENXIO;
50b4aecfbbb098 fs/block_dev.c Christoph Hellwig 2021-08-09  854  	if (!disk_live(disk))
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  855  		goto abort_claiming;
efcf5932230b94 block/bdev.c   Ming Lei          2021-11-11  856  	if (!try_module_get(disk->fops->owner))
efcf5932230b94 block/bdev.c   Ming Lei          2021-11-11  857  		goto abort_claiming;
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  858  	ret = -EBUSY;
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  859  	if (!bdev_may_open(bdev, mode))
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  860  		goto abort_claiming;
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  861  	if (bdev_is_partition(bdev))
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  862  		ret = blkdev_get_part(bdev, mode);
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  863  	else
362529d9280af4 fs/block_dev.c Christoph Hellwig 2021-05-25  864  		ret = blkdev_get_whole(bdev, mode);
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  865  	if (ret)
efcf5932230b94 block/bdev.c   Ming Lei          2021-11-11  866  		goto put_module;
498bc4954a0850 block/bdev.c   Jan Kara          2023-12-08  867  	bdev_claim_write_access(bdev, mode);
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  868  	if (holder) {
0718afd47f70cf block/bdev.c   Christoph Hellwig 2023-06-01  869  		bd_finish_claiming(bdev, holder, hops);
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  870  
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  871  		/*
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  872  		 * Block event polling for write claims if requested.  Any write
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  873  		 * holder makes the write_holder state stick until all are
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  874  		 * released.  This is good enough and tracking individual
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  875  		 * writeable reference is too fragile given the way @mode is
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  876  		 * used in blkdev_get/put().
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  877  		 */
05bdb9965305bb block/bdev.c   Christoph Hellwig 2023-06-08  878  		if ((mode & BLK_OPEN_WRITE) && !bdev->bd_write_holder &&
1545e0b419ba1d block/bdev.c   Christoph Hellwig 2021-11-22  879  		    (disk->event_flags & DISK_EVENT_FLAG_BLOCK_ON_EXCL_WRITE)) {
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  880  			bdev->bd_write_holder = true;
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  881  			unblock_events = false;
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  882  		}
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  883  	}
a8698707a1835b fs/block_dev.c Christoph Hellwig 2021-05-25  884  	mutex_unlock(&disk->open_mutex);
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  885  
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  886  	if (unblock_events)
5b56b6ed574b58 fs/block_dev.c Christoph Hellwig 2020-11-23  887  		disk_unblock_events(disk);
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  888  	handle->bdev = bdev;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  889  	handle->holder = holder;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  890  	handle->mode = mode;
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  891  	return handle;
efcf5932230b94 block/bdev.c   Ming Lei          2021-11-11  892  put_module:
efcf5932230b94 block/bdev.c   Ming Lei          2021-11-11  893  	module_put(disk->fops->owner);
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  894  abort_claiming:
2736e8eeb0ccdc block/bdev.c   Christoph Hellwig 2023-06-08  895  	if (holder)
37c3fc9abb25cd fs/block_dev.c Christoph Hellwig 2020-11-25  896  		bd_abort_claiming(bdev, holder);
a8698707a1835b fs/block_dev.c Christoph Hellwig 2021-05-25  897  	mutex_unlock(&disk->open_mutex);
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  898  	disk_unblock_events(disk);
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  899  put_blkdev:
22ae8ce8b89241 fs/block_dev.c Christoph Hellwig 2020-11-26  900  	blkdev_put_no_open(bdev);
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  901  free_handle:
bd11bbc24b9009 block/bdev.c   Jan Kara          2023-11-30  902  	kfree(handle);
603106af5aea5b block/bdev.c   Jan Kara          2023-11-30  903  	return ERR_PTR(ret);
bd11bbc24b9009 block/bdev.c   Jan Kara          2023-11-30  904  }
bd11bbc24b9009 block/bdev.c   Jan Kara          2023-11-30  905  EXPORT_SYMBOL(bdev_open_by_dev);
bd11bbc24b9009 block/bdev.c   Jan Kara          2023-11-30  906  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
