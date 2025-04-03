Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E15339D
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Apr 2025 05:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743657624; cv=none; b=kI+GonAU1b2Gi0jGqrASx7xWczeN/Lotq4QH1eeR+l4Ev95+XzeYMyQFFeUVylS6j8wd90Hvrsdmal+wzSegTGWQ2rgSR1Ew8AFizqTTWRnom/lokpTZfX9Tn3ymvt5J5Wllrinrs2kTYjiHbiSJYyswSomTl+y44Uhs30R66cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743657624; c=relaxed/simple;
	bh=J1xEzlcSNC4+2TM8NbJ9qUwl/FR4NSH2ge7nrnkHnvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+0siVZN3dOKom33N5X52kkRA1p4OzK5MbWK2dG6simow6qm4xxvgxWUHni6RBcY+VC21pgYRVzd0j3LA6cVQ9aeB/8v8qJmaBBG6IhpR6kGBYrSYY6nof0FMuPIaBrPHfuWUGEUtmghV+fR0xH1AF83cNdQhdRENNvkbXNXXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKKrxXwK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKKrxXwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743657621; x=1775193621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1xEzlcSNC4+2TM8NbJ9qUwl/FR4NSH2ge7nrnkHnvk=;
  b=MKKrxXwKhWzMkTVY+bqKqshJoTiPA7bUJOJ927ukmoZ+ti7O133BSqo+
   ldAWZV9E5/Q1DZ2qAf/wQ6TQr40F7AN4NgQZ2fQ3oX+gYkrknnYh5RqUc
   XDr+F1QjvIeNp3OJj23lCeV4NrJPO5Fqzhsj7ksHXe3PHfSK5Fd88nIQU
   hepM7biUIA13AifVa71xOdq4GTXXKIIhk4zmslwl1I8gzIT0Q78kKcJGY
   M+iT/aThYAb+4MgSTsHTyWuRRl/b9m+75psKjrESJf3OjJBQqel9YYvj3
   WrtxQisWUnljB5Su1UG8kIT29RDtGV5yKkl+0cEMMVFkympJIR6Ir5Nra
   g==;
X-CSE-ConnectionGUID: hgmfDcgWSt2v0Xth0NfvBQ==
X-CSE-MsgGUID: F+K47pBjTZi8pgmpDpO2Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48711567"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48711567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 22:20:20 -0700
X-CSE-ConnectionGUID: H3qkMhFTSp6tmvtJOQh6UQ==
X-CSE-MsgGUID: WM3je8AZTCa3UeeQCMb+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132107456"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2025 22:20:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Czw-00005u-2p;
	Thu, 03 Apr 2025 05:20:16 +0000
Date: Thu, 3 Apr 2025 13:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:trylock 7/7] drivers/char/random.c:368 crng_make_state()
 warn: statement has no effect 31
Message-ID: <202504031341.U1gGPKSZ-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   ba0c224914b31e80b0b9e310d72f508a639fb465
commit: fab079e69ebd7601b06bfef8a410e803dd7d8130 [7/7] locking/local_lock, mm: Replace localtry_ helpers with local_trylock_t type
:::::: branch date: 5 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031341.U1gGPKSZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504031341.U1gGPKSZ-lkp@intel.com/

New smatch warnings:
drivers/char/random.c:368 crng_make_state() warn: statement has no effect 31
drivers/char/random.c:551 get_random_u8() warn: statement has no effect 31
drivers/char/random.c:551 get_random_u8() warn: statement has no effect 31
drivers/char/random.c:552 get_random_u16() warn: statement has no effect 31
drivers/char/random.c:552 get_random_u16() warn: statement has no effect 31
drivers/char/random.c:553 get_random_u32() warn: statement has no effect 31
drivers/char/random.c:553 get_random_u32() warn: statement has no effect 31
drivers/char/random.c:554 get_random_u64() warn: statement has no effect 31
drivers/char/random.c:554 get_random_u64() warn: statement has no effect 31
mm/swap.c:190 __folio_batch_add_and_move() warn: statement has no effect 31
mm/swap.c:356 __lru_cache_activate_folio() warn: statement has no effect 31
mm/swap.c:650 lru_add_drain_cpu() warn: statement has no effect 31
mm/swap.c:729 lru_add_drain() warn: statement has no effect 31
mm/swap.c:743 lru_add_and_bh_lrus_drain() warn: statement has no effect 31
mm/swap.c:752 lru_add_drain_cpu_zone() warn: statement has no effect 31
lib/radix-tree.c:334 __radix_tree_preload() warn: statement has no effect 31
lib/radix-tree.c:383 radix_tree_maybe_preload() warn: statement has no effect 31
lib/radix-tree.c:1472 idr_preload() warn: statement has no effect 31
mm/mlock.c:216 mlock_drain_local() warn: statement has no effect 31
mm/mlock.c:246 mlock_folio() warn: statement has no effect 31
mm/mlock.c:272 mlock_new_folio() warn: statement has no effect 31
mm/mlock.c:294 munlock_folio() warn: statement has no effect 31
mm/slub.c:3283 flush_slab() warn: statement has no effect 31
mm/slub.c:3739 ___slab_alloc() warn: statement has no effect 31
mm/slub.c:5268 __kmem_cache_alloc_bulk() warn: statement has no effect 31
mm/memcontrol.c:1809 consume_stock() warn: statement has no effect 31
mm/memcontrol.c:1859 drain_local_stock() warn: statement has no effect 31
mm/memcontrol.c:1909 refill_stock() warn: statement has no effect 31
mm/memcontrol.c:1966 memcg_hotplug_cpu_dead() warn: statement has no effect 31
mm/memcontrol.c:2789 mod_objcg_state() warn: statement has no effect 31
mm/memcontrol.c:2848 consume_obj_stock() warn: statement has no effect 31
mm/memcontrol.c:2948 refill_obj_stock() warn: statement has no effect 31

Old smatch warnings:
drivers/char/random.c:393 crng_make_state() warn: statement has no effect 31
drivers/char/random.c:1636 proc_do_uuid() warn: (struct ctl_table)->procname cannot be NULL. Expression : fake_table.procname
drivers/char/random.c:1636 proc_do_uuid() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fake_table.proc_handler
lib/radix-tree.c:337 __radix_tree_preload() warn: statement has no effect 31
lib/radix-tree.c:341 __radix_tree_preload() warn: statement has no effect 31

vim +368 drivers/char/random.c

1e7f583af67be4 Theodore Ts'o      2016-05-02  332  
c92e040d575a73 Theodore Ts'o      2016-05-04  333  /*
186873c549df11 Jason A. Donenfeld 2022-02-07  334   * This function returns a ChaCha state that you may use for generating
186873c549df11 Jason A. Donenfeld 2022-02-07  335   * random data. It also returns up to 32 bytes on its own of random data
186873c549df11 Jason A. Donenfeld 2022-02-07  336   * that may be used; random_data_len may not be greater than 32.
c92e040d575a73 Theodore Ts'o      2016-05-04  337   */
186873c549df11 Jason A. Donenfeld 2022-02-07  338  static void crng_make_state(u32 chacha_state[CHACHA_STATE_WORDS],
186873c549df11 Jason A. Donenfeld 2022-02-07  339  			    u8 *random_data, size_t random_data_len)
c92e040d575a73 Theodore Ts'o      2016-05-04  340  {
c92e040d575a73 Theodore Ts'o      2016-05-04  341  	unsigned long flags;
186873c549df11 Jason A. Donenfeld 2022-02-07  342  	struct crng *crng;
186873c549df11 Jason A. Donenfeld 2022-02-07  343  
186873c549df11 Jason A. Donenfeld 2022-02-07  344  	BUG_ON(random_data_len > 32);
186873c549df11 Jason A. Donenfeld 2022-02-07  345  
186873c549df11 Jason A. Donenfeld 2022-02-07  346  	/*
186873c549df11 Jason A. Donenfeld 2022-02-07  347  	 * For the fast path, we check whether we're ready, unlocked first, and
186873c549df11 Jason A. Donenfeld 2022-02-07  348  	 * then re-check once locked later. In the case where we're really not
5c3b747ef54fa2 Jason A. Donenfeld 2022-04-30  349  	 * ready, we do fast key erasure with the base_crng directly, extracting
e3d2c5e79a999a Jason A. Donenfeld 2022-05-08  350  	 * when crng_init is CRNG_EMPTY.
186873c549df11 Jason A. Donenfeld 2022-02-07  351  	 */
a96cfe2d427064 Jason A. Donenfeld 2022-03-08  352  	if (!crng_ready()) {
186873c549df11 Jason A. Donenfeld 2022-02-07  353  		bool ready;
186873c549df11 Jason A. Donenfeld 2022-02-07  354  
186873c549df11 Jason A. Donenfeld 2022-02-07  355  		spin_lock_irqsave(&base_crng.lock, flags);
186873c549df11 Jason A. Donenfeld 2022-02-07  356  		ready = crng_ready();
5c3b747ef54fa2 Jason A. Donenfeld 2022-04-30  357  		if (!ready) {
e3d2c5e79a999a Jason A. Donenfeld 2022-05-08  358  			if (crng_init == CRNG_EMPTY)
5c3b747ef54fa2 Jason A. Donenfeld 2022-04-30  359  				extract_entropy(base_crng.key, sizeof(base_crng.key));
186873c549df11 Jason A. Donenfeld 2022-02-07  360  			crng_fast_key_erasure(base_crng.key, chacha_state,
186873c549df11 Jason A. Donenfeld 2022-02-07  361  					      random_data, random_data_len);
5c3b747ef54fa2 Jason A. Donenfeld 2022-04-30  362  		}
186873c549df11 Jason A. Donenfeld 2022-02-07  363  		spin_unlock_irqrestore(&base_crng.lock, flags);
186873c549df11 Jason A. Donenfeld 2022-02-07  364  		if (!ready)
186873c549df11 Jason A. Donenfeld 2022-02-07  365  			return;
186873c549df11 Jason A. Donenfeld 2022-02-07  366  	}
c92e040d575a73 Theodore Ts'o      2016-05-04  367  
186873c549df11 Jason A. Donenfeld 2022-02-07 @368  	local_lock_irqsave(&crngs.lock, flags);
186873c549df11 Jason A. Donenfeld 2022-02-07  369  	crng = raw_cpu_ptr(&crngs);
186873c549df11 Jason A. Donenfeld 2022-02-07  370  
186873c549df11 Jason A. Donenfeld 2022-02-07  371  	/*
186873c549df11 Jason A. Donenfeld 2022-02-07  372  	 * If our per-cpu crng is older than the base_crng, then it means
186873c549df11 Jason A. Donenfeld 2022-02-07  373  	 * somebody reseeded the base_crng. In that case, we do fast key
186873c549df11 Jason A. Donenfeld 2022-02-07  374  	 * erasure on the base_crng, and use its output as the new key
186873c549df11 Jason A. Donenfeld 2022-02-07  375  	 * for our per-cpu crng. This brings us up to date with base_crng.
186873c549df11 Jason A. Donenfeld 2022-02-07  376  	 */
186873c549df11 Jason A. Donenfeld 2022-02-07  377  	if (unlikely(crng->generation != READ_ONCE(base_crng.generation))) {
186873c549df11 Jason A. Donenfeld 2022-02-07  378  		spin_lock(&base_crng.lock);
186873c549df11 Jason A. Donenfeld 2022-02-07  379  		crng_fast_key_erasure(base_crng.key, chacha_state,
186873c549df11 Jason A. Donenfeld 2022-02-07  380  				      crng->key, sizeof(crng->key));
186873c549df11 Jason A. Donenfeld 2022-02-07  381  		crng->generation = base_crng.generation;
186873c549df11 Jason A. Donenfeld 2022-02-07  382  		spin_unlock(&base_crng.lock);
c92e040d575a73 Theodore Ts'o      2016-05-04  383  	}
186873c549df11 Jason A. Donenfeld 2022-02-07  384  
186873c549df11 Jason A. Donenfeld 2022-02-07  385  	/*
186873c549df11 Jason A. Donenfeld 2022-02-07  386  	 * Finally, when we've made it this far, our per-cpu crng has an up
186873c549df11 Jason A. Donenfeld 2022-02-07  387  	 * to date key, and we can do fast key erasure with it to produce
186873c549df11 Jason A. Donenfeld 2022-02-07  388  	 * some random data and a ChaCha state for the caller. All other
186873c549df11 Jason A. Donenfeld 2022-02-07  389  	 * branches of this function are "unlikely", so most of the time we
186873c549df11 Jason A. Donenfeld 2022-02-07  390  	 * should wind up here immediately.
186873c549df11 Jason A. Donenfeld 2022-02-07  391  	 */
186873c549df11 Jason A. Donenfeld 2022-02-07  392  	crng_fast_key_erasure(crng->key, chacha_state, random_data, random_data_len);
186873c549df11 Jason A. Donenfeld 2022-02-07  393  	local_unlock_irqrestore(&crngs.lock, flags);
c92e040d575a73 Theodore Ts'o      2016-05-04  394  }
c92e040d575a73 Theodore Ts'o      2016-05-04  395  
a19402634c435a Jason A. Donenfeld 2022-05-13  396  static void _get_random_bytes(void *buf, size_t len)
e192be9d9a3055 Theodore Ts'o      2016-06-12  397  {
186873c549df11 Jason A. Donenfeld 2022-02-07  398  	u32 chacha_state[CHACHA_STATE_WORDS];
3655adc7089da4 Jason A. Donenfeld 2022-02-11  399  	u8 tmp[CHACHA_BLOCK_SIZE];
a19402634c435a Jason A. Donenfeld 2022-05-13  400  	size_t first_block_len;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  401  
a19402634c435a Jason A. Donenfeld 2022-05-13  402  	if (!len)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  403  		return;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  404  
a19402634c435a Jason A. Donenfeld 2022-05-13  405  	first_block_len = min_t(size_t, 32, len);
a19402634c435a Jason A. Donenfeld 2022-05-13  406  	crng_make_state(chacha_state, buf, first_block_len);
a19402634c435a Jason A. Donenfeld 2022-05-13  407  	len -= first_block_len;
a19402634c435a Jason A. Donenfeld 2022-05-13  408  	buf += first_block_len;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  409  
a19402634c435a Jason A. Donenfeld 2022-05-13  410  	while (len) {
a19402634c435a Jason A. Donenfeld 2022-05-13  411  		if (len < CHACHA_BLOCK_SIZE) {
3655adc7089da4 Jason A. Donenfeld 2022-02-11  412  			chacha20_block(chacha_state, tmp);
a19402634c435a Jason A. Donenfeld 2022-05-13  413  			memcpy(buf, tmp, len);
3655adc7089da4 Jason A. Donenfeld 2022-02-11  414  			memzero_explicit(tmp, sizeof(tmp));
3655adc7089da4 Jason A. Donenfeld 2022-02-11  415  			break;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  416  		}
3655adc7089da4 Jason A. Donenfeld 2022-02-11  417  
3655adc7089da4 Jason A. Donenfeld 2022-02-11  418  		chacha20_block(chacha_state, buf);
3655adc7089da4 Jason A. Donenfeld 2022-02-11  419  		if (unlikely(chacha_state[12] == 0))
3655adc7089da4 Jason A. Donenfeld 2022-02-11  420  			++chacha_state[13];
a19402634c435a Jason A. Donenfeld 2022-05-13  421  		len -= CHACHA_BLOCK_SIZE;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  422  		buf += CHACHA_BLOCK_SIZE;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  423  	}
3655adc7089da4 Jason A. Donenfeld 2022-02-11  424  
3655adc7089da4 Jason A. Donenfeld 2022-02-11  425  	memzero_explicit(chacha_state, sizeof(chacha_state));
3655adc7089da4 Jason A. Donenfeld 2022-02-11  426  }
3655adc7089da4 Jason A. Donenfeld 2022-02-11  427  
3655adc7089da4 Jason A. Donenfeld 2022-02-11  428  /*
19258d05b619d2 Jason A. Donenfeld 2022-11-04  429   * This returns random bytes in arbitrary quantities. The quality of the
19258d05b619d2 Jason A. Donenfeld 2022-11-04  430   * random bytes is good as /dev/urandom. In order to ensure that the
19258d05b619d2 Jason A. Donenfeld 2022-11-04  431   * randomness provided by this function is okay, the function
19258d05b619d2 Jason A. Donenfeld 2022-11-04  432   * wait_for_random_bytes() should be called and return 0 at least once
19258d05b619d2 Jason A. Donenfeld 2022-11-04  433   * at any point prior.
3655adc7089da4 Jason A. Donenfeld 2022-02-11  434   */
a19402634c435a Jason A. Donenfeld 2022-05-13  435  void get_random_bytes(void *buf, size_t len)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  436  {
cc1e127bfa95b5 Jason A. Donenfeld 2022-05-09  437  	warn_unseeded_randomness();
a19402634c435a Jason A. Donenfeld 2022-05-13  438  	_get_random_bytes(buf, len);
3655adc7089da4 Jason A. Donenfeld 2022-02-11  439  }
3655adc7089da4 Jason A. Donenfeld 2022-02-11  440  EXPORT_SYMBOL(get_random_bytes);
3655adc7089da4 Jason A. Donenfeld 2022-02-11  441  
1b388e7765f2ea Jens Axboe         2022-05-19  442  static ssize_t get_random_bytes_user(struct iov_iter *iter)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  443  {
3655adc7089da4 Jason A. Donenfeld 2022-02-11  444  	u32 chacha_state[CHACHA_STATE_WORDS];
1b388e7765f2ea Jens Axboe         2022-05-19  445  	u8 block[CHACHA_BLOCK_SIZE];
1b388e7765f2ea Jens Axboe         2022-05-19  446  	size_t ret = 0, copied;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  447  
1b388e7765f2ea Jens Axboe         2022-05-19  448  	if (unlikely(!iov_iter_count(iter)))
3655adc7089da4 Jason A. Donenfeld 2022-02-11  449  		return 0;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  450  
aba120cc101788 Jason A. Donenfeld 2022-04-05  451  	/*
aba120cc101788 Jason A. Donenfeld 2022-04-05  452  	 * Immediately overwrite the ChaCha key at index 4 with random
63b8ea5e4f1a87 Jason A. Donenfeld 2022-06-20  453  	 * bytes, in case userspace causes copy_to_iter() below to sleep
aba120cc101788 Jason A. Donenfeld 2022-04-05  454  	 * forever, so that we still retain forward secrecy in that case.
aba120cc101788 Jason A. Donenfeld 2022-04-05  455  	 */
aba120cc101788 Jason A. Donenfeld 2022-04-05  456  	crng_make_state(chacha_state, (u8 *)&chacha_state[4], CHACHA_KEY_SIZE);
aba120cc101788 Jason A. Donenfeld 2022-04-05  457  	/*
aba120cc101788 Jason A. Donenfeld 2022-04-05  458  	 * However, if we're doing a read of len <= 32, we don't need to
aba120cc101788 Jason A. Donenfeld 2022-04-05  459  	 * use chacha_state after, so we can simply return those bytes to
aba120cc101788 Jason A. Donenfeld 2022-04-05  460  	 * the user directly.
aba120cc101788 Jason A. Donenfeld 2022-04-05  461  	 */
1b388e7765f2ea Jens Axboe         2022-05-19  462  	if (iov_iter_count(iter) <= CHACHA_KEY_SIZE) {
1b388e7765f2ea Jens Axboe         2022-05-19  463  		ret = copy_to_iter(&chacha_state[4], CHACHA_KEY_SIZE, iter);
aba120cc101788 Jason A. Donenfeld 2022-04-05  464  		goto out_zero_chacha;
aba120cc101788 Jason A. Donenfeld 2022-04-05  465  	}
3655adc7089da4 Jason A. Donenfeld 2022-02-11  466  
5209aed5137880 Jason A. Donenfeld 2022-04-07  467  	for (;;) {
1b388e7765f2ea Jens Axboe         2022-05-19  468  		chacha20_block(chacha_state, block);
3655adc7089da4 Jason A. Donenfeld 2022-02-11  469  		if (unlikely(chacha_state[12] == 0))
3655adc7089da4 Jason A. Donenfeld 2022-02-11  470  			++chacha_state[13];
3655adc7089da4 Jason A. Donenfeld 2022-02-11  471  
1b388e7765f2ea Jens Axboe         2022-05-19  472  		copied = copy_to_iter(block, sizeof(block), iter);
1b388e7765f2ea Jens Axboe         2022-05-19  473  		ret += copied;
1b388e7765f2ea Jens Axboe         2022-05-19  474  		if (!iov_iter_count(iter) || copied != sizeof(block))
3655adc7089da4 Jason A. Donenfeld 2022-02-11  475  			break;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  476  
1b388e7765f2ea Jens Axboe         2022-05-19  477  		BUILD_BUG_ON(PAGE_SIZE % sizeof(block) != 0);
5209aed5137880 Jason A. Donenfeld 2022-04-07  478  		if (ret % PAGE_SIZE == 0) {
e3c1c4fd9e6d14 Jason A. Donenfeld 2022-04-06  479  			if (signal_pending(current))
e3c1c4fd9e6d14 Jason A. Donenfeld 2022-04-06  480  				break;
e3c1c4fd9e6d14 Jason A. Donenfeld 2022-04-06  481  			cond_resched();
e3c1c4fd9e6d14 Jason A. Donenfeld 2022-04-06  482  		}
5209aed5137880 Jason A. Donenfeld 2022-04-07  483  	}
3655adc7089da4 Jason A. Donenfeld 2022-02-11  484  
1b388e7765f2ea Jens Axboe         2022-05-19  485  	memzero_explicit(block, sizeof(block));
aba120cc101788 Jason A. Donenfeld 2022-04-05  486  out_zero_chacha:
aba120cc101788 Jason A. Donenfeld 2022-04-05  487  	memzero_explicit(chacha_state, sizeof(chacha_state));
5209aed5137880 Jason A. Donenfeld 2022-04-07  488  	return ret ? ret : -EFAULT;
3655adc7089da4 Jason A. Donenfeld 2022-02-11  489  }
3655adc7089da4 Jason A. Donenfeld 2022-02-11  490  
3655adc7089da4 Jason A. Donenfeld 2022-02-11  491  /*
3655adc7089da4 Jason A. Donenfeld 2022-02-11  492   * Batched entropy returns random integers. The quality of the random
3655adc7089da4 Jason A. Donenfeld 2022-02-11  493   * number is good as /dev/urandom. In order to ensure that the randomness
3655adc7089da4 Jason A. Donenfeld 2022-02-11  494   * provided by this function is okay, the function wait_for_random_bytes()
3655adc7089da4 Jason A. Donenfeld 2022-02-11  495   * should be called and return 0 at least once at any point prior.
3655adc7089da4 Jason A. Donenfeld 2022-02-11  496   */
3655adc7089da4 Jason A. Donenfeld 2022-02-11  497  
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  498  #define DEFINE_BATCHED_ENTROPY(type)						\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  499  struct batch_ ##type {								\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  500  	/*									\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  501  	 * We make this 1.5x a ChaCha block, so that we get the			\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  502  	 * remaining 32 bytes from fast key erasure, plus one full		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  503  	 * block from the detached ChaCha state. We can increase		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  504  	 * the size of this later if needed so long as we keep the		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  505  	 * formula of (integer_blocks + 0.5) * CHACHA_BLOCK_SIZE.		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  506  	 */									\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  507  	type entropy[CHACHA_BLOCK_SIZE * 3 / (2 * sizeof(type))];		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  508  	local_lock_t lock;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  509  	unsigned long generation;						\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  510  	unsigned int position;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  511  };										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  512  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  513  static DEFINE_PER_CPU(struct batch_ ##type, batched_entropy_ ##type) = {	\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  514  	.lock = INIT_LOCAL_LOCK(batched_entropy_ ##type.lock),			\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  515  	.position = UINT_MAX							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  516  };										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  517  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  518  type get_random_ ##type(void)							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  519  {										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  520  	type ret;								\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  521  	unsigned long flags;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  522  	struct batch_ ##type *batch;						\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  523  	unsigned long next_gen;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  524  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  525  	warn_unseeded_randomness();						\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  526  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  527  	if  (!crng_ready()) {							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  528  		_get_random_bytes(&ret, sizeof(ret));				\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  529  		return ret;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  530  	}									\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  531  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  532  	local_lock_irqsave(&batched_entropy_ ##type.lock, flags);		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  533  	batch = raw_cpu_ptr(&batched_entropy_##type);				\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  534  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  535  	next_gen = READ_ONCE(base_crng.generation);				\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  536  	if (batch->position >= ARRAY_SIZE(batch->entropy) ||			\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  537  	    next_gen != batch->generation) {					\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  538  		_get_random_bytes(batch->entropy, sizeof(batch->entropy));	\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  539  		batch->position = 0;						\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  540  		batch->generation = next_gen;					\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  541  	}									\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  542  										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  543  	ret = batch->entropy[batch->position];					\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  544  	batch->entropy[batch->position] = 0;					\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  545  	++batch->position;							\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  546  	local_unlock_irqrestore(&batched_entropy_ ##type.lock, flags);		\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  547  	return ret;								\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  548  }										\
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  549  EXPORT_SYMBOL(get_random_ ##type);
3092adcef3ffd2 Jason A. Donenfeld 2022-05-15  550  
585cd5fe9f7378 Jason A. Donenfeld 2022-09-28 @551  DEFINE_BATCHED_ENTROPY(u8)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @552  DEFINE_BATCHED_ENTROPY(u16)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @553  DEFINE_BATCHED_ENTROPY(u32)
a890d1c657ecba Jason A. Donenfeld 2022-10-05 @554  DEFINE_BATCHED_ENTROPY(u64)
3655adc7089da4 Jason A. Donenfeld 2022-02-11  555  

:::::: The code at line 368 was first introduced by commit
:::::: 186873c549df11b63e17062f863654e1501e1524 random: use simpler fast key erasure flow on per-cpu keys

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
