Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD63F4DF2
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jul 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547445; cv=none; b=blDeRfO3c1kiFs0/GIFyu9uzHO9JKV08dni/BNLwfTriv3HYsf5y7bQ6AeeidZNlyYhx8ZG8lEmuZMWwrSeP3RnltkBGuMwsoJ+7bhaCg8hHOBPLcEjFf7LMyO80nobdnSyw44b7CbGGMoCNpmJm7RIxwKb91XaiPXlpcAn2nCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547445; c=relaxed/simple;
	bh=0DEETdv61YiDAIiSb+qv4Q//a7U0gp67CPCtvWUagHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cJCBKcj5NJOJWyzjz3UzdXWe4Z4lPxbJpicSlclVaVlr+jUiV2aBVcq8sR22N1NjLtFbGDnHyymZ/h4V7j6Dmp2EW77OQUebb82xsJ0NP4XwsnOoOzKzQS54mF5zwhRd+XQPZjdS53q53aury4weDVwJJ6W4uc4CV3Fi4pHp5Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9bXAkZm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9bXAkZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784547444; x=1816083444;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0DEETdv61YiDAIiSb+qv4Q//a7U0gp67CPCtvWUagHM=;
  b=V9bXAkZm6d8qN8fpZMY2uVWaD3SvN6bT5Px/rTdwjGx1mAxuDlXX5t/f
   i5hOJ2KuksXCqAtjTNGxeCpTu8yiinHEKUfXjE12dRFeMXqq3CvK+/JXD
   61UPUplnPDuiPpFRc46xoyKm7GmhI3wDzgohgR3ZFI5VCPqFdtmQx/HCP
   s8RWP7iLcrp54VChG0iyzE2gw+GNf9pmnq2EFowyMqMhaWtHyW6gRdSYM
   xEU5FInrg6K3aZhHcebj7O+rV9ajRXsZv0nTYJor/nyCicqQIA2A9ls20
   R3b52M0IjIE35e25ftbTIw/t720JIsygXNgGVsyIwKFCt+c1xPSMS4Xvx
   w==;
X-CSE-ConnectionGUID: 6dsV0G7oQAOtTyNeI06w7g==
X-CSE-MsgGUID: yGTmSmeSRVmetJejtBFxPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87664810"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87664810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:37:23 -0700
X-CSE-ConnectionGUID: B/TS9ddkQBS2yZhr7YIbLA==
X-CSE-MsgGUID: YlVKGeI9Spa/ptY7SOHnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="280721479"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jul 2026 04:37:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlmJE-00000000WCb-0oz1;
	Mon, 20 Jul 2026 11:37:20 +0000
Date: Mon, 20 Jul 2026 19:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_pagemap.c:480:12: error: call to
 '__compiletime_assert_458' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202607201914.LpAGsbXs-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Balbir Singh <balbirs@nvidia.com>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1590cf0329716306e948a8fc29f1d3ee87d3989f
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpage=
s calculation for migrate_vma_setup
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r062-20260720 (https://download.01.org/0day-ci/arch=
ive/20260720/202607201914.LpAGsbXs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260720/202607201914.LpAGsbXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate=
_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607201914.LpAGsbXs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_458' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:91:1: note: expanded from here
      91 | __compiletime_assert_458
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
