Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FBF282F2C
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629078; cv=none; b=mE8wOzVAHeYQiwCaahTVPMoyxgCd3PAdAe8sOJ91UFZKBbPqjoFw5mMO8kyKcfaly1OxjcAWixzYccEbA8k32vG2my9eJlr3R15GlMsxM3h59vbQZVf4/EfmHGT/9rlVJF4Kf62mdT6bWDLD0VQ7oxRHvOtQSCd59HHMAylI7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629078; c=relaxed/simple;
	bh=9COnIlZzF74nVkBcrWZfIZmSCWJL+MdB8qEXzJSNJfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pv/0s10uNctULuAeoPTTDyKOakV9nxKSdzmVNpBGyMmAM4WNmuuG7OEcPfWk2KN5BvJdfDmVSEMbJZk38pUeB9up2BHqJLU5L7XhEwyTgrifzhRjFahJaROTiy/yAv8rz2LQ74PAv6U7seBG83mTf+smc0boiAQe/hH3ecXU+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtG0FtLs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtG0FtLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775629076; x=1807165076;
  h=date:from:to:cc:subject:message-id;
  bh=9COnIlZzF74nVkBcrWZfIZmSCWJL+MdB8qEXzJSNJfU=;
  b=VtG0FtLsycrVNRgnC6Bl9Gkoh14uk+WWWeeKuShNHhCRN3azyLjzJCIt
   NOzEJ0aLH3voJiJO3mltuvMveCtlMtGTj2R+bu0tLovkQ64NYPrDFeQh2
   IzVMwucf0+q2kXi3mJ1SpoFrYbLR8OPdvgeiq1sLGp6/H4OCeAtuiXBE6
   5hAC1kTnUjJ/mXPfWcZqqawV4SU4HYkiDDlHXwzHNi0QyjvFx/tal2G4s
   EPiDQXt330ESGKQaoX0KNY1MY9druTlLKfGvQus2XzJXaHwY9BRcLgIzj
   Ok0uBiq41txNO8VgZlwxSWEU1ZxKx+2AKEzs1Pso7jjsGHx96hYsh5Lx8
   w==;
X-CSE-ConnectionGUID: z3SrLnTsRNiBZ2cR7FK89g==
X-CSE-MsgGUID: Jds9wHnORRuYgL/XjmklRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87679318"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="87679318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 23:17:56 -0700
X-CSE-ConnectionGUID: PzqW5WcOSAmq6r2UU+QSYg==
X-CSE-MsgGUID: tIOi16R2REaI8/vO+rCRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="233338037"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2026 23:17:55 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAMEa-000000001Vb-2uuq;
	Wed, 08 Apr 2026 06:17:52 +0000
Date: Wed, 08 Apr 2026 14:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is
 used later (line 644) to compute the same size
Message-ID: <202604081400.w5GcL6mj-lkp@intel.com>
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
head:   3036cd0d3328220a1858b1ab390be8b562774e8a
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-102-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081400.w5GcL6mj-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604081400.w5GcL6mj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is used later (line 644) to compute the same size
--
>> lib/tests/overflow_kunit.c:295:14-19: Unneeded variable: "index". Return "0" on line 297

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
