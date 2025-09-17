Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CE2AD16
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 03:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758081582; cv=none; b=h1PYDt6C60jinbgfHxBVvIe5zLt47OktS/pa/NouLMijze4bwuAnUdT/WC4ib5b7TZJl3oS6M8+kEpMmViX4IwDI8dqWt+Spkux+k8nI8rfDK8dzqvGrEWcdKya1Xxgmk9krwgPyVIReez2Tn5PO0i8EwPXqgvKrytuhjMgchew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758081582; c=relaxed/simple;
	bh=qEqHwh+hhefKoLg7NauZGEBo7tHYWMIO0rjgwC2D27s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0y+v0uTWgVVtN26+GxjpqQHTjEep2fqZP905N48or8SybXUOmRIHF1LO2S6feC7tR2PfiwL4DheSibiHTGNYks148S9D3XPk0/z9IDhqbJhR9h5GbKcCZNCyw567wr7g8+2Vulv5OaDWU+M+ULpnBdXXREfWlyhBUjGkl+Qjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwERup55; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwERup55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758081581; x=1789617581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEqHwh+hhefKoLg7NauZGEBo7tHYWMIO0rjgwC2D27s=;
  b=SwERup55xI+R3ywEfNUU/HyVCa6Q9XcggKP5Dd2QkogbPRwZSa5/JXh9
   ul4yLa2fD6rmG8ccWXDoJhwkfXDFnDxioRoLpBqVTpbmVzmgOeT+fyU1Q
   n7RJA5H5zm75yNp25X/5ERhxbqIgdkpedoMknfyTQiRi7+ANf+FkzkWbe
   LpGCPciBsHcje4pn7jCKvTAMvEdb7IUAQHmm8kpGIYfiIhEvT9GmKq7P1
   bdVmDZ1Q5uOEDhUSd1KCoxIHj1Zd5BSci6Yes9ZtZpZDAjwZxZg2CYQJG
   VJ9LheEyjr20Xr9621HF8ybRB/QiNzBnQvxgpLB/O+PJ5RKfL84tKvnFb
   w==;
X-CSE-ConnectionGUID: VcnjmwX2Q5Oq8dYBh/RCyQ==
X-CSE-MsgGUID: faPLt59XRDu6Gbi1CihCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64178211"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64178211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 20:59:40 -0700
X-CSE-ConnectionGUID: ylr6r1U6Q3K9Atdr4n4WUg==
X-CSE-MsgGUID: D5rtCpeuSgKhZDJiVaXhsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="175555760"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2025 20:59:38 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyjKS-00012B-0I;
	Wed, 17 Sep 2025 03:59:36 +0000
Date: Wed, 17 Sep 2025 11:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/gup.c:2334 collect_longterm_unpinnable_folios() warn: iterator
 'i' not incremented
Message-ID: <202509171145.Q0qzJkxb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Li Zhe <lizhe.67@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5aca7966d2a7255ba92fd5e63268dd767b223aa5
commit: a03db236aebfaeadf79396dbd570896b870bda01 gup: optimize longterm pin_user_pages() for large folio
date:   10 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-161-20250916 (https://download.01.org/0day-ci/archive/20250917/202509171145.Q0qzJkxb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509171145.Q0qzJkxb-lkp@intel.com/

smatch warnings:
mm/gup.c:2334 collect_longterm_unpinnable_folios() warn: iterator 'i' not incremented

vim +/i +2334 mm/gup.c

a03db236aebfae Li Zhe                  2025-06-06  2323  
f68749ec342b5f Pavel Tatashin          2021-05-04  2324  /*
53ba78de064b6a Vivek Kasireddy         2024-06-23  2325   * Returns the number of collected folios. Return value is always >= 0.
f68749ec342b5f Pavel Tatashin          2021-05-04  2326   */
517f496e1e61bd David Hildenbrand       2025-06-11  2327  static unsigned long collect_longterm_unpinnable_folios(
53ba78de064b6a Vivek Kasireddy         2024-06-23  2328  		struct list_head *movable_folio_list,
94efde1d15399f John Hubbard            2024-11-04  2329  		struct pages_or_folios *pofs)
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2330  {
a03db236aebfae Li Zhe                  2025-06-06  2331  	unsigned long collected = 0;
67e139b02d9949 Alistair Popple         2022-08-24  2332  	bool drain_allow = true;
a03db236aebfae Li Zhe                  2025-06-06  2333  	struct folio *folio;
a03db236aebfae Li Zhe                  2025-06-06 @2334  	long i = 0;
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2335  
a03db236aebfae Li Zhe                  2025-06-06  2336  	for (folio = pofs_get_folio(pofs, i); folio;
a03db236aebfae Li Zhe                  2025-06-06  2337  	     folio = pofs_next_folio(folio, pofs, &i)) {
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2338  
67e139b02d9949 Alistair Popple         2022-08-24  2339  		if (folio_is_longterm_pinnable(folio))
67e139b02d9949 Alistair Popple         2022-08-24  2340  			continue;
b05a79d4377f6d Alistair Popple         2022-07-15  2341  
517f496e1e61bd David Hildenbrand       2025-06-11  2342  		collected++;
517f496e1e61bd David Hildenbrand       2025-06-11  2343  
67e139b02d9949 Alistair Popple         2022-08-24  2344  		if (folio_is_device_coherent(folio))
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2345  			continue;
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2346  
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2347) 		if (folio_test_hugetlb(folio)) {
4c640f128074e0 David Hildenbrand       2025-01-13  2348  			folio_isolate_hugetlb(folio, movable_folio_list);
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2349  			continue;
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2350  		}
f9f38f78c5d5ee Christoph Hellwig       2022-02-16  2351  
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2352) 		if (!folio_test_lru(folio) && drain_allow) {
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2353  			lru_add_drain_all();
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2354  			drain_allow = false;
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2355  		}
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2356  
be2d57563822b7 Baolin Wang             2023-02-15  2357  		if (!folio_isolate_lru(folio))
6e7f34ebb8d25d Pavel Tatashin          2021-05-04  2358  			continue;
67e139b02d9949 Alistair Popple         2022-08-24  2359  
53ba78de064b6a Vivek Kasireddy         2024-06-23  2360  		list_add_tail(&folio->lru, movable_folio_list);
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2361) 		node_stat_mod_folio(folio,
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2362) 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
1b7f7e58decccb Matthew Wilcox (Oracle  2022-02-17  2363) 				    folio_nr_pages(folio));
9a4e9f3b2d7393 Aneesh Kumar K.V        2019-03-05  2364  	}
517f496e1e61bd David Hildenbrand       2025-06-11  2365  
517f496e1e61bd David Hildenbrand       2025-06-11  2366  	return collected;
67e139b02d9949 Alistair Popple         2022-08-24  2367  }
67e139b02d9949 Alistair Popple         2022-08-24  2368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
