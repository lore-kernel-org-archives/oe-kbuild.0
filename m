Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB38190685
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761456968; cv=none; b=smAYEFyZ5136357W85DbC5G3m1P2GDB4uXcCWxAGCIbUm5dp4YBs16NtTKRdMnJHz2di7Z/tZ4dvuBEpX2s59uADBjfTjQbGPxRU6S83DeDuEhr1rBJ91QvfufBXryx8YYHmO96/iFrhe5rXZzh044IYk0iamO8HhvBNsdXpLZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761456968; c=relaxed/simple;
	bh=byO651wdjwiw2PnvyNISm4mTSsNZENYDz4RdSC++E84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSeBh9hOW4oIamkdUG46mB/92uKlQzM/Wu+qv3VurFFs3z+2thrxXCtEHnK3EUhEXV5yxrSaA4JFxJJVZSi59X41jgJhLjh122RYme0Expgk10oBLQnblpTZxjnlgNvZGbpNUJ9VmG+eCQTsOqAOMhlzvB/oGFUhhFEJCHbgibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GII2AvOk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GII2AvOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761456963; x=1792992963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=byO651wdjwiw2PnvyNISm4mTSsNZENYDz4RdSC++E84=;
  b=GII2AvOkx5359Fpnxy0OajfYLGmt9xHxY5USWfCjhxxbxKQLUWYdAZnr
   FNumQmK8OuZ3lulvqVk4tb/kkL3ugVVMk/jZwvATG+yYX4K3aOYKJ/qYa
   k7VdtfXbAzCc9gQ6KBh2yWzpECX2CTJTndONSZXjBo5zefIh/mKVAoiqx
   4e/W0Euyf7y6yP/aP0vuPTx1xZjF3J2UBFwfXqKBKVw/mesG0kIG/D5i5
   /bHleWq/9wIbv7ipVsLFDDcpY1gh6JP+f1JMj83hVN7cNrQqJkAXKA0Hb
   RFrYCUNd3rWdaSoNBbjaTR8UhH3YyaEArkq+DBt9abXssrFJRdoOc/htq
   Q==;
X-CSE-ConnectionGUID: 8who/iTdQsOt2RQdF8EcKQ==
X-CSE-MsgGUID: 2fgUeVeLSWal9yQJ+EWwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63610608"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63610608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 22:36:02 -0700
X-CSE-ConnectionGUID: 90r59jf7R1yq44S4th8NPA==
X-CSE-MsgGUID: 4gjED0A7Qli+t1K5+Y3jXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="208392388"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2025 22:36:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCtQ7-000FuP-0t;
	Sun, 26 Oct 2025 05:35:59 +0000
Date: Sun, 26 Oct 2025 13:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/shmem.c:2094 shmem_swap_alloc_folio() error: uninitialized symbol
 'new'.
Message-ID: <202510261312.Svcnk3Da-lkp@intel.com>
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
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: 69805ea79db6634d4e7d596f3f36667924dc6cbf mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261312.Svcnk3Da-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510261312.Svcnk3Da-lkp@intel.com/

smatch warnings:
mm/shmem.c:2094 shmem_swap_alloc_folio() error: uninitialized symbol 'new'.

vim +/new +2094 mm/shmem.c

71fe804b6d56d6 Lee Schermerhorn 2008-04-28  2014  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2015  static struct folio *shmem_swap_alloc_folio(struct inode *inode,
1dd44c0af4fa1e Baolin Wang      2025-01-08  2016  		struct vm_area_struct *vma, pgoff_t index,
1dd44c0af4fa1e Baolin Wang      2025-01-08  2017  		swp_entry_t entry, int order, gfp_t gfp)
1dd44c0af4fa1e Baolin Wang      2025-01-08  2018  {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2019  	struct shmem_inode_info *info = SHMEM_I(inode);
c262ffd72c8539 Kairui Song      2025-07-28  2020  	int nr_pages = 1 << order;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2021  	struct folio *new;
69805ea79db663 Kairui Song      2025-07-28  2022  	gfp_t alloc_gfp;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2023  	void *shadow;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2024  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2025  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  2026  	 * We have arrived here because our zones are constrained, so don't
1dd44c0af4fa1e Baolin Wang      2025-01-08  2027  	 * limit chance of success with further cpuset and node constraints.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2028  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  2029  	gfp &= ~GFP_CONSTRAINT_MASK;
69805ea79db663 Kairui Song      2025-07-28  2030  	alloc_gfp = gfp;
c262ffd72c8539 Kairui Song      2025-07-28  2031  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
c262ffd72c8539 Kairui Song      2025-07-28  2032  		if (WARN_ON_ONCE(order))
c262ffd72c8539 Kairui Song      2025-07-28  2033  			return ERR_PTR(-EINVAL);
c262ffd72c8539 Kairui Song      2025-07-28  2034  	} else if (order) {
c262ffd72c8539 Kairui Song      2025-07-28  2035  		/*
c262ffd72c8539 Kairui Song      2025-07-28  2036  		 * If uffd is active for the vma, we need per-page fault
c262ffd72c8539 Kairui Song      2025-07-28  2037  		 * fidelity to maintain the uffd semantics, then fallback
c262ffd72c8539 Kairui Song      2025-07-28  2038  		 * to swapin order-0 folio, as well as for zswap case.
c262ffd72c8539 Kairui Song      2025-07-28  2039  		 * Any existing sub folio in the swap cache also blocks
c262ffd72c8539 Kairui Song      2025-07-28  2040  		 * mTHP swapin.
c262ffd72c8539 Kairui Song      2025-07-28  2041  		 */
c262ffd72c8539 Kairui Song      2025-07-28  2042  		if ((vma && unlikely(userfaultfd_armed(vma))) ||
c262ffd72c8539 Kairui Song      2025-07-28  2043  		     !zswap_never_enabled() ||
c262ffd72c8539 Kairui Song      2025-07-28  2044  		     non_swapcache_batch(entry, nr_pages) != nr_pages)
69805ea79db663 Kairui Song      2025-07-28  2045  			goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2046  
69805ea79db663 Kairui Song      2025-07-28  2047  		alloc_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
69805ea79db663 Kairui Song      2025-07-28  2048  	}
69805ea79db663 Kairui Song      2025-07-28  2049  retry:
69805ea79db663 Kairui Song      2025-07-28  2050  	new = shmem_alloc_folio(alloc_gfp, order, info, index);
69805ea79db663 Kairui Song      2025-07-28  2051  	if (!new) {
69805ea79db663 Kairui Song      2025-07-28  2052  		new = ERR_PTR(-ENOMEM);
69805ea79db663 Kairui Song      2025-07-28  2053  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2054  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2055  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2056  	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
69805ea79db663 Kairui Song      2025-07-28  2057  					   alloc_gfp, entry)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2058  		folio_put(new);
69805ea79db663 Kairui Song      2025-07-28  2059  		new = ERR_PTR(-ENOMEM);
69805ea79db663 Kairui Song      2025-07-28  2060  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2061  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2062  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2063  	/*
1dd44c0af4fa1e Baolin Wang      2025-01-08  2064  	 * Prevent parallel swapin from proceeding with the swap cache flag.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2065  	 *
1dd44c0af4fa1e Baolin Wang      2025-01-08  2066  	 * Of course there is another possible concurrent scenario as well,
1dd44c0af4fa1e Baolin Wang      2025-01-08  2067  	 * that is to say, the swap cache flag of a large folio has already
1dd44c0af4fa1e Baolin Wang      2025-01-08  2068  	 * been set by swapcache_prepare(), while another thread may have
1dd44c0af4fa1e Baolin Wang      2025-01-08  2069  	 * already split the large swap entry stored in the shmem mapping.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2070  	 * In this case, shmem_add_to_page_cache() will help identify the
1dd44c0af4fa1e Baolin Wang      2025-01-08  2071  	 * concurrent swapin and return -EEXIST.
1dd44c0af4fa1e Baolin Wang      2025-01-08  2072  	 */
1dd44c0af4fa1e Baolin Wang      2025-01-08  2073  	if (swapcache_prepare(entry, nr_pages)) {
1dd44c0af4fa1e Baolin Wang      2025-01-08  2074  		folio_put(new);
69805ea79db663 Kairui Song      2025-07-28  2075  		new = ERR_PTR(-EEXIST);
69805ea79db663 Kairui Song      2025-07-28  2076  		/* Try smaller folio to avoid cache conflict */
69805ea79db663 Kairui Song      2025-07-28  2077  		goto fallback;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2078  	}
1dd44c0af4fa1e Baolin Wang      2025-01-08  2079  
1dd44c0af4fa1e Baolin Wang      2025-01-08  2080  	__folio_set_locked(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2081  	__folio_set_swapbacked(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2082  	new->swap = entry;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2083  
89ce924f0bd447 Johannes Weiner  2025-01-24  2084  	memcg1_swapin(entry, nr_pages);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2085  	shadow = get_shadow_from_swap_cache(entry);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2086  	if (shadow)
1dd44c0af4fa1e Baolin Wang      2025-01-08  2087  		workingset_refault(new, shadow);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2088  	folio_add_lru(new);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2089  	swap_read_folio(new, NULL);
1dd44c0af4fa1e Baolin Wang      2025-01-08  2090  	return new;
69805ea79db663 Kairui Song      2025-07-28  2091  fallback:
69805ea79db663 Kairui Song      2025-07-28  2092  	/* Order 0 swapin failed, nothing to fallback to, abort */
69805ea79db663 Kairui Song      2025-07-28  2093  	if (!order)
69805ea79db663 Kairui Song      2025-07-28 @2094  		return new;
69805ea79db663 Kairui Song      2025-07-28  2095  	entry.val += index - round_down(index, nr_pages);
69805ea79db663 Kairui Song      2025-07-28  2096  	alloc_gfp = gfp;
69805ea79db663 Kairui Song      2025-07-28  2097  	nr_pages = 1;
69805ea79db663 Kairui Song      2025-07-28  2098  	order = 0;
69805ea79db663 Kairui Song      2025-07-28  2099  	goto retry;
1dd44c0af4fa1e Baolin Wang      2025-01-08  2100  }
1dd44c0af4fa1e Baolin Wang      2025-01-08  2101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
