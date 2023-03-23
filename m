Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35B9A950
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679591564; x=1711127564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Auhq6loyjum9mUiANGRkpCIS0ZF0FrHQWxUeGIg28ok=;
  b=HbuCs2oYioF/v7YSv7aFNCAOrJoRX33ljgC5H8V0OkO9VSXce2KxVNCK
   ih5s0fhZNkmv3WFy0ndpuJBj1sdvSaBLFX43171hFZqo5g87hl31okJTx
   CUH1ANHVYQiE1h03N3sEtEfEDm1PVhm4bMYKGy9SqkvPFPgb5O3pJgBhF
   lmw8LKL79qva8BfP6yR0uuu1iWp3KAJG2JJbeVBjzF3YaFUc7MsDKx7+K
   fI2Bq1Ot/eGqptdDOSX/bXV06SU43c+jysRFLYgZBgNlNZhWd8/Nh348p
   KEbOrkrJ7k/ERFYJzg7EEo9eCoRfqEjwtjwnC5T2qrQbct0Pmy3o+cgie
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338283313"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="338283313"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="825909473"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="825909473"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 10:12:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfOUO-000EZA-0P;
	Thu, 23 Mar 2023 17:12:36 +0000
Date: Fri, 24 Mar 2023 01:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 220/293] mm/vmstat.c:1556:53: sparse: sparse:
 shift too big (4294967295) for type unsigned long
Message-ID: <202303240107.qf5g0qKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/vmstat.c:1556:53: sparse: sparse: shift too big (4294967295) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: 98d56389a5e38b3801f2762d6db67dab6536032a [220/293] mm, treewide: redefine MAX_ORDER sanely
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc-randconfig-s052-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240107.qf5g0qKq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=98d56389a5e38b3801f2762d6db67dab6536032a
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 98d56389a5e38b3801f2762d6db67dab6536032a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash drivers/base/regmap/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303240107.qf5g0qKq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/vmstat.c:1459:47: sparse: sparse: context imbalance in 'walk_zones_in_node' - unexpected unlock
>> mm/vmstat.c:1556:53: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/vmstat.c:1632:50: sparse: sparse: shift too big (4294967295) for type unsigned long
--
>> mm/page_owner.c:302:33: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_owner.c:298:31: sparse: sparse: shift count is negative (-1)
   mm/page_owner.c:424:32: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_owner.c:640:33: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_owner.c:636:31: sparse: sparse: shift count is negative (-1)
--
>> mm/page_alloc.c:524:24: sparse: sparse: shift too big (4294967295) for type unsigned long
>> mm/page_alloc.c:524:24: sparse: sparse: shift too big (4294967295) for type unsigned long
>> mm/page_alloc.c:524:24: sparse: sparse: shift too big (4294967295) for type unsigned long
>> mm/page_alloc.c:524:24: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:1843:25: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:1878:25: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:1909:13: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:1909:13: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2011:32: sparse: sparse: shift count is negative (-1)
   mm/page_alloc.c:2594:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2614:35: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2663:14: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2748:39: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2762:63: sparse: sparse: shift count is negative (-2)
   mm/page_alloc.c:2820:58: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2870:41: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:2896:65: sparse: sparse: shift too big (4294967295) for type unsigned long
>> mm/page_alloc.c:524:24: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:3385:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:3504:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:3559:48: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:3710:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5450:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   mm/page_alloc.c:6638:31: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:6736:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:6917:32: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/page_alloc.c:8076:25: sparse: sparse: shift count is negative (-1)
   mm/page_alloc.c:8187:25: sparse: sparse: shift count is negative (-1)
--
>> drivers/base/regmap/regmap-debugfs.c:229:35: sparse: sparse: shift too big (4294967295) for type unsigned long
   drivers/base/regmap/regmap-debugfs.c:376:35: sparse: sparse: shift too big (4294967295) for type unsigned long

vim +1556 mm/vmstat.c

467c996c1e1910 Mel Gorman     2007-10-16  1546  
467c996c1e1910 Mel Gorman     2007-10-16  1547  static void pagetypeinfo_showblockcount_print(struct seq_file *m,
467c996c1e1910 Mel Gorman     2007-10-16  1548  					pg_data_t *pgdat, struct zone *zone)
467c996c1e1910 Mel Gorman     2007-10-16  1549  {
467c996c1e1910 Mel Gorman     2007-10-16  1550  	int mtype;
467c996c1e1910 Mel Gorman     2007-10-16  1551  	unsigned long pfn;
467c996c1e1910 Mel Gorman     2007-10-16  1552  	unsigned long start_pfn = zone->zone_start_pfn;
108bcc96ef7047 Cody P Schafer 2013-02-22  1553  	unsigned long end_pfn = zone_end_pfn(zone);
467c996c1e1910 Mel Gorman     2007-10-16  1554  	unsigned long count[MIGRATE_TYPES] = { 0, };
467c996c1e1910 Mel Gorman     2007-10-16  1555  
467c996c1e1910 Mel Gorman     2007-10-16 @1556  	for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages) {
467c996c1e1910 Mel Gorman     2007-10-16  1557  		struct page *page;
467c996c1e1910 Mel Gorman     2007-10-16  1558  
d336e94e448a51 Michal Hocko   2017-07-06  1559  		page = pfn_to_online_page(pfn);
d336e94e448a51 Michal Hocko   2017-07-06  1560  		if (!page)
467c996c1e1910 Mel Gorman     2007-10-16  1561  			continue;
467c996c1e1910 Mel Gorman     2007-10-16  1562  
a91c43c7313a99 Joonsoo Kim    2016-05-19  1563  		if (page_zone(page) != zone)
a91c43c7313a99 Joonsoo Kim    2016-05-19  1564  			continue;
a91c43c7313a99 Joonsoo Kim    2016-05-19  1565  
467c996c1e1910 Mel Gorman     2007-10-16  1566  		mtype = get_pageblock_migratetype(page);
467c996c1e1910 Mel Gorman     2007-10-16  1567  
e80d6a24829872 Mel Gorman     2008-08-14  1568  		if (mtype < MIGRATE_TYPES)
467c996c1e1910 Mel Gorman     2007-10-16  1569  			count[mtype]++;
467c996c1e1910 Mel Gorman     2007-10-16  1570  	}
467c996c1e1910 Mel Gorman     2007-10-16  1571  
467c996c1e1910 Mel Gorman     2007-10-16  1572  	/* Print counts */
467c996c1e1910 Mel Gorman     2007-10-16  1573  	seq_printf(m, "Node %d, zone %8s ", pgdat->node_id, zone->name);
467c996c1e1910 Mel Gorman     2007-10-16  1574  	for (mtype = 0; mtype < MIGRATE_TYPES; mtype++)
467c996c1e1910 Mel Gorman     2007-10-16  1575  		seq_printf(m, "%12lu ", count[mtype]);
467c996c1e1910 Mel Gorman     2007-10-16  1576  	seq_putc(m, '\n');
467c996c1e1910 Mel Gorman     2007-10-16  1577  }
467c996c1e1910 Mel Gorman     2007-10-16  1578  

:::::: The code at line 1556 was first introduced by commit
:::::: 467c996c1e1910633fa8e7adc9b052aa3ed5f97c Print out statistics in relation to fragmentation avoidance to /proc/pagetypeinfo

:::::: TO: Mel Gorman <mel@csn.ul.ie>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
