Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A31101
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 01:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680917721; x=1712453721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ft25uZy/yJY4FbB9HNrQidvLcFLukoCCAlr74fdaSfM=;
  b=MTELKVOMgTn/ymzW5E7qF287G4/rYlGOBbZgqPcv3HDhrYTfCf2fAP6W
   bvhLkcT/RhmSGjdR0LhB7VBQyjP+lKXt9kMgCl7Za4kq26XetkuVXyxYD
   7Om8ewlxz9e56QW5RkudfwwoSZeHOMeief3mYGW7cMcUSQLbSItzH9HgV
   fLFQqMlQ5J0RW0+Dcm8U7bVt712bvRuK4LxvNywncyIyxri5othrEE7Ui
   cpTSy4yb9zXFl00r1DJbEAxIX268+O6i8Ea709kKsyYW+C7mHjkoSZnCU
   X/3/aw8+pGFMyZ81vZ8DEw9+DEA3wuIFfYAYVLO4iGM7wIi9y/QzAYV8a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327188013"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="327188013"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 18:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="933761570"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="933761570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2023 18:35:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkxU6-000T8Q-2u;
	Sat, 08 Apr 2023 01:35:18 +0000
Date: Sat, 8 Apr 2023 09:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test.c:824 kasan_stack_oob() error: buffer overflow
 'array' 10 <= 26
Message-ID: <202304080905.ZtYeVEgE-lkp@intel.com>
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
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aa318c48808c0aa73216bd94c54c4553d3663add
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf kasan: move tests to mm/kasan/
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230408/202304080905.ZtYeVEgE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304080905.ZtYeVEgE-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test.c:824 kasan_stack_oob() error: buffer overflow 'array' 10 <= 26

vim +/array +824 mm/kasan/kasan_test.c

611806b4bf8dd9 lib/test_kasan.c Andrey Konovalov    2021-02-24  818  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  819  static void kasan_stack_oob(struct kunit *test)
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  820  {
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  821  	char stack_array[10];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  822  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  823  	char *volatile array = stack_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14 @824  	char *p = &array[ARRAY_SIZE(stack_array) + OOB_TAG_OFF];
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  825  
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  826  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  827  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  828  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  829  }
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  830  

:::::: The code at line 824 was first introduced by commit
:::::: f649dc0e0d7b509c75570ee403723660f5b72ec7 kasan: fix unit tests with CONFIG_UBSAN_LOCAL_BOUNDS enabled

:::::: TO: Peter Collingbourne <pcc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
