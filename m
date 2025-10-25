Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D12E4247
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761435492; cv=none; b=qucvFIu1a5OUJU0JQ9X3jNK/auOv7x+gVHn9YMeaP3G2aTyKDAqtrDjC2Y0cICUE1zPkLm7oX+Vqnoy/It7NMD5MJQAoaoY9Uy13GwveVjyt45j97XfDlw6guOy7Jjld4dSuyMi1LR+x01NHZE8q77aP4Yu/G9WBN9FNkQvWDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761435492; c=relaxed/simple;
	bh=CZ0VH3xxm4UQX6ob2GgfvFGAEb5cf4JMpw8Z0cePlRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2Nw4hH3pCbw20+M84MrCIrkTTg1jRjEJ3EeHKtq2iLp3MPKJR2ySO3fhUs87lrRziMvm9FmoFo55ZkB9NALgVDwr0kGUaR6UZCsmOXOEp8dTCnXasijsx14RueV3wmX7FauRI1F0KKsFY4Gxoeh9XkJ7Vyz4gmbs4wNPADRCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSFHapKu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSFHapKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761435489; x=1792971489;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CZ0VH3xxm4UQX6ob2GgfvFGAEb5cf4JMpw8Z0cePlRw=;
  b=eSFHapKulVwS0Wn+qnYff7iZYTvCp5Dp5aV3I4A39aKSbz0dYJtzigTM
   DDmxXay9PlsAYdhilCxDRXmCMnfPxcr43k1wzqngAhwdEj03Fz8/GtYsE
   SdlMwpb+e27WeVkl0uu2BsOY7QWsO41y905u6EUU87u27DrIHT9ydP2Hu
   JjX2GxUoJlY1kRJIi+ZcbbqIh10jjUrye6sCEXnMkiTYGio/AfvdWBSxy
   9U36cO88hMIYbaYAu1jmd3NrDLHrgWek3sjAUVRkZhZxlYeS+jSfkFQzC
   blLfpfhyYLdTYMp8ohLMMNIwHvUwiGCq45uPhscbTbtB3CxsrGUK8Yo1w
   Q==;
X-CSE-ConnectionGUID: rq+4rF6dT8C1cGkUmJXjzQ==
X-CSE-MsgGUID: HBNpy3P1TUyPVSqinA/l1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74169022"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74169022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 16:38:08 -0700
X-CSE-ConnectionGUID: +GMiehAbTM2lhubBtvqc3A==
X-CSE-MsgGUID: oX7fuyFXQZeHSHmz4BJVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185082043"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 16:38:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCnpk-000FhB-2f;
	Sat, 25 Oct 2025 23:38:04 +0000
Date: Sun, 26 Oct 2025 07:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 10/15] drm/xe: Use the vma attibute drm_pagemap to select
 where to migrate
Message-ID: <202510260712.Z1H4Bgb0-lkp@intel.com>
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
In-Reply-To: <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: dri-devel@lists.freedesktop.org
CC: himal.prasad.ghimiray@intel.com
CC: apopple@nvidia.com
CC: airlied@gmail.com
CC: Simona Vetter <simona.vetter@ffwll.ch>
CC: felix.kuehling@amd.com
CC: Matthew Brost <matthew.brost@intel.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: dakr@kernel.org
CC: "Mrozek, Michal" <michal.mrozek@intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20251024]
[cannot apply to linus/master v6.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-pagemap-drm-xe-Add-refcounting-to-struct-drm_pagemap/20251025-200645
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251025120412.12262-11-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 10/15] drm/xe: Use the vma attibute drm_pagemap to select where to migrate
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20251026 (https://download.01.org/0day-ci/archive/20251026/202510260712.Z1H4Bgb0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510260712.Z1H4Bgb0-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2364 vm_bind_ioctl_ops_create() error: uninitialized symbol 'dpagemap'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2477 new_vma() error: uninitialized symbol 'vma'.
drivers/gpu/drm/xe/xe_vm.c:2911 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:3000 op_lock_and_prep() error: uninitialized symbol 'region'.
drivers/gpu/drm/xe/xe_vm.c:3295 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.
drivers/gpu/drm/xe/xe_vm.c:3931 xe_vm_range_tilemask_tlb_inval() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4146 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/xe_vm.c:4282 xe_vm_alloc_vma() error: uninitialized symbol 'default_pat'.

vim +/dpagemap +2364 drivers/gpu/drm/xe/xe_vm.c

09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2242  
b06d47be7c8316 Matthew Brost         2023-07-07  2243  /*
b06d47be7c8316 Matthew Brost         2023-07-07  2244   * Create operations list from IOCTL arguments, setup operations fields so parse
b06d47be7c8316 Matthew Brost         2023-07-07  2245   * and commit steps are decoupled from IOCTL arguments. This step can fail.
b06d47be7c8316 Matthew Brost         2023-07-07  2246   */
b06d47be7c8316 Matthew Brost         2023-07-07  2247  static struct drm_gpuva_ops *
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2248  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2249  			 struct xe_bo *bo, u64 bo_offset_or_userptr,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2250  			 u64 addr, u64 range,
cad4a0d6af146e Rodrigo Vivi          2023-11-22  2251  			 u32 operation, u32 flags,
e1fbc4f18d5b44 Matthew Auld          2023-09-25  2252  			 u32 prefetch_region, u16 pat_index)
dd08ebf6c3525a Matthew Brost         2023-03-30  2253  {
b06d47be7c8316 Matthew Brost         2023-07-07  2254  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
b06d47be7c8316 Matthew Brost         2023-07-07  2255  	struct drm_gpuva_ops *ops;
b06d47be7c8316 Matthew Brost         2023-07-07  2256  	struct drm_gpuva_op *__op;
b06d47be7c8316 Matthew Brost         2023-07-07  2257  	struct drm_gpuvm_bo *vm_bo;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2258  	u64 range_end = addr + range;
dd08ebf6c3525a Matthew Brost         2023-03-30  2259  	int err;
dd08ebf6c3525a Matthew Brost         2023-03-30  2260  
b06d47be7c8316 Matthew Brost         2023-07-07  2261  	lockdep_assert_held_write(&vm->lock);
dd08ebf6c3525a Matthew Brost         2023-03-30  2262  
b06d47be7c8316 Matthew Brost         2023-07-07  2263  	vm_dbg(&vm->xe->drm,
b06d47be7c8316 Matthew Brost         2023-07-07  2264  	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
78ddc872c6a91d Francois Dugast       2023-09-20  2265  	       operation, (ULL)addr, (ULL)range,
b06d47be7c8316 Matthew Brost         2023-07-07  2266  	       (ULL)bo_offset_or_userptr);
dd08ebf6c3525a Matthew Brost         2023-03-30  2267  
78ddc872c6a91d Francois Dugast       2023-09-20  2268  	switch (operation) {
d5dc73dbd148ef Francois Dugast       2023-11-14  2269  	case DRM_XE_VM_BIND_OP_MAP:
000a45dce7adc1 Boris Brezillon       2025-08-19  2270  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
000a45dce7adc1 Boris Brezillon       2025-08-19  2271  		struct drm_gpuvm_map_req map_req = {
000a45dce7adc1 Boris Brezillon       2025-08-19  2272  			.map.va.addr = addr,
000a45dce7adc1 Boris Brezillon       2025-08-19  2273  			.map.va.range = range,
000a45dce7adc1 Boris Brezillon       2025-08-19  2274  			.map.gem.obj = obj,
000a45dce7adc1 Boris Brezillon       2025-08-19  2275  			.map.gem.offset = bo_offset_or_userptr,
000a45dce7adc1 Boris Brezillon       2025-08-19  2276  		};
000a45dce7adc1 Boris Brezillon       2025-08-19  2277  
000a45dce7adc1 Boris Brezillon       2025-08-19  2278  		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
b06d47be7c8316 Matthew Brost         2023-07-07  2279  		break;
000a45dce7adc1 Boris Brezillon       2025-08-19  2280  	}
d5dc73dbd148ef Francois Dugast       2023-11-14  2281  	case DRM_XE_VM_BIND_OP_UNMAP:
b06d47be7c8316 Matthew Brost         2023-07-07  2282  		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
b06d47be7c8316 Matthew Brost         2023-07-07  2283  		break;
d5dc73dbd148ef Francois Dugast       2023-11-14  2284  	case DRM_XE_VM_BIND_OP_PREFETCH:
b06d47be7c8316 Matthew Brost         2023-07-07  2285  		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
b06d47be7c8316 Matthew Brost         2023-07-07  2286  		break;
d5dc73dbd148ef Francois Dugast       2023-11-14  2287  	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
c73acc1eeba5e3 Francois Dugast       2023-09-12  2288  		xe_assert(vm->xe, bo);
dd08ebf6c3525a Matthew Brost         2023-03-30  2289  
08a4f00e62bc96 Thomas Hellström      2023-09-08  2290  		err = xe_bo_lock(bo, true);
b06d47be7c8316 Matthew Brost         2023-07-07  2291  		if (err)
b06d47be7c8316 Matthew Brost         2023-07-07  2292  			return ERR_PTR(err);
b06d47be7c8316 Matthew Brost         2023-07-07  2293  
9d0c1c5618be02 Thomas Hellström      2023-12-22  2294  		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
9d0c1c5618be02 Thomas Hellström      2023-12-22  2295  		if (IS_ERR(vm_bo)) {
9d0c1c5618be02 Thomas Hellström      2023-12-22  2296  			xe_bo_unlock(bo);
9d0c1c5618be02 Thomas Hellström      2023-12-22  2297  			return ERR_CAST(vm_bo);
9d0c1c5618be02 Thomas Hellström      2023-12-22  2298  		}
dd08ebf6c3525a Matthew Brost         2023-03-30  2299  
b06d47be7c8316 Matthew Brost         2023-07-07  2300  		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
b06d47be7c8316 Matthew Brost         2023-07-07  2301  		drm_gpuvm_bo_put(vm_bo);
08a4f00e62bc96 Thomas Hellström      2023-09-08  2302  		xe_bo_unlock(bo);
b06d47be7c8316 Matthew Brost         2023-07-07  2303  		break;
b06d47be7c8316 Matthew Brost         2023-07-07  2304  	default:
5c0553cdc811bb Francois Dugast       2023-09-12  2305  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
b06d47be7c8316 Matthew Brost         2023-07-07  2306  		ops = ERR_PTR(-EINVAL);
dd08ebf6c3525a Matthew Brost         2023-03-30  2307  	}
40709aa761acbc Matthew Brost         2023-11-20  2308  	if (IS_ERR(ops))
40709aa761acbc Matthew Brost         2023-11-20  2309  		return ops;
dd08ebf6c3525a Matthew Brost         2023-03-30  2310  
40709aa761acbc Matthew Brost         2023-11-20  2311  	drm_gpuva_for_each_op(__op, ops) {
40709aa761acbc Matthew Brost         2023-11-20  2312  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
40709aa761acbc Matthew Brost         2023-11-20  2313  
40709aa761acbc Matthew Brost         2023-11-20  2314  		if (__op->op == DRM_GPUVA_OP_MAP) {
06e7139a034f26 Thomas Hellström      2024-04-23  2315  			op->map.immediate =
06e7139a034f26 Thomas Hellström      2024-04-23  2316  				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
b3af8658ec70f2 Thomas Hellström      2025-10-15  2317  			if (flags & DRM_XE_VM_BIND_FLAG_READONLY)
b3af8658ec70f2 Thomas Hellström      2025-10-15  2318  				op->map.vma_flags |= XE_VMA_READ_ONLY;
b3af8658ec70f2 Thomas Hellström      2025-10-15  2319  			if (flags & DRM_XE_VM_BIND_FLAG_NULL)
b3af8658ec70f2 Thomas Hellström      2025-10-15  2320  				op->map.vma_flags |= DRM_GPUVA_SPARSE;
b3af8658ec70f2 Thomas Hellström      2025-10-15  2321  			if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
b3af8658ec70f2 Thomas Hellström      2025-10-15  2322  				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
b3af8658ec70f2 Thomas Hellström      2025-10-15  2323  			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
b3af8658ec70f2 Thomas Hellström      2025-10-15  2324  				op->map.vma_flags |= XE_VMA_DUMPABLE;
59a2d3f38ab23c Thomas Hellström      2025-10-15  2325  			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
59a2d3f38ab23c Thomas Hellström      2025-10-15  2326  				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
e1fbc4f18d5b44 Matthew Auld          2023-09-25  2327  			op->map.pat_index = pat_index;
5b658b7e89c312 Oak Zeng              2025-04-03  2328  			op->map.invalidate_on_bind =
5b658b7e89c312 Oak Zeng              2025-04-03  2329  				__xe_vm_needs_clear_scratch_pages(vm, flags);
40709aa761acbc Matthew Brost         2023-11-20  2330  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2331  			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2332  			struct xe_tile *tile;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2333  			struct xe_svm_range *svm_range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2334  			struct drm_gpusvm_ctx ctx = {};
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2335  			struct drm_pagemap *dpagemap;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2336  			u8 id, tile_mask = 0;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2337  			u32 i;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2338  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2339  			if (!xe_vma_is_cpu_addr_mirror(vma)) {
40709aa761acbc Matthew Brost         2023-11-20  2340  				op->prefetch.region = prefetch_region;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2341  				break;
40709aa761acbc Matthew Brost         2023-11-20  2342  			}
40709aa761acbc Matthew Brost         2023-11-20  2343  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2344  			ctx.read_only = xe_vma_read_only(vma);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2345  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
4a1eaf7d110aa5 Matthew Brost         2025-07-10  2346  					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2347  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2348  			for_each_tile(tile, vm->xe, id)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2349  				tile_mask |= 0x1 << id;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2350  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2351  			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2352  			op->prefetch_range.ranges_count = 0;
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2353  			tile = NULL;
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2354  
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2355  			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2356  				dpagemap = xe_vma_resolve_pagemap(vma,
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2357  								  xe_device_get_root_tile(vm->xe));
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2358  			} else if (prefetch_region) {
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2359  				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2360  						      XE_PL_VRAM0];
1b7e4275a5db37 Thomas Hellström      2025-10-25  2361  				dpagemap = xe_tile_local_pagemap(tile);
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2362  			}
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2363  
1b7e4275a5db37 Thomas Hellström      2025-10-25 @2364  			op->prefetch_range.dpagemap = dpagemap;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2365  alloc_next_range:
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2366  			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2367  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2368  			if (PTR_ERR(svm_range) == -ENOENT) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2369  				u64 ret = xe_svm_find_vma_start(vm, addr, range_end, vma);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2370  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2371  				addr = ret == ULONG_MAX ? 0 : ret;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2372  				if (addr)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2373  					goto alloc_next_range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2374  				else
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2375  					goto print_op_label;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2376  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2377  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2378  			if (IS_ERR(svm_range)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2379  				err = PTR_ERR(svm_range);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2380  				goto unwind_prefetch_ops;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2381  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2382  
c1bb69a2e8e2d5 Himal Prasad Ghimiray 2025-08-21  2383  			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
5aee6e33e19593 Himal Prasad Ghimiray 2025-05-13  2384  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2385  				goto check_next_range;
5aee6e33e19593 Himal Prasad Ghimiray 2025-05-13  2386  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2387  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2388  			err = xa_alloc(&op->prefetch_range.range,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2389  				       &i, svm_range, xa_limit_32b,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2390  				       GFP_KERNEL);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2391  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2392  			if (err)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2393  				goto unwind_prefetch_ops;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2394  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2395  			op->prefetch_range.ranges_count++;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2396  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
5aee6e33e19593 Himal Prasad Ghimiray 2025-05-13  2397  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2398  check_next_range:
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2399  			if (range_end > xe_svm_range_end(svm_range) &&
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2400  			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2401  				addr = xe_svm_range_end(svm_range);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2402  				goto alloc_next_range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2403  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2404  		}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2405  print_op_label:
b06d47be7c8316 Matthew Brost         2023-07-07  2406  		print_op(vm->xe, __op);
40709aa761acbc Matthew Brost         2023-11-20  2407  	}
b06d47be7c8316 Matthew Brost         2023-07-07  2408  
b06d47be7c8316 Matthew Brost         2023-07-07  2409  	return ops;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2410  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2411  unwind_prefetch_ops:
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2412  	xe_svm_prefetch_gpuva_ops_fini(ops);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2413  	drm_gpuva_ops_free(&vm->gpuvm, ops);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2414  	return ERR_PTR(err);
dd08ebf6c3525a Matthew Brost         2023-03-30  2415  }
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
