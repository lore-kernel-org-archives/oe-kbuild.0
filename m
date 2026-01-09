Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47B329390
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951334; cv=none; b=hayHrZY6LXNj6mpyJAj+lxYAJXDlTA4u7BEfzPcqfXDiDRPdRREVEohEF+RyPbmdsyDLLqeHoQbhbx45NJCAE7doCW7zwHCRJ6li2e6UhVeJQ2y6o02o16MtNTv/Rl8Kc7NMH+iYfCCpcFR5uYXeXXfyX4POhmb6bSRGSmkYvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951334; c=relaxed/simple;
	bh=UP/qLGnomGIhqT25ZN8SmS7VAkUjJzGXkPie0wLIbM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=orMS8ixMaOcSAk7s3D63Tr5BNdeuFweL5jBTrAbzlbfhHK/y80S0jXB1b3hHzOXo9TD4G+bLVqjAA+NJ9mNK+XmdGsGd+Tn4ck8mXMDKRNwlYjNcYX2xS7TG3H0tNvxsAnPNombvfOkfXA1e/mQ4l9JjsCqf4l2sAqj4CdzuBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx9xbuYB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx9xbuYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951334; x=1799487334;
  h=date:from:to:cc:subject:message-id;
  bh=UP/qLGnomGIhqT25ZN8SmS7VAkUjJzGXkPie0wLIbM8=;
  b=Wx9xbuYBZa6gsANTdlCOR8gONj3/MpO7N2rHLaXTKG2/uQbYrc8hZffa
   qM6OoePUcfU4PmbS6xaKRIm3zjVTw8nsFqfxW0nl6Tks1rzokkKVzBofF
   9S5QitOw2+8I62ghBgoTWaOxWuWNH6WWgWREoUvQ32vO+tw7GG72aR2kQ
   cQAYN8y3kSItwkqLJtXbj8ijRMsiS5WRnmW4YslfvLnZaf3ctfthVnJ41
   04mqWxlSgBZ/w1GLm3MzFuJD1gwhma3cH6iY4J+mrP+jpI1CY1pswGYF2
   YkdzpmcyGm27VOwddlNvW5b6jBVzLnIGhblv7xB8IyTpnLUVhD3wrYq8H
   A==;
X-CSE-ConnectionGUID: yNhFIL0UR1mc8YlGchkXnQ==
X-CSE-MsgGUID: q7nUY2suR8eiHuPfJhRXzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91995759"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="91995759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:35:33 -0800
X-CSE-ConnectionGUID: RAJXZccuR6OWuS1J0uRqTw==
X-CSE-MsgGUID: QJbGr4DxS3mx6ePusXIZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="202639739"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2026 01:35:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve8u0-000000005hE-2kHQ;
	Fri, 09 Jan 2026 09:35:28 +0000
Date: Fri, 09 Jan 2026 17:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/mft.c:2614
 ntfs_mft_record_free() warn: variable dereferenced before check 'ni' (see
 line 2612)
Message-ID: <202601091748.orF9z9Bx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   c9fb91b2b8b4c46188b1a280187d41e9ebb93cb2
commit: 4816227dce428c85178afc885b301780d1da7bda [13/14] ntfs: add Kconfig and Makefile
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091748.orF9z9Bx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601091748.orF9z9Bx-lkp@intel.com/

New smatch warnings:
fs/ntfs/mft.c:2614 ntfs_mft_record_free() warn: variable dereferenced before check 'ni' (see line 2612)
fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'ni' (see line 120)
fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferenced before check 'attr' (see line 120)
fs/ntfs/runlist.c:692 ntfs_mapping_pairs_decompress() warn: unsigned '((__builtin_constant_p((attr->data.non_resident.lowest_vcn))) ?((((((attr->data.non_resident.lowest_vcn)) & 255) << 56) | ((((attr->data.non_resident.lowest_vcn)) & 65280) << 40) | ((((attr->data.non_resident.lowest_vcn)) & 16711680) << 24) | ((((attr->data.non_resident.lowest_vcn)) & 4278190080) << 8) | ((((attr->data.non_resident.lowest_vcn)) & 1095216660480) >> 8) | ((((attr->data.non_resident.lowest_vcn)) & 280375465082880) >> 24) | ((((attr->data.non_resident.lowest_vcn)) & 71776119061217280) >> 40) |' is never less than zero.
fs/ntfs/attrib.c:2095 ntfs_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2091)
fs/ntfs/attrib.c:2217 ntfs_non_resident_attr_record_add() warn: variable dereferenced before check 'ni' (see line 2212)
fs/ntfs/attrib.c:2776 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2773)

Old smatch warnings:
fs/ntfs/mft.c:1054 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2554 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2132)
fs/ntfs/runlist.c:1586 ntfs_rl_insert_range() warn: variable dereferenced before check 'src_rl' (see line 1583)
fs/ntfs/attrib.c:176 ntfs_map_runlist_nolock() error: uninitialized symbol 'ctx_needs_reset'.
fs/ntfs/attrib.c:4909 ntfs_attr_remove() warn: variable dereferenced before check 'ni' (see line 4908)

vim +/ni +2614 fs/ntfs/mft.c

7bfba19057c055 Namjae Jeon 2025-12-30  2590  
7bfba19057c055 Namjae Jeon 2025-12-30  2591  /**
63adbe420afd6b Namjae Jeon 2026-01-06  2592   * ntfs_mft_record_free - free an mft record on an ntfs volume
63adbe420afd6b Namjae Jeon 2026-01-06  2593   * @vol:	volume on which to free the mft record
63adbe420afd6b Namjae Jeon 2026-01-06  2594   * @ni:		open ntfs inode of the mft record to free
7bfba19057c055 Namjae Jeon 2025-12-30  2595   *
63adbe420afd6b Namjae Jeon 2026-01-06  2596   * Free the mft record of the open inode @ni on the mounted ntfs volume @vol.
63adbe420afd6b Namjae Jeon 2026-01-06  2597   * Note that this function calls ntfs_inode_close() internally and hence you
63adbe420afd6b Namjae Jeon 2026-01-06  2598   * cannot use the pointer @ni any more after this function returns success.
7bfba19057c055 Namjae Jeon 2025-12-30  2599   *
63adbe420afd6b Namjae Jeon 2026-01-06  2600   * On success return 0 and on error return -1 with errno set to the error code.
7bfba19057c055 Namjae Jeon 2025-12-30  2601   */
63adbe420afd6b Namjae Jeon 2026-01-06  2602  int ntfs_mft_record_free(struct ntfs_volume *vol, struct ntfs_inode *ni)
7bfba19057c055 Namjae Jeon 2025-12-30  2603  {
63adbe420afd6b Namjae Jeon 2026-01-06  2604  	u64 mft_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2605  	int err;
7bfba19057c055 Namjae Jeon 2025-12-30  2606  	u16 seq_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2607  	__le16 old_seq_no;
63adbe420afd6b Namjae Jeon 2026-01-06  2608  	struct mft_record *ni_mrec;
63adbe420afd6b Namjae Jeon 2026-01-06  2609  	unsigned int memalloc_flags;
63adbe420afd6b Namjae Jeon 2026-01-06  2610  	struct ntfs_inode *base_ni;
7bfba19057c055 Namjae Jeon 2025-12-30  2611  
63adbe420afd6b Namjae Jeon 2026-01-06 @2612  	ntfs_debug("Entering for inode 0x%llx.\n", (long long)ni->mft_no);
7bfba19057c055 Namjae Jeon 2025-12-30  2613  
63adbe420afd6b Namjae Jeon 2026-01-06 @2614  	if (!vol || !ni)

:::::: The code at line 2614 was first introduced by commit
:::::: 63adbe420afd6be91e00492f597eb4ff7d7259d5 ntfs: update inode operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
