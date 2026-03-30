Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50023C3437
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873152; cv=none; b=IeEIyj4RS7NmT7M8sUcASKXTeh9f7fXCODYV9yQrIdRhjTQH3SbnckAzue8wv8+5C3RiYNOcyM9AzAbIxsAuDqy3vT8RPTg2ljgqsaZlC43kKuhPaGa4S8DNR7qgacQ/xsQHtE7WZbU7PgAtxqHE9HVZ0O76Ug5YSgveoSpvWrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873152; c=relaxed/simple;
	bh=V+I8xjCMcOtiHxG95ZfGMrJcnaxRGRtz3NDvauFLilw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bTp+2dmrK3Mx4XKDbmSOQXhpzvxhkJo3KqqNVAKGZ2F9cWqyczMOTPve0a+4RBF8c7JH/wfclqyLNM/soFml+LBtZ9ettcVtUs0h67kzo6kHG/R8OGtquQVZwr7AlkTyJoqg7Bp5/MWL+02AmQuXHHNYjjUzqyU/v/eNrPxueQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6J8ximY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6J8ximY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774873150; x=1806409150;
  h=date:from:to:cc:subject:message-id;
  bh=V+I8xjCMcOtiHxG95ZfGMrJcnaxRGRtz3NDvauFLilw=;
  b=M6J8ximYnIvu/WVJH3e0JVq9iJ9xb59zEpPQX2aRbQO19+H3gZFLlclF
   bMmQna3J2LCyRH/48CjYageQ3GQ4BMHEilMIVI7sNO99rAhMeaVRHymJm
   h7laVEItsHWobRmV13MYuSjxyEO1Ib00am1ONewUglWKoQZY4X2YBpEnt
   sRrGMWPQ6v4baI/TNch5NxpdpSpG4RC6XJhMvJGEIlGlwze0GJHLAhsOC
   I/Whf6DfgxlSSYarXNvD7tkhCh4r5Bugq++6PMLVHAtgvJpwbOvlcCJKp
   G+qt6F6DUFZPlJPCT2fpku71DdFQpsThXQXVGuYYHpwJno0FE5pvSL/Yg
   g==;
X-CSE-ConnectionGUID: TDkAzO6NQUKbjJiJ+9VHfQ==
X-CSE-MsgGUID: GiWOuR6YSMSLxfDhIFhNEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86938456"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86938456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 05:19:08 -0700
X-CSE-ConnectionGUID: U7vGW4bvS3Wt9UtO9r7Bmw==
X-CSE-MsgGUID: +GfH7y3CQt6dlPDVTdd/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221165498"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2026 05:19:05 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7BaB-0000000013v-2Xvy;
	Mon, 30 Mar 2026 12:19:03 +0000
Date: Mon, 30 Mar 2026 20:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/fortify_kunit.c:211:8-9: ERROR: reference preceded
 by free on line 208
Message-ID: <202603302040.VStJOW2P-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: powerpc64-randconfig-r052-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302040.VStJOW2P-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603302040.VStJOW2P-lkp@intel.com/

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

9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  201  
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  202  #define TEST_kmalloc(checker, expected_size, alloc_size)	do {	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  203  	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  204  	void *orig;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  205  	size_t len;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  206  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  207  	checker(expected_size, kmalloc(alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29 @208  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  209  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  210  		kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29 @211  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  212  	checker(expected_size, kzalloc(alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  213  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  214  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  215  		kzalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  216  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  217  	checker(expected_size, kcalloc(1, alloc_size, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  218  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  219  	checker(expected_size, kcalloc(alloc_size, 1, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  220  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  221  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  222  		kcalloc_node(1, alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  223  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  224  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  225  		kcalloc_node(alloc_size, 1, gfp, NUMA_NO_NODE),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  226  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  227  	checker(expected_size, kmalloc_array(1, alloc_size, gfp),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  228  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  229  	checker(expected_size, kmalloc_array(alloc_size, 1, gfp),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  230  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  231  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  232  		kmalloc_array_node(1, alloc_size, gfp, NUMA_NO_NODE),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  233  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  234  	checker(expected_size,						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  235  		kmalloc_array_node(alloc_size, 1, gfp, NUMA_NO_NODE),	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  236  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  237  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  238  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  239  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  240  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  241  		krealloc(orig, (alloc_size) * 2, gfp),			\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  242  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  243  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  244  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  245  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  246  		krealloc_array(orig, 1, (alloc_size) * 2, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  247  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  248  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  249  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  250  	checker((expected_size) * 2,					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  251  		krealloc_array(orig, (alloc_size) * 2, 1, gfp),		\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  252  		kfree(p));						\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  253  									\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  254  	len = 11;							\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  255  	/* Using memdup() with fixed size, so force unknown length. */	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  256  	if (!__builtin_constant_p(expected_size))			\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  257  		len += zero_size;					\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  258  	checker(len, kmemdup("hello there", len, gfp), kfree(p));	\
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  259  } while (0)
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  260  DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
9124a26401483b lib/fortify_kunit.c Kees Cook 2022-09-29  261  

:::::: The code at line 211 was first introduced by commit
:::::: 9124a26401483bf2b13a99cb4317dce3f677060f kunit/fortify: Validate __alloc_size attribute results

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
