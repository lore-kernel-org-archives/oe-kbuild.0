Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D923876C1
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523720; cv=none; b=X2etSv1Cwfeof74eB0UR88XwbHB69ULqDxIYeWflFiqRH5lxqtmLCRTm2NVKsQGyedyJV+r08UI+/rKKsdSyrYP9k90IShiK1ZMDjaqJUkBUUoNuT25eOhG2G2XyHLdVdw42nPCrJXlR6JMjL0SPkdtIBg9zeleW40SUSLU5HeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523720; c=relaxed/simple;
	bh=cmWI4uVHQMCtf7SlhhvVYscqA1mYuU0J7a2EdmLHLsM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O4gELa+twoCI83gEjKzm4JZ+dPIe2QK60M0XBW7aYGJD6wXOhNCBqS+vtfAkpeiqKrU+YWwPf60W9l/xnoVOqbpE0U72gaFVtDlYwMO/lcA7NFaX4Eyq5d9Z62df7IbNUpYxyvFKrDIV91oPRLO0I3Ny/ThgqMPmLTCHi2XrjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wop2XqOv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wop2XqOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780523719; x=1812059719;
  h=date:from:to:cc:subject:message-id;
  bh=cmWI4uVHQMCtf7SlhhvVYscqA1mYuU0J7a2EdmLHLsM=;
  b=Wop2XqOvMnqXNORNhg/8se926dO0sBTT0FwirF7hogU8O74u50aBPUct
   UwzKfGVyYiwZL+YwLTO4OzmiaM3trJW+8xXg9/hJCwC/22GAip+O9KcYD
   BO2n5hT5pfVTJhXeoWyC/vhuRBKIWYtOR6OORQE4X2h/pAMVmhXLPcIk/
   njOkawWiON11iJsuzIac7eSbZjk6ypIE57GcIh1c8VOh4erqenT+4Q/T6
   nn9KVMbE/RpIjpyDWoaH55f2bFHgC1vZ973d2CS1fweloQ0qWQGQy6dM4
   tNSAB9pZ4nzuReBLnEyUeechyZlh4KVzTDamyCyPPA0NzIIZQhYwUB5mV
   Q==;
X-CSE-ConnectionGUID: 9ncfyWv2RnK6YF/YdufmSw==
X-CSE-MsgGUID: KbSRdCSKTsKnF6x9HA8Awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80487666"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="80487666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 14:55:19 -0700
X-CSE-ConnectionGUID: UcHcAldUTeKCUYe4+ZAD5g==
X-CSE-MsgGUID: L2Xk+fQxQlGiIJAlGvqMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="248308687"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 14:55:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUtYQ-00000000Dva-41ar;
	Wed, 03 Jun 2026 21:55:14 +0000
Date: Thu, 04 Jun 2026 05:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iova-kunit.c:242:6: warning: variable
 'fallback_count' set but not used
Message-ID: <202606040520.zTgrYB2u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Rik-van-Riel/iova-convert-from-rbtree-to-maple-tree/20260603-114646, commit: 498b2497289394603b792b3217ebeedf12768f2c"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Rik van Riel <riel@meta.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/iova-convert-from-rbtree-to-maple-tree/20260603-114646
head:   e5e750d682ed81f80f2444ed276aba87a205ffee
commit: 498b2497289394603b792b3217ebeedf12768f2c iova: add KUnit test suite
date:   18 hours ago
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260604/202606040520.zTgrYB2u-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040520.zTgrYB2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606040520.zTgrYB2u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iova-kunit.c:242:6: warning: variable 'fallback_count' set but not used [-Wunused-but-set-variable]
     242 |         int fallback_count = 0;
         |             ^
   1 warning generated.


vim +/fallback_count +242 drivers/iommu/iova-kunit.c

498b2497289394 Rik van Riel 2026-06-02  232  
498b2497289394 Rik van Riel 2026-06-02  233  /*
498b2497289394 Rik van Riel 2026-06-02  234   * Mimic dma-iommu's pci_32bit_workaround pattern: every alloc first
498b2497289394 Rik van Riel 2026-06-02  235   * tries a small restricted limit; if that fails, retry with the 64-bit
498b2497289394 Rik van Riel 2026-06-02  236   * limit. Verifies that the navigate-to-limit search survives rapid
498b2497289394 Rik van Riel 2026-06-02  237   * switching between different limit_pfn values.
498b2497289394 Rik van Riel 2026-06-02  238   */
498b2497289394 Rik van Riel 2026-06-02  239  static void test_pci_32bit_workaround_pattern(struct kunit *test)
498b2497289394 Rik van Riel 2026-06-02  240  {
498b2497289394 Rik van Riel 2026-06-02  241  	struct iova_test_ctx *ctx = test->priv;
498b2497289394 Rik van Riel 2026-06-02 @242  	int fallback_count = 0;
498b2497289394 Rik van Riel 2026-06-02  243  	int i;
498b2497289394 Rik van Riel 2026-06-02  244  
498b2497289394 Rik van Riel 2026-06-02  245  	for (i = 0; i < 500; ++i) {
498b2497289394 Rik van Riel 2026-06-02  246  		unsigned long size = (i % 4) + 1;
498b2497289394 Rik van Riel 2026-06-02  247  		struct iova *iova = alloc_iova(&ctx->iovad, size,
498b2497289394 Rik van Riel 2026-06-02  248  					       TEST_LIMIT_32BIT_RESTRICTED,
498b2497289394 Rik van Riel 2026-06-02  249  					       true);
498b2497289394 Rik van Riel 2026-06-02  250  
498b2497289394 Rik van Riel 2026-06-02  251  		if (!iova) {
498b2497289394 Rik van Riel 2026-06-02  252  			iova = alloc_iova(&ctx->iovad, size,
498b2497289394 Rik van Riel 2026-06-02  253  					  TEST_LIMIT_64BIT, true);
498b2497289394 Rik van Riel 2026-06-02  254  			fallback_count++;
498b2497289394 Rik van Riel 2026-06-02  255  		}
498b2497289394 Rik van Riel 2026-06-02  256  		if (!iova)
498b2497289394 Rik van Riel 2026-06-02  257  			break;
498b2497289394 Rik van Riel 2026-06-02  258  	}
498b2497289394 Rik van Riel 2026-06-02  259  	KUNIT_EXPECT_TRUE(test, iova_domain_verify_invariants(&ctx->iovad));
498b2497289394 Rik van Riel 2026-06-02  260  	KUNIT_EXPECT_GT(test, i, 0);
498b2497289394 Rik van Riel 2026-06-02  261  }
498b2497289394 Rik van Riel 2026-06-02  262  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
