Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C011FB2
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 01:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvJLoVfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704419525; x=1735955525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v24YU6w0LRbHMfnyYyuQTdfZ01NN2KfaqsbDecNrdYc=;
  b=MvJLoVfxlXQc00phr5rvPCfaA3EdaxqGQ7jPksnCUWi7kmYhFekgmZst
   F/KYq0aKQcdwbkKotQvcSeSQ8y/QQJURErV1c40WnOSCymJM6WECjDWpH
   oROkQM1pIuMZu1obxglxIy6YnAItQ36nLNFUlj3Bf8l0gZCHtMqnxFD4/
   xQEgm3NKzxfXnD9NaflDjLbsug2bCkjd+/v8sspFd3sKTI69NEosm8oc3
   yTwLjuHV7ERTJS9+zfZGUKUaSgzglPadnUD8Pg0qQHclnNxr5xWTQ7mkZ
   wWWh1ThEiEFpscWA9kXPEaJJM70bzc2KZ67yPcv8nB3IOU6Q2f3svi5Wq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="18923277"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="18923277"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 17:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="28987012"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2024 17:51:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLZNG-0000dc-32;
	Fri, 05 Jan 2024 01:51:50 +0000
Date: Fri, 5 Jan 2024 09:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gmprice:mempolicy2_mbind2 3/12] mm/mempolicy.c:2440
 alloc_pages_bulk_array_weighted_interleave() error: uninitialized symbol
 'node_pages'.
Message-ID: <202401050947.PfZb3mx8-lkp@intel.com>
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
CC: Gregory Price <gourry.memverge@gmail.com>
TO: Gregory Price <gregory.price@memverge.com>
CC: Rakie Kim <rakie.kim@sk.com>
CC: Honggyu Kim <honggyu.kim@sk.com>
CC: Hyeongtak Ji <hyeongtak.ji@sk.com>
CC: Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>
CC: Ravi Jonnalagadda <ravis.opensrc@micron.com>

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   173851cd37b0391648582c61a781025cfef0e1e1
commit: bbd2d231d92ca0c646c142afca2699646cbff26b [3/12] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
:::::: branch date: 7 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20240104 (https://download.01.org/0day-ci/archive/20240105/202401050947.PfZb3mx8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401050947.PfZb3mx8-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:2440 alloc_pages_bulk_array_weighted_interleave() error: uninitialized symbol 'node_pages'.
mm/mempolicy.c:2442 alloc_pages_bulk_array_weighted_interleave() error: uninitialized symbol 'weight'.
mm/mempolicy.c:2445 alloc_pages_bulk_array_weighted_interleave() error: uninitialized symbol 'node'.

vim +/node_pages +2440 mm/mempolicy.c

c00b6b9610991c Chen Wandun   2021-11-05  2366  
bbd2d231d92ca0 Gregory Price 2023-04-19  2367  static unsigned long alloc_pages_bulk_array_weighted_interleave(gfp_t gfp,
bbd2d231d92ca0 Gregory Price 2023-04-19  2368  		struct mempolicy *pol, unsigned long nr_pages,
bbd2d231d92ca0 Gregory Price 2023-04-19  2369  		struct page **page_array)
bbd2d231d92ca0 Gregory Price 2023-04-19  2370  {
bbd2d231d92ca0 Gregory Price 2023-04-19  2371  	struct task_struct *me = current;
bbd2d231d92ca0 Gregory Price 2023-04-19  2372  	unsigned long total_allocated = 0;
bbd2d231d92ca0 Gregory Price 2023-04-19  2373  	unsigned long nr_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2374  	unsigned long rounds;
bbd2d231d92ca0 Gregory Price 2023-04-19  2375  	unsigned long node_pages, delta;
bbd2d231d92ca0 Gregory Price 2023-04-19  2376  	u8 weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2377  	unsigned int weight_total = 0;
bbd2d231d92ca0 Gregory Price 2023-04-19  2378  	unsigned long rem_pages = nr_pages;
bbd2d231d92ca0 Gregory Price 2023-04-19  2379  	nodemask_t nodes;
bbd2d231d92ca0 Gregory Price 2023-04-19  2380  	int nnodes, node;
bbd2d231d92ca0 Gregory Price 2023-04-19  2381  	int prev_node = NUMA_NO_NODE;
bbd2d231d92ca0 Gregory Price 2023-04-19  2382  	int i;
bbd2d231d92ca0 Gregory Price 2023-04-19  2383  
bbd2d231d92ca0 Gregory Price 2023-04-19  2384  	nnodes = read_once_policy_nodemask(pol, &nodes);
bbd2d231d92ca0 Gregory Price 2023-04-19  2385  	weight_total = read_once_interleave_weights(pol, &nodes);
bbd2d231d92ca0 Gregory Price 2023-04-19  2386  
bbd2d231d92ca0 Gregory Price 2023-04-19  2387  	/* Continue allocating from most recent node and adjust the nr_pages */
bbd2d231d92ca0 Gregory Price 2023-04-19  2388  	if (pol->wil.cur_weight) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2389  		node = next_node_in(me->il_prev, nodes);
bbd2d231d92ca0 Gregory Price 2023-04-19  2390  		node_pages = pol->wil.cur_weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2391  		if (node_pages > rem_pages)
bbd2d231d92ca0 Gregory Price 2023-04-19  2392  			node_pages = rem_pages;
bbd2d231d92ca0 Gregory Price 2023-04-19  2393  		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
bbd2d231d92ca0 Gregory Price 2023-04-19  2394  						  NULL, page_array);
bbd2d231d92ca0 Gregory Price 2023-04-19  2395  		page_array += nr_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2396  		total_allocated += nr_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2397  		/* if that's all the pages, no need to interleave */
bbd2d231d92ca0 Gregory Price 2023-04-19  2398  		if (rem_pages <= pol->wil.cur_weight) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2399  			pol->wil.cur_weight -= rem_pages;
bbd2d231d92ca0 Gregory Price 2023-04-19  2400  			return total_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2401  		}
bbd2d231d92ca0 Gregory Price 2023-04-19  2402  		/* Otherwise we adjust nr_pages down, and continue from there */
bbd2d231d92ca0 Gregory Price 2023-04-19  2403  		rem_pages -= pol->wil.cur_weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2404  		pol->wil.cur_weight = 0;
bbd2d231d92ca0 Gregory Price 2023-04-19  2405  		prev_node = node;
bbd2d231d92ca0 Gregory Price 2023-04-19  2406  	}
bbd2d231d92ca0 Gregory Price 2023-04-19  2407  
bbd2d231d92ca0 Gregory Price 2023-04-19  2408  	/* Now we can continue allocating as if from 0 instead of an offset */
bbd2d231d92ca0 Gregory Price 2023-04-19  2409  	rounds = rem_pages / weight_total;
bbd2d231d92ca0 Gregory Price 2023-04-19  2410  	delta = rem_pages % weight_total;
bbd2d231d92ca0 Gregory Price 2023-04-19  2411  	for (i = 0; i < nnodes; i++) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2412  		node = next_node_in(prev_node, nodes);
bbd2d231d92ca0 Gregory Price 2023-04-19  2413  		weight = pol->wil.scratch_weights[node];
bbd2d231d92ca0 Gregory Price 2023-04-19  2414  		node_pages = weight * rounds;
bbd2d231d92ca0 Gregory Price 2023-04-19  2415  		if (delta) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2416  			if (delta > weight) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2417  				node_pages += weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2418  				delta -= weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2419  			} else {
bbd2d231d92ca0 Gregory Price 2023-04-19  2420  				node_pages += delta;
bbd2d231d92ca0 Gregory Price 2023-04-19  2421  				delta = 0;
bbd2d231d92ca0 Gregory Price 2023-04-19  2422  			}
bbd2d231d92ca0 Gregory Price 2023-04-19  2423  		}
bbd2d231d92ca0 Gregory Price 2023-04-19  2424  		nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
bbd2d231d92ca0 Gregory Price 2023-04-19  2425  						  NULL, page_array);
bbd2d231d92ca0 Gregory Price 2023-04-19  2426  		page_array += nr_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2427  		total_allocated += nr_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2428  		if (total_allocated == nr_pages)
bbd2d231d92ca0 Gregory Price 2023-04-19  2429  			break;
bbd2d231d92ca0 Gregory Price 2023-04-19  2430  		prev_node = node;
bbd2d231d92ca0 Gregory Price 2023-04-19  2431  	}
bbd2d231d92ca0 Gregory Price 2023-04-19  2432  
bbd2d231d92ca0 Gregory Price 2023-04-19  2433  	/*
bbd2d231d92ca0 Gregory Price 2023-04-19  2434  	 * Finally, we need to update me->il_prev and pol->wil.cur_weight
bbd2d231d92ca0 Gregory Price 2023-04-19  2435  	 * if there were overflow pages, but not equivalent to the node
bbd2d231d92ca0 Gregory Price 2023-04-19  2436  	 * weight, set the cur_weight to node_weight - delta and the
bbd2d231d92ca0 Gregory Price 2023-04-19  2437  	 * me->il_prev to the previous node. Otherwise if it was perfect
bbd2d231d92ca0 Gregory Price 2023-04-19  2438  	 * we can simply set il_prev to node and cur_weight to 0
bbd2d231d92ca0 Gregory Price 2023-04-19  2439  	 */
bbd2d231d92ca0 Gregory Price 2023-04-19 @2440  	if (node_pages) {
bbd2d231d92ca0 Gregory Price 2023-04-19  2441  		me->il_prev = prev_node;
bbd2d231d92ca0 Gregory Price 2023-04-19 @2442  		node_pages %= weight;
bbd2d231d92ca0 Gregory Price 2023-04-19  2443  		pol->wil.cur_weight = weight - node_pages;
bbd2d231d92ca0 Gregory Price 2023-04-19  2444  	} else {
bbd2d231d92ca0 Gregory Price 2023-04-19 @2445  		me->il_prev = node;
bbd2d231d92ca0 Gregory Price 2023-04-19  2446  		pol->wil.cur_weight = 0;
bbd2d231d92ca0 Gregory Price 2023-04-19  2447  	}
bbd2d231d92ca0 Gregory Price 2023-04-19  2448  
bbd2d231d92ca0 Gregory Price 2023-04-19  2449  	return total_allocated;
bbd2d231d92ca0 Gregory Price 2023-04-19  2450  }
bbd2d231d92ca0 Gregory Price 2023-04-19  2451  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
