Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501296;
	b=xQbCisD6MLkBbfmLHqEd9CZw4Fy72uZ0vZPvMb4GlUhvIqeH1y1XoD/f2+3qevjznMtY
	 KJ8mnwFtasimeovLk0T07T1k9H1WAenuYYLrKswZudyBM+q0KBJ+WCf/+ulsqGRsoIrVu
	 Hruop1ojHeGHgC4Zv6KMx+5GAmv437dXlpmkUnKjZZ6WErMH3FsezNunSgk3lINuQ4YXH
	 1ZaIHxtlhsSar0BSR1AgK8aWSB4y0iAbWGI7z0PlUAFE0qa+c4Kb1+5W6DS9dbsC9aNHM
	 IvtnHP8xQdJxQlbMtDz7jx7OOaY5Tzbk33yqwVQJTcF8WAD+sUcnQq63HbAcFbsTKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501296;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DtCmcfyfkqNqTXdvP8DVsri2P40a/vIm0GqJAJZXqVY=;
	b=cvc3Mcu28uSCA+wUVYuuV/PUYxLhLJb9VXBE4inOg0rYdxAVPwE3p2mD9OH9vHaTBwmL
	 X8C+1jJnjdOhGDyC0PBgclqoT1oiWRhyVMiU3OhYX2hB1wIdWomyDwHghYF8J4ZQUqma4
	 UKWin9rx2yhKT8wSB7RotvIXSDsIA7706idUAA1f0v2s2e7rEDOs8y9vNyr04sp+1KsMV
	 JyTwcfpu856gP2I29SJGOmf8majsenen60Ft6M3XppDHYF258tuYbgciucMhxKrvYI2Eq
	 aZx2vDuZo7HKQqmksdnywAxLW8cZ/jYx/fwQVimfmPMn32ifdfxbUGW14xVRGNiLv4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ji/br2r9";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400B560A2610
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 16:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400B560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ji/br2r9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794501296; x=1826037296;
  h=date:from:to:cc:subject:message-id;
  bh=kkO/gBQHSI/M04g2IAHUCcFZcVVHotMWmf9Y2nRPIDk=;
  b=ji/br2r9MgzCDxnGejfyEdmjj1gtcCKJJQ4pfKK6DhWy74sNO/H+kQy4
   sMJg/s3tCSzpSVRbQmjQerBBmN5WbV0UFAP1YTwoi4FaBbrCyITg4joY1
   HUW2fF2rt+gu8H1z4bFkZ5o5RZnGLHH3bvPfyW6MhiearNFwH754SDDV6
   sZr5NGbrrMaAYCaYXKr+Juf8je3siW+le0/mZrIbFepaOd/hYD/Gv93Uq
   oYLfRALgTfIFKX3JDjCBHdDl92HRvC0s0/PjuDjeX+LqYQJxz3ptrYkLM
   tyFjObiAP3MaK1/FIjnMMPZIwuiTBFkMzk2j4VRE9i8wh4Z9PBldS7e8D
   w==;
X-CSE-ConnectionGUID: wEdiquhzQ0+4J109IsxeiA==
X-CSE-MsgGUID: vuzsf40nTCGV+CSBZ4+JvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3329735"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3329735"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:34:56 -0800
X-CSE-ConnectionGUID: f9Fw7x35SSueIL4EtNj1Qw==
X-CSE-MsgGUID: FBUcdXN4QIuiiiqYngMYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10472478"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 12 Nov 2026 08:34:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXlE-000000000v3-1tNH;
	Thu, 12 Nov 2026 16:34:52 +0000
Date: Thu, 12 Nov 2026 17:33:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 13/50] fs/ext4/orphan-test.c:855
 orphan_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611121755.hiQrKm5X-lkp@intel.com>
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
commit: 8a129f6ffb7e1892ce3c84ba50e50f0f1049383f [13/50] ext4: add KUnit tests for fs/ext4/orphan.c
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121755.hiQrKm5X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121755.hiQrKm5X-lkp@intel.com/

smatch warnings:
fs/ext4/orphan-test.c:855 orphan_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +855 fs/ext4/orphan-test.c

8a129f6ffb7e18 Theodore Ts'o 2026-11-06   811  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   812  KUNIT_DEFINE_ACTION_WRAPPER(orphan_test_cleanup_action, orphan_test_cleanup,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   813  			    struct orphan_test_ctx *);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   814  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   815  static int orphan_test_init(struct kunit *test)
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   816  {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   817  	struct orphan_test_ctx *ctx;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   818  	struct fs_context *fc;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   819  	struct super_block *sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   820  	struct ext4_sb_info *sbi;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   821  	struct inode *root_inode;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   822  	ext4_group_t g;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   823  	unsigned int bit;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   824  	int err;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   825  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   826  	ctx = kzalloc_obj(*ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   827  	KUNIT_ASSERT_NOT_NULL(test, ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   828  	test->priv = ctx;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   829  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   830  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   831  	if (!ctx->bdev.bd_stats) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   832  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   833  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   834  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   835  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   836  	fc = fs_context_for_mount(&orphan_test_fs_type, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   837  	if (IS_ERR(fc)) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   838  		err = PTR_ERR(fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   839  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   840  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   841  		KUNIT_ASSERT_EQ(test, err, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   842  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   843  	sb = sget_fc(fc, NULL, set_anon_super_fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   844  	put_fs_context(fc);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   845  	if (IS_ERR(sb)) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   846  		err = PTR_ERR(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   847  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   848  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   849  		KUNIT_ASSERT_EQ(test, err, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   850  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   851  	ctx->sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   852  	sbi = &ctx->sbi;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   853  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   854  	sbi->s_sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  @855  	sb->s_fs_info = sbi;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   856  	sb->s_op = &orphan_test_sops;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   857  #ifdef CONFIG_QUOTA
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   858  	sb->dq_op = &orphan_test_qops;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   859  #endif
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   860  #ifdef CONFIG_FS_ENCRYPTION
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   861  	sb->s_cop = &ext4_cryptops;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   862  #endif
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   863  	sb->s_flags |= SB_ACTIVE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   864  	sb->s_blocksize = ORPHAN_TEST_BLK_SIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   865  	sb->s_blocksize_bits = ORPHAN_TEST_BLK_BITS;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   866  	sb->s_maxbytes = MAX_LFS_FILESIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   867  	sb->s_time_gran = 1;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   868  	sb->s_xattr = ext4_xattr_handlers;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   869  	strscpy(sb->s_id, "ext4_orphan_kunit", sizeof(sb->s_id));
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   870  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   871  	inode_init_once(&ctx->bd_inode);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   872  	ctx->bd_inode.i_sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   873  	ctx->bd_inode.i_blkbits = ORPHAN_TEST_BLK_BITS;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   874  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   875  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   876  	ctx->bdev_queue.limits.logical_block_size = 512;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   877  	ctx->bdev_queue.limits.dma_alignment = 511;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   878  	ctx->bdev_disk.part0 = &ctx->bdev;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   879  	ctx->bdev_disk.queue = &ctx->bdev_queue;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   880  	ctx->bdev.bd_disk = &ctx->bdev_disk;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   881  	ctx->bdev.bd_queue = &ctx->bdev_queue;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   882  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   883  	/* Writable bdev by default so ext4_orphan_cleanup can proceed */
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   884  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   885  	sb->s_bdev = &ctx->bdev;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   886  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   887  	bgl_lock_init(&ctx->bgl);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   888  	sbi->s_blockgroup_lock = &ctx->bgl;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   889  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   890  	sbi->s_es = &ctx->es;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   891  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   892  	ctx->es.s_first_data_block = cpu_to_le32(ORPHAN_TEST_FIRST_DATA_BLK);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   893  	ctx->es.s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   894  	ctx->es.s_creator_os = cpu_to_le32(EXT4_OS_LINUX);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   895  	ctx->es.s_inodes_count = cpu_to_le32(ORPHAN_TEST_TOTAL_INODES);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   896  	ctx->es.s_inodes_per_group = cpu_to_le32(ORPHAN_TEST_INODES_PER_GRP);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   897  	ctx->es.s_blocks_per_group = cpu_to_le32(ORPHAN_TEST_BLOCKS_PER_GRP);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   898  	ctx->es.s_clusters_per_group = cpu_to_le32(ORPHAN_TEST_BLOCKS_PER_GRP);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   899  	ctx->es.s_first_ino = cpu_to_le32(ORPHAN_TEST_FIRST_INO);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   900  	ctx->es.s_orphan_file_inum = cpu_to_le32(ORPHAN_TEST_ORPHAN_INO);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   901  	ctx->es.s_inode_size = cpu_to_le16(ORPHAN_TEST_INODE_SIZE);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   902  	ctx->es.s_min_extra_isize = cpu_to_le16(ORPHAN_TEST_EXTRA_ISIZE);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   903  	ctx->es.s_want_extra_isize = cpu_to_le16(ORPHAN_TEST_EXTRA_ISIZE);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   904  	ctx->es.s_checksum_type = EXT4_CRC32C_CHKSUM;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   905  	ext4_blocks_count_set(&ctx->es, ORPHAN_TEST_TOTAL_BLKS);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   906  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   907  	ext4_set_feature_sparse_super(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   908  	ext4_set_feature_extents(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   909  	ext4_set_feature_extra_isize(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   910  	ext4_set_feature_metadata_csum(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   911  	ext4_set_feature_64bit(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   912  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   913  	/* Keep sb_bh unmapped so ext4_commit_super() skips bh_submit I/O */
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   914  	ctx->sb_bh.b_data = (char *)&ctx->es;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   915  	ctx->sb_bh.b_size = sizeof(ctx->es);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   916  	ctx->sb_bh.b_bdev = &ctx->bdev;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   917  	atomic_set(&ctx->sb_bh.b_count, 1);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   918  	set_buffer_uptodate(&ctx->sb_bh);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   919  	sbi->s_sbh = &ctx->sb_bh;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   920  	ext4_superblock_csum_set(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   921  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   922  	ctx->gdesc_bh.b_data = ctx->gdesc_buf;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   923  	ctx->gdesc_bh.b_size = ORPHAN_TEST_BLK_SIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   924  	ctx->gdesc_bh.b_blocknr = ORPHAN_TEST_GDESC_BLK;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   925  	ctx->gdesc_bh.b_bdev = &ctx->bdev;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   926  	atomic_set(&ctx->gdesc_bh.b_count, 1);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   927  	set_buffer_uptodate(&ctx->gdesc_bh);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   928  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   929  	sbi->s_inode_size = ORPHAN_TEST_INODE_SIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   930  	sbi->s_inodes_per_block = ORPHAN_TEST_INODES_PER_BLK;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   931  	sbi->s_inodes_per_group = ORPHAN_TEST_INODES_PER_GRP;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   932  	sbi->s_itb_per_group = ORPHAN_TEST_ITB_PER_GRP;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   933  	sbi->s_first_ino = ORPHAN_TEST_FIRST_INO;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   934  	sbi->s_want_extra_isize = ORPHAN_TEST_EXTRA_ISIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   935  	sbi->s_blocks_per_group = ORPHAN_TEST_BLOCKS_PER_GRP;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   936  	sbi->s_clusters_per_group = ORPHAN_TEST_BLOCKS_PER_GRP;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   937  	sbi->s_cluster_ratio = 1;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   938  	sbi->s_cluster_bits = 0;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   939  	sbi->s_groups_count = ORPHAN_TEST_NGROUPS;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   940  	sbi->s_gdb_count = 1;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   941  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   942  	sbi->s_desc_per_block = ORPHAN_TEST_BLK_SIZE / EXT4_MIN_DESC_SIZE_64BIT;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   943  	sbi->s_desc_per_block_bits = ilog2(sbi->s_desc_per_block);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   944  	sbi->s_bitmap_maxbytes = 0x1ff7ffff000ULL;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   945  	sbi->s_csum_seed = ORPHAN_TEST_CSUM_SEED;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   946  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   947  	mutex_init(&sbi->s_orphan_lock);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   948  	INIT_LIST_HEAD(&sbi->s_orphan);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   949  	sbi->s_journal = &ctx->mock_journal;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   950  	sbi->s_journal_triggers[EXT4_JTR_ORPHAN_FILE].sb = sb;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   951  	sbi->s_journal_triggers[EXT4_JTR_ORPHAN_FILE].tr_triggers.t_frozen =
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   952  		ext4_orphan_file_block_trigger;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   953  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   954  	set_opt(sb, ERRORS_CONT);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   955  	set_opt(sb, ORDERED_DATA);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   956  	spin_lock_init(&sbi->s_bdev_wb_lock);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   957  	spin_lock_init(&sbi->s_error_lock);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   958  	spin_lock_init(&sbi->s_md_lock);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   959  	INIT_WORK(&sbi->s_sb_upd_work, orphan_test_sb_upd_work);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   960  	timer_setup(&sbi->s_err_report, orphan_test_err_timer, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   961  	mutex_init(&sbi->s_fc_lock);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   962  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   963  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   964  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   965  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   966  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   967  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   968  			     DEFAULT_RATELIMIT_INTERVAL, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   969  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   970  			     DEFAULT_RATELIMIT_INTERVAL, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   971  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   972  			     DEFAULT_RATELIMIT_INTERVAL, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   973  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   974  	for (g = 0; g < ORPHAN_TEST_NGROUPS; g++) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   975  		struct orphan_test_ibitmap *ibm = &ctx->ibitmaps[g];
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   976  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   977  		init_rwsem(&ctx->grp_infos[g].alloc_sem);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   978  		ctx->grp_infos[g].bb_state = 0;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   979  		ctx->grp_info_ptrs[g] = &ctx->grp_infos[g];
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   980  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   981  		ext4_block_bitmap_set(sb, &ctx->gdps[g],
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   982  				      orphan_test_bbitmap_blk(g));
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   983  		ext4_inode_bitmap_set(sb, &ctx->gdps[g],
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   984  				      orphan_test_ibitmap_blk(g));
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   985  		ext4_inode_table_set(sb, &ctx->gdps[g],
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   986  				     orphan_test_itable_blk(g));
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   987  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   988  		ibm->bh.b_data = ibm->buf;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   989  		ibm->bh.b_size = ORPHAN_TEST_BLK_SIZE;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   990  		ibm->bh.b_bdev = &ctx->bdev;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   991  		ibm->bh.b_blocknr = orphan_test_ibitmap_blk(g);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   992  		atomic_set(&ibm->bh.b_count, 1);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   993  		if (g == 0) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   994  			for (bit = 0; bit < ORPHAN_TEST_FIRST_INO - 1; bit++)
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   995  				ext4_set_bit(bit, ibm->buf);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   996  		}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   997  		ext4_mark_bitmap_end(ORPHAN_TEST_INODES_PER_GRP,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   998  				     ORPHAN_TEST_BLK_SIZE * 8, ibm->buf);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06   999  		set_buffer_uptodate(&ibm->bh);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1000  		set_bitmap_uptodate(&ibm->bh);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1001  		set_buffer_verified(&ibm->bh);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1002  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1003  	ctx->grp_info_slice[0] = ctx->grp_info_ptrs;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1004  	rcu_assign_pointer(sbi->s_group_info, ctx->grp_info_slice);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1005  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1006  	root_inode = new_inode(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1007  	if (!root_inode) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1008  		deactivate_locked_super(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1009  		rcu_barrier();
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1010  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1011  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1012  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc root_inode");
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1013  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1014  	root_inode->i_ino = EXT4_ROOT_INO;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1015  	root_inode->i_mode = S_IFDIR | 0755;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1016  	root_inode->i_op = &simple_dir_inode_operations;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1017  	set_nlink(root_inode, 2);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1018  	sb->s_root = d_make_root(root_inode);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1019  	if (!sb->s_root) {
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1020  		deactivate_locked_super(sb);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1021  		rcu_barrier();
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1022  		free_percpu(ctx->bdev.bd_stats);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1023  		kfree(ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1024  		KUNIT_FAIL_AND_ABORT(test, "failed to create s_root");
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1025  	}
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1026  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1027  	up_write(&sb->s_umount);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1028  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1029  	kunit_activate_static_stub(test, __ext4_journal_get_write_access,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1030  				   orphan_test_get_write_access_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1031  	kunit_activate_static_stub(test, __ext4_handle_dirty_metadata,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1032  				   orphan_test_dirty_metadata_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1033  	kunit_activate_static_stub(test, ext4_get_inode_loc,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1034  				   orphan_test_get_inode_loc_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1035  	kunit_activate_static_stub(test, ext4_mark_iloc_dirty,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1036  				   orphan_test_mark_iloc_dirty_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1037  	kunit_activate_static_stub(test, __ext4_mark_inode_dirty,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1038  				   orphan_test_mark_inode_dirty_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1039  	kunit_activate_static_stub(test, __ext4_iget,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1040  				   orphan_test_iget_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1041  	kunit_activate_static_stub(test, ext4_getblk,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1042  				   orphan_test_getblk_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1043  	kunit_activate_static_stub(test, ext4_get_group_desc,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1044  				   orphan_test_get_group_desc_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1045  	kunit_activate_static_stub(test, ext4_sb_getblk,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1046  				   orphan_test_sb_getblk_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1047  	kunit_activate_static_stub(test, ext4_free_inode,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1048  				   orphan_test_free_inode_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1049  	kunit_activate_static_stub(test, ext4_free_blocks,
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1050  				   orphan_test_free_blocks_stub);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1051  
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1052  	err = kunit_add_action_or_reset(test, orphan_test_cleanup_action, ctx);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1053  	KUNIT_ASSERT_EQ(test, err, 0);
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1054  	ctx->enable_real_evict = true;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1055  	return 0;
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1056  }
8a129f6ffb7e18 Theodore Ts'o 2026-11-06  1057  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
