Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7415697C
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542971; cv=none; b=hZNNv9klgIDdcH8gK2rbKrnBZcWRe3ULN2qEkkhaQtrolg9IKO4QLf5r1NfZROG84X+b7d+bsNFvop4S+yu11YeF8rA8ite3J9IEP52Nq0Yh9u4X380T6OHVCc2soRxOi9fFmGkThbs2IpH5BPrUj8GCdZYw6u9Ec483obRcxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542971; c=relaxed/simple;
	bh=8e7SKMqS+lVAev1L9ADGKp0zdI39mym1ydYi2EwiKgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7/rFJuLBn1zbN+ns28I4ZT/bgQfSLVMYW96PBW5vRyy8OlC0VVbBeLVhzekAdEAf4aysKmQrf+PCJ68ZnO7arhi5B4Mq4Spmakh2vBrggDHnLGWaN8n69fZFuzHNkWAISd11jOu5BaaMGley94vPg963yT2zMcDgF4cwvE8rsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3jlMj1m; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3jlMj1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706542968; x=1738078968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8e7SKMqS+lVAev1L9ADGKp0zdI39mym1ydYi2EwiKgU=;
  b=l3jlMj1m6sl/115HerWTyfMBEojPvo+loX3FxarjabOJPm/+Czu1B2Ja
   WnFMUZjAaeLA3DYQZWk59YGmikDDhkjq7LTGLkY3NodnYDNy9GsA/4iF7
   Nk34v9CmVEqX/t1TT7SNPLlhCYkLZFjZ8/5pvDaBteTSHrPcPY+EshYGG
   Z9Ls10GGtBnQ2q+hfj7VZ2UYKqJLyld4RgPgV8qdZ4S/tQRrOUBELm9P8
   ss2fy4CCqYGmmb/AIUjnSP9TouSOZ/IIdcCkhKB5Qe+MTpEkKtfWwfk7J
   Tvl7nj7RRUuUbprn2XgGR+n1ysKa8rb/P1JCukhTGGTQVJ75R/zaIXdHy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393420756"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393420756"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 07:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960920913"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="960920913"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2024 07:42:43 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUTmT-0004Nc-0x;
	Mon, 29 Jan 2024 15:42:41 +0000
Date: Mon, 29 Jan 2024 23:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/tests/xe_migrate.c:224 xe_migrate_sanity_test()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202401292346.V7E6rEzz-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   41bccc98fb7931d63d03f326a746ac4d429c1dd3
commit: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs
date:   7 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 weeks ago
config: sparc-randconfig-r081-20240128 (https://download.01.org/0day-ci/archive/20240129/202401292346.V7E6rEzz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401292346.V7E6rEzz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/tests/xe_migrate.c:224 xe_migrate_sanity_test() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/xe/xe_migrate.c:646 xe_migrate_copy() error: uninitialized symbol 'ccs_ofs'.
drivers/gpu/drm/xe/tests/xe_migrate.c:254 xe_migrate_sanity_test() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +224 drivers/gpu/drm/xe/tests/xe_migrate.c

dd08ebf6c3525a Matthew Brost 2023-03-30  209  
dd08ebf6c3525a Matthew Brost 2023-03-30  210  static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
dd08ebf6c3525a Matthew Brost 2023-03-30  211  {
dd08ebf6c3525a Matthew Brost 2023-03-30  212  	struct xe_gt *gt = m->gt;
dd08ebf6c3525a Matthew Brost 2023-03-30  213  	struct xe_device *xe = gt_to_xe(gt);
dd08ebf6c3525a Matthew Brost 2023-03-30  214  	struct xe_bo *pt, *bo = m->pt_bo, *big, *tiny;
dd08ebf6c3525a Matthew Brost 2023-03-30  215  	struct xe_res_cursor src_it;
dd08ebf6c3525a Matthew Brost 2023-03-30  216  	struct dma_fence *fence;
dd08ebf6c3525a Matthew Brost 2023-03-30  217  	u64 retval, expected;
dd08ebf6c3525a Matthew Brost 2023-03-30  218  	struct xe_bb *bb;
dd08ebf6c3525a Matthew Brost 2023-03-30  219  	int err;
dd08ebf6c3525a Matthew Brost 2023-03-30  220  	u8 id = gt->info.id;
dd08ebf6c3525a Matthew Brost 2023-03-30  221  
dd08ebf6c3525a Matthew Brost 2023-03-30  222  	err = xe_bo_vmap(bo);
dd08ebf6c3525a Matthew Brost 2023-03-30  223  	if (err) {
dd08ebf6c3525a Matthew Brost 2023-03-30 @224  		KUNIT_FAIL(test, "Failed to vmap our pagetables: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  225  			   PTR_ERR(bo));
dd08ebf6c3525a Matthew Brost 2023-03-30  226  		return;
dd08ebf6c3525a Matthew Brost 2023-03-30  227  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  228  
dd08ebf6c3525a Matthew Brost 2023-03-30  229  	big = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, SZ_4M,
dd08ebf6c3525a Matthew Brost 2023-03-30  230  				   ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  231  				   XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  232  				   XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  233  	if (IS_ERR(big)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  234  		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
dd08ebf6c3525a Matthew Brost 2023-03-30  235  		goto vunmap;
dd08ebf6c3525a Matthew Brost 2023-03-30  236  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  237  
dd08ebf6c3525a Matthew Brost 2023-03-30  238  	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, GEN8_PAGE_SIZE,
dd08ebf6c3525a Matthew Brost 2023-03-30  239  				  ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  240  				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  241  				  XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  242  	if (IS_ERR(pt)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  243  		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  244  			   PTR_ERR(pt));
dd08ebf6c3525a Matthew Brost 2023-03-30  245  		goto free_big;
dd08ebf6c3525a Matthew Brost 2023-03-30  246  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  247  
dd08ebf6c3525a Matthew Brost 2023-03-30  248  	tiny = xe_bo_create_pin_map(xe, m->gt, m->eng->vm,
dd08ebf6c3525a Matthew Brost 2023-03-30  249  				    2 * SZ_4K,
dd08ebf6c3525a Matthew Brost 2023-03-30  250  				    ttm_bo_type_kernel,
dd08ebf6c3525a Matthew Brost 2023-03-30  251  				    XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
dd08ebf6c3525a Matthew Brost 2023-03-30  252  				    XE_BO_CREATE_PINNED_BIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  253  	if (IS_ERR(tiny)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  254  		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  255  			   PTR_ERR(pt));
dd08ebf6c3525a Matthew Brost 2023-03-30  256  		goto free_pt;
dd08ebf6c3525a Matthew Brost 2023-03-30  257  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  258  
dd08ebf6c3525a Matthew Brost 2023-03-30  259  	bb = xe_bb_new(m->gt, 32, xe->info.supports_usm);
dd08ebf6c3525a Matthew Brost 2023-03-30  260  	if (IS_ERR(bb)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  261  		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  262  			   PTR_ERR(bb));
dd08ebf6c3525a Matthew Brost 2023-03-30  263  		goto free_tiny;
dd08ebf6c3525a Matthew Brost 2023-03-30  264  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  265  
dd08ebf6c3525a Matthew Brost 2023-03-30  266  	kunit_info(test, "Starting tests, top level PT addr: %llx, special pagetable base addr: %llx\n",
dd08ebf6c3525a Matthew Brost 2023-03-30  267  		   xe_bo_main_addr(m->eng->vm->pt_root[id]->bo, GEN8_PAGE_SIZE),
dd08ebf6c3525a Matthew Brost 2023-03-30  268  		   xe_bo_main_addr(m->pt_bo, GEN8_PAGE_SIZE));
dd08ebf6c3525a Matthew Brost 2023-03-30  269  
dd08ebf6c3525a Matthew Brost 2023-03-30  270  	/* First part of the test, are we updating our pagetable bo with a new entry? */
dd08ebf6c3525a Matthew Brost 2023-03-30  271  	xe_map_wr(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64, 0xdeaddeadbeefbeef);
dd08ebf6c3525a Matthew Brost 2023-03-30  272  	expected = gen8_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
dd08ebf6c3525a Matthew Brost 2023-03-30  273  	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
dd08ebf6c3525a Matthew Brost 2023-03-30  274  		expected |= GEN12_PTE_PS64;
dd08ebf6c3525a Matthew Brost 2023-03-30  275  	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
dd08ebf6c3525a Matthew Brost 2023-03-30  276  	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
dd08ebf6c3525a Matthew Brost 2023-03-30  277  		 &src_it, GEN8_PAGE_SIZE, pt);
dd08ebf6c3525a Matthew Brost 2023-03-30  278  	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  279  
dd08ebf6c3525a Matthew Brost 2023-03-30  280  	retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
dd08ebf6c3525a Matthew Brost 2023-03-30  281  			   u64);
dd08ebf6c3525a Matthew Brost 2023-03-30  282  	check(retval, expected, "PTE entry write", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  283  
dd08ebf6c3525a Matthew Brost 2023-03-30  284  	/* Now try to write data to our newly mapped 'pagetable', see if it succeeds */
dd08ebf6c3525a Matthew Brost 2023-03-30  285  	bb->len = 0;
dd08ebf6c3525a Matthew Brost 2023-03-30  286  	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
dd08ebf6c3525a Matthew Brost 2023-03-30  287  	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
dd08ebf6c3525a Matthew Brost 2023-03-30  288  	expected = 0x12345678U;
dd08ebf6c3525a Matthew Brost 2023-03-30  289  
dd08ebf6c3525a Matthew Brost 2023-03-30  290  	emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
dd08ebf6c3525a Matthew Brost 2023-03-30  291  		   expected, IS_DGFX(xe));
dd08ebf6c3525a Matthew Brost 2023-03-30  292  	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
dd08ebf6c3525a Matthew Brost 2023-03-30  293  		       test);
dd08ebf6c3525a Matthew Brost 2023-03-30  294  
dd08ebf6c3525a Matthew Brost 2023-03-30  295  	retval = xe_map_rd(xe, &pt->vmap, 0, u32);
dd08ebf6c3525a Matthew Brost 2023-03-30  296  	check(retval, expected, "Write to PT after adding PTE", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  297  
dd08ebf6c3525a Matthew Brost 2023-03-30  298  	/* Sanity checks passed, try the full ones! */
dd08ebf6c3525a Matthew Brost 2023-03-30  299  
dd08ebf6c3525a Matthew Brost 2023-03-30  300  	/* Clear a small bo */
dd08ebf6c3525a Matthew Brost 2023-03-30  301  	kunit_info(test, "Clearing small buffer object\n");
dd08ebf6c3525a Matthew Brost 2023-03-30  302  	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
dd08ebf6c3525a Matthew Brost 2023-03-30  303  	expected = 0x224488ff;
dd08ebf6c3525a Matthew Brost 2023-03-30  304  	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, expected);
dd08ebf6c3525a Matthew Brost 2023-03-30  305  	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
dd08ebf6c3525a Matthew Brost 2023-03-30  306  		goto out;
dd08ebf6c3525a Matthew Brost 2023-03-30  307  
dd08ebf6c3525a Matthew Brost 2023-03-30  308  	dma_fence_put(fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  309  	retval = xe_map_rd(xe, &tiny->vmap, 0, u32);
dd08ebf6c3525a Matthew Brost 2023-03-30  310  	check(retval, expected, "Command clear small first value", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  311  	retval = xe_map_rd(xe, &tiny->vmap, tiny->size - 4, u32);
dd08ebf6c3525a Matthew Brost 2023-03-30  312  	check(retval, expected, "Command clear small last value", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  313  
dd08ebf6c3525a Matthew Brost 2023-03-30  314  	if (IS_DGFX(xe)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  315  		kunit_info(test, "Copying small buffer object to system\n");
dd08ebf6c3525a Matthew Brost 2023-03-30  316  		test_copy(m, tiny, test);
dd08ebf6c3525a Matthew Brost 2023-03-30  317  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  318  
dd08ebf6c3525a Matthew Brost 2023-03-30  319  	/* Clear a big bo with a fixed value */
dd08ebf6c3525a Matthew Brost 2023-03-30  320  	kunit_info(test, "Clearing big buffer object\n");
dd08ebf6c3525a Matthew Brost 2023-03-30  321  	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
dd08ebf6c3525a Matthew Brost 2023-03-30  322  	expected = 0x11223344U;
dd08ebf6c3525a Matthew Brost 2023-03-30  323  	fence = xe_migrate_clear(m, big, big->ttm.resource, expected);
dd08ebf6c3525a Matthew Brost 2023-03-30  324  	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
dd08ebf6c3525a Matthew Brost 2023-03-30  325  		goto out;
dd08ebf6c3525a Matthew Brost 2023-03-30  326  
dd08ebf6c3525a Matthew Brost 2023-03-30  327  	dma_fence_put(fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  328  	retval = xe_map_rd(xe, &big->vmap, 0, u32);
dd08ebf6c3525a Matthew Brost 2023-03-30  329  	check(retval, expected, "Command clear big first value", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  330  	retval = xe_map_rd(xe, &big->vmap, big->size - 4, u32);
dd08ebf6c3525a Matthew Brost 2023-03-30  331  	check(retval, expected, "Command clear big last value", test);
dd08ebf6c3525a Matthew Brost 2023-03-30  332  
dd08ebf6c3525a Matthew Brost 2023-03-30  333  	if (IS_DGFX(xe)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  334  		kunit_info(test, "Copying big buffer object to system\n");
dd08ebf6c3525a Matthew Brost 2023-03-30  335  		test_copy(m, big, test);
dd08ebf6c3525a Matthew Brost 2023-03-30  336  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  337  
dd08ebf6c3525a Matthew Brost 2023-03-30  338  	test_pt_update(m, pt, test);
dd08ebf6c3525a Matthew Brost 2023-03-30  339  
dd08ebf6c3525a Matthew Brost 2023-03-30  340  out:
dd08ebf6c3525a Matthew Brost 2023-03-30  341  	xe_bb_free(bb, NULL);
dd08ebf6c3525a Matthew Brost 2023-03-30  342  free_tiny:
dd08ebf6c3525a Matthew Brost 2023-03-30  343  	xe_bo_unpin(tiny);
dd08ebf6c3525a Matthew Brost 2023-03-30  344  	xe_bo_put(tiny);
dd08ebf6c3525a Matthew Brost 2023-03-30  345  free_pt:
dd08ebf6c3525a Matthew Brost 2023-03-30  346  	xe_bo_unpin(pt);
dd08ebf6c3525a Matthew Brost 2023-03-30  347  	xe_bo_put(pt);
dd08ebf6c3525a Matthew Brost 2023-03-30  348  free_big:
dd08ebf6c3525a Matthew Brost 2023-03-30  349  	xe_bo_unpin(big);
dd08ebf6c3525a Matthew Brost 2023-03-30  350  	xe_bo_put(big);
dd08ebf6c3525a Matthew Brost 2023-03-30  351  vunmap:
dd08ebf6c3525a Matthew Brost 2023-03-30  352  	xe_bo_vunmap(m->pt_bo);
dd08ebf6c3525a Matthew Brost 2023-03-30  353  }
dd08ebf6c3525a Matthew Brost 2023-03-30  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
