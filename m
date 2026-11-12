Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527660;
	b=K6YSJuTPYWTJCuCNHU40BFDqxu4u3PIkRMoBkIAnHjVznWIfLEq8dUPtw2gX0eqk+3ii
	 QSKkUKYcURVghQ4EFVRgUmUQkngTgG4EQrgPwteuhIwtHYgX30kajvJKfWwefrxtAvDHP
	 0RMbt6sSB+cL9mopk4sQAS4UO1XDTePUYWQLcGcKd0VNFmcCipKkURAIiNoxN/XUHrHdE
	 MOgSs7c4MJq9sd3EvqbjdPRYT2XFzQcyQR2v+TjEOw1kr+0A219wcxGeDBWptM9PnrbzJ
	 ZqHrjbRsoO9uryC3OuHf39NxnRVQXwmhC+C4OaST+FMHiLbrCuUfmFcykbF1390+6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527660;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+YuKjB8I73mFw4vMzYjvGJVV/jlZl+DY4+hSEDAT3rw=;
	b=ADF3e66DkH2xJ0y7E314vDcQRBGvwfs4eV08KCqq+aWA7zSp7x4vnqelXTA82PuESvLI
	 iVq9y2BodHCKju0tJ7eKOadJfyDWHx3XnqSfGZpMa+EjOOOUmGEnlG7Ft6rQw9llkjZBf
	 5G/bZtQ88fphEveUcB5YrsFx3PyeG45+LdiYMDbpOShUUxtyjr/6GsPCih0/vsxxq/Ek+
	 ttt9CNrMDCFu0GqR8Ehpt4ZNKy8SWNdUp933U7j/mypzibhbwuz8EbU/ygappXIAhkxcK
	 Kv454qyh4i6rt8L8KixMUiitCuj44u2bdR1SFPbpHNtcQ9Av2p4y4Gjx1gA9m7zpUoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="e8dny/tD";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE85606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 23:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE85606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8dny/tD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794527658; x=1826063658;
  h=date:from:to:cc:subject:message-id;
  bh=MpdUjHaWX0XLbMvnROcjmdNcdPPrKn+JB3lwenQ7vcc=;
  b=e8dny/tDXUEd1eVoP6PF7QVAO1D9oRBPPzTj8f4HKcU+KQmJHZAt0FpA
   TDBMPfT01zBIk5iuTmF6pq+4NDdaXuT5D0e4mxnXDK1MXblFrw1csrDY4
   dwEklyfmWXZVsFhziKaFPrNHGDkcB3Bf87Xp4eoOz7+/YYV4dETnbvOJ7
   r71nB3kxm2KyX95/MiJuCl/FepX7j17WLrYAlLxyGNCI/62GgLNn/nDhc
   Z/LgT5OdiTvSobTThAXuHaz9UhpVuQ91ib8BsWLeubG0H/1fttXR8C+Ov
   v9pKjp4gpLNa0PwSnZmJEyVp3PLzeaMT4UELaFAGGDw/nmsTi2cWCJFqA
   A==;
X-CSE-ConnectionGUID: QHwFZI8GSa6Whh6/aZoszg==
X-CSE-MsgGUID: WbfGe8i+RVSP4YUIdt3Edw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3191408"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3191408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:54:18 -0800
X-CSE-ConnectionGUID: 2U3AzOC8QsmJgjJ9Nn8g9g==
X-CSE-MsgGUID: cOiw15WxTKaGQcFCDldKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9065348"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2026 15:54:17 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRecP-00000000129-3TLZ;
	Thu, 12 Nov 2026 23:54:13 +0000
Date: Fri, 13 Nov 2026 00:53:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 18/50] fs/ext4/sysfs-test.c:200
 sysfs_test_init() error: 'sb' dereferencing possible ERR_PTR()
Message-ID: <202611130041.1uHWqikL-lkp@intel.com>
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
commit: 82a5f38249f6cf9134c104490ee5a497ea502104 [18/50] ext4: add KUnit tests for fs/ext4/sysfs.c
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130041.1uHWqikL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611130041.1uHWqikL-lkp@intel.com/

smatch warnings:
fs/ext4/sysfs-test.c:200 sysfs_test_init() error: 'sb' dereferencing possible ERR_PTR()

vim +/sb +200 fs/ext4/sysfs-test.c

82a5f38249f6cf Theodore Ts'o 2026-11-11  148  
82a5f38249f6cf Theodore Ts'o 2026-11-11  149  KUNIT_DEFINE_ACTION_WRAPPER(sysfs_test_cleanup_action, sysfs_test_cleanup,
82a5f38249f6cf Theodore Ts'o 2026-11-11  150  			    struct sysfs_test_ctx *);
82a5f38249f6cf Theodore Ts'o 2026-11-11  151  
82a5f38249f6cf Theodore Ts'o 2026-11-11  152  static int sysfs_test_init(struct kunit *test)
82a5f38249f6cf Theodore Ts'o 2026-11-11  153  {
82a5f38249f6cf Theodore Ts'o 2026-11-11  154  	struct sysfs_test_ctx *ctx;
82a5f38249f6cf Theodore Ts'o 2026-11-11  155  	struct fs_context *fc;
82a5f38249f6cf Theodore Ts'o 2026-11-11  156  	struct super_block *sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  157  	struct ext4_sb_info *sbi;
82a5f38249f6cf Theodore Ts'o 2026-11-11  158  	int err;
82a5f38249f6cf Theodore Ts'o 2026-11-11  159  
82a5f38249f6cf Theodore Ts'o 2026-11-11  160  	ctx = kzalloc_obj(*ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  161  	KUNIT_ASSERT_NOT_NULL(test, ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  162  	test->priv = ctx;
82a5f38249f6cf Theodore Ts'o 2026-11-11  163  
82a5f38249f6cf Theodore Ts'o 2026-11-11  164  	ctx->bdev.bd_stats = alloc_percpu(struct disk_stats);
82a5f38249f6cf Theodore Ts'o 2026-11-11  165  	if (!ctx->bdev.bd_stats) {
82a5f38249f6cf Theodore Ts'o 2026-11-11  166  		kfree(ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  167  		KUNIT_FAIL_AND_ABORT(test, "failed to alloc bd_stats");
82a5f38249f6cf Theodore Ts'o 2026-11-11  168  	}
82a5f38249f6cf Theodore Ts'o 2026-11-11  169  
82a5f38249f6cf Theodore Ts'o 2026-11-11  170  	fc = fs_context_for_mount(&sysfs_test_fs_type, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  171  	if (IS_ERR(fc)) {
82a5f38249f6cf Theodore Ts'o 2026-11-11  172  		err = PTR_ERR(fc);
82a5f38249f6cf Theodore Ts'o 2026-11-11  173  		free_percpu(ctx->bdev.bd_stats);
82a5f38249f6cf Theodore Ts'o 2026-11-11  174  		kfree(ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  175  		KUNIT_ASSERT_EQ(test, err, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  176  	}
82a5f38249f6cf Theodore Ts'o 2026-11-11  177  	sb = sget_fc(fc, NULL, set_anon_super_fc);
82a5f38249f6cf Theodore Ts'o 2026-11-11  178  	put_fs_context(fc);
82a5f38249f6cf Theodore Ts'o 2026-11-11  179  	if (IS_ERR(sb)) {
82a5f38249f6cf Theodore Ts'o 2026-11-11  180  		err = PTR_ERR(sb);
82a5f38249f6cf Theodore Ts'o 2026-11-11  181  		free_percpu(ctx->bdev.bd_stats);
82a5f38249f6cf Theodore Ts'o 2026-11-11  182  		kfree(ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  183  		KUNIT_ASSERT_EQ(test, err, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  184  	}
82a5f38249f6cf Theodore Ts'o 2026-11-11  185  	ctx->sb = sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  186  	sbi = &ctx->sbi;
82a5f38249f6cf Theodore Ts'o 2026-11-11  187  
82a5f38249f6cf Theodore Ts'o 2026-11-11  188  	err = percpu_counter_init(&sbi->s_dirtyclusters_counter, 0, GFP_KERNEL);
82a5f38249f6cf Theodore Ts'o 2026-11-11  189  	if (err)
82a5f38249f6cf Theodore Ts'o 2026-11-11  190  		goto err_sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  191  	err = percpu_counter_init(&sbi->s_sra_exceeded_retry_limit, 0,
82a5f38249f6cf Theodore Ts'o 2026-11-11  192  				  GFP_KERNEL);
82a5f38249f6cf Theodore Ts'o 2026-11-11  193  	if (err) {
82a5f38249f6cf Theodore Ts'o 2026-11-11  194  		percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
82a5f38249f6cf Theodore Ts'o 2026-11-11  195  		goto err_sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  196  	}
82a5f38249f6cf Theodore Ts'o 2026-11-11  197  	ctx->counters_inited = true;
82a5f38249f6cf Theodore Ts'o 2026-11-11  198  
82a5f38249f6cf Theodore Ts'o 2026-11-11  199  	sbi->s_sb = sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11 @200  	sb->s_fs_info = sbi;
82a5f38249f6cf Theodore Ts'o 2026-11-11  201  	sb->s_op = &sysfs_test_sops;
82a5f38249f6cf Theodore Ts'o 2026-11-11  202  #ifdef CONFIG_FS_ENCRYPTION
82a5f38249f6cf Theodore Ts'o 2026-11-11  203  	sb->s_cop = &ext4_cryptops;
82a5f38249f6cf Theodore Ts'o 2026-11-11  204  #endif
82a5f38249f6cf Theodore Ts'o 2026-11-11  205  	sb->s_flags |= SB_ACTIVE;
82a5f38249f6cf Theodore Ts'o 2026-11-11  206  	sb->s_blocksize = SYSFS_TEST_BLK_SIZE;
82a5f38249f6cf Theodore Ts'o 2026-11-11  207  	sb->s_blocksize_bits = SYSFS_TEST_BLK_BITS;
82a5f38249f6cf Theodore Ts'o 2026-11-11  208  	strscpy(sb->s_id, "ext4_sysfs_kunit", sizeof(sb->s_id));
82a5f38249f6cf Theodore Ts'o 2026-11-11  209  
82a5f38249f6cf Theodore Ts'o 2026-11-11  210  	inode_init_once(&ctx->bd_inode);
82a5f38249f6cf Theodore Ts'o 2026-11-11  211  	ctx->bd_inode.i_sb = sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  212  	ctx->bd_inode.i_blkbits = SYSFS_TEST_BLK_BITS;
82a5f38249f6cf Theodore Ts'o 2026-11-11  213  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
82a5f38249f6cf Theodore Ts'o 2026-11-11  214  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
82a5f38249f6cf Theodore Ts'o 2026-11-11  215  	ctx->bdev_disk.part0 = &ctx->bdev;
82a5f38249f6cf Theodore Ts'o 2026-11-11  216  	ctx->bdev_disk.queue = &ctx->bdev_queue;
82a5f38249f6cf Theodore Ts'o 2026-11-11  217  	ctx->bdev.bd_disk = &ctx->bdev_disk;
82a5f38249f6cf Theodore Ts'o 2026-11-11  218  	ctx->bdev.bd_queue = &ctx->bdev_queue;
82a5f38249f6cf Theodore Ts'o 2026-11-11  219  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
82a5f38249f6cf Theodore Ts'o 2026-11-11  220  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
82a5f38249f6cf Theodore Ts'o 2026-11-11  221  	sb->s_bdev = &ctx->bdev;
82a5f38249f6cf Theodore Ts'o 2026-11-11  222  
82a5f38249f6cf Theodore Ts'o 2026-11-11  223  	inode_init_once(&ctx->buddy_inode);
82a5f38249f6cf Theodore Ts'o 2026-11-11  224  	ctx->buddy_inode.i_sb = sb;
82a5f38249f6cf Theodore Ts'o 2026-11-11  225  	sbi->s_buddy_cache = &ctx->buddy_inode;
82a5f38249f6cf Theodore Ts'o 2026-11-11  226  
82a5f38249f6cf Theodore Ts'o 2026-11-11  227  	bgl_lock_init(&ctx->bgl);
82a5f38249f6cf Theodore Ts'o 2026-11-11  228  	sbi->s_blockgroup_lock = &ctx->bgl;
82a5f38249f6cf Theodore Ts'o 2026-11-11  229  
82a5f38249f6cf Theodore Ts'o 2026-11-11  230  	sbi->s_es = &ctx->es;
82a5f38249f6cf Theodore Ts'o 2026-11-11  231  	ctx->es.s_magic = cpu_to_le16(EXT4_SUPER_MAGIC);
82a5f38249f6cf Theodore Ts'o 2026-11-11  232  	ext4_blocks_count_set(&ctx->es, SYSFS_TEST_TOTAL_BLKS);
82a5f38249f6cf Theodore Ts'o 2026-11-11  233  
82a5f38249f6cf Theodore Ts'o 2026-11-11  234  	ctx->sb_bh.b_data = (char *)&ctx->es;
82a5f38249f6cf Theodore Ts'o 2026-11-11  235  	ctx->sb_bh.b_size = sizeof(ctx->es);
82a5f38249f6cf Theodore Ts'o 2026-11-11  236  	ctx->sb_bh.b_bdev = &ctx->bdev;
82a5f38249f6cf Theodore Ts'o 2026-11-11  237  	atomic_set(&ctx->sb_bh.b_count, 1);
82a5f38249f6cf Theodore Ts'o 2026-11-11  238  	set_buffer_uptodate(&ctx->sb_bh);
82a5f38249f6cf Theodore Ts'o 2026-11-11  239  	sbi->s_sbh = &ctx->sb_bh;
82a5f38249f6cf Theodore Ts'o 2026-11-11  240  
82a5f38249f6cf Theodore Ts'o 2026-11-11  241  	sbi->s_cluster_bits = 2;
82a5f38249f6cf Theodore Ts'o 2026-11-11  242  	sbi->s_cluster_ratio = 4;
82a5f38249f6cf Theodore Ts'o 2026-11-11  243  	sbi->s_clusters_per_group = SYSFS_TEST_CLUSTERS_PER_GRP;
82a5f38249f6cf Theodore Ts'o 2026-11-11  244  	set_opt(sb, ERRORS_CONT);
82a5f38249f6cf Theodore Ts'o 2026-11-11  245  
82a5f38249f6cf Theodore Ts'o 2026-11-11  246  	mutex_init(&sbi->s_error_notify_mutex);
82a5f38249f6cf Theodore Ts'o 2026-11-11  247  	spin_lock_init(&sbi->s_error_lock);
82a5f38249f6cf Theodore Ts'o 2026-11-11  248  	spin_lock_init(&sbi->s_md_lock);
82a5f38249f6cf Theodore Ts'o 2026-11-11  249  	INIT_WORK(&sbi->s_sb_upd_work, sysfs_test_sb_upd_work);
82a5f38249f6cf Theodore Ts'o 2026-11-11  250  	timer_setup(&sbi->s_err_report, sysfs_test_err_timer, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  251  
82a5f38249f6cf Theodore Ts'o 2026-11-11  252  	ratelimit_state_init(&sbi->s_err_ratelimit_state,
82a5f38249f6cf Theodore Ts'o 2026-11-11  253  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  254  	ratelimit_state_init(&sbi->s_warning_ratelimit_state,
82a5f38249f6cf Theodore Ts'o 2026-11-11  255  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  256  	ratelimit_state_init(&sbi->s_msg_ratelimit_state,
82a5f38249f6cf Theodore Ts'o 2026-11-11  257  			     DEFAULT_RATELIMIT_INTERVAL, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  258  
82a5f38249f6cf Theodore Ts'o 2026-11-11  259  	up_write(&sb->s_umount);
82a5f38249f6cf Theodore Ts'o 2026-11-11  260  
82a5f38249f6cf Theodore Ts'o 2026-11-11  261  	err = kunit_add_action_or_reset(test, sysfs_test_cleanup_action, ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  262  	KUNIT_ASSERT_EQ(test, err, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  263  	return 0;
82a5f38249f6cf Theodore Ts'o 2026-11-11  264  
82a5f38249f6cf Theodore Ts'o 2026-11-11  265  err_sb:
82a5f38249f6cf Theodore Ts'o 2026-11-11  266  	deactivate_locked_super(sb);
82a5f38249f6cf Theodore Ts'o 2026-11-11  267  	rcu_barrier();
82a5f38249f6cf Theodore Ts'o 2026-11-11  268  	free_percpu(ctx->bdev.bd_stats);
82a5f38249f6cf Theodore Ts'o 2026-11-11  269  	kfree(ctx);
82a5f38249f6cf Theodore Ts'o 2026-11-11  270  	KUNIT_ASSERT_EQ(test, err, 0);
82a5f38249f6cf Theodore Ts'o 2026-11-11  271  	return err;
82a5f38249f6cf Theodore Ts'o 2026-11-11  272  }
82a5f38249f6cf Theodore Ts'o 2026-11-11  273  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
