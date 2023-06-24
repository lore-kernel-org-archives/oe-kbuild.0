Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E184417
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jun 2023 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687599480; x=1719135480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nm8y4qNCoclxfyJkwepCD36bbbJMHHcSbRt5N3Iyd4c=;
  b=ksi7kRQlfWeJyLg+nFWKdX892xavMmG3yFWxfaFCrQzjSyTZGfdZp0TZ
   VZcieEh7069IWkIUcQOpzXWEXbM0KMGjDIXKkCCMbXF9M2FWSBo/ZMQZw
   AU7/6mh9CRc8e8X1oa9FdXP08Umw5pY698WShOyYKcNoTNr4I1Sn23Xyu
   g5GfJjJEmQuIp3xjJ3T8Xhvgx0q2j+DOSRJLZNKZh9FLxyyAAdu2qW4KU
   2PuJvcxUamm6H4xqxeQihbDyQy/ZQQ/ZvRiF40XU3IokdaocvEjfvh5kc
   U8XE/GJkDPjTS+mvcdzQNcV0/pX+WWotf9/s0L7kB9Ari+/Lua/QZL6xi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="426920370"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="426920370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 02:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="839710156"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="839710156"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jun 2023 02:37:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCziP-0008w7-2m;
	Sat, 24 Jun 2023 09:37:57 +0000
Date: Sat, 24 Jun 2023 17:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <202306241746.1sA0eBvt-lkp@intel.com>
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
TO: Jan Kara <jack@suse.cz>
CC: Jens Axboe <axboe@kernel.dk>
CC: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block-late
head:   2c5555983bd27d24162534b682b10654639a5576
commit: 2c5555983bd27d24162534b682b10654639a5576 [216/216] bcache: Fix bcache device claiming
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306241746.1sA0eBvt-lkp@intel.com/

smatch warnings:
drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory 'holder'

vim +/holder +2644 drivers/md/bcache/super.c

cafe563591446c Kent Overstreet   2013-03-23  2526  
50246693f81fe8 Christoph Hellwig 2020-01-24  2527  	ret = -EBUSY;
29cda393bcaad1 Coly Li           2020-01-24  2528  	err = "failed to reference bcache module";
cafe563591446c Kent Overstreet   2013-03-23  2529  	if (!try_module_get(THIS_MODULE))
50246693f81fe8 Christoph Hellwig 2020-01-24  2530  		goto out;
cafe563591446c Kent Overstreet   2013-03-23  2531  
a59ff6ccc2bf2e Coly Li           2019-06-28  2532  	/* For latest state of bcache_is_reboot */
a59ff6ccc2bf2e Coly Li           2019-06-28  2533  	smp_mb();
29cda393bcaad1 Coly Li           2020-01-24  2534  	err = "bcache is in reboot";
a59ff6ccc2bf2e Coly Li           2019-06-28  2535  	if (bcache_is_reboot)
50246693f81fe8 Christoph Hellwig 2020-01-24  2536  		goto out_module_put;
a59ff6ccc2bf2e Coly Li           2019-06-28  2537  
50246693f81fe8 Christoph Hellwig 2020-01-24  2538  	ret = -ENOMEM;
50246693f81fe8 Christoph Hellwig 2020-01-24  2539  	err = "cannot allocate memory";
a56489d4b3c914 Florian Schmaus   2018-07-26  2540  	path = kstrndup(buffer, size, GFP_KERNEL);
a56489d4b3c914 Florian Schmaus   2018-07-26  2541  	if (!path)
50246693f81fe8 Christoph Hellwig 2020-01-24  2542  		goto out_module_put;
a56489d4b3c914 Florian Schmaus   2018-07-26  2543  
a56489d4b3c914 Florian Schmaus   2018-07-26  2544  	sb = kmalloc(sizeof(struct cache_sb), GFP_KERNEL);
a56489d4b3c914 Florian Schmaus   2018-07-26  2545  	if (!sb)
50246693f81fe8 Christoph Hellwig 2020-01-24  2546  		goto out_free_path;
cafe563591446c Kent Overstreet   2013-03-23  2547  
50246693f81fe8 Christoph Hellwig 2020-01-24  2548  	ret = -EINVAL;
cafe563591446c Kent Overstreet   2013-03-23  2549  	err = "failed to open device";
2c5555983bd27d Jan Kara          2023-06-22  2550  	bdev = blkdev_get_by_path(strim(path), BLK_OPEN_READ, NULL, NULL);
2c5555983bd27d Jan Kara          2023-06-22  2551  	if (IS_ERR(bdev))
50246693f81fe8 Christoph Hellwig 2020-01-24  2552  		goto out_free_sb;
f59fce847fc848 Kent Overstreet   2013-05-15  2553  
f59fce847fc848 Kent Overstreet   2013-05-15  2554  	err = "failed to set blocksize";
f59fce847fc848 Kent Overstreet   2013-05-15  2555  	if (set_blocksize(bdev, 4096))
50246693f81fe8 Christoph Hellwig 2020-01-24  2556  		goto out_blkdev_put;
cafe563591446c Kent Overstreet   2013-03-23  2557  
cfa0c56db9c087 Christoph Hellwig 2020-01-24  2558  	err = read_super(sb, bdev, &sb_disk);
cafe563591446c Kent Overstreet   2013-03-23  2559  	if (err)
50246693f81fe8 Christoph Hellwig 2020-01-24  2560  		goto out_blkdev_put;
cafe563591446c Kent Overstreet   2013-03-23  2561  
abcc0cbd49283f Jan Kara          2023-06-22  2562  	holder = alloc_holder_object(sb);
abcc0cbd49283f Jan Kara          2023-06-22  2563  	if (!holder) {
abcc0cbd49283f Jan Kara          2023-06-22  2564  		ret = -ENOMEM;
abcc0cbd49283f Jan Kara          2023-06-22  2565  		err = "cannot allocate memory";
abcc0cbd49283f Jan Kara          2023-06-22  2566  		goto out_put_sb_page;
abcc0cbd49283f Jan Kara          2023-06-22  2567  	}
abcc0cbd49283f Jan Kara          2023-06-22  2568  
2c5555983bd27d Jan Kara          2023-06-22  2569  	/* Now reopen in exclusive mode with proper holder */
2c5555983bd27d Jan Kara          2023-06-22  2570  	bdev2 = blkdev_get_by_dev(bdev->bd_dev, BLK_OPEN_READ | BLK_OPEN_WRITE,
2c5555983bd27d Jan Kara          2023-06-22  2571  				  holder, NULL);
2c5555983bd27d Jan Kara          2023-06-22  2572  	blkdev_put(bdev, NULL);
2c5555983bd27d Jan Kara          2023-06-22  2573  	bdev = bdev2;
2c5555983bd27d Jan Kara          2023-06-22  2574  	if (IS_ERR(bdev)) {
2c5555983bd27d Jan Kara          2023-06-22  2575  		ret = PTR_ERR(bdev);
2c5555983bd27d Jan Kara          2023-06-22  2576  		bdev = NULL;
2c5555983bd27d Jan Kara          2023-06-22  2577  		if (ret == -EBUSY) {
2c5555983bd27d Jan Kara          2023-06-22  2578  			dev_t dev;
2c5555983bd27d Jan Kara          2023-06-22  2579  
2c5555983bd27d Jan Kara          2023-06-22  2580  			mutex_lock(&bch_register_lock);
2c5555983bd27d Jan Kara          2023-06-22  2581  			if (lookup_bdev(strim(path), &dev) == 0 &&
2c5555983bd27d Jan Kara          2023-06-22  2582  			    bch_is_open(dev))
2c5555983bd27d Jan Kara          2023-06-22  2583  				err = "device already registered";
2c5555983bd27d Jan Kara          2023-06-22  2584  			else
2c5555983bd27d Jan Kara          2023-06-22  2585  				err = "device busy";
2c5555983bd27d Jan Kara          2023-06-22  2586  			mutex_unlock(&bch_register_lock);
2c5555983bd27d Jan Kara          2023-06-22  2587  			if (attr == &ksysfs_register_quiet) {
2c5555983bd27d Jan Kara          2023-06-22  2588  				quiet = true;
2c5555983bd27d Jan Kara          2023-06-22  2589  				ret = size;
2c5555983bd27d Jan Kara          2023-06-22  2590  			}
2c5555983bd27d Jan Kara          2023-06-22  2591  		}
2c5555983bd27d Jan Kara          2023-06-22  2592  		goto out_free_holder;
2c5555983bd27d Jan Kara          2023-06-22  2593  	}
2c5555983bd27d Jan Kara          2023-06-22  2594  
cc40daf91bdddb Tang Junhui       2018-03-05  2595  	err = "failed to register device";
a58e88bfdc4d52 Coly Li           2020-10-01  2596  
a58e88bfdc4d52 Coly Li           2020-10-01  2597  	if (async_registration) {
9e23ccf8f0a22e Coly Li           2020-05-27  2598  		/* register in asynchronous way */
9e23ccf8f0a22e Coly Li           2020-05-27  2599  		struct async_reg_args *args =
9e23ccf8f0a22e Coly Li           2020-05-27  2600  			kzalloc(sizeof(struct async_reg_args), GFP_KERNEL);
9e23ccf8f0a22e Coly Li           2020-05-27  2601  
9e23ccf8f0a22e Coly Li           2020-05-27  2602  		if (!args) {
9e23ccf8f0a22e Coly Li           2020-05-27  2603  			ret = -ENOMEM;
9e23ccf8f0a22e Coly Li           2020-05-27  2604  			err = "cannot allocate memory";
abcc0cbd49283f Jan Kara          2023-06-22  2605  			goto out_free_holder;
9e23ccf8f0a22e Coly Li           2020-05-27  2606  		}
9e23ccf8f0a22e Coly Li           2020-05-27  2607  
9e23ccf8f0a22e Coly Li           2020-05-27  2608  		args->path	= path;
9e23ccf8f0a22e Coly Li           2020-05-27  2609  		args->sb	= sb;
9e23ccf8f0a22e Coly Li           2020-05-27  2610  		args->sb_disk	= sb_disk;
9e23ccf8f0a22e Coly Li           2020-05-27  2611  		args->bdev	= bdev;
abcc0cbd49283f Jan Kara          2023-06-22  2612  		args->holder	= holder;
d7fae7b4fa1527 Kai Krakow        2021-02-10  2613  		register_device_async(args);
9e23ccf8f0a22e Coly Li           2020-05-27  2614  		/* No wait and returns to user space */
9e23ccf8f0a22e Coly Li           2020-05-27  2615  		goto async_done;
9e23ccf8f0a22e Coly Li           2020-05-27  2616  	}
9e23ccf8f0a22e Coly Li           2020-05-27  2617  
2903381fce7100 Kent Overstreet   2013-04-11  2618  	if (SB_IS_BDEV(sb)) {
4fa03402cda2fa Kent Overstreet   2014-03-17  2619  		mutex_lock(&bch_register_lock);
abcc0cbd49283f Jan Kara          2023-06-22  2620  		ret = register_bdev(sb, sb_disk, bdev, holder);
4fa03402cda2fa Kent Overstreet   2014-03-17  2621  		mutex_unlock(&bch_register_lock);
bb6d355c2aff42 Coly Li           2019-04-25  2622  		/* blkdev_put() will be called in cached_dev_free() */
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2623  		if (ret < 0)
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2624  			goto out_free_sb;
cafe563591446c Kent Overstreet   2013-03-23  2625  	} else {
bb6d355c2aff42 Coly Li           2019-04-25  2626  		/* blkdev_put() will be called in bch_cache_release() */
abcc0cbd49283f Jan Kara          2023-06-22  2627  		ret = register_cache(sb, sb_disk, bdev, holder);
d55f7cb2e5c053 Chao Yu           2021-10-20  2628  		if (ret)
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2629  			goto out_free_sb;
50246693f81fe8 Christoph Hellwig 2020-01-24  2630  	}
50246693f81fe8 Christoph Hellwig 2020-01-24  2631  
f59fce847fc848 Kent Overstreet   2013-05-15  2632  	kfree(sb);
f59fce847fc848 Kent Overstreet   2013-05-15  2633  	kfree(path);
f59fce847fc848 Kent Overstreet   2013-05-15  2634  	module_put(THIS_MODULE);
9e23ccf8f0a22e Coly Li           2020-05-27  2635  async_done:
50246693f81fe8 Christoph Hellwig 2020-01-24  2636  	return size;
f59fce847fc848 Kent Overstreet   2013-05-15  2637  
abcc0cbd49283f Jan Kara          2023-06-22  2638  out_free_holder:
abcc0cbd49283f Jan Kara          2023-06-22  2639  	kfree(holder);
50246693f81fe8 Christoph Hellwig 2020-01-24  2640  out_put_sb_page:
cfa0c56db9c087 Christoph Hellwig 2020-01-24  2641  	put_page(virt_to_page(sb_disk));
50246693f81fe8 Christoph Hellwig 2020-01-24  2642  out_blkdev_put:
2c5555983bd27d Jan Kara          2023-06-22  2643  	if (bdev)
2c5555983bd27d Jan Kara          2023-06-22 @2644  		blkdev_put(bdev, holder);
50246693f81fe8 Christoph Hellwig 2020-01-24  2645  out_free_sb:
50246693f81fe8 Christoph Hellwig 2020-01-24  2646  	kfree(sb);
50246693f81fe8 Christoph Hellwig 2020-01-24  2647  out_free_path:
50246693f81fe8 Christoph Hellwig 2020-01-24  2648  	kfree(path);
ae3cd299919af6 Coly Li           2020-01-24  2649  	path = NULL;
50246693f81fe8 Christoph Hellwig 2020-01-24  2650  out_module_put:
50246693f81fe8 Christoph Hellwig 2020-01-24  2651  	module_put(THIS_MODULE);
50246693f81fe8 Christoph Hellwig 2020-01-24  2652  out:
2c5555983bd27d Jan Kara          2023-06-22  2653  	if (!quiet)
46f5aa8806e34f Joe Perches       2020-05-27  2654  		pr_info("error %s: %s\n", path?path:"", err);
50246693f81fe8 Christoph Hellwig 2020-01-24  2655  	return ret;
cafe563591446c Kent Overstreet   2013-03-23  2656  }
cafe563591446c Kent Overstreet   2013-03-23  2657  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
