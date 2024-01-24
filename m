Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27B17C9B
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jan 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706088067; cv=none; b=HFSo+VvX6nIftF+FsFI9fZgSorNggx20OSZKUymb1xqlA1vkGs5wvqDzNUlpN0LH5poZKpGs11/gR76XimVV+S8jPI1LIfGUgM0d8GupsRdfkVVjHdvGnXsaYoTApLf4TObNxnYBmrtfs5Dby65ib5kXNsHJldh+YykUf2iayhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706088067; c=relaxed/simple;
	bh=w+85COxbLRVWayfRCPkpykQhZGPODRG/T4dj+6UJTOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dl9QWe7HrRNpGP7yPjDS4nEyJtCmP3y+04VEXq4/RdHhsUi+K59zny29qCrtVTzRnFrs/yAdTahyu8uEjqzrKGnO7MiMOimA0Xx5ksb8DHUQVmtDSPmMWVwdbwsL56y6ChZPhbOOl9g8DFhZ+FeTgeTRHhb5Qa0uwwJFfr4CpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjBUCnsU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjBUCnsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706088065; x=1737624065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+85COxbLRVWayfRCPkpykQhZGPODRG/T4dj+6UJTOg=;
  b=HjBUCnsUJ4ctKkuVdClH93UiWWpjZ9K7ywnQOmR4wVVDmm+S9oCtFkvl
   weu5FkP0a1QeYf743pCz8JbXp8tqTaqnOQL5z6oAfgL2CQrhcF7cvriwg
   0mqVjbq1BdTRTHmimirB5MqHHZ1eTuWPJdJgcv2Tl8IHPrMQ29XcKFH0O
   8ge917p8ag6d7Ww6Bx1s034ev9vnxsGm/lnRVhWwcFd3/lL6lV2qEJXH4
   NIbSjkgYxajaADPagRnswcKuosvzceSAoMr0Bhppl4mzsZvUzRhkaMG+J
   Ip44JYVnmmQ4hy9VHuhabU4hG4E7unCbtNvRytmfWQWjOZrk0R7VahkC4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="688103"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="688103"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 01:21:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28037245"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2024 01:20:59 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSZRH-00080v-2x;
	Wed, 24 Jan 2024 09:20:55 +0000
Date: Wed, 24 Jan 2024 17:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:bcachefs-testing 12/13] fs/bcachefs/super.c:871:4-14:
 duplicated argument to & or |
Message-ID: <202401241723.Y8UkD1Zo-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3fb49df9801da33528e58900709c53774f724b97
commit: 11f005c179296431788ec57e51caabf39865740f [12/13] bcachefs: worqueues should be WQ_HIGHPRI
:::::: branch date: 26 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-051-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241723.Y8UkD1Zo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401241723.Y8UkD1Zo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/super.c:871:4-14: duplicated argument to & or |

vim +871 fs/bcachefs/super.c

1c6fdbd8f2465d Kent Overstreet     2017-03-16  710  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  711  static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts opts)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  712  {
1c6fdbd8f2465d Kent Overstreet     2017-03-16  713  	struct bch_fs *c;
401ec4db630802 Kent Overstreet     2023-02-03  714  	struct printbuf name = PRINTBUF;
ecf37a4a80ec02 Kent Overstreet     2019-02-14  715  	unsigned i, iter_size;
7be9ab637fb9c5 Chris Webb          2021-11-04  716  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  717  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  718  	c = kvpmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
7be9ab637fb9c5 Chris Webb          2021-11-04  719  	if (!c) {
65d48e35250fe4 Kent Overstreet     2023-03-14  720  		c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  721  		goto out;
7be9ab637fb9c5 Chris Webb          2021-11-04  722  	}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  723  
96f37eabe7a5cb Kent Overstreet     2023-12-31  724  	c->stdio = (void *)(unsigned long) opts.stdio;
2b41226d7f4b3b Kent Overstreet     2023-12-04  725  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  726  	__module_get(THIS_MODULE);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  727  
505b7a4c2844d8 Kent Overstreet     2020-10-15  728  	closure_init(&c->cl, NULL);
505b7a4c2844d8 Kent Overstreet     2020-10-15  729  
505b7a4c2844d8 Kent Overstreet     2020-10-15  730  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 Kent Overstreet     2020-10-15  731  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 Kent Overstreet     2020-10-15  732  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 Kent Overstreet     2020-10-15  733  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 Kent Overstreet     2020-10-15  734  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e Daniel Hill         2022-03-15  735  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 Kent Overstreet     2020-10-15  736  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  737  	c->minor		= -1;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  738  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  739  
1ada160618d66b Kent Overstreet     2020-06-15  740  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  741  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  742  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  743  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  744  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  745  
63508b756443cb Kent Overstreet     2023-12-06  746  	refcount_set(&c->ro_ref, 1);
63508b756443cb Kent Overstreet     2023-12-06  747  	init_waitqueue_head(&c->ro_ref_wait);
267b801fda10b7 Kent Overstreet     2023-12-04  748  	sema_init(&c->online_fsck_mutex, 1);
63508b756443cb Kent Overstreet     2023-12-06  749  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  750  	init_rwsem(&c->gc_lock);
c45c866761671d Kent Overstreet     2021-12-24  751  	mutex_init(&c->gc_gens_lock);
8a443d3ea1327f Kent Overstreet     2023-11-17  752  	atomic_set(&c->journal_keys.ref, 1);
8a443d3ea1327f Kent Overstreet     2023-11-17  753  	c->journal_keys.initial_ref_held = true;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  754  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  755  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  756  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  757  
e6d1161530bcd6 Kent Overstreet     2020-07-11  758  	bch2_fs_copygc_init(c);
2ca88e5ad9b296 Kent Overstreet     2019-03-07  759  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
50a8a732d2db64 Thomas Bertschinger 2023-12-14  760  	bch2_fs_btree_iter_init_early(c);
65db60490a36cb Kent Overstreet     2023-06-28  761  	bch2_fs_btree_interior_update_init_early(c);
b092dadd55fb24 Kent Overstreet     2018-11-04  762  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 Kent Overstreet     2018-11-04  763  	bch2_fs_allocator_foreground_init(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  764  	bch2_fs_rebalance_init(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  765  	bch2_fs_quota_init(c);
84c72755b9aab3 Kent Overstreet     2022-04-09  766  	bch2_fs_ec_init_early(c);
b9fa375bab2786 Kent Overstreet     2023-03-11  767  	bch2_fs_move_init(c);
f5d26fa31ed2e2 Kent Overstreet     2023-10-25  768  	bch2_fs_sb_errors_init_early(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  769  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  770  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  771  
4d8100daa9bb6c Kent Overstreet     2019-03-15  772  	mutex_init(&c->usage_scratch_lock);
4d8100daa9bb6c Kent Overstreet     2019-03-15  773  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  774  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 Kent Overstreet     2021-03-16  775  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 Kent Overstreet     2023-09-29  776  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  777  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  778  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  779  
9b6e2f1e7036d6 Kent Overstreet     2022-01-04  780  	INIT_WORK(&c->journal_seq_blacklist_gc_work,
9b6e2f1e7036d6 Kent Overstreet     2022-01-04  781  		  bch2_blacklist_entries_gc);
9b6e2f1e7036d6 Kent Overstreet     2022-01-04  782  
5b593ee172bd53 Kent Overstreet     2021-01-26  783  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 Kent Overstreet     2020-03-25  784  
f5d26fa31ed2e2 Kent Overstreet     2023-10-25  785  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 Kent Overstreet     2023-10-25  786  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  787  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  788  	seqcount_init(&c->gc_pos_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  789  
5e82a9a1f4f82e Kent Overstreet     2019-02-10  790  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e Kent Overstreet     2019-02-10  791  
ef1b20924b0f58 Kent Overstreet     2021-05-18  792  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 Kent Overstreet     2021-05-18  793  
9edbcc72f6987b Kent Overstreet     2023-03-15  794  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b Kent Overstreet     2023-03-15  795  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b Kent Overstreet     2023-03-15  796  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  797  	c->copy_gc_enabled		= 1;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  798  	c->rebalance.enabled		= 1;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  799  	c->promote_whole_extents	= true;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  800  
991ba021129088 Kent Overstreet     2021-12-10  801  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 Kent Overstreet     2021-12-10  802  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d Kent Overstreet     2017-03-16  803  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d Kent Overstreet     2017-03-16  804  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  805  	bch2_fs_btree_cache_init_early(&c->btree_cache);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  806  
fca1223ccfac2a Kent Overstreet     2020-12-03  807  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a Kent Overstreet     2020-12-03  808  
e2b605601ad569 Kent Overstreet     2021-11-05  809  	ret = percpu_init_rwsem(&c->mark_lock);
e2b605601ad569 Kent Overstreet     2021-11-05  810  	if (ret)
73e6ab95640a7d Kent Overstreet     2018-12-01  811  		goto err;
73e6ab95640a7d Kent Overstreet     2018-12-01  812  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  813  	mutex_lock(&c->sb_lock);
e2b605601ad569 Kent Overstreet     2021-11-05  814  	ret = bch2_sb_to_fs(c, sb);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  815  	mutex_unlock(&c->sb_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  816  
e2b605601ad569 Kent Overstreet     2021-11-05  817  	if (ret)
e2b605601ad569 Kent Overstreet     2021-11-05  818  		goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  819  
401ec4db630802 Kent Overstreet     2023-02-03  820  	pr_uuid(&name, c->sb.user_uuid.b);
3e3e02e6bce627 Kent Overstreet     2022-10-19  821  	strscpy(c->name, name.buf, sizeof(c->name));
401ec4db630802 Kent Overstreet     2023-02-03  822  	printbuf_exit(&name);
401ec4db630802 Kent Overstreet     2023-02-03  823  
65d48e35250fe4 Kent Overstreet     2023-03-14  824  	ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
401ec4db630802 Kent Overstreet     2023-02-03  825  	if (ret)
401ec4db630802 Kent Overstreet     2023-02-03  826  		goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  827  
2430e72f42778a Kent Overstreet     2021-12-04  828  	/* Compat: */
73bd774d28d2b2 Kent Overstreet     2023-07-06  829  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet     2021-12-04  830  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a Kent Overstreet     2021-12-04  831  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a Kent Overstreet     2021-12-04  832  
73bd774d28d2b2 Kent Overstreet     2023-07-06  833  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet     2021-12-04  834  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a Kent Overstreet     2021-12-04  835  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a Kent Overstreet     2021-12-04  836  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  837  	c->opts = bch2_opts_default;
8244f3209b5b49 Kent Overstreet     2021-12-14  838  	ret = bch2_opts_from_sb(&c->opts, sb);
8244f3209b5b49 Kent Overstreet     2021-12-14  839  	if (ret)
8244f3209b5b49 Kent Overstreet     2021-12-14  840  		goto err;
8244f3209b5b49 Kent Overstreet     2021-12-14  841  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  842  	bch2_opts_apply(&c->opts, opts);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  843  
7c8f6f980dc85f Kent Overstreet     2022-01-12  844  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f Kent Overstreet     2022-01-12  845  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f Kent Overstreet     2022-01-12  846  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 Kent Overstreet     2023-08-27  847  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f Kent Overstreet     2022-01-12  848  
8244f3209b5b49 Kent Overstreet     2021-12-14  849  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d Kent Overstreet     2017-03-16  850  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  851  
7be9ab637fb9c5 Chris Webb          2021-11-04  852  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 Kent Overstreet     2021-11-05  853  		bch_err(c, "fs_alloc fault injected");
e2b605601ad569 Kent Overstreet     2021-11-05  854  		ret = -EFAULT;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  855  		goto err;
7be9ab637fb9c5 Chris Webb          2021-11-04  856  	}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  857  
ae2f17d5ad02bc Kent Overstreet     2019-12-14  858  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d Kent Overstreet     2017-03-16  859  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc Kent Overstreet     2019-12-14  860  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  861  
b5e8a6992fb119 Kent Overstreet     2020-11-02  862  	c->inode_shard_bits = ilog2(roundup_pow_of_two(num_possible_cpus()));
b5e8a6992fb119 Kent Overstreet     2020-11-02  863  
731bdd2eff4180 Kent Overstreet     2021-05-22  864  	if (!(c->btree_update_wq = alloc_workqueue("bcachefs",
11f005c1792964 Kent Overstreet     2024-01-22  865  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_UNBOUND|WQ_MEM_RECLAIM, 512)) ||
9f1833cadda7bb Kent Overstreet     2021-07-10  866  	    !(c->btree_io_complete_wq = alloc_workqueue("bcachefs_btree_io",
11f005c1792964 Kent Overstreet     2024-01-22  867  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 1)) ||
2f33ece9b47741 Kent Overstreet     2020-11-02  868  	    !(c->copygc_wq = alloc_workqueue("bcachefs_copygc",
11f005c1792964 Kent Overstreet     2024-01-22  869  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM|WQ_CPU_INTENSIVE, 1)) ||
731bdd2eff4180 Kent Overstreet     2021-05-22  870  	    !(c->io_complete_wq = alloc_workqueue("bcachefs_io",
11f005c1792964 Kent Overstreet     2024-01-22 @871  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_HIGHPRI|WQ_MEM_RECLAIM, 512)) ||
8bff9875a695ce Brian Foster        2023-03-23  872  	    !(c->write_ref_wq = alloc_workqueue("bcachefs_write_ref",
8bff9875a695ce Brian Foster        2023-03-23  873  				WQ_FREEZABLE, 0)) ||
d94189ad568f6c Kent Overstreet     2023-02-09  874  #ifndef BCH_WRITE_REF_DEBUG
134915f3d38d83 Kent Overstreet     2019-03-21  875  	    percpu_ref_init(&c->writes, bch2_writes_disabled,
134915f3d38d83 Kent Overstreet     2019-03-21  876  			    PERCPU_REF_INIT_DEAD, GFP_KERNEL) ||
d94189ad568f6c Kent Overstreet     2023-02-09  877  #endif
1c6fdbd8f2465d Kent Overstreet     2017-03-16  878  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d Kent Overstreet     2017-03-16  879  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d Kent Overstreet     2017-03-16  880  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d Kent Overstreet     2017-03-16  881  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d Kent Overstreet     2017-03-16  882  			BIOSET_NEED_BVECS) ||
5663a4152138fd Kent Overstreet     2018-11-27  883  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
5e82a9a1f4f82e Kent Overstreet     2019-02-10  884  	    !(c->online_reserved = alloc_percpu(u64)) ||
1c6fdbd8f2465d Kent Overstreet     2017-03-16  885  	    mempool_init_kvpmalloc_pool(&c->btree_bounce_pool, 1,
ec4edd7b9d2038 Kent Overstreet     2024-01-16  886  					c->opts.btree_node_size) ||
35189e09ab4678 Kent Overstreet     2019-11-09  887  	    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048) ||
b5e8a6992fb119 Kent Overstreet     2020-11-02  888  	    !(c->unused_inode_hints = kcalloc(1U << c->inode_shard_bits,
e2b605601ad569 Kent Overstreet     2021-11-05  889  					      sizeof(u64), GFP_KERNEL))) {
65d48e35250fe4 Kent Overstreet     2023-03-14  890  		ret = -BCH_ERR_ENOMEM_fs_other_alloc;
7be9ab637fb9c5 Chris Webb          2021-11-04  891  		goto err;
7be9ab637fb9c5 Chris Webb          2021-11-04  892  	}
7be9ab637fb9c5 Chris Webb          2021-11-04  893  
f3b8403ee70e5d Kent Overstreet     2022-09-25  894  	ret = bch2_fs_counters_init(c) ?:
f5d26fa31ed2e2 Kent Overstreet     2023-10-25  895  	    bch2_fs_sb_errors_init(c) ?:
f3b8403ee70e5d Kent Overstreet     2022-09-25  896  	    bch2_io_clock_init(&c->io_clock[READ]) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  897  	    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  898  	    bch2_fs_journal_init(&c->journal) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  899  	    bch2_fs_replicas_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  900  	    bch2_fs_btree_cache_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  901  	    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  902  	    bch2_fs_btree_iter_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  903  	    bch2_fs_btree_interior_update_init(c) ?:
9b688da3507291 Kent Overstreet     2022-05-28  904  	    bch2_fs_buckets_waiting_for_journal_init(c) ?:
920e69bc3db88d Kent Overstreet     2023-01-04  905  	    bch2_fs_btree_write_buffer_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  906  	    bch2_fs_subvolumes_init(c) ?:
1809b8cba756d3 Kent Overstreet     2023-09-10  907  	    bch2_fs_io_read_init(c) ?:
1809b8cba756d3 Kent Overstreet     2023-09-10  908  	    bch2_fs_io_write_init(c) ?:
350175bf9b0fe5 Kent Overstreet     2022-12-14  909  	    bch2_fs_nocow_locking_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  910  	    bch2_fs_encryption_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  911  	    bch2_fs_compress_init(c) ?:
e2b605601ad569 Kent Overstreet     2021-11-05  912  	    bch2_fs_ec_init(c) ?:
dbbfca9f41e869 Kent Overstreet     2023-08-03  913  	    bch2_fs_fsio_init(c) ?:
867c1fe0187f6d Dan Carpenter       2023-09-14  914  	    bch2_fs_fs_io_buffered_init(c) ?:
dbbfca9f41e869 Kent Overstreet     2023-08-03  915  	    bch2_fs_fs_io_direct_init(c);
7be9ab637fb9c5 Chris Webb          2021-11-04  916  	if (ret)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  917  		goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  918  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  919  	for (i = 0; i < c->sb.nr_devices; i++)
1241df5872b439 Hunter Shaffer      2023-09-24  920  		if (bch2_dev_exists(c->disk_sb.sb, i) &&
7be9ab637fb9c5 Chris Webb          2021-11-04  921  		    bch2_dev_alloc(c, i)) {
e2b605601ad569 Kent Overstreet     2021-11-05  922  			ret = -EEXIST;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  923  			goto err;
7be9ab637fb9c5 Chris Webb          2021-11-04  924  		}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  925  
4b8f89afd44592 Kent Overstreet     2021-02-03  926  	bch2_journal_entry_res_resize(&c->journal,
4b8f89afd44592 Kent Overstreet     2021-02-03  927  			&c->btree_root_journal_res,
4b8f89afd44592 Kent Overstreet     2021-02-03  928  			BTREE_ID_NR * (JSET_KEYS_U64s + BKEY_BTREE_PTR_U64s_MAX));
4b8f89afd44592 Kent Overstreet     2021-02-03  929  	bch2_dev_usage_journal_reserve(c);
4b8f89afd44592 Kent Overstreet     2021-02-03  930  	bch2_journal_entry_res_resize(&c->journal,
4b8f89afd44592 Kent Overstreet     2021-02-03  931  			&c->clock_journal_res,
4b8f89afd44592 Kent Overstreet     2021-02-03  932  			(sizeof(struct jset_entry_clock) / sizeof(u64)) * 2);
4b8f89afd44592 Kent Overstreet     2021-02-03  933  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  934  	mutex_lock(&bch_fs_list_lock);
e2b605601ad569 Kent Overstreet     2021-11-05  935  	ret = bch2_fs_online(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  936  	mutex_unlock(&bch_fs_list_lock);
e2b605601ad569 Kent Overstreet     2021-11-05  937  
e2b605601ad569 Kent Overstreet     2021-11-05  938  	if (ret)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  939  		goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  940  out:
1c6fdbd8f2465d Kent Overstreet     2017-03-16  941  	return c;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  942  err:
1c6fdbd8f2465d Kent Overstreet     2017-03-16  943  	bch2_fs_free(c);
7be9ab637fb9c5 Chris Webb          2021-11-04  944  	c = ERR_PTR(ret);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  945  	goto out;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  946  }
1c6fdbd8f2465d Kent Overstreet     2017-03-16  947  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
