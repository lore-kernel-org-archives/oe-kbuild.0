Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ACF34404B
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526862; cv=none; b=rw5WZquQuzWK8o3WQjh4d+BN1u9CiMijF+We+u7BT2JDFPFLszBHqGexCFnCY998Vq9j3wwk/uKcSLnGU9uWoBGvabpnRQSHd/9CfWB1CF8xsJziGPXkGs5wyDNtfpqfYMiyBa1+Sgm6Mo7vnWusPgOBBPNkgFu62IM42K6UqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526862; c=relaxed/simple;
	bh=LCNaMRxscDzezyQBUZHgyZcu3/8eb81FYnEO+Z9BnzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tu5I9g/mu5VHL2xWnzzEsTNezfx72F3fjp24As2OWFwnr5tgMV+APaa6GkBLTtFapQK8Na8Jvwh0LWE0I7PvpC9b0W1dnON/KKj/+WnwV11RfkVxX0yf88rghadsy7J32jIwOyxVG6xS69RyF2jDbfxwLBy4tWYEOYKtIYxrf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1V739QG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1V739QG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791526861; x=1823062861;
  h=date:from:to:cc:subject:message-id;
  bh=LCNaMRxscDzezyQBUZHgyZcu3/8eb81FYnEO+Z9BnzM=;
  b=G1V739QG6kljYG3YPdcsjKhvvUQWxMWt8+X6WUz4moiTbC2N+y2Uhy5D
   YIlIWacIiIbSBszaws7YN7pexJZZJLdb6Z4Xjoj4vUKMGn7oq3g5HvxQr
   A12GBM3PvoyOM+N65e9V0Y/840I6gS8c2mGq8ceO5o0qVDTMtBsGteZhB
   NRaVRHviDzWB3UQ+ltTYIZLnT7eg7VCc3ZKJZjFNcDrPfEB0nnWRHC2vf
   bFrOWkQ56eNOCZSWb4SlK6Ty6lOM2xMgl6tv4Ar5Wv+lccg3kjvQPugQ2
   9PzXbfSqZcbG2JESztUo/DKC7bZDi9JQT/YXDusZtjzZRkAp9IOmP09PP
   w==;
X-CSE-ConnectionGUID: 7+/C9/QCTeGMxn8DVjFhtw==
X-CSE-MsgGUID: raLQRNqVQVqldPyydrKiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="429448"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="429448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:21:00 -0700
X-CSE-ConnectionGUID: Gur7pKNJQEevOwJ5KPhcFA==
X-CSE-MsgGUID: K0it/9Y2SCWz6eGXel9Nhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="184118"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2026 23:20:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF3yR-000000006nv-43Dj;
	Fri, 09 Oct 2026 06:20:55 +0000
Date: Fri, 09 Oct 2026 08:19:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/page_alloc.c:3472 reserve_highatomic_pageblock() warn:
 inconsistent returns '&zone->lock'.
Message-ID: <202610090809.1WrAzuGx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Ilvokhin <d@ilvokhin.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af32da41b0327b9c6a37856ba82b6760d6c8d10e
commit: 5ebb2064da361ca860c052bca9ae37962adef3f7 mm: use zone lock guard in reserve_highatomic_pageblock()
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r2200-20261009 (https://download.01.org/0day-ci/archive/20261009/202610090809.1WrAzuGx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5ebb2064da36 ("mm: use zone lock guard in reserve_highatomic_pageblock()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610090809.1WrAzuGx-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:3472 reserve_highatomic_pageblock() warn: inconsistent returns '&zone->lock'.
mm/page_alloc.c:3472 reserve_highatomic_pageblock() warn: inconsistent returns 'irq'.

vim +3472 mm/page_alloc.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  3435  
a4138a2702a4428 Johannes Weiner 2025-02-24  3436  /*
a4138a2702a4428 Johannes Weiner 2025-02-24  3437   * Reserve the pageblock(s) surrounding an allocation request for
a4138a2702a4428 Johannes Weiner 2025-02-24  3438   * exclusive use of high-order atomic allocations if there are no
a4138a2702a4428 Johannes Weiner 2025-02-24  3439   * empty page blocks that contain a page with a suitable order
a4138a2702a4428 Johannes Weiner 2025-02-24  3440   */
a4138a2702a4428 Johannes Weiner 2025-02-24  3441  static void reserve_highatomic_pageblock(struct page *page, int order,
a4138a2702a4428 Johannes Weiner 2025-02-24  3442  					 struct zone *zone)
a4138a2702a4428 Johannes Weiner 2025-02-24  3443  {
a4138a2702a4428 Johannes Weiner 2025-02-24  3444  	int mt;
5ebb2064da361ca Dmitry Ilvokhin 2026-04-29  3445  	unsigned long max_managed;
a4138a2702a4428 Johannes Weiner 2025-02-24  3446  
a4138a2702a4428 Johannes Weiner 2025-02-24  3447  	/*
a4138a2702a4428 Johannes Weiner 2025-02-24  3448  	 * The number reserved as: minimum is 1 pageblock, maximum is
a4138a2702a4428 Johannes Weiner 2025-02-24  3449  	 * roughly 1% of a zone. But if 1% of a zone falls below a
a4138a2702a4428 Johannes Weiner 2025-02-24  3450  	 * pageblock size, then don't reserve any pageblocks.
a4138a2702a4428 Johannes Weiner 2025-02-24  3451  	 * Check is race-prone but harmless.
a4138a2702a4428 Johannes Weiner 2025-02-24  3452  	 */
a4138a2702a4428 Johannes Weiner 2025-02-24  3453  	if ((zone_managed_pages(zone) / 100) < pageblock_nr_pages)
a4138a2702a4428 Johannes Weiner 2025-02-24  3454  		return;
a4138a2702a4428 Johannes Weiner 2025-02-24  3455  	max_managed = ALIGN((zone_managed_pages(zone) / 100), pageblock_nr_pages);
a4138a2702a4428 Johannes Weiner 2025-02-24  3456  	if (zone->nr_reserved_highatomic >= max_managed)
a4138a2702a4428 Johannes Weiner 2025-02-24  3457  		return;
a4138a2702a4428 Johannes Weiner 2025-02-24  3458  
5ebb2064da361ca Dmitry Ilvokhin 2026-04-29  3459  	guard(spinlock_irqsave)(&zone->lock);
a4138a2702a4428 Johannes Weiner 2025-02-24  3460  
a4138a2702a4428 Johannes Weiner 2025-02-24  3461  	/* Recheck the nr_reserved_highatomic limit under the lock */
a4138a2702a4428 Johannes Weiner 2025-02-24  3462  	if (zone->nr_reserved_highatomic >= max_managed)
5ebb2064da361ca Dmitry Ilvokhin 2026-04-29  3463  		return;
a4138a2702a4428 Johannes Weiner 2025-02-24  3464  
a4138a2702a4428 Johannes Weiner 2025-02-24  3465  	/* Yoink! */
a4138a2702a4428 Johannes Weiner 2025-02-24  3466  	mt = get_pageblock_migratetype(page);
a4138a2702a4428 Johannes Weiner 2025-02-24  3467  	/* Only reserve normal pageblocks (i.e., they can merge with others) */
a4138a2702a4428 Johannes Weiner 2025-02-24  3468  	if (!migratetype_is_mergeable(mt))
5ebb2064da361ca Dmitry Ilvokhin 2026-04-29  3469  		return;
a4138a2702a4428 Johannes Weiner 2025-02-24  3470  
a4138a2702a4428 Johannes Weiner 2025-02-24  3471  	if (order < pageblock_order) {
a4138a2702a4428 Johannes Weiner 2025-02-24 @3472  		if (move_freepages_block(zone, page, mt, MIGRATE_HIGHATOMIC) == -1)
5ebb2064da361ca Dmitry Ilvokhin 2026-04-29  3473  			return;
a4138a2702a4428 Johannes Weiner 2025-02-24  3474  		zone->nr_reserved_highatomic += pageblock_nr_pages;
a4138a2702a4428 Johannes Weiner 2025-02-24  3475  	} else {
a4138a2702a4428 Johannes Weiner 2025-02-24  3476  		change_pageblock_range(page, order, MIGRATE_HIGHATOMIC);
a4138a2702a4428 Johannes Weiner 2025-02-24  3477  		zone->nr_reserved_highatomic += 1 << order;
a4138a2702a4428 Johannes Weiner 2025-02-24  3478  	}
a4138a2702a4428 Johannes Weiner 2025-02-24  3479  }
a4138a2702a4428 Johannes Weiner 2025-02-24  3480  

:::::: The code at line 3472 was first introduced by commit
:::::: a4138a2702a4428317ecdb115934554df4b788b4 mm: page_alloc: group fallback functions together

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
