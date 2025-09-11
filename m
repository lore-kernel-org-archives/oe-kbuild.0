Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08A2DC773
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616212; cv=none; b=izkeSIkCrkU6MITvqRrc1NibWUZSQv3jGL71My5y35hzdWobR0/ssUqT3+Snigr5d6LcuvzXqlFlYQcMbJRxrtTvATgcuiJFsffpT/eiPP1StbKA9rnl04lJJMB5iJStPg7ZKGsxZ1fZtqLQX1o1fRpFijzN74ovK6XRQI9pirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616212; c=relaxed/simple;
	bh=e+nX0y6jvIbhstczMTnRUqgjh+pyML9VEwckIrRtO8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsHecJO55jeoll7xw4E67k41BLpTOIojkFOD4xBk3zi718KZFKdVD+gOGjpafsNjo5IWiuIYTMEKOtYWw9vmNUUlWUhzz/b5wCsn7enmwe7c84Yd3Ty+Pvz6J7zPJlqhVDoOKGUVdso5STb+LOki/xuvAVhoUcxa4qRx5273i5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V04Hc/vg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V04Hc/vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757616210; x=1789152210;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e+nX0y6jvIbhstczMTnRUqgjh+pyML9VEwckIrRtO8Y=;
  b=V04Hc/vgSY4v6n4xmdEWwwyJjAoHRZPO0nsK06tz+ms9yVuB9lso9czN
   CmrwV8aXWNwCn2lGlWii0avtnKR8thulw92TvPgJZ3T9McI4cj1m1hpCA
   8rxlnGguQMUrKx9t/Wluf10HQCFiq1FHoDQWjKz6OMYAZC3G9yZi4yLvb
   vPIh6ojRWOgzJYLHMnYPI9C0QHiszzT25Mo1E7BvgjN3tm6s4QzvJvGx7
   O/tu0CM4M0+6MlZn2+t2sEztbwa5kX14coMRVNfJEWCMxZjjFy2PKXRGS
   HGyZSpDgIZjJlyDRGshtSQ59To+aN9IE+b7Yf06XD1/LVOi5vSBoCjVEm
   g==;
X-CSE-ConnectionGUID: 6qBEy+5DTJG6R5Dyw2GV1w==
X-CSE-MsgGUID: 2UmZh1EuSqSPQU1bS39jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="62591299"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="62591299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 11:43:29 -0700
X-CSE-ConnectionGUID: 6oplMOEnQeq9s4CYJAwfdg==
X-CSE-MsgGUID: lprc+ijdRf6gbBSq3oiI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="174201731"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2025 11:43:28 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwmGU-0000Zg-0z;
	Thu, 11 Sep 2025 18:43:26 +0000
Date: Fri, 12 Sep 2025 02:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7719/8263] drivers/gpu/drm/xe/xe_vm.c:2408
 new_vma() error: uninitialized symbol 'vma'.
Message-ID: <202509120259.hEa4EM5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: 8f25e5abcbfb9cbcd923021774f2e785db3f7f55 [7719/8263] drm/xe: Convert existing drm_exec transactions for exhaustive eviction
:::::: branch date: 12 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120259.hEa4EM5r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120259.hEa4EM5r-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2408 new_vma() error: uninitialized symbol 'vma'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2858 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:2936 op_lock_and_prep() error: uninitialized symbol 'region'.
drivers/gpu/drm/xe/xe_vm.c:3230 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.
drivers/gpu/drm/xe/xe_vm.c:3866 xe_vm_range_tilemask_tlb_inval() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4081 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/xe_vm.c:4215 xe_vm_alloc_vma() error: uninitialized symbol 'default_pat'.

vim +/vma +2408 drivers/gpu/drm/xe/xe_vm.c

b06d47be7c8316 Matthew Brost         2023-07-07  2349  
b06d47be7c8316 Matthew Brost         2023-07-07  2350  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
29c39c56a08b23 Himal Prasad Ghimiray 2025-08-21  2351  			      struct xe_vma_mem_attr *attr, unsigned int flags)
b06d47be7c8316 Matthew Brost         2023-07-07  2352  {
b06d47be7c8316 Matthew Brost         2023-07-07  2353  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2354  	struct xe_validation_ctx ctx;
24f947d58fe554 Thomas Hellström      2023-12-12  2355  	struct drm_exec exec;
b06d47be7c8316 Matthew Brost         2023-07-07  2356  	struct xe_vma *vma;
33991ae8f40a82 Matthew Brost         2024-06-17  2357  	int err = 0;
b06d47be7c8316 Matthew Brost         2023-07-07  2358  
b06d47be7c8316 Matthew Brost         2023-07-07  2359  	lockdep_assert_held_write(&vm->lock);
b06d47be7c8316 Matthew Brost         2023-07-07  2360  
b06d47be7c8316 Matthew Brost         2023-07-07  2361  	if (bo) {
24f947d58fe554 Thomas Hellström      2023-12-12  2362  		err = 0;
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2363  		xe_validation_guard(&ctx, &vm->xe->val, &exec,
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2364  				    (struct xe_val_flags) {.interruptible = true}, err) {
24f947d58fe554 Thomas Hellström      2023-12-12  2365  			if (!bo->vm) {
24f947d58fe554 Thomas Hellström      2023-12-12  2366  				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
24f947d58fe554 Thomas Hellström      2023-12-12  2367  				drm_exec_retry_on_contention(&exec);
24f947d58fe554 Thomas Hellström      2023-12-12  2368  			}
24f947d58fe554 Thomas Hellström      2023-12-12  2369  			if (!err) {
24f947d58fe554 Thomas Hellström      2023-12-12  2370  				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
24f947d58fe554 Thomas Hellström      2023-12-12  2371  				drm_exec_retry_on_contention(&exec);
24f947d58fe554 Thomas Hellström      2023-12-12  2372  			}
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2373  			if (err)
b06d47be7c8316 Matthew Brost         2023-07-07  2374  				return ERR_PTR(err);
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2375  
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2376  			vma = xe_vma_create(vm, bo, op->gem.offset,
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2377  					    op->va.addr, op->va.addr +
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2378  					    op->va.range - 1, attr, flags);
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2379  			if (IS_ERR(vma))
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2380  				return vma;
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2381  
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2382  			if (!bo->vm) {
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2383  				err = add_preempt_fences(vm, bo);
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2384  				if (err) {
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2385  					prep_vma_destroy(vm, vma, false);
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2386  					xe_vma_destroy(vma, NULL);
dd08ebf6c3525a Matthew Brost         2023-03-30  2387  				}
24f947d58fe554 Thomas Hellström      2023-12-12  2388  			}
24f947d58fe554 Thomas Hellström      2023-12-12  2389  		}
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2390  		if (err)
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2391  			return ERR_PTR(err);
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2392  	} else {
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2393  		vma = xe_vma_create(vm, NULL, op->gem.offset,
b06d47be7c8316 Matthew Brost         2023-07-07  2394  				    op->va.addr, op->va.addr +
29c39c56a08b23 Himal Prasad Ghimiray 2025-08-21  2395  				    op->va.range - 1, attr, flags);
33991ae8f40a82 Matthew Brost         2024-06-17  2396  		if (IS_ERR(vma))
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2397  			return vma;
dd08ebf6c3525a Matthew Brost         2023-03-30  2398  
33991ae8f40a82 Matthew Brost         2024-06-17  2399  		if (xe_vma_is_userptr(vma))
5bd24e78829ad5 Thomas Hellström      2024-01-31  2400  			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
8f25e5abcbfb9c Thomas Hellström      2025-09-08  2401  	}
b06d47be7c8316 Matthew Brost         2023-07-07  2402  	if (err) {
b06d47be7c8316 Matthew Brost         2023-07-07  2403  		prep_vma_destroy(vm, vma, false);
b06d47be7c8316 Matthew Brost         2023-07-07  2404  		xe_vma_destroy_unlocked(vma);
33991ae8f40a82 Matthew Brost         2024-06-17  2405  		vma = ERR_PTR(err);
dd08ebf6c3525a Matthew Brost         2023-03-30  2406  	}
dd08ebf6c3525a Matthew Brost         2023-03-30  2407  
b06d47be7c8316 Matthew Brost         2023-07-07 @2408  	return vma;
b06d47be7c8316 Matthew Brost         2023-07-07  2409  }
b06d47be7c8316 Matthew Brost         2023-07-07  2410  

:::::: The code at line 2408 was first introduced by commit
:::::: b06d47be7c83165d3b3e45e1d5f9520b79c7f5cc drm/xe: Port Xe to GPUVA

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
