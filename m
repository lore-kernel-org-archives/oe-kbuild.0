Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93723CB550
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365597; cv=none; b=INnXC7HmwdOPE5PrrVLlrTrmPVb2I6blnhkQ2r1ADRWZkBTDwa58MlfvSZSXLtjMEeWLRLv6fxaeCHmdH76kl1/F45oIuYgevPT4rJ634BnZ46ZJAvszJV5jly18k16IMX03LVOwPrWmpRD6+8uJs9eazK/ZWzr1iqwbg3WxSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365597; c=relaxed/simple;
	bh=qAmPnGOIWTaBkR8bfrJrEPlmuYVD7+G5b/doQuSzz9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5XlGaX8SJ9pOJHck7x/ksSy1U4hYxAqYnFjokJUpBnOPVKIGjfWdAm8C/jsjy9oWg3uBIhEfpEF48MztOA0c4bR4oQ9lenb6HjviVUgS3mLaW7zDu57uyVomtEv1tWlXzqxxIKwgD4Fjoe0LrC2SRmroe5eeQ/IeVnu8uqj8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tg2ySNmw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tg2ySNmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791365578; x=1822901578;
  h=date:from:to:cc:subject:message-id;
  bh=qAmPnGOIWTaBkR8bfrJrEPlmuYVD7+G5b/doQuSzz9w=;
  b=Tg2ySNmwJd5sNAPPYRAltboSMX7OOMYYTYLW0MfU3EXpxJ5QbNgVLjvL
   k43TfPZpRzpW/2P/7+cjDq8wdNvELYNrZGd5HAp2tcA0ePA0K4YXJUCHX
   VItGNjAjDrxpEl6FkY5KTcCkwOHUuy3tPV5QaGCmuXSWnTv7Lvarjrxye
   LLM22tnZFlMf+nYkPCM2khZJHee3SWqlds13iFExXefm4ZPJcFXwDmQ2b
   aRRbvQJtGM6BnwtNcgA9NcUZYM6jWGBiabem+IFAfF3AzfF9parh2Pdu5
   5DIywuQ5mCgXXbA4+iJrTImB/Y9jWg7FnpwA0DnBOnWSV5HRFYRBJLj9z
   g==;
X-CSE-ConnectionGUID: sjNK4fB4Q3+kaQ3ncj+RNQ==
X-CSE-MsgGUID: REMgGcKcToekC3OAPwJ16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="18104"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="18104"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:32:57 -0700
X-CSE-ConnectionGUID: GaT8nUzOSrO6SSPJm3E//g==
X-CSE-MsgGUID: ZiCrPwaGSGW1CZ6atPrCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="18599"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 02:32:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEO17-000000002rr-181K;
	Wed, 07 Oct 2026 09:32:53 +0000
Date: Wed, 07 Oct 2026 11:32:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 15/15] fs/btrfs/bio.c:752
 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see
 line 665)
Message-ID: <202610071143.8OJfuU8l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   efe665b77332621017fded6de1496bfff20ae5c6
commit: 4663160aa2d8472e9194367d02f75e26573809e9 [15/15] btrfs: remove btrfs_bio::fs_info by extracting it from btrfs_bio::inode
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-2200-20261006 (https://download.01.org/0day-ci/archive/20261007/202610071143.8OJfuU8l-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610071143.8OJfuU8l-lkp@intel.com/

smatch warnings:
fs/btrfs/bio.c:752 btrfs_submit_chunk() warn: variable dereferenced before check 'inode' (see line 665)

vim +/inode +752 fs/btrfs/bio.c

b35243a447b9fe Christoph Hellwig  2024-08-26  661  
ae42a154ca8972 Christoph Hellwig  2023-03-07  662  static bool btrfs_submit_chunk(struct btrfs_bio *bbio, int mirror_num)
103c19723c80bf Christoph Hellwig  2022-11-15  663  {
d5e4377d505189 Christoph Hellwig  2023-01-21  664  	struct btrfs_inode *inode = bbio->inode;
4663160aa2d847 Qu Wenruo          2025-10-29 @665  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
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
4663160aa2d847 Qu Wenruo          2025-10-29  676  	if (bbio->is_scrub || btrfs_is_data_reloc_root(inode->root))
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
4663160aa2d847 Qu Wenruo          2025-10-29  740  		if (!(inode->flags & BTRFS_INODE_NODATASUM) &&
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
cebae292e0c32a Johannes Thumshirn 2024-06-07 @752  			   (btrfs_is_zoned(fs_info) && inode &&
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

:::::: The code at line 752 was first introduced by commit
:::::: cebae292e0c32a228e8f2219c270a7237be24a6a btrfs: zoned: allocate dummy checksums for zoned NODATASUM writes

:::::: TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
