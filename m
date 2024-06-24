Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0A219E1
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jun 2024 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719210259; cv=none; b=E6RG0jjN8oCebv/nE8sFkhpLo6YPa0a8/U9jcohkGC7USweU4WjHG4NRYZmByvkSyaniB78e/8E45qCQBlK91IeQ95v2dzNx7ipwJBhC7qVcdpIasJisRf6DK/G68o6vNn6ZGSVDNvPCButrzBVgOL3gbnfJWsbOHr7tkmYuUUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719210259; c=relaxed/simple;
	bh=c5BdXkaS8R8hZAU8lGjKEUAJpJDsyrTPVi4XHW54tlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9DOnpaRwFuN9exZvf5s21Xm6T+VlWpAPRhEljk6bobIlrCORiqJ3zNFWFbeY7bGBeKCxfe9pctfvGA+wCXk6Dw8cyQzvsXQ1nG3jwh4CETTxvYyGAXPL+/+b9tm+Qlhmw+Tm1x95bzOuzmw08QaYMXTOvafGuoLO7UXZrZlZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jkvr6TmF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jkvr6TmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719210256; x=1750746256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5BdXkaS8R8hZAU8lGjKEUAJpJDsyrTPVi4XHW54tlk=;
  b=Jkvr6TmFwemXIkDZWmCqcPRK+hFl9lLLFIITAyvNBGHVVSo859dwMZyN
   vjuKfiGptcvXPykN5LVYiZgm9PRRqIIwR9EK/ixn4AK/3F0gRB4LDdKcd
   2bQG7LkvHvdoL9nzxcDJRyHkXaI0wK+GCSsaY5rJ9J7BbBc0+7xOa6KV7
   /hEeMeKj2WW/Fdg0U3b2Tw/BdFDI9TyywDYBJ3HrZTgcajF+z+gZtteYr
   WbpHqn4qFFCLoWQSGZXQxHBku7dOvL+uFDYYqM6MRPXUf2mCRwP9WrFyd
   n4Frbb3RTqMapxkpyOZnVu9CXTV5jI+CMiMB8wpwKpa1ifCptVySiD4WG
   w==;
X-CSE-ConnectionGUID: BK0upDKHQpODYP3pCLhzAA==
X-CSE-MsgGUID: uXV4zXNXT7K6IoY/QaJz1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16288517"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="16288517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 23:24:15 -0700
X-CSE-ConnectionGUID: AVnLTh+3SeSpXEahGdtKrQ==
X-CSE-MsgGUID: 1j8+MnhaSTCBItH5QMtu+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="47556596"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2024 23:24:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLd7c-000CEG-0O;
	Mon, 24 Jun 2024 06:24:12 +0000
Date: Mon, 24 Jun 2024 14:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3578/7797] mm/mm_init.c:2118
 deferred_init_memmap_chunk() warn: iterator 'i' not incremented
Message-ID: <202406241418.9euCkzQO-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wei Yang <richard.weiyang@gmail.com>
CC: "Mike Rapoport (IBM)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
commit: f1180fd2a7c039691b64ebf404c746a74e40b7b0 [3578/7797] mm/mm_init.c: not always search next deferred_init_pfn from very beginning
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20240624 (https://download.01.org/0day-ci/archive/20240624/202406241418.9euCkzQO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406241418.9euCkzQO-lkp@intel.com/

smatch warnings:
mm/mm_init.c:2118 deferred_init_memmap_chunk() warn: iterator 'i' not incremented
mm/mm_init.c:2149 deferred_init_memmap() warn: iterator 'i' not incremented
mm/mm_init.c:2224 deferred_grow_zone() warn: iterator 'i' not incremented

vim +/i +2118 mm/mm_init.c

9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2111) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2112) static void __init
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2113) deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2114) 			   void *arg)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2115) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2116) 	unsigned long spfn, epfn;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2117) 	struct zone *zone = arg;
f1180fd2a7c039 Wei Yang                                   2024-06-05 @2118  	u64 i = 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2119) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2120) 	deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, start_pfn);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2121) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2122) 	/*
5e0a760b44417f Kirill A. Shutemov                         2023-12-28  2123  	 * Initialize and free pages in MAX_PAGE_ORDER sized increments so that
5e0a760b44417f Kirill A. Shutemov                         2023-12-28  2124  	 * we can avoid introducing any issues with the buddy allocator.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2125) 	 */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2126) 	while (spfn < end_pfn) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2127) 		deferred_init_maxorder(&i, zone, &spfn, &epfn);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2128) 		cond_resched();
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2129) 	}
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2130) }
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2131) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2132) /* An arch may override for more concurrency. */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2133) __weak int __init
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2134) deferred_page_init_max_threads(const struct cpumask *node_cpumask)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2135) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2136) 	return 1;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2137) }
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2138) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2139) /* Initialise remaining memory on a node */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2140) static int __init deferred_init_memmap(void *data)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2141) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2142) 	pg_data_t *pgdat = data;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2143) 	const struct cpumask *cpumask = cpumask_of_node(pgdat->node_id);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2144) 	unsigned long spfn = 0, epfn = 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2145) 	unsigned long first_init_pfn, flags;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2146) 	unsigned long start = jiffies;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2147) 	struct zone *zone;
ce8ebb95439459 Wei Yang                                   2024-06-05  2148  	int max_threads;
f1180fd2a7c039 Wei Yang                                   2024-06-05 @2149  	u64 i = 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2150) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2151) 	/* Bind memory initialisation thread to a local node if possible */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2152) 	if (!cpumask_empty(cpumask))
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2153) 		set_cpus_allowed_ptr(current, cpumask);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2154) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2155) 	pgdat_resize_lock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2156) 	first_init_pfn = pgdat->first_deferred_pfn;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2157) 	if (first_init_pfn == ULONG_MAX) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2158) 		pgdat_resize_unlock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2159) 		pgdat_init_report_one_done();
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2160) 		return 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2161) 	}
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2162) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2163) 	/* Sanity check boundaries */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2164) 	BUG_ON(pgdat->first_deferred_pfn < pgdat->node_start_pfn);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2165) 	BUG_ON(pgdat->first_deferred_pfn > pgdat_end_pfn(pgdat));
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2166) 	pgdat->first_deferred_pfn = ULONG_MAX;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2167) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2168) 	/*
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2169) 	 * Once we unlock here, the zone cannot be grown anymore, thus if an
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2170) 	 * interrupt thread must allocate this early in boot, zone must be
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2171) 	 * pre-grown prior to start of deferred page initialization.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2172) 	 */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2173) 	pgdat_resize_unlock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2174) 
ce8ebb95439459 Wei Yang                                   2024-06-05  2175  	/* Only the highest zone is deferred */
ce8ebb95439459 Wei Yang                                   2024-06-05  2176  	zone = pgdat->node_zones + pgdat->nr_zones - 1;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2177) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2178) 	max_threads = deferred_page_init_max_threads(cpumask);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2179) 
544b8e14c24b1f Wei Yang                                   2024-06-05  2180  	while (deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, first_init_pfn)) {
544b8e14c24b1f Wei Yang                                   2024-06-05  2181  		first_init_pfn = ALIGN(epfn, PAGES_PER_SECTION);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2182) 		struct padata_mt_job job = {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2183) 			.thread_fn   = deferred_init_memmap_chunk,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2184) 			.fn_arg      = zone,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2185) 			.start       = spfn,
544b8e14c24b1f Wei Yang                                   2024-06-05  2186  			.size        = first_init_pfn - spfn,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2187) 			.align       = PAGES_PER_SECTION,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2188) 			.min_chunk   = PAGES_PER_SECTION,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2189) 			.max_threads = max_threads,
eb52286634f042 Gang Li Subject: padata: dispatch works on 2024-03-06  2190  			.numa_aware  = false,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2191) 		};
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2192) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2193) 		padata_do_multithreaded(&job);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2194) 	}
544b8e14c24b1f Wei Yang                                   2024-06-05  2195  
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2196) 	/* Sanity check that the next zone really is unpopulated */
ce8ebb95439459 Wei Yang                                   2024-06-05  2197  	WARN_ON(pgdat->nr_zones < MAX_NR_ZONES && populated_zone(++zone));
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2198) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2199) 	pr_info("node %d deferred pages initialised in %ums\n",
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2200) 		pgdat->node_id, jiffies_to_msecs(jiffies - start));
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2201) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2202) 	pgdat_init_report_one_done();
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2203) 	return 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2204) }
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2205) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2206) /*
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2207)  * If this zone has deferred pages, try to grow it by initializing enough
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2208)  * deferred pages to satisfy the allocation specified by order, rounded up to
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2209)  * the nearest PAGES_PER_SECTION boundary.  So we're adding memory in increments
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2210)  * of SECTION_SIZE bytes by initializing struct pages in increments of
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2211)  * PAGES_PER_SECTION * sizeof(struct page) bytes.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2212)  *
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2213)  * Return true when zone was grown, otherwise return false. We return true even
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2214)  * when we grow less than requested, to let the caller decide if there are
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2215)  * enough pages to satisfy the allocation.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2216)  */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2217) bool __init deferred_grow_zone(struct zone *zone, unsigned int order)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2218) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2219) 	unsigned long nr_pages_needed = ALIGN(1 << order, PAGES_PER_SECTION);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2220) 	pg_data_t *pgdat = zone->zone_pgdat;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2221) 	unsigned long first_deferred_pfn = pgdat->first_deferred_pfn;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2222) 	unsigned long spfn, epfn, flags;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2223) 	unsigned long nr_pages = 0;
f1180fd2a7c039 Wei Yang                                   2024-06-05 @2224  	u64 i = 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2225) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2226) 	/* Only the last zone may have deferred pages */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2227) 	if (zone_end_pfn(zone) != pgdat_end_pfn(pgdat))
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2228) 		return false;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2229) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2230) 	pgdat_resize_lock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2231) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2232) 	/*
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2233) 	 * If someone grew this zone while we were waiting for spinlock, return
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2234) 	 * true, as there might be enough pages already.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2235) 	 */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2236) 	if (first_deferred_pfn != pgdat->first_deferred_pfn) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2237) 		pgdat_resize_unlock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2238) 		return true;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2239) 	}
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2240) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2241) 	/* If the zone is empty somebody else may have cleared out the zone */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2242) 	if (!deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn,
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2243) 						 first_deferred_pfn)) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2244) 		pgdat->first_deferred_pfn = ULONG_MAX;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2245) 		pgdat_resize_unlock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2246) 		/* Retry only once. */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2247) 		return first_deferred_pfn != ULONG_MAX;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2248) 	}
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2249) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2250) 	/*
5e0a760b44417f Kirill A. Shutemov                         2023-12-28  2251  	 * Initialize and free pages in MAX_PAGE_ORDER sized increments so
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2252) 	 * that we can avoid introducing any issues with the buddy
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2253) 	 * allocator.
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2254) 	 */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2255) 	while (spfn < epfn) {
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2256) 		/* update our first deferred PFN for this section */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2257) 		first_deferred_pfn = spfn;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2258) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2259) 		nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2260) 		touch_nmi_watchdog();
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2261) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2262) 		/* We should only stop along section boundaries */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2263) 		if ((first_deferred_pfn ^ spfn) < PAGES_PER_SECTION)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2264) 			continue;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2265) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2266) 		/* If our quota has been met we can stop here */
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2267) 		if (nr_pages >= nr_pages_needed)
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2268) 			break;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2269) 	}
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2270) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2271) 	pgdat->first_deferred_pfn = spfn;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2272) 	pgdat_resize_unlock(pgdat, &flags);
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2273) 
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2274) 	return nr_pages > 0;
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2275) }
9420f89db2dd61 Mike Rapoport (IBM                         2023-03-21  2276) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
