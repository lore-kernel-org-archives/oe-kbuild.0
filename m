Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FDC3BD643
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833197; cv=none; b=NAIrCNLWL+8r6TBxigHoi5NKmAd1Z7KTBx08hIQZUBZ84NfOEJwIf+QJtovwJ2wmHByiCeMMQmweNB19i04a3aLpvEZSisYeyBKfyYD6H94tx6aK+8i+YHydB6diqJ/2pEsGgwe2LB82d+ustu7qrgntoBKs6zJ72vNGt0dvku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833197; c=relaxed/simple;
	bh=juh6z4daEGz0+c5fqzJ5exzLfLdOLEMJTctsQjaBbZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fu1F6xO2DmLCXNz+zst/z+p7/NGbAc/MIdYgvPWDVkJxDDnktqqPlN1PRMqSa+8m1EReumyL8MHzSKk6kWe0O/M4LzydYkqEWwkZeUl5X7RGxpXjMPvgyJgn1EeaMoHGvTnmpLKiSEkW0zmy5BLr0y13CGn3NthD68y8ZDAbAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbqgMiwY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbqgMiwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785833196; x=1817369196;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=juh6z4daEGz0+c5fqzJ5exzLfLdOLEMJTctsQjaBbZY=;
  b=EbqgMiwY1fm1vjHOefrSxjShNOARO5u+z/YY3BJpWnhv3VY0o+uph7fy
   +0p+9T5JDIR+gpXgTonrjElzMMZCcWMd9snEATbwjfQjPzS9SwUmXGd3j
   ImWcM1F+fvIu4XQZrIEsqsgpLo4uZ3d2mtu3La6OrFob0ER4+QYEijy/s
   oXcN8hBAuwYeUUfV+K8KcwQzhTjZthu3i5lH7eyl6YQjM/kN6FvSxguwU
   PkCDSNdQxDrE92Mh2AN7B4sGCde7aV0pQG1Ik2d7ykmpJ0zjusuSPZBq4
   W21+VIBMUDb6H0wdDGEk8hMJJcsjX5gf7SUfV64oR1KL7cyvW0PvmuTDZ
   g==;
X-CSE-ConnectionGUID: ySz6FdxtRhihwQKqR8ULjw==
X-CSE-MsgGUID: T1R/SIgYTB2G3SXVqGJukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85508758"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="85508758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:46:35 -0700
X-CSE-ConnectionGUID: 7B4h+zw1QDOsoCd6M3QvYA==
X-CSE-MsgGUID: wf2vlQNBQfCcyowg6O4WIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265704559"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2026 01:46:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAn6-000000009SW-2uqW;
	Tue, 04 Aug 2026 08:46:28 +0000
Date: Tue, 04 Aug 2026 16:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_pagemap.c:480:12: error: call to
 '__compiletime_assert_473' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202608041636.OkM2eVI1-lkp@intel.com>
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
head:   848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpage=
s calculation for migrate_vma_setup
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r112-20260804 (https://download.01.org/0day-ci=
/archive/20260804/202608041636.OkM2eVI1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260804/202608041636.OkM2eVI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate=
_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041636.OkM2eVI1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_473' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:67:1: note: expanded from here
      67 | __compiletime_assert_473
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
