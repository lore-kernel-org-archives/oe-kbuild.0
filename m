Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB42E613A
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769936091; cv=none; b=Kb1OTWewdmM1z1+DNNJrLmlwCIUW60AXyXDAd78/8GsPom2llmK9r3wGoYWAN1yWWumtH0iCP51F+K9I0sRZu+fVjGz8LeR+itxEIfA+uXmsCdt80Vo0RR+ARorBI2OZS4q1KybVzfMaAEurMDiiCU2VYO2TF2VQ5yQEYqtUNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769936091; c=relaxed/simple;
	bh=TombKC88PnC8kMnggJW4+AaZfUvqghpkyLzIbhD6Yh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tPr0folF+D/Sr7HsXe0amLzRO4NrqX2WJle/skwsEuM+H2AQZE4Jb0k+Jo+1jb4mh62Z9DEtTt3DV72/UlqNI4D2h39AejdDZOIkW2qldXUWd8+mN+Rg8UGtCHRdtryv9yA9RqKLOoRDN+Om9LegGpY/tlsZd4uk074piAQ4Teo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ioz4jfPO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ioz4jfPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769936090; x=1801472090;
  h=date:from:to:cc:subject:message-id;
  bh=TombKC88PnC8kMnggJW4+AaZfUvqghpkyLzIbhD6Yh4=;
  b=Ioz4jfPOk0x3kUbylgWMW/57+iUgzddlU0vGtw80yLNRqURJ/6tf1Yf2
   fUXXReAN2zPEo0yC9XIgRZrhfG7x+v9kumY2EJ7ePaaEyQhVDRW5GfLxD
   t7PdYioB8gLgamSLRT4pd9bn02FD83ayIjGhK0m60bIr2LGG9iY0x0ppI
   8CGjpya2IMpDvn0z22b0wc6gMD9Uqicmh3ZLzJJO5WVgFSKkxdO9PxUnm
   CVAeFgAzr/bnjDgSPlrIhEoiIpmTVYFXBwSTeEQQB6+BpM3KqW4NuSnHd
   McXszVZlGvWqgVUwLGQeVQX3qIw/qvVy0M9gE5QkKiScVMsJRLv80v7MH
   A==;
X-CSE-ConnectionGUID: DraOrL8dSZ2cew6fb2s8JA==
X-CSE-MsgGUID: MEhIbJCQSyWCqB+hvt5TmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81438366"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="81438366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:54:48 -0800
X-CSE-ConnectionGUID: UuRi6ECgQoWllfYOGcJk8g==
X-CSE-MsgGUID: UnBUPBHdRgyFLEFjchYAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213323636"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 00:54:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmTEC-00000000egE-0A5c;
	Sun, 01 Feb 2026 08:54:44 +0000
Date: Sun, 01 Feb 2026 16:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is
 used later (line 644) to compute the same size
Message-ID: <202602011620.h8Kfb019-lkp@intel.com>
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
head:   162b42445b585cd89f45475848845db353539605
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-102-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011620.h8Kfb019-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602011620.h8Kfb019-lkp@intel.com/

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

vim +637 lib/tests/overflow_kunit.c

ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  621  
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  622  #define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  623  static void test_ ## func (struct kunit *test, void *arg)		\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  624  {									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  625  	volatile size_t a = TEST_SIZE;					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  626  	volatile size_t b = (SIZE_MAX / TEST_SIZE) + 1;			\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  627  	void *ptr;							\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  628  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  629  	/* Tiny allocation test. */					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  630  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  631  	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  632  			    #func " failed regular allocation?!\n");	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  633  	free ## want_arg (free_func, arg, ptr);				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  634  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  635  	/* Wrapped allocation test. */					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  636  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10 @637  							  a * b);	\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  638  	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  639  			    #func " unexpectedly failed bad wrapping?!\n"); \
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  640  	free ## want_arg (free_func, arg, ptr);				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  641  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  642  	/* Saturated allocation test. */				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  643  	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10 @644  						   array_size(a, b));	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  645  	if (ptr) {							\
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  646  		KUNIT_FAIL(test, #func " missed saturation!\n");	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  647  		free ## want_arg (free_func, arg, ptr);			\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  648  	}								\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  649  }
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  650  

:::::: The code at line 637 was first introduced by commit
:::::: ca90800a91ba723d78ded634d037c1d2df8b54d6 test_overflow: Add memory allocation overflow tests

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
