Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4B1BDD6
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 20:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJStSbgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699735678; x=1731271678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCXzYRJULOoPPkdLLjfc4TYmgi9sNZxV5ve7+cjeGV8=;
  b=hJStSbgUcqghMbmj4lipnTg65brRffWDYi64z7uvgm28qBB190iNAtjB
   r+K12RuglKNeT8fjw8NcQ9ANeUeVFVpmzF8E5gNH0su0DEQkZEMmLYO84
   3LgsRSYjS6JDbfyR2XCEI7YAMgYeAbE1XpApAHP5ZQHbo2eXc+8fhqutl
   q2D3cyHzpToraU7Xq5HggLh6lXEDb3GYI7bqmX9bIPdBiRE1WM6w5N7cx
   v2H6K/NSld4QtqMutRmuKkcqrorq9nT+ljRJSiOWfTjg6K0JBeHskChCI
   C74R8ZyWpjq+lx3fzq5hVT3zBgm3LICh/ttL8Kq20/G3NbI+D61+3Za2C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="8941192"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="8941192"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 12:47:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="798848875"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="798848875"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 12:47:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1utV-000AkA-2B;
	Sat, 11 Nov 2023 20:47:53 +0000
Date: Sun, 12 Nov 2023 04:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/trace/events/kmem.h:177:1: sparse: sparse: too long token
 expansion
Message-ID: <202311120420.pt2XfpPH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/trace/events/kmem.h:177:1: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 4ead534fba42fc4fd41163297528d2aa731cd121 minmax: allow comparisons of 'int' against 'unsigned char/short'
date:   3 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231112/202311120420.pt2XfpPH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311120420.pt2XfpPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120420.pt2XfpPH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/slab_common.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/kmem.h):
>> include/trace/events/kmem.h:177:1: sparse: sparse: too long token expansion

vim +177 include/trace/events/kmem.h

4b4f278c030aa4 Mel Gorman         2009-09-21  176  
4b4f278c030aa4 Mel Gorman         2009-09-21 @177  TRACE_EVENT(mm_page_alloc,
4b4f278c030aa4 Mel Gorman         2009-09-21  178  
4b4f278c030aa4 Mel Gorman         2009-09-21  179  	TP_PROTO(struct page *page, unsigned int order,
4b4f278c030aa4 Mel Gorman         2009-09-21  180  			gfp_t gfp_flags, int migratetype),
4b4f278c030aa4 Mel Gorman         2009-09-21  181  
4b4f278c030aa4 Mel Gorman         2009-09-21  182  	TP_ARGS(page, order, gfp_flags, migratetype),
4b4f278c030aa4 Mel Gorman         2009-09-21  183  
4b4f278c030aa4 Mel Gorman         2009-09-21  184  	TP_STRUCT__entry(
9fdd8a875c6f3b Namhyung Kim       2015-04-06  185  		__field(	unsigned long,	pfn		)
4b4f278c030aa4 Mel Gorman         2009-09-21  186  		__field(	unsigned int,	order		)
fe573327ffb1de Vasily Averin      2022-05-12  187  		__field(	unsigned long,	gfp_flags	)
4b4f278c030aa4 Mel Gorman         2009-09-21  188  		__field(	int,		migratetype	)
4b4f278c030aa4 Mel Gorman         2009-09-21  189  	),
4b4f278c030aa4 Mel Gorman         2009-09-21  190  
4b4f278c030aa4 Mel Gorman         2009-09-21  191  	TP_fast_assign(
9fdd8a875c6f3b Namhyung Kim       2015-04-06  192  		__entry->pfn		= page ? page_to_pfn(page) : -1UL;
4b4f278c030aa4 Mel Gorman         2009-09-21  193  		__entry->order		= order;
fe573327ffb1de Vasily Averin      2022-05-12  194  		__entry->gfp_flags	= (__force unsigned long)gfp_flags;
4b4f278c030aa4 Mel Gorman         2009-09-21  195  		__entry->migratetype	= migratetype;
4b4f278c030aa4 Mel Gorman         2009-09-21  196  	),
4b4f278c030aa4 Mel Gorman         2009-09-21  197  
53d884a6675b0f Vincent Whitchurch 2021-06-28  198  	TP_printk("page=%p pfn=0x%lx order=%d migratetype=%d gfp_flags=%s",
9fdd8a875c6f3b Namhyung Kim       2015-04-06  199  		__entry->pfn != -1UL ? pfn_to_page(__entry->pfn) : NULL,
9fdd8a875c6f3b Namhyung Kim       2015-04-06  200  		__entry->pfn != -1UL ? __entry->pfn : 0,
4b4f278c030aa4 Mel Gorman         2009-09-21  201  		__entry->order,
4b4f278c030aa4 Mel Gorman         2009-09-21  202  		__entry->migratetype,
4b4f278c030aa4 Mel Gorman         2009-09-21  203  		show_gfp_flags(__entry->gfp_flags))
4b4f278c030aa4 Mel Gorman         2009-09-21  204  );
4b4f278c030aa4 Mel Gorman         2009-09-21  205  

:::::: The code at line 177 was first introduced by commit
:::::: 4b4f278c030aa4b6ee0915f396e9a9478d92d610 tracing, page-allocator: add trace events for page allocation and page freeing

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
