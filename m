Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6523774
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748050557; cv=none; b=G/6UpUGzzYHysGt4DDIh5zniK3wB9eJGREEVm4dO4/HG1DJT3t5fTmPrhxbg1rJVvMfmepNefDaFH0QQUvlL+M7gj+6fIIwJdU9Sxn7N73cQrOR9UelAQ/QPCVisJ+Wq5E8jN552ViMpSFxTURdVbDwNwzk/2fQKCCYvL5qJltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748050557; c=relaxed/simple;
	bh=3uPGj5W2z+ZKHfEM/BE7x1R5SVQP8qgk1RQd5vy+FAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcSBzrJzAHrjjssUhrRrWx1nSIV/lZ9YIbTooARz3W+bXpIAMv1OIv0qg76hrtAhTiZ9Ohd8tMvzXSXDO5U2ucYLviw1ZM61oT4rg9JLICNieAEsk/BFbo580C3ZF8rTteOAScWrGqy2BjtzwCYNl13CjoojOEwDb8lj20/dn0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAiQz9xH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAiQz9xH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748050556; x=1779586556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uPGj5W2z+ZKHfEM/BE7x1R5SVQP8qgk1RQd5vy+FAM=;
  b=mAiQz9xHdi9IoLh64yOu/iLTn9iFHZAhpPUvpz//JycZukcF9jokpKpg
   UIf27lG+lqxRR+X7OPWUDCeMroxAhI7heRHMtsiC2cMq9iNwcVrr8Myf8
   Cb8YNQnOF+pYlXSuhbm/ySpzXuIovlJzWhsBb02MWnFSpI7+3ixQDnnbB
   9XihxEYYqqozLBADzx39ow4XOTB4W2GujUIuqwmUnGXDTPLCOtMUNvp2c
   Yj7Xnf9i6cviacbWPOlzckBgN9h4fmJvIw2NioaU9lQnmN97pwLN1sVfq
   5PuMN+b02s8T+lfGcpdxfxk/tjHdMTc108wIM5NCObIkEY4EN8iptboLc
   w==;
X-CSE-ConnectionGUID: s4ZaiYNdRoCf0iFJ9vkvrQ==
X-CSE-MsgGUID: jdwsPPVnQ9GNN+rOEQXBxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53918268"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="53918268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 18:35:53 -0700
X-CSE-ConnectionGUID: hDs+VLDbTgOkxCVba2QxrA==
X-CSE-MsgGUID: 8fPI9IC9Sg+Wu+O5bKYoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142329103"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 18:35:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIdni-000QrN-0b;
	Sat, 24 May 2025 01:35:50 +0000
Date: Sat, 24 May 2025 09:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/overflow_kunit.c:637:13-14: WARNING: array_size is used
 later (line 644) to compute the same size
Message-ID: <202505240949.oKaaAeZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-104-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240949.oKaaAeZq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505240949.oKaaAeZq-lkp@intel.com/

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
