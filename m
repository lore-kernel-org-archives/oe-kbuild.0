Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8960F1FF7B3
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748686681; cv=none; b=MecwhSSr8dD/IWBDPv4phuVRiXOBsJgBxIbAacPUnw2JWiUnfY8vSIaqeM0ySM7rG+Fd75CpLdp9KM5TI3i4x2661bC6Z29QsiGxOzOqJHd6vBFHRlQYCooZuxHsF55c7dU+4tFpNE3AG2j2oUEriKFH5DF9VbcWNFoCJAS0V8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748686681; c=relaxed/simple;
	bh=k6IK+mOckM0Qmzx9AUjJftZClAiyZ6UcSlcevlAroIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyacj4g/mDmGAgiNn8/8lqrhgULRNa71Hl+EN0r5E9J7pCWMrkUinDs16KroA9sVM/KfUz5uwsXKsWi/Pa3w3cZn52Y/mikybqvBySMuMN3047FQByPzqw58uhDAlaBQfleqxEN2PiLONdp2vV0vYL6afe0UfM6tFspLDBujvjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCsfcmPb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCsfcmPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748686680; x=1780222680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6IK+mOckM0Qmzx9AUjJftZClAiyZ6UcSlcevlAroIc=;
  b=SCsfcmPb/lnBZLYnkqqgZnRLA+8DZsEJMdN5MFzrSuVus8QXwMoSVd3T
   Ekp1NywfhBtaWRTWzYG2FPICTTyo89o1HpKcJMBqTJgFQQss9rWMGdDUg
   7bzUI5uRuJ8tyq4IGaRp1hDhQuUCt2y6E3FTYMCQNdm0Qq7VAx1lg/7si
   drde6fzRcGtYupnqQ5UBs12oMgj1vhuKB7ZBqdqkYBDNNVAwZcniX1xGU
   TWn8/0BTg5tjDlugtxAFMgNzv76IjgUrKIadYdg7Ff6c6QemvnXxo7JH0
   wMW3C0xDKZSVJSaL2XR7SRYzTOWqtLWwhrqj3gVnUBwUNErTyw6rFzs08
   A==;
X-CSE-ConnectionGUID: PV3gPU64STemL4ZG/Ub2SQ==
X-CSE-MsgGUID: zB3nmH5FRg6oEejhRkID0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54435775"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="54435775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 03:17:59 -0700
X-CSE-ConnectionGUID: 2EwuRKySRkG7//BkCluzlQ==
X-CSE-MsgGUID: CxBpJpc2RJiRA9dswMu51A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144008397"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 03:17:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLJHn-000YKq-2H;
	Sat, 31 May 2025 10:17:55 +0000
Date: Sat, 31 May 2025 18:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf v2] xsk: Fix out of order segment free in
 __xsk_generic_xmit()
Message-ID: <202505311701.ysDKIyGZ-lkp@intel.com>
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
In-Reply-To: <20250530103456.53564-1-e.kubanski@partner.samsung.com>
References: <20250530103456.53564-1-e.kubanski@partner.samsung.com>
TO: "e.kubanski" <e.kubanski@partner.samsung.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: bjorn@kernel.org
CC: magnus.karlsson@intel.com
CC: maciej.fijalkowski@intel.com
CC: jonathan.lemon@gmail.com
CC: "e.kubanski" <e.kubanski@partner.samsung.com>

Hi e.kubanski,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/e-kubanski/xsk-Fix-out-of-order-segment-free-in-__xsk_generic_xmit/20250530-183723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20250530103456.53564-1-e.kubanski%40partner.samsung.com
patch subject: [PATCH bpf v2] xsk: Fix out of order segment free in __xsk_generic_xmit()
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250531/202505311701.ysDKIyGZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311701.ysDKIyGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311701.ysDKIyGZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:2184:6: error: call to '__compiletime_assert_1551' declared with 'error' attribute: FIELD_PREP: value too large for the field
    2184 |             FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
         |             ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:550:2: note: expanded from macro '_compiletime_assert'
     550 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:543:4: note: expanded from macro '__compiletime_assert'
     543 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:23:1: note: expanded from here
      23 | __compiletime_assert_1551
         | ^
   1 error generated.


vim +2184 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

0cb4c0a13723ef Alexander Duyck 2024-07-12  2173  
0cb4c0a13723ef Alexander Duyck 2024-07-12  2174  static void fbnic_config_drop_mode_rcq(struct fbnic_napi_vector *nv,
0cb4c0a13723ef Alexander Duyck 2024-07-12  2175  				       struct fbnic_ring *rcq)
0cb4c0a13723ef Alexander Duyck 2024-07-12  2176  {
0cb4c0a13723ef Alexander Duyck 2024-07-12  2177  	u32 drop_mode, rcq_ctl;
0cb4c0a13723ef Alexander Duyck 2024-07-12  2178  
0cb4c0a13723ef Alexander Duyck 2024-07-12  2179  	drop_mode = FBNIC_QUEUE_RDE_CTL0_DROP_IMMEDIATE;
0cb4c0a13723ef Alexander Duyck 2024-07-12  2180  
0cb4c0a13723ef Alexander Duyck 2024-07-12  2181  	/* Specify packet layout */
0cb4c0a13723ef Alexander Duyck 2024-07-12  2182  	rcq_ctl = FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_DROP_MODE_MASK, drop_mode) |
0cb4c0a13723ef Alexander Duyck 2024-07-12  2183  	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_HROOM_MASK, FBNIC_RX_HROOM) |
0cb4c0a13723ef Alexander Duyck 2024-07-12 @2184  	    FIELD_PREP(FBNIC_QUEUE_RDE_CTL0_MIN_TROOM_MASK, FBNIC_RX_TROOM);
0cb4c0a13723ef Alexander Duyck 2024-07-12  2185  
0cb4c0a13723ef Alexander Duyck 2024-07-12  2186  	fbnic_ring_wr32(rcq, FBNIC_QUEUE_RDE_CTL0, rcq_ctl);
0cb4c0a13723ef Alexander Duyck 2024-07-12  2187  }
0cb4c0a13723ef Alexander Duyck 2024-07-12  2188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
