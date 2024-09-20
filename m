Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA2D16B38E
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836833; cv=none; b=e7XGYrceQ0GCWP2gH0JltpbA36tcCHA/PhFjYFuGUlWijigrg26RWNjpShXpbzlbpxDOa1HBmiLQwG99nENPjm8JteTz4FJwUS0ugx10ipYRwJSKveLxV2ODCzl7L9rFt8FVR8BNNGlosy2OwlWuXzBoDTi6PwC9urPwtnhlVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836833; c=relaxed/simple;
	bh=h4RE4NrABW6tQM0WBRH8iu0lLHM2VJhoVtj9CR/L46Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rry+S0ysKbs0ZCsGE0n9Ry8HZhhKwgkZhrOUN4qQAqcwztVg7BeI7W02nEXefS4vyXRKbU+D3TTFLtlzacn31l/9FzvPMmI0eXWm7sxo4wK7ozhy8viPpeINDMIjRGxNY9lzUcDV3ejhdmhOCT611s6Tl1AUUk762kDeuyWYRS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJo9m4yd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJo9m4yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726836831; x=1758372831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4RE4NrABW6tQM0WBRH8iu0lLHM2VJhoVtj9CR/L46Y=;
  b=IJo9m4ydMuANiWZCpTR8++nVpQT6jnopmwDHe+Bkt9KxsRPCjyQLQoNt
   RMHnLN7IWF9uCUfPqhKyXPXLZtXGZ3iRxI401GtsYaKtjnPoFSs9Cjemp
   tCsVVoKmZKEMnUdpl9mN3/351qKgCKsvtbATqqx5fLgyR11XdPF37kVjx
   jG795eEGufo1o6wvlMTmcUeWM2DkG3ONXY3pMm4mOB81LvAwOABo7EqnZ
   9FL6ilQmotqqe/Z9/Ps5Fz/UnS6IlqHEiZJguCN3ueUdzMHRr4ksNMyeJ
   PgrF1LIKheb83+Stp0IbA7TtP0VNvoCUXQJxk2a3W36c/8NeRgb5jOuGq
   g==;
X-CSE-ConnectionGUID: 22mvSSGuQqSe0fnEq5EyPA==
X-CSE-MsgGUID: FtacIp0AQ66eCH6pMsK+6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36427931"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="36427931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:53:50 -0700
X-CSE-ConnectionGUID: x3ez/I0gQPqeBTcmyCqkvA==
X-CSE-MsgGUID: 4ZSwl45yQ7WrSuQr6gyZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70532769"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2024 05:53:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srd8t-000EQT-0g;
	Fri, 20 Sep 2024 12:53:47 +0000
Date: Fri, 20 Sep 2024 20:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11937/12481] mm/kasan/kasan_test_c.c:427
 krealloc_uaf() warn: passing freed memory 'ptr1'
Message-ID: <202409202046.PqKFpsea-lkp@intel.com>
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
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: a2f11547052001bd448ccec81dd1e68409078fbb [11937/12481] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 8 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240920 (https://download.01.org/0day-ci/archive/20240920/202409202046.PqKFpsea-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409202046.PqKFpsea-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed memory 'ptr1'
mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing freed memory 'ptr2'
mm/kasan/kasan_test_c.c:645 kmalloc_uaf_memset() warn: passing freed memory 'ptr'
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() warn: statement has no effect 8
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() error: dereferencing freed memory 'fp'
mm/kasan/kasan_test_c.c:895 workqueue_uaf() warn: statement has no effect 8
mm/kasan/kasan_test_c.c:966 kmem_cache_double_free() error: double free of 'p'
mm/kasan/kasan_test_c.c:1201 mempool_uaf_helper() warn: passing freed memory 'elem'
mm/kasan/kasan_test_c.c:1270 mempool_double_free_helper() error: double free of 'elem'
mm/kasan/kasan_test_c.c:1378 kasan_global_oob_right() error: buffer overflow 'array' 10 <= 13

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
26a5ca7a73be31 lib/test_kasan.c      Andrey Konovalov 2021-02-25  425  	kfree(ptr1);
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
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  470  	kfree(ptr2);
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
