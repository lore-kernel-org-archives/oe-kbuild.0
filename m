Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4F1DDE9
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPDBVpES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640538; x=1732176538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IFIIffM5L2lh0ja76pVAKZVNM5aOAkTxtFSfaBqTYtY=;
  b=IPDBVpESdHYCPWgELYKk9UKUdQnFepdHrjCWyvlEinJZCVjPqcaNy8jR
   E2VHdsqmQpMh9CSPQVOQewZbfQWBzGhTBALbCb6+3die0zJzSwWNSM/Kf
   Ers9xwkyvC8nbUROLIK7fi7wohB8AVrhqG6AWraXYisKkZcbkc4v6O1KO
   s8SGKeq4Gj9weqRLFCc9mIjTYNx+v0kKob61+VvPWYBVRJv8ByMSQ2OJW
   5LBZ88C43/gssbQP0/hm85+hrBKzgqAnBshd/gJylhQEbHfZldQbvMxnn
   HXlXbEbtj7srDBkI3DMkAb1S41flE1WgexAi0cbeByPc+byt9a6OjZy4F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="390867920"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="390867920"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:08:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="716763258"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="716763258"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Nov 2023 00:08:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5iI2-0000Fg-0B;
	Wed, 22 Nov 2023 08:08:54 +0000
Date: Wed, 22 Nov 2023 16:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/virt-to-phys-hexagon 2/2]
 arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than
 once.
Message-ID: <202311221547.fkVop8nt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-hexagon
head:   cfd23bb42230c6df709274664c041dd293dd5764
commit: cfd23bb42230c6df709274664c041dd293dd5764 [2/2] Hexagon: Make pfn accessors statics inlines
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221547.fkVop8nt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311221547.fkVop8nt-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.

vim +82 arch/hexagon/include/asm/page.h

    80	
    81	/* Needed for PAGE_OFFSET used in the macro right below */
  > 82	#include <asm/mem-layout.h>
    83	
    84	/*
    85	 * We need a __pa and a __va routine for kernel space.
    86	 * MIPS says they're only used during mem_init.
    87	 * also, check if we need a PHYS_OFFSET.
    88	 */
    89	#define __pa(x) ((unsigned long)(x) - PAGE_OFFSET + PHYS_OFFSET)
    90	#define __va(x) ((void *)((unsigned long)(x) - PHYS_OFFSET + PAGE_OFFSET))
    91	
    92	/* The "page frame" descriptor is defined in linux/mm.h */
    93	struct page;
    94	
    95	/* Returns page frame descriptor for virtual address. */
    96	#define virt_to_page(kaddr) pfn_to_page(PFN_DOWN(__pa(kaddr)))
    97	
    98	/* Default vm area behavior is non-executable.  */
    99	#define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC
   100	
   101	#define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
   102	
   103	/*  Need to not use a define for linesize; may move this to another file.  */
   104	static inline void clear_page(void *page)
   105	{
   106		/*  This can only be done on pages with L1 WB cache */
   107		asm volatile(
   108			"	loop0(1f,%1);\n"
   109			"1:	{ dczeroa(%0);\n"
   110			"	  %0 = add(%0,#32); }:endloop0\n"
   111			: "+r" (page)
   112			: "r" (PAGE_SIZE/32)
   113			: "lc0", "sa0", "memory"
   114		);
   115	}
   116	
   117	#define copy_page(to, from)	memcpy((to), (from), PAGE_SIZE)
   118	
   119	/*
   120	 * Under assumption that kernel always "sees" user map...
   121	 */
   122	#define clear_user_page(page, vaddr, pg)	clear_page(page)
   123	#define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
   124	
   125	/*
   126	 * page_to_phys - convert page to physical address
   127	 * @page - pointer to page entry in mem_map
   128	 */
   129	#define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
   130	
   131	static inline unsigned long virt_to_pfn(const void *kaddr)
   132	{
   133		return __pa(kaddr) >> PAGE_SHIFT;
   134	}
   135	
   136	static inline void *pfn_to_virt(unsigned long pfn)
   137	{
   138		return (void *)((unsigned long)__va(pfn) << PAGE_SHIFT);
   139	}
   140	
   141	
   142	#define page_to_virt(page)	__va(page_to_phys(page))
   143	
 > 144	#include <asm/mem-layout.h>
   145	#include <asm-generic/memory_model.h>
   146	/* XXX Todo: implement assembly-optimized version of getorder. */
   147	#include <asm-generic/getorder.h>
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
