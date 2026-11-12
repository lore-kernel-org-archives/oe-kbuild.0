Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487009;
	b=T5S6UEGmQV+ZfrEHPqj7TeaejNp5lc8Bn6p2DdTcrgDM+RBGNe2PoaM2HtkSeBZYr+qi
	 wSAKY82juSla08Qt+u/S1lG46r/ICM6RReDvd+C/UOzyW5mKcttf630T42bwFZ6ei/b6x
	 QQByFdASo3qgb3ZBDhlSVyUpuEQ4FmhKrkzWmahOKZoafY7fAWtkZBAoGBaDGLqXjRly7
	 h3KHBNdgiq7AKPMFlRtXyYOfWwBvc/5F5kIvA2ZtJIk7iZw16Ee6OI/CDlNQvZh3xY/sA
	 my3RsCUXv+E6JvUOiFa5NDi5TYT9X8kdPvJ4pNTsnVc0ohDcrRQlDItpr3Ibp5eVr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487009;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6z7F/zRLf9ozSTmKu1LrcbPPOscIlPr8Ltpbwc5VJCQ=;
	b=YQ+ygV0gNny3mwWmnRLLxJsEmHOQqyjR5P5joFfHwYNhJn3O2W6vrk+dY+/aUmesfhxV
	 hxtZI62iW+cGyFsuFA1rF5xhZ4QBlV3ghLAvY23XWK5y+VJk7YnpNElNHbEAjk4jzwpXR
	 92+2Xh17keo0j1QNWFoXxiyuI9i6pxP2BSPRnUBT6HvkfLG6W9/aQvXKCLeaJB77rrakS
	 It8oYpiNsUHjBkc680ugsl5EVLKm2aykK+UwBfZeiTirasVR6tf79Ncbcr/yeRo81sARi
	 uW2UlrhSQr5SnZvWarFAuKk03RKgWpG21Hy4FI4XXFSNab9Q3+GdKwEZ2rYhDEo+1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxV22and;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1E606A8A9
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 12:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA1E606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxV22and
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794487008; x=1826023008;
  h=date:from:to:cc:subject:message-id;
  bh=EYjDm5rybGmTFIHKwM7/xF+Dr2/tRzRziJyUvVDDhKA=;
  b=TxV22andGhhEcg4FDjKqCaEW1OyMq7iQ36wgMbaFisvh9alinhoboNEm
   boV9+eku1hb/4/PtARLumHfiKylO3BKXTN3LzdILHEefTUC01QBmx9LHN
   wex0uUIeydXWcSB3/586xKL0DaiHjjpiX28hv1+qOzDLNBvms5OGfRzuX
   oNqwq7irLsc3utJMwhv/cuthGMV0SVJ/yZK4uaW2rhQiB6VxLgwahfeZ4
   NgR2HGa47CjQJs5Lvw79dR91GtV7UWMssbhSfM4Lx7b3LO4GAcrz+jMrc
   6j/klY5UAr0LpzFzcvHGpdUWhLc9C/zwFz2SaRiJnalDBl3HGlH9MYvEP
   Q==;
X-CSE-ConnectionGUID: pfNe5ic7SROZyMiTFMkVKg==
X-CSE-MsgGUID: EsW7Gj8FQ3yradE3HRO3cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3275371"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3275371"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:36:47 -0800
X-CSE-ConnectionGUID: 4Ztp9abhT/2dm20j3y+1Bw==
X-CSE-MsgGUID: GEQ3IE9aSqelGR2eJ7tj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8741313"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2026 04:36:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRU2m-000000000sR-0444;
	Thu, 12 Nov 2026 12:36:44 +0000
Date: Thu, 12 Nov 2026 13:36:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 11/50] fs/ext4/ialloc-test.c:756
 ialloc_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611121345.GzlyODjR-lkp@intel.com>
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
commit: 94aff30d852192b8e15691893c985b70d2d26daa [11/50] ext4: add KUnit tests for fs/ext4/ialloc.c
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121345.GzlyODjR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121345.GzlyODjR-lkp@intel.com/

New smatch warnings:
fs/ext4/ialloc-test.c:756 ialloc_test_init() error: 'sb' dereferencing possible ERR_PTR()
fs/ext4/ialloc-test.c:1284 ialloc_test_read_ibitmap_uninit() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:1298 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2336 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2542 ialloc_test_orphan_get() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/ext4/ialloc-test.c:1304 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:1312 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:1321 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:1331 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:1345 ialloc_test_read_ibitmap_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2346 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2353 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2359 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2366 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2377 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2386 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2396 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2406 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2427 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2448 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2461 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2468 ialloc_test_new_inode_errors() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2550 ialloc_test_orphan_get() warn: passing zero to 'PTR_ERR'
fs/ext4/ialloc-test.c:2558 ialloc_test_orphan_get() warn: passing zero to 'PTR_ERR'

vim +/sb +756 fs/ext4/ialloc-test.c

94aff30d852192 Theodore Ts'o 2026-11-06   722  
94aff30d852192 Theodore Ts'o 2026-11-06   723  static int ialloc_test_init(struct kunit *test)
94aff30d852192 Theodore Ts'o 2026-11-06   724  {
94aff30d852192 Theodore Ts'o 2026-11-06   725  	struct ialloc_test_ctx *ctx;
94aff30d852192 Theodore Ts'o 2026-11-06   726  	struct fs_context *fc;
94aff30d852192 Theodore Ts'o 2026-11-06   727  	struct super_block *sb;
94aff30d852192 Theodore Ts'o 2026-11-06   728  	struct ext4_sb_info *sbi;
94aff30d852192 Theodore Ts'o 2026-11-06   729  	ext4_group_t g;
94aff30d852192 Theodore Ts'o 2026-11-06   730  	unsigned int bit;
94aff30d852192 Theodore Ts'o 2026-11-06   731  	s64 total_free_inodes = 0;
94aff30d852192 Theodore Ts'o 2026-11-06   732  	s64 total_free_clusters = 0;
94aff30d852192 Theodore Ts'o 2026-11-06   733  	int err;
94aff30d852192 Theodore Ts'o 2026-11-06   734  
94aff30d852192 Theodore Ts'o 2026-11-06   735  	ctx = kzalloc_obj(*ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   736  	KUNIT_ASSERT_NOT_NULL(test, ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   737  	test->priv = ctx;
94aff30d852192 Theodore Ts'o 2026-11-06   738  
94aff30d852192 Theodore Ts'o 2026-11-06   739  	fc = fs_context_for_mount(&ialloc_test_fs_type, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   740  	if (IS_ERR(fc)) {
94aff30d852192 Theodore Ts'o 2026-11-06   741  		err = PTR_ERR(fc);
94aff30d852192 Theodore Ts'o 2026-11-06   742  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   743  		KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   744  	}
94aff30d852192 Theodore Ts'o 2026-11-06   745  	sb = sget_fc(fc, NULL, set_anon_super_fc);
94aff30d852192 Theodore Ts'o 2026-11-06   746  	put_fs_context(fc);
94aff30d852192 Theodore Ts'o 2026-11-06   747  	if (IS_ERR(sb)) {
94aff30d852192 Theodore Ts'o 2026-11-06   748  		err = PTR_ERR(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   749  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   750  		KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   751  	}
94aff30d852192 Theodore Ts'o 2026-11-06   752  	ctx->sb = sb;
94aff30d852192 Theodore Ts'o 2026-11-06   753  	sbi = &ctx->sbi;
94aff30d852192 Theodore Ts'o 2026-11-06   754  
94aff30d852192 Theodore Ts'o 2026-11-06   755  	sbi->s_sb = sb;
94aff30d852192 Theodore Ts'o 2026-11-06  @756  	sb->s_fs_info = sbi;
94aff30d852192 Theodore Ts'o 2026-11-06   757  	sb->s_op = &ialloc_test_sops;
94aff30d852192 Theodore Ts'o 2026-11-06   758  #ifdef CONFIG_QUOTA
94aff30d852192 Theodore Ts'o 2026-11-06   759  	sb->dq_op = &ialloc_test_qops;
94aff30d852192 Theodore Ts'o 2026-11-06   760  #endif
94aff30d852192 Theodore Ts'o 2026-11-06   761  #ifdef CONFIG_FS_ENCRYPTION
94aff30d852192 Theodore Ts'o 2026-11-06   762  	sb->s_cop = &ext4_cryptops;
94aff30d852192 Theodore Ts'o 2026-11-06   763  #endif
94aff30d852192 Theodore Ts'o 2026-11-06   764  	sb->s_flags |= SB_ACTIVE;
94aff30d852192 Theodore Ts'o 2026-11-06   765  	sb->s_blocksize = IALLOC_TEST_BLK_SIZE;
94aff30d852192 Theodore Ts'o 2026-11-06   766  	sb->s_blocksize_bits = IALLOC_TEST_BLK_BITS;
94aff30d852192 Theodore Ts'o 2026-11-06   767  	sb->s_maxbytes = MAX_LFS_FILESIZE;
94aff30d852192 Theodore Ts'o 2026-11-06   768  	sb->s_time_gran = 1;
94aff30d852192 Theodore Ts'o 2026-11-06   769  	sb->s_xattr = ext4_xattr_handlers;
94aff30d852192 Theodore Ts'o 2026-11-06   770  	strscpy(sb->s_id, "ext4_ialloc_kunit", sizeof(sb->s_id));
94aff30d852192 Theodore Ts'o 2026-11-06   771  
94aff30d852192 Theodore Ts'o 2026-11-06   772  	inode_init_once(&ctx->bd_inode);
94aff30d852192 Theodore Ts'o 2026-11-06   773  	ctx->bd_inode.i_sb = sb;
94aff30d852192 Theodore Ts'o 2026-11-06   774  	ctx->bd_inode.i_blkbits = IALLOC_TEST_BLK_BITS;
94aff30d852192 Theodore Ts'o 2026-11-06   775  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
94aff30d852192 Theodore Ts'o 2026-11-06   776  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
94aff30d852192 Theodore Ts'o 2026-11-06   777  	ctx->bdev_queue.limits.logical_block_size = 512;
94aff30d852192 Theodore Ts'o 2026-11-06   778  	ctx->bdev_queue.limits.dma_alignment = 511;
94aff30d852192 Theodore Ts'o 2026-11-06   779  	ctx->bdev.bd_queue = &ctx->bdev_queue;
94aff30d852192 Theodore Ts'o 2026-11-06   780  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
94aff30d852192 Theodore Ts'o 2026-11-06   781  	bdev_set_flag(&ctx->bdev, BD_READ_ONLY);
94aff30d852192 Theodore Ts'o 2026-11-06   782  	sb->s_bdev = &ctx->bdev;
94aff30d852192 Theodore Ts'o 2026-11-06   783  
94aff30d852192 Theodore Ts'o 2026-11-06   784  	bgl_lock_init(&ctx->bgl);
94aff30d852192 Theodore Ts'o 2026-11-06   785  	sbi->s_blockgroup_lock = &ctx->bgl;
94aff30d852192 Theodore Ts'o 2026-11-06   786  
94aff30d852192 Theodore Ts'o 2026-11-06   787  	sbi->s_es = &ctx->es;
94aff30d852192 Theodore Ts'o 2026-11-06   788  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
94aff30d852192 Theodore Ts'o 2026-11-06   789  	ctx->es.s_first_data_block = cpu_to_le32(IALLOC_TEST_FIRST_DATA_BLK);
94aff30d852192 Theodore Ts'o 2026-11-06   790  	ctx->es.s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
94aff30d852192 Theodore Ts'o 2026-11-06   791  	ctx->es.s_creator_os = cpu_to_le32(EXT4_OS_LINUX);
94aff30d852192 Theodore Ts'o 2026-11-06   792  	ctx->es.s_inodes_count = cpu_to_le32(IALLOC_TEST_TOTAL_INODES);
94aff30d852192 Theodore Ts'o 2026-11-06   793  	ctx->es.s_inodes_per_group = cpu_to_le32(IALLOC_TEST_INODES_PER_GRP);
94aff30d852192 Theodore Ts'o 2026-11-06   794  	ctx->es.s_blocks_per_group = cpu_to_le32(IALLOC_TEST_BLOCKS_PER_GRP);
94aff30d852192 Theodore Ts'o 2026-11-06   795  	ctx->es.s_clusters_per_group = cpu_to_le32(IALLOC_TEST_BLOCKS_PER_GRP);
94aff30d852192 Theodore Ts'o 2026-11-06   796  	ctx->es.s_first_ino = cpu_to_le32(IALLOC_TEST_FIRST_INO);
94aff30d852192 Theodore Ts'o 2026-11-06   797  	ctx->es.s_inode_size = cpu_to_le16(IALLOC_TEST_INODE_SIZE);
94aff30d852192 Theodore Ts'o 2026-11-06   798  	ctx->es.s_min_extra_isize = cpu_to_le16(IALLOC_TEST_EXTRA_ISIZE);
94aff30d852192 Theodore Ts'o 2026-11-06   799  	ctx->es.s_want_extra_isize = cpu_to_le16(IALLOC_TEST_EXTRA_ISIZE);
94aff30d852192 Theodore Ts'o 2026-11-06   800  	ctx->es.s_checksum_type = EXT4_CRC32C_CHKSUM;
94aff30d852192 Theodore Ts'o 2026-11-06   801  	ext4_blocks_count_set(&ctx->es, IALLOC_TEST_TOTAL_BLKS);
94aff30d852192 Theodore Ts'o 2026-11-06   802  
94aff30d852192 Theodore Ts'o 2026-11-06   803  	ext4_set_feature_sparse_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   804  	ext4_set_feature_extents(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   805  	ext4_set_feature_extra_isize(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   806  	ext4_set_feature_metadata_csum(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   807  	ext4_set_feature_64bit(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   808  	ext4_set_feature_dir_index(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   809  
94aff30d852192 Theodore Ts'o 2026-11-06   810  	ctx->sb_bh.b_data = (char *)&ctx->es;
94aff30d852192 Theodore Ts'o 2026-11-06   811  	ctx->sb_bh.b_size = sizeof(ctx->es);
94aff30d852192 Theodore Ts'o 2026-11-06   812  	ctx->sb_bh.b_bdev = &ctx->bdev;
94aff30d852192 Theodore Ts'o 2026-11-06   813  	atomic_set(&ctx->sb_bh.b_count, 1);
94aff30d852192 Theodore Ts'o 2026-11-06   814  	set_buffer_uptodate(&ctx->sb_bh);
94aff30d852192 Theodore Ts'o 2026-11-06   815  	sbi->s_sbh = &ctx->sb_bh;
94aff30d852192 Theodore Ts'o 2026-11-06   816  
94aff30d852192 Theodore Ts'o 2026-11-06   817  	ctx->gdesc_bh.b_data = ctx->gdesc_buf;
94aff30d852192 Theodore Ts'o 2026-11-06   818  	ctx->gdesc_bh.b_size = IALLOC_TEST_BLK_SIZE;
94aff30d852192 Theodore Ts'o 2026-11-06   819  	ctx->gdesc_bh.b_blocknr = IALLOC_TEST_GDESC_BLK;
94aff30d852192 Theodore Ts'o 2026-11-06   820  	ctx->gdesc_bh.b_bdev = &ctx->bdev;
94aff30d852192 Theodore Ts'o 2026-11-06   821  	atomic_set(&ctx->gdesc_bh.b_count, 1);
94aff30d852192 Theodore Ts'o 2026-11-06   822  	set_buffer_uptodate(&ctx->gdesc_bh);
94aff30d852192 Theodore Ts'o 2026-11-06   823  
94aff30d852192 Theodore Ts'o 2026-11-06   824  	sbi->s_inode_size = IALLOC_TEST_INODE_SIZE;
94aff30d852192 Theodore Ts'o 2026-11-06   825  	sbi->s_inodes_per_block = IALLOC_TEST_INODES_PER_BLK;
94aff30d852192 Theodore Ts'o 2026-11-06   826  	sbi->s_inodes_per_group = IALLOC_TEST_INODES_PER_GRP;
94aff30d852192 Theodore Ts'o 2026-11-06   827  	sbi->s_itb_per_group = IALLOC_TEST_ITB_PER_GRP;
94aff30d852192 Theodore Ts'o 2026-11-06   828  	sbi->s_first_ino = IALLOC_TEST_FIRST_INO;
94aff30d852192 Theodore Ts'o 2026-11-06   829  	sbi->s_want_extra_isize = IALLOC_TEST_EXTRA_ISIZE;
94aff30d852192 Theodore Ts'o 2026-11-06   830  	sbi->s_blocks_per_group = IALLOC_TEST_BLOCKS_PER_GRP;
94aff30d852192 Theodore Ts'o 2026-11-06   831  	sbi->s_clusters_per_group = IALLOC_TEST_BLOCKS_PER_GRP;
94aff30d852192 Theodore Ts'o 2026-11-06   832  	sbi->s_cluster_ratio = 1;
94aff30d852192 Theodore Ts'o 2026-11-06   833  	sbi->s_cluster_bits = 0;
94aff30d852192 Theodore Ts'o 2026-11-06   834  	sbi->s_groups_count = IALLOC_TEST_NGROUPS;
94aff30d852192 Theodore Ts'o 2026-11-06   835  	sbi->s_gdb_count = 1;
94aff30d852192 Theodore Ts'o 2026-11-06   836  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
94aff30d852192 Theodore Ts'o 2026-11-06   837  	sbi->s_desc_per_block = IALLOC_TEST_BLK_SIZE / EXT4_MIN_DESC_SIZE_64BIT;
94aff30d852192 Theodore Ts'o 2026-11-06   838  	sbi->s_desc_per_block_bits = ilog2(sbi->s_desc_per_block);
94aff30d852192 Theodore Ts'o 2026-11-06   839  	sbi->s_bitmap_maxbytes = 0x1ff7ffff000ULL;
94aff30d852192 Theodore Ts'o 2026-11-06   840  	sbi->s_csum_seed = IALLOC_TEST_CSUM_SEED;
94aff30d852192 Theodore Ts'o 2026-11-06   841  	sbi->s_hash_seed[0] = 0x12345678U;
94aff30d852192 Theodore Ts'o 2026-11-06   842  	sbi->s_hash_seed[1] = 0x9abcdef0U;
94aff30d852192 Theodore Ts'o 2026-11-06   843  	sbi->s_hash_seed[2] = 0x13579bdfU;
94aff30d852192 Theodore Ts'o 2026-11-06   844  	sbi->s_hash_seed[3] = 0x2468ace0U;
94aff30d852192 Theodore Ts'o 2026-11-06   845  
94aff30d852192 Theodore Ts'o 2026-11-06   846  	set_opt(sb, ERRORS_CONT);
94aff30d852192 Theodore Ts'o 2026-11-06   847  	set_opt(sb, ORDERED_DATA);
94aff30d852192 Theodore Ts'o 2026-11-06   848  	spin_lock_init(&sbi->s_bdev_wb_lock);
94aff30d852192 Theodore Ts'o 2026-11-06   849  	spin_lock_init(&sbi->s_error_lock);
94aff30d852192 Theodore Ts'o 2026-11-06   850  	spin_lock_init(&sbi->s_md_lock);
94aff30d852192 Theodore Ts'o 2026-11-06   851  	mutex_init(&sbi->s_fc_lock);
94aff30d852192 Theodore Ts'o 2026-11-06   852  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
94aff30d852192 Theodore Ts'o 2026-11-06   853  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
94aff30d852192 Theodore Ts'o 2026-11-06   854  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
94aff30d852192 Theodore Ts'o 2026-11-06   855  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
94aff30d852192 Theodore Ts'o 2026-11-06   856  
94aff30d852192 Theodore Ts'o 2026-11-06   857  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
94aff30d852192 Theodore Ts'o 2026-11-06   858  			     DEFAULT_RATELIMIT_INTERVAL, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   859  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
94aff30d852192 Theodore Ts'o 2026-11-06   860  			     DEFAULT_RATELIMIT_INTERVAL, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   861  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
94aff30d852192 Theodore Ts'o 2026-11-06   862  			     DEFAULT_RATELIMIT_INTERVAL, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   863  
94aff30d852192 Theodore Ts'o 2026-11-06   864  	/* Wire RCU-indexed group_info and flex_groups tables */
94aff30d852192 Theodore Ts'o 2026-11-06   865  	for (g = 0; g < IALLOC_TEST_NGROUPS; g++) {
94aff30d852192 Theodore Ts'o 2026-11-06   866  		struct ialloc_test_blk *iblk, *bblk;
94aff30d852192 Theodore Ts'o 2026-11-06   867  		u32 free_inos = (g == 0) ? IALLOC_TEST_BG0_FREE_INODES :
94aff30d852192 Theodore Ts'o 2026-11-06   868  					   IALLOC_TEST_INODES_PER_GRP;
94aff30d852192 Theodore Ts'o 2026-11-06   869  
94aff30d852192 Theodore Ts'o 2026-11-06   870  		init_rwsem(&ctx->grp_infos[g].alloc_sem);
94aff30d852192 Theodore Ts'o 2026-11-06   871  		ctx->grp_infos[g].bb_state = 0;
94aff30d852192 Theodore Ts'o 2026-11-06   872  		ctx->grp_info_ptrs[g] = &ctx->grp_infos[g];
94aff30d852192 Theodore Ts'o 2026-11-06   873  		ctx->flex_grp_ptrs[g] = &ctx->flex_grps[g];
94aff30d852192 Theodore Ts'o 2026-11-06   874  
94aff30d852192 Theodore Ts'o 2026-11-06   875  		ext4_block_bitmap_set(sb, &ctx->gdps[g],
94aff30d852192 Theodore Ts'o 2026-11-06   876  				      ialloc_test_bbitmap_blk(g));
94aff30d852192 Theodore Ts'o 2026-11-06   877  		ext4_inode_bitmap_set(sb, &ctx->gdps[g],
94aff30d852192 Theodore Ts'o 2026-11-06   878  				      ialloc_test_ibitmap_blk(g));
94aff30d852192 Theodore Ts'o 2026-11-06   879  		ext4_inode_table_set(sb, &ctx->gdps[g],
94aff30d852192 Theodore Ts'o 2026-11-06   880  				     ialloc_test_itable_blk(g));
94aff30d852192 Theodore Ts'o 2026-11-06   881  		ext4_free_inodes_set(sb, &ctx->gdps[g], free_inos);
94aff30d852192 Theodore Ts'o 2026-11-06   882  		ext4_used_dirs_set(sb, &ctx->gdps[g], (g == 0) ? 1U : 0U);
94aff30d852192 Theodore Ts'o 2026-11-06   883  		ext4_itable_unused_set(sb, &ctx->gdps[g], free_inos);
94aff30d852192 Theodore Ts'o 2026-11-06   884  		ext4_free_group_clusters_set(sb, &ctx->gdps[g],
94aff30d852192 Theodore Ts'o 2026-11-06   885  					     IALLOC_TEST_DEFAULT_FREE_CLU);
94aff30d852192 Theodore Ts'o 2026-11-06   886  
94aff30d852192 Theodore Ts'o 2026-11-06   887  		iblk = ialloc_test_setup_blk(ctx, ialloc_test_ibitmap_blk(g),
94aff30d852192 Theodore Ts'o 2026-11-06   888  					     true, true);
94aff30d852192 Theodore Ts'o 2026-11-06   889  		bblk = ialloc_test_setup_blk(ctx, ialloc_test_bbitmap_blk(g),
94aff30d852192 Theodore Ts'o 2026-11-06   890  					     true, true);
94aff30d852192 Theodore Ts'o 2026-11-06   891  		if (!iblk || !bblk) {
94aff30d852192 Theodore Ts'o 2026-11-06   892  			deactivate_locked_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   893  			kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   894  			KUNIT_FAIL_AND_ABORT(test, "block pool setup failed");
94aff30d852192 Theodore Ts'o 2026-11-06   895  		}
94aff30d852192 Theodore Ts'o 2026-11-06   896  
94aff30d852192 Theodore Ts'o 2026-11-06   897  		/* Mark reserved bits 0..9 in group 0 and end padding 64..8191 */
94aff30d852192 Theodore Ts'o 2026-11-06   898  		if (g == 0) {
94aff30d852192 Theodore Ts'o 2026-11-06   899  			for (bit = 0; bit < IALLOC_TEST_FIRST_INO - 1; bit++)
94aff30d852192 Theodore Ts'o 2026-11-06   900  				ext4_set_bit(bit, iblk->cache_buf);
94aff30d852192 Theodore Ts'o 2026-11-06   901  		}
94aff30d852192 Theodore Ts'o 2026-11-06   902  		ext4_mark_bitmap_end(IALLOC_TEST_INODES_PER_GRP,
94aff30d852192 Theodore Ts'o 2026-11-06   903  				     IALLOC_TEST_BLK_SIZE * 8,
94aff30d852192 Theodore Ts'o 2026-11-06   904  				     iblk->cache_buf);
94aff30d852192 Theodore Ts'o 2026-11-06   905  		set_bitmap_uptodate(&iblk->bh);
94aff30d852192 Theodore Ts'o 2026-11-06   906  		set_buffer_verified(&iblk->bh);
94aff30d852192 Theodore Ts'o 2026-11-06   907  
94aff30d852192 Theodore Ts'o 2026-11-06   908  		ext4_block_bitmap_csum_set(sb, &ctx->gdps[g], &bblk->bh);
94aff30d852192 Theodore Ts'o 2026-11-06   909  		memcpy(bblk->disk_buf, bblk->cache_buf, IALLOC_TEST_BLK_SIZE);
94aff30d852192 Theodore Ts'o 2026-11-06   910  		set_bitmap_uptodate(&bblk->bh);
94aff30d852192 Theodore Ts'o 2026-11-06   911  		set_buffer_verified(&bblk->bh);
94aff30d852192 Theodore Ts'o 2026-11-06   912  
94aff30d852192 Theodore Ts'o 2026-11-06   913  		ialloc_test_sync_ibitmap_csum(ctx, g, true);
94aff30d852192 Theodore Ts'o 2026-11-06   914  
94aff30d852192 Theodore Ts'o 2026-11-06   915  		total_free_inodes += free_inos;
94aff30d852192 Theodore Ts'o 2026-11-06   916  		total_free_clusters += IALLOC_TEST_DEFAULT_FREE_CLU;
94aff30d852192 Theodore Ts'o 2026-11-06   917  	}
94aff30d852192 Theodore Ts'o 2026-11-06   918  	ctx->grp_info_slice[0] = ctx->grp_info_ptrs;
94aff30d852192 Theodore Ts'o 2026-11-06   919  	rcu_assign_pointer(sbi->s_group_info, ctx->grp_info_slice);
94aff30d852192 Theodore Ts'o 2026-11-06   920  	rcu_assign_pointer(sbi->s_flex_groups, ctx->flex_grp_ptrs);
94aff30d852192 Theodore Ts'o 2026-11-06   921  
94aff30d852192 Theodore Ts'o 2026-11-06   922  	err = percpu_counter_init(&sbi->s_freeclusters_counter,
94aff30d852192 Theodore Ts'o 2026-11-06   923  				  total_free_clusters, GFP_KERNEL);
94aff30d852192 Theodore Ts'o 2026-11-06   924  	if (err) {
94aff30d852192 Theodore Ts'o 2026-11-06   925  		deactivate_locked_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   926  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   927  		KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   928  	}
94aff30d852192 Theodore Ts'o 2026-11-06   929  	err = percpu_counter_init(&sbi->s_freeinodes_counter,
94aff30d852192 Theodore Ts'o 2026-11-06   930  				  total_free_inodes, GFP_KERNEL);
94aff30d852192 Theodore Ts'o 2026-11-06   931  	if (err) {
94aff30d852192 Theodore Ts'o 2026-11-06   932  		percpu_counter_destroy(&ctx->sbi.s_freeclusters_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   933  		deactivate_locked_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   934  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   935  		KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   936  	}
94aff30d852192 Theodore Ts'o 2026-11-06   937  	err = percpu_counter_init(&sbi->s_dirs_counter, 1, GFP_KERNEL);
94aff30d852192 Theodore Ts'o 2026-11-06   938  	if (err) {
94aff30d852192 Theodore Ts'o 2026-11-06   939  		percpu_counter_destroy(&ctx->sbi.s_freeinodes_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   940  		percpu_counter_destroy(&ctx->sbi.s_freeclusters_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   941  		deactivate_locked_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   942  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   943  		KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   944  	}
94aff30d852192 Theodore Ts'o 2026-11-06   945  
94aff30d852192 Theodore Ts'o 2026-11-06   946  	/* Create hashed VFS root directory inode (EXT4_ROOT_INO = 2) */
94aff30d852192 Theodore Ts'o 2026-11-06   947  	ctx->root_inode = new_inode(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   948  	if (!ctx->root_inode) {
94aff30d852192 Theodore Ts'o 2026-11-06   949  		percpu_counter_destroy(&ctx->sbi.s_dirs_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   950  		percpu_counter_destroy(&ctx->sbi.s_freeinodes_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   951  		percpu_counter_destroy(&ctx->sbi.s_freeclusters_counter);
94aff30d852192 Theodore Ts'o 2026-11-06   952  		deactivate_locked_super(sb);
94aff30d852192 Theodore Ts'o 2026-11-06   953  		kfree(ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   954  		KUNIT_FAIL_AND_ABORT(test, "failed to allocate root_inode");
94aff30d852192 Theodore Ts'o 2026-11-06   955  	}
94aff30d852192 Theodore Ts'o 2026-11-06   956  	ctx->root_inode->i_ino = EXT4_ROOT_INO;
94aff30d852192 Theodore Ts'o 2026-11-06   957  	ctx->root_inode->i_mode = S_IFDIR | 0755;
94aff30d852192 Theodore Ts'o 2026-11-06   958  	set_nlink(ctx->root_inode, 2);
94aff30d852192 Theodore Ts'o 2026-11-06   959  	EXT4_I(ctx->root_inode)->i_block_group = 0;
94aff30d852192 Theodore Ts'o 2026-11-06   960  	insert_inode_locked(ctx->root_inode);
94aff30d852192 Theodore Ts'o 2026-11-06   961  	unlock_new_inode(ctx->root_inode);
94aff30d852192 Theodore Ts'o 2026-11-06   962  
94aff30d852192 Theodore Ts'o 2026-11-06   963  	ctx->root_dentry.d_sb = sb;
94aff30d852192 Theodore Ts'o 2026-11-06   964  	ctx->root_dentry.d_inode = ctx->root_inode;
94aff30d852192 Theodore Ts'o 2026-11-06   965  	sb->s_root = &ctx->root_dentry;
94aff30d852192 Theodore Ts'o 2026-11-06   966  
94aff30d852192 Theodore Ts'o 2026-11-06   967  	up_write(&sb->s_umount);
94aff30d852192 Theodore Ts'o 2026-11-06   968  
94aff30d852192 Theodore Ts'o 2026-11-06   969  	err = kunit_add_action_or_reset(test, ialloc_test_cleanup, ctx);
94aff30d852192 Theodore Ts'o 2026-11-06   970  	KUNIT_ASSERT_EQ(test, err, 0);
94aff30d852192 Theodore Ts'o 2026-11-06   971  
94aff30d852192 Theodore Ts'o 2026-11-06   972  	kunit_activate_static_stub(test, ext4_get_group_desc,
94aff30d852192 Theodore Ts'o 2026-11-06   973  				   ialloc_test_get_group_desc_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   974  	kunit_activate_static_stub(test, ext4_sb_getblk,
94aff30d852192 Theodore Ts'o 2026-11-06   975  				   ialloc_test_sb_getblk_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   976  	kunit_activate_static_stub(test, ext4_sb_find_get_block,
94aff30d852192 Theodore Ts'o 2026-11-06   977  				   ialloc_test_sb_find_get_block_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   978  	kunit_activate_static_stub(test, ext4_read_bh,
94aff30d852192 Theodore Ts'o 2026-11-06   979  				   ialloc_test_read_bh_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   980  	kunit_activate_static_stub(test, ext4_read_block_bitmap_nowait,
94aff30d852192 Theodore Ts'o 2026-11-06   981  				   ialloc_test_read_bbitmap_nowait_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   982  	kunit_activate_static_stub(test, ext4_wait_block_bitmap,
94aff30d852192 Theodore Ts'o 2026-11-06   983  				   ialloc_test_wait_bbitmap_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   984  	kunit_activate_static_stub(test, __ext4_journal_get_write_access,
94aff30d852192 Theodore Ts'o 2026-11-06   985  				   ialloc_test_get_write_access_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   986  	kunit_activate_static_stub(test, __ext4_handle_dirty_metadata,
94aff30d852192 Theodore Ts'o 2026-11-06   987  				   ialloc_test_dirty_metadata_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   988  	kunit_activate_static_stub(test, __ext4_mark_inode_dirty,
94aff30d852192 Theodore Ts'o 2026-11-06   989  				   ialloc_test_mark_inode_dirty_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   990  #ifdef CONFIG_EXT4_FS_SECURITY
94aff30d852192 Theodore Ts'o 2026-11-06   991  	kunit_activate_static_stub(test, ext4_init_security,
94aff30d852192 Theodore Ts'o 2026-11-06   992  				   ialloc_test_init_security_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   993  #endif
94aff30d852192 Theodore Ts'o 2026-11-06   994  	kunit_activate_static_stub(test, ext4_itable_zeroout,
94aff30d852192 Theodore Ts'o 2026-11-06   995  				   ialloc_test_itable_zeroout_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   996  	kunit_activate_static_stub(test, __ext4_iget,
94aff30d852192 Theodore Ts'o 2026-11-06   997  				   ialloc_test_iget_stub);
94aff30d852192 Theodore Ts'o 2026-11-06   998  
94aff30d852192 Theodore Ts'o 2026-11-06   999  	return 0;
94aff30d852192 Theodore Ts'o 2026-11-06  1000  }
94aff30d852192 Theodore Ts'o 2026-11-06  1001  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
