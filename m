Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF53027FB2D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406169; cv=none; b=BChmMhT+kh1f7ryf6fbyanhADmHVge156ubLXP398zQsLUWSH2J8pZJuL6clXZYPQsWszssi3prMNd5SEORxgcRFY4fJOny8RQx/kDzhbZcTSWgWtwOLmv1WVcPTnthxshphNcj2y9YC4UyWLFbC1xFD89C9WskyOvFpqR+br/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406169; c=relaxed/simple;
	bh=6Zo+0tsxnscGJ//nxbXM/dDD6R5bSaXaSbM8Sr5Nm6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bn0pRrS3i5/9N0TDcYCE7EyrHjqVWP2FVJzQYTvTH2BQVy375rwq+sWmNcF+bdqD/waiyD3qA4Rj0itsTCAOnXzOMadcDZgjb716GckF6+6GOf6LL3n7lNHakV8LBzrfJWCsRwp+dt87E+d95fJEZF0KC2N2PA4foN6DEtXpUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9cPn3gP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9cPn3gP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766406168; x=1797942168;
  h=date:from:to:cc:subject:message-id;
  bh=6Zo+0tsxnscGJ//nxbXM/dDD6R5bSaXaSbM8Sr5Nm6A=;
  b=j9cPn3gPsVehoXyHlrhiHmUzqC8o84ID2ZEb24lpO0E5W7JGY5ykqnhu
   NQ5gJOVv87ScNiDYO57lt2cr3QHZZxoNkWCcZMpeSkyXGNCNDwHX6Zxhm
   bI1zt0UWCib8w0VM+rFS7Ok59kh0eEbhyIWWQN4n74fRrRMAMteWml4kB
   fjOQSl1QHyFzgxG5yxscEUcMyOXwNTAWLzSUyqtCNM1WhOrkH4AaW+cQi
   /5yCImvKuJ/n+XSm8I6JWGom/0f8egTIkN6s/Wdi0nHtVQOv/Ys4Id28H
   8ZSgT7WN3tkTyJ5S64tx3BLO6aQ57+omwK4FfRMc8uEVdCRSnSBjwWkhp
   A==;
X-CSE-ConnectionGUID: TyNn6cm2Q+SMzIX8PzY5wg==
X-CSE-MsgGUID: 75Bbyb4JQLCHdxZC53cBVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68303570"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68303570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:22:47 -0800
X-CSE-ConnectionGUID: Rq9KB/gfTFuos88BWIESIQ==
X-CSE-MsgGUID: F0S9f+zST8SBouTEaopYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199550136"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 04:22:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXew0-000000000WQ-0MW3;
	Mon, 22 Dec 2025 12:22:44 +0000
Date: Mon, 22 Dec 2025 20:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is
 used later (line 644) to compute the same size
Message-ID: <202512222025.oOXYZEcc-lkp@intel.com>
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
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r061-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222025.oOXYZEcc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 789845e319bbf346d42ee2c0090a9b8e153797a2)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512222025.oOXYZEcc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is used later (line 644) to compute the same size
--
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
--
>> lib/tests/overflow_kunit.c:295:14-19: Unneeded variable: "index". Return "0" on line 297

vim +637 lib/tests/overflow_kunit.c

ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  621  
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  622  #define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  623  static void test_ ## func (struct kunit *test, void *arg)		\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  624  {									\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  625  	volatile size_t a = TEST_SIZE;					\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  626  	volatile size_t b = (SIZE_MAX / TEST_SIZE) + 1;			\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  627  	void *ptr;							\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  628  									\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  629  	/* Tiny allocation test. */					\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  630  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  631  	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  632  			    #func " failed regular allocation?!\n");	\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  633  	free ## want_arg (free_func, arg, ptr);				\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  634  									\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  635  	/* Wrapped allocation test. */					\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  636  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10 @637  							  a * b);	\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  638  	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  639  			    #func " unexpectedly failed bad wrapping?!\n"); \
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  640  	free ## want_arg (free_func, arg, ptr);				\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  641  									\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  642  	/* Saturated allocation test. */				\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  643  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10 @644  						   array_size(a, b));	\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  645  	if (ptr) {							\
617f55e20743fc5 lib/overflow_kunit.c Kees Cook 2022-02-16  646  		KUNIT_FAIL(test, #func " missed saturation!\n");	\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  647  		free ## want_arg (free_func, arg, ptr);			\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  648  	}								\
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  649  }
ca90800a91ba723 lib/test_overflow.c  Kees Cook 2018-05-10  650  

:::::: The code at line 637 was first introduced by commit
:::::: ca90800a91ba723d78ded634d037c1d2df8b54d6 test_overflow: Add memory allocation overflow tests

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
