Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313413AA3E
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Jul 2025 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521063; cv=none; b=ngxsrFLJRdElJR23n+FXnP9+X/6c1KM44Z4ne4CUJzJIbCnTozZ3oxdk8GVs39IFQHPX9yPYntCm7T2+hCS8WH8EXbL3BBe5wYZU5trt2uvSc+hHGNPTJGW8vEnpGGI59D49jv90smJQyw3oQEZO0cUgl7nlFMbhgoszVCHgRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521063; c=relaxed/simple;
	bh=XPoaM+tuL+1jcNHVY8aLTc9H0QEFigbF1El0A7Kr1MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CT9mIb9teEKgdpkE5YS0gXhSVRrPUE5r7BBKRrCz24mDyB6dPR28R/9D9U7H0YEsAAPRLneYVJurodV4Ub98Kb7uY6X89Z6PkUluOjNIdLBQZxb8w4lC9G7iHmFs+w4EL4VQUdXuYJFEze4me8uaTin0kuQCDoFtyLEQrVP2YSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AglnwfMz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AglnwfMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751521062; x=1783057062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPoaM+tuL+1jcNHVY8aLTc9H0QEFigbF1El0A7Kr1MU=;
  b=AglnwfMz2pfRnQtSQEV7rsSnNrI5ZBMwE6KjiiyvXRX45UZ+cS/3hKrP
   I7jU9sxlH6rFPG6J9CMRAQ+RmtaBsGwRGMriXgtwP94Djw6/UBWdnoUp1
   VZEIUp3gfQJuBGrHuO6Idg7qtAUciVHvDPTT0uWg1FBgXO0Clbcmh5CkC
   H13MJu9pveFskUgsPNrfvWV1J1d2TADoJOOA6fznYKIq3XPmU0bpgPU0/
   LCmdWelqbkJatdNjHwjVY4RqRu+By+gX5wdpy1zjejzvyfk64HvjSTCjz
   UYV3iUjoH1/KZQF30MsYwhaEntqvw1Dd4SXhZ4617jIyZMOdm8TAuEmw2
   A==;
X-CSE-ConnectionGUID: Yp3yEWNZQVS0kZtpCgcpaA==
X-CSE-MsgGUID: tmJTmuK8SG6nA+it1LHmcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53697572"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53697572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 22:37:41 -0700
X-CSE-ConnectionGUID: TTZjV5NcSfyN+iUXvc0HUg==
X-CSE-MsgGUID: Ydhc3Ex+QeS4wfAOcozgyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154407180"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2025 22:37:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXCdd-0001W5-2J;
	Thu, 03 Jul 2025 05:37:37 +0000
Date: Thu, 3 Jul 2025 13:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/swapfile.c:1294 folio_alloc_swap() warn: missing unwind goto?
Message-ID: <202507031312.36xpe2e9-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4911fb0b060899e4eebca0151eb56deb86921ec
commit: b487a2da3575b6cdfb6d6559311830c8fea70bb9 mm, swap: simplify folio swap allocation
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20250703 (https://download.01.org/0day-ci/archive/20250703/202507031312.36xpe2e9-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507031312.36xpe2e9-lkp@intel.com/

smatch warnings:
mm/swapfile.c:1294 folio_alloc_swap() warn: missing unwind goto?

vim +1294 mm/swapfile.c

b487a2da3575b6 Kairui Song 2025-03-14  1254  
b487a2da3575b6 Kairui Song 2025-03-14  1255  /**
b487a2da3575b6 Kairui Song 2025-03-14  1256   * folio_alloc_swap - allocate swap space for a folio
b487a2da3575b6 Kairui Song 2025-03-14  1257   * @folio: folio we want to move to swap
b487a2da3575b6 Kairui Song 2025-03-14  1258   * @gfp: gfp mask for shadow nodes
b487a2da3575b6 Kairui Song 2025-03-14  1259   *
b487a2da3575b6 Kairui Song 2025-03-14  1260   * Allocate swap space for the folio and add the folio to the
b487a2da3575b6 Kairui Song 2025-03-14  1261   * swap cache.
b487a2da3575b6 Kairui Song 2025-03-14  1262   *
b487a2da3575b6 Kairui Song 2025-03-14  1263   * Context: Caller needs to hold the folio lock.
b487a2da3575b6 Kairui Song 2025-03-14  1264   * Return: Whether the folio was added to the swap cache.
b487a2da3575b6 Kairui Song 2025-03-14  1265   */
b487a2da3575b6 Kairui Song 2025-03-14  1266  int folio_alloc_swap(struct folio *folio, gfp_t gfp)
b487a2da3575b6 Kairui Song 2025-03-14  1267  {
b487a2da3575b6 Kairui Song 2025-03-14  1268  	unsigned int order = folio_order(folio);
b487a2da3575b6 Kairui Song 2025-03-14  1269  	unsigned int size = 1 << order;
b487a2da3575b6 Kairui Song 2025-03-14  1270  	swp_entry_t entry = {};
b487a2da3575b6 Kairui Song 2025-03-14  1271  
b487a2da3575b6 Kairui Song 2025-03-14  1272  	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
b487a2da3575b6 Kairui Song 2025-03-14  1273  	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
b487a2da3575b6 Kairui Song 2025-03-14  1274  
b487a2da3575b6 Kairui Song 2025-03-14  1275  	/*
b487a2da3575b6 Kairui Song 2025-03-14  1276  	 * Should not even be attempting large allocations when huge
b487a2da3575b6 Kairui Song 2025-03-14  1277  	 * page swap is disabled. Warn and fail the allocation.
b487a2da3575b6 Kairui Song 2025-03-14  1278  	 */
b487a2da3575b6 Kairui Song 2025-03-14  1279  	if (order && (!IS_ENABLED(CONFIG_THP_SWAP) || size > SWAPFILE_CLUSTER)) {
b487a2da3575b6 Kairui Song 2025-03-14  1280  		VM_WARN_ON_ONCE(1);
b487a2da3575b6 Kairui Song 2025-03-14  1281  		return -EINVAL;
b487a2da3575b6 Kairui Song 2025-03-14  1282  	}
b487a2da3575b6 Kairui Song 2025-03-14  1283  
b487a2da3575b6 Kairui Song 2025-03-14  1284  	local_lock(&percpu_swap_cluster.lock);
b487a2da3575b6 Kairui Song 2025-03-14  1285  	if (!swap_alloc_fast(&entry, order))
b487a2da3575b6 Kairui Song 2025-03-14  1286  		swap_alloc_slow(&entry, order);
1b7e90020eb770 Kairui Song 2025-03-14  1287  	local_unlock(&percpu_swap_cluster.lock);
b487a2da3575b6 Kairui Song 2025-03-14  1288  
0ff67f990bd457 Kairui Song 2025-03-14  1289  	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
b487a2da3575b6 Kairui Song 2025-03-14  1290  	if (mem_cgroup_try_charge_swap(folio, entry))
b487a2da3575b6 Kairui Song 2025-03-14  1291  		goto out_free;
b487a2da3575b6 Kairui Song 2025-03-14  1292  
b487a2da3575b6 Kairui Song 2025-03-14  1293  	if (!entry.val)
b487a2da3575b6 Kairui Song 2025-03-14 @1294  		return -ENOMEM;
b487a2da3575b6 Kairui Song 2025-03-14  1295  
b487a2da3575b6 Kairui Song 2025-03-14  1296  	/*
b487a2da3575b6 Kairui Song 2025-03-14  1297  	 * XArray node allocations from PF_MEMALLOC contexts could
b487a2da3575b6 Kairui Song 2025-03-14  1298  	 * completely exhaust the page allocator. __GFP_NOMEMALLOC
b487a2da3575b6 Kairui Song 2025-03-14  1299  	 * stops emergency reserves from being allocated.
b487a2da3575b6 Kairui Song 2025-03-14  1300  	 *
b487a2da3575b6 Kairui Song 2025-03-14  1301  	 * TODO: this could cause a theoretical memory reclaim
b487a2da3575b6 Kairui Song 2025-03-14  1302  	 * deadlock in the swap out path.
b487a2da3575b6 Kairui Song 2025-03-14  1303  	 */
b487a2da3575b6 Kairui Song 2025-03-14  1304  	if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL))
b487a2da3575b6 Kairui Song 2025-03-14  1305  		goto out_free;
b487a2da3575b6 Kairui Song 2025-03-14  1306  
0ff67f990bd457 Kairui Song 2025-03-14  1307  	atomic_long_sub(size, &nr_swap_pages);
b487a2da3575b6 Kairui Song 2025-03-14  1308  	return 0;
b487a2da3575b6 Kairui Song 2025-03-14  1309  
b487a2da3575b6 Kairui Song 2025-03-14  1310  out_free:
b487a2da3575b6 Kairui Song 2025-03-14  1311  	put_swap_folio(folio, entry);
b487a2da3575b6 Kairui Song 2025-03-14  1312  	return -ENOMEM;
36005bae205da3 Tim Chen    2017-02-22  1313  }
36005bae205da3 Tim Chen    2017-02-22  1314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
