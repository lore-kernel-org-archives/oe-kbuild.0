Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936E2E36FD
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754169408; cv=none; b=CFr0zgejrCVZRZy9HHEYW+cFl9CkV/eCF3LKehnrglGDtqI6Rp9wHde3QG/UUgu0ThJWctxC5Og/hhY/PTZ2cztAyQ04itZ0uK4Ov23lpnqKYO0XyqvZUefbk1MU/QEDs3ibaqgwKY+n703szfd3LoVuBWoa9lzuwsMc9fauFkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754169408; c=relaxed/simple;
	bh=J6f3Ebm1p+dDPYasB/nA6I2iO5V+8BQB7ejnR3Wyntw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCTZ6QGQIXJqlkU+BGIq7qgfzoRteZ9UKbddK3gM5kllBmyxyU84jfgNOLBqYDaaqRZig62h6mFV3Q+0DzhkzyMaMZxMsQ8VfgILrrLUX4KNh/6XG5wycp+wDldVcaKWHQmKVyxXGQGJEB/XKiw/8XguAd+IJom12ZcWKtt2zS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/6BMByq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/6BMByq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754169406; x=1785705406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6f3Ebm1p+dDPYasB/nA6I2iO5V+8BQB7ejnR3Wyntw=;
  b=g/6BMByqq8jvAHjl0GlvNXZENMFzI2ifEK+sTrr0y5LP1Ur+M0xFjf7W
   o7LH2cNMIXAeqaHycitxGOAdn6WkF4DyFbZMGJPhWWCmh1yV5BoNRO+ml
   AkEWzA1pZFQ2SLryyR1a+dUhJeISzSvdddsUu1iJf1zp/36qU1WQtBjtr
   1Zgyd4HGkUCKkQqP07QeBmuFuYRzC9tHFIY9DBiatlX/ncA9CA/XMl0ac
   +rw9//M53AdCjP/L0+/Q1I/RyCW1G6Mk3lLDsFohLhdJzDs72aoLkjtWU
   7gkhf4EG+xGH+nWA63AiBUnsZFyEcSxU07MEYZF/Fb4tRDLKfcU/DafdM
   Q==;
X-CSE-ConnectionGUID: zvrBX8tTSUyTGUEUaY1Rlg==
X-CSE-MsgGUID: pGQR4Sn5Q+mNukwE2nKstg==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56351723"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56351723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 14:16:45 -0700
X-CSE-ConnectionGUID: JEbvvx5DRzes45MMQriGDg==
X-CSE-MsgGUID: rjQgIb5DRB+ELNM2VeVUEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163118151"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Aug 2025 14:16:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiJar-0005bk-3B;
	Sat, 02 Aug 2025 21:16:41 +0000
Date: Sun, 3 Aug 2025 05:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/33] mm/page_alloc.c:1413 free_one_page()
 error: uninitialized symbol 'flags'.
Message-ID: <202508030515.nn1N4DQ8-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 07280c2d8adefee6af2653b928aec55a5a95e8e8 [23/33] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030515.nn1N4DQ8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508030515.nn1N4DQ8-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:1413 free_one_page() error: uninitialized symbol 'flags'.
mm/page_alloc.c:2366 rmqueue_bulk() error: uninitialized symbol 'flags'.
mm/page_alloc.c:2989 rmqueue_buddy() error: uninitialized symbol 'flags'.

vim +/flags +1413 mm/page_alloc.c

8c57b687e8331e Alexei Starovoitov 2025-02-21  1381  
55612e80e722ac Johannes Weiner    2024-03-20  1382  static void free_one_page(struct zone *zone, struct page *page,
55612e80e722ac Johannes Weiner    2024-03-20  1383  			  unsigned long pfn, unsigned int order,
55612e80e722ac Johannes Weiner    2024-03-20  1384  			  fpi_t fpi_flags)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1385  {
8c57b687e8331e Alexei Starovoitov 2025-02-21  1386  	struct llist_head *llhead;
df1acc856923c0 Mel Gorman         2021-06-28  1387  	unsigned long flags;
df1acc856923c0 Mel Gorman         2021-06-28  1388  
8c57b687e8331e Alexei Starovoitov 2025-02-21  1389  	if (unlikely(fpi_flags & FPI_TRYLOCK)) {
c5bb27e2da3a6e Alexei Starovoitov 2025-03-30  1390  		if (!spin_trylock_irqsave(&zone->lock, flags)) {
8c57b687e8331e Alexei Starovoitov 2025-02-21  1391  			add_page_to_zone_llist(zone, page, order);
8c57b687e8331e Alexei Starovoitov 2025-02-21  1392  			return;
8c57b687e8331e Alexei Starovoitov 2025-02-21  1393  		}
c5bb27e2da3a6e Alexei Starovoitov 2025-03-30  1394  	} else {
df1acc856923c0 Mel Gorman         2021-06-28  1395  		spin_lock_irqsave(&zone->lock, flags);
8c57b687e8331e Alexei Starovoitov 2025-02-21  1396  	}
8c57b687e8331e Alexei Starovoitov 2025-02-21  1397  
8c57b687e8331e Alexei Starovoitov 2025-02-21  1398  	/* The lock succeeded. Process deferred pages. */
8c57b687e8331e Alexei Starovoitov 2025-02-21  1399  	llhead = &zone->trylock_free_pages;
8c57b687e8331e Alexei Starovoitov 2025-02-21  1400  	if (unlikely(!llist_empty(llhead) && !(fpi_flags & FPI_TRYLOCK))) {
8c57b687e8331e Alexei Starovoitov 2025-02-21  1401  		struct llist_node *llnode;
8c57b687e8331e Alexei Starovoitov 2025-02-21  1402  		struct page *p, *tmp;
8c57b687e8331e Alexei Starovoitov 2025-02-21  1403  
8c57b687e8331e Alexei Starovoitov 2025-02-21  1404  		llnode = llist_del_all(llhead);
8c57b687e8331e Alexei Starovoitov 2025-02-21  1405  		llist_for_each_entry_safe(p, tmp, llnode, pcp_llist) {
8c57b687e8331e Alexei Starovoitov 2025-02-21  1406  			unsigned int p_order = p->order;
8c57b687e8331e Alexei Starovoitov 2025-02-21  1407  
8c57b687e8331e Alexei Starovoitov 2025-02-21  1408  			split_large_buddy(zone, p, page_to_pfn(p), p_order, fpi_flags);
8c57b687e8331e Alexei Starovoitov 2025-02-21  1409  			__count_vm_events(PGFREE, 1 << p_order);
8c57b687e8331e Alexei Starovoitov 2025-02-21  1410  		}
8c57b687e8331e Alexei Starovoitov 2025-02-21  1411  	}
e98337d11bbdfa Yu Zhao            2024-08-13  1412  	split_large_buddy(zone, page, pfn, order, fpi_flags);
df1acc856923c0 Mel Gorman         2021-06-28 @1413  	spin_unlock_irqrestore(&zone->lock, flags);
ec867977fed07b Yosry Ahmed        2024-09-04  1414  
ec867977fed07b Yosry Ahmed        2024-09-04  1415  	__count_vm_events(PGFREE, 1 << order);
48db57f8ff10eb Nicholas Piggin    2006-01-08  1416  }
48db57f8ff10eb Nicholas Piggin    2006-01-08  1417  

:::::: The code at line 1413 was first introduced by commit
:::::: df1acc856923c0a65c28b588585449106c316b71 mm/page_alloc: avoid conflating IRQs disabled with zone->lock

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
