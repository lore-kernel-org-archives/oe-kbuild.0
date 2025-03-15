Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A5197A8E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742072068; cv=none; b=c5RE1K1+OX495fkI2udawLjOJxzRI9Y9ucoddFllwObuj2r4F99IL5FSULl6xS3gTNEFk7sqWqMub3qQqWqLOaFNwjP6br3CYzgp15fq5mXpvgyLaig/1Vv7C4wgw0zms3f+WlLmpUSMFwEMaOsuMU626T0lRDQvlH9MMJRxdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742072068; c=relaxed/simple;
	bh=rBjctBJDcg7l0gKm7E93RVf/JBRtUgitfXplAQ/BEww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pb0MRLSOieB0LyBHW3jfaZs+HbdDyVjI9L0pLx44sx2Nbi9Tge89nmqGAMqadDHCjU8e9j17Aqx8kr/3VaqNEDJjtSrEyx0CqUD+50OcVzuxToTGrgpjeThZZW4wxHwOZ8e/QBPaPZpkXroyrd0U9swjMXLTJektKTOj39PKY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/f//zpd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/f//zpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742072066; x=1773608066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rBjctBJDcg7l0gKm7E93RVf/JBRtUgitfXplAQ/BEww=;
  b=N/f//zpd9fDzZIYXQvgjF5UWyEbc6OiXEAxsKhiaTf2B/MCheolEwNom
   zng2oHOGNTZCrBYMArjAuoBZHtzKnWhEXbS9jZoQJ2/9oqHfXlsmF5une
   IgQ8CeIuuSQXXH18J42bvo+ubWeB5oQ6vcamJ3PuGHZ+UT6krVnYkXkYd
   V3G3Ok2V+WIqpW0qEoHgfRpKqqd3hE7imjLuDoEcVqU0FYBHejxzXE6BM
   seqIUB7UqOre01CvJjjstfUlYCED/yvUsK/gpYZasbORk1QdZfvRDIvCQ
   1pirt9ks98OG6V9HIAOl/4uh8nTgDd+ezK5PFtoyFcMqz4oJf+UsQ0az1
   w==;
X-CSE-ConnectionGUID: URQoIQHPQR6n1ktDMiHyfw==
X-CSE-MsgGUID: UWNeunhJTX6+UGde75M+nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43074921"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43074921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 13:54:25 -0700
X-CSE-ConnectionGUID: 6/o2RcwhQrCfFr0SHQFQQw==
X-CSE-MsgGUID: E3MByjpqRYq66oG4HucKfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126222299"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Mar 2025 13:54:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttYWT-000Be7-36;
	Sat, 15 Mar 2025 20:54:21 +0000
Date: Sun, 16 Mar 2025 04:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/brd.c:377 brd_alloc() warn: passing positive error
 code '(-17),(-12)' to 'PTR_ERR'
Message-ID: <202503160430.qAqqQLLc-lkp@intel.com>
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
TO: Yang Erkun <yangerkun@huawei.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3571e8b091f4270d869dda7a6cc43616c6ad6897
commit: 826cc42adf44930a633d11a5993676d85ddb0842 brd: defer automatic disk creation until module initialization succeeds
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503160430.qAqqQLLc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503160430.qAqqQLLc-lkp@intel.com/

smatch warnings:
drivers/block/brd.c:377 brd_alloc() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

vim +377 drivers/block/brd.c

826cc42adf44930 Yang Erkun        2024-10-30  352  
7f9b348cb5e9425 Christoph Hellwig 2021-05-21  353  static int brd_alloc(int i)
9db5579be4bb532 Nicholas Piggin   2008-02-08  354  {
9db5579be4bb532 Nicholas Piggin   2008-02-08  355  	struct brd_device *brd;
9db5579be4bb532 Nicholas Piggin   2008-02-08  356  	struct gendisk *disk;
f4be591f1436aff Calvin Owens      2021-04-16  357  	char buf[DISK_NAME_LEN];
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  358  	int err = -ENOMEM;
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  359  	struct queue_limits lim = {
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  360  		/*
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  361  		 * This is so fdisk will align partitions on 4k, because of
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  362  		 * direct_access API needing 4k alignment, returning a PFN
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  363  		 * (This is only a problem on very small devices <= 4M,
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  364  		 *  otherwise fdisk will align on 1M. Regardless this call
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  365  		 *  is harmless)
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  366  		 */
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  367  		.physical_block_size	= PAGE_SIZE,
9ead7efc6f3f2b4 Keith Busch       2024-04-29  368  		.max_hw_discard_sectors	= UINT_MAX,
9ead7efc6f3f2b4 Keith Busch       2024-04-29  369  		.max_discard_segments	= 1,
9ead7efc6f3f2b4 Keith Busch       2024-04-29  370  		.discard_granularity	= PAGE_SIZE,
f76af42f8bf13d2 Christoph Hellwig 2024-06-17  371  		.features		= BLK_FEAT_SYNCHRONOUS |
f76af42f8bf13d2 Christoph Hellwig 2024-06-17  372  					  BLK_FEAT_NOWAIT,
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  373  	};
9db5579be4bb532 Nicholas Piggin   2008-02-08  374  
826cc42adf44930 Yang Erkun        2024-10-30  375  	brd = brd_find_or_alloc_device(i);
826cc42adf44930 Yang Erkun        2024-10-30  376  	if (IS_ERR(brd))
826cc42adf44930 Yang Erkun        2024-10-30 @377  		return PTR_ERR(brd);
f7bf35862477d6d Tetsuo Handa      2021-09-07  378  
786bb02458819df Pankaj Raghav     2023-05-11  379  	xa_init(&brd->brd_pages);
9db5579be4bb532 Nicholas Piggin   2008-02-08  380  
f4be591f1436aff Calvin Owens      2021-04-16  381  	snprintf(buf, DISK_NAME_LEN, "ram%d", i);
f4be591f1436aff Calvin Owens      2021-04-16  382  	if (!IS_ERR_OR_NULL(brd_debugfs_dir))
f4be591f1436aff Calvin Owens      2021-04-16  383  		debugfs_create_u64(buf, 0444, brd_debugfs_dir,
f4be591f1436aff Calvin Owens      2021-04-16  384  				&brd->brd_nr_pages);
f4be591f1436aff Calvin Owens      2021-04-16  385  
b5baaba4ce5c8a0 Christoph Hellwig 2024-02-15  386  	disk = brd->brd_disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
74fa8f9c553f7b5 Christoph Hellwig 2024-02-15  387  	if (IS_ERR(disk)) {
74fa8f9c553f7b5 Christoph Hellwig 2024-02-15  388  		err = PTR_ERR(disk);
7f9b348cb5e9425 Christoph Hellwig 2021-05-21  389  		goto out_free_dev;
74fa8f9c553f7b5 Christoph Hellwig 2024-02-15  390  	}
9db5579be4bb532 Nicholas Piggin   2008-02-08  391  	disk->major		= RAMDISK_MAJOR;
937af5ecd0591e8 Boaz Harrosh      2015-01-07  392  	disk->first_minor	= i * max_part;
7f9b348cb5e9425 Christoph Hellwig 2021-05-21  393  	disk->minors		= max_part;
9db5579be4bb532 Nicholas Piggin   2008-02-08  394  	disk->fops		= &brd_fops;
9db5579be4bb532 Nicholas Piggin   2008-02-08  395  	disk->private_data	= brd;
e55e1b4831563e5 Wolfram Sang      2022-08-18  396  	strscpy(disk->disk_name, buf, DISK_NAME_LEN);
9db5579be4bb532 Nicholas Piggin   2008-02-08  397  	set_capacity(disk, rd_size * 2);
9db5579be4bb532 Nicholas Piggin   2008-02-08  398  	
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  399  	err = add_disk(disk);
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  400  	if (err)
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  401  		goto out_cleanup_disk;
316ba5736c9caa5 SeongJae Park     2018-05-03  402  
7f9b348cb5e9425 Christoph Hellwig 2021-05-21  403  	return 0;
9db5579be4bb532 Nicholas Piggin   2008-02-08  404  
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  405  out_cleanup_disk:
8b9ab62662048a3 Christoph Hellwig 2022-06-19  406  	put_disk(disk);
9db5579be4bb532 Nicholas Piggin   2008-02-08  407  out_free_dev:
826cc42adf44930 Yang Erkun        2024-10-30  408  	brd_free_device(brd);
e1528830bd4ebf4 Luis Chamberlain  2021-10-15  409  	return err;
9db5579be4bb532 Nicholas Piggin   2008-02-08  410  }
9db5579be4bb532 Nicholas Piggin   2008-02-08  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
