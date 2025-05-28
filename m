Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640D286411
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435888; cv=none; b=l5kIzTGzVHaDM+ZDQuqK6inEN67kJWJDdOVwo2/kLKWgg6hwqzl2/aLRmGLwCH1tJKH2GB0Y4TnOkNNs4i8zn3HocBitC6Lzi4yesv2d+ZhBHc1KO/gWI4W/Q7jgctWgQsT2VTV0yPAu+F0zaCvCuhB/6AX4MyKbc3PYFhLkTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435888; c=relaxed/simple;
	bh=X7OrsOGX1eyuhJQgyIdcBJGVjuV/DgCvB6+Py3Fd2dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABg6wDL0lq2g9fI43sZTZZc+v7i4MS9m/uH4OvcQiyUQoUhMFQXW9a0Ol5Snoqc3mlXp2Oq9D2K5uarMbZrCKn0IPJHlAufruElGFR1H5jYAJmbnAiSqMKnQZc0bIfQjUoWlNCnD+wa8RRCaOk5ZnvXrI2iWbtcd4PlE6hQ0T+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azaOj3yD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azaOj3yD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748435887; x=1779971887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7OrsOGX1eyuhJQgyIdcBJGVjuV/DgCvB6+Py3Fd2dY=;
  b=azaOj3yDbjyC9qv2Vp8kSriGitFasr79ZgW6LLRC1hkzC7cRF8PqtoXT
   ye6txcNMMa6mZ+e0XyL9C+svnUUeHBc2m4IDQbBaRnbYi0XVWO/0JfDgn
   LzJ59vgn7VIbZwWqqwDU6J/n221/B/eZrPkjj6Pdxvg3VgU1wSDV8H7ge
   C8SJ0kxSSblfBKl5HudsiZvds8/7bbDB9TfoalffLqirtJ4YVWDJXMfj1
   RXSlBRN08NJrMnm1XDJ5xqqZxiNtGc4AfFYx4KyI8zuRU+z7i4UMWol5y
   WeS2vMbYyzVTHLseaCnm9uCaxp9wAKusPXtOdC+M6gnxMpdqXe4hanJn7
   g==;
X-CSE-ConnectionGUID: XjaTG4qzQI6z++m4TH/V+A==
X-CSE-MsgGUID: Wgc8PzgkTNqN5WZjgvZz2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50613542"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50613542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 05:38:07 -0700
X-CSE-ConnectionGUID: p2oFk5o5Rmi/g+ItTt6yYQ==
X-CSE-MsgGUID: Q968p2JGTFeiN/FU4AjQcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143215745"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2025 05:38:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKG2i-000Veo-2h;
	Wed, 28 May 2025 12:38:00 +0000
Date: Wed, 28 May 2025 20:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8204/13758] mm/kasan/kasan_test_c.c:1489:27:
 sparse: sparse: Variable length array is used.
Message-ID: <202505282048.O3Y6hbXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   64d12554715ce825d553caea123b7cb89e56237a
commit: 5e88c48cb4bcbd0ea683373a106268933bb4edd2 [8204/13758] kbuild: Switch from -Wvla to -Wvla-larger-than=1
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-121-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282048.O3Y6hbXc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282048.O3Y6hbXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505282048.O3Y6hbXc-lkp@intel.com/

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
