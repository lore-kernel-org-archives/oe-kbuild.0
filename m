Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AF2E8E14
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757754436; cv=none; b=Pzhl6yC2mcOAT3sQCiYmMgoVd2y698+403uDEVfmzZLcjaJrTt8MPq0MMhjKUtwWMcfiVWaQWImx7OkkH/BYdXH3jmJj+02wQPzcQL/Abtu/GOjSa7b7u24TkAQ2bMGgqNPntk8OuIXptst7p0Ihk21EL5f7Zs2wheFCr86UBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757754436; c=relaxed/simple;
	bh=E0DT6I9F1JvJF23spfhyGELmhWqNWRAHbAXB0DfWwYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o2SA/LZm6X2B0BmdoBbfCH015K5orjoOGXNUtxEDhmW3tF6TNXtIZ7daJku7gyeSyzg+ToK1EGmb4isKiXaXflr832zX6o/SFA9yFKMlQlOyautMeoOY0bgGg1t5ZgIEq2fWEiFEcz1/mFoy+B1owaJfpsgRYRFn5zhMlg0e/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vzk+8BPd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vzk+8BPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757754434; x=1789290434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0DT6I9F1JvJF23spfhyGELmhWqNWRAHbAXB0DfWwYU=;
  b=Vzk+8BPdZUng+OhUOx2erGlo5zXbNdpqxLsccfLUIUfkkgHTJwTUFWYf
   UWVeMT7Yur7eic8J0tr2CJ5jvUH/UbZRGD6kkFjPEijVQdC+LljW94QBt
   LlOjGzXBwXDPDLMyvtA08OTDnaggQnL6RP264E2dqje+7KnJfBKkrIwYE
   VZqq3AJY4PB7M7/KDE3QgUDOCM7wRpKZUwKFIobkl9Q5qylXyyEWDOLhR
   D5UUBUgWlENfAIZO22IHCJMhyoAceahs77kBB8y7AAvURdby8HuUyMJNJ
   MdRBbYFJKxq4Qh4dXNucPG8tnwZlw4hsRudJGs0EjdgaVTcSz6UKv3L3L
   g==;
X-CSE-ConnectionGUID: /2GYlql9R9+QHk8kIwIDTg==
X-CSE-MsgGUID: XSsJcxxoRey5bpX5OL/O5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82676380"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82676380"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 02:07:14 -0700
X-CSE-ConnectionGUID: bz1oT9lATl2FO5hU0lO5aA==
X-CSE-MsgGUID: ApAGHeVpRwyqsg48/pW1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173477063"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 02:07:13 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxMDu-0001Qq-1c;
	Sat, 13 Sep 2025 09:07:10 +0000
Date: Sat, 13 Sep 2025 17:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kfence/kfence_test.c:397 test_use_after_free_read_nofault() warn:
 passing freed memory 'addr' (line 395)
Message-ID: <202509131634.QXd7BtIK-lkp@intel.com>
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
TO: Nirjhar Roy <nirjhar@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   22f20375f5b71f30c0d6896583b93b6e4bba7279
commit: 811808d365398680b628d2b88aafeba77c88691a mm/kfence: add a new kunit test test_use_after_free_read_nofault()
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r071-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131634.QXd7BtIK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509131634.QXd7BtIK-lkp@intel.com/

smatch warnings:
mm/kfence/kfence_test.c:397 test_use_after_free_read_nofault() warn: passing freed memory 'addr' (line 395)

vim +/addr +397 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver 2021-02-25  385  
811808d3653986 Nirjhar Roy 2024-10-18  386  static void test_use_after_free_read_nofault(struct kunit *test)
811808d3653986 Nirjhar Roy 2024-10-18  387  {
811808d3653986 Nirjhar Roy 2024-10-18  388  	const size_t size = 32;
811808d3653986 Nirjhar Roy 2024-10-18  389  	char *addr;
811808d3653986 Nirjhar Roy 2024-10-18  390  	char dst;
811808d3653986 Nirjhar Roy 2024-10-18  391  	int ret;
811808d3653986 Nirjhar Roy 2024-10-18  392  
811808d3653986 Nirjhar Roy 2024-10-18  393  	setup_test_cache(test, size, 0, NULL);
811808d3653986 Nirjhar Roy 2024-10-18  394  	addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
811808d3653986 Nirjhar Roy 2024-10-18 @395  	test_free(addr);
811808d3653986 Nirjhar Roy 2024-10-18  396  	/* Use after free with *_nofault() */
811808d3653986 Nirjhar Roy 2024-10-18 @397  	ret = copy_from_kernel_nofault(&dst, addr, 1);
811808d3653986 Nirjhar Roy 2024-10-18  398  	KUNIT_EXPECT_EQ(test, ret, -EFAULT);
811808d3653986 Nirjhar Roy 2024-10-18  399  	KUNIT_EXPECT_FALSE(test, report_available());
811808d3653986 Nirjhar Roy 2024-10-18  400  }
811808d3653986 Nirjhar Roy 2024-10-18  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
