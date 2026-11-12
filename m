Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508618;
	b=VwLGkSOkM6sAQsePTcKIuNM9JLkEEHvjaifvIkCLUlnBL7j/2WitMjz2tc2hzjLhrOpo
	 bqBicS/eGqH/n/3wuQK/w1ksuXIG05CEkB1qDs6lVtcB/0SN+XvsKO+DSz/kZmX635ltO
	 0juAhop1t93P+FlnO+8FGKPCTNBdOx6a/j0KUgCZTaQyy0rh6Uk4gAbS8g5IBiWqdZKpS
	 XMgw55ZZX3zkrEzEKKltSMtgo9OIdqZpvPaixGzXo5v+VsbU5NYUVdOc79lszH5pkmWEQ
	 CHs+Ke/05FVGRxbivpl5MUdBHyftOWeskFc3w76UjTrmThw+luUiaSS97YECY5txIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RBkx7/dx5NIiqWwvB9UuERs4ZflKYqKAK3XB0MRCyI4=;
	b=xaoBcw+1fpPEEyOiECgmkYoJ6NBBL5qsuNz5LwKGziyRYV6cEGb9w6haDX0n9t5ppapO
	 K8BYrA79JjT1ytWylphoAwm7L5ETITNVMf6WowpJ1Ie1is7fTdghNZGVcerqjfACUlAXz
	 sWZ8Nstte91dT9Mp6Xe5AX/bSABrWfyax1n2gQFY75YmGnck0bxX1+O0mgR9jsD7BwNk3
	 /Vb7zzvnQ6/3uemNAkFvRwJburo/nre1TBcrAQMJ9tn1FXgzvuEG/MhHllPmkAF1RdxFa
	 qYArpqtPvLYyyzC6jDN48waim8jJWLOvUa5M6YCNi5NJh6dmcCaVQwhOZzA4rS5bK0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ginDFzZk;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9042606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 18:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9042606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ginDFzZk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794508617; x=1826044617;
  h=date:from:to:cc:subject:message-id;
  bh=KQCDLef/Lx4p9AtQFQQ2F4y6XB0NP2Y9/IgL6RDKmOI=;
  b=ginDFzZkx3wXhNWLMCwfi05yErTnG5kzbd3xEW57c9x0/Wuk5uptZWOv
   OohllwgP1oVRrKf5BJZr+g+TxeijnvwBl1NB2gHIYhUrQt759QXMpLfhq
   w8rAvTvlsCJ6aOQvoiPaEEvl8rQratYP6j38HeMqGBvBDk9+ax7YyWW2Q
   X9MyOkpDpVsPY/kcfpgQ3dRhxyCS0YHrr4jEYG2kStGqcv3OyDeBU43jc
   3da+Svv4U7oixLkYKqhmQfupu6agmnvTm08YDbQMLaVAa60QMh3mjY4e1
   xNPX3zYIcuEJFy47O64zpOc6oodnkb6JNOlru4FUurwlSkfC0VgxCpxKd
   Q==;
X-CSE-ConnectionGUID: V3JnQamWQw2ERQWcO3Nzqg==
X-CSE-MsgGUID: B33tcXv4SkGAdFlP9LdGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3309923"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3309923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:36:57 -0800
X-CSE-ConnectionGUID: auwsqfxJSOidcHtcm4cjpg==
X-CSE-MsgGUID: EsOjixhZRRarGg6keK3MEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8723618"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2026 10:36:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRZfJ-000000000vf-46G0;
	Thu, 12 Nov 2026 18:36:53 +0000
Date: Thu, 12 Nov 2026 19:36:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 14/50] fs/ext4/block_validity-test.c:486
 bv_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611121910.d33i7NZr-lkp@intel.com>
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
commit: 82761bb40c59b490b65c19c067f078f5d928eaf9 [14/50] ext4: add KUnit tests for fs/ext4/block_validity.c
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121910.d33i7NZr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121910.d33i7NZr-lkp@intel.com/

smatch warnings:
fs/ext4/block_validity-test.c:486 bv_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +486 fs/ext4/block_validity-test.c

82761bb40c59b4 Theodore Ts'o 2026-11-06  443  
82761bb40c59b4 Theodore Ts'o 2026-11-06  444  KUNIT_DEFINE_ACTION_WRAPPER(bv_test_cleanup_action, bv_test_cleanup,
82761bb40c59b4 Theodore Ts'o 2026-11-06  445  			    struct bv_test_ctx *);
82761bb40c59b4 Theodore Ts'o 2026-11-06  446  
82761bb40c59b4 Theodore Ts'o 2026-11-06  447  static int bv_test_init(struct kunit *test)
82761bb40c59b4 Theodore Ts'o 2026-11-06  448  {
82761bb40c59b4 Theodore Ts'o 2026-11-06  449  	struct bv_test_ctx *ctx;
82761bb40c59b4 Theodore Ts'o 2026-11-06  450  	struct fs_context *fc;
82761bb40c59b4 Theodore Ts'o 2026-11-06  451  	struct super_block *sb;
82761bb40c59b4 Theodore Ts'o 2026-11-06  452  	struct ext4_sb_info *sbi;
82761bb40c59b4 Theodore Ts'o 2026-11-06  453  	struct inode *root_inode;
82761bb40c59b4 Theodore Ts'o 2026-11-06  454  	ext4_group_t g;
82761bb40c59b4 Theodore Ts'o 2026-11-06  455  	int err;
82761bb40c59b4 Theodore Ts'o 2026-11-06  456  
82761bb40c59b4 Theodore Ts'o 2026-11-06  457  	ctx = kzalloc_obj(*ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  458  	KUNIT_ASSERT_NOT_NULL(test, ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  459  	test->priv = ctx;
82761bb40c59b4 Theodore Ts'o 2026-11-06  460  
82761bb40c59b4 Theodore Ts'o 2026-11-06  461  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  462  	if (!ctx->bdev.bd_stats) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  463  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  464  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
82761bb40c59b4 Theodore Ts'o 2026-11-06  465  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  466  
82761bb40c59b4 Theodore Ts'o 2026-11-06  467  	fc = fs_context_for_mount(&bv_test_fs_type, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  468  	if (IS_ERR(fc)) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  469  		err = PTR_ERR(fc);
82761bb40c59b4 Theodore Ts'o 2026-11-06  470  		free_percpu(ctx->bdev.bd_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  471  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  472  		KUNIT_ASSERT_EQ(test, err, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  473  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  474  	sb = sget_fc(fc, NULL, set_anon_super_fc);
82761bb40c59b4 Theodore Ts'o 2026-11-06  475  	put_fs_context(fc);
82761bb40c59b4 Theodore Ts'o 2026-11-06  476  	if (IS_ERR(sb)) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  477  		err = PTR_ERR(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  478  		free_percpu(ctx->bdev.bd_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  479  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  480  		KUNIT_ASSERT_EQ(test, err, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  481  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  482  	ctx->sb = sb;
82761bb40c59b4 Theodore Ts'o 2026-11-06  483  	sbi = &ctx->sbi;
82761bb40c59b4 Theodore Ts'o 2026-11-06  484  
82761bb40c59b4 Theodore Ts'o 2026-11-06  485  	sbi->s_sb = sb;
82761bb40c59b4 Theodore Ts'o 2026-11-06 @486  	sb->s_fs_info = sbi;
82761bb40c59b4 Theodore Ts'o 2026-11-06  487  	sb->s_op = &bv_test_sops;
82761bb40c59b4 Theodore Ts'o 2026-11-06  488  #ifdef CONFIG_FS_ENCRYPTION
82761bb40c59b4 Theodore Ts'o 2026-11-06  489  	sb->s_cop = &ext4_cryptops;
82761bb40c59b4 Theodore Ts'o 2026-11-06  490  #endif
82761bb40c59b4 Theodore Ts'o 2026-11-06  491  	sb->s_flags |= SB_ACTIVE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  492  	sb->s_blocksize = BV_TEST_BLK_SIZE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  493  	sb->s_blocksize_bits = BV_TEST_BLK_BITS;
82761bb40c59b4 Theodore Ts'o 2026-11-06  494  	sb->s_maxbytes = MAX_LFS_FILESIZE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  495  	sb->s_time_gran = 1;
82761bb40c59b4 Theodore Ts'o 2026-11-06  496  	sb->s_xattr = ext4_xattr_handlers;
82761bb40c59b4 Theodore Ts'o 2026-11-06  497  	strscpy(sb->s_id, "ext4_bv_kunit", sizeof(sb->s_id));
82761bb40c59b4 Theodore Ts'o 2026-11-06  498  
82761bb40c59b4 Theodore Ts'o 2026-11-06  499  	inode_init_once(&ctx->bd_inode);
82761bb40c59b4 Theodore Ts'o 2026-11-06  500  	ctx->bd_inode.i_sb = sb;
82761bb40c59b4 Theodore Ts'o 2026-11-06  501  	ctx->bd_inode.i_blkbits = BV_TEST_BLK_BITS;
82761bb40c59b4 Theodore Ts'o 2026-11-06  502  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
82761bb40c59b4 Theodore Ts'o 2026-11-06  503  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
82761bb40c59b4 Theodore Ts'o 2026-11-06  504  	ctx->bdev_queue.limits.logical_block_size = 512;
82761bb40c59b4 Theodore Ts'o 2026-11-06  505  	ctx->bdev_queue.limits.dma_alignment = 511;
82761bb40c59b4 Theodore Ts'o 2026-11-06  506  	ctx->bdev_disk.part0 = &ctx->bdev;
82761bb40c59b4 Theodore Ts'o 2026-11-06  507  	ctx->bdev_disk.queue = &ctx->bdev_queue;
82761bb40c59b4 Theodore Ts'o 2026-11-06  508  	ctx->bdev.bd_disk = &ctx->bdev_disk;
82761bb40c59b4 Theodore Ts'o 2026-11-06  509  	ctx->bdev.bd_queue = &ctx->bdev_queue;
82761bb40c59b4 Theodore Ts'o 2026-11-06  510  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
82761bb40c59b4 Theodore Ts'o 2026-11-06  511  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
82761bb40c59b4 Theodore Ts'o 2026-11-06  512  	sb->s_bdev = &ctx->bdev;
82761bb40c59b4 Theodore Ts'o 2026-11-06  513  
82761bb40c59b4 Theodore Ts'o 2026-11-06  514  	bgl_lock_init(&ctx->bgl);
82761bb40c59b4 Theodore Ts'o 2026-11-06  515  	sbi->s_blockgroup_lock = &ctx->bgl;
82761bb40c59b4 Theodore Ts'o 2026-11-06  516  
82761bb40c59b4 Theodore Ts'o 2026-11-06  517  	sbi->s_es = &ctx->es;
82761bb40c59b4 Theodore Ts'o 2026-11-06  518  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
82761bb40c59b4 Theodore Ts'o 2026-11-06  519  	ctx->es.s_first_data_block = cpu_to_le32(BV_TEST_FIRST_DATA_BLK);
82761bb40c59b4 Theodore Ts'o 2026-11-06  520  	ctx->es.s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
82761bb40c59b4 Theodore Ts'o 2026-11-06  521  	ctx->es.s_creator_os = cpu_to_le32(EXT4_OS_LINUX);
82761bb40c59b4 Theodore Ts'o 2026-11-06  522  	ctx->es.s_inodes_count = cpu_to_le32(BV_TEST_TOTAL_INODES);
82761bb40c59b4 Theodore Ts'o 2026-11-06  523  	ctx->es.s_inodes_per_group = cpu_to_le32(BV_TEST_INODES_PER_GRP);
82761bb40c59b4 Theodore Ts'o 2026-11-06  524  	ctx->es.s_blocks_per_group = cpu_to_le32(BV_TEST_BLOCKS_PER_GRP);
82761bb40c59b4 Theodore Ts'o 2026-11-06  525  	ctx->es.s_clusters_per_group = cpu_to_le32(BV_TEST_BLOCKS_PER_GRP);
82761bb40c59b4 Theodore Ts'o 2026-11-06  526  	ctx->es.s_first_ino = cpu_to_le32(BV_TEST_FIRST_INO);
82761bb40c59b4 Theodore Ts'o 2026-11-06  527  	ctx->es.s_inode_size = cpu_to_le16(BV_TEST_INODE_SIZE);
82761bb40c59b4 Theodore Ts'o 2026-11-06  528  	ctx->es.s_min_extra_isize = cpu_to_le16(BV_TEST_EXTRA_ISIZE);
82761bb40c59b4 Theodore Ts'o 2026-11-06  529  	ctx->es.s_want_extra_isize = cpu_to_le16(BV_TEST_EXTRA_ISIZE);
82761bb40c59b4 Theodore Ts'o 2026-11-06  530  	ctx->es.s_reserved_gdt_blocks = cpu_to_le16(BV_TEST_RSV_GDT_BLKS);
82761bb40c59b4 Theodore Ts'o 2026-11-06  531  	ctx->es.s_checksum_type = EXT4_CRC32C_CHKSUM;
82761bb40c59b4 Theodore Ts'o 2026-11-06  532  	ext4_blocks_count_set(&ctx->es, BV_TEST_TOTAL_BLKS);
82761bb40c59b4 Theodore Ts'o 2026-11-06  533  
82761bb40c59b4 Theodore Ts'o 2026-11-06  534  	ext4_set_feature_sparse_super(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  535  	ext4_set_feature_extents(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  536  	ext4_set_feature_extra_isize(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  537  	ext4_set_feature_metadata_csum(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  538  	ext4_set_feature_64bit(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  539  
82761bb40c59b4 Theodore Ts'o 2026-11-06  540  	ctx->sb_bh.b_data = (char *)&ctx->es;
82761bb40c59b4 Theodore Ts'o 2026-11-06  541  	ctx->sb_bh.b_size = sizeof(ctx->es);
82761bb40c59b4 Theodore Ts'o 2026-11-06  542  	ctx->sb_bh.b_bdev = &ctx->bdev;
82761bb40c59b4 Theodore Ts'o 2026-11-06  543  	atomic_set(&ctx->sb_bh.b_count, 1);
82761bb40c59b4 Theodore Ts'o 2026-11-06  544  	set_buffer_uptodate(&ctx->sb_bh);
82761bb40c59b4 Theodore Ts'o 2026-11-06  545  	sbi->s_sbh = &ctx->sb_bh;
82761bb40c59b4 Theodore Ts'o 2026-11-06  546  
82761bb40c59b4 Theodore Ts'o 2026-11-06  547  	ctx->gdesc_bh.b_data = ctx->gdesc_buf;
82761bb40c59b4 Theodore Ts'o 2026-11-06  548  	ctx->gdesc_bh.b_size = BV_TEST_BLK_SIZE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  549  	ctx->gdesc_bh.b_blocknr = BV_TEST_GDESC_BLK;
82761bb40c59b4 Theodore Ts'o 2026-11-06  550  	ctx->gdesc_bh.b_bdev = &ctx->bdev;
82761bb40c59b4 Theodore Ts'o 2026-11-06  551  	atomic_set(&ctx->gdesc_bh.b_count, 1);
82761bb40c59b4 Theodore Ts'o 2026-11-06  552  	set_buffer_uptodate(&ctx->gdesc_bh);
82761bb40c59b4 Theodore Ts'o 2026-11-06  553  
82761bb40c59b4 Theodore Ts'o 2026-11-06  554  	sbi->s_inode_size = BV_TEST_INODE_SIZE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  555  	sbi->s_inodes_per_block = BV_TEST_INODES_PER_BLK;
82761bb40c59b4 Theodore Ts'o 2026-11-06  556  	sbi->s_inodes_per_group = BV_TEST_INODES_PER_GRP;
82761bb40c59b4 Theodore Ts'o 2026-11-06  557  	sbi->s_itb_per_group = BV_TEST_ITB_PER_GRP;
82761bb40c59b4 Theodore Ts'o 2026-11-06  558  	sbi->s_first_ino = BV_TEST_FIRST_INO;
82761bb40c59b4 Theodore Ts'o 2026-11-06  559  	sbi->s_want_extra_isize = BV_TEST_EXTRA_ISIZE;
82761bb40c59b4 Theodore Ts'o 2026-11-06  560  	sbi->s_blocks_per_group = BV_TEST_BLOCKS_PER_GRP;
82761bb40c59b4 Theodore Ts'o 2026-11-06  561  	sbi->s_clusters_per_group = BV_TEST_BLOCKS_PER_GRP;
82761bb40c59b4 Theodore Ts'o 2026-11-06  562  	sbi->s_cluster_ratio = 1;
82761bb40c59b4 Theodore Ts'o 2026-11-06  563  	sbi->s_cluster_bits = 0;
82761bb40c59b4 Theodore Ts'o 2026-11-06  564  	sbi->s_groups_count = BV_TEST_NGROUPS;
82761bb40c59b4 Theodore Ts'o 2026-11-06  565  	sbi->s_gdb_count = BV_TEST_GDB_COUNT;
82761bb40c59b4 Theodore Ts'o 2026-11-06  566  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
82761bb40c59b4 Theodore Ts'o 2026-11-06  567  	sbi->s_desc_per_block = BV_TEST_BLK_SIZE / EXT4_MIN_DESC_SIZE_64BIT;
82761bb40c59b4 Theodore Ts'o 2026-11-06  568  	sbi->s_desc_per_block_bits = ilog2(sbi->s_desc_per_block);
82761bb40c59b4 Theodore Ts'o 2026-11-06  569  	sbi->s_bitmap_maxbytes = 0x1ff7ffff000ULL;
82761bb40c59b4 Theodore Ts'o 2026-11-06  570  
82761bb40c59b4 Theodore Ts'o 2026-11-06  571  	mutex_init(&sbi->s_orphan_lock);
82761bb40c59b4 Theodore Ts'o 2026-11-06  572  	INIT_LIST_HEAD(&sbi->s_orphan);
82761bb40c59b4 Theodore Ts'o 2026-11-06  573  	set_opt(sb, ERRORS_CONT);
82761bb40c59b4 Theodore Ts'o 2026-11-06  574  	spin_lock_init(&sbi->s_bdev_wb_lock);
82761bb40c59b4 Theodore Ts'o 2026-11-06  575  	spin_lock_init(&sbi->s_error_lock);
82761bb40c59b4 Theodore Ts'o 2026-11-06  576  	spin_lock_init(&sbi->s_md_lock);
82761bb40c59b4 Theodore Ts'o 2026-11-06  577  	INIT_WORK(&sbi->s_sb_upd_work, bv_test_sb_upd_work);
82761bb40c59b4 Theodore Ts'o 2026-11-06  578  	timer_setup(&sbi->s_err_report, bv_test_err_timer, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  579  	mutex_init(&sbi->s_fc_lock);
82761bb40c59b4 Theodore Ts'o 2026-11-06  580  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
82761bb40c59b4 Theodore Ts'o 2026-11-06  581  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
82761bb40c59b4 Theodore Ts'o 2026-11-06  582  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
82761bb40c59b4 Theodore Ts'o 2026-11-06  583  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
82761bb40c59b4 Theodore Ts'o 2026-11-06  584  
82761bb40c59b4 Theodore Ts'o 2026-11-06  585  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
82761bb40c59b4 Theodore Ts'o 2026-11-06  586  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  587  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
82761bb40c59b4 Theodore Ts'o 2026-11-06  588  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  589  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
82761bb40c59b4 Theodore Ts'o 2026-11-06  590  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  591  
82761bb40c59b4 Theodore Ts'o 2026-11-06  592  	for (g = 0; g < BV_TEST_NGROUPS; g++) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  593  		bv_set_group_meta(sb, &ctx->gdps[g],
82761bb40c59b4 Theodore Ts'o 2026-11-06  594  				  bv_default_bbitmap_blk(g),
82761bb40c59b4 Theodore Ts'o 2026-11-06  595  				  bv_default_ibitmap_blk(g),
82761bb40c59b4 Theodore Ts'o 2026-11-06  596  				  bv_default_itable_blk(g));
82761bb40c59b4 Theodore Ts'o 2026-11-06  597  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  598  
82761bb40c59b4 Theodore Ts'o 2026-11-06  599  	err = ext4_es_register_shrinker(sbi);
82761bb40c59b4 Theodore Ts'o 2026-11-06  600  	if (err) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  601  		deactivate_locked_super(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  602  		rcu_barrier();
82761bb40c59b4 Theodore Ts'o 2026-11-06  603  		free_percpu(ctx->bdev.bd_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  604  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  605  		KUNIT_ASSERT_EQ(test, err, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  606  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  607  	WRITE_ONCE(sbi->s_es_shrinker->count_objects, bv_dummy_shrinker_count);
82761bb40c59b4 Theodore Ts'o 2026-11-06  608  	WRITE_ONCE(sbi->s_es_shrinker->scan_objects, bv_dummy_shrinker_scan);
82761bb40c59b4 Theodore Ts'o 2026-11-06  609  
82761bb40c59b4 Theodore Ts'o 2026-11-06  610  	root_inode = new_inode(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  611  	if (!root_inode) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  612  		deactivate_locked_super(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  613  		ext4_es_unregister_shrinker(sbi);
82761bb40c59b4 Theodore Ts'o 2026-11-06  614  		rcu_barrier();
82761bb40c59b4 Theodore Ts'o 2026-11-06  615  		free_percpu(ctx->bdev.bd_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  616  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  617  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc root_inode");
82761bb40c59b4 Theodore Ts'o 2026-11-06  618  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  619  	root_inode->i_ino = EXT4_ROOT_INO;
82761bb40c59b4 Theodore Ts'o 2026-11-06  620  	root_inode->i_mode = S_IFDIR | 0755;
82761bb40c59b4 Theodore Ts'o 2026-11-06  621  	root_inode->i_op = &simple_dir_inode_operations;
82761bb40c59b4 Theodore Ts'o 2026-11-06  622  	set_nlink(root_inode, 2);
82761bb40c59b4 Theodore Ts'o 2026-11-06  623  	sb->s_root = d_make_root(root_inode);
82761bb40c59b4 Theodore Ts'o 2026-11-06  624  	if (!sb->s_root) {
82761bb40c59b4 Theodore Ts'o 2026-11-06  625  		deactivate_locked_super(sb);
82761bb40c59b4 Theodore Ts'o 2026-11-06  626  		ext4_es_unregister_shrinker(sbi);
82761bb40c59b4 Theodore Ts'o 2026-11-06  627  		rcu_barrier();
82761bb40c59b4 Theodore Ts'o 2026-11-06  628  		free_percpu(ctx->bdev.bd_stats);
82761bb40c59b4 Theodore Ts'o 2026-11-06  629  		kfree(ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  630  		KUNIT_FAIL_AND_ABORT(test, "failed to create s_root");
82761bb40c59b4 Theodore Ts'o 2026-11-06  631  	}
82761bb40c59b4 Theodore Ts'o 2026-11-06  632  
82761bb40c59b4 Theodore Ts'o 2026-11-06  633  	up_write(&sb->s_umount);
82761bb40c59b4 Theodore Ts'o 2026-11-06  634  
82761bb40c59b4 Theodore Ts'o 2026-11-06  635  	kunit_activate_static_stub(test, ext4_get_group_desc,
82761bb40c59b4 Theodore Ts'o 2026-11-06  636  				   bv_get_group_desc_stub);
82761bb40c59b4 Theodore Ts'o 2026-11-06  637  	kunit_activate_static_stub(test, __ext4_iget, bv_iget_stub);
82761bb40c59b4 Theodore Ts'o 2026-11-06  638  
82761bb40c59b4 Theodore Ts'o 2026-11-06  639  	err = kunit_add_action_or_reset(test, bv_test_cleanup_action, ctx);
82761bb40c59b4 Theodore Ts'o 2026-11-06  640  	KUNIT_ASSERT_EQ(test, err, 0);
82761bb40c59b4 Theodore Ts'o 2026-11-06  641  	return 0;
82761bb40c59b4 Theodore Ts'o 2026-11-06  642  }
82761bb40c59b4 Theodore Ts'o 2026-11-06  643  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
