Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D32EB5AF
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759148507; cv=none; b=qXasfZxeLoymwV1FIaewqKFXT3BjuuVR2FklEu4p8oUKRufuq9q3bSDmcK9szhqJ17fRv/djk9DjKE34+wNd01m9shDud2/MOJmiXSfYn1LSZiyNjuZLccySElM6U5MB9pjQbNH/adNq9h7EnwMdK/L1x78bw/7lgO9uPNwHRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759148507; c=relaxed/simple;
	bh=HdEMLMZbmdaYzwmyHya11/Uk7tGsr7s6NZjOfLTSYmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0VhYI3JVkbYoXHU972T3ehqV8u7Oj+r5kQkHeZEoykLY6P144GdsGB/sKIdyKfFLUcbR74RnoykQ24R7w4k5TlLczUWQ9c0vApcEZZtKqPJpJf39XmO/z18hLNVyzbxtUzTMrIPGZRjTYClgTjvSrHzWmGYEZmVymntbofHZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lch2K+Oi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lch2K+Oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759148505; x=1790684505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdEMLMZbmdaYzwmyHya11/Uk7tGsr7s6NZjOfLTSYmA=;
  b=Lch2K+OivPBuHfaLaZkJ3OWiFuwtDpZFOgsQLId9u8YgaWjZNkJmvp5C
   CAe/B44TxQ8uWK0NDEufzDzXpw7t41WPZquIB8HzMtZ3tZq2Y3qvo+I74
   PWvcdy5DTjAkWBbCWQsOTmzJFtjsyEQVLfmC4M1gEO1P4V0uD5VbVBEpy
   3+wKJMB0r0qRSYWPJPvotTPWUsMqaH0hS9+vRQqfQEkeCqM2IIIcXgpyp
   72yYbkj7qbWC51AOGL3k+c7EH2VfuFDYBDa2fP1VkWMG2MAAj2sZr7atz
   kqgwrSHl2mTl8ZFMxBT39Zk7RRpkjfwpAP2LzMS3WolKaaA3Cmh+x7twS
   A==;
X-CSE-ConnectionGUID: y6z9rEIYTw2WUadi9WN/FA==
X-CSE-MsgGUID: DmaksRYAT4WRsLzJ/yMLUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72066080"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="72066080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 05:21:44 -0700
X-CSE-ConnectionGUID: zGgcWSXGT6ibTvwALSC03w==
X-CSE-MsgGUID: l+qWUgmDSjy8nMSM9EedoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="183412777"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2025 05:21:42 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Cst-0000FY-36;
	Mon, 29 Sep 2025 12:21:39 +0000
Date: Mon, 29 Sep 2025 20:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 421/456] fs/bcachefs/io_write.c:1488
 bch2_nocow_write() warn: statement has no effect 'class_printbuf_t'
Message-ID: <202509292017.YbSv8cnF-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   65e84e043df56f6f627de9d13a62516230d724ba
commit: 5a0ea9850f9f94bdd10f39f9f075b144f8708bb2 [421/456] bcachefs: Convert nocow write path to new nocow locking helpers
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250929 (https://download.01.org/0day-ci/archive/20250929/202509292017.YbSv8cnF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509292017.YbSv8cnF-lkp@intel.com/

New smatch warnings:
fs/bcachefs/io_write.c:1488 bch2_nocow_write() warn: statement has no effect 'class_printbuf_t'
fs/bcachefs/io_write.c:1488 bch2_nocow_write() warn: statement has no effect 'class_printbuf_t'

Old smatch warnings:
fs/bcachefs/io_write.c:769 bch2_write_endio() error: we previously assumed 'ca' could be null (see line 751)
fs/bcachefs/io_write.c:952 bch2_write_prep_encoded_data() warn: missing unwind goto?

vim +/class_printbuf_t +1488 fs/bcachefs/io_write.c

7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1344  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1345  static void bch2_nocow_write(struct bch_write_op *op)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1346  {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1347  	struct bch_fs *c = op->c;
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1348  	struct btree_trans *trans;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1349  	struct btree_iter iter;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1350  	struct bkey_s_c k;
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1351  	struct bkey_ptrs_c ptrs;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1352  	u32 snapshot;
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1353  	const struct bch_extent_ptr *stale_at;
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1354  	int stale, ret;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1355  
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1356  	if (op->flags & BCH_WRITE_move)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1357  		return;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1358  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1359  	trans = bch2_trans_get(c);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1360  retry:
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1361  	bch2_trans_begin(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1362  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1363  	ret = bch2_subvolume_get_snapshot(trans, op->subvol, &snapshot);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1364  	if (unlikely(ret))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1365  		goto err;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1366  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1367  	bch2_trans_iter_init(trans, &iter, BTREE_ID_extents,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1368  			     SPOS(op->pos.inode, op->pos.offset, snapshot),
5dd8c60e1e0448 fs/bcachefs/io_write.c Kent Overstreet 2024-04-07  1369  			     BTREE_ITER_slots);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1370  	while (1) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1371  		struct bio *bio = &op->wbio.bio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1372  
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1373  		ret = bch2_trans_relock(trans);
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1374  		if (ret)
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1375  			break;
ca563dccb2f0fb fs/bcachefs/io_write.c Kent Overstreet 2024-04-09  1376  
f68e453b6c94c5 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1377  		k = bch2_btree_iter_peek_slot(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1378  		ret = bkey_err(k);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1379  		if (ret)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1380  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1381  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1382  		/* fall back to normal cow write path? */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1383  		if (unlikely(k.k->p.snapshot != snapshot ||
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1384  			     !bch2_extent_is_writeable(op, k)))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1385  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1386  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1387  		if (bch2_keylist_realloc(&op->insert_keys,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1388  					 op->inline_keys,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1389  					 ARRAY_SIZE(op->inline_keys),
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1390  					 k.k->u64s))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1391  			break;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1392  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1393  		/* Get iorefs before dropping btree locks: */
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1394  		ptrs = bch2_bkey_ptrs_c(k);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1395  		if (!bkey_get_dev_iorefs(c, ptrs))
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1396  			goto out;
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  1397  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1398  		/* Unlock before taking nocow locks, doing IO: */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1399  		bkey_reassemble(op->insert_keys.top, k);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1400  		k = bkey_i_to_s_c(op->insert_keys.top);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1401  		ptrs = bch2_bkey_ptrs_c(k);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1402  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  1403  		bch2_trans_unlock(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1404  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1405  		bch2_bkey_nocow_lock(c, ptrs, BUCKET_NOCOW_LOCK_UPDATE);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1406  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1407  		/*
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1408  		 * This could be handled better: If we're able to trylock the
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1409  		 * nocow locks with btree locks held we know dirty pointers
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1410  		 * can't be stale
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1411  		 */
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1412  		bkey_for_each_ptr(ptrs, ptr) {
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1413  			struct bch_dev *ca = bch2_dev_have_ref(c, ptr->dev);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1414  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1415  			int gen = bucket_gen_get(ca, PTR_BUCKET_NR(ca, ptr));
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1416  			stale = gen < 0 ? gen : gen_after(gen, ptr->gen);
d9534cc9fc4552 fs/bcachefs/io_write.c Kent Overstreet 2023-12-30  1417  			if (unlikely(stale)) {
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1418  				stale_at = ptr;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1419  				goto err_bucket_stale;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1420  			}
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1421  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1422  			if (ptr->unwritten)
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1423  				op->flags |= BCH_WRITE_convert_unwritten;
d9534cc9fc4552 fs/bcachefs/io_write.c Kent Overstreet 2023-12-30  1424  		}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1425  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1426  		bch2_cut_front(op->pos, op->insert_keys.top);
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1427  		if (op->flags & BCH_WRITE_convert_unwritten)
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1428  			bch2_cut_back(POS(op->pos.inode, op->pos.offset + bio_sectors(bio)), op->insert_keys.top);
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1429  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1430  		bio = &op->wbio.bio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1431  		if (k.k->p.offset < op->pos.offset + bio_sectors(bio)) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1432  			bio = bio_split(bio, k.k->p.offset - op->pos.offset,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1433  					GFP_KERNEL, &c->bio_write);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1434  			wbio_init(bio)->put_bio = true;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1435  			bio->bi_opf = op->wbio.bio.bi_opf;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1436  		} else {
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1437  			op->flags |= BCH_WRITE_submitted;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1438  		}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1439  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1440  		op->pos.offset += bio_sectors(bio);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1441  		op->written += bio_sectors(bio);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1442  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1443  		bio->bi_end_io	= bch2_write_endio;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1444  		bio->bi_private	= &op->cl;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1445  		bio->bi_opf |= REQ_OP_WRITE;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1446  		closure_get(&op->cl);
5a06cb8000addb fs/bcachefs/io_write.c Kent Overstreet 2025-03-08  1447  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1448  		bch2_submit_wbio_replicas(to_wbio(bio), c, BCH_DATA_user,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1449  					  op->insert_keys.top, true);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1450  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1451  		bch2_keylist_push(&op->insert_keys);
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1452  		if (op->flags & BCH_WRITE_submitted)
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1453  			break;
f68e453b6c94c5 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1454  		bch2_btree_iter_advance(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1455  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1456  out:
363832bfd5fd98 fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  1457  	bch2_trans_iter_exit(&iter);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1458  err:
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1459  	if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1460  		goto retry;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1461  
097cc9d0d60a36 fs/bcachefs/io_write.c Kent Overstreet 2024-11-13  1462  	bch2_trans_put(trans);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1463  	if (ret) {
2fe208303a1140 fs/bcachefs/io_write.c Kent Overstreet 2025-03-20  1464  		bch2_write_op_error(op, op->pos.offset,
1ccbcd32057727 fs/bcachefs/io_write.c Kent Overstreet 2025-02-10  1465  				    "%s(): btree lookup error: %s", __func__, bch2_err_str(ret));
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1466  		op->error = ret;
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1467  		op->flags |= BCH_WRITE_submitted;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1468  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1469  
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1470  	/* fallback to cow write path? */
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1471  	if (!(op->flags & BCH_WRITE_submitted)) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1472  		closure_sync(&op->cl);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1473  		__bch2_nocow_write_done(op);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1474  		op->insert_keys.top = op->insert_keys.keys;
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  1475  	} else if (op->flags & BCH_WRITE_sync) {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1476  		closure_sync(&op->cl);
d4e3b928ab487a fs/bcachefs/io_write.c Kent Overstreet 2023-11-17  1477  		bch2_nocow_write_done(&op->cl.work);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1478  	} else {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1479  		/*
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1480  		 * XXX
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1481  		 * needs to run out of process context because ei_quota_lock is
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1482  		 * a mutex
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1483  		 */
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1484  		continue_at(&op->cl, bch2_nocow_write_done, index_update_wq(op));
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1485  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1486  	return;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1487  err_bucket_stale:
eb957f411913ae fs/bcachefs/io_write.c Kent Overstreet 2025-07-14 @1488  	CLASS(printbuf, buf)();
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1489  	if (bch2_fs_inconsistent_on(stale < 0, c,
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1490  				    "pointer to invalid bucket in nocow path on device %u\n  %s",
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1491  				    stale_at->dev,
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1492  				    (bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
09b9c72bd4b77a fs/bcachefs/io_write.c Kent Overstreet 2025-05-28  1493  		ret = bch_err_throw(c, data_write_invalid_ptr);
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1494  	} else {
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1495  		/* We can retry this: */
09b9c72bd4b77a fs/bcachefs/io_write.c Kent Overstreet 2025-05-28  1496  		ret = bch_err_throw(c, transaction_restart);
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1497  	}
9432e90df1b8a5 fs/bcachefs/io_write.c Kent Overstreet 2024-06-06  1498  
5a0ea9850f9f94 fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1499  	bch2_bkey_nocow_unlock(c, k, BUCKET_NOCOW_LOCK_UPDATE);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1500  	bkey_for_each_ptr(ptrs, ptr)
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1501  		enumerated_ref_put(&bch2_dev_have_ref(c, ptr->dev)->io_ref[WRITE],
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1502  				   BCH_DEV_WRITE_REF_io_write);
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1503  
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1504  	/* Fall back to COW path: */
7de858ab9f5e9d fs/bcachefs/io_write.c Kent Overstreet 2025-09-23  1505  	goto out;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1506  }
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  1507  

:::::: The code at line 1488 was first introduced by commit
:::::: eb957f411913ae99722b1abd265038ed280a2b1b bcachefs: convert io_write.c to CLASS/guards

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
