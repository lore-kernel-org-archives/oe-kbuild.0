Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064D4C6D
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Jan 2025 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736066663; cv=none; b=hawdY3eE+64+UHiJTvRLJSb5UZS8OmYAGurhKf7zPSsLty5gagYh+j3tXWxz467c4zixpwP7tUqmA0ERT+oAIC+3ms9ZVOjXJN4TkMZIl0eyaF0LPXCItr72zK78Wyaa1X+vHux/ou/ahaBcXqr8NoWeokjO77wwW5QGRzG9LcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736066663; c=relaxed/simple;
	bh=w6fOGgbCiP3ntUzrmcByVxeKcPed7zWDKsdJ4xxb28Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcGJEE1/Q0H3IXDfEAe4jkc9M8cSEfqf2CTCaQ/ZpEooxWU4y4cLnHFyJMqGIQzmeOmi28GkKyc0YAp6pmglPIb0DYkI/AHJg8J++S17Sk9lVapzckH+tJpxFYZ1Og3M0BuXy2Z8AurMika5WFaplfoFfQXlJ2tJgkttPiDh+B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbX1uj+X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbX1uj+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736066662; x=1767602662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6fOGgbCiP3ntUzrmcByVxeKcPed7zWDKsdJ4xxb28Y=;
  b=fbX1uj+XTNokyDZ6la9VEaBj/NAwLXvE4VYNjlixZgMajwiRgq3NUAl/
   yzPcNj/U2kpf5vP9eptJykLmZUhBlpykzCCayDnqs9lfBIwH5XGcKcA0F
   8CJPD0QwZ7X55Pcq6DWa7nldrBhx6PQGLnayqJf6f513wR6HZkMLcDQUV
   aGi1vE5I9SJHLz0VPV2gIMs78xx3oLOIxbS4cuLiIzhNBQAbaH240KHkS
   d9kiKt3ECMKh7OPFA+zhsinz58EQ11C9beNjPXq26K+OZxE4AtBpPWd3w
   ufoaeOCosoFVsEBovbKLtjrW0B5XGl8Ty7saauNnRvJPbpWmK2SId9K/6
   Q==;
X-CSE-ConnectionGUID: dwmlBrT9QGSGQJwJkcM5tg==
X-CSE-MsgGUID: UB9KfyTBSU6bohRUTAazZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46820175"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="46820175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 00:44:21 -0800
X-CSE-ConnectionGUID: cCOyew3STdqPJAe3pCDTOA==
X-CSE-MsgGUID: 4AL2dV5zSSGbjYNaYW2eQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="102032309"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jan 2025 00:44:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUMF8-000BZn-12;
	Sun, 05 Jan 2025 08:44:18 +0000
Date: Sun, 5 Jan 2025 16:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:net-next-pp-inflight-fix_v6 346/346]
 net/core/page_pool.c:764 page_pool_refill_alloc_cache() error: uninitialized
 symbol 'netmem'.
Message-ID: <202501051604.NLI3L5Nj-lkp@intel.com>
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
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git net-next-pp-inflight-fix_v6
head:   bc1f948604d6989a472b6ec02c693e87f6d43588
commit: bc1f948604d6989a472b6ec02c693e87f6d43588 [346/346] page_pool: use list instead of array for alloc cache
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051604.NLI3L5Nj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501051604.NLI3L5Nj-lkp@intel.com/

smatch warnings:
net/core/page_pool.c:764 page_pool_refill_alloc_cache() error: uninitialized symbol 'netmem'.

vim +/netmem +764 net/core/page_pool.c

44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  723  
bc1f948604d698 Yunsheng Lin           2024-12-13  724  	alloc = NULL;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  725  	/* Refill alloc array, but only if NUMA match */
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  726  	do {
c6e34f3840f6cb Yunsheng Lin           2024-12-13  727  		if (unlikely(!refill)) {
c6e34f3840f6cb Yunsheng Lin           2024-12-13  728  			refill = xchg(&pool->ring.list, NULL);
c6e34f3840f6cb Yunsheng Lin           2024-12-13  729  			if (!refill)
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  730  				break;
c6e34f3840f6cb Yunsheng Lin           2024-12-13  731  		}
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  732  
bc1f948604d698 Yunsheng Lin           2024-12-13  733  		curr = refill;
c6e34f3840f6cb Yunsheng Lin           2024-12-13  734  		netmem = refill->pp_netmem;
c6e34f3840f6cb Yunsheng Lin           2024-12-13  735  		refill = page_pool_item_get_next(refill);
8ab79ed50cf10f Mina Almasry           2024-09-10  736  		if (likely(netmem_is_pref_nid(netmem, pref_nid))) {
bc1f948604d698 Yunsheng Lin           2024-12-13  737  			page_pool_item_set_next(curr, alloc);
bc1f948604d698 Yunsheng Lin           2024-12-13  738  			pool->alloc.count++;
bc1f948604d698 Yunsheng Lin           2024-12-13  739  			alloc = curr;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  740  		} else {
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  741  			/* NUMA mismatch;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  742  			 * (1) release 1 page to page-allocator and
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  743  			 * (2) break out to fallthrough to alloc_pages_node.
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  744  			 * This limit stress on page buddy alloactor.
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  745  			 */
98bd85243d0a57 Yunsheng Lin           2025-01-04  746  			__page_pool_return_page(pool, netmem, false);
c6e34f3840f6cb Yunsheng Lin           2024-12-13  747  			atomic_dec(&pool->ring.count);
8610037e8106b4 Joe Damato             2022-03-01  748  			alloc_stat_inc(pool, waive);
4dec64c52e24c2 Mina Almasry           2024-06-28  749  			netmem = 0;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  750  			break;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  751  		}
304db6cb7610eb Li RongQing            2020-02-11  752  	} while (pool->alloc.count < PP_ALLOC_CACHE_REFILL);
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  753  
c6e34f3840f6cb Yunsheng Lin           2024-12-13  754  	pool->alloc.refill = refill;
c6e34f3840f6cb Yunsheng Lin           2024-12-13  755  
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  756  	/* Return last page */
8610037e8106b4 Joe Damato             2022-03-01  757  	if (likely(pool->alloc.count > 0)) {
c6e34f3840f6cb Yunsheng Lin           2024-12-13  758  		atomic_sub(pool->alloc.count, &pool->ring.count);
bc1f948604d698 Yunsheng Lin           2024-12-13  759  		pool->alloc.list = page_pool_item_get_next(alloc);
bc1f948604d698 Yunsheng Lin           2024-12-13  760  		pool->alloc.count--;
8610037e8106b4 Joe Damato             2022-03-01  761  		alloc_stat_inc(pool, refill);
8610037e8106b4 Joe Damato             2022-03-01  762  	}
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  763  
4dec64c52e24c2 Mina Almasry           2024-06-28 @764  	return netmem;
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  765  }
44768decb7c0a6 Jesper Dangaard Brouer 2019-12-27  766  

:::::: The code at line 764 was first introduced by commit
:::::: 4dec64c52e24c2c9a15f81c115f1be5ea35121cb page_pool: convert to use netmem

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
