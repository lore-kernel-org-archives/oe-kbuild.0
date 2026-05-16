Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B09317993
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778891586; cv=none; b=HFaGSs2QeXydAp3sga1mwHrKWyksv1AOdAzTm9+MOT0vWizy7tJClTHRt9cpEvq+caJoKZkPIhkXshn3WHHGNkhHCr41ClL5TT6JsfUoQubi6Wo+Rm9nhhnf5QQ4H2v+kNbsHHQCYMWmBtoZp9udpzRU4mxxsBL451xU4/FSvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778891586; c=relaxed/simple;
	bh=3GRvnwlZG4apVHu83L4N12+N4+56iqUEhFM9C0O0WXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnG1jitZrvRiA+6IQ4o+zI8USV9248GLw5CqSnPdLqEwols9IfYt1UUZx+YatgjxXh21fqojum7hlnLKGsIAVPx4vr2r2LvRaPJbSrbBRaVXhN1A47DrEq7Kbpq0fF5DjxI7UhICXZ3U/3oi5LtQknXOL3F4zuo9QhyQqlPA9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UraXudG5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UraXudG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778891584; x=1810427584;
  h=date:from:to:cc:subject:message-id;
  bh=3GRvnwlZG4apVHu83L4N12+N4+56iqUEhFM9C0O0WXA=;
  b=UraXudG5LvbHi1Oqmbc7HGMhTr5aH7dQPKOUAX96eGOOXR4r/llWeHzw
   nUX6VO439pYWAdU9RQ7cdIBBkIlM/TMB/7szOW38moI6ua1V1xSip5ZOE
   8nmIe3Xb0gzkoSExXPFf9MGU0182PeGUWg/8KxcCwAcVCJTvvX8KpxczD
   m7v1gdqb8DFGR3kGoR6qSD2c/wkWlrSPzLHkTx4u4pOIxjIVJpLNDgbC8
   w2FLqSNZLA5UrkF8M7PyBtG3YUEu1aF4qMap5pHSY5jtolqVFTTIvHh0Q
   YSjkT0C7jrmdyV9TBOcWZNyNTA9giKRK97HYTi1fAF4zUzH1hHIt2SW5P
   Q==;
X-CSE-ConnectionGUID: WnKlG87TRLyHjJqkLdyKPQ==
X-CSE-MsgGUID: lf/QwHb9RliQ3ZZ+F8xv3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79828874"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79828874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 17:33:04 -0700
X-CSE-ConnectionGUID: mRgJY/N6TeqUN8DDktmCsA==
X-CSE-MsgGUID: jityvs4yRpa/Gvh7h8o2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="239083209"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 May 2026 17:33:03 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO2xg-000000000In-2OyR;
	Sat, 16 May 2026 00:33:00 +0000
Date: Sat, 16 May 2026 08:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lwn:docs-mw 37/42] Warning: arch/arm/mach-omap2/vc.c:400
 Excess function parameter 'off_mode' description in 'omap3_set_i2c_timings'
Message-ID: <202605160857.ZIE3nO9J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: Manual check reason: "possibly wrong bisection of lwn change"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-doc@vger.kernel.org
TO: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Jonathan Corbet <corbet@lwn.net>

Hi Shuicheng,

First bad commit (maybe != root cause):

tree:   git://git.lwn.net/linux.git docs-mw
head:   e27108800bb8a8be08300ce14d532f7225e4c50f
commit: 46d9c16115cf046ce564f0230126cae785f73826 [37/42] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm-randconfig-004-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160857.ZIE3nO9J-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160857.ZIE3nO9J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605160857.ZIE3nO9J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm/mach-omap2/vc.c:400 Excess function parameter 'off_mode' description in 'omap3_set_i2c_timings'
>> Warning: arch/arm/mach-omap2/vc.c:400 Excess function parameter 'off_mode' description in 'omap3_set_i2c_timings'
--
   Warning: arch/arm/mach-omap2/prm33xx.c:83 function parameter 'rstctrl_offs' not described in 'am33xx_prm_assert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:83 Excess function parameter 'rstctrl_reg' description in 'am33xx_prm_assert_hardreset'
   Warning: arch/arm/mach-omap2/prm33xx.c:113 function parameter 'rstctrl_offs' not described in 'am33xx_prm_deassert_hardreset'
   Warning: arch/arm/mach-omap2/prm33xx.c:113 function parameter 'rstst_offs' not described in 'am33xx_prm_deassert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:113 Excess function parameter 'rstctrl_reg' description in 'am33xx_prm_deassert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:113 Excess function parameter 'rstst_reg' description in 'am33xx_prm_deassert_hardreset'
   Warning: arch/arm/mach-omap2/prm33xx.c:322 expecting prototype for am33xx_prm_global_warm_sw_reset(). Prototype was for am33xx_prm_global_sw_reset() instead
   Warning: arch/arm/mach-omap2/prm33xx.c:83 function parameter 'rstctrl_offs' not described in 'am33xx_prm_assert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:83 Excess function parameter 'rstctrl_reg' description in 'am33xx_prm_assert_hardreset'
   Warning: arch/arm/mach-omap2/prm33xx.c:113 function parameter 'rstctrl_offs' not described in 'am33xx_prm_deassert_hardreset'
   Warning: arch/arm/mach-omap2/prm33xx.c:113 function parameter 'rstst_offs' not described in 'am33xx_prm_deassert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:113 Excess function parameter 'rstctrl_reg' description in 'am33xx_prm_deassert_hardreset'
>> Warning: arch/arm/mach-omap2/prm33xx.c:113 Excess function parameter 'rstst_reg' description in 'am33xx_prm_deassert_hardreset'
--
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'part' not described in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'inst' not described in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'rstctrl_offs' not described in 'omap4_prminst_is_hardreset_asserted'
>> Warning: arch/arm/mach-omap2/prminst44xx.c:100 Excess function parameter 'rstctrl_reg' description in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'part' not described in 'omap4_prminst_assert_hardreset'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'inst' not described in 'omap4_prminst_assert_hardreset'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'rstctrl_offs' not described in 'omap4_prminst_assert_hardreset'
>> Warning: arch/arm/mach-omap2/prminst44xx.c:124 Excess function parameter 'rstctrl_reg' description in 'omap4_prminst_assert_hardreset'
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'part' not described in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'inst' not described in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:100 function parameter 'rstctrl_offs' not described in 'omap4_prminst_is_hardreset_asserted'
>> Warning: arch/arm/mach-omap2/prminst44xx.c:100 Excess function parameter 'rstctrl_reg' description in 'omap4_prminst_is_hardreset_asserted'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'part' not described in 'omap4_prminst_assert_hardreset'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'inst' not described in 'omap4_prminst_assert_hardreset'
   Warning: arch/arm/mach-omap2/prminst44xx.c:124 function parameter 'rstctrl_offs' not described in 'omap4_prminst_assert_hardreset'
>> Warning: arch/arm/mach-omap2/prminst44xx.c:124 Excess function parameter 'rstctrl_reg' description in 'omap4_prminst_assert_hardreset'
--
   Warning: arch/arm/mach-omap2/voltage.c:331 function parameter 'voltdms' not described in 'voltdm_init'
>> Warning: arch/arm/mach-omap2/voltage.c:331 Excess function parameter 'voltdm_list' description in 'voltdm_init'
   Warning: arch/arm/mach-omap2/voltage.c:331 function parameter 'voltdms' not described in 'voltdm_init'
>> Warning: arch/arm/mach-omap2/voltage.c:331 Excess function parameter 'voltdm_list' description in 'voltdm_init'
--
>> Warning: drivers/regulator/ab8500.c:196 Excess struct member 'expand_register' description in 'ab8500_regulator_info'
>> Warning: drivers/regulator/ab8500.c:196 Excess struct member 'expand_register' description in 'ab8500_regulator_info'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
