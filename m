Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283C616FF45
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650257; cv=none; b=FetdN6hZj4/+FvR/AYOoXJCd/njYbPnN0xhxm/wEKcMJdnXAZnIkTrL2kCf77FrnsHi6F5yTsLKcDPD6rUP9yZ+4UfcjFkbo+xlRZ8wezaBRZBc+gNxNiIQKwNgm1Ikl50o4huZ8On4ux+H1BuMe4TChi7bx49KCYTIp3w5kuvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650257; c=relaxed/simple;
	bh=DTabth48rVSA6TrBBilQZn1jlwQ9VE++250BHNnnukk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvpavLdCoBkS4Y3n3iDYlLiC8VciNNDMKKHlTO4h8qHyNj/Y4+blVj/8gWd15V/8DQZmD7Trc7qPcighMIiyANcrYnhHoCkHV3erER83oREZfbMB6brGt/5CKPLE4Ov6FctuqAae7MfNJ8Ya5L4wpprKhb6YJlvOFGmruF5hxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyIOiKcE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyIOiKcE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726650253; x=1758186253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DTabth48rVSA6TrBBilQZn1jlwQ9VE++250BHNnnukk=;
  b=lyIOiKcEMC0IYRmkLnIX10IuRdCXnyLfxtz1imMYXtofM6NXDTFpyQof
   iNRxBPY/HjOnGaUTAQeplW8keSGo7gZOK0LPHSOa6FIdNZouqfNhTmWBs
   x8fxV+XTZX2DwP7O0p6oqL5bjfBH3Qn5SboXDSlfLbkrtEFU6IVBxRpus
   ODsiaaXhdLPwUUlDe2aixD4GCuaQhc+6AfL0UN998LsRrB+Pgw8cv9/No
   IMwCzZCn2FK0tg1U0BqVpIV2MKH8QBvHeJ79/GXUZmoCqNUUuYASQ2nQh
   QLjF715FpRpHJXeb6dd74dW5ZZUWW7djZ626c5rDjrEfBIxCYxVeYTnOA
   g==;
X-CSE-ConnectionGUID: 3CH9Mo5DRZmPIbGjsqTr7g==
X-CSE-MsgGUID: qW3xNjs+Sp6cuKTSlZ4d2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36927360"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36927360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 02:04:12 -0700
X-CSE-ConnectionGUID: PweJze8qTEqyN3jYduJWkQ==
X-CSE-MsgGUID: EP87wb3NTSCZprSPbWZQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="100162492"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Sep 2024 02:04:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqqbY-000C6c-2A;
	Wed, 18 Sep 2024 09:04:08 +0000
Date: Wed, 18 Sep 2024 17:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 11960/12393] mm/kasan/kasan_test_c.c:1515:1-4:
 ERROR: reference preceded by free on line 1507
Message-ID: <202409181650.3fVsPaFj-lkp@intel.com>
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

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
commit: a2f11547052001bd448ccec81dd1e68409078fbb [11960/12393] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r064-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181650.3fVsPaFj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409181650.3fVsPaFj-lkp@intel.com/

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
