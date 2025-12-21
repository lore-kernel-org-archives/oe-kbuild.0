Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A8EEA8
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766354721; cv=none; b=S0Iug/Q39YBkbq7JCX0SVDYsNo+IUxB20ID7GBM3slTNPI9KXp5ZanM/lS4G/gRiALo9nPmGDah9OKbHZedcwur4ibRzDizUhevz2pq5mHHCE5JhL+4KCdSh1mrbHcvqixRWxfDYS09Ed9oGthnArxO6yBUVZgHBCEfSioJGzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766354721; c=relaxed/simple;
	bh=DwO4aGdnDvJFHQTLwA/aQhQx+yhBsuFyDTo9F+OlrCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V6Ti+6liHpMNA6RndyBKiJ7jHSme7EFKDYgzwt+4vDrjlRGmMDZTxSK+YskE2yGclmOjwfSpITqcAzLCRqkbeviVpHk/W4flgGSfUtS7xQiXaVGrxkyNiKt7K0DaomdHMu34RSMMcX6UqB5Wwy3ZcOFhYN2vbLk/NQ4MMholI08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsIGeLRA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsIGeLRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766354720; x=1797890720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DwO4aGdnDvJFHQTLwA/aQhQx+yhBsuFyDTo9F+OlrCM=;
  b=PsIGeLRAYJw+oh9RLYjue4dkUigxGLB+yX43F9FECChnrT3h4y75Kq7p
   +Ivo7j3/Ebtg2FB+3wmd3EkUYWX7Kwx0SHKFxpUfXUVbw9BSsEUiAx2p5
   o6D2DvG4SEUBkSEtDaNbWtIW6jTV+sTNdPTVm8UY0MO8XSR0JuX0gdqAj
   v93gsiWuXnp0P2nhLDnbNs6KFq7RNrqvi7Kz0ed0gfPxwqbds0Uw7hq5r
   8mDlPrRkr/EnYDsNqmAIR5z2ohVS1LiGWd5mCj9IFmzEHjXhu6gGXQJ+p
   lTIN1+0PGtqG1hKkWRi7xhbSvlmrqEanvU+wG3/1yXrB59Tklu9GdN5Sx
   A==;
X-CSE-ConnectionGUID: y3VuL+ngRoW5X4UfhJ39mg==
X-CSE-MsgGUID: iSgjnJ34T6qclDOeeYwPRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72080017"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72080017"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:05:19 -0800
X-CSE-ConnectionGUID: CyCRS4zuQDiIcRNlvIegOA==
X-CSE-MsgGUID: PXAUvG3FSIKurT+XcRUEow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203900706"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2025 14:05:17 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRYB-000000000EK-0GMA;
	Sun, 21 Dec 2025 22:05:15 +0000
Date: Mon, 22 Dec 2025 06:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/damon/paddr.c:321 damon_pa_pageout() error: uninitialized symbol
 'folio'.
Message-ID: <202512220616.dujbZZj0-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: 94ba17adaba0f651fdcf745c8891a88e2e028cfa mm/damon: avoid applying DAMOS action to same entity multiple times
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r073-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220616.dujbZZj0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512220616.dujbZZj0-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:321 damon_pa_pageout() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:354 damon_pa_mark_accessed_or_deactivate() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:522 damon_pa_migrate() error: uninitialized symbol 'folio'.
mm/damon/paddr.c:558 damon_pa_stat() error: uninitialized symbol 'folio'.

vim +/folio +321 mm/damon/paddr.c

94ba17adaba0f65 SeongJae Park         2025-02-07  267  
96f1971dabca714 SeongJae Park         2025-01-06  268  static unsigned long damon_pa_pageout(struct damon_region *r, struct damos *s,
96f1971dabca714 SeongJae Park         2025-01-06  269  		unsigned long *sz_filter_passed)
57223ac295845b1 SeongJae Park         2021-11-05  270  {
0e92c2ee9f45954 SeongJae Park         2022-01-14  271  	unsigned long addr, applied;
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  272  	LIST_HEAD(folio_list);
ebd3f70c630a9a1 SeongJae Park         2024-04-29  273  	bool install_young_filter = true;
69a5f999176d10b SeongJae Park         2024-04-29  274  	struct damos_filter *filter;
94ba17adaba0f65 SeongJae Park         2025-02-07  275  	struct folio *folio;
69a5f999176d10b SeongJae Park         2024-04-29  276  
ebd3f70c630a9a1 SeongJae Park         2024-04-29  277  	/* check access in page level again by default */
69a5f999176d10b SeongJae Park         2024-04-29  278  	damos_for_each_filter(filter, s) {
69a5f999176d10b SeongJae Park         2024-04-29  279  		if (filter->type == DAMOS_FILTER_TYPE_YOUNG) {
ebd3f70c630a9a1 SeongJae Park         2024-04-29  280  			install_young_filter = false;
69a5f999176d10b SeongJae Park         2024-04-29  281  			break;
69a5f999176d10b SeongJae Park         2024-04-29  282  		}
69a5f999176d10b SeongJae Park         2024-04-29  283  	}
ebd3f70c630a9a1 SeongJae Park         2024-04-29  284  	if (install_young_filter) {
e2fbfedad03401a SeongJae Park         2025-01-09  285  		filter = damos_new_filter(
e2fbfedad03401a SeongJae Park         2025-01-09  286  				DAMOS_FILTER_TYPE_YOUNG, true, false);
ebd3f70c630a9a1 SeongJae Park         2024-04-29  287  		if (!filter)
ebd3f70c630a9a1 SeongJae Park         2024-04-29  288  			return 0;
ebd3f70c630a9a1 SeongJae Park         2024-04-29  289  		damos_add_filter(s, filter);
ebd3f70c630a9a1 SeongJae Park         2024-04-29  290  	}
57223ac295845b1 SeongJae Park         2021-11-05  291  
3a06696305e757f Usama Arif            2025-02-07  292  	addr = r->ar.start;
3a06696305e757f Usama Arif            2025-02-07  293  	while (addr < r->ar.end) {
94ba17adaba0f65 SeongJae Park         2025-02-07  294  		folio = damon_get_folio(PHYS_PFN(addr));
94ba17adaba0f65 SeongJae Park         2025-02-07  295  		if (damon_pa_invalid_damos_folio(folio, s)) {
3a06696305e757f Usama Arif            2025-02-07  296  			addr += PAGE_SIZE;
57223ac295845b1 SeongJae Park         2021-11-05  297  			continue;
3a06696305e757f Usama Arif            2025-02-07  298  		}
57223ac295845b1 SeongJae Park         2021-11-05  299  
dd411433129c07a Kefeng Wang           2023-03-08  300  		if (damos_pa_filter_out(s, folio))
dd411433129c07a Kefeng Wang           2023-03-08  301  			goto put_folio;
96f1971dabca714 SeongJae Park         2025-01-06  302  		else
96f1971dabca714 SeongJae Park         2025-01-06  303  			*sz_filter_passed += folio_size(folio);
18250e78f9c7590 SeongJae Park         2022-12-05  304  
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  305  		folio_clear_referenced(folio);
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  306  		folio_test_clear_young(folio);
dd411433129c07a Kefeng Wang           2023-03-08  307  		if (!folio_isolate_lru(folio))
dd411433129c07a Kefeng Wang           2023-03-08  308  			goto put_folio;
3f98c9a62c338bb andrew.yang           2023-02-22  309  		if (folio_test_unevictable(folio))
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  310  			folio_putback_lru(folio);
3f98c9a62c338bb andrew.yang           2023-02-22  311  		else
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  312  			list_add(&folio->lru, &folio_list);
dd411433129c07a Kefeng Wang           2023-03-08  313  put_folio:
3a06696305e757f Usama Arif            2025-02-07  314  		addr += folio_size(folio);
07bb1fbaa2bbd2a Kefeng Wang           2022-12-30  315  		folio_put(folio);
57223ac295845b1 SeongJae Park         2021-11-05  316  	}
ebd3f70c630a9a1 SeongJae Park         2024-04-29  317  	if (install_young_filter)
ebd3f70c630a9a1 SeongJae Park         2024-04-29  318  		damos_destroy_filter(filter);
14f5be2a2d9bb7e SeongJae Park         2024-04-29  319  	applied = reclaim_pages(&folio_list);
57223ac295845b1 SeongJae Park         2021-11-05  320  	cond_resched();
94ba17adaba0f65 SeongJae Park         2025-02-07 @321  	s->last_applied = folio;
0e92c2ee9f45954 SeongJae Park         2022-01-14  322  	return applied * PAGE_SIZE;
57223ac295845b1 SeongJae Park         2021-11-05  323  }
57223ac295845b1 SeongJae Park         2021-11-05  324  
8193321ac90d525 SeongJae Park         2022-09-13  325  static inline unsigned long damon_pa_mark_accessed_or_deactivate(
96f1971dabca714 SeongJae Park         2025-01-06  326  		struct damon_region *r, struct damos *s, bool mark_accessed,
96f1971dabca714 SeongJae Park         2025-01-06  327  		unsigned long *sz_filter_passed)
8cdcc532268df08 SeongJae Park         2022-06-13  328  {
8cdcc532268df08 SeongJae Park         2022-06-13  329  	unsigned long addr, applied = 0;
94ba17adaba0f65 SeongJae Park         2025-02-07  330  	struct folio *folio;
8cdcc532268df08 SeongJae Park         2022-06-13  331  
3a06696305e757f Usama Arif            2025-02-07  332  	addr = r->ar.start;
3a06696305e757f Usama Arif            2025-02-07  333  	while (addr < r->ar.end) {
94ba17adaba0f65 SeongJae Park         2025-02-07  334  		folio = damon_get_folio(PHYS_PFN(addr));
94ba17adaba0f65 SeongJae Park         2025-02-07  335  		if (damon_pa_invalid_damos_folio(folio, s)) {
3a06696305e757f Usama Arif            2025-02-07  336  			addr += PAGE_SIZE;
8cdcc532268df08 SeongJae Park         2022-06-13  337  			continue;
3a06696305e757f Usama Arif            2025-02-07  338  		}
18250e78f9c7590 SeongJae Park         2022-12-05  339  
b6993be23601c8b Kefeng Wang           2023-03-08  340  		if (damos_pa_filter_out(s, folio))
b6993be23601c8b Kefeng Wang           2023-03-08  341  			goto put_folio;
96f1971dabca714 SeongJae Park         2025-01-06  342  		else
96f1971dabca714 SeongJae Park         2025-01-06  343  			*sz_filter_passed += folio_size(folio);
18250e78f9c7590 SeongJae Park         2022-12-05  344  
8193321ac90d525 SeongJae Park         2022-09-13  345  		if (mark_accessed)
f70da5ee8fe15b2 Vishal Moola (Oracle  2022-12-21  346) 			folio_mark_accessed(folio);
8193321ac90d525 SeongJae Park         2022-09-13  347  		else
5a9e34747c9f731 Vishal Moola (Oracle  2022-12-21  348) 			folio_deactivate(folio);
f70da5ee8fe15b2 Vishal Moola (Oracle  2022-12-21  349) 		applied += folio_nr_pages(folio);
b6993be23601c8b Kefeng Wang           2023-03-08  350  put_folio:
3a06696305e757f Usama Arif            2025-02-07  351  		addr += folio_size(folio);
dd52a61da0dd8ba SeongJae Park         2023-03-04  352  		folio_put(folio);
8cdcc532268df08 SeongJae Park         2022-06-13  353  	}
94ba17adaba0f65 SeongJae Park         2025-02-07 @354  	s->last_applied = folio;
8cdcc532268df08 SeongJae Park         2022-06-13  355  	return applied * PAGE_SIZE;
8cdcc532268df08 SeongJae Park         2022-06-13  356  }
8cdcc532268df08 SeongJae Park         2022-06-13  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
