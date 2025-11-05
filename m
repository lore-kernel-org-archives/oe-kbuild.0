Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3E314D35
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346527; cv=none; b=MUTfYMUu68YfoUyXv4QNOd7UgB1DcEj2ZPfDKKE9ZR6Fal1RdnO5zFmj7MlJcdpB1efB1DD1yWJaTZP0Jaz5jRTqwFKSisanyTtRYg1/3aj21HfMnKGc3SyVvy2MuMq+iNw8Xu56LJGth516hw5PfwDQ7GRm8lS/BipG+ajluV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346527; c=relaxed/simple;
	bh=MAG5oFKNNwt/wA8ZafWZvY8lsKhu8vnsl84PVV7Xzio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9QyoW1ERgjHUDND6NTNaQJWlIx1c+osgHerpATmV6/BRnNbGQz/IJOOCVzS+8FemiMO7kVOQ2L6hWRRUH24Mfa5+juXs7Rvd5Ns7cVhRaWgRUFSUS/XxAwiPQYuRvaDCNq90Yb8NKjxwlBZnKPf3368gZW7TsTm4t6e6gnR9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rct0N+kW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rct0N+kW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762346524; x=1793882524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAG5oFKNNwt/wA8ZafWZvY8lsKhu8vnsl84PVV7Xzio=;
  b=Rct0N+kWWolQIqntlS6drD/Bxvx82qb8WGiOFdLAdpV5+x7DOz4O60Le
   qF3curlQg4sOLXetL89tEC1B5jXpBJcyDXlx21yWC7BMbWNWE4caUyUD0
   ahWLCbH0tgK8M1uWTaLW3Mq+trpF3adZzKPXzR4njO0amFptLWJ72XfFl
   sTt2DNRambWQ+uAYwlwcY2lYXnxuSgB+9z6+fv4Q7fpGez6rP3Rl8w7u4
   KKZ0rnE6BE6oNHfLp+RFeHW+NGIcoLgKCWYOLEjgoPhGMx9EpWOOH0ZN3
   /e4fQFh4dVI36rzRCJi2amE7w65xpBy/ZSbOn7oPLrxI65BHsvhjLrpg9
   A==;
X-CSE-ConnectionGUID: dNrsw6yQRdOLGhwJF0PlXg==
X-CSE-MsgGUID: hF/47HMoRA2xWucMQ4ib0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64385554"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64385554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 04:42:04 -0800
X-CSE-ConnectionGUID: S/+x2oQAT7CFSMgpGkZ0nw==
X-CSE-MsgGUID: m+cfrxGnSj+LS0D0heHP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="191801475"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 04:42:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGcps-000SYe-2X;
	Wed, 05 Nov 2025 12:42:00 +0000
Date: Wed, 5 Nov 2025 20:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5952/6507] fs/btrfs/bio.c:740
 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see
 line 665)
Message-ID: <202511052053.zZZ5GjNx-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84d39fb9d529f27d2f3d295430d1be0abdae7a6d
commit: b61fb56b832da658b61f93b6fe0daa5663baef81 [5952/6507] btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
:::::: branch date: 7 hours ago
:::::: commit date: 31 hours ago
config: um-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251105/202511052053.zZZ5GjNx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511052053.zZZ5GjNx-lkp@intel.com/

smatch warnings:
fs/btrfs/bio.c:740 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see line 665)

vim +/inode +740 fs/btrfs/bio.c

b35243a447b9fe Christoph Hellwig  2024-08-26  661  
ae42a154ca8972 Christoph Hellwig  2023-03-07  662  static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
103c19723c80bf Christoph Hellwig  2022-11-15  663  {
d5e4377d505189 Christoph Hellwig  2023-01-21  664  	struct btrfs_inode *inode = bbio->inode;
b61fb56b832da6 Qu Wenruo          2025-10-29 @665  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
ae42a154ca8972 Christoph Hellwig  2023-03-07  666  	struct bio *bio = &bbio->bio;
adbe7e388e4239 Anand Jain         2023-04-15  667  	u64 logical = bio->bi_iter.bi_sector << SECTOR_SHIFT;
103c19723c80bf Christoph Hellwig  2022-11-15  668  	u64 length = bio->bi_iter.bi_size;
103c19723c80bf Christoph Hellwig  2022-11-15  669  	u64 map_length = length;
921603c76246a7 Christoph Hellwig  2022-12-12  670  	bool use_append = btrfs_use_zone_append(bbio);
103c19723c80bf Christoph Hellwig  2022-11-15  671  	struct btrfs_io_context *bioc = NULL;
103c19723c80bf Christoph Hellwig  2022-11-15  672  	struct btrfs_io_stripe smap;
beaa7cdb6a1fef David Sterba       2025-04-23  673  	blk_status_t status;
9c0b0807ece11e David Sterba       2025-04-23  674  	int ret;
103c19723c80bf Christoph Hellwig  2022-11-15  675  
b61fb56b832da6 Qu Wenruo          2025-10-29  676  	if (bbio->is_scrub || btrfs_is_data_reloc_root(inode->root))
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  677  		smap.rst_search_commit_root = true;
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  678  	else
f4d39cf1cebfb8 Johannes Thumshirn 2024-07-31  679  		smap.rst_search_commit_root = false;
9acaa64187f9b4 Johannes Thumshirn 2023-09-14  680  
103c19723c80bf Christoph Hellwig  2022-11-15  681  	btrfs_bio_counter_inc_blocked(fs_info);
9c0b0807ece11e David Sterba       2025-04-23  682  	ret = btrfs_map_block(fs_info, btrfs_op(bio), logical, &map_length,
9fb2acc2fe07f1 Qu Wenruo          2023-09-17  683  			      &bioc, &smap, &mirror_num);
9c0b0807ece11e David Sterba       2025-04-23  684  	if (ret) {
9c0b0807ece11e David Sterba       2025-04-23  685  		status = errno_to_blk_status(ret);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  686  		btrfs_bio_counter_dec(fs_info);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  687  		goto end_bbio;
103c19723c80bf Christoph Hellwig  2022-11-15  688  	}
103c19723c80bf Christoph Hellwig  2022-11-15  689  
852eee62d31abd Christoph Hellwig  2023-01-21  690  	map_length = min(map_length, length);
d5e4377d505189 Christoph Hellwig  2023-01-21  691  	if (use_append)
b35243a447b9fe Christoph Hellwig  2024-08-26  692  		map_length = btrfs_append_map_length(bbio, map_length);
d5e4377d505189 Christoph Hellwig  2023-01-21  693  
103c19723c80bf Christoph Hellwig  2022-11-15  694  	if (map_length < length) {
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  695  		struct btrfs_bio *split;
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  696  
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  697  		split = btrfs_split_bio(fs_info, bbio, map_length);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  698  		if (IS_ERR(split)) {
beaa7cdb6a1fef David Sterba       2025-04-23  699  			status = errno_to_blk_status(PTR_ERR(split));
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  700  			btrfs_bio_counter_dec(fs_info);
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  701  			goto end_bbio;
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  702  		}
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  703  		bbio = split;
2cef0c79bb81d8 Christoph Hellwig  2023-03-07  704  		bio = &bbio->bio;
103c19723c80bf Christoph Hellwig  2022-11-15  705  	}
103c19723c80bf Christoph Hellwig  2022-11-15  706  
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  707  	/*
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  708  	 * Save the iter for the end_io handler and preload the checksums for
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  709  	 * data reads.
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  710  	 */
fbe960877b6f43 Christoph Hellwig  2023-05-31  711  	if (bio_op(bio) == REQ_OP_READ && is_data_bbio(bbio)) {
0d3acb25e70d5f Christoph Hellwig  2023-01-21  712  		bbio->saved_iter = bio->bi_iter;
9c0b0807ece11e David Sterba       2025-04-23  713  		ret = btrfs_lookup_bio_sums(bbio);
9c0b0807ece11e David Sterba       2025-04-23  714  		status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  715  		if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  716  			goto fail;
1c2b3ee3b0ec4b Christoph Hellwig  2023-01-21  717  	}
7276aa7d38255b Christoph Hellwig  2023-01-21  718  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  719  	if (btrfs_op(bio) == BTRFS_MAP_WRITE) {
d5e4377d505189 Christoph Hellwig  2023-01-21  720  		if (use_append) {
d5e4377d505189 Christoph Hellwig  2023-01-21  721  			bio->bi_opf &= ~REQ_OP_WRITE;
d5e4377d505189 Christoph Hellwig  2023-01-21  722  			bio->bi_opf |= REQ_OP_ZONE_APPEND;
69ccf3f4244abc Christoph Hellwig  2023-01-21  723  		}
69ccf3f4244abc Christoph Hellwig  2023-01-21  724  
9c48bcec47c8dd Johannes Thumshirn 2024-12-16  725  		if (is_data_bbio(bbio) && bioc && bioc->use_rst) {
02c372e1f016e5 Johannes Thumshirn 2023-09-14  726  			/*
02c372e1f016e5 Johannes Thumshirn 2023-09-14  727  			 * No locking for the list update, as we only add to
02c372e1f016e5 Johannes Thumshirn 2023-09-14  728  			 * the list in the I/O submission path, and list
02c372e1f016e5 Johannes Thumshirn 2023-09-14  729  			 * iteration only happens in the completion path, which
02c372e1f016e5 Johannes Thumshirn 2023-09-14  730  			 * can't happen until after the last submission.
02c372e1f016e5 Johannes Thumshirn 2023-09-14  731  			 */
02c372e1f016e5 Johannes Thumshirn 2023-09-14  732  			btrfs_get_bioc(bioc);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  733  			list_add_tail(&bioc->rst_ordered_entry, &bbio->ordered->bioc_list);
02c372e1f016e5 Johannes Thumshirn 2023-09-14  734  		}
02c372e1f016e5 Johannes Thumshirn 2023-09-14  735  
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  736  		/*
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  737  		 * Csum items for reloc roots have already been cloned at this
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  738  		 * point, so they are handled as part of the no-checksum case.
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  739  		 */
4317ff0056bedf Qu Wenruo          2023-03-23 @740  		if (inode && !(inode->flags & BTRFS_INODE_NODATASUM) &&
169aaaf2e0be61 Qu Wenruo          2024-06-14  741  		    !test_bit(BTRFS_FS_STATE_NO_DATA_CSUMS, &fs_info->fs_state) &&
d5e4377d505189 Christoph Hellwig  2023-01-21  742  		    !btrfs_is_data_reloc_root(inode->root)) {
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  743  			if (should_async_write(bbio) &&
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  744  			    btrfs_wq_submit_bio(bbio, bioc, &smap, mirror_num))
852eee62d31abd Christoph Hellwig  2023-01-21  745  				goto done;
103c19723c80bf Christoph Hellwig  2022-11-15  746  
9c0b0807ece11e David Sterba       2025-04-23  747  			ret = btrfs_bio_csum(bbio);
9c0b0807ece11e David Sterba       2025-04-23  748  			status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  749  			if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  750  				goto fail;
cebae292e0c32a Johannes Thumshirn 2024-06-07  751  		} else if (use_append ||
cebae292e0c32a Johannes Thumshirn 2024-06-07  752  			   (btrfs_is_zoned(fs_info) && inode &&
cebae292e0c32a Johannes Thumshirn 2024-06-07  753  			    inode->flags & BTRFS_INODE_NODATASUM)) {
853b5727c93dae David Sterba       2025-04-23  754  			ret = btrfs_alloc_dummy_sum(bbio);
853b5727c93dae David Sterba       2025-04-23  755  			status = errno_to_blk_status(ret);
beaa7cdb6a1fef David Sterba       2025-04-23  756  			if (status)
10d9d8c3512f16 Qu Wenruo          2024-08-17  757  				goto fail;
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  758  		}
103c19723c80bf Christoph Hellwig  2022-11-15  759  	}
f8a53bb58ec7e2 Christoph Hellwig  2023-01-21  760  
22b4ef50dc1d11 David Sterba       2024-08-27  761  	btrfs_submit_bio(bio, bioc, &smap, mirror_num);
852eee62d31abd Christoph Hellwig  2023-01-21  762  done:
852eee62d31abd Christoph Hellwig  2023-01-21  763  	return map_length == length;
9ba0004bd95e05 Christoph Hellwig  2023-01-21  764  
9ba0004bd95e05 Christoph Hellwig  2023-01-21  765  fail:
9ba0004bd95e05 Christoph Hellwig  2023-01-21  766  	btrfs_bio_counter_dec(fs_info);
10d9d8c3512f16 Qu Wenruo          2024-08-17  767  	/*
10d9d8c3512f16 Qu Wenruo          2024-08-17  768  	 * We have split the original bbio, now we have to end both the current
10d9d8c3512f16 Qu Wenruo          2024-08-17  769  	 * @bbio and remaining one, as the remaining one will never be submitted.
10d9d8c3512f16 Qu Wenruo          2024-08-17  770  	 */
10d9d8c3512f16 Qu Wenruo          2024-08-17  771  	if (map_length < length) {
10d9d8c3512f16 Qu Wenruo          2024-08-17  772  		struct btrfs_bio *remaining = bbio->private;
10d9d8c3512f16 Qu Wenruo          2024-08-17  773  
10d9d8c3512f16 Qu Wenruo          2024-08-17  774  		ASSERT(bbio->bio.bi_pool == &btrfs_clone_bioset);
10d9d8c3512f16 Qu Wenruo          2024-08-17  775  		ASSERT(remaining);
10d9d8c3512f16 Qu Wenruo          2024-08-17  776  
beaa7cdb6a1fef David Sterba       2025-04-23  777  		btrfs_bio_end_io(remaining, status);
10d9d8c3512f16 Qu Wenruo          2024-08-17  778  	}
c7c97ceff98cc4 Johannes Thumshirn 2024-12-02  779  end_bbio:
beaa7cdb6a1fef David Sterba       2025-04-23  780  	btrfs_bio_end_io(bbio, status);
852eee62d31abd Christoph Hellwig  2023-01-21  781  	/* Do not submit another chunk */
852eee62d31abd Christoph Hellwig  2023-01-21  782  	return true;
852eee62d31abd Christoph Hellwig  2023-01-21  783  }
852eee62d31abd Christoph Hellwig  2023-01-21  784  

:::::: The code at line 740 was first introduced by commit
:::::: 4317ff0056bedfc472202bf4ccf72d51094d6ade btrfs: introduce btrfs_bio::fs_info member

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
