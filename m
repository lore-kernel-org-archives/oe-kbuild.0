Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD288528E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 03:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754796988; cv=none; b=ZIvdhkjRNQZFR+3E9dJmAkEzXoo2bsbcxz2gpNKdYguQBXoEUNSlusn4GDiDcImeKpWKUGo6X+N7iaY24JhjrGC1qaJThm7dNf5BPLuSnUtdvvaICjEUUXVMlTMIwOwRZGsQNnL2ITCWdq5wVwjfIzu6GMXy2aHjVv8WH4uaRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754796988; c=relaxed/simple;
	bh=VYFT+989n/Gc875aR5wGPXgrgLnkorS8w1FH/H639bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HlMTAxDMvE2o4Hm0XSooJg1AjgES31W4eryq9xsQ9OiujTkDMMe/KFiepafCD3n46lBptLNOccpGOF6lb+vhrUR+R0lPWrKvsuiDkngJ2XQO4gtM3nKW8rIeU+9NqnZ2ryTsaQwHokebh2/SnXRv4ybhgpqICf7uIMmq78WPxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThE9GDxP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThE9GDxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754796986; x=1786332986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYFT+989n/Gc875aR5wGPXgrgLnkorS8w1FH/H639bg=;
  b=ThE9GDxPQehgirf582Rf1VdPz7ieBKr2ZjcAIkCgJ/K0NVRzgeVI+CxY
   2vwMYoYyrv7E9MCL1QBaPuULyEaJUVrgOYroZSd17u3UrUAk89NUXdGSD
   A+ajIriYjUuSvGJAX71YbormPGG8+iCGLmg15C8Q//+WyfMjJ/iBk5cQR
   NTfH8ZPOjrhw/Q98MyeBbrEPvUhgSnDK7k8dcuDYDn/ryObduvQUXI2uK
   lFt8LufCi1ZRDyQNcVCppxfnU+a5bXFvaI3ZJQjOg0F7XwLIVU/7FDjFv
   9ulnrUkpgP//JtguRhc1KJfBVublzqi47PUvC8rN9AsYnS12S0IYwx2RL
   g==;
X-CSE-ConnectionGUID: WlyftIpoT2WPw5HGhHBs0A==
X-CSE-MsgGUID: +4jHZevoQqS7vRATQXDXqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57219425"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57219425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 20:36:25 -0700
X-CSE-ConnectionGUID: yVrnSUtmRqil23gOOHsYSg==
X-CSE-MsgGUID: 7Vdo351cSbmIDVMj4j4zTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165624176"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Aug 2025 20:36:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukwr7-00058e-2Q;
	Sun, 10 Aug 2025 03:36:21 +0000
Date: Sun, 10 Aug 2025 11:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sj:damon/next 69/96] mm/damon/paddr.c:289 damon_pa_de_activate()
 error: uninitialized symbol 'folio'.
Message-ID: <202508101131.zr1b8yNi-lkp@intel.com>
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
head:   a77caf2f2daf977b2c3caf5b10c0088eb56de234
commit: 3e4cadcb04f8c79115a786c2d03df3960e3b1cc1 [69/96] mm/damon/paddr: activate DAMOS_LRU_PRIO targets instead of marking accessed
:::::: branch date: 7 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101131.zr1b8yNi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508101131.zr1b8yNi-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:289 damon_pa_de_activate() error: uninitialized symbol 'folio'.

vim +/folio +289 mm/damon/paddr.c

57223ac295845b SeongJae Park         2021-11-05  259  
3e4cadcb04f8c7 SeongJae Park         2025-06-14  260  static inline unsigned long damon_pa_de_activate(
3e4cadcb04f8c7 SeongJae Park         2025-06-14  261  		struct damon_region *r, struct damos *s, bool activate,
96f1971dabca71 SeongJae Park         2025-01-06  262  		unsigned long *sz_filter_passed)
8cdcc532268df0 SeongJae Park         2022-06-13  263  {
8cdcc532268df0 SeongJae Park         2022-06-13  264  	unsigned long addr, applied = 0;
94ba17adaba0f6 SeongJae Park         2025-02-07  265  	struct folio *folio;
8cdcc532268df0 SeongJae Park         2022-06-13  266  
3a06696305e757 Usama Arif            2025-02-07  267  	addr = r->ar.start;
3a06696305e757 Usama Arif            2025-02-07  268  	while (addr < r->ar.end) {
94ba17adaba0f6 SeongJae Park         2025-02-07  269  		folio = damon_get_folio(PHYS_PFN(addr));
94ba17adaba0f6 SeongJae Park         2025-02-07  270  		if (damon_pa_invalid_damos_folio(folio, s)) {
3a06696305e757 Usama Arif            2025-02-07  271  			addr += PAGE_SIZE;
8cdcc532268df0 SeongJae Park         2022-06-13  272  			continue;
3a06696305e757 Usama Arif            2025-02-07  273  		}
18250e78f9c759 SeongJae Park         2022-12-05  274  
b6993be23601c8 Kefeng Wang           2023-03-08  275  		if (damos_pa_filter_out(s, folio))
b6993be23601c8 Kefeng Wang           2023-03-08  276  			goto put_folio;
96f1971dabca71 SeongJae Park         2025-01-06  277  		else
96f1971dabca71 SeongJae Park         2025-01-06  278  			*sz_filter_passed += folio_size(folio);
18250e78f9c759 SeongJae Park         2022-12-05  279  
3e4cadcb04f8c7 SeongJae Park         2025-06-14  280  		if (activate)
3e4cadcb04f8c7 SeongJae Park         2025-06-14  281  			folio_activate(folio);
8193321ac90d52 SeongJae Park         2022-09-13  282  		else
5a9e34747c9f73 Vishal Moola (Oracle  2022-12-21  283) 			folio_deactivate(folio);
f70da5ee8fe15b Vishal Moola (Oracle  2022-12-21  284) 		applied += folio_nr_pages(folio);
b6993be23601c8 Kefeng Wang           2023-03-08  285  put_folio:
3a06696305e757 Usama Arif            2025-02-07  286  		addr += folio_size(folio);
dd52a61da0dd8b SeongJae Park         2023-03-04  287  		folio_put(folio);
8cdcc532268df0 SeongJae Park         2022-06-13  288  	}
94ba17adaba0f6 SeongJae Park         2025-02-07 @289  	s->last_applied = folio;
8cdcc532268df0 SeongJae Park         2022-06-13  290  	return applied * PAGE_SIZE;
8cdcc532268df0 SeongJae Park         2022-06-13  291  }
8cdcc532268df0 SeongJae Park         2022-06-13  292  

:::::: The code at line 289 was first introduced by commit
:::::: 94ba17adaba0f651fdcf745c8891a88e2e028cfa mm/damon: avoid applying DAMOS action to same entity multiple times

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
