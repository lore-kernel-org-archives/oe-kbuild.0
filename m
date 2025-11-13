Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41ADD33892C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763046869; cv=none; b=CryvEdOlk4KA+d+CM+1r5wAT41th+/TI4B08O9W/HNHMk2+bKPnEqUp284mIpWmFGGkwv62AIO7ha4QCF1RevIQS1cx/047WRCQAK1Dhsl/WjBCB1PCpU3qfs9SQyIrXCqlBSrghP+ZmXh/qDOvVht8KuvkQ6Wk20XKpM4vfbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763046869; c=relaxed/simple;
	bh=2dbMax/3/aSEDI02LFpHN7UC9fUYb46z3Xn7kAx0DbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSagraqJn4rBQoNTyuGlhB6NFm3phvjEG3v58poOthqr19rSP4sqf/m/1IbeE1TvtoADmg0SVxiREcXlE8+MiVohWvdlzGXMjQhEreVVldSlFuGtoAwJ8Gm5+GojgTZ3wzMvoYFFB49AIm+2QcRFkq1LTAbng8l61ZvoaQQcx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdyylWiB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdyylWiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046868; x=1794582868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2dbMax/3/aSEDI02LFpHN7UC9fUYb46z3Xn7kAx0DbA=;
  b=hdyylWiB6bNJ6Y9OU9c1kPxpaU26LfflFI5/vF7vP/2JbDkZY7FZEi+y
   fkdge6Ou1RsB5OLLpzdMmHEythiO+FMB5cMKFP7hwUmKGwgV9BSa9GYJ8
   hoV+5vX+EywpbqI4xI9od/pWjfgOGUY+dWcruV1EiS0Ht/gvzqpqqH1qA
   zUJxom/94UfTn2nGOQuvfKTKaN0xk+PmmbfPu0Wpf4YLkF6KeQ1nvtCdT
   cZnPcLIrjvTvNJfQ7A6QysBmysk5j0iIy4gQf5y1QGoVQZe169dnNCO2E
   Fx68Chjqa1LxuglPZFVbBid9mzsXs2C76NFnvhLqC2Pfy8wjtU2wDP8am
   g==;
X-CSE-ConnectionGUID: 2TYFpPqBSJ+vQvGgOnVNZw==
X-CSE-MsgGUID: Nge21cnXRASx29fijE9C+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65065142"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65065142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:14:28 -0800
X-CSE-ConnectionGUID: MTnbqMDNRmOAKG+NG18GiA==
X-CSE-MsgGUID: dlsXeXiST2+xAAoNI1yfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="193779660"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 07:14:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJZ1k-0005T1-0O;
	Thu, 13 Nov 2025 15:14:24 +0000
Date: Thu, 13 Nov 2025 23:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 23/35] mm/page_alloc.c:1559 free_one_page()
 error: uninitialized symbol 'flags'.
Message-ID: <202511132304.zffRmaGj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   a5e647f51df9e4ab2bb1f4321e95362a72d2a5e1
commit: e6405909f26757d5cf56346039e501cc194e3b9f [23/35] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132304.zffRmaGj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511132304.zffRmaGj-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:1559 free_one_page() error: uninitialized symbol 'flags'.
mm/page_alloc.c:2551 rmqueue_bulk() error: uninitialized symbol 'flags'.
mm/page_alloc.c:3189 rmqueue_buddy() error: uninitialized symbol 'flags'.

vim +/flags +1559 mm/page_alloc.c

8c57b687e8331e Alexei Starovoitov      2025-02-21  1527  
55612e80e722ac Johannes Weiner         2024-03-20  1528  static void free_one_page(struct zone *zone, struct page *page,
55612e80e722ac Johannes Weiner         2024-03-20  1529  			  unsigned long pfn, unsigned int order,
55612e80e722ac Johannes Weiner         2024-03-20  1530  			  fpi_t fpi_flags)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1531  {
8c57b687e8331e Alexei Starovoitov      2025-02-21  1532  	struct llist_head *llhead;
df1acc856923c0 Mel Gorman              2021-06-28  1533  	unsigned long flags;
df1acc856923c0 Mel Gorman              2021-06-28  1534  
8c57b687e8331e Alexei Starovoitov      2025-02-21  1535  	if (unlikely(fpi_flags & FPI_TRYLOCK)) {
c5bb27e2da3a6e Alexei Starovoitov      2025-03-30  1536  		if (!spin_trylock_irqsave(&zone->lock, flags)) {
8c57b687e8331e Alexei Starovoitov      2025-02-21  1537  			add_page_to_zone_llist(zone, page, order);
8c57b687e8331e Alexei Starovoitov      2025-02-21  1538  			return;
8c57b687e8331e Alexei Starovoitov      2025-02-21  1539  		}
c5bb27e2da3a6e Alexei Starovoitov      2025-03-30  1540  	} else {
df1acc856923c0 Mel Gorman              2021-06-28  1541  		spin_lock_irqsave(&zone->lock, flags);
8c57b687e8331e Alexei Starovoitov      2025-02-21  1542  	}
8c57b687e8331e Alexei Starovoitov      2025-02-21  1543  
8c57b687e8331e Alexei Starovoitov      2025-02-21  1544  	/* The lock succeeded. Process deferred pages. */
8c57b687e8331e Alexei Starovoitov      2025-02-21  1545  	llhead = &zone->trylock_free_pages;
8c57b687e8331e Alexei Starovoitov      2025-02-21  1546  	if (unlikely(!llist_empty(llhead) && !(fpi_flags & FPI_TRYLOCK))) {
8c57b687e8331e Alexei Starovoitov      2025-02-21  1547  		struct llist_node *llnode;
8c57b687e8331e Alexei Starovoitov      2025-02-21  1548  		struct page *p, *tmp;
8c57b687e8331e Alexei Starovoitov      2025-02-21  1549  
8c57b687e8331e Alexei Starovoitov      2025-02-21  1550  		llnode = llist_del_all(llhead);
8c57b687e8331e Alexei Starovoitov      2025-02-21  1551  		llist_for_each_entry_safe(p, tmp, llnode, pcp_llist) {
9d003dec972563 Matthew Wilcox (Oracle  2025-09-10  1552) 			unsigned int p_order = p->private;
8c57b687e8331e Alexei Starovoitov      2025-02-21  1553  
8c57b687e8331e Alexei Starovoitov      2025-02-21  1554  			split_large_buddy(zone, p, page_to_pfn(p), p_order, fpi_flags);
8c57b687e8331e Alexei Starovoitov      2025-02-21  1555  			__count_vm_events(PGFREE, 1 << p_order);
8c57b687e8331e Alexei Starovoitov      2025-02-21  1556  		}
8c57b687e8331e Alexei Starovoitov      2025-02-21  1557  	}
e98337d11bbdfa Yu Zhao                 2024-08-13  1558  	split_large_buddy(zone, page, pfn, order, fpi_flags);
df1acc856923c0 Mel Gorman              2021-06-28 @1559  	spin_unlock_irqrestore(&zone->lock, flags);
ec867977fed07b Yosry Ahmed             2024-09-04  1560  
ec867977fed07b Yosry Ahmed             2024-09-04  1561  	__count_vm_events(PGFREE, 1 << order);
48db57f8ff10eb Nicholas Piggin         2006-01-08  1562  }
48db57f8ff10eb Nicholas Piggin         2006-01-08  1563  

:::::: The code at line 1559 was first introduced by commit
:::::: df1acc856923c0a65c28b588585449106c316b71 mm/page_alloc: avoid conflating IRQs disabled with zone->lock

:::::: TO: Mel Gorman <mgorman@techsingularity.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
