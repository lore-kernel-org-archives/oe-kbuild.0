Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A22C18A
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Sep 2025 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927980; cv=none; b=W9gNvxPIbY4BtDk36Fio2Sqblwx8YRKvXCTu6o6Xbns6BrQ7KqdkzEzgSyvoLZ+LraLrI3MLCZXuQnjOEAuKTboOlLaD64kzewfcVgn6YVCapWLuro1yn+kvHow7Mp3rldTS3sxudu61jtHt7LomEcf8D847Za0aAkckm3/1dEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927980; c=relaxed/simple;
	bh=HzrwCZGvnrEN2G4CJmjqydYSKJxCwfDv0hLh/lZMPSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l12LimloeB8gzdKSlNshdlNdfi6riIFnwAd47DriggUxwnk2T8fmy+1CeIL3Sz6fJqqv3hBFZdzxOzKUoQtJ8ug4lrLUgV8x7tsdhYal6nTi4/UnmyGR0axnmvCkGGesFIdt+CSCeo1oEpqWkpW6OxvK37hSjgZOsQ7Nii3LIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URkoYh5b; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URkoYh5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756927978; x=1788463978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzrwCZGvnrEN2G4CJmjqydYSKJxCwfDv0hLh/lZMPSA=;
  b=URkoYh5ba6atcc/tBe+HhwfWDGUOEbPpnCLrKRl3nE2gvvY1hmGFujBl
   0kzlLj/Io5mlBzilZeQV3/QNVUMJlgLb8hfuaqOJ9fuwewXu4ohqIDvXU
   AWJNXCSqAq3nuUm8AM2S6Ckoc+10cWaQ+8SxDeaY5li0oYKpagfZ7cw/h
   VcorxL94C/7g4KXPhO+IMIDASn/xeR7/qft8L2i2eq/hFa3j7cgH43c3e
   NUJS1IsU5hDsKbMZRuC3Vp1nEbVczVSt+/4oQhEvXbZx21C+/Zswdi8Zd
   m4DOTtU9EIwcSu79vpnhTR0+MfkroFgXOT7vklRSICdaVDeiuFWEwrVsY
   Q==;
X-CSE-ConnectionGUID: 1DGOP0xETx2vByYHAOxU0w==
X-CSE-MsgGUID: sklkJCyISYCNQR9tg4Y+1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81840338"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81840338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 12:32:57 -0700
X-CSE-ConnectionGUID: ZLHLIJx3TOeonj1F0fRaqQ==
X-CSE-MsgGUID: T9pJHra2S8WioPFt2XYpNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172517120"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 12:32:55 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uttDx-0004MF-2H;
	Wed, 03 Sep 2025 19:32:53 +0000
Date: Thu, 4 Sep 2025 03:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:master 316/326]
 fs/bcachefs/disk_accounting.c:825 bch2_accounting_read() error: 'jk'
 dereferencing possible ERR_PTR()
Message-ID: <202509040318.UUrzWqU1-lkp@intel.com>
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

tree:   https://github.com/koverstreet/bcachefs master
head:   6252e100fc2e2fb6365a5ad0f97af127ff6c8988
commit: df5f65b22b65397733a97582834bb63e24c7af3d [316/326] bcachefs: BCH_FSCK_ERR_accounting_key_version_out_of_order
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250903 (https://download.01.org/0day-ci/archive/20250904/202509040318.UUrzWqU1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509040318.UUrzWqU1-lkp@intel.com/

smatch warnings:
fs/bcachefs/disk_accounting.c:825 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/disk_accounting.c:825 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()

vim +/jk +825 fs/bcachefs/disk_accounting.c

8ca7de6205503d Kent Overstreet 2025-08-14  783  
1d16c605cc55ef Kent Overstreet 2023-11-09  784  /*
1d16c605cc55ef Kent Overstreet 2023-11-09  785   * At startup time, initialize the in memory accounting from the btree (and
1d16c605cc55ef Kent Overstreet 2023-11-09  786   * journal)
1d16c605cc55ef Kent Overstreet 2023-11-09  787   */
1d16c605cc55ef Kent Overstreet 2023-11-09  788  int bch2_accounting_read(struct bch_fs *c)
1d16c605cc55ef Kent Overstreet 2023-11-09  789  {
2574e95a8b78ef Kent Overstreet 2024-06-06  790  	struct bch_accounting_mem *acc = &c->accounting;
a64ded7ab87bde Kent Overstreet 2025-07-14  791  	CLASS(btree_trans, trans)(c);
a64ded7ab87bde Kent Overstreet 2025-07-14  792  	CLASS(printbuf, buf)();
1d16c605cc55ef Kent Overstreet 2023-11-09  793  
b71d89bd7b1fbe Kent Overstreet 2024-11-24  794  	/*
b71d89bd7b1fbe Kent Overstreet 2024-11-24  795  	 * We might run more than once if we rewind to start topology repair or
b71d89bd7b1fbe Kent Overstreet 2024-11-24  796  	 * btree node scan - and those might cause us to get different results,
b71d89bd7b1fbe Kent Overstreet 2024-11-24  797  	 * so we can't just skip if we've already run.
b71d89bd7b1fbe Kent Overstreet 2024-11-24  798  	 *
b71d89bd7b1fbe Kent Overstreet 2024-11-24  799  	 * Instead, zero out any accounting we have:
b71d89bd7b1fbe Kent Overstreet 2024-11-24  800  	 */
a64ded7ab87bde Kent Overstreet 2025-07-14  801  	scoped_guard(percpu_write, &c->mark_lock) {
b71d89bd7b1fbe Kent Overstreet 2024-11-24  802  		darray_for_each(acc->k, e)
b71d89bd7b1fbe Kent Overstreet 2024-11-24  803  			percpu_memset(e->v[0], 0, sizeof(u64) * e->nr_counters);
b71d89bd7b1fbe Kent Overstreet 2024-11-24  804  		for_each_member_device(c, ca)
b71d89bd7b1fbe Kent Overstreet 2024-11-24  805  			percpu_memset(ca->usage, 0, sizeof(*ca->usage));
b71d89bd7b1fbe Kent Overstreet 2024-11-24  806  		percpu_memset(c->usage, 0, sizeof(*c->usage));
a64ded7ab87bde Kent Overstreet 2025-07-14  807  	}
b71d89bd7b1fbe Kent Overstreet 2024-11-24  808  
8ca7de6205503d Kent Overstreet 2025-08-14  809  	struct journal_keys *keys = &c->journal_keys;
8ca7de6205503d Kent Overstreet 2025-08-14  810  	struct journal_key *jk = keys->data;
8ca7de6205503d Kent Overstreet 2025-08-14  811  
8ca7de6205503d Kent Overstreet 2025-08-14  812  	while (jk < &darray_top(*keys) &&
8ca7de6205503d Kent Overstreet 2025-08-14  813  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, POS_MIN, jk) > 0)
8ca7de6205503d Kent Overstreet 2025-08-14  814  		jk++;
8ca7de6205503d Kent Overstreet 2025-08-14  815  
8ca7de6205503d Kent Overstreet 2025-08-14  816  	struct journal_key *end = jk;
8ca7de6205503d Kent Overstreet 2025-08-14  817  	while (end < &darray_top(*keys) &&
8ca7de6205503d Kent Overstreet 2025-08-14  818  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, SPOS_MAX, end) > 0)
8ca7de6205503d Kent Overstreet 2025-08-14  819  		end++;
8ca7de6205503d Kent Overstreet 2025-08-14  820  
ba9752e5f43637 Kent Overstreet 2024-11-29  821  	struct btree_iter iter;
ba9752e5f43637 Kent Overstreet 2024-11-29  822  	bch2_trans_iter_init(trans, &iter, BTREE_ID_accounting, POS_MIN,
ba9752e5f43637 Kent Overstreet 2024-11-29  823  			     BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
ba9752e5f43637 Kent Overstreet 2024-11-29  824  	iter.flags &= ~BTREE_ITER_with_journal;
ba9752e5f43637 Kent Overstreet 2024-11-29 @825  	int ret = for_each_btree_key_continue(trans, iter,
1d16c605cc55ef Kent Overstreet 2023-11-09  826  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots, k, ({
1d16c605cc55ef Kent Overstreet 2023-11-09  827  		struct bkey u;
1d16c605cc55ef Kent Overstreet 2023-11-09  828  		struct bkey_s_c k = bch2_btree_path_peek_slot_exact(btree_iter_path(trans, &iter), &u);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  829  
44a43cf9fdccc3 Kent Overstreet 2024-12-05  830  		if (k.k->type != KEY_TYPE_accounting)
44a43cf9fdccc3 Kent Overstreet 2024-12-05  831  			continue;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  832  
8ca7de6205503d Kent Overstreet 2025-08-14  833  		while (jk < end &&
8ca7de6205503d Kent Overstreet 2025-08-14  834  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) > 0)
8ca7de6205503d Kent Overstreet 2025-08-14  835  			jk = accumulate_and_read_journal_accounting(trans, jk);
8ca7de6205503d Kent Overstreet 2025-08-14  836  
8ca7de6205503d Kent Overstreet 2025-08-14  837  		while (jk < end &&
8ca7de6205503d Kent Overstreet 2025-08-14  838  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0 &&
8ca7de6205503d Kent Overstreet 2025-08-14  839  		       bversion_cmp(journal_key_k(c, jk)->k.bversion, k.k->bversion) <= 0) {
8ca7de6205503d Kent Overstreet 2025-08-14  840  			jk->overwritten = true;
8ca7de6205503d Kent Overstreet 2025-08-14  841  			jk++;
8ca7de6205503d Kent Overstreet 2025-08-14  842  		}
8ca7de6205503d Kent Overstreet 2025-08-14  843  
8ca7de6205503d Kent Overstreet 2025-08-14  844  		if (jk < end &&
8ca7de6205503d Kent Overstreet 2025-08-14  845  		    __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0)
8ca7de6205503d Kent Overstreet 2025-08-14  846  			jk = accumulate_and_read_journal_accounting(trans, jk);
8ca7de6205503d Kent Overstreet 2025-08-14  847  
44a43cf9fdccc3 Kent Overstreet 2024-12-05  848  		struct disk_accounting_pos acc_k;
44a43cf9fdccc3 Kent Overstreet 2024-12-05  849  		bpos_to_disk_accounting_pos(&acc_k, k.k->p);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  850  
ba9752e5f43637 Kent Overstreet 2024-11-29  851  		if (acc_k.type >= BCH_DISK_ACCOUNTING_TYPE_NR)
ba9752e5f43637 Kent Overstreet 2024-11-29  852  			break;
ba9752e5f43637 Kent Overstreet 2024-11-29  853  
62095464e9d2a2 Kent Overstreet 2025-04-17  854  		if (!bch2_accounting_is_mem(&acc_k)) {
8ca7de6205503d Kent Overstreet 2025-08-14  855  			struct disk_accounting_pos next_acc;
8ca7de6205503d Kent Overstreet 2025-08-14  856  			memset(&next_acc, 0, sizeof(next_acc));
8ca7de6205503d Kent Overstreet 2025-08-14  857  			next_acc.type = acc_k.type + 1;
8ca7de6205503d Kent Overstreet 2025-08-14  858  			struct bpos next = disk_accounting_pos_to_bpos(&next_acc);
8ca7de6205503d Kent Overstreet 2025-08-14  859  			if (jk < end)
8ca7de6205503d Kent Overstreet 2025-08-14  860  				next = bpos_min(next, journal_key_k(c, jk)->k.p);
8ca7de6205503d Kent Overstreet 2025-08-14  861  
8ca7de6205503d Kent Overstreet 2025-08-14  862  			bch2_btree_iter_set_pos(&iter, next);
44a43cf9fdccc3 Kent Overstreet 2024-12-05  863  			continue;
ba9752e5f43637 Kent Overstreet 2024-11-29  864  		}
44a43cf9fdccc3 Kent Overstreet 2024-12-05  865  
a850bde6498b46 Kent Overstreet 2024-02-08  866  		accounting_read_key(trans, k);
a850bde6498b46 Kent Overstreet 2024-02-08  867  	}));
9042e68ac3bde4 Kent Overstreet 2025-07-30  868  	bch2_trans_iter_exit(&iter);
1d16c605cc55ef Kent Overstreet 2023-11-09  869  	if (ret)
0d82de59f0599c Kent Overstreet 2025-07-14  870  		return ret;
1d16c605cc55ef Kent Overstreet 2023-11-09  871  
8ca7de6205503d Kent Overstreet 2025-08-14  872  	while (jk < end)
8ca7de6205503d Kent Overstreet 2025-08-14  873  		jk = accumulate_and_read_journal_accounting(trans, jk);
1d16c605cc55ef Kent Overstreet 2023-11-09  874  
8ca7de6205503d Kent Overstreet 2025-08-14  875  	struct journal_key *dst = keys->data;
8ca7de6205503d Kent Overstreet 2025-08-14  876  	darray_for_each(*keys, i)
8ca7de6205503d Kent Overstreet 2025-08-14  877  		if (!i->overwritten)
8ca7de6205503d Kent Overstreet 2025-08-14  878  			*dst++ = *i;
8ca7de6205503d Kent Overstreet 2025-08-14  879  	keys->gap = keys->nr = dst - keys->data;
1d16c605cc55ef Kent Overstreet 2023-11-09  880  
a64ded7ab87bde Kent Overstreet 2025-07-14  881  	guard(percpu_write)(&c->mark_lock);
9104fc1928704e Kent Overstreet 2024-09-25  882  
8dabb19ff4b802 Kent Overstreet 2024-12-03  883  	darray_for_each_reverse(acc->k, i) {
19773ec997201a Kent Overstreet 2024-10-07  884  		struct disk_accounting_pos acc_k;
8dabb19ff4b802 Kent Overstreet 2024-12-03  885  		bpos_to_disk_accounting_pos(&acc_k, i->pos);
9104fc1928704e Kent Overstreet 2024-09-25  886  
19773ec997201a Kent Overstreet 2024-10-07  887  		u64 v[BCH_ACCOUNTING_MAX_COUNTERS];
8dabb19ff4b802 Kent Overstreet 2024-12-03  888  		memset(v, 0, sizeof(v));
8dabb19ff4b802 Kent Overstreet 2024-12-03  889  
8dabb19ff4b802 Kent Overstreet 2024-12-03  890  		for (unsigned j = 0; j < i->nr_counters; j++)
8dabb19ff4b802 Kent Overstreet 2024-12-03  891  			v[j] = percpu_u64_get(i->v[0] + j);
9104fc1928704e Kent Overstreet 2024-09-25  892  
431312b59cf54f Kent Overstreet 2024-09-25  893  		/*
19773ec997201a Kent Overstreet 2024-10-07  894  		 * If the entry counters are zeroed, it should be treated as
19773ec997201a Kent Overstreet 2024-10-07  895  		 * nonexistent - it might point to an invalid device.
19773ec997201a Kent Overstreet 2024-10-07  896  		 *
19773ec997201a Kent Overstreet 2024-10-07  897  		 * Remove it, so that if it's re-added it gets re-marked in the
19773ec997201a Kent Overstreet 2024-10-07  898  		 * superblock:
431312b59cf54f Kent Overstreet 2024-09-25  899  		 */
8dabb19ff4b802 Kent Overstreet 2024-12-03  900  		ret = bch2_is_zero(v, sizeof(v[0]) * i->nr_counters)
19773ec997201a Kent Overstreet 2024-10-07  901  			? -BCH_ERR_remove_disk_accounting_entry
62095464e9d2a2 Kent Overstreet 2025-04-17  902  			: bch2_disk_accounting_validate_late(trans, &acc_k, v, i->nr_counters);
19773ec997201a Kent Overstreet 2024-10-07  903  
19773ec997201a Kent Overstreet 2024-10-07  904  		if (ret == -BCH_ERR_remove_disk_accounting_entry) {
8dabb19ff4b802 Kent Overstreet 2024-12-03  905  			free_percpu(i->v[0]);
8dabb19ff4b802 Kent Overstreet 2024-12-03  906  			free_percpu(i->v[1]);
8dabb19ff4b802 Kent Overstreet 2024-12-03  907  			darray_remove_item(&acc->k, i);
19773ec997201a Kent Overstreet 2024-10-07  908  			ret = 0;
431312b59cf54f Kent Overstreet 2024-09-25  909  			continue;
19773ec997201a Kent Overstreet 2024-10-07  910  		}
431312b59cf54f Kent Overstreet 2024-09-25  911  
431312b59cf54f Kent Overstreet 2024-09-25  912  		if (ret)
0d82de59f0599c Kent Overstreet 2025-07-14  913  			return ret;
9104fc1928704e Kent Overstreet 2024-09-25  914  	}
9104fc1928704e Kent Overstreet 2024-09-25  915  
8dabb19ff4b802 Kent Overstreet 2024-12-03  916  	eytzinger0_sort(acc->k.data, acc->k.nr, sizeof(acc->k.data[0]),
8dabb19ff4b802 Kent Overstreet 2024-12-03  917  			accounting_pos_cmp, NULL);
8dabb19ff4b802 Kent Overstreet 2024-12-03  918  
a64ded7ab87bde Kent Overstreet 2025-07-14  919  	scoped_guard(preempt) {
8bb8d683a4013f Kent Overstreet 2023-12-27  920  		struct bch_fs_usage_base *usage = this_cpu_ptr(c->usage);
1d16c605cc55ef Kent Overstreet 2023-11-09  921  
1d16c605cc55ef Kent Overstreet 2023-11-09  922  		for (unsigned i = 0; i < acc->k.nr; i++) {
1d16c605cc55ef Kent Overstreet 2023-11-09  923  			struct disk_accounting_pos k;
1d16c605cc55ef Kent Overstreet 2023-11-09  924  			bpos_to_disk_accounting_pos(&k, acc->k.data[i].pos);
1d16c605cc55ef Kent Overstreet 2023-11-09  925  
1d16c605cc55ef Kent Overstreet 2023-11-09  926  			u64 v[BCH_ACCOUNTING_MAX_COUNTERS];
2574e95a8b78ef Kent Overstreet 2024-06-06  927  			bch2_accounting_mem_read_counters(acc, i, v, ARRAY_SIZE(v), false);
1d16c605cc55ef Kent Overstreet 2023-11-09  928  
91a348a530ed01 Kent Overstreet 2025-08-19  929  			/*
91a348a530ed01 Kent Overstreet 2025-08-19  930  			 * Check for underflow, schedule check_allocations
91a348a530ed01 Kent Overstreet 2025-08-19  931  			 * necessary:
91a348a530ed01 Kent Overstreet 2025-08-19  932  			 *
91a348a530ed01 Kent Overstreet 2025-08-19  933  			 * XXX - see if we can factor this out to run on a bkey
91a348a530ed01 Kent Overstreet 2025-08-19  934  			 * so we can check everything lazily, right now we don't
91a348a530ed01 Kent Overstreet 2025-08-19  935  			 * check the non in-mem counters at all
91a348a530ed01 Kent Overstreet 2025-08-19  936  			 */
91a348a530ed01 Kent Overstreet 2025-08-19  937  			bool underflow = false;
91a348a530ed01 Kent Overstreet 2025-08-19  938  			for (unsigned j = 0; j < acc->k.data[i].nr_counters; j++)
91a348a530ed01 Kent Overstreet 2025-08-19  939  				underflow |= (s64) v[j] < 0;
91a348a530ed01 Kent Overstreet 2025-08-19  940  
91a348a530ed01 Kent Overstreet 2025-08-19  941  			if (underflow) {
91a348a530ed01 Kent Overstreet 2025-08-19  942  				CLASS(printbuf, buf)();
91a348a530ed01 Kent Overstreet 2025-08-19  943  				bch2_log_msg_start(c, &buf);
91a348a530ed01 Kent Overstreet 2025-08-19  944  
91a348a530ed01 Kent Overstreet 2025-08-19  945  				prt_printf(&buf, "Accounting underflow for\n");
91a348a530ed01 Kent Overstreet 2025-08-19  946  				bch2_accounting_key_to_text(&buf, &k);
91a348a530ed01 Kent Overstreet 2025-08-19  947  
91a348a530ed01 Kent Overstreet 2025-08-19  948  				for (unsigned j = 0; j < acc->k.data[i].nr_counters; j++)
91a348a530ed01 Kent Overstreet 2025-08-19  949  					prt_printf(&buf, " %lli", v[j]);
91a348a530ed01 Kent Overstreet 2025-08-19  950  
91a348a530ed01 Kent Overstreet 2025-08-19  951  				bool print = bch2_count_fsck_err(c, accounting_key_underflow, &buf);
91a348a530ed01 Kent Overstreet 2025-08-19  952  				unsigned pos = buf.pos;
91a348a530ed01 Kent Overstreet 2025-08-19  953  				ret = bch2_run_explicit_recovery_pass(c, &buf,
91a348a530ed01 Kent Overstreet 2025-08-19  954  						BCH_RECOVERY_PASS_check_allocations, 0);
91a348a530ed01 Kent Overstreet 2025-08-19  955  				print |= buf.pos != pos;
91a348a530ed01 Kent Overstreet 2025-08-19  956  
91a348a530ed01 Kent Overstreet 2025-08-19  957  				if (print)
91a348a530ed01 Kent Overstreet 2025-08-19  958  					bch2_print_str(c, KERN_ERR, buf.buf);
91a348a530ed01 Kent Overstreet 2025-08-19  959  				if (ret)
91a348a530ed01 Kent Overstreet 2025-08-19  960  					return ret;
91a348a530ed01 Kent Overstreet 2025-08-19  961  			}
91a348a530ed01 Kent Overstreet 2025-08-19  962  
1d16c605cc55ef Kent Overstreet 2023-11-09  963  			switch (k.type) {
1d16c605cc55ef Kent Overstreet 2023-11-09  964  			case BCH_DISK_ACCOUNTING_persistent_reserved:
1d16c605cc55ef Kent Overstreet 2023-11-09  965  				usage->reserved += v[0] * k.persistent_reserved.nr_replicas;
1d16c605cc55ef Kent Overstreet 2023-11-09  966  				break;
1d16c605cc55ef Kent Overstreet 2023-11-09  967  			case BCH_DISK_ACCOUNTING_replicas:
1d16c605cc55ef Kent Overstreet 2023-11-09  968  				fs_usage_data_type_to_base(usage, k.replicas.data_type, v[0]);
1d16c605cc55ef Kent Overstreet 2023-11-09  969  				break;
18dad454cd16cb Kent Overstreet 2025-05-24  970  			case BCH_DISK_ACCOUNTING_dev_data_type: {
18dad454cd16cb Kent Overstreet 2025-05-24  971  				guard(rcu)();
a7ecd5f2ccabb9 Kent Overstreet 2024-11-24  972  				struct bch_dev *ca = bch2_dev_rcu_noerror(c, k.dev_data_type.dev);
f5095b9f85a167 Kent Overstreet 2024-01-01  973  				if (ca) {
f5095b9f85a167 Kent Overstreet 2024-01-01  974  					struct bch_dev_usage_type __percpu *d = &ca->usage->d[k.dev_data_type.data_type];
f5095b9f85a167 Kent Overstreet 2024-01-01  975  					percpu_u64_set(&d->buckets,	v[0]);
f5095b9f85a167 Kent Overstreet 2024-01-01  976  					percpu_u64_set(&d->sectors,	v[1]);
f5095b9f85a167 Kent Overstreet 2024-01-01  977  					percpu_u64_set(&d->fragmented,	v[2]);
f5095b9f85a167 Kent Overstreet 2024-01-01  978  
f5095b9f85a167 Kent Overstreet 2024-01-01  979  					if (k.dev_data_type.data_type == BCH_DATA_sb ||
f5095b9f85a167 Kent Overstreet 2024-01-01  980  					    k.dev_data_type.data_type == BCH_DATA_journal)
f5095b9f85a167 Kent Overstreet 2024-01-01  981  						usage->hidden += v[0] * ca->mi.bucket_size;
f5095b9f85a167 Kent Overstreet 2024-01-01  982  				}
f5095b9f85a167 Kent Overstreet 2024-01-01  983  				break;
1d16c605cc55ef Kent Overstreet 2023-11-09  984  			}
1d16c605cc55ef Kent Overstreet 2023-11-09  985  			}
18dad454cd16cb Kent Overstreet 2025-05-24  986  		}
a64ded7ab87bde Kent Overstreet 2025-07-14  987  	}
0d82de59f0599c Kent Overstreet 2025-07-14  988  
1d16c605cc55ef Kent Overstreet 2023-11-09  989  	return ret;
1d16c605cc55ef Kent Overstreet 2023-11-09  990  }
1d16c605cc55ef Kent Overstreet 2023-11-09  991  

:::::: The code at line 825 was first introduced by commit
:::::: ba9752e5f43637096d636abb934b8172fc23ea62 bcachefs: bcachefs_metadata_version_disk_accounting_big_endian

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
