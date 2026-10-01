Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0D36655D
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824990; cv=none; b=CBe3y2Imr7ok74ezYgoc7VI9s4O33cqS8L3NQizcp9otHVmFr7HWaQfs8LFEpCEZ37b7hCdVrsLjiu8Td9xxoNHPI9A1w5BqrT5P3bnpcLb0IrKEY7J4TXbVNU32Y2r8XSkTaTCXi1+C2g4C0en1wyRHTpjswBv1Or0H1x3n1Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824990; c=relaxed/simple;
	bh=bZaYIkUp8qs5RV4E+y9qXbJHwch8EjrC/5S2yLpxITU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ExYWgDqF9Q2IIYiOAqpzaKUnYzkykEBvxY4CFFltIwpsKrR1llOyZduW9NjZbiMA317q/HhQZd/dZTDWyEnX2Bsd+KJ6nAvpgmd/x4wE7ha946FmsCBiaLP22V0gzY+ezFT4pRZc3GZcpt0VbUHwSOskreAaI6a6OLK5mVIKdnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvIUCxlI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvIUCxlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790824986; x=1822360986;
  h=date:from:to:cc:subject:message-id;
  bh=bZaYIkUp8qs5RV4E+y9qXbJHwch8EjrC/5S2yLpxITU=;
  b=mvIUCxlIBNRLwLmRUwV2dk57kimA2ZqvNgLz4dEYTUdFokFwAfYSoy31
   6s6qNNsmY42BpB+eUKCosNNiKhro3QeHY6JznNTOb0Uy0Qx0QoBiZERy7
   4NE4ddybrEK5a62KPgFYWnqsfMqpxDLOGct5JGT/74j7StMK8RLKBXA2p
   sLAfzmahFnIjg/vojXqFHFtNo8c4rIZpr9b8zeBNQUkLFOqTKJIUOwr5f
   dAYuUa1NbzIuVSGfdyePSPa5AhSz+8bfge/SJEZ0i74gTzjhxUjjolGAQ
   0lkd0mROiIJ9EUzhLZYS0VhBwwwD/+kzBGPnPvNXGfrrzvAVwdCasshiS
   Q==;
X-CSE-ConnectionGUID: aebn2XeNQ8yXMnj4wogPlQ==
X-CSE-MsgGUID: LihTvIC8S26qp052jaKN4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91672993"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91672993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 20:23:04 -0700
X-CSE-ConnectionGUID: fDClUFY2Rn+QeESdqU1p9Q==
X-CSE-MsgGUID: F6JA798DSLqTBwtCVzoPkA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 20:23:03 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC7Nt-000000002EF-0xus;
	Thu, 01 Oct 2026 03:23:01 +0000
Date: Thu, 01 Oct 2026 05:22:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tamird:b4/bitmap-kunit-convert 4/4]
 lib/bitmap_kunit.c:1251:2: error: call to '__compiletime_assert_486' declared
 with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(~var)
Message-ID: <202610010508.bIpbuVCE-lkp@intel.com>
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
TO: Tamir Duberstein <tamird@kernel.org>

tree:   https://github.com/tamird/linux b4/bitmap-kunit-convert
head:   c4e92606ad54da7a5b46c2787f54d1ae3f3958b2
commit: c4e92606ad54da7a5b46c2787f54d1ae3f3958b2 [4/4] bitmap: break kunit into test cases
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-r2301-20261001 (https://download.01.org/0day-ci/archive/20261001/202610010508.bIpbuVCE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010508.bIpbuVCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610010508.bIpbuVCE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/bitmap_kunit.c:1251:2: error: call to '__compiletime_assert_486' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(~var)
    1251 |         BUILD_BUG_ON(!__builtin_constant_p(~var));
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
   <scratch space>:93:1: note: expanded from here
      93 | __compiletime_assert_486
         | ^
   1 error generated.


vim +1251 lib/bitmap_kunit.c

291f93ca339f5b lib/test_bitmap.c  Barry Song        2021-08-06  1200  
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1201  /*
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1202   * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are enabled.
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1203   * To workaround it, GCOV is force-disabled in Makefile for this configuration.
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1204   */
c4e92606ad54da lib/bitmap_kunit.c Tamir Duberstein  2025-02-07  1205  static void test_bitmap_const_eval(struct kunit *kunittest)
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1206  {
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1207  	DECLARE_BITMAP(bitmap, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1208  	unsigned long initvar = BIT(2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1209  	unsigned long bitopvar = 0;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1210  	unsigned long var = 0;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1211  	int res;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1212  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1213  	/*
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1214  	 * Compilers must be able to optimize all of those to compile-time
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1215  	 * constants on any supported optimization level (-O2, -Os) and any
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1216  	 * architecture. Otherwise, trigger a build bug.
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1217  	 * The whole function gets optimized out then, there's nothing to do
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1218  	 * in runtime.
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1219  	 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1220  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1221  	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1222  	bitmap_clear(bitmap, 0, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1223  	if (!test_bit(7, bitmap))
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1224  		bitmap_set(bitmap, 5, 2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1225  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1226  	/* Equals to `unsigned long bitopvar = BIT(20)` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1227  	__change_bit(31, &bitopvar);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1228  	bitmap_shift_right(&bitopvar, &bitopvar, 11, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1229  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1230  	/* Equals to `unsigned long var = BIT(25)` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1231  	var |= BIT(25);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1232  	if (var & BIT(0))
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1233  		var ^= GENMASK(9, 6);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1234  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1235  	/* __const_hweight<32|64>(GENMASK(6, 5)) == 2 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1236  	res = bitmap_weight(bitmap, 20);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1237  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1238  	BUILD_BUG_ON(res != 2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1239  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1240  	/* !(BIT(31) & BIT(18)) == 1 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1241  	res = !test_bit(18, &bitopvar);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1242  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1243  	BUILD_BUG_ON(!res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1244  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1245  	/* BIT(2) & GENMASK(14, 8) == 0 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1246  	res = initvar & GENMASK(14, 8);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1247  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1248  	BUILD_BUG_ON(res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1249  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1250  	/* ~BIT(25) */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24 @1251  	BUILD_BUG_ON(!__builtin_constant_p(~var));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1252  	BUILD_BUG_ON(~var != ~BIT(25));
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1253  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1254  	/* ~BIT(25) | BIT(25) == ~0UL */
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1255  	bitmap_complement(&var, &var, BITS_PER_LONG);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1256  	__assign_bit(25, &var, true);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1257  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1258  	/* !(~(~0UL)) == 1 */
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1259  	res = bitmap_full(&var, BITS_PER_LONG);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1260  	BUILD_BUG_ON(!__builtin_constant_p(res));
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1261  	BUILD_BUG_ON(!res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1262  }
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1263  

:::::: The code at line 1251 was first introduced by commit
:::::: dc34d5036692c614eef23c1130ee42a201c316bf lib: test_bitmap: add compile-time optimization/evaluations assertions

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
