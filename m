Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81D8F49
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771833578; cv=none; b=dBtC8lsYUFmi6MomHHmYFdUClDqkMpG4hEp69sZUbYeZBc/OrHjEB0hTvws6TM0ptSIFGBBTfHZOqXWfjoTJwEILMeyAgckafpw7co+DU3f8ydFzZSTTE9SJMv/9UFUDa1E8GQFqnz6KWZgvy7WgqLbP9YmT+xmgaGzTOAYgacs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771833578; c=relaxed/simple;
	bh=w9/p9ZiUPjVvM98kL+viquhtKS+2b0qEaaDKffUGO9Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lr2OlExVx3Zc+DSIY5zcbcdUF0TMeOE/KIg9849+AuyTbR2MBSrMsIM9ccGuwJgsV4u6AgBtTgQBcQypAEBj8aYAS7zEvIcOZrc3zGg1t8RFTsuIs/3TY2hsc8thofL4llw1KhEa4EyTZ2rSjkUe4f/fI4aZwAHGF8f8UrCPa/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9/jMK5m; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9/jMK5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771833576; x=1803369576;
  h=date:from:to:cc:subject:message-id;
  bh=w9/p9ZiUPjVvM98kL+viquhtKS+2b0qEaaDKffUGO9Y=;
  b=O9/jMK5mHNxGEygW/NDGyqAO/HgMWvg0DEdoJVg+THakoMWte7Z+y0Rk
   wmzc520hGVwH2QuDDYBy84SfDO0LfGgevOSl2/7ccn0WkMRJ3W8KZERDA
   qS2//k33T8UkF/7PcbaJAjn3DbXWSYadRD6lZO7XyGVNuS5dX48FBFokC
   5d0WTmEX9LI5vQYMJP52AI9SW4gOoiQ2Zl14qaxc016wmhDn2e4BHNvKi
   1AwEmxC3Iw3d96yn/jQ266xxZGhAxyMiX6OAWvd5+bGW1s/PBy80uug7b
   UlZhQ/VwsRPjiFNVhUJPxGwfcKwMRtIxE87wsJCQs6Xm91SA3/XFcVX8+
   g==;
X-CSE-ConnectionGUID: fTgX0UjTTgK7i+v82ma4Ow==
X-CSE-MsgGUID: t3VVGRKzTOy2quyIOaMrhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="60394103"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="60394103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 23:59:35 -0800
X-CSE-ConnectionGUID: DnUoJnSqR0+wZnPnkxwZNQ==
X-CSE-MsgGUID: u5YNxkE9Rq62G8eV71tClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="220024287"
Received: from lkp-server01.sh.intel.com (HELO f9d61316528f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2026 23:59:33 -0800
Received: from kbuild by f9d61316528f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuQqp-000000000Qn-24xJ;
	Mon, 23 Feb 2026 07:59:31 +0000
Date: Mon, 23 Feb 2026 15:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 404/405]
 fs/bcachefs/alloc/background.c:808 bch2_trigger_alloc() warn: check
 likely/unlikely parentheses
Message-ID: <202602231539.ZKOEtCIH-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ae4776b430164640cf80d5e1d5ff47862d951185
commit: 85cde1245a273a5b44dbb108f98d51c77468d730 [404/405] bcachefs: alloc trigger: convert BUG_ON to fsck_err for bucket going empty while not open
:::::: branch date: 2 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-r072-20260223 (https://download.01.org/0day-ci/archive/20260223/202602231539.ZKOEtCIH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602231539.ZKOEtCIH-lkp@intel.com/

smatch warnings:
fs/bcachefs/alloc/background.c:808 bch2_trigger_alloc() warn: check likely/unlikely parentheses

vim +808 fs/bcachefs/alloc/background.c

31e35a63fb6b49 fs/bcachefs/alloc/background.c Kent Overstreet   2025-11-09  770  
153d1c63c2aca9 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  771  int bch2_trigger_alloc(struct btree_trans *trans,
153d1c63c2aca9 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  772  		       enum btree_id btree, unsigned level,
717296c34c8d9d fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-27  773  		       struct bkey_s_c old, struct bkey_s new,
2d288745ebc202 fs/bcachefs/alloc_background.c Nathan Chancellor 2024-04-23  774  		       enum btree_iter_update_trigger_flags flags)
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  775  {
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  776  	struct bch_fs *c = trans->c;
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  777  	int ret = 0;
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  778  
82afb11ca4d03a fs/bcachefs/alloc_background.c Kent Overstreet   2025-07-14  779  	CLASS(bch2_dev_bucket_tryget, ca)(c, new.k->p);
a7f1c26f5907dd fs/bcachefs/alloc_background.c Kent Overstreet   2024-04-30  780  	if (!ca)
09b9c72bd4b77a fs/bcachefs/alloc_background.c Kent Overstreet   2025-05-28  781  		return bch_err_throw(c, trigger_alloc);
153d1c63c2aca9 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  782  
153d1c63c2aca9 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  783  	struct bch_alloc_v4 old_a_convert;
153d1c63c2aca9 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  784  	const struct bch_alloc_v4 *old_a = bch2_alloc_to_v4(old, &old_a_convert);
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  785  
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  786  	struct bch_alloc_v4 *new_a;
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  787  	if (likely(new.k->type == KEY_TYPE_alloc_v4)) {
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  788  		new_a = bkey_s_to_alloc_v4(new).v;
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  789  	} else {
e150a7e89c4727 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-18  790  		BUG_ON(!(flags & (BTREE_TRIGGER_gc|BTREE_TRIGGER_check_repair)));
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  791  
1793cc6db8c995 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  792  		struct bkey_i_alloc_v4 *new_ka =
1793cc6db8c995 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  793  			errptr_try(bch2_alloc_to_v4_mut_inlined(trans, new.s_c));
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  794  		new_a = &new_ka->v;
bd864bc2d90790 fs/bcachefs/alloc_background.c Kent Overstreet   2024-08-12  795  	}
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  796  
38ad9dc8c61944 fs/bcachefs/alloc_background.c Kent Overstreet   2024-05-29  797  	if (flags & BTREE_TRIGGER_transactional) {
fa9bb741fea117 fs/bcachefs/alloc_background.c Kent Overstreet   2024-04-30  798  		alloc_data_type_set(new_a, new_a->data_type);
822835ffeae411 fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-01  799  
be565740ee8479 fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-07  800  		int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
be565740ee8479 fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-07  801  				     (int) data_type_is_empty(old_a->data_type);
be565740ee8479 fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-07  802  
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  803  		if (is_empty_delta < 0 &&
7f4fe32ecd7430 fs/bcachefs/alloc/background.c Kent Overstreet   2026-01-23  804  		    (new_a->data_type != BCH_DATA_sb &&
7f4fe32ecd7430 fs/bcachefs/alloc/background.c Kent Overstreet   2026-01-23  805  		     new_a->data_type != BCH_DATA_journal) &&
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  806  		    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  807  			CLASS(printbuf, buf)();
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18 @808  			log_fsck_err_on(true, trans,
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  809  				alloc_key_bucket_nonempty_to_empty_not_open,
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  810  				"bucket %u:%llu going empty but not open\n%s",
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  811  				new.k->p.inode, new.k->p.offset,
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  812  				(bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf));
85cde1245a273a fs/bcachefs/alloc/background.c Kent Overstreet   2026-02-18  813  		}
7f4fe32ecd7430 fs/bcachefs/alloc/background.c Kent Overstreet   2026-01-23  814  
be565740ee8479 fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-07  815  		if (is_empty_delta < 0) {
cff07e2739d81c fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-17  816  			new_a->io_time[READ] = bch2_current_io_time(c, READ);
cff07e2739d81c fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-17  817  			new_a->io_time[WRITE]= bch2_current_io_time(c, WRITE);
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  818  			SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, true);
59cc38b8d43b52 fs/bcachefs/alloc_background.c Kent Overstreet   2022-02-10  819  			SET_BCH_ALLOC_V4_NEED_DISCARD(new_a, true);
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  820  		}
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  821  
822835ffeae411 fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-01  822  		if (data_type_is_empty(new_a->data_type) &&
822835ffeae411 fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-01  823  		    BCH_ALLOC_V4_NEED_INC_GEN(new_a) &&
717296c34c8d9d fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-27  824  		    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
69bd8a927702ce fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-07  825  			if (new_a->oldest_gen == new_a->gen &&
69bd8a927702ce fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-07  826  			    !bch2_bucket_sectors_total(*new_a))
69bd8a927702ce fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-07  827  				new_a->oldest_gen++;
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  828  			new_a->gen++;
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  829  			SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, false);
f648b6c12b70af fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-20  830  			alloc_data_type_set(new_a, new_a->data_type);
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  831  		}
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  832  
19a614d2e4beed fs/bcachefs/alloc_background.c Kent Overstreet   2023-01-30  833  		if (old_a->data_type != new_a->data_type ||
822835ffeae411 fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-01  834  		    (new_a->data_type == BCH_DATA_free &&
19a614d2e4beed fs/bcachefs/alloc_background.c Kent Overstreet   2023-01-30  835  		     alloc_freespace_genbits(*old_a) != alloc_freespace_genbits(*new_a))) {
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  836  			try(bch2_bucket_do_index(trans, ca, old, old_a, false));
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  837  			try(bch2_bucket_do_index(trans, ca, new.s_c, new_a, true));
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  838  		}
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  839  
7003589dabcdfd fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-10  840  		if (new_a->data_type == BCH_DATA_cached &&
7003589dabcdfd fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-10  841  		    !new_a->io_time[READ])
cff07e2739d81c fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-17  842  			new_a->io_time[READ] = bch2_current_io_time(c, READ);
7003589dabcdfd fs/bcachefs/alloc_background.c Kent Overstreet   2022-04-10  843  
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  844  		try(bch2_lru_change(trans, new.k->p.inode,
717296c34c8d9d fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-27  845  				    bucket_to_u64(new.k->p),
e1304967078c17 fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-10  846  				    alloc_lru_idx_read(*old_a),
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  847  				    alloc_lru_idx_read(*new_a)));
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  848  
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  849  		try(bch2_lru_change(trans,
b8e37c1645e963 fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-10  850  				    BCH_LRU_BUCKET_FRAGMENTATION,
717296c34c8d9d fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-27  851  				    bucket_to_u64(new.k->p),
e1304967078c17 fs/bcachefs/alloc_background.c Kent Overstreet   2025-02-10  852  				    alloc_lru_idx_fragmentation(*old_a, ca),
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  853  				    alloc_lru_idx_fragmentation(*new_a, ca)));
80c33085783656 fs/bcachefs/alloc_background.c Kent Overstreet   2022-12-05  854  
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  855  		if (old_a->gen != new_a->gen)
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  856  			try(bch2_bucket_gen_update(trans, new.k->p, new_a->gen));
5250b74d55e162 fs/bcachefs/alloc_background.c Kent Overstreet   2022-11-25  857  
3c16c1d9609b81 fs/bcachefs/alloc/background.c Kent Overstreet   2025-10-05  858  		try(bch2_alloc_key_to_dev_counters(trans, ca, old_a, new_a, flags));
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  859  	}
c6b2826cd14c54 fs/bcachefs/alloc_background.c Kent Overstreet   2021-12-11  860  
5dd8c60e1e0448 fs/bcachefs/alloc_background.c Kent Overstreet   2024-04-07  861  	if ((flags & BTREE_TRIGGER_atomic) && (flags & BTREE_TRIGGER_insert)) {
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  862  		u64 transaction_seq = trans->journal_res.seq;
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  863  		BUG_ON(!transaction_seq);
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  864  
31e35a63fb6b49 fs/bcachefs/alloc/background.c Kent Overstreet   2025-11-09  865  		CLASS(printbuf, buf)();
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  866  		if (log_fsck_err_on(transaction_seq && new_a->journal_seq_nonempty > transaction_seq,
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  867  				    trans, alloc_key_journal_seq_in_future,
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  868  				    "bucket journal seq in future (currently at %llu)\n%s",
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  869  				    journal_cur_seq(&c->journal),
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  870  				    (bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf)))
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  871  			new_a->journal_seq_nonempty = transaction_seq;
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  872  
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  873  		int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  874  				     (int) data_type_is_empty(old_a->data_type);
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  875  
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  876  		/*
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  877  		 * Record journal sequence number of empty -> nonempty transition:
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  878  		 * Note that there may be multiple empty -> nonempty
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  879  		 * transitions, data in a bucket may be overwritten while we're
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  880  		 * still writing to it - so be careful to only record the first:
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  881  		 * */
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  882  		if (is_empty_delta < 0 &&
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  883  		    new_a->journal_seq_empty <= c->journal.flushed_seq_ondisk) {
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  884  			new_a->journal_seq_nonempty	= transaction_seq;
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  885  			new_a->journal_seq_empty	= 0;
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  886  		}
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  887  
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  888  		/*
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  889  		 * Bucket becomes empty: mark it as waiting for a journal flush,
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  890  		 * unless updates since empty -> nonempty transition were never
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  891  		 * flushed - we may need to ask the journal not to flush
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  892  		 * intermediate sequence numbers:
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  893  		 */
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  894  		if (is_empty_delta > 0) {
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  895  			if (new_a->journal_seq_nonempty == transaction_seq ||
89e74eccab9248 fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-08  896  			    bch2_journal_noflush_seq(&c->journal,
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  897  						     new_a->journal_seq_nonempty,
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  898  						     transaction_seq)) {
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  899  				new_a->journal_seq_nonempty = new_a->journal_seq_empty = 0;
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  900  			} else {
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  901  				new_a->journal_seq_empty = transaction_seq;
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  902  
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  903  				ret = bch2_set_bucket_needs_journal_commit(&c->buckets_waiting_for_journal,
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  904  									   c->journal.flushed_seq_ondisk,
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  905  									   new.k->p.inode, new.k->p.offset,
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  906  									   transaction_seq);
38ad9dc8c61944 fs/bcachefs/alloc_background.c Kent Overstreet   2024-05-29  907  				if (bch2_fs_fatal_err_on(ret, c,
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  908  						"setting bucket_needs_journal_commit: %s",
9e779f3f24fbca fs/bcachefs/alloc_background.c Kent Overstreet   2024-12-06  909  						bch2_err_str(ret)))
82afb11ca4d03a fs/bcachefs/alloc_background.c Kent Overstreet   2025-07-14  910  					return ret;
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  911  			}
0eafe758ac440f fs/bcachefs/alloc_background.c Kent Overstreet   2024-11-28  912  		}
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  913  
9432e90df1b8a5 fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-06  914  		if (new_a->gen != old_a->gen) {
18dad454cd16cb fs/bcachefs/alloc_background.c Kent Overstreet   2025-05-24  915  			guard(rcu)();
9432e90df1b8a5 fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-06  916  			u8 *gen = bucket_gen(ca, new.k->p.offset);
18dad454cd16cb fs/bcachefs/alloc_background.c Kent Overstreet   2025-05-24  917  			if (unlikely(!gen))
31e35a63fb6b49 fs/bcachefs/alloc/background.c Kent Overstreet   2025-11-09  918  				return inval_bucket_key(trans, new.s_c);
9432e90df1b8a5 fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-06  919  			*gen = new_a->gen;
9432e90df1b8a5 fs/bcachefs/alloc_background.c Kent Overstreet   2024-06-06  920  		}
6820ac2cdc3095 fs/bcachefs/alloc_background.c Kent Overstreet   2023-12-28  921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
