Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F91B7172F
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721935764; cv=none; b=Bx4BouJSRiZOT49s3REZfbqf1jEwHHAjb2e4SldPx7oVi7mx4Vsvw+rVd+avk9MLcbrnXedzwYRfsZ1xRMoZIZk61sfVOE9lA1D7vrPKXDGOyCB8vrkpX+JpBtFa/5/3tWLebw/XdAha3BVVJSrzgK5pfv3mf2GosoGSx8B+2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721935764; c=relaxed/simple;
	bh=HPqB3GkVwb3O5ua+fPNbDutPB+XamgrX1kzi6wkbFWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GY4Q/3+ED4OhhSIiVqu/NoNTh5YZlsouF4th05y8rE4lDgOMnIIGAZyK3ZebfmsB3XZyT0kenAdzFVOiS5BTPhlX3602+/LzN4KnJtoPxCFSffVheD0Oc4JFdCoJK6pYJssVMABqodsJWRdsoUGRwV9hp+Y65NQndNJ6nKX8lcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3nIGw0o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3nIGw0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721935763; x=1753471763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPqB3GkVwb3O5ua+fPNbDutPB+XamgrX1kzi6wkbFWI=;
  b=A3nIGw0o1263XJT1iNQjh3KgcECxF3x90bd6mXvdFboBFGvlVk+18nxY
   G3Tmqp+4xms+4NkvA0SdTCByAIfzxZNM0M4jTG/tGzLcMk6obpt08IJhG
   lKDFGIQmOhOMxkADpnTh6GpstpRM6FMDYSeuPCd8bdw+wwIzn/ZziWIMb
   AO9OWeS79i4IV3reCpI0ZwA3w5tMqLdfA//J/uXjJ6Zs2zLJRt7jMk06i
   4kL6cvMVjG6lIsCsr7e3XVpkDqpIUq3MPiWz0FCZLgBA+L05x8aGbGryr
   Uk1Q9swT0eXCm2tdKjxoJSPRSANeSywwqSfqmx6LEJp9xFHatJX/gYNSA
   A==;
X-CSE-ConnectionGUID: dvqYRJd/Tf25YGePjMmZEg==
X-CSE-MsgGUID: EnUgbmSvT7W2JaSJG8/r1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31087877"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="31087877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 12:29:22 -0700
X-CSE-ConnectionGUID: leZJohq2RSW/R092h+OLPg==
X-CSE-MsgGUID: xXqR1lY6SDqqg7Llw/08yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="57312391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jul 2024 12:29:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX49O-000oOo-0v;
	Thu, 25 Jul 2024 19:29:18 +0000
Date: Fri, 26 Jul 2024 03:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/7] minmax: Simplify signedness check
Message-ID: <202407260319.rmgaXdIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm64/kvm/hyp/nvhe/page_alloc.c:121:21: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <03601661326c4efba4e618ead15fa0e2@AcuMS.aculab.com>
References: <03601661326c4efba4e618ead15fa0e2@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Linus Torvalds'" <torvalds@linuxfoundation.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Dan Carpenter'" <dan.carpenter@linaro.org>
CC: "'Arnd Bergmann'" <arnd@kernel.org>
CC: "'Jason@zx2c4.com'" <Jason@zx2c4.com>
CC: "'pedro.falcato@gmail.com'" <pedro.falcato@gmail.com>
CC: "'Mateusz Guzik'" <mjguzik@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.10 next-20240725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Put-all-the-clamp-definitions-together/20240724-224832
base:   linux/master
patch link:    https://lore.kernel.org/r/03601661326c4efba4e618ead15fa0e2%40AcuMS.aculab.com
patch subject: [PATCH 4/7] minmax: Simplify signedness check
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-r132-20240725 (https://download.01.org/0day-ci/archive/20240726/202407260319.rmgaXdIl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240726/202407260319.rmgaXdIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407260319.rmgaXdIl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/page_alloc.c:121:21: sparse: sparse: bad integer constant expression
>> arch/arm64/kvm/hyp/nvhe/page_alloc.c:121:21: sparse: sparse: static assertion failed: "min(p, buddy) signedness error, fix types or consider umin() before min_t()"

vim +121 arch/arm64/kvm/hyp/nvhe/page_alloc.c

914cde58a03cc5 Quentin Perret     2021-06-08   92  
8e17c66249e9ea Quentin Perret     2021-03-19   93  static void __hyp_attach_page(struct hyp_pool *pool,
8e17c66249e9ea Quentin Perret     2021-03-19   94  			      struct hyp_page *p)
8e17c66249e9ea Quentin Perret     2021-03-19   95  {
72a5bc0f153ce8 Quentin Perret     2022-11-10   96  	phys_addr_t phys = hyp_page_to_phys(p);
87ec0606733e1a Quentin Perret     2021-06-08   97  	unsigned short order = p->order;
8e17c66249e9ea Quentin Perret     2021-03-19   98  	struct hyp_page *buddy;
8e17c66249e9ea Quentin Perret     2021-03-19   99  
8e17c66249e9ea Quentin Perret     2021-03-19  100  	memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
8e17c66249e9ea Quentin Perret     2021-03-19  101  
72a5bc0f153ce8 Quentin Perret     2022-11-10  102  	/* Skip coalescing for 'external' pages being freed into the pool. */
72a5bc0f153ce8 Quentin Perret     2022-11-10  103  	if (phys < pool->range_start || phys >= pool->range_end)
72a5bc0f153ce8 Quentin Perret     2022-11-10  104  		goto insert;
72a5bc0f153ce8 Quentin Perret     2022-11-10  105  
8e17c66249e9ea Quentin Perret     2021-03-19  106  	/*
8e17c66249e9ea Quentin Perret     2021-03-19  107  	 * Only the first struct hyp_page of a high-order page (otherwise known
8e17c66249e9ea Quentin Perret     2021-03-19  108  	 * as the 'head') should have p->order set. The non-head pages should
8e17c66249e9ea Quentin Perret     2021-03-19  109  	 * have p->order = HYP_NO_ORDER. Here @p may no longer be the head
21ea457842759a Julia Lawall       2022-03-18  110  	 * after coalescing, so make sure to mark it HYP_NO_ORDER proactively.
8e17c66249e9ea Quentin Perret     2021-03-19  111  	 */
8e17c66249e9ea Quentin Perret     2021-03-19  112  	p->order = HYP_NO_ORDER;
23baf831a32c04 Kirill A. Shutemov 2023-03-15  113  	for (; (order + 1) <= pool->max_order; order++) {
8e17c66249e9ea Quentin Perret     2021-03-19  114  		buddy = __find_buddy_avail(pool, p, order);
8e17c66249e9ea Quentin Perret     2021-03-19  115  		if (!buddy)
8e17c66249e9ea Quentin Perret     2021-03-19  116  			break;
8e17c66249e9ea Quentin Perret     2021-03-19  117  
21ea457842759a Julia Lawall       2022-03-18  118  		/* Take the buddy out of its list, and coalesce with @p */
914cde58a03cc5 Quentin Perret     2021-06-08  119  		page_remove_from_list(buddy);
8e17c66249e9ea Quentin Perret     2021-03-19  120  		buddy->order = HYP_NO_ORDER;
8e17c66249e9ea Quentin Perret     2021-03-19 @121  		p = min(p, buddy);
8e17c66249e9ea Quentin Perret     2021-03-19  122  	}
8e17c66249e9ea Quentin Perret     2021-03-19  123  
72a5bc0f153ce8 Quentin Perret     2022-11-10  124  insert:
8e17c66249e9ea Quentin Perret     2021-03-19  125  	/* Mark the new head, and insert it */
8e17c66249e9ea Quentin Perret     2021-03-19  126  	p->order = order;
914cde58a03cc5 Quentin Perret     2021-06-08  127  	page_add_to_list(p, &pool->free_area[order]);
8e17c66249e9ea Quentin Perret     2021-03-19  128  }
8e17c66249e9ea Quentin Perret     2021-03-19  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
