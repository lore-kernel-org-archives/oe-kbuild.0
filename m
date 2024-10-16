Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75B199935
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076472; cv=none; b=mQ+bdo8lBydimzPhNpZRtSvXMI98FTsV7rJMFfEy+7+17pyL5VUfLy0VhxxOv50elBZVzW6LJtfrCVekmOVGoEWXF4cXZZYfwM8k0OCbIUXk+6QI0rZufs7xcA7jNKKoJDf3RiiKXA+10LnO6eMO93sYiHoseWwYjUG6/QAWmok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076472; c=relaxed/simple;
	bh=QT/wkwbCXMnMSaUoPAjGysf8ZUWCXmAMWkGnBRnzFBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLXc9WbSCuLgEsKqzJMHqdNMb8wYwe5E9vb1JvrmMIwDfVWp5WpM/HTJ088h+ZbYiAUB2ESOMzSRRUYRRHTIWvBCMq1t8pBIN/aIVONdWOGttwG457rvu5C7/UTQFvREqGJDVUDIFxevO0AVvcrS+ZreZZ1TF9m97QKWDakGMFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsfsFaZN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsfsFaZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729076471; x=1760612471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QT/wkwbCXMnMSaUoPAjGysf8ZUWCXmAMWkGnBRnzFBk=;
  b=dsfsFaZNXV/HNhfz0/qsE8zcxN0jtWpr+otMP1epTsac7p0ZJ6z0mzOT
   hVL/rpfdcViTHkeyuwMrmbly15Z4irJojuaFrykgS5w/sfTKqnjs8YQOp
   MENivGAte4+8EBaHiTgR3M05XAVmL4QN6VpGttPSE76ZxzEo8SGe5tILo
   oQ1TWuyW8rsHnBV6ntS3ybe83IjI2v9/4jhwvPfiYQQzip+HxzjPnCyTy
   oudxoM4IAKnUCbJCAi+E+2y60sJ+28s4Q4ESgoFTErROAbxrXWZ0tPzno
   97tZFmZaWaQNrLRsQYMZGBu0IGePoh2ocvSB4G/5c8r+s8HkrIDiuIQgL
   Q==;
X-CSE-ConnectionGUID: xAS++210TeijiBFIasnnFQ==
X-CSE-MsgGUID: RhGcuXDxR/CCvyBaKfP+TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45989977"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45989977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:01:10 -0700
X-CSE-ConnectionGUID: qjTcvoMgT1WTTZ1nxHzLTA==
X-CSE-MsgGUID: u64VeitqSjWReaYCiXz6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78253917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 04:01:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11m6-000KoB-0l;
	Wed, 16 Oct 2024 11:01:06 +0000
Date: Wed, 16 Oct 2024 19:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memcontrol-v1.c:2338 mem_cgroup_read_u64() error: uninitialized
 symbol 'counter'.
Message-ID: <202410161823.PGD12Fqg-lkp@intel.com>
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
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: ea1e879631ffdf640bfcb11439d61a151067bb39 mm: memcg: move cgroup v1 interface files to memcontrol-v1.c
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161823.PGD12Fqg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161823.PGD12Fqg-lkp@intel.com/

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
