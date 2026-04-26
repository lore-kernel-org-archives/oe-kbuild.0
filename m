Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2B42AA6
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Apr 2026 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777195768; cv=none; b=q0MTi+CDTElz0qwjM6lDetBPqXR2/z7UXOXRbg+297e+h9DV6YAkabfZ+XqCcAR0v9ChDtTnVAitqGh2narBeUtiC18iIf1iApI38r5oJ3CID/sJTQ9pCsGv03VbKVUuzIjgw8vbLQ/qWqOxdDCjdQ1Ec2o2vhttb9Oo9Lg3Fno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777195768; c=relaxed/simple;
	bh=/KW4mn4xegCyEZV/S5op4AeM0TWqMQbt5o0aI49+LqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U4dCxZBWHTLdoKBsg7yleO31WaQWHsAzRmEbXpmBnBDxrXFwGxV2r16jU/Tys24El1FsNIVuVtB7Q5z9UBSzEkrLYB49uiw6enfRAUEphx7ktjo4qIlXB1GYqKpMvrCU+KkdaJGTk1DnDYij6uxAE9wIKksl1yZmeandpGqG6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6swa6eU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6swa6eU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777195766; x=1808731766;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/KW4mn4xegCyEZV/S5op4AeM0TWqMQbt5o0aI49+LqQ=;
  b=L6swa6eUty1BqXwsSVmb8VJ8zZDa5B+TkSp4nFmjIsfltaDpBgFgEbg1
   lBrho1gXvkVk0chztWwqsxwMO0jS51JHQxI5Loexgz1sKJafPG27cY3+6
   hH7xQByW7ZI9YtXwjrCUwYaU+oKQq76S3E+peWB2s37TBBIURoEkXh19a
   voI60ZcupvApnJ7P481CYHmz/Phk1+Mz8gP1lD+CbJ7F6DPsmLb/3UTTw
   6cvLOg6bq5m7mEwBK6MzVxVBU1lCf3i2U2q0m0FV9daFUbgkzn6okh1pb
   6uW2rRiBnKcGm5aDhkHejKkZDKl3QFCGxs1cIEhyc5L/Ua9M2B7fLaBfA
   g==;
X-CSE-ConnectionGUID: dMhbcvb5T4mZ2eQWa/v0Rw==
X-CSE-MsgGUID: sp9QHK3uQNSNYmNa2fkURw==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="78299524"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="78299524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 02:29:26 -0700
X-CSE-ConnectionGUID: UBvs4ttdQL2EkJjKJdbi3w==
X-CSE-MsgGUID: xP92a+NrTq+BzGJlpomIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="263768974"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Apr 2026 02:29:25 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGvnm-000000007lP-1nYu;
	Sun, 26 Apr 2026 09:29:22 +0000
Date: Sun, 26 Apr 2026 17:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_pagemap.c:480:12: error: call to
 '__compiletime_assert_514' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202604261737.k9ERI6tr-lkp@intel.com>
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
head:   897d54018cc9aa97fd1529ca08a53b429d05a566
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpage=
s calculation for migrate_vma_setup
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-r131-20260426 (https://download.01.org/0day-ci=
/archive/20260426/202604261737.k9ERI6tr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260426/202604261737.k9ERI6tr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate=
_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604261737.k9ERI6tr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_514' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:2:1: note: expanded from here
       2 | __compiletime_assert_514
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
