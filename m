Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1053AA
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680462975; x=1711998975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SR4JpYvYtQBkUE3hbhEEgQ2I/YsDXX61h4sAisaBzw=;
  b=F0rOFgsAZrH7sreuNpcE4oMl4eWxSpKOiBgzwUmw/4QQrOl2hz1KIan5
   ngg1DJoQHR6tckX3uoN1KW35mZmqEkoP4mGoEO8rlfMa44rwikly/rwxn
   xo7Q+ba3G5j2sJZWvKSaYsarEUy6iiLVPBT6UXvMUqOfTpfsWb35yRrep
   wU5iISzrH7wQCsawHc8jgnaLnqa2VSD0kiOF+gXoAKVeHOLtTrVi7s/TM
   Cdw5anMpM1cWXKbNdZuTIrxKVBBOSlwrvgjdPB2lcauNvYrbZaRVgfFsi
   t6oW6s0wtT+P9tX10uKlo266E0pXJzQAyTruAW3h0Na3cHu3jcS9abiMR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330328991"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="330328991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 12:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635873525"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="635873525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 12:16:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj3BV-000Nby-1O;
	Sun, 02 Apr 2023 19:16:13 +0000
Date: Mon, 3 Apr 2023 03:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test.c:824 kasan_stack_oob() error: buffer overflow
 'array' 10 <= 26
Message-ID: <202304030337.3zoDtiMN-lkp@intel.com>
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
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf kasan: move tests to mm/kasan/
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230403/202304030337.3zoDtiMN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304030337.3zoDtiMN-lkp@intel.com/

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
