Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BD366553
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825894; cv=none; b=jThNUAwyKJTk0nMDS43j409WJwJfw1iQNkJYnG2LpSMDYXb1pSco1Rrcix2eom6VGzRKPFXkZQpDlFG7fdhpE6iy1whsnq34X+Kggrb/XvVFYyY04AjGyRfQC5hVNUC0eru2k8kNITznIrPwuuyLPgtCXq1OKTnTVCRA+IJfGB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825894; c=relaxed/simple;
	bh=BUCBaOWKweNZjW0SBuzujN4gMcL/INfEOQglo6HFzZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sieFrTECi86cOBt88aKNr6D2Mb+MyIz8YIdakLaM6TnSl5VgiSnsRRyw6VQOI+JxPPp1NTI8x8Ta8xDSS6lCDJLiuoiwYb2/JIgr9P+ZT8CxqnV2yYdQdxXIOUxKsXd8n82IuCUU7x0rxpKsFTfrSGgPFKBgtITaQrMUL2fyOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zda8jsKf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zda8jsKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777825893; x=1809361893;
  h=date:from:to:cc:subject:message-id;
  bh=BUCBaOWKweNZjW0SBuzujN4gMcL/INfEOQglo6HFzZE=;
  b=Zda8jsKfF9A1wz4HuteCb987tGTFyowztZJBpOv/QUARzuKsckKttXMO
   x1pEGXYI5cxZtbgmWwFbUpQhXXFQvCB2ZAxNzKCxh+sKUNLuWTnbum468
   h5kTBmUK++O/A7SYR6NAinFhhEotR1oOelxPFjsN1VhJK2APm6LJ1spsd
   TrQWvNtO7FmkT/JGiTNj76dKiVHkrT0xfo0ILv9B78bST3b3n85q2m5Ac
   oCFecNXLg9F8PwiAo4b/cMSlhXTffV9KXxsoZU9DS5GPTS9UjCJD88e3F
   yiCuqIAp/YHNtOMFbDa9AuVFdoh7k1nFFF7YJbWFIXFdj0XGvYbdchK+w
   Q==;
X-CSE-ConnectionGUID: EkcZrRfcRJGXcrTezKy1Sg==
X-CSE-MsgGUID: 4ru3BiyzRqi2Aeck12DdiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77866450"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="77866450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 09:31:32 -0700
X-CSE-ConnectionGUID: X55NIg9aRxe4Myytgb0GAA==
X-CSE-MsgGUID: MM/PY2tyTgCzSMUDgnXgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="237093807"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 09:31:31 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZiz-000000002lH-3zRC;
	Sun, 03 May 2026 16:31:24 +0000
Date: Mon, 04 May 2026 00:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable
 length array is used.
Message-ID: <202605040042.HK5QMUyE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length array is used."
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 5e88c48cb4bcbd0ea683373a106268933bb4edd2 kbuild: Switch from -Wvla to -Wvla-larger-than=1
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-122-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040042.HK5QMUyE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040042.HK5QMUyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5e88c48cb4bc ("kbuild: Switch from -Wvla to -Wvla-larger-than=1")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040042.HK5QMUyE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length array is used.
   mm/kasan/kasan_test_c.c:1504:27: sparse: sparse: Variable length array is used.

vim +1489 mm/kasan/kasan_test_c.c

eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1485  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1486  static void kasan_alloca_oob_left(struct kunit *test)
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1487  {
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1488  	volatile int i = 10;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06 @1489  	char alloca_array[i];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1490  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1491  	char *volatile array = alloca_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1492  	char *p = array - 1;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1493  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov    2020-11-01  1494  	/* Only generic mode instruments dynamic allocas. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1495  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1496  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1497  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1498  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1499  }
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1500  

:::::: The code at line 1489 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
