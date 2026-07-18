Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C45333F59E
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365198; cv=none; b=gJMMGIgW7eXIhbo00qYGEM5REahyUkfvikCVJeAnN799Cq49dVMiusyVM+cQ0gdLtHwt0RxjA1I9MSJoXuk92XuYACuEplTHJcNNndMruRuplvLigKGRJjKf/pn1SzT3MpTe5Ia6k9XFmK6BB8pQPL3sZvjAtWJNOwTHes/qV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365198; c=relaxed/simple;
	bh=gwQ1WhWkBGNn7yKusHyrs9F3hwQjS7zyOnFK2/nyhQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VuWbtT86J5s/b9PqT/r0WYrmsPJwnIPaWyCPs7N8YnPdvGNDNn60ZAm5m0QFTQat2JlKd9lbAfCDdg2+zal9i+fKQvek0qaDrDma/3cn2W4gZK1qc0Z2MwXdVbTV5CZ/E+WmN9IhHSLV5AGiiYlyAVe5o8HnE3+eE3P4p6oNjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJXZc9aM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJXZc9aM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784365196; x=1815901196;
  h=date:from:to:cc:subject:message-id;
  bh=gwQ1WhWkBGNn7yKusHyrs9F3hwQjS7zyOnFK2/nyhQo=;
  b=SJXZc9aM4IjeO0ZMZWGudhDUjE2S+uk6AOA19Qvuvj8w6IJbnCyo5o+6
   Or30rYluQnKa90i9AWymRvm7iGHTME0G3IYHgR7EJg4qV0/7cUgDf9stH
   O+X0j/X1uVT46/d2GphLMYr035IYIaUSwTKKZbJIYeRwJArm6p3XM8ujA
   04Mn6fV0Cmh/rzyuHR6viImW5J6mWPd0lAPW6jVwZuNuGq/1Zloh7OCq3
   Jz+DLITH7Ywe9X6ANazFvhD+W1NamasR7zHJ89FRInfsbq6v27pxpbzx2
   fKn59DKR25e6DH9ZQ9AKQ1BCe8rkZyn0HxpT5koTzraojEHoukT7ViNro
   A==;
X-CSE-ConnectionGUID: 3Oybd1MBTmSfhsUjwtfMSw==
X-CSE-MsgGUID: EKwL9gyAQrCdP2X3hY87MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87563084"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="87563084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 01:59:55 -0700
X-CSE-ConnectionGUID: 05+gVyRSSZCXMEoYLdVvhA==
X-CSE-MsgGUID: dQzHJa9bSe+8Ko/Zj3tmNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250635365"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jul 2026 01:59:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0tg-00000000Tbb-1NeV;
	Sat, 18 Jul 2026 08:59:49 +0000
Date: Sat, 18 Jul 2026 16:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 775/1155] fs/bcachefs/btree/commit.c:201
 bch2_btree_bset_insert_key() error: we previously assumed 'k' could be null
 (see line 185)
Message-ID: <202607181606.ilJULMPE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 29a3ec38abe9847fa4a636aa9f6c5da6cab3b8d8 [775/1155] bcachefs: bch2_btree_bset_insert_key(): kill gotos
:::::: branch date: 9 weeks ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260718/202607181606.ilJULMPE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607181606.ilJULMPE-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/commit.c:201 bch2_btree_bset_insert_key() error: we previously assumed 'k' could be null (see line 185)

vim +/k +201 fs/bcachefs/btree/commit.c

1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  157  
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  158  /* Handle overwrites and do insert, for non extents: */
9f6bd30703a32c fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-08-24  159  bool bch2_btree_bset_insert_key(struct btree_trans *trans,
67e0dd8f0d8b4b fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-08-30  160  				struct btree_path *path,
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  161  				struct btree *b,
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  162  				struct btree_node_iter *node_iter,
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  163  				struct bkey_i *insert)
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  164  {
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  165  	EBUG_ON(btree_node_just_written(b));
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  166  	EBUG_ON(bset_written(b, btree_bset_last(b)));
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  167  	EBUG_ON(bkey_deleted(&insert->k) && bkey_val_u64s(&insert->k));
e88a75ebe86c1d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-11-24  168  	EBUG_ON(bpos_lt(insert->k.p, b->data->min_key));
e88a75ebe86c1d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2022-11-24  169  	EBUG_ON(bpos_gt(insert->k.p, b->data->max_key));
ec4edd7b9d2038 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-01-16  170  	EBUG_ON(insert->k.u64s > bch2_btree_keys_u64s_remaining(b));
da525760802b9f fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-08-21  171  	EBUG_ON(!b->c.level && !bpos_eq(insert->k.p, path->pos));
28aa859b6b422d fs/bcachefs/btree_trans_commit.c Kent Overstreet 2025-03-20  172  	kmsan_check_memory(insert, bkey_bytes(&insert->k));
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  173  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  174  	struct bkey_packed *k = bch2_btree_node_iter_peek_all(node_iter, b);
811d2bcd85a826 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-11-07  175  	if (k && bkey_cmp_left_packed(b, k, &insert->k.p))
ae54c4539b3cf8 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-06  176  		k = NULL;
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  177  
ae54c4539b3cf8 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-06  178  	/* @k is the key being overwritten/deleted, if any: */
c052cf82f3d66a fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-02-19  179  	EBUG_ON(k && bkey_deleted(k));
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  180  
fdf224003354fb fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-30  181  	/* Deleting, but not found? nothing to do: */
c052cf82f3d66a fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2021-02-19  182  	if (bkey_deleted(&insert->k) && !k)
ae54c4539b3cf8 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-06  183  		return false;
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  184  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31 @185  	if (k) {
ae54c4539b3cf8 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-06  186  		btree_account_key_drop(b, k);
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  187  		k->type = KEY_TYPE_deleted;
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  188  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  189  		if (k->needs_whiteout) {
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  190  			if (bkey_deleted(&insert->k))
ec4edd7b9d2038 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2024-01-16  191  				push_whiteout(b, insert->k.p);
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  192  			else
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  193  				insert->k.needs_whiteout = true;
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  194  			k->needs_whiteout = false;
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  195  		}
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  196  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  197  		if (k < btree_bset_last(b)->start)
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  198  			bch2_btree_path_fix_key_modified(trans, b, k);
ae54c4539b3cf8 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-06  199  	}
c9bebae65eade6 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2019-11-29  200  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31 @201  	unsigned clobber_u64s = k >= btree_bset_last(b)->start ? k->u64s : 0;
f2e8c69fcb63d2 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-05  202  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  203  	if (bkey_deleted(&insert->k)) {
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  204  		if (k >= btree_bset_last(b)->start)
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  205  			bch2_bset_delete(b, k, clobber_u64s);
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  206  	} else {
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  207  		if (k < btree_bset_last(b)->start)
216c9facfd7568 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2018-08-11  208  			k = bch2_btree_node_iter_bset_pos(node_iter, b, bset_tree_last(b));
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  209  
5935bf3341b82b fs/bcachefs/btree_trans_commit.c Alan Huang      2024-08-14  210  		bch2_bset_insert(b, k, insert, clobber_u64s);
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  211  	}
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  212  
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  213  	unsigned new_u64s = !bkey_deleted(&insert->k) ? k->u64s : 0;
fdf224003354fb fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2020-01-30  214  	if (clobber_u64s != new_u64s)
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  215  		bch2_btree_node_iter_fix(trans, path, b, node_iter, k, clobber_u64s, new_u64s);
29a3ec38abe984 fs/bcachefs/btree/commit.c       Kent Overstreet 2025-10-31  216  
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  217  	return true;
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  218  }
1c6fdbd8f2465d fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2017-03-16  219  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
