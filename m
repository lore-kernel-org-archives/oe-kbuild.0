Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10F314D1F
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776122626; cv=none; b=UjNiWVJyI3konsJfNpq8zwK0KJKWfpAoUm0e8OP3q5DIHosU6+/XSlGF+UffAjf6sZq/2XKilNGfXR8T1Zel/ZlqgCBArBzCGP1d33YD++rqr0C/vmL9BYtBbOzUyUdIksil/ToXLSjn+C5cJNupfGn0Vgwkwh8gXm2LKGEfnAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776122626; c=relaxed/simple;
	bh=vC/yqH/a0sL7/nGTJ1Qp3h2frJQ/DS3m//mdwqGurWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IrXS95hlqsiWlpSsg2VpZXCT7nFDinnsqQLJuuON4HggU8kugqk4xslq8EZi1seF9s9Fkk2hTkMjrsM4E11ENFtIQ6cWPFTVeZGNN0qs+IstgYwL0QnPpIAOW4IKrNQ9RKtr8F9tu+bd8LLoYGvN7WpvVIqa4zGLhCVwq5mSeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdYJUvAu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdYJUvAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776122623; x=1807658623;
  h=date:from:to:cc:subject:message-id;
  bh=vC/yqH/a0sL7/nGTJ1Qp3h2frJQ/DS3m//mdwqGurWE=;
  b=KdYJUvAuKPDMaY6i8y1I0r7FoCsOjXApm+BqiexjcBZJb2+7KZXSmEQp
   7yGPX/braMPBoDtY+fJHC8Ac+lFCAoQkoFZfHLFtnkCWzOXvhuODrM390
   teTYxdB8/lvxL7Cf0WXWfS2XH/9ct+vfavAnPcSJCtxYYVQyVWSTghZxC
   7hGnPJtio+UtkTuLW/QZ5ZC+iL/f2vshHmlRMBqGGpMRdSWL9Qoj98iUB
   x5oN1aYdCTe4Lw5x0QGAfVXvTDVcqDvIbixJEMArL9OLHvTRwqTiV20QZ
   FZKjvq22x7vrjgOeYxqQGJ4YGalaYSpE1d5FRIVLvhC5hJT7iwRr2rnby
   g==;
X-CSE-ConnectionGUID: /H9bDMRnR4mwsqKNmG3M3Q==
X-CSE-MsgGUID: OTnLaiG/TpuZUspvVxKzgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88147366"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="88147366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:23:43 -0700
X-CSE-ConnectionGUID: RFlyr3/OTi69U4jD+so9GQ==
X-CSE-MsgGUID: b5Ms6uAwS2q3c8Q50s/QNw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2026 16:23:41 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQd1-000000000xB-1RiS;
	Mon, 13 Apr 2026 23:23:39 +0000
Date: Tue, 14 Apr 2026 07:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 631/799]
 fs/bcachefs/init/fs.c:1132 bch2_fs_init() warn: impossible condition
 '(c->opts.block_size > ((1) << 16)) => (0-u16max > 65536)'
Message-ID: <202604140714.hUBTD6ll-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: a9a31f8ddf9b4d3b06b3cb8599e09a5066507213 [631/799] bcachefs: bch2_fs_init()
:::::: branch date: 5 months ago
:::::: commit date: 6 months ago
config: hexagon-randconfig-r072-20260414 (https://download.01.org/0day-ci/archive/20260414/202604140714.hUBTD6ll-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604140714.hUBTD6ll-lkp@intel.com/

smatch warnings:
fs/bcachefs/init/fs.c:1132 bch2_fs_init() warn: impossible condition '(c->opts.block_size > ((1) << 16)) => (0-u16max > 65536)'

vim +1132 fs/bcachefs/init/fs.c

ab69169ea6ba22 fs/bcachefs/super.c   Kent Overstreet 2025-08-02  1030  
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1031  static int bch2_fs_init(struct bch_fs *c, struct bch_sb *sb,
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1032  			struct bch_opts *opts, bch_sb_handles *sbs)
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1033  {
ecf37a4a80ec02 fs/bcachefs/super.c   Kent Overstreet 2019-02-14  1034  	unsigned i, iter_size;
72ff55535c3ac4 fs/bcachefs/super.c   Kent Overstreet 2025-07-14  1035  	CLASS(printbuf, name)();
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1036  
a349868b5e2503 fs/bcachefs/super.c   Kent Overstreet 2025-04-28  1037  	c->stdio = (void *)(unsigned long) opts->stdio;
2b41226d7f4b3b fs/bcachefs/super.c   Kent Overstreet 2023-12-04  1038  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1039  	__module_get(THIS_MODULE);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1040  
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1041  	closure_init(&c->cl, NULL);
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1042  
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1043  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1044  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1045  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1046  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1047  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e fs/bcachefs/super.c   Daniel Hill     2022-03-15  1048  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 fs/bcachefs/super.c   Kent Overstreet 2020-10-15  1049  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1050  	c->minor		= -1;
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1051  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1052  
1ada160618d66b fs/bcachefs/super.c   Kent Overstreet 2020-06-15  1053  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1054  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1055  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1056  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1057  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1058  
63508b756443cb fs/bcachefs/super.c   Kent Overstreet 2023-12-06  1059  	refcount_set(&c->ro_ref, 1);
63508b756443cb fs/bcachefs/super.c   Kent Overstreet 2023-12-06  1060  	init_waitqueue_head(&c->ro_ref_wait);
63508b756443cb fs/bcachefs/super.c   Kent Overstreet 2023-12-06  1061  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1062  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1063  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1064  
b092dadd55fb24 fs/bcachefs/super.c   Kent Overstreet 2018-11-04  1065  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 fs/bcachefs/super.c   Kent Overstreet 2018-11-04  1066  	bch2_fs_allocator_foreground_init(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1067  	bch2_fs_btree_cache_init_early(&c->btree_cache);
a17e985be9831b fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1068  	bch2_fs_btree_gc_init_early(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1069  	bch2_fs_btree_interior_update_init_early(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1070  	bch2_fs_btree_iter_init_early(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1071  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
a17e985be9831b fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1072  	bch2_fs_btree_write_buffer_init_early(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1073  	bch2_fs_copygc_init(c);
84c72755b9aab3 fs/bcachefs/super.c   Kent Overstreet 2022-04-09  1074  	bch2_fs_ec_init_early(c);
a17e985be9831b fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1075  	bch2_fs_journal_init_early(&c->journal);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1076  	bch2_fs_journal_keys_init(c);
b9fa375bab2786 fs/bcachefs/super.c   Kent Overstreet 2023-03-11  1077  	bch2_fs_move_init(c);
a17e985be9831b fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1078  	bch2_fs_nocow_locking_init_early(c);
31813dcf379d7f fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1079  	bch2_fs_quota_init(c);
001c1d146f3862 fs/bcachefs/super.c   Kent Overstreet 2025-05-09  1080  	bch2_fs_recovery_passes_init(c);
f5d26fa31ed2e2 fs/bcachefs/super.c   Kent Overstreet 2023-10-25  1081  	bch2_fs_sb_errors_init_early(c);
15dbd0d8146356 fs/bcachefs/super.c   Kent Overstreet 2025-05-01  1082  	bch2_fs_snapshots_init_early(c);
a17e985be9831b fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1083  	bch2_fs_subvolumes_init_early(c);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1084  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1085  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1086  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1087  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 fs/bcachefs/super.c   Kent Overstreet 2021-03-16  1088  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 fs/bcachefs/super.c   Kent Overstreet 2023-09-29  1089  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1090  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1091  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1092  
5b593ee172bd53 fs/bcachefs/super.c   Kent Overstreet 2021-01-26  1093  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 fs/bcachefs/super.c   Kent Overstreet 2020-03-25  1094  
f5d26fa31ed2e2 fs/bcachefs/super.c   Kent Overstreet 2023-10-25  1095  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 fs/bcachefs/super.c   Kent Overstreet 2023-10-25  1096  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1097  
5e82a9a1f4f82e fs/bcachefs/super.c   Kent Overstreet 2019-02-10  1098  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e fs/bcachefs/super.c   Kent Overstreet 2019-02-10  1099  
ef1b20924b0f58 fs/bcachefs/super.c   Kent Overstreet 2021-05-18  1100  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 fs/bcachefs/super.c   Kent Overstreet 2021-05-18  1101  
9edbcc72f6987b fs/bcachefs/super.c   Kent Overstreet 2023-03-15  1102  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b fs/bcachefs/super.c   Kent Overstreet 2023-03-15  1103  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b fs/bcachefs/super.c   Kent Overstreet 2023-03-15  1104  
991ba021129088 fs/bcachefs/super.c   Kent Overstreet 2021-12-10  1105  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 fs/bcachefs/super.c   Kent Overstreet 2021-12-10  1106  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1107  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1108  
fca1223ccfac2a fs/bcachefs/super.c   Kent Overstreet 2020-12-03  1109  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a fs/bcachefs/super.c   Kent Overstreet 2020-12-03  1110  
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1111  	try(percpu_init_rwsem(&c->mark_lock));
73e6ab95640a7d fs/bcachefs/super.c   Kent Overstreet 2018-12-01  1112  
72ff55535c3ac4 fs/bcachefs/super.c   Kent Overstreet 2025-07-14  1113  	scoped_guard(mutex, &c->sb_lock)
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1114  		try(bch2_sb_to_fs(c, sb));
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1115  
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1116  	/* Compat: */
73bd774d28d2b2 fs/bcachefs/super.c   Kent Overstreet 2023-07-06  1117  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1118  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1119  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1120  
73bd774d28d2b2 fs/bcachefs/super.c   Kent Overstreet 2023-07-06  1121  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1122  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1123  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a fs/bcachefs/super.c   Kent Overstreet 2021-12-04  1124  
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1125  	c->opts = bch2_opts_default;
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1126  	try(bch2_opts_from_sb(&c->opts, sb));
8244f3209b5b49 fs/bcachefs/super.c   Kent Overstreet 2021-12-14  1127  
a349868b5e2503 fs/bcachefs/super.c   Kent Overstreet 2025-04-28  1128  	bch2_opts_apply(&c->opts, *opts);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1129  
91d10435564f9f fs/bcachefs/super.c   Kent Overstreet 2025-09-06  1130  #ifdef __KERNEL__
9caea9208fc3fb fs/bcachefs/super.c   Kent Overstreet 2025-05-23  1131  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9caea9208fc3fb fs/bcachefs/super.c   Kent Overstreet 2025-05-23 @1132  	    c->opts.block_size > PAGE_SIZE) {
9caea9208fc3fb fs/bcachefs/super.c   Kent Overstreet 2025-05-23  1133  		bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1134  		return -EINVAL;
9caea9208fc3fb fs/bcachefs/super.c   Kent Overstreet 2025-05-23  1135  	}
91d10435564f9f fs/bcachefs/super.c   Kent Overstreet 2025-09-06  1136  #endif
9caea9208fc3fb fs/bcachefs/super.c   Kent Overstreet 2025-05-23  1137  
7c8f6f980dc85f fs/bcachefs/super.c   Kent Overstreet 2022-01-12  1138  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f fs/bcachefs/super.c   Kent Overstreet 2022-01-12  1139  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f fs/bcachefs/super.c   Kent Overstreet 2022-01-12  1140  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 fs/bcachefs/super.c   Kent Overstreet 2023-08-27  1141  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f fs/bcachefs/super.c   Kent Overstreet 2022-01-12  1142  
8244f3209b5b49 fs/bcachefs/super.c   Kent Overstreet 2021-12-14  1143  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1144  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1145  
7be9ab637fb9c5 fs/bcachefs/super.c   Chris Webb      2021-11-04  1146  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 fs/bcachefs/super.c   Kent Overstreet 2021-11-05  1147  		bch_err(c, "fs_alloc fault injected");
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1148  		return -EFAULT;
7be9ab637fb9c5 fs/bcachefs/super.c   Chris Webb      2021-11-04  1149  	}
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1150  
c02e5b57283ad6 fs/bcachefs/super.c   Kent Overstreet 2025-04-02  1151  	if (c->sb.multi_device)
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1152  		pr_uuid(&name, c->sb.user_uuid.b);
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1153  	else
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1154  		prt_bdevname(&name, sbs->data[0].bdev);
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1155  
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1156  	try(name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0);
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1157  
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1158  	strscpy(c->name, name.buf, sizeof(c->name));
58c36e6710d3b3 fs/bcachefs/super.c   Kent Overstreet 2025-04-03  1159  
ae2f17d5ad02bc fs/bcachefs/super.c   Kent Overstreet 2019-12-14  1160  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1161  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc fs/bcachefs/super.c   Kent Overstreet 2019-12-14  1162  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1163  
d4d71b58e5139a fs/bcachefs/super.c   Kent Overstreet 2025-04-05  1164  	if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
6b83aee8a41b12 fs/bcachefs/super.c   Kent Overstreet 2024-01-22  1165  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
c9b1d94a2196fc fs/bcachefs/super.c   Kent Overstreet 2025-04-18  1166  	    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
c9b1d94a2196fc fs/bcachefs/super.c   Kent Overstreet 2025-04-18  1167  				bch2_writes_disabled) ||
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1168  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1169  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1170  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1171  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1172  			BIOSET_NEED_BVECS) ||
5663a4152138fd fs/bcachefs/super.c   Kent Overstreet 2018-11-27  1173  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
8bb8d683a4013f fs/bcachefs/super.c   Kent Overstreet 2023-12-27  1174  	    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
5e82a9a1f4f82e fs/bcachefs/super.c   Kent Overstreet 2019-02-10  1175  	    !(c->online_reserved = alloc_percpu(u64)) ||
cb6fc943b650c4 fs/bcachefs/super.c   Kent Overstreet 2024-02-01  1176  	    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1177  				       c->opts.btree_node_size))
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1178  		return bch_err_throw(c, ENOMEM_fs_other_alloc);
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1179  
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1180  	try(bch2_fs_async_obj_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1181  	try(bch2_blacklist_table_initialize(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1182  	try(bch2_fs_btree_cache_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1183  	try(bch2_fs_btree_iter_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1184  	try(bch2_fs_btree_key_cache_init(&c->btree_key_cache));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1185  	try(bch2_fs_buckets_waiting_for_journal_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1186  	try(bch2_io_clock_init(&c->io_clock[READ]));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1187  	try(bch2_io_clock_init(&c->io_clock[WRITE]));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1188  	try(bch2_fs_compress_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1189  	try(bch2_fs_counters_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1190  	try(bch2_fs_ec_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1191  	try(bch2_fs_encryption_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1192  	try(bch2_fs_fsio_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1193  	try(bch2_fs_fs_io_direct_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1194  	try(bch2_fs_io_read_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1195  	try(bch2_fs_rebalance_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1196  	try(bch2_fs_sb_errors_init(c));
a9a31f8ddf9b4d fs/bcachefs/init/fs.c Kent Overstreet 2025-10-24  1197  	try(bch2_fs_vfs_init(c));
1c6fdbd8f2465d fs/bcachefs/super.c   Kent Overstreet 2017-03-16  1198  
1cddad0fcbccc7 fs/bcachefs/super.c   Kent Overstreet 2025-06-15  1199  

:::::: The code at line 1132 was first introduced by commit
:::::: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
