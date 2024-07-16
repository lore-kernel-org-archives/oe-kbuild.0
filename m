Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C31E888
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132636; cv=none; b=Tm442mVstoH3qaYHP5a5oOzun/niz4afL/6yfunmD0611tFz2yklEcvT+GbWj/BgN2HbnRej7515NpsZ+sUzm5iu86+YQ2V0XYeit2+ak4eluQTSrX+UfaclyHbyuesYVfM3AZJLLvP0aXBCgSYvSF6f/UTSHlmqC0wfzudDCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132636; c=relaxed/simple;
	bh=XsKLw8hRbvZUQvcznvH+G4eAe15x4zOvxyaNGe3zsPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQsiiCQjKzSB5lzEKv/CRFJMrHjsW1/hiBpMPKgiM/vqYvrC/Uxm+vrGCC4WrA/ID7wOXr02dDZnqiV5GI8NH6j9u2u85j5YqTGZ8Wt9rAln3RNYCbi0T94DOqsucitQAHXM8SG23taCvei3L280obyKre28nGmhupaj44ZRPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgdAsnPh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgdAsnPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721132634; x=1752668634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsKLw8hRbvZUQvcznvH+G4eAe15x4zOvxyaNGe3zsPk=;
  b=bgdAsnPh8e2pCSeeH16M89ad9wS/QzXyBMvp5fva9osLONlUwYbru7Eh
   qQbKNztZRpPwlLoH+jDVDkW3G+ROnXKw5IM4IejSpUjtSgPSueJ89XuKk
   BtvCTfiUnXO+5QPWagfdfZT/ExqOaJMd6raiyhJC7hXui4RXlZrZVDbn5
   /aOMug5TM/kXMCGiF/GpzA/kwLGosF31zVZGUmA18uRN5YLCBFm5MueC9
   uBn7ncpy298xocJG6lyiIzd0du3CUOdkKjBUyuqXkcIiglxLbGYt0aXsI
   e3tkEyk1Jo9zvcaErVcD47q2UqnXx1j0604kVz0uQz5CzY/Jp6Q5ZBeOt
   A==;
X-CSE-ConnectionGUID: o4B84nXvS2KRwCWIAU/1HQ==
X-CSE-MsgGUID: nupkQMe9Q9qYyDngwYKHCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18754879"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18754879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 05:23:53 -0700
X-CSE-ConnectionGUID: wd52w8T4SKWy8WgV6TAmZQ==
X-CSE-MsgGUID: TGFG9EW5TziMi6/VqjIM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49731501"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Jul 2024 05:23:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sThDh-000fBy-2b;
	Tue, 16 Jul 2024 12:23:49 +0000
Date: Tue, 16 Jul 2024 20:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:page_counters.2 3/5] mm/memcontrol.c:2283
 try_charge_memcg() error: uninitialized symbol 'mem_over_limit'.
Message-ID: <202407162033.CfEAK9iq-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   27b1393eb022422f09a7d759fb6af8ab906e00c8
commit: 807efdc7b6f795d3bb233527f2c659fecc6cc2cc [3/5] mm: memcg: merge multiple page_counters into a single structure
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162033.CfEAK9iq-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407162033.CfEAK9iq-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:2283 try_charge_memcg() error: uninitialized symbol 'mem_over_limit'.

vim +/mem_over_limit +2283 mm/memcontrol.c

b23afb93d317c6 Tejun Heo         2015-11-05  2160  
e548ad4a7cbf76 Roman Gushchin    2024-06-24  2161  int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
0029e19ebf84dc Michal Hocko      2014-08-06  2162  		     unsigned int nr_pages)
8a9f3ccd24741b Balbir Singh      2008-02-07  2163  {
a983b5ebee5720 Johannes Weiner   2018-01-31  2164  	unsigned int batch = max(MEMCG_CHARGE_BATCH, nr_pages);
d977aa939fcaff Chris Down        2020-08-06  2165  	int nr_retries = MAX_RECLAIM_RETRIES;
6539cc053869bd Johannes Weiner   2014-08-06  2166  	struct mem_cgroup *mem_over_limit;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  2167  	struct page_counter *counter;
6539cc053869bd Johannes Weiner   2014-08-06  2168  	unsigned long nr_reclaimed;
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2169  	bool passed_oom = false;
73b73bac90d974 Yosry Ahmed       2022-07-14  2170  	unsigned int reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2171  	bool drained = false;
d6e103a757fa78 Roman Gushchin    2022-07-01  2172  	bool raised_max_event = false;
e22c6ed90aa91a Johannes Weiner   2020-08-06  2173  	unsigned long pflags;
a636b327f73114 KAMEZAWA Hiroyuki 2009-01-07  2174  
6539cc053869bd Johannes Weiner   2014-08-06  2175  retry:
b6b6cc72bc404c Michal Hocko      2014-04-07  2176  	if (consume_stock(memcg, nr_pages))
10d53c748bc953 Tejun Heo         2015-11-05  2177  		return 0;
8a9f3ccd24741b Balbir Singh      2008-02-07  2178  
7941d2145abc4d Johannes Weiner   2016-01-14  2179  	if (!do_memsw_account() ||
807efdc7b6f795 Roman Gushchin    2024-07-16  2180  	    page_counter_try_charge(&memcg->memory, MCT_MEMSW, batch, &counter)) {
807efdc7b6f795 Roman Gushchin    2024-07-16  2181  		if (page_counter_try_charge(&memcg->memory, MCT_MEM, batch, &counter))
6539cc053869bd Johannes Weiner   2014-08-06  2182  			goto done_restock;
7941d2145abc4d Johannes Weiner   2016-01-14  2183  		if (do_memsw_account())
807efdc7b6f795 Roman Gushchin    2024-07-16  2184  			page_counter_uncharge(&memcg->memory, MCT_MEMSW, batch);
3fbe724424fb10 Johannes Weiner   2014-10-09  2185  	} else {
73b73bac90d974 Yosry Ahmed       2022-07-14  2186  		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
3fbe724424fb10 Johannes Weiner   2014-10-09  2187  	}
6539cc053869bd Johannes Weiner   2014-08-06  2188  
6539cc053869bd Johannes Weiner   2014-08-06  2189  	if (batch > nr_pages) {
6539cc053869bd Johannes Weiner   2014-08-06  2190  		batch = nr_pages;
6539cc053869bd Johannes Weiner   2014-08-06  2191  		goto retry;
6539cc053869bd Johannes Weiner   2014-08-06  2192  	}
6539cc053869bd Johannes Weiner   2014-08-06  2193  
89a2848381b5fc Johannes Weiner   2016-10-27  2194  	/*
89a2848381b5fc Johannes Weiner   2016-10-27  2195  	 * Prevent unbounded recursion when reclaim operations need to
89a2848381b5fc Johannes Weiner   2016-10-27  2196  	 * allocate memory. This might exceed the limits temporarily,
89a2848381b5fc Johannes Weiner   2016-10-27  2197  	 * but we prefer facilitating memory reclaim and getting back
89a2848381b5fc Johannes Weiner   2016-10-27  2198  	 * under the limit over triggering OOM kills in these cases.
89a2848381b5fc Johannes Weiner   2016-10-27  2199  	 */
89a2848381b5fc Johannes Weiner   2016-10-27  2200  	if (unlikely(current->flags & PF_MEMALLOC))
89a2848381b5fc Johannes Weiner   2016-10-27  2201  		goto force;
89a2848381b5fc Johannes Weiner   2016-10-27  2202  
06b078fc065fe1 Johannes Weiner   2014-08-06  2203  	if (unlikely(task_in_memcg_oom(current)))
06b078fc065fe1 Johannes Weiner   2014-08-06  2204  		goto nomem;
06b078fc065fe1 Johannes Weiner   2014-08-06  2205  
d0164adc89f6bb Mel Gorman        2015-11-06  2206  	if (!gfpflags_allow_blocking(gfp_mask))
6539cc053869bd Johannes Weiner   2014-08-06  2207  		goto nomem;
6539cc053869bd Johannes Weiner   2014-08-06  2208  
807efdc7b6f795 Roman Gushchin    2024-07-16  2209  	mem_over_limit = mem_cgroup_from_counter(counter);
e27be240df53f1 Johannes Weiner   2018-04-10  2210  	memcg_memory_event(mem_over_limit, MEMCG_MAX);
d6e103a757fa78 Roman Gushchin    2022-07-01  2211  	raised_max_event = true;
241994ed8649f7 Johannes Weiner   2015-02-11  2212  
e22c6ed90aa91a Johannes Weiner   2020-08-06  2213  	psi_memstall_enter(&pflags);
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2214  	nr_reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit, nr_pages,
68cd9050d871e4 Dan Schatzberg    2024-01-03  2215  						    gfp_mask, reclaim_options, NULL);
e22c6ed90aa91a Johannes Weiner   2020-08-06  2216  	psi_memstall_leave(&pflags);
6539cc053869bd Johannes Weiner   2014-08-06  2217  
61e02c745721a3 Johannes Weiner   2014-08-06  2218  	if (mem_cgroup_margin(mem_over_limit) >= nr_pages)
6539cc053869bd Johannes Weiner   2014-08-06  2219  		goto retry;
28c34c291e746a Johannes Weiner   2014-08-06  2220  
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2221  	if (!drained) {
6d3d6aa22af305 Johannes Weiner   2014-12-10  2222  		drain_all_stock(mem_over_limit);
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2223  		drained = true;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2224  		goto retry;
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2225  	}
b70a2a21dc9d4a Johannes Weiner   2014-10-09  2226  
28c34c291e746a Johannes Weiner   2014-08-06  2227  	if (gfp_mask & __GFP_NORETRY)
28c34c291e746a Johannes Weiner   2014-08-06  2228  		goto nomem;
6539cc053869bd Johannes Weiner   2014-08-06  2229  	/*
6539cc053869bd Johannes Weiner   2014-08-06  2230  	 * Even though the limit is exceeded at this point, reclaim
6539cc053869bd Johannes Weiner   2014-08-06  2231  	 * may have been able to free some pages.  Retry the charge
6539cc053869bd Johannes Weiner   2014-08-06  2232  	 * before killing the task.
6539cc053869bd Johannes Weiner   2014-08-06  2233  	 *
6539cc053869bd Johannes Weiner   2014-08-06  2234  	 * Only for regular pages, though: huge pages are rather
6539cc053869bd Johannes Weiner   2014-08-06  2235  	 * unlikely to succeed so close to the limit, and we fall back
6539cc053869bd Johannes Weiner   2014-08-06  2236  	 * to regular pages anyway in case of failure.
6539cc053869bd Johannes Weiner   2014-08-06  2237  	 */
61e02c745721a3 Johannes Weiner   2014-08-06  2238  	if (nr_reclaimed && nr_pages <= (1 << PAGE_ALLOC_COSTLY_ORDER))
6539cc053869bd Johannes Weiner   2014-08-06  2239  		goto retry;
6539cc053869bd Johannes Weiner   2014-08-06  2240  	/*
6539cc053869bd Johannes Weiner   2014-08-06  2241  	 * At task move, charge accounts can be doubly counted. So, it's
6539cc053869bd Johannes Weiner   2014-08-06  2242  	 * better to wait until the end of task_move if something is going on.
6539cc053869bd Johannes Weiner   2014-08-06  2243  	 */
b9eaacb1db2b88 Roman Gushchin    2024-06-24  2244  	if (memcg1_wait_acct_move(mem_over_limit))
6539cc053869bd Johannes Weiner   2014-08-06  2245  		goto retry;
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2246  
9b1306192d3357 Johannes Weiner   2014-08-06  2247  	if (nr_retries--)
9b1306192d3357 Johannes Weiner   2014-08-06  2248  		goto retry;
9b1306192d3357 Johannes Weiner   2014-08-06  2249  
38d384932ed1b5 Shakeel Butt      2019-07-11  2250  	if (gfp_mask & __GFP_RETRY_MAYFAIL)
29ef680ae7c211 Michal Hocko      2018-08-17  2251  		goto nomem;
29ef680ae7c211 Michal Hocko      2018-08-17  2252  
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2253  	/* Avoid endless loop for tasks bypassed by the oom killer */
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2254  	if (passed_oom && task_is_dying())
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2255  		goto nomem;
6d61ef409d6ba1 Balbir Singh      2009-01-07  2256  
29ef680ae7c211 Michal Hocko      2018-08-17  2257  	/*
29ef680ae7c211 Michal Hocko      2018-08-17  2258  	 * keep retrying as long as the memcg oom killer is able to make
29ef680ae7c211 Michal Hocko      2018-08-17  2259  	 * a forward progress or bypass the charge if the oom killer
29ef680ae7c211 Michal Hocko      2018-08-17  2260  	 * couldn't make any progress.
29ef680ae7c211 Michal Hocko      2018-08-17  2261  	 */
becdf89d776c8f Shakeel Butt      2022-03-22  2262  	if (mem_cgroup_oom(mem_over_limit, gfp_mask,
becdf89d776c8f Shakeel Butt      2022-03-22  2263  			   get_order(nr_pages * PAGE_SIZE))) {
a4ebf1b6ca1e01 Vasily Averin     2021-11-05  2264  		passed_oom = true;
d977aa939fcaff Chris Down        2020-08-06  2265  		nr_retries = MAX_RECLAIM_RETRIES;
29ef680ae7c211 Michal Hocko      2018-08-17  2266  		goto retry;
29ef680ae7c211 Michal Hocko      2018-08-17  2267  	}
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2268  nomem:
1461e8c2b6af89 Shakeel Butt      2022-03-22  2269  	/*
1461e8c2b6af89 Shakeel Butt      2022-03-22  2270  	 * Memcg doesn't have a dedicated reserve for atomic
1461e8c2b6af89 Shakeel Butt      2022-03-22  2271  	 * allocations. But like the global atomic pool, we need to
1461e8c2b6af89 Shakeel Butt      2022-03-22  2272  	 * put the burden of reclaim on regular allocation requests
1461e8c2b6af89 Shakeel Butt      2022-03-22  2273  	 * and let these go through as privileged allocations.
1461e8c2b6af89 Shakeel Butt      2022-03-22  2274  	 */
1461e8c2b6af89 Shakeel Butt      2022-03-22  2275  	if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH)))
7a81b88cb53e33 KAMEZAWA Hiroyuki 2009-01-07  2276  		return -ENOMEM;
10d53c748bc953 Tejun Heo         2015-11-05  2277  force:
d6e103a757fa78 Roman Gushchin    2022-07-01  2278  	/*
d6e103a757fa78 Roman Gushchin    2022-07-01  2279  	 * If the allocation has to be enforced, don't forget to raise
d6e103a757fa78 Roman Gushchin    2022-07-01  2280  	 * a MEMCG_MAX event.
d6e103a757fa78 Roman Gushchin    2022-07-01  2281  	 */
d6e103a757fa78 Roman Gushchin    2022-07-01  2282  	if (!raised_max_event)
d6e103a757fa78 Roman Gushchin    2022-07-01 @2283  		memcg_memory_event(mem_over_limit, MEMCG_MAX);
d6e103a757fa78 Roman Gushchin    2022-07-01  2284  
10d53c748bc953 Tejun Heo         2015-11-05  2285  	/*
10d53c748bc953 Tejun Heo         2015-11-05  2286  	 * The allocation either can't fail or will lead to more memory
10d53c748bc953 Tejun Heo         2015-11-05  2287  	 * being freed very soon.  Allow memory usage go over the limit
10d53c748bc953 Tejun Heo         2015-11-05  2288  	 * temporarily by force charging it.
10d53c748bc953 Tejun Heo         2015-11-05  2289  	 */
807efdc7b6f795 Roman Gushchin    2024-07-16  2290  	page_counter_charge(&memcg->memory, MCT_MEM, nr_pages);
7941d2145abc4d Johannes Weiner   2016-01-14  2291  	if (do_memsw_account())
807efdc7b6f795 Roman Gushchin    2024-07-16  2292  		page_counter_charge(&memcg->memory, MCT_MEMSW, nr_pages);
10d53c748bc953 Tejun Heo         2015-11-05  2293  
10d53c748bc953 Tejun Heo         2015-11-05  2294  	return 0;
6539cc053869bd Johannes Weiner   2014-08-06  2295  
6539cc053869bd Johannes Weiner   2014-08-06  2296  done_restock:
6539cc053869bd Johannes Weiner   2014-08-06  2297  	if (batch > nr_pages)
6539cc053869bd Johannes Weiner   2014-08-06  2298  		refill_stock(memcg, batch - nr_pages);
b23afb93d317c6 Tejun Heo         2015-11-05  2299  
241994ed8649f7 Johannes Weiner   2015-02-11  2300  	/*
b23afb93d317c6 Tejun Heo         2015-11-05  2301  	 * If the hierarchy is above the normal consumption range, schedule
b23afb93d317c6 Tejun Heo         2015-11-05  2302  	 * reclaim on returning to userland.  We can perform reclaim here
71baba4b92dc1f Mel Gorman        2015-11-06  2303  	 * if __GFP_RECLAIM but let's always punt for simplicity and so that
b23afb93d317c6 Tejun Heo         2015-11-05  2304  	 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
b23afb93d317c6 Tejun Heo         2015-11-05  2305  	 * not recorded as it most likely matches current's and won't
b23afb93d317c6 Tejun Heo         2015-11-05  2306  	 * change in the meantime.  As high limit is checked again before
b23afb93d317c6 Tejun Heo         2015-11-05  2307  	 * reclaim, the cost of mismatch is negligible.
241994ed8649f7 Johannes Weiner   2015-02-11  2308  	 */
241994ed8649f7 Johannes Weiner   2015-02-11  2309  	do {
4b82ab4f288366 Jakub Kicinski    2020-06-01  2310  		bool mem_high, swap_high;
4b82ab4f288366 Jakub Kicinski    2020-06-01  2311  
807efdc7b6f795 Roman Gushchin    2024-07-16  2312  		mem_high = page_counter_read(&memcg->memory, MCT_MEM) >
807efdc7b6f795 Roman Gushchin    2024-07-16  2313  			READ_ONCE(memcg->memory.high[MCT_MEM]);
807efdc7b6f795 Roman Gushchin    2024-07-16  2314  		swap_high = page_counter_read(&memcg->memory, MCT_SWAP) >
807efdc7b6f795 Roman Gushchin    2024-07-16  2315  			READ_ONCE(memcg->memory.high[MCT_SWAP]);
4b82ab4f288366 Jakub Kicinski    2020-06-01  2316  
f7e1cb6ec51b04 Johannes Weiner   2016-01-14  2317  		/* Don't bother a random interrupted task */
086f694a75e1a2 Shakeel Butt      2022-03-22  2318  		if (!in_task()) {
4b82ab4f288366 Jakub Kicinski    2020-06-01  2319  			if (mem_high) {
f7e1cb6ec51b04 Johannes Weiner   2016-01-14  2320  				schedule_work(&memcg->high_work);
f7e1cb6ec51b04 Johannes Weiner   2016-01-14  2321  				break;
f7e1cb6ec51b04 Johannes Weiner   2016-01-14  2322  			}
4b82ab4f288366 Jakub Kicinski    2020-06-01  2323  			continue;
4b82ab4f288366 Jakub Kicinski    2020-06-01  2324  		}
4b82ab4f288366 Jakub Kicinski    2020-06-01  2325  
4b82ab4f288366 Jakub Kicinski    2020-06-01  2326  		if (mem_high || swap_high) {
4b82ab4f288366 Jakub Kicinski    2020-06-01  2327  			/*
4b82ab4f288366 Jakub Kicinski    2020-06-01  2328  			 * The allocating tasks in this cgroup will need to do
4b82ab4f288366 Jakub Kicinski    2020-06-01  2329  			 * reclaim or be throttled to prevent further growth
4b82ab4f288366 Jakub Kicinski    2020-06-01  2330  			 * of the memory or swap footprints.
4b82ab4f288366 Jakub Kicinski    2020-06-01  2331  			 *
4b82ab4f288366 Jakub Kicinski    2020-06-01  2332  			 * Target some best-effort fairness between the tasks,
4b82ab4f288366 Jakub Kicinski    2020-06-01  2333  			 * and distribute reclaim work and delay penalties
4b82ab4f288366 Jakub Kicinski    2020-06-01  2334  			 * based on how much each task is actually allocating.
4b82ab4f288366 Jakub Kicinski    2020-06-01  2335  			 */
9516a18a9a253a Vladimir Davydov  2015-12-11  2336  			current->memcg_nr_pages_over_high += batch;
b23afb93d317c6 Tejun Heo         2015-11-05  2337  			set_notify_resume(current);
b23afb93d317c6 Tejun Heo         2015-11-05  2338  			break;
b23afb93d317c6 Tejun Heo         2015-11-05  2339  		}
241994ed8649f7 Johannes Weiner   2015-02-11  2340  	} while ((memcg = parent_mem_cgroup(memcg)));
10d53c748bc953 Tejun Heo         2015-11-05  2341  
63fd327016fdfc Johannes Weiner   2024-01-11  2342  	/*
63fd327016fdfc Johannes Weiner   2024-01-11  2343  	 * Reclaim is set up above to be called from the userland
63fd327016fdfc Johannes Weiner   2024-01-11  2344  	 * return path. But also attempt synchronous reclaim to avoid
63fd327016fdfc Johannes Weiner   2024-01-11  2345  	 * excessive overrun while the task is still inside the
63fd327016fdfc Johannes Weiner   2024-01-11  2346  	 * kernel. If this is successful, the return path will see it
63fd327016fdfc Johannes Weiner   2024-01-11  2347  	 * when it rechecks the overage and simply bail out.
63fd327016fdfc Johannes Weiner   2024-01-11  2348  	 */
c9afe31ec443ea Shakeel Butt      2022-03-22  2349  	if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
c9afe31ec443ea Shakeel Butt      2022-03-22  2350  	    !(current->flags & PF_MEMALLOC) &&
63fd327016fdfc Johannes Weiner   2024-01-11  2351  	    gfpflags_allow_blocking(gfp_mask))
9ea9cb00a82b53 Johannes Weiner   2023-09-14  2352  		mem_cgroup_handle_over_high(gfp_mask);
10d53c748bc953 Tejun Heo         2015-11-05  2353  	return 0;
8a9f3ccd24741b Balbir Singh      2008-02-07  2354  }
8a9f3ccd24741b Balbir Singh      2008-02-07  2355  

:::::: The code at line 2283 was first introduced by commit
:::::: d6e103a757fa7876e7ded76128d5dffe12402ab9 mm: memcontrol: do not miss MEMCG_MAX events for enforced allocations

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
