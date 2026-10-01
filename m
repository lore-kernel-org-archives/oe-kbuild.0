Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D613B0582
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875900; cv=none; b=YT7JSbM2aJRq0faa4JdrV8N5iizRCthRlpnBzbUcNsPoScjEJlaHwxDTwX1Xh9HMa1bRO8ip295Qu61xSF1oeX1Q0iWdXO9ZGne4nEg4R6n6jdNZ1FnG/FL0SbjCaYaoD6oJM6bmswcbNqN4J15TLc6JMynulnA/DSVcKjxcWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875900; c=relaxed/simple;
	bh=DEmpQVMhVWkVmXl+IeWfvNQhXYwQNYKBBjWtrcsq+70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F0WzZUhzS3qtgZaXZA+m1atKcqyAlVPfCFPyTxqMQgbpWZ+FPrCQce/yzmnhXSXhsp/QjYu+fuvx1WXtZjHr0OaGvs6k68jkflWx6fDqbIEIrzx8jcT+eHtwpsCPaV5Z4WJ6XI4DmTXU2WBzxvuT8PcGdV27wppIjWiFRhkjQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6jB9484; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6jB9484"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790875899; x=1822411899;
  h=date:from:to:cc:subject:message-id;
  bh=DEmpQVMhVWkVmXl+IeWfvNQhXYwQNYKBBjWtrcsq+70=;
  b=J6jB9484KSgM+vMgyg6N9EaOJ5AGYuJUNSkTmWnw20v9h75OlCd1QSmw
   tUWXZSSP8NlKdpVtmprGoUvYQopTj2owwq1ppA/mZYbqQhGnYua0c/5w8
   Dm7/b/EBVXW57Ms/L4LKh2APgkPF4oSUH/FkaVtVRWQPVmtxtE1R7cTN7
   +Vm1qzmE9DNu0TgXc9XN+cBuH0/+bZuw3atSmiL04YcYsf7bLgFMadQtb
   W6wAvXurRpxSvs0wqEthODixXx0GPCOFlaP6Iq7V6p0CBpdbztMoWJ9Gb
   GTHVjHG3TE0HeXdxyGiN9Fm0K1pfdLFOnNm1o2Ye9t02hGLzV5bfvKUPp
   Q==;
X-CSE-ConnectionGUID: rezkpmFZQxCjGDxuXcZuow==
X-CSE-MsgGUID: 8/nAOnHoQfO7OVthnxsGtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90412594"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90412594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 10:31:38 -0700
X-CSE-ConnectionGUID: RSQ67M/oTkiOzMrN54QTMw==
X-CSE-MsgGUID: FAw4HCIhSpG9z+E943vQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275585344"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2026 10:31:36 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCKd4-0000000009v-28SL;
	Thu, 01 Oct 2026 17:31:34 +0000
Date: Thu, 01 Oct 2026 19:31:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 291/291]
 lib/radix-tree.c:1596:2: error: call to '__compiletime_assert_248' declared
 with 'error' attribute: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS +
 __GFP_BITS_SHIFT > 32
Message-ID: <202610011945.vMje6M8l-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Vaibhav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   6ca16190387e60c828c133b84a509e63536c1bb0
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [291/291] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
:::::: branch date: 23 hours ago
:::::: commit date: 2 years ago
config: i386-randconfig-2102-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011945.vMje6M8l-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011945.vMje6M8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610011945.vMje6M8l-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for function 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^
   lib/radix-tree.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         | ^
         | static 
>> lib/radix-tree.c:1596:2: error: call to '__compiletime_assert_248' declared with 'error' attribute: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:375:2: note: expanded from macro 'compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:363:2: note: expanded from macro '_compiletime_assert'
     363 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:356:4: note: expanded from macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:151:1: note: expanded from here
     151 | __compiletime_assert_248
         | ^
   1 warning and 1 error generated.


vim +1596 lib/radix-tree.c

^1da177e4c3f415 Linus Torvalds            2005-04-16  1591  
^1da177e4c3f415 Linus Torvalds            2005-04-16  1592  void __init radix_tree_init(void)
^1da177e4c3f415 Linus Torvalds            2005-04-16  1593  {
d544abd5ff7d8b0 Sebastian Andrzej Siewior 2016-11-03  1594  	int ret;
7e7844226f10532 Michal Hocko              2017-05-03  1595  
7e7844226f10532 Michal Hocko              2017-05-03 @1596  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);

:::::: The code at line 1596 was first introduced by commit
:::::: 7e7844226f1053236b6f6d5d122a06509fb14fd9 lockdep: allow to disable reclaim lockup detection

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
