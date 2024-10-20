Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9962ED515
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729422944; cv=none; b=m5ImXOSBFfczTJN+TRI4QltdXqoYPVF8/A1geAPBZe5catG4JuOvDE4vU85AB7zzgzqLOIop5uHH5qc3X+ypcFzhHrgSLcNwbbkV6lDx9BlS8/BlCMmWuphu354Jiq9zpAgr75ypsaI6Z5eCRMYBGeLDWFxs8H0RSVOSVVwyEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729422944; c=relaxed/simple;
	bh=vSEdIbwoqfIhA5yRhd2/FAMNCfnuDAyEOhW03LwF8RI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9pK19IAher5hMlOAzF758511xOCsytPbEYnauf2tViVQ6fr7dTh6Tp1na2VNPrw3+CSVRo6PKXgD6Tmd/YlmBD0HLiVrNQZTatQkwyiKNTFTlRg8ElNGWw73dGPoMGWGhh/SjMZc2/9eVf8uqIriuWzQmY1/eC8SDRyDazLSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUQqbykp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUQqbykp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729422942; x=1760958942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSEdIbwoqfIhA5yRhd2/FAMNCfnuDAyEOhW03LwF8RI=;
  b=bUQqbykpjQhHzRO9LR+nSCGmIaX23N4ggCadhcsuRZL61VU4o4Mve0kV
   MZF8+RK3CKTbfbBeW8jxbLYMq3FHzuI1tj/give9CxOTgPo70J9Tp7aiR
   sVLEwqIZCfKaBtbZiTOL3YHjigUN18DzUlSupDk9uelvzhQozuBkUEf7/
   qRb0OXLBR3tcQT+ZQ5WpDzDEm7sdg2rWAMzPJCwGfkpvwQ8SWIuT6o8XE
   x9nWGjxBfYCIIENqCUi1Jsn4eQVAXhnfNs8S2dyACbPyQbQ9Bm16qrL8D
   ugXPSgbTxoiI6Ju1vMxsoR/B6vgL75iR0wrZHsGkdJM2bDAFgRcKcy+aA
   Q==;
X-CSE-ConnectionGUID: EF3RmL+zQLK2odbRcILaPg==
X-CSE-MsgGUID: uI9aWZjjS3WpssxLWqZ9mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32824826"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="32824826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 04:15:41 -0700
X-CSE-ConnectionGUID: ge3/zNtMQtSfusuQgRRGuQ==
X-CSE-MsgGUID: 1/RcLHUAQEys1dbAYpPOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="84061054"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Oct 2024 04:15:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2TuL-000QE9-17;
	Sun, 20 Oct 2024 11:15:37 +0000
Date: Sun, 20 Oct 2024 19:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_cache.c:785 bch2_btree_node_mem_alloc() warn:
 inconsistent returns 'trans'.
Message-ID: <202410201924.8umJaVS9-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 3c5d0b72a8e8c19c960e8fefb7463067e58b6bc4 bcachefs: fix failure to relock in bch2_btree_node_mem_alloc()
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-161-20241015 (https://download.01.org/0day-ci/archive/20241020/202410201924.8umJaVS9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201924.8umJaVS9-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_cache.c:785 bch2_btree_node_mem_alloc() warn: inconsistent returns 'trans'.

vim +/trans +785 fs/bcachefs/btree_cache.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  664  
1306f87de399a0 Kent Overstreet 2023-03-02  665  struct btree *bch2_btree_node_mem_alloc(struct btree_trans *trans, bool pcpu_read_locks)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  666  {
1306f87de399a0 Kent Overstreet 2023-03-02  667  	struct bch_fs *c = trans->c;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  668  	struct btree_cache *bc = &c->btree_cache;
3098553776a16c Kent Overstreet 2022-03-04  669  	struct list_head *freed = pcpu_read_locks
3098553776a16c Kent Overstreet 2022-03-04  670  		? &bc->freed_pcpu
3098553776a16c Kent Overstreet 2022-03-04  671  		: &bc->freed_nonpcpu;
5b3f780540aa5e Kent Overstreet 2022-03-04  672  	struct btree *b, *b2;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  673  	u64 start_time = local_clock();
e0dfc08bc2f509 Kent Overstreet 2019-06-11  674  	unsigned flags;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  675  
e0dfc08bc2f509 Kent Overstreet 2019-06-11  676  	flags = memalloc_nofs_save();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  677  	mutex_lock(&bc->lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  678  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  679  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  680  	 * We never free struct btree itself, just the memory that holds the on
1c6fdbd8f2465d Kent Overstreet 2017-03-16  681  	 * disk node. Check the freed list before allocating a new one:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  682  	 */
3098553776a16c Kent Overstreet 2022-03-04  683  	list_for_each_entry(b, freed, list)
bceacfa97ec8b6 Daniel Hill     2022-09-30  684  		if (!btree_node_reclaim(c, b, false)) {
e38821f322d97c Kent Overstreet 2020-06-09  685  			list_del_init(&b->list);
5b3f780540aa5e Kent Overstreet 2022-03-04  686  			goto got_node;
5b3f780540aa5e Kent Overstreet 2022-03-04  687  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  688  
e1d29c5fa1205c Kent Overstreet 2023-05-28  689  	b = __btree_node_mem_alloc(c, GFP_NOWAIT|__GFP_NOWARN);
c36ff038fd3af6 Kent Overstreet 2022-09-25  690  	if (!b) {
c36ff038fd3af6 Kent Overstreet 2022-09-25  691  		mutex_unlock(&bc->lock);
e1d29c5fa1205c Kent Overstreet 2023-05-28  692  		bch2_trans_unlock(trans);
c36ff038fd3af6 Kent Overstreet 2022-09-25  693  		b = __btree_node_mem_alloc(c, GFP_KERNEL);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  694  		if (!b)
c36ff038fd3af6 Kent Overstreet 2022-09-25  695  			goto err;
c36ff038fd3af6 Kent Overstreet 2022-09-25  696  		mutex_lock(&bc->lock);
c36ff038fd3af6 Kent Overstreet 2022-09-25  697  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  698  
0d2234a79e877b Kent Overstreet 2023-05-20  699  	bch2_btree_lock_init(&b->c, pcpu_read_locks ? SIX_LOCK_INIT_PCPU : 0);
3098553776a16c Kent Overstreet 2022-03-04  700  
c43a6ef9a0747e Kent Overstreet 2020-06-06  701  	BUG_ON(!six_trylock_intent(&b->c.lock));
c43a6ef9a0747e Kent Overstreet 2020-06-06  702  	BUG_ON(!six_trylock_write(&b->c.lock));
5b3f780540aa5e Kent Overstreet 2022-03-04  703  got_node:
5b3f780540aa5e Kent Overstreet 2022-03-04  704  
5b3f780540aa5e Kent Overstreet 2022-03-04  705  	/*
5b3f780540aa5e Kent Overstreet 2022-03-04  706  	 * btree_free() doesn't free memory; it sticks the node on the end of
5b3f780540aa5e Kent Overstreet 2022-03-04  707  	 * the list. Check if there's any freed nodes there:
5b3f780540aa5e Kent Overstreet 2022-03-04  708  	 */
5b3f780540aa5e Kent Overstreet 2022-03-04  709  	list_for_each_entry(b2, &bc->freeable, list)
bceacfa97ec8b6 Daniel Hill     2022-09-30  710  		if (!btree_node_reclaim(c, b2, false)) {
5b3f780540aa5e Kent Overstreet 2022-03-04  711  			swap(b->data, b2->data);
5b3f780540aa5e Kent Overstreet 2022-03-04  712  			swap(b->aux_data, b2->aux_data);
3098553776a16c Kent Overstreet 2022-03-04  713  			btree_node_to_freedlist(bc, b2);
5b3f780540aa5e Kent Overstreet 2022-03-04  714  			six_unlock_write(&b2->c.lock);
5b3f780540aa5e Kent Overstreet 2022-03-04  715  			six_unlock_intent(&b2->c.lock);
5b3f780540aa5e Kent Overstreet 2022-03-04  716  			goto got_mem;
e38821f322d97c Kent Overstreet 2020-06-09  717  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  718  
5b3f780540aa5e Kent Overstreet 2022-03-04  719  	mutex_unlock(&bc->lock);
5b3f780540aa5e Kent Overstreet 2022-03-04  720  
e1d29c5fa1205c Kent Overstreet 2023-05-28  721  	if (btree_node_data_alloc(c, b, GFP_NOWAIT|__GFP_NOWARN)) {
e1d29c5fa1205c Kent Overstreet 2023-05-28  722  		bch2_trans_unlock(trans);
e1d29c5fa1205c Kent Overstreet 2023-05-28  723  		if (btree_node_data_alloc(c, b, GFP_KERNEL|__GFP_NOWARN))
e38821f322d97c Kent Overstreet 2020-06-09  724  			goto err;
e1d29c5fa1205c Kent Overstreet 2023-05-28  725  	}
e38821f322d97c Kent Overstreet 2020-06-09  726  
e38821f322d97c Kent Overstreet 2020-06-09  727  	mutex_lock(&bc->lock);
e38821f322d97c Kent Overstreet 2020-06-09  728  	bc->used++;
5b3f780540aa5e Kent Overstreet 2022-03-04  729  got_mem:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  730  	mutex_unlock(&bc->lock);
e38821f322d97c Kent Overstreet 2020-06-09  731  
e38821f322d97c Kent Overstreet 2020-06-09  732  	BUG_ON(btree_node_hashed(b));
19d5432445fd08 Kent Overstreet 2021-07-10  733  	BUG_ON(btree_node_dirty(b));
e38821f322d97c Kent Overstreet 2020-06-09  734  	BUG_ON(btree_node_write_in_flight(b));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  735  out:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  736  	b->flags		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  737  	b->written		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  738  	b->nsets		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  739  	b->sib_u64s[0]		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  740  	b->sib_u64s[1]		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  741  	b->whiteout_u64s	= 0;
29364f34530d30 Kent Overstreet 2020-11-02  742  	bch2_btree_keys_init(b);
e68031fb468aff Kent Overstreet 2021-04-29  743  	set_btree_node_accessed(b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  744  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  745  	bch2_time_stats_update(&c->times[BCH_TIME_btree_node_mem_alloc],
1c6fdbd8f2465d Kent Overstreet 2017-03-16  746  			       start_time);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  747  
692c3f0601bd1b Kent Overstreet 2020-05-27  748  	memalloc_nofs_restore(flags);
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  749  
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  750  	int ret = bch2_trans_relock(trans);
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  751  	if (unlikely(ret)) {
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  752  		bch2_btree_node_to_freelist(c, b);
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  753  		return ERR_PTR(ret);
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  754  	}
3c5d0b72a8e8c1 Kent Overstreet 2024-08-19  755  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  756  	return b;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  757  err:
e38821f322d97c Kent Overstreet 2020-06-09  758  	mutex_lock(&bc->lock);
c36ff038fd3af6 Kent Overstreet 2022-09-25  759  
5b3f780540aa5e Kent Overstreet 2022-03-04  760  	/* Try to cannibalize another cached btree node: */
5b3f780540aa5e Kent Overstreet 2022-03-04  761  	if (bc->alloc_lock == current) {
5b3f780540aa5e Kent Overstreet 2022-03-04  762  		b2 = btree_node_cannibalize(c);
0b438c5bfaebda Kent Overstreet 2023-05-22  763  		clear_btree_node_just_written(b2);
5b3f780540aa5e Kent Overstreet 2022-03-04  764  		bch2_btree_node_hash_remove(bc, b2);
e38821f322d97c Kent Overstreet 2020-06-09  765  
e38821f322d97c Kent Overstreet 2020-06-09  766  		if (b) {
5b3f780540aa5e Kent Overstreet 2022-03-04  767  			swap(b->data, b2->data);
5b3f780540aa5e Kent Overstreet 2022-03-04  768  			swap(b->aux_data, b2->aux_data);
3098553776a16c Kent Overstreet 2022-03-04  769  			btree_node_to_freedlist(bc, b2);
5b3f780540aa5e Kent Overstreet 2022-03-04  770  			six_unlock_write(&b2->c.lock);
5b3f780540aa5e Kent Overstreet 2022-03-04  771  			six_unlock_intent(&b2->c.lock);
5b3f780540aa5e Kent Overstreet 2022-03-04  772  		} else {
5b3f780540aa5e Kent Overstreet 2022-03-04  773  			b = b2;
5b3f780540aa5e Kent Overstreet 2022-03-04  774  			list_del_init(&b->list);
e38821f322d97c Kent Overstreet 2020-06-09  775  		}
e38821f322d97c Kent Overstreet 2020-06-09  776  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  777  		mutex_unlock(&bc->lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  778  
a564c9fad58197 Kent Overstreet 2023-12-02  779  		trace_and_count(c, btree_cache_cannibalize, trans);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  780  		goto out;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  781  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  782  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  783  	mutex_unlock(&bc->lock);
692c3f0601bd1b Kent Overstreet 2020-05-27  784  	memalloc_nofs_restore(flags);
65d48e35250fe4 Kent Overstreet 2023-03-14 @785  	return ERR_PTR(-BCH_ERR_ENOMEM_btree_node_mem_alloc);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  786  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  787  

:::::: The code at line 785 was first introduced by commit
:::::: 65d48e35250fe46a560dffa13876830336b152c9 bcachefs: Private error codes: ENOMEM

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
