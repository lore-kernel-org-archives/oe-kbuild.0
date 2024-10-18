Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F6510E4
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262867; cv=none; b=izubjw2oVGM9GfA6h5PwGEIZzHx69SiOdXslW366cnG1UN8/6nAQArC5fxyiYD9hsMrIbo5G8S/hbPS012fXlxZSq+ji3aB5GiZBY+ii7sGQkLhfh8zPKmAJaO14EA/SvMDLfdLD5Vwap/AcKFg1okoPuWgF1Gw4jSFu87Fw/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262867; c=relaxed/simple;
	bh=LYAwCxhFKNg/mQRUxxkDLSIivbmfjHpoD6AQK9kBlPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYW3kyx+J8c1FUi0SOrBiT9+QHk9cPXHNLQkiOpW1vElFEtwKD3Pe/m/RNqgml8C1hxyEqL7Fa51HADRchG+iQmD6iKRFjXRX97hXfduTH+SFcG49BTvvoS+3bCQZf+DZU2TuhNSq5KKK5ddBSPT/FF7JmkLtGJHeeN959kIB2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvlFMDOt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvlFMDOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729262866; x=1760798866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LYAwCxhFKNg/mQRUxxkDLSIivbmfjHpoD6AQK9kBlPM=;
  b=HvlFMDOtb3dXcEVqO0Uu+Yw9B4f8Hw97XoqAHIwD7cuUBu3l/EYXMcmg
   E4kjo5HmigcOm0iTp8xsVfp1pg6tbB631cH5a53kLyBHF7ipYRMvGG0xu
   r2hbTUyfOy+AeN5vc8adHTGta1oBZmT7qnRw1uK1Han0A6H1hFdwYYFIo
   V5xacW1OAJlqbQ+uQix3wBu0bi3gYzZS+/8ZZ7c1gCYtVhX5bsxiviKp+
   +aev+AE49cBMvtMokt/+j2RWZdVl8aOM4fTE7IowCYXZbZ0Lj/GsflD1Y
   QdVMy0J2tNLy5LBwA5z1mCtEVEl3/foenhtAFxmyXIyVQDTRtZfj9Eamj
   w==;
X-CSE-ConnectionGUID: Y2eA5MsIRL6d0+mTVeCwqw==
X-CSE-MsgGUID: yxicPsmwR8mXDaLpnGEiww==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39384756"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="39384756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 07:47:45 -0700
X-CSE-ConnectionGUID: yHhIHsrPSEGbi+taI8/Tiw==
X-CSE-MsgGUID: bGEPgt+VQ7i7KJOskMemNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83953529"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Oct 2024 07:47:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1oGT-000NwF-18;
	Fri, 18 Oct 2024 14:47:41 +0000
Date: Fri, 18 Oct 2024 22:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/kasan/kasan_test_c.c:1515:1-4: ERROR: reference preceded by free
 on line 1507
Message-ID: <202410182221.b8Qzg5yz-lkp@intel.com>
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
head:   4d939780b70592e0f4bc6c397e52e518f8fb7916
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-101-20241018 (https://download.01.org/0day-ci/archive/20241018/202410182221.b8Qzg5yz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410182221.b8Qzg5yz-lkp@intel.com/

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
