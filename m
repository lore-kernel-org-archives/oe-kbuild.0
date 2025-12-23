Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F722D7B9
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504540; cv=none; b=d5LrrUGta/0bxLrS/WcGzBOADnI8zqOBCbYgt+OcsN2jK/TIYTD6GsqbmpHUyeu4OAVOYyH0pYW8Z9pr9b/nOW8Sk7I9aIUxeoqx1iqTmwonLPTug7ppxJ+vamQMiUWoGqg2zb7RbNm8EJR9yv+4QruAqocIOWkmZQFot6+LxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504540; c=relaxed/simple;
	bh=AQ+fptjd99d3k7bX6WhCT7jvp3qQ1RvAkDNqSsOg/J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIJ9435UfHzw14sf9LJDnBcXk9QTVZliuqScPpTejpd8ct9RdcDemwbvg+0yMlo6qJN8nD3fTdANfh+3HfU1hyLvbFwUoYGXdE6YzdZ0EjIJPjQOcJnbiy97uhrDy8kvltxpSCFHQYVLs7dgTfnlYss7LQ3lVXfoENSes1ve5TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiQO1dgv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiQO1dgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766504539; x=1798040539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQ+fptjd99d3k7bX6WhCT7jvp3qQ1RvAkDNqSsOg/J0=;
  b=OiQO1dgvlELtuzOEXsMhvc51aJmywlM5T7GN6YoSlizNC836Op2zhkEa
   JPUcyyfz5Eds1L5jw5YaaBIkM2co41UMILMATxEBV2/3d4v/l2OTtqTWR
   bkYPsD57afj/eZq9yZzCZhfiYHyDVHknRCENkM+kNOiU58gJti88Td/Qo
   e/4M5bUTlKDYF97lR+YOQ2OHH+QmgbUEtj7B+oE4sWiTP/GK/aOIdsXm7
   6OqmOD84p/6+pCqu7Z0Fp4TqlW8nWfyZTkCMRM/aHCyl5QsAONpkwqd9T
   qIm124NuSnU93k6nsod4KK4T+muz6xjhgZtF6z7eBIgPUhU7Y6DEO3lK5
   A==;
X-CSE-ConnectionGUID: o7MwGPInTg+orXvYnwVY4Q==
X-CSE-MsgGUID: RA4BAZ00Qu2Cijk8GUvt5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79715819"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79715819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:42:18 -0800
X-CSE-ConnectionGUID: CdqgX3N/TSGPthR3CBssEg==
X-CSE-MsgGUID: B+pEddxhRTi3eZ+fHoGDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204325828"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 07:42:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4Wc-00000000257-2AKx;
	Tue, 23 Dec 2025 15:42:14 +0000
Date: Tue, 23 Dec 2025 23:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] bitmap: break kunit into test cases
Message-ID: <202512232357.nliFXSgy-lkp@intel.com>
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
In-Reply-To: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>
References: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>
TO: Tamir Duberstein <tamird@kernel.org>
TO: David Gow <davidgow@google.com>
TO: John Hubbard <jhubbard@nvidia.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Geert Uytterhoeven <geert@linux-m68k.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Naveen N Rao <naveen@kernel.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Kees Cook <kees@kernel.org>
TO: Christophe Leroy <chleroy@kernel.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: linux-kernel@vger.kernel.org
CC: linux-m68k@lists.linux-m68k.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kselftest@vger.kernel.org
CC: Tamir Duberstein <tamird@gmail.com>

Hi Tamir,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/test_bitmap-extract-benchmark-module/20251222-214306
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-bitmap-kunit-convert-v2-3-6a61a5330eff%40gmail.com
patch subject: [PATCH v2 3/3] bitmap: break kunit into test cases
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-076-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232357.nliFXSgy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232357.nliFXSgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232357.nliFXSgy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/bitmap_kunit.c:1163:2: error: call to '__compiletime_assert_615' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(~var)
    1163 |         BUILD_BUG_ON(!__builtin_constant_p(~var));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:630:2: note: expanded from macro 'compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:93:1: note: expanded from here
      93 | __compiletime_assert_615
         | ^
   1 error generated.


vim +1163 lib/bitmap_kunit.c

291f93ca339f5b lib/test_bitmap.c  Barry Song        2021-08-06  1112  
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1113  /*
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1114   * FIXME: Clang breaks compile-time evaluations when KASAN and GCOV are enabled.
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1115   * To workaround it, GCOV is force-disabled in Makefile for this configuration.
2356d198d2b4dd lib/test_bitmap.c  Yury Norov        2023-07-17  1116   */
8ef3340af7139f lib/bitmap_kunit.c Tamir Duberstein  2025-12-22  1117  static void test_bitmap_const_eval(struct kunit *kunittest)
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1118  {
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1119  	DECLARE_BITMAP(bitmap, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1120  	unsigned long initvar = BIT(2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1121  	unsigned long bitopvar = 0;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1122  	unsigned long var = 0;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1123  	int res;
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1124  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1125  	/*
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1126  	 * Compilers must be able to optimize all of those to compile-time
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1127  	 * constants on any supported optimization level (-O2, -Os) and any
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1128  	 * architecture. Otherwise, trigger a build bug.
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1129  	 * The whole function gets optimized out then, there's nothing to do
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1130  	 * in runtime.
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1131  	 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1132  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1133  	/* Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1134  	bitmap_clear(bitmap, 0, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1135  	if (!test_bit(7, bitmap))
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1136  		bitmap_set(bitmap, 5, 2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1137  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1138  	/* Equals to `unsigned long bitopvar = BIT(20)` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1139  	__change_bit(31, &bitopvar);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1140  	bitmap_shift_right(&bitopvar, &bitopvar, 11, BITS_PER_LONG);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1141  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1142  	/* Equals to `unsigned long var = BIT(25)` */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1143  	var |= BIT(25);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1144  	if (var & BIT(0))
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1145  		var ^= GENMASK(9, 6);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1146  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1147  	/* __const_hweight<32|64>(GENMASK(6, 5)) == 2 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1148  	res = bitmap_weight(bitmap, 20);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1149  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1150  	BUILD_BUG_ON(res != 2);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1151  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1152  	/* !(BIT(31) & BIT(18)) == 1 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1153  	res = !test_bit(18, &bitopvar);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1154  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1155  	BUILD_BUG_ON(!res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1156  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1157  	/* BIT(2) & GENMASK(14, 8) == 0 */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1158  	res = initvar & GENMASK(14, 8);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1159  	BUILD_BUG_ON(!__builtin_constant_p(res));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1160  	BUILD_BUG_ON(res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1161  
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1162  	/* ~BIT(25) */
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24 @1163  	BUILD_BUG_ON(!__builtin_constant_p(~var));
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1164  	BUILD_BUG_ON(~var != ~BIT(25));
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1165  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1166  	/* ~BIT(25) | BIT(25) == ~0UL */
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1167  	bitmap_complement(&var, &var, BITS_PER_LONG);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1168  	__assign_bit(25, &var, true);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1169  
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1170  	/* !(~(~0UL)) == 1 */
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1171  	res = bitmap_full(&var, BITS_PER_LONG);
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1172  	BUILD_BUG_ON(!__builtin_constant_p(res));
7adaf37f7f104a lib/test_bitmap.c  Alexander Lobakin 2024-03-27  1173  	BUILD_BUG_ON(!res);
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1174  }
dc34d5036692c6 lib/test_bitmap.c  Alexander Lobakin 2022-06-24  1175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
