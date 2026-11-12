Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480225;
	b=oNOmoY7dqqVlSlElYdgvU1aJDSlmA+GhtNHvp3dTQtoGyaM4AC8pi0z7kYzPO2YNPLIm
	 hwvyRf2On7meeOIRjjMNmmIGum5ZrXLxhDHMFapk+m8jCC7mETeXhQE+kIWoF9t+sQBiE
	 ZmiFxTj43jjUzsxNAtk5Hd0GFFJZImy/tJ4QQ1Zui3nRg5JirtVU4fcvaaRRgvp/okOgI
	 3mcdEqytHgKoPZzd5+z+zbAAUs2mkLclLApMTWPSp7W0nqrR483KC5aHuO4Aumzv1f9nb
	 dDjhkpxBVt7Mn9JgiNyKeddRbF4tusxhE2hh3FQbQv6gs00w5xSslj7gSM9C1fRtMNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480225;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u40GOulL75FsjG2P0NNCjXed88BYrfXU8C/BsPqQz8s=;
	b=yT/mzPDp1FqNHGMfJJN/H9qea8py/EFBZmDEe8ybG+gA13PXT23Ysp4ER6KUZhZgWmHZ
	 +xon8AuzeN2bYtPYEohk8a6sUI6F0dsyqbFGyBm/FFogL5MrG9wDMKiSg//lsK8Lmp+e0
	 mki/4WEgwSnU1gpLfgb3Mmef0JG/jQQtNNXVPhjaHUqcn7MPCeemLuF7d6c7Pigp5Xin0
	 LY3MPGmSY9uE2E9lAgh/c0xCuqyXSY3wxZCpWuF/NgU0iRSE/ihwHvqFNTpi8MTfRkAI0
	 LKhUaALe0DtdVagDpXadRTtqvF28lPzmr6xYUwhPna6q1lNB4pdZIKBjJEckXWuqGrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kDjDHIPU;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8689E606A33A
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 10:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8689E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kDjDHIPU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794480224; x=1826016224;
  h=date:from:to:cc:subject:message-id;
  bh=oQVM/+5v1fXkEJMTWSbxVoynqTwGdbQo4wbK6D+5++M=;
  b=kDjDHIPUmrCytKePROfIfikLZItTyM1AZK39n90luJQjA5Lzl9OHgupU
   OB9AnRoKiVPTysi+J3k82rPvCLCrBAxa3UhsfFVard5xbDxRwRilCMEEv
   EK/Fv2Bigu25E/7Bc2nLMla+ao1qkp9vqs+f5CTVK9SpZaFOrG3oXhGgN
   KsYNw8AAWN5ARhuglLHTRt+CekzaebYSGjgUWNsgJwWUtMn2MukRe3I9P
   mt8hZ/kXI4mRNUOQ4iMXCqw7WKNkjGqXEu5D1lFwNx8QgZnzzCS+Fza1a
   qIdsUS89P6JOfcaDxMFMW/oXIC220F6CV9y/0mxAhfl2bAicZoIAUsCE9
   g==;
X-CSE-ConnectionGUID: MIWnat1/QAWCrkQVSsn0mw==
X-CSE-MsgGUID: n0C2D1+wQ1eJ0fdtWQXf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3170761"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3170761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 02:43:43 -0800
X-CSE-ConnectionGUID: P61q2ELURkyvBjwVCzlsvQ==
X-CSE-MsgGUID: C4GFbxHOQQas7DFbA42ZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8783504"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 02:43:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRSHL-000000000r9-0iYs;
	Thu, 12 Nov 2026 10:43:39 +0000
Date: Thu, 12 Nov 2026 11:42:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 10/50] fs/ext4/inode-test.c:949
 inode_test_setup() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611121115.YR7OUKaU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: b7726d1eef1e9e04ca9ab1b71d90f89812df4874 [10/50] ext4: expand KUnit tests for fs/ext4/inode.c
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121115.YR7OUKaU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121115.YR7OUKaU-lkp@intel.com/

New smatch warnings:
fs/ext4/inode-test.c:949 inode_test_setup() error: 'sb' dereferencing possible ERR_PTR()
fs/ext4/inode-test.c:1820 inode_test_get_inode_loc_variants() error: dereferencing freed memory 'iloc.bh' (line 1803)
fs/ext4/inode-test.c:1843 inode_test_get_inode_loc_variants() warn: passing freed memory 'iloc.bh' (line 1824)
fs/ext4/inode-test.c:1916 inode_test_iget_validation_and_modes() warn: passing zero to 'PTR_ERR'
fs/ext4/inode-test.c:2791 inode_test_get_block_bread_and_walk_buffers() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/ext4/inode-test.c:1960 inode_test_iget_validation_and_modes() warn: passing zero to 'PTR_ERR'
fs/ext4/inode-test.c:1973 inode_test_iget_validation_and_modes() warn: passing zero to 'PTR_ERR'
arch/powerpc/include/asm/cpu_has_feature.h:38 cpu_has_feature() warn: bitwise AND condition is false here
arch/powerpc/include/asm/cpu_has_feature.h:12 early_cpu_has_feature() warn: bitwise AND condition is false here

vim +/sb +949 fs/ext4/inode-test.c

b7726d1eef1e9e Theodore Ts'o 2026-11-05   918  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   919  static struct inode_test_ctx *inode_test_setup(struct kunit *test)
b7726d1eef1e9e Theodore Ts'o 2026-11-05   920  {
b7726d1eef1e9e Theodore Ts'o 2026-11-05   921  	struct inode_test_ctx *ctx;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   922  	struct fs_context *fc;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   923  	struct super_block *sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   924  	struct ext4_sb_info *sbi;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   925  	struct inode *inode;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   926  	int err, i;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   927  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   928  	ctx = kzalloc_obj(*ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   929  	KUNIT_ASSERT_NOT_NULL(test, ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   930  	test->priv = ctx;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   931  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   932  	fc = fs_context_for_mount(&inode_test_fs_type, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   933  	if (IS_ERR(fc)) {
b7726d1eef1e9e Theodore Ts'o 2026-11-05   934  		err = PTR_ERR(fc);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   935  		kfree(ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   936  		KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   937  	}
b7726d1eef1e9e Theodore Ts'o 2026-11-05   938  	sb = sget_fc(fc, NULL, set_anon_super_fc);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   939  	put_fs_context(fc);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   940  	if (IS_ERR(sb)) {
b7726d1eef1e9e Theodore Ts'o 2026-11-05   941  		err = PTR_ERR(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   942  		kfree(ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   943  		KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   944  	}
b7726d1eef1e9e Theodore Ts'o 2026-11-05   945  	ctx->sb = sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   946  	sbi = &ctx->sbi;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   947  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   948  	sbi->s_sb = sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  @949  	sb->s_fs_info = sbi;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   950  	sb->s_op = &inode_test_sops;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   951  #ifdef CONFIG_QUOTA
b7726d1eef1e9e Theodore Ts'o 2026-11-05   952  	sb->dq_op = &inode_test_qops;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   953  #endif
b7726d1eef1e9e Theodore Ts'o 2026-11-05   954  	sb->s_flags |= SB_ACTIVE;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   955  	sb->s_blocksize = INODE_TEST_BLK_SIZE;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   956  	sb->s_blocksize_bits = INODE_TEST_BLK_BITS;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   957  	sb->s_maxbytes = MAX_LFS_FILESIZE;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   958  	sb->s_time_gran = 1;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   959  	sb->s_xattr = ext4_xattr_handlers;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   960  	strscpy(sb->s_id, "ext4_inode_kunit", sizeof(sb->s_id));
b7726d1eef1e9e Theodore Ts'o 2026-11-05   961  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   962  	inode_init_once(&ctx->bd_inode);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   963  	ctx->bd_inode.i_sb = sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   964  	ctx->bd_inode.i_blkbits = INODE_TEST_BLK_BITS;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   965  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   966  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   967  	ctx->bdev_queue.limits.logical_block_size = 512;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   968  	ctx->bdev_queue.limits.dma_alignment = 511;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   969  	ctx->bdev.bd_queue = &ctx->bdev_queue;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   970  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   971  	bdev_set_flag(&ctx->bdev, BD_READ_ONLY);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   972  	sb->s_bdev = &ctx->bdev;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   973  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   974  	sbi->s_es = &ctx->es;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   975  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   976  	ctx->es.s_first_data_block = cpu_to_le32(1);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   977  	ctx->es.s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   978  	ctx->es.s_creator_os = cpu_to_le32(EXT4_OS_LINUX);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   979  	ctx->es.s_inodes_count = cpu_to_le32(INODE_TEST_INODES_PER_GRP);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   980  	ctx->es.s_inodes_per_group = cpu_to_le32(INODE_TEST_INODES_PER_GRP);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   981  	ctx->es.s_first_ino = cpu_to_le32(INODE_TEST_FIRST_INO);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   982  	ctx->es.s_inode_size = cpu_to_le16(INODE_TEST_INODE_SIZE);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   983  	ctx->es.s_min_extra_isize = cpu_to_le16(INODE_TEST_EXTRA_ISIZE);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   984  	ctx->es.s_want_extra_isize = cpu_to_le16(INODE_TEST_EXTRA_ISIZE);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   985  	ctx->es.s_checksum_type = EXT4_CRC32C_CHKSUM;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   986  	ext4_blocks_count_set(&ctx->es, INODE_TEST_TOTAL_BLKS);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   987  	ext4_set_feature_extents(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   988  	ext4_set_feature_extra_isize(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   989  	ext4_set_feature_metadata_csum(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   990  	ext4_set_feature_64bit(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   991  	ext4_set_feature_huge_file(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   992  	ext4_set_feature_large_file(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   993  	ext4_set_feature_dir_index(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   994  
b7726d1eef1e9e Theodore Ts'o 2026-11-05   995  	ctx->sb_bh.b_data = (char *)&ctx->es;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   996  	ctx->sb_bh.b_size = sizeof(ctx->es);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   997  	ctx->sb_bh.b_bdev = &ctx->bdev;
b7726d1eef1e9e Theodore Ts'o 2026-11-05   998  	atomic_set(&ctx->sb_bh.b_count, 1);
b7726d1eef1e9e Theodore Ts'o 2026-11-05   999  	set_buffer_uptodate(&ctx->sb_bh);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1000  	sbi->s_sbh = &ctx->sb_bh;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1001  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1002  	sbi->s_inode_size = INODE_TEST_INODE_SIZE;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1003  	sbi->s_inodes_per_block = INODE_TEST_INODES_PER_BLK;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1004  	sbi->s_inodes_per_group = INODE_TEST_INODES_PER_GRP;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1005  	sbi->s_first_ino = INODE_TEST_FIRST_INO;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1006  	sbi->s_want_extra_isize = INODE_TEST_EXTRA_ISIZE;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1007  	sbi->s_blocks_per_group = INODE_TEST_TOTAL_BLKS;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1008  	sbi->s_clusters_per_group = INODE_TEST_TOTAL_BLKS;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1009  	sbi->s_cluster_ratio = 1;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1010  	sbi->s_cluster_bits = 0;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1011  	sbi->s_groups_count = 1;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1012  	sbi->s_gdb_count = 1;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1013  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1014  	sbi->s_desc_per_block = INODE_TEST_BLK_SIZE / EXT4_MIN_DESC_SIZE_64BIT;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1015  	sbi->s_bitmap_maxbytes = 0x1ff7ffff000ULL;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1016  	sbi->s_extent_max_zeroout_kb = 32;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1017  	sbi->s_csum_seed = INODE_TEST_CSUM_SEED;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1018  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1019  	ext4_inode_bitmap_set(sb, &ctx->gdp, INODE_TEST_IBITMAP_BLK);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1020  	ext4_inode_table_set(sb, &ctx->gdp, INODE_TEST_ITABLE_BLK0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1021  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1022  	set_opt(sb, ERRORS_CONT);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1023  	set_opt(sb, ORDERED_DATA);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1024  	set_opt(sb, DELALLOC);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1025  	set_opt(sb, XATTR_USER);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1026  	spin_lock_init(&sbi->s_bdev_wb_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1027  	spin_lock_init(&sbi->s_error_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1028  	spin_lock_init(&sbi->s_md_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1029  	mutex_init(&sbi->s_fc_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1030  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1031  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1032  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1033  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1034  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1035  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1036  			     DEFAULT_RATELIMIT_INTERVAL, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1037  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1038  			     DEFAULT_RATELIMIT_INTERVAL, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1039  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1040  			     DEFAULT_RATELIMIT_INTERVAL, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1041  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1042  	err = percpu_counter_init(&sbi->s_freeclusters_counter, 4096,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1043  				  GFP_KERNEL);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1044  	if (err) {
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1045  		deactivate_locked_super(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1046  		kfree(ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1047  		KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1048  	}
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1049  	err = percpu_counter_init(&sbi->s_dirtyclusters_counter, 0,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1050  				  GFP_KERNEL);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1051  	if (err) {
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1052  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1053  		deactivate_locked_super(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1054  		kfree(ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1055  		KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1056  	}
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1057  	err = ext4_es_register_shrinker(sbi);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1058  	if (err) {
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1059  		percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1060  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1061  		deactivate_locked_super(sb);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1062  		kfree(ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1063  		KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1064  	}
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1065  	sbi->s_es_shrinker->count_objects = inode_test_shrinker_count;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1066  	sbi->s_es_shrinker->scan_objects = inode_test_shrinker_scan;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1067  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1068  	/* Initialize mock block pool */
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1069  	inode_test_setup_blk(ctx, 0, INODE_TEST_IBITMAP_BLK, true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1070  	inode_test_setup_blk(ctx, 1, INODE_TEST_ITABLE_BLK0, true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1071  	inode_test_setup_blk(ctx, 2, INODE_TEST_ITABLE_BLK1, true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1072  	inode_test_setup_blk(ctx, 3, INODE_TEST_META_BLK0, true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1073  	inode_test_setup_blk(ctx, 4, INODE_TEST_META_BLK1, true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1074  	for (i = 0; i < INODE_TEST_DATA_NBLKS; i++)
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1075  		inode_test_setup_blk(ctx, 5 + i, INODE_TEST_DATA_BLK0 + i,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1076  				     true, true);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1077  	ctx->next_alloc_pblk = INODE_TEST_DATA_BLK0;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1078  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1079  	/* Initialize standalone mock inode */
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1080  	inode = &ctx->ei.vfs_inode;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1081  	init_rwsem(&ctx->ei.i_data_sem);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1082  	inode_init_once(inode);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1083  	inode->i_sb = sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1084  	inode->i_mapping = &inode->i_data;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1085  	inode->i_data.host = inode;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1086  	mapping_set_gfp_mask(&inode->i_data, GFP_HIGHUSER_MOVABLE);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1087  	init_rwsem(&inode->i_rwsem);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1088  	init_rwsem(&inode->i_data.invalidate_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1089  	spin_lock_init(&inode->i_lock);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1090  	inode->__i_nlink = 1;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1091  	atomic_set(&inode->i_count, 1);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1092  	inode_test_init_ei_fields(&ctx->ei);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1093  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1094  	ctx->root_dentry.d_sb = sb;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1095  	ctx->root_dentry.d_inode = inode;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1096  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1097  	up_write(&sb->s_umount);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1098  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1099  	kunit_activate_static_stub(test, ext4_get_group_desc,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1100  				   inode_test_get_group_desc_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1101  	kunit_activate_static_stub(test, ext4_sb_getblk,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1102  				   inode_test_sb_getblk_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1103  	kunit_activate_static_stub(test, ext4_sb_find_get_block,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1104  				   inode_test_sb_find_get_block_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1105  	kunit_activate_static_stub(test, ext4_sb_getblk_unmovable,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1106  				   inode_test_sb_getblk_unmovable_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1107  	kunit_activate_static_stub(test, ext4_ext_getblk,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1108  				   inode_test_ext_getblk_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1109  	kunit_activate_static_stub(test, ext4_read_bh_nowait,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1110  				   inode_test_read_bh_nowait_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1111  	kunit_activate_static_stub(test, ext4_read_bh_lock,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1112  				   inode_test_read_bh_lock_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1113  	kunit_activate_static_stub(test, ext4_sb_breadahead_unmovable,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1114  				   inode_test_breadahead_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1115  	kunit_activate_static_stub(test, ext4_mb_new_blocks,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1116  				   inode_test_mb_new_blocks_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1117  	kunit_activate_static_stub(test, ext4_free_blocks,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1118  				   inode_test_free_blocks_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1119  	kunit_activate_static_stub(test, ext4_issue_zeroout,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1120  				   inode_test_issue_zeroout_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1121  	kunit_activate_static_stub(test, __ext4_handle_dirty_metadata,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1122  				   inode_test_dirty_metadata_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1123  	kunit_activate_static_stub(test, __ext4_ext_dirty,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1124  				   inode_test_ext_dirty_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1125  	kunit_activate_static_stub(test, ext4_orphan_add,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1126  				   inode_test_orphan_add_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1127  	kunit_activate_static_stub(test, ext4_orphan_del,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1128  				   inode_test_orphan_del_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1129  	kunit_activate_static_stub(test, ext4_free_inode,
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1130  				   inode_test_free_inode_stub);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1131  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1132  	err = kunit_add_action_or_reset(test, inode_test_cleanup, ctx);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1133  	KUNIT_ASSERT_EQ(test, err, 0);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1134  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1135  	inode_test_reset_mock_inode(ctx, S_IFREG | 0644);
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1136  
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1137  	return ctx;
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1138  }
b7726d1eef1e9e Theodore Ts'o 2026-11-05  1139  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
