Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35472882B7
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641204; cv=none; b=TcdPwob609a1pr3gcgah4ypZgqeKxkWcMdkayVeE3Pj6XkvcL8qtHbHHYxdjphNnj13sMbV72jIVdiAWJVXz2+a+0jivfZbm8SStPWuVTWWXXId6/pPRzJmI9BpuSWn2IYTvQ+opmqVBl9Q5EDiIqi1gNf11jkHjGxhIK7tFaMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641204; c=relaxed/simple;
	bh=unW1r9R3ByE3iA3+NRqzKJTHASfv7XwwgBPesNLfEDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/ezGQSzliSECoV/heGDNBGTVopKKwxRa/aKELLaMWz6c/5TiAKixN48QiBh6UpOguR/HMhKLpiQlnB/rbUGubpRRgyM+CGX8YiU4O2P9OKWQlvRFVoeR+eInAzz6U4gima1exxXYC5Dt6i64fEcjiyCozO4gwAeReg+H1Av1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eId4KMfH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eId4KMfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748641202; x=1780177202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unW1r9R3ByE3iA3+NRqzKJTHASfv7XwwgBPesNLfEDM=;
  b=eId4KMfHolKTYJbJsXWhzWFvb/bWTyNfj3bxex4qpVUwHOa28lb3FXqF
   hva2NlvRD7guGj+19rJSg/TSi+xbEuO4/glCOW+Ea73Bb7LOyuudrb6DU
   //s325zo2ZEhpnI9iITYRlJaGyBqN/1Q3pROQ0LInAUzoBfegm6N9GWY8
   gDdy9ATrxTvl/CPyL+eA7oGsKHn5qLOmgDA4JVzMB3Fa2GbOzh6tN6pzQ
   QfgiNvO42WgOzIftLwsNmDqfH5S5CsHem0GJ+0BY+pUWasoFrAa1Og7MB
   bTxgzv3AwzVzeMXG7QhP+uzfYOU5f78L4R+9lIuMrNdnpUv25q74ZaeCp
   w==;
X-CSE-ConnectionGUID: X/tOBTOPTymkHkKbivgi8g==
X-CSE-MsgGUID: A4S3KpsrRueWzrQu02O3qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50794272"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50794272"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:40:02 -0700
X-CSE-ConnectionGUID: r8x3f86NS9m+RcCe5pAAeQ==
X-CSE-MsgGUID: zrVuafdiRCi0kKvghGzMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144954231"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 14:40:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7SI-000XzI-1U;
	Fri, 30 May 2025 21:39:58 +0000
Date: Sat, 31 May 2025 05:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/super.c:954 bch2_fs_alloc() warn: impossible condition
 '(c->opts.block_size > ((1) << 16)) => (0-u16max > 65536)'
Message-ID: <202505310513.Bm7CbDdU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE
date:   7 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
config: powerpc64-randconfig-r072-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310513.Bm7CbDdU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505310513.Bm7CbDdU-lkp@intel.com/

smatch warnings:
fs/bcachefs/super.c:954 bch2_fs_alloc() warn: impossible condition '(c->opts.block_size > ((1) << 16)) => (0-u16max > 65536)'

vim +954 fs/bcachefs/super.c

d4d71b58e5139a Kent Overstreet 2025-04-05   837  
a349868b5e2503 Kent Overstreet 2025-04-28   838  static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts *opts,
58c36e6710d3b3 Kent Overstreet 2025-04-03   839  				    bch_sb_handles *sbs)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   840  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16   841  	struct bch_fs *c;
401ec4db630802 Kent Overstreet 2023-02-03   842  	struct printbuf name = PRINTBUF;
ecf37a4a80ec02 Kent Overstreet 2019-02-14   843  	unsigned i, iter_size;
7be9ab637fb9c5 Chris Webb      2021-11-04   844  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   845  
cb6fc943b650c4 Kent Overstreet 2024-02-01   846  	c = kvmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
7be9ab637fb9c5 Chris Webb      2021-11-04   847  	if (!c) {
65d48e35250fe4 Kent Overstreet 2023-03-14   848  		c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   849  		goto out;
7be9ab637fb9c5 Chris Webb      2021-11-04   850  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16   851  
a349868b5e2503 Kent Overstreet 2025-04-28   852  	c->stdio = (void *)(unsigned long) opts->stdio;
2b41226d7f4b3b Kent Overstreet 2023-12-04   853  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   854  	__module_get(THIS_MODULE);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   855  
505b7a4c2844d8 Kent Overstreet 2020-10-15   856  	closure_init(&c->cl, NULL);
505b7a4c2844d8 Kent Overstreet 2020-10-15   857  
505b7a4c2844d8 Kent Overstreet 2020-10-15   858  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 Kent Overstreet 2020-10-15   859  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   860  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   861  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   862  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e Daniel Hill     2022-03-15   863  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   864  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   865  	c->minor		= -1;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   866  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   867  
1ada160618d66b Kent Overstreet 2020-06-15   868  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   869  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   870  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   871  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   872  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   873  
63508b756443cb Kent Overstreet 2023-12-06   874  	refcount_set(&c->ro_ref, 1);
63508b756443cb Kent Overstreet 2023-12-06   875  	init_waitqueue_head(&c->ro_ref_wait);
63508b756443cb Kent Overstreet 2023-12-06   876  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   877  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   878  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   879  
b092dadd55fb24 Kent Overstreet 2018-11-04   880  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 Kent Overstreet 2018-11-04   881  	bch2_fs_allocator_foreground_init(c);
31813dcf379d7f Kent Overstreet 2025-04-05   882  	bch2_fs_btree_cache_init_early(&c->btree_cache);
a17e985be9831b Kent Overstreet 2025-04-05   883  	bch2_fs_btree_gc_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   884  	bch2_fs_btree_interior_update_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   885  	bch2_fs_btree_iter_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   886  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
a17e985be9831b Kent Overstreet 2025-04-05   887  	bch2_fs_btree_write_buffer_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   888  	bch2_fs_copygc_init(c);
84c72755b9aab3 Kent Overstreet 2022-04-09   889  	bch2_fs_ec_init_early(c);
a17e985be9831b Kent Overstreet 2025-04-05   890  	bch2_fs_journal_init_early(&c->journal);
31813dcf379d7f Kent Overstreet 2025-04-05   891  	bch2_fs_journal_keys_init(c);
b9fa375bab2786 Kent Overstreet 2023-03-11   892  	bch2_fs_move_init(c);
a17e985be9831b Kent Overstreet 2025-04-05   893  	bch2_fs_nocow_locking_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   894  	bch2_fs_quota_init(c);
001c1d146f3862 Kent Overstreet 2025-05-09   895  	bch2_fs_recovery_passes_init(c);
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   896  	bch2_fs_sb_errors_init_early(c);
15dbd0d8146356 Kent Overstreet 2025-05-01   897  	bch2_fs_snapshots_init_early(c);
a17e985be9831b Kent Overstreet 2025-04-05   898  	bch2_fs_subvolumes_init_early(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   899  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   900  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   901  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   902  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 Kent Overstreet 2021-03-16   903  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 Kent Overstreet 2023-09-29   904  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   905  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   906  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   907  
5b593ee172bd53 Kent Overstreet 2021-01-26   908  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 Kent Overstreet 2020-03-25   909  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   910  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   911  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   912  
5e82a9a1f4f82e Kent Overstreet 2019-02-10   913  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e Kent Overstreet 2019-02-10   914  
ef1b20924b0f58 Kent Overstreet 2021-05-18   915  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 Kent Overstreet 2021-05-18   916  
9edbcc72f6987b Kent Overstreet 2023-03-15   917  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b Kent Overstreet 2023-03-15   918  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b Kent Overstreet 2023-03-15   919  
991ba021129088 Kent Overstreet 2021-12-10   920  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 Kent Overstreet 2021-12-10   921  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d Kent Overstreet 2017-03-16   922  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d Kent Overstreet 2017-03-16   923  
fca1223ccfac2a Kent Overstreet 2020-12-03   924  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a Kent Overstreet 2020-12-03   925  
e2b605601ad569 Kent Overstreet 2021-11-05   926  	ret = percpu_init_rwsem(&c->mark_lock);
e2b605601ad569 Kent Overstreet 2021-11-05   927  	if (ret)
73e6ab95640a7d Kent Overstreet 2018-12-01   928  		goto err;
73e6ab95640a7d Kent Overstreet 2018-12-01   929  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   930  	mutex_lock(&c->sb_lock);
e2b605601ad569 Kent Overstreet 2021-11-05   931  	ret = bch2_sb_to_fs(c, sb);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   932  	mutex_unlock(&c->sb_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   933  
e2b605601ad569 Kent Overstreet 2021-11-05   934  	if (ret)
e2b605601ad569 Kent Overstreet 2021-11-05   935  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   936  
2430e72f42778a Kent Overstreet 2021-12-04   937  	/* Compat: */
73bd774d28d2b2 Kent Overstreet 2023-07-06   938  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet 2021-12-04   939  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a Kent Overstreet 2021-12-04   940  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a Kent Overstreet 2021-12-04   941  
73bd774d28d2b2 Kent Overstreet 2023-07-06   942  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet 2021-12-04   943  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a Kent Overstreet 2021-12-04   944  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a Kent Overstreet 2021-12-04   945  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   946  	c->opts = bch2_opts_default;
8244f3209b5b49 Kent Overstreet 2021-12-14   947  	ret = bch2_opts_from_sb(&c->opts, sb);
8244f3209b5b49 Kent Overstreet 2021-12-14   948  	if (ret)
8244f3209b5b49 Kent Overstreet 2021-12-14   949  		goto err;
8244f3209b5b49 Kent Overstreet 2021-12-14   950  
a349868b5e2503 Kent Overstreet 2025-04-28   951  	bch2_opts_apply(&c->opts, *opts);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   952  
9caea9208fc3fb Kent Overstreet 2025-05-23   953  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9caea9208fc3fb Kent Overstreet 2025-05-23  @954  	    c->opts.block_size > PAGE_SIZE) {
9caea9208fc3fb Kent Overstreet 2025-05-23   955  		bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
9caea9208fc3fb Kent Overstreet 2025-05-23   956  		ret = -EINVAL;
9caea9208fc3fb Kent Overstreet 2025-05-23   957  		goto err;
9caea9208fc3fb Kent Overstreet 2025-05-23   958  	}
9caea9208fc3fb Kent Overstreet 2025-05-23   959  
7c8f6f980dc85f Kent Overstreet 2022-01-12   960  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f Kent Overstreet 2022-01-12   961  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f Kent Overstreet 2022-01-12   962  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 Kent Overstreet 2023-08-27   963  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f Kent Overstreet 2022-01-12   964  
8244f3209b5b49 Kent Overstreet 2021-12-14   965  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d Kent Overstreet 2017-03-16   966  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   967  
7be9ab637fb9c5 Chris Webb      2021-11-04   968  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 Kent Overstreet 2021-11-05   969  		bch_err(c, "fs_alloc fault injected");
e2b605601ad569 Kent Overstreet 2021-11-05   970  		ret = -EFAULT;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   971  		goto err;
7be9ab637fb9c5 Chris Webb      2021-11-04   972  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16   973  
c02e5b57283ad6 Kent Overstreet 2025-04-02   974  	if (c->sb.multi_device)
58c36e6710d3b3 Kent Overstreet 2025-04-03   975  		pr_uuid(&name, c->sb.user_uuid.b);
58c36e6710d3b3 Kent Overstreet 2025-04-03   976  	else
58c36e6710d3b3 Kent Overstreet 2025-04-03   977  		prt_bdevname(&name, sbs->data[0].bdev);
58c36e6710d3b3 Kent Overstreet 2025-04-03   978  
58c36e6710d3b3 Kent Overstreet 2025-04-03   979  	ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
58c36e6710d3b3 Kent Overstreet 2025-04-03   980  	if (ret)
58c36e6710d3b3 Kent Overstreet 2025-04-03   981  		goto err;
58c36e6710d3b3 Kent Overstreet 2025-04-03   982  
58c36e6710d3b3 Kent Overstreet 2025-04-03   983  	strscpy(c->name, name.buf, sizeof(c->name));
58c36e6710d3b3 Kent Overstreet 2025-04-03   984  	printbuf_exit(&name);
58c36e6710d3b3 Kent Overstreet 2025-04-03   985  
ae2f17d5ad02bc Kent Overstreet 2019-12-14   986  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d Kent Overstreet 2017-03-16   987  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc Kent Overstreet 2019-12-14   988  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   989  
d4d71b58e5139a Kent Overstreet 2025-04-05   990  	if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
6b83aee8a41b12 Kent Overstreet 2024-01-22   991  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
c9b1d94a2196fc Kent Overstreet 2025-04-18   992  	    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
c9b1d94a2196fc Kent Overstreet 2025-04-18   993  				bch2_writes_disabled) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16   994  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16   995  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d Kent Overstreet 2017-03-16   996  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d Kent Overstreet 2017-03-16   997  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d Kent Overstreet 2017-03-16   998  			BIOSET_NEED_BVECS) ||
5663a4152138fd Kent Overstreet 2018-11-27   999  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
8bb8d683a4013f Kent Overstreet 2023-12-27  1000  	    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
5e82a9a1f4f82e Kent Overstreet 2019-02-10  1001  	    !(c->online_reserved = alloc_percpu(u64)) ||
cb6fc943b650c4 Kent Overstreet 2024-02-01  1002  	    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
ec4edd7b9d2038 Kent Overstreet 2024-01-16  1003  				       c->opts.btree_node_size) ||
df448ca355ce84 Kent Overstreet 2024-12-01  1004  	    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048)) {
65d48e35250fe4 Kent Overstreet 2023-03-14  1005  		ret = -BCH_ERR_ENOMEM_fs_other_alloc;
7be9ab637fb9c5 Chris Webb      2021-11-04  1006  		goto err;
7be9ab637fb9c5 Chris Webb      2021-11-04  1007  	}
7be9ab637fb9c5 Chris Webb      2021-11-04  1008  
31813dcf379d7f Kent Overstreet 2025-04-05  1009  	ret =
0499a82b18b5dd Kent Overstreet 2025-04-21  1010  	    bch2_fs_async_obj_init(c) ?:
e2b605601ad569 Kent Overstreet 2021-11-05  1011  	    bch2_fs_btree_cache_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1012  	    bch2_fs_btree_iter_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1013  	    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1014  	    bch2_fs_buckets_waiting_for_journal_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1015  	    bch2_io_clock_init(&c->io_clock[READ]) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1016  	    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
e2b605601ad569 Kent Overstreet 2021-11-05  1017  	    bch2_fs_compress_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1018  	    bch2_fs_counters_init(c) ?:
e2b605601ad569 Kent Overstreet 2021-11-05  1019  	    bch2_fs_ec_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1020  	    bch2_fs_encryption_init(c) ?:
dbbfca9f41e869 Kent Overstreet 2023-08-03  1021  	    bch2_fs_fsio_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1022  	    bch2_fs_fs_io_direct_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1023  	    bch2_fs_io_read_init(c) ?:
96fc7d8adb7881 Kent Overstreet 2025-05-05  1024  	    bch2_fs_rebalance_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1025  	    bch2_fs_sb_errors_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1026  	    bch2_fs_vfs_init(c);
7be9ab637fb9c5 Chris Webb      2021-11-04  1027  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1028  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1029  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
