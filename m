Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82D2D7B8
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727675875; cv=none; b=EoFaSoI18yMqbEnASpj12ihxyIswKoGFCoaPL7Hkr5xYckYTi4cKb0DIG2wy1w7ddx026Wga8he56PJy9AptvjGXHI57rPz4BwY3UX5Km4+eekyto3iOBWqLuU59KxhPaUZ4tC0HwK/ZLVxgnCulXfB2qAmeI6uGZS9VssXaYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727675875; c=relaxed/simple;
	bh=q1wv4L8d279vERfQXVlv8Ob4ssi9dhJvm5hRegslJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI3iFiBqwr3ZsJQ+18e2NrvHCkRM5+1YAjdSQvXYdm635CKihVYZG98ZrCm6gGKbTdM7adX113rWdppZ58SyT8C1UfAb2Rlc83HCm0u+EpPY27ZYIfYdvDKywff5LBcRBg+Z9EnPabkmMlbfuEpgdYDptQZp/Gb/PMCOh1jhS5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7RZJ79s; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7RZJ79s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727675873; x=1759211873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1wv4L8d279vERfQXVlv8Ob4ssi9dhJvm5hRegslJLU=;
  b=l7RZJ79s7yN+tl+9ibLE50mnGgQCV6mQklXmvT7CMDzDJx4tTig9PDQc
   XRNbkvoJ1XcJhmEGKxqCnnmNFEx1Vgi13GYoLm4hiJe1MGikO0v9UoRoH
   Q65zTfrqYF/oyImuKUeqm0xdqqiMgFIJrPQfibMyckQtGmWUPoWnj2HpU
   +AO4M6QLcssQhwu55pDHDZFUWPibUVkfq6ZdJa0+OAsDoZQp3+Eehh2OI
   2lMc4wuNhM/GSy2ruFosH1j51cQPGzOUsTf0D07etOtsvTZPUJcrzN3fo
   g6MK4ANCPxaB2NCXavQlvJPQer+SaFR2NIBj4zWun5ODxftLX0QkWSGYT
   A==;
X-CSE-ConnectionGUID: vIkntByRS9y+tf9xec+87w==
X-CSE-MsgGUID: /z2B2H+PQXaQe2BkyZnBDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26698893"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26698893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 22:57:53 -0700
X-CSE-ConnectionGUID: sIS8IYgATcGiIgHdM+ENvw==
X-CSE-MsgGUID: Oj7JBUXSRFenFYOZqzK09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73498026"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 22:57:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv9Pp-000P5l-0o;
	Mon, 30 Sep 2024 05:57:49 +0000
Date: Mon, 30 Sep 2024 13:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/fsck.c:1505:12-13: WARNING opportunity for min()
Message-ID: <202409301352.sWrWgyPn-lkp@intel.com>
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
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: fa8e94faeece12c20b541f647059f29867e98bc0 bcachefs: Heap allocate printbufs
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: arc-randconfig-r061-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301352.sWrWgyPn-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409301352.sWrWgyPn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/fsck.c:1505:12-13: WARNING opportunity for min()
   fs/bcachefs/fsck.c:1187:12-13: WARNING opportunity for min()

vim +1505 fs/bcachefs/fsck.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1481  
914f2786b89232 Kent Overstreet 2021-07-14  1482  static int check_dirent(struct btree_trans *trans, struct btree_iter *iter,
914f2786b89232 Kent Overstreet 2021-07-14  1483  			struct bch_hash_info *hash_info,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1484  			struct inode_walker *dir,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1485  			struct inode_walker *target,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1486  			struct snapshots_seen *s)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1487  {
914f2786b89232 Kent Overstreet 2021-07-14  1488  	struct bch_fs *c = trans->c;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1489  	struct bkey_s_c k;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1490  	struct bkey_s_c_dirent d;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1491  	struct inode_walker_entry *i;
fa8e94faeece12 Kent Overstreet 2022-02-25  1492  	struct printbuf buf = PRINTBUF;
fa8e94faeece12 Kent Overstreet 2022-02-25  1493  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1494  
914f2786b89232 Kent Overstreet 2021-07-14  1495  	k = bch2_btree_iter_peek(iter);
914f2786b89232 Kent Overstreet 2021-07-14  1496  	if (!k.k)
fa8e94faeece12 Kent Overstreet 2022-02-25  1497  		goto out;
914f2786b89232 Kent Overstreet 2021-07-14  1498  
914f2786b89232 Kent Overstreet 2021-07-14  1499  	ret = bkey_err(k);
8a85b20cd757d9 Kent Overstreet 2021-04-06  1500  	if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1501  		goto err;
914f2786b89232 Kent Overstreet 2021-07-14  1502  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1503  	ret = check_key_has_snapshot(trans, iter, k);
fa8e94faeece12 Kent Overstreet 2022-02-25  1504  	if (ret) {
fa8e94faeece12 Kent Overstreet 2022-02-25 @1505  		ret = ret < 0 ? ret : 0;
fa8e94faeece12 Kent Overstreet 2022-02-25  1506  		goto out;
fa8e94faeece12 Kent Overstreet 2022-02-25  1507  	}
8a85b20cd757d9 Kent Overstreet 2021-04-06  1508  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1509  	ret = snapshots_seen_update(c, s, k.k->p);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1510  	if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1511  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1512  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1513  	if (k.k->type == KEY_TYPE_whiteout)
fa8e94faeece12 Kent Overstreet 2022-02-25  1514  		goto out;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1515  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1516  	if (dir->cur_inum != k.k->p.inode) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1517  		ret = check_subdir_count(trans, dir);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1518  		if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1519  			goto err;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1520  	}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1521  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1522  	ret = __walk_inode(trans, dir, k.k->p);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1523  	if (ret < 0)
fa8e94faeece12 Kent Overstreet 2022-02-25  1524  		goto err;
8a85b20cd757d9 Kent Overstreet 2021-04-06  1525  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1526  	if (fsck_err_on(ret == INT_MAX, c,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1527  			"dirent in nonexisting directory:\n%s",
fa8e94faeece12 Kent Overstreet 2022-02-25  1528  			(printbuf_reset(&buf),
fa8e94faeece12 Kent Overstreet 2022-02-25  1529  			 bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
fa8e94faeece12 Kent Overstreet 2022-02-25  1530  		ret = bch2_btree_delete_at(trans, iter,
285b181ad460bb Kent Overstreet 2021-10-28  1531  				BTREE_UPDATE_INTERNAL_SNAPSHOT_NODE);
fa8e94faeece12 Kent Overstreet 2022-02-25  1532  		goto out;
fa8e94faeece12 Kent Overstreet 2022-02-25  1533  	}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1534  
fa8e94faeece12 Kent Overstreet 2022-02-25  1535  	if (ret == INT_MAX) {
fa8e94faeece12 Kent Overstreet 2022-02-25  1536  		ret = 0;
fa8e94faeece12 Kent Overstreet 2022-02-25  1537  		goto out;
fa8e94faeece12 Kent Overstreet 2022-02-25  1538  	}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1539  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1540  	i = dir->d + ret;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1541  	ret = 0;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1542  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1543  	if (fsck_err_on(!S_ISDIR(i->inode.bi_mode), c,
285b181ad460bb Kent Overstreet 2021-10-28  1544  			"dirent in non directory inode type %s:\n%s",
285b181ad460bb Kent Overstreet 2021-10-28  1545  			bch2_d_type_str(inode_d_type(&i->inode)),
fa8e94faeece12 Kent Overstreet 2022-02-25  1546  			(printbuf_reset(&buf),
fa8e94faeece12 Kent Overstreet 2022-02-25  1547  			 bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
fa8e94faeece12 Kent Overstreet 2022-02-25  1548  		ret = bch2_btree_delete_at(trans, iter, 0);
fa8e94faeece12 Kent Overstreet 2022-02-25  1549  		goto out;
fa8e94faeece12 Kent Overstreet 2022-02-25  1550  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1551  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1552  	if (dir->first_this_inode)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1553  		*hash_info = bch2_hash_info_init(c, &dir->d[0].inode);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1554  
914f2786b89232 Kent Overstreet 2021-07-14  1555  	ret = hash_check_key(trans, bch2_dirent_hash_desc,
914f2786b89232 Kent Overstreet 2021-07-14  1556  			     hash_info, iter, k);
914f2786b89232 Kent Overstreet 2021-07-14  1557  	if (ret < 0)
fa8e94faeece12 Kent Overstreet 2022-02-25  1558  		goto err;
fa8e94faeece12 Kent Overstreet 2022-02-25  1559  	if (ret) {
fa8e94faeece12 Kent Overstreet 2022-02-25  1560  		/* dirent has been deleted */
fa8e94faeece12 Kent Overstreet 2022-02-25  1561  		ret = 0;
fa8e94faeece12 Kent Overstreet 2022-02-25  1562  		goto out;
fa8e94faeece12 Kent Overstreet 2022-02-25  1563  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1564  
26609b619fa230 Kent Overstreet 2018-11-01  1565  	if (k.k->type != KEY_TYPE_dirent)
fa8e94faeece12 Kent Overstreet 2022-02-25  1566  		goto out;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1567  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1568  	d = bkey_s_c_to_dirent(k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1569  
4db650277d42c0 Kent Overstreet 2021-10-12  1570  	if (d.v->d_type == DT_SUBVOL) {
4db650277d42c0 Kent Overstreet 2021-10-12  1571  		struct bch_inode_unpacked subvol_root;
4db650277d42c0 Kent Overstreet 2021-10-12  1572  		u32 target_subvol = le32_to_cpu(d.v->d_child_subvol);
4db650277d42c0 Kent Overstreet 2021-10-12  1573  		u32 target_snapshot;
4db650277d42c0 Kent Overstreet 2021-10-12  1574  		u64 target_inum;
4db650277d42c0 Kent Overstreet 2021-10-12  1575  
4db650277d42c0 Kent Overstreet 2021-10-12  1576  		ret = __subvol_lookup(trans, target_subvol,
4db650277d42c0 Kent Overstreet 2021-10-12  1577  				      &target_snapshot, &target_inum);
b9e1adf57988fb Kent Overstreet 2021-03-16  1578  		if (ret && ret != -ENOENT)
fa8e94faeece12 Kent Overstreet 2022-02-25  1579  			goto err;
b9e1adf57988fb Kent Overstreet 2021-03-16  1580  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1581  		if (fsck_err_on(ret, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1582  				"dirent points to missing subvolume %llu",
fa8e94faeece12 Kent Overstreet 2022-02-25  1583  				le64_to_cpu(d.v->d_child_subvol))) {
fa8e94faeece12 Kent Overstreet 2022-02-25  1584  			ret = __remove_dirent(trans, d.k->p);
fa8e94faeece12 Kent Overstreet 2022-02-25  1585  			goto err;
fa8e94faeece12 Kent Overstreet 2022-02-25  1586  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1587  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1588  		ret = __lookup_inode(trans, target_inum,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1589  				   &subvol_root, &target_snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1590  		if (ret && ret != -ENOENT)
fa8e94faeece12 Kent Overstreet 2022-02-25  1591  			goto err;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1592  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1593  		if (fsck_err_on(ret, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1594  				"subvolume %u points to missing subvolume root %llu",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1595  				target_subvol,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1596  				target_inum)) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1597  			bch_err(c, "repair not implemented yet");
fa8e94faeece12 Kent Overstreet 2022-02-25  1598  			ret = -EINVAL;
fa8e94faeece12 Kent Overstreet 2022-02-25  1599  			goto err;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1600  		}
ef1669ffc69c49 Kent Overstreet 2021-04-20  1601  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1602  		if (fsck_err_on(subvol_root.bi_subvol != target_subvol, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1603  				"subvol root %llu has wrong bi_subvol field: got %u, should be %u",
ef1669ffc69c49 Kent Overstreet 2021-04-20  1604  				target_inum,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1605  				subvol_root.bi_subvol, target_subvol)) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1606  			subvol_root.bi_subvol = target_subvol;
285b181ad460bb Kent Overstreet 2021-10-28  1607  			ret = __write_inode(trans, &subvol_root, target_snapshot);
d3ff7fec9c604e Kent Overstreet 2021-04-07  1608  			if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1609  				goto err;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1610  		}
d3ff7fec9c604e Kent Overstreet 2021-04-07  1611  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1612  		ret = check_dirent_target(trans, iter, d, &subvol_root,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1613  					  target_snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1614  		if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1615  			goto err;
ef1669ffc69c49 Kent Overstreet 2021-04-20  1616  	} else {
4db650277d42c0 Kent Overstreet 2021-10-12  1617  		ret = __get_visible_inodes(trans, target, s, le64_to_cpu(d.v->d_inum));
ef1669ffc69c49 Kent Overstreet 2021-04-20  1618  		if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1619  			goto err;
8a85b20cd757d9 Kent Overstreet 2021-04-06  1620  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1621  		if (fsck_err_on(!target->nr, c,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1622  				"dirent points to missing inode:\n%s",
fa8e94faeece12 Kent Overstreet 2022-02-25  1623  				(printbuf_reset(&buf),
fa8e94faeece12 Kent Overstreet 2022-02-25  1624  				 bch2_bkey_val_to_text(&buf, c, k),
fa8e94faeece12 Kent Overstreet 2022-02-25  1625  				 buf.buf))) {
285b181ad460bb Kent Overstreet 2021-10-28  1626  			ret = __remove_dirent(trans, d.k->p);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1627  			if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1628  				goto err;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1629  		}
d3ff7fec9c604e Kent Overstreet 2021-04-07  1630  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1631  		for (i = target->d; i < target->d + target->nr; i++) {
ef1669ffc69c49 Kent Overstreet 2021-04-20  1632  			ret = check_dirent_target(trans, iter, d,
ef1669ffc69c49 Kent Overstreet 2021-04-20  1633  						  &i->inode, i->snapshot);
ef1669ffc69c49 Kent Overstreet 2021-04-20  1634  			if (ret)
fa8e94faeece12 Kent Overstreet 2022-02-25  1635  				goto err;
d3ff7fec9c604e Kent Overstreet 2021-04-07  1636  		}
b9e1adf57988fb Kent Overstreet 2021-03-16  1637  	}
b9e1adf57988fb Kent Overstreet 2021-03-16  1638  
ef1669ffc69c49 Kent Overstreet 2021-04-20  1639  	if (d.v->d_type == DT_DIR)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1640  		for_each_visible_inode(c, s, dir, d.k->p.snapshot, i)
ef1669ffc69c49 Kent Overstreet 2021-04-20  1641  			i->count++;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1642  
fa8e94faeece12 Kent Overstreet 2022-02-25  1643  out:
fa8e94faeece12 Kent Overstreet 2022-02-25  1644  err:
914f2786b89232 Kent Overstreet 2021-07-14  1645  fsck_err:
fa8e94faeece12 Kent Overstreet 2022-02-25  1646  	printbuf_exit(&buf);
914f2786b89232 Kent Overstreet 2021-07-14  1647  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1648  }
8a85b20cd757d9 Kent Overstreet 2021-04-06  1649  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
