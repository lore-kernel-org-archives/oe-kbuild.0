Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A596331222
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343961; cv=none; b=D1iiEmMx8vLw4ggTwKbHdI2Lw12EhMa5qXAsipomEQi9e5j6GlFyjP3zvjdn0fZwSapqG4XcmLtGqlVw9qEpd621FJtFWLVQr6fBmBsEMPJUc+sOQHV5aDxZRW9Cz3uj+bnQXv4IYxx3oCSjEdZg/0rs4Lu2/QHaXAvcfN1vIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343961; c=relaxed/simple;
	bh=azxihStJenmlpSgVBo8fUe672yJghctiiXRS0CzgLgo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QqrUsBQ4Kov4TXekRINIEFoqdz4NXp2zb/EAKfbtCx/nZgu17iwHruP63Y/RjHIwZz9lFgYhyLsKrP1MkgCbB01SKmboTp8UdjaDo40zjWSVg7v+yxdt8TLEIUkpY6wRL41mUVkCmD4+Va/zwAloIKi7ZtTQcqlSg+vykf5l/Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPJg3MLD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPJg3MLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783343958; x=1814879958;
  h=date:from:to:cc:subject:message-id;
  bh=azxihStJenmlpSgVBo8fUe672yJghctiiXRS0CzgLgo=;
  b=RPJg3MLDHjGO5zpKpAQCSTXYWGGNAb6HP0FPQhgnObubIdaJZo54S2bn
   1M2zzo9M/mbpFy3zMhfPJButPGxoguAE8b3f9zHWKG2+19wLs/sKUh/a8
   D5+QPubh/fnHxRwKAleIPdGzpqmdTQ2Trx4CiBNsFju4oQDdCJDxNIRoR
   TqpGL9AiTgtWp01HJsinxEv0Opm5DpvgTAfFP7KP8iIs1QjlprkD2vm7O
   cY3YXJT70Nxv/OMIY7eEmYWhnp+alqjyatv8enscZ1mAzDohAQKYV2nb+
   X0T1bbu8TIF7qdJJnucDEsmNAyfRSoS90naGOZ5bU17Z5PL6Ty/70QL96
   g==;
X-CSE-ConnectionGUID: QLlbQE4NR5Gy1g1++5PP7A==
X-CSE-MsgGUID: klqvnmUeQwiJ+sEhkxGArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101522030"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101522030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:19:17 -0700
X-CSE-ConnectionGUID: ZHZ3cr3wT+OReRTgOHU1lg==
X-CSE-MsgGUID: V4GVy2iES2OMYDAzY+OT7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251964109"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jul 2026 06:19:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgjE1-00000000ENu-1mp8;
	Mon, 06 Jul 2026 13:19:06 +0000
Date: Mon, 06 Jul 2026 21:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:7.2-dango 169/215]
 drivers/block/fitblk.c:219:2-8: preceding lock on line 217
Message-ID: <202607062129.yS8zeRXo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: fded98d6b2974396d028a155643d0d49018fb1d4 [169/215] block: add uImage.FIT subimage block driver
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r064-20260706 (https://download.01.org/0day-ci/archive/20260706/202607062129.yS8zeRXo-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607062129.yS8zeRXo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/fitblk.c:219:2-8: preceding lock on line 217
--
>> drivers/block/fitblk.c:633:3-8: No need to set .owner here. The core will do it.
--
>> drivers/block/fitblk.c:407:4-5: Unneeded semicolon
--
>> drivers/block/fitblk.c:579:10-14: opportunity for str_plural(slot)

vim +219 drivers/block/fitblk.c

fded98d6b29743 Daniel Golle 2022-11-16  207  
fded98d6b29743 Daniel Golle 2022-11-16  208  static int add_fit_subimage_device(struct file *bdev_file,
fded98d6b29743 Daniel Golle 2022-11-16  209  				   unsigned int slot, sector_t start_sect,
fded98d6b29743 Daniel Golle 2022-11-16  210  				   sector_t nr_sect, bool readonly)
fded98d6b29743 Daniel Golle 2022-11-16  211  {
fded98d6b29743 Daniel Golle 2022-11-16  212  	struct block_device *bdev = file_bdev(bdev_file);
fded98d6b29743 Daniel Golle 2022-11-16  213  	struct fitblk *fitblk;
fded98d6b29743 Daniel Golle 2022-11-16  214  	struct gendisk *disk;
fded98d6b29743 Daniel Golle 2022-11-16  215  	int err;
fded98d6b29743 Daniel Golle 2022-11-16  216  
fded98d6b29743 Daniel Golle 2022-11-16 @217  	mutex_lock(&devices_mutex);
fded98d6b29743 Daniel Golle 2022-11-16  218  	if (!refcount_inc_not_zero(&num_devs))
fded98d6b29743 Daniel Golle 2022-11-16 @219  		return -EBADF;
fded98d6b29743 Daniel Golle 2022-11-16  220  
fded98d6b29743 Daniel Golle 2022-11-16  221  	fitblk = kzalloc(sizeof(struct fitblk), GFP_KERNEL);
fded98d6b29743 Daniel Golle 2022-11-16  222  	if (!fitblk) {
fded98d6b29743 Daniel Golle 2022-11-16  223  		err = -ENOMEM;
fded98d6b29743 Daniel Golle 2022-11-16  224  		goto out_unlock;
fded98d6b29743 Daniel Golle 2022-11-16  225  	}
fded98d6b29743 Daniel Golle 2022-11-16  226  
fded98d6b29743 Daniel Golle 2022-11-16  227  	fitblk->bdev_file = bdev_file;
fded98d6b29743 Daniel Golle 2022-11-16  228  	fitblk->start_sect = start_sect;
fded98d6b29743 Daniel Golle 2022-11-16  229  	INIT_WORK(&fitblk->remove_work, fitblk_purge);
fded98d6b29743 Daniel Golle 2022-11-16  230  
fded98d6b29743 Daniel Golle 2022-11-16  231  	disk = blk_alloc_disk(&bdev->bd_disk->queue->limits, NUMA_NO_NODE);
fded98d6b29743 Daniel Golle 2022-11-16  232  	if (!disk) {
fded98d6b29743 Daniel Golle 2022-11-16  233  		err = -ENOMEM;
fded98d6b29743 Daniel Golle 2022-11-16  234  		goto out_free_fitblk;
fded98d6b29743 Daniel Golle 2022-11-16  235  	}
fded98d6b29743 Daniel Golle 2022-11-16  236  
fded98d6b29743 Daniel Golle 2022-11-16  237  	disk->first_minor = 0;
fded98d6b29743 Daniel Golle 2022-11-16  238  	disk->flags = bdev->bd_disk->flags | GENHD_FL_NO_PART;
fded98d6b29743 Daniel Golle 2022-11-16  239  	disk->fops = &fitblk_fops;
fded98d6b29743 Daniel Golle 2022-11-16  240  	disk->private_data = fitblk;
fded98d6b29743 Daniel Golle 2022-11-16  241  	if (readonly) {
fded98d6b29743 Daniel Golle 2022-11-16  242  		set_disk_ro(disk, 1);
fded98d6b29743 Daniel Golle 2022-11-16  243  		snprintf(disk->disk_name, sizeof(disk->disk_name), FIT_DEVICE_PREFIX "%u", slot);
fded98d6b29743 Daniel Golle 2022-11-16  244  	} else {
fded98d6b29743 Daniel Golle 2022-11-16  245  		strcpy(disk->disk_name, FIT_DEVICE_PREFIX "rw");
fded98d6b29743 Daniel Golle 2022-11-16  246  	}
fded98d6b29743 Daniel Golle 2022-11-16  247  
fded98d6b29743 Daniel Golle 2022-11-16  248  	set_capacity(disk, nr_sect);
fded98d6b29743 Daniel Golle 2022-11-16  249  	disk->queue->queue_flags = bdev->bd_disk->queue->queue_flags;
fded98d6b29743 Daniel Golle 2022-11-16  250  
fded98d6b29743 Daniel Golle 2022-11-16  251  	fitblk->disk = disk;
fded98d6b29743 Daniel Golle 2022-11-16  252  	fitblk->pdev = platform_device_alloc(disk->disk_name, PLATFORM_DEVID_NONE);
fded98d6b29743 Daniel Golle 2022-11-16  253  	if (!fitblk->pdev) {
fded98d6b29743 Daniel Golle 2022-11-16  254  		err = -ENOMEM;
fded98d6b29743 Daniel Golle 2022-11-16  255  		goto out_cleanup_disk;
fded98d6b29743 Daniel Golle 2022-11-16  256  	}
fded98d6b29743 Daniel Golle 2022-11-16  257  
fded98d6b29743 Daniel Golle 2022-11-16  258  	fitblk->pdev->dev.parent = &pdev->dev;
fded98d6b29743 Daniel Golle 2022-11-16  259  	err = platform_device_add(fitblk->pdev);
fded98d6b29743 Daniel Golle 2022-11-16  260  	if (err)
fded98d6b29743 Daniel Golle 2022-11-16  261  		goto out_put_pdev;
fded98d6b29743 Daniel Golle 2022-11-16  262  
fded98d6b29743 Daniel Golle 2022-11-16  263  	err = device_add_disk(&fitblk->pdev->dev, disk, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  264  	if (err)
fded98d6b29743 Daniel Golle 2022-11-16  265  		goto out_del_pdev;
fded98d6b29743 Daniel Golle 2022-11-16  266  
fded98d6b29743 Daniel Golle 2022-11-16  267  	if (!ROOT_DEV)
fded98d6b29743 Daniel Golle 2022-11-16  268  		ROOT_DEV = disk->part0->bd_dev;
fded98d6b29743 Daniel Golle 2022-11-16  269  
fded98d6b29743 Daniel Golle 2022-11-16  270  	list_add_tail(&fitblk->list, &fitblk_devices);
fded98d6b29743 Daniel Golle 2022-11-16  271  
fded98d6b29743 Daniel Golle 2022-11-16  272  	mutex_unlock(&devices_mutex);
fded98d6b29743 Daniel Golle 2022-11-16  273  
fded98d6b29743 Daniel Golle 2022-11-16  274  	return 0;
fded98d6b29743 Daniel Golle 2022-11-16  275  
fded98d6b29743 Daniel Golle 2022-11-16  276  out_del_pdev:
fded98d6b29743 Daniel Golle 2022-11-16  277  	platform_device_del(fitblk->pdev);
fded98d6b29743 Daniel Golle 2022-11-16  278  out_put_pdev:
fded98d6b29743 Daniel Golle 2022-11-16  279  	platform_device_put(fitblk->pdev);
fded98d6b29743 Daniel Golle 2022-11-16  280  out_cleanup_disk:
fded98d6b29743 Daniel Golle 2022-11-16  281  	put_disk(disk);
fded98d6b29743 Daniel Golle 2022-11-16  282  out_free_fitblk:
fded98d6b29743 Daniel Golle 2022-11-16  283  	kfree(fitblk);
fded98d6b29743 Daniel Golle 2022-11-16  284  out_unlock:
fded98d6b29743 Daniel Golle 2022-11-16  285  	refcount_dec(&num_devs);
fded98d6b29743 Daniel Golle 2022-11-16  286  	mutex_unlock(&devices_mutex);
fded98d6b29743 Daniel Golle 2022-11-16  287  	return err;
fded98d6b29743 Daniel Golle 2022-11-16  288  }
fded98d6b29743 Daniel Golle 2022-11-16  289  
fded98d6b29743 Daniel Golle 2022-11-16  290  static void fitblk_mark_dead(struct block_device *bdev, bool surprise)
fded98d6b29743 Daniel Golle 2022-11-16  291  {
fded98d6b29743 Daniel Golle 2022-11-16  292  	struct list_head *n, *tmp;
fded98d6b29743 Daniel Golle 2022-11-16  293  	struct fitblk *fitblk;
fded98d6b29743 Daniel Golle 2022-11-16  294  
fded98d6b29743 Daniel Golle 2022-11-16  295  	mutex_lock(&devices_mutex);
fded98d6b29743 Daniel Golle 2022-11-16  296  	list_for_each_safe(n, tmp, &fitblk_devices) {
fded98d6b29743 Daniel Golle 2022-11-16  297  		fitblk = list_entry(n, struct fitblk, list);
fded98d6b29743 Daniel Golle 2022-11-16  298  		if (file_bdev(fitblk->bdev_file) != bdev)
fded98d6b29743 Daniel Golle 2022-11-16  299  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  300  
fded98d6b29743 Daniel Golle 2022-11-16  301  		fitblk->dead = true;
fded98d6b29743 Daniel Golle 2022-11-16  302  		list_del(&fitblk->list);
fded98d6b29743 Daniel Golle 2022-11-16  303  		/* removal needs to be deferred to avoid deadlock */
fded98d6b29743 Daniel Golle 2022-11-16  304  		schedule_work(&fitblk->remove_work);
fded98d6b29743 Daniel Golle 2022-11-16  305  	}
fded98d6b29743 Daniel Golle 2022-11-16  306  	mutex_unlock(&devices_mutex);
fded98d6b29743 Daniel Golle 2022-11-16  307  }
fded98d6b29743 Daniel Golle 2022-11-16  308  
fded98d6b29743 Daniel Golle 2022-11-16  309  static const struct blk_holder_ops fitblk_hops = {
fded98d6b29743 Daniel Golle 2022-11-16  310  	.mark_dead = fitblk_mark_dead,
fded98d6b29743 Daniel Golle 2022-11-16  311  };
fded98d6b29743 Daniel Golle 2022-11-16  312  
fded98d6b29743 Daniel Golle 2022-11-16  313  static int parse_fit_on_dev(struct device *dev)
fded98d6b29743 Daniel Golle 2022-11-16  314  {
fded98d6b29743 Daniel Golle 2022-11-16  315  	struct file *bdev_file;
fded98d6b29743 Daniel Golle 2022-11-16  316  	struct block_device *bdev;
fded98d6b29743 Daniel Golle 2022-11-16  317  	struct address_space *mapping;
fded98d6b29743 Daniel Golle 2022-11-16  318  	struct folio *folio;
fded98d6b29743 Daniel Golle 2022-11-16  319  	pgoff_t f_index = 0;
fded98d6b29743 Daniel Golle 2022-11-16  320  	size_t bytes_left, bytes_to_copy;
fded98d6b29743 Daniel Golle 2022-11-16  321  	void *pre_fit, *fit, *fit_c;
fded98d6b29743 Daniel Golle 2022-11-16  322  	u64 dsize, dsectors, imgmaxsect = 0;
fded98d6b29743 Daniel Golle 2022-11-16  323  	u32 size, image_pos, image_len;
fded98d6b29743 Daniel Golle 2022-11-16  324  	const __be32 *image_offset_be, *image_len_be, *image_pos_be;
fded98d6b29743 Daniel Golle 2022-11-16  325  	int ret = 0, node, images, config;
fded98d6b29743 Daniel Golle 2022-11-16  326  	const char *image_name, *image_type, *image_description,
fded98d6b29743 Daniel Golle 2022-11-16  327  		*config_default, *config_description, *config_loadables;
fded98d6b29743 Daniel Golle 2022-11-16  328  	u32 image_name_len, image_type_len, image_description_len,
fded98d6b29743 Daniel Golle 2022-11-16  329  		bootconf_len, config_default_len, config_description_len,
fded98d6b29743 Daniel Golle 2022-11-16  330  		config_loadables_len;
fded98d6b29743 Daniel Golle 2022-11-16  331  	sector_t start_sect, nr_sects;
fded98d6b29743 Daniel Golle 2022-11-16  332  	struct device_node *np = NULL;
fded98d6b29743 Daniel Golle 2022-11-16  333  	const char *bootconf_c;
fded98d6b29743 Daniel Golle 2022-11-16  334  	const char *loadable;
fded98d6b29743 Daniel Golle 2022-11-16  335  	char *bootconf = NULL, *bootconf_term;
fded98d6b29743 Daniel Golle 2022-11-16  336  	bool found;
fded98d6b29743 Daniel Golle 2022-11-16  337  	int loadables_rem_len, loadable_len;
fded98d6b29743 Daniel Golle 2022-11-16  338  	u16 loadcnt;
fded98d6b29743 Daniel Golle 2022-11-16  339  	unsigned int slot = 0;
fded98d6b29743 Daniel Golle 2022-11-16  340  
fded98d6b29743 Daniel Golle 2022-11-16  341  	/* Exclusive open the block device to receive holder notifications */
fded98d6b29743 Daniel Golle 2022-11-16  342  	bdev_file = bdev_file_open_by_dev(dev->devt, BLK_OPEN_READ | BLK_OPEN_RESTRICT_WRITES,
fded98d6b29743 Daniel Golle 2022-11-16  343  					  &_fitblk_claim_ptr, &fitblk_hops);
fded98d6b29743 Daniel Golle 2022-11-16  344  	if (!bdev_file)
fded98d6b29743 Daniel Golle 2022-11-16  345  		return -ENODEV;
fded98d6b29743 Daniel Golle 2022-11-16  346  
fded98d6b29743 Daniel Golle 2022-11-16  347  	if (IS_ERR(bdev_file))
fded98d6b29743 Daniel Golle 2022-11-16  348  		return PTR_ERR(bdev_file);
fded98d6b29743 Daniel Golle 2022-11-16  349  
fded98d6b29743 Daniel Golle 2022-11-16  350  	bdev = file_bdev(bdev_file);
fded98d6b29743 Daniel Golle 2022-11-16  351  	mapping = bdev_file->f_mapping;
fded98d6b29743 Daniel Golle 2022-11-16  352  
fded98d6b29743 Daniel Golle 2022-11-16  353  	/* map first page */
fded98d6b29743 Daniel Golle 2022-11-16  354  	folio = read_mapping_folio(mapping, f_index++, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  355  	if (IS_ERR(folio)) {
fded98d6b29743 Daniel Golle 2022-11-16  356  		ret = PTR_ERR(folio);
fded98d6b29743 Daniel Golle 2022-11-16  357  		goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16  358  	}
fded98d6b29743 Daniel Golle 2022-11-16  359  	pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
fded98d6b29743 Daniel Golle 2022-11-16  360  
fded98d6b29743 Daniel Golle 2022-11-16  361  	/* uImage.FIT is based on flattened device tree structure */
fded98d6b29743 Daniel Golle 2022-11-16  362  	if (fdt_check_header(pre_fit)) {
fded98d6b29743 Daniel Golle 2022-11-16  363  		ret = -EINVAL;
fded98d6b29743 Daniel Golle 2022-11-16  364  		folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  365  		goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16  366  	}
fded98d6b29743 Daniel Golle 2022-11-16  367  
fded98d6b29743 Daniel Golle 2022-11-16  368  	size = fdt_totalsize(pre_fit);
fded98d6b29743 Daniel Golle 2022-11-16  369  
fded98d6b29743 Daniel Golle 2022-11-16  370  	if (size > PAGE_SIZE * FIT_MAX_PAGES) {
fded98d6b29743 Daniel Golle 2022-11-16  371  		ret = -EOPNOTSUPP;
fded98d6b29743 Daniel Golle 2022-11-16  372  		folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  373  		goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16  374  	}
fded98d6b29743 Daniel Golle 2022-11-16  375  
fded98d6b29743 Daniel Golle 2022-11-16  376  	/* acquire disk size */
fded98d6b29743 Daniel Golle 2022-11-16  377  	dsectors = bdev_nr_sectors(bdev);
fded98d6b29743 Daniel Golle 2022-11-16  378  	dsize = dsectors << SECTOR_SHIFT;
fded98d6b29743 Daniel Golle 2022-11-16  379  
fded98d6b29743 Daniel Golle 2022-11-16  380  	/* abort if FIT structure is larger than disk or partition size */
fded98d6b29743 Daniel Golle 2022-11-16  381  	if (size >= dsize) {
fded98d6b29743 Daniel Golle 2022-11-16  382  		ret = -EFBIG;
fded98d6b29743 Daniel Golle 2022-11-16  383  		folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  384  		goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16  385  	}
fded98d6b29743 Daniel Golle 2022-11-16  386  
fded98d6b29743 Daniel Golle 2022-11-16  387  	fit = kmalloc(size, GFP_KERNEL);
fded98d6b29743 Daniel Golle 2022-11-16  388  	if (!fit) {
fded98d6b29743 Daniel Golle 2022-11-16  389  		ret = -ENOMEM;
fded98d6b29743 Daniel Golle 2022-11-16  390  		folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  391  		goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16  392  	}
fded98d6b29743 Daniel Golle 2022-11-16  393  
fded98d6b29743 Daniel Golle 2022-11-16  394  	bytes_left = size;
fded98d6b29743 Daniel Golle 2022-11-16  395  	fit_c = fit;
fded98d6b29743 Daniel Golle 2022-11-16  396  	while (bytes_left > 0) {
fded98d6b29743 Daniel Golle 2022-11-16  397  		bytes_to_copy = min_t(size_t, bytes_left, folio_size(folio) - offset_in_folio(folio, 0));
fded98d6b29743 Daniel Golle 2022-11-16  398  		memcpy(fit_c, pre_fit, bytes_to_copy);
fded98d6b29743 Daniel Golle 2022-11-16  399  		fit_c += bytes_to_copy;
fded98d6b29743 Daniel Golle 2022-11-16  400  		bytes_left -= bytes_to_copy;
fded98d6b29743 Daniel Golle 2022-11-16  401  		if (bytes_left) {
fded98d6b29743 Daniel Golle 2022-11-16  402  			folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  403  			folio = read_mapping_folio(mapping, f_index++, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  404  			if (IS_ERR(folio)) {
fded98d6b29743 Daniel Golle 2022-11-16  405  				ret = PTR_ERR(folio);
fded98d6b29743 Daniel Golle 2022-11-16  406  				goto out_blkdev;
fded98d6b29743 Daniel Golle 2022-11-16 @407  			};
fded98d6b29743 Daniel Golle 2022-11-16  408  			pre_fit = folio_address(folio) + offset_in_folio(folio, 0);
fded98d6b29743 Daniel Golle 2022-11-16  409  		}
fded98d6b29743 Daniel Golle 2022-11-16  410  	}
fded98d6b29743 Daniel Golle 2022-11-16  411  	folio_put(folio);
fded98d6b29743 Daniel Golle 2022-11-16  412  
fded98d6b29743 Daniel Golle 2022-11-16  413  	/* set boot config node name U-Boot may have added to the device tree */
fded98d6b29743 Daniel Golle 2022-11-16  414  	np = of_find_node_by_path("/chosen");
fded98d6b29743 Daniel Golle 2022-11-16  415  	if (np) {
fded98d6b29743 Daniel Golle 2022-11-16  416  		bootconf_c = of_get_property(np, "u-boot,bootconf", &bootconf_len);
fded98d6b29743 Daniel Golle 2022-11-16  417  		if (bootconf_c && bootconf_len)
fded98d6b29743 Daniel Golle 2022-11-16  418  			bootconf = kmemdup_nul(bootconf_c, bootconf_len, GFP_KERNEL);
fded98d6b29743 Daniel Golle 2022-11-16  419  	}
fded98d6b29743 Daniel Golle 2022-11-16  420  
fded98d6b29743 Daniel Golle 2022-11-16  421  	if (bootconf) {
fded98d6b29743 Daniel Golle 2022-11-16  422  		bootconf_term = strchr(bootconf, '#');
fded98d6b29743 Daniel Golle 2022-11-16  423  		if (bootconf_term)
fded98d6b29743 Daniel Golle 2022-11-16  424  			*bootconf_term = '\0';
fded98d6b29743 Daniel Golle 2022-11-16  425  	}
fded98d6b29743 Daniel Golle 2022-11-16  426  
fded98d6b29743 Daniel Golle 2022-11-16  427  	/* find configuration path in uImage.FIT */
fded98d6b29743 Daniel Golle 2022-11-16  428  	config = fdt_path_offset(fit, FIT_CONFS_PATH);
fded98d6b29743 Daniel Golle 2022-11-16  429  	if (config < 0) {
fded98d6b29743 Daniel Golle 2022-11-16  430  		pr_err("FIT: Cannot find %s node: %d\n",
fded98d6b29743 Daniel Golle 2022-11-16  431  			FIT_CONFS_PATH, config);
fded98d6b29743 Daniel Golle 2022-11-16  432  		ret = -ENOENT;
fded98d6b29743 Daniel Golle 2022-11-16  433  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  434  	}
fded98d6b29743 Daniel Golle 2022-11-16  435  
fded98d6b29743 Daniel Golle 2022-11-16  436  	/* get default configuration node name */
fded98d6b29743 Daniel Golle 2022-11-16  437  	config_default =
fded98d6b29743 Daniel Golle 2022-11-16  438  		fdt_getprop(fit, config, FIT_DEFAULT_PROP, &config_default_len);
fded98d6b29743 Daniel Golle 2022-11-16  439  
fded98d6b29743 Daniel Golle 2022-11-16  440  	/* make sure we got either default or selected boot config node name */
fded98d6b29743 Daniel Golle 2022-11-16  441  	if (!config_default && !bootconf) {
fded98d6b29743 Daniel Golle 2022-11-16  442  		pr_err("FIT: Cannot find default configuration\n");
fded98d6b29743 Daniel Golle 2022-11-16  443  		ret = -ENOENT;
fded98d6b29743 Daniel Golle 2022-11-16  444  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  445  	}
fded98d6b29743 Daniel Golle 2022-11-16  446  
fded98d6b29743 Daniel Golle 2022-11-16  447  	/* find selected boot config node, fallback on default config node */
fded98d6b29743 Daniel Golle 2022-11-16  448  	node = fdt_subnode_offset(fit, config, bootconf ?: config_default);
fded98d6b29743 Daniel Golle 2022-11-16  449  	if (node < 0) {
fded98d6b29743 Daniel Golle 2022-11-16  450  		pr_err("FIT: Cannot find %s node: %d\n",
fded98d6b29743 Daniel Golle 2022-11-16  451  			bootconf ?: config_default, node);
fded98d6b29743 Daniel Golle 2022-11-16  452  		ret = -ENOENT;
fded98d6b29743 Daniel Golle 2022-11-16  453  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  454  	}
fded98d6b29743 Daniel Golle 2022-11-16  455  
fded98d6b29743 Daniel Golle 2022-11-16  456  	pr_info("FIT: Detected U-Boot %s\n", ubootver);
fded98d6b29743 Daniel Golle 2022-11-16  457  
fded98d6b29743 Daniel Golle 2022-11-16  458  	/* get selected configuration data */
fded98d6b29743 Daniel Golle 2022-11-16  459  	config_description =
fded98d6b29743 Daniel Golle 2022-11-16  460  		fdt_getprop(fit, node, FIT_DESC_PROP, &config_description_len);
fded98d6b29743 Daniel Golle 2022-11-16  461  	config_loadables = fdt_getprop(fit, node, FIT_LOADABLE_PROP,
fded98d6b29743 Daniel Golle 2022-11-16  462  				       &config_loadables_len);
fded98d6b29743 Daniel Golle 2022-11-16  463  
fded98d6b29743 Daniel Golle 2022-11-16  464  	pr_info("FIT: %s configuration: \"%.*s\"%s%.*s%s\n",
fded98d6b29743 Daniel Golle 2022-11-16  465  		bootconf ? "Selected" : "Default",
fded98d6b29743 Daniel Golle 2022-11-16  466  		bootconf ? bootconf_len : config_default_len,
fded98d6b29743 Daniel Golle 2022-11-16  467  		bootconf ?: config_default,
fded98d6b29743 Daniel Golle 2022-11-16  468  		config_description ? " (" : "",
fded98d6b29743 Daniel Golle 2022-11-16  469  		config_description ? config_description_len : 0,
fded98d6b29743 Daniel Golle 2022-11-16  470  		config_description ?: "",
fded98d6b29743 Daniel Golle 2022-11-16  471  		config_description ? ")" : "");
fded98d6b29743 Daniel Golle 2022-11-16  472  
fded98d6b29743 Daniel Golle 2022-11-16  473  	if (!config_loadables || !config_loadables_len) {
fded98d6b29743 Daniel Golle 2022-11-16  474  		pr_err("FIT: No loadables configured in \"%s\"\n",
fded98d6b29743 Daniel Golle 2022-11-16  475  			bootconf ?: config_default);
fded98d6b29743 Daniel Golle 2022-11-16  476  		ret = -ENOENT;
fded98d6b29743 Daniel Golle 2022-11-16  477  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  478  	}
fded98d6b29743 Daniel Golle 2022-11-16  479  
fded98d6b29743 Daniel Golle 2022-11-16  480  	/* get images path in uImage.FIT */
fded98d6b29743 Daniel Golle 2022-11-16  481  	images = fdt_path_offset(fit, FIT_IMAGES_PATH);
fded98d6b29743 Daniel Golle 2022-11-16  482  	if (images < 0) {
fded98d6b29743 Daniel Golle 2022-11-16  483  		pr_err("FIT: Cannot find %s node: %d\n", FIT_IMAGES_PATH, images);
fded98d6b29743 Daniel Golle 2022-11-16  484  		ret = -EINVAL;
fded98d6b29743 Daniel Golle 2022-11-16  485  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  486  	}
fded98d6b29743 Daniel Golle 2022-11-16  487  
fded98d6b29743 Daniel Golle 2022-11-16  488  	/* iterate over images in uImage.FIT */
fded98d6b29743 Daniel Golle 2022-11-16  489  	fdt_for_each_subnode(node, fit, images) {
fded98d6b29743 Daniel Golle 2022-11-16  490  		image_name = fdt_get_name(fit, node, &image_name_len);
fded98d6b29743 Daniel Golle 2022-11-16  491  		image_type = fdt_getprop(fit, node, FIT_TYPE_PROP, &image_type_len);
fded98d6b29743 Daniel Golle 2022-11-16  492  		image_offset_be = fdt_getprop(fit, node, FIT_DATA_OFFSET_PROP, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  493  		image_pos_be = fdt_getprop(fit, node, FIT_DATA_POSITION_PROP, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  494  		image_len_be = fdt_getprop(fit, node, FIT_DATA_SIZE_PROP, NULL);
fded98d6b29743 Daniel Golle 2022-11-16  495  
fded98d6b29743 Daniel Golle 2022-11-16  496  		if (!image_name || !image_type || !image_len_be ||
fded98d6b29743 Daniel Golle 2022-11-16  497  		    !image_name_len || !image_type_len)
fded98d6b29743 Daniel Golle 2022-11-16  498  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  499  
fded98d6b29743 Daniel Golle 2022-11-16  500  		image_len = be32_to_cpu(*image_len_be);
fded98d6b29743 Daniel Golle 2022-11-16  501  		if (!image_len)
fded98d6b29743 Daniel Golle 2022-11-16  502  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  503  
fded98d6b29743 Daniel Golle 2022-11-16  504  		if (image_offset_be)
fded98d6b29743 Daniel Golle 2022-11-16  505  			image_pos = be32_to_cpu(*image_offset_be) + size;
fded98d6b29743 Daniel Golle 2022-11-16  506  		else if (image_pos_be)
fded98d6b29743 Daniel Golle 2022-11-16  507  			image_pos = be32_to_cpu(*image_pos_be);
fded98d6b29743 Daniel Golle 2022-11-16  508  		else
fded98d6b29743 Daniel Golle 2022-11-16  509  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  510  
fded98d6b29743 Daniel Golle 2022-11-16  511  		image_description = fdt_getprop(fit, node, FIT_DESC_PROP,
fded98d6b29743 Daniel Golle 2022-11-16  512  						&image_description_len);
fded98d6b29743 Daniel Golle 2022-11-16  513  
fded98d6b29743 Daniel Golle 2022-11-16  514  		pr_info("FIT: %16s sub-image 0x%08x..0x%08x \"%.*s\"%s%.*s%s\n",
fded98d6b29743 Daniel Golle 2022-11-16  515  			image_type, image_pos, image_pos + image_len - 1,
fded98d6b29743 Daniel Golle 2022-11-16  516  			image_name_len, image_name, image_description ? " (" : "",
fded98d6b29743 Daniel Golle 2022-11-16  517  			image_description ? image_description_len : 0,
fded98d6b29743 Daniel Golle 2022-11-16  518  			image_description ?: "", image_description ? ") " : "");
fded98d6b29743 Daniel Golle 2022-11-16  519  
fded98d6b29743 Daniel Golle 2022-11-16  520  		/* only 'filesystem' images should be mapped as partitions */
fded98d6b29743 Daniel Golle 2022-11-16  521  		if (strncmp(image_type, FIT_FILESYSTEM_PROP, image_type_len))
fded98d6b29743 Daniel Golle 2022-11-16  522  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  523  
fded98d6b29743 Daniel Golle 2022-11-16  524  		/* check if sub-image is part of configured loadables */
fded98d6b29743 Daniel Golle 2022-11-16  525  		found = false;
fded98d6b29743 Daniel Golle 2022-11-16  526  		loadable = config_loadables;
fded98d6b29743 Daniel Golle 2022-11-16  527  		loadables_rem_len = config_loadables_len;
fded98d6b29743 Daniel Golle 2022-11-16  528  		for (loadcnt = 0; loadables_rem_len > 1 &&
fded98d6b29743 Daniel Golle 2022-11-16  529  				  loadcnt < MAX_FIT_LOADABLES; ++loadcnt) {
fded98d6b29743 Daniel Golle 2022-11-16  530  			loadable_len =
fded98d6b29743 Daniel Golle 2022-11-16  531  				strnlen(loadable, loadables_rem_len - 1) + 1;
fded98d6b29743 Daniel Golle 2022-11-16  532  			loadables_rem_len -= loadable_len;
fded98d6b29743 Daniel Golle 2022-11-16  533  			if (!strncmp(image_name, loadable, loadable_len)) {
fded98d6b29743 Daniel Golle 2022-11-16  534  				found = true;
fded98d6b29743 Daniel Golle 2022-11-16  535  				break;
fded98d6b29743 Daniel Golle 2022-11-16  536  			}
fded98d6b29743 Daniel Golle 2022-11-16  537  			loadable += loadable_len;
fded98d6b29743 Daniel Golle 2022-11-16  538  		}
fded98d6b29743 Daniel Golle 2022-11-16  539  		if (!found)
fded98d6b29743 Daniel Golle 2022-11-16  540  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  541  
fded98d6b29743 Daniel Golle 2022-11-16  542  		if (image_pos % (1 << PAGE_SHIFT)) {
fded98d6b29743 Daniel Golle 2022-11-16  543  			dev_err(dev, "FIT: image %.*s start not aligned to page boundaries, skipping\n",
fded98d6b29743 Daniel Golle 2022-11-16  544  				image_name_len, image_name);
fded98d6b29743 Daniel Golle 2022-11-16  545  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  546  		}
fded98d6b29743 Daniel Golle 2022-11-16  547  
fded98d6b29743 Daniel Golle 2022-11-16  548  		if (image_len % (1 << PAGE_SHIFT)) {
fded98d6b29743 Daniel Golle 2022-11-16  549  			dev_err(dev, "FIT: sub-image %.*s end not aligned to page boundaries, skipping\n",
fded98d6b29743 Daniel Golle 2022-11-16  550  				image_name_len, image_name);
fded98d6b29743 Daniel Golle 2022-11-16  551  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  552  		}
fded98d6b29743 Daniel Golle 2022-11-16  553  
fded98d6b29743 Daniel Golle 2022-11-16  554  		start_sect = image_pos >> SECTOR_SHIFT;
fded98d6b29743 Daniel Golle 2022-11-16  555  		nr_sects = image_len >> SECTOR_SHIFT;
fded98d6b29743 Daniel Golle 2022-11-16  556  		imgmaxsect = max_t(sector_t, imgmaxsect, start_sect + nr_sects);
fded98d6b29743 Daniel Golle 2022-11-16  557  
fded98d6b29743 Daniel Golle 2022-11-16  558  		if (start_sect + nr_sects > dsectors) {
fded98d6b29743 Daniel Golle 2022-11-16  559  			dev_err(dev, "FIT: sub-image %.*s disk access beyond EOD\n",
fded98d6b29743 Daniel Golle 2022-11-16  560  				image_name_len, image_name);
fded98d6b29743 Daniel Golle 2022-11-16  561  			continue;
fded98d6b29743 Daniel Golle 2022-11-16  562  		}
fded98d6b29743 Daniel Golle 2022-11-16  563  
fded98d6b29743 Daniel Golle 2022-11-16  564  		if (!slot) {
fded98d6b29743 Daniel Golle 2022-11-16  565  			ret = sysfs_create_link_nowarn(&pdev->dev.kobj, bdev_kobj(bdev), "lower_dev");
fded98d6b29743 Daniel Golle 2022-11-16  566  			if (ret && ret != -EEXIST)
fded98d6b29743 Daniel Golle 2022-11-16  567  				goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  568  
fded98d6b29743 Daniel Golle 2022-11-16  569  			ret = 0;
fded98d6b29743 Daniel Golle 2022-11-16  570  		}
fded98d6b29743 Daniel Golle 2022-11-16  571  
fded98d6b29743 Daniel Golle 2022-11-16  572  		add_fit_subimage_device(bdev_file, slot++, start_sect, nr_sects, true);
fded98d6b29743 Daniel Golle 2022-11-16  573  	}
fded98d6b29743 Daniel Golle 2022-11-16  574  
fded98d6b29743 Daniel Golle 2022-11-16  575  	if (!slot)
fded98d6b29743 Daniel Golle 2022-11-16  576  		goto out_bootconf;
fded98d6b29743 Daniel Golle 2022-11-16  577  
fded98d6b29743 Daniel Golle 2022-11-16  578  	dev_info(dev, "mapped %u uImage.FIT filesystem sub-image%s as /dev/fit%s%u%s\n",
fded98d6b29743 Daniel Golle 2022-11-16  579  		 slot, (slot > 1)?"s":"", (slot > 1)?"[0...":"", slot - 1,
fded98d6b29743 Daniel Golle 2022-11-16  580  		 (slot > 1)?"]":"");
fded98d6b29743 Daniel Golle 2022-11-16  581  
fded98d6b29743 Daniel Golle 2022-11-16  582  	/* in case uImage.FIT is stored in a partition, map the remaining space */
fded98d6b29743 Daniel Golle 2022-11-16  583  	if (!bdev_read_only(bdev) && bdev_is_partition(bdev) &&
fded98d6b29743 Daniel Golle 2022-11-16  584  	    (imgmaxsect + MIN_FREE_SECT) < dsectors) {
fded98d6b29743 Daniel Golle 2022-11-16  585  		add_fit_subimage_device(bdev_file, slot++, imgmaxsect,
fded98d6b29743 Daniel Golle 2022-11-16  586  					dsectors - imgmaxsect, false);
fded98d6b29743 Daniel Golle 2022-11-16  587  		dev_info(dev, "mapped remaing space as /dev/fitrw\n");
fded98d6b29743 Daniel Golle 2022-11-16  588  	}
fded98d6b29743 Daniel Golle 2022-11-16  589  
fded98d6b29743 Daniel Golle 2022-11-16  590  out_bootconf:
fded98d6b29743 Daniel Golle 2022-11-16  591  	kfree(bootconf);
fded98d6b29743 Daniel Golle 2022-11-16  592  	kfree(fit);
fded98d6b29743 Daniel Golle 2022-11-16  593  out_blkdev:
fded98d6b29743 Daniel Golle 2022-11-16  594  	if (!slot)
fded98d6b29743 Daniel Golle 2022-11-16  595  		fput(bdev_file);
fded98d6b29743 Daniel Golle 2022-11-16  596  
fded98d6b29743 Daniel Golle 2022-11-16  597  	return ret;
fded98d6b29743 Daniel Golle 2022-11-16  598  }
fded98d6b29743 Daniel Golle 2022-11-16  599  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
