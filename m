Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123713A27D
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314237; cv=none; b=OYC0Y10erBnn0NiNgGr7vGaVUzNYTM7c2GgJCqCj/2MYY2USuML2qmEvhbQaUg7OM8xksDTvR5NeDPNAUINCf5edAYT1M3I3GEhp/RSt0/PswKcD0FQMTPgL2zPnhBZbcJgWIH+Sh70xBlGb119W/ilDWOTbSEhoM04TR6vSoPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314237; c=relaxed/simple;
	bh=7M+ervv07F8b1//fmpSFWY7KcMN9QRSw8rSAerW7U5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/NXAd/CNJo+FIrHLa0PqrBQUC4ZBnBxbCcFBp8l/m+7+8ahy5b37r+uvtunOD6jU/ybXc0+ZF2kcEcW1KWaUjluLB36zu+A5GLyrFgEyjpI3EG11Hw9QUm+mEkULn8rIlc1RImxL+Xr09uYZcxnkc+xEqLbA/4RqXq2tGz85yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evd4OKZ4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evd4OKZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730314235; x=1761850235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7M+ervv07F8b1//fmpSFWY7KcMN9QRSw8rSAerW7U5Y=;
  b=evd4OKZ4ZD6YtAXWn7eZOc4uarRr8M8evIME45azPjX4A08Im9WWkJKd
   IfdG54CxKRQmS1O6+vfSD8on6Udesu3rOlVbJFlWad1l+gTXnHsYWX8V/
   T759j+P/UUL/NEj5voASjdrpMWuQ134I1GwO58dMsEPk4jwZLYwsTCue/
   +TCa7zteSK/2+OGoJHYVr0U/TOOZyAl3mWyuhfXsQ8SaakvspztBr5+Xr
   oPPQotHy1LXd+O2/5W0qoFPpabFvE9y0xceHFZrBgU7gaQDyQQTtw+FRq
   lvtiI2VLLXdPfro2kPyK0gKymvU1vWU/jFaZNzlMDAqo60yBdsskwqksZ
   w==;
X-CSE-ConnectionGUID: AKxacqsOSo6s9j4aGvsRiQ==
X-CSE-MsgGUID: nhWSHpT0QiGXlg7aarRV9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41135172"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41135172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 11:50:31 -0700
X-CSE-ConnectionGUID: D4HOf4bKS5id7FQPEFsZng==
X-CSE-MsgGUID: Ld4y2fW1Qlm603w4I2JUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82320714"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2024 11:50:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Dlz-000fDE-0f;
	Wed, 30 Oct 2024 18:50:27 +0000
Date: Thu, 31 Oct 2024 02:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] btrfs: handle bio_split() error
Message-ID: <202410310231.WMcRwBhG-lkp@intel.com>
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
In-Reply-To: <20241029091121.16281-1-jth@kernel.org>
References: <20241029091121.16281-1-jth@kernel.org>
TO: Johannes Thumshirn <jth@kernel.org>
TO: John Garry <john.g.garry@oracle.com>
CC: linux-block@vger.kernel.org
CC: linux-btrfs@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: axboe@kernel.dk
CC: song@kernel.org
CC: yukuai3@huawei.com
CC: hch@lst.de
CC: martin.petersen@oracle.com
CC: hare@suse.de
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.12-rc5 next-20241030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-handle-bio_split-error/20241029-171227
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20241029091121.16281-1-jth%40kernel.org
patch subject: [PATCH] btrfs: handle bio_split() error
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: openrisc-randconfig-r072-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310231.WMcRwBhG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310231.WMcRwBhG-lkp@intel.com/

smatch warnings:
fs/btrfs/bio.c:763 btrfs_submit_chunk() error: 'bbio' dereferencing possible ERR_PTR()

vim +/bbio +763 fs/btrfs/bio.c

b35243a447b9fe Christoph Hellwig  2024-08-26  659  
ae42a154ca8972 Christoph Hellwig  2023-03-07  660  static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
103c19723c80bf Christoph Hellwig  2022-11-15  661  {
d5e4377d505189 Christoph Hellwig  2023-01-21  662  	struct btrfs_inode *inode = bbio->inode;
4317ff0056bedf Qu Wenruo          2023-03-23  663  	struct btrfs_fs_info *fs_info = bbio->fs_info;
ae42a154ca8972 Christoph Hellwig  2023-03-07  664  	struct bio *bio = &bbio->bio;
adbe7e388e4239 Anand Jain         2023-04-15  665  	u64 logical = bio->bi_iter.bi_sector << SECTOR_SHIFT;
103c19723c80bf Christoph Hellwig  2022-11-15  666  	u64 length = bio->bi_iter.bi_size;
103c19723c80bf Christoph Hellwig  2022-11-15  667  	u64 map_length = length;
921603c76246a7 Christoph Hellwig  2022-12-12  668  	bool use_append = btrfs_use_zone_append(bbio);
103c19723c80bf Christoph Hellwig  2022-11-15  669  	struct btrfs_io_context *bioc = NULL;
103c19723c80bf Christoph Hellwig  2022-11-15  670  	struct btrfs_io_stripe smap;
9ba0004bd95e05 Christoph Hellwig  2023-01-21  671  	blk_status_t ret;
9ba0004bd95e05 Christoph Hellwig  2023-01-21  672  	int error;
103c19723c80bf Christoph Hellwig  2022-11-15  673  
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  674  	if (!bbio->inode || btrfs_is_data_reloc_root(inode->root))
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  675  		smap.rst_search_commit_root = true;
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  676  	else
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  677  		smap.rst_search_commit_root = false;
9acaa64187f9b4 Johannes Thumshirn 2023-09-14  678  
103c19723c80bf Christoph Hellwig  2022-11-15  679  	btrfs_bio_counter_inc_blocked(fs_info);
cd4efd210edfb3 Christoph Hellwig  2023-05-31  680  	error = btrfs_map_block(fs_info, btrfs_op(bio), logical, &map_length,
9fb2acc2fe07f1 Qu Wenruo          2023-09-17  681  				&bioc, &smap, &mirror_num);
9ba0004bd95e05 Christoph Hellwig  2023-01-21  682  	if (error) {
9ba0004bd95e05 Christoph Hellwig  2023-01-21  683  		ret = errno_to_blk_status(error);
9ba0004bd95e05 Christoph Hellwig  2023-01-21  684  		goto fail;
103c19723c80bf Christoph Hellwig  2022-11-15  685  	}
103c19723c80bf Christoph Hellwig  2022-11-15  686  
852eee62d31abd Christoph Hellwig  2023-01-21  687  	map_length = min(map_length, length);
d5e4377d505189 Christoph Hellwig  2023-01-21  688  	if (use_append)
b35243a447b9fe Christoph Hellwig  2024-08-26  689  		map_length = btrfs_append_map_length(bbio, map_length);
d5e4377d505189 Christoph Hellwig  2023-01-21  690  
103c19723c80bf Christoph Hellwig  2022-11-15  691  	if (map_length < length) {
b35243a447b9fe Christoph Hellwig  2024-08-26  692  		bbio = btrfs_split_bio(fs_info, bbio, map_length);
28c02a018d50ae Johannes Thumshirn 2024-10-29  693  		if (IS_ERR(bbio)) {
28c02a018d50ae Johannes Thumshirn 2024-10-29  694  			ret = PTR_ERR(bbio);
28c02a018d50ae Johannes Thumshirn 2024-10-29  695  			goto fail;
28c02a018d50ae Johannes Thumshirn 2024-10-29  696  		}
2cef0c79bb81d8 Christoph Hellwig  2023-03-07  697  		bio = &bbio->bio;
103c19723c80bf Christoph Hellwig  2022-11-15  698  	}
103c19723c80bf Christoph Hellwig  2022-11-15  699  
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  700  	/*
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  701  	 * Save the iter for the end_io handler and preload the checksums for
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  702  	 * data reads.
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  703  	 */
fbe960877b6f43 Christoph Hellwig  2023-05-31  704  	if (bio_op(bio) == REQ_OP_READ && is_data_bbio(bbio)) {
0d3acb25e70d5f Christoph Hellwig  2023-01-21  705  		bbio->saved_iter = bio->bi_iter;
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  706  		ret = btrfs_lookup_bio_sums(bbio);
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  707  		if (ret)
10d9d8c3512f16 Qu Wenruo          2024-08-17  708  			goto fail;
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  709  	}
7276aa7d38255b Christoph Hellwig  2023-01-21  710  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  711  	if (btrfs_op(bio) == BTRFS_MAP_WRITE) {
d5e4377d505189 Christoph Hellwig  2023-01-21  712  		if (use_append) {
d5e4377d505189 Christoph Hellwig  2023-01-21  713  			bio->bi_opf &= ~REQ_OP_WRITE;
d5e4377d505189 Christoph Hellwig  2023-01-21  714  			bio->bi_opf |= REQ_OP_ZONE_APPEND;
69ccf3f4244abc Christoph Hellwig  2023-01-21  715  		}
69ccf3f4244abc Christoph Hellwig  2023-01-21  716  
02c372e1f016e5 Johannes Thumshirn 2023-09-14  717  		if (is_data_bbio(bbio) && bioc &&
02c372e1f016e5 Johannes Thumshirn 2023-09-14  718  		    btrfs_need_stripe_tree_update(bioc->fs_info, bioc->map_type)) {
02c372e1f016e5 Johannes Thumshirn 2023-09-14  719  			/*
02c372e1f016e5 Johannes Thumshirn 2023-09-14  720  			 * No locking for the list update, as we only add to
02c372e1f016e5 Johannes Thumshirn 2023-09-14  721  			 * the list in the I/O submission path, and list
02c372e1f016e5 Johannes Thumshirn 2023-09-14  722  			 * iteration only happens in the completion path, which
02c372e1f016e5 Johannes Thumshirn 2023-09-14  723  			 * can't happen until after the last submission.
02c372e1f016e5 Johannes Thumshirn 2023-09-14  724  			 */
02c372e1f016e5 Johannes Thumshirn 2023-09-14  725  			btrfs_get_bioc(bioc);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  726  			list_add_tail(&bioc->rst_ordered_entry, &bbio->ordered->bioc_list);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  727  		}
02c372e1f016e5 Johannes Thumshirn 2023-09-14  728  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  729  		/*
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  730  		 * Csum items for reloc roots have already been cloned at this
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  731  		 * point, so they are handled as part of the no-checksum case.
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  732  		 */
4317ff0056bedf Qu Wenruo          2023-03-23  733  		if (inode && !(inode->flags & BTRFS_INODE_NODATASUM) &&
169aaaf2e0be61 Qu Wenruo          2024-06-14  734  		    !test_bit(BTRFS_FS_STATE_NO_DATA_CSUMS, &fs_info->fs_state) &&
d5e4377d505189 Christoph Hellwig  2023-01-21  735  		    !btrfs_is_data_reloc_root(inode->root)) {
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  736  			if (should_async_write(bbio) &&
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  737  			    btrfs_wq_submit_bio(bbio, bioc, &smap, mirror_num))
852eee62d31abd Christoph Hellwig  2023-01-21  738  				goto done;
103c19723c80bf Christoph Hellwig  2022-11-15  739  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  740  			ret = btrfs_bio_csum(bbio);
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  741  			if (ret)
10d9d8c3512f16 Qu Wenruo          2024-08-17  742  				goto fail;
cebae292e0c32a Johannes Thumshirn 2024-06-07  743  		} else if (use_append ||
cebae292e0c32a Johannes Thumshirn 2024-06-07  744  			   (btrfs_is_zoned(fs_info) && inode &&
cebae292e0c32a Johannes Thumshirn 2024-06-07  745  			    inode->flags & BTRFS_INODE_NODATASUM)) {
cbfce4c7fbde23 Christoph Hellwig  2023-05-24  746  			ret = btrfs_alloc_dummy_sum(bbio);
cbfce4c7fbde23 Christoph Hellwig  2023-05-24  747  			if (ret)
10d9d8c3512f16 Qu Wenruo          2024-08-17  748  				goto fail;
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  749  		}
103c19723c80bf Christoph Hellwig  2022-11-15  750  	}
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  751  
22b4ef50dc1d11 David Sterba       2024-08-27  752  	btrfs_submit_bio(bio, bioc, &smap, mirror_num);
852eee62d31abd Christoph Hellwig  2023-01-21  753  done:
852eee62d31abd Christoph Hellwig  2023-01-21  754  	return map_length == length;
9ba0004bd95e05 Christoph Hellwig  2023-01-21  755  
9ba0004bd95e05 Christoph Hellwig  2023-01-21  756  fail:
9ba0004bd95e05 Christoph Hellwig  2023-01-21  757  	btrfs_bio_counter_dec(fs_info);
10d9d8c3512f16 Qu Wenruo          2024-08-17  758  	/*
10d9d8c3512f16 Qu Wenruo          2024-08-17  759  	 * We have split the original bbio, now we have to end both the current
10d9d8c3512f16 Qu Wenruo          2024-08-17  760  	 * @bbio and remaining one, as the remaining one will never be submitted.
10d9d8c3512f16 Qu Wenruo          2024-08-17  761  	 */
10d9d8c3512f16 Qu Wenruo          2024-08-17  762  	if (map_length < length) {
10d9d8c3512f16 Qu Wenruo          2024-08-17 @763  		struct btrfs_bio *remaining = bbio->private;
10d9d8c3512f16 Qu Wenruo          2024-08-17  764  
10d9d8c3512f16 Qu Wenruo          2024-08-17  765  		ASSERT(bbio->bio.bi_pool == &btrfs_clone_bioset);
10d9d8c3512f16 Qu Wenruo          2024-08-17  766  		ASSERT(remaining);
10d9d8c3512f16 Qu Wenruo          2024-08-17  767  
9ca0e58cb752b0 Qu Wenruo          2024-08-24  768  		btrfs_bio_end_io(remaining, ret);
10d9d8c3512f16 Qu Wenruo          2024-08-17  769  	}
9ca0e58cb752b0 Qu Wenruo          2024-08-24  770  	btrfs_bio_end_io(bbio, ret);
852eee62d31abd Christoph Hellwig  2023-01-21  771  	/* Do not submit another chunk */
852eee62d31abd Christoph Hellwig  2023-01-21  772  	return true;
852eee62d31abd Christoph Hellwig  2023-01-21  773  }
852eee62d31abd Christoph Hellwig  2023-01-21  774  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
