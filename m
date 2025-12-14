Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC39463
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765703108; cv=none; b=MnuCxOUYj6klM1uF8ddSxmM+HAqx2jar/oBmIPIaM8WwPW20YtY2jMGcca3eExuP8g5RGZyAd6QszLBJU1zI5KKJ2Zm4BVJdxg+hBE5VOw+EjDYKeojAWF+idvN1WhkZ1NHJIjEU7OlH1+c2eFViZRNYj1o4PEbOIBJQYAGsPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765703108; c=relaxed/simple;
	bh=Yal7aM2+xsE0ubU9YWwMIk8G2MQLN1YXQgXAhKnw32E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQpa8BGIRQ4Dm+EH+/ez9nh48uHh4MU6kEvdnoCYdooEq//S9oXtYXBNl4qGlSuVTWW1n//m8GJvoJ7nCodShBpp4VFSwWoSKnKa4SFjwoTVCQi7MrqVvUw0O4Lle0RC8MRBXLB0y/d4mH6Vn565TkyGZhVtIlFGJeYJT66Z0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+jt7Ji2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+jt7Ji2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765703107; x=1797239107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yal7aM2+xsE0ubU9YWwMIk8G2MQLN1YXQgXAhKnw32E=;
  b=K+jt7Ji28Wra36pt1P4FvTpU2K/weVoSmPrrN+M4G2d926tmyN8/IdNW
   zegTKIdPWM+GvmNy29GRZBh74rKQGHIPTZyj7nlmp/SfFabiSwhKVx9m1
   P0zM9gW0o+X5b27chSCmZRi/J8p+C5LgHNrhuv9Tgsc5It3WoB2pzmup8
   vW2p2mDAvOaqIG6ofL+D3fTy1tecXv5GDRfT0FL6Em8rU4eJoU2sYg4v2
   omQmfVlCR8KoqFrBgbyPyonPX+BHsMEgxNa+IzLAik0cKGR1p7RVQhJpr
   foRZMx11vPe2k/dUbHK6T3kWFSSLWbrrV0+p00Pq5eX/1zXSMsvvcwhlz
   w==;
X-CSE-ConnectionGUID: 8JSYEryrT560WU2kM5UT/g==
X-CSE-MsgGUID: n+7LcVqbQPWKCNwjPHPJcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90290569"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="90290569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 01:05:04 -0800
X-CSE-ConnectionGUID: oYrqYlxuSHa1Bj8jk7PaPg==
X-CSE-MsgGUID: X+c5RIikT6yqke063hhM4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228133316"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 01:05:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUi2G-000000008uN-1plB;
	Sun, 14 Dec 2025 09:05:00 +0000
Date: Sun, 14 Dec 2025 17:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sj:damon/next 93/115] mm/damon/paddr.c:303 damon_pa_de_activate()
 error: uninitialized symbol 'folio'.
Message-ID: <202512141716.JkxtPnub-lkp@intel.com>
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

Hi SeongJae,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   4daf22e4c21ef13ee2779580295eb0073dc3163b
commit: 02a887177e7ef48d57e2db44c3be0d63f9d22bbe [93/115] mm/damon/paddr: activate DAMOS_LRU_PRIO targets instead of marking accessed
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: powerpc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141716.JkxtPnub-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141716.JkxtPnub-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:303 damon_pa_de_activate() error: uninitialized symbol 'folio'.

vim +/folio +303 mm/damon/paddr.c

57223ac295845b SeongJae Park         2021-11-05  272  
02a887177e7ef4 SeongJae Park         2025-06-14  273  static inline unsigned long damon_pa_de_activate(
51a1ebd3a295c8 SeongJae Park         2025-08-28  274  		struct damon_region *r, unsigned long addr_unit,
02a887177e7ef4 SeongJae Park         2025-06-14  275  		struct damos *s, bool activate,
96f1971dabca71 SeongJae Park         2025-01-06  276  		unsigned long *sz_filter_passed)
8cdcc532268df0 SeongJae Park         2022-06-13  277  {
51a1ebd3a295c8 SeongJae Park         2025-08-28  278  	phys_addr_t addr, applied = 0;
94ba17adaba0f6 SeongJae Park         2025-02-07  279  	struct folio *folio;
8cdcc532268df0 SeongJae Park         2022-06-13  280  
51a1ebd3a295c8 SeongJae Park         2025-08-28  281  	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
51a1ebd3a295c8 SeongJae Park         2025-08-28  282  	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
94ba17adaba0f6 SeongJae Park         2025-02-07  283  		folio = damon_get_folio(PHYS_PFN(addr));
94ba17adaba0f6 SeongJae Park         2025-02-07  284  		if (damon_pa_invalid_damos_folio(folio, s)) {
3a06696305e757 Usama Arif            2025-02-07  285  			addr += PAGE_SIZE;
8cdcc532268df0 SeongJae Park         2022-06-13  286  			continue;
3a06696305e757 Usama Arif            2025-02-07  287  		}
18250e78f9c759 SeongJae Park         2022-12-05  288  
b6993be23601c8 Kefeng Wang           2023-03-08  289  		if (damos_pa_filter_out(s, folio))
b6993be23601c8 Kefeng Wang           2023-03-08  290  			goto put_folio;
96f1971dabca71 SeongJae Park         2025-01-06  291  		else
51a1ebd3a295c8 SeongJae Park         2025-08-28  292  			*sz_filter_passed += folio_size(folio) / addr_unit;
18250e78f9c759 SeongJae Park         2022-12-05  293  
02a887177e7ef4 SeongJae Park         2025-06-14  294  		if (activate)
02a887177e7ef4 SeongJae Park         2025-06-14  295  			folio_activate(folio);
8193321ac90d52 SeongJae Park         2022-09-13  296  		else
5a9e34747c9f73 Vishal Moola (Oracle  2022-12-21  297) 			folio_deactivate(folio);
f70da5ee8fe15b Vishal Moola (Oracle  2022-12-21  298) 		applied += folio_nr_pages(folio);
b6993be23601c8 Kefeng Wang           2023-03-08  299  put_folio:
3a06696305e757 Usama Arif            2025-02-07  300  		addr += folio_size(folio);
dd52a61da0dd8b SeongJae Park         2023-03-04  301  		folio_put(folio);
8cdcc532268df0 SeongJae Park         2022-06-13  302  	}
94ba17adaba0f6 SeongJae Park         2025-02-07 @303  	s->last_applied = folio;
51a1ebd3a295c8 SeongJae Park         2025-08-28  304  	return damon_pa_core_addr(applied * PAGE_SIZE, addr_unit);
8cdcc532268df0 SeongJae Park         2022-06-13  305  }
8cdcc532268df0 SeongJae Park         2022-06-13  306  

:::::: The code at line 303 was first introduced by commit
:::::: 94ba17adaba0f651fdcf745c8891a88e2e028cfa mm/damon: avoid applying DAMOS action to same entity multiple times

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
