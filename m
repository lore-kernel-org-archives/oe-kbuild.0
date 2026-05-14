Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3066336897
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 19:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786848; cv=none; b=hgJB8B4/xFcHpymYddNPf141T2GorPiMVNspq8u5pVB2CIai25tKsw3cm9bwLIBVmlB9dxblSg1YqsfxPc8z+TEJfaBPGX381kEQ/pJxbmqU1WLpq24MPJ7NnvB+VLwipII7MzzpiBRqNWm1Yp333msC8DmuNAiJygXq6erp81c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786848; c=relaxed/simple;
	bh=DRetyFf8OsGUlRTI3A3O4nLa+Tl4Pu8aBjz1emyDBPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M1RFWjdHzGyQ4zM98bJJF3uY6C5HwBNNcyNbrqeX6GOwfIAnQe8CcqSs0zYvjej96oN4RiRQGjbb6N6v3u75+KOlWq2mUv3cW/UgFYD+1JbChAOzptxS1JjxBP9mah/hR2TVEFbvcCHdvEDm+mEm3UHH8dDYU7dCYDsE82HLVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZI+34CQ/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI+34CQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778786847; x=1810322847;
  h=date:from:to:cc:subject:message-id;
  bh=DRetyFf8OsGUlRTI3A3O4nLa+Tl4Pu8aBjz1emyDBPc=;
  b=ZI+34CQ/gRU9y2CWQylAiYJwkYfsCXYB7ZfjvZDNuw2MCPI+M1pifN7B
   cq+oeLJZhoqYQRRu+qsX/gerd3WFgB3pkvvrKzVNNyNK7V33iZaSo9/FH
   By+z40BcNMewxPrAymHMgPJdIdR6kAfE6RH1WL0Ow+TC26AnEgOfZblwp
   +zvHQQkc5o85Y1bmAwIWabHd6vV5295WIv7VnuYA6G7ZLwRdRoRxvtwJt
   zJxJ0qe/9JVg77NE/18DDd4CQAHvJkUqTpfO4ZWt8GO06COWDxjf3dqUR
   YhJy2U+axKz18zKkJtycd4FBku1S7hO15cKA4q07WPUDzDReyIFKkeWMP
   A==;
X-CSE-ConnectionGUID: c2RAiInmS4eod8fUg1LS3g==
X-CSE-MsgGUID: iYVBwfF+Qq+EpeAG7kFKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91124358"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91124358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:27:24 -0700
X-CSE-ConnectionGUID: +HO6AAWYTFyehqA9IZwcQw==
X-CSE-MsgGUID: 3IrkxRa8QCCu98rr3igZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238352919"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 12:27:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbiK-000000006zx-2Clj;
	Thu, 14 May 2026 19:27:20 +0000
Date: Fri, 15 May 2026 03:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 216/332]
 fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously
 assumed 'new_s' could be null (see line 356)
Message-ID: <202605150347.BGMlkbv9-lkp@intel.com>
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
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/332] bcachefs: Split up data/ec.c
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150347.BGMlkbv9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605150347.BGMlkbv9-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 356)

vim +/new_s +378 fs/bcachefs/data/ec/trigger.c

bde39b90107558a Kent Overstreet 2026-01-17  314  
bde39b90107558a Kent Overstreet 2026-01-17  315  int bch2_trigger_stripe(struct btree_trans *trans,
bde39b90107558a Kent Overstreet 2026-01-17  316  			enum btree_id btree, unsigned level,
bde39b90107558a Kent Overstreet 2026-01-17  317  			struct bkey_s_c old, struct bkey_s _new,
bde39b90107558a Kent Overstreet 2026-01-17  318  			enum btree_iter_update_trigger_flags flags)
bde39b90107558a Kent Overstreet 2026-01-17  319  {
bde39b90107558a Kent Overstreet 2026-01-17  320  	struct bkey_s_c new = _new.s_c;
bde39b90107558a Kent Overstreet 2026-01-17  321  	struct bch_fs *c = trans->c;
bde39b90107558a Kent Overstreet 2026-01-17  322  	u64 idx = new.k->p.offset;
bde39b90107558a Kent Overstreet 2026-01-17  323  	const struct bch_stripe *old_s = old.k->type == KEY_TYPE_stripe
bde39b90107558a Kent Overstreet 2026-01-17  324  		? bkey_s_c_to_stripe(old).v : NULL;
bde39b90107558a Kent Overstreet 2026-01-17  325  	const struct bch_stripe *new_s = new.k->type == KEY_TYPE_stripe
bde39b90107558a Kent Overstreet 2026-01-17  326  		? bkey_s_c_to_stripe(new).v : NULL;
bde39b90107558a Kent Overstreet 2026-01-17  327  
bde39b90107558a Kent Overstreet 2026-01-17  328  	if (unlikely(flags & BTREE_TRIGGER_check_repair))
bde39b90107558a Kent Overstreet 2026-01-17  329  		return bch2_check_fix_ptrs(trans, btree, level, _new.s_c, flags);
bde39b90107558a Kent Overstreet 2026-01-17  330  
bde39b90107558a Kent Overstreet 2026-01-17  331  	BUG_ON(new_s && old_s &&
bde39b90107558a Kent Overstreet 2026-01-17  332  	       (new_s->nr_blocks	!= old_s->nr_blocks ||
bde39b90107558a Kent Overstreet 2026-01-17  333  		new_s->nr_redundant	!= old_s->nr_redundant));
bde39b90107558a Kent Overstreet 2026-01-17  334  
bde39b90107558a Kent Overstreet 2026-01-17  335  	if (flags & BTREE_TRIGGER_transactional) {
bde39b90107558a Kent Overstreet 2026-01-17  336  		u64 old_lru_pos = stripe_lru_pos(old_s);
bde39b90107558a Kent Overstreet 2026-01-17  337  		u64 new_lru_pos = stripe_lru_pos(new_s);
bde39b90107558a Kent Overstreet 2026-01-17  338  
bde39b90107558a Kent Overstreet 2026-01-17  339  		if (new_lru_pos == STRIPE_LRU_POS_EMPTY	&&
bde39b90107558a Kent Overstreet 2026-01-17  340  		    !bch2_stripe_is_open(c, idx)) {
bde39b90107558a Kent Overstreet 2026-01-17  341  			_new.k->type = KEY_TYPE_deleted;
bde39b90107558a Kent Overstreet 2026-01-17  342  			set_bkey_val_u64s(_new.k, 0);
bde39b90107558a Kent Overstreet 2026-01-17  343  			new_s = NULL;
bde39b90107558a Kent Overstreet 2026-01-17  344  			new_lru_pos = 0;
bde39b90107558a Kent Overstreet 2026-01-17  345  		}
bde39b90107558a Kent Overstreet 2026-01-17  346  
bde39b90107558a Kent Overstreet 2026-01-17  347  		try(bch2_lru_change(trans,
bde39b90107558a Kent Overstreet 2026-01-17  348  				    BCH_LRU_STRIPE_FRAGMENTATION, idx,
bde39b90107558a Kent Overstreet 2026-01-17  349  				    old_lru_pos, new_lru_pos));
bde39b90107558a Kent Overstreet 2026-01-17  350  	}
bde39b90107558a Kent Overstreet 2026-01-17  351  
bde39b90107558a Kent Overstreet 2026-01-17  352  	if (flags & (BTREE_TRIGGER_transactional|BTREE_TRIGGER_gc)) {
bde39b90107558a Kent Overstreet 2026-01-17  353  		/*
bde39b90107558a Kent Overstreet 2026-01-17  354  		 * If the pointers aren't changing, we don't need to do anything:
bde39b90107558a Kent Overstreet 2026-01-17  355  		 */
bde39b90107558a Kent Overstreet 2026-01-17 @356  		if (new_s && old_s &&
bde39b90107558a Kent Overstreet 2026-01-17  357  		    new_s->nr_blocks	== old_s->nr_blocks &&
bde39b90107558a Kent Overstreet 2026-01-17  358  		    new_s->nr_redundant	== old_s->nr_redundant &&
bde39b90107558a Kent Overstreet 2026-01-17  359  		    !memcmp(old_s->ptrs, new_s->ptrs,
bde39b90107558a Kent Overstreet 2026-01-17  360  			    new_s->nr_blocks * sizeof(struct bch_extent_ptr)))
bde39b90107558a Kent Overstreet 2026-01-17  361  			return 0;
bde39b90107558a Kent Overstreet 2026-01-17  362  
bde39b90107558a Kent Overstreet 2026-01-17  363  		struct gc_stripe *gc = NULL;
bde39b90107558a Kent Overstreet 2026-01-17  364  		if (flags & BTREE_TRIGGER_gc) {
bde39b90107558a Kent Overstreet 2026-01-17  365  			gc = genradix_ptr_alloc(&c->ec.gc_stripes, idx, GFP_KERNEL);
bde39b90107558a Kent Overstreet 2026-01-17  366  			if (!gc) {
bde39b90107558a Kent Overstreet 2026-01-17  367  				bch_err(c, "error allocating memory for gc_stripes, idx %llu", idx);
bde39b90107558a Kent Overstreet 2026-01-17  368  				return bch_err_throw(c, ENOMEM_mark_stripe);
bde39b90107558a Kent Overstreet 2026-01-17  369  			}
bde39b90107558a Kent Overstreet 2026-01-17  370  
bde39b90107558a Kent Overstreet 2026-01-17  371  			/*
bde39b90107558a Kent Overstreet 2026-01-17  372  			 * This will be wrong when we bring back runtime gc: we should
bde39b90107558a Kent Overstreet 2026-01-17  373  			 * be unmarking the old key and then marking the new key
bde39b90107558a Kent Overstreet 2026-01-17  374  			 *
bde39b90107558a Kent Overstreet 2026-01-17  375  			 * Also: when we bring back runtime gc, locking
bde39b90107558a Kent Overstreet 2026-01-17  376  			 */
bde39b90107558a Kent Overstreet 2026-01-17  377  			gc->alive	= true;
bde39b90107558a Kent Overstreet 2026-01-17 @378  			gc->sectors	= le16_to_cpu(new_s->sectors);
bde39b90107558a Kent Overstreet 2026-01-17  379  			gc->nr_blocks	= new_s->nr_blocks;
bde39b90107558a Kent Overstreet 2026-01-17  380  			gc->nr_redundant	= new_s->nr_redundant;
bde39b90107558a Kent Overstreet 2026-01-17  381  
bde39b90107558a Kent Overstreet 2026-01-17  382  			for (unsigned i = 0; i < new_s->nr_blocks; i++)
bde39b90107558a Kent Overstreet 2026-01-17  383  				gc->ptrs[i] = new_s->ptrs[i];
bde39b90107558a Kent Overstreet 2026-01-17  384  
bde39b90107558a Kent Overstreet 2026-01-17  385  			/*
bde39b90107558a Kent Overstreet 2026-01-17  386  			 * gc recalculates this field from stripe ptr
bde39b90107558a Kent Overstreet 2026-01-17  387  			 * references:
bde39b90107558a Kent Overstreet 2026-01-17  388  			 */
bde39b90107558a Kent Overstreet 2026-01-17  389  			memset(gc->block_sectors, 0, sizeof(gc->block_sectors));
bde39b90107558a Kent Overstreet 2026-01-17  390  		}
bde39b90107558a Kent Overstreet 2026-01-17  391  
bde39b90107558a Kent Overstreet 2026-01-17  392  		if (new_s) {
bde39b90107558a Kent Overstreet 2026-01-17  393  			s64 sectors = (u64) le16_to_cpu(new_s->sectors) * new_s->nr_redundant;
bde39b90107558a Kent Overstreet 2026-01-17  394  
bde39b90107558a Kent Overstreet 2026-01-17  395  			struct disk_accounting_pos acc;
bde39b90107558a Kent Overstreet 2026-01-17  396  			memset(&acc, 0, sizeof(acc));
bde39b90107558a Kent Overstreet 2026-01-17  397  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558a Kent Overstreet 2026-01-17  398  			bch2_bkey_to_replicas(c, &acc.replicas, new);
bde39b90107558a Kent Overstreet 2026-01-17  399  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558a Kent Overstreet 2026-01-17  400  
bde39b90107558a Kent Overstreet 2026-01-17  401  			if (gc)
bde39b90107558a Kent Overstreet 2026-01-17  402  				unsafe_memcpy(&gc->r.e, &acc.replicas,
bde39b90107558a Kent Overstreet 2026-01-17  403  					      replicas_entry_bytes(&acc.replicas), "VLA");
bde39b90107558a Kent Overstreet 2026-01-17  404  		}
bde39b90107558a Kent Overstreet 2026-01-17  405  
bde39b90107558a Kent Overstreet 2026-01-17  406  		if (old_s) {
bde39b90107558a Kent Overstreet 2026-01-17  407  			s64 sectors = -((s64) le16_to_cpu(old_s->sectors)) * old_s->nr_redundant;
bde39b90107558a Kent Overstreet 2026-01-17  408  
bde39b90107558a Kent Overstreet 2026-01-17  409  			struct disk_accounting_pos acc;
bde39b90107558a Kent Overstreet 2026-01-17  410  			memset(&acc, 0, sizeof(acc));
bde39b90107558a Kent Overstreet 2026-01-17  411  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558a Kent Overstreet 2026-01-17  412  			bch2_bkey_to_replicas(c, &acc.replicas, old);
bde39b90107558a Kent Overstreet 2026-01-17  413  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558a Kent Overstreet 2026-01-17  414  		}
bde39b90107558a Kent Overstreet 2026-01-17  415  
bde39b90107558a Kent Overstreet 2026-01-17  416  		try(mark_stripe_buckets(trans, old, new, flags));
bde39b90107558a Kent Overstreet 2026-01-17  417  	}
bde39b90107558a Kent Overstreet 2026-01-17  418  
bde39b90107558a Kent Overstreet 2026-01-17  419  	if ((flags & (BTREE_TRIGGER_atomic|BTREE_TRIGGER_gc)) == BTREE_TRIGGER_atomic) {
bde39b90107558a Kent Overstreet 2026-01-17  420  		if (new_s && stripe_lru_pos(new_s) == 1)
bde39b90107558a Kent Overstreet 2026-01-17  421  			bch2_do_stripe_deletes(c);
bde39b90107558a Kent Overstreet 2026-01-17  422  	}
bde39b90107558a Kent Overstreet 2026-01-17  423  
bde39b90107558a Kent Overstreet 2026-01-17  424  	return 0;
bde39b90107558a Kent Overstreet 2026-01-17  425  }
bde39b90107558a Kent Overstreet 2026-01-17  426  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
