Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1806C1A83E8
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Apr 2025 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623703; cv=none; b=qllk31wlnfNb8YKyJlAq4rq0hq33hjDpq5Sn19kE1h8EuLymkezbgYVF3yssFQ/fLGjGgh08X9b2c9KMwmOcJengEABnIHAoVpkBeDZ9s4aQOedoJLMZjEmVv5xLnnHNDpSXJEONQhNlFKLAc9bp2s3R1xW1ZyU9TNIzaOdHNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623703; c=relaxed/simple;
	bh=5nl9NoB6Plm9qSAnjDCF8G4q+HgQectGlybrGheXRHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMn5/kVIk4QZe4idAa9yOas+W6G4dxe50Mpmgy/wBBLLe/jglAn8e12636dQVN3I28VsJ36th8PzHvhD/8DZJ+M9UXaItrQqKeN0Jh85ed89FYBvze6ezOFKWLkfMAyBlwfwvppoRMvj89clt3ZkIJCSJEdUJmM6wBUzxWWtVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjfD7h5J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjfD7h5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744623701; x=1776159701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nl9NoB6Plm9qSAnjDCF8G4q+HgQectGlybrGheXRHk=;
  b=MjfD7h5J/nuqLiO6N34OtY9Oo/+a/BC/5zp0cbiG6MoRbQbr+x0ksiek
   V09Bc0UFtv89vKp3KPriOaE+sCPXBrtPlVcsv5VrTf9CTdbBhG30OjKZb
   CGPeDyEZpDTgsVW50GLxvUFIzbE+VVotGLBtKECWY5YYGIJcQfsPCs7lQ
   7hVxNZ01+yhnzazPZOo3J0QgU0SfkhxQwiDQs+TYoeFahn4H8kqBdGIIf
   vk2YAxq3quduMLp0ReatQh13KWWIG1lWTJfhZu5VfTIapURtTnv1o5949
   TWC3hT0D7EGUePn2DdU13304T8k4Mvigs/WapNz8Ia0GwqSmT6czmXJjt
   g==;
X-CSE-ConnectionGUID: qFDvvf+mQuKf3EGAQ/iurg==
X-CSE-MsgGUID: ykdM781dR92KR73csj5RlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45222155"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45222155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:41:39 -0700
X-CSE-ConnectionGUID: yXZURRfNQFKHkG09kaljRw==
X-CSE-MsgGUID: ovQ9E3aTQM6nk4UrBq7vew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="152952922"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2025 02:41:38 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4GJs-000E0A-03;
	Mon, 14 Apr 2025 09:41:36 +0000
Date: Mon, 14 Apr 2025 17:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing
 freed memory 'ptr2' (line 470)
Message-ID: <202504141722.wPO7UVwN-lkp@intel.com>
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
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20250414 (https://download.01.org/0day-ci/archive/20250414/202504141722.wPO7UVwN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504141722.wPO7UVwN-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing freed memory 'ptr2' (line 470)
mm/kasan/kasan_test_c.c:645 kmalloc_uaf_memset() warn: passing freed memory 'ptr' (line 644)

vim +/ptr2 +472 mm/kasan/kasan_test_c.c

3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  456  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  457  static void kmalloc_uaf_16(struct kunit *test)
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  458  {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  459  	struct {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  460  		u64 words[2];
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  461  	} *ptr1, *ptr2;
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  462  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  463  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  464  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  465  	ptr1 = kmalloc(sizeof(*ptr1), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  466  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  467  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  468  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  469  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01 @470  	kfree(ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  471  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01 @472  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  473  	kfree(ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  474  }
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov    2020-11-01  475  
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  476  /*
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  477   * Note: in the memset tests below, the written range touches both valid and
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  478   * invalid memory. This makes sure that the instrumentation does not only check
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  479   * the starting address but the whole range.
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  480   */
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  481  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  482  static void kmalloc_oob_memset_2(struct kunit *test)
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  483  {
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  484  	char *ptr;
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  485  	size_t size = 128 - KASAN_GRANULE_SIZE;
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  486  	size_t memset_size = 2;
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  487  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  488  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  489  
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  490  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  491  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
f33a01492a24a2 lib/test_kasan.c      Walter Wu           2020-08-06  492  
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  493  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  494  	OPTIMIZER_HIDE_VAR(size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  495  	OPTIMIZER_HIDE_VAR(memset_size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  496  	KUNIT_EXPECT_KASAN_FAIL(test, memset(ptr + size - 1, 0, memset_size));
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  497  	kfree(ptr);
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  498  }
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  499  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  500  static void kmalloc_oob_memset_4(struct kunit *test)
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  501  {
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  502  	char *ptr;
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  503  	size_t size = 128 - KASAN_GRANULE_SIZE;
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  504  	size_t memset_size = 4;
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  505  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  506  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  507  
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  508  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  509  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
f33a01492a24a2 lib/test_kasan.c      Walter Wu           2020-08-06  510  
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  511  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  512  	OPTIMIZER_HIDE_VAR(size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  513  	OPTIMIZER_HIDE_VAR(memset_size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  514  	KUNIT_EXPECT_KASAN_FAIL(test, memset(ptr + size - 3, 0, memset_size));
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  515  	kfree(ptr);
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  516  }
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  517  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  518  static void kmalloc_oob_memset_8(struct kunit *test)
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  519  {
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  520  	char *ptr;
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  521  	size_t size = 128 - KASAN_GRANULE_SIZE;
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  522  	size_t memset_size = 8;
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  523  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  524  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  525  
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  526  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  527  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
f33a01492a24a2 lib/test_kasan.c      Walter Wu           2020-08-06  528  
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  529  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  530  	OPTIMIZER_HIDE_VAR(size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  531  	OPTIMIZER_HIDE_VAR(memset_size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  532  	KUNIT_EXPECT_KASAN_FAIL(test, memset(ptr + size - 7, 0, memset_size));
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  533  	kfree(ptr);
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  534  }
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  535  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  536  static void kmalloc_oob_memset_16(struct kunit *test)
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  537  {
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  538  	char *ptr;
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  539  	size_t size = 128 - KASAN_GRANULE_SIZE;
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  540  	size_t memset_size = 16;
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  541  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  542  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  543  
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  544  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  545  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
f33a01492a24a2 lib/test_kasan.c      Walter Wu           2020-08-06  546  
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  547  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  548  	OPTIMIZER_HIDE_VAR(size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  549  	OPTIMIZER_HIDE_VAR(memset_size);
b2325bf860faa2 mm/kasan/kasan_test.c Nico Pache          2023-12-12  550  	KUNIT_EXPECT_KASAN_FAIL(test, memset(ptr + size - 15, 0, memset_size));
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  551  	kfree(ptr);
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  552  }
f523e737c08f5d lib/test_kasan.c      Wang Long           2015-11-05  553  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  554  static void kmalloc_oob_in_memset(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  555  {
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  556  	char *ptr;
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  557  	size_t size = 128 - KASAN_GRANULE_SIZE;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  558  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  559  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  560  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  561  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  562  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
f33a01492a24a2 lib/test_kasan.c      Walter Wu           2020-08-06  563  
09c6304e38e440 lib/test_kasan.c      Marco Elver         2022-01-29  564  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  565  	OPTIMIZER_HIDE_VAR(size);
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  566  	KUNIT_EXPECT_KASAN_FAIL(test,
555999a009aacd lib/test_kasan.c      Andrey Konovalov    2021-09-02  567  				memset(ptr, 0, size + KASAN_GRANULE_SIZE));
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  568  	kfree(ptr);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  569  }
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  570  
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  571  static void kmalloc_memmove_negative_size(struct kunit *test)
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  572  {
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  573  	char *ptr;
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  574  	size_t size = 64;
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  575  	size_t invalid_size = -2;
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  576  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  577  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  578  
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  579  	/*
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  580  	 * Hardware tag-based mode doesn't check memmove for negative size.
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  581  	 * As a result, this test introduces a side-effect memory corruption,
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  582  	 * which can result in a crash.
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  583  	 */
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  584  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_HW_TAGS);
1b0668be62cfa3 lib/test_kasan.c      Andrey Konovalov    2021-09-02  585  
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  586  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  587  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  588  
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  589  	memset((char *)ptr, 0, 64);
09c6304e38e440 lib/test_kasan.c      Marco Elver         2022-01-29  590  	OPTIMIZER_HIDE_VAR(ptr);
d73dad4eb5ad8c lib/test_kasan.c      Kees Cook           2021-11-05  591  	OPTIMIZER_HIDE_VAR(invalid_size);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  592  	KUNIT_EXPECT_KASAN_FAIL(test,
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  593  		memmove((char *)ptr, (char *)ptr + 4, invalid_size));
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  594  	kfree(ptr);
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  595  }
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  596  
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  597  static void kmalloc_memmove_invalid_size(struct kunit *test)
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  598  {
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  599  	char *ptr;
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  600  	size_t size = 64;
d6e5040bd8e533 mm/kasan/kasan_test.c Andrey Konovalov    2022-09-26  601  	size_t invalid_size = size;
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  602  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  603  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  604  
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  605  	ptr = kmalloc(size, GFP_KERNEL);
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  606  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
758cabae312d3a lib/test_kasan.c      Peter Collingbourne 2021-11-05  607  
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  608  	memset((char *)ptr, 0, 64);
09c6304e38e440 lib/test_kasan.c      Marco Elver         2022-01-29  609  	OPTIMIZER_HIDE_VAR(ptr);
d6e5040bd8e533 mm/kasan/kasan_test.c Andrey Konovalov    2022-09-26  610  	OPTIMIZER_HIDE_VAR(invalid_size);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  611  	KUNIT_EXPECT_KASAN_FAIL(test,
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  612  		memmove((char *)ptr, (char *)ptr + 4, invalid_size));
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  613  	kfree(ptr);
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  614  }
98f3b56fa62a61 lib/test_kasan.c      Walter Wu           2020-04-01  615  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  616  static void kmalloc_uaf(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  617  {
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  618  	char *ptr;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  619  	size_t size = 10;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  620  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  621  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  622  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  623  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  624  	kfree(ptr);
8fbad19bdcb4b9 lib/test_kasan.c      Andrey Konovalov    2021-09-02  625  	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[8]);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  626  }
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  627  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  628  static void kmalloc_uaf_memset(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  629  {
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  630  	char *ptr;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  631  	size_t size = 33;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  632  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  633  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver         2023-02-24  634  
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  635  	/*
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  636  	 * Only generic KASAN uses quarantine, which is required to avoid a
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  637  	 * kernel memory corruption this test causes.
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  638  	 */
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  639  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
25b12a58e84845 lib/test_kasan.c      Andrey Konovalov    2021-09-02  640  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  641  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13  642  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  643  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13 @644  	kfree(ptr);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso    2020-10-13 @645  	KUNIT_EXPECT_KASAN_FAIL(test, memset(ptr, 0, size));
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  646  }
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin     2015-02-13  647  

:::::: The code at line 472 was first introduced by commit
:::::: 58b999d7a22c59313e1e84832607c7a61640f4e7 kasan: adopt KUNIT tests to SW_TAGS mode

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
