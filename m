Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352C2F5B
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Mar 2024 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710819087; cv=none; b=kwjiQwj+6TozTXTp9qb3x/s7KG7MwgKwyaS0GLuBDn1OAIVIsX6rjUXz0u587r1u5OWIMZOEugVPFHnC9nBM/+eHH66Ou8fqgeawAl5m67Qqw/qJ0XFqal+vLQCyOejn3/QZzHCDJDM0iGGS7dr1a7qp0ThqgXpnLjiHXpl1ExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710819087; c=relaxed/simple;
	bh=htxmALfSFZRCWwI3zEcef0e+/edDV+P4ZHspXGc4P0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZ7rpagEKZ/tb/hWiL2Lt0fFQYgqcsUDmPgz8bBkoNFC3grCwQvBipA4XxnphV/3qXIFNGv9mP1GL/Q5HBHme3asV33UfnkFfP1pEctC8aYJ29A8MpUR1b6NubbhSHsuUDg3sCiKxTHlVnidKQchPoRSu2DcSxJaMk9MLd1SkzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TiJ513J7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TiJ513J7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710819083; x=1742355083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htxmALfSFZRCWwI3zEcef0e+/edDV+P4ZHspXGc4P0Y=;
  b=TiJ513J7MA/ftZU8slF4WNNqe7RkTiosQC41FLhJBN73bkvPxLyyNtb/
   2FiecmE9GDke1wnhF5l/X0e405cWlTUO4B1L6mrwUc4DPD2vAVAvI+L+o
   M/y2zkO/sLdhRGEue/jmolcgF1lkxpLFOF13xmmsSWtKvqng+jvh0JJ6z
   ZoRY89nVgcY0vIUqbdkjMi/EmxUHGJVC978iEaFsu4x+RJaZw8oQTNofr
   Rh3yPKspwnY+cWbbq+7Lw4n6oF2x0vasiA+O/RR7fHdcXw9ztQqxtd2pL
   psv2n4cx5skmvBdAC8JoaHKvftFV6V8QIPRo+EBzmhMhEK6KkbVKJh2Cy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23121222"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="23121222"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 20:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="18395449"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2024 20:31:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmQC6-000HR9-2c;
	Tue, 19 Mar 2024 03:31:18 +0000
Date: Tue, 19 Mar 2024 11:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/ps3disk.c:417 ps3disk_probe() warn: Please consider
 using kzalloc instead of kmalloc
Message-ID: <202403191153.0KK8Sz1U-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3603fcb79b1036acae10602bffc4855a4b9af80
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 mm: enumerate all gfp flags
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: powerpc64-randconfig-r081-20240317 (https://download.01.org/0day-ci/archive/20240319/202403191153.0KK8Sz1U-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403191153.0KK8Sz1U-lkp@intel.com/

New smatch warnings:
drivers/block/ps3disk.c:417 ps3disk_probe() warn: Please consider using kzalloc instead of kmalloc

Old smatch warnings:
drivers/block/ps3disk.c:417 ps3disk_probe() error: no modifiers for allocation.

vim +417 drivers/block/ps3disk.c

fab1adcf9503cc Jens Axboe         2018-10-15  378  
8d85fce77edfc2 Greg Kroah-Hartman 2012-12-21  379  static int ps3disk_probe(struct ps3_system_bus_device *_dev)
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  380  {
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  381  	struct ps3_storage_device *dev = to_ps3_storage_device(&_dev->core);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  382  	struct ps3disk_private *priv;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  383  	int error;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  384  	unsigned int devidx;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  385  	struct request_queue *queue;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  386  	struct gendisk *gendisk;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  387  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  388  	if (dev->blk_size < 512) {
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  389  		dev_err(&dev->sbd.core,
e377c6e24d1b46 Stephen Rothwell   2009-01-13  390  			"%s:%u: cannot handle block size %llu\n", __func__,
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  391  			__LINE__, dev->blk_size);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  392  		return -EINVAL;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  393  	}
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  394  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  395  	BUILD_BUG_ON(PS3DISK_MAX_DISKS > BITS_PER_LONG);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  396  	mutex_lock(&ps3disk_mask_mutex);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  397  	devidx = find_first_zero_bit(&ps3disk_mask, PS3DISK_MAX_DISKS);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  398  	if (devidx >= PS3DISK_MAX_DISKS) {
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  399  		dev_err(&dev->sbd.core, "%s:%u: Too many disks\n", __func__,
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  400  			__LINE__);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  401  		mutex_unlock(&ps3disk_mask_mutex);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  402  		return -ENOSPC;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  403  	}
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  404  	__set_bit(devidx, &ps3disk_mask);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  405  	mutex_unlock(&ps3disk_mask_mutex);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  406  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  407  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  408  	if (!priv) {
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  409  		error = -ENOMEM;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  410  		goto fail;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  411  	}
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  412  
03fa68c245cccb Geert Uytterhoeven 2009-06-10  413  	ps3_system_bus_set_drvdata(_dev, priv);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  414  	spin_lock_init(&priv->lock);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  415  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  416  	dev->bounce_size = BOUNCE_SIZE;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21 @417  	dev->bounce_buf = kmalloc(BOUNCE_SIZE, GFP_DMA);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  418  	if (!dev->bounce_buf) {
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  419  		error = -ENOMEM;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  420  		goto fail_free_priv;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  421  	}
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  422  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  423  	error = ps3stor_setup(dev, ps3disk_interrupt);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  424  	if (error)
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  425  		goto fail_free_bounce;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  426  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  427  	ps3disk_identify(dev);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  428  
89662ac55a204d Christoph Hellwig  2021-06-02  429  	error = blk_mq_alloc_sq_tag_set(&priv->tag_set, &ps3disk_mq_ops, 1,
fab1adcf9503cc Jens Axboe         2018-10-15  430  					BLK_MQ_F_SHOULD_MERGE);
89662ac55a204d Christoph Hellwig  2021-06-02  431  	if (error)
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  432  		goto fail_teardown;
89662ac55a204d Christoph Hellwig  2021-06-02  433  
89662ac55a204d Christoph Hellwig  2021-06-02  434  	gendisk = blk_mq_alloc_disk(&priv->tag_set, dev);
89662ac55a204d Christoph Hellwig  2021-06-02  435  	if (IS_ERR(gendisk)) {
89662ac55a204d Christoph Hellwig  2021-06-02  436  		dev_err(&dev->sbd.core, "%s:%u: blk_mq_alloc_disk failed\n",
89662ac55a204d Christoph Hellwig  2021-06-02  437  			__func__, __LINE__);
89662ac55a204d Christoph Hellwig  2021-06-02  438  		error = PTR_ERR(gendisk);
89662ac55a204d Christoph Hellwig  2021-06-02  439  		goto fail_free_tag_set;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  440  	}
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  441  
89662ac55a204d Christoph Hellwig  2021-06-02  442  	queue = gendisk->queue;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  443  
086fa5ff0854c6 Martin K. Petersen 2010-02-26  444  	blk_queue_max_hw_sectors(queue, dev->bounce_size >> 9);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  445  	blk_queue_dma_alignment(queue, dev->blk_size-1);
e1defc4ff0cf57 Martin K. Petersen 2009-05-22  446  	blk_queue_logical_block_size(queue, dev->blk_size);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  447  
12c95f137d0945 Jens Axboe         2016-03-30  448  	blk_queue_write_cache(queue, true, false);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  449  
8a78362c4eefc1 Martin K. Petersen 2010-02-26  450  	blk_queue_max_segments(queue, -1);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  451  	blk_queue_max_segment_size(queue, dev->bounce_size);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  452  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  453  	priv->gendisk = gendisk;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  454  	gendisk->major = ps3disk_major;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  455  	gendisk->first_minor = devidx * PS3DISK_MINORS;
89662ac55a204d Christoph Hellwig  2021-06-02  456  	gendisk->minors = PS3DISK_MINORS;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  457  	gendisk->fops = &ps3disk_fops;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  458  	gendisk->private_data = dev;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  459  	snprintf(gendisk->disk_name, sizeof(gendisk->disk_name), PS3DISK_NAME,
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  460  		 devidx+'a');
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  461  	priv->blocking_factor = dev->blk_size >> 9;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  462  	set_capacity(gendisk,
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  463  		     dev->regions[dev->region_idx].size*priv->blocking_factor);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  464  
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  465  	dev_info(&dev->sbd.core,
72deb455b5ec61 Christoph Hellwig  2019-04-05  466  		 "%s is a %s (%llu MiB total, %llu MiB for OtherOS)\n",
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  467  		 gendisk->disk_name, priv->model, priv->raw_capacity >> 11,
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  468  		 get_capacity(gendisk) >> 11);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  469  
ff4cbe0fcf5d74 Luis Chamberlain   2021-10-15  470  	error = device_add_disk(&dev->sbd.core, gendisk, NULL);
ff4cbe0fcf5d74 Luis Chamberlain   2021-10-15  471  	if (error)
ff4cbe0fcf5d74 Luis Chamberlain   2021-10-15  472  		goto fail_cleanup_disk;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  473  
ff4cbe0fcf5d74 Luis Chamberlain   2021-10-15  474  	return 0;
ff4cbe0fcf5d74 Luis Chamberlain   2021-10-15  475  fail_cleanup_disk:
8b9ab62662048a Christoph Hellwig  2022-06-19  476  	put_disk(gendisk);
89662ac55a204d Christoph Hellwig  2021-06-02  477  fail_free_tag_set:
fab1adcf9503cc Jens Axboe         2018-10-15  478  	blk_mq_free_tag_set(&priv->tag_set);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  479  fail_teardown:
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  480  	ps3stor_teardown(dev);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  481  fail_free_bounce:
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  482  	kfree(dev->bounce_buf);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  483  fail_free_priv:
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  484  	kfree(priv);
03fa68c245cccb Geert Uytterhoeven 2009-06-10  485  	ps3_system_bus_set_drvdata(_dev, NULL);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  486  fail:
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  487  	mutex_lock(&ps3disk_mask_mutex);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  488  	__clear_bit(devidx, &ps3disk_mask);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  489  	mutex_unlock(&ps3disk_mask_mutex);
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  490  	return error;
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  491  }
c6131fa528c4fc Geert Uytterhoeven 2007-07-21  492  

:::::: The code at line 417 was first introduced by commit
:::::: c6131fa528c4fc57605c474bf8c83821aff164c0 ps3: Disk Storage Driver

:::::: TO: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
