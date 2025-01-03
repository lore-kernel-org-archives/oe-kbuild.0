Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B011CA0
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917447; cv=none; b=IiVDkQsaMLbszKydbvJ2GKAv7y0nafuq6h3shtAAzoYzp2XaZTvK5yn7CiSORboFTQRPr3RcDZXw3NdGnqKImEZkuG+FcIGuQrnaijWb6jDBxa6sfbNaM3bCnkyIdg6NRtgF6y+3geBdOQqiobZITLwPp0J6UTw5ChwBLkh4LJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917447; c=relaxed/simple;
	bh=+hQghwKfslDZfT0P20mZFRq3MJyrWhSUGlsiDjvvnEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjAFWvnBTp1iIgvpNr1FlDt9rCj4xuN+PRWKFY7T7yZ8lzIVMTFEUaSUfskq7YeXKPfFd7eua8FjtF03SbKFa9PcCGtTHmttTvOs3CxILTLWOasnkitWyNKosHjCR9vSIf+dul4o1TH26rM/Yyd+gUEuJO92VOv4RIDfRrYvh/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwtAKN/b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwtAKN/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735917445; x=1767453445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hQghwKfslDZfT0P20mZFRq3MJyrWhSUGlsiDjvvnEo=;
  b=hwtAKN/bZkF5W1D54qhpT3jlF2jaPUf6Py2iEvQn40SmLa/sGp1VZj50
   4bOPK/PEmK8P3roBHOGTSzmEdgZ88MEYlj9qgQf3ZuXRHpbj4yGK61iw2
   IDsO1lyIpLE98yZJtvseBSUTBFveoXnRfNJI7jf9i7n9UqFU8ySwe6n8N
   fIm3RvsFAoQnuHXAKY7WoczPHK9ekknZuQZNJeDyWcc0l2VnIX/rXCYOf
   9Hbbw4j5Y7nymYnA0dk1bGccM6XTTSWGNqt0QoW9j0HVhKzNNF5d3LUQk
   Fj+8GBPNiiVUp3tBSuGmTqyPh4S3vuCTMms21QL4uyHSamu+3Jw1EBZZX
   g==;
X-CSE-ConnectionGUID: bRRGfuzoQLeGRec+DLnJwQ==
X-CSE-MsgGUID: eQrdMaghRzGYjZUbj8a2qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47153334"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47153334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 07:17:25 -0800
X-CSE-ConnectionGUID: L9dbcXqwRQq9znEclLVEug==
X-CSE-MsgGUID: 87EGX+j5TyqrjlpXAemKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106440212"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 07:17:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTjQP-0009tD-1f;
	Fri, 03 Jan 2025 15:17:21 +0000
Date: Fri, 3 Jan 2025 23:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/fortify_kunit.c:161:8-9: ERROR: reference preceded by free on
 line 158
Message-ID: <202501032333.LvwsEwsA-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 1a78f8cb5daac77405e449f5305ad72c01818a46 fortify: Allow KUnit test to build without FORTIFY
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: hexagon-randconfig-r054-20250102 (https://download.01.org/0day-ci/archive/20250103/202501032333.LvwsEwsA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501032333.LvwsEwsA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/fortify_kunit.c:161:8-9: ERROR: reference preceded by free on line 158
   lib/fortify_kunit.c:163:8-9: ERROR: reference preceded by free on line 161
   lib/fortify_kunit.c:166:8-9: ERROR: reference preceded by free on line 163
   lib/fortify_kunit.c:168:8-9: ERROR: reference preceded by free on line 166
   lib/fortify_kunit.c:170:8-9: ERROR: reference preceded by free on line 168
   lib/fortify_kunit.c:173:8-9: ERROR: reference preceded by free on line 170
   lib/fortify_kunit.c:176:8-9: ERROR: reference preceded by free on line 173
   lib/fortify_kunit.c:178:8-9: ERROR: reference preceded by free on line 176
   lib/fortify_kunit.c:180:8-9: ERROR: reference preceded by free on line 178
   lib/fortify_kunit.c:183:8-9: ERROR: reference preceded by free on line 180
   lib/fortify_kunit.c:186:8-9: ERROR: reference preceded by free on line 183
   lib/fortify_kunit.c:188:8-9: ERROR: reference preceded by free on line 186
   lib/fortify_kunit.c:191:8-9: ERROR: reference preceded by free on line 188
   lib/fortify_kunit.c:197:8-9: ERROR: reference preceded by free on line 191
   lib/fortify_kunit.c:202:8-9: ERROR: reference preceded by free on line 197
   lib/fortify_kunit.c:207:8-9: ERROR: reference preceded by free on line 202
   lib/fortify_kunit.c:213:54-55: ERROR: reference preceded by free on line 207

vim +161 lib/fortify_kunit.c

9124a26401483b Kees Cook 2022-09-29  151  
9124a26401483b Kees Cook 2022-09-29  152  #define TEST_kmalloc(checker, expected_size, alloc_size)	do {	\
9124a26401483b Kees Cook 2022-09-29  153  	gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;				\
9124a26401483b Kees Cook 2022-09-29  154  	void *orig;							\
9124a26401483b Kees Cook 2022-09-29  155  	size_t len;							\
9124a26401483b Kees Cook 2022-09-29  156  									\
9124a26401483b Kees Cook 2022-09-29  157  	checker(expected_size, kmalloc(alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29 @158  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  159  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  160  		kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29 @161  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  162  	checker(expected_size, kzalloc(alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  163  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  164  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  165  		kzalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  166  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  167  	checker(expected_size, kcalloc(1, alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  168  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  169  	checker(expected_size, kcalloc(alloc_size, 1, gfp),		\
9124a26401483b Kees Cook 2022-09-29  170  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  171  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  172  		kcalloc_node(1, alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  173  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  174  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  175  		kcalloc_node(alloc_size, 1, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  176  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  177  	checker(expected_size, kmalloc_array(1, alloc_size, gfp),	\
9124a26401483b Kees Cook 2022-09-29  178  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  179  	checker(expected_size, kmalloc_array(alloc_size, 1, gfp),	\
9124a26401483b Kees Cook 2022-09-29  180  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  181  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  182  		kmalloc_array_node(1, alloc_size, gfp, NUMA_NO_NODE),	\
9124a26401483b Kees Cook 2022-09-29  183  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  184  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  185  		kmalloc_array_node(alloc_size, 1, gfp, NUMA_NO_NODE),	\
9124a26401483b Kees Cook 2022-09-29  186  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  187  	checker(expected_size, __kmalloc(alloc_size, gfp),		\
9124a26401483b Kees Cook 2022-09-29  188  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  189  	checker(expected_size,						\
9124a26401483b Kees Cook 2022-09-29  190  		__kmalloc_node(alloc_size, gfp, NUMA_NO_NODE),		\
9124a26401483b Kees Cook 2022-09-29  191  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  192  									\
9124a26401483b Kees Cook 2022-09-29  193  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  194  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  195  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  196  		krealloc(orig, (alloc_size) * 2, gfp),			\
9124a26401483b Kees Cook 2022-09-29  197  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  198  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  199  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  200  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  201  		krealloc_array(orig, 1, (alloc_size) * 2, gfp),		\
9124a26401483b Kees Cook 2022-09-29  202  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  203  	orig = kmalloc(alloc_size, gfp);				\
9124a26401483b Kees Cook 2022-09-29  204  	KUNIT_EXPECT_TRUE(test, orig != NULL);				\
9124a26401483b Kees Cook 2022-09-29  205  	checker((expected_size) * 2,					\
9124a26401483b Kees Cook 2022-09-29  206  		krealloc_array(orig, (alloc_size) * 2, 1, gfp),		\
9124a26401483b Kees Cook 2022-09-29  207  		kfree(p));						\
9124a26401483b Kees Cook 2022-09-29  208  									\
9124a26401483b Kees Cook 2022-09-29  209  	len = 11;							\
9124a26401483b Kees Cook 2022-09-29  210  	/* Using memdup() with fixed size, so force unknown length. */	\
9124a26401483b Kees Cook 2022-09-29  211  	if (!__builtin_constant_p(expected_size))			\
9124a26401483b Kees Cook 2022-09-29  212  		len += zero_size;					\
9124a26401483b Kees Cook 2022-09-29  213  	checker(len, kmemdup("hello there", len, gfp), kfree(p));	\
9124a26401483b Kees Cook 2022-09-29  214  } while (0)
9124a26401483b Kees Cook 2022-09-29  215  DEFINE_ALLOC_SIZE_TEST_PAIR(kmalloc)
9124a26401483b Kees Cook 2022-09-29  216  

:::::: The code at line 161 was first introduced by commit
:::::: 9124a26401483bf2b13a99cb4317dce3f677060f kunit/fortify: Validate __alloc_size attribute results

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
