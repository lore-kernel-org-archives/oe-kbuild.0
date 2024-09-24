Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB958ECF
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727142057; cv=none; b=QQwKkiRmFHYANALNG/fvT1oQ2vCfagNzRdFTq5C+Fi1d/3Blfp2Qs2uh3HO4DzHGCEsgOrrbK+oMraWWjTyWpXmCytOUlax6ECTC3XVC68H0V6iPb96iJViS2Ovy5gnBewO37IFnbXhrNA92N3op241Jr4mhgLrq+zWMYf4TmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727142057; c=relaxed/simple;
	bh=+j+FA06QFBdC3ubyXyLGiI4X2g9kCThcm4tENPnqKfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h4kbTMYPfk7nebaWFzVbUd2ysFlGO2TPUBMgEgEAYr4JxY98Cy2hby+2vKbwPPyd+5gwKJlLWbimGBIR2Nm63q80EvD8Sy3xpCJV8/HO/i0FsJ7tApUkDShAwEnIXDggouqUapbmyGUwsf6TzHx72b6EHKrUtc7+0yYWbBSxh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjoESLiC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjoESLiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727142055; x=1758678055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+j+FA06QFBdC3ubyXyLGiI4X2g9kCThcm4tENPnqKfs=;
  b=YjoESLiCkWxh+FgJreTJ9nCwWvjSuo2OWEHP5a+2y5QkkXQk8lJtv5eP
   GsXeerjO2PZEfUaZsQ1039aHQwW0u5aFUyxRyxWKBC3BILnWe/koMlQ+s
   yd+OB5pqQ8Eor7H67LND9d3E0zIor1yEA3YX4X8XOk/y7jIF8PkTdpUkD
   1bdjj4q5PSLn0NDKuKN9nhUqiBlRejDZ2TcuNknRGnq/HsESvpSJHdZcu
   UoXgSDKU0ZYAs9Y5kjA2sJiANahMhuTP+nK9KsSnNCy1jaIBne8O+JKpT
   R7yNCsaPp6oF7uLdmrESnacB+NHQpfS4CkXCM4K7lc3y0a1HtyazeBrUz
   A==;
X-CSE-ConnectionGUID: W9B9qN0kQI2BZO/78knwtw==
X-CSE-MsgGUID: vAvnbXbvRrKGSdZQlWBZGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26211519"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26211519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 18:40:54 -0700
X-CSE-ConnectionGUID: L/5stPhhSvqS9cucC4hhfA==
X-CSE-MsgGUID: E2F7zHcWSv66jGFT/pl8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="108693149"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Sep 2024 18:40:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssuXq-000Hml-1z;
	Tue, 24 Sep 2024 01:40:50 +0000
Date: Tue, 24 Sep 2024 09:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol-v1.c:2338 mem_cgroup_read_u64() error: uninitialized
 symbol 'counter'.
Message-ID: <202409240911.5dW7zz3x-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: ea1e879631ffdf640bfcb11439d61a151067bb39 mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240911.5dW7zz3x-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409240911.5dW7zz3x-lkp@intel.com/

smatch warnings:
mm/memcontrol-v1.c:2338 mem_cgroup_read_u64() error: uninitialized symbol 'counter'.
mm/memcontrol-v1.c:2479 mem_cgroup_reset() error: uninitialized symbol 'counter'.

vim +/counter +2338 mm/memcontrol-v1.c

ea1e879631ffdf Roman Gushchin 2024-06-24  2312  
ea1e879631ffdf Roman Gushchin 2024-06-24  2313  static u64 mem_cgroup_read_u64(struct cgroup_subsys_state *css,
ea1e879631ffdf Roman Gushchin 2024-06-24  2314  			       struct cftype *cft)
ea1e879631ffdf Roman Gushchin 2024-06-24  2315  {
ea1e879631ffdf Roman Gushchin 2024-06-24  2316  	struct mem_cgroup *memcg = mem_cgroup_from_css(css);
ea1e879631ffdf Roman Gushchin 2024-06-24  2317  	struct page_counter *counter;
ea1e879631ffdf Roman Gushchin 2024-06-24  2318  
ea1e879631ffdf Roman Gushchin 2024-06-24  2319  	switch (MEMFILE_TYPE(cft->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2320  	case _MEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2321  		counter = &memcg->memory;
ea1e879631ffdf Roman Gushchin 2024-06-24  2322  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2323  	case _MEMSWAP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2324  		counter = &memcg->memsw;
ea1e879631ffdf Roman Gushchin 2024-06-24  2325  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2326  	case _KMEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2327  		counter = &memcg->kmem;
ea1e879631ffdf Roman Gushchin 2024-06-24  2328  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2329  	case _TCP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2330  		counter = &memcg->tcpmem;
ea1e879631ffdf Roman Gushchin 2024-06-24  2331  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2332  	default:
ea1e879631ffdf Roman Gushchin 2024-06-24  2333  		BUG();
ea1e879631ffdf Roman Gushchin 2024-06-24  2334  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2335  
ea1e879631ffdf Roman Gushchin 2024-06-24  2336  	switch (MEMFILE_ATTR(cft->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2337  	case RES_USAGE:
ea1e879631ffdf Roman Gushchin 2024-06-24 @2338  		if (counter == &memcg->memory)
ea1e879631ffdf Roman Gushchin 2024-06-24  2339  			return (u64)mem_cgroup_usage(memcg, false) * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2340  		if (counter == &memcg->memsw)
ea1e879631ffdf Roman Gushchin 2024-06-24  2341  			return (u64)mem_cgroup_usage(memcg, true) * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2342  		return (u64)page_counter_read(counter) * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2343  	case RES_LIMIT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2344  		return (u64)counter->max * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2345  	case RES_MAX_USAGE:
ea1e879631ffdf Roman Gushchin 2024-06-24  2346  		return (u64)counter->watermark * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2347  	case RES_FAILCNT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2348  		return counter->failcnt;
ea1e879631ffdf Roman Gushchin 2024-06-24  2349  	case RES_SOFT_LIMIT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2350  		return (u64)READ_ONCE(memcg->soft_limit) * PAGE_SIZE;
ea1e879631ffdf Roman Gushchin 2024-06-24  2351  	default:
ea1e879631ffdf Roman Gushchin 2024-06-24  2352  		BUG();
ea1e879631ffdf Roman Gushchin 2024-06-24  2353  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2354  }
ea1e879631ffdf Roman Gushchin 2024-06-24  2355  
ea1e879631ffdf Roman Gushchin 2024-06-24  2356  /*
ea1e879631ffdf Roman Gushchin 2024-06-24  2357   * This function doesn't do anything useful. Its only job is to provide a read
ea1e879631ffdf Roman Gushchin 2024-06-24  2358   * handler for a file so that cgroup_file_mode() will add read permissions.
ea1e879631ffdf Roman Gushchin 2024-06-24  2359   */
ea1e879631ffdf Roman Gushchin 2024-06-24  2360  static int mem_cgroup_dummy_seq_show(__always_unused struct seq_file *m,
ea1e879631ffdf Roman Gushchin 2024-06-24  2361  				     __always_unused void *v)
ea1e879631ffdf Roman Gushchin 2024-06-24  2362  {
ea1e879631ffdf Roman Gushchin 2024-06-24  2363  	return -EINVAL;
ea1e879631ffdf Roman Gushchin 2024-06-24  2364  }
ea1e879631ffdf Roman Gushchin 2024-06-24  2365  
ea1e879631ffdf Roman Gushchin 2024-06-24  2366  static int memcg_update_tcp_max(struct mem_cgroup *memcg, unsigned long max)
ea1e879631ffdf Roman Gushchin 2024-06-24  2367  {
ea1e879631ffdf Roman Gushchin 2024-06-24  2368  	int ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  2369  
ea1e879631ffdf Roman Gushchin 2024-06-24  2370  	mutex_lock(&memcg_max_mutex);
ea1e879631ffdf Roman Gushchin 2024-06-24  2371  
ea1e879631ffdf Roman Gushchin 2024-06-24  2372  	ret = page_counter_set_max(&memcg->tcpmem, max);
ea1e879631ffdf Roman Gushchin 2024-06-24  2373  	if (ret)
ea1e879631ffdf Roman Gushchin 2024-06-24  2374  		goto out;
ea1e879631ffdf Roman Gushchin 2024-06-24  2375  
ea1e879631ffdf Roman Gushchin 2024-06-24  2376  	if (!memcg->tcpmem_active) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2377  		/*
ea1e879631ffdf Roman Gushchin 2024-06-24  2378  		 * The active flag needs to be written after the static_key
ea1e879631ffdf Roman Gushchin 2024-06-24  2379  		 * update. This is what guarantees that the socket activation
ea1e879631ffdf Roman Gushchin 2024-06-24  2380  		 * function is the last one to run. See mem_cgroup_sk_alloc()
ea1e879631ffdf Roman Gushchin 2024-06-24  2381  		 * for details, and note that we don't mark any socket as
ea1e879631ffdf Roman Gushchin 2024-06-24  2382  		 * belonging to this memcg until that flag is up.
ea1e879631ffdf Roman Gushchin 2024-06-24  2383  		 *
ea1e879631ffdf Roman Gushchin 2024-06-24  2384  		 * We need to do this, because static_keys will span multiple
ea1e879631ffdf Roman Gushchin 2024-06-24  2385  		 * sites, but we can't control their order. If we mark a socket
ea1e879631ffdf Roman Gushchin 2024-06-24  2386  		 * as accounted, but the accounting functions are not patched in
ea1e879631ffdf Roman Gushchin 2024-06-24  2387  		 * yet, we'll lose accounting.
ea1e879631ffdf Roman Gushchin 2024-06-24  2388  		 *
ea1e879631ffdf Roman Gushchin 2024-06-24  2389  		 * We never race with the readers in mem_cgroup_sk_alloc(),
ea1e879631ffdf Roman Gushchin 2024-06-24  2390  		 * because when this value change, the code to process it is not
ea1e879631ffdf Roman Gushchin 2024-06-24  2391  		 * patched in yet.
ea1e879631ffdf Roman Gushchin 2024-06-24  2392  		 */
ea1e879631ffdf Roman Gushchin 2024-06-24  2393  		static_branch_inc(&memcg_sockets_enabled_key);
ea1e879631ffdf Roman Gushchin 2024-06-24  2394  		memcg->tcpmem_active = true;
ea1e879631ffdf Roman Gushchin 2024-06-24  2395  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2396  out:
ea1e879631ffdf Roman Gushchin 2024-06-24  2397  	mutex_unlock(&memcg_max_mutex);
ea1e879631ffdf Roman Gushchin 2024-06-24  2398  	return ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  2399  }
ea1e879631ffdf Roman Gushchin 2024-06-24  2400  
ea1e879631ffdf Roman Gushchin 2024-06-24  2401  /*
ea1e879631ffdf Roman Gushchin 2024-06-24  2402   * The user of this function is...
ea1e879631ffdf Roman Gushchin 2024-06-24  2403   * RES_LIMIT.
ea1e879631ffdf Roman Gushchin 2024-06-24  2404   */
ea1e879631ffdf Roman Gushchin 2024-06-24  2405  static ssize_t mem_cgroup_write(struct kernfs_open_file *of,
ea1e879631ffdf Roman Gushchin 2024-06-24  2406  				char *buf, size_t nbytes, loff_t off)
ea1e879631ffdf Roman Gushchin 2024-06-24  2407  {
ea1e879631ffdf Roman Gushchin 2024-06-24  2408  	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
ea1e879631ffdf Roman Gushchin 2024-06-24  2409  	unsigned long nr_pages;
ea1e879631ffdf Roman Gushchin 2024-06-24  2410  	int ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  2411  
ea1e879631ffdf Roman Gushchin 2024-06-24  2412  	buf = strstrip(buf);
ea1e879631ffdf Roman Gushchin 2024-06-24  2413  	ret = page_counter_memparse(buf, "-1", &nr_pages);
ea1e879631ffdf Roman Gushchin 2024-06-24  2414  	if (ret)
ea1e879631ffdf Roman Gushchin 2024-06-24  2415  		return ret;
ea1e879631ffdf Roman Gushchin 2024-06-24  2416  
ea1e879631ffdf Roman Gushchin 2024-06-24  2417  	switch (MEMFILE_ATTR(of_cft(of)->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2418  	case RES_LIMIT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2419  		if (mem_cgroup_is_root(memcg)) { /* Can't set limit on root */
ea1e879631ffdf Roman Gushchin 2024-06-24  2420  			ret = -EINVAL;
ea1e879631ffdf Roman Gushchin 2024-06-24  2421  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2422  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  2423  		switch (MEMFILE_TYPE(of_cft(of)->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2424  		case _MEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2425  			ret = mem_cgroup_resize_max(memcg, nr_pages, false);
ea1e879631ffdf Roman Gushchin 2024-06-24  2426  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2427  		case _MEMSWAP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2428  			ret = mem_cgroup_resize_max(memcg, nr_pages, true);
ea1e879631ffdf Roman Gushchin 2024-06-24  2429  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2430  		case _KMEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2431  			pr_warn_once("kmem.limit_in_bytes is deprecated and will be removed. "
ea1e879631ffdf Roman Gushchin 2024-06-24  2432  				     "Writing any value to this file has no effect. "
ea1e879631ffdf Roman Gushchin 2024-06-24  2433  				     "Please report your usecase to linux-mm@kvack.org if you "
ea1e879631ffdf Roman Gushchin 2024-06-24  2434  				     "depend on this functionality.\n");
ea1e879631ffdf Roman Gushchin 2024-06-24  2435  			ret = 0;
ea1e879631ffdf Roman Gushchin 2024-06-24  2436  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2437  		case _TCP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2438  			ret = memcg_update_tcp_max(memcg, nr_pages);
ea1e879631ffdf Roman Gushchin 2024-06-24  2439  			break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2440  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  2441  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2442  	case RES_SOFT_LIMIT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2443  		if (IS_ENABLED(CONFIG_PREEMPT_RT)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2444  			ret = -EOPNOTSUPP;
ea1e879631ffdf Roman Gushchin 2024-06-24  2445  		} else {
ea1e879631ffdf Roman Gushchin 2024-06-24  2446  			WRITE_ONCE(memcg->soft_limit, nr_pages);
ea1e879631ffdf Roman Gushchin 2024-06-24  2447  			ret = 0;
ea1e879631ffdf Roman Gushchin 2024-06-24  2448  		}
ea1e879631ffdf Roman Gushchin 2024-06-24  2449  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2450  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2451  	return ret ?: nbytes;
ea1e879631ffdf Roman Gushchin 2024-06-24  2452  }
ea1e879631ffdf Roman Gushchin 2024-06-24  2453  
ea1e879631ffdf Roman Gushchin 2024-06-24  2454  static ssize_t mem_cgroup_reset(struct kernfs_open_file *of, char *buf,
ea1e879631ffdf Roman Gushchin 2024-06-24  2455  				size_t nbytes, loff_t off)
ea1e879631ffdf Roman Gushchin 2024-06-24  2456  {
ea1e879631ffdf Roman Gushchin 2024-06-24  2457  	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
ea1e879631ffdf Roman Gushchin 2024-06-24  2458  	struct page_counter *counter;
ea1e879631ffdf Roman Gushchin 2024-06-24  2459  
ea1e879631ffdf Roman Gushchin 2024-06-24  2460  	switch (MEMFILE_TYPE(of_cft(of)->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2461  	case _MEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2462  		counter = &memcg->memory;
ea1e879631ffdf Roman Gushchin 2024-06-24  2463  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2464  	case _MEMSWAP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2465  		counter = &memcg->memsw;
ea1e879631ffdf Roman Gushchin 2024-06-24  2466  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2467  	case _KMEM:
ea1e879631ffdf Roman Gushchin 2024-06-24  2468  		counter = &memcg->kmem;
ea1e879631ffdf Roman Gushchin 2024-06-24  2469  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2470  	case _TCP:
ea1e879631ffdf Roman Gushchin 2024-06-24  2471  		counter = &memcg->tcpmem;
ea1e879631ffdf Roman Gushchin 2024-06-24  2472  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2473  	default:
ea1e879631ffdf Roman Gushchin 2024-06-24  2474  		BUG();
ea1e879631ffdf Roman Gushchin 2024-06-24  2475  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2476  
ea1e879631ffdf Roman Gushchin 2024-06-24  2477  	switch (MEMFILE_ATTR(of_cft(of)->private)) {
ea1e879631ffdf Roman Gushchin 2024-06-24  2478  	case RES_MAX_USAGE:
ea1e879631ffdf Roman Gushchin 2024-06-24 @2479  		page_counter_reset_watermark(counter);
ea1e879631ffdf Roman Gushchin 2024-06-24  2480  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2481  	case RES_FAILCNT:
ea1e879631ffdf Roman Gushchin 2024-06-24  2482  		counter->failcnt = 0;
ea1e879631ffdf Roman Gushchin 2024-06-24  2483  		break;
ea1e879631ffdf Roman Gushchin 2024-06-24  2484  	default:
ea1e879631ffdf Roman Gushchin 2024-06-24  2485  		BUG();
ea1e879631ffdf Roman Gushchin 2024-06-24  2486  	}
ea1e879631ffdf Roman Gushchin 2024-06-24  2487  
ea1e879631ffdf Roman Gushchin 2024-06-24  2488  	return nbytes;
ea1e879631ffdf Roman Gushchin 2024-06-24  2489  }
ea1e879631ffdf Roman Gushchin 2024-06-24  2490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
