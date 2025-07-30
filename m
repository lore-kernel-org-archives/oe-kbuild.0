Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF48DF42
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 04:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753848449; cv=none; b=Sbd8+y5jv1vyr4vSkSC3rnE/6djj0pm9x7VolroIx9mbn+v1apTr/26es0VZy4/93O7ChJEI41sS0lezQHMFEp8gva6dOBmq/HAXEsQADk/NvxvKPOBDplK3VdRJf71w1VoN7bxOwPR9O0fuEqapz3Kv8ARc9ESITT275y2j9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753848449; c=relaxed/simple;
	bh=gJ4LFRV8swVMuuMAlWiGJmMWZWdNTNWIsN1RYU81mSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qy4RB8W0zTo48rsOuUkRR358CX6RQeS84NzmilYJe4OZhHytojBr4/6Vb45g2fHFm9YY8poI9KWADZP1vKUB/WpPRfJQwTjmpjgcH9orsOuKMaca8QCSUAAcUvJtIkcQEioQ5+gEXD8CL/8lWZ08iEgEZuIX0iWuYrdpraSbQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFrItqT5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFrItqT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753848447; x=1785384447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJ4LFRV8swVMuuMAlWiGJmMWZWdNTNWIsN1RYU81mSc=;
  b=nFrItqT5sH7GgCYim9LZc3DT3UActDkODlcA6ENFOBe+37Zfj3i5jIr3
   /UrgPj/0FNK+fUdjYNd+DZl4PLhY+lJZ7+a7Q9Id9QBbiwmN9irkv6p8j
   oyTC08Gm7Ffo2aoc7qV4QZSgWRe+a2x8QSldPn0r38RBmtwDQD38pAsNk
   mCWyoIPCws3f+giSkt3+2t/pfiMwwiyxefni5U5pn31G/xnXN92S709MV
   etej3z0oBD3QMFucq+g8XXPiLy9XzisKl93nstTLnUD2AaQ1zsPuHtX2X
   7RfSMbTy581ZQmvzk5hI6nZxnIccLdtpeDts1xHtfU1ygr3UwYUxZvcT5
   g==;
X-CSE-ConnectionGUID: mbw0v+6kRaO6vg0R2i9FlA==
X-CSE-MsgGUID: LFtwofexTayrDvG7x0911A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67578871"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="67578871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 21:07:26 -0700
X-CSE-ConnectionGUID: MLBUSm/SSwycEnY1+Hnszg==
X-CSE-MsgGUID: sYNDlf4IRkCH0wuClMjKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167057908"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2025 21:07:24 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugy66-0001zo-10;
	Wed, 30 Jul 2025 04:07:22 +0000
Date: Wed, 30 Jul 2025 12:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11567/12827] drivers/gpu/drm/xe/xe_pt.c:2487
 xe_pt_update_ops_run() error: uninitialized symbol 'ifence'.
Message-ID: <202507301209.hFc4VENm-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: b8d5779eee382003b26b1a147071adf08c5d294c [11567/12827] drm/xe: Use GT TLB invalidation jobs in PT layer
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301209.hFc4VENm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507301209.hFc4VENm-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:2487 xe_pt_update_ops_run() error: uninitialized symbol 'ifence'.
drivers/gpu/drm/xe/xe_pt.c:2492 xe_pt_update_ops_run() error: uninitialized symbol 'mfence'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:762 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 753)
drivers/gpu/drm/xe/xe_pt.c:2070 op_prepare() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_pt.c:2294 op_commit() warn: iterator 'i' not incremented

vim +/ifence +2487 drivers/gpu/drm/xe/xe_pt.c

04e9c0ce19ac68a Matthew Brost   2024-07-03  2389  
e8babb280b5ef90 Matthew Brost   2024-07-03  2390  	if (pt_update_ops->needs_invalidation) {
b8d5779eee38200 Matthew Brost   2025-07-24  2391  		ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
b8d5779eee38200 Matthew Brost   2025-07-24  2392  						  tile->primary_gt,
b8d5779eee38200 Matthew Brost   2025-07-24  2393  						  pt_update_ops->start,
b8d5779eee38200 Matthew Brost   2025-07-24  2394  						  pt_update_ops->last,
b8d5779eee38200 Matthew Brost   2025-07-24  2395  						  vm->usm.asid);
b8d5779eee38200 Matthew Brost   2025-07-24  2396  		if (IS_ERR(ijob)) {
b8d5779eee38200 Matthew Brost   2025-07-24  2397  			err = PTR_ERR(ijob);
a708f6501c69255 Matthew Brost   2024-07-03  2398  			goto kill_vm_tile1;
a708f6501c69255 Matthew Brost   2024-07-03  2399  		}
b8d5779eee38200 Matthew Brost   2025-07-24  2400  		update.ijob = ijob;
b8d5779eee38200 Matthew Brost   2025-07-24  2401  
bf758226c7e6927 Matthew Brost   2024-08-26  2402  		if (tile->media_gt) {
b8d5779eee38200 Matthew Brost   2025-07-24  2403  			mjob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
b8d5779eee38200 Matthew Brost   2025-07-24  2404  							  tile->media_gt,
b8d5779eee38200 Matthew Brost   2025-07-24  2405  							  pt_update_ops->start,
b8d5779eee38200 Matthew Brost   2025-07-24  2406  							  pt_update_ops->last,
b8d5779eee38200 Matthew Brost   2025-07-24  2407  							  vm->usm.asid);
b8d5779eee38200 Matthew Brost   2025-07-24  2408  			if (IS_ERR(mjob)) {
b8d5779eee38200 Matthew Brost   2025-07-24  2409  				err = PTR_ERR(mjob);
b8d5779eee38200 Matthew Brost   2025-07-24  2410  				goto free_ijob;
bf758226c7e6927 Matthew Brost   2024-08-26  2411  			}
b8d5779eee38200 Matthew Brost   2025-07-24  2412  			update.mjob = mjob;
b8d5779eee38200 Matthew Brost   2025-07-24  2413  
bf758226c7e6927 Matthew Brost   2024-08-26  2414  			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
bf758226c7e6927 Matthew Brost   2024-08-26  2415  			if (!fences) {
bf758226c7e6927 Matthew Brost   2024-08-26  2416  				err = -ENOMEM;
b8d5779eee38200 Matthew Brost   2025-07-24  2417  				goto free_ijob;
bf758226c7e6927 Matthew Brost   2024-08-26  2418  			}
bf758226c7e6927 Matthew Brost   2024-08-26  2419  			cf = dma_fence_array_alloc(2);
bf758226c7e6927 Matthew Brost   2024-08-26  2420  			if (!cf) {
bf758226c7e6927 Matthew Brost   2024-08-26  2421  				err = -ENOMEM;
b8d5779eee38200 Matthew Brost   2025-07-24  2422  				goto free_ijob;
bf758226c7e6927 Matthew Brost   2024-08-26  2423  			}
bf758226c7e6927 Matthew Brost   2024-08-26  2424  		}
e8babb280b5ef90 Matthew Brost   2024-07-03  2425  	}
f4a8add94f2f28b Matthew Brost   2023-01-18  2426  
fd84041d094ce8f Matthew Brost   2023-07-19  2427  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
fd84041d094ce8f Matthew Brost   2023-07-19  2428  	if (!rfence) {
e8babb280b5ef90 Matthew Brost   2024-07-03  2429  		err = -ENOMEM;
b8d5779eee38200 Matthew Brost   2025-07-24  2430  		goto free_ijob;
fd84041d094ce8f Matthew Brost   2023-07-19  2431  	}
fd84041d094ce8f Matthew Brost   2023-07-19  2432  
e8babb280b5ef90 Matthew Brost   2024-07-03  2433  	fence = xe_migrate_update_pgtables(tile->migrate, &update);
e8babb280b5ef90 Matthew Brost   2024-07-03  2434  	if (IS_ERR(fence)) {
e8babb280b5ef90 Matthew Brost   2024-07-03  2435  		err = PTR_ERR(fence);
e8babb280b5ef90 Matthew Brost   2024-07-03  2436  		goto free_rfence;
e8babb280b5ef90 Matthew Brost   2024-07-03  2437  	}
f4a8add94f2f28b Matthew Brost   2023-01-18  2438  
a708f6501c69255 Matthew Brost   2024-07-03  2439  	/* Point of no return - VM killed if failure after this */
a708f6501c69255 Matthew Brost   2024-07-03  2440  	for (i = 0; i < pt_update_ops->current_op; ++i) {
a708f6501c69255 Matthew Brost   2024-07-03  2441  		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
a708f6501c69255 Matthew Brost   2024-07-03  2442  
a708f6501c69255 Matthew Brost   2024-07-03  2443  		xe_pt_commit(pt_op->vma, pt_op->entries,
a708f6501c69255 Matthew Brost   2024-07-03  2444  			     pt_op->num_entries, &pt_update_ops->deferred);
a708f6501c69255 Matthew Brost   2024-07-03  2445  		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
a708f6501c69255 Matthew Brost   2024-07-03  2446  	}
a708f6501c69255 Matthew Brost   2024-07-03  2447  
e8babb280b5ef90 Matthew Brost   2024-07-03  2448  	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
fd84041d094ce8f Matthew Brost   2023-07-19  2449  				  &xe_range_fence_kfree_ops,
e8babb280b5ef90 Matthew Brost   2024-07-03  2450  				  pt_update_ops->start,
e8babb280b5ef90 Matthew Brost   2024-07-03  2451  				  pt_update_ops->last, fence))
fd84041d094ce8f Matthew Brost   2023-07-19  2452  		dma_fence_wait(fence, false);
fd84041d094ce8f Matthew Brost   2023-07-19  2453  
b8d5779eee38200 Matthew Brost   2025-07-24  2454  	/* tlb invalidation must be done before signaling unbind/rebind */
b8d5779eee38200 Matthew Brost   2025-07-24  2455  	if (ijob) {
b8d5779eee38200 Matthew Brost   2025-07-24  2456  		struct dma_fence *__fence;
b8d5779eee38200 Matthew Brost   2025-07-24  2457  
b8d5779eee38200 Matthew Brost   2025-07-24  2458  		ifence = xe_gt_tlb_inval_job_push(ijob, tile->migrate, fence);
b8d5779eee38200 Matthew Brost   2025-07-24  2459  		__fence = ifence;
b8d5779eee38200 Matthew Brost   2025-07-24  2460  
b8d5779eee38200 Matthew Brost   2025-07-24  2461  		if (mjob) {
b8d5779eee38200 Matthew Brost   2025-07-24  2462  			fences[0] = ifence;
b8d5779eee38200 Matthew Brost   2025-07-24  2463  			mfence = xe_gt_tlb_inval_job_push(mjob, tile->migrate,
b8d5779eee38200 Matthew Brost   2025-07-24  2464  							  fence);
b8d5779eee38200 Matthew Brost   2025-07-24  2465  			fences[1] = mfence;
b8d5779eee38200 Matthew Brost   2025-07-24  2466  
bf758226c7e6927 Matthew Brost   2024-08-26  2467  			dma_fence_array_init(cf, 2, fences,
bf758226c7e6927 Matthew Brost   2024-08-26  2468  					     vm->composite_fence_ctx,
bf758226c7e6927 Matthew Brost   2024-08-26  2469  					     vm->composite_fence_seqno++,
bf758226c7e6927 Matthew Brost   2024-08-26  2470  					     false);
b8d5779eee38200 Matthew Brost   2025-07-24  2471  			__fence = &cf->base;
e8babb280b5ef90 Matthew Brost   2024-07-03  2472  		}
b8d5779eee38200 Matthew Brost   2025-07-24  2473  
b8d5779eee38200 Matthew Brost   2025-07-24  2474  		dma_fence_put(fence);
b8d5779eee38200 Matthew Brost   2025-07-24  2475  		fence = __fence;
bf758226c7e6927 Matthew Brost   2024-08-26  2476  	}
f4a8add94f2f28b Matthew Brost   2023-01-18  2477  
b8d5779eee38200 Matthew Brost   2025-07-24  2478  	if (!mjob) {
b06d47be7c83165 Matthew Brost   2023-07-07  2479  		dma_resv_add_fence(xe_vm_resv(vm), fence,
e8babb280b5ef90 Matthew Brost   2024-07-03  2480  				   pt_update_ops->wait_vm_bookkeep ?
e8babb280b5ef90 Matthew Brost   2024-07-03  2481  				   DMA_RESV_USAGE_KERNEL :
dd08ebf6c3525a7 Matthew Brost   2023-03-30  2482  				   DMA_RESV_USAGE_BOOKKEEP);
dd08ebf6c3525a7 Matthew Brost   2023-03-30  2483  
e8babb280b5ef90 Matthew Brost   2024-07-03  2484  		list_for_each_entry(op, &vops->list, link)
bf758226c7e6927 Matthew Brost   2024-08-26  2485  			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
bf758226c7e6927 Matthew Brost   2024-08-26  2486  	} else {
b8d5779eee38200 Matthew Brost   2025-07-24 @2487  		dma_resv_add_fence(xe_vm_resv(vm), ifence,
bf758226c7e6927 Matthew Brost   2024-08-26  2488  				   pt_update_ops->wait_vm_bookkeep ?
bf758226c7e6927 Matthew Brost   2024-08-26  2489  				   DMA_RESV_USAGE_KERNEL :
bf758226c7e6927 Matthew Brost   2024-08-26  2490  				   DMA_RESV_USAGE_BOOKKEEP);
bf758226c7e6927 Matthew Brost   2024-08-26  2491  
b8d5779eee38200 Matthew Brost   2025-07-24 @2492  		dma_resv_add_fence(xe_vm_resv(vm), mfence,
bf758226c7e6927 Matthew Brost   2024-08-26  2493  				   pt_update_ops->wait_vm_bookkeep ?
bf758226c7e6927 Matthew Brost   2024-08-26  2494  				   DMA_RESV_USAGE_KERNEL :
bf758226c7e6927 Matthew Brost   2024-08-26  2495  				   DMA_RESV_USAGE_BOOKKEEP);
bf758226c7e6927 Matthew Brost   2024-08-26  2496  
bf758226c7e6927 Matthew Brost   2024-08-26  2497  		list_for_each_entry(op, &vops->list, link)
b8d5779eee38200 Matthew Brost   2025-07-24  2498  			op_commit(vops->vm, tile, pt_update_ops, op, ifence,
b8d5779eee38200 Matthew Brost   2025-07-24  2499  				  mfence);
bf758226c7e6927 Matthew Brost   2024-08-26  2500  	}
e8babb280b5ef90 Matthew Brost   2024-07-03  2501  
7d1d48fb1724b3b Matthew Brost   2025-03-05  2502  	if (pt_update_ops->needs_svm_lock)
7d1d48fb1724b3b Matthew Brost   2025-03-05  2503  		xe_svm_notifier_unlock(vm);
e8babb280b5ef90 Matthew Brost   2024-07-03  2504  	if (pt_update_ops->needs_userptr_lock)
e8babb280b5ef90 Matthew Brost   2024-07-03  2505  		up_read(&vm->userptr.notifier_lock);
e8babb280b5ef90 Matthew Brost   2024-07-03  2506  
b8d5779eee38200 Matthew Brost   2025-07-24  2507  	xe_gt_tlb_inval_job_put(mjob);
b8d5779eee38200 Matthew Brost   2025-07-24  2508  	xe_gt_tlb_inval_job_put(ijob);
b8d5779eee38200 Matthew Brost   2025-07-24  2509  
e8babb280b5ef90 Matthew Brost   2024-07-03  2510  	return fence;
e8babb280b5ef90 Matthew Brost   2024-07-03  2511  
e8babb280b5ef90 Matthew Brost   2024-07-03  2512  free_rfence:
fd84041d094ce8f Matthew Brost   2023-07-19  2513  	kfree(rfence);
b8d5779eee38200 Matthew Brost   2025-07-24  2514  free_ijob:
bf758226c7e6927 Matthew Brost   2024-08-26  2515  	kfree(cf);
bf758226c7e6927 Matthew Brost   2024-08-26  2516  	kfree(fences);
b8d5779eee38200 Matthew Brost   2025-07-24  2517  	xe_gt_tlb_inval_job_put(mjob);
b8d5779eee38200 Matthew Brost   2025-07-24  2518  	xe_gt_tlb_inval_job_put(ijob);
a708f6501c69255 Matthew Brost   2024-07-03  2519  kill_vm_tile1:
badf45650bbd14e Matthew Brost   2025-06-13  2520  	if (err != -EAGAIN && err != -ENODATA && tile->id)
a708f6501c69255 Matthew Brost   2024-07-03  2521  		xe_vm_kill(vops->vm, false);
e8babb280b5ef90 Matthew Brost   2024-07-03  2522  
e8babb280b5ef90 Matthew Brost   2024-07-03  2523  	return ERR_PTR(err);
dd08ebf6c3525a7 Matthew Brost   2023-03-30  2524  }
9d42476f71a9a00 Francois Dugast 2024-11-13  2525  ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
dd08ebf6c3525a7 Matthew Brost   2023-03-30  2526  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
