Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94C381E8B
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 05:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092519; cv=none; b=qiRJUUt1Coz+I/vBJyKLX5nBsuONLMolSBdANvTQj/d8QbqppH/cf+qm4COvUZcQmuiDkaXpB4lcf7vUMdHKQT7b+W8i/DXcU813szc0E9tGb/lmT70Q0LPJtuxOY+ChGTCBv3cRU3KhZyzlQ5rixNDGN07zLy4X3LbvwvzFqC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092519; c=relaxed/simple;
	bh=V87F9GAo4bMAMd/rQmCn3FhR1Ktger/85iwSlL8KiOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rIxbjf9oErT/0Awi+CzMkjhylosPluK9JReJkgMQwruMfTAMzqG903+WcaL+3llGFh/Bth4xistqXmVWFS0YG6o9Wf/P5XUQa2X1HApyEGMxa/NJnACSIXc9nj49btTfkrL837Y6+tz71s2TCgiIehT2NQ1R9ECmh0Qp7mv/t28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCYO33Rh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCYO33Rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791092516; x=1822628516;
  h=date:from:to:cc:subject:message-id;
  bh=V87F9GAo4bMAMd/rQmCn3FhR1Ktger/85iwSlL8KiOs=;
  b=dCYO33RhL5G+5Ulcub8RhF86vqHclSf12SHVfQlV3YfCSyPcxEM+5qV9
   kowwAf5UMbphddJuFVbaHzOmmvVCttQWUWN1bPpxBgQH6bklkyH9ahgdZ
   Ttkm5eNjPuE2ff1uEVDW0hMJXsito9q832qBP++C1Y5a2hqAtc+L+wT6M
   gr5uJ91OHd0YG5UYZoh5wlc6IIRv1KuChTuHdqWW9qSQtAT/jYt/f7XwK
   pgEUFAELxnUK55/B03DWrNjoAPV2Dy247WCSTXGwqsExSqR8G2FgN2nr7
   QiP/mDkypbt3UAIb7+SP9ni6obfC/DftmRKs30M2cICyriw+pfCgL7mfX
   Q==;
X-CSE-ConnectionGUID: iYXqkLMpT3GTzGkgl0F9kQ==
X-CSE-MsgGUID: 3iN8wvIUQ8a4BKIJ5p4v4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79356979"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="79356979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 22:41:52 -0700
X-CSE-ConnectionGUID: H1hZfPwqQwaCxlyCDkTuWw==
X-CSE-MsgGUID: g2sVdZDpRCOFhLEWr3cyuw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2026 22:41:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDEyr-00000000UW7-0WNu;
	Sun, 04 Oct 2026 05:41:49 +0000
Date: Sun, 04 Oct 2026 13:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/mm_inline.h:149:2: error: call to
 '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON
 failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
Message-ID: <202610041334.CMzP5M1B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512, commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e"
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kairui Song <kasong@tencent.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: 1a4c8c8874fb1ac601f32faba8141125425b6f1e mm/mglru: frequency guided workingset promotion (MGLRU-FG)
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sparc64-randconfig-1001-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041334.CMzP5M1B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041334.CMzP5M1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041334.CMzP5M1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'inc_min_seq'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'inc_max_seq'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'sort_folio'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'scan_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'isolate_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:88:1: note: expanded from here
      88 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'evict_folios'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
--
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'lru_gen_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'workingset_eviction'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_501' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: called by function 'lru_tier_from_refs'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'lru_gen_refault'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   include/linux/mm_inline.h:149:2: note: inlined by function 'workingset_refault'
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:183:1: note: expanded from here
     183 | __compiletime_assert_501
         | ^
   2 errors generated.


vim +149 include/linux/mm_inline.h

ac35a490237446b Yu Zhao     2022-09-18  146  
1a4c8c8874fb1ac Kairui Song 2026-10-03  147  static inline int lru_tier_from_refs(unsigned int refs)
ac35a490237446b Yu Zhao     2022-09-18  148  {
1a4c8c8874fb1ac Kairui Song 2026-10-03 @149  	BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
1a4c8c8874fb1ac Kairui Song 2026-10-03  150  	VM_WARN_ON_ONCE(refs > LRU_REFS_MAX);
1a4c8c8874fb1ac Kairui Song 2026-10-03  151  	if (refs < LRU_REFS_WORKINGSET)
1a4c8c8874fb1ac Kairui Song 2026-10-03  152  		return 0;
1a4c8c8874fb1ac Kairui Song 2026-10-03  153  	return fls(refs - 1);
ac35a490237446b Yu Zhao     2022-09-18  154  }
ac35a490237446b Yu Zhao     2022-09-18  155  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
