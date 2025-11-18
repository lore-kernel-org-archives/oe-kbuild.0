Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0C35CB73
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477502; cv=none; b=bw90eDGaYfJvWozbgPIWhkr0eqpltO3RtQ3hK+wiumONMk7bzUdWImNGOQibtPrxkmVuMmp4XwmzsccUKCOvzKVME9NHchFK3FiZxj/6KK1+7OGi0WGAWpaXMnueshgSglgySSbQp1LUU/zIWnB+QXyhqf6KU1SzIswRoDQShkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477502; c=relaxed/simple;
	bh=oEQjgXX9gcnNG6uf/P8CBxH6Ywq49h1E3RjjF5LY8kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rf1B+W2Gb2BIYN5WGVQdFIFAVBhWqoclefsWyjI0oMXPlIJLDcWievs29o1VReBKK7bQJSe+sonk6ayrLsKWULOV3bct15x6uZq/lNAxtIiEEckKaE3bx6ydIWWizKA5fi9RlfuMsUSLgfYMmCalClUnBSyk+b+VpGm5ZTLY7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4cvhwqb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4cvhwqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763477500; x=1795013500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEQjgXX9gcnNG6uf/P8CBxH6Ywq49h1E3RjjF5LY8kE=;
  b=g4cvhwqbK6Xxm7A5aook8ZvO8kkpEJWdYjxKZ3EpyyZnN+TnuZcDfZI6
   wNKF0IJr0WErHKZCnqR6KeDPR0tM+Oqqa/9wYiW6rWgSvHnDcRc+gXWqU
   HF2p2FEUY9BI8IgVc+xahqiwK4zSRXA78D+SjULiSJd3wJm8xt0pD6yeZ
   0X7B9PGcqKMSTLROfB8T/zo00oU9ofZaIQoAI4giffscQrljvm/JHRfSZ
   bHcMqFnnB56K6LJoehaVgS8qnvyUsT7nJtHuUsFG1tG+S07GntXZeXBH1
   t6CkQ1PI3zsvvW3sEJhCTnJyvM9s0EDVB9V7V7Rjx/dtJlfeulZK03DIJ
   A==;
X-CSE-ConnectionGUID: WKqwMotITXGZa+Z+jabl4g==
X-CSE-MsgGUID: 56PAPxGXTqa7oF/7QLWpvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69351498"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="69351498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:51:40 -0800
X-CSE-ConnectionGUID: MoWg0zVhQqquhO4V11UF9g==
X-CSE-MsgGUID: QwXVnjZ0Sz+ZJpQUj/HUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221433160"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2025 06:51:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLN3Q-0001qm-2l;
	Tue, 18 Nov 2025 14:51:36 +0000
Date: Tue, 18 Nov 2025 22:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [davidhildenbrand:zerotags 1/1] mm/page_alloc.c:1800
 post_alloc_hook() warn: bitwise AND condition is false here
Message-ID: <202511182242.rTlAntag-lkp@intel.com>
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
TO: "David Hildenbrand (Red Hat)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux zerotags
head:   58e62699f77738188730d489accd01ad8e3cdeeb
commit: 58e62699f77738188730d489accd01ad8e3cdeeb [1/1] mm/huge_memory: fix __GFP_ZEROTAGS on architectures without memory tags
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: openrisc-randconfig-r073-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182242.rTlAntag-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511182242.rTlAntag-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:1800 post_alloc_hook() warn: bitwise AND condition is false here

vim +1800 mm/page_alloc.c

ecd09650692233 Daniel Jordan       2020-06-03  1794  
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1795) inline void post_alloc_hook(struct page *page, unsigned int order,
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1796) 				gfp_t gfp_flags)
7e18adb4f80bea Mel Gorman          2015-06-30  1797  {
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1798) 	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1799) 			!should_skip_init(gfp_flags);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21 @1800) 	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1801) 	int i;
0e1cc95b4cc729 Mel Gorman          2015-06-30  1802  
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1803) 	set_page_private(page, 0);
7e18adb4f80bea Mel Gorman          2015-06-30  1804  
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1805) 	arch_alloc_page(page, order);
9420f89db2dd61 Mike Rapoport (IBM  2023-03-21  1806) 	debug_pagealloc_map_pages(page, 1 << order);
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1807  
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1808  	/*
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1809  	 * Page unpoisoning must happen before memory initialization.
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1810  	 * Otherwise, the poison pattern will be overwritten for __GFP_ZERO
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1811  	 * allocations and the page unpoisoning code will complain.
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1812  	 */
8db26a3d47354c Vlastimil Babka     2020-12-14  1813  	kernel_unpoison_pages(page, 1 << order);
862b6dee20b0db David Hildenbrand   2020-12-14  1814  
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1815  	/*
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1816  	 * As memory initialization might be integrated into KASAN,
b42090ae6f3aa0 Andrey Konovalov    2022-03-24  1817  	 * KASAN unpoisoning and memory initializion code must be
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1818  	 * kept together to avoid discrepancies in behavior.
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1819  	 */
b42090ae6f3aa0 Andrey Konovalov    2022-03-24  1820  
9294b1281d0a21 Andrey Konovalov    2022-03-24  1821  	/*
44383cef54c0ce Andrey Konovalov    2022-12-19  1822  	 * If memory tags should be zeroed
44383cef54c0ce Andrey Konovalov    2022-12-19  1823  	 * (which happens only when memory should be initialized as well).
9294b1281d0a21 Andrey Konovalov    2022-03-24  1824  	 */
44383cef54c0ce Andrey Konovalov    2022-12-19  1825  	if (zero_tags) {
420ef683b52173 Andrey Konovalov    2023-01-24  1826  		/* Initialize both memory and memory tags. */
b42090ae6f3aa0 Andrey Konovalov    2022-03-24  1827  		for (i = 0; i != 1 << order; ++i)
b42090ae6f3aa0 Andrey Konovalov    2022-03-24  1828  			tag_clear_highpage(page + i);
b8491b9052fef0 Andrey Konovalov    2022-03-24  1829  
44383cef54c0ce Andrey Konovalov    2022-12-19  1830  		/* Take note that memory was initialized by the loop above. */
b8491b9052fef0 Andrey Konovalov    2022-03-24  1831  		init = false;
5b2c07138cbd8c Andrey Konovalov    2022-03-24  1832  	}
0a54864f8dfb64 Peter Collingbourne 2023-03-09  1833  	if (!should_skip_kasan_unpoison(gfp_flags) &&
0a54864f8dfb64 Peter Collingbourne 2023-03-09  1834  	    kasan_unpoison_pages(page, order, init)) {
44383cef54c0ce Andrey Konovalov    2022-12-19  1835  		/* Take note that memory was initialized by KASAN. */
e9d0ca9228162f Andrey Konovalov    2022-03-24  1836  		if (kasan_has_integrated_init())
7e3cbba65de22f Andrey Konovalov    2022-03-24  1837  			init = false;
70c248aca9e7ef Catalin Marinas     2022-06-10  1838  	} else {
44383cef54c0ce Andrey Konovalov    2022-12-19  1839  		/*
0a54864f8dfb64 Peter Collingbourne 2023-03-09  1840  		 * If memory tags have not been set by KASAN, reset the page
0a54864f8dfb64 Peter Collingbourne 2023-03-09  1841  		 * tags to ensure page_address() dereferencing does not fault.
44383cef54c0ce Andrey Konovalov    2022-12-19  1842  		 */
70c248aca9e7ef Catalin Marinas     2022-06-10  1843  		for (i = 0; i != 1 << order; ++i)
70c248aca9e7ef Catalin Marinas     2022-06-10  1844  			page_kasan_tag_reset(page + i);
7e3cbba65de22f Andrey Konovalov    2022-03-24  1845  	}
44383cef54c0ce Andrey Konovalov    2022-12-19  1846  	/* If memory is still not initialized, initialize it now. */
b8491b9052fef0 Andrey Konovalov    2022-03-24  1847  	if (init)
aeaec8e27eddc1 Andrey Konovalov    2022-06-09  1848  		kernel_init_pages(page, 1 << order);
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1849  
1bb5eab30d68c1 Andrey Konovalov    2021-04-29  1850  	set_page_owner(page, order, gfp_flags);
df4e817b710809 Pasha Tatashin      2022-01-14  1851  	page_table_check_alloc(page, order);
dcfe378c81f72f Suren Baghdasaryan  2024-03-21  1852  	pgalloc_tag_add(page, current, 1 << order);
46f24fd857b37b Joonsoo Kim         2016-07-26  1853  }
46f24fd857b37b Joonsoo Kim         2016-07-26  1854  

:::::: The code at line 1800 was first introduced by commit
:::::: 9420f89db2dd611c5b436a13e13f74d65ecc3a6a mm: move most of core MM initialization to mm/mm_init.c

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
