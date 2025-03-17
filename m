Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E29204F9B
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742253997; cv=none; b=PR6q5twi+Rc2bHuAcdexyQ9Eq18Uy5J0agPH6dMHsNS9FoZy9/9/CMPIK5DFWkzeS41FgMjz8knMIUWKsW1s2u0WZ0NmnfQmbiBugZuyIGbemHWLqzxNzmYjxCphCndSYgcVO9Y00T3JVKOdisDoUTlHlepBR6dU89m+wHqT3V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742253997; c=relaxed/simple;
	bh=YmOHSiyHzkFHIFb04hD6Bzsx28xbw+TgflZif2pNAM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=il/qhOcCLhL5MQWUzeemAI91madAYqMtrq+5RNxbFYs2FoLs7sDwfRbtkjN3BccMMFUpqZibanTpd8RUeHTzSUXmqEL6kyWvhCH0eZlxbDHzA2xCvTfJcPe7+4gN5TdkJKyM0JOD2COYQDxCxtkoeqlO5iQ3dST2Gb169pjJOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKE5F8Z9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKE5F8Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742253995; x=1773789995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmOHSiyHzkFHIFb04hD6Bzsx28xbw+TgflZif2pNAM0=;
  b=nKE5F8Z9023W4g0nMPvWwp/+Z78uQ4G4RvbAAMGpJ+qw2tIiLy9d1erf
   19t+YUQtT6kLqJl6VkMuIHyHPjdtj11JCsikOe1pzv+HR8Wr66HBO64NI
   dhX2swUjLDuFgtXhiFP1kvqrJzht6Ri1eckSCGZBOZhBnZHFvq/J9jnbB
   yfgJISD0XHktL9neztT+7NQDZ9enohOdE+h0NdwkMTrCao0qR4TqSxVaF
   K+982ZeqBH++h6+UiOZcrHf4VfO8zHlCI9jAF/CuUB3BnhzM73ZjeVNId
   LJmlRz0P4AUh4TIH3xfoOC3wtYAGsfR8onK5wD+Wy7EFWsQkEDK7v3WbR
   g==;
X-CSE-ConnectionGUID: mbwVg4HDSSC+/dQjSbY5/Q==
X-CSE-MsgGUID: +tnl9mtqTfGfEPdbvvtUGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68728152"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="68728152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 16:26:34 -0700
X-CSE-ConnectionGUID: XlyQ6TpzTZ6etHs/2aX9vg==
X-CSE-MsgGUID: Tu8UwELFSaeoWWI/6Yzwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="159247356"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Mar 2025 16:26:33 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuJqo-000DDp-23;
	Mon, 17 Mar 2025 23:26:30 +0000
Date: Tue, 18 Mar 2025 07:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/brd.c:377 brd_alloc() warn: passing positive error
 code '(-17),(-12)' to 'PTR_ERR'
Message-ID: <202503180740.NaO98KaS-lkp@intel.com>
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
head:   4701f33a10702d5fc577c32434eb62adde0a1ae1
commit: 826cc42adf44930a633d11a5993676d85ddb0842 brd: defer automatic disk creation until module initialization succeeds
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250318/202503180740.NaO98KaS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503180740.NaO98KaS-lkp@intel.com/

smatch warnings:
drivers/block/brd.c:377 brd_alloc() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

vim +377 drivers/block/brd.c

826cc42adf4493 Yang Erkun        2024-10-30  352  
7f9b348cb5e942 Christoph Hellwig 2021-05-21  353  static int brd_alloc(int i)
9db5579be4bb53 Nicholas Piggin   2008-02-08  354  {
9db5579be4bb53 Nicholas Piggin   2008-02-08  355  	struct brd_device *brd;
9db5579be4bb53 Nicholas Piggin   2008-02-08  356  	struct gendisk *disk;
f4be591f1436af Calvin Owens      2021-04-16  357  	char buf[DISK_NAME_LEN];
e1528830bd4ebf Luis Chamberlain  2021-10-15  358  	int err = -ENOMEM;
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  359  	struct queue_limits lim = {
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  360  		/*
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  361  		 * This is so fdisk will align partitions on 4k, because of
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  362  		 * direct_access API needing 4k alignment, returning a PFN
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  363  		 * (This is only a problem on very small devices <= 4M,
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  364  		 *  otherwise fdisk will align on 1M. Regardless this call
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  365  		 *  is harmless)
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  366  		 */
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  367  		.physical_block_size	= PAGE_SIZE,
9ead7efc6f3f2b Keith Busch       2024-04-29  368  		.max_hw_discard_sectors	= UINT_MAX,
9ead7efc6f3f2b Keith Busch       2024-04-29  369  		.max_discard_segments	= 1,
9ead7efc6f3f2b Keith Busch       2024-04-29  370  		.discard_granularity	= PAGE_SIZE,
f76af42f8bf13d Christoph Hellwig 2024-06-17  371  		.features		= BLK_FEAT_SYNCHRONOUS |
f76af42f8bf13d Christoph Hellwig 2024-06-17  372  					  BLK_FEAT_NOWAIT,
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  373  	};
9db5579be4bb53 Nicholas Piggin   2008-02-08  374  
826cc42adf4493 Yang Erkun        2024-10-30  375  	brd = brd_find_or_alloc_device(i);
826cc42adf4493 Yang Erkun        2024-10-30  376  	if (IS_ERR(brd))
826cc42adf4493 Yang Erkun        2024-10-30 @377  		return PTR_ERR(brd);
f7bf35862477d6 Tetsuo Handa      2021-09-07  378  
786bb02458819d Pankaj Raghav     2023-05-11  379  	xa_init(&brd->brd_pages);
9db5579be4bb53 Nicholas Piggin   2008-02-08  380  
f4be591f1436af Calvin Owens      2021-04-16  381  	snprintf(buf, DISK_NAME_LEN, "ram%d", i);
f4be591f1436af Calvin Owens      2021-04-16  382  	if (!IS_ERR_OR_NULL(brd_debugfs_dir))
f4be591f1436af Calvin Owens      2021-04-16  383  		debugfs_create_u64(buf, 0444, brd_debugfs_dir,
f4be591f1436af Calvin Owens      2021-04-16  384  				&brd->brd_nr_pages);
f4be591f1436af Calvin Owens      2021-04-16  385  
b5baaba4ce5c8a Christoph Hellwig 2024-02-15  386  	disk = brd->brd_disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
74fa8f9c553f7b Christoph Hellwig 2024-02-15  387  	if (IS_ERR(disk)) {
74fa8f9c553f7b Christoph Hellwig 2024-02-15  388  		err = PTR_ERR(disk);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  389  		goto out_free_dev;
74fa8f9c553f7b Christoph Hellwig 2024-02-15  390  	}
9db5579be4bb53 Nicholas Piggin   2008-02-08  391  	disk->major		= RAMDISK_MAJOR;
937af5ecd0591e Boaz Harrosh      2015-01-07  392  	disk->first_minor	= i * max_part;
7f9b348cb5e942 Christoph Hellwig 2021-05-21  393  	disk->minors		= max_part;
9db5579be4bb53 Nicholas Piggin   2008-02-08  394  	disk->fops		= &brd_fops;
9db5579be4bb53 Nicholas Piggin   2008-02-08  395  	disk->private_data	= brd;
e55e1b4831563e Wolfram Sang      2022-08-18  396  	strscpy(disk->disk_name, buf, DISK_NAME_LEN);
9db5579be4bb53 Nicholas Piggin   2008-02-08  397  	set_capacity(disk, rd_size * 2);
9db5579be4bb53 Nicholas Piggin   2008-02-08  398  	
e1528830bd4ebf Luis Chamberlain  2021-10-15  399  	err = add_disk(disk);
e1528830bd4ebf Luis Chamberlain  2021-10-15  400  	if (err)
e1528830bd4ebf Luis Chamberlain  2021-10-15  401  		goto out_cleanup_disk;
316ba5736c9caa SeongJae Park     2018-05-03  402  
7f9b348cb5e942 Christoph Hellwig 2021-05-21  403  	return 0;
9db5579be4bb53 Nicholas Piggin   2008-02-08  404  
e1528830bd4ebf Luis Chamberlain  2021-10-15  405  out_cleanup_disk:
8b9ab62662048a Christoph Hellwig 2022-06-19  406  	put_disk(disk);
9db5579be4bb53 Nicholas Piggin   2008-02-08  407  out_free_dev:
826cc42adf4493 Yang Erkun        2024-10-30  408  	brd_free_device(brd);
e1528830bd4ebf Luis Chamberlain  2021-10-15  409  	return err;
9db5579be4bb53 Nicholas Piggin   2008-02-08  410  }
9db5579be4bb53 Nicholas Piggin   2008-02-08  411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
