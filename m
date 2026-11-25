Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645423;
	b=eTezHB+rAt+/pY1XMdyEzKpKLC/jyAAsHWqFeHvzbcUOIEW+NIoOejJ4rfArl865baoT
	 po8Qjpy0g4jcUUhKuOBzjYqM6yfN84SKLK7ZP0YMFaCzaPwoC8E9hVI9Xullhb5wxOTxq
	 5cxysHkE2DCcm3xtKRkf3cWF2AE+bBauuIPvCXCFccFryJ2w/20dbFgS+PsDLJBL2rmSv
	 i0g/v5rNne0XcUCmYNqthGFN5wjoc1Jo+oth5MHhMwD71fxZsd6FN1WkguuOjvHqgqzra
	 YqqR7pyg9+zzmKMQaQ0Poupprk2dZQgLEucPpwjRZ8TqHzwFivyyewB+ZE+uaac/2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645423;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A+sMa8BjMJRgD/5bORRW5rEJ401tZVAb6afgtGrNc4I=;
	b=37I4HqyMMYBhGOI1fDl1F25IrKcoPyUr3Ltob3Wn338cW8L25sdNyCyDUwMG+RQ4F4LN
	 MiDdzKIXthk6S6XP0hXWEvd+V4M9wI14q4TzyfbVhh1kslJj/ULKBvpgpYzJvBxqgMeW+
	 pXHp2OV2B63Gcv1waByfTbkXJJ7zgXLQ+Ie2ZxGNkLzrc2WzZ4N5uEYKOZVlcqrJ2HhTR
	 9MwBc4nWOz73DTZL/gM3qK2V7tHkPvbDPgUNBeeTIKUehjt/JVkwtTpF6mA27gIX8jOMN
	 KFU/xEUfBfKvrnu1sv9XltBjZHH6kbX327+sTpUIEvTIPXA7n9y6NYkMOm8VYx9tmRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kgbb9pkm;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1FC606A332
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 22:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1FC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kgbb9pkm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795645424; x=1827181424;
  h=date:from:to:cc:subject:message-id;
  bh=bba4/rV26rrRhI90KGRwgn9XGir9CHxAZBq+jqjd3Gc=;
  b=Kgbb9pkmtRVA0tpu3jygDZkwTmNRPTQyIQK3+2VCfvrQl6XgMWiGgkHm
   7TR9ppszHRGgVZOPRwJFjSrT7I0d8YESJjHSTebW35u6EdMGifXyFIb1P
   WT68Szd3VHzjrWlThOtgNsUkHETK3XXxaa0UnFSRaniR+KfgYngd3xyh9
   svXsEi8B+OpGNrQRpLxihnZvhwz9m4MOWyHpB/KSZp2rYBWz9idT5vUhm
   aWFWUuSzqGlEV9LjIdFchumfZ8DJ0+8kEcp4FfZc25FBftGaeP0wCxfoY
   HEmasJqkSGJkAv74gwto3Dmf4AYM8lG9MEkR6yhosuw2pyxHk9fg6mZXH
   Q==;
X-CSE-ConnectionGUID: cHeSiz+1Q0ipV1YHnxiw2g==
X-CSE-MsgGUID: Ht/2IYwwQLe5e1SrmMlQNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4556147"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4556147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:23:43 -0800
X-CSE-ConnectionGUID: 9rquS9UpS9WVBV1EzYEnbA==
X-CSE-MsgGUID: Q9MA/WKqQ22dvj7OjDtPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11876936"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 14:23:41 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWLOr-0000000006x-2yEn;
	Wed, 25 Nov 2026 22:23:37 +0000
Date: Wed, 25 Nov 2026 23:23:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON
 failed: NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS
Message-ID: <20261125231711.jeKdRtx5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hajime Tazaki <thehajime@gmail.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Ricardo Koller <ricarkol@google.com>

Hi Hajime,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 um: allow deselecting CONFIG_MMU
date:   9 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 9 weeks ago
config: um-randconfig-r2309-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125231711.jeKdRtx5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125231711.jeKdRtx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 626ff2b34dbb ("um: allow deselecting CONFIG_MMU")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261125231711.jeKdRtx5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/f2fs/iostat.c: In function 'f2fs_init_iostat':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON failed: NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/f2fs/iostat.c:339:9: note: in expansion of macro 'BUILD_BUG_ON'
     339 |         BUILD_BUG_ON(NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_553 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
