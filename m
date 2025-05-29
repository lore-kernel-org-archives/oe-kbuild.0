Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6883463B9
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560693; cv=none; b=LpYKWQIER2ja+fm4owoDpqQtlmyqv3YlxQCqcZN4IgByx5CJC8qNj2saPU9dLaOpjicAwTIOpCyiSM9Ia4geOynPWbXu/Z93NaWzVCAK7J8C3fvRHwKwYYqZV7tM2xYgNB7gKWurwl/l3Yknqo/Bh2EhPAilh3wFvR8L7mG+vGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560693; c=relaxed/simple;
	bh=eEiVKv2OrcPa/y1yc/1MpKPSp6ne/IGPQjV8HbEcFZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIEGR3MUZdYBQ1gQvrW9UI8UIaR5FVe0usaNtDaoEa8G8O5zTLDCopJ09gFl/3uYCUWQb3N8VmlVfM+sJ77nLwI/97TGYDQh/16ruAH5KesTN4KyjMOdMpg36S1XUj9f/ZJ0otSy2wiJh/+/2birBXma8RS1L3+RSxtqzpO8gnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnupgyz5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnupgyz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748560692; x=1780096692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEiVKv2OrcPa/y1yc/1MpKPSp6ne/IGPQjV8HbEcFZU=;
  b=dnupgyz54tKB7biBo2JF/MiNQH81/pyLOZfcsoV0WiIlLtkU1P2R6Lte
   ukYcmlQxNQAHq1vjZ94aXkDJE9hzmbq6kJDpQKVQ1Z6HCFVj2y/hC6bh/
   QhXMij9VA3VcASyH7ECwdbDmQr2a2NbfqLhA7rjD2ostOhayYI3vhjiqT
   nHMNT/metDyCIFoUSVUAIVhqJV1zkVYItid7paj8kqEpLLjw1hpjwpUup
   WGZTv+T4okd1IWmzhLv8TaUFJ3LHzEHH2cZPnk2iTIsaEuHgKp6LM9CND
   0z4mvpHeSHXnTvv2M02PphssjgHVZw82hwgKM3iuZ46HmRE4yVEAq9fNo
   A==;
X-CSE-ConnectionGUID: D4XsMjZPRZqvh+fNrnzaoQ==
X-CSE-MsgGUID: qKYlY07JSSycszKj9IVfOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76037373"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="76037373"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 16:18:10 -0700
X-CSE-ConnectionGUID: Zyhga4R3QkC76K2DkYbqIw==
X-CSE-MsgGUID: soTRe8dDThyeKerWbuXAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="148862076"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 16:18:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKmVi-000XBI-1P;
	Thu, 29 May 2025 23:18:06 +0000
Date: Fri, 30 May 2025 07:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <202505300720.uhAJlLnM-lkp@intel.com>
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
In-Reply-To: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250529]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250528-041919
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250527164003.1068118-10-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase of madvise call
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r073-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300720.uhAJlLnM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300720.uhAJlLnM-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:4255 xe_vm_alloc_madvise_vma() warn: variable dereferenced before check 'ops' (see line 4194)

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2480 new_vma() error: we previously assumed 'bo' could be null (see line 2454)
drivers/gpu/drm/xe/xe_vm.c:2492 new_vma() error: 'vma' dereferencing possible ERR_PTR()
drivers/gpu/drm/xe/xe_vm.c:2919 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:3913 xe_vm_range_tilemask_tlb_invalidation() error: uninitialized symbol 'err'.
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/gpu/drm/xe/xe_vm.c:4119 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/ops +4255 drivers/gpu/drm/xe/xe_vm.c

524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4164  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4165  /**
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4166   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4167   * @vm: Pointer to the xe_vm structure
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4168   * @start: Starting input address
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4169   * @range: Size of the input range
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4170   *
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4171   * This function splits existing vma to create new vma for user provided input range
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4172   *
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4173   *  Return: 0 if success
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4174   */
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4175  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4176  {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4177  	struct xe_vma_ops vops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4178  	struct drm_gpuva_ops *ops = NULL;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4179  	struct drm_gpuva_op *__op;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4180  	bool is_cpu_addr_mirror = false;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4181  	int err;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4182  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4183  	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4184  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4185  	lockdep_assert_held_write(&vm->lock);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4186  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4187  	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4188  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4189  					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4190  					  NULL, start);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4191  	if (IS_ERR(ops))
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4192  		return PTR_ERR(ops);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4193  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4194  	if (list_empty(&ops->list)) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4195  		err = 0;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4196  		goto free_ops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4197  	}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4198  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4199  	drm_gpuva_for_each_op(__op, ops) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4200  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4201  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4202  		if (__op->op == DRM_GPUVA_OP_REMAP) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4203  			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4204  				is_cpu_addr_mirror = true;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4205  			else
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4206  				is_cpu_addr_mirror = false;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4207  		}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4208  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4209  		if (__op->op == DRM_GPUVA_OP_MAP)
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4210  			/* In case of madvise ops DRM_GPUVA_OP_REMAP is always by
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4211  			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4212  			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4213  			 */
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4214  			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4215  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4216  		print_op(vm->xe, __op);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4217  	}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4218  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4219  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4220  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4221  	if (err)
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4222  		goto unwind_ops;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4223  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4224  	xe_vm_lock(vm, false);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4225  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4226  	drm_gpuva_for_each_op(__op, ops) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4227  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4228  		struct xe_vma *vma;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4229  		struct xe_vma_mem_attr temp_attr;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4230  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4231  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4232  			/* There should be no unmap */
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4233  			XE_WARN_ON("UNEXPECTED UNMAP");
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4234  			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4235  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4236  			vma = gpuva_to_vma(op->base.remap.unmap->va);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4237  			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4238  			 * to newly MAPPED vma.
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4239  			 */
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4240  			cp_vma_mem_attr(&temp_attr, &vma->attr);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4241  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4242  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4243  			vma = op->map.vma;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4244  			cp_vma_mem_attr(&vma->attr, &temp_attr);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4245  		}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4246  	}
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4247  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4248  	xe_vm_unlock(vm);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4249  	drm_gpuva_ops_free(&vm->gpuvm, ops);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4250  	return 0;
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4251  
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4252  unwind_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4253  	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27  4254  free_ops:
524911c937a5a5 Himal Prasad Ghimiray 2025-05-27 @4255  	if (ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
