Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547891;
	b=QjWtQMxPdkLNvEFHUFLsIErRj5dS+qckNPybJNCjjI853iX0nGNngVJlRLb5+/n8reVj
	 I8tO7qi3+EmiUGqhkaiLc74d8N1A6iBsG5WML0cHocuBVLw4/hLV2AN9hLaF2v5dMQjKX
	 x+ard44WKNjW0UosIouojRhCyOw4KAOeCbN6C5pC34BWWvlaEz3IOJQX2yikw8S94eH/s
	 mGZDRtRpGyv1ui8oEmHT8OnL+LccpLtkyyquhQl+ivcc8vrgtomprTuGZbsO1wwlkjSQx
	 frq+JZtvlTFjH5oI05/eaq4G+mU8mqjuvuq242JosyoMaFMx4i4NIRzAS+JDxX1idUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ULsQJUwdnaTthMpxsDOalrAWwXtNHFYqKktvC4rETy0=;
	b=yFYBwbmjqpqV+4Uq6JTGoQKfvD/URcszzDk4/mq5UNyzqmVPLX21oT7jC36xvhAVKy3M
	 pcoNkSvb9wVnnBZZn9+Gf2sevYGWT5zCUKJnyN+LwXmyQF2BeMfhWYn7YGsU3Aj/fvQzp
	 atrPHTitYWKRlQPV77PjGCJEL44RvIvBE0AbhZxO76kTjHvsj7xCr1hOfCirR6LysHowd
	 taEXcFo4Mrf8WEP8RHWfxhBo71Rs/FHEmUEzrBwMgKxwc0wSOJ+vcSZKVqGzREhOoS0MK
	 EjggjpA3O0y/rTGY5USYzTRYMO2TRbUb/C5UkijCHFZOnzpobAS86o5uutmkqTGJOxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ft0nWLRL;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D3606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 05:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ft0nWLRL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794547891; x=1826083891;
  h=date:from:to:cc:subject:message-id;
  bh=cn66ziHiK2dBAWmuhszJIMWXoNshY0Lph7d6LTV2aCE=;
  b=Ft0nWLRLmbtzcYZsvbnsBx7u9RnuNrHVDk2I2Pn2BQMI2hKzudP+3hgn
   DCd7Ygz4P11govKz6p8O2kCX+WAiMjSbP80Hdtoh7gvYvnaAch3//3d/B
   m2VozVldlj3KbDPzgk7m9ClQfoeMN7ikUNJ2zNCsxDB1w/siQuwAcZjs9
   4rl5lx4HJltH7VSdtNMdou7wNJ8Xe748cuj05BRD3QogEx5DRn66wb0/G
   3wnwNx4M+ypbZX5ThZH3qWzKE38KLG1qfu7iy2D8JbB4FBadyfQkuKlTx
   R4Lmg874evnakmSAPQ5KIUkYqrH2FwYrst4fCEddhJ4dT9d3VsNOCpCAd
   w==;
X-CSE-ConnectionGUID: w4hlUtzgQ9qKwdGcq4sUEQ==
X-CSE-MsgGUID: aH2RxwHUQMSSCby0ZByoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3348472"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3348472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 21:31:30 -0800
X-CSE-ConnectionGUID: U0tlkc4VT025i4KBCgS5jw==
X-CSE-MsgGUID: GM9vi/IhQl+NHw3yvM94hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8856623"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2026 21:31:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRjsk-0000000016j-2RFC;
	Fri, 13 Nov 2026 05:31:26 +0000
Date: Fri, 13 Nov 2026 06:30:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 21/50] fs/ext4/migrate-test.c:575
 migrate_test_init() error: dereferencing freed memory 'sbh' (line 573)
Message-ID: <202611130636.RHu0VHtY-lkp@intel.com>
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
commit: dd357969500928cd46fd524d98194afaaeb18d0b [21/50] ext4: add KUnit tests for fs/ext4/migrate.c
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130636.RHu0VHtY-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611130636.RHu0VHtY-lkp@intel.com/

smatch warnings:
fs/ext4/migrate-test.c:575 migrate_test_init() error: dereferencing freed memory 'sbh' (line 573)

vim +/sbh +575 fs/ext4/migrate-test.c

dd357969500928 Theodore Ts'o 2026-11-11  507  
dd357969500928 Theodore Ts'o 2026-11-11  508  	strscpy(sb->s_id, "ext4_migrate_kunit", sizeof(sb->s_id));
dd357969500928 Theodore Ts'o 2026-11-11  509  	inode_init_once(&ctx->bd_inode);
dd357969500928 Theodore Ts'o 2026-11-11  510  	ctx->bd_inode.i_sb = sb;
dd357969500928 Theodore Ts'o 2026-11-11  511  	ctx->bd_inode.i_blkbits = MIGRATE_TEST_BLK_BITS;
dd357969500928 Theodore Ts'o 2026-11-11  512  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
dd357969500928 Theodore Ts'o 2026-11-11  513  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
dd357969500928 Theodore Ts'o 2026-11-11  514  	ctx->bdev_disk.part0 = &ctx->bdev;
dd357969500928 Theodore Ts'o 2026-11-11  515  	ctx->bdev_disk.queue = &ctx->bdev_queue;
dd357969500928 Theodore Ts'o 2026-11-11  516  	ctx->bdev.bd_disk = &ctx->bdev_disk;
dd357969500928 Theodore Ts'o 2026-11-11  517  	ctx->bdev.bd_queue = &ctx->bdev_queue;
dd357969500928 Theodore Ts'o 2026-11-11  518  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
dd357969500928 Theodore Ts'o 2026-11-11  519  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
dd357969500928 Theodore Ts'o 2026-11-11  520  	sb->s_bdev = &ctx->bdev;
dd357969500928 Theodore Ts'o 2026-11-11  521  
dd357969500928 Theodore Ts'o 2026-11-11  522  	sbi->s_sb = sb;
dd357969500928 Theodore Ts'o 2026-11-11  523  	sbi->s_blockgroup_lock = &ctx->bgl;
dd357969500928 Theodore Ts'o 2026-11-11  524  	bgl_lock_init(&ctx->bgl);
dd357969500928 Theodore Ts'o 2026-11-11  525  	INIT_WORK(&sbi->s_sb_upd_work, migrate_test_sb_upd_work);
dd357969500928 Theodore Ts'o 2026-11-11  526  	timer_setup(&sbi->s_err_report, migrate_test_err_timer, 0);
dd357969500928 Theodore Ts'o 2026-11-11  527  	spin_lock_init(&sbi->s_error_lock);
dd357969500928 Theodore Ts'o 2026-11-11  528  	spin_lock_init(&sbi->s_md_lock);
dd357969500928 Theodore Ts'o 2026-11-11  529  	spin_lock_init(&sbi->s_bdev_wb_lock);
dd357969500928 Theodore Ts'o 2026-11-11  530  	spin_lock_init(&sbi->s_es_lock);
dd357969500928 Theodore Ts'o 2026-11-11  531  	INIT_LIST_HEAD(&sbi->s_es_list);
dd357969500928 Theodore Ts'o 2026-11-11  532  	mutex_init(&sbi->s_fc_lock);
dd357969500928 Theodore Ts'o 2026-11-11  533  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
dd357969500928 Theodore Ts'o 2026-11-11  534  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
dd357969500928 Theodore Ts'o 2026-11-11  535  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
dd357969500928 Theodore Ts'o 2026-11-11  536  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
dd357969500928 Theodore Ts'o 2026-11-11  537  	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
dd357969500928 Theodore Ts'o 2026-11-11  538  	ratelimit_state_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
dd357969500928 Theodore Ts'o 2026-11-11  539  	ratelimit_state_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);
dd357969500928 Theodore Ts'o 2026-11-11  540  
dd357969500928 Theodore Ts'o 2026-11-11  541  	ret = percpu_init_rwsem(&sbi->s_writepages_rwsem);
dd357969500928 Theodore Ts'o 2026-11-11  542  	KUNIT_ASSERT_EQ(test, ret, 0);
dd357969500928 Theodore Ts'o 2026-11-11  543  	ctx->rwsem_inited = true;
dd357969500928 Theodore Ts'o 2026-11-11  544  
dd357969500928 Theodore Ts'o 2026-11-11  545  	ret = percpu_counter_init(&sbi->s_freeclusters_counter, 4096,
dd357969500928 Theodore Ts'o 2026-11-11  546  				  GFP_KERNEL);
dd357969500928 Theodore Ts'o 2026-11-11  547  	KUNIT_ASSERT_EQ(test, ret, 0);
dd357969500928 Theodore Ts'o 2026-11-11  548  	ret = percpu_counter_init(&sbi->s_dirtyclusters_counter, 0, GFP_KERNEL);
dd357969500928 Theodore Ts'o 2026-11-11  549  	KUNIT_ASSERT_EQ(test, ret, 0);
dd357969500928 Theodore Ts'o 2026-11-11  550  	ret = percpu_counter_init(&sbi->s_freeinodes_counter, 200, GFP_KERNEL);
dd357969500928 Theodore Ts'o 2026-11-11  551  	KUNIT_ASSERT_EQ(test, ret, 0);
dd357969500928 Theodore Ts'o 2026-11-11  552  	ctx->counters_inited = true;
dd357969500928 Theodore Ts'o 2026-11-11  553  
dd357969500928 Theodore Ts'o 2026-11-11  554  	ret = ext4_es_register_shrinker(sbi);
dd357969500928 Theodore Ts'o 2026-11-11  555  	KUNIT_ASSERT_EQ(test, ret, 0);
dd357969500928 Theodore Ts'o 2026-11-11  556  	ctx->es_shrinker_inited = true;
dd357969500928 Theodore Ts'o 2026-11-11  557  
dd357969500928 Theodore Ts'o 2026-11-11  558  	sbi->s_blocks_per_group = MIGRATE_TEST_BLOCKS_PER_GRP;
dd357969500928 Theodore Ts'o 2026-11-11  559  	sbi->s_clusters_per_group = MIGRATE_TEST_BLOCKS_PER_GRP;
dd357969500928 Theodore Ts'o 2026-11-11  560  	sbi->s_cluster_ratio = 1;
dd357969500928 Theodore Ts'o 2026-11-11  561  	sbi->s_cluster_bits = 0;
dd357969500928 Theodore Ts'o 2026-11-11  562  	sbi->s_groups_count = MIGRATE_TEST_NGROUPS;
dd357969500928 Theodore Ts'o 2026-11-11  563  	sbi->s_inodes_per_group = MIGRATE_TEST_INODES_PER_GRP;
dd357969500928 Theodore Ts'o 2026-11-11  564  	sbi->s_inode_size = MIGRATE_TEST_INODE_SIZE;
dd357969500928 Theodore Ts'o 2026-11-11  565  	sbi->s_inodes_per_block = MIGRATE_TEST_BLK_SIZE /
dd357969500928 Theodore Ts'o 2026-11-11  566  				  MIGRATE_TEST_INODE_SIZE;
dd357969500928 Theodore Ts'o 2026-11-11  567  	sbi->s_first_ino = 11;
dd357969500928 Theodore Ts'o 2026-11-11  568  	sbi->s_mount_state = EXT4_VALID_FS;
dd357969500928 Theodore Ts'o 2026-11-11  569  	set_opt(sb, ERRORS_CONT);
dd357969500928 Theodore Ts'o 2026-11-11  570  
dd357969500928 Theodore Ts'o 2026-11-11  571  	sbh = migrate_get_or_create_bh(ctx, MIGRATE_TEST_FIRST_DATA_BLK);
dd357969500928 Theodore Ts'o 2026-11-11  572  	KUNIT_ASSERT_NOT_NULL(test, sbh);
dd357969500928 Theodore Ts'o 2026-11-11 @573  	brelse(sbh);
dd357969500928 Theodore Ts'o 2026-11-11  574  	sbi->s_sbh = sbh;
dd357969500928 Theodore Ts'o 2026-11-11 @575  	ctx->es = (struct ext4_super_block *)sbh->b_data;
dd357969500928 Theodore Ts'o 2026-11-11  576  	sbi->s_es = ctx->es;
dd357969500928 Theodore Ts'o 2026-11-11  577  
dd357969500928 Theodore Ts'o 2026-11-11  578  	ctx->es->s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
dd357969500928 Theodore Ts'o 2026-11-11  579  	ctx->es->s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
dd357969500928 Theodore Ts'o 2026-11-11  580  	ctx->es->s_first_data_block = cpu_to_le32(MIGRATE_TEST_FIRST_DATA_BLK);
dd357969500928 Theodore Ts'o 2026-11-11  581  	ctx->es->s_blocks_per_group = cpu_to_le32(MIGRATE_TEST_BLOCKS_PER_GRP);
dd357969500928 Theodore Ts'o 2026-11-11  582  	ctx->es->s_clusters_per_group =
dd357969500928 Theodore Ts'o 2026-11-11  583  		cpu_to_le32(MIGRATE_TEST_BLOCKS_PER_GRP);
dd357969500928 Theodore Ts'o 2026-11-11  584  	ctx->es->s_inodes_per_group = cpu_to_le32(MIGRATE_TEST_INODES_PER_GRP);
dd357969500928 Theodore Ts'o 2026-11-11  585  	ctx->es->s_inodes_count = cpu_to_le32(MIGRATE_TEST_NGROUPS *
dd357969500928 Theodore Ts'o 2026-11-11  586  					      MIGRATE_TEST_INODES_PER_GRP);
dd357969500928 Theodore Ts'o 2026-11-11  587  	ctx->es->s_inode_size = cpu_to_le16(MIGRATE_TEST_INODE_SIZE);
dd357969500928 Theodore Ts'o 2026-11-11  588  	ctx->es->s_checksum_type = EXT4_CRC32C_CHKSUM;
dd357969500928 Theodore Ts'o 2026-11-11  589  	generate_random_uuid(ctx->es->s_uuid);
dd357969500928 Theodore Ts'o 2026-11-11  590  	ext4_blocks_count_set(ctx->es, MIGRATE_TEST_TOTAL_BLKS);
dd357969500928 Theodore Ts'o 2026-11-11  591  	ext4_set_feature_extents(sb);
dd357969500928 Theodore Ts'o 2026-11-11  592  	ext4_set_feature_64bit(sb);
dd357969500928 Theodore Ts'o 2026-11-11  593  	ext4_set_feature_metadata_csum(sb);
dd357969500928 Theodore Ts'o 2026-11-11  594  	sbi->s_csum_seed = ext4_chksum(~0, ctx->es->s_uuid,
dd357969500928 Theodore Ts'o 2026-11-11  595  				       sizeof(ctx->es->s_uuid));
dd357969500928 Theodore Ts'o 2026-11-11  596  	ext4_superblock_csum_set(sb);
dd357969500928 Theodore Ts'o 2026-11-11  597  
dd357969500928 Theodore Ts'o 2026-11-11  598  	root_inode = migrate_make_test_inode(test, EXT4_ROOT_INO,
dd357969500928 Theodore Ts'o 2026-11-11  599  					     S_IFDIR | 0755);
dd357969500928 Theodore Ts'o 2026-11-11  600  	sb->s_root = d_make_root(root_inode);
dd357969500928 Theodore Ts'o 2026-11-11  601  	KUNIT_ASSERT_NOT_NULL(test, sb->s_root);
dd357969500928 Theodore Ts'o 2026-11-11  602  
dd357969500928 Theodore Ts'o 2026-11-11  603  	active_migrate_test = test;
dd357969500928 Theodore Ts'o 2026-11-11  604  	kunit_activate_static_stub(test, ext4_sb_bread, migrate_sb_bread_stub);
dd357969500928 Theodore Ts'o 2026-11-11  605  	kunit_activate_static_stub(test, ext4_ext_getblk,
dd357969500928 Theodore Ts'o 2026-11-11  606  				   migrate_ext_getblk_stub);
dd357969500928 Theodore Ts'o 2026-11-11  607  	kunit_activate_static_stub(test, __ext4_ext_dirty,
dd357969500928 Theodore Ts'o 2026-11-11  608  				   migrate_ext_dirty_stub);
dd357969500928 Theodore Ts'o 2026-11-11  609  	kunit_activate_static_stub(test, __ext4_handle_dirty_metadata,
dd357969500928 Theodore Ts'o 2026-11-11  610  				   migrate_handle_dirty_metadata_stub);
dd357969500928 Theodore Ts'o 2026-11-11  611  	kunit_activate_static_stub(test, __ext4_mark_inode_dirty,
dd357969500928 Theodore Ts'o 2026-11-11  612  				   migrate_mark_inode_dirty_stub);
dd357969500928 Theodore Ts'o 2026-11-11  613  	kunit_activate_static_stub(test, __ext4_new_inode,
dd357969500928 Theodore Ts'o 2026-11-11  614  				   migrate_new_inode_stub);
dd357969500928 Theodore Ts'o 2026-11-11  615  	kunit_activate_static_stub(test, ext4_mb_new_blocks,
dd357969500928 Theodore Ts'o 2026-11-11  616  				   migrate_mb_new_blocks_stub);
dd357969500928 Theodore Ts'o 2026-11-11  617  	kunit_activate_static_stub(test, ext4_free_blocks,
dd357969500928 Theodore Ts'o 2026-11-11  618  				   migrate_free_blocks_stub);
dd357969500928 Theodore Ts'o 2026-11-11  619  
dd357969500928 Theodore Ts'o 2026-11-11  620  	return 0;
dd357969500928 Theodore Ts'o 2026-11-11  621  }
dd357969500928 Theodore Ts'o 2026-11-11  622  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
