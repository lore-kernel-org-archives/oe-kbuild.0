Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE534BA41
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345483; cv=none; b=jxGqb+93F+pgiZHu5Mv0h1BNI3cznpW9nIb5dxbW/DTN8NepOKOFn3ag1RovaTUw8lQK0hWsKmWLPFp80uJyau/m3UNlNRoYydAnXj+nWK+EVD4Yw01mOTMXPIgqs1VtqP+SETJjrirO8jJHZGuOkhkb4/hTn/2hi7JBrg0hGI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345483; c=relaxed/simple;
	bh=9TfdCkVs6glrvhM4ri5Kr6RZ7TMO3KDY+9hV2RI1J+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROBLpY+mP4j23idLg84Mk3kNgalRdiyhlS1D3w6uSnFflO+G2QYOmqzBQrQqS+P6v6EbvKdYiE/DxLxRngsdLE1Pac6jAs6Au1flHYTjB1Oh4c2kU08zQH+LQh3tCGlqJPLgRnD0t5AK04QtRhBQVWaHcm85r3YifLMA5eilgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SChLIf6S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SChLIf6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760345482; x=1791881482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9TfdCkVs6glrvhM4ri5Kr6RZ7TMO3KDY+9hV2RI1J+w=;
  b=SChLIf6Sf6nOJVuZ6SL3iahEz/DLuKnfUpSl4MatP07pKBs99zIhpW4g
   SwwNGzznTjo6yc5SAWBtjmFGe0JAGB6nSyokzOSf58B2gqBX30ShRni5h
   zbMyJwcoJKa0bBcnGTbA4KmAi1X+JRCS9ZWw6nAcD3hxztbPKyc36jQSH
   XqO7HnV3bmjzH0CRN8MOVmY2A9ysA/nF3gtyjzjq0w1klPVKYxCPUg+Iw
   A4n7qeRHt1KvL4dkyI0/di2R6Y6kV2IKTuq/ay56A/QC4ZjM5whLFaRYP
   Atk/xFvM3Y/762ludDkBBHxk3uCZQftfF+wkWL7Sl9YeGA1TzcJ5cLU1u
   A==;
X-CSE-ConnectionGUID: DThX5rSkTtu2C4Hi4U1ORg==
X-CSE-MsgGUID: zGNjPKlhSJu882TYqJ3MuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62513178"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62513178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 01:51:21 -0700
X-CSE-ConnectionGUID: BP1sQVF4Q8K+1p7c0IY0rQ==
X-CSE-MsgGUID: ygpayHQxS6KYYeynphL+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="185958557"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 01:51:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8EGz-0000HT-26;
	Mon, 13 Oct 2025 08:51:17 +0000
Date: Mon, 13 Oct 2025 16:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 458/578]
 fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk'
 dereferencing possible ERR_PTR()
Message-ID: <202510131654.1JCSV5ou-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a6d7792017723e708be5b200423839ca422a3565
commit: 0151e9a63908fe0c0e6f7393d8677b62bb3cb71c [458/578] bcachefs: move alloc files to subdir
:::::: branch date: 3 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131654.1JCSV5ou-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510131654.1JCSV5ou-lkp@intel.com/

smatch warnings:
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/backpointers.c:363 __bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'
fs/bcachefs/alloc/buckets.c:578 bch2_trans_account_disk_usage_change() error: we previously assumed 'trans->disk_res' could be null (see line 550)

vim +/jk +962 fs/bcachefs/alloc/accounting.c

f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   907  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   908  /*
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   909   * At startup time, initialize the in memory accounting from the btree (and
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   910   * journal)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   911   */
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   912  int bch2_accounting_read(struct bch_fs *c)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   913  {
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   914  	struct bch_accounting_mem *acc = &c->accounting;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   915  	CLASS(btree_trans, trans)(c);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   916  	CLASS(printbuf, buf)();
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   917  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   918  	/*
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   919  	 * We might run more than once if we rewind to start topology repair or
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   920  	 * btree node scan - and those might cause us to get different results,
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   921  	 * so we can't just skip if we've already run.
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   922  	 *
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   923  	 * Instead, zero out any accounting we have:
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   924  	 */
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   925  	scoped_guard(percpu_write, &c->mark_lock) {
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   926  		darray_for_each(acc->k, e)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   927  			percpu_memset(e->v[0], 0, sizeof(u64) * e->nr_counters);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   928  		for_each_member_device(c, ca)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   929  			percpu_memset(ca->usage, 0, sizeof(*ca->usage));
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   930  		percpu_memset(c->usage, 0, sizeof(*c->usage));
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   931  	}
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   932  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   933  	struct journal_keys *keys = &c->journal_keys;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   934  	struct journal_key *jk = keys->data;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   935  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   936  	move_gap(keys, keys->nr);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   937  
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   938  	/* Find the range of accounting keys from the journal: */
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   939  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   940  	while (jk < &darray_top(*keys) &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   941  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, POS_MIN, jk) > 0)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   942  		jk++;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   943  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   944  	struct journal_key *end = jk;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   945  	while (end < &darray_top(*keys) &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   946  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, SPOS_MAX, end) > 0)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   947  		end++;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   948  
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   949  	/*
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   950  	 * Iterate over btree and journal accounting simultaneously:
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   951  	 *
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   952  	 * We want to drop unneeded unneeded accounting deltas early - deltas
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   953  	 * that are older than the btree accounting key version, and once we've
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   954  	 * dropped old accounting deltas we can accumulate and compact deltas
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   955  	 * for the same key:
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   956  	 */
73f8c1c0fb45b79 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   957  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   958  	struct btree_iter iter;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   959  	bch2_trans_iter_init(trans, &iter, BTREE_ID_accounting, POS_MIN,
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   960  			     BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   961  	iter.flags &= ~BTREE_ITER_with_journal;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  @962  	int ret = for_each_btree_key_continue(trans, iter,
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   963  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots, k, ({
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   964  		if (k.k->type != KEY_TYPE_accounting)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   965  			continue;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   966  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   967  		while (jk < end &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   968  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) > 0)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   969  			jk = accumulate_and_read_journal_accounting(trans, jk);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   970  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   971  		while (jk < end &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   972  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0 &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   973  		       bversion_cmp(journal_key_k(c, jk)->k.bversion, k.k->bversion) <= 0) {
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   974  			jk->overwritten = true;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   975  			jk++;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   976  		}
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   977  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   978  		if (jk < end &&
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   979  		    __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   980  			jk = accumulate_and_read_journal_accounting(trans, jk);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   981  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   982  		struct disk_accounting_pos acc_k;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   983  		bpos_to_disk_accounting_pos(&acc_k, k.k->p);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   984  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   985  		if (acc_k.type >= BCH_DISK_ACCOUNTING_TYPE_NR)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   986  			break;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   987  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   988  		if (!bch2_accounting_is_mem(&acc_k)) {
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   989  			struct disk_accounting_pos next_acc;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   990  			memset(&next_acc, 0, sizeof(next_acc));
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   991  			next_acc.type = acc_k.type + 1;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   992  			struct bpos next = disk_accounting_pos_to_bpos(&next_acc);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   993  			if (jk < end)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   994  				next = bpos_min(next, journal_key_k(c, jk)->k.p);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   995  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   996  			/* for_each_btree_key() will still advance iterator: */
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   997  			bch2_btree_iter_set_pos(&iter, bpos_predecessor(next));
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   998  			continue;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   999  		}
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1000  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1001  		accounting_read_key(trans, k);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1002  	}));
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1003  	bch2_trans_iter_exit(&iter);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1004  	if (ret)
1d16c605cc55ef2 fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1005  		return ret;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1006  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1007  	while (jk < end)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1008  		jk = accumulate_and_read_journal_accounting(trans, jk);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1009  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1010  	bch2_trans_unlock(trans);
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1011  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1012  	struct journal_key *dst = keys->data;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1013  	darray_for_each(*keys, i)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1014  		if (!i->overwritten)
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1015  			*dst++ = *i;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1016  	keys->gap = keys->nr = dst - keys->data;
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1017  
f7a5616144447f3 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1018  	return accounting_read_mem_fixups(trans);
1d16c605cc55ef2 fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1019  }
1d16c605cc55ef2 fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1020  

:::::: The code at line 962 was first introduced by commit
:::::: f7a5616144447f39b56dbb9095530fbaaaa1601e bcachefs: accounting_read_mem_fixups()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
