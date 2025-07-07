Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64745202965
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Jul 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890964; cv=none; b=SdR+Df+YGmFzi1hXXMtBDyfdYIMoSeRAJLdjqDXA25VR9AAKGY8Zwl0KlKmBRUXVDZ+zYdECC4uwWh86nv+TLdhSxU84MnO4G8pGIeyHJZ6q65pPZdYiBMONQy6IUQDh/IICw/KFRBAP25ddEXRd7i7dByxRqgV5NNDvsIogTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890964; c=relaxed/simple;
	bh=iiivt+5kB1nUsaidww1xUZJ2asouzEqA5HvOALCwLBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJzoD1/aKs1PuGfp1ibgQcmopAbjpl5aUDYqMkAq0gnssCruiw67Y+tSx04C+5AE8u3NcAYpMqtkg1wtrOIv+iN16QNkVUq2x1hYWeYEQJnX8150oyjbUWbjSX4pYNRAvoz4FkpLy9Bm6JRzT1vW9H0GI+VYti0gOhC7KgEXx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PephP9VW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PephP9VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751890963; x=1783426963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiivt+5kB1nUsaidww1xUZJ2asouzEqA5HvOALCwLBc=;
  b=PephP9VWX2IRXXGCcPevXEfs3prtiDhlm/WDTYk57QOknQoFmk4H4t29
   zptg1aOVfEIaLsMMvRRPsDTAG2WGf7hiDsGPDb0rqKXIVym6MOk5K/A0l
   7aaNFCwbuYUR3g79cev7BbbWWQyGJuZ+6Cqfe1Rz4AaEdDcDg2epVhikQ
   5OCTxFan6pjsqW4HLEHvO6IFoJZfPRrfZ2Xrwi2/3+WqHhNUtLY32DzgE
   pbwhHZd4UYxzGrPHuJ9exM52Sgro+nuSqAhizyt6bmpZs2Z3Lx0zxmAdU
   O0FMrhr02+O+0PnJV2S4jCylswFqrZ9NPNiWG4vza8voaa3JCs9FEv4/L
   Q==;
X-CSE-ConnectionGUID: yC03SrieSpiTovR3DkB4TQ==
X-CSE-MsgGUID: DLiwk9xkSuKNDRAd4ehwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53825703"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="53825703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:22:42 -0700
X-CSE-ConnectionGUID: U5SYzeyIS/SzFPvyXUcz5A==
X-CSE-MsgGUID: /lj7o7ZORKOU1a6GahYqrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="178865669"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2025 05:22:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYkrm-0000Ot-1L;
	Mon, 07 Jul 2025 12:22:38 +0000
Date: Mon, 7 Jul 2025 20:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free
 on line 1507
Message-ID: <202507072023.oJvi9bg5-lkp@intel.com>
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
head:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-104-20250707 (https://download.01.org/0day-ci/archive/20250707/202507072023.oJvi9bg5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507072023.oJvi9bg5-lkp@intel.com/

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
