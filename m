Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F08262A6
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592577; cv=none; b=qXQMY2xx+TZIWfJ0nV/TUfW5OIgzxcMrRtyUK5niPZZomU96wTGdlYbpo3sjGQmaRGRyGPdZavmlJaKId5DY21g7t420/p+6o5c6ryPy9DxJcBXDPa3zQuOQPeGqZ4isA4M0M48eqTtYgvHBB3ThE+OsKKr6ue9jI3xeSBLAOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592577; c=relaxed/simple;
	bh=M9BOBSIC5SYJKX+4kKBceVgAuLfUNLRMZeLMlH6kDgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTWcGmTCMbVrszCmbCQ2gL7Of42ZgvoscyFad+zIDITih2e/LDEW1U5uxLZJ8RTZBL6S1Gfy9/HSGPADjtZJploE1B1zlrCAkS82ME3mSNb48cz7eSB4wrX9RNANmC3B3EhQXvIcq5Ve8tDwYLZ9/l4r26um1l3OQIex8SPJJX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzonNMzl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzonNMzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751592575; x=1783128575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9BOBSIC5SYJKX+4kKBceVgAuLfUNLRMZeLMlH6kDgY=;
  b=RzonNMzlxI+JWJs+wbJEc5/M85jDPZNNohOzSDNQk3W4Vy/z9cLqE3Oc
   DQ2O06m5EFtE/3QmLCK2ZGA7NNjAHH2gnh4w8mslnrWRld096nzHrCqEP
   cbwCBDFOlWBi/u5X9QUL94qAi3khB9sS/2fhPyL+98wgGoTGU8QSx6fuj
   UkajFEE0SS9Nqkg0lPl3RiPh85/enWp6eKUrSio2vZLhn/dDzDtfJRBtD
   sehGxDtbk5yv4U8vxnOHiERtfkYdHV+djyOBnaZHSHSOWg62oAMGG7rqM
   9Kl+ktJoNibHndeHRkEaPjTI81QLKraOVY4rtnJFjrWOuGY2yzJe+ZfHs
   A==;
X-CSE-ConnectionGUID: uGlfoRegR3+UGUX9gjnTPw==
X-CSE-MsgGUID: gXGP8sKoQG++n371oqAFpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53800409"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53800409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 18:29:34 -0700
X-CSE-ConnectionGUID: /M5bQUsuSSOUnvknD+4Apg==
X-CSE-MsgGUID: pnes+8jrTxaJJan2fKOmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="160207368"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2025 18:29:32 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXVF4-0000Yz-1K;
	Fri, 04 Jul 2025 01:29:30 +0000
Date: Fri, 4 Jul 2025 03:28:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/test_bitmap.c:1269:2: error: call to '__compiletime_assert_217'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(res)
Message-ID: <202507040313.831RIdg2-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17bbde2e1716e2ee4b997d476b48ae85c5a47671
commit: 194a613088a8c9dae300dfb08433287cee803e8d x86/hweight: Use ASM_CALL_CONSTRAINT in inline asm()
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: x86_64-buildonly-randconfig-2004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040313.831RIdg2-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040313.831RIdg2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507040313.831RIdg2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitmap.c:1269:2: error: call to '__compiletime_assert_217' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
    1269 |         BUILD_BUG_ON(!__builtin_constant_p(res));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:301:1: note: expanded from here
     301 | __compiletime_assert_217
         | ^
   1 error generated.


vim +1269 lib/test_bitmap.c

291f93ca339f5b Barry Song        2021-08-06  1227  
2356d198d2b4dd Yury Norov        2023-07-17  1228  /*
2356d198d2b4dd Yury Norov        2023-07-17  1229   * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are enabled.
2356d198d2b4dd Yury Norov        2023-07-17  1230   * To workaround it, GCOV is force-disabled in Makefile for this configuration.
2356d198d2b4dd Yury Norov        2023-07-17  1231   */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1232  static void __init test_bitmap_const_eval(void)
dc34d5036692c6 Alexander Lobakin 2022-06-24  1233  {
dc34d5036692c6 Alexander Lobakin 2022-06-24  1234  	DECLARE_BITMAP(bitmap, BITS_PER_LONG);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1235  	unsigned long initvar = BIT(2);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1236  	unsigned long bitopvar = 0;
dc34d5036692c6 Alexander Lobakin 2022-06-24  1237  	unsigned long var = 0;
dc34d5036692c6 Alexander Lobakin 2022-06-24  1238  	int res;
dc34d5036692c6 Alexander Lobakin 2022-06-24  1239  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1240  	/*
dc34d5036692c6 Alexander Lobakin 2022-06-24  1241  	 * Compilers must be able to optimize all of those to compile-time
dc34d5036692c6 Alexander Lobakin 2022-06-24  1242  	 * constants on any supported optimization level (-O2, -Os) and any
dc34d5036692c6 Alexander Lobakin 2022-06-24  1243  	 * architecture. Otherwise, trigger a build bug.
dc34d5036692c6 Alexander Lobakin 2022-06-24  1244  	 * The whole function gets optimized out then, there's nothing to do
dc34d5036692c6 Alexander Lobakin 2022-06-24  1245  	 * in runtime.
dc34d5036692c6 Alexander Lobakin 2022-06-24  1246  	 */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1247  
7adaf37f7f104a Alexander Lobakin 2024-03-27  1248  	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1249  	bitmap_clear(bitmap, 0, BITS_PER_LONG);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1250  	if (!test_bit(7, bitmap))
dc34d5036692c6 Alexander Lobakin 2022-06-24  1251  		bitmap_set(bitmap, 5, 2);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1252  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1253  	/* Equals to `unsigned long bitopvar = BIT(20)` */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1254  	__change_bit(31, &bitopvar);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1255  	bitmap_shift_right(&bitopvar, &bitopvar, 11, BITS_PER_LONG);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1256  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1257  	/* Equals to `unsigned long var = BIT(25)` */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1258  	var |= BIT(25);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1259  	if (var & BIT(0))
dc34d5036692c6 Alexander Lobakin 2022-06-24  1260  		var ^= GENMASK(9, 6);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1261  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1262  	/* __const_hweight<32|64>(GENMASK(6, 5)) == 2 */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1263  	res = bitmap_weight(bitmap, 20);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1264  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 Alexander Lobakin 2022-06-24  1265  	BUILD_BUG_ON(res != 2);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1266  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1267  	/* !(BIT(31) & BIT(18)) == 1 */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1268  	res = !test_bit(18, &bitopvar);
dc34d5036692c6 Alexander Lobakin 2022-06-24 @1269  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 Alexander Lobakin 2022-06-24  1270  	BUILD_BUG_ON(!res);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1271  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1272  	/* BIT(2) & GENMASK(14, 8) == 0 */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1273  	res = initvar & GENMASK(14, 8);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1274  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 Alexander Lobakin 2022-06-24  1275  	BUILD_BUG_ON(res);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1276  
dc34d5036692c6 Alexander Lobakin 2022-06-24  1277  	/* ~BIT(25) */
dc34d5036692c6 Alexander Lobakin 2022-06-24  1278  	BUILD_BUG_ON(!__builtin_constant_p(~var));
dc34d5036692c6 Alexander Lobakin 2022-06-24  1279  	BUILD_BUG_ON(~var != ~BIT(25));
7adaf37f7f104a Alexander Lobakin 2024-03-27  1280  
7adaf37f7f104a Alexander Lobakin 2024-03-27  1281  	/* ~BIT(25) | BIT(25) == ~0UL */
7adaf37f7f104a Alexander Lobakin 2024-03-27  1282  	bitmap_complement(&var, &var, BITS_PER_LONG);
7adaf37f7f104a Alexander Lobakin 2024-03-27  1283  	__assign_bit(25, &var, true);
7adaf37f7f104a Alexander Lobakin 2024-03-27  1284  
7adaf37f7f104a Alexander Lobakin 2024-03-27  1285  	/* !(~(~0UL)) == 1 */
7adaf37f7f104a Alexander Lobakin 2024-03-27  1286  	res = bitmap_full(&var, BITS_PER_LONG);
7adaf37f7f104a Alexander Lobakin 2024-03-27  1287  	BUILD_BUG_ON(!__builtin_constant_p(res));
7adaf37f7f104a Alexander Lobakin 2024-03-27  1288  	BUILD_BUG_ON(!res);
dc34d5036692c6 Alexander Lobakin 2022-06-24  1289  }
dc34d5036692c6 Alexander Lobakin 2022-06-24  1290  

:::::: The code at line 1269 was first introduced by commit
:::::: dc34d5036692c614eef23c1130ee42a201c316bf lib: test_bitmap: add compile-time optimization/evaluations assertions

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
