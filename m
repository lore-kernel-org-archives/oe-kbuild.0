Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF82B38FB6
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUC+o/pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700517505; x=1732053505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6Q+1rNQVkZsL2vXNUMYCy0lt/3BFnRY7qkyN/0q2GY=;
  b=mUC+o/pjGIu0phfBiaoCNmp1fKU7YERNdX8yCAj+BusiEWFc74GIQRoF
   Myd5BtHWy9MFXYNAbUBRsNLzjd2xChHopPx71ASO5ZQpRyKgQWonAn/RV
   F8j6LFJlJp2a/SlEC0mrMuc4pwcxIOwgG9IfNKprlDWGWf9yStQgGX46V
   g18h6QDs1+u4FBwzoV72258KSXO0ZDX+QKzM7Lpe4EO6ewRIbqNaUGHm9
   XuzvaAuu6h/KCAxDfGVU0iUT4JNUcDDl9ftamHZTLdryVvW8MJb5BZmnM
   XWa5YhlXuzitlF7rCwlZ//iKUHrRBAESPNKZZeZ9SHSvwAmUkkQv2xt3o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371055279"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="371055279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857126492"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="857126492"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2023 13:58:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5CHc-0006xw-2E;
	Mon, 20 Nov 2023 21:58:21 +0000
Date: Tue, 21 Nov 2023 05:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1768/1905]
 fs/bcachefs/btree_update_interior.c:1179 bch2_btree_update_start() warn:
 inconsistent returns '&c->gc_lock'.
Message-ID: <202311210549.DAk2l8Km-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5a82d69d48c82e89aef44483d2a129f869f3506a
commit: 021d46b41ab0c6942aa499f3245ccc5b4612e7d4 [1768/1905] bcachefs: Kill dead BTREE_INSERT flags
:::::: branch date: 16 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210549.DAk2l8Km-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210549.DAk2l8Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311210549.DAk2l8Km-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_update_interior.c:1179 bch2_btree_update_start() warn: inconsistent returns '&c->gc_lock'.

vim +1179 fs/bcachefs/btree_update_interior.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1044  
9f6bd30703a32c Kent Overstreet 2021-08-24  1045  static struct btree_update *
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1046  bch2_btree_update_start(struct btree_trans *trans, struct btree_path *path,
ee68105f619b90 Kent Overstreet 2022-03-04  1047  			unsigned level, bool split, unsigned flags)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1048  {
0f9dda478fb50b Kent Overstreet 2020-04-05  1049  	struct bch_fs *c = trans->c;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1050  	struct btree_update *as;
991ba021129088 Kent Overstreet 2021-12-10  1051  	u64 start_time = local_clock();
4efe71a646c5ad Kent Overstreet 2020-06-09  1052  	int disk_res_flags = (flags & BTREE_INSERT_NOFAIL)
00b8ccf7074fdd Kent Overstreet 2020-05-25  1053  		? BCH_DISK_RESERVATION_NOFAIL : 0;
5f417394033a0d Kent Overstreet 2022-01-11  1054  	unsigned nr_nodes[2] = { 0, 0 };
ee68105f619b90 Kent Overstreet 2022-03-04  1055  	unsigned update_level = level;
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1056  	enum bch_watermark watermark = flags & BCH_WATERMARK_MASK;
4efe71a646c5ad Kent Overstreet 2020-06-09  1057  	int ret = 0;
f0d2e9f2e511c1 Kent Overstreet 2022-07-07  1058  	u32 restart_count = trans->restart_count;
00b8ccf7074fdd Kent Overstreet 2020-05-25  1059  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1060  	BUG_ON(!path->should_be_locked);
8c3f6da9fc526e Kent Overstreet 2021-06-14  1061  
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1062  	if (watermark == BCH_WATERMARK_copygc)
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1063  		watermark = BCH_WATERMARK_btree_copygc;
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1064  	if (watermark < BCH_WATERMARK_btree)
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1065  		watermark = BCH_WATERMARK_btree;
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1066  
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1067  	flags &= ~BCH_WATERMARK_MASK;
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1068  	flags |= watermark;
f33c58fc46a9c5 Kent Overstreet 2023-06-27  1069  
ee68105f619b90 Kent Overstreet 2022-03-04  1070  	while (1) {
3098553776a16c Kent Overstreet 2022-03-04  1071  		nr_nodes[!!update_level] += 1 + split;
ee68105f619b90 Kent Overstreet 2022-03-04  1072  		update_level++;
ee68105f619b90 Kent Overstreet 2022-03-04  1073  
1f0f731ffef13b Kent Overstreet 2022-09-27  1074  		ret = bch2_btree_path_upgrade(trans, path, update_level + 1);
1f0f731ffef13b Kent Overstreet 2022-09-27  1075  		if (ret)
1f0f731ffef13b Kent Overstreet 2022-09-27  1076  			return ERR_PTR(ret);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1077  
1f0f731ffef13b Kent Overstreet 2022-09-27  1078  		if (!btree_path_node(path, update_level)) {
1f0f731ffef13b Kent Overstreet 2022-09-27  1079  			/* Allocating new root? */
1f0f731ffef13b Kent Overstreet 2022-09-27  1080  			nr_nodes[1] += split;
1f0f731ffef13b Kent Overstreet 2022-09-27  1081  			update_level = BTREE_MAX_DEPTH;
1f0f731ffef13b Kent Overstreet 2022-09-27  1082  			break;
ee68105f619b90 Kent Overstreet 2022-03-04  1083  		}
ee68105f619b90 Kent Overstreet 2022-03-04  1084  
1f0f731ffef13b Kent Overstreet 2022-09-27  1085  		if (bch2_btree_node_insert_fits(c, path->l[update_level].b,
1f0f731ffef13b Kent Overstreet 2022-09-27  1086  					BKEY_BTREE_PTR_U64s_MAX * (1 + split)))
1f0f731ffef13b Kent Overstreet 2022-09-27  1087  			break;
ee68105f619b90 Kent Overstreet 2022-03-04  1088  
45a1ab57ddb53a Kent Overstreet 2023-06-16  1089  		split = path->l[update_level].b->nr.live_u64s > BTREE_SPLIT_THRESHOLD(c);
1f0f731ffef13b Kent Overstreet 2022-09-27  1090  	}
e264b2f62a8fdf Kent Overstreet 2021-03-31  1091  
021d46b41ab0c6 Kent Overstreet 2023-11-11  1092  	if (!down_read_trylock(&c->gc_lock)) {
b5fd75669ab128 Kent Overstreet 2023-05-28  1093  		ret = drop_locks_do(trans, (down_read(&c->gc_lock), 0));
549d173c1bd9b5 Kent Overstreet 2022-07-17  1094  		if (ret) {
e264b2f62a8fdf Kent Overstreet 2021-03-31  1095  			up_read(&c->gc_lock);
549d173c1bd9b5 Kent Overstreet 2022-07-17  1096  			return ERR_PTR(ret);
e264b2f62a8fdf Kent Overstreet 2021-03-31  1097  		}
e264b2f62a8fdf Kent Overstreet 2021-03-31  1098  	}
e264b2f62a8fdf Kent Overstreet 2021-03-31  1099  
19c304bebda4d8 Kent Overstreet 2023-05-28  1100  	as = mempool_alloc(&c->btree_interior_update_pool, GFP_NOFS);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1101  	memset(as, 0, sizeof(*as));
00b8ccf7074fdd Kent Overstreet 2020-05-25  1102  	closure_init(&as->cl, NULL);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1103  	as->c		= c;
991ba021129088 Kent Overstreet 2021-12-10  1104  	as->start_time	= start_time;
00b8ccf7074fdd Kent Overstreet 2020-05-25  1105  	as->mode	= BTREE_INTERIOR_NO_UPDATE;
021d46b41ab0c6 Kent Overstreet 2023-11-11  1106  	as->took_gc_lock = true;
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1107  	as->btree_id	= path->btree_id;
1f0f731ffef13b Kent Overstreet 2022-09-27  1108  	as->update_level = update_level;
00b8ccf7074fdd Kent Overstreet 2020-05-25  1109  	INIT_LIST_HEAD(&as->list);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1110  	INIT_LIST_HEAD(&as->unwritten_list);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1111  	INIT_LIST_HEAD(&as->write_blocked_list);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1112  	bch2_keylist_init(&as->old_keys, as->_old_keys);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1113  	bch2_keylist_init(&as->new_keys, as->_new_keys);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1114  	bch2_keylist_init(&as->parent_keys, as->inline_keys);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1115  
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1116  	mutex_lock(&c->btree_interior_update_lock);
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1117  	list_add_tail(&as->list, &c->btree_interior_update_list);
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1118  	mutex_unlock(&c->btree_interior_update_lock);
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1119  
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1120  	/*
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1121  	 * We don't want to allocate if we're in an error state, that can cause
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1122  	 * deadlock on emergency shutdown due to open buckets getting stuck in
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1123  	 * the btree_reserve_cache after allocator shutdown has cleared it out.
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1124  	 * This check needs to come after adding us to the btree_interior_update
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1125  	 * list but before calling bch2_btree_reserve_get, to synchronize with
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1126  	 * __bch2_fs_read_only().
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1127  	 */
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1128  	ret = bch2_journal_error(&c->journal);
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1129  	if (ret)
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1130  		goto err;
9f6e1f7bb0e136 Kent Overstreet 2021-07-13  1131  
00b8ccf7074fdd Kent Overstreet 2020-05-25  1132  	ret = bch2_disk_reservation_get(c, &as->disk_res,
3098553776a16c Kent Overstreet 2022-03-04  1133  			(nr_nodes[0] + nr_nodes[1]) * btree_sectors(c),
00b8ccf7074fdd Kent Overstreet 2020-05-25  1134  			c->opts.metadata_replicas,
00b8ccf7074fdd Kent Overstreet 2020-05-25  1135  			disk_res_flags);
00b8ccf7074fdd Kent Overstreet 2020-05-25  1136  	if (ret)
00b8ccf7074fdd Kent Overstreet 2020-05-25  1137  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1138  
f25d8215f49941 Kent Overstreet 2022-01-09  1139  	ret = bch2_btree_reserve_get(trans, as, nr_nodes, flags, NULL);
d602657cd18578 Kent Overstreet 2022-09-22  1140  	if (bch2_err_matches(ret, ENOSPC) ||
d602657cd18578 Kent Overstreet 2022-09-22  1141  	    bch2_err_matches(ret, ENOMEM)) {
5f417394033a0d Kent Overstreet 2022-01-11  1142  		struct closure cl;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1143  
01e691e830edae Kent Overstreet 2023-07-10  1144  		/*
01e691e830edae Kent Overstreet 2023-07-10  1145  		 * XXX: this should probably be a separate BTREE_INSERT_NONBLOCK
01e691e830edae Kent Overstreet 2023-07-10  1146  		 * flag
01e691e830edae Kent Overstreet 2023-07-10  1147  		 */
01e691e830edae Kent Overstreet 2023-07-10  1148  		if (bch2_err_matches(ret, ENOSPC) &&
01e691e830edae Kent Overstreet 2023-07-10  1149  		    (flags & BTREE_INSERT_JOURNAL_RECLAIM) &&
01e691e830edae Kent Overstreet 2023-07-10  1150  		    watermark != BCH_WATERMARK_reclaim) {
01e691e830edae Kent Overstreet 2023-07-10  1151  			ret = -BCH_ERR_journal_reclaim_would_deadlock;
01e691e830edae Kent Overstreet 2023-07-10  1152  			goto err;
01e691e830edae Kent Overstreet 2023-07-10  1153  		}
01e691e830edae Kent Overstreet 2023-07-10  1154  
5f417394033a0d Kent Overstreet 2022-01-11  1155  		closure_init_stack(&cl);
e264b2f62a8fdf Kent Overstreet 2021-03-31  1156  
5f417394033a0d Kent Overstreet 2022-01-11  1157  		do {
f25d8215f49941 Kent Overstreet 2022-01-09  1158  			ret = bch2_btree_reserve_get(trans, as, nr_nodes, flags, &cl);
c6cf49a95ac7ae Kent Overstreet 2022-09-23  1159  
c6cf49a95ac7ae Kent Overstreet 2022-09-23  1160  			bch2_trans_unlock(trans);
e264b2f62a8fdf Kent Overstreet 2021-03-31  1161  			closure_sync(&cl);
87ced107f37fc0 Kent Overstreet 2022-12-13  1162  		} while (bch2_err_matches(ret, BCH_ERR_operation_blocked));
e264b2f62a8fdf Kent Overstreet 2021-03-31  1163  	}
e264b2f62a8fdf Kent Overstreet 2021-03-31  1164  
5f417394033a0d Kent Overstreet 2022-01-11  1165  	if (ret) {
adf6360b5d6071 Kent Overstreet 2023-02-01  1166  		trace_and_count(c, btree_reserve_get_fail, trans->fn,
adf6360b5d6071 Kent Overstreet 2023-02-01  1167  				_RET_IP_, nr_nodes[0] + nr_nodes[1], ret);
5f417394033a0d Kent Overstreet 2022-01-11  1168  		goto err;
5f417394033a0d Kent Overstreet 2022-01-11  1169  	}
e264b2f62a8fdf Kent Overstreet 2021-03-31  1170  
549d173c1bd9b5 Kent Overstreet 2022-07-17  1171  	ret = bch2_trans_relock(trans);
549d173c1bd9b5 Kent Overstreet 2022-07-17  1172  	if (ret)
5f417394033a0d Kent Overstreet 2022-01-11  1173  		goto err;
5f417394033a0d Kent Overstreet 2022-01-11  1174  
f0d2e9f2e511c1 Kent Overstreet 2022-07-07  1175  	bch2_trans_verify_not_restarted(trans, restart_count);
5f417394033a0d Kent Overstreet 2022-01-11  1176  	return as;
5f417394033a0d Kent Overstreet 2022-01-11  1177  err:
ca7d8fcabf29fa Kent Overstreet 2022-08-21  1178  	bch2_btree_update_free(as, trans);
00b8ccf7074fdd Kent Overstreet 2020-05-25 @1179  	return ERR_PTR(ret);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1180  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1181  

:::::: The code at line 1179 was first introduced by commit
:::::: 00b8ccf7074fddb5607a26673f331ceac2ecd319 bcachefs: Interior btree updates are now fully transactional

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
