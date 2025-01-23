Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B013AD03
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655557; cv=none; b=IlXDZGW6IXH/Ppt0b7hZ/EH+zH0t3KtBRn/ohagc1Ek7EaJ1/WqvlPqFLgCo2FLbi3m/S9ndFJyNJGmBiKv0Q85q8wH8HJ2qMRePiCxDwz09XubMt/fs3FuwyIXvKXhgjbKJuKFnz6PMDpTDdhtWvWwwOQ624o+/EpE6aVAlTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655557; c=relaxed/simple;
	bh=LqrFiOnO2uvyFwvPhkm2eFM1SSFW7PzkbU3VSVb8qPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/qkppTFJSYTpXbQzSOpFLbW8yDXsgXquJ+PFqhaMlg+tBEfMF1NAsKR1FvWLJDZGMsMNSnQQfR8R46lvrO8mFRhUSFHXyzDxfmgx64i0ZJ0zS/DnW3WVdYtOqd5zw4MzQ1mUH7fAhi1BZ6/6JSbPUfIdQqc7e/B1yI9RFFTJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUf7i3Cz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUf7i3Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737655555; x=1769191555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LqrFiOnO2uvyFwvPhkm2eFM1SSFW7PzkbU3VSVb8qPQ=;
  b=nUf7i3CzfdFM6L061jO2S8pxkgr+3SamClK+zcj+PFiqgPax5XeSUQ6M
   MGr4gE4OFMF6VgMrlTEGC/D4KqQJbVQx2Cg2DkGOi8QOl7Ze9d+A3/2bK
   UkgoIipy3Uh95auaIv7M3Ut1c2IyGRuzQDVPVTGLyIYWKyUMYARSDmgBw
   9n3yu3f9A3U9EjvkbqtfRm3gNSELvAd8CHuO8iRa+z4xOLEhtkin2uNrF
   87eQXh7en0BtRbShHG9Fj+UoeJmWRlQMIxsHoM/AdQI2NFa/cGkt5GnDE
   eXmMNp0sbwSsU/2AkotXpAsQ2j5+91qiISDEwV8dPuLeyKRkwEWnlFcBC
   A==;
X-CSE-ConnectionGUID: AC0Akj5rSkOJXBlVnrjB/Q==
X-CSE-MsgGUID: b4tgDzprRiWvGGtk5aPuZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49570890"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="49570890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 10:05:54 -0800
X-CSE-ConnectionGUID: /lJVKqoGT+GMPZ1WpOWp3g==
X-CSE-MsgGUID: xvnJ6Qm0QlKf/KmfZVVSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="108139076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jan 2025 10:05:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb1aQ-000bTz-1s;
	Thu, 23 Jan 2025 18:05:50 +0000
Date: Fri, 24 Jan 2025 02:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:v4l2-loopback 6/6]
 drivers/media/v4l2-core/v4l2-loopback.c:2531 v4l2_loopback_add() warn:
 variable dereferenced before check 'conf' (see line 2507)
Message-ID: <202501240159.4f3XILcu-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   ccb1b6e1247887be17bf22b3809c50848e87a4db
commit: ccb1b6e1247887be17bf22b3809c50848e87a4db [6/6] V4L2LOOPBACK_CTL_ADD: Reburnish the API
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-r071-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240159.4f3XILcu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501240159.4f3XILcu-lkp@intel.com/

New smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:2531 v4l2_loopback_add() warn: variable dereferenced before check 'conf' (see line 2507)

Old smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:1808 vidioc_dqbuf() error: uninitialized symbol 'index'.
drivers/media/v4l2-core/v4l2-loopback.c:2769 v4l2loopback_control_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/conf +2531 drivers/media/v4l2-core/v4l2-loopback.c

3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2497  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2498  /* init loopback main structure */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2499  #define DEFAULT_FROM_CONF(confmember, default_condition, default_value)        \
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2500  	((conf) ?                                                              \
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2501  		 ((conf->confmember default_condition) ? (default_value) :     \
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2502  							 (conf->confmember)) : \
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2503  		 default_value)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2504  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2505  static int v4l2_loopback_add(struct v4l2_loopback_config *conf, int *ret_nr)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2506  {
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19 @2507  	bool all_capabilities = !!(conf->flags & V4L2_LOOPBACK_ALL_CAPABILITIES);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2508  	struct v4l2_loopback_device *dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2509  	struct v4l2_ctrl_handler *hdl;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2510  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2511  	int err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2512  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2513  	u32 _width = V4L2LOOPBACK_SIZE_DEFAULT_WIDTH;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2514  	u32 _height = V4L2LOOPBACK_SIZE_DEFAULT_HEIGHT;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2515  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2516  	u32 _min_width = DEFAULT_FROM_CONF(min_width,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2517  					   < V4L2LOOPBACK_SIZE_MIN_WIDTH,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2518  					   V4L2LOOPBACK_SIZE_MIN_WIDTH);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2519  	u32 _min_height = DEFAULT_FROM_CONF(min_height,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2520  					    < V4L2LOOPBACK_SIZE_MIN_HEIGHT,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2521  					    V4L2LOOPBACK_SIZE_MIN_HEIGHT);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2522  	u32 _max_width = DEFAULT_FROM_CONF(max_width, < _min_width,
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2523  					   V4L2LOOPBACK_SIZE_DEFAULT_MAX_WIDTH);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2524  	u32 _max_height =
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2525  		DEFAULT_FROM_CONF(max_height, < _min_height, V4L2LOOPBACK_SIZE_DEFAULT_MAX_HEIGHT);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2526  	int _max_buffers = DEFAULT_FROM_CONF(max_buffers, <= 0, V4L2LOOPBACK_DEFAULT_MAX_BUFFERS);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2527  	int _max_openers = DEFAULT_FROM_CONF(max_openers, <= 0, V4L2LOOPBACK_DEFAULT_MAX_OPENERS);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2528  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2529  	int nr = -1;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2530  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22 @2531  	if (conf) {
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2532  		if (conf->video_nr >= 0)
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2533  			nr = conf->video_nr;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2534  		else if (conf->video_nr == -1)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2535  			nr = -1;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2536  		else
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2537  			return -EINVAL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2538  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2539  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2540  	if (idr_find(&v4l2loopback_index_idr, nr))
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2541  		return -EEXIST;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2542  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2543  	dprintk("creating v4l2loopback-device #%d\n", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2544  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2545  	if (!dev)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2546  		return -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2547  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2548  	/* allocate id, if @id >= 0, we're requesting that specific id */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2549  	if (nr >= 0) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2550  		err = idr_alloc(&v4l2loopback_index_idr, dev, nr, nr + 1,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2551  				GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2552  		if (err == -ENOSPC)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2553  			err = -EEXIST;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2554  	} else {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2555  		err = idr_alloc(&v4l2loopback_index_idr, dev, 0, 0, GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2556  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2557  	if (err < 0)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2558  		goto out_free_dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2559  	nr = err;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2560  	err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2561  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2562  	if (conf && conf->card_label[0]) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2563  		snprintf(dev->card_label, sizeof(dev->card_label), "%s",
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2564  			 conf->card_label);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2565  	} else {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2566  		snprintf(dev->card_label, sizeof(dev->card_label),
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2567  			 "Dummy video device (0x%04X)", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2568  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2569  	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2570  		 "v4l2loopback-%03d", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2571  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2572  	dev->video_nr = nr;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2573  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2574  	err = v4l2_device_register(NULL, &dev->v4l2_dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2575  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2576  		goto out_free_idr;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2577  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2578  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2579  	dev->vdev = video_device_alloc();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2580  	if (dev->vdev == NULL) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2581  		err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2582  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2583  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2584  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2585  	video_set_drvdata(dev->vdev, dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2586  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2587  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2588  	snprintf(dev->vdev->name, sizeof(dev->vdev->name), "%s",
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2589  		 dev->card_label);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2590  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2591  	init_vdev(dev->vdev, nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2592  	dev->vdev->v4l2_dev = &dev->v4l2_dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2593  	init_capture_param(&dev->capture_param);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2594  	err = set_timeperframe(dev, &dev->capture_param.timeperframe);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2595  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2596  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2597  	dev->keep_format = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2598  	dev->sustain_framerate = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2599  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2600  	dev->all_capabilities = all_capabilities;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2601  	dev->min_width = _min_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2602  	dev->min_height = _min_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2603  	dev->max_width = _max_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2604  	dev->max_height = _max_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2605  	dev->max_openers = _max_openers;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2606  	dev->buffers_number = dev->used_buffers = _max_buffers;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2607  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2608  	dev->write_position = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2609  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2610  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2611  	spin_lock_init(&dev->lock);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2612  	spin_lock_init(&dev->list_lock);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2613  	INIT_LIST_HEAD(&dev->outbufs_list);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2614  	if (list_empty(&dev->outbufs_list)) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2615  		int i;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2616  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2617  		for (i = 0; i < dev->used_buffers; ++i)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2618  			list_add_tail(&dev->buffers[i].list_head,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2619  				      &dev->outbufs_list);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2620  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2621  	memset(dev->bufpos2index, 0, sizeof(dev->bufpos2index));
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2622  	atomic_set(&dev->open_count, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2623  	dev->ready_for_capture = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2624  	dev->ready_for_output = 1;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2625  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2626  	dev->buffer_size = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2627  	dev->image = NULL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2628  	dev->imagesize = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2629  	timer_setup(&dev->sustain_timer, sustain_timer_clb, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2630  	timer_setup(&dev->timeout_timer, timeout_timer_clb, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2631  	dev->reread_count = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2632  	dev->timeout_jiffies = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2633  	dev->timeout_image = NULL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2634  	dev->timeout_happened = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2635  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2636  	hdl = &dev->ctrl_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2637  	err = v4l2_ctrl_handler_init(hdl, 4);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2638  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2639  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2640  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_keepformat, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2641  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_sustainframerate, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2642  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeout, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2643  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeoutimageio, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2644  	if (hdl->error) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2645  		err = hdl->error;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2646  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2647  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2648  	dev->v4l2_dev.ctrl_handler = hdl;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2649  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2650  	err = v4l2_ctrl_handler_setup(hdl);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2651  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2652  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2653  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2654  	/* FIXME set buffers to 0 */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2655  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2656  	/* Set initial format */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2657  	if (_width < _min_width)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2658  		_width = _min_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2659  	if (_width > _max_width)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2660  		_width = _max_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2661  	if (_height < _min_height)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2662  		_height = _min_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2663  	if (_height > _max_height)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2664  		_height = _max_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2665  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2666  	dev->pix_format.width = _width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2667  	dev->pix_format.height = _height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2668  	dev->pix_format.pixelformat = formats[0].fourcc;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2669  	dev->pix_format.colorspace =
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2670  		V4L2_COLORSPACE_DEFAULT; /* do we need to set this ? */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2671  	dev->pix_format.field = V4L2_FIELD_NONE;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2672  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2673  	dev->buffer_size = PAGE_ALIGN(dev->pix_format.sizeimage);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2674  	dprintk("buffer_size = %ld (=%d)\n", dev->buffer_size,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2675  		dev->pix_format.sizeimage);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2676  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2677  	if (dev->buffer_size && ((err = allocate_buffers(dev)) < 0))
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2678  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2679  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2680  	init_waitqueue_head(&dev->read_event);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2681  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2682  	/* register the device -> it creates /dev/video* */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2683  	if (video_register_device(dev->vdev, VFL_TYPE_VIDEO, nr) < 0) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2684  		printk(KERN_ERR
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2685  		       "v4l2loopback: failed video_register_device()\n");
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2686  		err = -EFAULT;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2687  		goto out_free_device;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2688  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2689  	v4l2loopback_create_sysfs(dev->vdev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2690  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2691  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2692  	if (ret_nr)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2693  		*ret_nr = dev->vdev->num;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2694  	return 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2695  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2696  out_free_device:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2697  	video_device_release(dev->vdev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2698  out_free_handler:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2699  	v4l2_ctrl_handler_free(&dev->ctrl_handler);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2700  out_unregister:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2701  	video_set_drvdata(dev->vdev, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2702  	v4l2_device_unregister(&dev->v4l2_dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2703  out_free_idr:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2704  	idr_remove(&v4l2loopback_index_idr, nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2705  out_free_dev:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2706  	kfree(dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2707  	return err;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2708  }
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2709  

:::::: The code at line 2531 was first introduced by commit
:::::: 3c275abeb8f6be255e53464c9e8814d67a38d025 media: v4l2-loopback

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
