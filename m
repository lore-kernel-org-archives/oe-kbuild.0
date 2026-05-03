Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452D1A0728
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 07:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777795039; cv=none; b=GE7nXJ17YU7MC/7ntoaa/9bJIvQvvuxvb2FwOTDVY3hg1MJA8XWRCzVV2JwvHv4+o+E36DphgdVscKDlhnHkBnLpTONpbr+6Z4lEmGL7VidRAflJjjPdQAp7011Nsnmcxq5NDFe4O5pjwvGXmpObtqFy9PgZbNXFNMkrhSwimcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777795039; c=relaxed/simple;
	bh=iG8k0nht10DV18IFWI+8BomiU9f/H7K0hWdoLu6bKbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o3DbqqJXetWaqo4zM/wYNo6NKCdceoUzhA2jDlk3vLBhSLGfLPmOVqRUsf+gq4WPCFML918Yx4i41CctNMxUziNjs0/bYXj+S7nHocYJG42jpI9eJoelk4xYSZHQlqVslzrxuvJNaGmN8cmi39/azysnqw0JxvT7A6VVd5xBTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP+1LhrP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP+1LhrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777795038; x=1809331038;
  h=date:from:to:cc:subject:message-id;
  bh=iG8k0nht10DV18IFWI+8BomiU9f/H7K0hWdoLu6bKbU=;
  b=YP+1LhrPHlmO+UxSrvRbd5JRQPqM+69csXtDR+Pmxdn/YhiaCbkcW4vN
   8DbYDVfGCsB7P4OoUoCRYNxan0JgzWfjBmHaR28Pn6hxCXL3fX+cBu7uQ
   IyVsisd94RXv9vFRaieelFqB3cDNtuz6hh8XEN1Vj0uDmZX58ymnjttCC
   FeeKRdo2sL+B043ulFwIDYCQjNcEicwZDM2IZiynFuy1dQ7phbrNAz+aB
   2R+3hkglj3S8MUcAUf5P78IN8OpxCgjEz1QaLWkaN+cWplmHyajS+4R8m
   tyA743oMSlKKQu6rRy1A0VZtpkRf7/rhnpql6dFeeE1JhwLpGOHjecfKx
   Q==;
X-CSE-ConnectionGUID: VMkwx8usQy6uUZtkpgBr1g==
X-CSE-MsgGUID: hrKt6EOgTkyKU3CocVpgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89790893"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89790893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 00:57:17 -0700
X-CSE-ConnectionGUID: HC9kkR6+QKus+MDKSRNsLQ==
X-CSE-MsgGUID: rQBiuh0PSEicKvSNCDOfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230638440"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2026 00:57:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJRhR-000000005Un-241x;
	Sun, 03 May 2026 07:57:13 +0000
Date: Sun, 03 May 2026 09:57:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/mm_inline.h:253:2: error: call to
 '__compiletime_assert_559' declared with 'error' attribute: BUILD_BUG_ON
 failed: LRU_REFS_WIDTH < 2
Message-ID: <202605030902.ZydYZJkZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kairui Song <kasong@tencent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-make-lru_zone_size-atomic-and-simplify-sanity-check/20260503-103454
head:   64b560f27addefdad180f484c4bd8ebf96e70a7a
commit: 1f4653a809ca4f16b4f7b5ea15b904032e0ca53b mm: remove PG_workingset
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260503/202605030902.ZydYZJkZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030902.ZydYZJkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030902.ZydYZJkZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:253:2: error: call to '__compiletime_assert_559' declared with 'error' attribute: BUILD_BUG_ON failed: LRU_REFS_WIDTH < 2
     253 |         BUILD_BUG_ON(LRU_REFS_WIDTH < 2);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:699:2: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:78:1: note: expanded from here
      78 | __compiletime_assert_559
         | ^
   1 error generated.


vim +253 include/linux/mm_inline.h

dae08dead353a0 Kairui Song 2026-05-02  244  
dae08dead353a0 Kairui Song 2026-05-02  245  /**
dae08dead353a0 Kairui Song 2026-05-02  246   * folio_mark_workingset_by_bit - Mark a folio as part of the workingset.
dae08dead353a0 Kairui Song 2026-05-02  247   * @folio: the folio.
dae08dead353a0 Kairui Song 2026-05-02  248   *
dae08dead353a0 Kairui Song 2026-05-02  249   * Force set a folio's LRU referenced count to at least LRU_REFS_WORKINGSET.
dae08dead353a0 Kairui Song 2026-05-02  250   */
dae08dead353a0 Kairui Song 2026-05-02  251  static inline void folio_mark_workingset_by_bit(struct folio *folio)
dae08dead353a0 Kairui Song 2026-05-02  252  {
1f4653a809ca4f Kairui Song 2026-05-02 @253  	BUILD_BUG_ON(LRU_REFS_WIDTH < 2);
1f4653a809ca4f Kairui Song 2026-05-02  254  	set_mask_bits(folio_flags(folio, 0), BIT(LRU_REFS_PGOFF + 1), BIT(LRU_REFS_PGOFF + 1));
dae08dead353a0 Kairui Song 2026-05-02  255  }
dae08dead353a0 Kairui Song 2026-05-02  256  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
