Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233542048
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765603567; cv=none; b=IjhdIjhQLKRI/TCF1Hgb+s+GQjJyg7JNC0ch6n09dL/H5Xxbx56teLrqen2EQvDlrqLX4u+poMACNRgVSDGY8Ws2XGQHlCG0mN1ySjGxWPF/raNJ/y6sJAedjpOWOPn8hTld0PxQZqGOIeUKFRVGfQbRCuPoYWrun0XoTyQEe1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765603567; c=relaxed/simple;
	bh=KmjGTFHaqQR1WrckmIoRogcU406gVt3Uz7KLl/r1q2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qgBqx3VCIixFds7/+9zfZR2CYgsRN5lvlwd+Co5Q5lLJhhDgkFejVd4CPM2gncijBUZflsOP7yXU7y690rHhntFsA50os5/0f/jLv9yY63m09tdiY58l7/luowz7b4Qf/+O2r5GpSZs8CoA7yUVeX2+Qiv8P8DG2oinpHgPh6vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9ZGcrsY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9ZGcrsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765603564; x=1797139564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmjGTFHaqQR1WrckmIoRogcU406gVt3Uz7KLl/r1q2k=;
  b=A9ZGcrsYOyruwYk1NKgTkdrfrVXq5io/jh3156vTm8HKlPO8q72GEsvy
   HPkh80+Mv0uCJFL1YY5zI/CYgXxqSuvB50wD/Q3R8D63cJY0JX1PNVamQ
   dUOS4sz1/RErumj+uUDEn4u+soRqswi8i0Qaf8d6mLHzC2a2w5tIV9tJe
   61158ffSoMAS4tbMHfwOAbSSurhFRpU4qAyjmrw3JIN1hKlvyZnljPtyc
   RpiORpMl93KgTl5UcYqY8aZqXRlMtfcp5Lsj1N1+im4IxNnlhxVQLO2UF
   yxPzqnEYByfaN9hTIMYPvAbSQ09LW0ch2ArsmSyMUpgFqbF1aLLhMPtph
   w==;
X-CSE-ConnectionGUID: vv0+s9TvT+WsuWJuywtcXw==
X-CSE-MsgGUID: 6GMy6IEjRj+SOKeF0yRwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67478170"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67478170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:26:03 -0800
X-CSE-ConnectionGUID: b+lxemTKStW58XqbrPei/w==
X-CSE-MsgGUID: VnEPT/1pTGCzLnwR4awE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198085658"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 21:26:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUI8m-0000000076b-00vV;
	Sat, 13 Dec 2025 05:26:00 +0000
Date: Sat, 13 Dec 2025 13:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:4340 xe_vm_alloc_vma() error:
 uninitialized symbol 'default_pat'.
Message-ID: <202512131315.hRMaRp0A-lkp@intel.com>
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
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: a2eb8aec3ebe474ce0fe0b6ebb18aade8c1a5c00 drm/xe: Reset VMA attributes to default in SVM garbage collector
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131315.hRMaRp0A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131315.hRMaRp0A-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:4340 xe_vm_alloc_vma() error: uninitialized symbol 'default_pat'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2532 new_vma() error: we previously assumed 'bo' could be null (see line 2506)
drivers/gpu/drm/xe/xe_vm.c:2995 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:3073 op_lock_and_prep() error: uninitialized symbol 'region'.
drivers/gpu/drm/xe/xe_vm.c:3991 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4206 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/default_pat +4340 drivers/gpu/drm/xe/xe_vm.c

d6db171167f886d Himal Prasad Ghimiray 2025-08-21  4293  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4294  static int xe_vm_alloc_vma(struct xe_vm *vm,
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4295  			   struct drm_gpuvm_map_req *map_req,
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4296  			   bool is_madvise)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4297  {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4298  	struct xe_vma_ops vops;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4299  	struct drm_gpuva_ops *ops = NULL;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4300  	struct drm_gpuva_op *__op;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4301  	bool is_cpu_addr_mirror = false;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4302  	bool remap_op = false;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4303  	struct xe_vma_mem_attr tmp_attr;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4304  	u16 default_pat;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4305  	int err;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4306  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4307  	lockdep_assert_held_write(&vm->lock);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4308  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4309  	if (is_madvise)
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4310  		ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4311  	else
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4312  		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4313  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4314  	if (IS_ERR(ops))
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4315  		return PTR_ERR(ops);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4316  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4317  	if (list_empty(&ops->list)) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4318  		err = 0;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4319  		goto free_ops;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4320  	}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4321  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4322  	drm_gpuva_for_each_op(__op, ops) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4323  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4324  		struct xe_vma *vma = NULL;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4325  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4326  		if (!is_madvise) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4327  			if (__op->op == DRM_GPUVA_OP_UNMAP) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4328  				vma = gpuva_to_vma(op->base.unmap.va);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4329  				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4330  				default_pat = vma->attr.default_pat_index;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4331  			}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4332  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4333  			if (__op->op == DRM_GPUVA_OP_REMAP) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4334  				vma = gpuva_to_vma(op->base.remap.unmap->va);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4335  				default_pat = vma->attr.default_pat_index;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4336  			}
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4337  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4338  			if (__op->op == DRM_GPUVA_OP_MAP) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4339  				op->map.is_cpu_addr_mirror = true;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21 @4340  				op->map.pat_index = default_pat;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4341  			}
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4342  		} else {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4343  			if (__op->op == DRM_GPUVA_OP_REMAP) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4344  				vma = gpuva_to_vma(op->base.remap.unmap->va);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4345  				xe_assert(vm->xe, !remap_op);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4346  				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4347  				remap_op = true;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4348  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4349  				if (xe_vma_is_cpu_addr_mirror(vma))
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4350  					is_cpu_addr_mirror = true;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4351  				else
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4352  					is_cpu_addr_mirror = false;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4353  			}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4354  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4355  			if (__op->op == DRM_GPUVA_OP_MAP) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4356  				xe_assert(vm->xe, remap_op);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4357  				remap_op = false;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4358  				/*
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4359  				 * In case of madvise ops DRM_GPUVA_OP_MAP is
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4360  				 * always after DRM_GPUVA_OP_REMAP, so ensure
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4361  				 * we assign op->map.is_cpu_addr_mirror true
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4362  				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4363  				 */
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4364  				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4365  			}
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4366  		}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4367  		print_op(vm->xe, __op);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4368  	}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4369  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4370  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4371  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4372  	if (is_madvise)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4373  		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4374  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4375  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4376  	if (err)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4377  		goto unwind_ops;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4378  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4379  	xe_vm_lock(vm, false);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4380  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4381  	drm_gpuva_for_each_op(__op, ops) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4382  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4383  		struct xe_vma *vma;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4384  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4385  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4386  			vma = gpuva_to_vma(op->base.unmap.va);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4387  			/* There should be no unmap for madvise */
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4388  			if (is_madvise)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4389  				XE_WARN_ON("UNEXPECTED UNMAP");
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4390  
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4391  			xe_vma_destroy(vma, NULL);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4392  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4393  			vma = gpuva_to_vma(op->base.remap.unmap->va);
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4394  			/* In case of madvise ops Store attributes for REMAP UNMAPPED
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4395  			 * VMA, so they can be assigned to newly MAP created vma.
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4396  			 */
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4397  			if (is_madvise)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4398  				tmp_attr = vma->attr;
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4399  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4400  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4401  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4402  			vma = op->map.vma;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4403  			/* In case of madvise call, MAP will always be follwed by REMAP.
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4404  			 * Therefore temp_attr will always have sane values, making it safe to
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4405  			 * copy them to new vma.
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4406  			 */
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4407  			if (is_madvise)
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4408  				vma->attr = tmp_attr;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4409  		}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4410  	}
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4411  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4412  	xe_vm_unlock(vm);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4413  	drm_gpuva_ops_free(&vm->gpuvm, ops);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4414  	return 0;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4415  
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4416  unwind_ops:
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4417  	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4418  free_ops:
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4419  	drm_gpuva_ops_free(&vm->gpuvm, ops);
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4420  	return err;
186b526abd6c207 Himal Prasad Ghimiray 2025-08-21  4421  }
a2eb8aec3ebe474 Himal Prasad Ghimiray 2025-08-21  4422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
