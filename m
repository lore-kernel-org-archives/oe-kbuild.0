Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A80878E79
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJdAAGrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702498275; x=1734034275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ss8sPeBxdGaZL3AyWJYhikmdpP/7O4ozDls4mGXbWAk=;
  b=kJdAAGrEXGiw1lvCEKgLdZHpXG9eDgi2BdZ+STV+MPKnFSXlsXARlntn
   OSSuF4EzWRKUeEAWj/Kqw5GMnEAs43G7QA6bvqaXKpTruMdkpwAhZRNZy
   7+/K/JnJPvzkKHw6iF4KB0AQ9FT1eqqD7xPJ2x4ZrzR2GQfvKggQPfp9w
   oymJlomLubXz8UyafO3xhgk/2sWQe1pYgpnoa7GYU7It4rZNZ3/o/OP6D
   DPnUyeWujaCXidURUEIGK7+kq2nn7HubPGj9ZXEEs+x+TRklzLI+0f+A+
   q0DtjxdPP1MWLiYeOa9WS5QKDu119qtAtZ2qyAxL5Xf/fYDl8lReCqffF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2106212"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="2106212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 12:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="802997331"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="802997331"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Dec 2023 12:11:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDVZW-000L5N-02;
	Wed, 13 Dec 2023 20:11:10 +0000
Date: Thu, 14 Dec 2023 04:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/fsck.c:1454:13-14: WARNING opportunity for min()
Message-ID: <202312140427.l9c0oz9r-lkp@intel.com>
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
head:   88035e5694a86a7167d490bb95e9df97a9bb162b
commit: 285b181ad460bb240041a9ca7935f9e884040405 bcachefs: Improve transaction restart handling in fsck code
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-102-20231213 (https://download.01.org/0day-ci/archive/20231214/202312140427.l9c0oz9r-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140427.l9c0oz9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312140427.l9c0oz9r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/fsck.c:1454:13-14: WARNING opportunity for min()
   fs/bcachefs/fsck.c:1154:13-14: WARNING opportunity for min()
   fs/bcachefs/fsck.c:794:13-14: WARNING opportunity for min()

vim +1454 fs/bcachefs/fsck.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1430  
914f2786b89232 Kent Overstreet 2021-07-14  1431  static int check_dirent(struct btree_trans *trans, struct btree_iter *iter,
914f2786b89232 Kent Overstreet 2021-07-14  1432  			struct bch_hash_info *hash_info,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1433  			struct inode_walker *dir,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1434  			struct inode_walker *target,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1435  			struct snapshots_seen *s)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1436  {
914f2786b89232 Kent Overstreet 2021-07-14  1437  	struct bch_fs *c = trans->c;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1438  	struct bkey_s_c k;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1439  	struct bkey_s_c_dirent d;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1440  	struct inode_walker_entry *i;
914f2786b89232 Kent Overstreet 2021-07-14  1441  	char buf[200];
914f2786b89232 Kent Overstreet 2021-07-14  1442  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1443  
914f2786b89232 Kent Overstreet 2021-07-14  1444  	k = bch2_btree_iter_peek(iter);
914f2786b89232 Kent Overstreet 2021-07-14  1445  	if (!k.k)
382005442674a3 Kent Overstreet 2021-07-21  1446  		return 0;
914f2786b89232 Kent Overstreet 2021-07-14  1447  
914f2786b89232 Kent Overstreet 2021-07-14  1448  	ret = bkey_err(k);
8a85b20cd757d9 Kent Overstreet 2021-04-06  1449  	if (ret)
914f2786b89232 Kent Overstreet 2021-07-14  1450  		return ret;
914f2786b89232 Kent Overstreet 2021-07-14  1451  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1452  	ret = check_key_has_snapshot(trans, iter, k);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1453  	if (ret)
285b181ad460bb Kent Overstreet 2021-10-28 @1454  		return ret < 0 ? ret : 0;
8a85b20cd757d9 Kent Overstreet 2021-04-06  1455  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1456  	ret = snapshots_seen_update(c, s, k.k->p);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1457  	if (ret)
914f2786b89232 Kent Overstreet 2021-07-14  1458  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1459  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1460  	if (k.k->type == KEY_TYPE_whiteout)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1461  		return 0;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1462  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1463  	if (dir->cur_inum != k.k->p.inode) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1464  		ret = check_subdir_count(trans, dir);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1465  		if (ret)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1466  			return ret;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1467  	}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1468  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1469  	ret = __walk_inode(trans, dir, k.k->p);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1470  	if (ret < 0)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1471  		return ret;
8a85b20cd757d9 Kent Overstreet 2021-04-06  1472  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1473  	if (fsck_err_on(ret == INT_MAX, c,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1474  			"dirent in nonexisting directory:\n%s",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1475  			(bch2_bkey_val_to_text(&PBUF(buf), c, k), buf)))
285b181ad460bb Kent Overstreet 2021-10-28  1476  		return bch2_btree_delete_at(trans, iter,
285b181ad460bb Kent Overstreet 2021-10-28  1477  				BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1478  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1479  	if (ret == INT_MAX)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1480  		return 0;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1481  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1482  	i = dir->d + ret;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1483  	ret = 0;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1484  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1485  	if (fsck_err_on(!S_ISDIR(i->inode.bi_mode), c,
285b181ad460bb Kent Overstreet 2021-10-28  1486  			"dirent in non directory inode type %s:\n%s",
285b181ad460bb Kent Overstreet 2021-10-28  1487  			bch2_d_type_str(inode_d_type(&i->inode)),
914f2786b89232 Kent Overstreet 2021-07-14  1488  			(bch2_bkey_val_to_text(&PBUF(buf), c, k), buf)))
285b181ad460bb Kent Overstreet 2021-10-28  1489  		return bch2_btree_delete_at(trans, iter, 0);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1490  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1491  	if (dir->first_this_inode)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1492  		*hash_info = bch2_hash_info_init(c, &dir->d[0].inode);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1493  
914f2786b89232 Kent Overstreet 2021-07-14  1494  	ret = hash_check_key(trans, bch2_dirent_hash_desc,
914f2786b89232 Kent Overstreet 2021-07-14  1495  			     hash_info, iter, k);
914f2786b89232 Kent Overstreet 2021-07-14  1496  	if (ret < 0)
914f2786b89232 Kent Overstreet 2021-07-14  1497  		return ret;
914f2786b89232 Kent Overstreet 2021-07-14  1498  	if (ret) /* dirent has been deleted */
914f2786b89232 Kent Overstreet 2021-07-14  1499  		return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1500  
26609b619fa230 Kent Overstreet 2018-11-01  1501  	if (k.k->type != KEY_TYPE_dirent)
914f2786b89232 Kent Overstreet 2021-07-14  1502  		return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1503  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1504  	d = bkey_s_c_to_dirent(k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1505  
4db650277d42c0 Kent Overstreet 2021-10-12  1506  	if (d.v->d_type == DT_SUBVOL) {
4db650277d42c0 Kent Overstreet 2021-10-12  1507  		struct bch_inode_unpacked subvol_root;
4db650277d42c0 Kent Overstreet 2021-10-12  1508  		u32 target_subvol = le32_to_cpu(d.v->d_child_subvol);
4db650277d42c0 Kent Overstreet 2021-10-12  1509  		u32 target_snapshot;
4db650277d42c0 Kent Overstreet 2021-10-12  1510  		u64 target_inum;
4db650277d42c0 Kent Overstreet 2021-10-12  1511  
4db650277d42c0 Kent Overstreet 2021-10-12  1512  		ret = __subvol_lookup(trans, target_subvol,
4db650277d42c0 Kent Overstreet 2021-10-12  1513  				      &target_snapshot, &target_inum);
b9e1adf57988fb Kent Overstreet 2021-03-16  1514  		if (ret && ret != -ENOENT)
b9e1adf57988fb Kent Overstreet 2021-03-16  1515  			return ret;
b9e1adf57988fb Kent Overstreet 2021-03-16  1516  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1517  		if (fsck_err_on(ret, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1518  				"dirent points to missing subvolume %llu",
4db650277d42c0 Kent Overstreet 2021-10-12  1519  				le64_to_cpu(d.v->d_child_subvol)))
285b181ad460bb Kent Overstreet 2021-10-28  1520  			return __remove_dirent(trans, d.k->p);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1521  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1522  		ret = __lookup_inode(trans, target_inum,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1523  				   &subvol_root, &target_snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1524  		if (ret && ret != -ENOENT)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1525  			return ret;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1526  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1527  		if (fsck_err_on(ret, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1528  				"subvolume %u points to missing subvolume root %llu",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1529  				target_subvol,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1530  				target_inum)) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1531  			bch_err(c, "repair not implemented yet");
ef1669ffc69c49 Kent Overstreet 2021-04-20  1532  			return -EINVAL;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1533  		}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1534  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1535  		if (fsck_err_on(subvol_root.bi_subvol != target_subvol, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1536  				"subvol root %llu has wrong bi_subvol field: got %u, should be %u",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1537  				target_inum,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1538  				subvol_root.bi_subvol, target_subvol)) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1539  			subvol_root.bi_subvol = target_subvol;
285b181ad460bb Kent Overstreet 2021-10-28  1540  			ret = __write_inode(trans, &subvol_root, target_snapshot);
d3ff7fec9c604e Kent Overstreet 2021-04-07  1541  			if (ret)
914f2786b89232 Kent Overstreet 2021-07-14  1542  				return ret;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1543  		}
d3ff7fec9c604e Kent Overstreet 2021-04-07  1544  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1545  		ret = check_dirent_target(trans, iter, d, &subvol_root,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1546  					  target_snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1547  		if (ret)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1548  			return ret;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1549  	} else {
4db650277d42c0 Kent Overstreet 2021-10-12  1550  		ret = __get_visible_inodes(trans, target, s, le64_to_cpu(d.v->d_inum));
ef1669ffc69c49 Kent Overstreet 2021-04-20  1551  		if (ret)
914f2786b89232 Kent Overstreet 2021-07-14  1552  			return ret;
8a85b20cd757d9 Kent Overstreet 2021-04-06  1553  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1554  		if (fsck_err_on(!target->nr, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1555  				"dirent points to missing inode:\n%s",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1556  				(bch2_bkey_val_to_text(&PBUF(buf), c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1557  						       k), buf))) {
285b181ad460bb Kent Overstreet 2021-10-28  1558  			ret = __remove_dirent(trans, d.k->p);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1559  			if (ret)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1560  				return ret;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1561  		}
d3ff7fec9c604e Kent Overstreet 2021-04-07  1562  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1563  		for (i = target->d; i < target->d + target->nr; i++) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1564  			ret = check_dirent_target(trans, iter, d,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1565  						  &i->inode, i->snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1566  			if (ret)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1567  				return ret;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1568  		}
b9e1adf57988fb Kent Overstreet 2021-03-16  1569  	}
b9e1adf57988fb Kent Overstreet 2021-03-16  1570  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1571  	if (d.v->d_type == DT_DIR)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1572  		for_each_visible_inode(c, s, dir, d.k->p.snapshot, i)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1573  			i->count++;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1574  
914f2786b89232 Kent Overstreet 2021-07-14  1575  fsck_err:
914f2786b89232 Kent Overstreet 2021-07-14  1576  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1577  }
8a85b20cd757d9 Kent Overstreet 2021-04-06  1578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
