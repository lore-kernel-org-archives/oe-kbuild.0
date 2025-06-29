Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E81A5B85
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751193499; cv=none; b=JUU3YfgtJAcjeo8YoNwAjkhF7kkwt4s5yP93uEUjLm/utz3XefpPcbWHt5qyePMrnhMxRHo2DHiJOzwcbct5CGka09tS0z0RdEhWXtD0Xb4lwjfVm7rKiyPce9huXD3qaI0Sb+NH4w+w83vVTv1K8+DQ3x6bDHzvILv6/AM1tTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751193499; c=relaxed/simple;
	bh=V0jZDXsXt4s4geo4VBKoYZfpFWdkcL0nXcmXIhxKvCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FyhNVbPlhtLIHtuY7fK5e6WmnI1aJCqa9cB0aGaQeOn1lcvnPnAoCTWmzw3tMXQTaXJ1fexDDasfxO4wCAtQhZiP79UMWbJC40sbAuEo6lHtGjhSUyQ9Xdc0vzDvba4LAs3ulP7eA+XIDcO7UxISg94gReD0ICjUbqd8ojj/b/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDpw/RRW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDpw/RRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751193497; x=1782729497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0jZDXsXt4s4geo4VBKoYZfpFWdkcL0nXcmXIhxKvCU=;
  b=NDpw/RRWtWZpAgapJce+sM0UnEP0lJKhixxiGhqNWCNkoxVwAIovRubJ
   D9ugkv5YRpqkK64aszCdLCFIlDjo58F+baccnpWvdBZ8/gSBxFzfS+S+4
   YP9jEdrDAj2Gx7MdmvRWzF3cC3YXoL8BvjpEbD/BzLzKHS9F4rZvCq+bN
   u8QCIHC83GxMSNTGJg5TVCd+CuiXEFThG4jdCc2Gk1wUDq1uKh3y7xtan
   dNeINOKCjb5YFV2R+Bkcs15xXZP2xn/Z/ifjMm3TRcQEjTlMKNFcgF/U8
   WYtQPdo4FUvKAafaK01QZxZvkNgx7ArPez56v+87j7oXS8nCqJmTqg9nK
   g==;
X-CSE-ConnectionGUID: dHSXNqQwT6O8gBcf+aghwA==
X-CSE-MsgGUID: ediuo30cRPqRZhsKqIGS1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53402069"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53402069"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 03:38:14 -0700
X-CSE-ConnectionGUID: E8bLp+I0Sqmzil9y1GchuQ==
X-CSE-MsgGUID: Yz79jE21THejQ3tEGdKY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="157736351"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jun 2025 03:38:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVpQI-000XqA-0t;
	Sun, 29 Jun 2025 10:38:10 +0000
Date: Sun, 29 Jun 2025 18:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 236/258] mm/shmem.c:2426 shmem_swapin_folio() error:
 we previously assumed 'folio' could be null (see line 2422)
Message-ID: <202506291826.VIX870yT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   2e462e10265dcdce546cab85a902b716e2b26d9f
commit: da38b6caa23a57a77760489f13a7ab3686b21d05 [236/258] mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20250629 (https://download.01.org/0day-ci/archive/20250629/202506291826.VIX870yT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506291826.VIX870yT-lkp@intel.com/

smatch warnings:
mm/shmem.c:2426 shmem_swapin_folio() error: we previously assumed 'folio' could be null (see line 2422)

vim +/folio +2426 mm/shmem.c

6cec2b95dadf77 Miaohe Lin              2022-05-19  2275  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2276  /*
833de10ff58e23 Miaohe Lin              2022-05-30  2277   * Swap in the folio pointed to by *foliop.
833de10ff58e23 Miaohe Lin              2022-05-30  2278   * Caller has to make sure that *foliop contains a valid swapped folio.
833de10ff58e23 Miaohe Lin              2022-05-30  2279   * Returns 0 and the folio in foliop if success. On failure, returns the
833de10ff58e23 Miaohe Lin              2022-05-30  2280   * error code and NULL in *foliop.
^1da177e4c3f41 Linus Torvalds          2005-04-16  2281   */
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2282) static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2283) 			     struct folio **foliop, enum sgp_type sgp,
736f0e03564729 Baolin Wang             2024-08-12  2284  			     gfp_t gfp, struct vm_area_struct *vma,
2b7403035459c7 Souptick Joarder        2018-08-23  2285  			     vm_fault_t *fault_type)
^1da177e4c3f41 Linus Torvalds          2005-04-16  2286  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  2287  	struct address_space *mapping = inode->i_mapping;
736f0e03564729 Baolin Wang             2024-08-12  2288  	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
23f919d4ad0eb3 Arnd Bergmann           2016-12-12  2289  	struct shmem_inode_info *info = SHMEM_I(inode);
2f81d41105c0e6 Kairui Song             2025-06-27  2290  	int error, nr_pages, order, swap_order;
cbc2bd98db8550 Kairui Song             2022-12-20  2291  	struct swap_info_struct *si;
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2292) 	struct folio *folio = NULL;
1dd44c0af4fa1e Baolin Wang             2025-01-08  2293  	bool skip_swapcache = false;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2294  	swp_entry_t swap;
66d2f4d28cd030 Hugh Dickins            2014-07-02  2295  
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2296) 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2297) 	swap = radix_to_swp_entry(*foliop);
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2298) 	*foliop = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2299  
af19487f00f34f Axel Rasmussen          2023-07-07  2300  	if (is_poisoned_swp_entry(swap))
6cec2b95dadf77 Miaohe Lin              2022-05-19  2301  		return -EIO;
6cec2b95dadf77 Miaohe Lin              2022-05-19  2302  
cbc2bd98db8550 Kairui Song             2022-12-20  2303  	si = get_swap_device(swap);
56d1f899789c9a Kairui Song             2025-06-27  2304  	order = shmem_confirm_swap(mapping, index, swap);
56d1f899789c9a Kairui Song             2025-06-27  2305  	if (unlikely(!si)) {
56d1f899789c9a Kairui Song             2025-06-27  2306  		if (order < 0)
cbc2bd98db8550 Kairui Song             2022-12-20  2307  			return -EEXIST;
cbc2bd98db8550 Kairui Song             2022-12-20  2308  		else
cbc2bd98db8550 Kairui Song             2022-12-20  2309  			return -EINVAL;
cbc2bd98db8550 Kairui Song             2022-12-20  2310  	}
56d1f899789c9a Kairui Song             2025-06-27  2311  	if (unlikely(order < 0)) {
56d1f899789c9a Kairui Song             2025-06-27  2312  		put_swap_device(si);
56d1f899789c9a Kairui Song             2025-06-27  2313  		return -EEXIST;
56d1f899789c9a Kairui Song             2025-06-27  2314  	}
cbc2bd98db8550 Kairui Song             2022-12-20  2315  
^1da177e4c3f41 Linus Torvalds          2005-04-16  2316  	/* Look it up and read it in.. */
5739a81cf89f2b Matthew Wilcox (Oracle  2022-09-02  2317) 	folio = swap_cache_get_folio(swap, NULL, 0);
5739a81cf89f2b Matthew Wilcox (Oracle  2022-09-02  2318) 	if (!folio) {
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  2319  		/* Or update major stats only when swapin succeeds?? */
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  2320  		if (fault_type) {
68da9f055755ee Hugh Dickins            2011-07-25  2321  			*fault_type |= VM_FAULT_MAJOR;
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  2322  			count_vm_event(PGMAJFAULT);
054a9f7ccd0a60 Hugh Dickins            2023-09-29  2323  			count_memcg_event_mm(fault_mm, PGMAJFAULT);
9e18eb29356b7d Andres Lagar-Cavilla    2016-05-19  2324  		}
946970b3240a61 Kairui Song             2025-06-27  2325  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
da38b6caa23a57 Kairui Song             2025-06-27  2326  			/* Direct mTHP swapin without swap cache or readahead */
da38b6caa23a57 Kairui Song             2025-06-27  2327  			folio = shmem_swapin_direct(inode, vma, index,
da38b6caa23a57 Kairui Song             2025-06-27  2328  						    swap, order, gfp);
da38b6caa23a57 Kairui Song             2025-06-27  2329  			if (IS_ERR(folio)) {
da38b6caa23a57 Kairui Song             2025-06-27  2330  				error = PTR_ERR(folio);
da38b6caa23a57 Kairui Song             2025-06-27  2331  				folio = NULL;
da38b6caa23a57 Kairui Song             2025-06-27  2332  			} else {
1dd44c0af4fa1e Baolin Wang             2025-01-08  2333  				skip_swapcache = true;
1dd44c0af4fa1e Baolin Wang             2025-01-08  2334  			}
da38b6caa23a57 Kairui Song             2025-06-27  2335  		} else {
1dd44c0af4fa1e Baolin Wang             2025-01-08  2336  			/*
da38b6caa23a57 Kairui Song             2025-06-27  2337  			 * Order 0 swapin using swap cache and readahead, it
da38b6caa23a57 Kairui Song             2025-06-27  2338  			 * may return order > 0 folio due to raced swap cache
1dd44c0af4fa1e Baolin Wang             2025-01-08  2339  			 */
ddc1a5cbc05dc6 Hugh Dickins            2023-10-19  2340  			folio = shmem_swapin_cluster(swap, gfp, info, index);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2341  		}
da38b6caa23a57 Kairui Song             2025-06-27  2342  		if (!folio)
da38b6caa23a57 Kairui Song             2025-06-27  2343  			goto failed;
058313515d5aab Baolin Wang             2025-02-25  2344  	}
058313515d5aab Baolin Wang             2025-02-25  2345  	/*
2f81d41105c0e6 Kairui Song             2025-06-27  2346  	 * We need to split an existing large entry if swapin brought in a
2f81d41105c0e6 Kairui Song             2025-06-27  2347  	 * smaller folio due to various of reasons.
2f81d41105c0e6 Kairui Song             2025-06-27  2348  	 *
2f81d41105c0e6 Kairui Song             2025-06-27  2349  	 * And worth noting there is a special case: if there is a smaller
2f81d41105c0e6 Kairui Song             2025-06-27  2350  	 * cached folio that covers @swap, but not @index (it only covers
2f81d41105c0e6 Kairui Song             2025-06-27  2351  	 * first few sub entries of the large entry, but @index points to
2f81d41105c0e6 Kairui Song             2025-06-27  2352  	 * later parts), the swap cache lookup will still see this folio,
2f81d41105c0e6 Kairui Song             2025-06-27  2353  	 * And we need to split the large entry here. Later checks will fail,
2f81d41105c0e6 Kairui Song             2025-06-27  2354  	 * as it can't satisfy the swap requirement, and we will retry
2f81d41105c0e6 Kairui Song             2025-06-27  2355  	 * the swapin from beginning.
2f81d41105c0e6 Kairui Song             2025-06-27  2356  	 */
2f81d41105c0e6 Kairui Song             2025-06-27  2357  	swap_order = folio_order(folio);
2f81d41105c0e6 Kairui Song             2025-06-27  2358  	if (order > swap_order) {
2f81d41105c0e6 Kairui Song             2025-06-27  2359  		error = shmem_split_swap_entry(inode, index, swap, gfp);
2f81d41105c0e6 Kairui Song             2025-06-27  2360  		if (error)
2f81d41105c0e6 Kairui Song             2025-06-27  2361  			goto failed_nolock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2362  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  2363  
2f81d41105c0e6 Kairui Song             2025-06-27  2364  	index = round_down(index, 1 << swap_order);
2f81d41105c0e6 Kairui Song             2025-06-27  2365  	swap.val = round_down(swap.val, 1 << swap_order);
2f81d41105c0e6 Kairui Song             2025-06-27  2366  
833de10ff58e23 Miaohe Lin              2022-05-30  2367  	/* We have to do this with folio locked to prevent races */
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2368) 	folio_lock(folio);
1dd44c0af4fa1e Baolin Wang             2025-01-08  2369  	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
38291fbcbca23d Kairui Song             2025-06-27  2370  	    folio->swap.val != swap.val) {
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2371  		error = -EEXIST;
2f81d41105c0e6 Kairui Song             2025-06-27  2372  		goto failed_unlock;
bde05d1ccd5126 Hugh Dickins            2012-05-29  2373  	}
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2374) 	if (!folio_test_uptodate(folio)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  2375  		error = -EIO;
54af60421822bb Hugh Dickins            2011-08-03  2376  		goto failed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2377  	}
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2378) 	folio_wait_writeback(folio);
40ff2d11bd58a3 Baolin Wang             2024-08-12  2379  	nr_pages = folio_nr_pages(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  2380  
8a84802e2a2b1a Steven Price            2020-05-13  2381  	/*
8a84802e2a2b1a Steven Price            2020-05-13  2382  	 * Some architectures may have to restore extra metadata to the
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2383) 	 * folio after reading from swap.
8a84802e2a2b1a Steven Price            2020-05-13  2384  	 */
f238b8c33c6738 Barry Song              2024-03-23  2385  	arch_swap_restore(folio_swap(swap, folio), folio);
8a84802e2a2b1a Steven Price            2020-05-13  2386  
069d849cde3a02 Matthew Wilcox (Oracle  2022-05-12  2387) 	if (shmem_should_replace_folio(folio, gfp)) {
736f0e03564729 Baolin Wang             2024-08-12  2388  		error = shmem_replace_folio(&folio, gfp, info, index, vma);
bde05d1ccd5126 Hugh Dickins            2012-05-29  2389  		if (error)
54af60421822bb Hugh Dickins            2011-08-03  2390  			goto failed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  2391  	}
27ab700626f048 Hugh Dickins            2011-07-25  2392  
2f81d41105c0e6 Kairui Song             2025-06-27  2393  	error = shmem_add_to_page_cache(folio, mapping, index,
054a9f7ccd0a60 Hugh Dickins            2023-09-29  2394  					swp_to_radix_entry(swap), gfp);
3fea5a499d57de Johannes Weiner         2020-06-03  2395  	if (error)
54af60421822bb Hugh Dickins            2011-08-03  2396  		goto failed;
00501b531c4723 Johannes Weiner         2014-08-08  2397  
40ff2d11bd58a3 Baolin Wang             2024-08-12  2398  	shmem_recalc_inode(inode, 0, -nr_pages);
54af60421822bb Hugh Dickins            2011-08-03  2399  
66d2f4d28cd030 Hugh Dickins            2014-07-02  2400  	if (sgp == SGP_WRITE)
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2401) 		folio_mark_accessed(folio);
66d2f4d28cd030 Hugh Dickins            2014-07-02  2402  
1dd44c0af4fa1e Baolin Wang             2025-01-08  2403  	if (skip_swapcache) {
2f81d41105c0e6 Kairui Song             2025-06-27  2404  		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
1dd44c0af4fa1e Baolin Wang             2025-01-08  2405  		folio->swap.val = 0;
1dd44c0af4fa1e Baolin Wang             2025-01-08  2406  	} else {
75fa68a5d89871 Matthew Wilcox (Oracle  2022-06-17  2407) 		delete_from_swap_cache(folio);
1dd44c0af4fa1e Baolin Wang             2025-01-08  2408  	}
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2409) 	folio_mark_dirty(folio);
40ff2d11bd58a3 Baolin Wang             2024-08-12  2410  	swap_free_nr(swap, nr_pages);
cbc2bd98db8550 Kairui Song             2022-12-20  2411  	put_swap_device(si);
27ab700626f048 Hugh Dickins            2011-07-25  2412  
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2413) 	*foliop = folio;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2414  	return 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2415  failed:
56d1f899789c9a Kairui Song             2025-06-27  2416  	if (shmem_confirm_swap(mapping, index, swap) < 0)
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2417  		error = -EEXIST;
6cec2b95dadf77 Miaohe Lin              2022-05-19  2418  	if (error == -EIO)
1dd44c0af4fa1e Baolin Wang             2025-01-08  2419  		shmem_set_folio_swapin_error(inode, index, folio, swap,
1dd44c0af4fa1e Baolin Wang             2025-01-08  2420  					     skip_swapcache);
2f81d41105c0e6 Kairui Song             2025-06-27  2421  failed_unlock:
2f81d41105c0e6 Kairui Song             2025-06-27 @2422  	if (folio)
da08e9b7932345 Matthew Wilcox (Oracle  2022-05-12  2423) 		folio_unlock(folio);
2f81d41105c0e6 Kairui Song             2025-06-27  2424  failed_nolock:
2f81d41105c0e6 Kairui Song             2025-06-27  2425  	if (skip_swapcache) {
2f81d41105c0e6 Kairui Song             2025-06-27 @2426  		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
2f81d41105c0e6 Kairui Song             2025-06-27  2427  		folio->swap.val = 0;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2428  	}
2f81d41105c0e6 Kairui Song             2025-06-27  2429  	if (folio)
2f81d41105c0e6 Kairui Song             2025-06-27  2430  		folio_put(folio);
cbc2bd98db8550 Kairui Song             2022-12-20  2431  	put_swap_device(si);
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2432  	return error;
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2433  }
c5bf121e4350a9 Vineeth Remanan Pillai  2019-03-05  2434  

:::::: The code at line 2426 was first introduced by commit
:::::: 2f81d41105c0e61f318eebd052890a0a69b8cfeb mm/shmem, swap: clean up swap entry splitting

:::::: TO: Kairui Song <kasong@tencent.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
