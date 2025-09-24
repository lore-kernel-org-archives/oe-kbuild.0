Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A1015C0
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745465; cv=none; b=FmudUR4q9jnohqb184axNJ9bbSt7CszF1rxUAYariH5zhgPOzsckXLYJh1WDraDx0fcqxVd5jQApRyd2kgfrv3xOp//Xlnwo0qSeJC1+Uz1YizTmMH4Z3+T/Dl2aqG35U2dcgqLqMLfyH5BKNZEy9k9s7kQtFvnbS1oFufqatrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745465; c=relaxed/simple;
	bh=dVNgAV9FQHIA6qrS7sX39tllhda+TQrd5zC4Cy/KFUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCB+XwTHL5eWuI7RalvR54UBp6f08tKQ+wcBzen+/3e1/wweLGXs3Y/5tpnmSYdN3dlKFYnujVFE2+zha+mjlUiZ8JpU7BMdyRGDey/9sQowApL43Hh5wganTcFWKyvkv+EbvVpEs7ZSJIwl4wP2posPE6kWQUcM2RplxWwsmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0x6rAu2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0x6rAu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758745463; x=1790281463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVNgAV9FQHIA6qrS7sX39tllhda+TQrd5zC4Cy/KFUE=;
  b=k0x6rAu2KnLnXeIdTMXrVCxO8G2/ZNsJoaMnXj2JLBwxJOBMoghBGUo3
   NtJWGFWB3afzkzbGbHGLowJtA8ciKM4NKk3Af0uc0/AaOLCdsCQefB2G5
   nAn9RoqqxS/2krIFFDFj6pzP0zfsl+N7tgFp77P0YUg/77WqnnNDoU7up
   iOgqOBZUfYVmiBmHWFwOrKmBX2PBTLEaWGHRxt0ITSc3OkDBw+VajjVq7
   RU1klpdUc2d+R+u0nW1iBTjNZRnAZheCgcU1sw0fFqrGY5J6TE7nwEhlv
   wp1Pz4lO0CvqojVn0WelffInxH+AhG688GUdeWykKqd2SwFTH0R5NP5yw
   A==;
X-CSE-ConnectionGUID: KHK+nSQ9RxKGL8ikb4vJPQ==
X-CSE-MsgGUID: LNyM+8j8TzOB4bbcoPRDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="48618440"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="48618440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 13:24:22 -0700
X-CSE-ConnectionGUID: 86cUY3GbRDi5dea4g+O2jQ==
X-CSE-MsgGUID: uVuHU6qgRQadMA6sPsdOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="176971102"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 13:24:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1W2E-0004Xf-2N;
	Wed, 24 Sep 2025 20:24:18 +0000
Date: Thu, 25 Sep 2025 04:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/test_bitmap.c:1269:2: error: call to '__compiletime_assert_217'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(res)
Message-ID: <202509250455.IbNDy609-lkp@intel.com>
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

Hi Uros,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
commit: 194a613088a8c9dae300dfb08433287cee803e8d x86/hweight: Use ASM_CALL_CONSTRAINT in inline asm()
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-buildonly-randconfig-004-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250455.IbNDy609-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250455.IbNDy609-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509250455.IbNDy609-lkp@intel.com/

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
   <scratch space>:51:1: note: expanded from here
      51 | __compiletime_assert_217
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
