Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4DE157A46
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848940; cv=none; b=WbO0zWT60gmZfmx7xEQfrMnHHyePQUECUXFDKBs6lJ4I6M2GIaL5K2asi2YDL2zXEMUOopmZ3KjXpAWq3JZfzsh1BLyqWvdyYaZ+4vAWWy3hMTm1JgLsoQxlVXS5DnBc3CbCHFcJPfuaBJfSTO572D5qjY1WgK97P2UgZ8NY2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848940; c=relaxed/simple;
	bh=PcGnJFTsGEb4Oonh3R9PUmTErXELjIgq731eGDBUP+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8uTQ1jpUwj+SN1N8SjKupA5SgwI0V9L1pn2mTso/mYFi+Xf18ndjh+IRdiEdI18Fur6c308e0gMkri7+j/FVC0scqSJv2XhtJrpSaRHmBIPLr/Cj1k5f+kGSVzC3SrcqAoTQTmI7t1HW/Tqe7vNWZ+73DgZVPyvbRQI+aEUjY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwuFM4t/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwuFM4t/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742848938; x=1774384938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcGnJFTsGEb4Oonh3R9PUmTErXELjIgq731eGDBUP+A=;
  b=dwuFM4t/B9ti9nv+OmF04Q+mjVwumJhWjlP4gxRUt3RMPhMfQ6mlodNR
   tOGaqPlzgt6wC5f+NY9oSDyWBwUQ0U4QCQLMZRASkWOqwMiqTCS2QhXbl
   0JJTWAbDRIlOIPKit6yqjkQg8zBEtm5Xe7Az6R8boCHP+951gx87Ya3o8
   uHjLnUZutZQzO9+ty40JQ9IgKyxMTtE5iUBrXnVVpflezkd/euVf+qBmf
   xkZ1nq6wlYJVN79SrAR3AQLf2M1i31P7mR6EWv7wsHzqNwOW8wHacT1WI
   aUYdYOsugUs3AntIzpTChp+UWtbefWgm26RL3+XQYeelLFCjFzliw6kO8
   A==;
X-CSE-ConnectionGUID: NqjvELaLTRGDt1kHQHasyw==
X-CSE-MsgGUID: HE8sm4QFRy2QJ4qBwQXOVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44260574"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="44260574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 13:42:17 -0700
X-CSE-ConnectionGUID: wiVEr1bqQt6eE+zY4MOEaA==
X-CSE-MsgGUID: J8A6tZ2MSjOw4jEkYSl7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="124126388"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2025 13:42:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twocJ-0003uq-0c;
	Mon, 24 Mar 2025 20:41:58 +0000
Date: Tue, 25 Mar 2025 04:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 49/49] mm/page_alloc.c:5017
 __alloc_pages_noprof() error: uninitialized symbol 'page'.
Message-ID: <202503250434.sOUTIJHq-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6e7c4f83f7fd9833eff3810fb12474c1541ba62c
commit: 6579112b580b27c956836336526630e0876114fd [49/49] ANDROID: page_alloc: add new vendor hook to try alloc pages with gfp
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250434.sOUTIJHq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503250434.sOUTIJHq-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:5017 __alloc_pages_noprof() error: uninitialized symbol 'page'.

vim +/page +5017 mm/page_alloc.c

387ba26fb1cb9b Mel Gorman              2021-04-29  4982  
9cd7555875bb09 Mel Gorman              2017-02-24  4983  /*
9cd7555875bb09 Mel Gorman              2017-02-24  4984   * This is the 'heart' of the zoned buddy allocator.
9cd7555875bb09 Mel Gorman              2017-02-24  4985   */
b951aaff503502 Suren Baghdasaryan      2024-03-21  4986  struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order,
b951aaff503502 Suren Baghdasaryan      2024-03-21  4987  				      int preferred_nid, nodemask_t *nodemask)
9cd7555875bb09 Mel Gorman              2017-02-24  4988  {
9cd7555875bb09 Mel Gorman              2017-02-24  4989  	struct page *page;
9cd7555875bb09 Mel Gorman              2017-02-24  4990  	unsigned int alloc_flags = ALLOC_WMARK_LOW;
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  4991) 	gfp_t alloc_gfp; /* The gfp_t that was actually used for allocation */
9cd7555875bb09 Mel Gorman              2017-02-24  4992  	struct alloc_context ac = { };
9cd7555875bb09 Mel Gorman              2017-02-24  4993  
5c06e6f0f8166d qinglin.li              2025-01-03  4994  	trace_android_vh_alloc_pages_entry(&gfp, order, preferred_nid, nodemask);
c63ae43ba53bc4 Michal Hocko            2018-11-16  4995  	/*
c63ae43ba53bc4 Michal Hocko            2018-11-16  4996  	 * There are several places where we assume that the order value is sane
c63ae43ba53bc4 Michal Hocko            2018-11-16  4997  	 * so bail out early if the request is out of bound.
c63ae43ba53bc4 Michal Hocko            2018-11-16  4998  	 */
5e0a760b44417f Kirill A. Shutemov      2023-12-28  4999  	if (WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp))
c63ae43ba53bc4 Michal Hocko            2018-11-16  5000  		return NULL;
c63ae43ba53bc4 Michal Hocko            2018-11-16  5001  
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5002) 	gfp &= gfp_allowed_mask;
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5003  	/*
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5004  	 * Apply scoped allocation constraints. This is mainly about GFP_NOFS
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5005  	 * resp. GFP_NOIO which has to be inherited for all allocation requests
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5006  	 * from a particular context which has been marked by
8e3560d963d22b Pavel Tatashin          2021-05-04  5007  	 * memalloc_no{fs,io}_{save,restore}. And PF_MEMALLOC_PIN which ensures
8e3560d963d22b Pavel Tatashin          2021-05-04  5008  	 * movable zones are not used during allocation.
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5009  	 */
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5010  	gfp = current_gfp_context(gfp);
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5011) 	alloc_gfp = gfp;
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5012) 	if (!prepare_alloc_pages(gfp, order, preferred_nid, nodemask, &ac,
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5013) 			&alloc_gfp, &alloc_flags))
9cd7555875bb09 Mel Gorman              2017-02-24  5014  		return NULL;
9cd7555875bb09 Mel Gorman              2017-02-24  5015  
6579112b580b27 Sooyong Suk             2024-08-01  5016  	trace_android_rvh_try_alloc_pages_gfp(&page, order, gfp, gfp_zone(gfp));
6579112b580b27 Sooyong Suk             2024-08-01 @5017  	if (page)
6579112b580b27 Sooyong Suk             2024-08-01  5018  		goto out;
6bb154504f8b49 Mel Gorman              2018-12-28  5019  	/*
6bb154504f8b49 Mel Gorman              2018-12-28  5020  	 * Forbid the first pass from falling back to types that fragment
6bb154504f8b49 Mel Gorman              2018-12-28  5021  	 * memory until all local zones are considered.
6bb154504f8b49 Mel Gorman              2018-12-28  5022  	 */
29943248af0a8a Wei Yang                2024-07-29  5023  	alloc_flags |= alloc_flags_nofragment(zonelist_zone(ac.preferred_zoneref), gfp);
6bb154504f8b49 Mel Gorman              2018-12-28  5024  
5117f45d11a9ee Mel Gorman              2009-06-16  5025  	/* First allocation attempt */
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5026) 	page = get_page_from_freelist(alloc_gfp, order, alloc_flags, &ac);
4fcb0971175f60 Mel Gorman              2016-05-19  5027  	if (likely(page))
4fcb0971175f60 Mel Gorman              2016-05-19  5028  		goto out;
4fcb0971175f60 Mel Gorman              2016-05-19  5029  
da6df1b0fcfa97 Pavel Tatashin          2021-05-04  5030  	alloc_gfp = gfp;
c9ab0c4fbeb020 Mel Gorman              2015-11-06  5031  	ac.spread_dirty_pages = false;
91fbdc0f89807b Andrew Morton           2015-02-11  5032  
4741526b83c5d3 Mel Gorman              2016-05-19  5033  	/*
4741526b83c5d3 Mel Gorman              2016-05-19  5034  	 * Restore the original nodemask if it was potentially replaced with
4741526b83c5d3 Mel Gorman              2016-05-19  5035  	 * &cpuset_current_mems_allowed to optimize the fast-path attempt.
4741526b83c5d3 Mel Gorman              2016-05-19  5036  	 */
4741526b83c5d3 Mel Gorman              2016-05-19  5037  	ac.nodemask = nodemask;
16096c25bf0ca5 Vlastimil Babka         2017-01-24  5038  
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5039) 	page = __alloc_pages_slowpath(alloc_gfp, order, &ac);
11e33f6a55ed78 Mel Gorman              2009-06-16  5040  
4fcb0971175f60 Mel Gorman              2016-05-19  5041  out:
f7a449f779608e Roman Gushchin          2023-02-13  5042  	if (memcg_kmem_online() && (gfp & __GFP_ACCOUNT) && page &&
6e5e0f286eb0ec Matthew Wilcox (Oracle  2021-04-29  5043) 	    unlikely(__memcg_kmem_charge_page(page, gfp, order) != 0)) {
4949148ad433f6 Vladimir Davydov        2016-07-26  5044  		__free_pages(page, order);
4949148ad433f6 Vladimir Davydov        2016-07-26  5045  		page = NULL;
4949148ad433f6 Vladimir Davydov        2016-07-26  5046  	}
4949148ad433f6 Vladimir Davydov        2016-07-26  5047  
8e6a930bb3ea6a Matthew Wilcox (Oracle  2021-04-29  5048) 	trace_mm_page_alloc(page, order, alloc_gfp, ac.migratetype);
b073d7f8aee4eb Alexander Potapenko     2022-09-15  5049  	kmsan_alloc_page(page, order, alloc_gfp);
4fcb0971175f60 Mel Gorman              2016-05-19  5050  
11e33f6a55ed78 Mel Gorman              2009-06-16  5051  	return page;
^1da177e4c3f41 Linus Torvalds          2005-04-16  5052  }
b951aaff503502 Suren Baghdasaryan      2024-03-21  5053  EXPORT_SYMBOL(__alloc_pages_noprof);
^1da177e4c3f41 Linus Torvalds          2005-04-16  5054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
