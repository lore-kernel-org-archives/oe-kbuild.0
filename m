Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450802AE90
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443421; cv=none; b=tBIyudVk37HhhFiYN5Pkc2nTNEHZWXGludA7QcsPiBtB3NMAIiuFSaZih/ElqceNwsDA7/4d5Cj75k1i6ATqgD21F1r2GzbgjwGUAUhpfq2tbB5JGWj7wCPY5hdBXkmmrIXRSPlrB1LTIK3CUWI/Hu8KbdxhBGPFIEzdZbpiKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443421; c=relaxed/simple;
	bh=CigZWuGrPzohZEOilyzSfm6DuzZivaayzMucjiYKfjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SL2VOArXp90G3+YFPkVWnJsCuYzLJKoOtQ1DyTVC3VPpEXYxFK8UgIpxjtF9Y2r6/3TIWiFkIJy3xHzN2IdFSCIMt/bYhfOLOFAmRQyHbfBY63t2K9YQ42QOHv+XAQIwoEvPjMslq00HYs1WpkVI2EDGhDQTS/r8HMP3uVp3eFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGduWQEc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGduWQEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759443419; x=1790979419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CigZWuGrPzohZEOilyzSfm6DuzZivaayzMucjiYKfjw=;
  b=TGduWQEcY1W/IXpmpCswMM2CqoO901vk+LRbwfzHkEEabjixpRbRQG6j
   6k0++OGx8EJbfAfKO5sGvXzNdWnnGC0YtSHmx0mPhmb9Cite7GcxcF7l9
   3V3r12PTaWmKVFGr6r/uS1iXBcTRSj0UEiRnmuQp9cS4CFQmC9wDBf3Uk
   /eBFU6qK37olItuRJJAO/KufxkYx+PWH6wtdeWLVv/Rgau5efRCF8ypn5
   Ow3EbWFMXxTFOqUTE4kGVk7XEBT9H/CJJsN8G0IiGdhwKUTFM+tk1/SyY
   /mi7knJevm8CLVB2MdInJugcPtv+oJO/cbAmOmTtIf9mEQR86dkVld//H
   g==;
X-CSE-ConnectionGUID: 20kA81XLQJyLKMoeXitUDA==
X-CSE-MsgGUID: 93BF7jRxQV6IvwSfiv+1jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72411336"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="72411336"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 15:16:56 -0700
X-CSE-ConnectionGUID: sBLJcaeCRVqMKDHCELSzxA==
X-CSE-MsgGUID: QUx2jO3XQG27WCcyChpbNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="179093843"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 15:16:55 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4RbZ-00049T-1u;
	Thu, 02 Oct 2025 22:16:53 +0000
Date: Fri, 3 Oct 2025 06:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/4] btrfs: make btrfs_repair_io_failure() handle bs > ps
 cases without large folios
Message-ID: <202510030550.mqFoO0Dw-lkp@intel.com>
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
In-Reply-To: <33c39907866c148a360ff60387097fbad63a19aa.1759311101.git.wqu@suse.com>
References: <33c39907866c148a360ff60387097fbad63a19aa.1759311101.git.wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs@vger.kernel.org

Hi Qu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master next-20251002]
[cannot apply to v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-make-btrfs_csum_one_bio-handle-bs-ps-without-large-folios/20251001-175128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/33c39907866c148a360ff60387097fbad63a19aa.1759311101.git.wqu%40suse.com
patch subject: [PATCH 2/4] btrfs: make btrfs_repair_io_failure() handle bs > ps cases without large folios
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r071-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030550.mqFoO0Dw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510030550.mqFoO0Dw-lkp@intel.com/

smatch warnings:
fs/btrfs/bio.c:914 btrfs_repair_io_failure() warn: variable dereferenced before check 'bio' (see line 894)

vim +/bio +914 fs/btrfs/bio.c

103c19723c80bf Christoph Hellwig 2022-11-15  836  
bacf60e5158629 Christoph Hellwig 2022-11-15  837  /*
bacf60e5158629 Christoph Hellwig 2022-11-15  838   * Submit a repair write.
bacf60e5158629 Christoph Hellwig 2022-11-15  839   *
792e86ef31b91c David Sterba      2024-08-27  840   * This bypasses btrfs_submit_bbio() deliberately, as that writes all copies in a
bacf60e5158629 Christoph Hellwig 2022-11-15  841   * RAID setup.  Here we only want to write the one bad copy, so we do the
bacf60e5158629 Christoph Hellwig 2022-11-15  842   * mapping ourselves and submit the bio directly.
bacf60e5158629 Christoph Hellwig 2022-11-15  843   *
67da05b3f28166 Colin Ian King    2023-01-17  844   * The I/O is issued synchronously to block the repair read completion from
bacf60e5158629 Christoph Hellwig 2022-11-15  845   * freeing the bio.
2d65a91734a195 Qu Wenruo         2025-10-01  846   *
2d65a91734a195 Qu Wenruo         2025-10-01  847   * @ino:	Offending inode number
2d65a91734a195 Qu Wenruo         2025-10-01  848   * @fileoff:	File offset inside the inode
2d65a91734a195 Qu Wenruo         2025-10-01  849   * @length:	Length of the repair write
2d65a91734a195 Qu Wenruo         2025-10-01  850   * @logical:	Logical address of the range
2d65a91734a195 Qu Wenruo         2025-10-01  851   * @paddrs:	Physical address array of the content.
2d65a91734a195 Qu Wenruo         2025-10-01  852   *		Length for each paddr should be min(sectorsize, PAGE_SIZE).
2d65a91734a195 Qu Wenruo         2025-10-01  853   * @mirror_num: Mirror number to write to. Must not be zero.
bacf60e5158629 Christoph Hellwig 2022-11-15  854   */
2d65a91734a195 Qu Wenruo         2025-10-01  855  int btrfs_repair_io_failure(struct btrfs_fs_info *fs_info, u64 ino, u64 fileoff,
2d65a91734a195 Qu Wenruo         2025-10-01  856  			    u64 length, u64 logical, const phys_addr_t paddrs[], int mirror_num)
bacf60e5158629 Christoph Hellwig 2022-11-15  857  {
2d65a91734a195 Qu Wenruo         2025-10-01  858  	const u32 step = min(fs_info->sectorsize, PAGE_SIZE);
2d65a91734a195 Qu Wenruo         2025-10-01  859  	const u32 nr_steps = DIV_ROUND_UP_POW2(length, step);
4886ff7b50f634 Qu Wenruo         2023-03-20  860  	struct btrfs_io_stripe smap = { 0 };
2d65a91734a195 Qu Wenruo         2025-10-01  861  	struct bio *bio = NULL;
bacf60e5158629 Christoph Hellwig 2022-11-15  862  	int ret = 0;
bacf60e5158629 Christoph Hellwig 2022-11-15  863  
bacf60e5158629 Christoph Hellwig 2022-11-15  864  	ASSERT(!(fs_info->sb->s_flags & SB_RDONLY));
bacf60e5158629 Christoph Hellwig 2022-11-15  865  	BUG_ON(!mirror_num);
bacf60e5158629 Christoph Hellwig 2022-11-15  866  
2d65a91734a195 Qu Wenruo         2025-10-01  867  	/* Basic alignment checks. */
2d65a91734a195 Qu Wenruo         2025-10-01  868  	ASSERT(IS_ALIGNED(logical, fs_info->sectorsize));
2d65a91734a195 Qu Wenruo         2025-10-01  869  	ASSERT(IS_ALIGNED(length, fs_info->sectorsize));
2d65a91734a195 Qu Wenruo         2025-10-01  870  	ASSERT(IS_ALIGNED(fileoff, fs_info->sectorsize));
2d65a91734a195 Qu Wenruo         2025-10-01  871  
bacf60e5158629 Christoph Hellwig 2022-11-15  872  	if (btrfs_repair_one_zone(fs_info, logical))
bacf60e5158629 Christoph Hellwig 2022-11-15  873  		return 0;
bacf60e5158629 Christoph Hellwig 2022-11-15  874  
bacf60e5158629 Christoph Hellwig 2022-11-15  875  	/*
bacf60e5158629 Christoph Hellwig 2022-11-15  876  	 * Avoid races with device replace and make sure our bioc has devices
bacf60e5158629 Christoph Hellwig 2022-11-15  877  	 * associated to its stripes that don't go away while we are doing the
bacf60e5158629 Christoph Hellwig 2022-11-15  878  	 * read repair operation.
bacf60e5158629 Christoph Hellwig 2022-11-15  879  	 */
bacf60e5158629 Christoph Hellwig 2022-11-15  880  	btrfs_bio_counter_inc_blocked(fs_info);
4886ff7b50f634 Qu Wenruo         2023-03-20  881  	ret = btrfs_map_repair_block(fs_info, &smap, logical, length, mirror_num);
4886ff7b50f634 Qu Wenruo         2023-03-20  882  	if (ret < 0)
d73a27b86fc722 Qu Wenruo         2023-01-01  883  		goto out_counter_dec;
bacf60e5158629 Christoph Hellwig 2022-11-15  884  
cc53bd2085c8fa David Sterba      2025-09-17  885  	if (unlikely(!smap.dev->bdev ||
cc53bd2085c8fa David Sterba      2025-09-17  886  		     !test_bit(BTRFS_DEV_STATE_WRITEABLE, &smap.dev->dev_state))) {
bacf60e5158629 Christoph Hellwig 2022-11-15  887  		ret = -EIO;
bacf60e5158629 Christoph Hellwig 2022-11-15  888  		goto out_counter_dec;
bacf60e5158629 Christoph Hellwig 2022-11-15  889  	}
bacf60e5158629 Christoph Hellwig 2022-11-15  890  
2d65a91734a195 Qu Wenruo         2025-10-01  891  	bio = bio_alloc(smap.dev->bdev, nr_steps, REQ_OP_WRITE | REQ_SYNC, GFP_NOFS);
2d65a91734a195 Qu Wenruo         2025-10-01  892  	/* Backed by fs_bio_set, shouldn't fail. */
2d65a91734a195 Qu Wenruo         2025-10-01  893  	ASSERT(bio);
2d65a91734a195 Qu Wenruo         2025-10-01 @894  	bio->bi_iter.bi_sector = smap.physical >> SECTOR_SHIFT;
2d65a91734a195 Qu Wenruo         2025-10-01  895  	for (int i = 0; i < nr_steps; i++) {
2d65a91734a195 Qu Wenruo         2025-10-01  896  		ret = bio_add_page(bio, phys_to_page(paddrs[i]), step, offset_in_page(paddrs[i]));
2d65a91734a195 Qu Wenruo         2025-10-01  897  		/* We should have allocated enough slots to contain all the different pages. */
2d65a91734a195 Qu Wenruo         2025-10-01  898  		ASSERT(ret == step);
2d65a91734a195 Qu Wenruo         2025-10-01  899  	}
2d65a91734a195 Qu Wenruo         2025-10-01  900  	ret = submit_bio_wait(bio);
bacf60e5158629 Christoph Hellwig 2022-11-15  901  	if (ret) {
bacf60e5158629 Christoph Hellwig 2022-11-15  902  		/* try to remap that extent elsewhere? */
4886ff7b50f634 Qu Wenruo         2023-03-20  903  		btrfs_dev_stat_inc_and_print(smap.dev, BTRFS_DEV_STAT_WRITE_ERRS);
2d65a91734a195 Qu Wenruo         2025-10-01  904  		goto out_free_bio;
bacf60e5158629 Christoph Hellwig 2022-11-15  905  	}
bacf60e5158629 Christoph Hellwig 2022-11-15  906  
2eac2ae8b214ab David Sterba      2025-06-09  907  	btrfs_info_rl(fs_info,
bacf60e5158629 Christoph Hellwig 2022-11-15  908  		"read error corrected: ino %llu off %llu (dev %s sector %llu)",
2d65a91734a195 Qu Wenruo         2025-10-01  909  			     ino, fileoff, btrfs_dev_name(smap.dev),
4886ff7b50f634 Qu Wenruo         2023-03-20  910  			     smap.physical >> SECTOR_SHIFT);
bacf60e5158629 Christoph Hellwig 2022-11-15  911  	ret = 0;
bacf60e5158629 Christoph Hellwig 2022-11-15  912  
2d65a91734a195 Qu Wenruo         2025-10-01  913  out_free_bio:
2d65a91734a195 Qu Wenruo         2025-10-01 @914  	if (bio)
2d65a91734a195 Qu Wenruo         2025-10-01  915  		bio_put(bio);
bacf60e5158629 Christoph Hellwig 2022-11-15  916  out_counter_dec:
bacf60e5158629 Christoph Hellwig 2022-11-15  917  	btrfs_bio_counter_dec(fs_info);
bacf60e5158629 Christoph Hellwig 2022-11-15  918  	return ret;
bacf60e5158629 Christoph Hellwig 2022-11-15  919  }
bacf60e5158629 Christoph Hellwig 2022-11-15  920  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
