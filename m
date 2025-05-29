Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1C230BE0
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 18:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748544768; cv=none; b=XdQFw8J6t8fZSjdLx2vUDMtP8bJAzp/HYD8GqNxIe82gZYDTUeZ63xUFaX4Mc0hV0T0Bd397edIQh0ci/dWA4DSecv//mW8c7uapm2MGiWxjcLG4+hcDI27w/OAIIjag3sLlBwW3G55udsngZ8503vYKbGjg7Ff81O0J1QLc/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748544768; c=relaxed/simple;
	bh=udwJog1/w49cFEoFPfKXz6DRNmLdj0941hYYMQlPnb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVhGbtVY4JuxCL3vFMfGP4aGIKzv65hmagADr6cZaFxBpKftNdSaZ1gGd9hGIFPNEn7mmgwUD0pmkNzqaqbQAL7Z/Hs0eCfUoQl8+p4r3WpAcCRWCETb54VxUEqeqLAEC1P8YitS+JOXTVE3JCyXr+3+6u3NoP7E68qFkCgsaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab0fmqBL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab0fmqBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748544766; x=1780080766;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=udwJog1/w49cFEoFPfKXz6DRNmLdj0941hYYMQlPnb0=;
  b=Ab0fmqBLM3Dcdnf9Nzkl4sN5ZNJfMOEumn6NcMCODO8rWkBlLs5ExWtG
   ONp3q2MP6Jo9phHWyt/KDxdKMUIjt+QKhdbo+ePym4Jt109PtoxQ1UXGH
   DShwtE6E4/On5CCVKNS8xQ4rTPDqiCeSg0tFrTkF5XYV+b8xb22aTXfz/
   O3OcjXJ+CH3FstiZcwP9T3fU+eF50KXUUoCN7HNjI2MA3uBvnqcjzTuap
   NjwWo7nfX7fxW9dQybyEyDVDhfbltpt4mMLvJNbEwKAiWl4ovip2ECwje
   g0niZclBSvnsbmEcTs5dTJqp2fv+TFHnG2OeNWpZt4JWY4aw9M/WLzPnI
   Q==;
X-CSE-ConnectionGUID: is319EDpS66RI0nMfuw8Fw==
X-CSE-MsgGUID: vbi1MHJvTDSQqmESXhvQyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54426650"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="54426650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:52:46 -0700
X-CSE-ConnectionGUID: va0F/UCfTTaW0kOm12kGbg==
X-CSE-MsgGUID: zXId/wwTSEK86CcRAbSBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="180851765"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2025 11:52:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKiMs-000X0K-0R;
	Thu, 29 May 2025 18:52:42 +0000
Date: Fri, 30 May 2025 02:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <202505300251.vkfxetWu-lkp@intel.com>
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
In-Reply-To: <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-6-himal.prasad.ghimiray@intel.com>
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-6-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 05/19] drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300251.vkfxetWu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300251.vkfxetWu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2492 new_vma() error: 'vma' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2480 new_vma() error: we previously assumed 'bo' could be null (see line 2454)
drivers/gpu/drm/xe/xe_vm.c:2919 prefetch_ranges() warn: iterator 'i' not incremented
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/gpu/drm/xe/xe_vm.c:4082 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/vma +2492 drivers/gpu/drm/xe/xe_vm.c

341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2443  
b06d47be7c83165 Matthew Brost         2023-07-07  2444  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2445  			      struct xe_vma_mem_attr attr, unsigned int flags)
b06d47be7c83165 Matthew Brost         2023-07-07  2446  {
b06d47be7c83165 Matthew Brost         2023-07-07  2447  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
24f947d58fe554c Thomas Hellström      2023-12-12  2448  	struct drm_exec exec;
b06d47be7c83165 Matthew Brost         2023-07-07  2449  	struct xe_vma *vma;
33991ae8f40a824 Matthew Brost         2024-06-17  2450  	int err = 0;
b06d47be7c83165 Matthew Brost         2023-07-07  2451  
b06d47be7c83165 Matthew Brost         2023-07-07  2452  	lockdep_assert_held_write(&vm->lock);
b06d47be7c83165 Matthew Brost         2023-07-07  2453  
b06d47be7c83165 Matthew Brost         2023-07-07  2454  	if (bo) {
d2197029026021e Dave Airlie           2023-12-22  2455  		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
24f947d58fe554c Thomas Hellström      2023-12-12  2456  		drm_exec_until_all_locked(&exec) {
24f947d58fe554c Thomas Hellström      2023-12-12  2457  			err = 0;
24f947d58fe554c Thomas Hellström      2023-12-12  2458  			if (!bo->vm) {
24f947d58fe554c Thomas Hellström      2023-12-12  2459  				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
24f947d58fe554c Thomas Hellström      2023-12-12  2460  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2461  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2462  			if (!err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2463  				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
24f947d58fe554c Thomas Hellström      2023-12-12  2464  				drm_exec_retry_on_contention(&exec);
24f947d58fe554c Thomas Hellström      2023-12-12  2465  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2466  			if (err) {
24f947d58fe554c Thomas Hellström      2023-12-12  2467  				drm_exec_fini(&exec);
b06d47be7c83165 Matthew Brost         2023-07-07  2468  				return ERR_PTR(err);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2469  			}
24f947d58fe554c Thomas Hellström      2023-12-12  2470  		}
24f947d58fe554c Thomas Hellström      2023-12-12  2471  	}
b06d47be7c83165 Matthew Brost         2023-07-07  2472  	vma = xe_vma_create(vm, bo, op->gem.offset,
b06d47be7c83165 Matthew Brost         2023-07-07  2473  			    op->va.addr, op->va.addr +
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2474  			    op->va.range - 1, attr.pat_index, flags);
33991ae8f40a824 Matthew Brost         2024-06-17  2475  	if (IS_ERR(vma))
33991ae8f40a824 Matthew Brost         2024-06-17  2476  		goto err_unlock;
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2477  
33991ae8f40a824 Matthew Brost         2024-06-17  2478  	if (xe_vma_is_userptr(vma))
5bd24e78829ad56 Thomas Hellström      2024-01-31  2479  		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
33991ae8f40a824 Matthew Brost         2024-06-17  2480  	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
b06d47be7c83165 Matthew Brost         2023-07-07  2481  		err = add_preempt_fences(vm, bo);
33991ae8f40a824 Matthew Brost         2024-06-17  2482  
33991ae8f40a824 Matthew Brost         2024-06-17  2483  err_unlock:
33991ae8f40a824 Matthew Brost         2024-06-17  2484  	if (bo)
33991ae8f40a824 Matthew Brost         2024-06-17  2485  		drm_exec_fini(&exec);
33991ae8f40a824 Matthew Brost         2024-06-17  2486  
b06d47be7c83165 Matthew Brost         2023-07-07  2487  	if (err) {
b06d47be7c83165 Matthew Brost         2023-07-07  2488  		prep_vma_destroy(vm, vma, false);
b06d47be7c83165 Matthew Brost         2023-07-07  2489  		xe_vma_destroy_unlocked(vma);
33991ae8f40a824 Matthew Brost         2024-06-17  2490  		vma = ERR_PTR(err);
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27  2491  	} else {
341ac2942dd2087 Himal Prasad Ghimiray 2025-05-27 @2492  		cp_vma_mem_attr(&vma->attr, &attr);
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2493  	}
dd08ebf6c3525a7 Matthew Brost         2023-03-30  2494  
b06d47be7c83165 Matthew Brost         2023-07-07  2495  	return vma;
b06d47be7c83165 Matthew Brost         2023-07-07  2496  }
b06d47be7c83165 Matthew Brost         2023-07-07  2497  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
