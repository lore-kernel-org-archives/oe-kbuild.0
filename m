Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4813777E
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Nov 2025 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762678287; cv=none; b=urAMC9zERFw2cfRQKCfdVaweoFpOWqKNeV/mQVssYxH8dSO1yy92mYRECR5x0R7Km0EnA7i6mYhdPrqAmGZM/gLDzys6r+NRmnWqNZ7jrQdcPganXFvx4xDtAHe2qXHSZfq/x3kbjBRzlX0ElL5ah0qupWxhChJG4malQE1f0C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762678287; c=relaxed/simple;
	bh=fcuxkeI3WV3aoGO4jXi/NzoZpcf+jNTx0aDLDgdkOqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYlrgUjSH/NB2GcDf6UTDptNIoHakOh+uk3ifTgmP/gtGAB9MhZnKH8CfsA2sFfNZfH3qe7vBcJY2Z9bDCZUGvwE8aPngDQwKmD711MfKpppWni7aSVfT11iHZZ18hKag7o/Qilz+V+2a3+SmoR2THuj4+7bBULMMJnPvbIiTOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkvCfO2B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkvCfO2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762678286; x=1794214286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcuxkeI3WV3aoGO4jXi/NzoZpcf+jNTx0aDLDgdkOqA=;
  b=GkvCfO2BzKiJkra/DlL6gW9Rdi6PVAw2o2ee1S9VqYxMpGrhyPpqwxye
   foig13f3upgWwryyBPQLPi1rc3UXYGJ5Qtm5Zo191eVK549ENcZ2V8jg9
   GqjnPTgI52+StuCW5PGCSfFohjbWQx3AKxt+JdIi/DarI5Aw5I0G6m9J9
   i87OE7iiU2G8eyQFpmGE1lNQEp5VjgAROmwJqREf5XmsSo5ED6/p4ARIs
   7L8zvcHvaQQaLozUH6uYSIj3xWfVznVXjHvlHHkL++/3erDzhU1yh3fV5
   Z6ALh80WzLVsQd3skojOOUJS64Tykfw06lvJyiwzGyfTBQG158HZrIshD
   Q==;
X-CSE-ConnectionGUID: /yb1Go9RQYCs81vJFGWsNA==
X-CSE-MsgGUID: lJqS6ZUbRR6xY2uQ16HBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64461429"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="64461429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 00:51:25 -0800
X-CSE-ConnectionGUID: Q0OUnWwTT0OlHofMHKImFg==
X-CSE-MsgGUID: AshBjX/LRWS22lLoR83Acg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="225669962"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2025 00:51:24 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI18r-0001t9-28;
	Sun, 09 Nov 2025 08:51:21 +0000
Date: Sun, 9 Nov 2025 16:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH iwl-next v3 2/9] ice: use cacheline groups for
 ice_rx_ring structure
Message-ID: <202511091627.EbdrWxQH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251107-jk-refactor-queue-stats-v3-2-771ae1414b2e@intel.com>
References: <20251107-jk-refactor-queue-stats-v3-2-771ae1414b2e@intel.com>
TO: Jacob Keller <jacob.e.keller@intel.com>
TO: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
TO: Tony Nguyen <anthony.l.nguyen@intel.com>
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Simon Horman <horms@kernel.org>
CC: intel-wired-lan@lists.osuosl.org
CC: netdev@vger.kernel.org
CC: Jacob Keller <jacob.e.keller@intel.com>

Hi Jacob,

kernel test robot noticed the following build errors:

[auto build test ERROR on c5acd2847bb5371988d6b5c165b0776967cc7da2]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/ice-initialize-ring_stats-syncp/20251108-073443
base:   c5acd2847bb5371988d6b5c165b0776967cc7da2
patch link:    https://lore.kernel.org/r/20251107-jk-refactor-queue-stats-v3-2-771ae1414b2e%40intel.com
patch subject: [PATCH iwl-next v3 2/9] ice: use cacheline groups for ice_rx_ring structure
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-buildonly-randconfig-003-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091627.EbdrWxQH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091627.EbdrWxQH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511091627.EbdrWxQH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_main.c:10:
   In file included from drivers/net/ethernet/intel/ice/ice.h:60:
>> drivers/net/ethernet/intel/ice/ice_txrx.h:314:2: error: call to '__compiletime_assert_1004' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct ice_rx_ring, __cacheline_group_end__cl1) - offsetofend(struct ice_rx_ring, __cacheline_group_begin__cl1) > (1 << (5))
     314 |         CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl1, SMP_CACHE_BYTES);
         |         ^
   include/linux/cache.h:160:2: note: expanded from macro 'CACHELINE_ASSERT_GROUP_SIZE'
     160 |         BUILD_BUG_ON(offsetof(TYPE, __cacheline_group_end__##GROUP) - \
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:93:1: note: expanded from here
      93 | __compiletime_assert_1004
         | ^
   1 error generated.


vim +314 drivers/net/ethernet/intel/ice/ice_txrx.h

e72bba21355dbb Maciej Fijalkowski 2021-08-19  311  
ddd56a7d754a02 Jacob Keller       2025-11-07  312  static inline void ice_rx_ring_struct_check(void)
ddd56a7d754a02 Jacob Keller       2025-11-07  313  {
ddd56a7d754a02 Jacob Keller       2025-11-07 @314  	CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl1, SMP_CACHE_BYTES);
ddd56a7d754a02 Jacob Keller       2025-11-07  315  	CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl2, SMP_CACHE_BYTES);
ddd56a7d754a02 Jacob Keller       2025-11-07  316  	CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl3, SMP_CACHE_BYTES);
ddd56a7d754a02 Jacob Keller       2025-11-07  317  	CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl4, SMP_CACHE_BYTES);
ddd56a7d754a02 Jacob Keller       2025-11-07  318  	CACHELINE_ASSERT_GROUP_SIZE(struct ice_rx_ring, cl5, SMP_CACHE_BYTES);
ddd56a7d754a02 Jacob Keller       2025-11-07  319  }
ddd56a7d754a02 Jacob Keller       2025-11-07  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
