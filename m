Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246F313260
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761773605; cv=none; b=qeVE0rk0WG/yK5QUn/Kao/NpEiFu+rtb8BiN5GhxIbvELfi7MltqUVTrMAAjZtl+YtfC1h97abkpen8EH2AfKwSRKlKnsqwHSaN9zF7WMVWBn8q0TvOv6BUbz9XTvCQR7xH6hq6B03p4mIJrEki/7vzT6F/DpoW4+f/RCNw1JS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761773605; c=relaxed/simple;
	bh=cTHZLD8pxOadeOB3xzvrVTPVJvCe9unGULZQBPjha6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZr/RtFv1IBjDhPXyd+VdWa2QzEGpBBXaP4NjqbsWCWQs1/43RZ14an53KaudjuE/Bvo0AnAuA1Y/+sFBurHd8Nd73v4+2TU0X5OyohwrTRI3xXnW+mTtJPVu432Pa0lKtNqm2NP9pXR4OC+UBB+SSzmFW13LJGZHtY4oAOrfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8mZMdja; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8mZMdja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761773603; x=1793309603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTHZLD8pxOadeOB3xzvrVTPVJvCe9unGULZQBPjha6Y=;
  b=L8mZMdja+WE9s9iG9HhPv+GX2Kjji0qwCWcy2RbZQK1Sh0ZYw/z52fbc
   RTNXy/WVDvPr20Fvlj58wj/k3BCpUkyPKwpwinXSZ+7/XJeKvYLdhODN/
   Gav8wbId/CoAe8L3acSbmZNfIQxcZNUywPVoO43IdJUDvQzVwrtZ5EreG
   l5dD8YeBJ9e2Y5bck+RqqSdkJuI9lfuEo1GAO8P0R4FPALv6BcVzNIx71
   yS8WJ/yjwjFhu8ooJYooPj1H2ZDb3vouUWsnFkHB/jp8JeL0nzdzezQJJ
   mvyOD/UqjDMDPdRiBHzaihbOi8WfgEKlIWI2zzbbrHdJLWOQlesi7iAtf
   w==;
X-CSE-ConnectionGUID: Br9cm0+8QO+cF7XABFQAjQ==
X-CSE-MsgGUID: OQJqeYbOSdScJ7ZoHiEunQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63946112"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63946112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 14:33:21 -0700
X-CSE-ConnectionGUID: ajZdP7oYQ5SMz2NXu0FOrw==
X-CSE-MsgGUID: 0DXyB0ZpQYmk0s/mx2VmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189848159"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 14:33:19 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEDnB-000LCE-10;
	Wed, 29 Oct 2025 21:33:17 +0000
Date: Thu, 30 Oct 2025 05:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] mm/page_alloc.c:4591
 check_after_alloc() warn: bitwise AND condition is false here
Message-ID: <202510300507.LAONYYu0-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Wupeng Ma <mawupeng1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6a2b7160d59b59ef2bd08614200d0a2219b54e
commit: 200321e8a69ef82350d070de35ac4a666ab79ba6 [3064/3064] mm: mem_reliable: Add limiting the usage of reliable memory
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 10 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300507.LAONYYu0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510300507.LAONYYu0-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4591 check_after_alloc() warn: bitwise AND condition is false here

vim +4591 mm/page_alloc.c

200321e8a69ef8 Ma Wupeng 2024-01-10  4575  
200321e8a69ef8 Ma Wupeng 2024-01-10  4576  /*
200321e8a69ef8 Ma Wupeng 2024-01-10  4577   * return true means memory allocation need retry and flag GFP_RELIABLE
200321e8a69ef8 Ma Wupeng 2024-01-10  4578   * must be cleared.
200321e8a69ef8 Ma Wupeng 2024-01-10  4579   */
200321e8a69ef8 Ma Wupeng 2024-01-10  4580  static inline bool check_after_alloc(gfp_t *gfp, unsigned int order,
200321e8a69ef8 Ma Wupeng 2024-01-10  4581  				     int preferred_nid,
200321e8a69ef8 Ma Wupeng 2024-01-10  4582  				     struct alloc_context *ac,
200321e8a69ef8 Ma Wupeng 2024-01-10  4583  				     struct page **_page)
200321e8a69ef8 Ma Wupeng 2024-01-10  4584  {
200321e8a69ef8 Ma Wupeng 2024-01-10  4585  	int retry_times = MAX_RECLAIM_RETRIES;
200321e8a69ef8 Ma Wupeng 2024-01-10  4586  	int nr_pages;
200321e8a69ef8 Ma Wupeng 2024-01-10  4587  
200321e8a69ef8 Ma Wupeng 2024-01-10  4588  	if (!mem_reliable_is_enabled())
200321e8a69ef8 Ma Wupeng 2024-01-10  4589  		return false;
200321e8a69ef8 Ma Wupeng 2024-01-10  4590  
200321e8a69ef8 Ma Wupeng 2024-01-10 @4591  	if (!(*gfp & GFP_RELIABLE))
200321e8a69ef8 Ma Wupeng 2024-01-10  4592  		return false;
200321e8a69ef8 Ma Wupeng 2024-01-10  4593  
200321e8a69ef8 Ma Wupeng 2024-01-10  4594  	if (!*_page)
200321e8a69ef8 Ma Wupeng 2024-01-10  4595  		goto out_retry;
200321e8a69ef8 Ma Wupeng 2024-01-10  4596  
200321e8a69ef8 Ma Wupeng 2024-01-10  4597  	if (*gfp & __GFP_NOFAIL || current->flags & PF_MEMALLOC)
200321e8a69ef8 Ma Wupeng 2024-01-10  4598  		goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4599  
200321e8a69ef8 Ma Wupeng 2024-01-10  4600  	/* percpu counter is not initialized, ignore limit check */
200321e8a69ef8 Ma Wupeng 2024-01-10  4601  	if (!mem_reliable_counter_initialized())
200321e8a69ef8 Ma Wupeng 2024-01-10  4602  		goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4603  
200321e8a69ef8 Ma Wupeng 2024-01-10  4604  limit_check:
200321e8a69ef8 Ma Wupeng 2024-01-10  4605  	/* user task is limited by task_reliable_limit */
200321e8a69ef8 Ma Wupeng 2024-01-10  4606  	if (!reliable_mem_limit_check(1 << order))
200321e8a69ef8 Ma Wupeng 2024-01-10  4607  		goto out_free_page;
200321e8a69ef8 Ma Wupeng 2024-01-10  4608  
200321e8a69ef8 Ma Wupeng 2024-01-10  4609  	goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4610  
200321e8a69ef8 Ma Wupeng 2024-01-10  4611  out_free_page:
200321e8a69ef8 Ma Wupeng 2024-01-10  4612  	if (mem_reliable_should_reclaim() && retry_times--) {
200321e8a69ef8 Ma Wupeng 2024-01-10  4613  		nr_pages = mem_reliable_direct_reclaim(1 << order, ac);
200321e8a69ef8 Ma Wupeng 2024-01-10  4614  		if (nr_pages)
200321e8a69ef8 Ma Wupeng 2024-01-10  4615  			goto limit_check;
200321e8a69ef8 Ma Wupeng 2024-01-10  4616  	}
200321e8a69ef8 Ma Wupeng 2024-01-10  4617  
200321e8a69ef8 Ma Wupeng 2024-01-10  4618  	__free_pages(*_page, order);
200321e8a69ef8 Ma Wupeng 2024-01-10  4619  	*_page = NULL;
200321e8a69ef8 Ma Wupeng 2024-01-10  4620  
200321e8a69ef8 Ma Wupeng 2024-01-10  4621  out_retry:
200321e8a69ef8 Ma Wupeng 2024-01-10  4622  	if (is_global_init(current)) {
200321e8a69ef8 Ma Wupeng 2024-01-10  4623  		*gfp &= ~GFP_RELIABLE;
200321e8a69ef8 Ma Wupeng 2024-01-10  4624  		return true;
200321e8a69ef8 Ma Wupeng 2024-01-10  4625  	}
200321e8a69ef8 Ma Wupeng 2024-01-10  4626  
200321e8a69ef8 Ma Wupeng 2024-01-10  4627  	if (*gfp & (__GFP_NORETRY | __GFP_RETRY_MAYFAIL | __GFP_THISNODE))
200321e8a69ef8 Ma Wupeng 2024-01-10  4628  		goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4629  
200321e8a69ef8 Ma Wupeng 2024-01-10  4630  	/* Coredumps can quickly deplete all memory reserves */
200321e8a69ef8 Ma Wupeng 2024-01-10  4631  	if (current->flags & PF_DUMPCORE)
200321e8a69ef8 Ma Wupeng 2024-01-10  4632  		goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4633  	/* The OOM killer will not help higher order allocs */
200321e8a69ef8 Ma Wupeng 2024-01-10  4634  	if (order > PAGE_ALLOC_COSTLY_ORDER)
200321e8a69ef8 Ma Wupeng 2024-01-10  4635  		goto out;
200321e8a69ef8 Ma Wupeng 2024-01-10  4636  
200321e8a69ef8 Ma Wupeng 2024-01-10  4637  	/* oom here */
200321e8a69ef8 Ma Wupeng 2024-01-10  4638  	mem_reliable_out_of_memory(*gfp, order, preferred_nid, ac->nodemask);
200321e8a69ef8 Ma Wupeng 2024-01-10  4639  out:
200321e8a69ef8 Ma Wupeng 2024-01-10  4640  	return false;
200321e8a69ef8 Ma Wupeng 2024-01-10  4641  }
200321e8a69ef8 Ma Wupeng 2024-01-10  4642  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
