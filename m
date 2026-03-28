Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF89A221DB6
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714604; cv=none; b=Sc2xCjPXNgPWnZr0jMYx+e28eHKoFPU4Ue74tZfwr7kLDunwEIX+cirFVj3ryH/rvgE6gmapjFMkyzCiDwUAUjabliLGuGOK6IutsueOgfKlyAURtv2nEHT6LYLvWiuYEcCIRFFsxNJl2XKQIYOKxRWj6Zda1/C+m09nq7yhpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714604; c=relaxed/simple;
	bh=2fkKFG+OEG7lVQkKusSWwvUfnds5jr5QsY8Wanmmhv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ScNS80dfEqQUYmHPeD+9VTzNHw1N56V+okk4w5YI5PsZKDRJjFQm9fjh7vgMORBQRqdqZQ7BUtdeEDxVxmstg5UBf11cAoBZGXZv5IfXXPwrTU1kLXEnsKCIRajtvXJEuCAMnOIH1wujKmYGQlgQGbEfZejsOLlHlqew8k7Uc5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRuywq7L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRuywq7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774714602; x=1806250602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2fkKFG+OEG7lVQkKusSWwvUfnds5jr5QsY8Wanmmhv0=;
  b=ZRuywq7LeIDEqxk2wm6OyW7fFQExN/4v0u9LMQXZ1NJmg7HA89zr9YSY
   /HwO0ggcv+HLftWEZtpv0CaZhSSoXsHOnyARL/nqGWc1Lgwv3RBqKCJ95
   Wz4xHQvVRKW0EdZhVcZaWC+ZeUgNEJsZShlFwTD1jYcgq3pq3Y73VXFSl
   TMVkZl6Ki2QIx/TkQN0ScQ1fdMH2CD1l8cVmE8jI5YTUr5/IwLuH3HiSI
   lTz+N6HsfANcVFKgntVKrhGmFFLqKJqw0l8Kh+aRQsXjfZjtOah3eC85B
   JQp4jeSRnn5RmFKdIplRGWGMXkpLcMAooff8+JB44TsgiMNIKc6RqFvhM
   w==;
X-CSE-ConnectionGUID: XvHUqjmwQyWaqPkTH1ahRA==
X-CSE-MsgGUID: GuqEGhj8RiGmwgzz/P5Baw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86383641"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86383641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 09:16:42 -0700
X-CSE-ConnectionGUID: 2xKgS1xORt67BH3Mr2QUJA==
X-CSE-MsgGUID: elVlZbjNTCarGYTvd5PNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="225494976"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2026 09:16:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6WL0-00000000BZh-3Guw;
	Sat, 28 Mar 2026 16:16:38 +0000
Date: Sun, 29 Mar 2026 00:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4800/10350]
 drivers/gpu/drm/drm_pagemap.c:480:12: error: call to
 '__compiletime_assert_472' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202603290004.NjL9Qtr4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Matthew Brost <matthew.brost@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Balbir Singh <balbirs@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3b058d1aeeeff27a7289529c4944291613b364e9
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 [4800/10350] drm/pagemap: =
Correct cpages calculation for migrate_vma_setup
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-001-20260328 (https://download.01.org/0day-ci/=
archive/20260329/202603290004.NjL9Qtr4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054=
e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260329/202603290004.NjL9Qtr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290004.NjL9Qtr4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_472' declared with 'error' attribute: BUILD_BUG failed
     480 |                         order =3D HPAGE_PMD_ORDER;
         |                                 ^
   include/linux/huge_mm.h:117:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
     117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
         |                          ^
   include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compil=
etime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compi=
letime_assert'
     687 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:195:1: note: expanded from here
     195 | __compiletime_assert_472
         | ^
   1 error generated.


vim +480 drivers/gpu/drm/drm_pagemap.c

ec265e1f1cfcce Thomas Hellstr=C3=B6m 2025-12-19  454 =20
139ab31aea8a94 Matthew Brost    2026-03-12  455  /**
139ab31aea8a94 Matthew Brost    2026-03-12  456   * drm_pagemap_cpages() - =
Count collected pages
139ab31aea8a94 Matthew Brost    2026-03-12  457   * @migrate_pfn: Array of =
migrate_pfn entries to account
139ab31aea8a94 Matthew Brost    2026-03-12  458   * @npages: Number of entr=
ies in @migrate_pfn
139ab31aea8a94 Matthew Brost    2026-03-12  459   *
139ab31aea8a94 Matthew Brost    2026-03-12  460   * Compute the total numbe=
r of minimum-sized pages represented by the
139ab31aea8a94 Matthew Brost    2026-03-12  461   * collected entries in @m=
igrate_pfn. The total is derived from the
139ab31aea8a94 Matthew Brost    2026-03-12  462   * order encoded in each e=
ntry.
139ab31aea8a94 Matthew Brost    2026-03-12  463   *
139ab31aea8a94 Matthew Brost    2026-03-12  464   * Return: Total number of=
 minimum-sized pages.
139ab31aea8a94 Matthew Brost    2026-03-12  465   */
139ab31aea8a94 Matthew Brost    2026-03-12  466  static int drm_pagemap_cpa=
ges(unsigned long *migrate_pfn, unsigned long npages)
139ab31aea8a94 Matthew Brost    2026-03-12  467  {
139ab31aea8a94 Matthew Brost    2026-03-12  468  	unsigned long i, cpages =
=3D 0;
139ab31aea8a94 Matthew Brost    2026-03-12  469 =20
139ab31aea8a94 Matthew Brost    2026-03-12  470  	for (i =3D 0; i < npages;=
) {
139ab31aea8a94 Matthew Brost    2026-03-12  471  		struct page *page =3D mi=
grate_pfn_to_page(migrate_pfn[i]);
139ab31aea8a94 Matthew Brost    2026-03-12  472  		struct folio *folio;
139ab31aea8a94 Matthew Brost    2026-03-12  473  		unsigned int order =3D 0;
139ab31aea8a94 Matthew Brost    2026-03-12  474 =20
139ab31aea8a94 Matthew Brost    2026-03-12  475  		if (page) {
139ab31aea8a94 Matthew Brost    2026-03-12  476  			folio =3D page_folio(pa=
ge);
139ab31aea8a94 Matthew Brost    2026-03-12  477  			order =3D folio_order(f=
olio);
139ab31aea8a94 Matthew Brost    2026-03-12  478  			cpages +=3D NR_PAGES(or=
der);
139ab31aea8a94 Matthew Brost    2026-03-12  479  		} else if (migrate_pfn[i=
] & MIGRATE_PFN_COMPOUND) {
139ab31aea8a94 Matthew Brost    2026-03-12 @480  			order =3D HPAGE_PMD_ORD=
ER;
139ab31aea8a94 Matthew Brost    2026-03-12  481  			cpages +=3D NR_PAGES(or=
der);
139ab31aea8a94 Matthew Brost    2026-03-12  482  		}
139ab31aea8a94 Matthew Brost    2026-03-12  483 =20
139ab31aea8a94 Matthew Brost    2026-03-12  484  		i +=3D NR_PAGES(order);
139ab31aea8a94 Matthew Brost    2026-03-12  485  	}
139ab31aea8a94 Matthew Brost    2026-03-12  486 =20
139ab31aea8a94 Matthew Brost    2026-03-12  487  	return cpages;
139ab31aea8a94 Matthew Brost    2026-03-12  488  }
139ab31aea8a94 Matthew Brost    2026-03-12  489 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
