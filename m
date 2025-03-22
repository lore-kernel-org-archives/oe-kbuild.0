Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DF4C6C
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742665701; cv=none; b=ft6gn4caGyKKRNcLq1vNcrYtL7RiWOugLMnpfxHd7qs8JAZxgcFqb0ShVQrrz3ds2OqIga0mL2u4qe5S/+frxtnnlxItChoDFtqaAlVbfyERQGnoRtudoQ6HEDzBXPI+tvq8YJU4X9XkcA+o2rrznwEtNCmesEXkFEONA/h11zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742665701; c=relaxed/simple;
	bh=VpDGkBPD44zHMjcgcC+oQ3jwp/EKobMHKYuDi+xUzM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZ/T6AoKfAjvGUFbqshhCrPH0coZqrXciUHVpHgD8vA7AxhVtRv0sL0oKaXPOntKmojJ7LBchpjsHhJU+qjwh43doKhA7P0M7gVvSOVqiJbptkc7SoEuWbm+ai5JWWaDPWGxVKpQpxsTui/cX3ejeasWNCajWtKBM70l5OEvivI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fN3OhE+V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fN3OhE+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742665699; x=1774201699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpDGkBPD44zHMjcgcC+oQ3jwp/EKobMHKYuDi+xUzM4=;
  b=fN3OhE+V0vhAV954cIuTwANeik60QjduLGtTm80gXZ4+CwkK/YBNCoAr
   FfySAVsVh1uavr7iD6dMZr4UpddSMvv2hbLnzHhRtgcvGGZQgfmCO7pb0
   J0eSdlVI6ePrXo1I4mHL3q5nX9s4BDR57p0MSmYeuYFEZMvjIa69reP5U
   gHqNActprp8OXfzb/RxlgD2HYfCNNjr+QknRNUyzWtCmJ9zHOkSV6dF2e
   78T/ujx1KhVY5zMmpIObCmDCvpR+hTu3qRJFGzqckHpDf5riuaGURiKr6
   pyrFPE51i4GSTO6AhO1egIWUPVccP11SmpWV6KjsXYO1VaGM1266BRL0i
   Q==;
X-CSE-ConnectionGUID: q5UKQgA5QwubwdDe3loOnw==
X-CSE-MsgGUID: N/0LqVBxTbiZGPaHHIf3Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="46657148"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="46657148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 10:48:17 -0700
X-CSE-ConnectionGUID: fhqOkbZCRZC3dI5+mIyKHg==
X-CSE-MsgGUID: 4gTt8yr7QQiQuzXMKcLdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="128782107"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Mar 2025 10:48:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw2xB-0002J5-1h;
	Sat, 22 Mar 2025 17:48:13 +0000
Date: Sun, 23 Mar 2025 01:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-rust 2/2]
 mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free on line
 1507
Message-ID: <202503230138.jMbN15E3-lkp@intel.com>
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

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: a2f11547052001bd448ccec81dd1e68409078fbb [2/2] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-103-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230138.jMbN15E3-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230138.jMbN15E3-lkp@intel.com/

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
