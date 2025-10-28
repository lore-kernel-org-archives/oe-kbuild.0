Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07B2346778
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672061; cv=none; b=dnjfoxrW7NZp4kGvWxP/e8+xMteljMafoAxAag1mAynbA01UPY/xhDVeiXMUqkUJPMKMLRErVx0QDT5OEg8FDTXIMi/TJPhV/0J6X0zc1sNiFzxBBC4TUCED6RkZZFPaJQ1WvG2SplWZcFBfjnsEWbZiuFuTofW6SvHCLni+ryU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672061; c=relaxed/simple;
	bh=udmsx3C7Ynp4OEfqlopO2IbXCdZstaUVKWj1NZc+ma4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDx69q1nHmMZVwx6wvHOkasbkUUh7KvaFRHtc/F50n0sBH1O7iPXetJniUwp+9WehfyYQgJXhQ7ep9W/9CyBJwSheOU0ANTrs+E4OGEc+JIqSnYbC9XKXna1X9NwbKvEDfncpJJfsj3PHdFEwDDbVsM4/0q6tz4SN0dS+mURrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NssC1uPu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NssC1uPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761672060; x=1793208060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udmsx3C7Ynp4OEfqlopO2IbXCdZstaUVKWj1NZc+ma4=;
  b=NssC1uPu3hfmHnzN+nbz+895R1cqc55VGOs2RKyHkmJM/BL7XD67wpf2
   rg4q7JUU17qlraPRVIS3l+aNXPvffbrOw4K7M4mjSLO3INnT/l3XwIhuG
   lmvtOupSCj8p+5w0U1qb8iR+3XjLQ+2zbirSC+Gd6JfTYhtL1tHLviiSF
   jAAijOUGYrgdVz1U1Ta8wSnDn8uGydN2m3hSqYtr+c73zs64Rzbr4cs6S
   r4VIx827J2wvzM+9doYqGsropqtQAG/0PyK4CUibpGefAW5WG2/SDZsnA
   0RgP00xUewk6CbZZx6x34tNi/DKr6IQTZnLwPA+AOTdmDscoHS+ORS5Mu
   g==;
X-CSE-ConnectionGUID: iF1G08n5S3umjlKHpmHy6g==
X-CSE-MsgGUID: Hl303KHuTvm95snIWf941w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63667346"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63667346"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:21:00 -0700
X-CSE-ConnectionGUID: r6MYsGRVTiGca1QZKmVyDA==
X-CSE-MsgGUID: Qr5PprvZTl26tLhuNUUhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="222631519"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2025 10:20:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDnN9-000JVv-3C;
	Tue, 28 Oct 2025 17:20:44 +0000
Date: Wed, 29 Oct 2025 01:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-5.15 0/1] mm/kasan/kasan_test.c:997:1-4:
 ERROR: reference preceded by free on line 989
Message-ID: <202510290134.qsQUXcjM-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   08c3bb4d118ad494fb39c98fa897584c4dc00e19
commit: 58398549294199f2629f73cb73165e86f082701e [0/1] UPSTREAM: kasan: move tests to mm/kasan/
:::::: branch date: 17 hours ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-randconfig-104-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290134.qsQUXcjM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510290134.qsQUXcjM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test.c:997:1-4: ERROR: reference preceded by free on line 989
   mm/kasan/kasan_test.c:1096:47-50: ERROR: reference preceded by free on line 1095
   mm/kasan/kasan_test.c:214:49-52: ERROR: reference preceded by free on line 212
   mm/kasan/kasan_test.c:564:49-52: ERROR: reference preceded by free on line 563
   mm/kasan/kasan_test.c:609:49-53: ERROR: reference preceded by free on line 595
   mm/kasan/kasan_test.c:635:49-53: ERROR: reference preceded by free on line 629
   mm/kasan/kasan_test.c:438:40-44: ERROR: reference preceded by free on line 436
   mm/kasan/kasan_test.c:582:38-41: ERROR: reference preceded by free on line 581
   mm/kasan/kasan_test.c:398:47-51: ERROR: reference preceded by free on line 396
   mm/kasan/kasan_test.c:813:20-23: ERROR: reference preceded by free on line 811
--
>> mm/kasan/kasan_test.c:1322:11-12: WARNING kmalloc is used to allocate this memory at line 1296

vim +997 mm/kasan/kasan_test.c

0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   974  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13   975  static void kasan_strings(struct kunit *test)
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   976  {
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   977  	char *ptr;
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   978  	size_t size = 24;
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   979  
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24   980  	/*
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24   981  	 * str* functions are not instrumented with CONFIG_AMD_MEM_ENCRYPT.
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24   982  	 * See https://bugzilla.kernel.org/show_bug.cgi?id=206337 for details.
0fd379253691e7b lib/test_kasan.c Andrey Konovalov 2021-02-24   983  	 */
da17e377723f50c lib/test_kasan.c Andrey Konovalov 2021-02-24   984  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_AMD_MEM_ENCRYPT);
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13   985  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13   986  	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13   987  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   988  
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  @989  	kfree(ptr);
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   990  
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   991  	/*
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   992  	 * Try to cause only 1 invalid access (less spam in dmesg).
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   993  	 * For that we need ptr to point to zeroed byte.
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   994  	 * Skip metadata that could be stored in freed object so ptr
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   995  	 * will likely point to zeroed byte.
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   996  	 */
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  @997  	ptr += 16;
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13   998  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strchr(ptr, '1'));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26   999  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1000  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strrchr(ptr, '1'));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1001  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1002  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strcmp(ptr, "2"));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1003  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1004  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strncmp(ptr, "2", 1));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1005  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1006  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strlen(ptr));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1007  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso 2020-10-13  1008  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strnlen(ptr, 1));
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1009  }
0c96350a2d2f64f lib/test_kasan.c Andrey Ryabinin  2018-10-26  1010  

:::::: The code at line 997 was first introduced by commit
:::::: 0c96350a2d2f64fe777b444c995f6bb633c5d069 lib/test_kasan.c: add tests for several string/memory API functions

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
