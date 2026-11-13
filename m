Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534385;
	b=Uq7r9qrpg+KcbY0+EicoBXPA6QGhtJBkD1LC4Di55VF/uA28ZVLsmjsR6FTvxRk9Fr0N
	 wK9fh7gBZ9QI4UUIrJmZuqjfmCWglHrd6LehpRaqE9Qq55gkwxZDG67JBZdsFJ0g2cTJY
	 ya/UDIbEcQ1DD0xDJ1eIiSiIWYccUsrUqBOtOCflzt+b1UkX3dsDGlutRaTxsA6cvWASL
	 K5VjQmud9VQJJnpTJ9yzdRb0I9UGK8gEoxWklP5MTaDqfCE3s9gc/RRfGVosHw/F9PfbD
	 RvnpkKM+jGqe6AbIgpvhDMeQn/rbjQ7Pcj3AZoOz1vOnepY/q5sJG7+M6NZ5+uS2EsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534385;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OfNEvYNs8zmFqCFFoa6EyJfzwLrMJgObRnRh/VmskPg=;
	b=y0pGp93fgQ13IFM5Maf4orE+2lw3iTMvDaRMo+VnEI0ra7bNxf4MTw5RiwF7G7mkft48
	 i/+lObhhtLzZqhO4OK3XFmxYR6T3peHUy+e9+3n2Lft5yOVZ3hCWR1Vucg3KQGFxZ7bB2
	 fB/f0zG0P1CszFbDOSPLVEhc68Ld5zp1uuo1nfcZx740NSEnLw744TFa1bjP1s5zRH/ig
	 +nYfWm6f66AkFboThBWWPq3IwApRn2qu85MbfVvuTVTC31co1ZDHrGSuNwwNZG/lk0l3A
	 UsRPu3hY/1RR5Vdkj9Rv9qv2YOG8AWEl+8Pv1MuZ1wITi9wamlGr1yOyNY7WpNBOAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lCqfx6TH;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339F606A327
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 01:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C339F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lCqfx6TH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794534385; x=1826070385;
  h=date:from:to:cc:subject:message-id;
  bh=/08ErdcxSjsYMCG2N7wyUoDHE8kC+wWb5U6mgDnXzcM=;
  b=lCqfx6THeJeyQIsDOgDLm+k306ZCNoC0rNXJ4Bj2zf5IqmcOkgP0AW/S
   k8z0Js6UjoSTEqC3jjAX7zuIFpT5hOj79I5dH/UCWS7pJU3QBhVKe23Wd
   hR/MRW4WZjm1Y2Kf8ps5tor2l3+X+J0e5XHpZDmGSZaBsH+EGZAsw1dUB
   y8u6q34iX1RObxiwyqapeGMSUrFbxj5x5Krqy+wqOIgRBqlSPg7qooEbw
   RFF2Z71zIov9wN/FWKcIG/6CQA1NzWGmexOsUu1lWlsspP1jqY6PiEfNw
   FK81xhGgZk9UNjH2THZ8XbZoQAEAqxkYuRWIFQhfI0C2mcp0PHsPO8HHz
   Q==;
X-CSE-ConnectionGUID: qC8/MzdrQgOMJJTGKI6DtA==
X-CSE-MsgGUID: XSICjsFgQzCoZ5WdlV+glQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3361734"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3361734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 17:46:24 -0800
X-CSE-ConnectionGUID: p2i3uLfxRTWVdE92tsJ3jw==
X-CSE-MsgGUID: 3qV3lvkFQ+SFe5o8qfov+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8694047"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Nov 2026 17:46:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRgMt-0000000014f-3ags;
	Fri, 13 Nov 2026 01:46:19 +0000
Date: Fri, 13 Nov 2026 02:45:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 19/50] fs/ext4/ioctl-test.c:370
 ioctl_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611130228.aW3mg17U-lkp@intel.com>
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
commit: 442c6693bdb8e0fefce2062ba29b004778e04e10 [19/50] ext4: add KUnit tests for fs/ext4/ioctl.c
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130228.aW3mg17U-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611130228.aW3mg17U-lkp@intel.com/

smatch warnings:
fs/ext4/ioctl-test.c:370 ioctl_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +370 fs/ext4/ioctl-test.c

442c6693bdb8e0 Theodore Ts'o 2026-11-11  275  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  276  KUNIT_DEFINE_ACTION_WRAPPER(ioctl_test_cleanup_action, ioctl_test_cleanup,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  277  			    struct ioctl_test_ctx *);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  278  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  279  static int ioctl_test_init(struct kunit *test)
442c6693bdb8e0 Theodore Ts'o 2026-11-11  280  {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  281  	struct ioctl_test_ctx *ctx;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  282  	struct fs_context *fc;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  283  	struct super_block *sb;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  284  	struct ext4_sb_info *sbi;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  285  	struct inode *root_inode;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  286  	ext4_group_t g;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  287  	int err;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  288  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  289  	ctx = kzalloc_obj(*ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  290  	KUNIT_ASSERT_NOT_NULL(test, ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  291  	test->priv = ctx;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  292  	active_ioctl_test = test;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  293  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  294  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  295  	if (!ctx->bdev.bd_stats) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  296  		kfree(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  297  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
442c6693bdb8e0 Theodore Ts'o 2026-11-11  298  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  299  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  300  	ctx->bh_folio = folio_alloc(GFP_KERNEL, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  301  	if (!ctx->bh_folio) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  302  		free_percpu(ctx->bdev.bd_stats);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  303  		kfree(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  304  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bh_folio");
442c6693bdb8e0 Theodore Ts'o 2026-11-11  305  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  306  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  307  	fc = fs_context_for_mount(&ioctl_test_fs_type, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  308  	if (IS_ERR(fc)) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  309  		err = PTR_ERR(fc);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  310  		folio_put(ctx->bh_folio);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  311  		free_percpu(ctx->bdev.bd_stats);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  312  		kfree(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  313  		KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  314  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  315  	sb = sget_fc(fc, NULL, set_anon_super_fc);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  316  	put_fs_context(fc);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  317  	if (IS_ERR(sb)) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  318  		err = PTR_ERR(sb);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  319  		folio_put(ctx->bh_folio);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  320  		free_percpu(ctx->bdev.bd_stats);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  321  		kfree(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  322  		KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  323  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  324  	ctx->sb = sb;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  325  	sbi = &ctx->sbi;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  326  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  327  	err = percpu_counter_init(&sbi->s_freeclusters_counter, 0, GFP_KERNEL);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  328  	if (err) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  329  		up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  330  		ioctl_test_cleanup(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  331  		KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  332  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  333  	err = percpu_counter_init(&sbi->s_dirtyclusters_counter, 0, GFP_KERNEL);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  334  	if (err) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  335  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  336  		up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  337  		ioctl_test_cleanup(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  338  		KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  339  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  340  	err = percpu_counter_init(&sbi->s_freeinodes_counter, 0, GFP_KERNEL);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  341  	if (err) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  342  		percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  343  		percpu_counter_destroy(&sbi->s_freeclusters_counter);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  344  		up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  345  		ioctl_test_cleanup(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  346  		KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  347  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  348  	ctx->counters_inited = true;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  349  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  350  	INIT_WORK(&sbi->s_sb_upd_work, ioctl_test_sb_upd_work);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  351  	timer_setup(&sbi->s_err_report, ioctl_test_err_timer, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  352  	spin_lock_init(&sbi->s_error_lock);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  353  	spin_lock_init(&sbi->s_md_lock);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  354  	spin_lock_init(&sbi->s_bdev_wb_lock);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  355  	spin_lock_init(&sbi->s_es_lock);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  356  	INIT_LIST_HEAD(&sbi->s_es_list);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  357  	mutex_init(&sbi->s_fc_lock);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  358  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  359  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  360  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  361  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  362  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  363  			     DEFAULT_RATELIMIT_INTERVAL, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  364  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  365  			     DEFAULT_RATELIMIT_INTERVAL, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  366  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  367  			     DEFAULT_RATELIMIT_INTERVAL, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  368  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  369  	sbi->s_sb = sb;
442c6693bdb8e0 Theodore Ts'o 2026-11-11 @370  	sb->s_fs_info = sbi;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  371  	sb->s_op = &ioctl_test_sops;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  372  #ifdef CONFIG_FS_ENCRYPTION
442c6693bdb8e0 Theodore Ts'o 2026-11-11  373  	sb->s_cop = &ext4_cryptops;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  374  #endif
442c6693bdb8e0 Theodore Ts'o 2026-11-11  375  	sb->s_flags |= SB_ACTIVE;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  376  	sb->s_blocksize = IOCTL_TEST_BLK_SIZE;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  377  	sb->s_blocksize_bits = IOCTL_TEST_BLK_BITS;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  378  	sb->s_maxbytes = MAX_LFS_FILESIZE;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  379  	sb->s_time_gran = 1;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  380  	sb->s_xattr = ext4_xattr_handlers;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  381  	strscpy(sb->s_id, "ext4_ioctl_kunit", sizeof(sb->s_id));
442c6693bdb8e0 Theodore Ts'o 2026-11-11  382  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  383  	inode_init_once(&ctx->bd_inode);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  384  	ctx->bd_inode.i_sb = sb;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  385  	ctx->bd_inode.i_blkbits = IOCTL_TEST_BLK_BITS;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  386  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  387  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  388  	ctx->bdev_queue.limits.logical_block_size = 512;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  389  	ctx->bdev_queue.limits.dma_alignment = 511;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  390  	ctx->bdev_disk.part0 = &ctx->bdev;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  391  	ctx->bdev_disk.queue = &ctx->bdev_queue;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  392  	ctx->bdev.bd_disk = &ctx->bdev_disk;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  393  	ctx->bdev.bd_queue = &ctx->bdev_queue;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  394  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  395  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  396  	sb->s_bdev = &ctx->bdev;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  397  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  398  	bgl_lock_init(&ctx->bgl);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  399  	sbi->s_blockgroup_lock = &ctx->bgl;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  400  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  401  	ctx->es = (struct ext4_super_block *)ctx->primary_sb_buf;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  402  	ctx->es->s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  403  	ctx->es->s_rev_level = cpu_to_le32(EXT4_DYNAMIC_REV);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  404  	ctx->es->s_first_ino = cpu_to_le32(IOCTL_TEST_FIRST_INO);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  405  	ctx->es->s_inode_size = cpu_to_le16(IOCTL_TEST_INODE_SIZE);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  406  	ctx->es->s_want_extra_isize = cpu_to_le16(IOCTL_TEST_EXTRA_ISIZE);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  407  	ctx->es->s_min_extra_isize = cpu_to_le16(IOCTL_TEST_EXTRA_ISIZE);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  408  	ctx->es->s_first_data_block = cpu_to_le32(IOCTL_TEST_FIRST_DATA_BLK);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  409  	ctx->es->s_blocks_per_group = cpu_to_le32(IOCTL_TEST_BLOCKS_PER_GRP);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  410  	ctx->es->s_clusters_per_group = cpu_to_le32(IOCTL_TEST_BLOCKS_PER_GRP);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  411  	ctx->es->s_inodes_per_group = cpu_to_le32(IOCTL_TEST_INODES_PER_GRP);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  412  	ctx->es->s_inodes_count = cpu_to_le32(IOCTL_TEST_TOTAL_INODES);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  413  	ext4_blocks_count_set(ctx->es, IOCTL_TEST_TOTAL_BLKS);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  414  	ctx->es->s_checksum_type = EXT4_CRC32C_CHKSUM;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  415  	ctx->es->s_feature_incompat = cpu_to_le32(EXT4_FEATURE_INCOMPAT_EXTENTS |
442c6693bdb8e0 Theodore Ts'o 2026-11-11  416  						  EXT4_FEATURE_INCOMPAT_64BIT);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  417  	ctx->es->s_feature_ro_compat =
442c6693bdb8e0 Theodore Ts'o 2026-11-11  418  		cpu_to_le32(EXT4_FEATURE_RO_COMPAT_SPARSE_SUPER |
442c6693bdb8e0 Theodore Ts'o 2026-11-11  419  			    EXT4_FEATURE_RO_COMPAT_METADATA_CSUM |
442c6693bdb8e0 Theodore Ts'o 2026-11-11  420  			    EXT4_FEATURE_RO_COMPAT_EXTRA_ISIZE);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  421  	generate_random_uuid(ctx->es->s_uuid);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  422  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  423  	ioctl_init_mock_bh(&ctx->sb_bh, ctx->bh_folio, ctx->primary_sb_buf,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  424  			   IOCTL_TEST_BLK_SIZE, IOCTL_TEST_FIRST_DATA_BLK);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  425  	for (g = 0; g < IOCTL_TEST_NGROUPS; g++) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  426  		ext4_fsblk_t blk = IOCTL_TEST_FIRST_DATA_BLK +
442c6693bdb8e0 Theodore Ts'o 2026-11-11  427  				   (ext4_fsblk_t)g * IOCTL_TEST_BLOCKS_PER_GRP;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  428  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  429  		ioctl_init_mock_bh(&ctx->backup_bhs[g], ctx->bh_folio,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  430  				   ctx->backup_sb_bufs[g], IOCTL_TEST_BLK_SIZE,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  431  				   blk);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  432  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  433  	ioctl_init_mock_bh(&ctx->iloc_bh, ctx->bh_folio, ctx->iloc_buf,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  434  			   IOCTL_TEST_BLK_SIZE, 20);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  435  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  436  	sbi->s_es = ctx->es;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  437  	sbi->s_sbh = &ctx->sb_bh;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  438  	sbi->s_blocks_per_group = IOCTL_TEST_BLOCKS_PER_GRP;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  439  	sbi->s_clusters_per_group = IOCTL_TEST_BLOCKS_PER_GRP;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  440  	sbi->s_cluster_ratio = 1;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  441  	sbi->s_cluster_bits = 0;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  442  	sbi->s_inodes_per_group = IOCTL_TEST_INODES_PER_GRP;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  443  	sbi->s_groups_count = IOCTL_TEST_NGROUPS;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  444  	sbi->s_inode_size = IOCTL_TEST_INODE_SIZE;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  445  	sbi->s_first_ino = IOCTL_TEST_FIRST_INO;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  446  	sbi->s_want_extra_isize = IOCTL_TEST_EXTRA_ISIZE;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  447  	sbi->s_desc_size = EXT4_MIN_DESC_SIZE_64BIT;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  448  	sbi->s_csum_seed = ext4_chksum(~0, ctx->es->s_uuid,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  449  				       sizeof(ctx->es->s_uuid));
442c6693bdb8e0 Theodore Ts'o 2026-11-11  450  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  451  	ioctl_sync_backups_from_primary(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  452  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  453  	root_inode = new_inode(sb);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  454  	if (!root_inode) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  455  		up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  456  		ioctl_test_cleanup(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  457  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc root_inode");
442c6693bdb8e0 Theodore Ts'o 2026-11-11  458  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  459  	root_inode->i_ino = EXT4_ROOT_INO;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  460  	root_inode->i_mode = S_IFDIR | 0755;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  461  	root_inode->i_flags |= S_NOQUOTA;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  462  	root_inode->i_op = &simple_dir_inode_operations;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  463  	set_nlink(root_inode, 2);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  464  	sb->s_root = d_make_root(root_inode);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  465  	if (!sb->s_root) {
442c6693bdb8e0 Theodore Ts'o 2026-11-11  466  		up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  467  		ioctl_test_cleanup(ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  468  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc s_root");
442c6693bdb8e0 Theodore Ts'o 2026-11-11  469  	}
442c6693bdb8e0 Theodore Ts'o 2026-11-11  470  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  471  	up_write(&sb->s_umount);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  472  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  473  	err = kunit_add_action_or_reset(test, ioctl_test_cleanup_action, ctx);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  474  	KUNIT_ASSERT_EQ(test, err, 0);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  475  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  476  	kunit_activate_static_stub(test, ext4_sb_bread, ioctl_sb_bread_stub);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  477  	kunit_activate_static_stub(test, ext4_ioctl_sync_bh,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  478  				   ioctl_sync_bh_stub);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  479  	kunit_activate_static_stub(test, ext4_get_inode_loc,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  480  				   ioctl_get_inode_loc_stub);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  481  	kunit_activate_static_stub(test, ext4_mark_iloc_dirty,
442c6693bdb8e0 Theodore Ts'o 2026-11-11  482  				   ioctl_mark_iloc_dirty_stub);
442c6693bdb8e0 Theodore Ts'o 2026-11-11  483  
442c6693bdb8e0 Theodore Ts'o 2026-11-11  484  	return 0;
442c6693bdb8e0 Theodore Ts'o 2026-11-11  485  }
442c6693bdb8e0 Theodore Ts'o 2026-11-11  486  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
