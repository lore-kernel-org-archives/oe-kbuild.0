Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050052F3E
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749414225; cv=none; b=pYWPy+wkytnusgR5OCEPiCh7QDXfbceZqxAlDnFJpsN0gBz6qd0uODzEgp6n9klcLefIn4En7Al8w4bdFrbpXNUedHYVa4kp9ano8NExhX05ozqKMXpUI3Cn3McSSB7Kx9QOD7lqA60irvKkgUuY1LzMrhQd9HgVmQzt6rTQiY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749414225; c=relaxed/simple;
	bh=cGoVobjr825l4Prh4aqr4Un90/YzPCi/P7eCY78nMJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+3/tn8YYyOsYRUFVxiqnepDroWPhPua2IIxZZt9FK+cJSY77SoyI6wgwdUL6qPiDTXwLyZE8mPs8wmC3dugiuvpdyIAcXrFWMJGUMHpIvzUCL9U2kbZlq0vkv7676DqOSkvTIVdURfZ5BxjWe0OtdywOrSbF3BolBEQddldETY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeldO+Rq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeldO+Rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749414224; x=1780950224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGoVobjr825l4Prh4aqr4Un90/YzPCi/P7eCY78nMJ8=;
  b=LeldO+Rq/ZHt7936N8gLeBQUAI8efzqb1znaugke8m5yZjspTmB7aexs
   toDnQEOT0DCcWd1AEtxIIrCN3KHVxVhV0KDMuLTWhKrvKUIXeV37bwDNu
   Pp6eFS14uc6Tea7LvPJYvI9aobfR9ar9rTn8JsKwx3lK1f/8qGXp97kqE
   IPacAPzy1iMT2wDzIqqvC6Dytlya66P19bMAD+JIbNGRuZODa6WI0Vumj
   AWJJyUaT2bnufpgyUJbEYf6HMindGgZfe6vghMow0Q+P7a1+GtNb/P4bJ
   PCc1wDg1qUOTGH/MvQtMnvboF6BE/lhh1TknvmXoXsQzu9xs2m0AZemeM
   A==;
X-CSE-ConnectionGUID: QYmpmbjPSo66/u4a3146og==
X-CSE-MsgGUID: 68UhqrLIRhGdPpE+WqwPtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51400080"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51400080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 13:23:44 -0700
X-CSE-ConnectionGUID: K73r51tyTOuCXcCOq8vVYA==
X-CSE-MsgGUID: ZER0kgWvRTafVbCIMGxkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="177271541"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2025 13:23:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOMYO-0006Xl-0Y;
	Sun, 08 Jun 2025 20:23:40 +0000
Date: Mon, 9 Jun 2025 04:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 29/32]
 include/linux/compiler_types.h:565:39: error: call to
 '__compiletime_assert___COUNTER__' declared with attribute error:
 BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
Message-ID: <202506090419.A0G5I2FK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tal Zussman <tz2294@columbia.edu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   8172857ac52869c411762ce86802d127b0bb7546
commit: 54594582aa30a31c2596575729000f0a60b0a648 [29/32] compiler_types: remove unnecessary indirection in compiletime_assert()
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arc-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090419.A0G5I2FK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506090419.A0G5I2FK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/arc/mm/highmem.c: In function 'kmap_init':
>> include/linux/compiler_types.h:565:39: error: call to '__compiletime_assert___COUNTER__' declared with attribute error: BUILD_BUG_ON failed: FIX_KMAP_SLOTS > PTRS_PER_PTE
     565 |  __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                       ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
     549 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/arc/mm/highmem.c:69:2: note: in expansion of macro 'BUILD_BUG_ON'
      69 |  BUILD_BUG_ON(FIX_KMAP_SLOTS > PTRS_PER_PTE);
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert___COUNTER__ +565 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564  #define compiletime_assert(condition, msg) \
54594582aa30a3 Tal Zussman 2025-06-07 @565  	__compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
