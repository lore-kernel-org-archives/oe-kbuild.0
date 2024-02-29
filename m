Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F6200CD
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247454; cv=none; b=G4RaYVK0Mp+2eBR/KGdn2o4zLa1ItPE2H4PygCHOljZRSeXgvnef0Jf2Ir6l78DLWX7/oNA3I92U9M4PZE/KJm/bSalQqJa91XNzqpIvB2eBm/A/j1TJAUm/3XgbJefEQFSKr495zN4CdzBMB2GaAQhkHt2eBnHCEUuiaEvrx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247454; c=relaxed/simple;
	bh=b1y3Id/1xT7YwvOLey2Yolz36zWUvtukwQsWd9STHhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YK3bTcoGxzUxmJ4ZkO3ANQ6veP6Pmz+LWTVZcNG/tl+1dMkfZI7NmIvUZT+WILlaRUaev4Kii6DB6/5Ueg/aAzwHXck8bqjLGQWxUbsLLJf8D3BUoQhXwe9bmyX4nX1Z/rL94zBsK9V3Puc+zcPs1OelvXz3U2ledTAY9B/jcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCdQ+Mex; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCdQ+Mex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709247451; x=1740783451;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b1y3Id/1xT7YwvOLey2Yolz36zWUvtukwQsWd9STHhQ=;
  b=XCdQ+MexxyScP+eyb/xCj9PXn18pwHRPLJMb4nelzIeZre3eZSgG8yEu
   92P7g8IPGc09qD5TcwgeejLJ0at/K+8mPgMXh38upSB7jtFaHcdfYK86f
   KNIsCfJOI5gviR/mpIKJ28jraOHLk6WZPu43YGYfGfJ0aypN8Em/UuzRn
   dU6xFhWUpIpXj6933jY8feYS/7La1ejFIvV8gSGTyP76oVM6fGdpRX8nI
   Oizr6KCI4zAZbu/ayll9xvAL+rgbBJw0nNP/LUoYUHvHE3L4pX5Zix3U+
   ys6l6W9s9fykJb54Squ95VrEnMeZWF/595ciQ6KYPty1S9c8LoYdiagHi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3609889"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3609889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 14:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7936772"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 14:57:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpKk-000DLL-1X;
	Thu, 29 Feb 2024 22:57:08 +0000
Date: Fri, 1 Mar 2024 06:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830]
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:576 amdgpu_bo_create() error:
 kvzalloc() does not make sense for no sleep code
Message-ID: <202403010601.8TU0rJUr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240301/202403010601.8TU0rJUr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403010601.8TU0rJUr-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:576 amdgpu_bo_create() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c:128 amdgpu_reset_create_reset_domain() error: kvzalloc() does not make sense for no sleep code
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:62 nvkm_vmm_pt_new() error: kvcalloc() does not make sense for no sleep code
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.c:100 nvkm_chid_new() error: kvzalloc() does not make sense for no sleep code

vim +576 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c

3d1b8ec76b8f4f Andrey Grodzovsky     2019-07-24  526  
cd2454d6cd970d Nirmoy Das            2021-04-21  527  /**
cd2454d6cd970d Nirmoy Das            2021-04-21  528   * amdgpu_bo_create - create an &amdgpu_bo buffer object
cd2454d6cd970d Nirmoy Das            2021-04-21  529   * @adev: amdgpu device object
cd2454d6cd970d Nirmoy Das            2021-04-21  530   * @bp: parameters to be used for the buffer object
cd2454d6cd970d Nirmoy Das            2021-04-21  531   * @bo_ptr: pointer to the buffer object pointer
cd2454d6cd970d Nirmoy Das            2021-04-21  532   *
cd2454d6cd970d Nirmoy Das            2021-04-21  533   * Creates an &amdgpu_bo buffer object.
cd2454d6cd970d Nirmoy Das            2021-04-21  534   *
cd2454d6cd970d Nirmoy Das            2021-04-21  535   * Returns:
cd2454d6cd970d Nirmoy Das            2021-04-21  536   * 0 for success or a negative error code on failure.
cd2454d6cd970d Nirmoy Das            2021-04-21  537   */
cd2454d6cd970d Nirmoy Das            2021-04-21  538  int amdgpu_bo_create(struct amdgpu_device *adev,
a906dbb1e20f57 Chunming Zhou         2018-04-16  539  			       struct amdgpu_bo_param *bp,
7e5a547f64af66 Chunming Zhou         2015-04-24  540  			       struct amdgpu_bo **bo_ptr)
d38ceaf99ed015 Alex Deucher          2015-04-20  541  {
9251859a9adb8e Roger He              2017-12-08  542  	struct ttm_operation_ctx ctx = {
a906dbb1e20f57 Chunming Zhou         2018-04-16  543  		.interruptible = (bp->type != ttm_bo_type_kernel),
061468c405fdf3 Christian König       2019-09-16  544  		.no_wait_gpu = bp->no_wait_gpu,
586052b0a6062e Christian König       2020-11-02  545  		/* We opt to avoid OOM on system pages allocations */
586052b0a6062e Christian König       2020-11-02  546  		.gfp_retry_mayfail = true,
c44dfe4de05391 Christian König       2020-11-02  547  		.allow_res_evict = bp->type != ttm_bo_type_kernel,
c44dfe4de05391 Christian König       2020-11-02  548  		.resv = bp->resv
9251859a9adb8e Roger He              2017-12-08  549  	};
d38ceaf99ed015 Alex Deucher          2015-04-20  550  	struct amdgpu_bo *bo;
a906dbb1e20f57 Chunming Zhou         2018-04-16  551  	unsigned long page_align, size = bp->size;
d38ceaf99ed015 Alex Deucher          2015-04-20  552  	int r;
d38ceaf99ed015 Alex Deucher          2015-04-20  553  
fe57085a36de58 Marek Olšák           2019-01-22  554  	/* Note that GDS/GWS/OA allocates 1 page per byte/resource. */
fe57085a36de58 Marek Olšák           2019-01-22  555  	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
fe57085a36de58 Marek Olšák           2019-01-22  556  		/* GWS and OA don't need any alignment. */
fe57085a36de58 Marek Olšák           2019-01-22  557  		page_align = bp->byte_align;
77a2faa55c1a49 Christian König       2018-09-14  558  		size <<= PAGE_SHIFT;
e3c92eb4a84fb0 Somalapuram Amaranath 2022-10-27  559  
fe57085a36de58 Marek Olšák           2019-01-22  560  	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
fe57085a36de58 Marek Olšák           2019-01-22  561  		/* Both size and alignment must be a multiple of 4. */
fe57085a36de58 Marek Olšák           2019-01-22  562  		page_align = ALIGN(bp->byte_align, 4);
fe57085a36de58 Marek Olšák           2019-01-22  563  		size = ALIGN(size, 4) << PAGE_SHIFT;
fe57085a36de58 Marek Olšák           2019-01-22  564  	} else {
fe57085a36de58 Marek Olšák           2019-01-22  565  		/* Memory should be aligned at least to a page size. */
fe57085a36de58 Marek Olšák           2019-01-22  566  		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
d38ceaf99ed015 Alex Deucher          2015-04-20  567  		size = ALIGN(size, PAGE_SIZE);
fe57085a36de58 Marek Olšák           2019-01-22  568  	}
d38ceaf99ed015 Alex Deucher          2015-04-20  569  
a906dbb1e20f57 Chunming Zhou         2018-04-16  570  	if (!amdgpu_bo_validate_size(adev, size, bp->domain))
79c631239a83ae Andrey Grodzovsky     2017-11-10  571  		return -ENOMEM;
79c631239a83ae Andrey Grodzovsky     2017-11-10  572  
9fd5543e9552ac Nirmoy Das            2021-03-08  573  	BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
d38ceaf99ed015 Alex Deucher          2015-04-20  574  
9fd5543e9552ac Nirmoy Das            2021-03-08  575  	*bo_ptr = NULL;
31c759bbe38351 Changfeng             2021-06-02 @576  	bo = kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
5a8c102ac471c5 Chunming Zhou         2018-03-16  577  	if (bo == NULL)
5a8c102ac471c5 Chunming Zhou         2018-03-16  578  		return -ENOMEM;
4a580877bdcb83 Luben Tuikov          2020-08-24  579  	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
646b90259842fa Christian König       2018-09-10  580  	bo->vm_bo = NULL;
3f188453faf7ba Chunming Zhou         2018-04-17  581  	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
aa2b2e2822831d Chunming Zhou         2018-04-17  582  		bp->domain;
0808210478c766 Christian König       2018-04-10  583  	bo->allowed_domains = bo->preferred_domains;
a906dbb1e20f57 Chunming Zhou         2018-04-16  584  	if (bp->type != ttm_bo_type_kernel &&
fab2cc83358398 Christian König       2022-05-06  585  	    !(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE) &&
0808210478c766 Christian König       2018-04-10  586  	    bo->allowed_domains == AMDGPU_GEM_DOMAIN_VRAM)
0808210478c766 Christian König       2018-04-10  587  		bo->allowed_domains |= AMDGPU_GEM_DOMAIN_GTT;
d38ceaf99ed015 Alex Deucher          2015-04-20  588  
a906dbb1e20f57 Chunming Zhou         2018-04-16  589  	bo->flags = bp->flags;
a187f17f0e15a0 Oded Gabbay           2016-01-30  590  
3ebfd221c1a83e Philip Yang           2023-03-08  591  	if (adev->gmc.mem_partitions)
3ebfd221c1a83e Philip Yang           2023-03-08  592  		/* For GPUs with spatial partitioning, bo->xcp_id=-1 means any partition */
3ebfd221c1a83e Philip Yang           2023-03-08  593  		bo->xcp_id = bp->xcp_id_plus1 - 1;
3ebfd221c1a83e Philip Yang           2023-03-08  594  	else
3ebfd221c1a83e Philip Yang           2023-03-08  595  		/* For GPUs without spatial partitioning */
3ebfd221c1a83e Philip Yang           2023-03-08  596  		bo->xcp_id = 0;
f24e924b7e8aba Philip Yang           2023-01-26  597  
3d1b8ec76b8f4f Andrey Grodzovsky     2019-07-24  598  	if (!amdgpu_bo_support_uswc(bo->flags))
a187f17f0e15a0 Oded Gabbay           2016-01-30  599  		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_GTT_USWC;
a187f17f0e15a0 Oded Gabbay           2016-01-30  600  
fc6ea4bee13071 Felix Kuehling        2022-01-25  601  	if (adev->ras_enabled)
fc6ea4bee13071 Felix Kuehling        2022-01-25  602  		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
fc6ea4bee13071 Felix Kuehling        2022-01-25  603  
c09312a6532a9a Christian König       2017-09-12  604  	bo->tbo.bdev = &adev->mman.bdev;
47722220660cfb Christian König       2022-12-12  605  	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
47722220660cfb Christian König       2022-12-12  606  			  AMDGPU_GEM_DOMAIN_GDS))
47722220660cfb Christian König       2022-12-12  607  		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
47722220660cfb Christian König       2022-12-12  608  	else
c704ab18e0a26a Christian König       2018-07-16  609  		amdgpu_bo_placement_from_domain(bo, bp->domain);
a50cb94819f81b Junwei Zhang          2018-05-11  610  	if (bp->type == ttm_bo_type_kernel)
a50cb94819f81b Junwei Zhang          2018-05-11  611  		bo->tbo.priority = 1;
0808210478c766 Christian König       2018-04-10  612  
23e24fbb7695d4 Nirmoy Das            2021-06-14  613  	if (!bp->destroy)
23e24fbb7695d4 Nirmoy Das            2021-06-14  614  		bp->destroy = &amdgpu_bo_destroy;
23e24fbb7695d4 Nirmoy Das            2021-06-14  615  
347987a2cf0d14 Christian König       2022-02-18  616  	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, bp->type,
f07069da6b4c5f Christian König       2020-11-17  617  				 &bo->placement, page_align, &ctx,  NULL,
23e24fbb7695d4 Nirmoy Das            2021-06-14  618  				 bp->resv, bp->destroy);
0808210478c766 Christian König       2018-04-10  619  	if (unlikely(r != 0))
a695e43712242c Christian König       2017-10-31  620  		return r;
a695e43712242c Christian König       2017-10-31  621  
c8c5e569c5b0c9 Andrey Grodzovsky     2018-06-12  622  	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
d3116756a710e3 Christian König       2021-04-12  623  	    bo->tbo.resource->mem_type == TTM_PL_VRAM &&
aed01a68047bd9 Somalapuram Amaranath 2023-02-08  624  	    amdgpu_bo_in_cpu_visible_vram(bo))
6af046d26f3427 Christian König       2017-04-27  625  		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved,
6af046d26f3427 Christian König       2017-04-27  626  					     ctx.bytes_moved);
00f06b246a3056 John Brooks           2017-06-27  627  	else
6af046d26f3427 Christian König       2017-04-27  628  		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved, 0);
fad061270ac43f Samuel Pitoiset       2017-02-09  629  
a906dbb1e20f57 Chunming Zhou         2018-04-16  630  	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
d3116756a710e3 Christian König       2021-04-12  631  	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
f54d1867005c33 Chris Wilson          2016-10-25  632  		struct dma_fence *fence;
4fea83ff0f6167 Flora Cui             2016-07-20  633  
c3aaca43fb07ce Mukul Joshi           2023-05-17  634  		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
c3af1258a7c784 Christian König       2016-11-17  635  		if (unlikely(r))
c3af1258a7c784 Christian König       2016-11-17  636  			goto fail_unreserve;
c3af1258a7c784 Christian König       2016-11-17  637  
8bb31587820a6e Christian König       2021-11-23  638  		dma_resv_add_fence(bo->tbo.base.resv, fence,
8bb31587820a6e Christian König       2021-11-23  639  				   DMA_RESV_USAGE_KERNEL);
f54d1867005c33 Chris Wilson          2016-10-25  640  		dma_fence_put(fence);
4fea83ff0f6167 Flora Cui             2016-07-20  641  	}
a906dbb1e20f57 Chunming Zhou         2018-04-16  642  	if (!bp->resv)
59c66c911fa245 Nicolai Hähnle        2017-02-16  643  		amdgpu_bo_unreserve(bo);
d38ceaf99ed015 Alex Deucher          2015-04-20  644  	*bo_ptr = bo;
d38ceaf99ed015 Alex Deucher          2015-04-20  645  
d38ceaf99ed015 Alex Deucher          2015-04-20  646  	trace_amdgpu_bo_create(bo);
d38ceaf99ed015 Alex Deucher          2015-04-20  647  
96cf8271df546d John Brooks           2017-06-30  648  	/* Treat CPU_ACCESS_REQUIRED only as a hint if given by UMD */
a906dbb1e20f57 Chunming Zhou         2018-04-16  649  	if (bp->type == ttm_bo_type_device)
96cf8271df546d John Brooks           2017-06-30  650  		bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
96cf8271df546d John Brooks           2017-06-30  651  
d38ceaf99ed015 Alex Deucher          2015-04-20  652  	return 0;
4fea83ff0f6167 Flora Cui             2016-07-20  653  
4fea83ff0f6167 Flora Cui             2016-07-20  654  fail_unreserve:
a906dbb1e20f57 Chunming Zhou         2018-04-16  655  	if (!bp->resv)
52791eeec1d9f4 Christian König       2019-08-11  656  		dma_resv_unlock(bo->tbo.base.resv);
4fea83ff0f6167 Flora Cui             2016-07-20  657  	amdgpu_bo_unref(&bo);
4fea83ff0f6167 Flora Cui             2016-07-20  658  	return r;
d38ceaf99ed015 Alex Deucher          2015-04-20  659  }
d38ceaf99ed015 Alex Deucher          2015-04-20  660  

:::::: The code at line 576 was first introduced by commit
:::::: 31c759bbe38351cb46535c48293efe8860e080b4 drm/amdgpu: switch kzalloc to kvzalloc in amdgpu_bo_create

:::::: TO: Changfeng <Changfeng.Zhu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
