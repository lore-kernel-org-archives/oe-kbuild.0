Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A691EB39
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749691017; cv=none; b=iTXoO9GGboovFa4AY7ea1DAkbeMT9f4ncM1gc8zZb3cnzYFQi/5UEv4y59PZMNdELBB0NMkM307Y+l82GZ+atK6gEdQAuw33PXolUIhvCZBZxZIwBUmjHwLbF0zvWjblJoLuxpw9v0qvuRKHj1qA2c9hN7S2B9JT1cpY72GDZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749691017; c=relaxed/simple;
	bh=B3yMbyxHt7kTXuNkKXp8L+ow4q0gXmUX3b855pwJznk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0Vowu1er6Qtualnf9xghoFtFdQzSAPNt2Vw4q2PGjWn7SaNscjoJ2ojAfFUpFvA7LB1ULhJE8cyUlUdqRFkmEtPKAkThiOR4rREbI422DokusW99fPCTxze9rTzn5AoXPgHxI6hRqjB5neVFDs/T2NIz7IxT2Vkw+7vp8C3fwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF+bikT8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF+bikT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749691015; x=1781227015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3yMbyxHt7kTXuNkKXp8L+ow4q0gXmUX3b855pwJznk=;
  b=FF+bikT8HenKSHSqX9wHFaGpBOpfxTL04G7IrazlcRgybB4rK4aEts7z
   aMy8vZy+FyGl43NB9v0Er50AaMr/ytMO8BqjLjVfr9we64WzvqOpS4/cq
   EXmSfvlq9eSeb0NAH0fZLSGqhHrqLLxAJXAV8/xZafM18GdGXUvT1cnWw
   MH5pqpyjkRZF3ipZqW6sWXOyvdWXhi6vC5LzkOMTxOO3TpVf+mahgX+hY
   NQHK5N4wfcgvERc4K2Rih9Oymg3UKANRBmCS57n9v99r3Ad5d1WBvaeh/
   K5i1/Kc3Z4nwIbZecHIdv91oHuH1QdxFCu00PA6aVpVVjvqEcDUETpN4W
   Q==;
X-CSE-ConnectionGUID: tGZybNV8TVWeRqoxh6Qk0Q==
X-CSE-MsgGUID: wrQcDm3UQE2Nsr4vqRbqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55656369"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="55656369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 18:16:54 -0700
X-CSE-ConnectionGUID: kFq5zkxCRyOji3UbIJf9jQ==
X-CSE-MsgGUID: upcYD2bDQ1u7cBcYrkffag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="152135896"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2025 18:16:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPWYj-000AyO-1N;
	Thu, 12 Jun 2025 01:16:49 +0000
Date: Thu, 12 Jun 2025 09:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kmsan/kmsan_test.c:210 test_uninit_stack_var() error:
 uninitialized symbol 'cond'.
Message-ID: <202506120909.vov45s0m-lkp@intel.com>
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
TO: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Alexander Potapenko <glider@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   403d1338a4a59cfebb4ded53fa35fbd5119f36b1
commit: 3a8f6f3b469b4075919a3613e182f9a70df92d46 kmsan: enable on s390
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r073-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120909.vov45s0m-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506120909.vov45s0m-lkp@intel.com/

smatch warnings:
mm/kmsan/kmsan_test.c:210 test_uninit_stack_var() error: uninitialized symbol 'cond'.
mm/kmsan/kmsan_test.c:261 test_params() error: uninitialized symbol 'uninit'.
mm/kmsan/kmsan_test.c:281 test_uninit_multiple_params() error: uninitialized symbol 'a'.
mm/kmsan/kmsan_test.c:281 test_uninit_multiple_params() error: uninitialized symbol 'c'.
mm/kmsan/kmsan_test.c:291 do_uninit_local_array() error: uninitialized symbol 'uninit'.
mm/kmsan/kmsan_test.c:376 test_uaf() error: dereferencing freed memory 'var' (line 374)
mm/kmsan/kmsan_test.c:393 test_percpu_propagate() error: uninitialized symbol 'uninit'.
mm/kmsan/kmsan_test.c:417 test_printk() error: uninitialized symbol 'uninit'.

vim +/cond +210 mm/kmsan/kmsan_test.c

8ed691b02ade8f Alexander Potapenko 2022-09-15  202  
8ed691b02ade8f Alexander Potapenko 2022-09-15  203  /* Test case: ensure that local variables are uninitialized by default. */
8ed691b02ade8f Alexander Potapenko 2022-09-15  204  static void test_uninit_stack_var(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  205  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  206  	EXPECTATION_UNINIT_VALUE(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  207  	volatile int cond;
8ed691b02ade8f Alexander Potapenko 2022-09-15  208  
8ed691b02ade8f Alexander Potapenko 2022-09-15  209  	kunit_info(test, "uninitialized stack variable (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15 @210  	USE(cond);
8ed691b02ade8f Alexander Potapenko 2022-09-15  211  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  212  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  213  
8ed691b02ade8f Alexander Potapenko 2022-09-15  214  /* Test case: ensure that local variables with initializers are initialized. */
8ed691b02ade8f Alexander Potapenko 2022-09-15  215  static void test_init_stack_var(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  216  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  217  	EXPECTATION_NO_REPORT(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  218  	volatile int cond = 1;
8ed691b02ade8f Alexander Potapenko 2022-09-15  219  
8ed691b02ade8f Alexander Potapenko 2022-09-15  220  	kunit_info(test, "initialized stack variable (no reports)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  221  	USE(cond);
8ed691b02ade8f Alexander Potapenko 2022-09-15  222  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  223  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  224  
8ed691b02ade8f Alexander Potapenko 2022-09-15  225  static noinline void two_param_fn_2(int arg1, int arg2)
8ed691b02ade8f Alexander Potapenko 2022-09-15  226  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  227  	USE(arg1);
8ed691b02ade8f Alexander Potapenko 2022-09-15  228  	USE(arg2);
8ed691b02ade8f Alexander Potapenko 2022-09-15  229  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  230  
8ed691b02ade8f Alexander Potapenko 2022-09-15  231  static noinline void one_param_fn(int arg)
8ed691b02ade8f Alexander Potapenko 2022-09-15  232  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  233  	two_param_fn_2(arg, arg);
8ed691b02ade8f Alexander Potapenko 2022-09-15  234  	USE(arg);
8ed691b02ade8f Alexander Potapenko 2022-09-15  235  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  236  
8ed691b02ade8f Alexander Potapenko 2022-09-15  237  static noinline void two_param_fn(int arg1, int arg2)
8ed691b02ade8f Alexander Potapenko 2022-09-15  238  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  239  	int init = 0;
8ed691b02ade8f Alexander Potapenko 2022-09-15  240  
8ed691b02ade8f Alexander Potapenko 2022-09-15  241  	one_param_fn(init);
8ed691b02ade8f Alexander Potapenko 2022-09-15  242  	USE(arg1);
8ed691b02ade8f Alexander Potapenko 2022-09-15  243  	USE(arg2);
8ed691b02ade8f Alexander Potapenko 2022-09-15  244  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  245  
8ed691b02ade8f Alexander Potapenko 2022-09-15  246  static void test_params(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  247  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  248  #ifdef CONFIG_KMSAN_CHECK_PARAM_RETVAL
8ed691b02ade8f Alexander Potapenko 2022-09-15  249  	/*
8ed691b02ade8f Alexander Potapenko 2022-09-15  250  	 * With eager param/retval checking enabled, KMSAN will report an error
8ed691b02ade8f Alexander Potapenko 2022-09-15  251  	 * before the call to two_param_fn().
8ed691b02ade8f Alexander Potapenko 2022-09-15  252  	 */
8ed691b02ade8f Alexander Potapenko 2022-09-15  253  	EXPECTATION_UNINIT_VALUE_FN(expect, "test_params");
8ed691b02ade8f Alexander Potapenko 2022-09-15  254  #else
8ed691b02ade8f Alexander Potapenko 2022-09-15  255  	EXPECTATION_UNINIT_VALUE_FN(expect, "two_param_fn");
8ed691b02ade8f Alexander Potapenko 2022-09-15  256  #endif
8ed691b02ade8f Alexander Potapenko 2022-09-15  257  	volatile int uninit, init = 1;
8ed691b02ade8f Alexander Potapenko 2022-09-15  258  
8ed691b02ade8f Alexander Potapenko 2022-09-15  259  	kunit_info(test,
8ed691b02ade8f Alexander Potapenko 2022-09-15  260  		   "uninit passed through a function parameter (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15 @261  	two_param_fn(uninit, init);
8ed691b02ade8f Alexander Potapenko 2022-09-15  262  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  263  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  264  
8ed691b02ade8f Alexander Potapenko 2022-09-15  265  static int signed_sum3(int a, int b, int c)
8ed691b02ade8f Alexander Potapenko 2022-09-15  266  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  267  	return a + b + c;
8ed691b02ade8f Alexander Potapenko 2022-09-15  268  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  269  
8ed691b02ade8f Alexander Potapenko 2022-09-15  270  /*
8ed691b02ade8f Alexander Potapenko 2022-09-15  271   * Test case: ensure that uninitialized values are tracked through function
8ed691b02ade8f Alexander Potapenko 2022-09-15  272   * arguments.
8ed691b02ade8f Alexander Potapenko 2022-09-15  273   */
8ed691b02ade8f Alexander Potapenko 2022-09-15  274  static void test_uninit_multiple_params(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  275  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  276  	EXPECTATION_UNINIT_VALUE(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  277  	volatile char b = 3, c;
8ed691b02ade8f Alexander Potapenko 2022-09-15  278  	volatile int a;
8ed691b02ade8f Alexander Potapenko 2022-09-15  279  
8ed691b02ade8f Alexander Potapenko 2022-09-15  280  	kunit_info(test, "uninitialized local passed to fn (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15 @281  	USE(signed_sum3(a, b, c));
8ed691b02ade8f Alexander Potapenko 2022-09-15  282  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  283  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  284  
8ed691b02ade8f Alexander Potapenko 2022-09-15  285  /* Helper function to make an array uninitialized. */
8ed691b02ade8f Alexander Potapenko 2022-09-15  286  static noinline void do_uninit_local_array(char *array, int start, int stop)
8ed691b02ade8f Alexander Potapenko 2022-09-15  287  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  288  	volatile char uninit;
8ed691b02ade8f Alexander Potapenko 2022-09-15  289  
8ed691b02ade8f Alexander Potapenko 2022-09-15  290  	for (int i = start; i < stop; i++)
8ed691b02ade8f Alexander Potapenko 2022-09-15 @291  		array[i] = uninit;
8ed691b02ade8f Alexander Potapenko 2022-09-15  292  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  293  
8ed691b02ade8f Alexander Potapenko 2022-09-15  294  /*
8ed691b02ade8f Alexander Potapenko 2022-09-15  295   * Test case: ensure kmsan_check_memory() reports an error when checking
8ed691b02ade8f Alexander Potapenko 2022-09-15  296   * uninitialized memory.
8ed691b02ade8f Alexander Potapenko 2022-09-15  297   */
8ed691b02ade8f Alexander Potapenko 2022-09-15  298  static void test_uninit_kmsan_check_memory(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  299  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  300  	EXPECTATION_UNINIT_VALUE_FN(expect, "test_uninit_kmsan_check_memory");
8ed691b02ade8f Alexander Potapenko 2022-09-15  301  	volatile char local_array[8];
8ed691b02ade8f Alexander Potapenko 2022-09-15  302  
8ed691b02ade8f Alexander Potapenko 2022-09-15  303  	kunit_info(
8ed691b02ade8f Alexander Potapenko 2022-09-15  304  		test,
8ed691b02ade8f Alexander Potapenko 2022-09-15  305  		"kmsan_check_memory() called on uninit local (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  306  	do_uninit_local_array((char *)local_array, 5, 7);
8ed691b02ade8f Alexander Potapenko 2022-09-15  307  
8ed691b02ade8f Alexander Potapenko 2022-09-15  308  	kmsan_check_memory((char *)local_array, 8);
8ed691b02ade8f Alexander Potapenko 2022-09-15  309  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  310  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  311  
8ed691b02ade8f Alexander Potapenko 2022-09-15  312  /*
8ed691b02ade8f Alexander Potapenko 2022-09-15  313   * Test case: check that a virtual memory range created with vmap() from
8ed691b02ade8f Alexander Potapenko 2022-09-15  314   * initialized pages is still considered as initialized.
8ed691b02ade8f Alexander Potapenko 2022-09-15  315   */
8ed691b02ade8f Alexander Potapenko 2022-09-15  316  static void test_init_kmsan_vmap_vunmap(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  317  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  318  	EXPECTATION_NO_REPORT(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  319  	const int npages = 2;
8ed691b02ade8f Alexander Potapenko 2022-09-15  320  	struct page **pages;
8ed691b02ade8f Alexander Potapenko 2022-09-15  321  	void *vbuf;
8ed691b02ade8f Alexander Potapenko 2022-09-15  322  
8ed691b02ade8f Alexander Potapenko 2022-09-15  323  	kunit_info(test, "pages initialized via vmap (no reports)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  324  
8ed691b02ade8f Alexander Potapenko 2022-09-15  325  	pages = kmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
8ed691b02ade8f Alexander Potapenko 2022-09-15  326  	for (int i = 0; i < npages; i++)
8ed691b02ade8f Alexander Potapenko 2022-09-15  327  		pages[i] = alloc_page(GFP_KERNEL);
8ed691b02ade8f Alexander Potapenko 2022-09-15  328  	vbuf = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
8ed691b02ade8f Alexander Potapenko 2022-09-15  329  	memset(vbuf, 0xfe, npages * PAGE_SIZE);
8ed691b02ade8f Alexander Potapenko 2022-09-15  330  	for (int i = 0; i < npages; i++)
8ed691b02ade8f Alexander Potapenko 2022-09-15  331  		kmsan_check_memory(page_address(pages[i]), PAGE_SIZE);
8ed691b02ade8f Alexander Potapenko 2022-09-15  332  
8ed691b02ade8f Alexander Potapenko 2022-09-15  333  	if (vbuf)
8ed691b02ade8f Alexander Potapenko 2022-09-15  334  		vunmap(vbuf);
8ed691b02ade8f Alexander Potapenko 2022-09-15  335  	for (int i = 0; i < npages; i++) {
8ed691b02ade8f Alexander Potapenko 2022-09-15  336  		if (pages[i])
8ed691b02ade8f Alexander Potapenko 2022-09-15  337  			__free_page(pages[i]);
8ed691b02ade8f Alexander Potapenko 2022-09-15  338  	}
8ed691b02ade8f Alexander Potapenko 2022-09-15  339  	kfree(pages);
8ed691b02ade8f Alexander Potapenko 2022-09-15  340  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  341  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  342  
8ed691b02ade8f Alexander Potapenko 2022-09-15  343  /*
8ed691b02ade8f Alexander Potapenko 2022-09-15  344   * Test case: ensure that memset() can initialize a buffer allocated via
8ed691b02ade8f Alexander Potapenko 2022-09-15  345   * vmalloc().
8ed691b02ade8f Alexander Potapenko 2022-09-15  346   */
8ed691b02ade8f Alexander Potapenko 2022-09-15  347  static void test_init_vmalloc(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  348  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  349  	EXPECTATION_NO_REPORT(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  350  	int npages = 8;
8ed691b02ade8f Alexander Potapenko 2022-09-15  351  	char *buf;
8ed691b02ade8f Alexander Potapenko 2022-09-15  352  
8ed691b02ade8f Alexander Potapenko 2022-09-15  353  	kunit_info(test, "vmalloc buffer can be initialized (no reports)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  354  	buf = vmalloc(PAGE_SIZE * npages);
8ed691b02ade8f Alexander Potapenko 2022-09-15  355  	buf[0] = 1;
8ed691b02ade8f Alexander Potapenko 2022-09-15  356  	memset(buf, 0xfe, PAGE_SIZE * npages);
8ed691b02ade8f Alexander Potapenko 2022-09-15  357  	USE(buf[0]);
8ed691b02ade8f Alexander Potapenko 2022-09-15  358  	for (int i = 0; i < npages; i++)
8ed691b02ade8f Alexander Potapenko 2022-09-15  359  		kmsan_check_memory(&buf[PAGE_SIZE * i], PAGE_SIZE);
8ed691b02ade8f Alexander Potapenko 2022-09-15  360  	vfree(buf);
8ed691b02ade8f Alexander Potapenko 2022-09-15  361  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  362  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  363  
8ed691b02ade8f Alexander Potapenko 2022-09-15  364  /* Test case: ensure that use-after-free reporting works. */
8ed691b02ade8f Alexander Potapenko 2022-09-15  365  static void test_uaf(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  366  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  367  	EXPECTATION_USE_AFTER_FREE(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  368  	volatile int value;
8ed691b02ade8f Alexander Potapenko 2022-09-15  369  	volatile int *var;
8ed691b02ade8f Alexander Potapenko 2022-09-15  370  
8ed691b02ade8f Alexander Potapenko 2022-09-15  371  	kunit_info(test, "use-after-free in kmalloc-ed buffer (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  372  	var = kmalloc(80, GFP_KERNEL);
8ed691b02ade8f Alexander Potapenko 2022-09-15  373  	var[3] = 0xfeedface;
8ed691b02ade8f Alexander Potapenko 2022-09-15 @374  	kfree((int *)var);
8ed691b02ade8f Alexander Potapenko 2022-09-15  375  	/* Copy the invalid value before checking it. */
8ed691b02ade8f Alexander Potapenko 2022-09-15 @376  	value = var[3];
8ed691b02ade8f Alexander Potapenko 2022-09-15  377  	USE(value);
8ed691b02ade8f Alexander Potapenko 2022-09-15  378  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  379  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  380  
8ed691b02ade8f Alexander Potapenko 2022-09-15  381  /*
8ed691b02ade8f Alexander Potapenko 2022-09-15  382   * Test case: ensure that uninitialized values are propagated through per-CPU
8ed691b02ade8f Alexander Potapenko 2022-09-15  383   * memory.
8ed691b02ade8f Alexander Potapenko 2022-09-15  384   */
8ed691b02ade8f Alexander Potapenko 2022-09-15  385  static void test_percpu_propagate(struct kunit *test)
8ed691b02ade8f Alexander Potapenko 2022-09-15  386  {
8ed691b02ade8f Alexander Potapenko 2022-09-15  387  	EXPECTATION_UNINIT_VALUE(expect);
8ed691b02ade8f Alexander Potapenko 2022-09-15  388  	volatile int uninit, check;
8ed691b02ade8f Alexander Potapenko 2022-09-15  389  
8ed691b02ade8f Alexander Potapenko 2022-09-15  390  	kunit_info(test,
8ed691b02ade8f Alexander Potapenko 2022-09-15  391  		   "uninit local stored to per_cpu memory (UMR report)\n");
8ed691b02ade8f Alexander Potapenko 2022-09-15  392  
8ed691b02ade8f Alexander Potapenko 2022-09-15 @393  	this_cpu_write(per_cpu_var, uninit);
8ed691b02ade8f Alexander Potapenko 2022-09-15  394  	check = this_cpu_read(per_cpu_var);
8ed691b02ade8f Alexander Potapenko 2022-09-15  395  	USE(check);
8ed691b02ade8f Alexander Potapenko 2022-09-15  396  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
8ed691b02ade8f Alexander Potapenko 2022-09-15  397  }
8ed691b02ade8f Alexander Potapenko 2022-09-15  398  

:::::: The code at line 210 was first introduced by commit
:::::: 8ed691b02ade8f755f34aa1fa8beff8ce4f81f6d kmsan: add tests for KMSAN

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
