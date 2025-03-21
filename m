Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032321B8F6
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Mar 2025 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555125; cv=none; b=W7c75zqwBHmKbzC1yqzyh8F6iPvHPpTci2Hsl7FNFz5gtaOcMgxRssoOfJOD9N1VAaLfSGuL5UzJnqu8aJEqzlP3oZ5FIq60CWQzyHjhiwWd5D/iiaqTrR/dAglJnNMLxxwnQeCWtAgjKihRTFJa5yj+03w8T7ilAfpMIlS22Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555125; c=relaxed/simple;
	bh=mgXNuXzI10rHFm4RWmj5L3ukCGneSrct8ZaQ/zijl14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsLG87pXAzgB1y6TJXjcp61huoCXb66XimMbXA061qWK8tIuHhkjjBHpuSszTxnueB/Y7gVNsQ0iulbiO15zGutiyE4NU9Ypo1u74WiYx4fEv4NK3uH7+lf72+aULCQcJhtlPt0YPOKZdOfdcJud8glKAtQpwzaCskWhqRRPtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ML18T2mh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ML18T2mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742555123; x=1774091123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mgXNuXzI10rHFm4RWmj5L3ukCGneSrct8ZaQ/zijl14=;
  b=ML18T2mhcBB3uccecYyOyu5zD7A+uiKsy1zVgu7fP8R/tQ7nEcTIq4Vx
   rwWqJQoZyRusn0Ie5uANmxQM1Q4lTt4xRj7zEVFqti12EvOSvgcfxyPfS
   kOUSYmBMHF2o2Ia8EUWct/I2MW/BmXhnQVKr9Jol/MjmtzA21qVBXyc/C
   7UD5GQY7hhL3CpISumbKOzNXEbTOlnsMJYlbwqW0rzF41Sdc6NJmIvqV9
   deq9bhiQjp5QKXhU/52ODwW+yXaAFxB8QggujbUXyP13rKWVshz9r+xv6
   ishy4bX68EX+uyZ3TTGJmwhpH26j+5RJ/aXpCUYK62WNSEdrym2ONjfp0
   g==;
X-CSE-ConnectionGUID: n5yJfbG/TreURCofCaW/pA==
X-CSE-MsgGUID: 9X+OjOm0QZubUTxcRzyYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="55197149"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="55197149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 04:05:22 -0700
X-CSE-ConnectionGUID: dSJ7D7okRri+4973bEgOfA==
X-CSE-MsgGUID: OnECCReyR9i/560+RbCHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128594630"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Mar 2025 04:05:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvaBi-0001Hg-1B;
	Fri, 21 Mar 2025 11:05:18 +0000
Date: Fri, 21 Mar 2025 19:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10451/11415] mm/swapfile.c:1294
 folio_alloc_swap() warn: missing unwind goto?
Message-ID: <202503211807.3kAltggo-lkp@intel.com>
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
TO: Kairui Song <kasong@tencent.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: dfa3afbdc51f3c4c440360c1f472eafb0b32285a [10451/11415] mm, swap: simplify folio swap allocation
:::::: branch date: 25 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20250318 (https://download.01.org/0day-ci/archive/20250321/202503211807.3kAltggo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503211807.3kAltggo-lkp@intel.com/

smatch warnings:
mm/swapfile.c:1294 folio_alloc_swap() warn: missing unwind goto?

vim +1294 mm/swapfile.c

dfa3afbdc51f3c Kairui Song 2025-03-14  1254  
dfa3afbdc51f3c Kairui Song 2025-03-14  1255  /**
dfa3afbdc51f3c Kairui Song 2025-03-14  1256   * folio_alloc_swap - allocate swap space for a folio
dfa3afbdc51f3c Kairui Song 2025-03-14  1257   * @folio: folio we want to move to swap
dfa3afbdc51f3c Kairui Song 2025-03-14  1258   * @gfp: gfp mask for shadow nodes
dfa3afbdc51f3c Kairui Song 2025-03-14  1259   *
dfa3afbdc51f3c Kairui Song 2025-03-14  1260   * Allocate swap space for the folio and add the folio to the
dfa3afbdc51f3c Kairui Song 2025-03-14  1261   * swap cache.
dfa3afbdc51f3c Kairui Song 2025-03-14  1262   *
dfa3afbdc51f3c Kairui Song 2025-03-14  1263   * Context: Caller needs to hold the folio lock.
dfa3afbdc51f3c Kairui Song 2025-03-14  1264   * Return: Whether the folio was added to the swap cache.
dfa3afbdc51f3c Kairui Song 2025-03-14  1265   */
dfa3afbdc51f3c Kairui Song 2025-03-14  1266  int folio_alloc_swap(struct folio *folio, gfp_t gfp)
dfa3afbdc51f3c Kairui Song 2025-03-14  1267  {
dfa3afbdc51f3c Kairui Song 2025-03-14  1268  	unsigned int order = folio_order(folio);
dfa3afbdc51f3c Kairui Song 2025-03-14  1269  	unsigned int size = 1 << order;
dfa3afbdc51f3c Kairui Song 2025-03-14  1270  	swp_entry_t entry = {};
dfa3afbdc51f3c Kairui Song 2025-03-14  1271  
dfa3afbdc51f3c Kairui Song 2025-03-14  1272  	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
dfa3afbdc51f3c Kairui Song 2025-03-14  1273  	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
dfa3afbdc51f3c Kairui Song 2025-03-14  1274  
dfa3afbdc51f3c Kairui Song 2025-03-14  1275  	/*
dfa3afbdc51f3c Kairui Song 2025-03-14  1276  	 * Should not even be attempting large allocations when huge
dfa3afbdc51f3c Kairui Song 2025-03-14  1277  	 * page swap is disabled. Warn and fail the allocation.
dfa3afbdc51f3c Kairui Song 2025-03-14  1278  	 */
dfa3afbdc51f3c Kairui Song 2025-03-14  1279  	if (order && (!IS_ENABLED(CONFIG_THP_SWAP) || size > SWAPFILE_CLUSTER)) {
dfa3afbdc51f3c Kairui Song 2025-03-14  1280  		VM_WARN_ON_ONCE(1);
dfa3afbdc51f3c Kairui Song 2025-03-14  1281  		return -EINVAL;
dfa3afbdc51f3c Kairui Song 2025-03-14  1282  	}
dfa3afbdc51f3c Kairui Song 2025-03-14  1283  
dfa3afbdc51f3c Kairui Song 2025-03-14  1284  	local_lock(&percpu_swap_cluster.lock);
dfa3afbdc51f3c Kairui Song 2025-03-14  1285  	if (!swap_alloc_fast(&entry, order))
dfa3afbdc51f3c Kairui Song 2025-03-14  1286  		swap_alloc_slow(&entry, order);
dfff186787d57e Kairui Song 2025-03-14  1287  	local_unlock(&percpu_swap_cluster.lock);
dfa3afbdc51f3c Kairui Song 2025-03-14  1288  
6076b3206d4b8f Kairui Song 2025-03-14  1289  	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
dfa3afbdc51f3c Kairui Song 2025-03-14  1290  	if (mem_cgroup_try_charge_swap(folio, entry))
dfa3afbdc51f3c Kairui Song 2025-03-14  1291  		goto out_free;
dfa3afbdc51f3c Kairui Song 2025-03-14  1292  
dfa3afbdc51f3c Kairui Song 2025-03-14  1293  	if (!entry.val)
dfa3afbdc51f3c Kairui Song 2025-03-14 @1294  		return -ENOMEM;
dfa3afbdc51f3c Kairui Song 2025-03-14  1295  
dfa3afbdc51f3c Kairui Song 2025-03-14  1296  	/*
dfa3afbdc51f3c Kairui Song 2025-03-14  1297  	 * XArray node allocations from PF_MEMALLOC contexts could
dfa3afbdc51f3c Kairui Song 2025-03-14  1298  	 * completely exhaust the page allocator. __GFP_NOMEMALLOC
dfa3afbdc51f3c Kairui Song 2025-03-14  1299  	 * stops emergency reserves from being allocated.
dfa3afbdc51f3c Kairui Song 2025-03-14  1300  	 *
dfa3afbdc51f3c Kairui Song 2025-03-14  1301  	 * TODO: this could cause a theoretical memory reclaim
dfa3afbdc51f3c Kairui Song 2025-03-14  1302  	 * deadlock in the swap out path.
dfa3afbdc51f3c Kairui Song 2025-03-14  1303  	 */
dfa3afbdc51f3c Kairui Song 2025-03-14  1304  	if (add_to_swap_cache(folio, entry, gfp | __GFP_NOMEMALLOC, NULL))
dfa3afbdc51f3c Kairui Song 2025-03-14  1305  		goto out_free;
dfa3afbdc51f3c Kairui Song 2025-03-14  1306  
6076b3206d4b8f Kairui Song 2025-03-14  1307  	atomic_long_sub(size, &nr_swap_pages);
dfa3afbdc51f3c Kairui Song 2025-03-14  1308  	return 0;
dfa3afbdc51f3c Kairui Song 2025-03-14  1309  
dfa3afbdc51f3c Kairui Song 2025-03-14  1310  out_free:
dfa3afbdc51f3c Kairui Song 2025-03-14  1311  	put_swap_folio(folio, entry);
dfa3afbdc51f3c Kairui Song 2025-03-14  1312  	return -ENOMEM;
36005bae205da3 Tim Chen    2017-02-22  1313  }
36005bae205da3 Tim Chen    2017-02-22  1314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
