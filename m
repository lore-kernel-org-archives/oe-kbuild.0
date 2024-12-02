Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894501A0726
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156794; cv=none; b=KCY4VpuZTzMcgdae46+ghFHR1HFsfBKMMuqX6z8gzH19y01pQJhy6vB6LuS4339+C2neXnQM5GYg+RRMFVs5wIj0WFROO0VqKg5yZSRTrdPTVLH2byqIG26vlhEh5oED0Jpva6Tb28+rUPFMaKeY1f+njPCxXoXDx+rWh/eK5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156794; c=relaxed/simple;
	bh=hjUWT02YvGzr5i72fN1xQQJWp02bffd8Y8OGkh2quzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rBMczc0fTrEHm3fYw3/jj09T8ehpYR5Zm3wx04F42hHworfRNrD+XwH2uhuOlrLWu0UO/QwNXM5dimO9hmZDRxJlVNRX+PncocTwmCUrOA0KwTDCqqGyKRwiCtzr9HQ75Ql4VEAeifaNnewi5tTV6ViFZEapKHQMka7KKLDyVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfRYeTo3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfRYeTo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733156793; x=1764692793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjUWT02YvGzr5i72fN1xQQJWp02bffd8Y8OGkh2quzg=;
  b=ZfRYeTo3zdeUS4Q73mx7qT7pr3WUTEd7zzkQFRqmZ5g/Bjo6pugYdqZx
   7JKGGiKxj5ur3xbCGlNscbDq9oGoNUEC769IfhlwfJRW6iqPAcKwbcKp8
   A594wyXVjcCRKQ5NMqBQQYkeMzY7VrPuFtxmq4dq+wLnQ7Kx/+Hna3X1z
   qm7GEek4mYbjzS9sgiNY4WxRRdIANOkm+TxeYAufvy+L+mlkx5Om2Wi9X
   LohHBx9MlPCZHwe7JKeVD+uv3EDQJGGBX5zcR8YYStbL5JX97Zf7mY3mW
   tivoes9fpBzHzb+dRjtf9Vakqq47ibZ7oNjvecNR3BsIm1f+dNSA2XkHZ
   w==;
X-CSE-ConnectionGUID: 6QV+kesIQNO6+LnX/H3vUQ==
X-CSE-MsgGUID: 4BholVYBTxW/2jk4iOL3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33260897"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33260897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 08:26:31 -0800
X-CSE-ConnectionGUID: R8R5tvQsQ/6nMf0hoKSqmQ==
X-CSE-MsgGUID: X6AZUsuKT6KTAh+JpA8oZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="97223888"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 08:26:30 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI9FM-0002av-1M;
	Mon, 02 Dec 2024 16:26:09 +0000
Date: Tue, 3 Dec 2024 00:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 173/173] fs/bcachefs/inode.c:931
 bch2_inode_create() error: uninitialized symbol 'start'.
Message-ID: <202412030007.Zkc9PGnl-lkp@intel.com>
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
head:   a6c90193bc06c071ac00989791a284cf94def0e5
commit: a6c90193bc06c071ac00989791a284cf94def0e5 [173/173] bcachefs: bcachefs_metadata_version_persistent_inode_cursors
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20241202 (https://download.01.org/0day-ci/archive/20241203/202412030007.Zkc9PGnl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412030007.Zkc9PGnl-lkp@intel.com/

smatch warnings:
fs/bcachefs/inode.c:931 bch2_inode_create() error: uninitialized symbol 'start'.

vim +/start +931 fs/bcachefs/inode.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  883  
6fed42bb7750e2 Kent Overstreet 2021-03-16  884  /*
6fed42bb7750e2 Kent Overstreet 2021-03-16  885   * This just finds an empty slot:
6fed42bb7750e2 Kent Overstreet 2021-03-16  886   */
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  887  int bch2_inode_create(struct btree_trans *trans,
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  888  		      struct btree_iter *iter,
e6ae27272491af Kent Overstreet 2021-03-15  889  		      struct bch_inode_unpacked *inode_u,
bff796ae6539b5 Kent Overstreet 2021-05-28  890  		      u32 snapshot, u64 cpu)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  891  {
45e4dcba79401d Kent Overstreet 2020-10-27  892  	struct bch_fs *c = trans->c;
8b53852d0a80ec Kent Overstreet 2020-02-18  893  	struct bkey_s_c k;
a6c90193bc06c0 Kent Overstreet 2024-12-01  894  	u64 min, max, start, pos;
d125615a4e2219 Dan Robertson   2021-05-14  895  	int ret = 0;
b282a74faebc94 Kent Overstreet 2021-05-27  896  	unsigned bits = (c->opts.inodes_32bit ? 31 : 63);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  897  
a6c90193bc06c0 Kent Overstreet 2024-12-01  898  	u64 cursor_idx = c->opts.shard_inode_numbers ? cpu : 0;
a6c90193bc06c0 Kent Overstreet 2024-12-01  899  
b282a74faebc94 Kent Overstreet 2021-05-27  900  	if (c->opts.shard_inode_numbers) {
b282a74faebc94 Kent Overstreet 2021-05-27  901  		bits -= c->inode_shard_bits;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  902  
b5e8a6992fb119 Kent Overstreet 2020-11-02  903  		min = (cpu << bits);
b5e8a6992fb119 Kent Overstreet 2020-11-02  904  		max = (cpu << bits) | ~(ULLONG_MAX << bits);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  905  
b5e8a6992fb119 Kent Overstreet 2020-11-02  906  		min = max_t(u64, min, BLOCKDEV_INODE_MAX);
b282a74faebc94 Kent Overstreet 2021-05-27  907  	} else {
b282a74faebc94 Kent Overstreet 2021-05-27  908  		min = BLOCKDEV_INODE_MAX;
b282a74faebc94 Kent Overstreet 2021-05-27  909  		max = ~(ULLONG_MAX << bits);
b282a74faebc94 Kent Overstreet 2021-05-27  910  	}
45e4dcba79401d Kent Overstreet 2020-10-27  911  
a6c90193bc06c0 Kent Overstreet 2024-12-01  912  	struct btree_iter cursor_iter;
a6c90193bc06c0 Kent Overstreet 2024-12-01  913  	struct bkey_s_c cursor_k = bch2_bkey_get_iter(trans, &cursor_iter,
a6c90193bc06c0 Kent Overstreet 2024-12-01  914  					BTREE_ID_logged_ops,
a6c90193bc06c0 Kent Overstreet 2024-12-01  915  					POS(LOGGED_OPS_INUM_inode_cursors, cursor_idx),
a6c90193bc06c0 Kent Overstreet 2024-12-01  916  					BTREE_ITER_cached);
a6c90193bc06c0 Kent Overstreet 2024-12-01  917  	ret = bkey_err(cursor_k);
a6c90193bc06c0 Kent Overstreet 2024-12-01  918  	if (ret)
a6c90193bc06c0 Kent Overstreet 2024-12-01  919  		return ret;
a6c90193bc06c0 Kent Overstreet 2024-12-01  920  
a6c90193bc06c0 Kent Overstreet 2024-12-01  921  	struct bkey_i_inode_alloc_cursor *cursor =
a6c90193bc06c0 Kent Overstreet 2024-12-01  922  		bch2_bkey_alloc(trans, &cursor_iter, 0, inode_alloc_cursor);
a6c90193bc06c0 Kent Overstreet 2024-12-01  923  	ret = PTR_ERR_OR_ZERO(cursor);
a6c90193bc06c0 Kent Overstreet 2024-12-01  924  	if (ret)
a6c90193bc06c0 Kent Overstreet 2024-12-01  925  		goto cursor_err;
a6c90193bc06c0 Kent Overstreet 2024-12-01  926  
a6c90193bc06c0 Kent Overstreet 2024-12-01  927  	if (cursor_k.k->type == KEY_TYPE_inode_alloc_cursor) {
a6c90193bc06c0 Kent Overstreet 2024-12-01  928  		cursor->v.idx = bkey_s_c_to_inode_alloc_cursor(cursor_k).v->idx;
a6c90193bc06c0 Kent Overstreet 2024-12-01  929  		cursor->v.gen = bkey_s_c_to_inode_alloc_cursor(cursor_k).v->gen;
a6c90193bc06c0 Kent Overstreet 2024-12-01  930  	} else {
a6c90193bc06c0 Kent Overstreet 2024-12-01 @931  		cursor->v.idx = start;
a6c90193bc06c0 Kent Overstreet 2024-12-01  932  		cursor->v.gen = 0;
a6c90193bc06c0 Kent Overstreet 2024-12-01  933  	}
a6c90193bc06c0 Kent Overstreet 2024-12-01  934  
a6c90193bc06c0 Kent Overstreet 2024-12-01  935  	bch2_trans_iter_exit(trans, &cursor_iter);
b5e8a6992fb119 Kent Overstreet 2020-11-02  936  
a6c90193bc06c0 Kent Overstreet 2024-12-01  937  	if (le64_to_cpu(cursor->v.idx)  < min)
a6c90193bc06c0 Kent Overstreet 2024-12-01  938  		cursor->v.idx = cpu_to_le64(min);
a6c90193bc06c0 Kent Overstreet 2024-12-01  939  
a6c90193bc06c0 Kent Overstreet 2024-12-01  940  	if (le64_to_cpu(cursor->v.idx) >= max) {
a6c90193bc06c0 Kent Overstreet 2024-12-01  941  		cursor->v.idx = cpu_to_le64(min);
a6c90193bc06c0 Kent Overstreet 2024-12-01  942  		le64_add_cpu(&cursor->v.gen, 1);
a6c90193bc06c0 Kent Overstreet 2024-12-01  943  	}
a6c90193bc06c0 Kent Overstreet 2024-12-01  944  
a6c90193bc06c0 Kent Overstreet 2024-12-01  945  	pos = start = le64_to_cpu(cursor->v.idx);
e6ae27272491af Kent Overstreet 2021-03-15  946  
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  947  	bch2_trans_iter_init(trans, iter, BTREE_ID_inodes, POS(0, pos),
5dd8c60e1e0448 Kent Overstreet 2024-04-07  948  			     BTREE_ITER_all_snapshots|
5dd8c60e1e0448 Kent Overstreet 2024-04-07  949  			     BTREE_ITER_intent);
b5e8a6992fb119 Kent Overstreet 2020-11-02  950  again:
e6ae27272491af Kent Overstreet 2021-03-15  951  	while ((k = bch2_btree_iter_peek(iter)).k &&
e6ae27272491af Kent Overstreet 2021-03-15  952  	       !(ret = bkey_err(k)) &&
e88a75ebe86c1d Kent Overstreet 2022-11-24  953  	       bkey_lt(k.k->p, POS(0, max))) {
63a2edce9487b1 Kent Overstreet 2023-01-09  954  		if (pos < iter->pos.offset)
e6ae27272491af Kent Overstreet 2021-03-15  955  			goto found_slot;
e6ae27272491af Kent Overstreet 2021-03-15  956  
b5e8a6992fb119 Kent Overstreet 2020-11-02  957  		/*
e6ae27272491af Kent Overstreet 2021-03-15  958  		 * We don't need to iterate over keys in every snapshot once
e6ae27272491af Kent Overstreet 2021-03-15  959  		 * we've found just one:
b5e8a6992fb119 Kent Overstreet 2020-11-02  960  		 */
e6ae27272491af Kent Overstreet 2021-03-15  961  		pos = iter->pos.offset + 1;
e6ae27272491af Kent Overstreet 2021-03-15  962  		bch2_btree_iter_set_pos(iter, POS(0, pos));
e6ae27272491af Kent Overstreet 2021-03-15  963  	}
e6ae27272491af Kent Overstreet 2021-03-15  964  
63a2edce9487b1 Kent Overstreet 2023-01-09  965  	if (!ret && pos < max)
b5e8a6992fb119 Kent Overstreet 2020-11-02  966  		goto found_slot;
e6ae27272491af Kent Overstreet 2021-03-15  967  
e6ae27272491af Kent Overstreet 2021-03-15  968  	if (!ret && start == min)
098ef98d5bff46 Kent Overstreet 2022-09-18  969  		ret = -BCH_ERR_ENOSPC_inode_create;
45e4dcba79401d Kent Overstreet 2020-10-27  970  
e6ae27272491af Kent Overstreet 2021-03-15  971  	if (ret) {
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  972  		bch2_trans_iter_exit(trans, iter);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  973  		return ret;
e6ae27272491af Kent Overstreet 2021-03-15  974  	}
45e4dcba79401d Kent Overstreet 2020-10-27  975  
b5e8a6992fb119 Kent Overstreet 2020-11-02  976  	/* Retry from start */
e6ae27272491af Kent Overstreet 2021-03-15  977  	pos = start = min;
e6ae27272491af Kent Overstreet 2021-03-15  978  	bch2_btree_iter_set_pos(iter, POS(0, pos));
a6c90193bc06c0 Kent Overstreet 2024-12-01  979  	le64_add_cpu(&cursor->v.gen, 1);
b5e8a6992fb119 Kent Overstreet 2020-11-02  980  	goto again;
e6ae27272491af Kent Overstreet 2021-03-15  981  found_slot:
e6ae27272491af Kent Overstreet 2021-03-15  982  	bch2_btree_iter_set_pos(iter, SPOS(0, pos, snapshot));
e6ae27272491af Kent Overstreet 2021-03-15  983  	k = bch2_btree_iter_peek_slot(iter);
e6ae27272491af Kent Overstreet 2021-03-15  984  	ret = bkey_err(k);
e6ae27272491af Kent Overstreet 2021-03-15  985  	if (ret) {
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  986  		bch2_trans_iter_exit(trans, iter);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  987  		return ret;
b5e8a6992fb119 Kent Overstreet 2020-11-02  988  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  989  
b5e8a6992fb119 Kent Overstreet 2020-11-02  990  	inode_u->bi_inum	= k.k->p.offset;
a6c90193bc06c0 Kent Overstreet 2024-12-01  991  	inode_u->bi_generation	= le64_to_cpu(cursor->v.gen);
a6c90193bc06c0 Kent Overstreet 2024-12-01  992  	cursor->v.idx		= cpu_to_le64(k.k->p.offset + 1);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  993  	return 0;
a6c90193bc06c0 Kent Overstreet 2024-12-01  994  cursor_err:
a6c90193bc06c0 Kent Overstreet 2024-12-01  995  	bch2_trans_iter_exit(trans, &cursor_iter);
a6c90193bc06c0 Kent Overstreet 2024-12-01  996  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  997  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
