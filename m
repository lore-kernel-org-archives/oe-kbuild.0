Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DFC364044
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629224; cv=none; b=YEWElNlE9L5+NfBInEGSBDHNGKicdT9gtF79cCeWTMosjti2hY66+cNUJzSwt6Kla0+VCso/Hickb8rKdaFkOtdYxSIA2Pi+LT/L+rWJVyt4LAqXb99C2EkPkOjCpLzqlPrIHAlf9qFDwe1CIOgCwcHco8l8MHEWBGvjSc+w4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629224; c=relaxed/simple;
	bh=xAMEgmEkR18Uhjq2S4yBVVjI0PCMD1T+oEd4EU0lNbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d++dR84SZQ+HPz3YgpE0NThPbZABDZB9r1bR6VcEEPP0Gvtny5jqfh/akkrGbSf54iCWQVUh970ctvugNsqLEvAz5rZA/6Urg5HwlBFbJ7FnVpALBTkH9/UjJPP2VJzxl0pT1fb7PLm6qmY6eG51akjKKAZuikmtFTb5EVnk1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDYUXmn1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDYUXmn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770629225; x=1802165225;
  h=date:from:to:cc:subject:message-id;
  bh=xAMEgmEkR18Uhjq2S4yBVVjI0PCMD1T+oEd4EU0lNbM=;
  b=VDYUXmn1YPc09tQI7vFdfqmjNYk9Elgpwd/rh30yki/ssD3mO3wF9RL1
   wr/G/Z15f6DHmtUlMhxPzNm9xPXlMl5kRCBUoTqivyFeyNwJD3+egofms
   EMRA+cET47+Y3U64YtHGAaFolNUHwY/5TdSau/B1FjXULkCFXNhW16LDH
   g+m3O/dMmiQYwO7/Y4tp2PRomGYThFM5uPNm8IlbI5aq+cDseU95PAAdy
   Bls43Bzebs+nCuVZnoWrcLci32S/ELWUmXCK0qKiQht9aVxJDT6cW9YWe
   FmCT2/t1pYlsfZ1Nvoutcss1PlMcxB5xsCd+Q23/29SmgUsjH6LLx3L3Q
   Q==;
X-CSE-ConnectionGUID: tDAj0AyfQJmjurIV79VySQ==
X-CSE-MsgGUID: ZOYcCCOYROOcVNBk5Qdssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71776576"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71776576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 01:27:04 -0800
X-CSE-ConnectionGUID: NpI9fyh+RtqCsB0AJZnWgQ==
X-CSE-MsgGUID: 1Q6h6Zx9RUeYouxT9Q7ArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="215953519"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2026 01:27:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpNXo-00000000mrk-02d7;
	Mon, 09 Feb 2026 09:27:00 +0000
Date: Mon, 09 Feb 2026 17:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [fdmanana:for-next 15/17] fs/btrfs/free-space-tree.c:1157
 populate_free_space_tree() warn: inconsistent returns
 '&block_group->free_space_lock'.
Message-ID: <202602091703.F4BhrHHr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fdmanana/linux.git for-next
head:   5a96a405b78b87a71b34c2587942af29d85da506
commit: 0f57b1b3bcd514fc65690a93ec694ef732d46985 [15/17] btrfs: check for NULL root after calls to btrfs_extent_root()
:::::: branch date: 11 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-161-20260209 (https://download.01.org/0day-ci/archive/20260209/202602091703.F4BhrHHr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602091703.F4BhrHHr-lkp@intel.com/

smatch warnings:
fs/btrfs/free-space-tree.c:1157 populate_free_space_tree() warn: inconsistent returns '&block_group->free_space_lock'.

vim +1157 fs/btrfs/free-space-tree.c

a5ed91828518ab0 Omar Sandoval   2015-09-29  1046  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1047  /*
a5ed91828518ab0 Omar Sandoval   2015-09-29  1048   * Populate the free space tree by walking the extent tree. Operations on the
a5ed91828518ab0 Omar Sandoval   2015-09-29  1049   * extent tree that happen as a result of writes to the free space tree will go
a5ed91828518ab0 Omar Sandoval   2015-09-29  1050   * through the normal add/remove hooks.
a5ed91828518ab0 Omar Sandoval   2015-09-29  1051   */
a5ed91828518ab0 Omar Sandoval   2015-09-29  1052  static int populate_free_space_tree(struct btrfs_trans_handle *trans,
32da5386d9a4fd5 David Sterba    2019-10-29  1053  				    struct btrfs_block_group *block_group)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1054  {
29cbcf401793f4e Josef Bacik     2021-11-05  1055  	struct btrfs_root *extent_root;
3bfd9ead8131e02 David Sterba    2025-02-24  1056  	BTRFS_PATH_AUTO_FREE(path);
3bfd9ead8131e02 David Sterba    2025-02-24  1057  	BTRFS_PATH_AUTO_FREE(path2);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1058  	struct btrfs_key key;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1059  	u64 start, end;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1060  	int ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1061  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1062  	path = btrfs_alloc_path();
a5ed91828518ab0 Omar Sandoval   2015-09-29  1063  	if (!path)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1064  		return -ENOMEM;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1065  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1066  	path2 = btrfs_alloc_path();
3bfd9ead8131e02 David Sterba    2025-02-24  1067  	if (!path2)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1068  		return -ENOMEM;
3bfd9ead8131e02 David Sterba    2025-02-24  1069  
3bfd9ead8131e02 David Sterba    2025-02-24  1070  	path->reada = READA_FORWARD;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1071  
66afee18485932a Nikolay Borisov 2018-05-10  1072  	ret = add_new_free_space_info(trans, block_group, path2);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1073  	if (ret)
3bfd9ead8131e02 David Sterba    2025-02-24  1074  		return ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1075  
511711af91f21d8 Chris Mason     2015-12-30  1076  	mutex_lock(&block_group->free_space_lock);
511711af91f21d8 Chris Mason     2015-12-30  1077  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1078  	/*
a5ed91828518ab0 Omar Sandoval   2015-09-29  1079  	 * Iterate through all of the extent and metadata items in this block
a5ed91828518ab0 Omar Sandoval   2015-09-29  1080  	 * group, adding the free space between them and the free space at the
a5ed91828518ab0 Omar Sandoval   2015-09-29  1081  	 * end. Note that EXTENT_ITEM and METADATA_ITEM are less than
a5ed91828518ab0 Omar Sandoval   2015-09-29  1082  	 * BLOCK_GROUP_ITEM, so an extent may precede the block group that it's
a5ed91828518ab0 Omar Sandoval   2015-09-29  1083  	 * contained in.
a5ed91828518ab0 Omar Sandoval   2015-09-29  1084  	 */
b3470b5dbe1300d David Sterba    2019-10-23  1085  	key.objectid = block_group->start;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1086  	key.type = BTRFS_EXTENT_ITEM_KEY;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1087  	key.offset = 0;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1088  
29cbcf401793f4e Josef Bacik     2021-11-05  1089  	extent_root = btrfs_extent_root(trans->fs_info, key.objectid);
0f57b1b3bcd514f Filipe Manana   2026-02-08  1090  	if (unlikely(!extent_root)) {
0f57b1b3bcd514f Filipe Manana   2026-02-08  1091  		btrfs_err(trans->fs_info,
0f57b1b3bcd514f Filipe Manana   2026-02-08  1092  			  "missing extent root for block group at offset %llu",
0f57b1b3bcd514f Filipe Manana   2026-02-08  1093  			  key.objectid);
0f57b1b3bcd514f Filipe Manana   2026-02-08  1094  		return -EUCLEAN;
0f57b1b3bcd514f Filipe Manana   2026-02-08  1095  	}
0f57b1b3bcd514f Filipe Manana   2026-02-08  1096  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1097  	ret = btrfs_search_slot_for_read(extent_root, &key, path, 1, 0);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1098  	if (ret < 0)
511711af91f21d8 Chris Mason     2015-12-30  1099  		goto out_locked;
1961d20f6fa8903 Filipe Manana   2025-06-05  1100  	/*
1961d20f6fa8903 Filipe Manana   2025-06-05  1101  	 * If ret is 1 (no key found), it means this is an empty block group,
1961d20f6fa8903 Filipe Manana   2025-06-05  1102  	 * without any extents allocated from it and there's no block group
1961d20f6fa8903 Filipe Manana   2025-06-05  1103  	 * item (key BTRFS_BLOCK_GROUP_ITEM_KEY) located in the extent tree
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1104  	 * because we are using the block group tree feature (so block group
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1105  	 * items are stored in the block group tree) or this is a new block
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1106  	 * group created in the current transaction and its block group item
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1107  	 * was not yet inserted in the extent tree (that happens in
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1108  	 * btrfs_create_pending_block_groups() -> insert_block_group_item()).
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1109  	 * It also means there are no extents allocated for block groups with a
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1110  	 * start offset beyond this block group's end offset (this is the last,
a5a51bf4e9b7354 Filipe Manana   2025-10-01  1111  	 * highest, block group).
1961d20f6fa8903 Filipe Manana   2025-06-05  1112  	 */
b3470b5dbe1300d David Sterba    2019-10-23  1113  	start = block_group->start;
4ac81c381102beb Filipe Manana   2026-01-16  1114  	end = btrfs_block_group_end(block_group);
1961d20f6fa8903 Filipe Manana   2025-06-05  1115  	while (ret == 0) {
a5ed91828518ab0 Omar Sandoval   2015-09-29  1116  		btrfs_item_key_to_cpu(path->nodes[0], &key, path->slots[0]);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1117  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1118  		if (key.type == BTRFS_EXTENT_ITEM_KEY ||
a5ed91828518ab0 Omar Sandoval   2015-09-29  1119  		    key.type == BTRFS_METADATA_ITEM_KEY) {
a5ed91828518ab0 Omar Sandoval   2015-09-29  1120  			if (key.objectid >= end)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1121  				break;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1122  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1123  			if (start < key.objectid) {
6fc5ef7829887c5 Filipe Manana   2025-06-11  1124  				ret = __btrfs_add_to_free_space_tree(trans,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1125  								     block_group,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1126  								     path2, start,
a5ed91828518ab0 Omar Sandoval   2015-09-29  1127  								     key.objectid -
a5ed91828518ab0 Omar Sandoval   2015-09-29  1128  								     start);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1129  				if (ret)
511711af91f21d8 Chris Mason     2015-12-30  1130  					goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1131  			}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1132  			start = key.objectid;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1133  			if (key.type == BTRFS_METADATA_ITEM_KEY)
ffa9a9ef2f08c61 Nikolay Borisov 2018-05-10  1134  				start += trans->fs_info->nodesize;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1135  			else
a5ed91828518ab0 Omar Sandoval   2015-09-29  1136  				start += key.offset;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1137  		} else if (key.type == BTRFS_BLOCK_GROUP_ITEM_KEY) {
b3470b5dbe1300d David Sterba    2019-10-23  1138  			if (key.objectid != block_group->start)
a5ed91828518ab0 Omar Sandoval   2015-09-29  1139  				break;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1140  		}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1141  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1142  		ret = btrfs_next_item(extent_root, path);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1143  		if (ret < 0)
511711af91f21d8 Chris Mason     2015-12-30  1144  			goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1145  	}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1146  	if (start < end) {
6fc5ef7829887c5 Filipe Manana   2025-06-11  1147  		ret = __btrfs_add_to_free_space_tree(trans, block_group, path2,
2d5cffa1b0d5eca Nikolay Borisov 2018-05-10  1148  						     start, end - start);
a5ed91828518ab0 Omar Sandoval   2015-09-29  1149  		if (ret)
511711af91f21d8 Chris Mason     2015-12-30  1150  			goto out_locked;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1151  	}
a5ed91828518ab0 Omar Sandoval   2015-09-29  1152  
a5ed91828518ab0 Omar Sandoval   2015-09-29  1153  	ret = 0;
511711af91f21d8 Chris Mason     2015-12-30  1154  out_locked:
511711af91f21d8 Chris Mason     2015-12-30  1155  	mutex_unlock(&block_group->free_space_lock);
3bfd9ead8131e02 David Sterba    2025-02-24  1156  
a5ed91828518ab0 Omar Sandoval   2015-09-29 @1157  	return ret;
a5ed91828518ab0 Omar Sandoval   2015-09-29  1158  }
a5ed91828518ab0 Omar Sandoval   2015-09-29  1159  

:::::: The code at line 1157 was first introduced by commit
:::::: a5ed91828518ab076209266c2bc510adabd078df Btrfs: implement the free space B-tree

:::::: TO: Omar Sandoval <osandov@fb.com>
:::::: CC: Chris Mason <clm@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
