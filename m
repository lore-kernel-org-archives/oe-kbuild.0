Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0961D2B03
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803467; cv=none; b=iwX+CfdwdK6u27ocmDpP6h8Ew8KmxXIaaTwrWqQc5DoUduDHti02xe5TxRXuXP4gSRiTIDpEb3Dr9PmIiSN87B+zrHIHJtVitrMrYq15vZCWRVO3pwLipBnE2G6iovKS2OpZoigx6m9DQqDOhbnhlI8bixFH+PYmOcFoqqBtDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803467; c=relaxed/simple;
	bh=t0X9LL7tNgsBA+VuX2aCLj6aTQkfxcsqLSgKfemIN/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bowZZaxWeCWCNESu+Q57+X9zdtADstZInuPeKnKfIJSFtvrZuAJ4x1IFIBo/h0/Tl31uolDSSLwDEhD7JRt6pkQM+qjPZoTSViEl4uL2O06tTjXZU+AQbv3PKyPQUzChTuCrK19QCeB8Q9tB5hKnrOFNKAjJMyCtVc+9hv9TOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmVIv9la; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmVIv9la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730803464; x=1762339464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0X9LL7tNgsBA+VuX2aCLj6aTQkfxcsqLSgKfemIN/I=;
  b=cmVIv9ladGLEBDid7oa/3Zll9kSXU6WvZ7mUPy9XgoVDiq/0BGhXU+Ao
   ORiXVTSQGmLDsVy0hWJuu4hwvGCuCxcLOFUtsYcbhsV05wn94Cvcc2Cpr
   uApzLu6I01njq3/21pd9pW0c3SNKjlq5LAodlYSM0YFh9rJtDdbiGpOHw
   AJR2DnPW1wZN5LCJcqsRw+PokQIkW/RBkC2iz/lXVzz6b0ysCPG/VSsrz
   WK1y1dCQOIAxUos0UsuU2mOy3GtWzn+Mrz+nNHQHLinvCW25hEYKssYZQ
   xNcdL+x8aZQoqLITXo+XVf8bycrebx4TACl3QfmfZJ2YZeeS2okJWXNCo
   A==;
X-CSE-ConnectionGUID: 6SkdmQtRQTycvPJsj+U8jA==
X-CSE-MsgGUID: ow1jAmVST7iNgupMTgZCRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48006394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48006394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:44:24 -0800
X-CSE-ConnectionGUID: SSSIWWxITkqM+0anVNJUaA==
X-CSE-MsgGUID: BWMo4VP+QLu0i/A+aMsorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="89111580"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2024 02:44:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8H2q-000lvj-2D;
	Tue, 05 Nov 2024 10:44:20 +0000
Date: Tue, 5 Nov 2024 18:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1351/1351] mm/page_alloc.c:4591
 check_after_alloc() warn: bitwise AND condition is false here
Message-ID: <202411052003.6oqMloey-lkp@intel.com>
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
head:   93af945a84362704003ed46f6c5068cb8a7ee60a
commit: 200321e8a69ef82350d070de35ac4a666ab79ba6 [1351/1351] mm: mem_reliable: Add limiting the usage of reliable memory
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20241103 (https://download.01.org/0day-ci/archive/20241105/202411052003.6oqMloey-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411052003.6oqMloey-lkp@intel.com/

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
