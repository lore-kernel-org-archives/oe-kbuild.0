Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9E2741A0
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 21:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758834711; cv=none; b=s3FwX1Y2S2v6HvghekuXFFbQueOyJPecVgMW8sBw9CRq2Q2UF4R2StiGwHfGOcnsCMje04SugboQ1gcbXhUDtvnQjUFFKPvh1lcmAQd/3oTJN0fnKx2iNMzQ7MngU0R6P9CY+idqZQLfEmf0Ewun75LBRr4zP88EdfaceIa1PNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758834711; c=relaxed/simple;
	bh=nbPCEWLpTKr5GCQRNlWs2pZeIWJK9aIlHuvfdGvn3Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4zO4NV/UTRz16Ao9VNw3vTVJr8R8a3RxGPn8kB4dftP8ZzgA9lxHYBvmTlLnpQCs4zEbOc/WqGbDbkX/OYt8v5INxJmh7+GUthrAAv3aDhmM4BlVAsFQNnwT0MB4V5OgqsylirgEMuCw7gJFN24rbIW1FaxfZjo/SHq5IwsH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGBuUt2l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGBuUt2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758834710; x=1790370710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbPCEWLpTKr5GCQRNlWs2pZeIWJK9aIlHuvfdGvn3Ww=;
  b=dGBuUt2lMl4aF624DWvb1K2uf+EuaFqR0xZ+cK8lrQIQlAwhfPxoRe13
   p1w3cei/yIGKk7fCMyV328T0oIctrjF9S+sZeuc+oLyLwqIqLPrkPckl0
   cCiXqjyP3x86EGpFwfgG4sbWW0Pm85y5scDLo0LxrEUTBkxxP3iwPdnTL
   RZNp7+XjfNTjwIiUyoHxvxkD+ZmPp6IfqN8kYs4d6OYjxb2yvCJD5c7h+
   Kjijcfd+xCRjTEnqEQ4A7Ue3yjM1sXu9AjvchKxdSjDQKWVdcuXHC0G+v
   ws6IY8lR6nEqbTIeMEZ+u8RbV3hG640dlhxUhlk+PoMff3QtX9kOaA4Vt
   w==;
X-CSE-ConnectionGUID: Y4bCl5AYTkKMnkoTDNpViA==
X-CSE-MsgGUID: XR8fn2kCTKOO8IgFToVh3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61117940"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61117940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 14:11:49 -0700
X-CSE-ConnectionGUID: Ka1rE1fGR1eSzd0QK9rE0w==
X-CSE-MsgGUID: Ge3uzilZR0OKrm1XgHfWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="182699440"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2025 14:11:47 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1tFh-0005dV-2d;
	Thu, 25 Sep 2025 21:11:45 +0000
Date: Fri, 26 Sep 2025 05:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] Drivers: hv: Add support for movable memory regions
Message-ID: <202509260440.rjwFo3Ct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <175874948365.157998.5201411192858506988.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
References: <175874948365.157998.5201411192858506988.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
TO: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
TO: kys@microsoft.com
TO: haiyangz@microsoft.com
TO: wei.liu@kernel.org
TO: decui@microsoft.com
CC: linux-hyperv@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Stanislav,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250924]
[cannot apply to linus/master v6.17-rc7 v6.17-rc6 v6.17-rc5 v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/Drivers-hv-Rename-a-few-memory-region-related-functions-for-clarity/20250925-053757
base:   next-20250924
patch link:    https://lore.kernel.org/r/175874948365.157998.5201411192858506988.stgit%40skinsburskii-cloud-desktop.internal.cloudapp.net
patch subject: [PATCH 3/3] Drivers: hv: Add support for movable memory regions
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-004-20250925 (https://download.01.org/0day-ci/archive/20250926/202509260440.rjwFo3Ct-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260440.rjwFo3Ct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509260440.rjwFo3Ct-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/mshv_root_main.c:690:6: error: call to '__compiletime_assert_630' declared with 'error' attribute: BUILD_BUG failed
     690 |                                  MSHV_MAP_FAULT_IN_PAGES);
         |                                  ^
   drivers/hv/mshv_root_main.c:38:35: note: expanded from macro 'MSHV_MAP_FAULT_IN_PAGES'
      38 | #define MSHV_MAP_FAULT_IN_PAGES                 HPAGE_PMD_NR
         |                                                 ^
   include/linux/huge_mm.h:118:26: note: expanded from macro 'HPAGE_PMD_NR'
     118 | #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
         |                          ^
   include/linux/huge_mm.h:117:26: note: expanded from macro 'HPAGE_PMD_ORDER'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:30:1: note: expanded from here
      30 | __compiletime_assert_630
         | ^
   1 error generated.


vim +690 drivers/hv/mshv_root_main.c

8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  679  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  680  static bool mshv_region_handle_gfn_fault(struct mshv_mem_region *region, u64 gfn)
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  681  {
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  682  	u64 page_offset, page_count;
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  683  	int ret;
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  684  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  685  	if (WARN_ON_ONCE(region->flags.range_pinned))
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  686  		return false;
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  687  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  688  	/* Align the page offset to the nearest MSHV_MAP_FAULT_IN_PAGES. */
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  689  	page_offset = ALIGN_DOWN(gfn - region->start_gfn,
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24 @690  				 MSHV_MAP_FAULT_IN_PAGES);
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  691  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  692  	/* Map more pages than requested to reduce the number of faults. */
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  693  	page_count = min(region->nr_pages - page_offset,
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  694  			 MSHV_MAP_FAULT_IN_PAGES);
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  695  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  696  	ret = mshv_region_range_fault(region, page_offset, page_count);
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  697  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  698  	WARN_ONCE(ret,
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  699  		  "p%llu: GPA intercept failed: region %#llx-%#llx, gfn %#llx, page_offset %llu, page_count %llu\n",
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  700  		  region->partition->pt_id, region->start_uaddr,
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  701  		  region->start_uaddr + (region->nr_pages << HV_HYP_PAGE_SHIFT),
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  702  		  gfn, page_offset, page_count);
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  703  
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  704  	return !ret;
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  705  }
8d9c7b941f88db Stanislav Kinsburskii 2025-09-24  706  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
