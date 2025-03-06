Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD519DF5B
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741292170; cv=none; b=XVpV2Yc5hqSb2wzL99n/Q3ECHi1+CLX6IvnMxnT5t+OIZqPIvJ6KuEINVnsMuLcw9emxg/dG4o1b5gwjCgvRdB/cY9gLoUh7L2qFkm1X3h2fxZtIjgM832Rn/p/0MfAwpHZ3VMxezrBXEXVPHAQgqzl8XrV8AKnpYuj0DjZmtAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741292170; c=relaxed/simple;
	bh=l/nFIrNBezkj6H53IHdK5ssD7ixH86NfY8qJZF1097E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AEu5gtNS1Q9anZMvz9mpAA2P3Z0nwRdKo/5OKvPXt5tj5/iQzKF2cQ4wHnBtHjqyqwP8o/fbobN1vGYssuj8rMK3Boy6O7xLjie+EkwHzqAVL+PU6bHh19S4ajA+tD3L4IYkiJeVWW6RuZaqk8aqddKgnIjH5nMm6WFcx81i8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYHNyZuk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYHNyZuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741292168; x=1772828168;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l/nFIrNBezkj6H53IHdK5ssD7ixH86NfY8qJZF1097E=;
  b=GYHNyZukWDb8io8TMDDYsob8gNFgzCMec9klvzv5MeYVOpWIHnLZN54h
   JHVCVh3cF4g9YN6SUpSJhLh69SutHPvrNuZ0KqM0kSDTPbZ3UdggFcOWE
   jk1U3/+pD+AyOwzyiDuSdvOE3nPCbGzMrGzaqR20th5GHmDxGsnkRWugk
   ed3mCu8PvEK0kqny/GAIBEn8Em2wlC822Qe+T5i5EShHYJJFhglPHQ4yS
   C28W0NsBpPGzQrgVXE0UVhP4c1ex2OiEjAENI4ztOU9tI/H137Fnp4oCC
   Bs4xHCk7X/KviaE5kI0yku3z0H/Y51lwLkXXZO1jCN2w+3LgzZPz7y3hn
   Q==;
X-CSE-ConnectionGUID: 974M1A/rROSFWvWLiBAoWA==
X-CSE-MsgGUID: cTpnz29pSJ6ZqbpcKplG4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42465845"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="42465845"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:16:07 -0800
X-CSE-ConnectionGUID: GUpEc1ARSlu0GP8pdKAb4w==
X-CSE-MsgGUID: hPHE6ri0SW+2yRhrOtfigw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="123722959"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2025 12:16:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqHdR-000NZO-2P;
	Thu, 06 Mar 2025 20:16:02 +0000
Date: Fri, 7 Mar 2025 04:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8845/9212] drivers/gpu/drm/ttm/ttm_pool.c:616
 ttm_pool_page_allocated() error: uninitialized symbol 'first_dma'.
Message-ID: <202503070445.tNHU2DmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: b63d715b8090aed48bdef5930625946fa4c0d324 [8845/9212] drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
:::::: branch date: 11 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-141-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070445.tNHU2DmM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503070445.tNHU2DmM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_pool.c:616 ttm_pool_page_allocated() error: uninitialized symbol 'first_dma'.

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_pool.c:618 ttm_pool_page_allocated() error: uninitialized symbol 'first_dma'.

vim +/first_dma +616 drivers/gpu/drm/ttm/ttm_pool.c

b63d715b8090ae Thomas Hellström 2025-03-05  583  
1d3160c7cba37b Thomas Hellström 2024-12-17  584  /*
1d3160c7cba37b Thomas Hellström 2024-12-17  585   * Called when we got a page, either from a pool or newly allocated.
1d3160c7cba37b Thomas Hellström 2024-12-17  586   * if needed, dma map the page and populate the dma address array.
1d3160c7cba37b Thomas Hellström 2024-12-17  587   * Populate the page address array.
1d3160c7cba37b Thomas Hellström 2024-12-17  588   * If the caching is consistent, update any deferred caching. Otherwise
1d3160c7cba37b Thomas Hellström 2024-12-17  589   * stage this page for an upcoming deferred caching update.
1d3160c7cba37b Thomas Hellström 2024-12-17  590   */
735c466465eba5 Christian König  2022-11-07  591  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
1d3160c7cba37b Thomas Hellström 2024-12-17  592  				   struct page *p, enum ttm_caching page_caching,
b63d715b8090ae Thomas Hellström 2025-03-05  593  				   struct ttm_pool_alloc_state *alloc,
b63d715b8090ae Thomas Hellström 2025-03-05  594  				   struct ttm_pool_tt_restore *restore)
735c466465eba5 Christian König  2022-11-07  595  {
1d3160c7cba37b Thomas Hellström 2024-12-17  596  	bool caching_consistent;
b63d715b8090ae Thomas Hellström 2025-03-05  597  	dma_addr_t first_dma;
1d3160c7cba37b Thomas Hellström 2024-12-17  598  	int r = 0;
1d3160c7cba37b Thomas Hellström 2024-12-17  599  
1d3160c7cba37b Thomas Hellström 2024-12-17  600  	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
1d3160c7cba37b Thomas Hellström 2024-12-17  601  
1d3160c7cba37b Thomas Hellström 2024-12-17  602  	if (caching_consistent) {
1d3160c7cba37b Thomas Hellström 2024-12-17  603  		r = ttm_pool_apply_caching(alloc);
1d3160c7cba37b Thomas Hellström 2024-12-17  604  		if (r)
1d3160c7cba37b Thomas Hellström 2024-12-17  605  			return r;
1d3160c7cba37b Thomas Hellström 2024-12-17  606  	}
735c466465eba5 Christian König  2022-11-07  607  
1d3160c7cba37b Thomas Hellström 2024-12-17  608  	if (alloc->dma_addr) {
b63d715b8090ae Thomas Hellström 2025-03-05  609  		r = ttm_pool_map(pool, order, p, &first_dma);
735c466465eba5 Christian König  2022-11-07  610  		if (r)
735c466465eba5 Christian König  2022-11-07  611  			return r;
735c466465eba5 Christian König  2022-11-07  612  	}
735c466465eba5 Christian König  2022-11-07  613  
b63d715b8090ae Thomas Hellström 2025-03-05  614  	if (restore) {
b63d715b8090ae Thomas Hellström 2025-03-05  615  		ttm_pool_page_allocated_restore(pool, order, p, page_caching,
b63d715b8090ae Thomas Hellström 2025-03-05 @616  						first_dma, restore, alloc);
b63d715b8090ae Thomas Hellström 2025-03-05  617  	} else {
b63d715b8090ae Thomas Hellström 2025-03-05  618  		ttm_pool_allocated_page_commit(p, first_dma, alloc, 1UL << order);
1d3160c7cba37b Thomas Hellström 2024-12-17  619  
1d3160c7cba37b Thomas Hellström 2024-12-17  620  		if (caching_consistent)
1d3160c7cba37b Thomas Hellström 2024-12-17  621  			alloc->caching_divide = alloc->pages;
b63d715b8090ae Thomas Hellström 2025-03-05  622  	}
735c466465eba5 Christian König  2022-11-07  623  
735c466465eba5 Christian König  2022-11-07  624  	return 0;
735c466465eba5 Christian König  2022-11-07  625  }
735c466465eba5 Christian König  2022-11-07  626  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
