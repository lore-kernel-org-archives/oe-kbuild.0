Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A285146588
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 15:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772060; cv=none; b=Fz4g4ovoxAO3kgiB4BhIMEaxGd4aQMV4tvH/ulRNm5z+y8ZZGqR3SacME/koYzJkFpuIVALZe6qHDJFfDH7DW12RB6D8gg8qaMrA6/lk4XIxGoOn4csaWawDFdunCdaPMvqpdVAb8oFar6i0wObraKLbeSvjQZuDt0D93ZKMcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772060; c=relaxed/simple;
	bh=6cIt0SUWi0WDwJdAw2KyBm5pnC3q1C7kuEMrlnjIF7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJHDGmoFPvvVGL0389YPsN74xuZRhmywu9YRZYv5wT4eivoDWpZsuPjdXyL1WZrngV9MOHw2KpfS7GchZ79BkmFQhFEgl9cMa6gfrBW0dStkKbSkgIU+M/LqJGehiPIBq1G+P16V2I0+uqaWnNVbwGxoo5pBNKqmXSPlbbXshAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1CaB+/s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1CaB+/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778772059; x=1810308059;
  h=date:from:to:cc:subject:message-id;
  bh=6cIt0SUWi0WDwJdAw2KyBm5pnC3q1C7kuEMrlnjIF7Y=;
  b=M1CaB+/sQW6h69LJdwKz7wTY4LBOr4jYxtIsciTABKi3En4OEAui07vU
   eELSaHnmorTcNxIsa+e8KfuYTqCqJj5ItLHFX3wkffJ1pCANQYqUPWqsY
   8qRn5F/reDBXi3hU/NEuiWvUxIF6vhEt1wR337ScwZxGr+mg+G6z5Vo4A
   2xo1JIMtkpilG/Ag5rtTIKj0g3+NRPPTZceAnYHXo8iO0fdajr3cvCdzL
   kRbDhuznVoMM/PR6Y8hyq7QhFiMZHpwGIrntkh4sNK2+yoNn/NiE3uT94
   Va6c6d1Ok2byTxMwsDkdEHUxN4o+PDp+/yQPvFenrzPEIFyQAOCCS+ZYj
   w==;
X-CSE-ConnectionGUID: BxNLaS0sSdqetQIXc9Zo+Q==
X-CSE-MsgGUID: SJTeA6o1Tmm0jo9CzgxWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79746976"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79746976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:20:58 -0700
X-CSE-ConnectionGUID: rp+59IYkTJOMBnFk6K5ehA==
X-CSE-MsgGUID: j0NYG0x5Q0KnZO+lW+c8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235770537"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 08:20:58 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNXrr-000000006gN-27jo;
	Thu, 14 May 2026 15:20:55 +0000
Date: Thu, 14 May 2026 23:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 148/332]
 fs/bcachefs/alloc/backpointers.c:1339 bch2_bp_scan_iter_peek() warn: passing
 zero to 'ERR_PTR'
Message-ID: <202605142317.Mzgn6tYk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: ee275944ddf8276ecd88d14df78394828d89535e [148/332] bcachefs: backpointer_scan_iter
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142317.Mzgn6tYk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605142317.Mzgn6tYk-lkp@intel.com/

New smatch warnings:
fs/bcachefs/alloc/backpointers.c:1339 bch2_bp_scan_iter_peek() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/bcachefs/alloc/backpointers.c:346 __bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'

vim +/ERR_PTR +1339 fs/bcachefs/alloc/backpointers.c

ee275944ddf8276 Kent Overstreet 2025-11-30  1326  
ee275944ddf8276 Kent Overstreet 2025-11-30  1327  struct bkey_s_c_backpointer bch2_bp_scan_iter_peek(struct btree_trans *trans,
ee275944ddf8276 Kent Overstreet 2025-11-30  1328  						   struct bp_scan_iter *iter, struct bpos end,
ee275944ddf8276 Kent Overstreet 2025-11-30  1329  						   struct wb_maybe_flush *last_flushed)
ee275944ddf8276 Kent Overstreet 2025-11-30  1330  {
ee275944ddf8276 Kent Overstreet 2025-11-30  1331  	if (iter->nr_flushes != last_flushed->nr_flushes) {
ee275944ddf8276 Kent Overstreet 2025-11-30  1332  		if (iter->bps.nr) {
ee275944ddf8276 Kent Overstreet 2025-11-30  1333  			struct bkey_i_backpointer *prev = &darray_last(iter->bps);
ee275944ddf8276 Kent Overstreet 2025-11-30  1334  
ee275944ddf8276 Kent Overstreet 2025-11-30  1335  			CLASS(btree_iter, bp_iter)(trans, BTREE_ID_backpointers, prev->k.p, 0);
ee275944ddf8276 Kent Overstreet 2025-11-30  1336  			struct bkey_s_c k;
ee275944ddf8276 Kent Overstreet 2025-11-30  1337  			int ret = bkey_err(k = bch2_btree_iter_peek_slot(&bp_iter));
ee275944ddf8276 Kent Overstreet 2025-11-30  1338  			if (bkey_err(k))
ee275944ddf8276 Kent Overstreet 2025-11-30 @1339  				return (struct bkey_s_c_backpointer) { .k = ERR_PTR(ret) };
ee275944ddf8276 Kent Overstreet 2025-11-30  1340  
ee275944ddf8276 Kent Overstreet 2025-11-30  1341  			if (k.k->type == KEY_TYPE_backpointer)
ee275944ddf8276 Kent Overstreet 2025-11-30  1342  				bkey_reassemble(&prev->k_i, k);
ee275944ddf8276 Kent Overstreet 2025-11-30  1343  			else
ee275944ddf8276 Kent Overstreet 2025-11-30  1344  				--iter->bps.nr;
ee275944ddf8276 Kent Overstreet 2025-11-30  1345  		}
ee275944ddf8276 Kent Overstreet 2025-11-30  1346  
ee275944ddf8276 Kent Overstreet 2025-11-30  1347  		iter->nr_flushes = last_flushed->nr_flushes;
ee275944ddf8276 Kent Overstreet 2025-11-30  1348  	}
ee275944ddf8276 Kent Overstreet 2025-11-30  1349  
ee275944ddf8276 Kent Overstreet 2025-11-30  1350  	if (!iter->bps.nr) {
ee275944ddf8276 Kent Overstreet 2025-11-30  1351  		size_t limit = (system_totalram_bytes() / 16) /
ee275944ddf8276 Kent Overstreet 2025-11-30  1352  			sizeof(struct bkey_i_backpointer);
ee275944ddf8276 Kent Overstreet 2025-11-30  1353  
ee275944ddf8276 Kent Overstreet 2025-11-30  1354  		u32 restart_count = trans->restart_count;
ee275944ddf8276 Kent Overstreet 2025-11-30  1355  
ee275944ddf8276 Kent Overstreet 2025-11-30  1356  		int ret = for_each_btree_key_max(trans, bp_iter, BTREE_ID_backpointers,
ee275944ddf8276 Kent Overstreet 2025-11-30  1357  					   iter->pos, end, BTREE_ITER_prefetch, k, ({
ee275944ddf8276 Kent Overstreet 2025-11-30  1358  			if (k.k->type != KEY_TYPE_backpointer)
ee275944ddf8276 Kent Overstreet 2025-11-30  1359  				continue;
ee275944ddf8276 Kent Overstreet 2025-11-30  1360  
ee275944ddf8276 Kent Overstreet 2025-11-30  1361  			struct bkey_i_backpointer bp;
ee275944ddf8276 Kent Overstreet 2025-11-30  1362  			bkey_reassemble(&bp.k_i, k);
ee275944ddf8276 Kent Overstreet 2025-11-30  1363  			if (iter->bps.nr > limit ||
ee275944ddf8276 Kent Overstreet 2025-11-30  1364  			    darray_push_gfp(&iter->bps, bp, GFP_KERNEL|__GFP_NOWARN))
ee275944ddf8276 Kent Overstreet 2025-11-30  1365  				break;
ee275944ddf8276 Kent Overstreet 2025-11-30  1366  
ee275944ddf8276 Kent Overstreet 2025-11-30  1367  			iter->pos = bpos_nosnap_successor(k.k->p);
ee275944ddf8276 Kent Overstreet 2025-11-30  1368  			(iter->progress
ee275944ddf8276 Kent Overstreet 2025-11-30  1369  			 ? bch2_progress_update_iter(trans, iter->progress, &bp_iter)
ee275944ddf8276 Kent Overstreet 2025-11-30  1370  			 : 0);
ee275944ddf8276 Kent Overstreet 2025-11-30  1371  		}));
ee275944ddf8276 Kent Overstreet 2025-11-30  1372  		trans->restart_count = restart_count;
ee275944ddf8276 Kent Overstreet 2025-11-30  1373  
ee275944ddf8276 Kent Overstreet 2025-11-30  1374  		if (ret)
ee275944ddf8276 Kent Overstreet 2025-11-30  1375  			return ((struct bkey_s_c_backpointer) { .k = ERR_PTR(ret) });
ee275944ddf8276 Kent Overstreet 2025-11-30  1376  
ee275944ddf8276 Kent Overstreet 2025-11-30  1377  		if (!iter->bps.nr)
ee275944ddf8276 Kent Overstreet 2025-11-30  1378  			return (struct bkey_s_c_backpointer) {};
ee275944ddf8276 Kent Overstreet 2025-11-30  1379  
ee275944ddf8276 Kent Overstreet 2025-11-30  1380  		darray_sort(iter->bps, bkey_i_backpointer_cmp);
ee275944ddf8276 Kent Overstreet 2025-11-30  1381  	}
ee275944ddf8276 Kent Overstreet 2025-11-30  1382  
ee275944ddf8276 Kent Overstreet 2025-11-30  1383  	return backpointer_i_to_s_c(&darray_last(iter->bps));
ee275944ddf8276 Kent Overstreet 2025-11-30  1384  }
ee275944ddf8276 Kent Overstreet 2025-11-30  1385  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
