Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21AF17EE
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690398471; x=1721934471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hj+OpsCdArBCmjy78EbgK/MzZY2J9sGVCv8DDHESRXc=;
  b=kI/O9/ylUr2QVECtDxi63fgyeeMzWgqLnP0VFG1zSqFNSF+j5aAQJPRP
   4Mfpd/8PT0eXVAkmLlHXckwv7nPNTSCsckdSuih24z8247xs7x7mkVTDA
   mjE/YOiw5VoQazYVFqqcIKgMmJIq1ofOJF3+H+uhG3ra8jPDx5Aa9ZKuT
   zl05/ICYdiw/WilTPBthLoEN45Ub5+DOLeW/XwNxlOqp3BipPBSKFojhP
   7hOMOj6JeT2JFte/YuX0TWjjkr2ziNMKvoxeVbf/XySefddfJSilmZFSI
   r3BqOrCofmINLVpZdPY0N133rLMpO0Rw2zgAEFHa2j/ZoNRGhoFglAIGa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="366986193"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="366986193"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 12:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676818553"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="676818553"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 12:07:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOjrP-0001Db-2b;
	Wed, 26 Jul 2023 19:07:47 +0000
Date: Thu, 27 Jul 2023 03:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here
 instead of GFP_KERNEL?
Message-ID: <202307270305.L19EfaJD-lkp@intel.com>
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
TO: Helge Deller <deller@gmx.de>

Hi Helge,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18b44bc5a67275641fb26f2c54ba7eef80ac5950
commit: adf8e96a7ea670d45b5de7594acc67e8f4787ae6 parisc: Enable LOCKDEP support
date:   9 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 weeks ago
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270305.L19EfaJD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270305.L19EfaJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307270305.L19EfaJD-lkp@intel.com/

smatch warnings:
mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
mm/kfence/kfence_test.c:395 test_double_free() error: double free of 'expect.addr'
mm/kfence/kfence_test.c:671 test_memcache_typesafe_by_rcu() error: dereferencing freed memory 'expect.addr'

vim +/gfp +287 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver     2021-02-25  238  
bc8fbc5f305aec Marco Elver     2021-02-25  239  /*
bc8fbc5f305aec Marco Elver     2021-02-25  240   * Try to get a guarded allocation from KFENCE. Uses either kmalloc() or the
bc8fbc5f305aec Marco Elver     2021-02-25  241   * current test_cache if set up.
bc8fbc5f305aec Marco Elver     2021-02-25  242   */
bc8fbc5f305aec Marco Elver     2021-02-25  243  static void *test_alloc(struct kunit *test, size_t size, gfp_t gfp, enum allocation_policy policy)
bc8fbc5f305aec Marco Elver     2021-02-25  244  {
bc8fbc5f305aec Marco Elver     2021-02-25  245  	void *alloc;
bc8fbc5f305aec Marco Elver     2021-02-25  246  	unsigned long timeout, resched_after;
bc8fbc5f305aec Marco Elver     2021-02-25  247  	const char *policy_name;
bc8fbc5f305aec Marco Elver     2021-02-25  248  
bc8fbc5f305aec Marco Elver     2021-02-25  249  	switch (policy) {
bc8fbc5f305aec Marco Elver     2021-02-25  250  	case ALLOCATE_ANY:
bc8fbc5f305aec Marco Elver     2021-02-25  251  		policy_name = "any";
bc8fbc5f305aec Marco Elver     2021-02-25  252  		break;
bc8fbc5f305aec Marco Elver     2021-02-25  253  	case ALLOCATE_LEFT:
bc8fbc5f305aec Marco Elver     2021-02-25  254  		policy_name = "left";
bc8fbc5f305aec Marco Elver     2021-02-25  255  		break;
bc8fbc5f305aec Marco Elver     2021-02-25  256  	case ALLOCATE_RIGHT:
bc8fbc5f305aec Marco Elver     2021-02-25  257  		policy_name = "right";
bc8fbc5f305aec Marco Elver     2021-02-25  258  		break;
bc8fbc5f305aec Marco Elver     2021-02-25  259  	case ALLOCATE_NONE:
bc8fbc5f305aec Marco Elver     2021-02-25  260  		policy_name = "none";
bc8fbc5f305aec Marco Elver     2021-02-25  261  		break;
bc8fbc5f305aec Marco Elver     2021-02-25  262  	}
bc8fbc5f305aec Marco Elver     2021-02-25  263  
bc8fbc5f305aec Marco Elver     2021-02-25  264  	kunit_info(test, "%s: size=%zu, gfp=%x, policy=%s, cache=%i\n", __func__, size, gfp,
bc8fbc5f305aec Marco Elver     2021-02-25  265  		   policy_name, !!test_cache);
bc8fbc5f305aec Marco Elver     2021-02-25  266  
bc8fbc5f305aec Marco Elver     2021-02-25  267  	/*
bc8fbc5f305aec Marco Elver     2021-02-25  268  	 * 100x the sample interval should be more than enough to ensure we get
bc8fbc5f305aec Marco Elver     2021-02-25  269  	 * a KFENCE allocation eventually.
bc8fbc5f305aec Marco Elver     2021-02-25  270  	 */
8913c610014823 Peng Liu        2022-02-11  271  	timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
bc8fbc5f305aec Marco Elver     2021-02-25  272  	/*
bc8fbc5f305aec Marco Elver     2021-02-25  273  	 * Especially for non-preemption kernels, ensure the allocation-gate
bc8fbc5f305aec Marco Elver     2021-02-25  274  	 * timer can catch up: after @resched_after, every failed allocation
bc8fbc5f305aec Marco Elver     2021-02-25  275  	 * attempt yields, to ensure the allocation-gate timer is scheduled.
bc8fbc5f305aec Marco Elver     2021-02-25  276  	 */
8913c610014823 Peng Liu        2022-02-11  277  	resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
bc8fbc5f305aec Marco Elver     2021-02-25  278  	do {
bc8fbc5f305aec Marco Elver     2021-02-25  279  		if (test_cache)
bc8fbc5f305aec Marco Elver     2021-02-25  280  			alloc = kmem_cache_alloc(test_cache, gfp);
bc8fbc5f305aec Marco Elver     2021-02-25  281  		else
bc8fbc5f305aec Marco Elver     2021-02-25  282  			alloc = kmalloc(size, gfp);
bc8fbc5f305aec Marco Elver     2021-02-25  283  
bc8fbc5f305aec Marco Elver     2021-02-25  284  		if (is_kfence_address(alloc)) {
8dae0cfed57357 Vlastimil Babka 2021-11-03  285  			struct slab *slab = virt_to_slab(alloc);
588c7fa022d7b2 Hyeonggon Yoo   2021-06-28  286  			struct kmem_cache *s = test_cache ?:
588c7fa022d7b2 Hyeonggon Yoo   2021-06-28 @287  					kmalloc_caches[kmalloc_type(GFP_KERNEL)][__kmalloc_index(size, false)];
bc8fbc5f305aec Marco Elver     2021-02-25  288  
bc8fbc5f305aec Marco Elver     2021-02-25  289  			/*
bc8fbc5f305aec Marco Elver     2021-02-25  290  			 * Verify that various helpers return the right values
bc8fbc5f305aec Marco Elver     2021-02-25  291  			 * even for KFENCE objects; these are required so that
bc8fbc5f305aec Marco Elver     2021-02-25  292  			 * memcg accounting works correctly.
bc8fbc5f305aec Marco Elver     2021-02-25  293  			 */
8dae0cfed57357 Vlastimil Babka 2021-11-03  294  			KUNIT_EXPECT_EQ(test, obj_to_index(s, slab, alloc), 0U);
8dae0cfed57357 Vlastimil Babka 2021-11-03  295  			KUNIT_EXPECT_EQ(test, objs_per_slab(s, slab), 1);
bc8fbc5f305aec Marco Elver     2021-02-25  296  
bc8fbc5f305aec Marco Elver     2021-02-25  297  			if (policy == ALLOCATE_ANY)
bc8fbc5f305aec Marco Elver     2021-02-25  298  				return alloc;
f403f22f8ccb12 Kefeng Wang     2022-05-20  299  			if (policy == ALLOCATE_LEFT && PAGE_ALIGNED(alloc))
bc8fbc5f305aec Marco Elver     2021-02-25  300  				return alloc;
f403f22f8ccb12 Kefeng Wang     2022-05-20  301  			if (policy == ALLOCATE_RIGHT && !PAGE_ALIGNED(alloc))
bc8fbc5f305aec Marco Elver     2021-02-25  302  				return alloc;
bc8fbc5f305aec Marco Elver     2021-02-25  303  		} else if (policy == ALLOCATE_NONE)
bc8fbc5f305aec Marco Elver     2021-02-25  304  			return alloc;
bc8fbc5f305aec Marco Elver     2021-02-25  305  
bc8fbc5f305aec Marco Elver     2021-02-25  306  		test_free(alloc);
bc8fbc5f305aec Marco Elver     2021-02-25  307  
bc8fbc5f305aec Marco Elver     2021-02-25  308  		if (time_after(jiffies, resched_after))
bc8fbc5f305aec Marco Elver     2021-02-25  309  			cond_resched();
bc8fbc5f305aec Marco Elver     2021-02-25  310  	} while (time_before(jiffies, timeout));
bc8fbc5f305aec Marco Elver     2021-02-25  311  
bc8fbc5f305aec Marco Elver     2021-02-25  312  	KUNIT_ASSERT_TRUE_MSG(test, false, "failed to allocate from KFENCE");
bc8fbc5f305aec Marco Elver     2021-02-25  313  	return NULL; /* Unreachable. */
bc8fbc5f305aec Marco Elver     2021-02-25  314  }
bc8fbc5f305aec Marco Elver     2021-02-25  315  
bc8fbc5f305aec Marco Elver     2021-02-25  316  static void test_out_of_bounds_read(struct kunit *test)
bc8fbc5f305aec Marco Elver     2021-02-25  317  {
bc8fbc5f305aec Marco Elver     2021-02-25  318  	size_t size = 32;
bc8fbc5f305aec Marco Elver     2021-02-25  319  	struct expect_report expect = {
bc8fbc5f305aec Marco Elver     2021-02-25  320  		.type = KFENCE_ERROR_OOB,
bc8fbc5f305aec Marco Elver     2021-02-25  321  		.fn = test_out_of_bounds_read,
bc8fbc5f305aec Marco Elver     2021-02-25  322  		.is_write = false,
bc8fbc5f305aec Marco Elver     2021-02-25  323  	};
bc8fbc5f305aec Marco Elver     2021-02-25  324  	char *buf;
bc8fbc5f305aec Marco Elver     2021-02-25  325  
bc8fbc5f305aec Marco Elver     2021-02-25  326  	setup_test_cache(test, size, 0, NULL);
bc8fbc5f305aec Marco Elver     2021-02-25  327  
bc8fbc5f305aec Marco Elver     2021-02-25  328  	/*
bc8fbc5f305aec Marco Elver     2021-02-25  329  	 * If we don't have our own cache, adjust based on alignment, so that we
bc8fbc5f305aec Marco Elver     2021-02-25  330  	 * actually access guard pages on either side.
bc8fbc5f305aec Marco Elver     2021-02-25  331  	 */
bc8fbc5f305aec Marco Elver     2021-02-25  332  	if (!test_cache)
bc8fbc5f305aec Marco Elver     2021-02-25  333  		size = kmalloc_cache_alignment(size);
bc8fbc5f305aec Marco Elver     2021-02-25  334  
bc8fbc5f305aec Marco Elver     2021-02-25  335  	/* Test both sides. */
bc8fbc5f305aec Marco Elver     2021-02-25  336  
bc8fbc5f305aec Marco Elver     2021-02-25  337  	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_LEFT);
bc8fbc5f305aec Marco Elver     2021-02-25  338  	expect.addr = buf - 1;
bc8fbc5f305aec Marco Elver     2021-02-25  339  	READ_ONCE(*expect.addr);
bc8fbc5f305aec Marco Elver     2021-02-25  340  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver     2021-02-25  341  	test_free(buf);
bc8fbc5f305aec Marco Elver     2021-02-25  342  
bc8fbc5f305aec Marco Elver     2021-02-25  343  	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_RIGHT);
bc8fbc5f305aec Marco Elver     2021-02-25  344  	expect.addr = buf + size;
bc8fbc5f305aec Marco Elver     2021-02-25  345  	READ_ONCE(*expect.addr);
bc8fbc5f305aec Marco Elver     2021-02-25  346  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver     2021-02-25  347  	test_free(buf);
bc8fbc5f305aec Marco Elver     2021-02-25  348  }
bc8fbc5f305aec Marco Elver     2021-02-25  349  
bc8fbc5f305aec Marco Elver     2021-02-25  350  static void test_out_of_bounds_write(struct kunit *test)
bc8fbc5f305aec Marco Elver     2021-02-25  351  {
bc8fbc5f305aec Marco Elver     2021-02-25  352  	size_t size = 32;
bc8fbc5f305aec Marco Elver     2021-02-25  353  	struct expect_report expect = {
bc8fbc5f305aec Marco Elver     2021-02-25  354  		.type = KFENCE_ERROR_OOB,
bc8fbc5f305aec Marco Elver     2021-02-25  355  		.fn = test_out_of_bounds_write,
bc8fbc5f305aec Marco Elver     2021-02-25  356  		.is_write = true,
bc8fbc5f305aec Marco Elver     2021-02-25  357  	};
bc8fbc5f305aec Marco Elver     2021-02-25  358  	char *buf;
bc8fbc5f305aec Marco Elver     2021-02-25  359  
bc8fbc5f305aec Marco Elver     2021-02-25  360  	setup_test_cache(test, size, 0, NULL);
bc8fbc5f305aec Marco Elver     2021-02-25  361  	buf = test_alloc(test, size, GFP_KERNEL, ALLOCATE_LEFT);
bc8fbc5f305aec Marco Elver     2021-02-25  362  	expect.addr = buf - 1;
bc8fbc5f305aec Marco Elver     2021-02-25  363  	WRITE_ONCE(*expect.addr, 42);
bc8fbc5f305aec Marco Elver     2021-02-25  364  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver     2021-02-25  365  	test_free(buf);
bc8fbc5f305aec Marco Elver     2021-02-25  366  }
bc8fbc5f305aec Marco Elver     2021-02-25  367  
bc8fbc5f305aec Marco Elver     2021-02-25  368  static void test_use_after_free_read(struct kunit *test)
bc8fbc5f305aec Marco Elver     2021-02-25  369  {
bc8fbc5f305aec Marco Elver     2021-02-25  370  	const size_t size = 32;
bc8fbc5f305aec Marco Elver     2021-02-25  371  	struct expect_report expect = {
bc8fbc5f305aec Marco Elver     2021-02-25  372  		.type = KFENCE_ERROR_UAF,
bc8fbc5f305aec Marco Elver     2021-02-25  373  		.fn = test_use_after_free_read,
bc8fbc5f305aec Marco Elver     2021-02-25  374  		.is_write = false,
bc8fbc5f305aec Marco Elver     2021-02-25  375  	};
bc8fbc5f305aec Marco Elver     2021-02-25  376  
bc8fbc5f305aec Marco Elver     2021-02-25  377  	setup_test_cache(test, size, 0, NULL);
bc8fbc5f305aec Marco Elver     2021-02-25  378  	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
bc8fbc5f305aec Marco Elver     2021-02-25  379  	test_free(expect.addr);
bc8fbc5f305aec Marco Elver     2021-02-25  380  	READ_ONCE(*expect.addr);
bc8fbc5f305aec Marco Elver     2021-02-25  381  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver     2021-02-25  382  }
bc8fbc5f305aec Marco Elver     2021-02-25  383  
bc8fbc5f305aec Marco Elver     2021-02-25  384  static void test_double_free(struct kunit *test)
bc8fbc5f305aec Marco Elver     2021-02-25  385  {
bc8fbc5f305aec Marco Elver     2021-02-25  386  	const size_t size = 32;
bc8fbc5f305aec Marco Elver     2021-02-25  387  	struct expect_report expect = {
bc8fbc5f305aec Marco Elver     2021-02-25  388  		.type = KFENCE_ERROR_INVALID_FREE,
bc8fbc5f305aec Marco Elver     2021-02-25  389  		.fn = test_double_free,
bc8fbc5f305aec Marco Elver     2021-02-25  390  	};
bc8fbc5f305aec Marco Elver     2021-02-25  391  
bc8fbc5f305aec Marco Elver     2021-02-25  392  	setup_test_cache(test, size, 0, NULL);
bc8fbc5f305aec Marco Elver     2021-02-25  393  	expect.addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
bc8fbc5f305aec Marco Elver     2021-02-25  394  	test_free(expect.addr);
bc8fbc5f305aec Marco Elver     2021-02-25 @395  	test_free(expect.addr); /* Double-free. */
bc8fbc5f305aec Marco Elver     2021-02-25  396  	KUNIT_EXPECT_TRUE(test, report_matches(&expect));
bc8fbc5f305aec Marco Elver     2021-02-25  397  }
bc8fbc5f305aec Marco Elver     2021-02-25  398  

:::::: The code at line 287 was first introduced by commit
:::::: 588c7fa022d7b2361500ead5660d9a1a2ecd9b7d mm, slub: change run-time assertion in kmalloc_index() to compile-time

:::::: TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
