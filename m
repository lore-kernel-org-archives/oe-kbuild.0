Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F862FE02
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHp8AbNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699368587; x=1730904587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yzOMVj0JmLnsEOd24zSc4LIgcsmcrB4bpqvig85W/Y=;
  b=YHp8AbNFvEfhx2mzmovq3LtgUKgI6yC/NhckDyz+hjvVPYKzi1NhsSAm
   8RxPS27rSj1lNbkzm5GGGMUjTheaznC3jxTp6RzuWUtfvay+RrZjzzhTg
   xD9o2QnDIWeXSt0pS/PmbeT5jsCxu5LGi24ykoZ2L9izQAczOZgD6EbQg
   URyrOmRehifFHhQ9toZ5lTJ1+3FMS1WwussPGyU+fZxkA7YAU4JnYUuXG
   HYgQeBydluZR8Pfq0Nw8sBThU5PqY2rIsvmjXaMDnQI3DkAe5GHEmMr0t
   uUkChk9HdIqxBAr0lXCY/+fsGiqj/Gp+hPltoSHUEdguFU+tt8VelRGlP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2460272"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2460272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 06:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="10847016"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2023 06:49:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0NOf-0007Ae-27;
	Tue, 07 Nov 2023 14:49:41 +0000
Date: Tue, 7 Nov 2023 22:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_update_interior.c:1582 btree_split() warn:
 variable dereferenced before check 'path1' (see line 1483)
Message-ID: <202311072233.KsJQSI13-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: e4215d0fec777e6516306f5f1b69a45a4205dce0 bcachefs: All held locks must be in a btree path
date:   2 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072233.KsJQSI13-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311072233.KsJQSI13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311072233.KsJQSI13-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_update_interior.c:1582 btree_split() warn: variable dereferenced before check 'path1' (see line 1483)

vim +/path1 +1582 fs/bcachefs/btree_update_interior.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1450  
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1451  static void btree_split(struct btree_update *as, struct btree_trans *trans,
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1452  			struct btree_path *path, struct btree *b,
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1453  			struct keylist *keys, unsigned flags)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1454  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1455  	struct bch_fs *c = as->c;
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1456  	struct btree *parent = btree_node_parent(path, b);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1457  	struct btree *n1, *n2 = NULL, *n3 = NULL;
e4215d0fec777e6 Kent Overstreet 2022-09-16  1458  	struct btree_path *path1 = NULL, *path2 = NULL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1459  	u64 start_time = local_clock();
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1460  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1461  	BUG_ON(!parent && (b != btree_node_root(c, b)));
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1462  	BUG_ON(!btree_node_intent_locked(path, btree_node_root(c, b)->c.level));
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1463  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1464  	bch2_btree_interior_update_will_free_node(as, b);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1465  
ca7d8fcabf29fae Kent Overstreet 2022-08-21  1466  	n1 = bch2_btree_node_alloc_replacement(as, trans, b);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1467  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1468  	if (keys)
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1469  		btree_split_insert_keys(as, trans, path, n1, keys);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1470  
5525f632dc123ed Kent Overstreet 2020-01-15  1471  	if (bset_u64s(&n1->set[0]) > BTREE_SPLIT_THRESHOLD(c)) {
674cfc26240b780 Kent Overstreet 2022-08-27  1472  		trace_and_count(c, btree_node_split, c, b);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1473  
ca7d8fcabf29fae Kent Overstreet 2022-08-21  1474  		n2 = __btree_split_node(as, trans, n1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1475  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1476  		bch2_btree_build_aux_trees(n2);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1477  		bch2_btree_build_aux_trees(n1);
c43a6ef9a0747ef Kent Overstreet 2020-06-06  1478  		six_unlock_write(&n2->c.lock);
c43a6ef9a0747ef Kent Overstreet 2020-06-06  1479  		six_unlock_write(&n1->c.lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1480  
e4215d0fec777e6 Kent Overstreet 2022-09-16  1481  		path1 = get_unlocked_mut_path(trans, path->btree_id, n1->c.level, n1->key.k.p);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1482  		six_lock_increment(&n1->c.lock, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16 @1483  		mark_btree_node_locked(trans, path1, n1->c.level, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1484  		bch2_btree_path_level_init(trans, path1, n1);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1485  
e4215d0fec777e6 Kent Overstreet 2022-09-16  1486  		path2 = get_unlocked_mut_path(trans, path->btree_id, n2->c.level, n2->key.k.p);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1487  		six_lock_increment(&n2->c.lock, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1488  		mark_btree_node_locked(trans, path2, n2->c.level, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1489  		bch2_btree_path_level_init(trans, path2, n2);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1490  
7419646b254a599 Kent Overstreet 2022-04-14  1491  		bch2_btree_update_add_new_node(as, n1);
7419646b254a599 Kent Overstreet 2022-04-14  1492  
82732ef510b8455 Kent Overstreet 2022-02-26  1493  		bch2_btree_node_write(c, n1, SIX_LOCK_intent, 0);
82732ef510b8455 Kent Overstreet 2022-02-26  1494  		bch2_btree_node_write(c, n2, SIX_LOCK_intent, 0);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1495  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1496  		/*
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1497  		 * Note that on recursive parent_keys == keys, so we
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1498  		 * can't start adding new keys to parent_keys before emptying it
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1499  		 * out (which we did with btree_split_insert_keys() above)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1500  		 */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1501  		bch2_keylist_add(&as->parent_keys, &n1->key);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1502  		bch2_keylist_add(&as->parent_keys, &n2->key);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1503  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1504  		if (!parent) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1505  			/* Depth increases, make a new root */
ca7d8fcabf29fae Kent Overstreet 2022-08-21  1506  			n3 = __btree_root_alloc(as, trans, b->c.level + 1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1507  
e4215d0fec777e6 Kent Overstreet 2022-09-16  1508  			path2->locks_want++;
e4215d0fec777e6 Kent Overstreet 2022-09-16  1509  			BUG_ON(btree_node_locked(path2, n3->c.level));
e4215d0fec777e6 Kent Overstreet 2022-09-16  1510  			six_lock_increment(&n3->c.lock, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1511  			mark_btree_node_locked(trans, path2, n3->c.level, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1512  			bch2_btree_path_level_init(trans, path2, n3);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1513  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1514  			n3->sib_u64s[0] = U16_MAX;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1515  			n3->sib_u64s[1] = U16_MAX;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1516  
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1517  			btree_split_insert_keys(as, trans, path, n3, &as->parent_keys);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1518  
82732ef510b8455 Kent Overstreet 2022-02-26  1519  			bch2_btree_node_write(c, n3, SIX_LOCK_intent, 0);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1520  		}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1521  	} else {
674cfc26240b780 Kent Overstreet 2022-08-27  1522  		trace_and_count(c, btree_node_compact, c, b);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1523  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1524  		bch2_btree_build_aux_trees(n1);
c43a6ef9a0747ef Kent Overstreet 2020-06-06  1525  		six_unlock_write(&n1->c.lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1526  
e4215d0fec777e6 Kent Overstreet 2022-09-16  1527  		path1 = get_unlocked_mut_path(trans, path->btree_id, n1->c.level, n1->key.k.p);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1528  		six_lock_increment(&n1->c.lock, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1529  		mark_btree_node_locked(trans, path1, n1->c.level, SIX_LOCK_intent);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1530  		bch2_btree_path_level_init(trans, path1, n1);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1531  
7419646b254a599 Kent Overstreet 2022-04-14  1532  		bch2_btree_update_add_new_node(as, n1);
7419646b254a599 Kent Overstreet 2022-04-14  1533  
82732ef510b8455 Kent Overstreet 2022-02-26  1534  		bch2_btree_node_write(c, n1, SIX_LOCK_intent, 0);
9f1833cadda7bb4 Kent Overstreet 2021-07-10  1535  
6357d6071fccb5c Kent Overstreet 2020-02-08  1536  		if (parent)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1537  			bch2_keylist_add(&as->parent_keys, &n1->key);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1538  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1539  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1540  	/* New nodes all written, now make them visible: */
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1541  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1542  	if (parent) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1543  		/* Split a non root node */
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1544  		bch2_btree_insert_node(as, trans, path, parent, &as->parent_keys, flags);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1545  	} else if (n3) {
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1546  		bch2_btree_set_root(as, trans, path, n3);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1547  	} else {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1548  		/* Root filled up but didn't need to be split */
67e0dd8f0d8b4bf Kent Overstreet 2021-08-30  1549  		bch2_btree_set_root(as, trans, path, n1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1550  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1551  
00b8ccf7074fddb Kent Overstreet 2020-05-25  1552  	bch2_btree_update_get_open_buckets(as, n1);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1553  	if (n2)
00b8ccf7074fddb Kent Overstreet 2020-05-25  1554  		bch2_btree_update_get_open_buckets(as, n2);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1555  	if (n3)
00b8ccf7074fddb Kent Overstreet 2020-05-25  1556  		bch2_btree_update_get_open_buckets(as, n3);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1557  
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1558  	/*
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1559  	 * The old node must be freed (in memory) _before_ unlocking the new
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1560  	 * nodes - else another thread could re-acquire a read lock on the old
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1561  	 * node after another thread has locked and updated the new node, thus
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1562  	 * seeing stale data:
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1563  	 */
38474c264252475 Kent Overstreet 2022-09-02  1564  	bch2_btree_node_free_inmem(trans, path, b);
38474c264252475 Kent Overstreet 2022-09-02  1565  
38474c264252475 Kent Overstreet 2022-09-02  1566  	if (n3)
38474c264252475 Kent Overstreet 2022-09-02  1567  		bch2_trans_node_add(trans, n3);
38474c264252475 Kent Overstreet 2022-09-02  1568  	if (n2)
38474c264252475 Kent Overstreet 2022-09-02  1569  		bch2_trans_node_add(trans, n2);
38474c264252475 Kent Overstreet 2022-09-02  1570  	bch2_trans_node_add(trans, n1);
ad7ae8d63fa82e5 Kent Overstreet 2018-11-23  1571  
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1572  	if (n3)
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1573  		six_unlock_intent(&n3->c.lock);
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1574  	if (n2)
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1575  		six_unlock_intent(&n2->c.lock);
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1576  	six_unlock_intent(&n1->c.lock);
ea3532cbf7fdbb9 Kent Overstreet 2019-10-11  1577  
e4215d0fec777e6 Kent Overstreet 2022-09-16  1578  	if (path2) {
e4215d0fec777e6 Kent Overstreet 2022-09-16  1579  		__bch2_btree_path_unlock(trans, path2);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1580  		bch2_path_put(trans, path2, true);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1581  	}
e4215d0fec777e6 Kent Overstreet 2022-09-16 @1582  	if (path1) {
e4215d0fec777e6 Kent Overstreet 2022-09-16  1583  		__bch2_btree_path_unlock(trans, path1);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1584  		bch2_path_put(trans, path1, true);
e4215d0fec777e6 Kent Overstreet 2022-09-16  1585  	}
e4215d0fec777e6 Kent Overstreet 2022-09-16  1586  
a0a568794d09a20 Kent Overstreet 2021-08-30  1587  	bch2_trans_verify_locks(trans);
ad7ae8d63fa82e5 Kent Overstreet 2018-11-23  1588  
991ba0211290884 Kent Overstreet 2021-12-10  1589  	bch2_time_stats_update(&c->times[n2
991ba0211290884 Kent Overstreet 2021-12-10  1590  			       ? BCH_TIME_btree_node_split
991ba0211290884 Kent Overstreet 2021-12-10  1591  			       : BCH_TIME_btree_node_compact],
dc3b63dc33e1b65 Kent Overstreet 2019-03-21  1592  			       start_time);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1593  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  1594  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
