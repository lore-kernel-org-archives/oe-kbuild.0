Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521535;
	b=f0cY15xyyasqXtkN4gmjQAFRtUYCawWheIF9acR8sxwbXEKpRG8F1G3QUARwRN/IDSn6
	 kjbtvGu/5MFV/2kv0I+bNfyyO4SBhavGVm/jM9N2INxuwHCXqbH1bExusWQfNSTZWAg0O
	 YOFS3xt2QpZP1hlLgURG18XqlWOuk6uNvdNzFgs3QxH/3/pPK6Q8YffI7UmQ9YG+FsQHB
	 dflIgCG6Qb037P945TnHBC+xWQ0629qdCG6fNhwHS53yFg0hOb5HVM1vDXlauz2SwXAxr
	 ARISK2KoznG3a7qqJSAqXAVPljEhtaoMR9pU/yS2IjSK6nykGlythOOfEpsqvVafFkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521535;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=izIpWtxhCcbxXlkbyt7zb9I9w29uNEEhBlC5Dk6WZKw=;
	b=Q4DjoN5afVdsPlYeW6C0KvI7c7deIPAOZp6GfuguXuMvSfLkqSf932gJrL5dAep915WR
	 Da+AQLg1lgkw8UEaLawf0HAl0a7dGoMWdbogbLgk99SJHYpGM4lkRylxETyNiBuwoza0V
	 qMhxipZ9/hLdRCAOowkkncqmDOTuW+nZSLDoDkOvFAb9mQ3jtamHR+ceiNGkf14Smma9W
	 ljlaNA+WZ1YqXOwzEZXDWErTYlel5+sYrsJKyBTIaBuiFnvuReBwBMTxjWhUebDHgAtOO
	 bmPhBStdkxL6eLgEv/+98lVjJ7BPi4jSRbxZatV+cy6PxU7lzu0dRpNf++C00chdxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5ITZr5B;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA602606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 22:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA602606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5ITZr5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794521534; x=1826057534;
  h=date:from:to:cc:subject:message-id;
  bh=GQqK/Texnqtkprg/dliyHB1AiBLoV5wQ3UQnBy7xojo=;
  b=C5ITZr5BWOoSYPDpVKe7w7ijmOzM/6oLmLyr8339upJ0zxtGRqYQ/YN8
   nRFB5E4oo4Vtf+fr8OlIYgDr0lyuHl2IizjYbH+i5nmAltFDYMNnKnNsj
   J/xtEW8+ZZ4sklHiPE0dSGXvhTxg6fsC9vHHvyEixosvAXSNFehkQmEzL
   TiX0BtguZyxaQehAb11hEVd0DzuFhhKkzsysxIczPZzp5zN6/zGOJSs74
   Q5+RgDfPWOfeXPRHQnYLCqlJ0oQLf9aR+54PJrXwf9taSiN6KbJ6FkuEl
   TGzf6A2NGk6ren37YjWAXZ91QQyC57O7oTO/xohPrhF7vW7RApOTrXQyz
   Q==;
X-CSE-ConnectionGUID: CDKwoqfNQFO7hdwSAVO/qQ==
X-CSE-MsgGUID: taxgGQkdTHO906ATi2OgMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3216459"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3216459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 14:12:13 -0800
X-CSE-ConnectionGUID: 0uI+HTstQmGfCddz3/LSEg==
X-CSE-MsgGUID: /QLJyo4SR7WdzeaAaPM5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9325235"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2026 14:12:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRd1d-000000000yZ-0JBv;
	Thu, 12 Nov 2026 22:12:09 +0000
Date: Thu, 12 Nov 2026 23:11:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 17/50] fs/ext4/super-test.c:312
 super_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611122336.ExhSFMb8-lkp@intel.com>
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
commit: 1cec1055be7fc2b602f1cde94d772ec822ad6d74 [17/50] ext4: add KUnit tests for fs/ext4/super.c
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122336.ExhSFMb8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122336.ExhSFMb8-lkp@intel.com/

smatch warnings:
fs/ext4/super-test.c:312 super_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +312 fs/ext4/super-test.c

1cec1055be7fc2 Theodore Ts'o 2026-11-11  253  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  254  KUNIT_DEFINE_ACTION_WRAPPER(super_test_cleanup_action, super_test_cleanup,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  255  			    struct super_test_ctx *);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  256  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  257  static int super_test_init(struct kunit *test)
1cec1055be7fc2 Theodore Ts'o 2026-11-11  258  {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  259  	struct super_test_ctx *ctx;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  260  	struct fs_context *fc;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  261  	struct super_block *sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  262  	struct ext4_sb_info *sbi;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  263  	struct inode *root_inode;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  264  	int err;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  265  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  266  	ctx = kzalloc_obj(*ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  267  	KUNIT_ASSERT_NOT_NULL(test, ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  268  	test->priv = ctx;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  269  	active_super_test = test;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  270  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  271  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  272  	if (!ctx->bdev.bd_stats) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  273  		kfree(ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  274  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
1cec1055be7fc2 Theodore Ts'o 2026-11-11  275  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  276  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  277  	fc = fs_context_for_mount(&super_test_fs_type, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  278  	if (IS_ERR(fc)) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  279  		err = PTR_ERR(fc);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  280  		free_percpu(ctx->bdev.bd_stats);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  281  		kfree(ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  282  		KUNIT_ASSERT_EQ(test, err, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  283  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  284  	sb = sget_fc(fc, NULL, set_anon_super_fc);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  285  	put_fs_context(fc);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  286  	if (IS_ERR(sb)) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  287  		err = PTR_ERR(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  288  		free_percpu(ctx->bdev.bd_stats);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  289  		kfree(ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  290  		KUNIT_ASSERT_EQ(test, err, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  291  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  292  	ctx->sb = sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  293  	sbi = &ctx->sbi;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  294  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  295  	err = percpu_counter_init(&sbi->s_freeclusters_counter, 0, GFP_KERNEL);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  296  	if (err)
1cec1055be7fc2 Theodore Ts'o 2026-11-11  297  		goto err_sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  298  	err = percpu_counter_init(&sbi->s_dirtyclusters_counter, 0, GFP_KERNEL);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  299  	if (err) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  300  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  301  		goto err_sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  302  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  303  	err = percpu_counter_init(&sbi->s_freeinodes_counter, 0, GFP_KERNEL);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  304  	if (err) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  305  		percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  306  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  307  		goto err_sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  308  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  309  	ctx->counters_inited = true;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  310  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  311  	sbi->s_sb = sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11 @312  	sb->s_fs_info = sbi;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  313  	sb->s_op = &super_test_sops;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  314  #ifdef CONFIG_FS_ENCRYPTION
1cec1055be7fc2 Theodore Ts'o 2026-11-11  315  	sb->s_cop = &ext4_cryptops;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  316  #endif
1cec1055be7fc2 Theodore Ts'o 2026-11-11  317  	sb->s_flags |= SB_ACTIVE;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  318  	sb->s_blocksize = SUPER_TEST_BLK_SIZE;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  319  	sb->s_blocksize_bits = SUPER_TEST_BLK_BITS;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  320  	sb->s_maxbytes = MAX_LFS_FILESIZE;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  321  	sb->s_time_gran = 1;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  322  	sb->s_xattr = ext4_xattr_handlers;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  323  	strscpy(sb->s_id, "ext4_super_kunit", sizeof(sb->s_id));
1cec1055be7fc2 Theodore Ts'o 2026-11-11  324  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  325  	inode_init_once(&ctx->bd_inode);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  326  	ctx->bd_inode.i_sb = sb;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  327  	ctx->bd_inode.i_blkbits = SUPER_TEST_BLK_BITS;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  328  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  329  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  330  	ctx->bdev_queue.limits.logical_block_size = 512;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  331  	ctx->bdev_queue.limits.dma_alignment = 511;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  332  	ctx->bdev_disk.part0 = &ctx->bdev;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  333  	ctx->bdev_disk.queue = &ctx->bdev_queue;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  334  	ctx->bdev.bd_disk = &ctx->bdev_disk;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  335  	ctx->bdev.bd_queue = &ctx->bdev_queue;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  336  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  337  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  338  	sb->s_bdev = &ctx->bdev;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  339  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  340  	bgl_lock_init(&ctx->bgl);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  341  	sbi->s_blockgroup_lock = &ctx->bgl;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  342  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  343  	sbi->s_es = &ctx->es;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  344  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  345  	ctx->es.s_first_data_block = cpu_to_le32(SUPER_TEST_FIRST_DATA_BLK);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  346  	ctx->es.s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  347  	ctx->es.s_creator_os = cpu_to_le32(EXT4_OS_LINUX);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  348  	ctx->es.s_inodes_count = cpu_to_le32(SUPER_TEST_TOTAL_INODES);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  349  	ctx->es.s_inodes_per_group = cpu_to_le32(SUPER_TEST_INODES_PER_GRP);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  350  	ctx->es.s_blocks_per_group = cpu_to_le32(SUPER_TEST_BLOCKS_PER_GRP);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  351  	ctx->es.s_clusters_per_group = cpu_to_le32(SUPER_TEST_BLOCKS_PER_GRP);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  352  	ctx->es.s_first_ino = cpu_to_le32(SUPER_TEST_FIRST_INO);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  353  	ctx->es.s_inode_size = cpu_to_le16(SUPER_TEST_INODE_SIZE);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  354  	ctx->es.s_min_extra_isize = cpu_to_le16(SUPER_TEST_EXTRA_ISIZE);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  355  	ctx->es.s_want_extra_isize = cpu_to_le16(SUPER_TEST_EXTRA_ISIZE);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  356  	ctx->es.s_desc_size = cpu_to_le16(EXT4_MIN_DESC_SIZE_64BIT);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  357  	ctx->es.s_reserved_gdt_blocks = cpu_to_le16(SUPER_TEST_RSV_GDT_BLKS);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  358  	ctx->es.s_errors = cpu_to_le16(EXT4_ERRORS_RO);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  359  	ctx->es.s_checksum_type = EXT4_CRC32C_CHKSUM;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  360  	generate_random_uuid(ctx->es.s_uuid);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  361  	ext4_blocks_count_set(&ctx->es, SUPER_TEST_TOTAL_BLKS);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  362  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  363  	ext4_set_feature_sparse_super(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  364  	ext4_set_feature_extents(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  365  	ext4_set_feature_extra_isize(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  366  	ext4_set_feature_metadata_csum(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  367  	ext4_set_feature_64bit(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  368  	sbi->s_csum_seed = ext4_chksum(~0, ctx->es.s_uuid,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  369  				       sizeof(ctx->es.s_uuid));
1cec1055be7fc2 Theodore Ts'o 2026-11-11  370  	ext4_superblock_csum_set(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  371  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  372  	ctx->sb_bh.b_data = (char *)&ctx->es;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  373  	ctx->sb_bh.b_size = sizeof(ctx->es);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  374  	ctx->sb_bh.b_bdev = &ctx->bdev;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  375  	atomic_set(&ctx->sb_bh.b_count, 1);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  376  	set_buffer_uptodate(&ctx->sb_bh);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  377  	sbi->s_sbh = &ctx->sb_bh;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  378  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  379  	sbi->s_sb_block = 1;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  380  	sbi->s_inode_size = SUPER_TEST_INODE_SIZE;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  381  	sbi->s_inodes_per_block = SUPER_TEST_INODES_PER_BLK;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  382  	sbi->s_inodes_per_group = SUPER_TEST_INODES_PER_GRP;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  383  	sbi->s_itb_per_group = SUPER_TEST_ITB_PER_GRP;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  384  	sbi->s_first_ino = SUPER_TEST_FIRST_INO;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  385  	sbi->s_want_extra_isize = SUPER_TEST_EXTRA_ISIZE;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  386  	sbi->s_blocks_per_group = SUPER_TEST_BLOCKS_PER_GRP;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  387  	sbi->s_clusters_per_group = SUPER_TEST_BLOCKS_PER_GRP;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  388  	sbi->s_cluster_ratio = 1;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  389  	sbi->s_cluster_bits = 0;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  390  	sbi->s_groups_count = SUPER_TEST_NGROUPS;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  391  	sbi->s_gdb_count = SUPER_TEST_GDB_COUNT;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  392  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  393  	sbi->s_desc_per_block = SUPER_TEST_BLK_SIZE / EXT4_MIN_DESC_SIZE_64BIT;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  394  	sbi->s_desc_per_block_bits = ilog2(sbi->s_desc_per_block);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  395  	sbi->s_resuid = make_kuid(&init_user_ns, EXT4_DEF_RESUID);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  396  	sbi->s_resgid = make_kgid(&init_user_ns, EXT4_DEF_RESGID);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  397  	sbi->s_commit_interval = JBD2_DEFAULT_MAX_COMMIT_AGE * HZ;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  398  	sbi->s_min_batch_time = EXT4_DEF_MIN_BATCH_TIME;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  399  	sbi->s_max_batch_time = EXT4_DEF_MAX_BATCH_TIME;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  400  	sbi->s_inode_readahead_blks = EXT4_DEF_INODE_READAHEAD_BLKS;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  401  	sbi->s_li_wait_mult = EXT4_DEF_LI_WAIT_MULT;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  402  	sbi->s_err_report_sec = 86400;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  403  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  404  	spin_lock_init(&sbi->s_bdev_wb_lock);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  405  	spin_lock_init(&sbi->s_error_lock);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  406  	spin_lock_init(&sbi->s_md_lock);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  407  	INIT_WORK(&sbi->s_sb_upd_work, super_test_sb_upd_work);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  408  	timer_setup(&sbi->s_err_report, super_test_err_timer, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  409  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  410  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  411  			     DEFAULT_RATELIMIT_INTERVAL, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  412  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  413  			     DEFAULT_RATELIMIT_INTERVAL, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  414  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  415  			     DEFAULT_RATELIMIT_INTERVAL, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  416  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  417  	super_setup_default_groups(ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  418  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  419  	root_inode = new_inode(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  420  	if (!root_inode) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  421  		err = -ENOMEM;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  422  		goto err_counters;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  423  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  424  	root_inode->i_ino = EXT4_ROOT_INO;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  425  	root_inode->i_mode = S_IFDIR | 0755;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  426  	root_inode->i_flags |= S_NOQUOTA;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  427  	root_inode->i_op = &simple_dir_inode_operations;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  428  	set_nlink(root_inode, 2);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  429  	sb->s_root = d_make_root(root_inode);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  430  	if (!sb->s_root) {
1cec1055be7fc2 Theodore Ts'o 2026-11-11  431  		err = -ENOMEM;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  432  		goto err_counters;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  433  	}
1cec1055be7fc2 Theodore Ts'o 2026-11-11  434  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  435  	up_write(&sb->s_umount);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  436  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  437  	kunit_activate_static_stub(test, ext4_get_group_desc,
1cec1055be7fc2 Theodore Ts'o 2026-11-11  438  				   super_get_group_desc_stub);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  439  	kunit_activate_static_stub(test, __ext4_iget, super_iget_stub);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  440  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  441  	err = kunit_add_action_or_reset(test, super_test_cleanup_action, ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  442  	KUNIT_ASSERT_EQ(test, err, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  443  	return 0;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  444  
1cec1055be7fc2 Theodore Ts'o 2026-11-11  445  err_counters:
1cec1055be7fc2 Theodore Ts'o 2026-11-11  446  	percpu_counter_destroy(&sbi->s_freeinodes_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  447  	percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  448  	percpu_counter_destroy(&sbi->s_freeclusters_counter);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  449  err_sb:
1cec1055be7fc2 Theodore Ts'o 2026-11-11  450  	active_super_test = NULL;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  451  	deactivate_locked_super(sb);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  452  	rcu_barrier();
1cec1055be7fc2 Theodore Ts'o 2026-11-11  453  	free_percpu(ctx->bdev.bd_stats);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  454  	kfree(ctx);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  455  	KUNIT_ASSERT_EQ(test, err, 0);
1cec1055be7fc2 Theodore Ts'o 2026-11-11  456  	return err;
1cec1055be7fc2 Theodore Ts'o 2026-11-11  457  }
1cec1055be7fc2 Theodore Ts'o 2026-11-11  458  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
