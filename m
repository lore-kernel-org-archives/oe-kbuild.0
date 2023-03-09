Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4422F28
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678367251; x=1709903251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uE6gy7xRys4NyarnlOO3K0i4t1bT7/VYaoXr80yH4LM=;
  b=Xh8o/k59x+GkAqCoAmxgIuEwr2QhxliqXwRpiJyIDptGvPJvf1RZb5pB
   +8TNrzpoSyfY5IdjRNgrQsnJ0d21iiItcMPsU5QxbzbnWVoDOI4viASVY
   o8HLv+e1lD/x+r6v0RGNqZz01bHOFCjryGUHIJpzfb62Yr5zgM3426l5U
   du0c4yLaxk3cfmVcz9Fo19d7h3fawcjWiLPnY/4J5iPoT9xvh+EHBkLB8
   IIk9axYl/gy0ce5UYp+QXda4g6fHUdp3kodnKanDvbucGiHXct4ZKNpRX
   IJN8URGBsHH460PSxqJefNvhhrscilrb+E+meUILQtGSuqx6aRAetdlu8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337965774"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="337965774"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 05:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707604183"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="707604183"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2023 05:07:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paFzQ-0002xh-1m;
	Thu, 09 Mar 2023 13:07:24 +0000
Date: Thu, 9 Mar 2023 21:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:unmapped-alloc/rfc-v1 1/5] mm/page_alloc.c:5603
 __alloc_pages() warn: bitwise AND condition is false here
Message-ID: <202303092113.6mEyQjN4-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git unmapped-alloc/rfc-v1
head:   d1cc346aca5bb7ab68a248c3f5a3d59b8a9d8319
commit: 93025bb67726c8263d336be7547dd57ef0e59be0 [1/5] mm: intorduce __GFP_UNMAPPED and unmapped_alloc()
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-m031-20230308 (https://download.01.org/0day-ci/archive/20230309/202303092113.6mEyQjN4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303092113.6mEyQjN4-lkp@intel.com/

New smatch warnings:
mm/page_alloc.c:5603 __alloc_pages() warn: bitwise AND condition is false here

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +5603 mm/page_alloc.c

387ba26fb1cb9b Mel Gorman              2021-04-29  5570  
9cd7555875bb09 Mel Gorman              2017-02-24  5571  /*
9cd7555875bb09 Mel Gorman              2017-02-24  5572   * This is the 'heart' of the zoned buddy allocator.
9cd7555875bb09 Mel Gorman              2017-02-24  5573   */
84172f4bb75242 Matthew Wilcox (Oracle  2021-04-29  5574) struct page *__alloc_pages(gfp_t gfp, unsigned int order, int preferred_nid,
04ec6264f28793 Vlastimil Babka         2017-07-06  5575  							nodemask_t *nodemask)
9cd7555875bb09 Mel Gorman              2017-02-24  5576  {
9cd7555875bb09 Mel Gorman              2017-02-24  5577  	struct page *page;
9cd7555875bb09 Mel Gorman              2017-02-24  5578  	unsigned int alloc_flags = ALLOC_WMARK_LOW;
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5579) 	gfp_t alloc_gfp; /* The gfp_t that was actually used for allocation */
9cd7555875bb09 Mel Gorman              2017-02-24  5580  	struct alloc_context ac = { };
9cd7555875bb09 Mel Gorman              2017-02-24  5581  
c63ae43ba53bc4 Michal Hocko            2018-11-16  5582  	/*
c63ae43ba53bc4 Michal Hocko            2018-11-16  5583  	 * There are several places where we assume that the order value is sane
c63ae43ba53bc4 Michal Hocko            2018-11-16  5584  	 * so bail out early if the request is out of bound.
c63ae43ba53bc4 Michal Hocko            2018-11-16  5585  	 */
3f913fc5f97456 Qi Zheng                2022-05-19  5586  	if (WARN_ON_ONCE_GFP(order >= MAX_ORDER, gfp))
c63ae43ba53bc4 Michal Hocko            2018-11-16  5587  		return NULL;
c63ae43ba53bc4 Michal Hocko            2018-11-16  5588  
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5589) 	gfp &= gfp_allowed_mask;
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5590  	/*
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5591  	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5592  	 * resp. GFP_NOIO which has to be inherited for all allocation requests
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5593  	 * from a particular context which has been marked by
8e3560d963d22b Pavel Tatashin          2021-05-04  5594  	 * memalloc_no{fs,io}_{save,restore}. And PF_MEMALLOC_PIN which ensures
8e3560d963d22b Pavel Tatashin          2021-05-04  5595  	 * movable zones are not used during allocation.
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5596  	 */
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5597  	gfp = current_gfp_context(gfp);
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5598) 	alloc_gfp = gfp;
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5599) 	if (!prepare_alloc_pages(gfp, order, preferred_nid, nodemask, &ac,
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5600) 			&alloc_gfp, &alloc_flags))
9cd7555875bb09 Mel Gorman              2017-02-24  5601  		return NULL;
9cd7555875bb09 Mel Gorman              2017-02-24  5602  
93025bb67726c8 Mike Rapoport (IBM      2022-11-17 @5603) 	if (alloc_gfp & __GFP_UNMAPPED) {
93025bb67726c8 Mike Rapoport (IBM      2022-11-17  5604) 		page = unmapped_pages_alloc(gfp, order);
93025bb67726c8 Mike Rapoport (IBM      2022-11-17  5605) 		goto out;
93025bb67726c8 Mike Rapoport (IBM      2022-11-17  5606) 	}
93025bb67726c8 Mike Rapoport (IBM      2022-11-17  5607) 
6bb154504f8b49 Mel Gorman              2018-12-28  5608  	/*
6bb154504f8b49 Mel Gorman              2018-12-28  5609  	 * Forbid the first pass from falling back to types that fragment
6bb154504f8b49 Mel Gorman              2018-12-28  5610  	 * memory until all local zones are considered.
6bb154504f8b49 Mel Gorman              2018-12-28  5611  	 */
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5612) 	alloc_flags |= alloc_flags_nofragment(ac.preferred_zoneref->zone, gfp);
6bb154504f8b49 Mel Gorman              2018-12-28  5613  
5117f45d11a9ee Mel Gorman              2009-06-16  5614  	/* First allocation attempt */
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5615) 	page = get_page_from_freelist(alloc_gfp, order, alloc_flags, &ac);
4fcb0971175f60 Mel Gorman              2016-05-19  5616  	if (likely(page))
4fcb0971175f60 Mel Gorman              2016-05-19  5617  		goto out;
4fcb0971175f60 Mel Gorman              2016-05-19  5618  
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5619  	alloc_gfp = gfp;
c9ab0c4fbeb020 Mel Gorman              2015-11-06  5620  	ac.spread_dirty_pages = false;
91fbdc0f89807b Andrew Morton           2015-02-11  5621  
4741526b83c5d3 Mel Gorman              2016-05-19  5622  	/*
4741526b83c5d3 Mel Gorman              2016-05-19  5623  	 * Restore the original nodemask if it was potentially replaced with
4741526b83c5d3 Mel Gorman              2016-05-19  5624  	 * &cpuset_current_mems_allowed to optimize the fast-path attempt.
4741526b83c5d3 Mel Gorman              2016-05-19  5625  	 */
4741526b83c5d3 Mel Gorman              2016-05-19  5626  	ac.nodemask = nodemask;
16096c25bf0ca5 Vlastimil Babka         2017-01-24  5627  
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5628) 	page = __alloc_pages_slowpath(alloc_gfp, order, &ac);
11e33f6a55ed78 Mel Gorman              2009-06-16  5629  
4fcb0971175f60 Mel Gorman              2016-05-19  5630  out:
f7a449f779608e Roman Gushchin          2023-02-13  5631  	if (memcg_kmem_online() && (gfp & __GFP_ACCOUNT) && page &&
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5632) 	    unlikely(__memcg_kmem_charge_page(page, gfp, order) != 0)) {
4949148ad433f6 Vladimir Davydov        2016-07-26  5633  		__free_pages(page, order);
4949148ad433f6 Vladimir Davydov        2016-07-26  5634  		page = NULL;
4949148ad433f6 Vladimir Davydov        2016-07-26  5635  	}
4949148ad433f6 Vladimir Davydov        2016-07-26  5636  
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5637) 	trace_mm_page_alloc(page, order, alloc_gfp, ac.migratetype);
b073d7f8aee4eb Alexander Potapenko     2022-09-15  5638  	kmsan_alloc_page(page, order, alloc_gfp);
4fcb0971175f60 Mel Gorman              2016-05-19  5639  
11e33f6a55ed78 Mel Gorman              2009-06-16  5640  	return page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  5641  }
84172f4bb75242 Matthew Wilcox (Oracle  2021-04-29  5642) EXPORT_SYMBOL(__alloc_pages);
^1da177e4c3f41 Linus Torvalds          2005-04-16  5643  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
