Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15433A4274
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846665; cv=none; b=dIWrQJTYwNeaSO4JtNPVtFpFVvA/ACY/qnkIwshNrgLET4vBIBPb2nJZvlcydOseGXZskXcV6L8zwX9Ki8ElBh17yN4uMrqMOmI9wCOeYau7fCLLOyRXMGio3bOiATgvF0kva6kPv77cUJobhIVayHBq+wM4ajGe6qB2U5KSbgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846665; c=relaxed/simple;
	bh=ZBwux6QXIdzmoJwy5aIsCw36rLcBaQrOIannYatgbuQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UIm1OQqTrvMaEXr4nDzfvFJ52yUdM01k2wMIG8IFLif0RM+Fuqb0fD4P7VVuxqH5R0g/5j7nIdI20NMWC0a9v96w+7CQNdddbh7+z147JRG4q0GSjkGU4I2aUxUeLhYvw73fqsC9OuGNV1dPLytcIMhRZ9wh2a3R7+BNCpMhxJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaeXUtWM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaeXUtWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791846664; x=1823382664;
  h=date:from:to:cc:subject:message-id;
  bh=ZBwux6QXIdzmoJwy5aIsCw36rLcBaQrOIannYatgbuQ=;
  b=eaeXUtWMRwZoxupYk2mBzOlXBTK6xlsI4MWjYwsBXmkV9zF6sSlFSvyv
   /9EhqvUmTg2DfLDWMz3PBn6NFplqydKhnvMJIc0Ti/J9M2IgV6Uzl8BGB
   yY784dxX/KpCBrHZXOYama51Y/hhVbm/CXRg6Nk1gDMMRNi34xbTY1gxo
   O3jJJFUB17usiuFWVnmZWRuYTy1cLhg7jdpfBirsafGH01b7iH+PPACty
   w9cSANaaLmyGFSJT+VJjQo41H/svpIe9kE/tUCamCxhS/VjTy59tvBmpT
   OosnkZhFlOCy86w19YLpJmkrU2bDsuWEvGpwl/Mpko+jABKVzqeEz4BV9
   g==;
X-CSE-ConnectionGUID: 0kmkfcZZTTafYi4odrNSZg==
X-CSE-MsgGUID: hzc7PgwkSDCbwcDWXiq0uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="594946"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="594946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 16:11:03 -0700
X-CSE-ConnectionGUID: GGa1RA5ATRCjJg1/Ow0KqQ==
X-CSE-MsgGUID: eCOiuuV8RKaKn1bfVd4BVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1021717"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2026 16:11:02 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGPAZ-00000000AGl-3HVF;
	Mon, 12 Oct 2026 23:10:59 +0000
Date: Tue, 13 Oct 2026 01:10:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10-lts 17/17]
 ././include/linux/compiler_types.h:315:45: error: call to
 '__compiletime_assert_6' declared with attribute error: BUILD_BUG_ON failed:
 !IS_MODULE(CONFIG_DEV_DAX)
Message-ID: <202610130139.MhyP1D7z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   d64ecae82de0fbce86193fbe4fd7aff0ac4d6597
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [17/17] libsubcmd: Fix use-after-free for realloc(..., 0)
:::::: branch date: 8 hours ago
:::::: commit date: 4 years, 8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261013/202610130139.MhyP1D7z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130139.MhyP1D7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610130139.MhyP1D7z-lkp@intel.com/

All errors (new ones prefixed by >>):

   tools/testing/nvdimm/config_check.c:4:6: warning: no previous prototype for 'check' [-Wmissing-prototypes]
       4 | void check(void)
         |      ^~~~~
   In file included from <command-line>:
   tools/testing/nvdimm/config_check.c: In function 'check':
   ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_3' declared with attribute error: BUILD_BUG_ON failed: !IS_MODULE(CONFIG_ND_PFN)
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:296:25: note: in definition of macro '__compiletime_assert'
     296 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:315:9: note: in expansion of macro '_compiletime_assert'
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   tools/testing/nvdimm/config_check.c:13:9: note: in expansion of macro 'BUILD_BUG_ON'
      13 |         BUILD_BUG_ON(!IS_MODULE(CONFIG_ND_PFN));
         |         ^~~~~~~~~~~~
   ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_5' declared with attribute error: BUILD_BUG_ON failed: !IS_MODULE(CONFIG_ACPI_NFIT)
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:296:25: note: in definition of macro '__compiletime_assert'
     296 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:315:9: note: in expansion of macro '_compiletime_assert'
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   tools/testing/nvdimm/config_check.c:15:9: note: in expansion of macro 'BUILD_BUG_ON'
      15 |         BUILD_BUG_ON(!IS_MODULE(CONFIG_ACPI_NFIT));
         |         ^~~~~~~~~~~~
>> ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_6' declared with attribute error: BUILD_BUG_ON failed: !IS_MODULE(CONFIG_DEV_DAX)
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:296:25: note: in definition of macro '__compiletime_assert'
     296 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:315:9: note: in expansion of macro '_compiletime_assert'
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   tools/testing/nvdimm/config_check.c:16:9: note: in expansion of macro 'BUILD_BUG_ON'
      16 |         BUILD_BUG_ON(!IS_MODULE(CONFIG_DEV_DAX));
         |         ^~~~~~~~~~~~
>> ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_7' declared with attribute error: BUILD_BUG_ON failed: !IS_MODULE(CONFIG_DEV_DAX_PMEM)
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:296:25: note: in definition of macro '__compiletime_assert'
     296 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:315:9: note: in expansion of macro '_compiletime_assert'
     315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   tools/testing/nvdimm/config_check.c:17:9: note: in expansion of macro 'BUILD_BUG_ON'
      17 |         BUILD_BUG_ON(!IS_MODULE(CONFIG_DEV_DAX_PMEM));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_6 +315 ././include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  301  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  302  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  303  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  304  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  305  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  306   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  307   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  308   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  309   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  310   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  311   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  312   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  313   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  314  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @315  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  316  

:::::: The code at line 315 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
