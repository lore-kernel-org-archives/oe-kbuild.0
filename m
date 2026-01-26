Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA316CD33
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769391435; cv=none; b=qlgtN8t+rLhK4tDdXvHFi4S/UbIXQ27mA/2bmww6IethqLj2v6iSRwCmvakiPH3lHvr65FRmsltI5t6qU2i2ThqJbMzETXfaKe/yDkbzQAGNwhi9jDt82aDRCrc/BggBS1MDw6t4w6a4fd2X3r/sKqJoQG4S99tPhyX/UB/CPDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769391435; c=relaxed/simple;
	bh=sBqnsufrLrYFXWAYaOpEP7LK1r7KpuRK4dTziKTZDXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQpLoSzUSqn5NeL/ZF06ct5mjlkxl3hmiURehjfsBtKsHTku+Wwkss5a7H1wJSypPEWbdAtVl2mAcnRAtzxpy2Ki8+Sgu9RhsdHmnw+WKF3FYcsQKurirP02QiesszkUtiPXunKRCWO2as53TQiegfN6/M2gxsyc5GCUiDtIW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdpV8MRn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdpV8MRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769391432; x=1800927432;
  h=date:from:to:cc:subject:message-id;
  bh=sBqnsufrLrYFXWAYaOpEP7LK1r7KpuRK4dTziKTZDXs=;
  b=jdpV8MRnaF60Dfvgnxf0cD87cXtH/XvoEe+vwwlZPQiwg2phzNaLLnWE
   Vr1qE1mJoQQ4IkgPeDWy/3xiMHHqg9Vs3Iqpm6dXwL6tsy2uuOQ9d7a/i
   fipLUzb+BF3i/KKTDEmJ2WJ1b2LtBsgMpfzaZuOdBbX3sfcD4X0QI/odC
   EyhbdbdaU6BDiVQlkuhEYc4gB1i7FLiiDe7j1j/516w/h8vreqCgs8m4C
   5Ntfdc3vN0osJODVN+xk3SuplKBdDKymk4OtYTgizHA6k6Vi8xhwwVxQM
   xf+ml4Yr+GWDIq2OU3EzGH9tzgFNxLf6jQysOs51/kXv2T36/8vlV6My3
   A==;
X-CSE-ConnectionGUID: KrMh5Y4GTSCq8Og9rfbb0g==
X-CSE-MsgGUID: AhSN9IeAR6mzuB7xikMb0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87986430"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="87986430"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 17:37:12 -0800
X-CSE-ConnectionGUID: BBm48PbmRS2RQDP8FeGZTg==
X-CSE-MsgGUID: bFP5h73KS+CNw3S5xOGUqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207812839"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jan 2026 17:37:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkBXP-00000000Wnu-2FRr;
	Mon, 26 Jan 2026 01:37:07 +0000
Date: Mon, 26 Jan 2026 09:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 459/799]
 fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk'
 dereferencing possible ERR_PTR()
Message-ID: <202601260955.13lBb8BI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 3fdc7b4035515f784e1d442bcca383f5c0267e53 [459/799] bcachefs: move alloc files to subdir
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601260955.13lBb8BI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601260955.13lBb8BI-lkp@intel.com/

smatch warnings:
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/accounting.c:962 bch2_accounting_read() error: 'jk' dereferencing possible ERR_PTR()
fs/bcachefs/alloc/backpointers.c:363 __bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'
fs/bcachefs/alloc/buckets.c:578 bch2_trans_account_disk_usage_change() error: we previously assumed 'trans->disk_res' could be null (see line 550)

vim +/jk +962 fs/bcachefs/alloc/accounting.c

abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   907  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   908  /*
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   909   * At startup time, initialize the in memory accounting from the btree (and
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   910   * journal)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   911   */
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   912  int bch2_accounting_read(struct bch_fs *c)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   913  {
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   914  	struct bch_accounting_mem *acc = &c->accounting;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   915  	CLASS(btree_trans, trans)(c);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   916  	CLASS(printbuf, buf)();
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   917  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   918  	/*
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   919  	 * We might run more than once if we rewind to start topology repair or
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   920  	 * btree node scan - and those might cause us to get different results,
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   921  	 * so we can't just skip if we've already run.
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   922  	 *
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   923  	 * Instead, zero out any accounting we have:
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   924  	 */
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   925  	scoped_guard(percpu_write, &c->mark_lock) {
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   926  		darray_for_each(acc->k, e)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   927  			percpu_memset(e->v[0], 0, sizeof(u64) * e->nr_counters);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   928  		for_each_member_device(c, ca)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   929  			percpu_memset(ca->usage, 0, sizeof(*ca->usage));
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   930  		percpu_memset(c->usage, 0, sizeof(*c->usage));
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   931  	}
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   932  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   933  	struct journal_keys *keys = &c->journal_keys;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   934  	struct journal_key *jk = keys->data;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   935  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   936  	move_gap(keys, keys->nr);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   937  
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   938  	/* Find the range of accounting keys from the journal: */
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   939  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   940  	while (jk < &darray_top(*keys) &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   941  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, POS_MIN, jk) > 0)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   942  		jk++;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   943  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   944  	struct journal_key *end = jk;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   945  	while (end < &darray_top(*keys) &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   946  	       __journal_key_cmp(c, BTREE_ID_accounting, 0, SPOS_MAX, end) > 0)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   947  		end++;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   948  
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   949  	/*
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   950  	 * Iterate over btree and journal accounting simultaneously:
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   951  	 *
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   952  	 * We want to drop unneeded unneeded accounting deltas early - deltas
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   953  	 * that are older than the btree accounting key version, and once we've
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   954  	 * dropped old accounting deltas we can accumulate and compact deltas
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   955  	 * for the same key:
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   956  	 */
51973034392873 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-27   957  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   958  	struct btree_iter iter;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   959  	bch2_trans_iter_init(trans, &iter, BTREE_ID_accounting, POS_MIN,
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   960  			     BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   961  	iter.flags &= ~BTREE_ITER_with_journal;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  @962  	int ret = for_each_btree_key_continue(trans, iter,
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   963  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots, k, ({
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   964  		if (k.k->type != KEY_TYPE_accounting)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   965  			continue;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   966  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   967  		while (jk < end &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   968  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) > 0)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   969  			jk = accumulate_and_read_journal_accounting(trans, jk);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   970  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   971  		while (jk < end &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   972  		       __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0 &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   973  		       bversion_cmp(journal_key_k(c, jk)->k.bversion, k.k->bversion) <= 0) {
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   974  			jk->overwritten = true;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   975  			jk++;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   976  		}
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   977  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   978  		if (jk < end &&
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   979  		    __journal_key_cmp(c, BTREE_ID_accounting, 0, k.k->p, jk) == 0)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   980  			jk = accumulate_and_read_journal_accounting(trans, jk);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   981  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   982  		struct disk_accounting_pos acc_k;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   983  		bpos_to_disk_accounting_pos(&acc_k, k.k->p);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   984  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   985  		if (acc_k.type >= BCH_DISK_ACCOUNTING_TYPE_NR)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   986  			break;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   987  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   988  		if (!bch2_accounting_is_mem(&acc_k)) {
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   989  			struct disk_accounting_pos next_acc;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   990  			memset(&next_acc, 0, sizeof(next_acc));
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   991  			next_acc.type = acc_k.type + 1;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   992  			struct bpos next = disk_accounting_pos_to_bpos(&next_acc);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   993  			if (jk < end)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   994  				next = bpos_min(next, journal_key_k(c, jk)->k.p);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   995  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   996  			/* for_each_btree_key() will still advance iterator: */
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   997  			bch2_btree_iter_set_pos(&iter, bpos_predecessor(next));
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   998  			continue;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26   999  		}
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1000  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1001  		accounting_read_key(trans, k);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1002  	}));
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1003  	bch2_trans_iter_exit(&iter);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1004  	if (ret)
1d16c605cc55ef fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1005  		return ret;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1006  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1007  	while (jk < end)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1008  		jk = accumulate_and_read_journal_accounting(trans, jk);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1009  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1010  	bch2_trans_unlock(trans);
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1011  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1012  	struct journal_key *dst = keys->data;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1013  	darray_for_each(*keys, i)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1014  		if (!i->overwritten)
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1015  			*dst++ = *i;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1016  	keys->gap = keys->nr = dst - keys->data;
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1017  
abf228e2c74678 fs/bcachefs/disk_accounting.c Kent Overstreet 2025-09-26  1018  	return accounting_read_mem_fixups(trans);
1d16c605cc55ef fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1019  }
1d16c605cc55ef fs/bcachefs/disk_accounting.c Kent Overstreet 2023-11-09  1020  

:::::: The code at line 962 was first introduced by commit
:::::: abf228e2c74678c895d4c4a280c236fd73f37dc4 bcachefs: accounting_read_mem_fixups()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
