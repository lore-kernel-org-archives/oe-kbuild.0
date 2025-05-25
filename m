Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4C11CA0
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748153599; cv=none; b=BaiTozLagml45bFiaW/B/xm7YVwgsKcWEcQ0ddk1i7t4hB3yJKqtF1YDB9AFPAhKyQJJfh7PM+P6bb+eTriaLyCPO00M2F/n9fUdKa28/t8JrvDC4LJjAHtPwQGRHF5BNbgTcvs6MUNXlQ6x7Dcnk9RljBk3UVEqhACik7cTD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748153599; c=relaxed/simple;
	bh=lhXikjx00rSLGQudgpf1IfGB6k6wRwwOB7yrfJjklUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gu0OoPrqxgDvYB1L8GVud6g3rs0w14MrP5rOceKdPhGHZumfeKuxXqbi02i/R6/I+mJZuvEzRZAZzQRVriL5o5l09psJB2sOTyYfqtw/9EfxwInUNNSkPgWzu9B8GcP3Z3ynnQDsRYNqu1vW0xncswhMGgFfWWPV3qD0pIb8u5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSSx7s2V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSSx7s2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748153598; x=1779689598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhXikjx00rSLGQudgpf1IfGB6k6wRwwOB7yrfJjklUU=;
  b=ZSSx7s2Vi8WDIgd2PbBkBvKa7q8p9alSZQaiGD/ai1dEch+Z7BPfcFGi
   +Jm0e/3wP/cOJFC4tlTMl14cTKpw6tKGEwSN7jqY0pa8qldhQMQJfqIpX
   moGXcau5lGjLYbsQgoogzksc337+iXlV6utU072bzZYXOKt7KTuwbYvaa
   S3NvAOem2BcKxDkELovMs4sWi3kc2yzViUwXlPqQuqa6LjvaOVBhOOs5k
   13FxGd6Atk8HTbOfoh57Jdm234TA9ojsKoOaqZ/TSAqLQpRJQ8NHDBiqv
   cX4rN7Ox3b3qZsmnvchxg/5tcIwugwkaLOeQbQ7nlzqKVRjjXg2gnD3ym
   g==;
X-CSE-ConnectionGUID: G2yx0/0QSB+SohaR1xCJ3A==
X-CSE-MsgGUID: Y/4fu3x/TbqGw5tprdruqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53959777"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="53959777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 23:13:17 -0700
X-CSE-ConnectionGUID: yQWrEnkdSequvDgP0KC5hg==
X-CSE-MsgGUID: cCEfmdfTSGKlqnZMYe929Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="141719206"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2025 23:13:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ4bh-000ReK-21;
	Sun, 25 May 2025 06:13:13 +0000
Date: Sun, 25 May 2025 14:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/tests/fortify_kunit.c:211:8-9: ERROR: reference preceded by free
 on line 208
Message-ID: <202505251407.2K2POdSl-lkp@intel.com>
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
head:   b1427432d3b656fac71b3f42824ff4aea3c9f93b
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-104-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251407.2K2POdSl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505251407.2K2POdSl-lkp@intel.com/

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
