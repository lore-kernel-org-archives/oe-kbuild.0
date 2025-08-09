Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64D238C3F
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 00:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699877; cv=none; b=TO+q14mhDTadW5TD/ozg8vrOGTX88Q/DTydK3JRwvJbGEEaeixgxsEr5JP3nkQzhTJpCKb2ZRWTQ7r/qFOXT7PtE5gilojwwLrBQ6k8hq5U9pGCUjahsLdsFo5Yb5900qCJnC2HXDWEv8DypFY69TAJqaqC7gGcCoBf11a/Q/UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699877; c=relaxed/simple;
	bh=ezYV/u6Qqks3hZxzvn6kxYuC33VSLwlS+z1/cK1EmkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OI1D1urt4PXqL2REBfE7MW+viTK/vN/UvKPxJUYTthb7fj2VnkR/M8FnqxuDNL4/MdIe1ZGCWYyWaMWdxemSBtkPkzPBTj8wkozyZmNfuiK1Y9n6mWviHdAxoeQi+oAemZw6m6DSD6tUDw16lK1F5vO2w0wcYT9UKwAnE6tCV+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SO9dVwiX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SO9dVwiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754699875; x=1786235875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezYV/u6Qqks3hZxzvn6kxYuC33VSLwlS+z1/cK1EmkU=;
  b=SO9dVwiXBZAs80s8HAfduvIm9X0xeQ05mru+OxI0yN+/yvNbhQk3WdTc
   XfA2+z/b7amAQRXZpJxAbg6ZvvhADKJ4qzB6+vLy3Sz/7NbAP7ZFIXi6Z
   Re+pQ3pOFjAw6IKObf+JM2N5uN4y+dSMkOpQaSroILzZV3JrLCygiOSTE
   oTPHmCOu1twPn5/9A+0FqE6pjXMbur4R4+efSkpsfYJ8tvBoY4hf3WNQQ
   S5E2aGjr0YxXvIHCLFBnxyIC6q8RjesS+tJveDbq5Wd66hTMnrTMCa4x9
   QhmsZI+2cR5N+Pczb17YzP51EcSDg1KHCOTaCtiSSFEHFqZPof2evndkP
   g==;
X-CSE-ConnectionGUID: PM9NOUndQJuUzyiO0uz8eA==
X-CSE-MsgGUID: lkc1JFP8RhuB9KgNKsXj0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56950558"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56950558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 17:37:55 -0700
X-CSE-ConnectionGUID: iGkYYOz1SEGfnrCLq99jUw==
X-CSE-MsgGUID: tbKkyMbbThGWH0lfY4+Vuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196427495"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Aug 2025 17:37:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukXag-0004QW-2C;
	Sat, 09 Aug 2025 00:37:46 +0000
Date: Sat, 9 Aug 2025 08:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:262 kmalloc_large_uaf() error: dereferencing
 freed memory 'ptr' (line 260)
Message-ID: <202508090848.N5tsZIb2-lkp@intel.com>
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
head:   37816488247ddddbc3de113c78c83572274b1e2e
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090848.N5tsZIb2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508090848.N5tsZIb2-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:262 kmalloc_large_uaf() error: dereferencing freed memory 'ptr' (line 260)
mm/kasan/kasan_test_c.c:625 kmalloc_uaf() error: dereferencing freed memory 'ptr' (line 624)
mm/kasan/kasan_test_c.c:672 kmalloc_uaf2() error: dereferencing freed memory 'ptr1' (line 658)
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() warn: statement has no effect 'fp->i'
mm/kasan/kasan_test_c.c:895 workqueue_uaf() warn: statement has no effect 'work->data'

vim +/ptr +262 mm/kasan/kasan_test_c.c

47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  252  
0f18ea6ea44cde mm/kasan/kasan_test.c Andrey Konovalov 2023-12-19  253  static void kmalloc_large_uaf(struct kunit *test)
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  254  {
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  255  	char *ptr;
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  256  	size_t size = KMALLOC_MAX_CACHE_SIZE + 10;
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  257  
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  258  	ptr = kmalloc(size, GFP_KERNEL);
73228c7ecc5e40 lib/test_kasan.c      Patricia Alfonso 2020-10-13  259  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06 @260  	kfree(ptr);
858bdeb046f6dc lib/test_kasan.c      Andrey Konovalov 2021-02-24  261  
8fbad19bdcb4b9 lib/test_kasan.c      Andrey Konovalov 2021-09-02 @262  	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  263  }
47adccce3e8a31 lib/test_kasan.c      Dmitry Vyukov    2018-02-06  264  

:::::: The code at line 262 was first introduced by commit
:::::: 8fbad19bdcb4b9be8131536e5bb9616ab2e4eeb3 kasan: test: avoid writing invalid memory

:::::: TO: Andrey Konovalov <andreyknvl@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
