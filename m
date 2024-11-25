Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA1188724
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 22:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732572225; cv=none; b=CgwMiGEn4sumqva93D0JmDjD5lZFgvGJ0Xl4YjNlZbq5dFUaMfzwBtT8WNYsTZ7plJ/QSiXw9xMh76qJKjUEXCHlXhD/BbTn9NImn742FORcjGPRwOg5NseIrn8c/3rgBtO0fFUB37JzYYXVxO37Iy6IB+X2iR+rZ09o4wMdk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732572225; c=relaxed/simple;
	bh=nAY/yf8EgtLFMbHniqzokYRQqm85KZvqVjQUf5rCg9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnf/qNY2UMl9I1OwhWMuUcRuSH4h7pc7k6dNJAoG4UUhpPrQ211pOwtkR8r8hg8jH6RaS8nSRBJAK1DMlKIsTj1FSRHBtdvE9pgHvgkFrBCypsjon7o24LpAi0LeJ3yz4dN6WSe8CGDEWOSdy028IrvIO89BUM8QZEBlRbyyDWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjt+Nzye; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjt+Nzye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732572223; x=1764108223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAY/yf8EgtLFMbHniqzokYRQqm85KZvqVjQUf5rCg9c=;
  b=Hjt+Nzye2H0oIwLxyc/Y8ekWY6YVc7eSha26ZN2Tcl656N341rXrteT3
   egMeKqqrKqyZhSGq14R/DUcc6S8KBFMbswMIsiMNWec7BOZA5nvbIcm9U
   1K8j++Ii6gx84/fEvktN4rYtnO/WArOmIsJCOmEH2zp45NRGCVU7YXmq9
   p3ceWehMShJPG8kJuiT2WPLH/dm1p3eUEMxQwo9hSzkEfwuMgerikdXcO
   cjHo5tlfrUbgfr7K18tWVCnNmzOguUm53yN68qpU1KfPFQx41BjGuSdjn
   Agby+zUPLTvFwNtrBRDBzYIEwDntNrZQFQHoGxpmb1SpHpGdGs58+Dvjc
   Q==;
X-CSE-ConnectionGUID: KIxhJ03oQDeX0863MXMs2w==
X-CSE-MsgGUID: LEFbxPMXQ7S5E2rN7BSkDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50115175"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="50115175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 14:03:43 -0800
X-CSE-ConnectionGUID: TYNYf+XVRL2otL3/56yaeQ==
X-CSE-MsgGUID: kA7koT/iS0WYHmi2t4L5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91823476"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2024 14:03:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFhBD-0006pt-0b;
	Mon, 25 Nov 2024 22:03:39 +0000
Date: Tue, 26 Nov 2024 06:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/libfc/fc_exch.c:2543 fc_exch_mgr_alloc() warn:
 returning freed memory 'mp' (line 2542)
Message-ID: <202411260532.mLp9mN3d-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 mm: enumerate all gfp flags
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r071-20241124 (https://download.01.org/0day-ci/archive/20241126/202411260532.mLp9mN3d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411260532.mLp9mN3d-lkp@intel.com/

smatch warnings:
drivers/scsi/libfc/fc_exch.c:2543 fc_exch_mgr_alloc() warn: returning freed memory 'mp' (line 2542)

vim +/mp +2543 drivers/scsi/libfc/fc_exch.c

174e1ebffd30a7 Chris Leech     2009-11-03  2453  
3a3b42bf89a9b9 Robert Love     2009-11-03  2454  /**
3a3b42bf89a9b9 Robert Love     2009-11-03  2455   * fc_exch_mgr_alloc() - Allocate an exchange manager
3a3b42bf89a9b9 Robert Love     2009-11-03  2456   * @lport:   The local port that the new EM will be associated with
3a3b42bf89a9b9 Robert Love     2009-11-03  2457   * @class:   The default FC class for new exchanges
3a3b42bf89a9b9 Robert Love     2009-11-03  2458   * @min_xid: The minimum XID for exchanges from the new EM
3a3b42bf89a9b9 Robert Love     2009-11-03  2459   * @max_xid: The maximum XID for exchanges from the new EM
3a3b42bf89a9b9 Robert Love     2009-11-03  2460   * @match:   The match routine for the new EM
3a3b42bf89a9b9 Robert Love     2009-11-03  2461   */
3a3b42bf89a9b9 Robert Love     2009-11-03  2462  struct fc_exch_mgr *fc_exch_mgr_alloc(struct fc_lport *lport,
42e9a92fe6a909 Robert Love     2008-12-09  2463  				      enum fc_class class,
52ff878c912215 Vasu Dev        2009-07-29  2464  				      u16 min_xid, u16 max_xid,
52ff878c912215 Vasu Dev        2009-07-29  2465  				      bool (*match)(struct fc_frame *))
42e9a92fe6a909 Robert Love     2008-12-09  2466  {
42e9a92fe6a909 Robert Love     2008-12-09  2467  	struct fc_exch_mgr *mp;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2468  	u16 pool_exch_range;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2469  	size_t pool_size;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2470  	unsigned int cpu;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2471  	struct fc_exch_pool *pool;
42e9a92fe6a909 Robert Love     2008-12-09  2472  
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2473  	if (max_xid <= min_xid || max_xid == FC_XID_UNKNOWN ||
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2474  	    (min_xid & fc_cpu_mask) != 0) {
3a3b42bf89a9b9 Robert Love     2009-11-03  2475  		FC_LPORT_DBG(lport, "Invalid min_xid 0x:%x and max_xid 0x:%x\n",
42e9a92fe6a909 Robert Love     2008-12-09  2476  			     min_xid, max_xid);
42e9a92fe6a909 Robert Love     2008-12-09  2477  		return NULL;
42e9a92fe6a909 Robert Love     2008-12-09  2478  	}
42e9a92fe6a909 Robert Love     2008-12-09  2479  
42e9a92fe6a909 Robert Love     2008-12-09  2480  	/*
b2f0091fbf8b47 Vasu Dev        2009-08-25  2481  	 * allocate memory for EM
42e9a92fe6a909 Robert Love     2008-12-09  2482  	 */
b2f0091fbf8b47 Vasu Dev        2009-08-25  2483  	mp = kzalloc(sizeof(struct fc_exch_mgr), GFP_ATOMIC);
42e9a92fe6a909 Robert Love     2008-12-09  2484  	if (!mp)
42e9a92fe6a909 Robert Love     2008-12-09  2485  		return NULL;
42e9a92fe6a909 Robert Love     2008-12-09  2486  
42e9a92fe6a909 Robert Love     2008-12-09  2487  	mp->class = class;
9ca1e182b9d1ef Hannes Reinecke 2016-10-13  2488  	mp->lport = lport;
42e9a92fe6a909 Robert Love     2008-12-09  2489  	/* adjust em exch xid range for offload */
42e9a92fe6a909 Robert Love     2008-12-09  2490  	mp->min_xid = min_xid;
011a9008b11604 Steven Clark    2012-03-09  2491  
011a9008b11604 Steven Clark    2012-03-09  2492         /* reduce range so per cpu pool fits into PCPU_MIN_UNIT_SIZE pool */
011a9008b11604 Steven Clark    2012-03-09  2493  	pool_exch_range = (PCPU_MIN_UNIT_SIZE - sizeof(*pool)) /
011a9008b11604 Steven Clark    2012-03-09  2494  		sizeof(struct fc_exch *);
011a9008b11604 Steven Clark    2012-03-09  2495  	if ((max_xid - min_xid + 1) / (fc_cpu_mask + 1) > pool_exch_range) {
011a9008b11604 Steven Clark    2012-03-09  2496  		mp->max_xid = pool_exch_range * (fc_cpu_mask + 1) +
011a9008b11604 Steven Clark    2012-03-09  2497  			min_xid - 1;
011a9008b11604 Steven Clark    2012-03-09  2498  	} else {
42e9a92fe6a909 Robert Love     2008-12-09  2499  		mp->max_xid = max_xid;
011a9008b11604 Steven Clark    2012-03-09  2500  		pool_exch_range = (mp->max_xid - mp->min_xid + 1) /
011a9008b11604 Steven Clark    2012-03-09  2501  			(fc_cpu_mask + 1);
011a9008b11604 Steven Clark    2012-03-09  2502  	}
42e9a92fe6a909 Robert Love     2008-12-09  2503  
42e9a92fe6a909 Robert Love     2008-12-09  2504  	mp->ep_pool = mempool_create_slab_pool(2, fc_em_cachep);
42e9a92fe6a909 Robert Love     2008-12-09  2505  	if (!mp->ep_pool)
42e9a92fe6a909 Robert Love     2008-12-09  2506  		goto free_mp;
42e9a92fe6a909 Robert Love     2008-12-09  2507  
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2508  	/*
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2509  	 * Setup per cpu exch pool with entire exchange id range equally
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2510  	 * divided across all cpus. The exch pointers array memory is
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2511  	 * allocated for exch range per pool.
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2512  	 */
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2513  	mp->pool_max_index = pool_exch_range - 1;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2514  
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2515  	/*
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2516  	 * Allocate and initialize per cpu exch pool
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2517  	 */
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2518  	pool_size = sizeof(*pool) + pool_exch_range * sizeof(struct fc_exch *);
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2519  	mp->pool = __alloc_percpu(pool_size, __alignof__(struct fc_exch_pool));
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2520  	if (!mp->pool)
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2521  		goto free_mempool;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2522  	for_each_possible_cpu(cpu) {
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2523  		pool = per_cpu_ptr(mp->pool, cpu);
b6e3c84034b93e Vasu Dev        2011-10-28  2524  		pool->next_index = 0;
2034c19ce8f850 Hillf Danton    2010-11-30  2525  		pool->left = FC_XID_UNKNOWN;
2034c19ce8f850 Hillf Danton    2010-11-30  2526  		pool->right = FC_XID_UNKNOWN;
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2527  		spin_lock_init(&pool->lock);
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2528  		INIT_LIST_HEAD(&pool->ex_list);
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2529  	}
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2530  
52ff878c912215 Vasu Dev        2009-07-29  2531  	kref_init(&mp->kref);
3a3b42bf89a9b9 Robert Love     2009-11-03  2532  	if (!fc_exch_mgr_add(lport, mp, match)) {
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2533  		free_percpu(mp->pool);
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2534  		goto free_mempool;
52ff878c912215 Vasu Dev        2009-07-29  2535  	}
52ff878c912215 Vasu Dev        2009-07-29  2536  
52ff878c912215 Vasu Dev        2009-07-29  2537  	/*
52ff878c912215 Vasu Dev        2009-07-29  2538  	 * Above kref_init() sets mp->kref to 1 and then
52ff878c912215 Vasu Dev        2009-07-29  2539  	 * call to fc_exch_mgr_add incremented mp->kref again,
52ff878c912215 Vasu Dev        2009-07-29  2540  	 * so adjust that extra increment.
52ff878c912215 Vasu Dev        2009-07-29  2541  	 */
52ff878c912215 Vasu Dev        2009-07-29 @2542  	kref_put(&mp->kref, fc_exch_mgr_destroy);
42e9a92fe6a909 Robert Love     2008-12-09 @2543  	return mp;
42e9a92fe6a909 Robert Love     2008-12-09  2544  
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2545  free_mempool:
e4bc50bedf0dd6 Vasu Dev        2009-08-25  2546  	mempool_destroy(mp->ep_pool);
42e9a92fe6a909 Robert Love     2008-12-09  2547  free_mp:
42e9a92fe6a909 Robert Love     2008-12-09  2548  	kfree(mp);
42e9a92fe6a909 Robert Love     2008-12-09  2549  	return NULL;
42e9a92fe6a909 Robert Love     2008-12-09  2550  }
42e9a92fe6a909 Robert Love     2008-12-09  2551  EXPORT_SYMBOL(fc_exch_mgr_alloc);
42e9a92fe6a909 Robert Love     2008-12-09  2552  

:::::: The code at line 2543 was first introduced by commit
:::::: 42e9a92fe6a9095bd68a379aaec7ad2be0337f7a [SCSI] libfc: A modular Fibre Channel library

:::::: TO: Robert Love <robert.w.love@intel.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
