Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB09289E34
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629820; cv=none; b=rExIojUpMmS4tjnsihsd0q0fPTI7eUG0zZC0MTeTPIeV0TxOZoWw6hVlZO/eMlWty+86nwgw7/GbMb7DFtncGYrfJOtKSE/oKU2O7rLzBsU4ya8u43O4NRicmIZ7TnLbWmS//SMstpXiRysZS0MKdPBk9WHyN0hZ2KHWbMB0RiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629820; c=relaxed/simple;
	bh=+08KNM1d9NcjJBo3eC5XQN1huzNvTpPHipUXC2sjpMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WxTiQGRqHouszItFxtFns0HGsYddm3HQvUcARSS9KL4wV5uQPnaQSdkLqL0w4sOFcv/OOTkBgbB/xywiB4aZ8gRjY7ucv6Dv7nnoF7yiQ7oxd/mDItIDX4O0lmQha7piBFenTTig2jon9dmkBvwnWJUk3DLLrzdxTSCX177jBLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwC+7Y7X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwC+7Y7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629818; x=1778165818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+08KNM1d9NcjJBo3eC5XQN1huzNvTpPHipUXC2sjpMY=;
  b=jwC+7Y7XWgOJ6AilqB4VvlIcnvaTbUkNPsVsjEna+NXiN9DRwM3r2Bh1
   zU5idxCfYROuNA+kH7I/lmzbUELKAgbhsUONDEMmmKgryEClDF84fYXn8
   fXBxtRgT9HFbwvTrmFr7Jr753DAlBPw2KWLsayxg6AHoRJp+Zai+0IXyv
   cNm3298cG6bxr04fDKBDufMG0gMS19PqX1y8ZgsRYaflPio4A76r1pIY1
   sCPKHO6Mn90Y8xm2nD7M5xAQO88u8gbWJfH2RhnwpMP5vZAeHA2hItL5i
   ddfB+xd1upln4D8iiv+OdfsUNfa36nOGWnFs1Gj6hi/EalUSFsGrcII8h
   Q==;
X-CSE-ConnectionGUID: qz54hZhbTgWYF6DFObc9lQ==
X-CSE-MsgGUID: OjIVilXOSGSpdjAXp8oCMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48381721"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48381721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:56:56 -0700
X-CSE-ConnectionGUID: zdoAxi2IRqKXuHm6/HRFKA==
X-CSE-MsgGUID: cMKA7sReT9ubkhBvTDO+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141101674"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 07:56:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgCa-00081s-2J;
	Wed, 07 May 2025 14:56:52 +0000
Date: Wed, 7 May 2025 22:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed
 memory 'ptr1' (line 425)
Message-ID: <202505072248.jfMMkzH7-lkp@intel.com>
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
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20250424 (https://download.01.org/0day-ci/archive/20250507/202505072248.jfMMkzH7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505072248.jfMMkzH7-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed memory 'ptr1' (line 425)
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() error: dereferencing freed memory 'fp' (line 856)
mm/kasan/kasan_test_c.c:966 kmem_cache_double_free() error: double free of 'p' (line 965)
mm/kasan/kasan_test_c.c:1201 mempool_uaf_helper() warn: passing freed memory 'elem' (line 1199)
mm/kasan/kasan_test_c.c:1270 mempool_double_free_helper() error: double free of 'elem' (line 1268)
mm/kasan/kasan_test_c.c:1378 kasan_global_oob_right() error: buffer overflow 'array' 10 <= 13

vim +/ptr1 +427 mm/kasan/kasan_test_c.c

b87c28b9a7ef64 lib/test_kasan.c Andrey Konovalov 2021-02-25  412  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  413  /*
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  414   * Check that krealloc() detects a use-after-free, returns NULL,
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  415   * and doesn't unpoison the freed object.
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  416   */
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  417  static void krealloc_uaf(struct kunit *test)
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  418  {
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  419  	char *ptr1, *ptr2;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  420  	int size1 = 201;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  421  	int size2 = 235;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  422  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  423  	ptr1 = kmalloc(size1, GFP_KERNEL);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  424  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25 @425  	kfree(ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  426  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25 @427  	KUNIT_EXPECT_KASAN_FAIL(test, ptr2 = krealloc(ptr1, size2, GFP_KERNEL));
ccad78f17f9f2a lib/test_kasan.c Ricardo Ribalda  2022-02-11  428  	KUNIT_ASSERT_NULL(test, ptr2);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  429  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  430  }
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  431  

:::::: The code at line 427 was first introduced by commit
:::::: 26a5ca7a73be31f76c291465680517cde37051ca kasan, mm: fail krealloc on freed objects

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
