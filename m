Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765F46529
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Dec 2023 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahz3W4Rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703699395; x=1735235395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6xPjaxl3D9S6EJjf61hEMyepOaSb1ImRWwps1IbUks=;
  b=Ahz3W4Rtkei5F/l+NHuLKT8sjkevYY3qBgmWEyXF5smf3wqu2WseR7EX
   xDl2irF7dH1kRfYuw2io0/Fii0+nSV/hA1ym8nL/gQ8xUqdPYytpdQuKR
   gpgRz3LUQxX6/JMy57vRbK+vy3w2Ii3f5EChL092GdxcTkn73X0L+pOdd
   8F9144AYsUSubfLaa3nxwxnnwEqXM3/bMt1OiOifHNQq6ius/8G8ARx9G
   hj0c/XBSK/FF/5MVNoeqGWEOfvrDDFrvGOlg703Pj5cLmTB3RqZJ38uqW
   7SXbZ1x722bju6Ij1ahaU+jcXMFem/fE93dQ7l8z/V6pdYUYzE41pI74b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460798043"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="460798043"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1025439993"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="1025439993"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Dec 2023 09:49:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIY2M-000Fcd-04;
	Wed, 27 Dec 2023 17:49:46 +0000
Date: Thu, 28 Dec 2023 01:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9659/10295] mm/kasan/kasan_test.c:951
 mempool_uaf_helper() warn: passing freed memory 'elem'
Message-ID: <202312280144.lvqZMenw-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 2f8b66a9486b81b8f18032ae149cd574dd53f227 [9659/10295] kasan: add mempool tests
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231227 (https://download.01.org/0day-ci/archive/20231228/202312280144.lvqZMenw-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312280144.lvqZMenw-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test.c:951 mempool_uaf_helper() warn: passing freed memory 'elem'
mm/kasan/kasan_test.c:1023 mempool_double_free_helper() error: double free of 'elem'

vim +/elem +951 mm/kasan/kasan_test.c

2f8b66a9486b81b Andrey Konovalov 2023-12-19   933  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   934  /*
2f8b66a9486b81b Andrey Konovalov 2023-12-19   935   * Skip the out-of-bounds test for page mempool. With Generic KASAN, page
2f8b66a9486b81b Andrey Konovalov 2023-12-19   936   * allocations have no redzones, and thus the out-of-bounds detection is not
2f8b66a9486b81b Andrey Konovalov 2023-12-19   937   * guaranteed; see https://bugzilla.kernel.org/show_bug.cgi?id=210503. With
2f8b66a9486b81b Andrey Konovalov 2023-12-19   938   * the tag-based KASAN modes, the neighboring allocation might have the same
2f8b66a9486b81b Andrey Konovalov 2023-12-19   939   * tag; see https://bugzilla.kernel.org/show_bug.cgi?id=203505.
2f8b66a9486b81b Andrey Konovalov 2023-12-19   940   */
2f8b66a9486b81b Andrey Konovalov 2023-12-19   941  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   942  static void mempool_uaf_helper(struct kunit *test, mempool_t *pool, bool page)
2f8b66a9486b81b Andrey Konovalov 2023-12-19   943  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19   944  	char *elem, *ptr;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   945  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   946  	elem = mempool_alloc_preallocated(pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   947  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, elem);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   948  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   949  	mempool_free(elem, pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   950  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  @951  	ptr = page ? page_address((struct page *)elem) : elem;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   952  	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   953  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19   954  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   955  static void mempool_kmalloc_uaf(struct kunit *test)
2f8b66a9486b81b Andrey Konovalov 2023-12-19   956  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19   957  	mempool_t pool;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   958  	size_t size = 128;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   959  	void *extra_elem;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   960  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   961  	extra_elem = mempool_prepare_kmalloc(test, &pool, size);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   962  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   963  	mempool_uaf_helper(test, &pool, false);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   964  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   965  	mempool_free(extra_elem, &pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   966  	mempool_exit(&pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   967  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19   968  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   969  static void mempool_kmalloc_large_uaf(struct kunit *test)
2f8b66a9486b81b Andrey Konovalov 2023-12-19   970  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19   971  	mempool_t pool;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   972  	size_t size = KMALLOC_MAX_CACHE_SIZE + 1;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   973  	void *extra_elem;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   974  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   975  	/* page_alloc fallback is only implemented for SLUB. */
2f8b66a9486b81b Andrey Konovalov 2023-12-19   976  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_SLUB);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   977  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   978  	extra_elem = mempool_prepare_kmalloc(test, &pool, size);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   979  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   980  	mempool_uaf_helper(test, &pool, false);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   981  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   982  	mempool_free(extra_elem, &pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   983  	mempool_exit(&pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   984  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19   985  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   986  static void mempool_slab_uaf(struct kunit *test)
2f8b66a9486b81b Andrey Konovalov 2023-12-19   987  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19   988  	mempool_t pool;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   989  	size_t size = 123;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   990  	struct kmem_cache *cache;
2f8b66a9486b81b Andrey Konovalov 2023-12-19   991  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   992  	cache = mempool_prepare_slab(test, &pool, size);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   993  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   994  	mempool_uaf_helper(test, &pool, false);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   995  
2f8b66a9486b81b Andrey Konovalov 2023-12-19   996  	mempool_exit(&pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   997  	kmem_cache_destroy(cache);
2f8b66a9486b81b Andrey Konovalov 2023-12-19   998  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19   999  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1000  static void mempool_page_alloc_uaf(struct kunit *test)
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1001  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1002  	mempool_t pool;
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1003  	int order = 2;
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1004  	void *extra_elem;
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1005  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1006  	extra_elem = mempool_prepare_page(test, &pool, order);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1007  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1008  	mempool_uaf_helper(test, &pool, true);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1009  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1010  	mempool_free(extra_elem, &pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1011  	mempool_exit(&pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1012  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1013  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1014  static void mempool_double_free_helper(struct kunit *test, mempool_t *pool)
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1015  {
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1016  	char *elem;
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1017  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1018  	elem = mempool_alloc_preallocated(pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1019  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, elem);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1020  
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1021  	mempool_free(elem, pool);
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1022  
2f8b66a9486b81b Andrey Konovalov 2023-12-19 @1023  	KUNIT_EXPECT_KASAN_FAIL(test, mempool_free(elem, pool));
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1024  }
2f8b66a9486b81b Andrey Konovalov 2023-12-19  1025  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
