Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3175156886
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719664; cv=none; b=tLRhPQbMl0O5QhjNIO2ZDqXTsHH1R3NCajDL2LT0b+Pa5czg0KBj0c8ndveZpuEKHY+dOBPMdlweQkmk5hfeFj23GdFTo8zxQ0EwA6AmNP9a1n98kbfK9k0kShya+IplgivI1fUxftVJjEbib4yZ4COZfLZViY7+gQEMivcVmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719664; c=relaxed/simple;
	bh=+h9vsb2mz2W9SQcAsdUBjtL/0zuLW15frMin9FouJFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBQrxFbDf/AGG82JwkCI6RpvgLUikkewcQO7VZy77mBpLgcr3jjKnQGh4VNTfnwxJtxRU9PU1HCRATZJ+ffX58smxGKinEUOP0MD1GODyvZceaR2Y73uHsjcvShFjfFr/dTOX6h3DCem26JO/NLIjOXd/crBX1rvZg4wLa8ahw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcqGheh4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcqGheh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719663; x=1765255663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+h9vsb2mz2W9SQcAsdUBjtL/0zuLW15frMin9FouJFk=;
  b=EcqGheh4Km1KlBsw16tnuvTr5EG0FZPeJqtDNDdX4qLOyTHO1v+oyf/i
   Y7EWAyFFUcyvcHU5kRAftnlLOagFZoNkO8ndGN90NnYJwyMB5kF9kHhab
   v8cTUwbvLBMQCCHI0G8shxkAWNMY5SL9PYII/nhnmvvRjG4x0/8m7VOao
   KOrsZJr3ycOueX2MkxMwyyU5CABikD6Mn269pOMwSJT+5n1eWi9Fg2lXf
   f4AYZjLlLFK6vyNKhpTsWSBwpLEpoF8sZS/U04KdIRkOkJuRZXS8hTzaT
   PV5qWX3QbSaBSfS16mK3iLbCEjl/8MTzhBToRgyAldtBLTpgoUuYlUDLU
   g==;
X-CSE-ConnectionGUID: CqEmYWaDRmajL9TfE0ObXQ==
X-CSE-MsgGUID: +EmK9GKNRtmqVBkYpIgr6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060158"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:41 -0800
X-CSE-ConnectionGUID: pDxa78xST4SUuN4Q4Ka2Fw==
X-CSE-MsgGUID: d8DmFsYPSsycCzbDzEA9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012429"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgH-0003vA-0A;
	Mon, 09 Dec 2024 04:47:37 +0000
Date: Mon, 9 Dec 2024 12:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free
 on line 1507
Message-ID: <202412082018.q8Qodcc8-lkp@intel.com>
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
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-r064-20241208 (https://download.01.org/0day-ci/archive/20241208/202412082018.q8Qodcc8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412082018.q8Qodcc8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free on line 1507
   mm/kasan/kasan_test_c.c:788:47-50: ERROR: reference preceded by free on line 787
   mm/kasan/kasan_test_c.c:262:49-52: ERROR: reference preceded by free on line 260
   mm/kasan/kasan_test_c.c:625:49-52: ERROR: reference preceded by free on line 624
   mm/kasan/kasan_test_c.c:672:49-53: ERROR: reference preceded by free on line 658
   mm/kasan/kasan_test_c.c:698:49-53: ERROR: reference preceded by free on line 692
   mm/kasan/kasan_test_c.c:472:40-44: ERROR: reference preceded by free on line 470
   mm/kasan/kasan_test_c.c:645:38-41: ERROR: reference preceded by free on line 644
   mm/kasan/kasan_test_c.c:427:47-51: ERROR: reference preceded by free on line 425
   mm/kasan/kasan_test_c.c:832:20-23: ERROR: reference preceded by free on line 830
   mm/kasan/kasan_test_c.c:857:36-38: ERROR: reference preceded by free on line 856
--
>> mm/kasan/kasan_test_c.c:1835:11-12: WARNING kmalloc is used to allocate this memory at line 1809

vim +1515 mm/kasan/kasan_test_c.c

0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1492  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1493  static void kasan_strings(struct kunit *test)
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1494  {
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1495  	char *ptr;
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1496  	size_t size = 24;
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1497  
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24  1498  	/*
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24  1499  	 * str* functions are not instrumented with CONFIG_AMD_MEM_ENCRYPT.
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24  1500  	 * See https://bugzilla.kernel.org/show_bug.cgi?id=206337 for details.
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24  1501  	 */
da17e377723f50c lib/test_kasan.c Andrey Konovalov 2021-02-24  1502  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_AMD_MEM_ENCRYPT);
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1503  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1504  	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1505  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1506  
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26 @1507  	kfree(ptr);
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1508  
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1509  	/*
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1510  	 * Try to cause only 1 invalid access (less spam in dmesg).
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1511  	 * For that we need ptr to point to zeroed byte.
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1512  	 * Skip metadata that could be stored in freed object so ptr
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1513  	 * will likely point to zeroed byte.
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1514  	 */
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26 @1515  	ptr += 16;
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1516  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strchr(ptr, '1'));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1517  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1518  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strrchr(ptr, '1'));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1519  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1520  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strcmp(ptr, "2"));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1521  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1522  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strncmp(ptr, "2", 1));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1523  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1524  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strlen(ptr));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1525  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1526  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strnlen(ptr, 1));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1527  }
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1528  

:::::: The code at line 1515 was first introduced by commit
:::::: 0c96350a2d2f64fe777b444c995f6bb633c5d069 lib/test_kasan.c: add tests for several string/memory API functions

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
