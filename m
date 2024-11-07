Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAD1D7E4E
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970149; cv=none; b=AhqUdWkIniIWqNOP8IFs8nbOsBzJcGH0UI4aPZ/mkxn0QjGrm70aCGW6dGFcOu36JPzSfzzbxwfT7AAYJ0SYSYWbDVA1KrxJNG3gONO9tE2X3vXnPeQKtNGZSSHbOk0AhlwCobw8mzfUqEz+FIwzZ1q7UxYDk6Xngsg3Osfwi+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970149; c=relaxed/simple;
	bh=4QVqjxfCdK6wx69FKtr9pWNaqRdGPo8ERUOlr4rWwnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShPjpluanNHxwKUOdRX6AXFSx9hdmwJo1A4hbM+rF6S5Mpar4ymkAdLGYQBR7J3msC6aK2AS4HLO7WOwg9H1XpRE/jG0/xYHivd+khA72mXtaVF6mSd1AXpLVlCkZ3Ddd1twZrofNYg++KA/baSlBHfEOR3I9m9Bd/WYGdw12KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch6AvFOB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch6AvFOB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so713644a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730970144; x=1731574944; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d84q9//NKLb3uSw62MGrRCFlVFCZRBpi5/LeyZGYOaA=;
        b=ch6AvFOBp9tfOMjx9WRxhTGOpCd8L7o6XyhmsEPprFutL/UqTb+Uq8LHYKZt2JfMZ5
         yaZ5YuaB3arNhHz0AV3Ntzyi1vg2CLuhJbHvLttawneK17qY+lsUIPDke+YYfX8ZIrVk
         9hkQ1hHcrA1cJg8TWwv/JEFY7l2ui5BFYfMj/T/hqOnypWrRPs1uEyaVix+rhdTACNWS
         4tY+QDv6lkqUhrNzlkGbiiSrdo4/L6ewkMZ/4NHybDKx+rxq25WxAje1RBrHfOD+zvi1
         4FLnInz0dwtGMiJiVWUL/1ggwVWNj1wbsl0ykiZnR21kH+lX0YtAL04GnSEYtfY9twVR
         Amvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730970144; x=1731574944;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d84q9//NKLb3uSw62MGrRCFlVFCZRBpi5/LeyZGYOaA=;
        b=V8H2NSV+RZO3Lfya+XieNqcbDqx8HB6iiLSGBwHswE7MeZhm1Ue0X8UWIdXNEKQEaY
         Kpj31TywhNKZyqzowaDvlmWl/kpLA7MKk2kk6fC48/xRbgZPi306hYeOiSI4kwCkubzD
         hSslonAMG0d3rKWNLe+AV+6b7SWgFuiNKG7HxlctEx5bIgGZVe5y+2M+3wfr2PLM+oFl
         L28TiJxVZTKeijIXCbCGOOZLvXZOGE18/rI3LPF9PqAgDxxQ74dnIMvAm5b11G4ftEO+
         HecwPam14t1Z23QfD9U19JXzi1P+kgBNzM7a/vS2RegfJILZbaKZ/4FrmtKuLLXx0MV0
         tLDw==
X-Gm-Message-State: AOJu0YyLkTSYb0ZDoNoLerhhgpf2UHHVy65sIfRgSbtYS2rLyytSSVjk
	zjEJd+4wrbwkyQxnf1XncxdMSIGN3p5wPmVHit8zRcZCRNJdKWViQHRp8ClRdHu28ErbqdLn+F+
	lMWM=
X-Google-Smtp-Source: AGHT+IHRRYqF/40CG+u0brK4QpANJW+hr+sbOkYpyuWMWorq6iDcZF/aw/QERyxNUrGwIEM+ZYI8ZQ==
X-Received: by 2002:a05:6402:35d5:b0:5ce:dfdf:a2a8 with SMTP id 4fb4d7f45d1cf-5cedfdfa403mr10280608a12.30.1730970142902;
        Thu, 07 Nov 2024 01:02:22 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b7f680sm533308a12.35.2024.11.07.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:02:22 -0800 (PST)
Date: Thu, 7 Nov 2024 12:02:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Li Lingfeng <lilingfeng3@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1344/16464] block/bdev.c:829 bdev_open_by_dev()
 warn: possible memory leak of 'handle'
Message-ID: <8a2a4265-56ec-43af-be81-2f84cc67fc56@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8edd62f80cd8e00a4ecb15f57010d8fdbff12e16
commit: 498bc4954a0850611dc7b0193bc5c5a31479aecf [1344/16464] block: Add config option to not allow writing to mounted devices
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070817.MsBLoDva-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411070817.MsBLoDva-lkp@intel.com/

smatch warnings:
block/bdev.c:829 bdev_open_by_dev() warn: possible memory leak of 'handle'

vim +/handle +829 block/bdev.c

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

goto free_handle?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

