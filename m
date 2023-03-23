Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3E19E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679611249; x=1711147249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kt6kuvwxS0L+cN5X8d3gsmAdaaakmECbPk2DeIgvSE=;
  b=JFI7Kmb7bxQX9Y3tzaicyIjQPEvMiZvnS6lQRL3eKIqqDFlHAq/vA7sz
   El9uvyn/LPGg8KpYpqBDd+CBhOkaozpm4fR232xj38Ou7C3PoBmjZ5b+Q
   dX+MeeMRCsLEbpYri1Od9JhXE0ejR6HGTvwo8/NPtWm44uZOCf2Jknsyg
   40V/Hve1bjyJ0sA59ZspXdwh6PfR56uBSl6AoKopYtUbOx49iQ5C7V0Th
   JBrAgR3yV8LqfW6xzRkIOdkfBLwFBEhpPO43eHo0UU35QVFBk+/5vnc58
   hM3e5ETuzQX8xVXOJ+MnBScriSHL8Nts1N5bDBB2aRfrSmf3dAW6Jgtbf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367382540"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="367382540"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 15:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="632620847"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="632620847"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Mar 2023 15:40:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfTby-000Ela-2B;
	Thu, 23 Mar 2023 22:40:46 +0000
Date: Fri, 24 Mar 2023 06:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 225/293] mm/page_isolation.c:175:31: sparse:
 sparse: shift too big (4294967295) for type unsigned long
Message-ID: <202303240615.MsP1EhWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/page_isolation.c:175:31: sparse: sparse: shift too big (4294967295) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: 03d7e648fa25961bb92e920e7962710aa72fb409 [225/293] loongarch: drop ranges for definition of ARCH_FORCE_MAX_ORDER
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: loongarch-randconfig-s031-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240615.MsP1EhWl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=03d7e648fa25961bb92e920e7962710aa72fb409
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 03d7e648fa25961bb92e920e7962710aa72fb409
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/of/ kernel/dma/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303240615.MsP1EhWl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_isolation.c:175:31: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_isolation.c:318:52: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_isolation.c:329:22: sparse: sparse: shift count is negative (-1)
   mm/page_isolation.c:338:79: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_isolation.c:535:39: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_isolation.c:582:39: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_isolation.c:649:48: sparse: sparse: shift too big (4294967295) for type unsigned long
--
>> mm/cma.c:119:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/cma.c:190:14: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/cma.c:270:21: sparse: sparse: shift too big (4294967295) for type unsigned long
--
   mm/memory.c:1017:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1810:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1858:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:2360:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:2616:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2913:17: sparse: sparse: context imbalance in 'wp_page_copy' - unexpected unlock
   mm/memory.c:3278:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3345:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:5414:5: sparse: sparse: context imbalance in 'follow_pte' - different lock contexts for basic block
   mm/memory.c:5479:9: sparse: sparse: context imbalance in 'follow_pfn' - unexpected unlock
   mm/memory.c:5509:9: sparse: sparse: context imbalance in 'follow_phys' - unexpected unlock
   mm/memory.c:5543:9: sparse: sparse: context imbalance in 'generic_access_phys' - unexpected unlock
>> mm/memory.c:5814:13: sparse: sparse: shift count is negative (-1)
   mm/memory.c:5866:13: sparse: sparse: shift count is negative (-1)
--
>> mm/compaction.c:229:33: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:282:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:344:55: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:404:14: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:418:15: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:521:39: sparse: sparse: context imbalance in 'compact_unlock_should_abort' - unexpected unlock
   mm/compaction.c:636:39: sparse: sparse: context imbalance in 'isolate_freepages_block' - unexpected unlock
   mm/compaction.c:687:27: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:886:36: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1167:46: sparse: sparse: context imbalance in 'isolate_migratepages_block' - unexpected unlock
   mm/compaction.c:1218:27: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1360:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1415:25: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1424:19: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1586:27: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1776:55: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1805:20: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1890:27: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1308:33: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1309:40: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:2122:14: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:2342:32: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:2347:40: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:2391:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1308:33: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:1309:40: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/compaction.c:2501:28: sparse: sparse: shift too big (4294967295) for type unsigned long
--
   mm/khugepaged.c:847:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?
>> mm/khugepaged.c:2695:27: sparse: sparse: shift too big (4294967295) for type unsigned long
--
>> drivers/of/of_reserved_mem.c:122:25: sparse: sparse: shift too big (4294967295) for type unsigned long
--
>> kernel/dma/contiguous.c:417:14: sparse: sparse: shift too big (4294967295) for type unsigned long

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
https://github.com/intel/lkp-tests
