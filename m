Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0916A20D4E2
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904318; cv=none; b=Ocut2ezxWXJYE6asMRY3NEgD/9xy9myVx85nEj958GdJyAUAcMqSmx8akEJqTQoq6NJjZwT40G/EeGStYnxxpukpi+y1pUbjl4Ap8Lv6JCaaYYBp2WP/WC/Vh5rMBmurtiFHJlH17dF7eqWURhkkr4riY0lQkluFxghQDdp9N1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904318; c=relaxed/simple;
	bh=7QmsYK+6Dqf0vuzqCqk2oxrkkdeMvtOeTY6ncV1goWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EuhfdVuLCYdUcd+JSeyW9pAnwzVHKwN8SB3kVSukFO/FPrx/6i195yoloiK7BaacYXAhlq2iASDTzyFhj9xfthTrFc6Zry6SNpgicRgy3uy7M4ZOX+x9reHpJMoJjhWqahQkjJm0pYQMSjgbFI+6wMpT7dT8N3Bhl0Pp0E77a80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3EzpE2E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3EzpE2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745904316; x=1777440316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QmsYK+6Dqf0vuzqCqk2oxrkkdeMvtOeTY6ncV1goWA=;
  b=N3EzpE2EsQT4KKsr5dIrFqo+aiAWgi4/aGInLhFMO7m+E8HuUOJctr5u
   AY0UXxHJOidKH50qur8OYecQgX2KdqYm4zW8QP8nFS4ormwF5eTKw0OQG
   atZT/v2f+caJq7fgovXJ4azt0STPNUGKxZvSe5XHg6aVv13JIzjHATefo
   gakmR6o6LXvLa7dV+4V5+dDxQi2bC0izB3t8Y4frGEbsOS32FZdzH8yCH
   1WZaebkRg3j0Ltg/YCaDMa/z0N9VGZXqYqgwLXXrek0ix8HBZCDHWAF4H
   +pN3DbRVCfkp2LShSAt1T8xS4IEu4IOoIBk1xKWIiq+73dHIug0dUzXrQ
   g==;
X-CSE-ConnectionGUID: sN9TaBbCSHeo9y2PlrvfRw==
X-CSE-MsgGUID: wsSJYj+xRFCC+bCdop1a9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="65047596"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="65047596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 22:25:15 -0700
X-CSE-ConnectionGUID: r2owAtmpR2KJpbMhlUWDHw==
X-CSE-MsgGUID: Kyn2g8+pSfqluROfF7whPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138519727"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 22:25:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9dSx-0000U3-0M;
	Tue, 29 Apr 2025 05:25:11 +0000
Date: Tue, 29 Apr 2025 13:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15 1/1] mm/kasan/kasan_test.c:214
 kmalloc_pagealloc_uaf() error: dereferencing freed memory 'ptr' (line 212)
Message-ID: <202504291335.KC1qwSMz-lkp@intel.com>
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
head:   72c5444cd5a90b322c55d9df9b536afa21a76a78
commit: 58398549294199f2629f73cb73165e86f082701e [1/1] UPSTREAM: kasan: move tests to mm/kasan/
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 4 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291335.KC1qwSMz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504291335.KC1qwSMz-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test.c:214 kmalloc_pagealloc_uaf() error: dereferencing freed memory 'ptr' (line 212)
mm/kasan/kasan_test.c:564 kmalloc_uaf() error: dereferencing freed memory 'ptr' (line 563)
mm/kasan/kasan_test.c:609 kmalloc_uaf2() error: dereferencing freed memory 'ptr1' (line 595)

vim +/ptr +214 mm/kasan/kasan_test.c

47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  202  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  203  static void kmalloc_pagealloc_uaf(struct kunit *test)
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  204  {
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  205  	char *ptr;
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  206  	size_t size = KMALLOC_MAX_CACHE_SIZE + 10;
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  207  
da17e377723f50 lib/test_kasan.c Andrey Konovalov 2021-02-24  208  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_SLUB);
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  209  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  210  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso 2020-10-13  211  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06 @212  	kfree(ptr);
858bdeb046f6dc lib/test_kasan.c Andrey Konovalov 2021-02-24  213  
8fbad19bdcb4b9 lib/test_kasan.c Andrey Konovalov 2021-09-02 @214  	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  215  }
47adccce3e8a31 lib/test_kasan.c Dmitry Vyukov    2018-02-06  216  

:::::: The code at line 214 was first introduced by commit
:::::: 8fbad19bdcb4b9be8131536e5bb9616ab2e4eeb3 kasan: test: avoid writing invalid memory

:::::: TO: Andrey Konovalov <andreyknvl@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
