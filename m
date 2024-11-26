Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAD196D9D
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732623358; cv=none; b=pokv72jHQHZhBctllhwei9wLRUPy167gdvdFN2IaOjivgt5BLTEAXU1vU2Es/S4lbEDyoo0lNgZphN++JwjSHSmsgj2wde3cq+KlDT43m/34Y5S9ZLt+Bazm16KUqHOddrtI9onI3TQ4YmtvIG6y110CLfXECz7nX1V5Oz55aaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732623358; c=relaxed/simple;
	bh=S2J+f4/jK3ZBA1s2bIYtjwrLhn6GJxr4WKdHdkdJRrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQD+5Bxp9fhJZu+Jrve6djTKu6ELss5ibqlGuKHN1CU4zy3tY4cLWEHT/CjaXmMRBhTz3euYrqPRATutMkQpOKLywjteyNorh9HwJFkQARU7Ps/lHFrLcvSdA2dBgh4u/pLN/YyPjtmvd2FC9Bn1LK/env8SwkpN5xoxSJb1hJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaSD4Qbt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaSD4Qbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732623356; x=1764159356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2J+f4/jK3ZBA1s2bIYtjwrLhn6GJxr4WKdHdkdJRrg=;
  b=YaSD4QbtCAj7BGiX53btjZczv4kDj5F7Z1O8e2vgUxDVKKXxY8NO5PFh
   qjxpNHB2JoqccHBOkLuckyF9Eg5ey3r191XNAnZd/6yuiwutJMR7NohFv
   b4h9hfRdlffIw07EtxUC1Fmyq9Dvw0OdREOzumQideChkGY2cMhmNB8Pm
   R2TmJxCJSo+yk9MdS52l3fkkWUeEI1MzLufCgLb2tE/XTw/OQQaX9G39t
   4ez0IwZ6Rn9noT7ll2e31vk7j2DmUw3Le2a8qqYLCak0wLQvKpC6CFsRM
   TNBd76+7OJ/iQ86t5LL+UEr7GuidaXUAyMzk0lT/LxOg0FC4mybLgPJcJ
   A==;
X-CSE-ConnectionGUID: 4LQmrC+lQOCZ1X+9GdHWLQ==
X-CSE-MsgGUID: lOInkTLNSpS1znU23+hR3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36441390"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="36441390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 04:15:56 -0800
X-CSE-ConnectionGUID: zpyh44NwSFm3I7CZhp7HPw==
X-CSE-MsgGUID: A+m25ZmpQHGzqySXvpm4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="96674782"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2024 04:15:55 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFuTw-0007HF-0t;
	Tue, 26 Nov 2024 12:15:52 +0000
Date: Tue, 26 Nov 2024 20:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed
 memory 'ptr1' (line 425)
Message-ID: <202411262039.Ce4wbBLM-lkp@intel.com>
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
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241126/202411262039.Ce4wbBLM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411262039.Ce4wbBLM-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed memory 'ptr1' (line 425)
mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing freed memory 'ptr2' (line 470)
mm/kasan/kasan_test_c.c:645 kmalloc_uaf_memset() warn: passing freed memory 'ptr' (line 644)
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() error: dereferencing freed memory 'fp' (line 856)
mm/kasan/kasan_test_c.c:966 kmem_cache_double_free() error: double free of 'p' (line 965)
mm/kasan/kasan_test_c.c:1201 mempool_uaf_helper() warn: passing freed memory 'elem' (line 1199)
mm/kasan/kasan_test_c.c:1270 mempool_double_free_helper() error: double free of 'elem' (line 1268)

vim +/ptr1 +427 mm/kasan/kasan_test_c.c

b87c28b9a7ef64 lib/test_kasan.c      Andrey Konovalov 2021-02-25  412  
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  413  /*
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  414   * Check that krealloc() detects a use-after-free, returns NULL,
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  415   * and doesn't unpoison the freed object.
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  416   */
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  417  static void krealloc_uaf(struct kunit *test)
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  418  {
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  419  	char *ptr1, *ptr2;
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  420  	int size1 = 201;
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  421  	int size2 = 235;
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  422  
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  423  	ptr1 = kmalloc(size1, GFP_KERNEL);
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  424  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25 @425  	kfree(ptr1);
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  426  
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25 @427  	KUNIT_EXPECT_KASAN_FAIL(test, ptr2 = krealloc(ptr1, size2, GFP_KERNEL));
ccad78f17f9f2a lib/test_kasan.c      Ricardo Ribalda  2022-02-11  428  	KUNIT_ASSERT_NULL(test, ptr2);
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  429  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)ptr1);
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  430  }
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  431  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  432  static void kmalloc_oob_16(struct kunit *test)
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  433  {
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  434  	struct {
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  435  		u64 words[2];
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  436  	} *ptr1, *ptr2;
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  437  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  438  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  439  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  440  	/* This test is specifically crafted for the generic mode. */
da17e377723f50 lib/test_kasan.c      Andrey Konovalov 2021-02-24  441  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  442  
e10aea105e9ed1 mm/kasan/kasan_test.c Arnd Bergmann    2024-02-12  443  	/* RELOC_HIDE to prevent gcc from warning about short alloc */
e10aea105e9ed1 mm/kasan/kasan_test.c Arnd Bergmann    2024-02-12  444  	ptr1 = RELOC_HIDE(kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL), 0);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  445  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  446  
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  447  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  448  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  449  
aaf50b1969d793 lib/test_kasan.c      Kees Cook        2022-06-08  450  	OPTIMIZER_HIDE_VAR(ptr1);
aaf50b1969d793 lib/test_kasan.c      Kees Cook        2022-06-08  451  	OPTIMIZER_HIDE_VAR(ptr2);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  452  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  453  	kfree(ptr1);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  454  	kfree(ptr2);
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  455  }
3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  456  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  457  static void kmalloc_uaf_16(struct kunit *test)
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  458  {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  459  	struct {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  460  		u64 words[2];
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  461  	} *ptr1, *ptr2;
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  462  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  463  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  464  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  465  	ptr1 = kmalloc(sizeof(*ptr1), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  466  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  467  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  468  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  469  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01 @470  	kfree(ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  471  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01 @472  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  473  	kfree(ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  474  }
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  475  

:::::: The code at line 427 was first introduced by commit
:::::: 26a5ca7a73be31f76c291465680517cde37051ca kasan, mm: fail krealloc on freed objects

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
