Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0022C029D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387049; cv=none; b=nUQ0vF6yyJQ4osB5pIv21MZVA6tgA17XKv2qzF4Xi5Bmc6cQkOlo5xVUP77EsNMZTc/SLo1MNT/3KNTaBN9wG0PfzTqwis3bxYysG/axIKl8agjbHE/PnBHRz94p6tz9O8u9ILaLkXv2vVa87WCGIPsSfDnxqj8jPB6s2/nbkgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387049; c=relaxed/simple;
	bh=/JYhHhHfqsBDzbZ6x1RLYtcmUoaOtNegWJBcqkDyvzA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L4H64gHkRu3rLPzZuR8UxBGqHLkJrBK3TCwZIkXE/pzNQoVzNFsmT/+n9VqQTYRQTZvuiMXqauh1f7b/nCZEDt4lLK5JNTeestPL8Zl6WsqWz70kWP39xD3TAjg3Y3eBdmx+HsIAsUpCVdnS38bF1dcXY5SrPnPM8jJvMfvQzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4w8qZvk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4w8qZvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387048; x=1811923048;
  h=date:from:to:cc:subject:message-id;
  bh=/JYhHhHfqsBDzbZ6x1RLYtcmUoaOtNegWJBcqkDyvzA=;
  b=G4w8qZvks77Wo9f4jclS2/RJhPBZT7iZg5xN3GaQ0612UBpXTDwEwGwT
   nCuAw48a6AF9aEeYMdUMI4hYEgzGyyfRtl4wQM4fMeKxyVi8pBk44Mzh5
   cJd4NE+4UkK32XSM8+tIxKUd5U+3/9oJ409D7KCO5KIHOMbKhOuMcjfbc
   7gDRulgf7aAYDHwKMf6lrSrEF9deA0VdTXfRPYYfquxBTe0bEkrxRR3Xw
   e6A+GhfkceFN/9lXxXNtX81O8SOdytJLNFmm8RyQ/5JOiXbcWgKAXeyhC
   1tomQjI6XDgyMgWse1ytIMiU5wt3mtbBuwfo849VXnqTyuSPbbYk0bA0S
   A==;
X-CSE-ConnectionGUID: 8sZQ6GEXTWeQxxlilFDAmA==
X-CSE-MsgGUID: Mzn/AWhIT4SrPeZEbN8caA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106610988"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="106610988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 00:57:27 -0700
X-CSE-ConnectionGUID: WI/lrNbtQsiea/Fs+jW7QA==
X-CSE-MsgGUID: y6W4rQ48TqWrbFQStbAAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243023363"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jun 2026 00:57:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUK02-00000000Bgq-43nr;
	Tue, 02 Jun 2026 07:57:22 +0000
Date: Tue, 02 Jun 2026 15:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/fortify_kunit.c:211:8-9: ERROR: reference preceded
 by free on line 208
Message-ID: <202606021515.31JTWF0l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 4 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 1 year, 4 months ago
config: hexagon-randconfig-r064-20260601 (https://download.01.org/0day-ci/archive/20260602/202606021515.31JTWF0l-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606021515.31JTWF0l-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/tests/fortify_kunit.c:211:8-9: ERROR: reference preceded by free on line 208
   lib/tests/fortify_kunit.c:213:8-9: ERROR: reference preceded by free on line 211
   lib/tests/fortify_kunit.c:216:8-9: ERROR: reference preceded by free on line 213
   lib/tests/fortify_kunit.c:218:8-9: ERROR: reference preceded by free on line 216
   lib/tests/fortify_kunit.c:220:8-9: ERROR: reference preceded by free on line 218
   lib/tests/fortify_kunit.c:223:8-9: ERROR: reference preceded by free on line 220
   lib/tests/fortify_kunit.c:226:8-9: ERROR: reference preceded by free on line 223
   lib/tests/fortify_kunit.c:228:8-9: ERROR: reference preceded by free on line 226
   lib/tests/fortify_kunit.c:230:8-9: ERROR: reference preceded by free on line 228
   lib/tests/fortify_kunit.c:233:8-9: ERROR: reference preceded by free on line 230
   lib/tests/fortify_kunit.c:236:8-9: ERROR: reference preceded by free on line 233
   lib/tests/fortify_kunit.c:242:8-9: ERROR: reference preceded by free on line 236
   lib/tests/fortify_kunit.c:247:8-9: ERROR: reference preceded by free on line 242
   lib/tests/fortify_kunit.c:252:8-9: ERROR: reference preceded by free on line 247
   lib/tests/fortify_kunit.c:258:54-55: ERROR: reference preceded by free on line 252
   lib/tests/fortify_kunit.c:377:9-10: ERROR: reference preceded by free on line 375
   lib/tests/fortify_kunit.c:375:9-10: ERROR: reference preceded by free on line 377

vim +211 lib/tests/fortify_kunit.c

9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  201  
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  202  #define TEST_kmalloc(checker, expected_size, alloc_size)	do {	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  203  	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  204  	void *orig;							\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  205  	size_t len;							\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  206  									\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  207  	checker(expected_size, kmalloc(alloc_size, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29 @208  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  209  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  210  		kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29 @211  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  212  	checker(expected_size, kzalloc(alloc_size, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  213  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  214  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  215  		kzalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  216  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  217  	checker(expected_size, kcalloc(1, alloc_size, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  218  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  219  	checker(expected_size, kcalloc(alloc_size, 1, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  220  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  221  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  222  		kcalloc_node(1, alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  223  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  224  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  225  		kcalloc_node(alloc_size, 1, gfp, NUMA_NO_NODE),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  226  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  227  	checker(expected_size, kmalloc_array(1, alloc_size, gfp),	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  228  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  229  	checker(expected_size, kmalloc_array(alloc_size, 1, gfp),	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  230  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  231  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  232  		kmalloc_array_node(1, alloc_size, gfp, NUMA_NO_NODE),	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  233  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  234  	checker(expected_size,						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  235  		kmalloc_array_node(alloc_size, 1, gfp, NUMA_NO_NODE),	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  236  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  237  									\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  238  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  239  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  240  	checker((expected_size) * 2,					\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  241  		krealloc(orig, (alloc_size) * 2, gfp),			\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  242  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  243  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  244  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  245  	checker((expected_size) * 2,					\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  246  		krealloc_array(orig, 1, (alloc_size) * 2, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  247  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  248  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  249  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  250  	checker((expected_size) * 2,					\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  251  		krealloc_array(orig, (alloc_size) * 2, 1, gfp),		\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  252  		kfree(p));						\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  253  									\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  254  	len = 11;							\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  255  	/* Using memdup() with fixed size, so force unknown length. */	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  256  	if (!__builtin_constant_p(expected_size))			\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  257  		len += zero_size;					\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  258  	checker(len, kmemdup("hello there", len, gfp), kfree(p));	\
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  259  } while (0)
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  260  DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
9124a26401483bf lib/fortify_kunit.c Kees Cook 2022-09-29  261  

:::::: The code at line 211 was first introduced by commit
:::::: 9124a26401483bf2b13a99cb4317dce3f677060f kunit/fortify: Validate __alloc_size attribute results

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
