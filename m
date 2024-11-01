Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5901DA53
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730465986; cv=none; b=rUXa/OQ2zc31Rp5HB2xT5i1q/6g+sUlEgsQU9udExZ/AqmQdB4N0ld1rRQHWHSNE06V4evqwtWPbXiOQpliw2J/sw3kFNOCD3weBbAEWSpb0gv74JPkn/4ndpwTBZAUMPmobvyDDYdVEVZjR71vF95hufHh9T+hsAa/vGNluyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730465986; c=relaxed/simple;
	bh=nZdrGwmaFtJGqPwVsJCZVaw+6JfYD5LZsKt8PLbbfGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6o14hfc/+iLcDoUxFZ4X7PhHCUUvq6oT2d09GYIDOZgmaSQlpWNFOPAzVFud//SNawaC9tnaXpW082HCNODEZXP0UEmn7hGlT6sI+89gKrgCRmVnSYqrrzqAfagPr38sJqKwOBhpGYiClLw7uhzGHKM0q8sANTiFOoQp4QsWuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bk1YUe3C; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bk1YUe3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730465983; x=1762001983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZdrGwmaFtJGqPwVsJCZVaw+6JfYD5LZsKt8PLbbfGY=;
  b=Bk1YUe3CEULhY1Nrjd+3IW19WHBeIxyszZnnA9FAiyO1glUT/SxRtYCz
   3lwrILZTEXa4q6Ro9tLvawt7cjtWGk/l6EdSHqkbO9wP9A3raMJSHAhQT
   tmPeTAAnbSSSnd8Z4Cwk1gBw9M9qXEGeyxmv0A0F8RgMQ6PMO/qN8sGZl
   ZzFpTyZEYaPRBJ2xrLAAPHMiJ4PFrWtImi6o0+3GMhN/dUNvEAwqmiPyU
   PgxV1gCw9tmVc0h26WfN3oxi9kMlpkuvLhR/FoekqM5hhQiQYxx/HioUO
   pFTZ/yNGc0rj3/lpCQRbB86SjAUK1GtdpQWhobBWakCY+qU8LVrSEu8Am
   Q==;
X-CSE-ConnectionGUID: 4TFcgythTSq4bIuZERAtQg==
X-CSE-MsgGUID: MgRNl9e7RIm4VWjb8akyhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52797085"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52797085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:59:40 -0700
X-CSE-ConnectionGUID: fUVkzaF1Q567Sc8JpVO9hA==
X-CSE-MsgGUID: SSfssxu+Q5mybc63vuwwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83097126"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2024 05:59:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6rFY-000hYs-0J;
	Fri, 01 Nov 2024 12:59:36 +0000
Date: Fri, 1 Nov 2024 20:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387] drivers/md/dm-bow.c:666
 dm_bow_ctr() warn: missing error code 'ret'
Message-ID: <202411012054.D1zpW7a2-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: 0ce3eb37e9eab307def1bad31c028d86ae7b2ea1 [387/387] ANDROID: dm-bow: Add dm-bow feature
:::::: branch date: 4 days ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411012054.D1zpW7a2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411012054.D1zpW7a2-lkp@intel.com/

smatch warnings:
drivers/md/dm-bow.c:666 dm_bow_ctr() warn: missing error code 'ret'

vim +/ret +666 drivers/md/dm-bow.c

0ce3eb37e9eab3 Paul Lawrence 2018-10-23  621  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  622  static int dm_bow_ctr(struct dm_target *ti, unsigned int argc, char **argv)
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  623  {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  624  	struct bow_context *bc;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  625  	struct bow_range *br;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  626  	int ret;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  627  	struct mapped_device *md = dm_table_get_md(ti->table);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  628  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  629  	if (argc != 1) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  630  		ti->error = "Invalid argument count";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  631  		return -EINVAL;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  632  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  633  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  634  	bc = kzalloc(sizeof(*bc), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  635  	if (!bc) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  636  		ti->error = "Cannot allocate bow context";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  637  		return -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  638  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  639  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  640  	ti->num_flush_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  641  	ti->num_discard_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  642  	ti->num_write_same_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  643  	ti->private = bc;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  644  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  645  	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table),
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  646  			    &bc->dev);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  647  	if (ret) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  648  		ti->error = "Device lookup failed";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  649  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  650  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  651  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  652  	if (bc->dev->bdev->bd_queue->limits.max_discard_sectors == 0) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  653  		bc->dev->bdev->bd_queue->limits.discard_granularity = 1 << 12;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  654  		bc->dev->bdev->bd_queue->limits.max_hw_discard_sectors = 1 << 15;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  655  		bc->dev->bdev->bd_queue->limits.max_discard_sectors = 1 << 15;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  656  		bc->forward_trims = false;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  657  	} else {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  658  		bc->forward_trims = true;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  659  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  660  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  661  	bc->block_size = bc->dev->bdev->bd_queue->limits.logical_block_size;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  662  	bc->block_shift = ilog2(bc->block_size);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  663  	bc->log_sector = kzalloc(bc->block_size, GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  664  	if (!bc->log_sector) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  665  		ti->error = "Cannot allocate log sector";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23 @666  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  667  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  668  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  669  	init_completion(&bc->kobj_holder.completion);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  670  	ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  671  				   &disk_to_dev(dm_disk(md))->kobj, "%s",
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  672  				   "bow");
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  673  	if (ret) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  674  		ti->error = "Cannot create sysfs node";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  675  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  676  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  677  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  678  	mutex_init(&bc->ranges_lock);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  679  	bc->ranges = RB_ROOT;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  680  	bc->bufio = dm_bufio_client_create(bc->dev->bdev, bc->block_size, 1, 0,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  681  					   NULL, NULL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  682  	if (IS_ERR(bc->bufio)) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  683  		ti->error = "Cannot initialize dm-bufio";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  684  		ret = PTR_ERR(bc->bufio);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  685  		bc->bufio = NULL;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  686  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  687  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  688  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  689  	bc->workqueue = alloc_workqueue("dm-bow",
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  690  					WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  691  					| WQ_UNBOUND, num_online_cpus());
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  692  	if (!bc->workqueue) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  693  		ti->error = "Cannot allocate workqueue";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  694  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  695  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  696  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  697  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  698  	INIT_LIST_HEAD(&bc->trimmed_list);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  699  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  700  	br = kzalloc(sizeof(*br), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  701  	if (!br) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  702  		ti->error = "Cannot allocate ranges";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  703  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  704  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  705  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  706  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  707  	br->sector = ti->len;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  708  	br->type = TOP;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  709  	rb_link_node(&br->node, NULL, &bc->ranges.rb_node);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  710  	rb_insert_color(&br->node, &bc->ranges);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  711  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  712  	br = kzalloc(sizeof(*br), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  713  	if (!br) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  714  		ti->error = "Cannot allocate ranges";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  715  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  716  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  717  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  718  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  719  	br->sector = 0;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  720  	br->type = UNCHANGED;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  721  	rb_link_node(&br->node, bc->ranges.rb_node,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  722  		     &bc->ranges.rb_node->rb_left);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  723  	rb_insert_color(&br->node, &bc->ranges);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  724  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  725  	ti->discards_supported = true;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  726  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  727  	return 0;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  728  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  729  bad:
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  730  	dm_bow_dtr(ti);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  731  	return ret;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  732  }
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  733  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
