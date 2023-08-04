Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91811BEE3
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691191977; x=1722727977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/oTC3j+aEjO2C+XA4hUaNYsxtrkesxYH7xZ8dcS4hw=;
  b=ByT0XXWuU11TbxWrIknX6eHANTwzy7XV7Tpfr2/yc1hN3dan7xU+9NL1
   j+LhWkEbiJFHe8R1vHjgq0mNRcG/VmGIRr46fFsnZabXHF29V68TLzlPt
   yCd9K6x9h4y8T5KE+J7BMIomUtCuJGqqqmlm7pUzjqRn7C7IZw0j/jgN1
   tylpjGTi2ZVg3N0wEN+rxHYT6h1FqptGKXoytovnoebkztOvBMqNMVDWx
   RtDH4cxCbI8UPKwKaeVq2JlYZ5u3a4/DVc7vDRXVEEWneySDfk6jCt60R
   jfmWsUzIB+nyzcB65qus/ewGC0IyeVdYxqjC1AfREMAUuBqM5FHVbSUnl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350576741"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350576741"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="680142301"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="680142301"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 16:32:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS4Hv-0003C0-0E;
	Fri, 04 Aug 2023 23:32:55 +0000
Date: Sat, 5 Aug 2023 07:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] minmax: Relax check to allow comparison between
 int and small unsigned constants.
Message-ID: <202308050755.WN8F8zt9-lkp@intel.com>
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
In-Reply-To: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
References: <b6a49ed73aba427ca8bb433763fa94e9@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>
TO: "'Linus Torvalds'" <torvalds@linux-foundation.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on crng-random/master v6.5-rc4 next-20230804]
[cannot apply to next-20230804 akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-min_unsigned-a-b-and-max_unsigned-a-b/20230804-190414
base:   linus/master
patch link:    https://lore.kernel.org/r/b6a49ed73aba427ca8bb433763fa94e9%40AcuMS.aculab.com
patch subject: [PATCH v3 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-x062-20230730 (https://download.01.org/0day-ci/archive/20230805/202308050755.WN8F8zt9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050755.WN8F8zt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050755.WN8F8zt9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_isolation.c:175:31: sparse: sparse: too long token expansion
>> mm/page_isolation.c:175:31: sparse: sparse: too long token expansion
--
>> net/sunrpc/auth_gss/svcauth_gss.c:1113:26: sparse: sparse: too long token expansion
>> net/sunrpc/auth_gss/svcauth_gss.c:1113:26: sparse: sparse: too long token expansion
--
>> drivers/mtd/nand/raw/denali.c:902:20: sparse: sparse: too long token expansion
>> drivers/mtd/nand/raw/denali.c:902:20: sparse: sparse: too long token expansion

vim +175 mm/page_isolation.c

b48d8a8e5ce53e3 Zi Yan                    2022-05-12  141  
844fbae63e468e3 Zi Yan                    2022-05-12  142  /*
844fbae63e468e3 Zi Yan                    2022-05-12  143   * This function set pageblock migratetype to isolate if no unmovable page is
844fbae63e468e3 Zi Yan                    2022-05-12  144   * present in [start_pfn, end_pfn). The pageblock must intersect with
844fbae63e468e3 Zi Yan                    2022-05-12  145   * [start_pfn, end_pfn).
844fbae63e468e3 Zi Yan                    2022-05-12  146   */
844fbae63e468e3 Zi Yan                    2022-05-12  147  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
844fbae63e468e3 Zi Yan                    2022-05-12  148  			unsigned long start_pfn, unsigned long end_pfn)
ee6f509c3274014 Minchan Kim               2012-07-31  149  {
1c31cb493c31441 David Hildenbrand         2020-10-13  150  	struct zone *zone = page_zone(page);
1c31cb493c31441 David Hildenbrand         2020-10-13  151  	struct page *unmovable;
3f9903b9ca5e981 David Hildenbrand         2020-01-30  152  	unsigned long flags;
844fbae63e468e3 Zi Yan                    2022-05-12  153  	unsigned long check_unmovable_start, check_unmovable_end;
ee6f509c3274014 Minchan Kim               2012-07-31  154  
ee6f509c3274014 Minchan Kim               2012-07-31  155  	spin_lock_irqsave(&zone->lock, flags);
ee6f509c3274014 Minchan Kim               2012-07-31  156  
2c7452a075d4db2 Mike Kravetz              2018-04-05  157  	/*
2c7452a075d4db2 Mike Kravetz              2018-04-05  158  	 * We assume the caller intended to SET migrate type to isolate.
2c7452a075d4db2 Mike Kravetz              2018-04-05  159  	 * If it is already set, then someone else must have raced and
51030a53d81e308 David Hildenbrand         2020-10-13  160  	 * set it before us.
2c7452a075d4db2 Mike Kravetz              2018-04-05  161  	 */
51030a53d81e308 David Hildenbrand         2020-10-13  162  	if (is_migrate_isolate_page(page)) {
51030a53d81e308 David Hildenbrand         2020-10-13  163  		spin_unlock_irqrestore(&zone->lock, flags);
51030a53d81e308 David Hildenbrand         2020-10-13  164  		return -EBUSY;
51030a53d81e308 David Hildenbrand         2020-10-13  165  	}
2c7452a075d4db2 Mike Kravetz              2018-04-05  166  
ee6f509c3274014 Minchan Kim               2012-07-31  167  	/*
ee6f509c3274014 Minchan Kim               2012-07-31  168  	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
ee6f509c3274014 Minchan Kim               2012-07-31  169  	 * We just check MOVABLE pages.
844fbae63e468e3 Zi Yan                    2022-05-12  170  	 *
844fbae63e468e3 Zi Yan                    2022-05-12  171  	 * Pass the intersection of [start_pfn, end_pfn) and the page's pageblock
844fbae63e468e3 Zi Yan                    2022-05-12  172  	 * to avoid redundant checks.
ee6f509c3274014 Minchan Kim               2012-07-31  173  	 */
844fbae63e468e3 Zi Yan                    2022-05-12  174  	check_unmovable_start = max(page_to_pfn(page), start_pfn);
4f9bc69ac5ce340 Kefeng Wang               2022-09-07 @175  	check_unmovable_end = min(pageblock_end_pfn(page_to_pfn(page)),
844fbae63e468e3 Zi Yan                    2022-05-12  176  				  end_pfn);
844fbae63e468e3 Zi Yan                    2022-05-12  177  
844fbae63e468e3 Zi Yan                    2022-05-12  178  	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
844fbae63e468e3 Zi Yan                    2022-05-12  179  			migratetype, isol_flags);
4a55c0474a92d5c Qian Cai                  2020-01-30  180  	if (!unmovable) {
2139cbe627b8910 Bartlomiej Zolnierkiewicz 2012-10-08  181  		unsigned long nr_pages;
4da2ce250f98606 Michal Hocko              2017-11-15  182  		int mt = get_pageblock_migratetype(page);
2139cbe627b8910 Bartlomiej Zolnierkiewicz 2012-10-08  183  
a458431e176ddb2 Bartlomiej Zolnierkiewicz 2013-01-04  184  		set_pageblock_migratetype(page, MIGRATE_ISOLATE);
ad53f92eb416d81 Joonsoo Kim               2014-11-13  185  		zone->nr_isolate_pageblock++;
02aa0cdd72483c6 Vlastimil Babka           2017-05-08  186  		nr_pages = move_freepages_block(zone, page, MIGRATE_ISOLATE,
02aa0cdd72483c6 Vlastimil Babka           2017-05-08  187  									NULL);
2139cbe627b8910 Bartlomiej Zolnierkiewicz 2012-10-08  188  
4da2ce250f98606 Michal Hocko              2017-11-15  189  		__mod_zone_freepage_state(zone, -nr_pages, mt);
1c31cb493c31441 David Hildenbrand         2020-10-13  190  		spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c31441 David Hildenbrand         2020-10-13  191  		return 0;
ee6f509c3274014 Minchan Kim               2012-07-31  192  	}
ee6f509c3274014 Minchan Kim               2012-07-31  193  
ee6f509c3274014 Minchan Kim               2012-07-31  194  	spin_unlock_irqrestore(&zone->lock, flags);
1c31cb493c31441 David Hildenbrand         2020-10-13  195  	if (isol_flags & REPORT_FAILURE) {
4a55c0474a92d5c Qian Cai                  2020-01-30  196  		/*
3d680bdf60a5bad Qian Cai                  2020-01-30  197  		 * printk() with zone->lock held will likely trigger a
4a55c0474a92d5c Qian Cai                  2020-01-30  198  		 * lockdep splat, so defer it here.
4a55c0474a92d5c Qian Cai                  2020-01-30  199  		 */
4a55c0474a92d5c Qian Cai                  2020-01-30  200  		dump_page(unmovable, "unmovable page");
3d680bdf60a5bad Qian Cai                  2020-01-30  201  	}
4a55c0474a92d5c Qian Cai                  2020-01-30  202  
1c31cb493c31441 David Hildenbrand         2020-10-13  203  	return -EBUSY;
ee6f509c3274014 Minchan Kim               2012-07-31  204  }
ee6f509c3274014 Minchan Kim               2012-07-31  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
