Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D728A2BF
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Feb 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465704; cv=none; b=ZpSpBiMF/0jmQo8VD0GHcSzfFhL3PBv8LSsztwhRKzvcBI2jm3r2ZS1tMtrPT6NlnUdYdQrioFazyEvSCW02yw1tn4f2wCSy0punKNz0yi45VeOoFZLnsXkC2sw4rzgOUgvPcAnquI35dUpBG8oIJpUOCmY79AhkS6BVUSFhkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465704; c=relaxed/simple;
	bh=ktm7ZWw5zBDblqkRAT24x0kYR/gMmk9XMXRaZ+sntWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPKLQgxWPawAG1bvz2xbJEOQnPS5sVCaHcpCe06tTbgqjlUEdSNZYLBxr0/EyJN1nSpgRq5FpqUePe7Z4qP0BtFsaGlX5CrRfsNFoc+JEPIRraj7IcKCnBkVo0KUuhOrEBGPh6zBEtyivt6P8lf7bLlJyYzYq1ADk0zkTgb+Zqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNgQhMgk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNgQhMgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739465703; x=1771001703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ktm7ZWw5zBDblqkRAT24x0kYR/gMmk9XMXRaZ+sntWs=;
  b=GNgQhMgkl1qdc6dbuqvD8IGqLg17VKXE+0Kc0dbm6zMah1BSrBqw1Irx
   TBZbPVPQcLTJbRQUOjFAhtJNxgqlOveEz5PzGfeNNLGqbwfHkDpx0tF+1
   v+xJ9HP8DhETPYUMcLIvD+vK5Zh0L2SqRMjIBNh5SNC4OX3tj6kx9yhbm
   Vp3lV8zcrR6PwPoEAr/TOXe2ZDZ1DtUGrYvo/gEG8IWzGo6uxZSvfqw1A
   K3LucnuCPjVUZY698YpgDQEWZ8PObYjrvQdxNs+5JZ0yHi3YLol2nrZWe
   y2dRWbn0SntMooC4etA+HGwdmpuU2tvGYbg7UFDlGoPFKp99VgLkLEDUG
   A==;
X-CSE-ConnectionGUID: jhhoby5WRb2/P998rCOSrw==
X-CSE-MsgGUID: N47ydPLiSkmEks1fDZSkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40296559"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40296559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:55:02 -0800
X-CSE-ConnectionGUID: PYh7D0rsRTC7Y3AmnVdm4Q==
X-CSE-MsgGUID: hc9o9z62SsqhjQBOn9D4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118397266"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2025 08:55:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ticUM-0018SL-1j;
	Thu, 13 Feb 2025 16:54:58 +0000
Date: Fri, 14 Feb 2025 00:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2994/3437] mm/damon/paddr.c:310
 damon_pa_pageout() error: uninitialized symbol 'folio'.
Message-ID: <202502140033.3Iu9sbzq-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
commit: 66053c85f7e592c3ba5ddcd994aac7543a2ac2e9 [2994/3437] mm/damon: avoid applying DAMOS action to same entity multiple times
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-r071-20250213 (https://download.01.org/0day-ci/archive/20250214/202502140033.3Iu9sbzq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502140033.3Iu9sbzq-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:310 damon_pa_pageout() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:343 damon_pa_mark_accessed_or_deactivate() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:511 damon_pa_migrate() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:547 damon_pa_stat() error: uninitialized symbol 'folio'.

vim +/folio +310 mm/damon/paddr.c

66053c85f7e592 SeongJae Park         2025-02-07  256  
96f1971dabca71 SeongJae Park         2025-01-06  257  static unsigned long damon_pa_pageout(struct damon_region *r, struct damos *s,
96f1971dabca71 SeongJae Park         2025-01-06  258  		unsigned long *sz_filter_passed)
57223ac295845b SeongJae Park         2021-11-05  259  {
0e92c2ee9f4595 SeongJae Park         2022-01-14  260  	unsigned long addr, applied;
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  261  	LIST_HEAD(folio_list);
ebd3f70c630a9a SeongJae Park         2024-04-29  262  	bool install_young_filter = true;
69a5f999176d10 SeongJae Park         2024-04-29  263  	struct damos_filter *filter;
66053c85f7e592 SeongJae Park         2025-02-07  264  	struct folio *folio;
69a5f999176d10 SeongJae Park         2024-04-29  265  
ebd3f70c630a9a SeongJae Park         2024-04-29  266  	/* check access in page level again by default */
69a5f999176d10 SeongJae Park         2024-04-29  267  	damos_for_each_filter(filter, s) {
69a5f999176d10 SeongJae Park         2024-04-29  268  		if (filter->type == DAMOS_FILTER_TYPE_YOUNG) {
ebd3f70c630a9a SeongJae Park         2024-04-29  269  			install_young_filter = false;
69a5f999176d10 SeongJae Park         2024-04-29  270  			break;
69a5f999176d10 SeongJae Park         2024-04-29  271  		}
69a5f999176d10 SeongJae Park         2024-04-29  272  	}
ebd3f70c630a9a SeongJae Park         2024-04-29  273  	if (install_young_filter) {
e2fbfedad03401 SeongJae Park         2025-01-09  274  		filter = damos_new_filter(
e2fbfedad03401 SeongJae Park         2025-01-09  275  				DAMOS_FILTER_TYPE_YOUNG, true, false);
ebd3f70c630a9a SeongJae Park         2024-04-29  276  		if (!filter)
ebd3f70c630a9a SeongJae Park         2024-04-29  277  			return 0;
ebd3f70c630a9a SeongJae Park         2024-04-29  278  		damos_add_filter(s, filter);
ebd3f70c630a9a SeongJae Park         2024-04-29  279  	}
57223ac295845b SeongJae Park         2021-11-05  280  
f9153b6a712d4f Usama Arif            2025-02-07  281  	addr = r->ar.start;
f9153b6a712d4f Usama Arif            2025-02-07  282  	while (addr < r->ar.end) {
66053c85f7e592 SeongJae Park         2025-02-07  283  		folio = damon_get_folio(PHYS_PFN(addr));
66053c85f7e592 SeongJae Park         2025-02-07  284  		if (damon_pa_invalid_damos_folio(folio, s)) {
f9153b6a712d4f Usama Arif            2025-02-07  285  			addr += PAGE_SIZE;
57223ac295845b SeongJae Park         2021-11-05  286  			continue;
f9153b6a712d4f Usama Arif            2025-02-07  287  		}
57223ac295845b SeongJae Park         2021-11-05  288  
dd411433129c07 Kefeng Wang           2023-03-08  289  		if (damos_pa_filter_out(s, folio))
dd411433129c07 Kefeng Wang           2023-03-08  290  			goto put_folio;
96f1971dabca71 SeongJae Park         2025-01-06  291  		else
96f1971dabca71 SeongJae Park         2025-01-06  292  			*sz_filter_passed += folio_size(folio);
18250e78f9c759 SeongJae Park         2022-12-05  293  
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  294  		folio_clear_referenced(folio);
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  295  		folio_test_clear_young(folio);
dd411433129c07 Kefeng Wang           2023-03-08  296  		if (!folio_isolate_lru(folio))
dd411433129c07 Kefeng Wang           2023-03-08  297  			goto put_folio;
3f98c9a62c338b andrew.yang           2023-02-22  298  		if (folio_test_unevictable(folio))
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  299  			folio_putback_lru(folio);
3f98c9a62c338b andrew.yang           2023-02-22  300  		else
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  301  			list_add(&folio->lru, &folio_list);
dd411433129c07 Kefeng Wang           2023-03-08  302  put_folio:
f9153b6a712d4f Usama Arif            2025-02-07  303  		addr += folio_size(folio);
07bb1fbaa2bbd2 Kefeng Wang           2022-12-30  304  		folio_put(folio);
57223ac295845b SeongJae Park         2021-11-05  305  	}
ebd3f70c630a9a SeongJae Park         2024-04-29  306  	if (install_young_filter)
ebd3f70c630a9a SeongJae Park         2024-04-29  307  		damos_destroy_filter(filter);
14f5be2a2d9bb7 SeongJae Park         2024-04-29  308  	applied = reclaim_pages(&folio_list);
57223ac295845b SeongJae Park         2021-11-05  309  	cond_resched();
66053c85f7e592 SeongJae Park         2025-02-07 @310  	s->last_applied = folio;
0e92c2ee9f4595 SeongJae Park         2022-01-14  311  	return applied * PAGE_SIZE;
57223ac295845b SeongJae Park         2021-11-05  312  }
57223ac295845b SeongJae Park         2021-11-05  313  
8193321ac90d52 SeongJae Park         2022-09-13  314  static inline unsigned long damon_pa_mark_accessed_or_deactivate(
96f1971dabca71 SeongJae Park         2025-01-06  315  		struct damon_region *r, struct damos *s, bool mark_accessed,
96f1971dabca71 SeongJae Park         2025-01-06  316  		unsigned long *sz_filter_passed)
8cdcc532268df0 SeongJae Park         2022-06-13  317  {
8cdcc532268df0 SeongJae Park         2022-06-13  318  	unsigned long addr, applied = 0;
66053c85f7e592 SeongJae Park         2025-02-07  319  	struct folio *folio;
8cdcc532268df0 SeongJae Park         2022-06-13  320  
f9153b6a712d4f Usama Arif            2025-02-07  321  	addr = r->ar.start;
f9153b6a712d4f Usama Arif            2025-02-07  322  	while (addr < r->ar.end) {
66053c85f7e592 SeongJae Park         2025-02-07  323  		folio = damon_get_folio(PHYS_PFN(addr));
66053c85f7e592 SeongJae Park         2025-02-07  324  		if (damon_pa_invalid_damos_folio(folio, s)) {
f9153b6a712d4f Usama Arif            2025-02-07  325  			addr += PAGE_SIZE;
8cdcc532268df0 SeongJae Park         2022-06-13  326  			continue;
f9153b6a712d4f Usama Arif            2025-02-07  327  		}
18250e78f9c759 SeongJae Park         2022-12-05  328  
b6993be23601c8 Kefeng Wang           2023-03-08  329  		if (damos_pa_filter_out(s, folio))
b6993be23601c8 Kefeng Wang           2023-03-08  330  			goto put_folio;
96f1971dabca71 SeongJae Park         2025-01-06  331  		else
96f1971dabca71 SeongJae Park         2025-01-06  332  			*sz_filter_passed += folio_size(folio);
18250e78f9c759 SeongJae Park         2022-12-05  333  
8193321ac90d52 SeongJae Park         2022-09-13  334  		if (mark_accessed)
f70da5ee8fe15b Vishal Moola (Oracle  2022-12-21  335) 			folio_mark_accessed(folio);
8193321ac90d52 SeongJae Park         2022-09-13  336  		else
5a9e34747c9f73 Vishal Moola (Oracle  2022-12-21  337) 			folio_deactivate(folio);
f70da5ee8fe15b Vishal Moola (Oracle  2022-12-21  338) 		applied += folio_nr_pages(folio);
b6993be23601c8 Kefeng Wang           2023-03-08  339  put_folio:
f9153b6a712d4f Usama Arif            2025-02-07  340  		addr += folio_size(folio);
dd52a61da0dd8b SeongJae Park         2023-03-04  341  		folio_put(folio);
8cdcc532268df0 SeongJae Park         2022-06-13  342  	}
66053c85f7e592 SeongJae Park         2025-02-07 @343  	s->last_applied = folio;
8cdcc532268df0 SeongJae Park         2022-06-13  344  	return applied * PAGE_SIZE;
8cdcc532268df0 SeongJae Park         2022-06-13  345  }
8cdcc532268df0 SeongJae Park         2022-06-13  346  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
