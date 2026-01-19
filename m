Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160B735EDBA
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826742; cv=none; b=dDfLSg0cz2yjC1raHZ4MumSXLQcSk5cNG10n/k/48RpY8zY8sSLTYz6+iMGODeSlhUDC3+9p7875zLGFoqOaU+hhuLPnmT4seWwlNDyO1qJmEdvzXVkEszpGJhWP04RgDr8d4E3xM+WdfVrOw0rjroN+/qnYRheQPnAfjaLuEo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826742; c=relaxed/simple;
	bh=BEzfwmcZE8EdTeuN7NeBBH04uXUMj3lG2K+IwgBZL+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VeYprbE6V0V6oc5CoLzCkUjjXpwc44v25k2YUG/wywImcDDR10b9eTQZOBRGaruWbfHhzOIBiIZfE4YqmsPol5LqbYcK9Dxw+czhnwk9GYrmc2BtsFALuITASTbTNsw/8UGqqBkNt1AP7O0Lbp85lIMhu9lxVCGmFZBglCt8OAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf9AexCG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf9AexCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768826740; x=1800362740;
  h=date:from:to:cc:subject:message-id;
  bh=BEzfwmcZE8EdTeuN7NeBBH04uXUMj3lG2K+IwgBZL+4=;
  b=Tf9AexCGpdlJhg0py7v5oEdHhYGi1ShTQzpkvQx3V7DGNG+5RK6a1a+U
   AcO/Mqht1UjLeCfxBz0FgqesQinGmiXQdrAhU1u6Cz4zjfBoRPLbGXRgv
   g+1bW56GzkcOnE5b6Djo7E6dMOjFEjXYKMckqKUTw01BYBcZEb8mDX9h9
   ycLynSrLcQF3bsMy/KGtblLZiZ4ukPLq8N20o2Bwagwy7m9mYrv3xeffl
   6OSX2GxP3MPkX3kBtw4FEXL4O2wUTIhz/y09xDin2xpy7bbtzhBp0GoTj
   PMQqk9YCIHHo//Pn4sDogcOfJx+HTm5pzvUAT3rayPDrPjctVHJjoBfz1
   Q==;
X-CSE-ConnectionGUID: HEhwxfcHQtqKUb+MW6Uk6Q==
X-CSE-MsgGUID: g7bipf13R1W6h38AJ5+u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69946241"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69946241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:45:40 -0800
X-CSE-ConnectionGUID: 5AgWlAuPSDyRDKfJmLqSfw==
X-CSE-MsgGUID: ZvHv0L78Rce7nKFrzd1iEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237131999"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 04:45:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhodT-00000000NnN-3Kjz;
	Mon, 19 Jan 2026 12:45:35 +0000
Date: Mon, 19 Jan 2026 20:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:master 216/223]
 fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously
 assumed 'new_s' could be null (see line 356)
Message-ID: <202601192049.4ACBGS97-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/223] bcachefs: Split up data/ec.c
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r073-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192049.4ACBGS97-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601192049.4ACBGS97-lkp@intel.com/

smatch warnings:
fs/bcachefs/data/ec/trigger.c:378 bch2_trigger_stripe() error: we previously assumed 'new_s' could be null (see line 356)

vim +/new_s +378 fs/bcachefs/data/ec/trigger.c

bde39b90107558 Kent Overstreet 2026-01-17  314  
bde39b90107558 Kent Overstreet 2026-01-17  315  int bch2_trigger_stripe(struct btree_trans *trans,
bde39b90107558 Kent Overstreet 2026-01-17  316  			enum btree_id btree, unsigned level,
bde39b90107558 Kent Overstreet 2026-01-17  317  			struct bkey_s_c old, struct bkey_s _new,
bde39b90107558 Kent Overstreet 2026-01-17  318  			enum btree_iter_update_trigger_flags flags)
bde39b90107558 Kent Overstreet 2026-01-17  319  {
bde39b90107558 Kent Overstreet 2026-01-17  320  	struct bkey_s_c new = _new.s_c;
bde39b90107558 Kent Overstreet 2026-01-17  321  	struct bch_fs *c = trans->c;
bde39b90107558 Kent Overstreet 2026-01-17  322  	u64 idx = new.k->p.offset;
bde39b90107558 Kent Overstreet 2026-01-17  323  	const struct bch_stripe *old_s = old.k->type == KEY_TYPE_stripe
bde39b90107558 Kent Overstreet 2026-01-17  324  		? bkey_s_c_to_stripe(old).v : NULL;
bde39b90107558 Kent Overstreet 2026-01-17  325  	const struct bch_stripe *new_s = new.k->type == KEY_TYPE_stripe
bde39b90107558 Kent Overstreet 2026-01-17  326  		? bkey_s_c_to_stripe(new).v : NULL;
bde39b90107558 Kent Overstreet 2026-01-17  327  
bde39b90107558 Kent Overstreet 2026-01-17  328  	if (unlikely(flags & BTREE_TRIGGER_check_repair))
bde39b90107558 Kent Overstreet 2026-01-17  329  		return bch2_check_fix_ptrs(trans, btree, level, _new.s_c, flags);
bde39b90107558 Kent Overstreet 2026-01-17  330  
bde39b90107558 Kent Overstreet 2026-01-17  331  	BUG_ON(new_s && old_s &&
bde39b90107558 Kent Overstreet 2026-01-17  332  	       (new_s->nr_blocks	!= old_s->nr_blocks ||
bde39b90107558 Kent Overstreet 2026-01-17  333  		new_s->nr_redundant	!= old_s->nr_redundant));
bde39b90107558 Kent Overstreet 2026-01-17  334  
bde39b90107558 Kent Overstreet 2026-01-17  335  	if (flags & BTREE_TRIGGER_transactional) {
bde39b90107558 Kent Overstreet 2026-01-17  336  		u64 old_lru_pos = stripe_lru_pos(old_s);
bde39b90107558 Kent Overstreet 2026-01-17  337  		u64 new_lru_pos = stripe_lru_pos(new_s);
bde39b90107558 Kent Overstreet 2026-01-17  338  
bde39b90107558 Kent Overstreet 2026-01-17  339  		if (new_lru_pos == STRIPE_LRU_POS_EMPTY	&&
bde39b90107558 Kent Overstreet 2026-01-17  340  		    !bch2_stripe_is_open(c, idx)) {
bde39b90107558 Kent Overstreet 2026-01-17  341  			_new.k->type = KEY_TYPE_deleted;
bde39b90107558 Kent Overstreet 2026-01-17  342  			set_bkey_val_u64s(_new.k, 0);
bde39b90107558 Kent Overstreet 2026-01-17  343  			new_s = NULL;
bde39b90107558 Kent Overstreet 2026-01-17  344  			new_lru_pos = 0;
bde39b90107558 Kent Overstreet 2026-01-17  345  		}
bde39b90107558 Kent Overstreet 2026-01-17  346  
bde39b90107558 Kent Overstreet 2026-01-17  347  		try(bch2_lru_change(trans,
bde39b90107558 Kent Overstreet 2026-01-17  348  				    BCH_LRU_STRIPE_FRAGMENTATION, idx,
bde39b90107558 Kent Overstreet 2026-01-17  349  				    old_lru_pos, new_lru_pos));
bde39b90107558 Kent Overstreet 2026-01-17  350  	}
bde39b90107558 Kent Overstreet 2026-01-17  351  
bde39b90107558 Kent Overstreet 2026-01-17  352  	if (flags & (BTREE_TRIGGER_transactional|BTREE_TRIGGER_gc)) {
bde39b90107558 Kent Overstreet 2026-01-17  353  		/*
bde39b90107558 Kent Overstreet 2026-01-17  354  		 * If the pointers aren't changing, we don't need to do anything:
bde39b90107558 Kent Overstreet 2026-01-17  355  		 */
bde39b90107558 Kent Overstreet 2026-01-17 @356  		if (new_s && old_s &&
bde39b90107558 Kent Overstreet 2026-01-17  357  		    new_s->nr_blocks	== old_s->nr_blocks &&
bde39b90107558 Kent Overstreet 2026-01-17  358  		    new_s->nr_redundant	== old_s->nr_redundant &&
bde39b90107558 Kent Overstreet 2026-01-17  359  		    !memcmp(old_s->ptrs, new_s->ptrs,
bde39b90107558 Kent Overstreet 2026-01-17  360  			    new_s->nr_blocks * sizeof(struct bch_extent_ptr)))
bde39b90107558 Kent Overstreet 2026-01-17  361  			return 0;
bde39b90107558 Kent Overstreet 2026-01-17  362  
bde39b90107558 Kent Overstreet 2026-01-17  363  		struct gc_stripe *gc = NULL;
bde39b90107558 Kent Overstreet 2026-01-17  364  		if (flags & BTREE_TRIGGER_gc) {
bde39b90107558 Kent Overstreet 2026-01-17  365  			gc = genradix_ptr_alloc(&c->ec.gc_stripes, idx, GFP_KERNEL);
bde39b90107558 Kent Overstreet 2026-01-17  366  			if (!gc) {
bde39b90107558 Kent Overstreet 2026-01-17  367  				bch_err(c, "error allocating memory for gc_stripes, idx %llu", idx);
bde39b90107558 Kent Overstreet 2026-01-17  368  				return bch_err_throw(c, ENOMEM_mark_stripe);
bde39b90107558 Kent Overstreet 2026-01-17  369  			}
bde39b90107558 Kent Overstreet 2026-01-17  370  
bde39b90107558 Kent Overstreet 2026-01-17  371  			/*
bde39b90107558 Kent Overstreet 2026-01-17  372  			 * This will be wrong when we bring back runtime gc: we should
bde39b90107558 Kent Overstreet 2026-01-17  373  			 * be unmarking the old key and then marking the new key
bde39b90107558 Kent Overstreet 2026-01-17  374  			 *
bde39b90107558 Kent Overstreet 2026-01-17  375  			 * Also: when we bring back runtime gc, locking
bde39b90107558 Kent Overstreet 2026-01-17  376  			 */
bde39b90107558 Kent Overstreet 2026-01-17  377  			gc->alive	= true;
bde39b90107558 Kent Overstreet 2026-01-17 @378  			gc->sectors	= le16_to_cpu(new_s->sectors);
bde39b90107558 Kent Overstreet 2026-01-17  379  			gc->nr_blocks	= new_s->nr_blocks;
bde39b90107558 Kent Overstreet 2026-01-17  380  			gc->nr_redundant	= new_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  381  
bde39b90107558 Kent Overstreet 2026-01-17  382  			for (unsigned i = 0; i < new_s->nr_blocks; i++)
bde39b90107558 Kent Overstreet 2026-01-17  383  				gc->ptrs[i] = new_s->ptrs[i];
bde39b90107558 Kent Overstreet 2026-01-17  384  
bde39b90107558 Kent Overstreet 2026-01-17  385  			/*
bde39b90107558 Kent Overstreet 2026-01-17  386  			 * gc recalculates this field from stripe ptr
bde39b90107558 Kent Overstreet 2026-01-17  387  			 * references:
bde39b90107558 Kent Overstreet 2026-01-17  388  			 */
bde39b90107558 Kent Overstreet 2026-01-17  389  			memset(gc->block_sectors, 0, sizeof(gc->block_sectors));
bde39b90107558 Kent Overstreet 2026-01-17  390  		}
bde39b90107558 Kent Overstreet 2026-01-17  391  
bde39b90107558 Kent Overstreet 2026-01-17  392  		if (new_s) {
bde39b90107558 Kent Overstreet 2026-01-17  393  			s64 sectors = (u64) le16_to_cpu(new_s->sectors) * new_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  394  
bde39b90107558 Kent Overstreet 2026-01-17  395  			struct disk_accounting_pos acc;
bde39b90107558 Kent Overstreet 2026-01-17  396  			memset(&acc, 0, sizeof(acc));
bde39b90107558 Kent Overstreet 2026-01-17  397  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558 Kent Overstreet 2026-01-17  398  			bch2_bkey_to_replicas(c, &acc.replicas, new);
bde39b90107558 Kent Overstreet 2026-01-17  399  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558 Kent Overstreet 2026-01-17  400  
bde39b90107558 Kent Overstreet 2026-01-17  401  			if (gc)
bde39b90107558 Kent Overstreet 2026-01-17  402  				unsafe_memcpy(&gc->r.e, &acc.replicas,
bde39b90107558 Kent Overstreet 2026-01-17  403  					      replicas_entry_bytes(&acc.replicas), "VLA");
bde39b90107558 Kent Overstreet 2026-01-17  404  		}
bde39b90107558 Kent Overstreet 2026-01-17  405  
bde39b90107558 Kent Overstreet 2026-01-17  406  		if (old_s) {
bde39b90107558 Kent Overstreet 2026-01-17  407  			s64 sectors = -((s64) le16_to_cpu(old_s->sectors)) * old_s->nr_redundant;
bde39b90107558 Kent Overstreet 2026-01-17  408  
bde39b90107558 Kent Overstreet 2026-01-17  409  			struct disk_accounting_pos acc;
bde39b90107558 Kent Overstreet 2026-01-17  410  			memset(&acc, 0, sizeof(acc));
bde39b90107558 Kent Overstreet 2026-01-17  411  			acc.type = BCH_DISK_ACCOUNTING_replicas;
bde39b90107558 Kent Overstreet 2026-01-17  412  			bch2_bkey_to_replicas(c, &acc.replicas, old);
bde39b90107558 Kent Overstreet 2026-01-17  413  			try(bch2_disk_accounting_mod(trans, &acc, &sectors, 1, gc));
bde39b90107558 Kent Overstreet 2026-01-17  414  		}
bde39b90107558 Kent Overstreet 2026-01-17  415  
bde39b90107558 Kent Overstreet 2026-01-17  416  		try(mark_stripe_buckets(trans, old, new, flags));
bde39b90107558 Kent Overstreet 2026-01-17  417  	}
bde39b90107558 Kent Overstreet 2026-01-17  418  
bde39b90107558 Kent Overstreet 2026-01-17  419  	if ((flags & (BTREE_TRIGGER_atomic|BTREE_TRIGGER_gc)) == BTREE_TRIGGER_atomic) {
bde39b90107558 Kent Overstreet 2026-01-17  420  		if (new_s && stripe_lru_pos(new_s) == 1)
bde39b90107558 Kent Overstreet 2026-01-17  421  			bch2_do_stripe_deletes(c);
bde39b90107558 Kent Overstreet 2026-01-17  422  	}
bde39b90107558 Kent Overstreet 2026-01-17  423  
bde39b90107558 Kent Overstreet 2026-01-17  424  	return 0;
bde39b90107558 Kent Overstreet 2026-01-17  425  }
bde39b90107558 Kent Overstreet 2026-01-17  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
