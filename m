Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49C12B94
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092796; cv=none; b=MUOBKT+MELnUEUOVXMbM4uhif8jvYz3CHQ0NZZUrvqNyAOwRwdNFirEhOQUI3TXXRtsXpH6dboEdszzyAlSCetrOM+YlObki9KQbn61KnrQxBif4p9pASwXJHHo+WxFlUnQnwPtoTAiqC6aVgl6o1TP24W5WjgHl36X92+AChbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092796; c=relaxed/simple;
	bh=GTPrCG6fGm2wmurzHDYCfAnFrH4u5dt1aXAVZHgsBAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bt/wY434yDbcVdhAhv169NFBcWOEpxjf1VHrd6BistHX+9tcP6yZl7PenO/3gFpwP0OOfUwZrRwaehjVvOq7F2gboEXCyJJQZFPGMPf+m6EVgIkP0FQQUyHYIEC+R5k3CJohZWhVPORuvGp+n2IbbvG3AceWHZVWUiYNDNM+aJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xz1Cz4h0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xz1Cz4h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791092795; x=1822628795;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GTPrCG6fGm2wmurzHDYCfAnFrH4u5dt1aXAVZHgsBAg=;
  b=Xz1Cz4h0trCA/GsBb5WsRUTS3YdtzP33nYZulIqgWgmaZmW+b/ak4+7G
   AFbAWBlKcNzs8Dky473PywSfRAeyZHuH9cfaYDN1PSNJ8YDgd2RZuYFz6
   KccuN2pOikDbTknLNToED7jwhaBYqRwKR7/vJsATmsctGvh0VZHen/WLJ
   5f6rSqv4P5N6Vsvdyq+79DTXNKx+YsZvI7/yf8K02wNrsOo9EMaF+05ab
   lm6O4/kr7GlnOGxzlPGfALlvxgJvQvrgASgz4pQj11zNWFP9KbhJ52vsZ
   ePt+DqKHKNs7CYRgQ9oACknWQnJPbGGNxuicI3/00+nnRk+J2zCmXeiED
   w==;
X-CSE-ConnectionGUID: isxLBkDKQQuQOG474XRmkA==
X-CSE-MsgGUID: jZcMF9+3SCGGvKh9gKPk1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91820673"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91820673"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 22:46:34 -0700
X-CSE-ConnectionGUID: QuwHQlYaRseQJu/fOY5n6w==
X-CSE-MsgGUID: 7uamM5PPQ/S8sX0Zf5RY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="304512884"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Oct 2026 22:46:33 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDF3P-000000000D1-1F6w;
	Sun, 04 Oct 2026 05:46:31 +0000
Date: Sun, 04 Oct 2026 07:45:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_pagemap.c:480:12: error: call to
 '__compiletime_assert_425' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202610040740.EoZ1nOY4-lkp@intel.com>
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
head:   6addb4f385570ebc11c4eb499a4f1c149f313e84
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 drm/pagemap: Correct cpage=
s calculation for migrate_vma_setup
date:   7 months ago
:::::: branch date: 86 minutes ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-r2302-20261003 (https://download.01.org/0day-ci/a=
rchive/20261004/202610040740.EoZ1nOY4-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261004/202610040740.EoZ1nOY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate=
_vma_setup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610040740.EoZ1nOY4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_425' declared with 'error' attribute: BUILD_BUG failed
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
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_425
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
