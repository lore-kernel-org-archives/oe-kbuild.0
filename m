Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761FA1C29A
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 18:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJeEF2x9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699726785; x=1731262785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rl+Cptmed6metd6uxMTsqSNN8LYYKNrOkWacKVH386w=;
  b=fJeEF2x9w8NtPqW/qnzkcHi5eDGYdZ+cFpZi+O3XSuvlP6Q2h1KHsY4Z
   wGIWZZmBLZ4Oz9xMPISs1ngl6CPFuQTPLf8yc2qlIyqt1TsR+at+SLEMT
   j7eRZIKhOPjJjwpXZM7LbTazqkRmbxIpcxX9kvNLvtB8lsvzNXsymIRUi
   HoG3T8I1sXEFfKySjr2vWuP74BhxwVyghvVXAQ762H/57bfRb2l+yqptf
   u/5pT8kkz2QRYl2DLhF9CVwc1qSKjfpA8q/f9YK8poW70HeQm/MwIT+18
   D6M9Zm/2+JT12bFTla5Ocvijxjs4euC/mwtRdi4q+tPHBkgrcE2BpqSwM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="389156867"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="389156867"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 10:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="763992994"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="763992994"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Nov 2023 10:19:39 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1sa1-000Afa-02;
	Sat, 11 Nov 2023 18:19:37 +0000
Date: Sun, 12 Nov 2023 02:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/page_isolation.c:175:31: sparse: sparse: too long token expansion
Message-ID: <202311120203.m5ud07ic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/page_isolation.c:175:31: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: d03eba99f5bf7cbc6e2fdde3b6fa36954ad58e09 minmax: allow min()/max()/clamp() if the arguments have the same signedness.
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231112/202311120203.m5ud07ic-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311120203.m5ud07ic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120203.m5ud07ic-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_isolation.c:175:31: sparse: sparse: too long token expansion
>> mm/page_isolation.c:175:31: sparse: sparse: too long token expansion

vim +175 mm/page_isolation.c

b48d8a8e5ce53e Zi Yan                    2022-05-12  141  
844fbae63e468e Zi Yan                    2022-05-12  142  /*
844fbae63e468e Zi Yan                    2022-05-12  143   * This function set pageblock migratetype to isolate if no unmovable page is
844fbae63e468e Zi Yan                    2022-05-12  144   * present in [start_pfn, end_pfn). The pageblock must intersect with
844fbae63e468e Zi Yan                    2022-05-12  145   * [start_pfn, end_pfn).
844fbae63e468e Zi Yan                    2022-05-12  146   */
844fbae63e468e Zi Yan                    2022-05-12  147  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
844fbae63e468e Zi Yan                    2022-05-12  148  			unsigned long start_pfn, unsigned long end_pfn)
ee6f509c327401 Minchan Kim               2012-07-31  149  {
1c31cb493c3144 David Hildenbrand         2020-10-13  150  	struct zone *zone = page_zone(page);
1c31cb493c3144 David Hildenbrand         2020-10-13  151  	struct page *unmovable;
3f9903b9ca5e98 David Hildenbrand         2020-01-30  152  	unsigned long flags;
844fbae63e468e Zi Yan                    2022-05-12  153  	unsigned long check_unmovable_start, check_unmovable_end;
ee6f509c327401 Minchan Kim               2012-07-31  154  
ee6f509c327401 Minchan Kim               2012-07-31  155  	spin_lock_irqsave(&zone->lock, flags);
ee6f509c327401 Minchan Kim               2012-07-31  156  
2c7452a075d4db Mike Kravetz              2018-04-05  157  	/*
2c7452a075d4db Mike Kravetz              2018-04-05  158  	 * We assume the caller intended to SET migrate type to isolate.
2c7452a075d4db Mike Kravetz              2018-04-05  159  	 * If it is already set, then someone else must have raced and
51030a53d81e30 David Hildenbrand         2020-10-13  160  	 * set it before us.
2c7452a075d4db Mike Kravetz              2018-04-05  161  	 */
51030a53d81e30 David Hildenbrand         2020-10-13  162  	if (is_migrate_isolate_page(page)) {
51030a53d81e30 David Hildenbrand         2020-10-13  163  		spin_unlock_irqrestore(&zone->lock, flags);
51030a53d81e30 David Hildenbrand         2020-10-13  164  		return -EBUSY;
51030a53d81e30 David Hildenbrand         2020-10-13  165  	}
2c7452a075d4db Mike Kravetz              2018-04-05  166  
ee6f509c327401 Minchan Kim               2012-07-31  167  	/*
ee6f509c327401 Minchan Kim               2012-07-31  168  	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
ee6f509c327401 Minchan Kim               2012-07-31  169  	 * We just check MOVABLE pages.
844fbae63e468e Zi Yan                    2022-05-12  170  	 *
844fbae63e468e Zi Yan                    2022-05-12  171  	 * Pass the intersection of [start_pfn, end_pfn) and the page's pageblock
844fbae63e468e Zi Yan                    2022-05-12  172  	 * to avoid redundant checks.
ee6f509c327401 Minchan Kim               2012-07-31  173  	 */
844fbae63e468e Zi Yan                    2022-05-12  174  	check_unmovable_start = max(page_to_pfn(page), start_pfn);
4f9bc69ac5ce34 Kefeng Wang               2022-09-07 @175  	check_unmovable_end = min(pageblock_end_pfn(page_to_pfn(page)),
844fbae63e468e Zi Yan                    2022-05-12  176  				  end_pfn);
844fbae63e468e Zi Yan                    2022-05-12  177  
844fbae63e468e Zi Yan                    2022-05-12  178  	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
844fbae63e468e Zi Yan                    2022-05-12  179  			migratetype, isol_flags);
4a55c0474a92d5 Qian Cai                  2020-01-30  180  	if (!unmovable) {
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  181  		unsigned long nr_pages;
4da2ce250f9860 Michal Hocko              2017-11-15  182  		int mt = get_pageblock_migratetype(page);
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  183  
a458431e176ddb Bartlomiej Zolnierkiewicz 2013-01-04  184  		set_pageblock_migratetype(page, MIGRATE_ISOLATE);
ad53f92eb416d8 Joonsoo Kim               2014-11-13  185  		zone->nr_isolate_pageblock++;
02aa0cdd72483c Vlastimil Babka           2017-05-08  186  		nr_pages = move_freepages_block(zone, page, MIGRATE_ISOLATE,
02aa0cdd72483c Vlastimil Babka           2017-05-08  187  									NULL);
2139cbe627b891 Bartlomiej Zolnierkiewicz 2012-10-08  188  
4da2ce250f9860 Michal Hocko              2017-11-15  189  		__mod_zone_freepage_state(zone, -nr_pages, mt);
1c31cb493c3144 David Hildenbrand         2020-10-13  190  		spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c3144 David Hildenbrand         2020-10-13  191  		return 0;
ee6f509c327401 Minchan Kim               2012-07-31  192  	}
ee6f509c327401 Minchan Kim               2012-07-31  193  
ee6f509c327401 Minchan Kim               2012-07-31  194  	spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c3144 David Hildenbrand         2020-10-13  195  	if (isol_flags & REPORT_FAILURE) {
4a55c0474a92d5 Qian Cai                  2020-01-30  196  		/*
3d680bdf60a5ba Qian Cai                  2020-01-30  197  		 * printk() with zone->lock held will likely trigger a
4a55c0474a92d5 Qian Cai                  2020-01-30  198  		 * lockdep splat, so defer it here.
4a55c0474a92d5 Qian Cai                  2020-01-30  199  		 */
4a55c0474a92d5 Qian Cai                  2020-01-30  200  		dump_page(unmovable, "unmovable page");
3d680bdf60a5ba Qian Cai                  2020-01-30  201  	}
4a55c0474a92d5 Qian Cai                  2020-01-30  202  
1c31cb493c3144 David Hildenbrand         2020-10-13  203  	return -EBUSY;
ee6f509c327401 Minchan Kim               2012-07-31  204  }
ee6f509c327401 Minchan Kim               2012-07-31  205  

:::::: The code at line 175 was first introduced by commit
:::::: 4f9bc69ac5ce34071a9a51343bc81ca76cb2e3f1 mm: reuse pageblock_start/end_pfn() macro

:::::: TO: Kefeng Wang <wangkefeng.wang@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
