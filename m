Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA037DEBE
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 20:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519215; cv=none; b=UNgZh2kvPgmwVxn+7nzvKBguAXOJ/GNY9DBJU+6oOdra+rBg2k/7FjsHozuNjJ9sVKCVjFCRHYLxAwaHgs8cq/v0BMZZZcxeWOQsn4sVcFvL4eAGVQ0sDlucHUKKnQSEjVlzb1mXbamyrGMiZ1CLHqmRfTWej+iZnKUWqOTf6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519215; c=relaxed/simple;
	bh=D2XjIStvK5ZhoGIvXIJ45CLZBUzfCGUMlvo7SqfH+O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uGeMULxZOHKHyjiv2WYOiRfQAEW5D+9bhYq8HBLOGNb97rRIhPrnpTsdjnQAJ+Va+XFDHeNCaESeBpHCrhz4Ktjp/8zLZcaZx617cpPaZh/KcUudSDTr0XG/v5MRTGIaPMefaee/XCLxL7faMAkTssniXSsxOTBb5a0+Q6ROH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWisLiMX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWisLiMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780519213; x=1812055213;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D2XjIStvK5ZhoGIvXIJ45CLZBUzfCGUMlvo7SqfH+O8=;
  b=NWisLiMXIp8Ckrq2Di5GKR7oXgRMTbjyFIy7rl/T8hoR3tSVdIBEUFKf
   s2PeE/CXPVfsKCsbC4HEpr+BzJl0+mPmFlKx8oT+ljswzWY6WuZW48oNm
   OKd9v6W+PesQ86F+L+ztqDb9MioTRCve5efC5tfFxkgRn7y5ps7xI1ypI
   LQ6z4uPlywjJIWuDpp71x7f0e1Q+JnKq01z+vezoHhZnOiJuTHxCMl1sZ
   9d/da6wL6bJZOTJVKKTWlnYvsILEa1Q39OddXxN8ppEbYhN+m54dvyj90
   xNvjm0C+U22xFYWQOLAYWNXRfqUDWTy8IYBaO+1bMuPT5UEmlDxm4YBdc
   Q==;
X-CSE-ConnectionGUID: JPstxTRMR7SPWISuJCUFjw==
X-CSE-MsgGUID: 1GJ+uFTKS1G7OOorqg2fKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85194661"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="85194661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 13:40:12 -0700
X-CSE-ConnectionGUID: ExDbrHBqTve+i9oIcGUIYw==
X-CSE-MsgGUID: n8t+8jQFRxSWbUiNghSH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="249429688"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2026 13:40:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUsNl-00000000DsU-0KUr;
	Wed, 03 Jun 2026 20:40:09 +0000
Date: Thu, 04 Jun 2026 04:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iova-kunit.c:23:26: warning: conversion from
 'long long unsigned int' to 'long unsigned int' changes value from
 '8796093022207' to '4294967295'
Message-ID: <202606040405.S86Gxama-lkp@intel.com>
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
:::::: Manual check reason: "bisect to a FBC not belonging to original linu=
x-review patches: branch: linux-review/Rik-van-Riel/iova-convert-from-rbtre=
e-to-maple-tree/20260603-114646, commit: 498b2497289394603b792b3217ebeedf12=
768f2c"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rik van Riel <riel@meta.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/iova-co=
nvert-from-rbtree-to-maple-tree/20260603-114646
head:   e5e750d682ed81f80f2444ed276aba87a205ffee
commit: 498b2497289394603b792b3217ebeedf12768f2c iova: add KUnit test suite
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260604/=
202606040405.S86Gxama-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260604/202606040405.S86Gxama-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606040405.S86Gxama-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iova-kunit.c: In function 'test_arbitrary_dma_limits':
>> drivers/iommu/iova-kunit.c:23:26: warning: conversion from 'long long un=
signed int' to 'long unsigned int' changes value from '8796093022207' to '4=
294967295' [-Woverflow]
      23 | #define TEST_LIMIT_56BIT (DMA_BIT_MASK(56) >> PAGE_SHIFT)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova-kunit.c:184:43: note: in expansion of macro 'TEST_LIM=
IT_56BIT'
     184 |         iova =3D alloc_iova(&ctx->iovad, 1, TEST_LIMIT_56BIT, tr=
ue);
         |                                           ^~~~~~~~~~~~~~~~
   drivers/iommu/iova-kunit.c: In function 'test_stress_random':
>> drivers/iommu/iova-kunit.c:23:26: warning: conversion from 'long long un=
signed int' to 'long unsigned int' changes value from '8796093022207' to '4=
294967295' [-Woverflow]
      23 | #define TEST_LIMIT_56BIT (DMA_BIT_MASK(56) >> PAGE_SHIFT)
         |                          ^
   drivers/iommu/iova-kunit.c:275:17: note: in expansion of macro 'TEST_LIM=
IT_56BIT'
     275 |                 TEST_LIMIT_56BIT, TEST_LIMIT_64BIT,
         |                 ^~~~~~~~~~~~~~~~


vim +23 drivers/iommu/iova-kunit.c

498b2497289394 Rik van Riel 2026-06-02  16 =20
498b2497289394 Rik van Riel 2026-06-02  17  #define TEST_GRANULE PAGE_SIZE
498b2497289394 Rik van Riel 2026-06-02  18  /* Highest pfn that fits in 32 =
bits =E2=80=94 triggers the bounded alloc path. */
498b2497289394 Rik van Riel 2026-06-02  19  #define TEST_LIMIT_32BIT (DMA_B=
IT_MASK(32) >> PAGE_SHIFT)
498b2497289394 Rik van Riel 2026-06-02  20  /* 33-bit limit =E2=80=94 exerc=
ises non-power-of-two DMA boundaries. */
498b2497289394 Rik van Riel 2026-06-02  21  #define TEST_LIMIT_33BIT (DMA_B=
IT_MASK(33) >> PAGE_SHIFT)
498b2497289394 Rik van Riel 2026-06-02  22  /* 56-bit limit =E2=80=94 typic=
al server IOMMU address width. */
498b2497289394 Rik van Riel 2026-06-02 @23  #define TEST_LIMIT_56BIT (DMA_B=
IT_MASK(56) >> PAGE_SHIFT)
498b2497289394 Rik van Riel 2026-06-02  24  /* A 64-bit-ish limit well abov=
e dma_32bit_pfn. 1ULL avoids UB on ILP32. */
498b2497289394 Rik van Riel 2026-06-02  25  #define TEST_LIMIT_64BIT ((1ULL=
 << 36) >> PAGE_SHIFT)
498b2497289394 Rik van Riel 2026-06-02  26  /*
498b2497289394 Rik van Riel 2026-06-02  27   * A small <=3D32-bit limit use=
d by tests that want to actually exhaust the
498b2497289394 Rik van Riel 2026-06-02  28   * restricted region within a t=
ractable number of allocations.
498b2497289394 Rik van Riel 2026-06-02  29   */
498b2497289394 Rik van Riel 2026-06-02  30  #define TEST_LIMIT_32BIT_RESTRI=
CTED (TEST_LIMIT_32BIT / 2)
498b2497289394 Rik van Riel 2026-06-02  31 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
