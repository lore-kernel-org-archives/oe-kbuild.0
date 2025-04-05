Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50C522EE5
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882177; cv=none; b=KXlxHVBDYm157coL2oZZtsk1nD2TRR4lV7P8XKldjCKmGBdmjgU9p5SZDxCBi/frM7K3Vb/8AM+x4SJaBd4OzgT7FxuF2c9cQNQhlW+KCrw3rnGw2j3DNdcVQii9C4iFJldAEJaCO0r34LLhal+DNIW5484Al/S6X8/9khx9cNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882177; c=relaxed/simple;
	bh=x0Q5noa2dkwCogCwGk8lVBhRhvIfkDOOu5GuKQ40+GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1HTZlCXHcJsqQ/oS5VbpRLuQ4EmZFT7u0A2dJ5SqGHkjNdLnvShiGZNnsJL8Ib1Q+lQr5UqKeAJnU/V39Q7N51IXmX4bDZ4bqXAxoovy9FhGBRf2adXIf0zaP3M6uZ6y8xIVCdJSyxOtdIEaXaWtkFir4zfCrDTT0pe107G03Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJWF/CSv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJWF/CSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743882175; x=1775418175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0Q5noa2dkwCogCwGk8lVBhRhvIfkDOOu5GuKQ40+GA=;
  b=DJWF/CSv22lheOhkQLcOSYYhJyNk7/WTBAMqL522LUYF6SE9YftU1NO3
   QuCGs9TCaPVjN17nvo10WOVDuZXrfXUOdLgo/qjh6z5mSc3n1FIKtgQ0A
   um1O4s2ZQJtfY7HqGZvfA/SheKzDe0ZWSsBKFRIF1bskWIAQEDeVJ+81o
   ZzWnn/wIRu1SK2P23O87pt8eCDtpriq50yMJ5MHJP4SqK2WM5rM3eMAwZ
   jkoXlfMPhNHE+ziDUjzsBKdBaTiHFBJIozlhLQbxXOp7vNHXBtuY8FW55
   9va7NXVsL9FCf8RpV1obTeB+FajGk0eZnbhMKcwpSh+iUE0s1P/Goz/Il
   Q==;
X-CSE-ConnectionGUID: qKGnQk3FSfuyZL5FdMrEOQ==
X-CSE-MsgGUID: TrXNW+LJR9qzZoHhW02JmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45423311"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="45423311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 12:42:54 -0700
X-CSE-ConnectionGUID: yhAabX0jSr6eaV9ZviEXqw==
X-CSE-MsgGUID: 78UPvmgxSrSlCFpaufsZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="132720403"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 12:42:52 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u19Pm-0002Eh-1S;
	Sat, 05 Apr 2025 19:42:50 +0000
Date: Sun, 6 Apr 2025 03:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/tree-log.c:914:14-23: ERROR: inode is NULL but dereferenced.
Message-ID: <202504060300.cRlmZkCS-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56f944529ec2292cbe63377a76df3759d702dd39
commit: b4c50cbb01a1b6901d2b94469636dd80fa93de81 btrfs: return a btrfs_inode from read_one_inode()
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-r053-20250404 (https://download.01.org/0day-ci/archive/20250406/202504060300.cRlmZkCS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504060300.cRlmZkCS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/tree-log.c:914:14-23: ERROR: inode is NULL but dereferenced.
   fs/btrfs/tree-log.c:979:14-23: ERROR: inode is NULL but dereferenced.

vim +914 fs/btrfs/tree-log.c

e02119d5a7b439 Chris Mason           2008-09-05  629  
e02119d5a7b439 Chris Mason           2008-09-05  630  /* replays a single extent in 'eb' at 'slot' with 'key' into the
e02119d5a7b439 Chris Mason           2008-09-05  631   * subvolume 'root'.  path is released on entry and should be released
e02119d5a7b439 Chris Mason           2008-09-05  632   * on exit.
e02119d5a7b439 Chris Mason           2008-09-05  633   *
e02119d5a7b439 Chris Mason           2008-09-05  634   * extents in the log tree have not been allocated out of the extent
e02119d5a7b439 Chris Mason           2008-09-05  635   * tree yet.  So, this completes the allocation, taking a reference
e02119d5a7b439 Chris Mason           2008-09-05  636   * as required if the extent already exists or creating a new extent
e02119d5a7b439 Chris Mason           2008-09-05  637   * if it isn't in the extent allocation tree yet.
e02119d5a7b439 Chris Mason           2008-09-05  638   *
e02119d5a7b439 Chris Mason           2008-09-05  639   * The extent is inserted into the file, dropping any existing extents
e02119d5a7b439 Chris Mason           2008-09-05  640   * from the file that overlap the new one.
e02119d5a7b439 Chris Mason           2008-09-05  641   */
e02119d5a7b439 Chris Mason           2008-09-05  642  static noinline int replay_one_extent(struct btrfs_trans_handle *trans,
e02119d5a7b439 Chris Mason           2008-09-05  643  				      struct btrfs_root *root,
e02119d5a7b439 Chris Mason           2008-09-05  644  				      struct btrfs_path *path,
e02119d5a7b439 Chris Mason           2008-09-05  645  				      struct extent_buffer *eb, int slot,
e02119d5a7b439 Chris Mason           2008-09-05  646  				      struct btrfs_key *key)
e02119d5a7b439 Chris Mason           2008-09-05  647  {
5893dfb98f2578 Filipe Manana         2020-11-04  648  	struct btrfs_drop_extents_args drop_args = { 0 };
0b246afa62b0cf Jeff Mahoney          2016-06-22  649  	struct btrfs_fs_info *fs_info = root->fs_info;
e02119d5a7b439 Chris Mason           2008-09-05  650  	int found_type;
e02119d5a7b439 Chris Mason           2008-09-05  651  	u64 extent_end;
e02119d5a7b439 Chris Mason           2008-09-05  652  	u64 start = key->offset;
4bc4bee4595662 Josef Bacik           2013-04-05  653  	u64 nbytes = 0;
e02119d5a7b439 Chris Mason           2008-09-05  654  	struct btrfs_file_extent_item *item;
b4c50cbb01a1b6 Filipe Manana         2025-03-06  655  	struct btrfs_inode *inode = NULL;
e02119d5a7b439 Chris Mason           2008-09-05  656  	unsigned long size;
e02119d5a7b439 Chris Mason           2008-09-05  657  	int ret = 0;
e02119d5a7b439 Chris Mason           2008-09-05  658  
e02119d5a7b439 Chris Mason           2008-09-05  659  	item = btrfs_item_ptr(eb, slot, struct btrfs_file_extent_item);
e02119d5a7b439 Chris Mason           2008-09-05  660  	found_type = btrfs_file_extent_type(eb, item);
e02119d5a7b439 Chris Mason           2008-09-05  661  
d899e05215178f Yan Zheng             2008-10-30  662  	if (found_type == BTRFS_FILE_EXTENT_REG ||
4bc4bee4595662 Josef Bacik           2013-04-05  663  	    found_type == BTRFS_FILE_EXTENT_PREALLOC) {
4bc4bee4595662 Josef Bacik           2013-04-05  664  		nbytes = btrfs_file_extent_num_bytes(eb, item);
4bc4bee4595662 Josef Bacik           2013-04-05  665  		extent_end = start + nbytes;
4bc4bee4595662 Josef Bacik           2013-04-05  666  
4bc4bee4595662 Josef Bacik           2013-04-05  667  		/*
4bc4bee4595662 Josef Bacik           2013-04-05  668  		 * We don't add to the inodes nbytes if we are prealloc or a
4bc4bee4595662 Josef Bacik           2013-04-05  669  		 * hole.
4bc4bee4595662 Josef Bacik           2013-04-05  670  		 */
4bc4bee4595662 Josef Bacik           2013-04-05  671  		if (btrfs_file_extent_disk_bytenr(eb, item) == 0)
4bc4bee4595662 Josef Bacik           2013-04-05  672  			nbytes = 0;
4bc4bee4595662 Josef Bacik           2013-04-05  673  	} else if (found_type == BTRFS_FILE_EXTENT_INLINE) {
e41ca5897489b1 Qu Wenruo             2018-06-06  674  		size = btrfs_file_extent_ram_bytes(eb, item);
4bc4bee4595662 Josef Bacik           2013-04-05  675  		nbytes = btrfs_file_extent_ram_bytes(eb, item);
da17066c40472c Jeff Mahoney          2016-06-15  676  		extent_end = ALIGN(start + size,
0b246afa62b0cf Jeff Mahoney          2016-06-22  677  				   fs_info->sectorsize);
e02119d5a7b439 Chris Mason           2008-09-05  678  	} else {
e02119d5a7b439 Chris Mason           2008-09-05  679  		ret = 0;
e02119d5a7b439 Chris Mason           2008-09-05  680  		goto out;
e02119d5a7b439 Chris Mason           2008-09-05  681  	}
e02119d5a7b439 Chris Mason           2008-09-05  682  
e02119d5a7b439 Chris Mason           2008-09-05  683  	inode = read_one_inode(root, key->objectid);
e02119d5a7b439 Chris Mason           2008-09-05  684  	if (!inode) {
e02119d5a7b439 Chris Mason           2008-09-05  685  		ret = -EIO;
e02119d5a7b439 Chris Mason           2008-09-05  686  		goto out;
e02119d5a7b439 Chris Mason           2008-09-05  687  	}
e02119d5a7b439 Chris Mason           2008-09-05  688  
e02119d5a7b439 Chris Mason           2008-09-05  689  	/*
e02119d5a7b439 Chris Mason           2008-09-05  690  	 * first check to see if we already have this extent in the
e02119d5a7b439 Chris Mason           2008-09-05  691  	 * file.  This must be done before the btrfs_drop_extents run
e02119d5a7b439 Chris Mason           2008-09-05  692  	 * so we don't try to drop this extent.
e02119d5a7b439 Chris Mason           2008-09-05  693  	 */
b4c50cbb01a1b6 Filipe Manana         2025-03-06  694  	ret = btrfs_lookup_file_extent(trans, root, path, btrfs_ino(inode), start, 0);
e02119d5a7b439 Chris Mason           2008-09-05  695  
d899e05215178f Yan Zheng             2008-10-30  696  	if (ret == 0 &&
d899e05215178f Yan Zheng             2008-10-30  697  	    (found_type == BTRFS_FILE_EXTENT_REG ||
d899e05215178f Yan Zheng             2008-10-30  698  	     found_type == BTRFS_FILE_EXTENT_PREALLOC)) {
e02119d5a7b439 Chris Mason           2008-09-05  699  		struct btrfs_file_extent_item cmp1;
e02119d5a7b439 Chris Mason           2008-09-05  700  		struct btrfs_file_extent_item cmp2;
e02119d5a7b439 Chris Mason           2008-09-05  701  		struct btrfs_file_extent_item *existing;
e02119d5a7b439 Chris Mason           2008-09-05  702  		struct extent_buffer *leaf;
e02119d5a7b439 Chris Mason           2008-09-05  703  
e02119d5a7b439 Chris Mason           2008-09-05  704  		leaf = path->nodes[0];
e02119d5a7b439 Chris Mason           2008-09-05  705  		existing = btrfs_item_ptr(leaf, path->slots[0],
e02119d5a7b439 Chris Mason           2008-09-05  706  					  struct btrfs_file_extent_item);
e02119d5a7b439 Chris Mason           2008-09-05  707  
e02119d5a7b439 Chris Mason           2008-09-05  708  		read_extent_buffer(eb, &cmp1, (unsigned long)item,
e02119d5a7b439 Chris Mason           2008-09-05  709  				   sizeof(cmp1));
e02119d5a7b439 Chris Mason           2008-09-05  710  		read_extent_buffer(leaf, &cmp2, (unsigned long)existing,
e02119d5a7b439 Chris Mason           2008-09-05  711  				   sizeof(cmp2));
e02119d5a7b439 Chris Mason           2008-09-05  712  
e02119d5a7b439 Chris Mason           2008-09-05  713  		/*
e02119d5a7b439 Chris Mason           2008-09-05  714  		 * we already have a pointer to this exact extent,
e02119d5a7b439 Chris Mason           2008-09-05  715  		 * we don't have to do anything
e02119d5a7b439 Chris Mason           2008-09-05  716  		 */
e02119d5a7b439 Chris Mason           2008-09-05  717  		if (memcmp(&cmp1, &cmp2, sizeof(cmp1)) == 0) {
b3b4aa74b58bde David Sterba          2011-04-21  718  			btrfs_release_path(path);
e02119d5a7b439 Chris Mason           2008-09-05  719  			goto out;
e02119d5a7b439 Chris Mason           2008-09-05  720  		}
e02119d5a7b439 Chris Mason           2008-09-05  721  	}
b3b4aa74b58bde David Sterba          2011-04-21  722  	btrfs_release_path(path);
e02119d5a7b439 Chris Mason           2008-09-05  723  
e02119d5a7b439 Chris Mason           2008-09-05  724  	/* drop any overlapping extents */
5893dfb98f2578 Filipe Manana         2020-11-04  725  	drop_args.start = start;
5893dfb98f2578 Filipe Manana         2020-11-04  726  	drop_args.end = extent_end;
5893dfb98f2578 Filipe Manana         2020-11-04  727  	drop_args.drop_cache = true;
b4c50cbb01a1b6 Filipe Manana         2025-03-06  728  	ret = btrfs_drop_extents(trans, root, inode, &drop_args);
3650860b90cc2a Josef Bacik           2013-04-25  729  	if (ret)
3650860b90cc2a Josef Bacik           2013-04-25  730  		goto out;
e02119d5a7b439 Chris Mason           2008-09-05  731  
07d400a6df4767 Yan Zheng             2009-01-06  732  	if (found_type == BTRFS_FILE_EXTENT_REG ||
07d400a6df4767 Yan Zheng             2009-01-06  733  	    found_type == BTRFS_FILE_EXTENT_PREALLOC) {
5d4f98a28c7d33 Yan Zheng             2009-06-10  734  		u64 offset;
07d400a6df4767 Yan Zheng             2009-01-06  735  		unsigned long dest_offset;
07d400a6df4767 Yan Zheng             2009-01-06  736  		struct btrfs_key ins;
07d400a6df4767 Yan Zheng             2009-01-06  737  
3168021cf9b490 Filipe Manana         2017-02-01  738  		if (btrfs_file_extent_disk_bytenr(eb, item) == 0 &&
3168021cf9b490 Filipe Manana         2017-02-01  739  		    btrfs_fs_incompat(fs_info, NO_HOLES))
3168021cf9b490 Filipe Manana         2017-02-01  740  			goto update_inode;
3168021cf9b490 Filipe Manana         2017-02-01  741  
07d400a6df4767 Yan Zheng             2009-01-06  742  		ret = btrfs_insert_empty_item(trans, root, path, key,
07d400a6df4767 Yan Zheng             2009-01-06  743  					      sizeof(*item));
3650860b90cc2a Josef Bacik           2013-04-25  744  		if (ret)
3650860b90cc2a Josef Bacik           2013-04-25  745  			goto out;
07d400a6df4767 Yan Zheng             2009-01-06  746  		dest_offset = btrfs_item_ptr_offset(path->nodes[0],
07d400a6df4767 Yan Zheng             2009-01-06  747  						    path->slots[0]);
07d400a6df4767 Yan Zheng             2009-01-06  748  		copy_extent_buffer(path->nodes[0], eb, dest_offset,
07d400a6df4767 Yan Zheng             2009-01-06  749  				(unsigned long)item,  sizeof(*item));
07d400a6df4767 Yan Zheng             2009-01-06  750  
07d400a6df4767 Yan Zheng             2009-01-06  751  		ins.objectid = btrfs_file_extent_disk_bytenr(eb, item);
07d400a6df4767 Yan Zheng             2009-01-06  752  		ins.type = BTRFS_EXTENT_ITEM_KEY;
dba6ae0b439f12 David Sterba          2025-02-12  753  		ins.offset = btrfs_file_extent_disk_num_bytes(eb, item);
5d4f98a28c7d33 Yan Zheng             2009-06-10  754  		offset = key->offset - btrfs_file_extent_offset(eb, item);
07d400a6df4767 Yan Zheng             2009-01-06  755  
df2c95f33e0a28 Qu Wenruo             2016-08-15  756  		/*
df2c95f33e0a28 Qu Wenruo             2016-08-15  757  		 * Manually record dirty extent, as here we did a shallow
df2c95f33e0a28 Qu Wenruo             2016-08-15  758  		 * file extent item copy and skip normal backref update,
df2c95f33e0a28 Qu Wenruo             2016-08-15  759  		 * but modifying extent tree all by ourselves.
df2c95f33e0a28 Qu Wenruo             2016-08-15  760  		 * So need to manually record dirty extent for qgroup,
df2c95f33e0a28 Qu Wenruo             2016-08-15  761  		 * as the owner of the file extent changed from log tree
df2c95f33e0a28 Qu Wenruo             2016-08-15  762  		 * (doesn't affect qgroup) to fs/file tree(affects qgroup)
df2c95f33e0a28 Qu Wenruo             2016-08-15  763  		 */
a95f3aafd6a2d0 Lu Fengqi             2018-07-18  764  		ret = btrfs_qgroup_trace_extent(trans,
df2c95f33e0a28 Qu Wenruo             2016-08-15  765  				btrfs_file_extent_disk_bytenr(eb, item),
e2896e791001b7 David Sterba          2022-10-14  766  				btrfs_file_extent_disk_num_bytes(eb, item));
df2c95f33e0a28 Qu Wenruo             2016-08-15  767  		if (ret < 0)
df2c95f33e0a28 Qu Wenruo             2016-08-15  768  			goto out;
df2c95f33e0a28 Qu Wenruo             2016-08-15  769  
07d400a6df4767 Yan Zheng             2009-01-06  770  		if (ins.objectid > 0) {
07d400a6df4767 Yan Zheng             2009-01-06  771  			u64 csum_start;
07d400a6df4767 Yan Zheng             2009-01-06  772  			u64 csum_end;
07d400a6df4767 Yan Zheng             2009-01-06  773  			LIST_HEAD(ordered_sums);
82fa113fccc41f Qu Wenruo             2019-04-04  774  
07d400a6df4767 Yan Zheng             2009-01-06  775  			/*
07d400a6df4767 Yan Zheng             2009-01-06  776  			 * is this extent already allocated in the extent
07d400a6df4767 Yan Zheng             2009-01-06  777  			 * allocation tree?  If so, just add a reference
07d400a6df4767 Yan Zheng             2009-01-06  778  			 */
2ff7e61e0d30ff Jeff Mahoney          2016-06-22  779  			ret = btrfs_lookup_data_extent(fs_info, ins.objectid,
07d400a6df4767 Yan Zheng             2009-01-06  780  						ins.offset);
3736127a3aa805 Marcos Paulo de Souza 2021-08-02  781  			if (ret < 0) {
3736127a3aa805 Marcos Paulo de Souza 2021-08-02  782  				goto out;
3736127a3aa805 Marcos Paulo de Souza 2021-08-02  783  			} else if (ret == 0) {
4d09b4e942bce2 Josef Bacik           2024-04-12  784  				struct btrfs_ref ref = {
4d09b4e942bce2 Josef Bacik           2024-04-12  785  					.action = BTRFS_ADD_DELAYED_REF,
4d09b4e942bce2 Josef Bacik           2024-04-12  786  					.bytenr = ins.objectid,
12390e42b69d7e Josef Bacik           2024-04-12  787  					.num_bytes = ins.offset,
e094f48040cda6 Josef Bacik           2024-04-15  788  					.owning_root = btrfs_root_id(root),
e094f48040cda6 Josef Bacik           2024-04-15  789  					.ref_root = btrfs_root_id(root),
4d09b4e942bce2 Josef Bacik           2024-04-12  790  				};
f2e69a77aa5150 Josef Bacik           2024-04-12  791  				btrfs_init_data_ref(&ref, key->objectid, offset,
f2e69a77aa5150 Josef Bacik           2024-04-12  792  						    0, false);
82fa113fccc41f Qu Wenruo             2019-04-04  793  				ret = btrfs_inc_extent_ref(trans, &ref);
b50c6e250ef913 Josef Bacik           2013-04-25  794  				if (ret)
b50c6e250ef913 Josef Bacik           2013-04-25  795  					goto out;
07d400a6df4767 Yan Zheng             2009-01-06  796  			} else {
07d400a6df4767 Yan Zheng             2009-01-06  797  				/*
07d400a6df4767 Yan Zheng             2009-01-06  798  				 * insert the extent pointer in the extent
07d400a6df4767 Yan Zheng             2009-01-06  799  				 * allocation tree
07d400a6df4767 Yan Zheng             2009-01-06  800  				 */
5d4f98a28c7d33 Yan Zheng             2009-06-10  801  				ret = btrfs_alloc_logged_file_extent(trans,
e094f48040cda6 Josef Bacik           2024-04-15  802  						btrfs_root_id(root),
5d4f98a28c7d33 Yan Zheng             2009-06-10  803  						key->objectid, offset, &ins);
b50c6e250ef913 Josef Bacik           2013-04-25  804  				if (ret)
b50c6e250ef913 Josef Bacik           2013-04-25  805  					goto out;
07d400a6df4767 Yan Zheng             2009-01-06  806  			}
b3b4aa74b58bde David Sterba          2011-04-21  807  			btrfs_release_path(path);
07d400a6df4767 Yan Zheng             2009-01-06  808  
07d400a6df4767 Yan Zheng             2009-01-06  809  			if (btrfs_file_extent_compression(eb, item)) {
07d400a6df4767 Yan Zheng             2009-01-06  810  				csum_start = ins.objectid;
07d400a6df4767 Yan Zheng             2009-01-06  811  				csum_end = csum_start + ins.offset;
07d400a6df4767 Yan Zheng             2009-01-06  812  			} else {
07d400a6df4767 Yan Zheng             2009-01-06  813  				csum_start = ins.objectid +
07d400a6df4767 Yan Zheng             2009-01-06  814  					btrfs_file_extent_offset(eb, item);
07d400a6df4767 Yan Zheng             2009-01-06  815  				csum_end = csum_start +
07d400a6df4767 Yan Zheng             2009-01-06  816  					btrfs_file_extent_num_bytes(eb, item);
07d400a6df4767 Yan Zheng             2009-01-06  817  			}
07d400a6df4767 Yan Zheng             2009-01-06  818  
97e3823933108c Qu Wenruo             2022-11-14  819  			ret = btrfs_lookup_csums_list(root->log_root,
07d400a6df4767 Yan Zheng             2009-01-06  820  						csum_start, csum_end - 1,
afcb80624f5bc2 Filipe Manana         2024-04-11  821  						&ordered_sums, false);
8d2a83a97f1c86 Filipe Manana         2024-04-12  822  			if (ret < 0)
3650860b90cc2a Josef Bacik           2013-04-25  823  				goto out;
8d2a83a97f1c86 Filipe Manana         2024-04-12  824  			ret = 0;
b84b8390d6009c Filipe Manana         2015-08-19  825  			/*
b84b8390d6009c Filipe Manana         2015-08-19  826  			 * Now delete all existing cums in the csum root that
b84b8390d6009c Filipe Manana         2015-08-19  827  			 * cover our range. We do this because we can have an
b84b8390d6009c Filipe Manana         2015-08-19  828  			 * extent that is completely referenced by one file
b84b8390d6009c Filipe Manana         2015-08-19  829  			 * extent item and partially referenced by another
b84b8390d6009c Filipe Manana         2015-08-19  830  			 * file extent item (like after using the clone or
b84b8390d6009c Filipe Manana         2015-08-19  831  			 * extent_same ioctls). In this case if we end up doing
b84b8390d6009c Filipe Manana         2015-08-19  832  			 * the replay of the one that partially references the
b84b8390d6009c Filipe Manana         2015-08-19  833  			 * extent first, and we do not do the csum deletion
b84b8390d6009c Filipe Manana         2015-08-19  834  			 * below, we can get 2 csum items in the csum tree that
b84b8390d6009c Filipe Manana         2015-08-19  835  			 * overlap each other. For example, imagine our log has
b84b8390d6009c Filipe Manana         2015-08-19  836  			 * the two following file extent items:
b84b8390d6009c Filipe Manana         2015-08-19  837  			 *
b84b8390d6009c Filipe Manana         2015-08-19  838  			 * key (257 EXTENT_DATA 409600)
b84b8390d6009c Filipe Manana         2015-08-19  839  			 *     extent data disk byte 12845056 nr 102400
b84b8390d6009c Filipe Manana         2015-08-19  840  			 *     extent data offset 20480 nr 20480 ram 102400
b84b8390d6009c Filipe Manana         2015-08-19  841  			 *
b84b8390d6009c Filipe Manana         2015-08-19  842  			 * key (257 EXTENT_DATA 819200)
b84b8390d6009c Filipe Manana         2015-08-19  843  			 *     extent data disk byte 12845056 nr 102400
b84b8390d6009c Filipe Manana         2015-08-19  844  			 *     extent data offset 0 nr 102400 ram 102400
b84b8390d6009c Filipe Manana         2015-08-19  845  			 *
b84b8390d6009c Filipe Manana         2015-08-19  846  			 * Where the second one fully references the 100K extent
b84b8390d6009c Filipe Manana         2015-08-19  847  			 * that starts at disk byte 12845056, and the log tree
b84b8390d6009c Filipe Manana         2015-08-19  848  			 * has a single csum item that covers the entire range
b84b8390d6009c Filipe Manana         2015-08-19  849  			 * of the extent:
b84b8390d6009c Filipe Manana         2015-08-19  850  			 *
b84b8390d6009c Filipe Manana         2015-08-19  851  			 * key (EXTENT_CSUM EXTENT_CSUM 12845056) itemsize 100
b84b8390d6009c Filipe Manana         2015-08-19  852  			 *
b84b8390d6009c Filipe Manana         2015-08-19  853  			 * After the first file extent item is replayed, the
b84b8390d6009c Filipe Manana         2015-08-19  854  			 * csum tree gets the following csum item:
b84b8390d6009c Filipe Manana         2015-08-19  855  			 *
b84b8390d6009c Filipe Manana         2015-08-19  856  			 * key (EXTENT_CSUM EXTENT_CSUM 12865536) itemsize 20
b84b8390d6009c Filipe Manana         2015-08-19  857  			 *
b84b8390d6009c Filipe Manana         2015-08-19  858  			 * Which covers the 20K sub-range starting at offset 20K
b84b8390d6009c Filipe Manana         2015-08-19  859  			 * of our extent. Now when we replay the second file
b84b8390d6009c Filipe Manana         2015-08-19  860  			 * extent item, if we do not delete existing csum items
b84b8390d6009c Filipe Manana         2015-08-19  861  			 * that cover any of its blocks, we end up getting two
b84b8390d6009c Filipe Manana         2015-08-19  862  			 * csum items in our csum tree that overlap each other:
b84b8390d6009c Filipe Manana         2015-08-19  863  			 *
b84b8390d6009c Filipe Manana         2015-08-19  864  			 * key (EXTENT_CSUM EXTENT_CSUM 12845056) itemsize 100
b84b8390d6009c Filipe Manana         2015-08-19  865  			 * key (EXTENT_CSUM EXTENT_CSUM 12865536) itemsize 20
b84b8390d6009c Filipe Manana         2015-08-19  866  			 *
b84b8390d6009c Filipe Manana         2015-08-19  867  			 * Which is a problem, because after this anyone trying
b84b8390d6009c Filipe Manana         2015-08-19  868  			 * to lookup up for the checksum of any block of our
b84b8390d6009c Filipe Manana         2015-08-19  869  			 * extent starting at an offset of 40K or higher, will
b84b8390d6009c Filipe Manana         2015-08-19  870  			 * end up looking at the second csum item only, which
b84b8390d6009c Filipe Manana         2015-08-19  871  			 * does not contain the checksum for any block starting
b84b8390d6009c Filipe Manana         2015-08-19  872  			 * at offset 40K or higher of our extent.
b84b8390d6009c Filipe Manana         2015-08-19  873  			 */
07d400a6df4767 Yan Zheng             2009-01-06  874  			while (!list_empty(&ordered_sums)) {
07d400a6df4767 Yan Zheng             2009-01-06  875  				struct btrfs_ordered_sum *sums;
fc28b25e1f4286 Josef Bacik           2021-11-05  876  				struct btrfs_root *csum_root;
fc28b25e1f4286 Josef Bacik           2021-11-05  877  
07d400a6df4767 Yan Zheng             2009-01-06  878  				sums = list_entry(ordered_sums.next,
07d400a6df4767 Yan Zheng             2009-01-06  879  						struct btrfs_ordered_sum,
07d400a6df4767 Yan Zheng             2009-01-06  880  						list);
fc28b25e1f4286 Josef Bacik           2021-11-05  881  				csum_root = btrfs_csum_root(fs_info,
5cfe76f846d503 Christoph Hellwig     2023-05-24  882  							    sums->logical);
b84b8390d6009c Filipe Manana         2015-08-19  883  				if (!ret)
fc28b25e1f4286 Josef Bacik           2021-11-05  884  					ret = btrfs_del_csums(trans, csum_root,
5cfe76f846d503 Christoph Hellwig     2023-05-24  885  							      sums->logical,
b84b8390d6009c Filipe Manana         2015-08-19  886  							      sums->len);
3650860b90cc2a Josef Bacik           2013-04-25  887  				if (!ret)
07d400a6df4767 Yan Zheng             2009-01-06  888  					ret = btrfs_csum_file_blocks(trans,
fc28b25e1f4286 Josef Bacik           2021-11-05  889  								     csum_root,
fc28b25e1f4286 Josef Bacik           2021-11-05  890  								     sums);
07d400a6df4767 Yan Zheng             2009-01-06  891  				list_del(&sums->list);
07d400a6df4767 Yan Zheng             2009-01-06  892  				kfree(sums);
07d400a6df4767 Yan Zheng             2009-01-06  893  			}
3650860b90cc2a Josef Bacik           2013-04-25  894  			if (ret)
3650860b90cc2a Josef Bacik           2013-04-25  895  				goto out;
07d400a6df4767 Yan Zheng             2009-01-06  896  		} else {
b3b4aa74b58bde David Sterba          2011-04-21  897  			btrfs_release_path(path);
07d400a6df4767 Yan Zheng             2009-01-06  898  		}
07d400a6df4767 Yan Zheng             2009-01-06  899  	} else if (found_type == BTRFS_FILE_EXTENT_INLINE) {
07d400a6df4767 Yan Zheng             2009-01-06  900  		/* inline extents are easy, we just overwrite them */
e02119d5a7b439 Chris Mason           2008-09-05  901  		ret = overwrite_item(trans, root, path, eb, slot, key);
3650860b90cc2a Josef Bacik           2013-04-25  902  		if (ret)
3650860b90cc2a Josef Bacik           2013-04-25  903  			goto out;
07d400a6df4767 Yan Zheng             2009-01-06  904  	}
e02119d5a7b439 Chris Mason           2008-09-05  905  
b4c50cbb01a1b6 Filipe Manana         2025-03-06  906  	ret = btrfs_inode_set_file_extent_range(inode, start, extent_end - start);
9ddc959e802bf7 Josef Bacik           2020-01-17  907  	if (ret)
9ddc959e802bf7 Josef Bacik           2020-01-17  908  		goto out;
9ddc959e802bf7 Josef Bacik           2020-01-17  909  
3168021cf9b490 Filipe Manana         2017-02-01  910  update_inode:
b4c50cbb01a1b6 Filipe Manana         2025-03-06  911  	btrfs_update_inode_bytes(inode, nbytes, drop_args.bytes_found);
b4c50cbb01a1b6 Filipe Manana         2025-03-06  912  	ret = btrfs_update_inode(trans, inode);
e02119d5a7b439 Chris Mason           2008-09-05  913  out:
b4c50cbb01a1b6 Filipe Manana         2025-03-06 @914  	iput(&inode->vfs_inode);
e02119d5a7b439 Chris Mason           2008-09-05  915  	return ret;
e02119d5a7b439 Chris Mason           2008-09-05  916  }
e02119d5a7b439 Chris Mason           2008-09-05  917  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
