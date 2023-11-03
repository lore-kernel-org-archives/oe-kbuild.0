Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784D2421A
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 23:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNLvPLu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699053134; x=1730589134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6IGTro9cfgkArIxLLjx1R5bRe70JWzBHCUNNK9lgOw=;
  b=aNLvPLu4k8MoBib+Et465AjP0TMm6TQLP+lppe/uf8DLkOUvCRwNQqSr
   wFaPzAE+uOQIo7cV6oAUDJBY8VtV4LwBPi5yZ84NkyOS7uQw20CapEqNx
   VUmMAfI3poUu9rEdiNINUChO2k9EtBPDxvUX1rESqYoRAaAudpqqONdGb
   TPip9fUizikWnMWAmndLH1YRc0M/vbMMbZnmmm99xaKRg6mktWP82VXwv
   TpRnWpZ0+OdkbQFjEpfAdyxF4ZQ84CPZjVZPqrB25JM7/zbS+zQPjZHzD
   U07WqqgdBh0HKDCgbJNbySkZrBhC1ZVNMWZ4/thdsgP48QxDcB6nwoZDT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10575659"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="10575659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765402778"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765402778"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 16:12:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz3Kj-00032a-0m;
	Fri, 03 Nov 2023 23:12:09 +0000
Date: Sat, 4 Nov 2023 07:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/compaction.c:1436:21: sparse: sparse: too long token expansion
Message-ID: <202311040738.KHS54jWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/compaction.c:1436:21: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: 4ead534fba42fc4fd41163297528d2aa731cd121 minmax: allow comparisons of 'int' against 'unsigned char/short'
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040738.KHS54jWu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040738.KHS54jWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311040738.KHS54jWu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/compaction.c:1436:21: sparse: sparse: too long token expansion
>> mm/compaction.c:1436:21: sparse: sparse: too long token expansion
   mm/compaction.c:1532:43: sparse: sparse: too long token expansion
   mm/compaction.c:1532:43: sparse: sparse: too long token expansion
   mm/compaction.c:2511:45: sparse: sparse: too long token expansion
   mm/compaction.c:2511:45: sparse: sparse: too long token expansion

vim +1436 mm/compaction.c

70b44595eafe9c Mel Gorman        2019-03-05  1420  
5a811889de10f1 Mel Gorman        2019-03-05  1421  static void
be21b32afe470c NARIBAYASHI Akira 2022-10-26  1422  fast_isolate_around(struct compact_control *cc, unsigned long pfn)
5a811889de10f1 Mel Gorman        2019-03-05  1423  {
5a811889de10f1 Mel Gorman        2019-03-05  1424  	unsigned long start_pfn, end_pfn;
6e2b7044c19922 Vlastimil Babka   2021-02-24  1425  	struct page *page;
5a811889de10f1 Mel Gorman        2019-03-05  1426  
5a811889de10f1 Mel Gorman        2019-03-05  1427  	/* Do not search around if there are enough pages already */
5a811889de10f1 Mel Gorman        2019-03-05  1428  	if (cc->nr_freepages >= cc->nr_migratepages)
5a811889de10f1 Mel Gorman        2019-03-05  1429  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1430  
5a811889de10f1 Mel Gorman        2019-03-05  1431  	/* Minimise scanning during async compaction */
5a811889de10f1 Mel Gorman        2019-03-05  1432  	if (cc->direct_compaction && cc->mode == MIGRATE_ASYNC)
5a811889de10f1 Mel Gorman        2019-03-05  1433  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1434  
5a811889de10f1 Mel Gorman        2019-03-05  1435  	/* Pageblock boundaries */
6e2b7044c19922 Vlastimil Babka   2021-02-24 @1436  	start_pfn = max(pageblock_start_pfn(pfn), cc->zone->zone_start_pfn);
6e2b7044c19922 Vlastimil Babka   2021-02-24  1437  	end_pfn = min(pageblock_end_pfn(pfn), zone_end_pfn(cc->zone));
6e2b7044c19922 Vlastimil Babka   2021-02-24  1438  
6e2b7044c19922 Vlastimil Babka   2021-02-24  1439  	page = pageblock_pfn_to_page(start_pfn, end_pfn, cc->zone);
6e2b7044c19922 Vlastimil Babka   2021-02-24  1440  	if (!page)
6e2b7044c19922 Vlastimil Babka   2021-02-24  1441  		return;
5a811889de10f1 Mel Gorman        2019-03-05  1442  
4fca9730c51d51 Mel Gorman        2019-03-05  1443  	isolate_freepages_block(cc, &start_pfn, end_pfn, &cc->freepages, 1, false);
5a811889de10f1 Mel Gorman        2019-03-05  1444  
5a811889de10f1 Mel Gorman        2019-03-05  1445  	/* Skip this pageblock in the future as it's full or nearly full */
18c59d58baa60a Kemeng Shi        2023-08-04  1446  	if (start_pfn == end_pfn && !cc->no_set_skip_hint)
5a811889de10f1 Mel Gorman        2019-03-05  1447  		set_pageblock_skip(page);
5a811889de10f1 Mel Gorman        2019-03-05  1448  }
5a811889de10f1 Mel Gorman        2019-03-05  1449  

:::::: The code at line 1436 was first introduced by commit
:::::: 6e2b7044c199229a3d20cefbd3184968238c4184 mm, compaction: make fast_isolate_freepages() stay within zone

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
