Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABA246BB6
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 23:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756595443; cv=none; b=YPJxRfDjyjKkv+waJ9/an6o+5rIIcO3mD1mStQpnv9c6+yniM4/exMd7S44bVMse+MTlmT53dZvATcqn0hHDv/aO6c91LlLkXnwdVvEy2dzheQ6lY4vvGaZeoYXJT05RWNWrNrXnEWX+ZwYCUyAcQJOO08HMJbHbyPKaEs6BDzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756595443; c=relaxed/simple;
	bh=NLpwSFsa7ITIq6uy8N/J9caUQw+qLUUKf+UrOSAbpgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mF6iJM2sh5sVI6/focU0q2kLQyX/WN71ELulQtuGDXhUuRPPakoy9UoTinbmVBAcDI8dg6soJlG3pa5oCW9uhHVZWF9URNTppg9sZhueVPrF6id7cssY1YWF2fVQMpvaLes3msy3jw03gOrbPxi/VVtdtcXdf4PhHXF3MGspgqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJxZoghI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJxZoghI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756595441; x=1788131441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLpwSFsa7ITIq6uy8N/J9caUQw+qLUUKf+UrOSAbpgs=;
  b=DJxZoghINdvzUgtsQIfeOM3MtwA1aB2NSJQMFwFHPUKCwjt6ukL9rOth
   1N9rrdWutPeQDn/742qAETgIIDE2MJcD0m43j7jylwVYxSZr9F8tJUjx6
   QS7I/v7TkLZSxJJGjoxbLj717/exQkn7lyaTP4oFQkypPWROy846g/cWk
   w2FG4eRhnEruou4FSMAAE+uVcn2g/Thi1Ex+pK+P9e1HCvOQQP94NY8IE
   NB/K00r1BFU4GVt0n92Qz93CI16R6ORVhHdYitoCOdsFCXl9CD3tcqOu5
   7M+gk5dd2h8dhWRIbEmRSMSU1U9Bui4C/z7nckx43bws60daW+t2olCyG
   w==;
X-CSE-ConnectionGUID: 6zaj0TxoRwyGJkIpzoUMGA==
X-CSE-MsgGUID: ofrgpaI1S1Cvgf0qxEPERA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58700613"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58700613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 16:10:40 -0700
X-CSE-ConnectionGUID: rNPeMTztSF2Vi5uYhObVyg==
X-CSE-MsgGUID: zZjl0XPcQfCz7Mb5PGajXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170572325"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Aug 2025 16:10:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usUhx-000Vkj-2e;
	Sat, 30 Aug 2025 23:10:24 +0000
Date: Sun, 31 Aug 2025 07:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free
 on line 1507
Message-ID: <202508310625.NZolKL2c-lkp@intel.com>
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

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8bc81a52d5a2ac2e4b257ae123677cf94112755
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-104-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310625.NZolKL2c-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508310625.NZolKL2c-lkp@intel.com/

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

vim +1515 mm/kasan/kasan_test_c.c

0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1492  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1493  static void kasan_strings(struct kunit *test)
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1494  {
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1495  	char *ptr;
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1496  	size_t size = 24;
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1497  
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  1498  	/*
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  1499  	 * str* functions are not instrumented with CONFIG_AMD_MEM_ENCRYPT.
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  1500  	 * See https://bugzilla.kernel.org/show_bug.cgi?id=206337 for details.
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  1501  	 */
da17e377723f50 lib/test_kasan.c Andrey Konovalov 2021-02-24  1502  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_AMD_MEM_ENCRYPT);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1503  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1504  	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1505  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1506  
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26 @1507  	kfree(ptr);
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1508  
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1509  	/*
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1510  	 * Try to cause only 1 invalid access (less spam in dmesg).
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1511  	 * For that we need ptr to point to zeroed byte.
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1512  	 * Skip metadata that could be stored in freed object so ptr
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1513  	 * will likely point to zeroed byte.
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1514  	 */
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26 @1515  	ptr += 16;
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1516  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strchr(ptr, '1'));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1517  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1518  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_ptr_result = strrchr(ptr, '1'));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1519  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1520  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strcmp(ptr, "2"));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1521  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1522  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strncmp(ptr, "2", 1));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1523  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1524  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strlen(ptr));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1525  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  1526  	KUNIT_EXPECT_KASAN_FAIL(test, kasan_int_result = strnlen(ptr, 1));
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1527  }
0c96350a2d2f64 lib/test_kasan.c Andrey Ryabinin  2018-10-26  1528  

:::::: The code at line 1515 was first introduced by commit
:::::: 0c96350a2d2f64fe777b444c995f6bb633c5d069 lib/test_kasan.c: add tests for several string/memory API functions

:::::: TO: Andrey Ryabinin <aryabinin@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
