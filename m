Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01611F5858
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087654; cv=none; b=MzaM8o4VmtDwC1/qaz8FXZjW+1ObeeJSC/403kUDcqMl78firn1M4Iji2aMqV9QX8fS6AGUsgwnLmMEQAJ3UgCkhQJTA5sb3QmFeUVoVkn8ItRywDqAnwK1Okw/y3U6hXTgQsXJqugQ9314Ic1wMnLtSGDxjqDZS7BBKKXiES0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087654; c=relaxed/simple;
	bh=Kqj+H2t+WCezPazfF7bufDvJ8H8gplSn5brJ243iX4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=afiVdFqgurbuc/Pii1Lh+od4lsj6/GIKzUCkN7XYxmQ4vJeYFXd2KLtlSIqqNsORcctL3uYKc5OXJqcmb3H6KTQs7w3Ne3zb7KZiAizvif0LCIgxCEN1ZXF6t1u2quidSz1OvZIuyWQb2FN35Cx7+S8GaZ0OnpOa6cw4AKtZPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX1EF6eU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX1EF6eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767087652; x=1798623652;
  h=date:from:to:cc:subject:message-id;
  bh=Kqj+H2t+WCezPazfF7bufDvJ8H8gplSn5brJ243iX4o=;
  b=RX1EF6eUSmDTs2/pIw8Df7ePw6I1g1WzRBXpOLcNulSV1DGIxXMOe7Ao
   wexkOOrtroX/SZgLaFgS/wSCAtgAyNfty4esgfgnrNv2LH/2Mwpm3AH3k
   ya16F6vOrSskUBMTDOLKr+VFlF5lQtbiZ+alsROZHnvVnCZ5LXW3Vjqod
   EOsRgLg0EH9ez2MlZU0Ga3Dy1Xsvh31Sb2b331of1miyrGuyvLxFhT2FI
   WyQ8NKtSJLgdeoPg1zGVToapLbpvC9B+XT11aBTNim+RdKFV9dtRyZlE2
   QWg5xUYaVJge8PtNxYs85InPGId1XqGS2pHkTY5OqcvuF8fn9h7FK7d6+
   w==;
X-CSE-ConnectionGUID: b4Q1JdteTd6uh/vJP5/XXg==
X-CSE-MsgGUID: yd3x0LWiTou/1Nav9NoLqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68569478"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="68569478"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 01:40:51 -0800
X-CSE-ConnectionGUID: TeI1NiiAQXyzoxV39dtM5g==
X-CSE-MsgGUID: ZUOTsY4KQ2m8gOsAzKV6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200817266"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2025 01:40:50 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaWDg-000000000Hn-0iYs;
	Tue, 30 Dec 2025 09:40:48 +0000
Date: Tue, 30 Dec 2025 17:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/gup.c:2334 collect_longterm_unpinnable_folios() warn:
 iterator 'i' not incremented
Message-ID: <202512301715.0bHwlz2h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Li Zhe <lizhe.67@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: a03db236aebfaeadf79396dbd570896b870bda01 gup: optimize longterm pin_user_pages() for large folio
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r073-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301715.0bHwlz2h-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512301715.0bHwlz2h-lkp@intel.com/

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
