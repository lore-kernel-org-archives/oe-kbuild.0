Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541109;
	b=wKNZpiQrWKeuYUONylaDk3TcOLQPTakLs4ixKibIP8pu7cgGMiygdENoZjS1Nn2CrBHf
	 GuXWHjMb9kwk2Ms7PEEcUCndhbbpr2e3pT9IZFbj+IxzI7BzUegtUgM2qjX03Loy3Ks/b
	 PwZrjZzS7OIzqkRF+/rRk6Szl3XNz5N5bbuNJf7Uof+gV8MBHIpCj+KFzlmllYOIst3K5
	 Rv/2L3pQvB5tBB/H39ngCZ9fkJ252AyDeasCr9QQlySCHvTgIXhg6NnI8tQxFPDI1ED7T
	 Ki6tFM7b7Jaxy6ebK36tDcMUWNt3kZYTX4pS41my8aBRa1oEsyQOpRnpVfOm4m9BDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541109;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nuVUNOzerFqkkGm2mKdPyDNLhm8QmgTpKltS0XGiOFs=;
	b=lbppP/WRcKQtpg01oyZsp3aO5gqmcNcXAlK2Hqo8IH6Y+2SEe1jq9l9TC4iDph5JS2ML
	 B+1ZBZFqg8g/JHpTiFjieA/XNgAumeepoG1fS+m/i59gHHM9wRh3UqASn83aoeESpboRv
	 qGD+HkQLiPDu0V/OfH+zyBzZnF7WotXveA6OjiwVq1hSFJ7rXkchs3Uw6r0OWy32+FX2w
	 ibB6Wo3o9G0hYoURV29OLAUmlEyi+17pknFbn6EmFjqoY5gFHBDHAdKX3kfSSLfRS8rjo
	 sMQLmsrXhdy/HRG3pNfONYZT8N5kgAu6q2+Bbwc4E+hAEQaRkwJM/NSt0HVSXQ+DKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LGflrwzS;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E26606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 03:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79E26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LGflrwzS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794541109; x=1826077109;
  h=date:from:to:cc:subject:message-id;
  bh=AKYh5+6PNXl/RmCvzQ9HnVdOpfHpEJeU9j696sV5XbQ=;
  b=LGflrwzS4dlC7+EccgXvEvKVoO3BQggJIbhl1EB8lxlpztGLoYw+LSxt
   Dr6bKsqkKULn5aX33LYlQXRMHIxMEjEySdWrnAvhDa2MPGvoW0z/PUxHS
   2YKxJjvvmq2RSA5zVYEG+HmkWOSzjV7vUAju/uNj1cxMKwSTketLlDdOY
   R3XryWuw30knD/F817K6ZIxJyxGVhvtAMHMntqIfCsRdMsaAllz1uFW6H
   07Z9gMdLD/KtLYN1y4eFrfXPFgFpP+IZMUPj+7lwpW2xiRJHQ2Ygixm+G
   hFJGAVpC5eqjutHSNCjuB6FvHQY9OiBSTd5f10sxEXiYD4Wyof3RC2Bqt
   g==;
X-CSE-ConnectionGUID: E7479x02QK2+fqsXCWst2Q==
X-CSE-MsgGUID: U9wZ85MMQZmoGOnJUrFgfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3202236"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3202236"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 19:38:28 -0800
X-CSE-ConnectionGUID: 4YnWl2waROe5OsY8AQrYCA==
X-CSE-MsgGUID: U1tak4JeQZ2797gGa73FUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8977040"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2026 19:38:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRi7M-0000000015t-49iv;
	Fri, 13 Nov 2026 03:38:24 +0000
Date: Fri, 13 Nov 2026 04:38:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 20/50] fs/ext4/resize-test.c:740
 resize_test_init() error: dereferencing freed memory 'sbh' (line 738)
Message-ID: <202611130427.OFf1j9Zw-lkp@intel.com>
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
commit: cafbd5ed7e5d5024b861114d03d2980d6c6fffe2 [20/50] ext4: add KUnit tests for fs/ext4/resize.c
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130427.OFf1j9Zw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611130427.OFf1j9Zw-lkp@intel.com/

smatch warnings:
fs/ext4/resize-test.c:740 resize_test_init() error: dereferencing freed memory 'sbh' (line 738)

vim +/sbh +740 fs/ext4/resize-test.c

cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  687  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  688  	strscpy(sb->s_id, "ext4_resize_kunit", sizeof(sb->s_id));
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  689  	inode_init_once(&ctx->bd_inode);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  690  	ctx->bd_inode.i_sb = sb;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  691  	ctx->bd_inode.i_blkbits = RESIZE_TEST_BLK_BITS;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  692  	ctx->bd_inode.i_mapping = &ctx->bd_inode.i_data;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  693  	ctx->bd_inode.i_data.host = &ctx->bd_inode;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  694  	ctx->bdev_disk.part0 = &ctx->bdev;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  695  	ctx->bdev_disk.queue = &ctx->bdev_queue;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  696  	ctx->bdev.bd_disk = &ctx->bdev_disk;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  697  	ctx->bdev.bd_queue = &ctx->bdev_queue;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  698  	ctx->bdev.bd_mapping = &ctx->bd_inode.i_data;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  699  	bdev_clear_flag(&ctx->bdev, BD_READ_ONLY);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  700  	sb->s_bdev = &ctx->bdev;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  701  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  702  	sbi->s_sb = sb;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  703  	sbi->s_blockgroup_lock = &ctx->bgl;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  704  	bgl_lock_init(&ctx->bgl);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  705  	INIT_WORK(&sbi->s_sb_upd_work, resize_test_sb_upd_work);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  706  	timer_setup(&sbi->s_err_report, resize_test_err_timer, 0);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  707  	spin_lock_init(&sbi->s_error_lock);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  708  	spin_lock_init(&sbi->s_md_lock);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  709  	spin_lock_init(&sbi->s_bdev_wb_lock);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  710  	spin_lock_init(&sbi->s_es_lock);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  711  	INIT_LIST_HEAD(&sbi->s_es_list);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  712  	mutex_init(&sbi->s_fc_lock);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  713  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_MAIN]);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  714  	INIT_LIST_HEAD(&sbi->s_fc_q[FC_Q_STAGING]);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  715  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_MAIN]);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  716  	INIT_LIST_HEAD(&sbi->s_fc_dentry_q[FC_Q_STAGING]);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  717  	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  718  	ratelimit_state_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  719  	ratelimit_state_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  720  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  721  	sbi->s_blocks_per_group = RESIZE_TEST_BLOCKS_PER_GRP;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  722  	sbi->s_clusters_per_group = RESIZE_TEST_BLOCKS_PER_GRP;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  723  	sbi->s_cluster_ratio = 1;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  724  	sbi->s_cluster_bits = 0;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  725  	sbi->s_inodes_per_group = RESIZE_TEST_INODES_PER_GRP;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  726  	sbi->s_inode_size = RESIZE_TEST_INODE_SIZE;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  727  	sbi->s_inodes_per_block = RESIZE_TEST_BLK_SIZE / RESIZE_TEST_INODE_SIZE;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  728  	sbi->s_itb_per_group = RESIZE_TEST_ITB_PER_GRP;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  729  	sbi->s_desc_size = RESIZE_TEST_DESC_SIZE;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  730  	sbi->s_desc_per_block = RESIZE_TEST_DESC_PER_BLK;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  731  	sbi->s_desc_per_block_bits = RESIZE_TEST_DESC_PER_BLK_BITS;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  732  	sbi->s_first_ino = 11;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  733  	sbi->s_mount_state = EXT4_VALID_FS;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  734  	set_opt(sb, ERRORS_CONT);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  735  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  736  	sbh = resize_get_or_create_bh(ctx, RESIZE_TEST_FIRST_DATA_BLK);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  737  	KUNIT_ASSERT_NOT_NULL(test, sbh);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11 @738  	brelse(sbh);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  739  	sbi->s_sbh = sbh;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11 @740  	ctx->es = (struct ext4_super_block *)sbh->b_data;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  741  	sbi->s_es = ctx->es;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  742  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  743  	resize_init_mock_bh(&ctx->iloc_bh, ctx->bh_folio, ctx->iloc_buf,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  744  			    RESIZE_TEST_BLK_SIZE, 99);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  745  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  746  	active_resize_test = test;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  747  	kunit_activate_static_stub(test, ext4_sb_getblk, resize_sb_getblk_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  748  	kunit_activate_static_stub(test, ext4_sb_bread, resize_sb_bread_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  749  	kunit_activate_static_stub(test, ext4_resize_issue_zeroout,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  750  				   resize_zeroout_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  751  	kunit_activate_static_stub(test, __ext4_iget, resize_iget_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  752  	kunit_activate_static_stub(test, ext4_get_inode_loc,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  753  				   resize_get_inode_loc_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  754  	kunit_activate_static_stub(test, ext4_mark_iloc_dirty,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  755  				   resize_mark_iloc_dirty_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  756  	kunit_activate_static_stub(test, __ext4_mark_inode_dirty,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  757  				   resize_mark_inode_dirty_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  758  	kunit_activate_static_stub(test, ext4_free_blocks,
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  759  				   resize_free_blocks_stub);
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  760  
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  761  	return 0;
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  762  }
cafbd5ed7e5d50 Theodore Ts'o 2026-11-11  763  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
