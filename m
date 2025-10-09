Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF381B4F0A
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021506; cv=none; b=bgip9MKtKO+reUs64ucM+0qCePYRaSNcVLgJM5K5WLoPfqyz1FV2s+t3i2DN0xBaENVFfV5f84JEtV7DgIxuIcoRS1i5PQhJLbnIeTceV2K2NbhRlJJOeW04mAk9xYkxdwNiDaBoa8HzIHLGC5dwDtfePSpHdXMmuEP6D42w4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021506; c=relaxed/simple;
	bh=CHqZfe1eyiMf46+3C94ON78WKOoms2FtGawTwH2zSro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJmWH4X3/o3nr1OTWsKO64Gwf/OGpVwr0FoTNk0OyiDbsnrH9P8qyZBEiRrJpSeRyHyzxNq5LbnUqKgmZZzBPUz/XhCoQvsvMObXTmTmPKiREDTTVX6iKTl/b75dSdhjKLRrfYT/8dpJS1d/PziWuGo0iQQ2P4XIvif1EUhVbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHJ+s1AF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHJ+s1AF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760021504; x=1791557504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHqZfe1eyiMf46+3C94ON78WKOoms2FtGawTwH2zSro=;
  b=XHJ+s1AF/96fL1eioDQsU6RzQJFyA5ehHUz0g3fS8mVMVtsrOJ9Inwtd
   PpXT/AeTHAv9zHk3qot5iRT4IT5sdwm8PUfF+DRnYT0ePzMnSIeqR9TOZ
   RQ3/gpw1AJ8jwjM2rqxhCs2laTHxqX9sfzaT5ZKteHJkbaIWp+vUd1PUX
   P9eWKqO2jZ9C5qX9GqXMxiagGKCg3ewcKmPhVqZze/a7M+OJPNGe1t1Z/
   JxPQIAGbyxLiltWfIpiWnR+t0Yo+TqX7e1GP4FWfj8aSTA9mCjMJ3FDNl
   Zqaa7dU6diPx7cSqzdK/I7I9jSQRtFj2P9rl2vEvlfST0Bad00jEBmmKA
   Q==;
X-CSE-ConnectionGUID: xBTag5XYSoOh5TKtc1GZ8g==
X-CSE-MsgGUID: zhPM1t2wTiGB8UJS+/ejkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62174408"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62174408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 07:51:43 -0700
X-CSE-ConnectionGUID: D2X/cionSF+FAHiLOyjN4w==
X-CSE-MsgGUID: wGvRNJLMQ+6h2Icw7OIrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="217826638"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Oct 2025 07:51:42 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6rzY-0000r4-0F;
	Thu, 09 Oct 2025 14:51:40 +0000
Date: Thu, 9 Oct 2025 22:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/shmem.c:2475 shmem_swapin_folio() error: we previously assumed
 'folio' could be null (see line 2471)
Message-ID: <202510092232.1DuYiX7w-lkp@intel.com>
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
head:   ec714e371f22f716a04e6ecb2a24988c92b26911
commit: 91ab656ece137c368a3189dfd42f8c9203a6285c mm/shmem, swap: tidy up swap entry splitting
date:   10 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 weeks ago
config: alpha-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092232.1DuYiX7w-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510092232.1DuYiX7w-lkp@intel.com/

smatch warnings:
mm/shmem.c:2475 shmem_swapin_folio() error: we previously assumed 'folio' could be null (see line 2471)

vim +/folio +2475 mm/shmem.c

6cec2b95dadf77c Miaohe Lin              2022-05-19  2291  
^1da177e4c3f415 Linus Torvalds          2005-04-16  2292  /*
833de10ff58e230 Miaohe Lin              2022-05-30  2293   * Swap in the folio pointed to by *foliop.
833de10ff58e230 Miaohe Lin              2022-05-30  2294   * Caller has to make sure that *foliop contains a valid swapped folio.
833de10ff58e230 Miaohe Lin              2022-05-30  2295   * Returns 0 and the folio in foliop if success. On failure, returns the
833de10ff58e230 Miaohe Lin              2022-05-30  2296   * error code and NULL in *foliop.
^1da177e4c3f415 Linus Torvalds          2005-04-16  2297   */
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2298) static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2299) 			     struct folio **foliop, enum sgp_type sgp,
736f0e03564729a Baolin Wang             2024-08-12  2300  			     gfp_t gfp, struct vm_area_struct *vma,
2b7403035459c75 Souptick Joarder        2018-08-23  2301  			     vm_fault_t *fault_type)
^1da177e4c3f415 Linus Torvalds          2005-04-16  2302  {
^1da177e4c3f415 Linus Torvalds          2005-04-16  2303  	struct address_space *mapping = inode->i_mapping;
736f0e03564729a Baolin Wang             2024-08-12  2304  	struct mm_struct *fault_mm = vma ? vma->vm_mm : NULL;
23f919d4ad0eb32 Arnd Bergmann           2016-12-12  2305  	struct shmem_inode_info *info = SHMEM_I(inode);
91ab656ece137c3 Kairui Song             2025-07-28  2306  	swp_entry_t swap, index_entry;
cbc2bd98db85504 Kairui Song             2022-12-20  2307  	struct swap_info_struct *si;
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2308) 	struct folio *folio = NULL;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2309  	bool skip_swapcache = false;
058313515d5aab1 Baolin Wang             2025-02-25  2310  	int error, nr_pages, order, split_order;
91ab656ece137c3 Kairui Song             2025-07-28  2311  	pgoff_t offset;
66d2f4d28cd0302 Hugh Dickins            2014-07-02  2312  
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2313) 	VM_BUG_ON(!*foliop || !xa_is_value(*foliop));
91ab656ece137c3 Kairui Song             2025-07-28  2314  	index_entry = radix_to_swp_entry(*foliop);
91ab656ece137c3 Kairui Song             2025-07-28  2315  	swap = index_entry;
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2316) 	*foliop = NULL;
^1da177e4c3f415 Linus Torvalds          2005-04-16  2317  
af19487f00f34ff Axel Rasmussen          2023-07-07  2318  	if (is_poisoned_swp_entry(swap))
6cec2b95dadf77c Miaohe Lin              2022-05-19  2319  		return -EIO;
6cec2b95dadf77c Miaohe Lin              2022-05-19  2320  
cbc2bd98db85504 Kairui Song             2022-12-20  2321  	si = get_swap_device(swap);
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2322  	order = shmem_confirm_swap(mapping, index, swap);
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2323  	if (unlikely(!si)) {
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2324  		if (order < 0)
cbc2bd98db85504 Kairui Song             2022-12-20  2325  			return -EEXIST;
cbc2bd98db85504 Kairui Song             2022-12-20  2326  		else
cbc2bd98db85504 Kairui Song             2022-12-20  2327  			return -EINVAL;
cbc2bd98db85504 Kairui Song             2022-12-20  2328  	}
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2329  	if (unlikely(order < 0)) {
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2330  		put_swap_device(si);
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2331  		return -EEXIST;
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2332  	}
cbc2bd98db85504 Kairui Song             2022-12-20  2333  
^1da177e4c3f415 Linus Torvalds          2005-04-16  2334  	/* Look it up and read it in.. */
5739a81cf89f2bb Matthew Wilcox (Oracle  2022-09-02  2335) 	folio = swap_cache_get_folio(swap, NULL, 0);
5739a81cf89f2bb Matthew Wilcox (Oracle  2022-09-02  2336) 	if (!folio) {
9e18eb29356b7df Andres Lagar-Cavilla    2016-05-19  2337  		/* Or update major stats only when swapin succeeds?? */
9e18eb29356b7df Andres Lagar-Cavilla    2016-05-19  2338  		if (fault_type) {
68da9f055755ee2 Hugh Dickins            2011-07-25  2339  			*fault_type |= VM_FAULT_MAJOR;
9e18eb29356b7df Andres Lagar-Cavilla    2016-05-19  2340  			count_vm_event(PGMAJFAULT);
054a9f7ccd0a606 Hugh Dickins            2023-09-29  2341  			count_memcg_event_mm(fault_mm, PGMAJFAULT);
9e18eb29356b7df Andres Lagar-Cavilla    2016-05-19  2342  		}
12885cbe88ddf6c Baolin Wang             2024-08-12  2343  
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2344  		/* Skip swapcache for synchronous device. */
c262ffd72c8539d Kairui Song             2025-07-28  2345  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2346  			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2347  			if (!IS_ERR(folio)) {
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2348  				skip_swapcache = true;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2349  				goto alloced;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2350  			}
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2351  
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2352  			/*
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2353  			 * Fallback to swapin order-0 folio unless the swap entry
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2354  			 * already exists.
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2355  			 */
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2356  			error = PTR_ERR(folio);
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2357  			folio = NULL;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2358  			if (error == -EEXIST)
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2359  				goto failed;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2360  		}
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2361  
12885cbe88ddf6c Baolin Wang             2024-08-12  2362  		/*
91ab656ece137c3 Kairui Song             2025-07-28  2363  		 * Now swap device can only swap in order 0 folio, it is
12885cbe88ddf6c Baolin Wang             2024-08-12  2364  		 * necessary to recalculate the new swap entry based on
91ab656ece137c3 Kairui Song             2025-07-28  2365  		 * the offset, as the swapin index might be unalgined.
12885cbe88ddf6c Baolin Wang             2024-08-12  2366  		 */
91ab656ece137c3 Kairui Song             2025-07-28  2367  		if (order) {
91ab656ece137c3 Kairui Song             2025-07-28  2368  			offset = index - round_down(index, 1 << order);
12885cbe88ddf6c Baolin Wang             2024-08-12  2369  			swap = swp_entry(swp_type(swap), swp_offset(swap) + offset);
12885cbe88ddf6c Baolin Wang             2024-08-12  2370  		}
12885cbe88ddf6c Baolin Wang             2024-08-12  2371  
ddc1a5cbc05dc62 Hugh Dickins            2023-10-19  2372  		folio = shmem_swapin_cluster(swap, gfp, info, index);
5739a81cf89f2bb Matthew Wilcox (Oracle  2022-09-02  2373) 		if (!folio) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  2374  			error = -ENOMEM;
54af60421822bb9 Hugh Dickins            2011-08-03  2375  			goto failed;
^1da177e4c3f415 Linus Torvalds          2005-04-16  2376  		}
91ab656ece137c3 Kairui Song             2025-07-28  2377  	}
91ab656ece137c3 Kairui Song             2025-07-28  2378  alloced:
91ab656ece137c3 Kairui Song             2025-07-28  2379  	if (order > folio_order(folio)) {
058313515d5aab1 Baolin Wang             2025-02-25  2380  		/*
91ab656ece137c3 Kairui Song             2025-07-28  2381  		 * Swapin may get smaller folios due to various reasons:
91ab656ece137c3 Kairui Song             2025-07-28  2382  		 * It may fallback to order 0 due to memory pressure or race,
91ab656ece137c3 Kairui Song             2025-07-28  2383  		 * swap readahead may swap in order 0 folios into swapcache
058313515d5aab1 Baolin Wang             2025-02-25  2384  		 * asynchronously, while the shmem mapping can still stores
058313515d5aab1 Baolin Wang             2025-02-25  2385  		 * large swap entries. In such cases, we should split the
058313515d5aab1 Baolin Wang             2025-02-25  2386  		 * large swap entry to prevent possible data corruption.
058313515d5aab1 Baolin Wang             2025-02-25  2387  		 */
91ab656ece137c3 Kairui Song             2025-07-28  2388  		split_order = shmem_split_large_entry(inode, index, index_entry, gfp);
058313515d5aab1 Baolin Wang             2025-02-25  2389  		if (split_order < 0) {
058313515d5aab1 Baolin Wang             2025-02-25  2390  			error = split_order;
91ab656ece137c3 Kairui Song             2025-07-28  2391  			goto failed_nolock;
058313515d5aab1 Baolin Wang             2025-02-25  2392  		}
058313515d5aab1 Baolin Wang             2025-02-25  2393  
058313515d5aab1 Baolin Wang             2025-02-25  2394  		/*
058313515d5aab1 Baolin Wang             2025-02-25  2395  		 * If the large swap entry has already been split, it is
058313515d5aab1 Baolin Wang             2025-02-25  2396  		 * necessary to recalculate the new swap entry based on
058313515d5aab1 Baolin Wang             2025-02-25  2397  		 * the old order alignment.
058313515d5aab1 Baolin Wang             2025-02-25  2398  		 */
058313515d5aab1 Baolin Wang             2025-02-25  2399  		if (split_order > 0) {
91ab656ece137c3 Kairui Song             2025-07-28  2400  			offset = index - round_down(index, 1 << split_order);
91ab656ece137c3 Kairui Song             2025-07-28  2401  			swap = swp_entry(swp_type(swap), swp_offset(index_entry) + offset);
058313515d5aab1 Baolin Wang             2025-02-25  2402  		}
5c241ed8d031693 Kairui Song             2025-07-28  2403  	} else if (order < folio_order(folio)) {
5c241ed8d031693 Kairui Song             2025-07-28  2404  		swap.val = round_down(swap.val, 1 << folio_order(folio));
5c241ed8d031693 Kairui Song             2025-07-28  2405  		index = round_down(index, 1 << folio_order(folio));
^1da177e4c3f415 Linus Torvalds          2005-04-16  2406  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  2407  
5c241ed8d031693 Kairui Song             2025-07-28  2408  	/*
5c241ed8d031693 Kairui Song             2025-07-28  2409  	 * We have to do this with the folio locked to prevent races.
5c241ed8d031693 Kairui Song             2025-07-28  2410  	 * The shmem_confirm_swap below only checks if the first swap
5c241ed8d031693 Kairui Song             2025-07-28  2411  	 * entry matches the folio, that's enough to ensure the folio
5c241ed8d031693 Kairui Song             2025-07-28  2412  	 * is not used outside of shmem, as shmem swap entries
5c241ed8d031693 Kairui Song             2025-07-28  2413  	 * and swap cache folios are never partially freed.
5c241ed8d031693 Kairui Song             2025-07-28  2414  	 */
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2415) 	folio_lock(folio);
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2416  	if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2417  	    shmem_confirm_swap(mapping, index, swap) < 0 ||
5c241ed8d031693 Kairui Song             2025-07-28  2418  	    folio->swap.val != swap.val) {
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2419  		error = -EEXIST;
d189922862e03ce Hugh Dickins            2012-07-11  2420  		goto unlock;
bde05d1ccd51269 Hugh Dickins            2012-05-29  2421  	}
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2422) 	if (!folio_test_uptodate(folio)) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  2423  		error = -EIO;
54af60421822bb9 Hugh Dickins            2011-08-03  2424  		goto failed;
^1da177e4c3f415 Linus Torvalds          2005-04-16  2425  	}
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2426) 	folio_wait_writeback(folio);
40ff2d11bd58a39 Baolin Wang             2024-08-12  2427  	nr_pages = folio_nr_pages(folio);
^1da177e4c3f415 Linus Torvalds          2005-04-16  2428  
8a84802e2a2b1a6 Steven Price            2020-05-13  2429  	/*
8a84802e2a2b1a6 Steven Price            2020-05-13  2430  	 * Some architectures may have to restore extra metadata to the
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2431) 	 * folio after reading from swap.
8a84802e2a2b1a6 Steven Price            2020-05-13  2432  	 */
f238b8c33c6738f Barry Song              2024-03-23  2433  	arch_swap_restore(folio_swap(swap, folio), folio);
8a84802e2a2b1a6 Steven Price            2020-05-13  2434  
069d849cde3a02c Matthew Wilcox (Oracle  2022-05-12  2435) 	if (shmem_should_replace_folio(folio, gfp)) {
736f0e03564729a Baolin Wang             2024-08-12  2436  		error = shmem_replace_folio(&folio, gfp, info, index, vma);
bde05d1ccd51269 Hugh Dickins            2012-05-29  2437  		if (error)
54af60421822bb9 Hugh Dickins            2011-08-03  2438  			goto failed;
^1da177e4c3f415 Linus Torvalds          2005-04-16  2439  	}
27ab700626f0484 Hugh Dickins            2011-07-25  2440  
40ff2d11bd58a39 Baolin Wang             2024-08-12  2441  	error = shmem_add_to_page_cache(folio, mapping,
40ff2d11bd58a39 Baolin Wang             2024-08-12  2442  					round_down(index, nr_pages),
054a9f7ccd0a606 Hugh Dickins            2023-09-29  2443  					swp_to_radix_entry(swap), gfp);
3fea5a499d57dec Johannes Weiner         2020-06-03  2444  	if (error)
54af60421822bb9 Hugh Dickins            2011-08-03  2445  		goto failed;
00501b531c47239 Johannes Weiner         2014-08-08  2446  
40ff2d11bd58a39 Baolin Wang             2024-08-12  2447  	shmem_recalc_inode(inode, 0, -nr_pages);
54af60421822bb9 Hugh Dickins            2011-08-03  2448  
66d2f4d28cd0302 Hugh Dickins            2014-07-02  2449  	if (sgp == SGP_WRITE)
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2450) 		folio_mark_accessed(folio);
66d2f4d28cd0302 Hugh Dickins            2014-07-02  2451  
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2452  	if (skip_swapcache) {
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2453  		folio->swap.val = 0;
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2454  		swapcache_clear(si, swap, nr_pages);
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2455  	} else {
75fa68a5d89871a Matthew Wilcox (Oracle  2022-06-17  2456) 		delete_from_swap_cache(folio);
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2457  	}
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2458) 	folio_mark_dirty(folio);
40ff2d11bd58a39 Baolin Wang             2024-08-12  2459  	swap_free_nr(swap, nr_pages);
cbc2bd98db85504 Kairui Song             2022-12-20  2460  	put_swap_device(si);
27ab700626f0484 Hugh Dickins            2011-07-25  2461  
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2462) 	*foliop = folio;
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2463  	return 0;
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2464  failed:
0cfc0e7e3d062b9 Kairui Song             2025-07-28  2465  	if (shmem_confirm_swap(mapping, index, swap) < 0)
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2466  		error = -EEXIST;
6cec2b95dadf77c Miaohe Lin              2022-05-19  2467  	if (error == -EIO)
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2468  		shmem_set_folio_swapin_error(inode, index, folio, swap,
1dd44c0af4fa1e8 Baolin Wang             2025-01-08  2469  					     skip_swapcache);
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2470  unlock:
91ab656ece137c3 Kairui Song             2025-07-28 @2471  	if (folio)
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2472) 		folio_unlock(folio);
91ab656ece137c3 Kairui Song             2025-07-28  2473  failed_nolock:
91ab656ece137c3 Kairui Song             2025-07-28  2474  	if (skip_swapcache)
91ab656ece137c3 Kairui Song             2025-07-28 @2475  		swapcache_clear(si, folio->swap, folio_nr_pages(folio));
91ab656ece137c3 Kairui Song             2025-07-28  2476  	if (folio)
da08e9b7932345a Matthew Wilcox (Oracle  2022-05-12  2477) 		folio_put(folio);
cbc2bd98db85504 Kairui Song             2022-12-20  2478  	put_swap_device(si);
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2479  
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2480  	return error;
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2481  }
c5bf121e4350a93 Vineeth Remanan Pillai  2019-03-05  2482  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
