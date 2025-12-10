Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFF2F6173
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409238; cv=none; b=a2qnNkt4FeH+7xTFDq3NuBiG9ohQ/41DMGXRtmhVNsROHtxQQlzMgYYwobvRa85AtkWUsgYScHtv38MkxIvneUci+NZ/IL9yvIJGJ0SwUktTCOXGo8go6asCURvvQCqdfZtbffduwxv9dfuKi9VydoX2ZKI+SjVpxMoo3PkoGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409238; c=relaxed/simple;
	bh=Sbdc/2nhX1LS+e9Gd4hIFNCKw1uvRPUt7Mf5qj2Vxao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1PrPW4JqwVjj+PyXAhcOxwtzFDm9aP+TyhbjIKPEW3TxUW2NU/6MbSTd8IpxDQODVC3Gag9HGQCknRndspAS2TZrXKVIrN6ZTYgLsZpUbPmSbMxILWtEHVnjDyCiNN8wAK/nyyy/FatEiSxEWuLsjKKaKZHe1UW1nPMRJ9S+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/1EXps9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/1EXps9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765409230; x=1796945230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sbdc/2nhX1LS+e9Gd4hIFNCKw1uvRPUt7Mf5qj2Vxao=;
  b=F/1EXps9EGdX+bsVZfxzoN6OxU4oCqAB0mmqWzfOI7OXwFSysseirRyF
   qO2KeHdqOrTIZj8V6xyzq22ktLVZwG9oe5PF1XV/Y/fqRa7CHD8KeIWzi
   wO1+eJPdGNCA+3Q3wsKVVjCkN+0YRumB38UA2uJt3W1lTXHFi9bkC+/3t
   neEK8ayaHvjYUts2te6JSTbNQZ4irJ7Z8Mx304/CXnP3wbCdsz+Ueh5US
   0Nr5v2UrWKgMe6mEL5ROb9hRH2LGs9Qx9zmZDvZdbxvGB5CI9ZmseuZ+l
   QVP6uSzPwcrqGW2k3t6HKH7eFtcdrv6upznoWc33YW7usxRCRb1am7bml
   A==;
X-CSE-ConnectionGUID: pG6ZUZ0gREaiPvn9nVjY5A==
X-CSE-MsgGUID: 3lviwFmhQN25gkE8C5JU8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78088736"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78088736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:27:05 -0800
X-CSE-ConnectionGUID: pDiIloFPSOWi2lE6QWrXCQ==
X-CSE-MsgGUID: ng3MR7v4TEKNYSvYJbyagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197130160"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 15:27:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTaH-000000003rx-3qNt;
	Wed, 10 Dec 2025 23:27:01 +0000
Date: Thu, 11 Dec 2025 07:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 458/1113] fs/bcachefs/btree/cache.c:886
 bch2_btree_node_mem_alloc() warn: inconsistent returns 'trans'.
Message-ID: <202512110727.JJYarsa9-lkp@intel.com>
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

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   aa5d9ca94121960a4ab2173aea338675a1e0857b
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/1113] bcachefs: move btree files to subdir
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: mips-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110727.JJYarsa9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110727.JJYarsa9-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/cache.c:886 bch2_btree_node_mem_alloc() warn: inconsistent returns 'trans'.

vim +/trans +886 fs/bcachefs/btree/cache.c

1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  768  
1306f87de399a0 fs/bcachefs/btree_cache.c Kent Overstreet 2023-03-02  769  struct btree *bch2_btree_node_mem_alloc(struct btree_trans *trans, bool pcpu_read_locks)
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  770  {
1306f87de399a0 fs/bcachefs/btree_cache.c Kent Overstreet 2023-03-02  771  	struct bch_fs *c = trans->c;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  772  	struct btree_cache *bc = &c->btree_cache;
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  773  	struct list_head *freed = pcpu_read_locks
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  774  		? &bc->freed_pcpu
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  775  		: &bc->freed_nonpcpu;
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  776  	struct btree *b, *b2;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  777  	u64 start_time = local_clock();
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  778  
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  779  	mutex_lock(&bc->lock);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  780  
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  781  	/*
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  782  	 * We never free struct btree itself, just the memory that holds the on
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  783  	 * disk node. Check the freed list before allocating a new one:
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  784  	 */
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  785  	list_for_each_entry(b, freed, list)
68aaeb7c8bc8fd fs/bcachefs/btree_cache.c Kent Overstreet 2025-04-13  786  		if (!btree_node_reclaim(c, b)) {
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  787  			list_del_init(&b->list);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  788  			goto got_node;
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  789  		}
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  790  
8b584815d368e2 fs/bcachefs/btree_cache.c Qianfeng Rong   2025-08-03  791  	b = __btree_node_mem_alloc(c, GFP_NOWAIT);
677bdb7346b6fd fs/bcachefs/btree_cache.c Alan Huang      2025-02-26  792  	if (b) {
677bdb7346b6fd fs/bcachefs/btree_cache.c Alan Huang      2025-02-26  793  		bch2_btree_lock_init(&b->c, pcpu_read_locks ? SIX_LOCK_INIT_PCPU : 0, GFP_NOWAIT);
677bdb7346b6fd fs/bcachefs/btree_cache.c Alan Huang      2025-02-26  794  	} else {
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  795  		mutex_unlock(&bc->lock);
e1d29c5fa1205c fs/bcachefs/btree_cache.c Kent Overstreet 2023-05-28  796  		bch2_trans_unlock(trans);
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  797  		b = __btree_node_mem_alloc(c, GFP_KERNEL);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  798  		if (!b)
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  799  			goto err;
677bdb7346b6fd fs/bcachefs/btree_cache.c Alan Huang      2025-02-26  800  		bch2_btree_lock_init(&b->c, pcpu_read_locks ? SIX_LOCK_INIT_PCPU : 0, GFP_KERNEL);
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  801  		mutex_lock(&bc->lock);
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  802  	}
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  803  
c43a6ef9a0747e fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-06  804  	BUG_ON(!six_trylock_intent(&b->c.lock));
c43a6ef9a0747e fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-06  805  	BUG_ON(!six_trylock_write(&b->c.lock));
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  806  
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  807  got_node:
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  808  	/*
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  809  	 * btree_free() doesn't free memory; it sticks the node on the end of
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  810  	 * the list. Check if there's any freed nodes there:
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  811  	 */
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  812  	list_for_each_entry(b2, &bc->freeable, list)
68aaeb7c8bc8fd fs/bcachefs/btree_cache.c Kent Overstreet 2025-04-13  813  		if (!btree_node_reclaim(c, b2)) {
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  814  			swap(b->data, b2->data);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  815  			swap(b->aux_data, b2->aux_data);
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  816  
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  817  			list_del_init(&b2->list);
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  818  			--bc->nr_freeable;
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  819  			btree_node_to_freedlist(bc, b2);
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  820  			mutex_unlock(&bc->lock);
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  821  
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  822  			six_unlock_write(&b2->c.lock);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  823  			six_unlock_intent(&b2->c.lock);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  824  			goto got_mem;
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  825  		}
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  826  
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  827  	mutex_unlock(&bc->lock);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  828  
8b584815d368e2 fs/bcachefs/btree_cache.c Qianfeng Rong   2025-08-03  829  	if (btree_node_data_alloc(c, b, GFP_NOWAIT)) {
e1d29c5fa1205c fs/bcachefs/btree_cache.c Kent Overstreet 2023-05-28  830  		bch2_trans_unlock(trans);
e1d29c5fa1205c fs/bcachefs/btree_cache.c Kent Overstreet 2023-05-28  831  		if (btree_node_data_alloc(c, b, GFP_KERNEL|__GFP_NOWARN))
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  832  			goto err;
e1d29c5fa1205c fs/bcachefs/btree_cache.c Kent Overstreet 2023-05-28  833  	}
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  834  
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  835  got_mem:
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  836  	BUG_ON(!list_empty(&b->list));
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  837  	BUG_ON(btree_node_hashed(b));
19d5432445fd08 fs/bcachefs/btree_cache.c Kent Overstreet 2021-07-10  838  	BUG_ON(btree_node_dirty(b));
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  839  	BUG_ON(btree_node_write_in_flight(b));
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  840  out:
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  841  	b->flags		= 0;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  842  	b->written		= 0;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  843  	b->nsets		= 0;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  844  	b->sib_u64s[0]		= 0;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  845  	b->sib_u64s[1]		= 0;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  846  	b->whiteout_u64s	= 0;
29364f34530d30 fs/bcachefs/btree_cache.c Kent Overstreet 2020-11-02  847  	bch2_btree_keys_init(b);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  848  
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  849  	bch2_time_stats_update(&c->times[BCH_TIME_btree_node_mem_alloc],
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  850  			       start_time);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  851  
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  852  	int ret = bch2_trans_relock(trans);
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  853  	if (unlikely(ret)) {
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  854  		bch2_btree_node_to_freelist(c, b);
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  855  		return ERR_PTR(ret);
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  856  	}
3c5d0b72a8e8c1 fs/bcachefs/btree_cache.c Kent Overstreet 2024-08-19  857  
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  858  	return b;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  859  err:
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  860  	mutex_lock(&bc->lock);
c36ff038fd3af6 fs/bcachefs/btree_cache.c Kent Overstreet 2022-09-25  861  
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  862  	/* Try to cannibalize another cached btree node: */
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  863  	if (bc->alloc_lock == current) {
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  864  		b2 = btree_node_cannibalize(c);
0b438c5bfaebda fs/bcachefs/btree_cache.c Kent Overstreet 2023-05-22  865  		clear_btree_node_just_written(b2);
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  866  		__bch2_btree_node_hash_remove(bc, b2);
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  867  
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  868  		if (b) {
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  869  			swap(b->data, b2->data);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  870  			swap(b->aux_data, b2->aux_data);
3098553776a16c fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  871  			btree_node_to_freedlist(bc, b2);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  872  			six_unlock_write(&b2->c.lock);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  873  			six_unlock_intent(&b2->c.lock);
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  874  		} else {
5b3f780540aa5e fs/bcachefs/btree_cache.c Kent Overstreet 2022-03-04  875  			b = b2;
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  876  		}
e38821f322d97c fs/bcachefs/btree_cache.c Kent Overstreet 2020-06-09  877  
baefd3f849ed95 fs/bcachefs/btree_cache.c Kent Overstreet 2024-10-31  878  		BUG_ON(!list_empty(&b->list));
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  879  		mutex_unlock(&bc->lock);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  880  
a564c9fad58197 fs/bcachefs/btree_cache.c Kent Overstreet 2023-12-02  881  		trace_and_count(c, btree_cache_cannibalize, trans);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  882  		goto out;
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  883  	}
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  884  
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  885  	mutex_unlock(&bc->lock);
65d48e35250fe4 fs/bcachefs/btree_cache.c Kent Overstreet 2023-03-14 @886  	return ERR_PTR(-BCH_ERR_ENOMEM_btree_node_mem_alloc);
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  887  }
1c6fdbd8f2465d fs/bcachefs/btree_cache.c Kent Overstreet 2017-03-16  888  

:::::: The code at line 886 was first introduced by commit
:::::: 65d48e35250fe46a560dffa13876830336b152c9 bcachefs: Private error codes: ENOMEM

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
