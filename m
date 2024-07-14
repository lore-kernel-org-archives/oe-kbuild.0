Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A61843
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jul 2024 00:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720917537; cv=none; b=XgGFLWAljmLTKuhmnxTYszKNzPdU3unYBYHJDHbC4P4YHLZYjn11+1HAsAuqsplCdfjIsfi6M4MiZ8a6H06IbA7vZo30jJ08Aj7G1shtOcU4RHp9vrSCa8qAPZi+HtBcp130FDR63MhueM99biKAGDc/eIRIhp9wxUH9QTlTseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720917537; c=relaxed/simple;
	bh=I1yH3EYboVmh6XRVDnyLRhA5DSu9DbRQjEDtCWCuQ30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jx9XwIhoLzsDg5DdwrsqvOaplLObRkQGDgfgYl8cxeVp/8p9OSTjDKpdj6hsn2psF7HWHomane5LV1Sj8JQ4I2qZ8a/o3N5AMKzyMZc0EzP8bCE4+31lGru7PYcS1I2nnIlNaPERKOXSOIA9hBnZAVDa6eMX1JJ4M48/wEWzX9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSUs+S3Q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSUs+S3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720917536; x=1752453536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I1yH3EYboVmh6XRVDnyLRhA5DSu9DbRQjEDtCWCuQ30=;
  b=bSUs+S3QqX0yZbEcgSfO1tPAZpAqWhn8RVNxwQENhCGzhZWHCodmHpWo
   D1CMisznD2VdZbcCuY1aAhhncIxHCtIo1L+I9hT+Lg+PpM9epYmpWKHCx
   XN8r2YvSBbm0e7VpJ879lTJU81idQWXNsN8uBo/0Ghw9O49qVzaWtsGxz
   UCzSdbldBAxaLVx89VfMjIB8bX4e9YPT+EvOW6VoAIupaOrowKdiY2Szu
   fZPiaQJQWOJSnbw0A88mCXnNYNngF1zsWAvcSZ17M9B7WC/CsTYbbk6M6
   xxXUFJLwk80MSJVHb8knaqWQ0odRd9NAx0qqmH3Oy5zC2H26VDm37AO3h
   g==;
X-CSE-ConnectionGUID: V8t2qH1wQHGe0emtqcBpiQ==
X-CSE-MsgGUID: S+X8xp8BRPePfBTRntMMNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="29723009"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="29723009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 17:38:55 -0700
X-CSE-ConnectionGUID: mN45VNsOTHSaU4YIbHdNPw==
X-CSE-MsgGUID: auUImvnQRqOAClZnUe/aog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="49141679"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2024 17:38:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSnGM-000csw-1g;
	Sun, 14 Jul 2024 00:38:50 +0000
Date: Sun, 14 Jul 2024 08:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rw-ubifs:next 11/18] fs/ubifs/journal.c:1574 ubifs_jnl_rename()
 error: we previously assumed 'whiteout' could be null (see line 1551)
Message-ID: <202407140807.GYQB56ub-lkp@intel.com>
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
TO: Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
head:   054fd15984454f031611d6c63675fc578aad0cb1
commit: 3af2d3a8c56fe7dc24f60c4df0ab85b7ac941902 [11/18] ubifs: Fix unattached inode when powercut happens in creating
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20240714 (https://download.01.org/0day-ci/archive/20240714/202407140807.GYQB56ub-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407140807.GYQB56ub-lkp@intel.com/

smatch warnings:
fs/ubifs/journal.c:1574 ubifs_jnl_rename() error: we previously assumed 'whiteout' could be null (see line 1551)

vim +/whiteout +1574 fs/ubifs/journal.c

9ec64962afb170 Richard Weinberger 2016-09-14  1330  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1331  /**
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1332   * ubifs_jnl_rename - rename a directory entry.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1333   * @c: UBIFS file-system description object
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1334   * @old_dir: parent inode of directory entry to rename
415c94532ebb28 Yang Li            2022-06-02  1335   * @old_inode: directory entry's inode to rename
415c94532ebb28 Yang Li            2022-06-02  1336   * @old_nm: name of the old directory entry to rename
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1337   * @new_dir: parent inode of directory entry to rename
415c94532ebb28 Yang Li            2022-06-02  1338   * @new_inode: new directory entry's inode (or directory entry's inode to
415c94532ebb28 Yang Li            2022-06-02  1339   *		replace)
415c94532ebb28 Yang Li            2022-06-02  1340   * @new_nm: new name of the new directory entry
415c94532ebb28 Yang Li            2022-06-02  1341   * @whiteout: whiteout inode
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1342   * @sync: non-zero if the write-buffer has to be synchronized
3af2d3a8c56fe7 Zhihao Cheng       2024-04-10  1343   * @delete_orphan: indicates an orphan entry deletion for @whiteout
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1344   *
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1345   * This function implements the re-name operation which may involve writing up
278d9a243635f2 Zhihao Cheng       2021-12-27  1346   * to 4 inodes(new inode, whiteout inode, old and new parent directory inodes)
278d9a243635f2 Zhihao Cheng       2021-12-27  1347   * and 2 directory entries. It marks the written inodes as clean and returns
278d9a243635f2 Zhihao Cheng       2021-12-27  1348   * zero on success. In case of failure, a negative error code is returned.
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1349   */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1350  int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1351  		     const struct inode *old_inode,
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1352  		     const struct fscrypt_name *old_nm,
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1353  		     const struct inode *new_dir,
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1354  		     const struct inode *new_inode,
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1355  		     const struct fscrypt_name *new_nm,
3af2d3a8c56fe7 Zhihao Cheng       2024-04-10  1356  		     const struct inode *whiteout, int sync, int delete_orphan)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1357  {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1358  	void *p;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1359  	union ubifs_key key;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1360  	struct ubifs_dent_node *dent, *dent2;
278d9a243635f2 Zhihao Cheng       2021-12-27  1361  	int err, dlen1, dlen2, ilen, wlen, lnum, offs, len, orphan_added = 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1362  	int aligned_dlen1, aligned_dlen2, plen = UBIFS_INO_NODE_SZ;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1363  	int last_reference = !!(new_inode && new_inode->i_nlink == 0);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1364  	int move = (old_dir != new_dir);
278d9a243635f2 Zhihao Cheng       2021-12-27  1365  	struct ubifs_inode *new_ui, *whiteout_ui;
823838a486888c Sascha Hauer       2018-09-07  1366  	u8 hash_old_dir[UBIFS_HASH_ARR_SZ];
823838a486888c Sascha Hauer       2018-09-07  1367  	u8 hash_new_dir[UBIFS_HASH_ARR_SZ];
823838a486888c Sascha Hauer       2018-09-07  1368  	u8 hash_new_inode[UBIFS_HASH_ARR_SZ];
278d9a243635f2 Zhihao Cheng       2021-12-27  1369  	u8 hash_whiteout_inode[UBIFS_HASH_ARR_SZ];
823838a486888c Sascha Hauer       2018-09-07  1370  	u8 hash_dent1[UBIFS_HASH_ARR_SZ];
823838a486888c Sascha Hauer       2018-09-07  1371  	u8 hash_dent2[UBIFS_HASH_ARR_SZ];
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1372  
6eb61d587f4515 Richard Weinberger 2018-07-12  1373  	ubifs_assert(c, ubifs_inode(old_dir)->data_len == 0);
6eb61d587f4515 Richard Weinberger 2018-07-12  1374  	ubifs_assert(c, ubifs_inode(new_dir)->data_len == 0);
6eb61d587f4515 Richard Weinberger 2018-07-12  1375  	ubifs_assert(c, mutex_is_locked(&ubifs_inode(old_dir)->ui_mutex));
6eb61d587f4515 Richard Weinberger 2018-07-12  1376  	ubifs_assert(c, mutex_is_locked(&ubifs_inode(new_dir)->ui_mutex));
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1377  
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1378  	dlen1 = UBIFS_DENT_NODE_SZ + fname_len(new_nm) + 1;
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1379  	dlen2 = UBIFS_DENT_NODE_SZ + fname_len(old_nm) + 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1380  	if (new_inode) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1381  		new_ui = ubifs_inode(new_inode);
6eb61d587f4515 Richard Weinberger 2018-07-12  1382  		ubifs_assert(c, mutex_is_locked(&new_ui->ui_mutex));
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1383  		ilen = UBIFS_INO_NODE_SZ;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1384  		if (!last_reference)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1385  			ilen += new_ui->data_len;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1386  	} else
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1387  		ilen = 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1388  
278d9a243635f2 Zhihao Cheng       2021-12-27  1389  	if (whiteout) {
278d9a243635f2 Zhihao Cheng       2021-12-27  1390  		whiteout_ui = ubifs_inode(whiteout);
278d9a243635f2 Zhihao Cheng       2021-12-27  1391  		ubifs_assert(c, mutex_is_locked(&whiteout_ui->ui_mutex));
278d9a243635f2 Zhihao Cheng       2021-12-27  1392  		ubifs_assert(c, whiteout->i_nlink == 1);
278d9a243635f2 Zhihao Cheng       2021-12-27  1393  		ubifs_assert(c, !whiteout_ui->dirty);
278d9a243635f2 Zhihao Cheng       2021-12-27  1394  		wlen = UBIFS_INO_NODE_SZ;
278d9a243635f2 Zhihao Cheng       2021-12-27  1395  		wlen += whiteout_ui->data_len;
278d9a243635f2 Zhihao Cheng       2021-12-27  1396  	} else
278d9a243635f2 Zhihao Cheng       2021-12-27  1397  		wlen = 0;
278d9a243635f2 Zhihao Cheng       2021-12-27  1398  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1399  	aligned_dlen1 = ALIGN(dlen1, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1400  	aligned_dlen2 = ALIGN(dlen2, 8);
278d9a243635f2 Zhihao Cheng       2021-12-27  1401  	len = aligned_dlen1 + aligned_dlen2 + ALIGN(ilen, 8) +
278d9a243635f2 Zhihao Cheng       2021-12-27  1402  	      ALIGN(wlen, 8) + ALIGN(plen, 8);
1e039533886765 Richard Weinberger 2016-09-14  1403  	if (move)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1404  		len += plen;
6a98bc4614de8f Sascha Hauer       2018-09-07  1405  
6a98bc4614de8f Sascha Hauer       2018-09-07  1406  	len += ubifs_auth_node_sz(c);
6a98bc4614de8f Sascha Hauer       2018-09-07  1407  
4acadda74ff8b9 Richard Weinberger 2017-06-16  1408  	dent = kzalloc(len, GFP_NOFS);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1409  	if (!dent)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1410  		return -ENOMEM;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1411  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1412  	/* Make reservation before allocating sequence numbers */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1413  	err = make_reservation(c, BASEHD, len);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1414  	if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1415  		goto out_free;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1416  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1417  	/* Make new dent */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1418  	dent->ch.node_type = UBIFS_DENT_NODE;
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1419  	dent_key_init_flash(c, &dent->key, new_dir->i_ino, new_nm);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1420  	dent->inum = cpu_to_le64(old_inode->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1421  	dent->type = get_dent_type(old_inode->i_mode);
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1422  	dent->nlen = cpu_to_le16(fname_len(new_nm));
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1423  	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1424  	dent->name[fname_len(new_nm)] = '\0';
d63d61c16972c6 Richard Weinberger 2016-10-19  1425  	set_dent_cookie(c, dent);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1426  	zero_dent_node_unused(dent);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1427  	ubifs_prep_grp_node(c, dent, dlen1, 0);
823838a486888c Sascha Hauer       2018-09-07  1428  	err = ubifs_node_calc_hash(c, dent, hash_dent1);
823838a486888c Sascha Hauer       2018-09-07  1429  	if (err)
823838a486888c Sascha Hauer       2018-09-07  1430  		goto out_release;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1431  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1432  	dent2 = (void *)dent + aligned_dlen1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1433  	dent2->ch.node_type = UBIFS_DENT_NODE;
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1434  	dent_key_init_flash(c, &dent2->key, old_dir->i_ino, old_nm);
9e0a1fff8db56e Richard Weinberger 2016-09-14  1435  
9e0a1fff8db56e Richard Weinberger 2016-09-14  1436  	if (whiteout) {
9e0a1fff8db56e Richard Weinberger 2016-09-14  1437  		dent2->inum = cpu_to_le64(whiteout->i_ino);
9e0a1fff8db56e Richard Weinberger 2016-09-14  1438  		dent2->type = get_dent_type(whiteout->i_mode);
9e0a1fff8db56e Richard Weinberger 2016-09-14  1439  	} else {
9e0a1fff8db56e Richard Weinberger 2016-09-14  1440  		/* Make deletion dent */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1441  		dent2->inum = 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1442  		dent2->type = DT_UNKNOWN;
9e0a1fff8db56e Richard Weinberger 2016-09-14  1443  	}
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1444  	dent2->nlen = cpu_to_le16(fname_len(old_nm));
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1445  	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1446  	dent2->name[fname_len(old_nm)] = '\0';
d63d61c16972c6 Richard Weinberger 2016-10-19  1447  	set_dent_cookie(c, dent2);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1448  	zero_dent_node_unused(dent2);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1449  	ubifs_prep_grp_node(c, dent2, dlen2, 0);
823838a486888c Sascha Hauer       2018-09-07  1450  	err = ubifs_node_calc_hash(c, dent2, hash_dent2);
823838a486888c Sascha Hauer       2018-09-07  1451  	if (err)
823838a486888c Sascha Hauer       2018-09-07  1452  		goto out_release;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1453  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1454  	p = (void *)dent2 + aligned_dlen2;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1455  	if (new_inode) {
fd6c6b51e36779 Artem Bityutskiy   2008-07-22  1456  		pack_inode(c, p, new_inode, 0);
823838a486888c Sascha Hauer       2018-09-07  1457  		err = ubifs_node_calc_hash(c, p, hash_new_inode);
823838a486888c Sascha Hauer       2018-09-07  1458  		if (err)
823838a486888c Sascha Hauer       2018-09-07  1459  			goto out_release;
823838a486888c Sascha Hauer       2018-09-07  1460  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1461  		p += ALIGN(ilen, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1462  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1463  
278d9a243635f2 Zhihao Cheng       2021-12-27  1464  	if (whiteout) {
278d9a243635f2 Zhihao Cheng       2021-12-27  1465  		pack_inode(c, p, whiteout, 0);
278d9a243635f2 Zhihao Cheng       2021-12-27  1466  		err = ubifs_node_calc_hash(c, p, hash_whiteout_inode);
278d9a243635f2 Zhihao Cheng       2021-12-27  1467  		if (err)
278d9a243635f2 Zhihao Cheng       2021-12-27  1468  			goto out_release;
278d9a243635f2 Zhihao Cheng       2021-12-27  1469  
278d9a243635f2 Zhihao Cheng       2021-12-27  1470  		p += ALIGN(wlen, 8);
278d9a243635f2 Zhihao Cheng       2021-12-27  1471  	}
278d9a243635f2 Zhihao Cheng       2021-12-27  1472  
823838a486888c Sascha Hauer       2018-09-07  1473  	if (!move) {
fd6c6b51e36779 Artem Bityutskiy   2008-07-22  1474  		pack_inode(c, p, old_dir, 1);
823838a486888c Sascha Hauer       2018-09-07  1475  		err = ubifs_node_calc_hash(c, p, hash_old_dir);
823838a486888c Sascha Hauer       2018-09-07  1476  		if (err)
823838a486888c Sascha Hauer       2018-09-07  1477  			goto out_release;
823838a486888c Sascha Hauer       2018-09-07  1478  	} else {
fd6c6b51e36779 Artem Bityutskiy   2008-07-22  1479  		pack_inode(c, p, old_dir, 0);
823838a486888c Sascha Hauer       2018-09-07  1480  		err = ubifs_node_calc_hash(c, p, hash_old_dir);
823838a486888c Sascha Hauer       2018-09-07  1481  		if (err)
823838a486888c Sascha Hauer       2018-09-07  1482  			goto out_release;
823838a486888c Sascha Hauer       2018-09-07  1483  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1484  		p += ALIGN(plen, 8);
fd6c6b51e36779 Artem Bityutskiy   2008-07-22  1485  		pack_inode(c, p, new_dir, 1);
823838a486888c Sascha Hauer       2018-09-07  1486  		err = ubifs_node_calc_hash(c, p, hash_new_dir);
823838a486888c Sascha Hauer       2018-09-07  1487  		if (err)
823838a486888c Sascha Hauer       2018-09-07  1488  			goto out_release;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1489  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1490  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1491  	if (last_reference) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1492  		err = ubifs_add_orphan(c, new_inode->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1493  		if (err) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1494  			release_head(c, BASEHD);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1495  			goto out_finish;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1496  		}
de94eb558b5428 Artem Bityutskiy   2008-07-22  1497  		new_ui->del_cmtno = c->cmt_no;
094b6d1295474f Zhihao Cheng       2020-07-07  1498  		orphan_added = 1;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1499  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1500  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1501  	err = write_head(c, BASEHD, dent, len, &lnum, &offs, sync);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1502  	if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1503  		goto out_release;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1504  	if (!sync) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1505  		struct ubifs_wbuf *wbuf = &c->jheads[BASEHD].wbuf;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1506  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1507  		ubifs_wbuf_add_ino_nolock(wbuf, new_dir->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1508  		ubifs_wbuf_add_ino_nolock(wbuf, old_dir->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1509  		if (new_inode)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1510  			ubifs_wbuf_add_ino_nolock(&c->jheads[BASEHD].wbuf,
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1511  						  new_inode->i_ino);
278d9a243635f2 Zhihao Cheng       2021-12-27  1512  		if (whiteout)
278d9a243635f2 Zhihao Cheng       2021-12-27  1513  			ubifs_wbuf_add_ino_nolock(&c->jheads[BASEHD].wbuf,
278d9a243635f2 Zhihao Cheng       2021-12-27  1514  						  whiteout->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1515  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1516  	release_head(c, BASEHD);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1517  
6a98bc4614de8f Sascha Hauer       2018-09-07  1518  	ubifs_add_auth_dirt(c, lnum);
6a98bc4614de8f Sascha Hauer       2018-09-07  1519  
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1520  	dent_key_init(c, &key, new_dir->i_ino, new_nm);
823838a486888c Sascha Hauer       2018-09-07  1521  	err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen1, hash_dent1, new_nm);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1522  	if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1523  		goto out_ro;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1524  
9e0a1fff8db56e Richard Weinberger 2016-09-14  1525  	offs += aligned_dlen1;
9e0a1fff8db56e Richard Weinberger 2016-09-14  1526  	if (whiteout) {
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1527  		dent_key_init(c, &key, old_dir->i_ino, old_nm);
823838a486888c Sascha Hauer       2018-09-07  1528  		err = ubifs_tnc_add_nm(c, &key, lnum, offs, dlen2, hash_dent2, old_nm);
9e0a1fff8db56e Richard Weinberger 2016-09-14  1529  		if (err)
9e0a1fff8db56e Richard Weinberger 2016-09-14  1530  			goto out_ro;
9e0a1fff8db56e Richard Weinberger 2016-09-14  1531  	} else {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1532  		err = ubifs_add_dirt(c, lnum, dlen2);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1533  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1534  			goto out_ro;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1535  
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1536  		dent_key_init(c, &key, old_dir->i_ino, old_nm);
f4f61d2cc6d878 Richard Weinberger 2016-11-11  1537  		err = ubifs_tnc_remove_nm(c, &key, old_nm);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1538  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1539  			goto out_ro;
9e0a1fff8db56e Richard Weinberger 2016-09-14  1540  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1541  
9e0a1fff8db56e Richard Weinberger 2016-09-14  1542  	offs += aligned_dlen2;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1543  	if (new_inode) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1544  		ino_key_init(c, &key, new_inode->i_ino);
823838a486888c Sascha Hauer       2018-09-07  1545  		err = ubifs_tnc_add(c, &key, lnum, offs, ilen, hash_new_inode);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1546  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1547  			goto out_ro;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1548  		offs += ALIGN(ilen, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1549  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1550  
278d9a243635f2 Zhihao Cheng       2021-12-27 @1551  	if (whiteout) {
278d9a243635f2 Zhihao Cheng       2021-12-27  1552  		ino_key_init(c, &key, whiteout->i_ino);
278d9a243635f2 Zhihao Cheng       2021-12-27  1553  		err = ubifs_tnc_add(c, &key, lnum, offs, wlen,
278d9a243635f2 Zhihao Cheng       2021-12-27  1554  				    hash_whiteout_inode);
278d9a243635f2 Zhihao Cheng       2021-12-27  1555  		if (err)
278d9a243635f2 Zhihao Cheng       2021-12-27  1556  			goto out_ro;
278d9a243635f2 Zhihao Cheng       2021-12-27  1557  		offs += ALIGN(wlen, 8);
278d9a243635f2 Zhihao Cheng       2021-12-27  1558  	}
278d9a243635f2 Zhihao Cheng       2021-12-27  1559  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1560  	ino_key_init(c, &key, old_dir->i_ino);
823838a486888c Sascha Hauer       2018-09-07  1561  	err = ubifs_tnc_add(c, &key, lnum, offs, plen, hash_old_dir);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1562  	if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1563  		goto out_ro;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1564  
1e039533886765 Richard Weinberger 2016-09-14  1565  	if (move) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1566  		offs += ALIGN(plen, 8);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1567  		ino_key_init(c, &key, new_dir->i_ino);
823838a486888c Sascha Hauer       2018-09-07  1568  		err = ubifs_tnc_add(c, &key, lnum, offs, plen, hash_new_dir);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1569  		if (err)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1570  			goto out_ro;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1571  	}
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1572  
3af2d3a8c56fe7 Zhihao Cheng       2024-04-10  1573  	if (delete_orphan)
3af2d3a8c56fe7 Zhihao Cheng       2024-04-10 @1574  		ubifs_delete_orphan(c, whiteout->i_ino);
3af2d3a8c56fe7 Zhihao Cheng       2024-04-10  1575  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1576  	finish_reservation(c);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1577  	if (new_inode) {
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1578  		mark_inode_clean(c, new_ui);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1579  		spin_lock(&new_ui->ui_lock);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1580  		new_ui->synced_i_size = new_ui->ui_size;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1581  		spin_unlock(&new_ui->ui_lock);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1582  	}
278d9a243635f2 Zhihao Cheng       2021-12-27  1583  	/*
278d9a243635f2 Zhihao Cheng       2021-12-27  1584  	 * No need to mark whiteout inode clean.
278d9a243635f2 Zhihao Cheng       2021-12-27  1585  	 * Whiteout doesn't have non-zero size, no need to update
278d9a243635f2 Zhihao Cheng       2021-12-27  1586  	 * synced_i_size for whiteout_ui.
278d9a243635f2 Zhihao Cheng       2021-12-27  1587  	 */
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1588  	mark_inode_clean(c, ubifs_inode(old_dir));
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1589  	if (move)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1590  		mark_inode_clean(c, ubifs_inode(new_dir));
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1591  	kfree(dent);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1592  	return 0;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1593  
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1594  out_release:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1595  	release_head(c, BASEHD);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1596  out_ro:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1597  	ubifs_ro_mode(c, err);
094b6d1295474f Zhihao Cheng       2020-07-07  1598  	if (orphan_added)
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1599  		ubifs_delete_orphan(c, new_inode->i_ino);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1600  out_finish:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1601  	finish_reservation(c);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1602  out_free:
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1603  	kfree(dent);
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1604  	return err;
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1605  }
1e51764a3c2ac0 Artem Bityutskiy   2008-07-14  1606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
